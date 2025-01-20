@interface HMDSiriEndpointProfileFields
- (HMDSiriEndpointProfileFields)initWithNeedsOnboardingField:(id)a3 supportsOnboardingField:(id)a4 siriEnableField:(id)a5 siriListeningField:(id)a6 siriTouchToUseField:(id)a7 siriLightOnUseField:(id)a8 siriSoundOnUseField:(id)a9;
- (NSString)isSiriEnableField;
- (NSString)isSiriListeningField;
- (NSString)needsOnboardingField;
- (NSString)siriLightOnUseField;
- (NSString)siriSoundOnUseField;
- (NSString)siriTouchToUseField;
- (NSString)supportsOnboardingField;
- (id)attributeDescriptions;
- (id)serializeFields;
@end

@implementation HMDSiriEndpointProfileFields

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSoundOnUseField, 0);
  objc_storeStrong((id *)&self->_siriLightOnUseField, 0);
  objc_storeStrong((id *)&self->_siriTouchToUseField, 0);
  objc_storeStrong((id *)&self->_isSiriListeningField, 0);
  objc_storeStrong((id *)&self->_isSiriEnableField, 0);
  objc_storeStrong((id *)&self->_supportsOnboardingField, 0);
  objc_storeStrong((id *)&self->_needsOnboardingField, 0);
}

- (NSString)siriSoundOnUseField
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)siriLightOnUseField
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)siriTouchToUseField
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)isSiriListeningField
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)isSiriEnableField
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)supportsOnboardingField
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)needsOnboardingField
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = [(HMDSiriEndpointProfileFields *)self needsOnboardingField];
  v24 = (void *)[v3 initWithName:@"needsOnboarding" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v23 = [(HMDSiriEndpointProfileFields *)self supportsOnboardingField];
  v22 = (void *)[v4 initWithName:@"supportsOnboarding" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v21 = [(HMDSiriEndpointProfileFields *)self isSiriEnableField];
  v6 = (void *)[v5 initWithName:@"isSiriEnable" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDSiriEndpointProfileFields *)self isSiriListeningField];
  v9 = (void *)[v7 initWithName:@"isSiriListening" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDSiriEndpointProfileFields *)self siriTouchToUseField];
  v12 = (void *)[v10 initWithName:@"siriTouchToUse" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMDSiriEndpointProfileFields *)self siriLightOnUseField];
  v15 = (void *)[v13 initWithName:@"siriLightOnUse" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = [(HMDSiriEndpointProfileFields *)self siriSoundOnUseField];
  v18 = (void *)[v16 initWithName:@"siriSoundOnUse" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  return v19;
}

- (id)serializeFields
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"needsOnboarding";
  id v3 = [(HMDSiriEndpointProfileFields *)self needsOnboardingField];
  v13[0] = v3;
  v12[1] = @"supportsOnboarding";
  id v4 = [(HMDSiriEndpointProfileFields *)self supportsOnboardingField];
  v13[1] = v4;
  v12[2] = @"isSiriEnable";
  id v5 = [(HMDSiriEndpointProfileFields *)self isSiriEnableField];
  v13[2] = v5;
  v12[3] = @"isSiriListening";
  v6 = [(HMDSiriEndpointProfileFields *)self isSiriListeningField];
  v13[3] = v6;
  v12[4] = @"siriTouchToUse";
  id v7 = [(HMDSiriEndpointProfileFields *)self siriTouchToUseField];
  v13[4] = v7;
  v12[5] = @"siriLightOnUse";
  v8 = [(HMDSiriEndpointProfileFields *)self siriLightOnUseField];
  v13[5] = v8;
  v12[6] = @"siriSoundOnUse";
  v9 = [(HMDSiriEndpointProfileFields *)self siriSoundOnUseField];
  v13[6] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (HMDSiriEndpointProfileFields)initWithNeedsOnboardingField:(id)a3 supportsOnboardingField:(id)a4 siriEnableField:(id)a5 siriListeningField:(id)a6 siriTouchToUseField:(id)a7 siriLightOnUseField:(id)a8 siriSoundOnUseField:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id obj = a5;
  id v18 = a5;
  id v30 = a6;
  id v19 = a6;
  id v31 = a7;
  id v20 = a7;
  id v32 = a8;
  id v21 = a8;
  id v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v20)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    v27 = (HMDHomeAssistantOperation *)_HMFPreconditionFailure();
    [(HMDHomeAssistantOperation *)v27 .cxx_destruct];
    return result;
  }
  v33.receiver = self;
  v33.super_class = (Class)HMDSiriEndpointProfileFields;
  v24 = [(HMDSiriEndpointProfileFields *)&v33 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_needsOnboardingField, a3);
    objc_storeStrong((id *)&v25->_supportsOnboardingField, a4);
    objc_storeStrong((id *)&v25->_isSiriEnableField, obj);
    objc_storeStrong((id *)&v25->_isSiriListeningField, v30);
    objc_storeStrong((id *)&v25->_siriTouchToUseField, v31);
    objc_storeStrong((id *)&v25->_siriLightOnUseField, v32);
    objc_storeStrong((id *)&v25->_siriSoundOnUseField, a9);
  }

  return v25;
}

@end