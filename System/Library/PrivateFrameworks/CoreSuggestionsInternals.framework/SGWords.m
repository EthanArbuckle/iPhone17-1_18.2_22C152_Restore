@interface SGWords
+ (id)normalizeLowercaseWord:(id)a3;
+ (id)normalizeWord:(id)a3;
@end

@implementation SGWords

+ (id)normalizeLowercaseWord:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"SGWords.m", 180, @"Invalid parameter not satisfying: %@", @"word" object file lineNumber description];

    if (isLowercaseAscii(0)) {
      goto LABEL_3;
    }
LABEL_5:
    if (canTurnIntoAscii(v6))
    {
      v9 = fastPathLatinToAsciiTransformation(v6);
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        _PASSimpleICUTransform();
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v11;
    }
    else
    {
      v7 = &stru_1F24EEF20;
    }
    goto LABEL_11;
  }
  if ((isLowercaseAscii(v5) & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  v7 = v6;
LABEL_11:

  return v7;
}

+ (id)normalizeWord:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"SGWords.m", 169, @"Invalid parameter not satisfying: %@", @"word" object file lineNumber description];

    id v5 = 0;
  }
  if (isLowercaseAscii(v5))
  {
LABEL_4:
    v7 = v6;
  }
  else
  {
    if ((unint64_t)[v6 length] <= 4)
    {
      v8 = v6;
      v9 = self;

      if (v9)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        *(_OWORD *)buffer = 0u;
        long long v35 = 0u;
        CFIndex Length = CFStringGetLength(v8);
        CFStringRef theString = v8;
        uint64_t v45 = 0;
        CFIndex v46 = Length;
        CharactersPtr = CFStringGetCharactersPtr(v8);
        CStringPtr = 0;
        v43 = CharactersPtr;
        if (!CharactersPtr) {
          CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
        }
        int64_t v47 = 0;
        int64_t v48 = 0;
        v44 = CStringPtr;
        if (Length >= 1)
        {
          uint64_t v13 = 0;
          int64_t v14 = 0;
          int64_t v15 = 0;
          uint64_t v16 = 64;
          do
          {
            if ((unint64_t)v15 >= 4) {
              uint64_t v17 = 4;
            }
            else {
              uint64_t v17 = v15;
            }
            CFIndex v18 = v46;
            if (v46 <= v15)
            {
              UniChar v19 = 0;
              int v20 = 0;
            }
            else
            {
              if (v43)
              {
                UniChar v19 = v43[v15 + v45];
              }
              else if (v44)
              {
                UniChar v19 = v44[v45 + v15];
              }
              else
              {
                if (v48 <= v15 || v14 > v15)
                {
                  uint64_t v22 = v17 + v13;
                  uint64_t v23 = v16 - v17;
                  int64_t v24 = v15 - v17;
                  CFIndex v25 = v24 + 64;
                  if (v24 + 64 >= v46) {
                    CFIndex v25 = v46;
                  }
                  int64_t v47 = v24;
                  int64_t v48 = v25;
                  if (v46 >= v23) {
                    CFIndex v18 = v23;
                  }
                  v50.length = v18 + v22;
                  v50.location = v24 + v45;
                  CFStringGetCharacters(theString, v50, buffer);
                  int64_t v14 = v47;
                }
                UniChar v19 = buffer[v15 - v14];
              }
              if (v19 <= 0x318Fu)
              {
                if (v19 - 12272 < 0x50 || v19 - 12544 < 0x30)
                {
LABEL_58:

                  goto LABEL_4;
                }
              }
              else if (v19 - 12688 < 0x70 || v19 - 19904 < 0x40)
              {
                goto LABEL_58;
              }
              if ((v19 & 0xFF80) == 0x2E80) {
                goto LABEL_58;
              }
              int v20 = v19;
            }
            if ((v20 - 12032) < 0xE0
              || (v20 - 12352) < 0x60
              || (v20 - 12448) < 0x60
              || (v20 - 12592) < 0x60
              || (v19 & 0xFE00 | 0x100) == 0x3300
              || (v20 - 13312) >> 6 < 0x67
              || (v20 - 19968) >> 9 < 0x29)
            {
              goto LABEL_58;
            }
            ++v15;
            --v13;
            ++v16;
          }
          while (Length != v15);
        }
      }
    }
    v26 = (void *)MEMORY[0x1CB79B230]();
    v27 = [v6 lowercaseString];

    if (!isLowercaseAscii(v27))
    {
      if (canTurnIntoAscii(v27))
      {
        v30 = fastPathLatinToAsciiTransformation(v27);
        v31 = v30;
        if (v30)
        {
          v32 = v30;
        }
        else
        {
          _PASSimpleICUTransform();
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v28 = v32;
      }
      else
      {
        v28 = &stru_1F24EEF20;
      }
      goto LABEL_51;
    }
    v7 = v27;
  }
  v27 = v7;
  v28 = v7;
LABEL_51:

  return v28;
}

@end