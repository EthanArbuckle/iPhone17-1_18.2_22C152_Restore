@interface TPHObjectiveC
+ (ccec_full_ctx)ccec384Context;
+ (id)digestUsingSha384:(id)a3;
+ (id)fetchKeyPairWithPrivateKeyPersistentRef:(id)a3 error:(id *)a4;
+ (int64_t)aes256BitSize;
+ (unint64_t)ccsha384_diSize;
+ (void)contextFree:(void *)a3;
@end

@implementation TPHObjectiveC

+ (id)digestUsingSha384:(id)a3
{
  id v3 = a3;
  ccsha384_di();
  id v4 = [objc_alloc((Class)NSMutableData) initWithLength:*(void *)ccsha384_di()];
  [v3 length];
  id v5 = v3;
  [v5 bytes];

  id v6 = v4;
  [v6 mutableBytes];
  ccdigest();
  v7 = [v6 base64EncodedStringWithOptions:0];

  return v7;
}

+ (int64_t)aes256BitSize
{
  return 2;
}

+ (unint64_t)ccsha384_diSize
{
  return *(void *)ccsha384_di();
}

+ (void)contextFree:(void *)a3
{
}

+ (ccec_full_ctx)ccec384Context
{
  v2 = (ccec_cp *)ccec_cp_384();
  result = (ccec_full_ctx *)malloc_type_malloc((32 * *(void *)v2) | 0x10, 0xA83E42A2uLL);
  result->var0 = v2;
  return result;
}

+ (id)fetchKeyPairWithPrivateKeyPersistentRef:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14[0] = kSecReturnRef;
  v14[1] = kSecClass;
  v15[0] = &__kCFBooleanTrue;
  v15[1] = kSecClassKey;
  v14[2] = kSecValuePersistentRef;
  v15[2] = v5;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  CFTypeRef cf = 0;
  OSStatus v7 = SecItemCopyMatching(v6, &cf);
  if (v7 || (CFTypeID v8 = CFGetTypeID(cf), v8 != SecKeyGetTypeID()))
  {
    if (a4)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:v7 userInfo:0];
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v9 = objc_alloc((Class)_SFECKeyPair);
    id v10 = [v9 initWithSecKey:cf];
    CFTypeRef v11 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v11);
    }
  }

  return v10;
}

@end