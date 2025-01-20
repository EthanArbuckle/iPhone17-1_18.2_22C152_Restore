@interface GEOPhoneNumberResolutionResult
- (GEOPhoneNumberResolutionResult)initWithLocationName:(id)a3;
- (NSString)locationName;
@end

@implementation GEOPhoneNumberResolutionResult

- (GEOPhoneNumberResolutionResult)initWithLocationName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPhoneNumberResolutionResult;
  v6 = [(GEOPhoneNumberResolutionResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationName, a3);
  }

  return v7;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void).cxx_destruct
{
}

@end