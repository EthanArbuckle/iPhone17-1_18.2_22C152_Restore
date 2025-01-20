@interface IDSHandleListUpdatedMetric
- (IDSHandleListUpdatedMetric)initWithService:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
@end

@implementation IDSHandleListUpdatedMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationHandleListUpdated";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  service = self->_service;
  if (service) {
    CFDictionarySetValue(v3, @"service", service);
  }
  return (NSDictionary *)v4;
}

- (IDSHandleListUpdatedMetric)initWithService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSHandleListUpdatedMetric;
  v6 = [(IDSHandleListUpdatedMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_service, a3);
  }

  return v7;
}

- (NSString)service
{
  return self->_service;
}

- (void).cxx_destruct
{
}

@end