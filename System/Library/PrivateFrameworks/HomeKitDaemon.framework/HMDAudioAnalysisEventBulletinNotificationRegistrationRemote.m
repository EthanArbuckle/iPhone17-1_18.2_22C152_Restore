@interface HMDAudioAnalysisEventBulletinNotificationRegistrationRemote
- (HMDAudioAnalysisEventBulletinNotificationRegistration)registration;
- (HMDAudioAnalysisEventBulletinNotificationRegistrationRemote)initWithAudioAnalysisEventBulletinNotificationRegistration:(id)a3 source:(id)a4;
- (HMDBulletinNotificationRegistrationSource)source;
- (id)attributeDescriptions;
@end

@implementation HMDAudioAnalysisEventBulletinNotificationRegistrationRemote

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

- (HMDBulletinNotificationRegistrationSource)source
{
  return (HMDBulletinNotificationRegistrationSource *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)registration
{
  return (HMDAudioAnalysisEventBulletinNotificationRegistration *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *)self registration];
  v5 = (void *)[v3 initWithName:@"registration" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *)self source];
  v8 = (void *)[v6 initWithName:@"source" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistrationRemote)initWithAudioAnalysisEventBulletinNotificationRegistration:(id)a3 source:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistrationRemote;
  v9 = [(HMDAudioAnalysisEventBulletinNotificationRegistrationRemote *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_registration, a3);
    objc_storeStrong((id *)&v10->_source, a4);
  }

  return v10;
}

@end