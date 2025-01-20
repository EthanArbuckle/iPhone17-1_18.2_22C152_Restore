@interface HAPBTLETransactionIdentifier
+ (id)randomTransactionIdentifier;
+ (unsigned)generateRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (HAPBTLETransactionIdentifier)initWithUnsignedCharValue:(unsigned __int8)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (unint64_t)hash;
- (unsigned)unsignedCharValue;
@end

@implementation HAPBTLETransactionIdentifier

- (unsigned)unsignedCharValue
{
  return self->_unsignedCharValue;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPBTLETransactionIdentifier *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [(HAPBTLETransactionIdentifier *)self unsignedCharValue];
      BOOL v6 = v5 == [(HAPBTLETransactionIdentifier *)v4 unsignedCharValue];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(HAPBTLETransactionIdentifier *)self unsignedCharValue];
}

- (id)description
{
  return [(HAPBTLETransactionIdentifier *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HAPBTLETransactionIdentifier *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = NSString;
  BOOL v6 = [(HAPBTLETransactionIdentifier *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1F2C4E778;
  }
  v8 = [v5 stringWithFormat:@"<%@%@, Identifier = %u>", v6, v7, -[HAPBTLETransactionIdentifier unsignedCharValue](self, "unsignedCharValue")];
  if (v3) {

  }
  return v8;
}

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HAPBTLETransactionIdentifier)initWithUnsignedCharValue:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPBTLETransactionIdentifier;
  result = [(HAPBTLETransactionIdentifier *)&v5 init];
  if (result) {
    result->_unsignedCharValue = a3;
  }
  return result;
}

+ (id)randomTransactionIdentifier
{
  unsigned __int8 v6 = 0;
  v2 = HMFRandomDataWithLength();
  [v2 getBytes:&v6 length:1];
  BOOL v3 = [HAPBTLETransactionIdentifier alloc];
  v4 = [(HAPBTLETransactionIdentifier *)v3 initWithUnsignedCharValue:v6];

  return v4;
}

+ (unsigned)generateRequestIdentifier
{
  unsigned __int8 v5 = 0;
  v2 = HMFRandomDataWithLength();
  [v2 getBytes:&v5 length:1];
  unsigned __int8 v3 = v5;

  return v3;
}

@end