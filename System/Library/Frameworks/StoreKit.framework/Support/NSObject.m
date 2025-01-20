@interface NSObject
+ (id)lib_copyPropertyGetterNames;
- (NSDictionary)tcr_dictionary;
- (id)_tcr_associatedReader;
- (void)_tcr_associateWithReader:(id)a3;
@end

@implementation NSObject

- (NSDictionary)tcr_dictionary
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

+ (id)lib_copyPropertyGetterNames
{
  v2 = +[NSMutableArray array];
  unsigned int outCount = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = class_copyPropertyList(v3, &outCount);
  if (v4 && outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v6 = property_copyAttributeValue(v4[i], "G");
      if (v6)
      {
        v7 = v6;
        v8 = +[NSString stringWithUTF8String:v6];
        [v2 addObject:v8];

        free(v7);
      }
      v9 = +[NSString stringWithUTF8String:property_getName(v4[i])];
      [v2 addObject:v9];
    }
  }
  free(v4);
  id v10 = [v2 copy];

  return v10;
}

- (void)_tcr_associateWithReader:(id)a3
{
}

- (id)_tcr_associatedReader
{
  return +[TypeCheckedAbstractReader _associatedReaderForObject:self];
}

@end