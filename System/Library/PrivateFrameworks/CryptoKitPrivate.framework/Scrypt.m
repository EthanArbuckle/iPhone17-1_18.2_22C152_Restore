@interface Scrypt
+ (id)deriveKeyWithPassword:(id)a3 salt:(id)a4 outputSize:(int64_t)a5 cost:(unint64_t)a6 blockSize:(unsigned int)a7 parallelization:(unsigned int)a8;
- (_TtC16CryptoKitPrivate6Scrypt)init;
@end

@implementation Scrypt

+ (id)deriveKeyWithPassword:(id)a3 salt:(id)a4 outputSize:(int64_t)a5 cost:(unint64_t)a6 blockSize:(unsigned int)a7 parallelization:(unsigned int)a8
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)_s16CryptoKitPrivate6ScryptC9deriveKey8password4salt10outputSize4cost05blockJ015parallelizationSo6NSDataCSgAL_AMSis6UInt64Vs6UInt32VAQtFZ_0(v10, a4, a5);

  return v12;
}

- (_TtC16CryptoKitPrivate6Scrypt)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Scrypt();
  return [(Scrypt *)&v3 init];
}

@end