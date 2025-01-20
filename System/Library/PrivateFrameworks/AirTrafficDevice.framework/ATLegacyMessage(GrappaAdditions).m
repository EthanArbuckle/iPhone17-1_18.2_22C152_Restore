@interface ATLegacyMessage(GrappaAdditions)
+ (id)signedMessageWithName:()GrappaAdditions parameters:sesssion:;
@end

@implementation ATLegacyMessage(GrappaAdditions)

+ (id)signedMessageWithName:()GrappaAdditions parameters:sesssion:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v9 = [MEMORY[0x1E4F4A2C0] messageWithName:v7 parameters:v8];
  CFDataRef Data = CFPropertyListCreateData(0, v8, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data)
  {
LABEL_10:
    id v17 = v9;
    goto LABEL_11;
  }
  CFDataRef v11 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  CFIndex Length = CFDataGetLength(v11);
  jumT7rcoieclCtxS2rgJ(a5, (uint64_t)BytePtr, Length, (uint64_t)&v22);
  int v15 = v14;
  CFRelease(v11);
  if (!v15)
  {
    v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:0];
    [v9 setSig:v18];

    X5EvIJWqdcALcjaxX6Pl(v22);
    v19 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v9 sig];
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "Signed message with sig: %{public}@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v16 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v24) = v15;
    _os_log_impl(&dword_1D9A2D000, v16, OS_LOG_TYPE_ERROR, "Grappa message sign fail: %d", buf, 8u);
  }

  if (v15 == -42180) {
    exit(-10);
  }
  id v17 = 0;
LABEL_11:

  return v17;
}

@end