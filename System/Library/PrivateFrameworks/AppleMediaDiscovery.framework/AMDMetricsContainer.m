@interface AMDMetricsContainer
- (AMDMetricsContainer)initWithLevel:(char)a3 andAction:(id)a4 andVersion:(id)a5 andBuild:(id)a6 andStorefrontId:(id)a7 withLoggingProbability:(id)a8;
- (AMSMetricsEvent)metricEvent;
- (NSMutableDictionary)logData;
- (NSNumber)loggingProbability;
- (char)verbosity;
- (void)setLogData:(id)a3;
- (void)setLoggingProbability:(id)a3;
- (void)setMetricEvent:(id)a3;
- (void)setVerbosity:(char)a3;
@end

@implementation AMDMetricsContainer

- (AMDMetricsContainer)initWithLevel:(char)a3 andAction:(id)a4 andVersion:(id)a5 andBuild:(id)a6 andStorefrontId:(id)a7 withLoggingProbability:(id)a8
{
  v50 = self;
  SEL v49 = a2;
  char v48 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v46 = 0;
  objc_storeStrong(&v46, a5);
  id v45 = 0;
  objc_storeStrong(&v45, a6);
  id v44 = 0;
  objc_storeStrong(&v44, a7);
  id v43 = 0;
  objc_storeStrong(&v43, a8);
  v8 = v50;
  v50 = 0;
  v42.receiver = v8;
  v42.super_class = (Class)AMDMetricsContainer;
  v50 = [(AMDMetricsContainer *)&v42 init];
  objc_storeStrong((id *)&v50, v50);
  id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  -[AMDMetricsContainer setLogData:](v50, "setLogData:");

  v41 = [(AMDMetricsContainer *)v50 logData];
  if (location) {
    v35 = (__CFString *)location;
  }
  else {
    v35 = @"unknown";
  }
  [(NSMutableDictionary *)v41 setObject:v35 forKey:@"eventType"];

  v34 = [(AMDMetricsContainer *)v50 logData];
  if (v45) {
    v33 = (__CFString *)v45;
  }
  else {
    v33 = @"unknown";
  }
  [(NSMutableDictionary *)v34 setObject:v33 forKey:@"osBuildNumber"];

  id v26 = (id)[objc_alloc(MEMORY[0x263F27D48]) initWithTopic:@"xp_amp_odp_log"];
  -[AMDMetricsContainer setMetricEvent:](v50, "setMetricEvent:");

  v27 = [(AMDMetricsContainer *)v50 metricEvent];
  [(AMSMetricsEvent *)v27 setAnonymous:1];

  v31 = [(AMDMetricsContainer *)v50 metricEvent];
  v28 = NSNumber;
  id v30 = (id)[MEMORY[0x263EFF910] date];
  [v30 timeIntervalSince1970];
  id v29 = (id)[v28 numberWithDouble:v9 * 1000.0];
  -[AMSMetricsEvent setProperty:forBodyKey:](v31, "setProperty:forBodyKey:");

  v32 = [(AMDMetricsContainer *)v50 metricEvent];
  if (location) {
    v25 = (__CFString *)location;
  }
  else {
    v25 = @"unknown";
  }
  [(AMSMetricsEvent *)v32 setProperty:v25 forBodyKey:@"eventType"];

  v24 = [(AMDMetricsContainer *)v50 metricEvent];
  if (v46) {
    id v23 = v46;
  }
  else {
    id v23 = &unk_26BEC1B20;
  }
  [(AMSMetricsEvent *)v24 setProperty:v23 forBodyKey:@"eventVersion"];

  v21 = [(AMDMetricsContainer *)v50 metricEvent];
  v20 = [(AMDMetricsContainer *)v50 logData];
  -[AMSMetricsEvent setProperty:forBodyKey:](v21, "setProperty:forBodyKey:");

  v22 = [(AMDMetricsContainer *)v50 metricEvent];
  if (v45) {
    v19 = (__CFString *)v45;
  }
  else {
    v19 = @"unknown";
  }
  [(AMSMetricsEvent *)v22 setProperty:v19 forBodyKey:@"osBuildNumber"];

  v18 = [(AMDMetricsContainer *)v50 metricEvent];
  if (v44) {
    id v17 = v44;
  }
  else {
    id v17 = &unk_26BEC1B38;
  }
  [(AMSMetricsEvent *)v18 setProperty:v17 forBodyKey:@"storeFrontHeader"];

  v16 = [(AMDMetricsContainer *)v50 metricEvent];
  v13 = NSNumber;
  id v15 = (id)[MEMORY[0x263EFFA18] localTimeZone];
  id v14 = (id)objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v15, "secondsFromGMT") / 3600);
  -[AMSMetricsEvent setProperty:forBodyKey:](v16, "setProperty:forBodyKey:");

  [(AMDMetricsContainer *)v50 setVerbosity:v48];
  if (v43) {
    id v12 = v43;
  }
  else {
    id v12 = &unk_26BEC3790;
  }
  [(AMDMetricsContainer *)v50 setLoggingProbability:v12];
  v11 = v50;
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v50, 0);
  return v11;
}

- (AMSMetricsEvent)metricEvent
{
  return self->_metricEvent;
}

- (void)setMetricEvent:(id)a3
{
}

- (NSMutableDictionary)logData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogData:(id)a3
{
}

- (char)verbosity
{
  return self->_verbosity;
}

- (void)setVerbosity:(char)a3
{
  self->_verbosity = a3;
}

- (NSNumber)loggingProbability
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLoggingProbability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end