@interface NSNumberFormatter(FormatString)
- (BOOL)shouldIgnoreChanges;
- (id)formatString:()FormatString;
- (id)formatString:()FormatString byAppendingExponent:;
- (id)formatString:()FormatString usesGroupingSeparator:;
- (id)formatString:()FormatString usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:;
- (void)ignoreChanges:()FormatString;
@end

@implementation NSNumberFormatter(FormatString)

- (id)formatString:()FormatString usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:
{
  id v13 = a3;
  v14 = a5;
  v15 = a6;
  if ([a1 numberStyle] != 1)
  {
    id v18 = v13;
    goto LABEL_70;
  }
  if ([(__CFString *)v14 length] != 1 || [(__CFString *)v15 length] != 1)
  {

    id v18 = v13;
    v14 = @",";
    v15 = @".";
    goto LABEL_70;
  }
  if (a9)
  {
    v16 = [a1 stringFromNumber:&unk_1F1872440];
    if ([(__CFString *)v16 length] != 1)
    {
      id v17 = v13;
      goto LABEL_13;
    }
  }
  else
  {
    v16 = @"0";
  }
  if ((a4 & 1) != 0 || ![(__CFString *)v16 isEqualToString:@"0"])
  {
    __int16 v61 = [(__CFString *)v14 characterAtIndex:0];
    __int16 v19 = [(__CFString *)v15 characterAtIndex:0];
    int v20 = [(__CFString *)v16 characterAtIndex:0];
    BOOL v24 = v20 != 48 && v20 != 65296 && v20 != 2406 && v20 != 1632;
    BOOL v58 = v24;
    __int16 v59 = v20;
    int v25 = [v13 lengthOfBytesUsingEncoding:2483028224];
    int v26 = v25;
    if (v25 >= 0) {
      int v27 = v25;
    }
    else {
      int v27 = v25 + 1;
    }
    uint64_t v28 = (v27 >> 1);
    v60 = v16;
    uint64_t v29 = v25;
    v30 = malloc_type_calloc(v25, 2uLL, 0x1000040BDFB0063uLL);
    uint64_t v31 = [v13 length];
    uint64_t v32 = v29;
    int v33 = v26;
    objc_msgSend(v13, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v30, v32, 0, 2483028224, 0, 0, v31, 0);
    if (v26 < 2)
    {
      LODWORD(v34) = 0;
      __int16 v35 = v61;
    }
    else
    {
      uint64_t v34 = 0;
      __int16 v35 = v61;
      while (1)
      {
        int v36 = (unsigned __int16)v30[v34];
        if (v36 == 46 || v36 == 101) {
          break;
        }
        if (v28 == ++v34)
        {
          LODWORD(v34) = v28;
          break;
        }
      }
    }
    int v37 = 0x7FFFFFFF;
    if (a4)
    {
      int v57 = v33;
      uint64_t v38 = [a1 groupingSize];
      int v39 = v38;
      if (v38) {
        int v40 = v38;
      }
      else {
        int v40 = 0x7FFFFFFF;
      }
      uint64_t v41 = [a1 secondaryGroupingSize];
      if (v41) {
        int v37 = v41;
      }
      else {
        int v37 = v40;
      }
      if ((int)v34 <= v40)
      {
        int v42 = 0;
        int v39 = v40;
      }
      else
      {
        int v42 = ((v34 + ~v40) & ~(((int)v34 + ~v40) >> 31)) / v37 + 1;
      }
      __int16 v35 = v61;
      int v33 = v57;
    }
    else
    {
      int v42 = 0;
      int v39 = 0x7FFFFFFF;
    }
    int v43 = v42 + v28;
    if (v42 + (int)v28 >= 1)
    {
      char v44 = v34 == v28;
      if (v58) {
        __int16 v45 = 48;
      }
      else {
        __int16 v45 = v59;
      }
      uint64_t v46 = (int)v34 - (uint64_t)(int)v28 + 1;
      v47 = &v30[(int)v28 - 1];
      do
      {
        int v49 = *v47--;
        __int16 v48 = v49;
        unsigned int v50 = v49 - 48;
        if (v49 == 101) {
          __int16 v51 = 101;
        }
        else {
          __int16 v51 = v19;
        }
        if (!v46) {
          __int16 v48 = v51;
        }
        if (v50 <= 9) {
          __int16 v52 = v50 + v45;
        }
        else {
          __int16 v52 = v48;
        }
        BOOL v53 = v43 >= 2;
        unsigned int v54 = v43 - 2;
        v30[--v43] = v52;
        char v55 = !v53;
        if (!(v55 & 1 | ((v44 & 1) == 0)) && !--v39)
        {
          v30[v54] = v35;
          int v39 = v37;
          int v43 = v54;
        }
        v44 |= v46++ == 0;
      }
      while (v43 > 0);
    }
    id v18 = (id)[[NSString alloc] initWithBytesNoCopy:v30 length:v33 + 2 * v42 encoding:2483028224 freeWhenDone:1];
    v16 = v60;
    goto LABEL_69;
  }
  id v17 = [v13 stringByReplacingOccurrencesOfString:@"." withString:v15];
LABEL_13:
  id v18 = v17;
LABEL_69:

LABEL_70:
  return v18;
}

