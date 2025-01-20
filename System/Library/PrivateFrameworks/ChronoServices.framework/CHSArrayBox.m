@interface CHSArrayBox
+ (BOOL)supportsSecureCoding;
+ (id)boxedValue:(id)a3;
- (CHSArrayBox)initWithCoder:(id)a3;
- (CHSArrayBox)initWithValue:(id)a3;
- (NSArray)value;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CHSArrayBox

+ (id)boxedValue:(id)a3
{
  id v3 = a3;
  v4 = [[CHSArrayBox alloc] initWithValue:v3];

  return v4;
}

- (CHSArrayBox)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSArrayBox;
  v6 = [(CHSArrayBox *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHSArrayBox)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = __plistableTypes();
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"arrayKey"];

  v7 = [(CHSArrayBox *)self initWithValue:v6];
  return v7;
}

- (NSArray)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end