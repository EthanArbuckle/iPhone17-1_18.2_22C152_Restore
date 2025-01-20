@interface RTDiagnosticOptions
+ (BOOL)supportsSecureCoding;
+ (id)RTDiagnosticOptionsMaskToString:(unint64_t)a3;
- (BOOL)hasMask:(unint64_t)a3;
- (RTDiagnosticOptions)init;
- (RTDiagnosticOptions)initWithCoder:(id)a3;
- (RTDiagnosticOptions)initWithOptionsMask:(unint64_t)a3;
- (id)description;
- (unint64_t)optionsMask;
- (void)clearMask;
- (void)encodeWithCoder:(id)a3;
- (void)setMask:(unint64_t)a3;
- (void)setOptionsMask:(unint64_t)a3;
@end

@implementation RTDiagnosticOptions

+ (id)RTDiagnosticOptionsMaskToString:(unint64_t)a3
{
  char v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = v4;
  if (v3)
  {
    [v4 addObject:@"CoreRoutine"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"Location Workout Studies"];
  if ((v3 & 4) != 0) {
LABEL_4:
  }
    [v5 addObject:@"Location Monitoring Studies"];
LABEL_5:
  v6 = [v5 componentsJoinedByString:@", "];

  return v6;
}

- (RTDiagnosticOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithOptionsMask_);
}

- (RTDiagnosticOptions)initWithOptionsMask:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTDiagnosticOptions;
  result = [(RTDiagnosticOptions *)&v5 init];
  if (result) {
    result->_optionsMask = a3;
  }
  return result;
}

- (BOOL)hasMask:(unint64_t)a3
{
  return ([(RTDiagnosticOptions *)self optionsMask] & a3) != 0;
}

- (void)setMask:(unint64_t)a3
{
  unint64_t v4 = [(RTDiagnosticOptions *)self optionsMask] | a3;
  [(RTDiagnosticOptions *)self setOptionsMask:v4];
}

- (void)clearMask
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTDiagnosticOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"optionsMask"];

  v6 = -[RTDiagnosticOptions initWithOptionsMask:](self, "initWithOptionsMask:", [v5 unsignedIntegerValue]);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  char v3 = NSNumber;
  unint64_t optionsMask = self->_optionsMask;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInteger:optionsMask];
  [v5 encodeObject:v6 forKey:@"optionsMask"];
}

- (id)description
{
  uint64_t v2 = NSString;
  char v3 = objc_msgSend((id)objc_opt_class(), "RTDiagnosticOptionsMaskToString:", -[RTDiagnosticOptions optionsMask](self, "optionsMask"));
  id v4 = [v2 stringWithFormat:@"optionsMask, %@", v3];

  return v4;
}

- (unint64_t)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(unint64_t)a3
{
  self->_unint64_t optionsMask = a3;
}

@end