@interface _CNUIComponentBasedColorSerialization
+ (CGColorSpace)_createColorSpaceWithName:(id)a3;
+ (id)colorFromDictionary:(id)a3;
+ (id)dictionaryForColor:(id)a3;
+ (void)parseString:(id)a3 forComponents:(double *)a4 count:(int64_t *)a5;
@end

@implementation _CNUIComponentBasedColorSerialization

+ (id)dictionaryForColor:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setObject:&off_1000087D0 forKeyedSubscript:@"type"];
  v5 = objc_opt_new();
  id v6 = v3;
  size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)[v6 CGColor]);
  id v8 = v6;
  Components = CGColorGetComponents((CGColorRef)[v8 CGColor]);
  if (NumberOfComponents)
  {
    v10 = (double *)Components;
    do
    {
      double v11 = *v10++;
      objc_msgSend(v5, "appendFormat:", @"%02x", (int)(v11 * 255.0));
      --NumberOfComponents;
    }
    while (NumberOfComponents);
  }
  id v12 = v8;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v12 CGColor]);
  v14 = CGColorSpaceGetName(ColorSpace);
  v15 = [v5 uppercaseString];
  [v4 setObject:v15 forKeyedSubscript:@"hexComponents"];

  [v4 setObject:v14 forKeyedSubscript:@"colorSpaceName"];
  return v4;
}

+ (id)colorFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CNStack);
  id v6 = [v4 objectForKeyedSubscript:@"hexComponents"];
  if (v6)
  {
    uint64_t v21 = 0;
    [a1 parseString:v6 forComponents:components count:&v21];
    v7 = [v4 objectForKeyedSubscript:@"colorSpaceName"];
    id v8 = (CGColorSpace *)[a1 _createColorSpaceWithName:v7];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000053C4;
    v20[3] = &unk_1000084F0;
    v20[4] = v8;
    id v9 = [v20 copy];
    v10 = self;
    id v11 = objc_retainBlock(v10);
    [v5 push:v11];

    CGColorRef v12 = CGColorCreate(v8, components);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000053CC;
    v19[3] = &unk_1000084F0;
    v19[4] = v12;
    id v13 = [v19 copy];
    v14 = self;
    id v15 = objc_retainBlock(v14);
    [v5 push:v15];

    v16 = +[UIColor colorWithCGColor:v12];
  }
  else
  {
    v16 = 0;
  }

  [v5 popAllWithHandler:&stru_100008530];
  id v17 = self;

  return v16;
}

+ (CGColorSpace)_createColorSpaceWithName:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3)
  {
    if (![(__CFString *)v3 length] || (id v5 = CGColorSpaceCreateWithName(v4)) == 0)
    {
      id v5 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
      if ([(__CFString *)v4 length])
      {
        id v6 = +[CNUICoreLogProvider color_os_log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100005B08((uint64_t)v4, v6);
        }
      }
    }
  }
  else
  {
    id v5 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  }

  return v5;
}

+ (void)parseString:(id)a3 forComponents:(double *)a4 count:(int64_t *)a5
{
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSScanner) initWithString:v7];
  if (*a5 <= 3)
  {
    do
    {
      char v11 = 0;
      if ((objc_msgSend(v8, "_cn_scanHexChar:", &v11) & 1) == 0) {
        break;
      }
      LOBYTE(v9) = v11;
      int64_t v10 = *a5;
      a4[*a5] = (double)v9 / 255.0;
      *a5 = v10 + 1;
    }
    while (v10 < 3);
  }
}

@end