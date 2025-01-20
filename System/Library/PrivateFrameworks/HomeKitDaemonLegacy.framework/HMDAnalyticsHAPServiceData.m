@interface HMDAnalyticsHAPServiceData
- (BOOL)isPrimary;
- (BOOL)ownerUser;
- (HMDAnalyticsHAPServiceData)initWithServiceType:(id)a3 isPrimary:(BOOL)a4 ownerUser:(BOOL)a5;
- (NSString)serviceType;
@end

@implementation HMDAnalyticsHAPServiceData

- (void).cxx_destruct
{
}

- (BOOL)ownerUser
{
  return self->_ownerUser;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (HMDAnalyticsHAPServiceData)initWithServiceType:(id)a3 isPrimary:(BOOL)a4 ownerUser:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAnalyticsHAPServiceData;
  v10 = [(HMDAnalyticsHAPServiceData *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceType, a3);
    v11->_isPrimary = a4;
    v11->_ownerUser = a5;
  }

  return v11;
}

@end