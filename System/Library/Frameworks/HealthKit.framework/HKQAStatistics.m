@interface HKQAStatistics
+ (BOOL)supportsSecureCoding;
- (HKQAStatistics)initWithCoder:(id)a3;
- (HKQAStatistics)initWithSampleCount:(id)a3 sampleCountByType:(id)a4;
- (NSDictionary)sampleCountByType;
- (NSNumber)sampleCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKQAStatistics

- (HKQAStatistics)initWithSampleCount:(id)a3 sampleCountByType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKQAStatistics;
  v9 = [(HKQAStatistics *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sampleCount, a3);
    objc_storeStrong((id *)&v10->_sampleCountByType, a4);
  }

  return v10;
}

- (HKQAStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKQAStatistics;
  v5 = [(HKQAStatistics *)&v18 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_sampleCount);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    sampleCount = v5->_sampleCount;
    v5->_sampleCount = (NSNumber *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v10, "initWithObjects:", v11, v12, objc_opt_class(), 0);
    v14 = NSStringFromSelector(sel_sampleCountByType);
    uint64_t v15 = [v4 decodeObjectOfClasses:v13 forKey:v14];
    sampleCountByType = v5->_sampleCountByType;
    v5->_sampleCountByType = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sampleCount = self->_sampleCount;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_sampleCount);
  [v5 encodeObject:sampleCount forKey:v6];

  sampleCountByType = self->_sampleCountByType;
  NSStringFromSelector(sel_sampleCountByType);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:sampleCountByType forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)sampleCount
{
  return self->_sampleCount;
}

- (NSDictionary)sampleCountByType
{
  return self->_sampleCountByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCountByType, 0);

  objc_storeStrong((id *)&self->_sampleCount, 0);
}

@end