@interface MPVisualMessage
- (BOOL)isDataAvailable;
- (BOOL)isDeleted;
- (BOOL)isRead;
- (BOOL)isSensitive;
- (BOOL)isTranscribing;
- (BOOL)isTranscriptionAvailable;
- (BOOL)isTranscriptionRated;
- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3;
- (BOOL)transcriptionAttempted;
- (MPMessageID)identifier;
- (MPTranscriptMessage)transcript;
- (MPVisualMessage)init;
- (MPVisualMessage)initWithVMVoicemail:(id)a3;
- (NSDate)date;
- (NSString)callbackDestinationID;
- (NSString)provider;
- (NSString)receiverDestinationID;
- (NSString)receiverISOCountryCode;
- (NSString)senderDestinationID;
- (NSString)senderISOCountryCode;
- (NSURL)dataURL;
- (NSURL)thumbnailURL;
- (NSUUID)callUUID;
- (TUHandle)senderHandle;
- (VMVoicemail)vmMessage;
- (double)duration;
- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4;
- (id)displayNameUsingContactStore:(id)a3;
- (int64_t)folder;
- (int64_t)messageType;
@end

@implementation MPVisualMessage

- (VMVoicemail)vmMessage
{
  return (VMVoicemail *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___MPVisualMessage_vmMessage));
}

- (MPMessageID)identifier
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  id v4 = [v2 identifier];
  v5 = (objc_class *)type metadata accessor for MessageID(0);
  v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR___MPMessageID_value] = v4;
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v9.receiver = v6;
  v9.super_class = v5;
  v7 = [(MPVisualMessage *)&v9 init];

  return (MPMessageID *)v7;
}

- (NSString)provider
{
  v3 = self;
  id v4 = self;
  id v5 = [v3 sharedInstance];
  id v6 = [v5 providerManager];

  id v7 = [v6 telephonyProvider];
  id v8 = [v7 identifier];

  sub_100062300();
  NSString v9 = sub_1000622D0();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (int64_t)messageType
{
  return 1;
}

- (NSUUID)callUUID
{
  return (NSUUID *)0;
}

- (TUHandle)senderHandle
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  id v4 = [v2 senderDestinationID];
  if (v4)
  {
    id v5 = v4;
    id v6 = self;
    id v7 = (MPVisualMessage *)[v2 senderISOCountryCode];
    id v8 = [v6 normalizedPhoneNumberHandleForValue:v5 isoCountryCode:v7];

    v3 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return (TUHandle *)v8;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_100046D08((char *)self, (uint64_t)a2, (SEL *)&selRef_senderDestinationID);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_100046D08((char *)self, (uint64_t)a2, (SEL *)&selRef_senderISOCountryCode);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_100046D08((char *)self, (uint64_t)a2, (SEL *)&selRef_receiverDestinationID);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_100046D08((char *)self, (uint64_t)a2, (SEL *)&selRef_receiverISOCountryCode);
}

- (NSString)callbackDestinationID
{
  return (NSString *)sub_100046D08((char *)self, (uint64_t)a2, (SEL *)&selRef_callbackDestinationID);
}

- (int64_t)folder
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  v3 = self;
  if ([v2 isDeleted])
  {

    return 0;
  }
  else
  {
    if ([v2 isBlocked]) {
      int64_t v5 = 4;
    }
    else {
      int64_t v5 = 1;
    }
    unsigned int v6 = [v2 isTrashed];

    if (v6) {
      return 2;
    }
    else {
      return v5;
    }
  }
}

- (BOOL)isRead
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) isRead];
}

- (NSDate)date
{
  uint64_t v3 = sub_100061D20();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  id v8 = self;
  id v9 = [v7 date];
  sub_100061D10();

  v10.super.isa = sub_100061CF0().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDate *)v10.super.isa;
}

- (BOOL)isTranscriptionAvailable
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) isTranscriptionAvailable];
}

- (double)duration
{
  [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) duration];
  return result;
}

- (BOOL)isTranscriptionRated
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) isTranscriptionRated];
}

- (BOOL)isTranscribing
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) transcriptionState] == (id)2;
}

- (BOOL)transcriptionAttempted
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) transcriptionState] == (id)3;
}

- (MPTranscriptMessage)transcript
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  uint64_t v3 = self;
  uint64_t v4 = (MPVisualMessage *)[v2 transcript];
  if (v4)
  {
    uint64_t v5 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
    unsigned int v6 = (char *)objc_allocWithZone(v5);
    *(void *)&v6[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v4;
    v8.receiver = v6;
    v8.super_class = v5;
    uint64_t v4 = [(MPVisualMessage *)&v8 init];
  }

  return (MPTranscriptMessage *)v4;
}

- (BOOL)isDeleted
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) isDeleted];
}

- (BOOL)isSensitive
{
  return 0;
}

- (NSURL)dataURL
{
  uint64_t v3 = sub_100035DD8(&qword_1000A16F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  id v7 = self;
  id v8 = [v6 dataURL];
  sub_100061CB0();

  uint64_t v9 = sub_100061CD0();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);

  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    sub_100061CA0(v11);
    uint64_t v12 = v13;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }

  return (NSURL *)v12;
}

- (NSURL)thumbnailURL
{
  return (NSURL *)0;
}

- (BOOL)isDataAvailable
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) isDataAvailable];
}

- (MPVisualMessage)initWithVMVoicemail:(id)a3
{
  return (MPVisualMessage *)sub_1000472B0((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MPVisualMessage_vmMessage, type metadata accessor for VisualMessage);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  *(float *)&a3 = a3;
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) shouldMarkAsReadForPlaybackCurrentTime:a3];
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  sub_100035DD8(&qword_1000A16F0);
  unint64_t v6 = sub_100062380();
  id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  id v8 = a3;
  uint64_t v9 = self;
  sub_100046590(v6);
  Class isa = sub_100062370().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [v7 contactUsingContactStore:v8 withKeysToFetch:isa];

  swift_bridgeObjectRelease();

  return v11;
}

- (id)displayNameUsingContactStore:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  id v5 = a3;
  unint64_t v6 = self;
  id v7 = [v4 displayNameUsingContactStore:v5];
  if (v7)
  {
    id v8 = v7;
    sub_100062300();
  }
  else
  {
  }
  NSString v9 = sub_1000622D0();
  swift_bridgeObjectRelease();

  return v9;
}

- (MPVisualMessage)init
{
  double result = (MPVisualMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end