@interface ASCAdamID
+ (ASCAdamID)invalidAdamID;
+ (BOOL)supportsSecureCoding;
- (ASCAdamID)initWithCoder:(id)a3;
- (ASCAdamID)initWithInt64:(int64_t)a3;
- (ASCAdamID)initWithNumberValue:(id)a3;
- (ASCAdamID)initWithStringValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (id)description;
- (int64_t)int64value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAdamID

- (ASCAdamID)initWithStringValue:(id)a3
{
  id v4 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v9.receiver = self;
  v9.super_class = (Class)ASCAdamID;
  v5 = [(ASCAdamID *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

- (ASCAdamID)initWithNumberValue:(id)a3
{
  id v4 = [a3 stringValue];
  v5 = [(ASCAdamID *)self initWithStringValue:v4];

  return v5;
}

- (ASCAdamID)initWithInt64:(int64_t)a3
{
  id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", a3);
  v5 = [(ASCAdamID *)self initWithStringValue:v4];

  return v5;
}

+ (ASCAdamID)invalidAdamID
{
  v2 = (void *)[objc_alloc((Class)a1) initWithInt64:0x8000000000000000];

  return (ASCAdamID *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCAdamID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];

  if (v5)
  {
    self = [(ASCAdamID *)self initWithStringValue:v5];
    uint64_t v6 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[ASCAdamID initWithCoder:]();
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAdamID *)self stringValue];
  [v4 encodeObject:v5 forKey:@"stringValue"];
}

- (unint64_t)hash
{
  v2 = [(ASCAdamID *)self stringValue];
  unint64_t v3 = [v2 hash] + 47;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCAdamID *)self stringValue];
    uint64_t v9 = [v7 stringValue];
    v10 = (void *)v9;
    if (v8 && v9) {
      char v11 = [v8 isEqual:v9];
    }
    else {
      char v11 = v8 == (void *)v9;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCAdamID *)self stringValue];
  [(ASCDescriber *)v3 addSensitiveObject:v4 withName:@"stringValue"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSNumber)numberValue
{
  id v3 = objc_alloc(NSNumber);
  id v4 = [(ASCAdamID *)self stringValue];
  id v5 = objc_msgSend(v3, "initWithLongLong:", objc_msgSend(v4, "longLongValue"));

  return (NSNumber *)v5;
}

- (int64_t)int64value
{
  v2 = [(ASCAdamID *)self stringValue];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not decode ASCAdamID because stringValue was missing", v0, 2u);
}

@end