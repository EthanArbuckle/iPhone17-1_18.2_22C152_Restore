@interface HFUserNotificationServiceTopic
+ (NAIdentity)na_identity;
+ (id)_announceTopic;
+ (id)_applianceTopic;
+ (id)_cameraTopic;
+ (id)_energyTopic;
+ (id)_safetyAndSecurityTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMatter;
- (HFAccessoryType)accessoryType;
- (HFIconDescriptor)iconDescriptor;
- (HFUserNotificationServiceTopic)init;
- (HFUserNotificationServiceTopic)initWithServiceType:(id)a3 topicNameLocalizationKey:(id)a4;
- (HFUserNotificationServiceTopic)initWithServiceTypes:(id)a3 accessoryCategoryTypes:(id)a4 topicNameLocalizationKey:(id)a5 iconDescriptor:(id)a6;
- (HFUserNotificationServiceTopic)initWithServiceTypes:(id)a3 accessoryCategoryTypes:(id)a4 topicNameLocalizationKey:(id)a5 iconForAccessoryType:(id)a6;
- (NSSet)accessoryCategoryTypes;
- (NSSet)serviceTypes;
- (NSString)identifier;
- (NSString)topicName;
- (NSString)topicNameLocalizationKey;
- (unint64_t)hash;
- (void)setIsMatter:(BOOL)a3;
@end

@implementation HFUserNotificationServiceTopic

- (HFUserNotificationServiceTopic)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithServiceTypes_accessoryCategoryTypes_topicNameLocalizationKey_iconDescriptor_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUserNotificationServiceTopic.m", 32, @"%s is unavailable; use %@ instead",
    "-[HFUserNotificationServiceTopic init]",
    v5);

  return 0;
}

- (HFUserNotificationServiceTopic)initWithServiceType:(id)a3 topicNameLocalizationKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F1C6C8];
  id v8 = a4;
  v9 = [v7 configurationWithPointSize:26.0];
  v10 = +[HFServiceIconFactory defaultSymbolIconIdentifierForServiceType:v6];
  v11 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v10 configuration:v9];
  if (!v11)
  {
    v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "HFUserNotificationServiceTopic: Couldn't find SF Symbol for service type: %@", (uint8_t *)&v17, 0xCu);
    }

    v11 = +[HFServiceIconFactory defaultIconDescriptorForServiceType:v6 serviceSubtype:0];
  }
  v13 = [MEMORY[0x263EFFA08] setWithObject:v6];
  v14 = [MEMORY[0x263EFFA08] set];
  v15 = [(HFUserNotificationServiceTopic *)self initWithServiceTypes:v13 accessoryCategoryTypes:v14 topicNameLocalizationKey:v8 iconDescriptor:v11];

  return v15;
}

- (HFUserNotificationServiceTopic)initWithServiceTypes:(id)a3 accessoryCategoryTypes:(id)a4 topicNameLocalizationKey:(id)a5 iconDescriptor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HFUserNotificationServiceTopic;
  v15 = [(HFUserNotificationServiceTopic *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceTypes, a3);
    objc_storeStrong((id *)&v16->_accessoryCategoryTypes, a4);
    objc_storeStrong((id *)&v16->_topicNameLocalizationKey, a5);
    uint64_t v17 = _HFLocalizedStringWithDefaultValue(v13, v13, 1);
    topicName = v16->_topicName;
    v16->_topicName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_iconDescriptor, a6);
  }

  return v16;
}

- (HFUserNotificationServiceTopic)initWithServiceTypes:(id)a3 accessoryCategoryTypes:(id)a4 topicNameLocalizationKey:(id)a5 iconForAccessoryType:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  objc_opt_class();
  id v15 = v11;
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  id v18 = [v17 serviceType];
  uint64_t v19 = +[HFServiceIconFactory defaultSymbolIconIdentifierForServiceType:v18];

  objc_super v20 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  v21 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:v19 configuration:v20];
  v22 = [(HFUserNotificationServiceTopic *)self initWithServiceTypes:v14 accessoryCategoryTypes:v13 topicNameLocalizationKey:v12 iconDescriptor:v21];

  if (v22) {
    objc_storeStrong((id *)&v22->_iconForAccessoryType, a6);
  }

  return v22;
}

