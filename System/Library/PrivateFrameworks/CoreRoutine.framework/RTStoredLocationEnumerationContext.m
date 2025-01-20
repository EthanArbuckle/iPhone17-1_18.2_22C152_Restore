@interface RTStoredLocationEnumerationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContext:(id)a3;
- (RTStoredLocationEnumerationContext)init;
- (RTStoredLocationEnumerationContext)initWithCoder:(id)a3;
- (RTStoredLocationEnumerationContext)initWithEnumerationOptions:(id)a3;
- (RTStoredLocationEnumerationContext)initWithEnumerationOptions:(id)a3 offset:(unint64_t)a4;
- (RTStoredLocationEnumerationOptions)options;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTStoredLocationEnumerationContext

- (RTStoredLocationEnumerationContext)init
{
  v3 = objc_opt_new();
  v4 = [(RTStoredLocationEnumerationContext *)self initWithEnumerationOptions:v3 offset:0];

  return v4;
}

- (RTStoredLocationEnumerationContext)initWithEnumerationOptions:(id)a3
{
  return [(RTStoredLocationEnumerationContext *)self initWithEnumerationOptions:a3 offset:0];
}

- (RTStoredLocationEnumerationContext)initWithEnumerationOptions:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTStoredLocationEnumerationContext;
  v7 = [(RTStoredLocationEnumerationContext *)&v11 init];
  if (v7)
  {
    if (v6) {
      uint64_t v8 = [v6 copy];
    }
    else {
      uint64_t v8 = objc_opt_new();
    }
    options = v7->_options;
    v7->_options = (RTStoredLocationEnumerationOptions *)v8;

    v7->_offset = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RTStoredLocationEnumerationContext *)self options];
  id v6 = objc_msgSend(v4, "initWithEnumerationOptions:offset:", v5, -[RTStoredLocationEnumerationContext offset](self, "offset"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  options = self->_options;
  id v5 = a3;
  [v5 encodeObject:options forKey:@"options"];
  [v5 encodeInteger:self->_offset forKey:@"offset"];
}

- (RTStoredLocationEnumerationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"offset"];

  v7 = [(RTStoredLocationEnumerationContext *)self initWithEnumerationOptions:v5 offset:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTStoredLocationEnumerationContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTStoredLocationEnumerationContext *)self isEqualToContext:v5];

  return v6;
}

- (BOOL)isEqualToContext:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  options = self->_options;
  uint64_t v8 = options;
  if (options)
  {
LABEL_4:
    v9 = [v6 options];
    char v10 = [(RTStoredLocationEnumerationOptions *)v8 isEqual:v9];

    if (options) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v3 = [v5 options];
  if (v3)
  {
    uint64_t v8 = self->_options;
    goto LABEL_4;
  }
  char v10 = 1;
LABEL_7:

LABEL_8:
  unint64_t offset = self->_offset;
  if (offset == [v6 offset]) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RTStoredLocationEnumerationOptions *)self->_options hash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_offset];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"options, %@, offset, %lu", self->_options, self->_offset];
}

- (RTStoredLocationEnumerationOptions)options
{
  return self->_options;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
}

@end