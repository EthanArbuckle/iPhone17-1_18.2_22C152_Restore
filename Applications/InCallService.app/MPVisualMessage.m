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
  id v2 = sub_1001C08BC();

  return (VMVoicemail *)v2;
}

- (MPMessageID)identifier
{
  id v2 = self;
  id v3 = sub_1001C0910();

  return (MPMessageID *)v3;
}

- (NSString)provider
{
  id v2 = self;
  sub_1001C09C8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)messageType
{
  return 1;
}

- (NSUUID)callUUID
{
  return (NSUUID *)sub_1001C14E8((uint64_t)self, (uint64_t)a2, &qword_100321178, (void (*)(uint64_t))sub_1001C0AD8, (uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t (*)(void))&UUID._bridgeToObjectiveC());
}

- (TUHandle)senderHandle
{
  id v2 = self;
  id v3 = sub_1001C0B58();

  return (TUHandle *)v3;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_1001C0C48(self, (uint64_t)a2, (void (*)(void))sub_1001C0C24);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_1001C0C48(self, (uint64_t)a2, (void (*)(void))sub_1001C0CC8);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_1001C0C48(self, (uint64_t)a2, (void (*)(void))sub_1001C0CEC);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_1001C0C48(self, (uint64_t)a2, (void (*)(void))sub_1001C0D10);
}

- (NSString)callbackDestinationID
{
  return (NSString *)sub_1001C0C48(self, (uint64_t)a2, (void (*)(void))sub_1001C0D34);
}

- (int64_t)folder
{
  id v2 = self;
  int64_t v3 = sub_1001C0DE4();

  return v3;
}

- (BOOL)isRead
{
  id v2 = self;
  unsigned __int8 v3 = sub_1001C0E94();

  return v3 & 1;
}

- (NSDate)date
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1001C0FB8();

  v9.super.isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (NSDate *)v9.super.isa;
}

- (BOOL)isTranscriptionAvailable
{
  id v2 = self;
  unsigned __int8 v3 = sub_1001C1054();

  return v3 & 1;
}

- (double)duration
{
  id v2 = self;
  sub_1001C10BC();
  double v4 = v3;

  return v4;
}

- (BOOL)isTranscriptionRated
{
  id v2 = self;
  unsigned __int8 v3 = sub_1001C1108();

  return v3 & 1;
}

- (BOOL)isTranscribing
{
  id v2 = self;
  BOOL v3 = sub_1001C1168();

  return v3;
}

- (BOOL)transcriptionAttempted
{
  id v2 = self;
  BOOL v3 = sub_1001C11D0();

  return v3;
}

- (MPTranscriptMessage)transcript
{
  id v2 = self;
  id v3 = sub_1001C1248();

  return (MPTranscriptMessage *)v3;
}

- (BOOL)isDeleted
{
  id v2 = self;
  unsigned __int8 v3 = sub_1001C12F4();

  return v3 & 1;
}

- (BOOL)isSensitive
{
  return 0;
}

- (NSURL)dataURL
{
  uint64_t v3 = sub_10011EB3C(&qword_100324AA0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1001C1428((uint64_t)v6);

  uint64_t v8 = type metadata accessor for URL();
  v10 = 0;
  if (sub_100120F20((uint64_t)v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }

  return (NSURL *)v10;
}

- (NSURL)thumbnailURL
{
  return (NSURL *)sub_1001C14E8((uint64_t)self, (uint64_t)a2, &qword_100324AA0, (void (*)(uint64_t))sub_1001C15E8, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (BOOL)isDataAvailable
{
  id v2 = self;
  unsigned __int8 v3 = sub_1001C1658();

  return v3 & 1;
}

- (MPVisualMessage)initWithVMVoicemail:(id)a3
{
  return (MPVisualMessage *)sub_1001C1684((uint64_t)a3, &OBJC_IVAR___MPVisualMessage_vmMessage, type metadata accessor for VisualMessage);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  uint64_t v4 = self;
  unsigned __int8 v5 = sub_1001C1708(a3);

  return v5 & 1;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  sub_10011EB3C(&qword_100322930);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = sub_1001C177C((uint64_t)v7, v6);

  swift_bridgeObjectRelease();

  return v9;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001C1894((uint64_t)v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (MPVisualMessage)init
{
}

- (void).cxx_destruct
{
}

@end