@interface MEMessageActionFlagChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MEMessageActionFlagChange)initWithCoder:(id)a3;
- (MEMessageActionFlagChange)initWithFlag:(int64_t)a3;
- (id)description;
- (int64_t)flag;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEMessageActionFlagChange

- (MEMessageActionFlagChange)initWithFlag:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MEMessageActionFlagChange;
  result = [(MEMessageActionFlagChange *)&v5 init];
  if (result) {
    result->_flag = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageActionFlagChange)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[MEMessageActionFlagChange initWithFlag:](self, "initWithFlag:", [v4 decodeIntegerForKey:@"EFPropertyKey_flag"]);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MEMessageActionFlagChange flag](self, "flag"), @"EFPropertyKey_flag");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    int64_t v7 = [(MEMessageActionFlagChange *)self flag];
    BOOL v8 = v7 == [v6 flag];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Flag Change %ld", -[MEMessageActionFlagChange flag](self, "flag"));
}

- (int64_t)flag
{
  return self->_flag;
}

@end