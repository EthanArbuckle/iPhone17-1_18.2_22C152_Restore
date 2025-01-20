@interface LKClasses
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLKClasses:(id)a3;
- (LKClasses)initWithClassArray:(id)a3;
- (NSArray)classes;
@end

@implementation LKClasses

- (LKClasses)initWithClassArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LKClasses;
  v6 = [(LKClasses *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_classes, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LKClasses *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(LKClasses *)self isEqualToLKClasses:v5];

  return v6;
}

- (BOOL)isEqualToLKClasses:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_classes count];
  BOOL v6 = [v4 classes];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    if ([(NSArray *)self->_classes count])
    {
      unint64_t v8 = 0;
      do
      {
        objc_super v9 = [(NSArray *)self->_classes objectAtIndexedSubscript:v8];
        v10 = [v4 classes];
        v11 = [v10 objectAtIndexedSubscript:v8];
        char v12 = [v9 isEqual:v11];

        if ((v12 & 1) == 0) {
          break;
        }
        ++v8;
      }
      while ([(NSArray *)self->_classes count] > v8);
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSArray)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
}

@end