@interface NSString(NameDecomposition)
+ (id)CUIK_attendeeNameExtensions;
+ (id)CUIK_attendeePartialSurnames;
- (__CFString)CUIK_attendeeTrimCommasSpacesQuotes;
- (uint64_t)CUIK_attendeeAppearsToBeAnInitial;
- (void)CUIK_attendeeFirstName:()NameDecomposition middleName:lastName:extension:;
@end

@implementation NSString(NameDecomposition)

+ (id)CUIK_attendeeNameExtensions
{
  v0 = (void *)CUIK_attendeeNameExtensions_nameExtensions;
  if (!CUIK_attendeeNameExtensions_nameExtensions)
  {
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"jr.", @"sr.", @"iii", @"m.d.", @"md", @"d.d.s.", @"dds", @"ph.d.", @"phd", @"m.b.a.", @"mba", @"esq.", @"esq", @"jr", @"sr", @"ii", @"iv",
           @"v",
           @"vi",
           @"vii",
           @"viii",
           @"ix",
           0);
    v2 = (void *)CUIK_attendeeNameExtensions_nameExtensions;
    CUIK_attendeeNameExtensions_nameExtensions = v1;

    v0 = (void *)CUIK_attendeeNameExtensions_nameExtensions;
  }

  return v0;
}

+ (id)CUIK_attendeePartialSurnames
{
  v0 = (void *)CUIK_attendeePartialSurnames_partialSurnames;
  if (!CUIK_attendeePartialSurnames_partialSurnames)
  {
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"de", @"den", @"der", @"di", @"do", @"du", @"la", @"le", @"les", @"van", @"von", 0);
    v2 = (void *)CUIK_attendeePartialSurnames_partialSurnames;
    CUIK_attendeePartialSurnames_partialSurnames = v1;

    v0 = (void *)CUIK_attendeePartialSurnames_partialSurnames;
  }

  return v0;
}

- (uint64_t)CUIK_attendeeAppearsToBeAnInitial
{
  uint64_t v2 = [a1 length];
  if (v2 == 1) {
    return 1;
  }
  if (v2 != 2) {
    return 0;
  }
  uint64_t v3 = 1;
  if ([a1 characterAtIndex:1] != 46)
  {
    uint64_t v3 = 1;
    if ([a1 characterAtIndex:1] != 93) {
      return 0;
    }
  }
  return v3;
}

- (__CFString)CUIK_attendeeTrimCommasSpacesQuotes
{
  if ([&unk_1F18921E0 containsObject:a1])
  {
    uint64_t v2 = (__CFString *)[a1 copy];
    goto LABEL_27;
  }
  uint64_t v3 = [a1 length];
  if (!v3) {
    goto LABEL_24;
  }
  uint64_t v4 = v3;
  __int16 v5 = [a1 characterAtIndex:0];
  char v6 = 0;
  unint64_t v7 = v4 - 1;
  uint64_t v8 = 1;
  while (v5 == 32 || v5 == 44)
  {
LABEL_9:
    if (v4 == v8)
    {
      unint64_t v9 = v4 - 1;
      goto LABEL_13;
    }
    __int16 v5 = [a1 characterAtIndex:v8++];
  }
  if (v5 == 34)
  {
    v6 ^= 1u;
    goto LABEL_9;
  }
  unint64_t v9 = v8 - 1;
LABEL_13:
  char v10 = 0;
  while (1)
  {
    int v11 = [a1 characterAtIndex:v7];
    if (v11 != 32 && v11 != 44)
    {
      if (v11 != 34) {
        break;
      }
      v10 ^= 1u;
    }
    if (!v7) {
      break;
    }
    --v7;
  }
  if (v9 >= v7)
  {
LABEL_24:
    uint64_t v2 = &stru_1F187C430;
    goto LABEL_27;
  }
  objc_msgSend(a1, "substringWithRange:", v9, v7 - v9 + 1);
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10 & 1 | ((v6 & 1) == 0))
  {
    if (!(v6 & 1 | ((v10 & 1) == 0)))
    {
      v12 = @"%@\"";
      goto LABEL_26;
    }
  }
  else
  {
    v12 = @"\"%@";
LABEL_26:
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", v12, v2);

    uint64_t v2 = (__CFString *)v13;
  }
LABEL_27:

  return v2;
}

