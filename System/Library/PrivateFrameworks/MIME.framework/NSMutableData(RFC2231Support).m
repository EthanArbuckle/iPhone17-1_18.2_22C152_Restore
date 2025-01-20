@interface NSMutableData(RFC2231Support)
- (void)mf_appendRFC2231CompliantValue:()RFC2231Support forKey:;
@end

@implementation NSMutableData(RFC2231Support)

- (void)mf_appendRFC2231CompliantValue:()RFC2231Support forKey:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  v33 = v6;
  if (v6 && v7)
  {
    id v30 = v7;
    v32 = [v7 dataUsingEncoding:1 allowLossyConversion:1];
    if (mf_appendRFC2231CompliantValue_forKey__onceToken != -1) {
      dispatch_once(&mf_appendRFC2231CompliantValue_forKey__onceToken, &__block_literal_global_56);
    }
    CFIndex v8 = [(__CFString *)v6 length];
    v40.location = 0;
    v40.length = v8;
    if (CFStringFindCharacterFromSet(v33, (CFCharacterSetRef)mf_appendRFC2231CompliantValue_forKey__specialCSet, v40, 0, 0))
    {
      v9 = [(__CFString *)v33 mf_bestMimeCharset];
      CFStringEncoding v31 = [v9 cfStringEncoding];
      v10 = [v9 charsetName];
    }
    else
    {
      v10 = 0;
      CFStringEncoding v31 = 1536;
    }
    if (v8 >= 1)
    {
      CFIndex v11 = 0;
      int v12 = -1;
      while (1)
      {
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v37[2] = v13;
        v37[3] = v13;
        v37[0] = v13;
        v37[1] = v13;
        CFIndex v35 = 0xAAAAAAAAAAAAAAAALL;
        v39.location = v11;
        v39.length = v8;
        CFIndex Bytes = MFStringGetBytes(v33, v39, v31, 0, 0, (UInt8 *)v37, 64, &v35);
        objc_msgSend(a1, "mf_appendCString:", ";\n\t");
        [a1 appendData:v32];
        if (v8 > Bytes || (v12 & 0x80000000) == 0)
        {
          memset(v36, 170, 20);
          [a1 appendBytes:"*" length:1];
          objc_msgSend(a1, "appendBytes:length:", v36, __snprintf_chk(v36, 0x14uLL, 0, 0x14uLL, "%d", ++v12));
        }
        uint64_t v34 = v8 - Bytes;
        uint64_t v15 = v35;
        v16 = (unsigned __int8 *)v37 + v35;
        if (v10) {
          break;
        }
        if (!mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet)
        {
          uint64_t v22 = [objc_alloc(MEMORY[0x1E4F60D38]) initWithCString:" ()<>@,;:\\\"/[]?="];
          v23 = (void *)mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet;
          mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet = v22;

          uint64_t v24 = [objc_alloc(MEMORY[0x1E4F60D38]) initWithCString:"\"\\""];
          v25 = (void *)mf_appendRFC2231CompliantValue_forKey__mimeNeedsEscapeByteSet;
          mf_appendRFC2231CompliantValue_forKey__mimeNeedsEscapeByteSet = v24;
        }
        [a1 appendBytes:"=" length:1];
        if (v15 >= 1)
        {
          v26 = (unsigned __int8 *)v37;
          while (![(id)mf_appendRFC2231CompliantValue_forKey__mimeNeedsQuoteByteSet byteIsMember:*v26])
          {
            if (++v26 >= v16)
            {
              id v20 = 0;
              goto LABEL_27;
            }
          }
          id v20 = (id)mf_appendRFC2231CompliantValue_forKey__mimeNeedsEscapeByteSet;
          [a1 appendBytes:"\"" length:1];
          goto LABEL_27;
        }
        id v20 = 0;
LABEL_41:
        CFIndex v8 = v34;

        v11 += Bytes;
        if (v34 <= 0) {
          goto LABEL_42;
        }
      }
      v17 = (void *)mf_appendRFC2231CompliantValue_forKey__percentEscapeSet;
      if (!mf_appendRFC2231CompliantValue_forKey__percentEscapeSet)
      {
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F60DB0]), "initWithRange:", 97, 26);
        objc_msgSend(v18, "addBytesInRange:", 48, 10);
        objc_msgSend(v18, "addBytesInRange:", 65, 26);
        objc_msgSend(v18, "addBytesInRange:", 47, 1);
        objc_msgSend(v18, "addBytesInRange:", 46, 1);
        [v18 invert];
        v19 = (void *)mf_appendRFC2231CompliantValue_forKey__percentEscapeSet;
        mf_appendRFC2231CompliantValue_forKey__percentEscapeSet = (uint64_t)v18;

        v17 = (void *)mf_appendRFC2231CompliantValue_forKey__percentEscapeSet;
      }
      id v20 = v17;
      [a1 appendBytes:"*=" length:2];
      if (v12 <= 0)
      {
        v21 = [v10 dataUsingEncoding:1 allowLossyConversion:1];
        [a1 appendData:v21];

        objc_msgSend(a1, "mf_appendCString:", "''");
      }
LABEL_27:
      if (v15 >= 1)
      {
        v27 = v37;
        v28 = (unsigned __int8 *)v37;
        v29 = (unsigned __int8 *)v37;
        do
        {
          if ([v20 byteIsMember:*v28])
          {
            if (v28 > v29)
            {
              [a1 appendBytes:v29 length:(char *)v27 - (char *)v29];
              v29 = v28;
            }
            if (v10)
            {
              *(_DWORD *)v36 = -1431655766;
              objc_msgSend(a1, "appendBytes:length:", v36, __snprintf_chk(v36, 4uLL, 0, 4uLL, "%%%02X", *v28));
              ++v29;
            }
            else
            {
              [a1 appendBytes:"\\"" length:1];
            }
          }
          ++v28;
          v27 = (_OWORD *)((char *)v27 + 1);
        }
        while (v28 < v16);
        if (v28 > v29) {
          [a1 appendBytes:v29 length:(char *)v27 - (char *)v29];
        }
      }
      if (!v10 && v20) {
        [a1 appendBytes:"\"" length:1];
      }
      goto LABEL_41;
    }
LABEL_42:

    id v7 = v30;
  }
}

@end