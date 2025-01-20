@interface CKParticipantChangeChatItem
- (BOOL)failed;
- (BOOL)unattributed;
- (IMHandle)handle;
- (NSString)errorText;
- (id)activeTelephonyConversationUUID;
- (id)loadTranscriptText;
- (id)sender;
- (int64_t)changeType;
@end

@implementation CKParticipantChangeChatItem

- (int64_t)changeType
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 changeType];

  return v3;
}

- (NSString)errorText
{
  if (![(CKParticipantChangeChatItem *)self changeType])
  {
    int64_t v3 = NSString;
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"GROUP_ADD_ERROR_STATUS";
    goto LABEL_5;
  }
  if ([(CKParticipantChangeChatItem *)self changeType] == 1)
  {
    int64_t v3 = NSString;
    v4 = CKFrameworkBundle();
    v5 = v4;
    v6 = @"GROUP_REMOVE_ERROR_STATUS";
LABEL_5:
    v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];
    v8 = [(CKParticipantChangeChatItem *)self handle];
    v9 = [v8 name];
    v10 = objc_msgSend(v3, "stringWithFormat:", v7, v9);

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return (NSString *)v10;
}

- (id)loadTranscriptText
{
  int64_t v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 transcriptRegularFontAttributes];

  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptEmphasizedFontAttributes];

  v7 = +[CKUIBehavior sharedBehaviors];
  uint64_t v8 = [v7 transcriptGroupModificationErrorRegularFontAttributes];

  v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 transcriptGroupModificationErrorEmphasizedFontAttributes];

  v11 = [(CKParticipantChangeChatItem *)self sender];
  v12 = [(CKParticipantChangeChatItem *)self handle];
  uint64_t v13 = [v11 name];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_1EDE4CA38;
  }
  v16 = v15;

  uint64_t v17 = [v12 name];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_1EDE4CA38;
  }
  v102 = v19;

  v101 = (void *)v8;
  if ([(CKParticipantChangeChatItem *)self failed]) {
    v20 = (void *)v8;
  }
  else {
    v20 = v4;
  }
  id v104 = v20;
  v100 = (void *)v10;
  if ([(CKParticipantChangeChatItem *)self failed]) {
    v21 = (void *)v10;
  }
  else {
    v21 = v6;
  }
  id v103 = v21;
  int64_t v22 = [(CKParticipantChangeChatItem *)self changeType];
  if (v22 == 1)
  {
    v96 = v16;
    v98 = v4;
    if ([(CKParticipantChangeChatItem *)self unattributed])
    {
      v32 = CKFrameworkBundle();
      v33 = v32;
      v34 = @"GROUP_LEAVE_STATUS";
    }
    else
    {
      if (v11)
      {
        v39 = CKFrameworkBundle();
        v33 = v39;
        if (v12)
        {
          v45 = [v39 localizedStringForKey:@"GROUP_REMOVE_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v93 = v102;
        }
        else
        {
          v45 = [v39 localizedStringForKey:@"GROUP_REMOVE_YOU_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v93 = 0;
        }
        CKAttributedFormatString(v104, v103, v45, v40, v41, v42, v43, v44, (uint64_t)v16);
        v31 = LABEL_34:;

        v65 = [MEMORY[0x1E4F6BC40] sharedRegistry];
        v66 = [(CKParticipantChangeChatItem *)self activeTelephonyConversationUUID];
        v67 = [v65 existingConversationForTelephonyConversationUUID:v66];

        if (v67)
        {
          v94 = v12;
          v95 = v6;
          v68 = v31;
          if (IMOSLoggingEnabled())
          {
            v69 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v69, OS_LOG_TYPE_INFO, "Chat participant was removed while there is an active FaceTime call", buf, 2u);
            }
          }
          v31 = (void *)[v31 mutableCopy];
          v70 = NSString;
          v71 = CKFrameworkBundle();
          v72 = [v71 localizedStringForKey:@"GROUP_MEMBER_ACTIVE_IN_FT_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
          v73 = [v70 stringWithFormat:@" %@", v72, v93];
          v79 = CKAttributedFormatString(v104, v103, v73, v74, v75, v76, v77, v78, (uint64_t)v102);
          [v31 appendAttributedString:v79];

          v16 = v96;
          v4 = v98;
          v12 = v94;
          v6 = v95;
        }
        else
        {
          v16 = v96;
          v4 = v98;
        }
        goto LABEL_41;
      }
      v32 = CKFrameworkBundle();
      v33 = v32;
      v34 = @"GROUP_YOU_REMOVE_STATUS";
    }
    v45 = [v32 localizedStringForKey:v34 value:&stru_1EDE4CA38 table:@"ChatKit"];
    v93 = 0;
    CKAttributedFormatString(v104, v103, v45, v54, v55, v56, v57, v58, (uint64_t)v102);
    goto LABEL_34;
  }
  if (v22)
  {
    v31 = 0;
    goto LABEL_41;
  }
  if ([(CKParticipantChangeChatItem *)self unattributed])
  {
    v23 = CKFrameworkBundle();
    [v23 localizedStringForKey:@"GROUP_SYSTEM_ADD_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v25 = v24 = v4;
    v31 = CKAttributedFormatString(v104, v103, v25, v26, v27, v28, v29, v30, (uint64_t)v102);

    v4 = v24;
LABEL_27:

    goto LABEL_41;
  }
  if (!v11)
  {
    v23 = CKFrameworkBundle();
    [v23 localizedStringForKey:@"GROUP_YOU_ADD_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v47 = v46 = v4;
    uint64_t v53 = CKAttributedFormatString(v104, v103, v47, v48, v49, v50, v51, v52, (uint64_t)v102);

    v4 = v46;
    v31 = (void *)v53;
    goto LABEL_27;
  }
  v35 = v4;
  v36 = CKFrameworkBundle();
  v37 = v36;
  if (v12) {
    [v36 localizedStringForKey:@"GROUP_ADD_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else {
  v38 = [v36 localizedStringForKey:@"GROUP_ADD_YOU_STATUS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  uint64_t v64 = CKAttributedFormatString(v104, v103, v38, v59, v60, v61, v62, v63, (uint64_t)v16);

  v4 = v35;
  v31 = (void *)v64;
LABEL_41:
  if ([(CKParticipantChangeChatItem *)self failed])
  {
    v80 = (void *)MEMORY[0x1E4F42A98];
    +[CKUIBehavior sharedBehaviors];
    v81 = v99 = v4;
    v82 = [v81 transcriptLightFont];
    v83 = [v80 configurationWithFont:v82];

    v84 = [MEMORY[0x1E4F42A80] systemImageNamed:@"exclamationmark.circle" withConfiguration:v83];
    [MEMORY[0x1E4F428B8] redColor];
    v85 = v97 = v16;
    v86 = [v84 imageWithTintColor:v85];

    id v87 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v87 setImage:v86];
    v88 = [MEMORY[0x1E4F28E48] attributedStringWithAttachment:v87 attributes:v101];
    v89 = v6;
    v90 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v88 appendAttributedString:v90];

    v6 = v89;
    [v88 appendAttributedString:v31];
    id v91 = v88;

    v16 = v97;
    v4 = v99;
  }
  else
  {
    id v91 = v31;
  }

  return v91;
}

- (IMHandle)handle
{
  v2 = [(CKChatItem *)self IMChatItem];
  int64_t v3 = [v2 otherHandle];

  return (IMHandle *)v3;
}

- (BOOL)failed
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 failed];

  return v3;
}

- (BOOL)unattributed
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 unattributed];

  return v3;
}

- (id)sender
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 sender];

  return v3;
}

- (id)activeTelephonyConversationUUID
{
  v2 = [(CKChatItem *)self IMChatItem];
  char v3 = [v2 activeTelephonyConversationUUID];

  return v3;
}

@end