@interface DiagnosticMessage
+ (BOOL)supportsSecureCoding;
- (DiagnosticMessage)init;
- (DiagnosticMessage)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setValuesForKeysWithDictionary:(id)a3;
@end

@implementation DiagnosticMessage

- (DiagnosticMessage)init
{
  return (DiagnosticMessage *)sub_10035455C(self, 0);
}

- (id)description
{
  return +[NSString stringWithFormat:@"(CODE = %ld) %@", self->_code, self->_dictionary];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t code = self->_code;
  id v5 = a3;
  [v5 encodeInteger:code forKey:@"code"];
  [v5 encodeObject:self->_dictionary forKey:@"dictionary"];
}

- (DiagnosticMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DiagnosticMessage;
  id v5 = [(DiagnosticMessage *)&v16 init];
  if (v5)
  {
    v5->_int64_t code = (int64_t)[v4 decodeIntegerForKey:@"code"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"dictionary"];
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
    dictionary = v5->_dictionary;
    v5->_dictionary = v13;
  }
  return v5;
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end