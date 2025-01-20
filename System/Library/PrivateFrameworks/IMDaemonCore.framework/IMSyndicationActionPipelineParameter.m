@interface IMSyndicationActionPipelineParameter
- (BOOL)isFromMe;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMSyndicationAction)syndicationAction;
- (IMSyndicationActionPipelineParameter)initWithDefusedSyndicationAction:(id)a3 idsTrustedData:(id)a4 pipelineResources:(id)a5;
- (NSArray)participantIdentifiers;
- (NSString)currentGroupName;
- (NSString)fromDisplayID;
- (NSString)fromIdentifier;
- (NSString)groupID;
- (NSString)messagePartGUID;
- (NSString)replicationSourceServiceName;
- (NSString)toIdentifier;
- (_NSRange)syndicatedMessagePartRange;
- (id)createSyndicationActionWithChat:(id)a3;
- (id)description;
- (unint64_t)encodedSyndicationStartDate;
- (unsigned)actionType;
- (unsigned)itemType;
- (unsigned)version;
- (void)setAccount:(id)a3;
- (void)setChat:(id)a3;
- (void)setCurrentGroupName:(id)a3;
- (void)setFromDisplayID:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setParticipantIdentifiers:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setSyndicationAction:(id)a3;
- (void)setToIdentifier:(id)a3;
@end

@implementation IMSyndicationActionPipelineParameter

- (IMSyndicationActionPipelineParameter)initWithDefusedSyndicationAction:(id)a3 idsTrustedData:(id)a4 pipelineResources:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v49.receiver = self;
  v49.super_class = (Class)IMSyndicationActionPipelineParameter;
  v9 = [(IMSyndicationActionPipelineParameter *)&v49 init];
  if (!v9) {
    goto LABEL_9;
  }
  int v10 = [v7 version];
  v9->_version = v10;
  int v11 = (unsigned __int16)*MEMORY[0x1E4F6E3F0];
  if (v11 != v10)
  {
    v37 = IMLogHandleForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE614(&v9->_version, v11, v37);
    }

    goto LABEL_13;
  }
  v9->_actionType = [v7 actionType];
  v9->_encodedSyndicationStartDate = [v7 encodedSyndicationStartDate];
  v9->_itemType = [v7 itemType];
  uint64_t v12 = [v7 messagePartGUID];
  messagePartGUID = v9->_messagePartGUID;
  v9->_messagePartGUID = (NSString *)v12;

  v9->_syndicatedMessagePartRange.location = [v7 syndicatedMessagePartRange];
  v9->_syndicatedMessagePartRange.length = v14;
  v15 = [v7 groupContext];
  uint64_t v16 = [v15 groupID];
  groupID = v9->_groupID;
  v9->_groupID = (NSString *)v16;

  uint64_t v18 = [v15 currentGroupName];
  currentGroupName = v9->_currentGroupName;
  v9->_currentGroupName = (NSString *)v18;

  uint64_t v20 = [v15 participantDestinationIdentifiers];
  participantIdentifiers = v9->_participantIdentifiers;
  v9->_participantIdentifiers = (NSArray *)v20;

  v9->_isFromMe = [v8 isFromMe];
  v22 = [v8 fromIdentifier];
  uint64_t v23 = [v22 copy];
  fromIdentifier = v9->_fromIdentifier;
  v9->_fromIdentifier = (NSString *)v23;

  v25 = [v8 toIdentifier];
  uint64_t v26 = [v25 copy];
  toIdentifier = v9->_toIdentifier;
  v9->_toIdentifier = (NSString *)v26;

  v28 = v9->_participantIdentifiers;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1D96D92F8;
  v47[3] = &unk_1E6B73DC0;
  v29 = v9;
  v48 = v29;
  v30 = [(NSArray *)v28 __imArrayByFilteringWithBlock:v47];
  v31 = [v30 _IDsFromURIs];

  v32 = [(NSString *)v9->_fromIdentifier _stripFZIDPrefix];
  if (-[NSArray count](v9->_participantIdentifiers, "count") > 2 || !v9->_isFromMe || ![v31 count]) {
    goto LABEL_8;
  }
  if ([v31 count] != 1)
  {
    v39 = IMLogHandleForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE5DC(v39, v40, v41, v42, v43, v44, v45, v46);
    }

LABEL_13:
    v36 = 0;
    goto LABEL_14;
  }
  v33 = [v31 lastObject];
  uint64_t v34 = [v33 _stripFZIDPrefix];

  v32 = (void *)v34;
LABEL_8:
  fromDisplayID = v29->_fromDisplayID;
  v29->_fromDisplayID = (NSString *)v32;

LABEL_9:
  v36 = v9;
LABEL_14:

  return v36;
}

- (id)createSyndicationActionWithChat:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE6A4(v5, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_14;
  }
  v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)self->_encodedSyndicationStartDate);
  uint64_t actionType = self->_actionType;
  int itemType = self->_itemType;
  if (itemType == 2)
  {
    uint64_t v18 = (actionType >> 2) & 1;
    id v19 = objc_alloc(MEMORY[0x1E4F6E678]);
    v9 = [v4 guid];
    uint64_t v10 = [v19 initWithChatGUID:v9 syndicationStartDate:v5 autoDonateMessages:v18];
    goto LABEL_8;
  }
  if (itemType == 1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F6E888]);
    v9 = [v4 guid];
    uint64_t v10 = objc_msgSend(v8, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:", v9, v5, actionType, self->_messagePartGUID, self->_syndicatedMessagePartRange.location, self->_syndicatedMessagePartRange.length);
LABEL_8:
    uint64_t v20 = (void *)v10;

    if (v20) {
      goto LABEL_15;
    }
    v21 = IMLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE758(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_13;
  }
  v21 = IMLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1D98FE6DC(itemType, v21);
  }
LABEL_13:

LABEL_14:
  uint64_t v20 = 0;
LABEL_15:

  return v20;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(IMSyndicationActionPipelineParameter *)self syndicationAction];
  objc_msgSend(v3, "stringWithFormat:", @"<IMSyndicationActionPipelineParameter %p; OUTPUT syndicationAction = %@>",
    self,
  v5 = v4);

  return v5;
}

- (void)setChat:(id)a3
{
}

- (NSString)replicationSourceServiceName
{
  return 0;
}

- (void)setSyndicationAction:(id)a3
{
}

- (IMSyndicationAction)syndicationAction
{
  return self->_syndicationAction;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setReplicationSourceServiceName:(id)a3
{
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (IMDServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
}

- (NSString)fromDisplayID
{
  return self->_fromDisplayID;
}

- (void)setFromDisplayID:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)currentGroupName
{
  return self->_currentGroupName;
}

- (void)setCurrentGroupName:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (NSArray)participantIdentifiers
{
  return self->_participantIdentifiers;
}

- (void)setParticipantIdentifiers:(id)a3
{
}

- (unint64_t)encodedSyndicationStartDate
{
  return self->_encodedSyndicationStartDate;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (NSString)messagePartGUID
{
  return self->_messagePartGUID;
}

- (_NSRange)syndicatedMessagePartRange
{
  NSUInteger length = self->_syndicatedMessagePartRange.length;
  NSUInteger location = self->_syndicatedMessagePartRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagePartGUID, 0);
  objc_storeStrong((id *)&self->_participantIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentGroupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_fromDisplayID, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_chat, 0);

  objc_storeStrong((id *)&self->_syndicationAction, 0);
}

@end