@interface _HKQuantityDistributionQuery
+ (Class)configurationClass;
+ (id)clientInterfaceProtocol;
+ (void)configureClientInterface:(id)a3;
- (HKQuantity)histogramAnchor;
- (HKQuantity)histogramBucketSize;
- (NSDate)anchorDate;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)intervalComponents;
- (_HKQuantityDistributionQuery)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 contextStyle:(int64_t)a6 predicate:(id)a7 anchorDate:(id)a8 intervalComponents:(id)a9 histogramAnchor:(id)a10 histogramBucketSize:(id)a11 options:(unint64_t)a12 completionHandler:(id)a13;
- (id)completionHandler;
- (int64_t)contextStyle;
- (unint64_t)options;
- (void)client_deliverDistributionCollection:(id)a3 forQuery:(id)a4;
- (void)queue_deliverError:(id)a3;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
@end

@implementation _HKQuantityDistributionQuery

- (_HKQuantityDistributionQuery)initWithQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5 contextStyle:(int64_t)a6 predicate:(id)a7 anchorDate:(id)a8 intervalComponents:(id)a9 histogramAnchor:(id)a10 histogramBucketSize:(id)a11 options:(unint64_t)a12 completionHandler:(id)a13
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v40 = a5;
  id v19 = a5;
  id v20 = a7;
  id v42 = a8;
  id v21 = a8;
  id v45 = a9;
  id v44 = a10;
  id v22 = a11;
  id v23 = a13;
  uint64_t v24 = +[HKQuery predicateForSamplesWithStartDate:v18 endDate:v19 options:0];
  v25 = (void *)v24;
  if (v20)
  {
    v26 = (void *)MEMORY[0x1E4F28BA0];
    v47[0] = v24;
    v47[1] = v20;
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 2, obj, v40);
    id v27 = v21;
    id v28 = v19;
    id v29 = v18;
    v31 = id v30 = v17;
    uint64_t v32 = [v26 andPredicateWithSubpredicates:v31];

    id v17 = v30;
    id v18 = v29;
    id v19 = v28;
    id v21 = v27;
    v25 = (void *)v32;
  }
  v46.receiver = self;
  v46.super_class = (Class)_HKQuantityDistributionQuery;
  v33 = -[HKQuery _initWithObjectType:predicate:](&v46, sel__initWithObjectType_predicate_, v17, v25, obj);
  v34 = (_HKQuantityDistributionQuery *)v33;
  if (v33)
  {
    objc_storeStrong(v33 + 19, obja);
    objc_storeStrong((id *)&v34->_endDate, v40);
    v34->_contextStyle = a6;
    objc_storeStrong((id *)&v34->_anchorDate, v42);
    objc_storeStrong((id *)&v34->_intervalComponents, a9);
    objc_storeStrong((id *)&v34->_histogramAnchor, a10);
    objc_storeStrong((id *)&v34->_histogramBucketSize, a11);
    v35 = _Block_copy(v23);
    id completionHandler = v34->_completionHandler;
    v34->_id completionHandler = v35;

    v34->_options = a12;
  }

  return v34;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EED1AB20;
}

+ (void)configureClientInterface:(id)a3
{
  id v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKQuantityDistributionQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  id v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverDistributionCollection_forQuery_, 0, 0);
}

- (void)queue_deliverError:(id)a3
{
}

- (void)queue_queryDidDeactivate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKQuantityDistributionQuery;
  [(HKQuery *)&v5 queue_queryDidDeactivate:a3];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (void)queue_populateConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKQuantityDistributionQuery;
  id v4 = a3;
  [(HKQuery *)&v5 queue_populateConfiguration:v4];
  objc_msgSend(v4, "setStartDate:", self->_startDate, v5.receiver, v5.super_class);
  [v4 setEndDate:self->_endDate];
  [v4 setContextStyle:self->_contextStyle];
  [v4 setAnchorDate:self->_anchorDate];
  [v4 setIntervalComponents:self->_intervalComponents];
  [v4 setHistogramAnchor:self->_histogramAnchor];
  [v4 setHistogramBucketSize:self->_histogramBucketSize];
  [v4 setOptions:self->_options];
}

- (void)client_deliverDistributionCollection:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___HKQuantityDistributionQuery_client_deliverDistributionCollection_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)contextStyle
{
  return self->_contextStyle;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (HKQuantity)histogramAnchor
{
  return self->_histogramAnchor;
}

- (HKQuantity)histogramBucketSize
{
  return self->_histogramBucketSize;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_histogramBucketSize, 0);
  objc_storeStrong((id *)&self->_histogramAnchor, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end