@interface AAAvailabilityResponse
- (AAAvailabilityResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)eta;
- (NSString)feature;
- (NSString)status;
@end

@implementation AAAvailabilityResponse

- (AAAvailabilityResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AAAvailabilityResponse;
  v4 = [(AAResponse *)&v16 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v7;

    v9 = [(AAResponse *)v5 responseDictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"eta"];
    eta = v5->_eta;
    v5->_eta = (NSString *)v10;

    v12 = [(AAResponse *)v5 responseDictionary];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"feature"];
    feature = v5->_feature;
    v5->_feature = (NSString *)v13;
  }
  return v5;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)eta
{
  return self->_eta;
}

- (NSString)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_eta, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

@end