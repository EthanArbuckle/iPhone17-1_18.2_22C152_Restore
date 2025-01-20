@interface CTRadioAccessTechnology
- (CTRadioAccessTechnology)init;
- (CTRadioAccessTechnology)initWithCTTelephonyNetworkInfo:(id)a3;
- (NSString)radioAccessTechnology;
@end

@implementation CTRadioAccessTechnology

- (CTRadioAccessTechnology)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTRadioAccessTechnology;
  v2 = [(CTRadioAccessTechnology *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CTTelephonyNetworkInfo);
    networkInfo = v2->_networkInfo;
    v2->_networkInfo = v3;
  }
  return v2;
}

- (CTRadioAccessTechnology)initWithCTTelephonyNetworkInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTRadioAccessTechnology;
  objc_super v6 = [(CTRadioAccessTechnology *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_networkInfo, a3);
  }

  return v7;
}

- (NSString)radioAccessTechnology
{
  return [(CTTelephonyNetworkInfo *)self->_networkInfo currentRadioAccessTechnology];
}

- (void).cxx_destruct
{
}

@end