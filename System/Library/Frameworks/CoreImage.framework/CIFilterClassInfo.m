@interface CIFilterClassInfo
+ (id)cache;
+ (id)classInfoForClass:(Class)a3;
+ (void)clearCache;
- (CIFilterClassInfo)init;
- (CIFilterClassInfo)initWithClass:(Class)a3;
- (id)description;
- (id)inputClasses;
- (id)inputKeys;
- (id)outputKeys;
- (void)dealloc;
@end

@implementation CIFilterClassInfo

- (CIFilterClassInfo)initWithClass:(Class)a3
{
  if (!a3)
  {

    return 0;
  }
  Class v3 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CIFilterClassInfo;
  v4 = [(CIFilterClassInfo *)&v58 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = objc_opt_class();
  if (([(objc_class *)v3 isSubclassOfClass:v5] & 1) == 0)
  {

    return 0;
  }
  v54 = (void *)v5;
  v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  unsigned int outCount = 0;
  v9 = class_copyIvarList(v3, &outCount);
  v55 = v3;
  v56 = v8;
  if (v9)
  {
    v10 = v9;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        Name = ivar_getName(v10[i]);
        if (Name) {
          v13 = (__CFString *)[NSString stringWithUTF8String:Name];
        }
        else {
          v13 = &stru_1EE465CC0;
        }
        if ((unint64_t)[(__CFString *)v13 length] >= 6
          && [(__CFString *)v13 hasPrefix:@"input"])
        {
          TypeEncoding = ivar_getTypeEncoding(v10[i]);
          if (TypeEncoding) {
            v15 = (__CFString *)[NSString stringWithUTF8String:TypeEncoding];
          }
          else {
            v15 = &stru_1EE465CC0;
          }
          v16 = classNameFromTypeEncoding(v15);
          [v6 addObject:v13];
          if (v16) {
            v17 = v16;
          }
          else {
            v17 = &stru_1EE465CC0;
          }
          [v7 addObject:v17];
          v8 = v56;
        }
      }
    }
    free(v10);
  }
  v18 = class_copyPropertyList(v3, &outCount);
  if (v18)
  {
    v19 = v18;
    v52 = v4;
    v53 = v7;
    if (outCount)
    {
      for (unint64_t j = 0; j < outCount; ++j)
      {
        v21 = property_getName(v19[j]);
        if (v21) {
          v22 = (__CFString *)[NSString stringWithUTF8String:v21];
        }
        else {
          v22 = &stru_1EE465CC0;
        }
        if ((unint64_t)[(__CFString *)v22 length] >= 6)
        {
          if ([(__CFString *)v22 hasPrefix:@"input"])
          {
            v23 = v19[j];
            unsigned int v59 = 0;
            v24 = property_copyAttributeList(v23, &v59);
            if (v24)
            {
              if (v59)
              {
                v25 = v24;
                unint64_t v26 = 0;
                p_value = &v24->value;
                while (1)
                {
                  v28 = *p_value;
                  v29 = *(p_value - 1)
                      ? (__CFString *)objc_msgSend(NSString, "stringWithUTF8String:")
                      : &stru_1EE465CC0;
                  if ([(__CFString *)v29 isEqualToString:@"T"]) {
                    break;
                  }
                  ++v26;
                  p_value += 2;
                  if (v26 >= v59)
                  {
                    free(v25);
                    goto LABEL_46;
                  }
                }
                if (v28) {
                  v30 = (__CFString *)[NSString stringWithUTF8String:v28];
                }
                else {
                  v30 = &stru_1EE465CC0;
                }
                v31 = classNameFromTypeEncoding(v30);
                free(v25);
                if (v31)
                {
                  uint64_t v32 = [v6 indexOfObject:v22];
                  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    [v6 addObject:v22];
                    [v53 addObject:v31];
                  }
                  else
                  {
                    uint64_t v33 = v32;
                    if (!objc_msgSend((id)objc_msgSend(v53, "objectAtIndexedSubscript:", v32), "length")) {
                      [v53 setObject:v31 atIndexedSubscript:v33];
                    }
                  }
                }
              }
            }
          }
        }
LABEL_46:
        ;
      }
    }
    free(v19);
    v4 = v52;
    v7 = v53;
    Class v3 = v55;
    v8 = v56;
  }
  if ([v6 count])
  {
    unint64_t v34 = 0;
    do
      objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v34++), "length");
    while (v34 < [v6 count]);
  }
  v35 = class_copyMethodList(v3, &outCount);
  if (v35)
  {
    v36 = v35;
    if (outCount)
    {
      for (unint64_t k = 0; k < outCount; ++k)
      {
        v38 = method_getName(v36[k]);
        v39 = sel_getName(v38);
        if (v39) {
          v40 = (__CFString *)[NSString stringWithUTF8String:v39];
        }
        else {
          v40 = &stru_1EE465CC0;
        }
        if ((unint64_t)[(__CFString *)v40 length] >= 7
          && [(__CFString *)v40 hasPrefix:@"output"])
        {
          [v8 addObject:v40];
        }
      }
    }
    free(v36);
    Class v3 = v55;
  }
  v41 = (void *)[(objc_class *)v3 superclass];
  int v42 = [v41 isSubclassOfClass:v54];
  if (v41 != v54 && v42)
  {
    id v43 = +[CIFilterClassInfo classInfoForClass:v41];
    if (objc_msgSend((id)objc_msgSend(v43, "inputKeys"), "count"))
    {
      uint64_t v44 = objc_msgSend((id)objc_msgSend(v43, "inputKeys"), "count");
      if (v44)
      {
        uint64_t v45 = v44 - 1;
        do
        {
          uint64_t v46 = objc_msgSend((id)objc_msgSend(v43, "inputKeys"), "objectAtIndexedSubscript:", v45);
          uint64_t v47 = objc_msgSend((id)objc_msgSend(v43, "inputClasses"), "objectAtIndexedSubscript:", v45);
          if (([v6 containsObject:v46] & 1) == 0)
          {
            [v6 insertObject:v46 atIndex:0];
            [v7 insertObject:v47 atIndex:0];
          }
          --v45;
        }
        while (v45 != -1);
      }
    }
    if (objc_msgSend((id)objc_msgSend(v43, "outputKeys"), "count"))
    {
      uint64_t v48 = objc_msgSend((id)objc_msgSend(v43, "outputKeys"), "count");
      if (v48)
      {
        uint64_t v49 = v48 - 1;
        do
        {
          uint64_t v50 = objc_msgSend((id)objc_msgSend(v43, "outputKeys"), "objectAtIndexedSubscript:", v49);
          if (([v8 containsObject:v50] & 1) == 0) {
            [v8 insertObject:v50 atIndex:0];
          }
          --v49;
        }
        while (v49 != -1);
      }
    }
  }
  v4->inputKeys = (NSArray *)[v6 copy];
  v4->inputClasses = (NSArray *)[v7 copy];
  v4->outputKeys = (NSArray *)[v8 copy];
  return v4;
}

