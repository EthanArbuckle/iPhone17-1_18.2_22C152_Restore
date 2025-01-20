@interface CAMOverlayBooleanRange
+ (id)_values;
- (BOOL)containsValue:(id)a3;
- (BOOL)isDiscrete;
- (BOOL)isEqualToRange:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)isValueExpectedType:(id)a3;
- (NSString)description;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfValue:(id)a3;
- (unint64_t)rangeType;
- (unint64_t)valueType;
@end

@implementation CAMOverlayBooleanRange

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return (NSString *)v6;
}

+ (id)_values
{
  return &unk_26FD46200;
}

- (unint64_t)count
{
  v2 = [(id)objc_opt_class() _values];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (BOOL)isFloatingPoint
{
  return 0;
}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 3;
}

- (BOOL)containsValue:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _values];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)isEqualToRange:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isValueExpectedType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)indexOfValue:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _values];
  unint64_t v5 = [v4 indexOfObject:v3];

  return v5;
}

- (id)valueAtIndex:(unint64_t)a3
{
  v4 = [(id)objc_opt_class() _values];
  unint64_t v5 = [v4 objectAtIndex:a3];

  return v5;
}

@end