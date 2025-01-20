@interface _HKVerifiableClinicalRecordQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)recordTypes;
- (NSArray)sourceTypes;
- (_HKVerifiableClinicalRecordQueryServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordTypes:(id)a3;
- (void)setSourceTypes:(id)a3;
@end

@implementation _HKVerifiableClinicalRecordQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKVerifiableClinicalRecordQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setRecordTypes:self->_recordTypes];
  [v4 setSourceTypes:self->_sourceTypes];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKVerifiableClinicalRecordQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKVerifiableClinicalRecordQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v17 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v8 forKey:@"recordTypes"];
    recordTypes = v5->_recordTypes;
    v5->_recordTypes = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"sourceTypes"];
    sourceTypes = v5->_sourceTypes;
    v5->_sourceTypes = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKVerifiableClinicalRecordQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordTypes, @"recordTypes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sourceTypes forKey:@"sourceTypes"];
}

- (NSArray)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
}

- (NSArray)sourceTypes
{
  return self->_sourceTypes;
}

- (void)setSourceTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTypes, 0);

  objc_storeStrong((id *)&self->_recordTypes, 0);
}

@end