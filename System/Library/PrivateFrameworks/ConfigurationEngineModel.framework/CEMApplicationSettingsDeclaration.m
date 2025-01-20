@interface CEMApplicationSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withDiagnosticSubmission:(id)a4 withAppAnalytics:(id)a5 withAllowDiagnosticSubmission:(id)a6 withAutonomousSingleAppModePermittedAppIDs:(id)a7 withAllowActivityContinuation:(id)a8 withAllowEnterpriseAppTrust:(id)a9 withAllowDiagnosticSubmissionModification:(id)a10 withAllowAutomaticAppUpdates:(id)a11 withAllowAutomaticAppUpdatesModification:(id)a12;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadAutonomousSingleAppModePermittedAppIDs;
- (NSNumber)payloadAllowActivityContinuation;
- (NSNumber)payloadAllowAutomaticAppUpdates;
- (NSNumber)payloadAllowAutomaticAppUpdatesModification;
- (NSNumber)payloadAllowDiagnosticSubmission;
- (NSNumber)payloadAllowDiagnosticSubmissionModification;
- (NSNumber)payloadAllowEnterpriseAppTrust;
- (NSNumber)payloadAppAnalytics;
- (NSNumber)payloadDiagnosticSubmission;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowActivityContinuation:(id)a3;
- (void)setPayloadAllowAutomaticAppUpdates:(id)a3;
- (void)setPayloadAllowAutomaticAppUpdatesModification:(id)a3;
- (void)setPayloadAllowDiagnosticSubmission:(id)a3;
- (void)setPayloadAllowDiagnosticSubmissionModification:(id)a3;
- (void)setPayloadAllowEnterpriseAppTrust:(id)a3;
- (void)setPayloadAppAnalytics:(id)a3;
- (void)setPayloadAutonomousSingleAppModePermittedAppIDs:(id)a3;
- (void)setPayloadDiagnosticSubmission:(id)a3;
@end