- (id)inputKeys
{
  return self->inputKeys;
}

- (id)inputClasses
{
  return self->inputClasses;
}

- (id)outputKeys
{
  return self->outputKeys;
}

+ (id)classInfoForClass:(Class)a3
{
  uint64_t v5 = (void *)[a1 cache];
  v6 = (objc_class *)objc_opt_class();
  int v7 = [(objc_class *)a3 isSubclassOfClass:v6];
  if (v6 == a3 || v7 == 0) {
    return 0;
  }
  uint64_t v10 = [v5 objectForKey:a3];
  id v9 = (id)v10;
  if (!v10)
  {
    id v9 = (id)[objc_alloc((Class)a1) initWithClass:a3];
    [v5 setObject:v9 forKey:a3];
  }
  return v9;
}

+ (id)cache
{
  if (+[CIFilterClassInfo cache]::onceToken != -1) {
    dispatch_once(&+[CIFilterClassInfo cache]::onceToken, &__block_literal_global_1034);
  }
  return (id)+[CIFilterClassInfo cache]::cache;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CIFilterClassInfo;
  [(CIFilterClassInfo *)&v3 dealloc];
}

uint64_t __26__CIFilterClassInfo_cache__block_invoke()
{
  +[CIFilterClassInfo cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  [(id)+[CIFilterClassInfo cache]::cache setName:@"com.apple.coreimage.nscache.CIFilterClassInfo"];
  [(id)+[CIFilterClassInfo cache]::cache setCountLimit:256];
  v0 = (void *)+[CIFilterClassInfo cache]::cache;

  return [v0 setEvictsObjectsWhenApplicationEntersBackground:1];
}

+ (void)clearCache
{
  v2 = (void *)[a1 cache];

  [v2 removeAllObjects];
}

- (CIFilterClassInfo)init
{
  return [(CIFilterClassInfo *)self initWithClass:0];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: inputKeys=%@ inputClasses=%@ outputKeys=%@>", objc_msgSend((id)objc_opt_class(), "description"), -[NSArray description](self->inputKeys, "description"), -[NSArray description](self->inputClasses, "description"), -[NSArray description](self->outputKeys, "description")];
}

@end