@interface CNKeychainFacade
- (_TtC18ContactsFoundation16CNKeychainFacade)init;
- (id)createSymmetricKeyIfNeededWithLabel:(id)a3;
- (id)existingSymmetricKeyWithLabel:(id)a3;
- (id)removeEncryptionKeyWithLabel:(id)a3;
@end

@implementation CNKeychainFacade

- (id)createSymmetricKeyIfNeededWithLabel:(id)a3
{
  return sub_19099588C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1909989E0);
}

- (id)existingSymmetricKeyWithLabel:(id)a3
{
  return sub_19099588C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_190997DEC);
}

- (id)removeEncryptionKeyWithLabel:(id)a3
{
  return sub_19099588C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_19099968C);
}

- (_TtC18ContactsFoundation16CNKeychainFacade)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNKeychainFacade();
  return [(CNKeychainFacade *)&v3 init];
}

@end