@interface ENRemotePresentationRequest
+ (BOOL)supportsSecureCoding;
+ (id)presentationRequestWithType:(int64_t)a3;
- (BOOL)testMode;
- (ENRegion)agencyRegion;
- (ENRegion)region;
- (ENRemotePresentationRequest)initWithCoder:(id)a3;
- (NSDictionary)decisionInfo;
- (NSString)appBundleIdentifier;
- (NSUUID)receiptId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)keyReleaseRequestCompletedWithDecision:(BOOL)a3;
- (void)onboardingRequestCompletedWithDecision:(BOOL)a3;
- (void)preApprovalRequestCompletedWithDecision:(BOOL)a3;
- (void)setAgencyRegion:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setDecisionInfo:(id)a3;
- (void)setReceiptId:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setTestMode:(BOOL)a3;
@end

@implementation ENRemotePresentationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)presentationRequestWithType:(int64_t)a3
{
  v4 = objc_alloc_init(ENRemotePresentationRequest);
  v5 = [MEMORY[0x263F08C38] UUID];
  [(ENRemotePresentationRequest *)v4 setReceiptId:v5];

  [(ENRemotePresentationRequest *)v4 setRequestType:a3];
  [(ENRemotePresentationRequest *)v4 setDecisionInfo:MEMORY[0x263EFFA78]];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ENRemotePresentationRequest requestType](self, "requestType"), @"requestType");
  v5 = [(ENRemotePresentationRequest *)self receiptId];
  [v4 encodeObject:v5 forKey:@"receiptId"];

  v6 = [(ENRemotePresentationRequest *)self appBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleId"];

  v7 = [(ENRemotePresentationRequest *)self agencyRegion];
  [v4 encodeObject:v7 forKey:@"region"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ENRemotePresentationRequest testMode](self, "testMode"), @"testMode");
  id v8 = [(ENRemotePresentationRequest *)self decisionInfo];
  [v4 encodeObject:v8 forKey:@"decisionInfo"];
}

- (ENRemotePresentationRequest)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ENRemotePresentationRequest *)self init];
  if (!v5)
  {
LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  v5->_requestType = [v4 decodeIntegerForKey:@"requestType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"receiptId"];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(ENRemotePresentationRequest *)v6 copy];
    receiptId = v5->_receiptId;
    v5->_receiptId = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    agencyRegion = v5->_agencyRegion;
    v5->_agencyRegion = (ENRegion *)v12;

    id v14 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:3];
    v16 = objc_msgSend(v14, "initWithArray:", v15, v20, v21);

    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"decisionInfo"];
    if (!v17)
    {

      v7 = 0;
      goto LABEL_6;
    }
    decisionInfo = v5->_decisionInfo;
    v5->_decisionInfo = (NSDictionary *)v17;

    v5->_testMode = [v4 decodeBoolForKey:@"testMode"];
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ENRemotePresentationRequest allocWithZone:](ENRemotePresentationRequest, "allocWithZone:") init];
  [(ENRemotePresentationRequest *)v5 setRequestType:[(ENRemotePresentationRequest *)self requestType]];
  v6 = [(ENRemotePresentationRequest *)self receiptId];
  v7 = (void *)[v6 copyWithZone:a3];
  [(ENRemotePresentationRequest *)v5 setReceiptId:v7];

  uint64_t v8 = [(ENRemotePresentationRequest *)self appBundleIdentifier];
  v9 = (void *)[v8 copyWithZone:a3];
  [(ENRemotePresentationRequest *)v5 setAppBundleIdentifier:v9];

  uint64_t v10 = [(ENRemotePresentationRequest *)self agencyRegion];
  v11 = (void *)[v10 copyWithZone:a3];
  [(ENRemotePresentationRequest *)v5 setAgencyRegion:v11];

  [(ENRemotePresentationRequest *)v5 setTestMode:[(ENRemotePresentationRequest *)self testMode]];
  uint64_t v12 = [(ENRemotePresentationRequest *)self decisionInfo];
  v13 = (void *)[v12 copyWithZone:a3];
  [(ENRemotePresentationRequest *)v5 setDecisionInfo:v13];

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t requestType = self->_requestType;
  uint64_t v7 = [(NSUUID *)self->_receiptId UUIDString];
  uint64_t v8 = (void *)v7;
  agencyRegion = (ENRegion *)@"<>";
  appBundleIdentifier = (__CFString *)self->_appBundleIdentifier;
  if (!appBundleIdentifier) {
    appBundleIdentifier = @"<>";
  }
  if (self->_agencyRegion) {
    agencyRegion = self->_agencyRegion;
  }
  v11 = [v3 stringWithFormat:@"%@ %ld %@ App %@ Region %@", v5, requestType, v7, appBundleIdentifier, agencyRegion];

  return v11;
}

- (ENRegion)region
{
  agencyRegion = self->_agencyRegion;
  if (agencyRegion) {
    v3 = agencyRegion;
  }
  else {
    v3 = [[ENRegion alloc] initWithCountryCode:@"US"];
  }

  return v3;
}

- (void)onboardingRequestCompletedWithDecision:(BOOL)a3
{
  BOOL v3 = a3;
  v11[2] = *MEMORY[0x263EF8340];
  if ([(ENRemotePresentationRequest *)self requestType] != 1)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ENRemotePresentationRequest.m" lineNumber:96 description:@"Encountered wrong request type"];
  }
  v10[0] = @"decisionType";
  v10[1] = @"decisionResult";
  v11[0] = &unk_26C60D360;
  v6 = [NSNumber numberWithBool:v3];
  v11[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  decisionInfo = self->_decisionInfo;
  self->_decisionInfo = v7;
}

- (void)keyReleaseRequestCompletedWithDecision:(BOOL)a3
{
  BOOL v3 = a3;
  v11[2] = *MEMORY[0x263EF8340];
  if ([(ENRemotePresentationRequest *)self requestType] != 2)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ENRemotePresentationRequest.m" lineNumber:104 description:@"Encountered wrong request type"];
  }
  v10[0] = @"decisionType";
  v10[1] = @"decisionResult";
  v11[0] = &unk_26C60D378;
  v6 = [NSNumber numberWithBool:v3];
  v11[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  decisionInfo = self->_decisionInfo;
  self->_decisionInfo = v7;
}

- (void)preApprovalRequestCompletedWithDecision:(BOOL)a3
{
  BOOL v3 = a3;
  v11[2] = *MEMORY[0x263EF8340];
  if ([(ENRemotePresentationRequest *)self requestType] != 3)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ENRemotePresentationRequest.m" lineNumber:112 description:@"Encountered wrong request type"];
  }
  v10[0] = @"decisionType";
  v10[1] = @"decisionResult";
  v11[0] = &unk_26C60D390;
  v6 = [NSNumber numberWithBool:v3];
  v11[1] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  decisionInfo = self->_decisionInfo;
  self->_decisionInfo = v7;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_int64_t requestType = a3;
}

- (NSUUID)receiptId
{
  return self->_receiptId;
}

- (void)setReceiptId:(id)a3
{
}

- (NSDictionary)decisionInfo
{
  return self->_decisionInfo;
}

- (void)setDecisionInfo:(id)a3
{
}

- (ENRegion)agencyRegion
{
  return self->_agencyRegion;
}

- (void)setAgencyRegion:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_agencyRegion, 0);
  objc_storeStrong((id *)&self->_decisionInfo, 0);

  objc_storeStrong((id *)&self->_receiptId, 0);
}

@end