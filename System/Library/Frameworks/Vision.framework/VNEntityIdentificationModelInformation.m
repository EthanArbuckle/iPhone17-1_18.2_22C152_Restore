@interface VNEntityIdentificationModelInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (NSDate)lastModificationDate;
- (VNEntityIdentificationModelAlgorithm)algorithm;
- (VNEntityIdentificationModelInformation)initWithCoder:(id)a3;
- (VNEntityIdentificationModelInformation)initWithVersion:(unint64_t)a3 algorithm:(id)a4 lastModificationDate:(id)a5 readOnly:(BOOL)a6;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNEntityIdentificationModelInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);

  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (NSDate)lastModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (VNEntityIdentificationModelAlgorithm)algorithm
{
  return (VNEntityIdentificationModelAlgorithm *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNEntityIdentificationModelInformation *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNEntityIdentificationModelInformation *)self version];
      if (v6 != [(VNEntityIdentificationModelInformation *)v5 version]) {
        goto LABEL_9;
      }
      BOOL v7 = [(VNEntityIdentificationModelInformation *)self isReadOnly];
      if (v7 != [(VNEntityIdentificationModelInformation *)v5 isReadOnly]) {
        goto LABEL_9;
      }
      v8 = [(VNEntityIdentificationModelInformation *)self algorithm];
      v9 = [(VNEntityIdentificationModelInformation *)v5 algorithm];
      int v10 = VisionCoreEqualOrNilObjects();

      if (v10)
      {
        v11 = [(VNEntityIdentificationModelInformation *)self lastModificationDate];
        v12 = [(VNEntityIdentificationModelInformation *)v5 lastModificationDate];
        char v13 = VisionCoreEqualOrNilObjects();
      }
      else
      {
LABEL_9:
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_lastModificationDate hash] ^ __ROR8__([(VNEntityIdentificationModelAlgorithm *)self->_algorithm hash] ^ __ROR8__(self->_version, 51), 51);
  uint64_t v4 = 43690;
  if (!self->_readOnly) {
    uint64_t v4 = 21845;
  }
  return v4 ^ __ROR8__(v3, 51);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_algorithm forKey:@"algorithm"];
  [v5 encodeObject:self->_lastModificationDate forKey:@"lastModDate"];
  [v5 encodeBool:self->_readOnly forKey:@"readOnly"];
}

- (VNEntityIdentificationModelInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModDate"];
  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algorithm"];
  uint64_t v8 = [v4 decodeBoolForKey:@"readOnly"];

  v9 = [(VNEntityIdentificationModelInformation *)self initWithVersion:v5 algorithm:v7 lastModificationDate:v6 readOnly:v8];
  return v9;
}

- (VNEntityIdentificationModelInformation)initWithVersion:(unint64_t)a3 algorithm:(id)a4 lastModificationDate:(id)a5 readOnly:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNEntityIdentificationModelInformation;
  v12 = [(VNEntityIdentificationModelInformation *)&v17 init];
  char v13 = v12;
  if (v12)
  {
    v12->_unint64_t version = a3;
    uint64_t v14 = [v10 copy];
    algorithm = v13->_algorithm;
    v13->_algorithm = (VNEntityIdentificationModelAlgorithm *)v14;

    objc_storeStrong((id *)&v13->_lastModificationDate, a5);
    v13->_readOnly = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end