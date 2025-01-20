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

- (NSDate)date
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  dispatch thunk of Message.dateCreated.getter();
  swift_release();
  v6.super.isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSDate *)v6.super.isa;
}

- (int64_t)messageType
{
  swift_retain();
  int64_t v2 = FTMessage.messageType.getter();
  swift_release();
  return v2;
}

- (int64_t)folder
{
  swift_retain();
  int64_t v2 = FTMessage.folder.getter();
  swift_release();
  return v2;
}

- (BOOL)isRead
{
  if (self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC11MobilePhone9FTMessage_isDirty] == 1)
  {
    swift_retain();
    char v2 = FTMessage.dirtyRead.getter();
  }
  else
  {
    swift_retain();
    char v2 = dispatch thunk of Message.isRead.getter();
  }
  char v3 = v2;
  swift_release();
  return v3 & 1;
}

- (NSString)senderDestinationID
{
  return (NSString *)@objc FTMessage.senderDestinationID.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))FTMessage.senderDestinationID.getter);
}

- (NSString)receiverDestinationID
{
  return (NSString *)@objc FTMessage.senderDestinationID.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))FTMessage.receiverDestinationID.getter);
}

- (MPMessageID)identifier
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  NSDate v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - v7;
  swift_retain();
  dispatch thunk of Message.recordUUID.getter();
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

- (_TtC20FaceTimeMessageStore7Message)ftMessage
{
  return (_TtC20FaceTimeMessageStore7Message *)*(id *)self->ftMessage;
}

- (NSString)provider
{
  swift_retain();
  dispatch thunk of Message.provider.getter();
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSUUID)callUUID
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  dispatch thunk of Message.callUUID.getter();
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  swift_release();
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSUUID *)isa;
}

- (TUHandle)senderHandle
{
  swift_retain();
  if (dispatch thunk of Message.isFromUnknown.getter())
  {
    swift_release();
    id v2 = 0;
  }
  else
  {
    dispatch thunk of Message.from.getter();
    uint64_t v3 = self;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v2 = [v3 normalizedHandleWithDestinationID:v4];
    swift_release();
  }

  return (TUHandle *)v2;
}

- (NSString)senderISOCountryCode
{
  return (NSString *)@objc FTMessage.senderDestinationID.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))FTMessage.senderISOCountryCode.getter);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)@objc FTMessage.senderDestinationID.getter((uint64_t)self, (uint64_t)a2, (void (*)(void))FTMessage.receiverISOCountryCode.getter);
}

- (NSString)callbackDestinationID
{
  swift_retain();
  if (dispatch thunk of Message.isFromUnknown.getter())
  {
    swift_release();
    NSString v2 = 0;
  }
  else
  {
    dispatch thunk of Message.from.getter();
    swift_release();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v2;
}

- (void)setFolder:(int64_t)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC11MobilePhone9FTMessage_isDirty] = 1;
  *(void *)self->$__lazy_storage_$_dirtyFolder = a3;
  self->$__lazy_storage_$_dirtyFolder[8] = 0;
}

- (void)setIsRead:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC11MobilePhone9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_dirtyRead[0] = a3;
}

- (BOOL)isTranscriptionAvailable
{
  return @objc FTMessage.isTranscriptionAvailable.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))FTMessage.isTranscriptionAvailable.getter);
}

- (double)duration
{
  swift_retain();
  dispatch thunk of Message.duration.getter();
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
  dispatch thunk of Message.transcriptionStatus.getter();
  int v2 = (unsigned __int16)TranscriptionStatus.rawValue.getter();
  unsigned __int16 v3 = TranscriptionStatus.rawValue.getter();
  swift_release();
  return v2 != v3;
}

- (BOOL)isDeleted
{
  return FTMessage.isDeleted.getter() & 1;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC11MobilePhone9FTMessage_isDirty] = 1;
  self->$__lazy_storage_$_isDeleted[0] = a3;
}

- (BOOL)isSensitive
{
  return @objc FTMessage.isSensitive.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isSensitive.getter);
}

- (NSURL)dataURL
{
  return (NSURL *)@objc FTMessage.dataURL.getter((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))FTMessage.dataURL.getter);
}

- (void)setDataURL:(id)a3
{
}

- (NSURL)thumbnailURL
{
  return (NSURL *)@objc FTMessage.dataURL.getter((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))FTMessage.thumbnailURL.getter);
}

- (void)setThumbnailURL:(id)a3
{
}

- (BOOL)isRTT
{
  return @objc FTMessage.isSensitive.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))&dispatch thunk of Message.isRTT.getter);
}

- (BOOL)isDataAvailable
{
  return @objc FTMessage.isTranscriptionAvailable.getter((uint64_t)self, (uint64_t)a2, (uint64_t (*)(uint64_t))FTMessage.isDataAvailable.getter);
}

- (MPTranscriptMessage)transcript
{
  swift_retain();
  int v2 = (void *)FTMessage.transcript.getter();
  swift_release();

  return (MPTranscriptMessage *)v2;
}

- (void)setTranscript:(id)a3
{
  uint64_t v3 = *(void *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC11MobilePhone9FTMessage____lazy_storage___transcript];
  *(void *)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC11MobilePhone9FTMessage____lazy_storage___transcript] = a3;
  swift_unknownObjectRetain();

  outlined consume of TranscriptMessage??(v3);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  swift_retain();
  Swift::Bool v4 = FTMessage.shouldBeMarkedAsRead(for:)(a3);
  swift_release();
  return v4;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  swift_retain();
  uint64_t v7 = (void *)FTMessage.getContact(using:with:)((CNContactStore)v6, (Swift::OpaquePointer)v5);

  swift_release();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v3 = a3;
  swift_retain();
  object = FTMessage.getDisplayName(using:)((CNContactStore)v3).value._object;

  swift_release();
  if (object)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

@end