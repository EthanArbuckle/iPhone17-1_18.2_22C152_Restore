@interface IMDMessageRecord
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)keyPathsToColumns;
- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3;
- (BOOL)hasDataDetectorResults;
- (BOOL)isArchived;
- (BOOL)isAssociatedMessage;
- (BOOL)isReply;
- (IMDChatRecord)chatRecord;
- (IMDHandleRecord)handleRecord;
- (IMDHandleRecord)otherHandleRecord;
- (IMDMessageRecord)init;
- (IMDMessageRecord)initWithItemType:(int64_t)a3 text:(id)a4 date:(int64_t)a5 dateRead:(int64_t)a6 dateDelivered:(int64_t)a7 datePlayed:(int64_t)a8 error:(int64_t)a9 type:(int64_t)a10 replaceID:(int64_t)a11 flags:(id)a12 guid:(id)a13 attributedBody:(id)a14 service:(id)a15 account:(id)a16 accountGUID:(id)a17 subject:(id)a18 handleID:(id)a19 countryCode:(id)a20 unformattedID:(id)a21 otherHandleID:(id)a22 groupTitle:(id)a23 groupActionType:(int64_t)a24 shareStatus:(int64_t)a25 shareDirection:(int64_t)a26 expireState:(int64_t)a27 messageActionType:(int64_t)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 associatedMessageEmoji:(id)a32 balloonBundleID:(id)a33 payloadData:(id)a34 expressiveSendStyleID:(id)a35 timeExpressiveSendPlayed:(int64_t)a36 messageSummaryInfo:(id)a37 cloudKitSyncState:(int64_t)a38 cloudKitRecordID:(id)a39 cloudKitServerChangeTokenBlob:(id)a40 cloudKitRecordChangeTag:(id)a41 dataDetectorsInfo:(id)a42 destinationCallerID:(id)a43 replyToGUID:(id)a44 sortID:(int64_t)a45 threadOriginatorGUID:(id)a46 threadOriginatorPart:(id)a47 syndicationRanges:(id)a48 syncedSyndicationRanges:(id)a49 partCount:(int64_t)a50 dateEdited:(int64_t)a51 biaReferenceID:(id)a52 fallbackHash:(id)a53 scheduleType:(int64_t)a54 scheduleState:(int64_t)a55;
- (IMDMessageRecord)initWithRecordRef:(_IMDMessageRecordStruct *)a3;
- (NSArray)attachmentRecords;
- (NSAttributedString)attributedBodyText;
- (NSData)attributedBodyData;
- (NSData)iMessageAppData;
- (NSData)messageSummaryInfoData;
- (NSDate)dateEdited;
- (NSDictionary)messageSummaryInfo;
- (NSString)iMessageAppBundleID;
- (_IMDMessageRecordStruct)cfMessageRecord;
- (__CFArray)_localCache;
- (int)_propertyIDForProperty:(int64_t)a3;
- (int64_t)rawDateEdited;
- (int64_t)rowID;
- (void)_fetchUpdatedRecord;
@end

@implementation IMDMessageRecord

+ (id)allocWithZone:(_NSZone *)a3
{
  IMDMessageRecordGetTypeID();
  return (id)_CFRuntimeCreateInstance();
}

- (_IMDMessageRecordStruct)cfMessageRecord
{
  CFTypeID v3 = CFGetTypeID(self);
  if (v3 == IMDMessageRecordGetTypeID()) {
    return (_IMDMessageRecordStruct *)self;
  }
  else {
    return 0;
  }
}

- (void)_fetchUpdatedRecord
{
  uint64_t v2 = [(IMDMessageRecord *)self rowID];
  return (void *)IMDMessageRecordCopyMessageRecordUnlocked(v2);
}

- (__CFArray)_localCache
{
  return (__CFArray *)[(IMDMessageRecord *)self cfMessageRecord][24];
}

- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3
{
  v4 = &(&off_1E5F8D5A0)[5 * a4];
  long long v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1AFB946FC(a3);
}

