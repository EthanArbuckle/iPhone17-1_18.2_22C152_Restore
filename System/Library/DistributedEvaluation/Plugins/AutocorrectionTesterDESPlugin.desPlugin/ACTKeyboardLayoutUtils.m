@interface ACTKeyboardLayoutUtils
- (ACTKeyboardLayoutUtils)initWithLocale:(id)a3;
- (NSMutableDictionary)keyOverrides;
- (id)alternativeKeyForString:(id)a3 keyplane:(id)a4 preferBaseKeyVariants:(BOOL)a5 preferManualShift:(BOOL)a6 substituteUpperCaseForLowerCase:(BOOL)a7;
- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 isRetyping:(BOOL)a6 preferBaseKeyVariants:(BOOL)a7 preferManualShift:(BOOL)a8 substituteUpperCaseForLowerCase:(BOOL)a9;
- (id)baseKeyForString:(id)a3;
- (id)createTTKPlane:(id)a3;
- (id)exactKeyForString:(id)a3 keyplane:(id)a4;
- (id)exactKeyForString:(id)a3 keyplane:(id)a4 includeSecondaryStrings:(BOOL)a5;
- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4;
- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4 includeSecondaryStrings:(BOOL)a5;
- (id)substitutesForKey:(id)a3 preferBaseKeyVariants:(BOOL)a4 preferManualShift:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6;
- (void)setLayoutKeyOverride:(id)a3 forKey:(id)a4 uiKeyboardStringNothing:(id)a5;
@end

@implementation ACTKeyboardLayoutUtils

- (ACTKeyboardLayoutUtils)initWithLocale:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACTKeyboardLayoutUtils;
  v6 = [(ACTKeyboardLayoutUtils *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    keyOverrides = v6->_keyOverrides;
    v6->_keyOverrides = v7;

    objc_storeStrong((id *)&v6->_locale, a3);
  }

  return v6;
}

- (void)setLayoutKeyOverride:(id)a3 forKey:(id)a4 uiKeyboardStringNothing:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v12)
  {
    unsigned int v10 = [v12 isEqualToString:v9];
    keyOverrides = self->_keyOverrides;
    if (v10) {
      [(NSMutableDictionary *)keyOverrides removeObjectForKey:v8];
    }
    else {
      [(NSMutableDictionary *)keyOverrides setObject:v12 forKey:v8];
    }
  }
}

- (id)createTTKPlane:(id)a3
{
  id v4 = a3;
  id v5 = [[TTKKeyboardPlane alloc] initWithUIKBTree:v4 layoutUtils:self];

  return v5;
}

- (id)baseKeyForString:(id)a3
{
  v3 = [a3 decomposedStringWithCanonicalMapping];
  if ((unint64_t)[v3 length] < 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 substringToIndex:1];
  }

  return v4;
}

- (id)substitutesForKey:(id)a3 preferBaseKeyVariants:(BOOL)a4 preferManualShift:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = +[NSMutableArray array];
  if ([v10 length] == (char *)&def_3B118 + 1)
  {
    if (v8)
    {
      id v12 = [(ACTKeyboardLayoutUtils *)self baseKeyForString:v10];
      if (v12) {
        [v11 addObject:v12];
      }
    }
    id v13 = [v10 characterAtIndex:0];
    v14 = +[NSCharacterSet uppercaseLetterCharacterSet];
    LODWORD(v13) = [v14 characterIsMember:v13];

    if (v13 && !a5)
    {
      v15 = [v10 lowercaseStringWithLocale:self->_locale];
      [v11 addObject:v15];
      if (v8)
      {
        v16 = [(ACTKeyboardLayoutUtils *)self baseKeyForString:v15];
        if (v16) {
          [v11 addObject:v16];
        }
      }
    }
    if (v6)
    {
      id v17 = [v10 characterAtIndex:0];
      v18 = +[NSCharacterSet lowercaseLetterCharacterSet];
      LODWORD(v17) = [v18 characterIsMember:v17];

      if (v17)
      {
        v19 = [v10 uppercaseStringWithLocale:self->_locale];
        [v11 addObject:v19];
        if (v8)
        {
          v20 = [(ACTKeyboardLayoutUtils *)self baseKeyForString:v19];
          if (v20) {
            [v11 addObject:v20];
          }
        }
      }
    }
    if (v8)
    {
      if ([v10 isEqualToString:@"ı"])
      {
        CFStringRef v21 = @"i";
      }
      else
      {
        if (![v10 isEqualToString:@"İ"]) {
          goto LABEL_26;
        }
        CFStringRef v21 = @"I";
      }
      [v11 addObject:v21];
    }
  }
