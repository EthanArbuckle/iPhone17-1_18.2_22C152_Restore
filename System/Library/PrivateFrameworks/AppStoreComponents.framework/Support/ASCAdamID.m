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
  sub_10000F3C4();
  v9.receiver = self;
  v9.super_class = (Class)ASCAdamID;
  v5 = [(ASCAdamID *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = v6;
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
  id v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", a3);
  v5 = [(ASCAdamID *)self initWithStringValue:v4];

  return v5;
}

+ (ASCAdamID)invalidAdamID
{
  id v2 = [objc_alloc((Class)a1) initWithInt64:0x8000000000000000];

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
    v6 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013DC30();
    }
    v6 = 0;
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
  id v2 = [(ASCAdamID *)self stringValue];
  v3 = (char *)[v2 hash] + 47;

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(ASCAdamID *)self stringValue];
    uint64_t v9 = [v7 stringValue];
    v10 = (void *)v9;
    if (v8 && v9) {
      unsigned __int8 v11 = [v8 isEqual:v9];
    }
    else {
      unsigned __int8 v11 = v8 == (void *)v9;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCAdamID *)self stringValue];
  [(ASCDescriber *)v3 addSensitiveObject:v4 withName:@"stringValue"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return v5;
}

- (NSNumber)numberValue
{
  id v3 = objc_alloc((Class)NSNumber);
  id v4 = [(ASCAdamID *)self stringValue];
  id v5 = objc_msgSend(v3, "initWithLongLong:", objc_msgSend(v4, "longLongValue"));

  return (NSNumber *)v5;
}

- (int64_t)int64value
{
  id v2 = [(ASCAdamID *)self stringValue];
  id v3 = [v2 longLongValue];

  return (int64_t)v3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end