- (int64_t)rowID
{
  return (uint64_t)[(IMDMessageRecord *)self cfMessageRecord][16];
}

- (NSData)attributedBodyData
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 7);
  return (NSData *)v2;
}

- (NSAttributedString)attributedBodyText
{
  v11[1] = *MEMORY[0x1E4F143B8];
  CFTypeID v3 = [(IMDMessageRecord *)self attributedBodyData];
  if ([v3 length])
  {
    v4 = JWDecodeCodableObjectWithStandardAllowlist();
  }
  else
  {
    long long v5 = [(IMDMessageRecord *)self text];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
      v7 = [(IMDMessageRecord *)self text];
      uint64_t v10 = *MEMORY[0x1E4F6C1F8];
      v11[0] = &unk_1F0864E90;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      v4 = (void *)[v6 initWithString:v7 attributes:v8];
    }
    else
    {
      v4 = 0;
    }
  }

  return (NSAttributedString *)v4;
}

- (NSData)messageSummaryInfoData
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 58);
  return (NSData *)v2;
}

- (NSDictionary)messageSummaryInfo
{
  uint64_t v2 = [(IMDMessageRecord *)self messageSummaryInfoData];
  if ([v2 length])
  {
    CFTypeID v3 = JWDecodeCodableObjectWithStandardAllowlist();
  }
  else
  {
    CFTypeID v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSString)iMessageAppBundleID
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 52);
  return (NSString *)v2;
}

- (NSData)iMessageAppData
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 53);
  return (NSData *)v2;
}