LABEL_26:

  return v11;
}

- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4 includeSecondaryStrings:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [v8 representedString];
  if ([v8 displayType] == 7 && (unint64_t)objc_msgSend(v9, "length") >= 2)
  {
    if (a4) {
      [v9 substringFromIndex:1];
    }
    else {
      [v9 substringToIndex:1];
    }
    id v9 = v13 = v9;
    goto LABEL_19;
  }
  id v10 = [v8 name];
  unsigned int v11 = [v10 isEqualToString:@"Latin-Accents"];

  if (!v11)
  {
    if (!v5) {
      goto LABEL_20;
    }
    if ([v8 displayType] != 7
      || ([v8 secondaryRepresentedStrings],
          v15 = objc_claimAutoreleasedReturnValue(),
          id v16 = [v15 count],
          v15,
          !v16))
    {
      if ([v8 displayType]) {
        goto LABEL_20;
      }
      id v17 = [v8 secondaryRepresentedStrings];
      id v18 = [v17 count];

      if (!v18) {
        goto LABEL_20;
      }
    }
    id v13 = [v8 secondaryRepresentedStrings];
    id v14 = [v13 firstObject];
    goto LABEL_18;
  }
  id v12 = [(NSMutableDictionary *)self->_keyOverrides objectForKeyedSubscript:UIKeyboardKeyAccent];
  id v13 = v12;
  if (v12)
  {
    if ([v12 length] == (char *)&def_3B118 + 2)
    {
      id v14 = [v13 substringToIndex:1];
    }
    else
    {
      id v14 = v13;
    }
LABEL_18:
    id v19 = v14;

    id v9 = v19;
  }
LABEL_19:

LABEL_20:

  return v9;
}

- (id)representedStringForKey:(id)a3 shifted:(BOOL)a4
{
  return [(ACTKeyboardLayoutUtils *)self representedStringForKey:a3 shifted:a4 includeSecondaryStrings:0];
}

- (id)exactKeyForString:(id)a3 keyplane:(id)a4 includeSecondaryStrings:(BOOL)a5
{
  BOOL v23 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [v8 keys];
    id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v15 = -[ACTKeyboardLayoutUtils representedStringForKey:shifted:includeSecondaryStrings:](self, "representedStringForKey:shifted:includeSecondaryStrings:", v14, [v9 isShiftKeyplane], v23);
          if ([v7 isEqualToString:v15]) {
            goto LABEL_13;
          }
          id v16 = [v14 name];
          unsigned int v17 = [v16 hasPrefix:@"TenKey-Chinese-Pinyin"];

          if (v17)
          {
            id v18 = [v14 displayString];
            id v19 = [v18 rangeOfString:v7 options:1];

            if (v19 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_13:
              id v20 = v14;

              goto LABEL_14;
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v20 = 0;
LABEL_14:
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)exactKeyForString:(id)a3 keyplane:(id)a4
{
  return [(ACTKeyboardLayoutUtils *)self exactKeyForString:a3 keyplane:a4 includeSecondaryStrings:0];
}

- (id)alternativeKeyForString:(id)a3 keyplane:(id)a4 preferBaseKeyVariants:(BOOL)a5 preferManualShift:(BOOL)a6 substituteUpperCaseForLowerCase:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  if (a3)
  {
    [(ACTKeyboardLayoutUtils *)self substitutesForKey:a3 preferBaseKeyVariants:v9 preferManualShift:v8 substituteUpperCaseForLowerCase:v7];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = -[ACTKeyboardLayoutUtils exactKeyForString:keyplane:](self, "exactKeyForString:keyplane:", *(void *)(*((void *)&v21 + 1) + 8 * i), v12, (void)v21);
          if (v18)
          {
            id v19 = (void *)v18;
            goto LABEL_12;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
    id v19 = 0;
LABEL_12:
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 isRetyping:(BOOL)a6 preferBaseKeyVariants:(BOOL)a7 preferManualShift:(BOOL)a8 substituteUpperCaseForLowerCase:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  unsigned int v17 = [(ACTKeyboardLayoutUtils *)self exactKeyForString:v15 keyplane:v16 includeSecondaryStrings:v12];
  if (!v17 && !a6)
  {
    unsigned int v17 = [(ACTKeyboardLayoutUtils *)self alternativeKeyForString:v15 keyplane:v16 preferBaseKeyVariants:v10 preferManualShift:v9 substituteUpperCaseForLowerCase:a9];
  }

  return v17;
}

- (NSMutableDictionary)keyOverrides
{
  return self->_keyOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyOverrides, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end