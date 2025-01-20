@interface SKProductSubscriptionPeriod
- (NSUInteger)numberOfUnits;
- (SKProductPeriodUnit)unit;
- (SKProductSubscriptionPeriod)init;
- (SKProductSubscriptionPeriod)initWithISO8601String:(id)a3;
- (id)toISO8601String;
- (void)_setNumberOfUnits:(unint64_t)a3;
- (void)_setUnit:(unint64_t)a3;
@end

@implementation SKProductSubscriptionPeriod

- (NSUInteger)numberOfUnits
{
  return *((void *)self->_internal + 1);
}

- (SKProductPeriodUnit)unit
{
  return *((void *)self->_internal + 2);
}

- (void)_setNumberOfUnits:(unint64_t)a3
{
  *((void *)self->_internal + 1) = a3;
}

- (void)_setUnit:(unint64_t)a3
{
  *((void *)self->_internal + 2) = a3;
}

- (SKProductSubscriptionPeriod)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductSubscriptionPeriod;
  v2 = [(SKProductSubscriptionPeriod *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductSubscriptionPeriodInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (SKProductSubscriptionPeriod)initWithISO8601String:(id)a3
{
  id v4 = a3;
  v5 = [(SKProductSubscriptionPeriod *)self init];
  if (!v5) {
    goto LABEL_18;
  }
  objc_super v6 = [MEMORY[0x1E4F28FE8] scannerWithString:v4];
  id v16 = 0;
  [v6 scanString:@"P" intoString:&v16];
  id v7 = v16;
  if (!v7)
  {

    v5 = 0;
  }
  uint64_t v15 = 0;
  [v6 scanInteger:&v15];
  if (v15)
  {
    *((void *)v5->_internal + 1) = v15;

    v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"DWMY"];
    id v14 = 0;
    [v6 scanCharactersFromSet:v8 intoString:&v14];
    id v9 = v14;
    v10 = v9;
    if (!v9 || [v9 length] != 1)
    {

      v5 = 0;
    }
    if ([v10 isEqualToString:@"D"])
    {
      *((void *)v5->_internal + 2) = 0;
    }
    else
    {
      if ([v10 isEqualToString:@"W"])
      {
        id internal = v5->_internal;
        uint64_t v12 = 1;
      }
      else if ([v10 isEqualToString:@"M"])
      {
        id internal = v5->_internal;
        uint64_t v12 = 2;
      }
      else
      {
        if (![v10 isEqualToString:@"Y"])
        {

          v5 = 0;
          goto LABEL_17;
        }
        id internal = v5->_internal;
        uint64_t v12 = 3;
      }
      internal[2] = v12;
    }
LABEL_17:

LABEL_18:
    return v5;
  }

  __break(1u);
  return result;
}

- (id)toISO8601String
{
  SKProductPeriodUnit v3 = [(SKProductSubscriptionPeriod *)self unit];
  if (v3 > SKProductPeriodUnitYear) {
    id v4 = &stru_1F08A7B80;
  }
  else {
    id v4 = off_1E5FA9A88[v3];
  }
  v5 = NSString;
  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKProductSubscriptionPeriod numberOfUnits](self, "numberOfUnits"));
  id v7 = [v5 stringWithFormat:@"P%@%@", v6, v4];

  return v7;
}

- (void).cxx_destruct
{
}

@end