- (NSString)identifier
{
  v3 = [(HFUserNotificationServiceTopic *)self serviceTypes];
  v4 = [v3 allObjects];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_142];
  id v6 = [v5 componentsJoinedByString:@","];

  v7 = NSString;
  id v8 = [(HFUserNotificationServiceTopic *)self topicName];
  v9 = [v7 stringWithFormat:@"service-{%@} topicName-%@", v6, v8];

  return (NSString *)v9;
}

uint64_t __44__HFUserNotificationServiceTopic_identifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_277 != -1) {
    dispatch_once(&_MergedGlobals_277, &__block_literal_global_24_7);
  }
  v2 = (void *)qword_26AB2F498;
  return (NAIdentity *)v2;
}

void __45__HFUserNotificationServiceTopic_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_31_3];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_33_3];
  uint64_t v3 = [v0 build];

  v4 = (void *)qword_26AB2F498;
  qword_26AB2F498 = v3;
}

uint64_t __45__HFUserNotificationServiceTopic_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serviceTypes];
}

uint64_t __45__HFUserNotificationServiceTopic_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 accessoryCategoryTypes];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (HFAccessoryType)accessoryType
{
  iconForAccessoryType = self->_iconForAccessoryType;
  if (iconForAccessoryType)
  {
    uint64_t v3 = iconForAccessoryType;
  }
  else
  {
    v5 = [(HFUserNotificationServiceTopic *)self serviceTypes];
    id v6 = [v5 anyObject];

    if (v6)
    {
      uint64_t v3 = +[HFAccessoryType serviceType:v6];
    }
    else
    {
      v7 = [(HFUserNotificationServiceTopic *)self accessoryCategoryTypes];
      id v8 = [v7 anyObject];

      if (v8)
      {
        uint64_t v3 = +[HFAccessoryType categoryType:v8];
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  return v3;
}

+ (id)_announceTopic
{
  if (qword_26AB2F4A0 != -1) {
    dispatch_once(&qword_26AB2F4A0, &__block_literal_global_38_2);
  }
  id v2 = (void *)qword_26AB2F4A8;
  return v2;
}

void __48__HFUserNotificationServiceTopic__announceTopic__block_invoke_2()
{
  v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  id v1 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"waveform" configuration:v0];
  if (qword_26AB2F4B0 != -1) {
    dispatch_once(&qword_26AB2F4B0, &__block_literal_global_51_1);
  }
  id v2 = (id)qword_26AB2F4B8;
  uint64_t v3 = [HFUserNotificationServiceTopic alloc];
  unint64_t v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v5 = [(HFUserNotificationServiceTopic *)v3 initWithServiceTypes:v4 accessoryCategoryTypes:v2 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_Announce" iconDescriptor:v1];

  id v6 = (void *)qword_26AB2F4A8;
  qword_26AB2F4A8 = v5;
}

void __48__HFUserNotificationServiceTopic__announceTopic__block_invoke_5()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F0B0A0];
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2F4B8;
  qword_26AB2F4B8 = v2;
}

+ (id)_safetyAndSecurityTopic
{
  if (qword_26AB2F4C0 != -1) {
    dispatch_once(&qword_26AB2F4C0, &__block_literal_global_57_0);
  }
  uint64_t v2 = (void *)qword_26AB2F4C8;
  return v2;
}

void __57__HFUserNotificationServiceTopic__safetyAndSecurityTopic__block_invoke_2()
{
  v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  id v1 = objc_msgSend(MEMORY[0x263F1C6B0], "hf_safetyAndSecurityImage");
  uint64_t v2 = [v1 configuration];
  uint64_t v3 = [v2 configurationByApplyingConfiguration:v0];

  unint64_t v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"house.badge.shield.half.filled.fill" configuration:v3];
  if (qword_26AB2F4D0 != -1) {
    dispatch_once(&qword_26AB2F4D0, &__block_literal_global_70_6);
  }
  id v5 = (id)qword_26AB2F4D8;
  id v6 = [HFUserNotificationServiceTopic alloc];
  v7 = [MEMORY[0x263EFFA08] set];
  uint64_t v8 = [(HFUserNotificationServiceTopic *)v6 initWithServiceTypes:v7 accessoryCategoryTypes:v5 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_SafetyAndSecurity" iconDescriptor:v4];

  v9 = (void *)qword_26AB2F4C8;
  qword_26AB2F4C8 = v8;
}

void __57__HFUserNotificationServiceTopic__safetyAndSecurityTopic__block_invoke_5()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = *MEMORY[0x263F0B0A0];
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)qword_26AB2F4D8;
  qword_26AB2F4D8 = v2;
}