- (void)CUIK_attendeeFirstName:()NameDecomposition middleName:lastName:extension:
{
  id v56 = a1;
  if (![v56 length])
  {
    v20 = 0;
    v21 = 0;
    char v10 = 0;
    v22 = 0;
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
    goto LABEL_50;
  }
  char v10 = [v56 componentsSeparatedByString:@","];
  if ((unint64_t)[v10 count] > 2) {
    goto LABEL_6;
  }
  if ([v10 count] != 2) {
    goto LABEL_5;
  }
  int v11 = objc_msgSend(NSString, "CUIK_attendeeNameExtensions");
  v12 = [v10 lastObject];
  uint64_t v13 = objc_msgSend(v12, "CUIK_attendeeTrimCommasSpacesQuotes");
  v14 = [v13 lowercaseString];
  char v15 = [v11 containsObject:v14];

  if ((v15 & 1) == 0)
  {
LABEL_6:
    if ((unint64_t)[v10 count] < 3)
    {
      v23 = NSString;
      v17 = [v10 objectAtIndex:1];
      v18 = [v10 objectAtIndex:0];
      [v23 stringWithFormat:@"%@ %@", v17, v18];
    }
    else
    {
      v17 = (void *)[v10 mutableCopy];
      v18 = [v17 objectAtIndexedSubscript:0];
      v19 = [v17 objectAtIndexedSubscript:1];
      [v17 setObject:v19 atIndexedSubscript:0];

      [v17 setObject:v18 atIndexedSubscript:1];
      [v17 componentsJoinedByString:@" "];
    uint64_t v24 = };

    v16 = (void *)v24;
  }
  else
  {
LABEL_5:
    v16 = v56;
  }
  v54 = a4;
  v55 = a3;
  id v56 = v16;
  v21 = [v16 componentsSeparatedByString:@" "];
  uint64_t v25 = [v21 count];
  v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v25];
  v22 = 0;
  if (v25)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      v27 = v22;
      v22 = [v21 objectAtIndex:i];

      if (([v22 isEqualToString:&stru_1F187C430] & 1) == 0)
      {
        v28 = objc_msgSend(v22, "CUIK_attendeeTrimCommasSpacesQuotes");
        if ([v28 length]) {
          [v20 addObject:v28];
        }
      }
    }
  }
  uint64_t v29 = [v20 count];
  if (v29 == 2)
  {
    [v20 objectAtIndex:0];
    v30 = v55;
    *v55 = (id)objc_claimAutoreleasedReturnValue();
    void *v54 = 0;
    *a5 = [v20 objectAtIndex:1];
  }
  else
  {
    v30 = v55;
    if (v29 != 1)
    {
      if (v29)
      {
        v31 = [v20 lastObject];
        v32 = objc_msgSend(NSString, "CUIK_attendeeNameExtensions");
        v33 = [v31 lowercaseString];
        int v34 = [v32 containsObject:v33];

        v53 = v31;
        if (v34)
        {
          *a6 = v31;
          [v20 removeLastObject];
        }
        else
        {
          *a6 = 0;
        }
        if ((unint64_t)([v20 count] - 3) > 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = 0;
        }
        else
        {
          v35 = 0;
          unint64_t v36 = 1;
          do
          {
            v37 = v22;
            v22 = [v20 objectAtIndex:v36];

            v38 = objc_msgSend(NSString, "CUIK_attendeePartialSurnames");
            v39 = [v22 lowercaseString];
            char v40 = [v38 containsObject:v39];

            if (v40)
            {
              v41 = NSString;
              v42 = [v20 objectAtIndex:v36 + 1];
              uint64_t v43 = [v41 stringWithFormat:@"%@ %@", v22, v42];

              [v20 replaceObjectAtIndex:v36 withObject:v43];
              [v20 removeObjectAtIndex:++v36];
              v35 = (void *)v43;
            }
            else
            {
              ++v36;
            }
          }
          while (v36 < [v20 count] - 1);
        }
        unint64_t v44 = [v20 count];
        if (v44 < 4)
        {
          [v20 lastObject];
          v48 = v53;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v30 = v55;
        }
        else
        {
          v45 = [v20 objectAtIndex:v44 - 2];

          char v46 = objc_msgSend(v45, "CUIK_attendeeAppearsToBeAnInitial");
          v47 = [v20 lastObject];
          v48 = v47;
          v30 = v55;
          if (v46)
          {
            *a5 = v47;
            v48 = v53;
          }
          else
          {

            *a5 = [NSString stringWithFormat:@"%@ %@", v45, v48];
            [v20 removeLastObject];
          }
          v22 = v45;
        }
        [v20 removeLastObject];
        *v30 = [v20 objectAtIndex:0];
        [v20 removeObjectAtIndex:0];
        if ([v20 count])
        {
          int v49 = CurrentLocaleExpectsMultipleFamilyNames();
          v50 = [v20 componentsJoinedByString:@" "];
          v51 = v50;
          if (v49)
          {
            *a5 = [v50 stringByAppendingFormat:@" %@", *a5];
          }
          else
          {
            void *v54 = v50;
          }
        }
        else
        {
          void *v54 = 0;
        }

        goto LABEL_48;
      }
      *v55 = 0;
      void *v54 = 0;
      *a5 = 0;
      *a6 = 0;
    }
    *v55 = v56;
    void *v54 = 0;
    *a5 = 0;
  }
  *a6 = 0;
LABEL_48:
  if (CurrentLocaleExpectsSurnameFirst())
  {
    v52 = *v30;
    *v30 = *a5;
    *a5 = v52;
  }
LABEL_50:
}

@end