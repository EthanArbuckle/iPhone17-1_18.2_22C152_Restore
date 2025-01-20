@interface NSMutableDictionary(RFC2231Support)
- (void)mf_fixupRFC2231Values;
@end

@implementation NSMutableDictionary(RFC2231Support)

- (void)mf_fixupRFC2231Values
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v1 = [a1 allKeys];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v2)
  {
    id obj = 0;
    uint64_t v3 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v76 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        if ([v5 rangeOfString:@"*"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v6 = obj;
          if (!obj) {
            v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
          }
          id obj = v6;
          [v6 addObject:v5];
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v2);

    if (obj)
    {
      [obj sortUsingSelector:sel_caseInsensitiveCompare_];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id obja = obj;
      uint64_t v7 = [obja countByEnumeratingWithState:&v71 objects:v79 count:16];
      id v8 = 0;
      if (!v7)
      {
        v65 = 0;
        goto LABEL_103;
      }
      v65 = 0;
      unsigned int v63 = -1;
      uint64_t v60 = *(void *)v72;
      CFAllocatorRef bytesDeallocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
      while (1)
      {
        uint64_t v61 = v7;
        uint64_t v9 = 0;
        v10 = v8;
        do
        {
          if (*(void *)v72 != v60) {
            objc_enumerationMutation(obja);
          }
          v11 = *(void **)(*((void *)&v71 + 1) + 8 * v9);
          v68 = [a1 objectForKey:v11];
          uint64_t v12 = [v11 length];
          if (mf_fixupRFC2231Values_onceToken != -1) {
            dispatch_once(&mf_fixupRFC2231Values_onceToken, &__block_literal_global_7);
          }
          v13 = objc_msgSend((id)mf_fixupRFC2231Values_keyRegex, "firstMatchInString:options:range:", v11, 0, 0, v12);
          v14 = v13;
          if (v13 && [v13 range] != 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v14 numberOfRanges] != 3) {
              __assert_rtn("-[NSMutableDictionary(RFC2231Support) mf_fixupRFC2231Values]", "MimeHeaderEncoding.m", 610, "[match numberOfRanges] == 3");
            }
            objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v14, "range"));
            id v67 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v21 = [v14 rangeAtIndex:1];
            uint64_t v23 = v22;
            uint64_t v24 = [v14 rangeAtIndex:2];
            uint64_t v25 = v24;
            uint64_t v27 = v26;
            if (v21 == 0x7FFFFFFFFFFFFFFFLL && v24 == 0x7FFFFFFFFFFFFFFFLL)
            {
              int v62 = -1;
              BOOL v15 = 1;
            }
            else
            {
              int v62 = -1;
              if (v21 != 0x7FFFFFFFFFFFFFFFLL && v23)
              {
                v40 = objc_msgSend(v11, "substringWithRange:", v21, v23);
                int v62 = [v40 intValue];
              }
              BOOL v15 = v25 != 0x7FFFFFFFFFFFFFFFLL && v27 != 0;
            }
          }
          else
          {
            id v67 = v11;
            BOOL v15 = 0;
            int v62 = -1;
          }
          if (v65 && (objc_msgSend(v65, "isEqualToString:") & 1) != 0)
          {
            int v64 = 0;
            if (!v15) {
              goto LABEL_26;
            }
          }
          else
          {
            unsigned int v63 = -1;
            int v64 = 1;
            if (!v15)
            {
LABEL_26:
              id v8 = v68;
              v16 = 0;
              goto LABEL_90;
            }
          }
          uint64_t v18 = [v68 rangeOfString:@"'"];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v19 = [v68 length];
            v16 = 0;
            CFIndex v20 = 0;
          }
          else
          {
            uint64_t v28 = v17;
            uint64_t v29 = objc_msgSend(v68, "rangeOfString:options:range:", @"'", 0, v18 + v28, objc_msgSend(v68, "length") - (v18 + v28));
            uint64_t v31 = v30;
            objc_msgSend(v68, "substringWithRange:", 0, v18);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v32 = [v68 length];
            if (v31) {
              uint64_t v33 = v29;
            }
            else {
              uint64_t v33 = v18;
            }
            if (v31) {
              uint64_t v34 = v31;
            }
            else {
              uint64_t v34 = v28;
            }
            CFIndex v20 = v34 + v33;
            uint64_t v19 = v32 - (v34 + v33);
          }
          if (v64) {
            unsigned int v63 = MFEncodingForCharset(v16);
          }
          int v35 = v63;
          if (v63 == -1) {
            int v35 = 1536;
          }
          unsigned int v63 = v35;
          v36 = v68;
          v37 = v36;
          if ((unint64_t)v19 < 3
            || [(__CFString *)v36 rangeOfString:@"%", 0, v20, v19 - 2 options range] == 0x7FFFFFFFFFFFFFFFLL)
          {
            goto LABEL_88;
          }
          *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v81[2] = v38;
          v81[3] = v38;
          v81[0] = v38;
          v81[1] = v38;
          if ((unint64_t)v19 < 0x41) {
            v39 = (UInt8 *)v81;
          }
          else {
            v39 = (UInt8 *)malloc_type_malloc(v19, 0xC1F0F15BuLL);
          }
          v83.location = v20;
          v83.length = v19;
          if (v19 != MFStringGetBytes(v37, v83, 0x600u, 0, 0, v39, v19, 0) || v19 < 1)
          {
            id v8 = 0;
            goto LABEL_85;
          }
          CFIndex v58 = v20;
          v59 = v37;
          CFIndex v42 = 0;
          unint64_t v43 = (unint64_t)&v39[v19];
          v44 = v39;
          do
          {
            int v45 = *v44;
            if (v45 != 37) {
              goto LABEL_69;
            }
            if ((unint64_t)(v44 + 2) >= v43
              || (unsigned int v46 = (char)v44[1], (v46 & 0x80000000) != 0)
              || (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v46 + 60) & 0x10000) == 0
              || (char)v44[2] < 0
              || (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v44[2] + 60) & 0x10000) == 0)
            {
              LOBYTE(v45) = 37;
LABEL_69:
              ++v44;
              goto LABEL_70;
            }
            __darwin_ct_rune_t v56 = __toupper(v46);
            __darwin_ct_rune_t v47 = __toupper((char)v44[2]);
            if (v56 << 24 <= 956301312) {
              char v48 = -48;
            }
            else {
              char v48 = -55;
            }
            char v49 = v48 + v56;
            if (v47 << 24 <= 956301312) {
              char v50 = -48;
            }
            else {
              char v50 = -55;
            }
            LOBYTE(v45) = v50 + v47 + 16 * v49;
            v44 += 3;
