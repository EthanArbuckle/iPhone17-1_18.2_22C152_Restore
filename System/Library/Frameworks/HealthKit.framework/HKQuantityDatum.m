@interface HKQuantityDatum
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)quantity;
- (HKQuantityDatum)init;
- (HKQuantityDatum)initWithCoder:(id)a3;
- (HKQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 quantity:(id)a5 resumeContext:(id)a6;
- (NSData)resumeContext;
- (NSDateInterval)dateInterval;
- (NSUUID)UUID;
- (id)description;
- (id)saveCompletion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSaveCompletion:(id)a3;
@end

@implementation HKQuantityDatum

- (HKQuantityDatum)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 quantity:(id)a5 resumeContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKQuantityDatum;
  v14 = [(HKQuantityDatum *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    UUID = v14->_UUID;
    v14->_UUID = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    dateInterval = v14->_dateInterval;
    v14->_dateInterval = (NSDateInterval *)v17;

    uint64_t v19 = [v12 copy];
    quantity = v14->_quantity;
    v14->_quantity = (HKQuantity *)v19;

    uint64_t v21 = [v13 copy];
    resumeContext = v14->_resumeContext;
    v14->_resumeContext = (NSData *)v21;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"hkqd_id"];
  [v5 encodeObject:self->_dateInterval forKey:@"hkqd_dt"];
  [v5 encodeObject:self->_quantity forKey:@"hkqd_qt"];
  [v5 encodeObject:self->_resumeContext forKey:@"hkqd_cxt"];
}

- (HKQuantityDatum)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hkqd_id"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hkqd_dt"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hkqd_qt"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hkqd_cxt"];

  v9 = [(HKQuantityDatum *)self initWithIdentifier:v5 dateInterval:v6 quantity:v7 resumeContext:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![(NSUUID *)self->_UUID isEqual:v4[1]]
    || ![(NSDateInterval *)self->_dateInterval isEqual:v4[3]]
    || ![(HKQuantity *)self->_quantity isEqual:v4[2]])
  {
    goto LABEL_8;
  }
  resumeContext = self->_resumeContext;
  v6 = (NSData *)v4[4];
  if (resumeContext == v6)
  {
    char v7 = 1;
    goto LABEL_9;
  }
  if (v6) {
    char v7 = -[NSData isEqual:](resumeContext, "isEqual:");
  }
  else {
LABEL_8:
  }
    char v7 = 0;
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_UUID hash];
  uint64_t v4 = [(NSDateInterval *)self->_dateInterval hash] ^ v3;
  unint64_t v5 = [(HKQuantity *)self->_quantity hash];
  return v4 ^ v5 ^ [(NSData *)self->_resumeContext hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(HKQuantityDatum *)self UUID];
  unint64_t v5 = [(HKQuantityDatum *)self dateInterval];
  v6 = [(HKQuantityDatum *)self quantity];
  char v7 = [v3 stringWithFormat:@"<%@: %@, quantity: %@>", v4, v5, v6];

  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSData)resumeContext
{
  return self->_resumeContext;
}

- (id)saveCompletion
{
  return self->_saveCompletion;
}

- (void)setSaveCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveCompletion, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_quantity, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end