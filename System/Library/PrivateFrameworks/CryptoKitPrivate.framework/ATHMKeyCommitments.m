@interface ATHMKeyCommitments
+ (BOOL)verifyWithKeyCommitmentsData:(id)a3;
- (_TtC16CryptoKitPrivate18ATHMKeyCommitments)init;
@end

@implementation ATHMKeyCommitments

+ (BOOL)verifyWithKeyCommitmentsData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1DB0C4A08();
  unint64_t v6 = v5;

  LOBYTE(v3) = _s16CryptoKitPrivate18ATHMKeyCommitmentsC6verify03keyE4DataSb10Foundation0H0V_tFZ_0(v4, v6);
  sub_1DB042664(v4, v6);
  return v3 & 1;
}

- (_TtC16CryptoKitPrivate18ATHMKeyCommitments)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ATHMKeyCommitments();
  return [(ATHMKeyCommitments *)&v3 init];
}

@end