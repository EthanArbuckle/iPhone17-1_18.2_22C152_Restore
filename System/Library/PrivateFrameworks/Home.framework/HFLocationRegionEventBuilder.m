@interface HFLocationRegionEventBuilder
- (BOOL)isRegionAtHome:(id)a3;
- (CLCircularRegion)region;
- (HFLocationRegionEventBuilder)initWithEvent:(id)a3;
- (NSString)description;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)eventType;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (unint64_t)locationEventType;
- (void)setRegion:(id)a3;
@end

@implementation HFLocationRegionEventBuilder

- (HFLocationRegionEventBuilder)initWithEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFLocationRegionEventBuilder;
  v5 = [(HFEventBuilder *)&v10 initWithEvent:v4];
  if (v5)
  {
    v6 = [v4 region];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v4 region];
      [(HFLocationRegionEventBuilder *)v5 setRegion:v8];
    }
  }

  return v5;
}

- (unint64_t)locationEventType
{
  v2 = (void *)MEMORY[0x263F0E478];
  v3 = [(HFLocationRegionEventBuilder *)self region];
  unint64_t v4 = objc_msgSend(v2, "hf_locationEventTypeForRegion:", v3);

  return v4;
}

- (id)buildNewEventsFromCurrentState
{
  v3 = [(HFLocationRegionEventBuilder *)self region];

  if (v3)
  {
    unint64_t v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = objc_alloc(MEMORY[0x263F0E478]);
    v6 = [(HFLocationRegionEventBuilder *)self region];
    v7 = (void *)[v5 initWithRegion:v6];
    v8 = [v4 setWithObject:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isRegionAtHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HFLocationRegionEventBuilder *)self region];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F0E478];
    v7 = [(HFLocationRegionEventBuilder *)self region];
    char v8 = objc_msgSend(v6, "hf_isRegion:atHome:", v7, v4);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFLocationRegionEventBuilder *)self region];
  id v5 = (id)[v3 appendObject:v4 withName:@"region"];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (id)eventType
{
  return @"HFEventTypeLocation";
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E310];
  id v5 = a3;
  v6 = [(HFLocationRegionEventBuilder *)self region];
  v7 = [v5 locationEventUser];
  char v8 = objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:region:forUser:", v5, v6, v7);

  return v8;
}

- (id)comparisonKey
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)HFLocationRegionEventBuilder;
  id v4 = [(HFEventBuilder *)&v15 comparisonKey];
  id v5 = [(HFLocationRegionEventBuilder *)self region];
  [v5 center];
  uint64_t v7 = v6;
  char v8 = [(HFLocationRegionEventBuilder *)self region];
  [v8 center];
  uint64_t v10 = v9;
  v11 = [(HFLocationRegionEventBuilder *)self region];
  [v11 radius];
  v13 = [v3 stringWithFormat:@"%@-%f,%f:%f", v4, v7, v10, v12];

  return v13;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFLocationRegionEventBuilder;
  id v5 = [(HFEventBuilder *)&v9 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__HFLocationRegionEventBuilder_Comparison__compareToObject___block_invoke;
    v7[3] = &unk_264091060;
    v7[4] = self;
    id v8 = v4;
  }
  return v5;
}

BOOL __60__HFLocationRegionEventBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) region];
  [v2 center];
  double v4 = v3;
  id v5 = [*(id *)(a1 + 40) region];
  [v5 center];
  if (v4 == v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) region];
    [v7 center];
    double v9 = v8;
    uint64_t v10 = [*(id *)(a1 + 40) region];
    [v10 center];
    if (v9 == v11)
    {
      v13 = [*(id *)(a1 + 32) region];
      [v13 radius];
      double v15 = v14;
      v16 = [*(id *)(a1 + 40) region];
      [v16 radius];
      BOOL v12 = v15 != v17;
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

@end