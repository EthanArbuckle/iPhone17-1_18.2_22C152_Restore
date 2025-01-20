@interface ATXTimeContext
+ (BOOL)supportsSecureCoding;
- (ATXTimeContext)initWithCoder:(id)a3;
- (ATXTimeContext)initWithType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXTimeContext:(id)a3;
- (NSString)title;
- (int64_t)contextType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeContext

- (ATXTimeContext)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXTimeContext;
  v4 = [(ATXTimeContext *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_contextType = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeContext)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"type"];

  return [(ATXTimeContext *)self initWithType:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXTimeContext contextType](self, "contextType"), @"type");
}

- (NSString)title
{
  int64_t v2 = [(ATXTimeContext *)self contextType];
  v3 = @"Unknown";
  if (v2 == 1) {
    v3 = @"Meet Your Goals";
  }
  if (v2) {
    return &v3->isa;
  }
  else {
    return (NSString *)@"Relax With Your Favorites";
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXTimeContext *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXTimeContext *)self isEqualToATXTimeContext:v5];

  return v6;
}

- (BOOL)isEqualToATXTimeContext:(id)a3
{
  uint64_t v4 = [a3 contextType];
  return v4 == [(ATXTimeContext *)self contextType];
}

- (int64_t)contextType
{
  return self->_contextType;
}

@end