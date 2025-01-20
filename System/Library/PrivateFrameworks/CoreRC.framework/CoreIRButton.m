@interface CoreIRButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CoreIRButton)init;
- (CoreIRButton)initWithCoder:(id)a3;
- (CoreIRButton)initWithUsagePage:(unsigned int)a3 usageID:(unsigned int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)usageID;
- (unsigned)usagePage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CoreIRButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CoreIRButton)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithUsagePage:usageID:"];
  return 0;
}

- (CoreIRButton)initWithUsagePage:(unsigned int)a3 usageID:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CoreIRButton;
  result = [(CoreIRButton *)&v7 init];
  if (result)
  {
    result->_usagePage = a3;
    result->_usageID = a4;
  }
  return result;
}

- (CoreIRButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CoreIRButton;
  v4 = [(CoreIRButton *)&v6 init];
  if (v4)
  {
    v4->_usagePage = [a3 decodeInt32ForKey:@"UsagePage"];
    v4->_usageID = [a3 decodeInt32ForKey:@"UsageID"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_usagePage forKey:@"UsagePage"];
  uint64_t usageID = self->_usageID;
  [a3 encodeInt32:usageID forKey:@"UsageID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(CoreIRButton *)self usagePage];
  uint64_t v6 = [(CoreIRButton *)self usageID];
  return (id)[v4 initWithUsagePage:v5 usageID:v6];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CoreIRButton;
  return (id)objc_msgSend(-[CoreIRButton description](&v3, sel_description), "stringByAppendingFormat:", @" usagePage: %u; usageID: %u;",
               self->_usagePage,
               self->_usageID);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unsigned int v5 = [(CoreIRButton *)self usagePage];
  if (v5 != [a3 usagePage]) {
    return 0;
  }
  unsigned int v6 = [(CoreIRButton *)self usageID];
  return v6 == [a3 usageID];
}

- (unint64_t)hash
{
  return self->_usageID ^ self->_usagePage;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (unsigned)usageID
{
  return self->_usageID;
}

@end