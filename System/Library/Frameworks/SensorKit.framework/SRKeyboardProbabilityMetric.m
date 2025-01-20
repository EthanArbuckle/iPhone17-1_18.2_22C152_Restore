@interface SRKeyboardProbabilityMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)distributionSampleValues;
- (NSMutableArray)mutableSampleValues;
- (NSUnit)unitType;
- (SRKeyboardProbabilityMetric)init;
- (SRKeyboardProbabilityMetric)initWithCoder:(id)a3;
- (id)description;
- (int64_t)totalDataSamples;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMutableSampleValues:(id)a3;
- (void)setTotalDataSamples:(int64_t)a3;
- (void)setUnitType:(id)a3;
@end

@implementation SRKeyboardProbabilityMetric

- (SRKeyboardProbabilityMetric)init
{
  v4.receiver = self;
  v4.super_class = (Class)SRKeyboardProbabilityMetric;
  v2 = [(SRKeyboardProbabilityMetric *)&v4 init];
  if (v2) {
    v2->_mutableSampleValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (int64_t)totalDataSamples
{
  return [(NSMutableArray *)self->_mutableSampleValues count];
}

- (NSArray)distributionSampleValues
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_unitType) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRKeyboardMetrics.m", 48, @"Unit type is nil");
  }
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_mutableSampleValues, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mutableSampleValues = self->_mutableSampleValues;
  uint64_t v5 = [(NSMutableArray *)mutableSampleValues countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(mutableSampleValues);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F08980]);
        [v9 doubleValue];
        v11 = objc_msgSend(v10, "initWithDoubleValue:unit:", self->_unitType);
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSMutableArray *)mutableSampleValues countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:v3];
}

- (void)dealloc
{
  [(SRKeyboardProbabilityMetric *)self setMutableSampleValues:0];
  [(SRKeyboardProbabilityMetric *)self setUnitType:0];
  v3.receiver = self;
  v3.super_class = (Class)SRKeyboardProbabilityMetric;
  [(SRKeyboardProbabilityMetric *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mutableSampleValues = self->_mutableSampleValues;
  uint64_t v6 = [a3 mutableSampleValues];

  return [(NSMutableArray *)mutableSampleValues isEqual:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRKeyboardProbabilityMetric)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRKeyboardMetrics.m", 83, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  v10.receiver = self;
  v10.super_class = (Class)SRKeyboardProbabilityMetric;
  uint64_t v6 = [(SRKeyboardProbabilityMetric *)&v10 init];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v6->_mutableSampleValues = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"SampleValues"), "mutableCopy");
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRKeyboardMetrics.m", 92, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  mutableSampleValues = self->_mutableSampleValues;

  [a3 encodeObject:mutableSampleValues forKey:@"SampleValues"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ totalDataSamples: %ld %@ }", -[SRKeyboardProbabilityMetric totalDataSamples](self, "totalDataSamples"), self->_mutableSampleValues];
}

- (NSUnit)unitType
{
  return (NSUnit *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUnitType:(id)a3
{
}

- (void)setTotalDataSamples:(int64_t)a3
{
  self->_totalDataSamples = a3;
}

- (NSMutableArray)mutableSampleValues
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMutableSampleValues:(id)a3
{
}

@end