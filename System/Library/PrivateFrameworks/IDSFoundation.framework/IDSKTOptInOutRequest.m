@interface IDSKTOptInOutRequest
+ (BOOL)supportsSecureCoding;
- (IDSKTOptInOutRequest)initWithCoder:(id)a3;
- (NSDictionary)applicationsToOptInStatusData;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationsToOptInStatusData:(id)a3;
@end

@implementation IDSKTOptInOutRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTOptInOutRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSKTOptInOutRequest;
  v5 = [(IDSKTOptInOutRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(v4, v8, v6, v9, v7, @"ReqAppToOptInStatusDataKey");
    applicationsToOptInStatusData = v5->_applicationsToOptInStatusData;
    v5->_applicationsToOptInStatusData = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_applicationsToOptInStatusData, v3, @"ReqAppToOptInStatusDataKey");
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<IDSKTOptInOutRequest: %p, applicationsToOptInStatusData: %@>", v2, self, self->_applicationsToOptInStatusData);
}

- (NSDictionary)applicationsToOptInStatusData
{
  return self->_applicationsToOptInStatusData;
}

- (void)setApplicationsToOptInStatusData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end