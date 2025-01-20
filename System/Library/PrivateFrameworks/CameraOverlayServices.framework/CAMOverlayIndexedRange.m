@interface CAMOverlayIndexedRange
+ (BOOL)supportsSecureCoding;
- (BOOL)containsValue:(id)a3;
- (BOOL)isDiscrete;
- (BOOL)isEqualToRange:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)isValueExpectedType:(id)a3;
- (CAMOverlayIndexedRange)initWithCoder:(id)a3;
- (CAMOverlayIndexedRange)initWithCount:(unint64_t)a3;
- (NSArray)_titles;
- (NSString)description;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfValue:(id)a3;
- (unint64_t)rangeType;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMOverlayIndexedRange

- (CAMOverlayIndexedRange)initWithCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMOverlayIndexedRange;
  v4 = [(CAMOverlayIndexedRange *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p; %lu values>", v5, self, self->_count];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayIndexedRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayIndexedRange;
  v5 = [(CAMOverlayIndexedRange *)&v11 init];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"%@.%@", v8, @"count"];
    v5->_count = [v4 decodeIntegerForKey:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CAMOverlayIndexedRange *)self count];
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = [v6 stringWithFormat:@"%@.%@", v9, @"count"];
  [v4 encodeInteger:v5 forKey:v8];
}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 1;
}

- (BOOL)isFloatingPoint
{
  return 0;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (BOOL)isEqualToRange:(id)a3
{
  id v4 = (CAMOverlayIndexedRange *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v5 = [(CAMOverlayIndexedRange *)v4 count];
      BOOL v6 = v5 == [(CAMOverlayIndexedRange *)self count];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)containsValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(CAMOverlayIndexedRange *)self count];
    BOOL v6 = [v4 unsignedIntegerValue] <= v5 - 1 && v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
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
  return [a3 unsignedIntegerValue];
}

- (id)valueAtIndex:(unint64_t)a3
{
  return (id)[NSNumber numberWithUnsignedInteger:a3];
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)_titles
{
  return self->__titles;
}

- (void).cxx_destruct
{
}

@end