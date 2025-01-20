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

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v9 = String._bridgeToObjectiveC()();
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
  return (NSString *)@objc VisualMessage.senderDestinationID.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_senderDestinationID);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)@objc VisualMessage.senderDestinationID.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_senderISOCountryCode);
}

- (NSString)receiverDestinationID
{
  return (NSString *)@objc VisualMessage.senderDestinationID.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_receiverDestinationID);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)@objc VisualMessage.senderDestinationID.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_receiverISOCountryCode);
}

- (NSString)callbackDestinationID
{
  return (NSString *)@objc VisualMessage.senderDestinationID.getter((char *)self, (uint64_t)a2, (SEL *)&selRef_callbackDestinationID);
}

- (int64_t)folder
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xF0);
  v3 = self;
  if (v2())
  {

    return 0;
  }
  else
  {
    id v5 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
    if ([v5 isBlocked]) {
      int64_t v6 = 4;
    }
    else {
      int64_t v6 = 1;
    }
    unsigned int v7 = [v5 isTrashed];

    if (v7) {
      return 2;
    }
    else {
      return v6;
    }
  }
}

- (BOOL)isRead
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) isRead];
}

- (NSDate)date
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  int64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  id v8 = self;
  id v9 = [v7 date];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v10.super.isa = Date._bridgeToObjectiveC()().super.isa;
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
    int64_t v6 = (char *)objc_allocWithZone(v5);
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
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  unsigned int v7 = self;
  id v8 = [v6 dataURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);

  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    URL._bridgeToObjectiveC()(v11);
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
  return (MPVisualMessage *)@objc VisualTranscriptionMessage.init(vmTranscript:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MPVisualMessage_vmMessage, type metadata accessor for VisualMessage);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  *(float *)&a3 = a3;
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage) shouldMarkAsReadForPlaybackCurrentTime:a3];
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned int v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualMessage_vmMessage);
  id v8 = a3;
  uint64_t v9 = self;
  specialized _arrayForceCast<A, B>(_:)(v6);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
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
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
  }
  NSString v9 = String._bridgeToObjectiveC()();
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