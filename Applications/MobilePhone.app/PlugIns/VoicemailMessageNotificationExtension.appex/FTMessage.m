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
  uint64_t v2 = sub_100041340();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v15 - v7;
  swift_retain();
  sub_100041440();
  v9 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v9(v6, v8, v2);
  v10 = (objc_class *)type metadata accessor for MessageID(0);
  v11 = (char *)objc_allocWithZone(v10);
  v9(&v11[OBJC_IVAR___MPMessageID_value], v6, v2);
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v15.receiver = v11;
  v15.super_class = v10;
  v12 = [(FTMessage *)&v15 init];
  v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v6, v2);
  v13(v8, v2);
  swift_release();

  return (MPMessageID *)v12;
}

- (NSString)provider
{
  swift_retain();
  sub_100041520();
  swift_release();
  NSString v2 = sub_100041740();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSUUID)callUUID
{
  uint64_t v2 = sub_100016F7C(&qword_1000688F8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1000414F0();
  uint64_t v5 = sub_100041340();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  swift_release();
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    Class isa = sub_100041300().super.isa;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSUUID *)isa;
}

- (int64_t)messageType
{
  swift_retain();
  int64_t v2 = sub_10001B400();
  swift_release();
  return v2;
}

- (TUHandle)senderHandle
{
  swift_retain();
  if (sub_1000414A0())
  {
    swift_release();
    id v2 = 0;
  }
  else
  {
    sub_1000414C0();
    uint64_t v3 = self;
    NSString v4 = sub_100041740();
    swift_bridgeObjectRelease();
    id v2 = [v3 normalizedHandleWithDestinationID:v4];
    swift_release();
  }

  return (TUHandle *)v2;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_10001B5E8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_normalizedValue, (void (*)(uint64_t))sub_10001B674);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_10001B5E8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_isoCountryCode, (void (*)(uint64_t))sub_10001B674);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_10001B5E8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_normalizedValue, (void (*)(uint64_t))sub_10001B794);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_10001B5E8((uint64_t)self, (uint64_t)a2, (uint64_t)&selRef_isoCountryCode, (void (*)(uint64_t))sub_10001B794);
}

- (NSString)callbackDestinationID
{
  swift_retain();
  if (sub_1000414A0())
  {
    swift_release();
    NSString v2 = 0;
  }
  else
  {
    sub_1000414C0();
    swift_release();
    NSString v2 = sub_100041740();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v2;
}

- (int64_t)folder
{
  swift_retain();
  int64_t v2 = sub_10001B988();
  swift_release();
  return v2;
}

- (void)setFolder:(int64_t)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty] = 1;
  *(void *)self->$__lazy_storage_$_dirtyFolder = a3;
  self->$__lazy_storage_$_dirtyFolder[8] = 0;
}

- (BOOL)isRead
{
  if (self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty] == 1)
  {
    swift_retain();
    char v2 = sub_10001BA14();
  }
  else
  {
    swift_retain();
    char v2 = sub_1000414E0();
  }
  char v3 = v2;
  swift_release();
  return v3 & 1;
}

- (void)setIsRead:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_dirtyRead[0] = a3;
}

- (NSDate)date
{
  uint64_t v2 = sub_1000412E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100041460();
  swift_release();
  v6.super.Class isa = sub_1000412B0().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSDate *)v6.super.isa;
}

- (BOOL)isTranscriptionAvailable
{
  return sub_10001D0B4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10001BBF4);
}

- (double)duration
{
  swift_retain();
  sub_100041500();
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
  swift_retain();
  sub_1000414B0();
  int v2 = (unsigned __int16)sub_1000416A0();
  unsigned __int16 v3 = sub_1000416A0();
  swift_release();
  return v2 != v3;
}

- (BOOL)isDeleted
{
  return sub_10001C3A8() & 1;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_isDeleted[0] = a3;
}

- (BOOL)isSensitive
{
  return sub_10001D050((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isSensitive.getter);
}

- (NSURL)dataURL
{
  uint64_t v2 = sub_100016F7C(&qword_1000687D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10001C520((uint64_t)v4);
  swift_release();
  uint64_t v5 = sub_100041290();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    sub_100041260(v7);
    uint64_t v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSURL *)v8;
}

- (void)setDataURL:(id)a3
{
}

- (NSURL)thumbnailURL
{
  uint64_t v2 = sub_100016F7C(&qword_1000687D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10001CA40(&OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, (uint64_t)v4);
  swift_release();
  uint64_t v5 = sub_100041290();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    sub_100041260(v7);
    uint64_t v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSURL *)v8;
}

- (void)setThumbnailURL:(id)a3
{
}

- (BOOL)isRTT
{
  return sub_10001D050((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isRTT.getter);
}

- (BOOL)isDataAvailable
{
  return sub_10001D0B4((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))sub_10001D0F4);
}

- (MPTranscriptMessage)transcript
{
  swift_retain();
  uint64_t v2 = (void *)sub_10001C08C();
  swift_release();

  return (MPTranscriptMessage *)v2;
}

- (void)setTranscript:(id)a3
{
  uint64_t v3 = *(void *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript];
  *(void *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript] = a3;
  swift_unknownObjectRetain();

  sub_10001FB04(v3);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  swift_retain();
  BOOL v4 = sub_10001DFC8(a3);
  swift_release();
  return v4;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  sub_100016F7C(&qword_1000687D0);
  sub_1000417F0();
  id v5 = a3;
  swift_retain();
  id v6 = sub_10001E098(v5);

  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_10001E294(v3);
  uint64_t v5 = v4;

  swift_release();
  if (v5)
  {
    NSString v6 = sub_100041740();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

@end