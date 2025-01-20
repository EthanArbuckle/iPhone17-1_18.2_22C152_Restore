@interface MapsSuggestionsContact
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MapsSuggestionsContact)initWithCoder:(id)a3;
- (MapsSuggestionsContact)initWithHandleValue:(id)a3;
- (NSString)handleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHandleValue:(id)a3;
@end

@implementation MapsSuggestionsContact

- (MapsSuggestionsContact)initWithHandleValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsContact;
  v5 = [(MapsSuggestionsContact *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    handleValue = v5->_handleValue;
    v5->_handleValue = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(MapsSuggestionsContact *)self handleValue];
  uint64_t v6 = (void *)[v4 initWithHandleValue:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MapsSuggestionsContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsContactHandleValueKey"];

  uint64_t v6 = [(MapsSuggestionsContact *)self initWithHandleValue:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MapsSuggestionsContact *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      handleValue = self->_handleValue;
      v7 = [(MapsSuggestionsContact *)v5 handleValue];

      if (handleValue == v7
        || (v8 = self->_handleValue,
            [(MapsSuggestionsContact *)v5 handleValue],
            objc_super v9 = objc_claimAutoreleasedReturnValue(),
            BOOL v10 = [(NSString *)v8 isEqualToString:v9],
            v9,
            v10))
      {
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(MapsSuggestionsContact *)self handleValue];
  v5 = (void *)v4;
  uint64_t v6 = &stru_1EFC640F8;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v7 = (void *)[v3 initWithFormat:@"CONTACT '%@'", v6];

  return v7;
}

- (NSString)handleValue
{
  return self->_handleValue;
}

- (void)setHandleValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end