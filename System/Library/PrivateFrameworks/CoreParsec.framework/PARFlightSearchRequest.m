@interface PARFlightSearchRequest
+ (BOOL)supportsSecureCoding;
- (Class)responseClass;
- (NSDate)date;
- (NSString)appBundleId;
- (NSString)flightQuery;
- (PARFlightSearchRequest)initWithCoder:(id)a3;
- (unsigned)nwActivityLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setDate:(id)a3;
- (void)setFlightQuery:(id)a3;
@end

@implementation PARFlightSearchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_flightQuery, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setFlightQuery:(id)a3
{
}

- (NSString)flightQuery
{
  return self->_flightQuery;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (unsigned)nwActivityLabel
{
  return 10;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (PARFlightSearchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PARFlightSearchRequest;
  v5 = [(PARRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flightQuery"];
    flightQuery = v5->_flightQuery;
    v5->_flightQuery = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PARFlightSearchRequest;
  id v4 = a3;
  [(PARRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, @"date", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_flightQuery forKey:@"flightQuery"];
  [v4 encodeObject:self->_appBundleId forKey:@"appBundleId"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end