LABEL_70:
            if (&v39[v42] != v44) {
              v39[v42] = v45;
            }
            ++v42;
          }
          while ((unint64_t)v44 < v43);
          if (&v39[v42] == v44)
          {
            id v8 = 0;
            CFIndex v20 = v58;
            v37 = v59;
          }
          else
          {
            v37 = v59;
            CFIndex v20 = v58;
            v57 = (__CFString *)CFDataCreateWithBytesNoCopy(0, v39, v42, bytesDeallocator);
            id v8 = MFCreateStringWithData(v57, v63, 0);
          }
LABEL_85:
          if (v39 != (UInt8 *)v81) {
            free(v39);
          }
          if (!v8)
          {
LABEL_88:
            -[__CFString substringWithRange:](v37, "substringWithRange:", v20, v19);
            id v8 = (id)objc_claimAutoreleasedReturnValue();
          }

LABEL_90:
          if (v8)
          {
            [a1 removeObjectForKey:v11];
            if (v64)
            {
              id v51 = v67;

              v65 = v51;
              [a1 setObject:v8 forKey:v51];
            }
            else if (v62)
            {
              if (v62 >= 1)
              {
                v52 = [a1 objectForKey:v65];
                v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v8, "length") + objc_msgSend(v52, "length"));
                v54 = v53;
                if (v52) {
                  [v53 appendString:v52];
                }
                [v54 appendString:v8];
                [a1 setObject:v54 forKey:v65];
              }
            }
            else
            {
              [a1 setObject:v8 forKey:v65];
            }
          }

          ++v9;
          v10 = v8;
        }
        while (v9 != v61);
        uint64_t v7 = [obja countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (!v7)
        {
LABEL_103:

          v1 = obja;
          goto LABEL_104;
        }
      }
    }
  }
  else
  {
LABEL_104:
  }
}

@end