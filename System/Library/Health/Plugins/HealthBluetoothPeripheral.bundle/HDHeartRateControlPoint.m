@interface HDHeartRateControlPoint
+ (id)uuid;
- (HDHeartRateControlPoint)initWithOperation:(unsigned __int8)a3;
- (id)description;
- (id)getBinaryValueWithError:(id *)a3;
- (unsigned)operation;
- (void)setOperation:(unsigned __int8)a3;
@end

@implementation HDHeartRateControlPoint

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"2a39"];
}

- (HDHeartRateControlPoint)initWithOperation:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDHeartRateControlPoint;
  result = [(HDHealthServiceCharacteristic *)&v5 _init];
  if (result) {
    result->_operation = a3;
  }
  return result;
}

- (id)getBinaryValueWithError:(id *)a3
{
  v7 = &v8;
  if ([(id)objc_opt_class() uint8:self->_operation toData:&v7 before:&v9])
  {
    v4 = +[NSData dataWithBytes:&v8 length:v7 - &v8];
  }
  else
  {
    id v5 = +[NSError hk_error:303 description:@"Not enough buffer"];
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v4 = 0;
  }

  return v4;
}

- (id)description
{
  v3 = [(id)objc_opt_class() uuid];
  v4 = +[NSString stringWithFormat:@"Heart rate control point (%@) operation: %d", v3, self->_operation];

  return v4;
}

- (unsigned)operation
{
  return self->_operation;
}

- (void)setOperation:(unsigned __int8)a3
{
  self->_operation = a3;
}

@end