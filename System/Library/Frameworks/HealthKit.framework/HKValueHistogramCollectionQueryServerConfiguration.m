@interface HKValueHistogramCollectionQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKValueHistogramCollectionQueryServerConfiguration)initWithCoder:(id)a3;
- (NSArray)quantityRanges;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorDate:(id)a3;
- (void)setIntervalComponents:(id)a3;
- (void)setQuantityRanges:(id)a3;
@end

@implementation HKValueHistogramCollectionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKValueHistogramCollectionQueryServerConfiguration;
  v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 7, self->_anchorDate);
  objc_storeStrong(v4 + 8, self->_intervalComponents);
  objc_storeStrong(v4 + 9, self->_quantityRanges);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogramCollectionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKValueHistogramCollectionQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchorDate"];
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intervalComponents"];
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v8;

    v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"quantityRanges"];
    quantityRanges = v5->_quantityRanges;
    v5->_quantityRanges = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKValueHistogramCollectionQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorDate, @"anchorDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_intervalComponents forKey:@"intervalComponents"];
  [v4 encodeObject:self->_quantityRanges forKey:@"quantityRanges"];
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (void)setQuantityRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityRanges, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);

  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end