- (void)ignoreChanges:()FormatString
{
  v4 = a3;
  objc_getAssociatedObject(a1, &ignore);
  id value = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &ignore, MEMORY[0x1E4F1CC38], (void *)1);
  v4[2](v4);

  objc_setAssociatedObject(a1, &ignore, value, (void *)1);
}

- (BOOL)shouldIgnoreChanges
{
  v1 = objc_getAssociatedObject(a1, &ignore);
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)formatString:()FormatString byAppendingExponent:
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [a1 stringFromNumber:&unk_1F1872458];
    char v10 = [v9 isEqualToString:@"1"];

    if (v10)
    {
      v11 = objc_opt_new();
      if (a4)
      {
        unint64_t v12 = (int)a4 >= 0 ? a4 : -(int)a4;
        do
        {
          id v13 = [&unk_1F1872890 objectAtIndexedSubscript:v12 % 0xA];
          [v11 addObject:v13];

          BOOL v14 = v12 > 9;
          v12 /= 0xAuLL;
        }
        while (v14);
        if ((a4 & 0x80000000) != 0)
        {
          v15 = [&unk_1F1872890 objectAtIndexedSubscript:10];
          [v11 addObject:v15];
        }
      }
      v16 = [v11 reverseObjectEnumerator];
      id v17 = [v16 allObjects];
      id v18 = [v17 componentsJoinedByString:&stru_1F1868970];

      id v8 = [NSString stringWithFormat:@"%@%@", v7, v18];
    }
    else
    {
      __int16 v19 = NSString;
      int v20 = [NSNumber numberWithInt:a4];
      v21 = [a1 stringFromNumber:v20];
      id v8 = [v19 stringWithFormat:@"%@^%@", v7, v21];
    }
  }

  return v8;
}

- (id)formatString:()FormatString usesGroupingSeparator:
{
  id v6 = a3;
  if ([a1 numberStyle] == 1)
  {
    v7 = [a1 groupingSeparator];
    id v8 = [a1 decimalSeparator];
    LOBYTE(v11) = 1;
    v9 = objc_msgSend(a1, "formatString:usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:", v6, a4, v7, v8, objc_msgSend(a1, "maximumIntegerDigits"), objc_msgSend(a1, "maximumFractionDigits"), v11);
  }
  else
  {
    v7 = [a1 numberFromString:v6];
    v9 = [a1 stringFromNumber:v7];
  }

  return v9;
}

- (id)formatString:()FormatString
{
  id v4 = a3;
  if ([a1 numberStyle] == 1)
  {
    uint64_t v5 = [a1 usesGroupingSeparator];
    id v6 = [a1 groupingSeparator];
    v7 = [a1 decimalSeparator];
    LOBYTE(v10) = 1;
    id v8 = objc_msgSend(a1, "formatString:usesGroupingSeparator:groupingSeparator:decimalSeparator:maximumIntegerDigits:maximumFractionDigits:localizeDigits:", v4, v5, v6, v7, objc_msgSend(a1, "maximumIntegerDigits"), objc_msgSend(a1, "maximumFractionDigits"), v10);
  }
  else
  {
    id v6 = [a1 numberFromString:v4];
    id v8 = [a1 stringFromNumber:v6];
  }

  return v8;
}

@end