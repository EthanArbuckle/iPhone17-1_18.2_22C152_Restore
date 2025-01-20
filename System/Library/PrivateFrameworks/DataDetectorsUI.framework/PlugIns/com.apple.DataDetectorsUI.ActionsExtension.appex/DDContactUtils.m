@interface DDContactUtils
+ (BOOL)phoneNumber:(id)a3 isEqualToPhoneNumber:(id)a4;
+ (id)normalizedPhoneNumberFromString:(id)a3;
@end

@implementation DDContactUtils

+ (BOOL)phoneNumber:(id)a3 isEqualToPhoneNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  unsigned __int8 v9 = 0;
  if (v6 && v7)
  {
    if (v6 == v7)
    {
      unsigned __int8 v9 = 1;
    }
    else if ((unint64_t)[v6 length] >= 5 && (unint64_t)objc_msgSend(v8, "length") > 4)
    {
      v10 = [a1 normalizedPhoneNumberFromString:v6];
      v11 = [a1 normalizedPhoneNumberFromString:v8];
      id v12 = v10;
      id v13 = v11;
      v14 = (char *)[v12 length];
      v15 = (char *)[v13 length];
      if (v14 >= v15) {
        unint64_t v16 = (unint64_t)v15;
      }
      else {
        unint64_t v16 = (unint64_t)v14;
      }
      if (v14 <= v15) {
        unint64_t v17 = (unint64_t)v15;
      }
      else {
        unint64_t v17 = (unint64_t)v14;
      }
      if (v17 && (double)v16 / (double)v17 >= 0.5)
      {
        unint64_t v18 = 0;
        if (v16)
        {
          v19 = v15 - 1;
          v20 = v14 - 1;
          while (1)
          {
            unsigned int v21 = [v12 characterAtIndex:v20];
            if (v21 != [v13 characterAtIndex:v19]) {
              break;
            }
            ++v18;
            --v19;
            --v20;
            if (v16 == v18)
            {
              unint64_t v18 = v16;
              break;
            }
          }
        }
        unsigned __int8 v9 = (double)v18 / (double)v16 >= 0.75;
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
    else
    {
      unsigned __int8 v9 = [v6 isEqualToString:v8];
    }
  }

  return v9;
}

+ (id)normalizedPhoneNumberFromString:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 length];
  if ((unint64_t)(v4 - 31) < 0xFFFFFFFFFFFFFFE2)
  {
    v5 = &stru_10000C548;
    goto LABEL_40;
  }
  id v6 = v4;
  if (([v3 containsString:@"+"] & 1) != 0
    || [v3 containsString:@"＋"])
  {
    id v7 = [v3 stringByReplacingOccurrencesOfString:@"(0)" withString:&stru_10000C548];

    id v6 = [v7 length];
    id v3 = v7;
  }
  __chkstk_darwin();
  unsigned __int8 v9 = (_WORD *)((char *)&v19 - ((v8 + 17) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(v3, "getCharacters:range:", v9, 0, v6);
  if (!v6)
  {
    *unsigned __int8 v9 = 0;
    v5 = &stru_10000C548;
    goto LABEL_40;
  }
  uint64_t v19 = (uint64_t)&v19;
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  do
  {
    unsigned int v12 = (unsigned __int16)v9[v10];
    if (v12 >> 10 == 54)
    {
      if (v10 + 1 >= (unint64_t)v6) {
        goto LABEL_21;
      }
      int v13 = (unsigned __int16)v9[v10 + 1];
      if ((v13 & 0xFC00) != 0xDC00) {
        goto LABEL_21;
      }
      unsigned int v12 = v13 + (v12 << 10) - 56613888;
      ++v10;
LABEL_12:
      if (u_isdigit(v12))
      {
        unsigned int v14 = u_charDigitValue(v12);
        if (v14 > 9) {
          goto LABEL_21;
        }
        LOWORD(v12) = v14 + 48;
        goto LABEL_20;
      }
      if (v12 == 65291)
      {
        LOWORD(v12) = 43;
LABEL_20:
        v9[v11++] = v12;
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if (v12 - 48 < 0xA) {
      goto LABEL_20;
    }
    if (v12 <= 0x2B && ((1 << v12) & 0xC0800000000) != 0) {
      goto LABEL_20;
    }
    if (v12 - 65 <= 0x19)
    {
      if (v12 < 0x57) {
        __int16 v16 = 8;
      }
      else {
        __int16 v16 = 9;
      }
      if (v12 == 83) {
        __int16 v16 = 7;
      }
      unsigned int v17 = (v12 - 65) / 3 + 2;
      if (v12 > 0x52) {
        LOWORD(v17) = v16;
      }
      LOWORD(v12) = v17 + 48;
      goto LABEL_20;
    }
    if (v9[v10]) {
      goto LABEL_12;
    }
LABEL_21:
    ++v10;
  }
  while (v10 < (unint64_t)v6);
  v9[v11] = 0;
  if (v11)
  {
    +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v9, v11, v19);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_10000C548;
  }
LABEL_40:

  return v5;
}

@end