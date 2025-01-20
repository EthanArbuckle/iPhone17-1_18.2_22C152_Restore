@interface IDSGroupEncryptionPreKeyDictionaryKeys
+ (NSString)creationDate;
+ (NSString)publicPreKey;
+ (NSString)wrapMode;
- (_TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys)init;
@end

@implementation IDSGroupEncryptionPreKeyDictionaryKeys

+ (NSString)publicPreKey
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4CCE0);
}

+ (NSString)creationDate
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4CCE8);
}

+ (NSString)wrapMode
{
  return (NSString *)sub_10044D9B0((uint64_t)a1, (uint64_t)a2, &qword_100A4CCF0);
}

- (_TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSGroupEncryptionPreKeyDictionaryKeys();
  return [(IDSGroupEncryptionPreKeyDictionaryKeys *)&v3 init];
}

@end