@interface HFAnalyticsRecommendationsEnabledEvent
- (BOOL)enabled;
- (BOOL)success;
- (HFAnalyticsRecommendationsEnabledEvent)initWithData:(id)a3;
- (NSString)accessoryCategory;
- (NSString)configurationType;
- (NSString)presentationContext;
- (NSString)serviceType;
- (NSString)source;
- (double)rank;
- (id)payload;
- (int)rankInt;
- (int)rankVersion;
- (void)setAccessoryCategory:(id)a3;
- (void)setConfigurationType:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPresentationContext:(id)a3;
- (void)setRank:(double)a3;
- (void)setRankInt:(int)a3;
- (void)setRankVersion:(int)a3;
- (void)setServiceType:(id)a3;
- (void)setSource:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation HFAnalyticsRecommendationsEnabledEvent

- (HFAnalyticsRecommendationsEnabledEvent)initWithData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = [v3 objectForKeyedSubscript:@"enabled"];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    NSLog(&cfstr_ErrorHfanalyti.isa);
  }
  objc_opt_class();
  v7 = [v3 objectForKeyedSubscript:@"success"];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (!v9) {
    NSLog(&cfstr_ErrorHfanalyti_0.isa);
  }
  objc_opt_class();
  v10 = [v3 objectForKeyedSubscript:@"rank"];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  if (!v12) {
    NSLog(&cfstr_ErrorHfanalyti_1.isa);
  }
  v42 = v12;
  objc_opt_class();
  v13 = [v3 objectForKeyedSubscript:@"rankInt"];
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (!v15) {
    NSLog(&cfstr_ErrorHfanalyti_2.isa);
  }
  objc_opt_class();
  v16 = [v3 objectForKeyedSubscript:@"rankVersion"];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v39 = v17;

  v40 = v15;
  if (!v15) {
    NSLog(&cfstr_ErrorHfanalyti_3.isa);
  }
  objc_opt_class();
  v18 = [v3 objectForKeyedSubscript:@"serviceType"];
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id obj = v19;
  id v38 = v19;

  objc_opt_class();
  v20 = [v3 objectForKeyedSubscript:@"accessoryCategory"];
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v33 = v21;
  id v37 = v21;

  objc_opt_class();
  v22 = [v3 objectForKeyedSubscript:@"source"];
  if (objc_opt_isKindOfClass()) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  id v32 = v23;
  id v36 = v23;

  objc_opt_class();
  v24 = [v3 objectForKeyedSubscript:@"presentationContext"];
  if (objc_opt_isKindOfClass()) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  id v35 = v25;

  objc_opt_class();
  v26 = [v3 objectForKeyedSubscript:@"configurationType"];
  if (objc_opt_isKindOfClass()) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  v43.receiver = self;
  v43.super_class = (Class)HFAnalyticsRecommendationsEnabledEvent;
  v29 = [(HFAnalyticsEvent *)&v43 initWithEventType:14];
  if (v29)
  {
    v29->_enabled = [v6 BOOLValue];
    v29->_success = [v9 BOOLValue];
    [v42 doubleValue];
    v29->_rank = v30;
    v29->_rankInt = [v40 intValue];
    v29->_rankVersion = [v39 intValue];
    objc_storeStrong((id *)&v29->_serviceType, obj);
    objc_storeStrong((id *)&v29->_accessoryCategory, v33);
    objc_storeStrong((id *)&v29->_source, v32);
    objc_storeStrong((id *)&v29->_presentationContext, v25);
    objc_storeStrong((id *)&v29->_configurationType, v27);
  }

  return v29;
}

- (id)payload
{
  v22.receiver = self;
  v22.super_class = (Class)HFAnalyticsRecommendationsEnabledEvent;
  id v3 = [(HFAnalyticsEvent *)&v22 payload];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsRecommendationsEnabledEvent enabled](self, "enabled"));
  [v4 setObject:v5 forKeyedSubscript:@"enabled"];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsRecommendationsEnabledEvent success](self, "success"));
  [v4 setObject:v6 forKeyedSubscript:@"success"];

  v7 = NSNumber;
  [(HFAnalyticsRecommendationsEnabledEvent *)self rank];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:@"rank"];

  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[HFAnalyticsRecommendationsEnabledEvent rankInt](self, "rankInt"));
  [v4 setObject:v9 forKeyedSubscript:@"rankInt"];

  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[HFAnalyticsRecommendationsEnabledEvent rankVersion](self, "rankVersion"));
  [v4 setObject:v10 forKeyedSubscript:@"rankVersion"];

  v11 = [(HFAnalyticsRecommendationsEnabledEvent *)self serviceType];

  if (v11)
  {
    id v12 = [(HFAnalyticsRecommendationsEnabledEvent *)self serviceType];
    [v4 setObject:v12 forKeyedSubscript:@"serviceType"];
  }
  v13 = [(HFAnalyticsRecommendationsEnabledEvent *)self accessoryCategory];

  if (v13)
  {
    v14 = [(HFAnalyticsRecommendationsEnabledEvent *)self accessoryCategory];
    [v4 setObject:v14 forKeyedSubscript:@"accessoryCategory"];
  }
  id v15 = [(HFAnalyticsRecommendationsEnabledEvent *)self source];

  if (v15)
  {
    v16 = [(HFAnalyticsRecommendationsEnabledEvent *)self source];
    [v4 setObject:v16 forKeyedSubscript:@"source"];
  }
  v17 = [(HFAnalyticsRecommendationsEnabledEvent *)self presentationContext];

  if (v17)
  {
    v18 = [(HFAnalyticsRecommendationsEnabledEvent *)self presentationContext];
    [v4 setObject:v18 forKeyedSubscript:@"presentationContext"];
  }
  v19 = [(HFAnalyticsRecommendationsEnabledEvent *)self configurationType];

  if (v19)
  {
    v20 = [(HFAnalyticsRecommendationsEnabledEvent *)self configurationType];
    [v4 setObject:v20 forKeyedSubscript:@"configurationType"];
  }
  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (double)rank
{
  return self->_rank;
}

- (void)setRank:(double)a3
{
  self->_rank = a3;
}

- (int)rankInt
{
  return self->_rankInt;
}

- (void)setRankInt:(int)a3
{
  self->_rankInt = a3;
}

- (int)rankVersion
{
  return self->_rankVersion;
}

- (void)setRankVersion:(int)a3
{
  self->_rankVersion = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (NSString)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end