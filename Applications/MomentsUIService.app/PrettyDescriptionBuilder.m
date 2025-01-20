@interface PrettyDescriptionBuilder
+ (Class)extractClassFrom:(objc_property *)a3;
+ (id)buildDescriptionOf:(id)a3;
+ (id)describeArray:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5;
+ (id)describeComplexObject:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5;
+ (id)describeDictionary:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5;
+ (id)describeSimpleObject:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5;
+ (id)extractValueFrom:(objc_property *)a3 belongingTo:(id)a4;
@end

@implementation PrettyDescriptionBuilder

+ (id)buildDescriptionOf:(id)a3
{
  return [a1 describeComplexObject:a3 withName:0 withDepth:0];
}

+ (id)describeComplexObject:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 describeSimpleObject:v8 withName:v9 withDepth:a5];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
LABEL_7:
    v13 = v12;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [a1 describeArray:v8 withName:v9 withDepth:a5];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [a1 describeDictionary:v8 withName:v9 withDepth:a5];
    goto LABEL_7;
  }
  unint64_t v27 = a5;
  unsigned int outCount = 0;
  v15 = (objc_class *)objc_opt_class();
  v16 = class_copyPropertyList(v15, &outCount);
  v29 = +[NSMutableArray array];
  if (outCount)
  {
    uint64_t v17 = 0;
    unint64_t v28 = v27 + 1;
    while (1)
    {
      v18 = v16[v17];
      v19 = +[NSString stringWithCString:property_getName(v18) encoding:4];
      id v20 = [a1 extractValueFrom:v18 belongingTo:v8];
      uint64_t v21 = objc_opt_class();
      if (v21 != objc_opt_class()) {
        break;
      }
LABEL_22:

      if (++v17 >= (unint64_t)outCount) {
        goto LABEL_25;
      }
    }
    if (v20)
    {
      if (v20 == v8)
      {
        id v22 = (id)objc_opt_class();
        v23 = v19;
        CFStringRef v24 = @"[Self reference, parsing abandoned]";
      }
      else
      {
        if (v27 < 0xF)
        {
          uint64_t v25 = [a1 describeComplexObject:v20 withName:v19 withDepth:v28];
          goto LABEL_21;
        }
        id v22 = (id)objc_opt_class();
        v23 = v19;
        CFStringRef v24 = @"[Possible infinite recurrsion detected, parsing abandoned]";
      }
    }
    else
    {
      id v22 = [a1 extractClassFrom:v18];
      v23 = v19;
      CFStringRef v24 = @"(null)";
    }
    uint64_t v25 = +[PrettyPropertyDescription describingPropertyNamed:withClassType:andValue:andRecursiveDepth:](PrettyPropertyDescription, "describingPropertyNamed:withClassType:andValue:andRecursiveDepth:", v23, v22, v24, v28, v27);
LABEL_21:
    v26 = (void *)v25;
    [v29 addObject:v25, v27];

    goto LABEL_22;
  }
LABEL_25:
  free(v16);
  v13 = +[PrettyPropertyDescription describingPropertyNamed:v9 withClassType:objc_opt_class() andValue:v29 andRecursiveDepth:v27];

LABEL_8:

  return v13;
}

+ (id)extractValueFrom:(objc_property *)a3 belongingTo:(id)a4
{
  id v5 = a4;
  v6 = +[NSString stringWithCString:property_getName(a3) encoding:4];
  v7 = [v5 valueForKey:v6];

  return v7;
}

+ (Class)extractClassFrom:(objc_property *)a3
{
  v3 = +[NSString stringWithCString:property_getAttributes(a3) encoding:4];
  v4 = [v3 componentsSeparatedByString:@","];
  id v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v4 objectAtIndexedSubscript:0];
  objc_msgSend(v5, "substringWithRange:", 3, (char *)objc_msgSend(v6, "length") - 4);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  id v8 = NSClassFromString(v7);

  return (Class)v8;
}

+ (id)describeSimpleObject:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[PrettyPropertyDescription describingPropertyNamed:v8 withClassType:objc_opt_class() andValue:v7 andRecursiveDepth:a5];
    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    v11 = (const char *)[v10 objCType];
    if (!strcmp(v11, "B"))
    {
      v13 = @"BOOL";
    }
    else if (!strcmp(v11, "c"))
    {
      v13 = @"char";
    }
    else if (!strcmp(v11, "{?=b8b4b1b1b18[8S]}"))
    {
      v13 = @"NSDecimal";
    }
    else if (!strcmp(v11, "d"))
    {
      v13 = @"double";
    }
    else if (!strcmp(v11, "f"))
    {
      v13 = @"float";
    }
    else if (!strcmp(v11, "i"))
    {
      v13 = @"int";
    }
    else if (!strcmp(v11, "q"))
    {
      v13 = @"NSInteger";
    }
    else if (!strcmp(v11, "s"))
    {
      v13 = @"short";
    }
    else if (!strcmp(v11, "C"))
    {
      v13 = @"unsigned char";
    }
    else if (!strcmp(v11, "Q"))
    {
      v13 = @"NSUInteger";
    }
    else if (!strcmp(v11, "I"))
    {
      v13 = @"unsigned int";
    }
    else if (!strcmp(v11, "S"))
    {
      v13 = @"unsigned short";
    }
    else if (!strcmp(v11, "{_NSRange=QQ}"))
    {
      v13 = @"NSRange";
    }
    else
    {
      id v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v22 = [v10 stringValue];
    id v9 = +[PrettyPropertyDescription describingPropertyNamed:v8 withClassName:v13 andValue:v22 andRecursiveDepth:a5];

    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v7 UUIDString];
LABEL_31:
    v18 = (void *)v15;
    id v9 = +[PrettyPropertyDescription describingPropertyNamed:v8 withClassType:v14 andValue:v15 andRecursiveDepth:a5];

    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!dateFormatter)
    {
      id v16 = objc_alloc_init((Class)NSDateFormatter);
      uint64_t v17 = (void *)dateFormatter;
      dateFormatter = (uint64_t)v16;

      [(id)dateFormatter setDateStyle:1];
      [(id)dateFormatter setTimeStyle:1];
    }
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [(id)dateFormatter stringFromDate:v7];
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v7 absoluteString];
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld bytes", [v7 length]);
    goto LABEL_31;
  }
  v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || ([v20 hasPrefix:@"NS"] & 1) == 0
    && ![v20 hasPrefix:@"__NS"])
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v21 = +[NSString stringWithFormat:@"%@", v7];
    id v9 = +[PrettyPropertyDescription describingPropertyNamed:v8 withClassName:v20 andValue:v21 andRecursiveDepth:a5];
  }
LABEL_50:

  return v9;
}

+ (id)describeArray:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [a1 describeComplexObject:*(void *)(*((void *)&v19 + 1) + 8 * i) withName:0 withDepth:a5 + 1 v19];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  uint64_t v17 = +[PrettyPropertyDescription describingPropertyNamed:v9 withClassType:objc_opt_class() andValue:v10 andRecursiveDepth:a5];

  return v17;
}

+ (id)describeDictionary:(id)a3 withName:(id)a4 withDepth:(unint64_t)a5
{
  id v7 = a3;
  id v18 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v7 allKeys];
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v7 objectForKeyedSubscript:v13];
        uint64_t v15 = [a1 describeComplexObject:v14 withName:0 withDepth:a5 + 1];
        [v8 setObject:v15 forKeyedSubscript:v13];
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v16 = +[PrettyPropertyDescription describingPropertyNamed:v18 withClassType:objc_opt_class() andValue:v8 andRecursiveDepth:a5];

  return v16;
}

@end