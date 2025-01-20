@interface HFAnalyticsDirectObliterateEvent
- (HFAnalyticsDirectObliterateEvent)initWithData:(id)a3;
- (NSError)error;
- (NSNumber)problemFlags;
- (id)payload;
- (void)setError:(id)a3;
- (void)setProblemFlags:(id)a3;
@end

@implementation HFAnalyticsDirectObliterateEvent

- (HFAnalyticsDirectObliterateEvent)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsDirectObliterateEvent;
  v5 = [(HFAnalyticsEvent *)&v9 initWithEventType:56];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"error"];
    [(HFAnalyticsDirectObliterateEvent *)v5 setError:v6];

    v7 = [v4 objectForKeyedSubscript:@"problemFlags"];
    [(HFAnalyticsDirectObliterateEvent *)v5 setProblemFlags:v7];
  }
  return v5;
}

- (id)payload
{
  v3 = objc_opt_new();
  id v4 = NSNumber;
  v5 = [(HFAnalyticsDirectObliterateEvent *)self error];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
  [v3 setObject:v6 forKeyedSubscript:@"errorCode"];

  v7 = [(HFAnalyticsDirectObliterateEvent *)self error];
  v8 = [v7 domain];
  [v3 setObject:v8 forKeyedSubscript:@"errorDomain"];

  objc_super v9 = [(HFAnalyticsDirectObliterateEvent *)self problemFlags];
  [v3 setObject:v9 forKeyedSubscript:@"problemFlags"];

  v10 = (void *)[v3 copy];
  return v10;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSNumber)problemFlags
{
  return self->_problemFlags;
}

- (void)setProblemFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemFlags, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end