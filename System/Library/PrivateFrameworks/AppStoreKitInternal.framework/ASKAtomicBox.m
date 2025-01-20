@interface ASKAtomicBox
- (ASKAtomicBox)init;
- (ASKAtomicBox)initWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)value;
- (unint64_t)hash;
- (void)setValue:(id)a3;
@end

@implementation ASKAtomicBox

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (ASKAtomicBox)init
{
  return [(ASKAtomicBox *)self initWithValue:0];
}

- (ASKAtomicBox)initWithValue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASKAtomicBox;
  v5 = [(ASKAtomicBox *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ASKAtomicBox *)v5 setValue:v4];
  }

  return v6;
}

- (void)setValue:(id)a3
{
}

- (id)description
{
  v2 = NSString;
  v3 = [(ASKAtomicBox *)self value];
  id v4 = [v2 stringWithFormat:@"AtomicBox(%@)", v3];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(ASKAtomicBox *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASKAtomicBox *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v8 = 1;
    }
    else
    {
      v5 = v4;
      v6 = [(ASKAtomicBox *)self value];
      v7 = [(ASKAtomicBox *)v5 value];

      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end