@interface HKValueHistogramCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKValueHistogramCollection)initWithCoder:(id)a3;
- (HKValueHistogramCollection)initWithQuantityRanges:(id)a3 valueHistogramsByDateIntervalIndex:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6;
- (NSArray)quantityRanges;
- (NSArray)valueHistograms;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (NSDictionary)valueHistogramsByDateIntervalIndex;
- (_HKDateIntervalCollection)intervalCollection;
- (id)description;
- (id)valueHistogramForDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKValueHistogramCollection

- (HKValueHistogramCollection)initWithQuantityRanges:(id)a3 valueHistogramsByDateIntervalIndex:(id)a4 anchorDate:(id)a5 intervalComponents:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKValueHistogramCollection;
  v15 = [(HKValueHistogramCollection *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_quantityRanges, a3);
    objc_storeStrong((id *)&v16->_valueHistogramsByDateIntervalIndex, a4);
    objc_storeStrong((id *)&v16->_anchorDate, a5);
    objc_storeStrong((id *)&v16->_intervalComponents, a6);
    v17 = [[_HKDateIntervalCollection alloc] initWithAnchorDate:v13 intervalComponents:v14];
    intervalCollection = v16->_intervalCollection;
    v16->_intervalCollection = v17;
  }
  return v16;
}

- (NSArray)valueHistograms
{
  v3 = [(NSDictionary *)self->_valueHistogramsByDateIntervalIndex allKeys];
  v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HKValueHistogramCollection_valueHistograms__block_invoke;
  v7[3] = &unk_1E58C4510;
  v7[4] = self;
  v5 = objc_msgSend(v4, "hk_map:", v7);

  return (NSArray *)v5;
}

uint64_t __45__HKValueHistogramCollection_valueHistograms__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:a2];
}

- (id)valueHistogramForDate:(id)a3
{
  uint64_t v9 = 0;
  id v4 = [(_HKDateIntervalCollection *)self->_intervalCollection dateIntervalContainingDate:a3 index:&v9];
  valueHistogramsByDateIntervalIndex = self->_valueHistogramsByDateIntervalIndex;
  v6 = [NSNumber numberWithInteger:v9];
  v7 = [(NSDictionary *)valueHistogramsByDateIntervalIndex objectForKeyedSubscript:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKValueHistogramCollection *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if ([(HKValueHistogramCollection *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    if ([(NSArray *)self->_quantityRanges isEqual:v5->_quantityRanges]
      && [(NSDictionary *)self->_valueHistogramsByDateIntervalIndex isEqual:v5->_valueHistogramsByDateIntervalIndex]&& [(NSDate *)self->_anchorDate isEqual:v5->_anchorDate])
    {
      char v6 = [(NSDateComponents *)self->_intervalComponents isEqual:v5->_intervalComponents];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p quantityRanges=%@ valueHistograms=%@ anchorDate=%@ intervalComponents=%@>", objc_opt_class(), self, self->_quantityRanges, self->_valueHistogramsByDateIntervalIndex, self->_anchorDate, self->_intervalComponents];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKValueHistogramCollection)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  char v6 = objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"quantityRanges"];

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "hk_typesForDictionaryMapping:to:", v9, objc_opt_class());
  id v11 = [v5 decodeObjectOfClasses:v10 forKey:@"valueHistogramsByDateIntervalIndex"];

  id v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"anchorDate"];
  id v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"intervalComponents"];

  id v14 = [(HKValueHistogramCollection *)self initWithQuantityRanges:v7 valueHistogramsByDateIntervalIndex:v11 anchorDate:v12 intervalComponents:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  quantityRanges = self->_quantityRanges;
  id v5 = a3;
  [v5 encodeObject:quantityRanges forKey:@"quantityRanges"];
  [v5 encodeObject:self->_valueHistogramsByDateIntervalIndex forKey:@"valueHistogramsByDateIntervalIndex"];
  [v5 encodeObject:self->_anchorDate forKey:@"anchorDate"];
  [v5 encodeObject:self->_intervalComponents forKey:@"intervalComponents"];
}

- (NSArray)quantityRanges
{
  return self->_quantityRanges;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (NSDictionary)valueHistogramsByDateIntervalIndex
{
  return self->_valueHistogramsByDateIntervalIndex;
}

- (_HKDateIntervalCollection)intervalCollection
{
  return self->_intervalCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalCollection, 0);
  objc_storeStrong((id *)&self->_valueHistogramsByDateIntervalIndex, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);

  objc_storeStrong((id *)&self->_quantityRanges, 0);
}

@end