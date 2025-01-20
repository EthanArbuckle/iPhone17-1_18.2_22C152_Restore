@interface CNDataEncryptor
+ (id)decryptData:(id)a3 keyLabel:(id)a4;
+ (id)encryptData:(id)a3 keyLabel:(id)a4;
- (_TtC18ContactsFoundation15CNDataEncryptor)init;
@end

@implementation CNDataEncryptor

+ (id)encryptData:(id)a3 keyLabel:(id)a4
{
  return sub_19099E750((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))_s18ContactsFoundation15CNDataEncryptorC7encrypt_8keyLabel0B04DataVSgAH_SStFZ_0);
}

+ (id)decryptData:(id)a3 keyLabel:(id)a4
{
  return sub_19099E750((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))_s18ContactsFoundation15CNDataEncryptorC7decrypt_8keyLabel0B04DataVSgAH_SStFZ_0);
}

- (_TtC18ContactsFoundation15CNDataEncryptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNDataEncryptor();
  return [(CNDataEncryptor *)&v3 init];
}

@end