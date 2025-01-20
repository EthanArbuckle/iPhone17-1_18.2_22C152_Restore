@interface IMMessageItem
+ (IMMessageItem)messageItemWithLiteIdentifier:(id)a3 liteData:(id)a4 senderID:(id)a5 date:(id)a6 error:(id *)a7;
+ (_NSRange)_rangeOfSingleMessagePartForMessageWithGUID:(id)a3;
+ (id)_associatedMessageItemWithGUID:(id)a3 senderID:(id)a4 date:(id)a5 liteTextMessage:(id)a6;
+ (id)_expressiveSendStyleIDForBlastDoorLiteTextMessageEffect:(int64_t)a3;
+ (id)_messageGUIDForLiteIdentifier:(id)a3;
+ (id)_threadIdentifierForThreadOriginatorUUID:(id)a3;
+ (int64_t)_associatedMessageTypeFromBlastDoorLiteAssociatedMessageType:(int64_t)a3;
- (id)liteAssociatedMessageSummaryInfo;
@end

@implementation IMMessageItem

+ (IMMessageItem)messageItemWithLiteIdentifier:(id)a3 liteData:(id)a4 senderID:(id)a5 date:(id)a6 error:(id *)a7
{
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = a3;
      _os_log_impl(&def_3494C, v13, OS_LOG_TYPE_INFO, "Attempting to defuse %@", buf, 0xCu);
    }
  }
  id v14 = [+[IMDChatRegistry sharedInstance] hasKnownSenderChatWithChatIdentifier:a5];
  v15 = +[IMSenderContext contextWithKnownSender:v14 serviceName:IMServiceNameiMessageLite];
  *(void *)buf = 0;
  id v16 = +[IMBlastdoor sendLiteData:a4 senderContext:v15 error:buf];
  if (v16) {
    BOOL v17 = *(void *)buf == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    id v19 = [a1 _messageGUIDForLiteIdentifier:a3];
    if ([v16 tapback])
    {
      return (IMMessageItem *)[a1 _associatedMessageItemWithGUID:v19 senderID:a5 date:a6 liteTextMessage:v16];
    }
    else
    {
      id v20 = [objc_alloc((Class)IMMessageItem) initWithSender:a5 time:a6 guid:v19 type:0];
      objc_msgSend(v20, "setPlainBody:", objc_msgSend(v16, "plainTextBody"));
      objc_msgSend(v20, "setExpressiveSendStyleID:", objc_msgSend(a1, "_expressiveSendStyleIDForBlastDoorLiteTextMessageEffect:", objc_msgSend(v16, "effect")));
      objc_msgSend(v20, "setThreadIdentifier:", objc_msgSend(a1, "_threadIdentifierForThreadOriginatorUUID:", objc_msgSend(v16, "threadOriginatorUUID")));
    }
  }
  else if (a7)
  {
    if (*(void *)buf)
    {
      NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
      uint64_t v23 = *(void *)buf;
      v18 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    }
    else
    {
      v18 = 0;
    }
    id v20 = 0;
    *a7 = +[NSError errorWithDomain:@"com.apple.Messages.LiteBlastDoorErrorDomain" code:3 userInfo:v18];
  }
  else
  {
    return 0;
  }
  return (IMMessageItem *)v20;
}

+ (id)_associatedMessageItemWithGUID:(id)a3 senderID:(id)a4 date:(id)a5 liteTextMessage:(id)a6
{
  id v11 = objc_msgSend(objc_msgSend(objc_msgSend(a6, "tapback"), "associatedMessageUUID"), "UUIDString");
  id v12 = objc_msgSend(a1, "_associatedMessageTypeFromBlastDoorLiteAssociatedMessageType:", objc_msgSend(objc_msgSend(a6, "tapback"), "associatedMessageType"));
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3010000000;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  v26 = "";
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v22[5] = 0;
  id v13 = [+[IMDMessageStore sharedInstance] messageWithGUID:v11];
  if ([v13 plainBody])
  {
    id v14 = objc_msgSend(objc_msgSend(v13, "plainBody"), "length");
    v15 = v24;
    v24[4] = 0;
    v15[5] = (uint64_t)v14;
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __93__IMMessageItem_LiteBlastDoor___associatedMessageItemWithGUID_senderID_date_liteTextMessage___block_invoke;
    v21[3] = &unk_55448;
    v21[5] = &v23;
    v21[6] = v22;
    v21[4] = v11;
    objc_msgSend(objc_msgSend(v13, "body"), "__im_visitMessageParts:", v21);
  }
  id v16 = [v13 liteAssociatedMessageSummaryInfo];
  id v17 = objc_alloc((Class)IMAssociatedMessageItem);
  id v18 = [v13 body];
  id v19 = objc_msgSend(v17, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", a4, a5, v18, 0, 0, 0, 0, a3, v11, v12, v24[4], v24[5], v16, 0);
  objc_msgSend(v19, "setAssociatedMessageEmoji:", objc_msgSend(objc_msgSend(a6, "tapback"), "associatedMessageEmoji"));
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v23, 8);
  return v19;
}

