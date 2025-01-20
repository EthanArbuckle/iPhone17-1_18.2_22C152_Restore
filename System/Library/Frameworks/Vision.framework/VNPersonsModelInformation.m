@interface VNPersonsModelInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (NSDate)lastModificationDate;
- (VNPersonsModelAlgorithm)algorithm;
- (VNPersonsModelInformation)initWithCoder:(id)a3;
- (VNPersonsModelInformation)initWithVersion:(unint64_t)a3 lastModificationDate:(id)a4 algorithm:(id)a5 readOnly:(BOOL)a6;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNPersonsModelInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithm, 0);

  objc_storeStrong((id *)&self->_lastModificationDate, 0);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (VNPersonsModelAlgorithm)algorithm
{
  return self->_algorithm;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNPersonsModelInformation *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNPersonsModelInformation *)self version];
      if (v6 == [(VNPersonsModelInformation *)v5 version]
        && ([(VNPersonsModelInformation *)self lastModificationDate],
            v7 = objc_claimAutoreleasedReturnValue(),
            [(VNPersonsModelInformation *)v5 lastModificationDate],
            v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = [v7 isEqualToDate:v8],
            v8,
            v7,
            (v9 & 1) != 0))
      {
        v10 = [(VNPersonsModelInformation *)self algorithm];
        v11 = [(VNPersonsModelInformation *)v5 algorithm];
        char v12 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  return [(VNPersonsModelAlgorithm *)self->_algorithm hash] ^ __ROR8__([(NSDate *)self->_lastModificationDate hash] ^ __ROR8__(self->_version, 51), 51);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_version forKey:@"version"];
  [v4 encodeObject:self->_lastModificationDate forKey:@"lastModDate"];
  [v4 encodeObject:self->_algorithm forKey:@"algorithm"];
  [v4 encodeBool:self->_readOnly forKey:@"readOnly"];
}

- (VNPersonsModelInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModDate"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"algorithm"];
  v8 = -[VNPersonsModelInformation initWithVersion:lastModificationDate:algorithm:readOnly:](self, "initWithVersion:lastModificationDate:algorithm:readOnly:", v5, v6, v7, [v4 decodeBoolForKey:@"readOnly"]);

  return v8;
}

- (VNPersonsModelInformation)initWithVersion:(unint64_t)a3 lastModificationDate:(id)a4 algorithm:(id)a5 readOnly:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VNPersonsModelInformation;
  v13 = [(VNPersonsModelInformation *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_version = a3;
    objc_storeStrong((id *)&v13->_lastModificationDate, a4);
    uint64_t v15 = [v12 copy];
    algorithm = v14->_algorithm;
    v14->_algorithm = (VNPersonsModelAlgorithm *)v15;

    v14->_readOnly = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end