@interface HDEnhancedFTMSData
+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4;
+ (id)uuid;
- (id)description;
- (id)generateDatums:(id)a3;
- (id)getBinaryValueWithError:(id *)a3;
@end

@implementation HDEnhancedFTMSData

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2ADD"];
}

+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [objc_alloc((Class)a1) _init];
  id v8 = v6;
  id v17 = [v8 bytes];
  v9 = (char *)[v8 length] + (void)v17;
  unsigned __int8 v10 = [(id)objc_opt_class() uint8FromData:&v17 before:v9];
  if (v10)
  {
    uint64_t v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)[(id)objc_opt_class() uint32FromData:&v17 before:v9] * 0.000001);
    v12 = (void *)v7[2];
    v7[2] = v11;
  }
  if ((v10 & 2) != 0)
  {
    uint64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)[(id)objc_opt_class() uint32FromData:&v17 before:v9] * 0.000001);
    v14 = (void *)v7[3];
    v7[3] = v13;
  }
  if (v17)
  {
    v15 = v7;
  }
  else
  {
    +[NSError hk_assignError:code:format:](NSError, "hk_assignError:code:format:", a4, 303, @"Insufficient data (%lu bytes) for Eurotas Enhanced FTMS", [v8 length]);
    v15 = 0;
  }

  return v15;
}

- (id)getBinaryValueWithError:(id *)a3
{
  return 0;
}

- (id)generateDatums:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (self->_instantaneousSpeed)
  {
    id v6 = +[HKUnit unitFromString:@"km/hr"];
    [(NSNumber *)self->_instantaneousSpeed doubleValue];
    v7 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v6);

    id v8 = objc_alloc((Class)HDQuantityDatum);
    v9 = +[NSUUID UUID];
    id v10 = [v8 initWithIdentifier:v9 dateInterval:v4 resumeContext:0 quantity:v7];

    [v5 setObject:v10 forKeyedSubscript:&off_63DB0];
  }
  if (self->_averageSpeed)
  {
    uint64_t v11 = +[HKUnit unitFromString:@"km/hr"];
    [(NSNumber *)self->_averageSpeed doubleValue];
    v12 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v11);

    id v13 = objc_alloc((Class)HDQuantityDatum);
    v14 = +[NSUUID UUID];
    id v15 = [v13 initWithIdentifier:v14 dateInterval:v4 resumeContext:0 quantity:v12];

    [v5 setObject:v15 forKeyedSubscript:&off_63DC8];
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: instantaneousSpeed=%@, averageSpeed=%@>", objc_opt_class(), self->_instantaneousSpeed, self->_averageSpeed];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageSpeed, 0);

  objc_storeStrong((id *)&self->_instantaneousSpeed, 0);
}

@end