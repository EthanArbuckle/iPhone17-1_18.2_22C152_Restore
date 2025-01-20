@interface EDIndexedMessage
- (BOOL)hasBodyData;
- (BOOL)isEqual:(id)a3;
- (EDIndexedMessage)init;
- (EDIndexedMessage)initWithMessageID:(id)a3 hasBodyData:(BOOL)a4;
- (EDPersistedMessageID)messageID;
- (int64_t)hash;
@end

@implementation EDIndexedMessage

- (EDPersistedMessageID)messageID
{
  return (EDPersistedMessageID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___EDIndexedMessage_messageID));
}

- (BOOL)hasBodyData
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___EDIndexedMessage_hasBodyData);
}

- (EDIndexedMessage)initWithMessageID:(id)a3 hasBodyData:(BOOL)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EDIndexedMessage_messageID) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___EDIndexedMessage_hasBodyData) = a4;
  v6.receiver = self;
  v6.super_class = (Class)EDIndexedMessage;
  id v4 = a3;
  return [(EDIndexedMessage *)&v6 init];
}

- (BOOL)isEqual:(id)a3
{
  return sub_1DB5A7CC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))EDIndexedMessage.isEqual(_:));
}

- (int64_t)hash
{
  return (int64_t)sub_1DB5A7D58(self, (uint64_t)a2, (SEL *)&selRef_messageID);
}

- (EDIndexedMessage)init
{
  result = (EDIndexedMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end