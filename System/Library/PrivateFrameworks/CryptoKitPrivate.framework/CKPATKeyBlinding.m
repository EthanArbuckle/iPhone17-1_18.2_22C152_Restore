@interface CKPATKeyBlinding
+ (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 signedBy:(__SecKey *)a5 context:(id)a6;
+ (__SecKey)blindPublicKey:(__SecKey *)a3 withPrivateKey:(__SecKey *)a4 context:(id)a5 error:(id *)a6;
+ (__SecKey)secKeyFromCompressedRepresentation:(id)a3;
+ (__SecKey)unblindPublicKey:(__SecKey *)a3 withPrivateKey:(__SecKey *)a4 context:(id)a5 error:(id *)a6;
+ (id)blindSignMessage:(id)a3 blindedBy:(__SecKey *)a4 withKey:(__SecKey *)a5 context:(id)a6 error:(id *)a7;
+ (id)compressedRepresentationFromSecKey:(__SecKey *)a3;
+ (id)privateScalarFromSecKey:(__SecKey *)a3;
@end

@implementation CKPATKeyBlinding

+ (id)privateScalarFromSecKey:(__SecKey *)a3
{
  return +[CKPIETFKeyBlinding privateScalarFromSecKey:a3];
}

+ (__SecKey)secKeyFromCompressedRepresentation:(id)a3
{
  v3 = +[CKPIETFKeyBlinding secKeyFromCompressedRepresentation:a3];
  CFRetain(v3);
  return v3;
}

+ (id)compressedRepresentationFromSecKey:(__SecKey *)a3
{
  return +[CKPIETFKeyBlinding compressedRepresentationFromSecKey:a3];
}

+ (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 signedBy:(__SecKey *)a5 context:(id)a6
{
  return +[CKPIETFKeyBlinding isValidWithSignature:a3 for:a4 with:a5 context:a6];
}

+ (id)blindSignMessage:(id)a3 blindedBy:(__SecKey *)a4 withKey:(__SecKey *)a5 context:(id)a6 error:(id *)a7
{
  return +[CKPIETFKeyBlinding blindSign:a3 blindedBy:a4 with:a5 context:a6 error:a7];
}

+ (__SecKey)blindPublicKey:(__SecKey *)a3 withPrivateKey:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  v6 = +[CKPIETFKeyBlinding blindPublicKeyWithPublicKey:a3 with:a4 context:a5 error:a6];
  CFRetain(v6);
  return v6;
}

+ (__SecKey)unblindPublicKey:(__SecKey *)a3 withPrivateKey:(__SecKey *)a4 context:(id)a5 error:(id *)a6
{
  v6 = +[CKPIETFKeyBlinding unblindPublicKey:a3 with:a4 context:a5 error:a6];
  CFRetain(v6);
  return v6;
}

@end