+ (id)_cameraTopic
{
  if (qword_26AB2F4E0 != -1) {
    dispatch_once(&qword_26AB2F4E0, &__block_literal_global_74_0);
  }
  uint64_t v2 = (void *)qword_26AB2F4E8;
  return v2;
}

void __46__HFUserNotificationServiceTopic__cameraTopic__block_invoke_2()
{
  v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  id v1 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"video.doorbell.fill" configuration:v0];
  if (qword_26AB2F4F0 != -1) {
    dispatch_once(&qword_26AB2F4F0, &__block_literal_global_86_0);
  }
  id v2 = (id)qword_26AB2F4F8;
  uint64_t v3 = [HFUserNotificationServiceTopic alloc];
  unint64_t v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v5 = [(HFUserNotificationServiceTopic *)v3 initWithServiceTypes:v4 accessoryCategoryTypes:v2 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_Camera" iconDescriptor:v1];

  id v6 = (void *)qword_26AB2F4E8;
  qword_26AB2F4E8 = v5;
}

void __46__HFUserNotificationServiceTopic__cameraTopic__block_invoke_5()
{
  v5[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0B1B8];
  v5[0] = *MEMORY[0x263F0B0A8];
  v5[1] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  unint64_t v4 = (void *)qword_26AB2F4F8;
  qword_26AB2F4F8 = v3;
}

+ (id)_energyTopic
{
  if (qword_26AB2F500 != -1) {
    dispatch_once(&qword_26AB2F500, &__block_literal_global_90);
  }
  id v2 = (void *)qword_26AB2F508;
  return v2;
}

void __46__HFUserNotificationServiceTopic__energyTopic__block_invoke_2()
{
  v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  uint64_t v1 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"bolt.fill" configuration:v0];
  id v2 = [HFUserNotificationServiceTopic alloc];
  uint64_t v3 = [MEMORY[0x263EFFA08] set];
  unint64_t v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v5 = [(HFUserNotificationServiceTopic *)v2 initWithServiceTypes:v3 accessoryCategoryTypes:v4 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_Energy" iconDescriptor:v1];

  id v6 = (void *)qword_26AB2F508;
  qword_26AB2F508 = v5;
}

+ (id)_applianceTopic
{
  if (qword_26AB2F510 != -1) {
    dispatch_once(&qword_26AB2F510, &__block_literal_global_102_1);
  }
  id v2 = (void *)qword_26AB2F518;
  return v2;
}

void __49__HFUserNotificationServiceTopic__applianceTopic__block_invoke_2()
{
  v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
  uint64_t v1 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"robotic.vacuum.fill" configuration:v0];
  id v2 = [HFUserNotificationServiceTopic alloc];
  uint64_t v3 = [MEMORY[0x263EFFA08] set];
  unint64_t v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v5 = [(HFUserNotificationServiceTopic *)v2 initWithServiceTypes:v3 accessoryCategoryTypes:v4 topicNameLocalizationKey:@"HFUserNotificationServiceTopicName_Appliances" iconDescriptor:v1];

  [(HFUserNotificationServiceTopic *)v5 setIsMatter:1];
  id v6 = (void *)qword_26AB2F518;
  qword_26AB2F518 = (uint64_t)v5;
}

- (NSSet)serviceTypes
{
  return self->_serviceTypes;
}

- (NSSet)accessoryCategoryTypes
{
  return self->_accessoryCategoryTypes;
}

- (NSString)topicName
{
  return self->_topicName;
}

- (NSString)topicNameLocalizationKey
{
  return self->_topicNameLocalizationKey;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (BOOL)isMatter
{
  return self->_isMatter;
}

- (void)setIsMatter:(BOOL)a3
{
  self->_isMatter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_topicNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_topicName, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryTypes, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_iconForAccessoryType, 0);
}

@end