@interface HMDNaturalLightingActiveTransitionContext
- (BOOL)isEqual:(id)a3;
- (HMDNaturalLightingActiveTransitionContext)initWithStartDate:(id)a3 millisecondsElapsedSinceStartDate:(unint64_t)a4 transitionChecksum:(id)a5;
- (NSDate)startDate;
- (NSNumber)transitionChecksum;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (unint64_t)millisecondsElapsedSinceStartDate;
@end

@implementation HMDNaturalLightingActiveTransitionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionChecksum, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSNumber)transitionChecksum
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)millisecondsElapsedSinceStartDate
{
  return self->_millisecondsElapsedSinceStartDate;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDNaturalLightingActiveTransitionContext *)self startDate];
  v5 = (void *)[v3 initWithName:@"Start Date" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNaturalLightingActiveTransitionContext millisecondsElapsedSinceStartDate](self, "millisecondsElapsedSinceStartDate", v5));
  v8 = (void *)[v6 initWithName:@"Milliseconds Elapsed Since Start Date" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDNaturalLightingActiveTransitionContext *)self transitionChecksum];
  v11 = (void *)[v9 initWithName:@"Transition Checksum" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(HMDNaturalLightingActiveTransitionContext *)self startDate];
  uint64_t v4 = [v3 hash];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNaturalLightingActiveTransitionContext millisecondsElapsedSinceStartDate](self, "millisecondsElapsedSinceStartDate"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 startDate];
    id v9 = [(HMDNaturalLightingActiveTransitionContext *)self startDate];
    if ([v8 isEqual:v9]
      && (uint64_t v10 = [v7 millisecondsElapsedSinceStartDate],
          v10 == [(HMDNaturalLightingActiveTransitionContext *)self millisecondsElapsedSinceStartDate]))
    {
      v11 = [v7 transitionChecksum];
      v12 = [(HMDNaturalLightingActiveTransitionContext *)self transitionChecksum];
      char v13 = HMFEqualObjects();
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (HMDNaturalLightingActiveTransitionContext)initWithStartDate:(id)a3 millisecondsElapsedSinceStartDate:(unint64_t)a4 transitionChecksum:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDNaturalLightingActiveTransitionContext;
  uint64_t v10 = [(HMDNaturalLightingActiveTransitionContext *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v11;

    v10->_millisecondsElapsedSinceStartDate = a4;
    uint64_t v13 = [v9 copy];
    transitionChecksum = v10->_transitionChecksum;
    v10->_transitionChecksum = (NSNumber *)v13;
  }
  return v10;
}

@end