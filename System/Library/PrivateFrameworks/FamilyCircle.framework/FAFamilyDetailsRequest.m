@interface FAFamilyDetailsRequest
- (FAFamilyDetailsRequest)initWithAccount:(id)a3;
- (id)urlRequest;
@end

@implementation FAFamilyDetailsRequest

- (FAFamilyDetailsRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyDetailsRequest;
  v6 = [(FAFamilyDetailsRequest *)&v9 initWithAccount:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlRequest
{
  v8.receiver = self;
  v8.super_class = (Class)FAFamilyDetailsRequest;
  v3 = [(FAFamilyDetailsRequest *)&v8 urlRequest];
  id v4 = [v3 mutableCopy];

  id v5 = [objc_alloc((Class)FARequestConfigurator) initWithAccount:self->_account];
  [v5 addFresnoPayloadToRequest:v4 additionalPayload:0];
  id v6 = [v4 copy];

  return v6;
}

- (void).cxx_destruct
{
}

@end