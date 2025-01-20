@interface ACActivityDescriptor
- (ACActivityDescriptor)initWithIdentifier:(id)a3 target:(id)a4 presentationOptions:(id)a5 isEphemeral:(BOOL)a6 isMomentary:(BOOL)a7 createdDate:(id)a8 descriptorData:(id)a9 contentType:(int64_t)a10 remoteDeviceIdentifier:(id)a11 localizedAppName:(id)a12 protectionClass:(int64_t)a13;
- (ACActivityPresentationOptions)presentationOptions;
- (BOOL)isEphemeral;
- (BOOL)isMomentary;
- (NSData)descriptorData;
- (NSDate)createdDate;
- (NSString)activityIdentifier;
- (NSString)localizedAppName;
- (NSString)platterTargetBundleIdentifier;
- (NSString)remoteDeviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contentType;
- (int64_t)protectionClass;
- (void)setActivityIdentifier:(id)a3;
- (void)setContentType:(int64_t)a3;
- (void)setCreatedDate:(id)a3;
- (void)setDescriptorData:(id)a3;
- (void)setIsEphemeral:(BOOL)a3;
- (void)setIsMomentary:(BOOL)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setPlatterTargetBundleIdentifier:(id)a3;
- (void)setPresentationOptions:(id)a3;
- (void)setProtectionClass:(int64_t)a3;
- (void)setRemoteDeviceIdentifier:(id)a3;
@end

@implementation ACActivityDescriptor

- (ACActivityDescriptor)initWithIdentifier:(id)a3 target:(id)a4 presentationOptions:(id)a5 isEphemeral:(BOOL)a6 isMomentary:(BOOL)a7 createdDate:(id)a8 descriptorData:(id)a9 contentType:(int64_t)a10 remoteDeviceIdentifier:(id)a11 localizedAppName:(id)a12 protectionClass:(int64_t)a13
{
  id v41 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a12;
  v42.receiver = self;
  v42.super_class = (Class)ACActivityDescriptor;
  v25 = [(ACActivityDescriptor *)&v42 init];
  if (v25)
  {
    uint64_t v26 = [v41 copy];
    activityIdentifier = v25->_activityIdentifier;
    v25->_activityIdentifier = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    platterTargetBundleIdentifier = v25->_platterTargetBundleIdentifier;
    v25->_platterTargetBundleIdentifier = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    presentationOptions = v25->_presentationOptions;
    v25->_presentationOptions = (ACActivityPresentationOptions *)v30;

    v25->_isEphemeral = a6;
    v25->_isMomentary = a7;
    uint64_t v32 = [v21 copy];
    createdDate = v25->_createdDate;
    v25->_createdDate = (NSDate *)v32;

    uint64_t v34 = [v22 copy];
    descriptorData = v25->_descriptorData;
    v25->_descriptorData = (NSData *)v34;

    v25->_contentType = a10;
    uint64_t v36 = [v23 copy];
    remoteDeviceIdentifier = v25->_remoteDeviceIdentifier;
    v25->_remoteDeviceIdentifier = (NSString *)v36;

    uint64_t v38 = [v24 copy];
    localizedAppName = v25->_localizedAppName;
    v25->_localizedAppName = (NSString *)v38;

    v25->_protectionClass = a13;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16 = [ACActivityDescriptor alloc];
  v15 = [(ACActivityDescriptor *)self activityIdentifier];
  v4 = [(ACActivityDescriptor *)self platterTargetBundleIdentifier];
  v5 = [(ACActivityDescriptor *)self presentationOptions];
  BOOL v6 = [(ACActivityDescriptor *)self isEphemeral];
  BOOL v7 = [(ACActivityDescriptor *)self isMomentary];
  v8 = [(ACActivityDescriptor *)self createdDate];
  v9 = [(ACActivityDescriptor *)self descriptorData];
  int64_t v10 = [(ACActivityDescriptor *)self contentType];
  v11 = [(ACActivityDescriptor *)self remoteDeviceIdentifier];
  v12 = [(ACActivityDescriptor *)self localizedAppName];
  v13 = [(ACActivityDescriptor *)v16 initWithIdentifier:v15 target:v4 presentationOptions:v5 isEphemeral:v6 isMomentary:v7 createdDate:v8 descriptorData:v9 contentType:v10 remoteDeviceIdentifier:v11 localizedAppName:v12 protectionClass:[(ACActivityDescriptor *)self protectionClass]];

  return v13;
}

- (NSData)descriptorData
{
  return self->_descriptorData;
}

- (void)setDescriptorData:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSString)platterTargetBundleIdentifier
{
  return self->_platterTargetBundleIdentifier;
}

- (void)setPlatterTargetBundleIdentifier:(id)a3
{
}

- (ACActivityPresentationOptions)presentationOptions
{
  return self->_presentationOptions;
}

- (void)setPresentationOptions:(id)a3
{
}

- (BOOL)isEphemeral
{
  return self->_isEphemeral;
}

- (void)setIsEphemeral:(BOOL)a3
{
  self->_isEphemeral = a3;
}

- (BOOL)isMomentary
{
  return self->_isMomentary;
}

- (void)setIsMomentary:(BOOL)a3
{
  self->_isMomentary = a3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
}

- (int64_t)protectionClass
{
  return self->_protectionClass;
}

- (void)setProtectionClass:(int64_t)a3
{
  self->_protectionClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_presentationOptions, 0);
  objc_storeStrong((id *)&self->_platterTargetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);

  objc_storeStrong((id *)&self->_descriptorData, 0);
}

@end