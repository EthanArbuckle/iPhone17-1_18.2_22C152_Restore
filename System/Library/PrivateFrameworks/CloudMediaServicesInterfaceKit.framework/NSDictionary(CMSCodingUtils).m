@interface NSDictionary(CMSCodingUtils)
- (BOOL)cmsBoolForKey:()CMSCodingUtils withDefault:;
- (double)cmsDoubleForKey:()CMSCodingUtils withDefault:;
- (id)cmsOptionalArrayOfClass:()CMSCodingUtils forKey:;
- (id)cmsOptionalArrayOfDecodedClass:()CMSCodingUtils forKey:;
- (id)cmsOptionalDateForKey:()CMSCodingUtils;
- (id)cmsOptionalDecodedClass:()CMSCodingUtils forKey:;
- (id)cmsOptionalDictionaryForKey:()CMSCodingUtils;
- (id)cmsOptionalNumberForKey:()CMSCodingUtils;
- (id)cmsOptionalStringForKey:()CMSCodingUtils;
- (id)cmsOptionalURLForKey:()CMSCodingUtils relativeToURL:;
- (uint64_t)cmsIntegerForKey:()CMSCodingUtils withDefault:;
- (uint64_t)cmsOptionalBoolForKey:()CMSCodingUtils;
- (uint64_t)cmsUnsignedForKey:()CMSCodingUtils withDefault:;
@end

@implementation NSDictionary(CMSCodingUtils)

- (BOOL)cmsBoolForKey:()CMSCodingUtils withDefault:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 compare:MEMORY[0x263EFFA80]];
LABEL_6:
      a4 = v6 != 0;
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 integerValue];
      goto LABEL_6;
    }
  }
LABEL_7:

  return a4;
}

- (uint64_t)cmsOptionalBoolForKey:()CMSCodingUtils
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = MEMORY[0x263EFFA80];
    if ([v1 compare:MEMORY[0x263EFFA80]]) {
      uint64_t v2 = MEMORY[0x263EFFA88];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)cmsOptionalNumberForKey:()CMSCodingUtils
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)cmsIntegerForKey:()CMSCodingUtils withDefault:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (uint64_t)cmsUnsignedForKey:()CMSCodingUtils withDefault:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = [v5 unsignedIntegerValue];
  }

  return a4;
}

- (double)cmsDoubleForKey:()CMSCodingUtils withDefault:
{
  v3 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v3 doubleValue];
    a2 = v4;
  }

  return a2;
}

- (id)cmsOptionalStringForKey:()CMSCodingUtils
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)cmsOptionalURLForKey:()CMSCodingUtils relativeToURL:
{
  id v6 = a4;
  v7 = [a1 objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6) {
      [NSURL URLWithString:v7 relativeToURL:v6];
    }
    else {
    id v8 = [NSURL URLWithString:v7];
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_12:
    v9 = v8;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v7 URL];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_13;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)cmsOptionalDateForKey:()CMSCodingUtils
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = cmsDateFormatter();
    v3 = [v2 dateFromString:v1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)cmsOptionalArrayOfClass:()CMSCodingUtils forKey:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v4 = [a1 objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v10 = v5;
  }
  else
  {
LABEL_12:
    id v10 = 0;
  }

  return v10;
}

- (id)cmsOptionalDecodedClass:()CMSCodingUtils forKey:
{
  id v5 = [a1 objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [a3 instanceFromCMSCoded:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)cmsOptionalArrayOfDecodedClass:()CMSCodingUtils forKey:
{
  id v5 = [a1 objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __70__NSDictionary_CMSCodingUtils__cmsOptionalArrayOfDecodedClass_forKey___block_invoke;
    long long v13 = &unk_264888278;
    id v14 = v6;
    uint64_t v15 = a3;
    id v7 = v6;
    [v5 enumerateObjectsUsingBlock:&v10];
    uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)cmsOptionalDictionaryForKey:()CMSCodingUtils
{
  v1 = objc_msgSend(a1, "objectForKey:");
  id v2 = cmsSafeDictionary(v1);

  return v2;
}

@end