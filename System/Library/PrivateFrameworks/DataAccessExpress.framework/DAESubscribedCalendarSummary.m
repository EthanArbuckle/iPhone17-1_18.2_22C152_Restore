@interface DAESubscribedCalendarSummary
+ (BOOL)supportsSecureCoding;
- (DAESubscribedCalendarSummary)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)color;
- (NSString)notes;
- (NSString)subscriptionID;
- (NSString)title;
- (NSURL)subscriptionURL;
- (double)refreshInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setData:(id)a3;
- (void)setNotes:(id)a3;
- (void)setRefreshInterval:(double)a3;
- (void)setSubscriptionID:(id)a3;
- (void)setSubscriptionURL:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DAESubscribedCalendarSummary

- (DAESubscribedCalendarSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DAESubscribedCalendarSummary;
  v5 = [(DAESubscribedCalendarSummary *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notes"];
    notes = v5->_notes;
    v5->_notes = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    color = v5->_color;
    v5->_color = (NSString *)v10;

    [v4 decodeDoubleForKey:@"refreshInterval"];
    v5->_refreshInterval = v12;
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionID"];
    subscriptionID = v5->_subscriptionID;
    v5->_subscriptionID = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionURL"];
    subscriptionURL = v5->_subscriptionURL;
    v5->_subscriptionURL = (NSURL *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionICSData"];
    data = v5->_data;
    v5->_data = (NSData *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_notes forKey:@"notes"];
  [v5 encodeObject:self->_color forKey:@"color"];
  [v5 encodeDouble:@"refreshInterval" forKey:self->_refreshInterval];
  [v5 encodeObject:self->_subscriptionID forKey:@"subscriptionID"];
  [v5 encodeObject:self->_subscriptionURL forKey:@"subscriptionURL"];
  [v5 encodeObject:self->_data forKey:@"subscriptionICSData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (NSString)subscriptionID
{
  return self->_subscriptionID;
}

- (void)setSubscriptionID:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSURL)subscriptionURL
{
  return self->_subscriptionURL;
}

- (void)setSubscriptionURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end