@interface HDBodySensorLocation
+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4;
+ (id)uuid;
- (id)description;
- (int64_t)sensorLocation;
- (void)setSensorLocation:(int64_t)a3;
@end

@implementation HDBodySensorLocation

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"2a38"];
}

+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(HDHealthServiceCharacteristic *)[HDBodySensorLocation alloc] _init];
  v7 = (char *)[v5 length];
  id v8 = v5;
  id v9 = [v8 bytes];

  id v13 = v9;
  if (v9)
  {
    objc_msgSend(v6, "setSensorLocation:", objc_msgSend((id)objc_opt_class(), "uint8FromData:before:", &v13, &v7[(void)v9]));
    id v10 = v6;
  }
  else
  {
    id v11 = +[NSError hk_error:303 format:@"Missing expected body location"];
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = [(id)objc_opt_class() uuid];
  v4 = +[NSString stringWithFormat:@"Heart rate sensor location (%@) value: %d ", v3, self->_sensorLocation];

  return v4;
}

- (int64_t)sensorLocation
{
  return self->_sensorLocation;
}

- (void)setSensorLocation:(int64_t)a3
{
  self->_sensorLocation = a3;
}

@end