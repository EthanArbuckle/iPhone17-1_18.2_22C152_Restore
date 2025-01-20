@interface HDClinicalIngestionGatewayFeatureOperation
+ (NSString)featureName;
- (HDClinicalIngestionGatewayFeatureOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5;
- (HDClinicalIngestionGatewayFeatureOperation)initWithTask:(id)a3 account:(id)a4 session:(id)a5 gateway:(id)a6 feature:(id)a7 queryMode:(int64_t)a8;
- (HDFHIRCredentialedSession)session;
- (HKClinicalGateway)gateway;
- (HKClinicalGatewayFeature)feature;
- (id)debugDescription;
- (int64_t)queryMode;
@end

@implementation HDClinicalIngestionGatewayFeatureOperation

- (HDClinicalIngestionGatewayFeatureOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5
{
  v6 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionGatewayFeatureOperation)initWithTask:(id)a3 account:(id)a4 session:(id)a5 gateway:(id)a6 feature:(id)a7 queryMode:(int64_t)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HDClinicalIngestionGatewayFeatureOperation;
  v18 = [(HDClinicalIngestionPerAccountOperation *)&v25 initWithTask:a3 account:a4 nextOperation:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_session, a5);
    v20 = (HKClinicalGateway *)[v16 copy];
    gateway = v19->_gateway;
    v19->_gateway = v20;

    v22 = (HKClinicalGatewayFeature *)[v17 copy];
    feature = v19->_feature;
    v19->_feature = v22;

    v19->_queryMode = a8;
  }

  return v19;
}

- (id)debugDescription
{
  v6.receiver = self;
  v6.super_class = (Class)HDClinicalIngestionGatewayFeatureOperation;
  v2 = [(HDClinicalIngestionPerAccountOperation *)&v6 debugDescription];
  v3 = [(id)objc_opt_class() featureName];
  v4 = +[NSString stringWithFormat:@"%@ feature:%@", v2, v3];

  return v4;
}

- (HDFHIRCredentialedSession)session
{
  return self->_session;
}

- (HKClinicalGateway)gateway
{
  return self->_gateway;
}

- (HKClinicalGatewayFeature)feature
{
  return self->_feature;
}

- (int64_t)queryMode
{
  return self->_queryMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_gateway, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

+ (NSString)featureName
{
  return (NSString *)@"{none}";
}

@end