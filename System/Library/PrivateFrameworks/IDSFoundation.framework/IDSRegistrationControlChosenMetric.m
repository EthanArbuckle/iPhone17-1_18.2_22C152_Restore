@interface IDSRegistrationControlChosenMetric
- (BOOL)isInterestingRegion;
- (IDSRegistrationControlChosenMetric)initWithControlRegistrationType:(int64_t)a3 registrationControlStatus:(int64_t)a4 isInterestingRegion:(BOOL)a5;
- (NSCopying)awdRepresentation;
- (NSString)name;
- (int64_t)controlRegistrationType;
- (int64_t)registrationControlStatus;
- (unsigned)awdIdentifier;
@end

@implementation IDSRegistrationControlChosenMetric

- (IDSRegistrationControlChosenMetric)initWithControlRegistrationType:(int64_t)a3 registrationControlStatus:(int64_t)a4 isInterestingRegion:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IDSRegistrationControlChosenMetric;
  result = [(IDSRegistrationControlChosenMetric *)&v9 init];
  if (result)
  {
    result->_controlRegistrationType = a3;
    result->_registrationControlStatus = a4;
    result->_isInterestingRegion = a5;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"RegistrationControlChosen";
}

- (unsigned)awdIdentifier
{
  return 2555937;
}

- (NSCopying)awdRepresentation
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  uint64_t v7 = objc_msgSend_controlRegistrationType(self, v4, v5, v6);
  objc_msgSend_setRegistrationType_(v3, v8, v7, v9);
  uint64_t v13 = objc_msgSend_registrationControlStatus(self, v10, v11, v12);
  objc_msgSend_setRegistrationControlStatus_(v3, v14, v13, v15);
  uint64_t isInterestingRegion = objc_msgSend_isInterestingRegion(self, v16, v17, v18);
  objc_msgSend_setIsInterestingRegion_(v3, v20, isInterestingRegion, v21);
  return (NSCopying *)v3;
}

- (int64_t)controlRegistrationType
{
  return self->_controlRegistrationType;
}

- (int64_t)registrationControlStatus
{
  return self->_registrationControlStatus;
}

- (BOOL)isInterestingRegion
{
  return self->_isInterestingRegion;
}

@end