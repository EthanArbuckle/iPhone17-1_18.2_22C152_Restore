@interface NIBluetoothSample
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NIBluetoothSample)initWithBluetoothSample:(id)a3;
- (NIBluetoothSample)initWithCoder:(id)a3;
- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7;
- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7 partIdentifier:(id)a8 name:(id)a9 presenceConfigData:(id)a10;
- (NSData)presenceConfigData;
- (NSString)identifier;
- (NSString)model;
- (NSString)name;
- (NSString)partIdentifier;
- (double)machContinuousTimeSeconds;
- (double)rssi;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int)channel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setPresenceConfigData:(id)a3;
@end

@implementation NIBluetoothSample

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7
{
  return [(NIBluetoothSample *)self initWithRSSI:a4 identifier:a5 model:*(void *)&a6 channel:&stru_1EF5D0E08 machContinuousTimeSeconds:0 partIdentifier:0 name:a3 presenceConfigData:a7];
}

- (NIBluetoothSample)initWithRSSI:(double)a3 identifier:(id)a4 model:(id)a5 channel:(int)a6 machContinuousTimeSeconds:(double)a7 partIdentifier:(id)a8 name:(id)a9 presenceConfigData:(id)a10
{
  id v26 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (self)
  {
    self->_rssi = a3;
    objc_storeStrong((id *)&self->_identifier, a4);
    if (v19) {
      v23 = (__CFString *)v19;
    }
    else {
      v23 = @"NONE";
    }
    model = self->_model;
    self->_model = &v23->isa;

    self->_channel = a6;
    self->_machContinuousTimeSeconds = a7;
    objc_storeStrong((id *)&self->_partIdentifier, a8);
    objc_storeStrong((id *)&self->_name, a9);
    objc_storeStrong((id *)&self->_presenceConfigData, a10);
  }

  return self;
}

- (NIBluetoothSample)initWithBluetoothSample:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"NIBluetoothSample.mm", 53, @"Invalid parameter not satisfying: %@", @"sample" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)NIBluetoothSample;
  v6 = [(NIBluetoothSample *)&v21 init];
  if (v6)
  {
    [v5 rssi];
    v6->_rssi = v7;
    uint64_t v8 = [v5 identifier];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = [v5 model];
    model = v6->_model;
    v6->_model = (NSString *)v10;

    v6->_channel = [v5 channel];
    [v5 machContinuousTimeSeconds];
    v6->_machContinuousTimeSeconds = v12;
    uint64_t v13 = [v5 partIdentifier];
    partIdentifier = v6->_partIdentifier;
    v6->_partIdentifier = (NSString *)v13;

    uint64_t v15 = [v5 name];
    name = v6->_name;
    v6->_name = (NSString *)v15;

    uint64_t v17 = [v5 presenceConfigData];
    presenceConfigData = v6->_presenceConfigData;
    v6->_presenceConfigData = (NSData *)v17;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithBluetoothSample:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"rssi" forKey:self->_rssi];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_model forKey:@"model"];
  [v4 encodeInt:self->_channel forKey:@"channel"];
  [v4 encodeDouble:@"machContinuousTimeSeconds" forKey:self->_machContinuousTimeSeconds];
  [v4 encodeObject:self->_partIdentifier forKey:@"partIdentifier"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_presenceConfigData forKey:@"presenceConfigData"];
}