- (BOOL)isReply
{
  uint64_t v2 = [(IMDMessageRecord *)self threadOriginatorGUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isAssociatedMessage
{
  uint64_t v2 = [(IMDMessageRecord *)self associatedMessageGUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (IMDHandleRecord)handleRecord
{
  uint64_t v2 = IMDMessageRecordCopyHandle((const __CFArray **)[(IMDMessageRecord *)self cfMessageRecord]);
  return (IMDHandleRecord *)v2;
}

- (IMDHandleRecord)otherHandleRecord
{
  uint64_t v2 = IMDMessageRecordCopyOtherHandle((const __CFArray **)[(IMDMessageRecord *)self cfMessageRecord]);
  return (IMDHandleRecord *)v2;
}

- (NSArray)attachmentRecords
{
  uint64_t v2 = (void *)IMDMessageRecordCopyAttachments((uint64_t)[(IMDMessageRecord *)self cfMessageRecord]);
  return (NSArray *)v2;
}

- (IMDChatRecord)chatRecord
{
  uint64_t v2 = (void *)IMDChatRecordCopyChatForMessageID([(IMDMessageRecord *)self rowID]);
  return (IMDChatRecord *)v2;
}

- (NSDate)dateEdited
{
  uint64_t v2 = [(IMDMessageRecord *)self rawDateEdited];
  if (v2)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)(uint64_t)v2);
  }
  return (NSDate *)v2;
}

- (int64_t)rawDateEdited
{
  return IMDBridgedRecordCopyPropertyNumberAsInteger64(self, 75);
}

- (BOOL)hasDataDetectorResults
{
  return MEMORY[0x1F4181798](self, sel_hasDdResults);
}

- (BOOL)isArchived
{
  return MEMORY[0x1F4181798](self, sel_isArchive);
}

- (IMDMessageRecord)initWithItemType:(int64_t)a3 text:(id)a4 date:(int64_t)a5 dateRead:(int64_t)a6 dateDelivered:(int64_t)a7 datePlayed:(int64_t)a8 error:(int64_t)a9 type:(int64_t)a10 replaceID:(int64_t)a11 flags:(id)a12 guid:(id)a13 attributedBody:(id)a14 service:(id)a15 account:(id)a16 accountGUID:(id)a17 subject:(id)a18 handleID:(id)a19 countryCode:(id)a20 unformattedID:(id)a21 otherHandleID:(id)a22 groupTitle:(id)a23 groupActionType:(int64_t)a24 shareStatus:(int64_t)a25 shareDirection:(int64_t)a26 expireState:(int64_t)a27 messageActionType:(int64_t)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 associatedMessageEmoji:(id)a32 balloonBundleID:(id)a33 payloadData:(id)a34 expressiveSendStyleID:(id)a35 timeExpressiveSendPlayed:(int64_t)a36 messageSummaryInfo:(id)a37 cloudKitSyncState:(int64_t)a38 cloudKitRecordID:(id)a39 cloudKitServerChangeTokenBlob:(id)a40 cloudKitRecordChangeTag:(id)a41 dataDetectorsInfo:(id)a42 destinationCallerID:(id)a43 replyToGUID:(id)a44 sortID:(int64_t)a45 threadOriginatorGUID:(id)a46 threadOriginatorPart:(id)a47 syndicationRanges:(id)a48 syncedSyndicationRanges:(id)a49 partCount:(int64_t)a50 dateEdited:(int64_t)a51 biaReferenceID:(id)a52 fallbackHash:(id)a53 scheduleType:(int64_t)a54 scheduleState:(int64_t)a55
{
  v95.receiver = self;
  v95.super_class = (Class)IMDMessageRecord;
  id v72 = a53;
  id v55 = a52;
  id v71 = a49;
  id v56 = a48;
  id v70 = a47;
  id v57 = a46;
  id v68 = a44;
  id v67 = a43;
  id v59 = a42;
  id v66 = a41;
  id v65 = a40;
  id v60 = a39;
  id v61 = a37;
  id v94 = a35;
  id v93 = a34;
  id v62 = a33;
  id v63 = a32;
  id v64 = a29;
  id v92 = a23;
  id v91 = a22;
  id v90 = a21;
  id v89 = a20;
  id v88 = a19;
  id v87 = a18;
  id v86 = a17;
  id v85 = a16;
  id v84 = a15;
  id v83 = a14;
  id v82 = a13;
  id v81 = a12;
  id v80 = a4;
  v69 = [(IMDRecord *)&v95 init];
  sub_1AFB94DF0((_OWORD *)[(IMDMessageRecord *)v69 cfMessageRecord], a3, (uint64_t)v80, a5, a6, a7, a8, a9, a10, a11, v81, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84, (uint64_t)v85, (uint64_t)v86, (uint64_t)v87, (uint64_t)v88, (uint64_t)v89,
    (uint64_t)v90,
    (uint64_t)v91,
    (uint64_t)v92,
    a24,
    a25,
    a26,
    a27,
    a28,
    (uint64_t)v64,
    a30,
    a31.location,
    a31.length,
    (uint64_t)v62,
    (uint64_t)v93,
    (uint64_t)v94,
    a36,
    (uint64_t)v61,
    a38,
    (uint64_t)v60,
    (uint64_t)v65,
    (uint64_t)v66,
    (uint64_t)v59,
    (uint64_t)v67,
    (uint64_t)v68,
    a45,
    (uint64_t)v57,
    (uint64_t)v70,
    (uint64_t)v56,
    (uint64_t)v71,
    a50,
    a51,
    (uint64_t)v55,
    (uint64_t)v72,
    (uint64_t)v63,
    a54,
    a55);
  v78 = (IMDMessageRecord *)objc_claimAutoreleasedReturnValue();

  return v78;
}

- (IMDMessageRecord)init
{
  return 0;
}

+ (id)keyPathsToColumns
{
  if (qword_1EB5ABA30 != -1) {
    dispatch_once(&qword_1EB5ABA30, &unk_1F084CBA0);
  }
  uint64_t v2 = (void *)qword_1EB5ABA10;
  return v2;
}

- (IMDMessageRecord)initWithRecordRef:(_IMDMessageRecordStruct *)a3
{
  v4 = a3;

  return (IMDMessageRecord *)v4;
}

@end