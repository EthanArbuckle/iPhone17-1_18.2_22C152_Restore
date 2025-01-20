@interface CKPIETFKeyBlinding
+ (BOOL)isValidWithSignature:(id)a3 for:(id)a4 with:(__SecKey *)a5 context:(id)a6;
+ (__SecKey)blindPublicKeyWithPublicKey:(__SecKey *)a3 with:(__SecKey *)a4 context:(id)a5 error:(id *)a6;
+ (__SecKey)secKeyFromCompressedRepresentation:(id)a3;
+ (__SecKey)unblindPublicKey:(__SecKey *)a3 with:(__SecKey *)a4 context:(id)a5 error:(id *)a6;
+ (id)blindSign:(id)a3 blindedBy:(__SecKey *)a4 with:(__SecKey *)a5 context:(id)a6 error:(id *)a7;
+ (id)compressedRepresentationFromSecKey:(__SecKey *)a3;
+ (id)privateScalarFromSecKey:(__SecKey *)a3;
- (_TtC16CryptoKitPrivate18CKPIETFKeyBlinding)init;
@end

@implementation CKPIETFKeyBlinding

+ (id)privateScalarFromSecKey:(__SecKey *)a3
{
  v3 = a3;
  _s16CryptoKitPrivate18CKPIETFKeyBlindingC23privateScalarFromSecKeyy10Foundation4DataVSgSo0iJ3RefaFZ_0(v3);
  uint64_t v5 = v4;
  unint64_t v7 = v6;

  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_1DB0C49E8();
    sub_1DB069BB4(v5, v7);
  }
  return v8;
}

+ (BOOL)isValidWithSignature:(id)a3 for:(id)a4 with:(__SecKey *)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_1DB0C4A08();
  unint64_t v15 = v14;

  uint64_t v16 = sub_1DB0C4A08();
  unint64_t v18 = v17;

  LOBYTE(v10) = _s16CryptoKitPrivate18CKPIETFKeyBlindingC7isValid9signature3for4with7contextSb10Foundation4DataV_AKSo9SecKeyRefaSo6NSDataCtFZ_0(v13, v15, v16, v18, v11);
  sub_1DB042664(v16, v18);
  sub_1DB042664(v13, v15);

  return v10 & 1;
}

+ (id)blindSign:(id)a3 blindedBy:(__SecKey *)a4 with:(__SecKey *)a5 context:(id)a6 error:(id *)a7
{
  id v10 = a3;
  v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_1DB0C4A08();
  unint64_t v16 = v15;

  unint64_t v17 = (void *)sub_1DB06DEF8(v14, v16, v11, v12, v13);
  sub_1DB042664(v14, v16);
  return v17;
}

+ (id)compressedRepresentationFromSecKey:(__SecKey *)a3
{
  v3 = a3;
  uint64_t v4 = (void *)_s16CryptoKitPrivate18CKPIETFKeyBlindingC28compressedRepresentationFrom6secKeySo6NSDataCSgSo03SecJ3Refa_tFZ_0(v3);

  return v4;
}

+ (__SecKey)secKeyFromCompressedRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)_s16CryptoKitPrivate18CKPIETFKeyBlindingC10secKeyFrom24compressedRepresentationSo03SecG3RefaSgSo6NSDataC_tFZ_0();

  return (__SecKey *)v4;
}

+ (__SecKey)blindPublicKeyWithPublicKey:(__SecKey *)a3 with:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  return (__SecKey *)sub_1DB06D0E8((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1DB06E9A8);
}

+ (__SecKey)unblindPublicKey:(__SecKey *)a3 with:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  return (__SecKey *)sub_1DB06D0E8((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1DB06EFAC);
}

- (_TtC16CryptoKitPrivate18CKPIETFKeyBlinding)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKPIETFKeyBlinding();
  return [(CKPIETFKeyBlinding *)&v3 init];
}

@end