- (NIBluetoothSample)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & (v6 != 0)) == 1)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 decodeDoubleForKey:@"rssi"];
    double v8 = v7;
    int v9 = [v4 decodeIntForKey:@"channel"];
    [v4 decodeDoubleForKey:@"machContinuousTimeSeconds"];
    double v11 = v10;
    double v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partIdentifier"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        double v12 = 0;
      }
    }
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v13 = 0;
      }
    }
    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presenceConfigData"];
    v19.receiver = self;
    v19.super_class = (Class)NIBluetoothSample;
    uint64_t v15 = [(NIBluetoothSample *)&v19 init];
    v16 = v15;
    if (v15)
    {
      v15->_rssi = v8;
      objc_storeStrong((id *)&v15->_identifier, v5);
      objc_storeStrong((id *)&v16->_model, v6);
      v16->_channel = v9;
      v16->_machContinuousTimeSeconds = v11;
      objc_storeStrong((id *)&v16->_partIdentifier, v12);
      objc_storeStrong((id *)&v16->_name, v13);
      objc_storeStrong((id *)&v16->_presenceConfigData, v14);
    }
    self = v16;

    uint64_t v17 = self;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (NIBluetoothSample *)v4;
    v6 = v5;
    if (v5 == self)
    {
      char v37 = 1;
LABEL_32:

      goto LABEL_33;
    }
    identifier = self->_identifier;
    if (!identifier)
    {
      double v8 = [(NIBluetoothSample *)v5 identifier];

      if (!v8)
      {
        char v10 = 1;
LABEL_7:
        model = self->_model;
        if (!model)
        {
          double v12 = [(NIBluetoothSample *)v6 model];

          if (!v12)
          {
            char v14 = 1;
LABEL_11:
            double rssi = self->_rssi;
            [(NIBluetoothSample *)v6 rssi];
            double v17 = v16;
            int channel = self->_channel;
            int v39 = [(NIBluetoothSample *)v6 channel];
            double machContinuousTimeSeconds = self->_machContinuousTimeSeconds;
            [(NIBluetoothSample *)v6 machContinuousTimeSeconds];
            double v21 = v20;
            partIdentifier = self->_partIdentifier;
            if (!partIdentifier)
            {
              v23 = [(NIBluetoothSample *)v6 partIdentifier];

              if (!v23)
              {
                char v25 = 1;
LABEL_15:
                name = self->_name;
                if (!name)
                {
                  v27 = [(NIBluetoothSample *)v6 name];

                  if (!v27)
                  {
                    char v29 = v10;
                    BOOL v31 = 0;
LABEL_19:
                    presenceConfigData = self->_presenceConfigData;
                    if (!presenceConfigData)
                    {
                      v33 = [(NIBluetoothSample *)v6 presenceConfigData];

                      if (!v33)
                      {
                        char v35 = 1;
                        goto LABEL_23;
                      }
                      presenceConfigData = self->_presenceConfigData;
                    }
                    v34 = [(NIBluetoothSample *)v6 presenceConfigData];
                    char v35 = [(NSData *)presenceConfigData isEqualToData:v34];

LABEL_23:
                    char v36 = v29 & v14 ^ 1;
                    if (rssi != v17) {
                      char v36 = 1;
                    }
                    if (channel != v39) {
                      char v36 = 1;
                    }
                    if (machContinuousTimeSeconds != v21) {
                      char v36 = 1;
                    }
                    char v37 = v25 & ~(v36 | v31) & v35;
                    goto LABEL_32;
                  }
                  name = self->_name;
                }
                v28 = [(NIBluetoothSample *)v6 name];
                char v29 = v10;
                BOOL v30 = [(NSString *)name isEqualToString:v28];

                BOOL v31 = !v30;
                goto LABEL_19;
              }
              partIdentifier = self->_partIdentifier;
            }
            v24 = [(NIBluetoothSample *)v6 partIdentifier];
            char v25 = [(NSString *)partIdentifier isEqualToString:v24];

            goto LABEL_15;
          }
          model = self->_model;
        }
        uint64_t v13 = [(NIBluetoothSample *)v6 model];
        char v14 = [(NSString *)model isEqualToString:v13];

        goto LABEL_11;
      }
      identifier = self->_identifier;
    }
    int v9 = [(NIBluetoothSample *)v6 identifier];
    char v10 = [(NSString *)identifier isEqualToString:v9];

    goto LABEL_7;
  }
  char v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  char v14 = [NSNumber numberWithDouble:self->_rssi];
  uint64_t v3 = [v14 hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  NSUInteger v5 = [(NSString *)self->_model hash];
  v6 = [NSNumber numberWithInteger:self->_channel];
  uint64_t v7 = [v6 hash];
  double v8 = [NSNumber numberWithDouble:self->_machContinuousTimeSeconds];
  uint64_t v9 = [v8 hash];
  NSUInteger v10 = [(NSString *)self->_name hash];
  NSUInteger v11 = [(NSString *)self->_partIdentifier hash];
  unint64_t v12 = v4 ^ v3 ^ v5 ^ v7 ^ v9 ^ v10 ^ v11 ^ [(NSData *)self->_presenceConfigData hash];

  return v12;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  NSUInteger v4 = (objc_class *)objc_opt_class();
  NSUInteger v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@"Identifier: %@", self->_identifier];
  [v6 appendFormat:@", RSSI: %.2f", *(void *)&self->_rssi];
  [v6 appendFormat:@", Mach Continuous Time Seconds: %f", *(void *)&self->_machContinuousTimeSeconds];
  [v6 appendFormat:@", Channel: %d", self->_channel];
  [v6 appendFormat:@", Model: %@", self->_model];
  uint64_t v7 = [(NIBluetoothSample *)self descriptionInternal];
  [v6 appendString:v7];

  [v6 appendString:@">"];

  return v6;
}

- (id)descriptionInternal
{
  return (id)[NSString stringWithFormat:@", partIdentifier: %@", self->_partIdentifier];
}

- (double)rssi
{
  return self->_rssi;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int)channel
{
  return self->_channel;
}

- (double)machContinuousTimeSeconds
{
  return self->_machContinuousTimeSeconds;
}

- (NSString)partIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)presenceConfigData
{
  return self->_presenceConfigData;
}

- (void)setPresenceConfigData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceConfigData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_partIdentifier, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end