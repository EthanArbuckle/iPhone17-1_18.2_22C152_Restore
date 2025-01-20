@interface CAMOverlayTitleRange
+ (BOOL)supportsSecureCoding;
- (BOOL)containsValue:(id)a3;
- (BOOL)isDiscrete;
- (BOOL)isEqualToRange:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)isValueExpectedType:(id)a3;
- (CAMOverlayIndexedRange)indexedRange;
- (CAMOverlayTitleRange)initWithCoder:(id)a3;
- (CAMOverlayTitleRange)initWithTitles:(id)a3;
- (NSArray)_titles;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfValue:(id)a3;
- (unint64_t)rangeType;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMOverlayTitleRange

- (CAMOverlayTitleRange)initWithTitles:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMOverlayTitleRange;
  v6 = [(CAMOverlayTitleRange *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__titles, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayTitleRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMOverlayTitleRange;
  id v5 = [(CAMOverlayTitleRange *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = NSString;
    objc_super v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"%@.%@", v11, @"_titles"];
    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:v12];
    titles = v5->__titles;
    v5->__titles = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v9 = [(CAMOverlayTitleRange *)self _titles];
  id v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@.%@", v7, @"_titles"];
  [v4 encodeObject:v9 forKey:v8];
}

- (unint64_t)count
{
  v2 = [(CAMOverlayTitleRange *)self _titles];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 2;
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
  id v4 = (CAMOverlayTitleRange *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      char v7 = 1;
    }
    else
    {
      id v5 = [(CAMOverlayTitleRange *)v4 _titles];
      v6 = [(CAMOverlayTitleRange *)self _titles];
      char v7 = [v5 isEqualToArray:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)containsValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CAMOverlayTitleRange *)self _titles];
    char v6 = [v5 containsObject:v4];
  }
  else
  {
    char v6 = 0;
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
  id v4 = a3;
  id v5 = [(CAMOverlayTitleRange *)self _titles];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)valueAtIndex:(unint64_t)a3
{
  id v4 = [(CAMOverlayTitleRange *)self _titles];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (CAMOverlayIndexedRange)indexedRange
{
  v2 = [[CAMOverlayIndexedRange alloc] initWithCount:[(CAMOverlayTitleRange *)self count]];
  return v2;
}

- (NSArray)_titles
{
  return self->__titles;
}

- (void).cxx_destruct
{
}

@end