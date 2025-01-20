@interface HKAccessibilityData
- (HKAccessibilityData)initWithPointData:(id)a3 accessibilitySpans:(id)a4;
- (NSArray)accessibilityPointData;
- (NSDictionary)accessibilitySpans;
- (id)description;
@end

@implementation HKAccessibilityData

- (HKAccessibilityData)initWithPointData:(id)a3 accessibilitySpans:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKAccessibilityData;
  v9 = [(HKAccessibilityData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessibilityPointData, a3);
    objc_storeStrong((id *)&v10->_accessibilitySpans, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"HKChartAccessbilityData %p:", self);
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(HKAccessibilityData *)self accessibilitySpans];
  id v7 = objc_msgSend(v5, "stringWithFormat:", @"  accessibilitySpans %lu", objc_msgSend(v6, "count"));
  [v3 addObject:v7];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [(HKAccessibilityData *)self accessibilitySpans];
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v13 = [(HKAccessibilityData *)self accessibilitySpans];
        v14 = [v13 objectForKeyedSubscript:v12];
        v15 = [v14 description];

        v16 = [NSString stringWithFormat:@"    key %@:", v12];
        [v3 addObject:v16];

        v17 = _IndentString(v15, 6);
        [v3 addObject:v17];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v9);
  }

  v18 = NSString;
  v19 = [(HKAccessibilityData *)self accessibilityPointData];
  v20 = objc_msgSend(v18, "stringWithFormat:", @"  accessibilityPointData %lu", objc_msgSend(v19, "count"));
  [v3 addObject:v20];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v21 = [(HKAccessibilityData *)self accessibilityPointData];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v31 + 1) + 8 * j) description];
        v27 = _IndentString(v26, 4);
        [v3 addObject:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }

  v28 = [v3 componentsJoinedByString:@"\n"];

  return v28;
}

- (NSArray)accessibilityPointData
{
  return self->_accessibilityPointData;
}

- (NSDictionary)accessibilitySpans
{
  return self->_accessibilitySpans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilitySpans, 0);
  objc_storeStrong((id *)&self->_accessibilityPointData, 0);
}

@end