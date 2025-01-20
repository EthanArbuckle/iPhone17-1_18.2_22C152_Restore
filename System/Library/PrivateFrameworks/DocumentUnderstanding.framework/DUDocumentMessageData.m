@interface DUDocumentMessageData
- (BOOL)isEqual:(id)a3;
- (NSArray)recipientHandles;
- (NSArray)recipientNames;
- (NSString)attachmentFileName;
- (NSString)attachmentFilePath;
- (NSString)conversationIdentifier;
- (NSString)creatorHandle;
- (_TtC21DocumentUnderstanding21DUDocumentMessageData)init;
- (_TtC21DocumentUnderstanding21DUDocumentMessageData)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentFileName:(id)a3;
- (void)setAttachmentFilePath:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setCreatorHandle:(id)a3;
- (void)setRecipientHandles:(id)a3;
- (void)setRecipientNames:(id)a3;
@end

@implementation DUDocumentMessageData

- (NSString)conversationIdentifier
{
  return (NSString *)sub_236810A74((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentMessageData.conversationIdentifier.getter);
}

- (void)setConversationIdentifier:(id)a3
{
}

- (NSString)creatorHandle
{
  return (NSString *)sub_236810A74((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentMessageData.creatorHandle.getter);
}

- (void)setCreatorHandle:(id)a3
{
}

- (NSArray)recipientHandles
{
  return (NSArray *)sub_236810C78((uint64_t)self, (uint64_t)a2, DUDocumentMessageData.recipientHandles.getter);
}

- (void)setRecipientHandles:(id)a3
{
}

- (NSArray)recipientNames
{
  return (NSArray *)sub_236810C78((uint64_t)self, (uint64_t)a2, DUDocumentMessageData.recipientNames.getter);
}

- (void)setRecipientNames:(id)a3
{
}

- (NSString)attachmentFileName
{
  return (NSString *)sub_236810A74((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentMessageData.attachmentFileName.getter);
}

- (void)setAttachmentFileName:(id)a3
{
}

- (NSString)attachmentFilePath
{
  return (NSString *)sub_236810A74((uint64_t)self, (uint64_t)a2, (void (*)(void))DUDocumentMessageData.attachmentFilePath.getter);
}

- (void)setAttachmentFilePath:(id)a3
{
}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)init
{
  return (_TtC21DocumentUnderstanding21DUDocumentMessageData *)DUDocumentMessageData.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DUDocumentMessageData.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding21DUDocumentMessageData *)DUDocumentMessageData.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUDocumentMessageData.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  id v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23697B5DC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = DUDocumentMessageData.isEqual(_:)((uint64_t)v8);

  sub_2367BAA28((uint64_t)v8, (uint64_t *)&unk_26AD8BC30);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end