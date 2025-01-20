@interface HKOntologyEducationContentSectionData
+ (BOOL)supportsSecureCoding;
- (BOOL)deleted;
- (BOOL)isEqual:(id)a3;
- (HKOntologyEducationContentSectionData)initWithCoder:(id)a3;
- (HKOntologyEducationContentSectionData)initWithStringValues:(id)a3 sectionDataType:(int64_t)a4 version:(int64_t)a5 timestamp:(double)a6 deleted:(BOOL)a7;
- (NSArray)stringValues;
- (double)timestamp;
- (id)description;
- (int64_t)sectionDataType;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOntologyEducationContentSectionData

- (HKOntologyEducationContentSectionData)initWithStringValues:(id)a3 sectionDataType:(int64_t)a4 version:(int64_t)a5 timestamp:(double)a6 deleted:(BOOL)a7
{
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKOntologyEducationContentSectionData;
  v13 = [(HKOntologyEducationContentSectionData *)&v17 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    stringValues = v13->_stringValues;
    v13->_stringValues = (NSArray *)v14;

    v13->_sectionDataType = a4;
    v13->_version = a5;
    v13->_timestamp = a6;
    v13->_deleted = a7;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  if (self->_deleted) {
    v4 = @" DELETED";
  }
  else {
    v4 = &stru_1EEC60288;
  }
  int64_t sectionDataType = self->_sectionDataType;
  v6 = [(NSArray *)self->_stringValues componentsJoinedByString:@", "];
  int64_t version = self->_version;
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_timestamp];
  v9 = HKDiagnosticStringFromDate(v8);
  v10 = [v3 stringWithFormat:@"<%ld%@ %@ %ld, (%@)>", sectionDataType, v4, v6, version, v9];

  return v10;
}

- (unint64_t)hash
{
  return self->_sectionDataType ^ self->_version ^ [(NSArray *)self->_stringValues hash] ^ self->_deleted ^ (unint64_t)self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKOntologyEducationContentSectionData *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      stringValues = self->_stringValues;
      v7 = [(HKOntologyEducationContentSectionData *)v5 stringValues];
      if ([(NSArray *)stringValues isEqual:v7]
        && (int64_t sectionDataType = self->_sectionDataType,
            sectionDataType == [(HKOntologyEducationContentSectionData *)v5 sectionDataType])
        && (int64_t version = self->_version, version == [(HKOntologyEducationContentSectionData *)v5 version])
        && (double timestamp = self->_timestamp,
            [(HKOntologyEducationContentSectionData *)v5 timestamp],
            timestamp == v11))
      {
        BOOL deleted = self->_deleted;
        BOOL v13 = deleted == [(HKOntologyEducationContentSectionData *)v5 deleted];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  stringValues = self->_stringValues;
  id v5 = a3;
  [v5 encodeObject:stringValues forKey:@"stringValues"];
  [v5 encodeInteger:self->_sectionDataType forKey:@"type"];
  [v5 encodeInteger:self->_version forKey:@"version"];
  [v5 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v5 encodeBool:self->_deleted forKey:@"deleted"];
}

- (HKOntologyEducationContentSectionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOntologyEducationContentSectionData;
  id v5 = [(HKOntologyEducationContentSectionData *)&v11 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"stringValues"];
    stringValues = v5->_stringValues;
    v5->_stringValues = (NSArray *)v7;

    v5->_int64_t sectionDataType = [v4 decodeIntegerForKey:@"type"];
    v5->_int64_t version = [v4 decodeIntegerForKey:@"version"];
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_double timestamp = v9;
    v5->_BOOL deleted = [v4 decodeBoolForKey:@"deleted"];
  }

  return v5;
}

- (NSArray)stringValues
{
  return self->_stringValues;
}

- (int64_t)sectionDataType
{
  return self->_sectionDataType;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
}

@end