@interface FTMessage
- (BOOL)isDataAvailable;
- (BOOL)isDeleted;
- (BOOL)isRTT;
- (BOOL)isRead;
- (BOOL)isSensitive;
- (BOOL)isTranscribing;
- (BOOL)isTranscriptionAvailable;
- (BOOL)isTranscriptionRated;
- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3;
- (BOOL)transcriptionAttempted;
- (MPMessageID)identifier;
- (MPTranscriptMessage)transcript;
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
- (_TtC20FaceTimeMessageStore7Message)ftMessage;
- (double)duration;
- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4;
- (id)displayNameUsingContactStore:(id)a3;
- (int64_t)folder;
- (int64_t)messageType;
- (void)setDataURL:(id)a3;
- (void)setFolder:(int64_t)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setThumbnailURL:(id)a3;
- (void)setTranscript:(id)a3;
@end

@implementation FTMessage

- (_TtC20FaceTimeMessageStore7Message)ftMessage
{
  return (_TtC20FaceTimeMessageStore7Message *)*(id *)self->ftMessage;
}

- (MPMessageID)identifier
{
  swift_retain();
  id v2 = sub_10017EF28();
  swift_release();

  return (MPMessageID *)v2;
}

- (NSString)provider
{
  swift_retain();
  sub_10017F08C();
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSUUID)callUUID
{
  uint64_t v2 = sub_10011EB3C(&qword_100321178);
  __chkstk_darwin(v2 - 8, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10017F1B4((uint64_t)v5);
  swift_release();
  uint64_t v6 = type metadata accessor for UUID();
  Class isa = 0;
  if (sub_100120F20((uint64_t)v5, 1, v6) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }

  return (NSUUID *)isa;
}

- (int64_t)messageType
{
  swift_retain();
  int64_t v2 = sub_10017F23C();
  swift_release();
  return v2;
}

- (TUHandle)senderHandle
{
  swift_retain();
  id v2 = sub_10017F3A0();
  swift_release();

  return (TUHandle *)v2;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_10017F464();
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_10017F464();
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_10017F464();
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_10017F464();
}

- (NSString)callbackDestinationID
{
  swift_retain();
  sub_10017F6AC();
  uint64_t v3 = v2;
  swift_release();
  if (v3)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return (NSString *)v4;
}

- (int64_t)folder
{
  swift_retain();
  int64_t v2 = sub_10017F748();
  swift_release();
  return v2;
}

- (void)setFolder:(int64_t)a3
{
}

- (BOOL)isRead
{
  return sub_100180B00((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10017F85C);
}

- (void)setIsRead:(BOOL)a3
{
}

- (NSDate)date
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10017F9E8();
  swift_release();
  v7.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);

  return (NSDate *)v7.super.isa;
}

- (BOOL)isTranscriptionAvailable
{
  return sub_100180B00((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10017FA24);
}

- (double)duration
{
  swift_retain();
  sub_1001800AC();
  double v3 = v2;
  swift_release();
  return v3;
}

- (BOOL)isTranscriptionRated
{
  return 0;
}

- (BOOL)isTranscribing
{
  return 0;
}

- (BOOL)transcriptionAttempted
{
  return sub_100180B00((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_1001800F8);
}

- (BOOL)isDeleted
{
  return sub_100180198() & 1;
}

- (void)setIsDeleted:(BOOL)a3
{
}

- (BOOL)isSensitive
{
  return sub_100180B00((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_100180210);
}

- (NSURL)dataURL
{
  uint64_t v2 = sub_10011EB3C(&qword_100324AA0);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10018033C((uint64_t)v5);
  swift_release();
  uint64_t v6 = type metadata accessor for URL();
  v8 = 0;
  if (sub_100120F20((uint64_t)v5, 1, v6) != 1)
  {
    URL._bridgeToObjectiveC()(v7);
    v8 = v9;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }

  return (NSURL *)v8;
}

- (void)setDataURL:(id)a3
{
}

- (NSURL)thumbnailURL
{
  uint64_t v2 = sub_10011EB3C(&qword_100324AA0);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1001806B8((uint64_t)&OBJC_IVAR____TtC13InCallService9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, (uint64_t)v5);
  swift_release();
  uint64_t v6 = type metadata accessor for URL();
  v8 = 0;
  if (sub_100120F20((uint64_t)v5, 1, v6) != 1)
  {
    URL._bridgeToObjectiveC()(v7);
    v8 = v9;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }

  return (NSURL *)v8;
}

- (void)setThumbnailURL:(id)a3
{
}

- (BOOL)isRTT
{
  return sub_100180B00((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10017FE4C);
}

- (BOOL)isDataAvailable
{
  return sub_100180B00((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_100180B40);
}

- (MPTranscriptMessage)transcript
{
  swift_retain();
  uint64_t v2 = (void *)sub_10017FE74();
  swift_release();

  return (MPTranscriptMessage *)v2;
}

- (void)setTranscript:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_100180D40((uint64_t)a3);

  swift_release();
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  swift_retain();
  BOOL v4 = sub_100181818(a3);
  swift_release();
  return v4;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  sub_10011EB3C(&qword_100322930);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = a3;
  swift_retain();
  id v6 = sub_1001818C4(v5);

  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_100181A48(v3);
  uint64_t v5 = v4;

  swift_release();
  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

@end