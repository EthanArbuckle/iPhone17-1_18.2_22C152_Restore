@interface NSString(MimeCharsetSupport)
- (id)_mf_bestMimeCharset:()MimeCharsetSupport;
- (id)mf_bestMimeCharsetForMessageDeliveryUsingSubtype:()MimeCharsetSupport;
- (id)mf_bestMimeCharsetUsingHint:()MimeCharsetSupport;
- (uint64_t)mf_bestMimeCharset;
@end

@implementation NSString(MimeCharsetSupport)

- (uint64_t)mf_bestMimeCharset
{
  return objc_msgSend(a1, "mf_bestMimeCharsetUsingHint:", 0xFFFFFFFFLL);
}

- (id)_mf_bestMimeCharset:()MimeCharsetSupport
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    BOOL CanBeConvertedLosslessly = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if (!objc_msgSend(v10, "coversLargeUnicodeSubset", (void)v14)) {
        goto LABEL_12;
      }
      if ((v7 & 1) == 0) {
        BOOL CanBeConvertedLosslessly = MFStringCanBeConvertedLosslessly(a1, 0);
      }
      char v7 = 1;
      if (!CanBeConvertedLosslessly) {
        break;
      }
      BOOL CanBeConvertedLosslessly = 1;
LABEL_15:
      if (v5 == ++v9)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    BOOL CanBeConvertedLosslessly = 0;
LABEL_12:
    if ([v10 cfStringEncoding] != 1586
      && MFStringCanBeConvertedLosslessly(a1, [v10 cfStringEncoding]))
    {
      id v11 = v10;
      if (v11)
      {
        v12 = v11;
        goto LABEL_19;
      }
    }
    goto LABEL_15;
  }
LABEL_17:
  v12 = 0;
LABEL_19:

  return v12;
}

- (id)mf_bestMimeCharsetUsingHint:()MimeCharsetSupport
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v28 = +[MFMimeCharset allMimeCharsets];
  uint64_t v5 = objc_msgSend(a1, "_mf_bestMimeCharset:", v28);
  v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 encoding] != 134217984 || a3 == -1;
    if (!v7 && a3 != 134217984)
    {
      unint64_t v10 = _indexOfEncodingInCharsets(0x8000100u, v28);
      unint64_t v11 = _indexOfEncodingInCharsets(a3, v28);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11 != 0x7FFFFFFFFFFFFFFFLL && v11 > v10)
      {
        v27 = +[MFMimeCharset charsetForEncoding:a3];
        v12 = [v27 primaryLanguage];
        v26 = v12;
        if (v12)
        {
          id v25 = v28;
          id v13 = v12;
          if ([v13 length])
          {
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v14 = v25;
            id v15 = 0;
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v30 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  v20 = objc_msgSend(v19, "primaryLanguage", v25, v26);
                  v21 = v20;
                  if (v20 && [v20 isEqualToString:v13])
                  {
                    if (!v15)
                    {
                      id v15 = [MEMORY[0x1E4F1CA48] array];
                    }
                    [v15 addObject:v19];
                  }
                  else
                  {
                    [0 addObject:v19];
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
              }
              while (v16);
            }
          }
          else
          {
            id v15 = v25;
          }

          v22 = objc_msgSend(a1, "_mf_bestMimeCharset:", v15);
          v23 = v22;
          if (v22)
          {
            id v24 = v22;

            v6 = v24;
          }
        }
      }
    }
  }

  return v6;
}

- (id)mf_bestMimeCharsetForMessageDeliveryUsingSubtype:()MimeCharsetSupport
{
  id v4 = a3;
  if ([v4 isEqualToString:@"html"]) {
    +[MFMimeCharset charsetForEncoding:134217984];
  }
  else {
  uint64_t v5 = objc_msgSend(a1, "mf_bestMimeCharset");
  }

  return v5;
}

@end