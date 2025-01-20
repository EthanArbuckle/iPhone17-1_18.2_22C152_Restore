@interface _HKGraphViewAutoscaleSeries
- (HKAxis)autoscaleYAxis;
- (NSMutableArray)autoscaleSeries;
- (_HKGraphViewAutoscaleSeries)initWithAutoscaleGroupRow:(int64_t)a3 autoscaleYAxis:(id)a4;
- (int64_t)autoscaleGroupRow;
- (void)addAutoscaleSeries:(id)a3;
@end

@implementation _HKGraphViewAutoscaleSeries

- (_HKGraphViewAutoscaleSeries)initWithAutoscaleGroupRow:(int64_t)a3 autoscaleYAxis:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HKGraphViewAutoscaleSeries;
  v8 = [(_HKGraphViewAutoscaleSeries *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_autoscaleGroupRow = a3;
    objc_storeStrong((id *)&v8->_autoscaleYAxis, a4);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    autoscaleSeries = v9->_autoscaleSeries;
    v9->_autoscaleSeries = v10;
  }
  return v9;
}

- (void)addAutoscaleSeries:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKGraphViewAutoscaleSeries *)self autoscaleSeries];
  [v5 addObject:v4];
}

- (int64_t)autoscaleGroupRow
{
  return self->_autoscaleGroupRow;
}

- (HKAxis)autoscaleYAxis
{
  return self->_autoscaleYAxis;
}

- (NSMutableArray)autoscaleSeries
{
  return self->_autoscaleSeries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscaleSeries, 0);
  objc_storeStrong((id *)&self->_autoscaleYAxis, 0);
}

@end