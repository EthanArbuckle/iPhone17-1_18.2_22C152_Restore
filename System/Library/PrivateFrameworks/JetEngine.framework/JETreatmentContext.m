@interface JETreatmentContext
- (JETreatmentContext)initWithTreatment:(id)a3 metrics:(id)a4;
- (uint64_t)metrics;
- (void)setMetrics:(void *)a1;
@end

@implementation JETreatmentContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
}

- (uint64_t)metrics
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setMetrics:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
  }
}

- (JETreatmentContext)initWithTreatment:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)JETreatmentContext;
  v9 = [(JETreatmentContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_treatment, a3);
    uint64_t v11 = [v8 copy];
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v11;
  }
  return v10;
}

@end