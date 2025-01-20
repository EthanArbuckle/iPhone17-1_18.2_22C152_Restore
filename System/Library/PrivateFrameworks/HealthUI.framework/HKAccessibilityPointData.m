@interface HKAccessibilityPointData
- (HKAccessibilityPointData)initWithHorizontalScreenCoordinate:(double)a3 horizontalTimeCoordinate:(id)a4 horizontalDate:(id)a5 values:(id)a6;
- (NSArray)values;
- (NSDate)horizontalDate;
- (NSString)horizontalTimeCoordinate;
- (double)horizontalScreenCoordinate;
- (id)description;
@end

@implementation HKAccessibilityPointData

- (HKAccessibilityPointData)initWithHorizontalScreenCoordinate:(double)a3 horizontalTimeCoordinate:(id)a4 horizontalDate:(id)a5 values:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKAccessibilityPointData;
  v14 = [(HKAccessibilityPointData *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_horizontalScreenCoordinate = a3;
    objc_storeStrong((id *)&v14->_horizontalTimeCoordinate, a4);
    objc_storeStrong((id *)&v15->_horizontalDate, a5);
    objc_storeStrong((id *)&v15->_values, a6);
  }

  return v15;
}

- (id)description
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"HKAccessibilityPointData %p:", self);
  [v3 addObject:v4];

  v5 = NSString;
  [(HKAccessibilityPointData *)self horizontalScreenCoordinate];
  v7 = objc_msgSend(v5, "stringWithFormat:", @"  horizontalScreenCoordinate: %lg", v6);
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(HKAccessibilityPointData *)self horizontalTimeCoordinate];
  v10 = [v8 stringWithFormat:@"  horizontalTimeCoordinate: '%@'", v9];
  [v3 addObject:v10];

  id v11 = NSString;
  id v12 = [(HKAccessibilityPointData *)self horizontalDate];
  id v13 = [v11 stringWithFormat:@"  horizontalDate: %@", v12];
  [v3 addObject:v13];

  v14 = [(HKAccessibilityPointData *)self values];

  v15 = NSString;
  if (v14)
  {
    v16 = [(HKAccessibilityPointData *)self values];
    objc_super v17 = objc_msgSend(v15, "stringWithFormat:", @"  values %lu:", objc_msgSend(v16, "count"));
    [v3 addObject:v17];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v18 = [(HKAccessibilityPointData *)self values];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v27 + 1) + 8 * i) description];
          v24 = _IndentString(v23, 4);
          [v3 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }
  }
  else
  {
    v18 = [NSString stringWithFormat:@"  values NULL (no data)"];
    [v3 addObject:v18];
  }

  v25 = [v3 componentsJoinedByString:@"\n"];

  return v25;
}

- (double)horizontalScreenCoordinate
{
  return self->_horizontalScreenCoordinate;
}

- (NSString)horizontalTimeCoordinate
{
  return self->_horizontalTimeCoordinate;
}

- (NSDate)horizontalDate
{
  return self->_horizontalDate;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_horizontalDate, 0);
  objc_storeStrong((id *)&self->_horizontalTimeCoordinate, 0);
}

@end