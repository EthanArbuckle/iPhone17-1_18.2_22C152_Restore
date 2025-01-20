@interface INCarChargingConnectorPower
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCarChargingConnectorPower)initWithChargingConnector:(id)a3 maximumPower:(id)a4;
- (INCarChargingConnectorPower)initWithCoder:(id)a3;
- (NSMeasurement)maximumPower;
- (NSString)chargingConnector;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCarChargingConnectorPower

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumPower, 0);

  objc_storeStrong((id *)&self->_chargingConnector, 0);
}

- (NSMeasurement)maximumPower
{
  return self->_maximumPower;
}

- (NSString)chargingConnector
{
  return self->_chargingConnector;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"chargingConnector";
  chargingConnector = self->_chargingConnector;
  v4 = chargingConnector;
  if (!chargingConnector)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"maximumPower";
  v10[0] = v4;
  maximumPower = self->_maximumPower;
  v6 = maximumPower;
  if (!maximumPower)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (maximumPower)
  {
    if (chargingConnector) {
      goto LABEL_7;
    }
  }
  else
  {

    if (chargingConnector) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCarChargingConnectorPower;
  v6 = [(INCarChargingConnectorPower *)&v11 description];
  v7 = [(INCarChargingConnectorPower *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCarChargingConnectorPower *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_chargingConnector];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"chargingConnector");

  v9 = [v6 encodeObject:self->_maximumPower];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"maximumPower");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  chargingConnector = self->_chargingConnector;
  id v5 = a3;
  [v5 encodeObject:chargingConnector forKey:@"chargingConnector"];
  [v5 encodeObject:self->_maximumPower forKey:@"maximumPower"];
}

- (INCarChargingConnectorPower)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chargingConnector"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumPower"];

  v7 = [(INCarChargingConnectorPower *)self initWithChargingConnector:v5 maximumPower:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCarChargingConnectorPower *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      chargingConnector = self->_chargingConnector;
      BOOL v8 = 0;
      if (chargingConnector == v5->_chargingConnector
        || -[NSString isEqual:](chargingConnector, "isEqual:"))
      {
        maximumPower = self->_maximumPower;
        if (maximumPower == v5->_maximumPower || -[NSMeasurement isEqual:](maximumPower, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_chargingConnector hash];
  return [(NSMeasurement *)self->_maximumPower hash] ^ v3;
}

- (INCarChargingConnectorPower)initWithChargingConnector:(id)a3 maximumPower:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INCarChargingConnectorPower;
  BOOL v8 = [(INCarChargingConnectorPower *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    chargingConnector = v8->_chargingConnector;
    v8->_chargingConnector = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    maximumPower = v8->_maximumPower;
    v8->_maximumPower = (NSMeasurement *)v11;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"chargingConnector"];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v8 objectForKeyedSubscript:@"maximumPower"];
    v12 = [v7 decodeObjectOfClass:v10 from:v11];

    v13 = (void *)[objc_alloc((Class)a1) initWithChargingConnector:v9 maximumPower:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end