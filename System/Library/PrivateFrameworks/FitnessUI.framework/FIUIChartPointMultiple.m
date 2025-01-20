@interface FIUIChartPointMultiple
+ (id)chartPointWithDate:(id)a3 valueIndexSet:(id)a4;
+ (id)chartPointWithXValue:(id)a3 yValue:(id)a4;
- (NSDate)xValue;
- (NSIndexSet)yValue;
- (NSNumber)maxYValue;
- (NSNumber)minYValue;
- (NSString)description;
- (void)setXValue:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation FIUIChartPointMultiple

+ (id)chartPointWithDate:(id)a3 valueIndexSet:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(FIUIChartPointMultiple);
  [(FIUIChartPointMultiple *)v7 setXValue:v6];

  [(FIUIChartPointMultiple *)v7 setYValue:v5];
  return v7;
}

+ (id)chartPointWithXValue:(id)a3 yValue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F089C8] indexSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "doubleValue", (void)v17);
        [v8 addIndex:llround(v14)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = [a1 chartPointWithDate:v6 valueIndexSet:v8];

  return v15;
}

- (NSNumber)minYValue
{
  v3 = [(NSIndexSet *)self->_yValue count];
  if (v3)
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSIndexSet firstIndex](self->_yValue, "firstIndex"));
  }
  return (NSNumber *)v3;
}

- (NSNumber)maxYValue
{
  v3 = [(NSIndexSet *)self->_yValue count];
  if (v3)
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSIndexSet lastIndex](self->_yValue, "lastIndex"));
  }
  return (NSNumber *)v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p, (%@, %@)>", objc_opt_class(), self, self->_xValue, self->_yValue];
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (NSIndexSet)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end