@implementation CEMApplicationSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.settings";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DiagnosticSubmission";
  v6[1] = @"AppAnalytics";
  v6[2] = @"allowDiagnosticSubmission";
  v6[3] = @"autonomousSingleAppModePermittedAppIDs";
  v6[4] = @"allowActivityContinuation";
  v6[5] = @"allowEnterpriseAppTrust";
  v6[6] = @"allowDiagnosticSubmissionModification";
  v6[7] = @"allowAutomaticAppUpdates";
  v6[8] = @"allowAutomaticAppUpdatesModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowDiagnosticSubmission";
  v6[1] = @"autonomousSingleAppModePermittedAppIDs";
  v6[2] = @"allowActivityContinuation";
  v6[3] = @"allowEnterpriseAppTrust";
  v6[4] = @"allowDiagnosticSubmissionModification";
  v6[5] = @"allowAutomaticAppUpdates";
  v6[6] = @"allowAutomaticAppUpdatesModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withDiagnosticSubmission:(id)a4 withAppAnalytics:(id)a5 withAllowDiagnosticSubmission:(id)a6 withAutonomousSingleAppModePermittedAppIDs:(id)a7 withAllowActivityContinuation:(id)a8 withAllowEnterpriseAppTrust:(id)a9 withAllowDiagnosticSubmissionModification:(id)a10 withAllowAutomaticAppUpdates:(id)a11 withAllowAutomaticAppUpdatesModification:(id)a12
{
  id v16 = a3;
  id v40 = a12;
  id v39 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = objc_opt_new();
  [v24 setDeclarationType:@"com.apple.configuration.application.settings"];
  if (v16)
  {
    [v24 setDeclarationIdentifier:v16];
  }
  else
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [v24 setDeclarationIdentifier:v26];

    id v16 = 0;
  }
  v27 = (void *)MEMORY[0x263EFFA80];
  if (v23) {
    id v28 = v23;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA80];
  }
  [v24 setPayloadDiagnosticSubmission:v28];

  if (v22) {
    id v29 = v22;
  }
  else {
    id v29 = v27;
  }
  [v24 setPayloadAppAnalytics:v29];

  v30 = (void *)MEMORY[0x263EFFA88];
  if (v21) {
    id v31 = v21;
  }
  else {
    id v31 = (id)MEMORY[0x263EFFA88];
  }
  [v24 setPayloadAllowDiagnosticSubmission:v31];

  [v24 setPayloadAutonomousSingleAppModePermittedAppIDs:v20];
  if (v19) {
    id v32 = v19;
  }
  else {
    id v32 = v30;
  }
  [v24 setPayloadAllowActivityContinuation:v32];

  if (v18) {
    id v33 = v18;
  }
  else {
    id v33 = v30;
  }
  [v24 setPayloadAllowEnterpriseAppTrust:v33];

  if (v17) {
    id v34 = v17;
  }
  else {
    id v34 = v30;
  }
  [v24 setPayloadAllowDiagnosticSubmissionModification:v34];

  if (v39) {
    id v35 = v39;
  }
  else {
    id v35 = v30;
  }
  [v24 setPayloadAllowAutomaticAppUpdates:v35];

  if (v40) {
    id v36 = v40;
  }
  else {
    id v36 = v30;
  }
  [v24 setPayloadAllowAutomaticAppUpdatesModification:v36];

  [v24 updateServerHash];

  return v24;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.application.settings"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationSettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v41 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DiagnosticSubmission" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v41];
  id v14 = v41;
  payloadDiagnosticSubmission = self->_payloadDiagnosticSubmission;
  self->_payloadDiagnosticSubmission = v13;

  if (!v14)
  {
    id v40 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AppAnalytics" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v40];
    id v14 = v40;
    payloadAppAnalytics = self->_payloadAppAnalytics;
    self->_payloadAppAnalytics = v16;

    if (!v14)
    {
      id v39 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowDiagnosticSubmission" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v39];
      id v14 = v39;
      payloadAllowDiagnosticSubmission = self->_payloadAllowDiagnosticSubmission;
      self->_payloadAllowDiagnosticSubmission = v18;

      if (!v14)
      {
        id v38 = 0;
        id v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"autonomousSingleAppModePermittedAppIDs" validator:&__block_literal_global_7 isRequired:0 defaultValue:0 error:&v38];
        id v14 = v38;
        payloadAutonomousSingleAppModePermittedAppIDs = self->_payloadAutonomousSingleAppModePermittedAppIDs;
        self->_payloadAutonomousSingleAppModePermittedAppIDs = v20;

        if (!v14)
        {
          id v37 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowActivityContinuation" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v37];
          id v14 = v37;
          payloadAllowActivityContinuation = self->_payloadAllowActivityContinuation;
          self->_payloadAllowActivityContinuation = v22;

          if (!v14)
          {
            id v36 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowEnterpriseAppTrust" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v36];
            id v14 = v36;
            payloadAllowEnterpriseAppTrust = self->_payloadAllowEnterpriseAppTrust;
            self->_payloadAllowEnterpriseAppTrust = v24;

            if (!v14)
            {
              id v35 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowDiagnosticSubmissionModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v35];
              id v14 = v35;
              payloadAllowDiagnosticSubmissionModification = self->_payloadAllowDiagnosticSubmissionModification;
              self->_payloadAllowDiagnosticSubmissionModification = v26;

              if (!v14)
              {
                id v34 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAutomaticAppUpdates" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v34];
                id v14 = v34;
                payloadAllowAutomaticAppUpdates = self->_payloadAllowAutomaticAppUpdates;
                self->_payloadAllowAutomaticAppUpdates = v28;

                if (!v14)
                {
                  id v33 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAutomaticAppUpdatesModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v33];
                  id v14 = v33;
                  payloadAllowAutomaticAppUpdatesModification = self->_payloadAllowAutomaticAppUpdatesModification;
                  self->_payloadAllowAutomaticAppUpdatesModification = v30;
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __55__CEMApplicationSettingsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DiagnosticSubmission" withValue:self->_payloadDiagnosticSubmission isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"AppAnalytics" withValue:self->_payloadAppAnalytics isRequired:0 defaultValue:v5];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowDiagnosticSubmission" withValue:self->_payloadAllowDiagnosticSubmission isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"autonomousSingleAppModePermittedAppIDs" withValue:self->_payloadAutonomousSingleAppModePermittedAppIDs itemSerializer:&__block_literal_global_43 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowActivityContinuation" withValue:self->_payloadAllowActivityContinuation isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowEnterpriseAppTrust" withValue:self->_payloadAllowEnterpriseAppTrust isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowDiagnosticSubmissionModification" withValue:self->_payloadAllowDiagnosticSubmissionModification isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAutomaticAppUpdates" withValue:self->_payloadAllowAutomaticAppUpdates isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAutomaticAppUpdatesModification" withValue:self->_payloadAllowAutomaticAppUpdatesModification isRequired:0 defaultValue:v6];
  v7 = (void *)[v4 copy];

  return v7;
}

id __72__CEMApplicationSettingsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CEMApplicationSettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v24 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadDiagnosticSubmission copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAppAnalytics copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowDiagnosticSubmission copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadAutonomousSingleAppModePermittedAppIDs copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowActivityContinuation copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowEnterpriseAppTrust copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowDiagnosticSubmissionModification copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAllowAutomaticAppUpdates copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadAllowAutomaticAppUpdatesModification copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  return v4;
}

- (NSNumber)payloadDiagnosticSubmission
{
  return self->_payloadDiagnosticSubmission;
}

- (void)setPayloadDiagnosticSubmission:(id)a3
{
}

- (NSNumber)payloadAppAnalytics
{
  return self->_payloadAppAnalytics;
}

- (void)setPayloadAppAnalytics:(id)a3
{
}

- (NSNumber)payloadAllowDiagnosticSubmission
{
  return self->_payloadAllowDiagnosticSubmission;
}

- (void)setPayloadAllowDiagnosticSubmission:(id)a3
{
}

- (NSArray)payloadAutonomousSingleAppModePermittedAppIDs
{
  return self->_payloadAutonomousSingleAppModePermittedAppIDs;
}

- (void)setPayloadAutonomousSingleAppModePermittedAppIDs:(id)a3
{
}

- (NSNumber)payloadAllowActivityContinuation
{
  return self->_payloadAllowActivityContinuation;
}

- (void)setPayloadAllowActivityContinuation:(id)a3
{
}

- (NSNumber)payloadAllowEnterpriseAppTrust
{
  return self->_payloadAllowEnterpriseAppTrust;
}

- (void)setPayloadAllowEnterpriseAppTrust:(id)a3
{
}

- (NSNumber)payloadAllowDiagnosticSubmissionModification
{
  return self->_payloadAllowDiagnosticSubmissionModification;
}

- (void)setPayloadAllowDiagnosticSubmissionModification:(id)a3
{
}

- (NSNumber)payloadAllowAutomaticAppUpdates
{
  return self->_payloadAllowAutomaticAppUpdates;
}

- (void)setPayloadAllowAutomaticAppUpdates:(id)a3
{
}

- (NSNumber)payloadAllowAutomaticAppUpdatesModification
{
  return self->_payloadAllowAutomaticAppUpdatesModification;
}

- (void)setPayloadAllowAutomaticAppUpdatesModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAutomaticAppUpdatesModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowAutomaticAppUpdates, 0);
  objc_storeStrong((id *)&self->_payloadAllowDiagnosticSubmissionModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowEnterpriseAppTrust, 0);
  objc_storeStrong((id *)&self->_payloadAllowActivityContinuation, 0);
  objc_storeStrong((id *)&self->_payloadAutonomousSingleAppModePermittedAppIDs, 0);
  objc_storeStrong((id *)&self->_payloadAllowDiagnosticSubmission, 0);
  objc_storeStrong((id *)&self->_payloadAppAnalytics, 0);

  objc_storeStrong((id *)&self->_payloadDiagnosticSubmission, 0);
}

@end