id __93__IMMessageItem_LiteBlastDoor___associatedMessageItemWithGUID_senderID_date_liteTextMessage___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(objc_msgSend(a2, "messagePartBody"), "length");
  if (result)
  {
    id v8 = [a2 messagePartRange];
    uint64_t v9 = *(void *)(a1[5] + 8);
    *(void *)(v9 + 32) = v8;
    *(void *)(v9 + 40) = v10;
    id result = objc_msgSend(objc_msgSend(a2, "messagePartGUIDForMessageGUID:", a1[4]), "encodedMessagePartGUID");
    *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

+ (id)_messageGUIDForLiteIdentifier:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", a3), "UUIDString");
  if (![v4 length])
  {
    id v4 = +[NSString stringGUID];
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412546;
        id v8 = a3;
        __int16 v9 = 2112;
        id v10 = v4;
        _os_log_impl(&def_3494C, v5, OS_LOG_TYPE_INFO, "Invalid iMessage Lite identifier %@, replaced with %@ (de-duplication may fail!)", (uint8_t *)&v7, 0x16u);
      }
    }
  }
  return v4;
}

+ (id)_expressiveSendStyleIDForBlastDoorLiteTextMessageEffect:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v3 = (id *)&IMTranscriptEffectBalloonsMomentIdentifier;
      goto LABEL_16;
    case 2:
      v3 = (id *)&IMTranscriptEffectConfettiMomentIdentifier;
      goto LABEL_16;
    case 3:
      v3 = (id *)&IMTranscriptEffectLasersMomentIdentifier;
      goto LABEL_16;
    case 4:
      v3 = (id *)&IMTranscriptEffectFireworksMomentIdentifier;
      goto LABEL_16;
    case 5:
      v3 = (id *)&IMTranscriptEffectShootingStarMomentIdentifier;
      goto LABEL_16;
    case 6:
      v3 = (id *)&IMTranscriptEffectCelebrationMomentIdentifier;
      goto LABEL_16;
    case 7:
      v3 = (id *)&IMTranscriptEffectLoveMomentIdentifier;
      goto LABEL_16;
    case 8:
      v3 = (id *)&IMTranscriptEffectEchoMomentIdentifier;
      goto LABEL_16;
    case 9:
      v3 = (id *)&IMTranscriptEffectSpotlightMomentIdentifier;
      goto LABEL_16;
    case 10:
      v3 = (id *)&IMTranscriptEffectSlamImpactIdentifier;
      goto LABEL_16;
    case 11:
      v3 = (id *)&IMTranscriptEffectLoudImpactIdentifier;
      goto LABEL_16;
    case 12:
      v3 = (id *)&IMTranscriptEffectGentleImpactIdentifier;
      goto LABEL_16;
    case 13:
      v3 = (id *)&IMTranscriptEffectInvisibleInkIdentifier;
LABEL_16:
      id result = *v3;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

+ (id)_threadIdentifierForThreadOriginatorUUID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 UUIDString];
  if (![v4 length]) {
    return 0;
  }
  id v6 = [a1 _rangeOfSingleMessagePartForMessageWithGUID:v4];

  return (id)_IMMessageCreateThreadIdentifierWithOriginatorGUID(v4, 0, v6, v5);
}

+ (_NSRange)_rangeOfSingleMessagePartForMessageWithGUID:(id)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3010000000;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  v15 = "";
  id v3 = [+[IMDMessageStore sharedInstance] messageWithGUID:a3];
  id v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  if (![v3 plainBody])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __76__IMMessageItem_LiteBlastDoor___rangeOfSingleMessagePartForMessageWithGUID___block_invoke;
    v11[3] = &unk_55470;
    v11[4] = &v12;
    objc_msgSend(objc_msgSend(v4, "body"), "__im_visitMessageParts:", v11);
LABEL_5:
    id v6 = v13;
    goto LABEL_6;
  }
  id v5 = objc_msgSend(objc_msgSend(v4, "plainBody"), "length");
  id v6 = v13;
  v13[4] = 0;
  v6[5] = (uint64_t)v5;
LABEL_6:
  NSUInteger v8 = v6[4];
  NSUInteger v7 = v6[5];
  _Block_object_dispose(&v12, 8);
  NSUInteger v9 = v8;
  NSUInteger v10 = v7;
  result.length = v10;
  result.location = v9;
  return result;
}

id __76__IMMessageItem_LiteBlastDoor___rangeOfSingleMessagePartForMessageWithGUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(objc_msgSend(a2, "messagePartBody"), "length");
  if (result)
  {
    id result = [a2 messagePartRange];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v8 + 32) = result;
    *(void *)(v8 + 40) = v9;
    *a4 = 1;
  }
  return result;
}

+ (int64_t)_associatedMessageTypeFromBlastDoorLiteAssociatedMessageType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return 2001;
  }
  else {
    return qword_46E68[a3];
  }
}

- (id)liteAssociatedMessageSummaryInfo
{
  v2 = self;
  IMMessageItem.liteAssociatedMessageSummaryInfo()();

  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

@end