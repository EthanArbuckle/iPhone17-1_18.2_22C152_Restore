@interface DEPDeviceUploadSubmitDeviceRequestPayload
+ (BOOL)supportsSecureCoding;
- (DEPDeviceUploadRequestType)requestType;
- (DEPDeviceUploadSubmitDeviceRequestPayload)initWithCoder:(id)a3;
- (DEPDeviceUploadSubmitDeviceRequestPayload)initWithOrgId:(id)a3 orgName:(id)a4 requestType:(id)a5 submitter:(id)a6 approver:(id)a7 soldToId:(id)a8;
- (DEPDeviceUploadUser)approver;
- (DEPDeviceUploadUser)submitter;
- (NSString)orgId;
- (NSString)orgName;
- (NSString)soldToId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DEPDeviceUploadSubmitDeviceRequestPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)initWithOrgId:(id)a3 orgName:(id)a4 requestType:(id)a5 submitter:(id)a6 approver:(id)a7 soldToId:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)DEPDeviceUploadSubmitDeviceRequestPayload;
  v18 = [(DEPDeviceUploadSubmitDeviceRequestPayload *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_orgId, a3);
    objc_storeStrong((id *)&v19->_orgName, a4);
    objc_storeStrong((id *)&v19->_requestType, a5);
    objc_storeStrong((id *)&v19->_submitter, a6);
    objc_storeStrong((id *)&v19->_approver, a7);
    objc_storeStrong((id *)&v19->_soldToId, a8);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  orgId = self->_orgId;
  id v5 = a3;
  [v5 encodeObject:orgId forKey:@"orgId"];
  [v5 encodeObject:self->_orgName forKey:@"orgName"];
  [v5 encodeObject:self->_requestType forKey:@"requestType"];
  [v5 encodeObject:self->_submitter forKey:@"submitter"];
  [v5 encodeObject:self->_soldToId forKey:@"soldToId"];
  [v5 encodeObject:self->_approver forKey:@"approver"];
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DEPDeviceUploadSubmitDeviceRequestPayload;
  id v5 = [(DEPDeviceUploadSubmitDeviceRequestPayload *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orgId"];
    orgId = v5->_orgId;
    v5->_orgId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orgName"];
    orgName = v5->_orgName;
    v5->_orgName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestType"];
    requestType = v5->_requestType;
    v5->_requestType = (DEPDeviceUploadRequestType *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"submitter"];
    submitter = v5->_submitter;
    v5->_submitter = (DEPDeviceUploadUser *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"approver"];
    approver = v5->_approver;
    v5->_approver = (DEPDeviceUploadUser *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"soldToId"];
    soldToId = v5->_soldToId;
    v5->_soldToId = (NSString *)v16;
  }
  return v5;
}

- (NSString)orgId
{
  return self->_orgId;
}

- (NSString)orgName
{
  return self->_orgName;
}

- (DEPDeviceUploadRequestType)requestType
{
  return self->_requestType;
}

- (DEPDeviceUploadUser)submitter
{
  return self->_submitter;
}

- (DEPDeviceUploadUser)approver
{
  return self->_approver;
}

- (NSString)soldToId
{
  return self->_soldToId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soldToId, 0);
  objc_storeStrong((id *)&self->_approver, 0);
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_orgId, 0);
}

@end