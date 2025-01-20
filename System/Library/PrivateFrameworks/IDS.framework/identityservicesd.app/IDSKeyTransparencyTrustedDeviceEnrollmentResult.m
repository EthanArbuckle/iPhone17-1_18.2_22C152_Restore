@interface IDSKeyTransparencyTrustedDeviceEnrollmentResult
- (IDSKeyTransparencyTrustedDeviceEnrollmentResult)initWithEligibleServiceIdentifiers:(id)a3 signatures:(id)a4;
- (IDSProtoKeyTransparencyTrustedServiceSignatures)signatures;
- (NSArray)eligibleServiceIdentifiers;
- (id)description;
@end

@implementation IDSKeyTransparencyTrustedDeviceEnrollmentResult

- (IDSKeyTransparencyTrustedDeviceEnrollmentResult)initWithEligibleServiceIdentifiers:(id)a3 signatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSKeyTransparencyTrustedDeviceEnrollmentResult;
  v8 = [(IDSKeyTransparencyTrustedDeviceEnrollmentResult *)&v12 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    eligibleServiceIdentifiers = v8->_eligibleServiceIdentifiers;
    v8->_eligibleServiceIdentifiers = v9;

    objc_storeStrong((id *)&v8->_signatures, a4);
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSKeyTransparencyTrustedDeviceEnrollmentResult *)self eligibleServiceIdentifiers];
  id v5 = [v4 count];
  id v6 = [(IDSKeyTransparencyTrustedDeviceEnrollmentResult *)self signatures];
  id v7 = [v6 serviceSignatures];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p eligibleServiceIdentifiers.count: %lu, serviceSignatures.count: %lu>", v3, self, v5, [v7 count]);

  return v8;
}

- (NSArray)eligibleServiceIdentifiers
{
  return self->_eligibleServiceIdentifiers;
}

- (IDSProtoKeyTransparencyTrustedServiceSignatures)signatures
{
  return self->_signatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);

  objc_storeStrong((id *)&self->_eligibleServiceIdentifiers, 0);
}

@end