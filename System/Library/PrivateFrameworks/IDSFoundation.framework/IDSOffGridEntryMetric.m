@interface IDSOffGridEntryMetric
- (BOOL)success;
- (IDSOffGridEntryMetric)initWithService:(id)a3 source:(id)a4 date:(id)a5 success:(BOOL)a6;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)service;
- (NSString)name;
- (NSString)source;
@end

@implementation IDSOffGridEntryMetric

- (IDSOffGridEntryMetric)initWithService:(id)a3 source:(id)a4 date:(id)a5 success:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSOffGridEntryMetric;
  v14 = [(IDSOffGridEntryMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_service, a3);
    objc_storeStrong((id *)&v15->_source, a4);
    objc_storeStrong((id *)&v15->_date, a5);
    v15->_success = a6;
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)@"EntryPoint";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v3;
  service = self->_service;
  if (service) {
    CFDictionarySetValue(v3, @"service", service);
  }
  source = self->_source;
  if (source) {
    CFDictionarySetValue(v6, @"source", source);
  }
  v9 = NSNumber;
  objc_msgSend_timeIntervalSince1970(self->_date, v4, (uint64_t)source, v5);
  id v13 = objc_msgSend_numberWithDouble_(v9, v10, v11, v12);
  if (v13) {
    CFDictionarySetValue(v6, @"date", v13);
  }

  v16 = objc_msgSend_numberWithBool_(NSNumber, v14, self->_success, v15);
  if (v16) {
    CFDictionarySetValue(v6, @"success", v16);
  }

  return (NSDictionary *)v6;
}

- (NSNumber)service
{
  return self->_service;
}

- (NSString)source
{
  return self->_source;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end