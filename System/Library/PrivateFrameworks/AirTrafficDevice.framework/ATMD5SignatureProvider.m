@interface ATMD5SignatureProvider
- (id)createSignature:(id *)a3 forData:(id)a4;
- (id)verifySignature:(id)a3 forData:(id)a4;
@end

@implementation ATMD5SignatureProvider

- (id)verifySignature:(id)a3 forData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    v7 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x45F5624AuLL);
    id v8 = v6;
    CC_MD5((const void *)[v8 bytes], objc_msgSend(v8, "length"), v7);
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:16 freeWhenDone:1];
    if ([v9 isEqualToData:v5])
    {
      v10 = 0;
    }
    else
    {
      v11 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D9A2D000, v11, OS_LOG_TYPE_ERROR, "failed to verify signature", v13, 2u);
      }

      v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
    }
  }
  else if ([v6 length] || objc_msgSend(v5, "length"))
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:4 userInfo:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createSignature:(id *)a3 forData:(id)a4
{
  id v5 = a4;
  id v6 = (id)[v5 length];
  if (v6)
  {
    v7 = (unsigned __int8 *)malloc_type_malloc(0x10uLL, 0x6BEEF075uLL);
    id v8 = v5;
    CC_MD5((const void *)[v8 bytes], objc_msgSend(v8, "length"), v7);
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:16 freeWhenDone:1];
  }
  *a3 = v6;

  return 0;
}

@end