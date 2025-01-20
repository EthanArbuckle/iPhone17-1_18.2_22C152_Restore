@interface IDSSessionReinitiateRequestedMetric
- (IDSSessionReinitiateRequestedMetric)initWithGuid:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)guid;
- (NSString)name;
@end

@implementation IDSSessionReinitiateRequestedMetric

- (NSString)name
{
  return (NSString *)@"SessionReinitiateRequested";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  return (NSDictionary *)v3;
}

- (IDSSessionReinitiateRequestedMetric)initWithGuid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSessionReinitiateRequestedMetric;
  double v6 = [(IDSSessionReinitiateRequestedMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_guid, a3);
  }

  return v7;
}

- (NSString)guid
{
  return self->_guid;
}

- (void).cxx_destruct
{
}

@end