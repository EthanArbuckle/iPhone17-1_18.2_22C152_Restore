@interface CNKeychainFacadeTestDouble
- (_TtC18ContactsFoundation26CNKeychainFacadeTestDouble)init;
- (id)createSymmetricKeyIfNeededWithLabel:(id)a3;
- (id)existingSymmetricKeyWithLabel:(id)a3;
- (id)removeEncryptionKeyWithLabel:(id)a3;
@end

@implementation CNKeychainFacadeTestDouble

- (id)createSymmetricKeyIfNeededWithLabel:(id)a3
{
  return sub_190996C90(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_190995B60);
}

- (id)existingSymmetricKeyWithLabel:(id)a3
{
  return sub_190996C90(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1909963CC);
}

- (id)removeEncryptionKeyWithLabel:(id)a3
{
  return sub_190996C90(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1909968D8);
}

- (_TtC18ContactsFoundation26CNKeychainFacadeTestDouble)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict) = (Class)MEMORY[0x1E4FBC868];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNKeychainFacadeTestDouble();
  return [(CNKeychainFacadeTestDouble *)&v3 init];
}

- (void).cxx_destruct
{
}

@end