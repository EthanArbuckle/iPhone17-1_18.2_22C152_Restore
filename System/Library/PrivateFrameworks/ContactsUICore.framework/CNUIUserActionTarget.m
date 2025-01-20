@interface CNUIUserActionTarget
+ (id)descriptorForRequiredKeysForActionDiscovering;
+ (id)targetForDirections;
+ (id)targetForEmailWithMail;
+ (id)targetForPayWithWallet;
+ (id)targetForSendMessageIntentWithAppProxy:(id)a3;
+ (id)targetForStartAudioCallIntentWithAppProxy:(id)a3;
+ (id)targetForStartVideoCallIntentWithAppProxy:(id)a3;
+ (id)targetForTextWithAvailableDefaultAppProxy:(id)a3;
+ (id)targetForTextWithMessages;
+ (id)targetForTextWithSkype;
+ (id)targetForVideoWithCallProvider:(id)a3;
+ (id)targetForVideoWithFaceTime;
+ (id)targetForVideoWithSkype;
+ (id)targetForVoiceWithCallProvider:(id)a3;
+ (id)targetForVoiceWithFaceTime;
+ (id)targetForVoiceWithSkype;
+ (id)targetForVoiceWithTelephony;
- (BOOL)isEqual:(id)a3;
- (CNTUCallProvider)callProvider;
- (CNUIUserActionTarget)init;
- (CNUIUserActionTarget)initWithName:(id)a3 bundleIdentifier:(id)a4 teamIdentifier:(id)a5;
- (NSString)actionType;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)teamIdentifier;
- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4;
- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForPostalAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setCallProvider:(id)a3;
- (void)setName:(id)a3;
- (void)setTeamIdentifier:(id)a3;
@end

@implementation CNUIUserActionTarget

+ (id)descriptorForRequiredKeysForActionDiscovering
{
  v10[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v3 = *MEMORY[0x263EFE070];
  v10[0] = *MEMORY[0x263EFDF80];
  v10[1] = v3;
  uint64_t v4 = *MEMORY[0x263EFE110];
  v10[2] = *MEMORY[0x263EFE010];
  v10[3] = v4;
  v10[4] = *MEMORY[0x263EFE0A0];
  v5 = [MEMORY[0x263EFEAB0] descriptorForRequiredKeys];
  v10[5] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:6];
  v7 = [NSString stringWithUTF8String:"+[CNUIUserActionTarget descriptorForRequiredKeysForActionDiscovering]"];
  v8 = [v2 descriptorWithKeyDescriptors:v6 description:v7];

  return v8;
}

+ (id)targetForEmailWithMail
{
  v2 = objc_alloc_init(_CNUIUserActionMailEmailTarget);
  return v2;
}

+ (id)targetForPayWithWallet
{
  v2 = objc_alloc_init(_CNUIUserActionWalletPayTarget);
  return v2;
}

+ (id)targetForDirections
{
  v2 = objc_alloc_init(_CNUIUserActionDirectionsTarget);
  return v2;
}

+ (id)targetForVoiceWithTelephony
{
  v2 = objc_alloc_init(_CNUIUserActionTelephonyVoiceTarget);
  return v2;
}

+ (id)targetForVoiceWithFaceTime
{
  v2 = objc_alloc_init(_CNUIUserActionFaceTimeVoiceTarget);
  return v2;
}

+ (id)targetForVoiceWithSkype
{
  v2 = objc_alloc_init(_CNUIUserActionSkypeVoiceTarget);
  return v2;
}

+ (id)targetForVoiceWithCallProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_CNUIUserActionCallProviderVoiceTarget alloc];
  v5 = [v3 localizedName];
  v6 = [v3 bundleIdentifier];
  v7 = [(CNUIUserActionTarget *)v4 initWithName:v5 bundleIdentifier:v6 teamIdentifier:0];

  [(CNUIUserActionTarget *)v7 setCallProvider:v3];
  return v7;
}

+ (id)targetForStartAudioCallIntentWithAppProxy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_CNUIUserActionStartAudioCallIntentTarget alloc];
  v5 = [v3 localizedName];
  v6 = [v3 bundleIdentifier];
  v7 = [v3 teamIdentifier];

  v8 = [(CNUIUserActionTarget *)v4 initWithName:v5 bundleIdentifier:v6 teamIdentifier:v7];
  return v8;
}

+ (id)targetForVideoWithFaceTime
{
  v2 = objc_alloc_init(_CNUIUserActionFaceTimeVideoTarget);
  return v2;
}

+ (id)targetForVideoWithSkype
{
  v2 = objc_alloc_init(_CNUIUserActionSkypeVideoTarget);
  return v2;
}

+ (id)targetForVideoWithCallProvider:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_CNUIUserActionCallProviderVideoTarget alloc];
  v5 = [v3 localizedName];
  v6 = [v3 bundleIdentifier];
  v7 = [(CNUIUserActionTarget *)v4 initWithName:v5 bundleIdentifier:v6 teamIdentifier:0];

  [(CNUIUserActionTarget *)v7 setCallProvider:v3];
  return v7;
}

+ (id)targetForStartVideoCallIntentWithAppProxy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_CNUIUserActionStartVideoCallIntentTarget alloc];
  v5 = [v3 localizedName];
  v6 = [v3 bundleIdentifier];
  v7 = [v3 teamIdentifier];

  v8 = [(CNUIUserActionTarget *)v4 initWithName:v5 bundleIdentifier:v6 teamIdentifier:v7];
  return v8;
}

+ (id)targetForTextWithMessages
{
  v2 = objc_alloc_init(_CNUIUserActionMessagesTextTarget);
  return v2;
}

+ (id)targetForTextWithSkype
{
  v2 = objc_alloc_init(_CNUIUserActionSkypeTextTarget);
  return v2;
}

+ (id)targetForSendMessageIntentWithAppProxy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_CNUIUserActionSendMessageIntentTarget alloc];
  v5 = [v3 localizedName];
  v6 = [v3 bundleIdentifier];
  v7 = [v3 teamIdentifier];

  v8 = [(CNUIUserActionTarget *)v4 initWithName:v5 bundleIdentifier:v6 teamIdentifier:v7];
  return v8;
}

+ (id)targetForTextWithAvailableDefaultAppProxy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_CNUIUserActionAvailableDefaultAppTextTarget alloc];
  v5 = [v3 localizedName];
  v6 = [v3 bundleIdentifier];
  v7 = [v3 teamIdentifier];

  v8 = [(CNUIUserActionTarget *)v4 initWithName:v5 bundleIdentifier:v6 teamIdentifier:v7];
  return v8;
}

- (CNUIUserActionTarget)init
{
  id v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 raise:@"CNUIInitializerException", @"You can't instantiate the base class %@ without a name and bundle identifier", v5 format];

  return [(CNUIUserActionTarget *)self initWithName:&stru_26BFC7668 bundleIdentifier:&stru_26BFC7668 teamIdentifier:&stru_26BFC7668];
}

- (CNUIUserActionTarget)initWithName:(id)a3 bundleIdentifier:(id)a4 teamIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNUIUserActionTarget;
  v12 = [(CNUIUserActionTarget *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_teamIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F335D0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __32__CNUIUserActionTarget_isEqual___block_invoke;
  v16[3] = &unk_2640172E0;
  v16[4] = self;
  id v17 = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CNUIUserActionTarget_isEqual___block_invoke_2;
  aBlock[3] = &unk_2640172E0;
  aBlock[4] = self;
  id v7 = v17;
  id v15 = v7;
  v8 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__CNUIUserActionTarget_isEqual___block_invoke_3;
  v12[3] = &unk_2640172E0;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  id v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v9, v6, self, v16, v8, v10, 0);

  return (char)self;
}

uint64_t __32__CNUIUserActionTarget_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  id v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 40) name];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __32__CNUIUserActionTarget_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  id v3 = [*(id *)(a1 + 32) bundleIdentifier];
  id v4 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __32__CNUIUserActionTarget_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  id v3 = [*(id *)(a1 + 32) teamIdentifier];
  id v4 = [*(id *)(a1 + 40) teamIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x263F335E8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __28__CNUIUserActionTarget_hash__block_invoke;
  v10[3] = &unk_264017308;
  v10[4] = self;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__CNUIUserActionTarget_hash__block_invoke_2;
  aBlock[3] = &unk_264017308;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__CNUIUserActionTarget_hash__block_invoke_3;
  v8[3] = &unk_264017308;
  v8[4] = self;
  uint64_t v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __28__CNUIUserActionTarget_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __28__CNUIUserActionTarget_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __28__CNUIUserActionTarget_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) teamIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  v19 = (void *)MEMORY[0x263F33608];
  id v6 = a4;
  id v7 = a3;
  v23 = [v7 emailAddresses];
  v22 = [(CNUIUserActionTarget *)self actionsForEmailAddresses:v23 contact:v7 discoveringEnvironment:v6];
  v24[0] = v22;
  v21 = [v7 phoneNumbers];
  v20 = [(CNUIUserActionTarget *)self actionsForPhoneNumbers:v21 contact:v7 discoveringEnvironment:v6];
  v24[1] = v20;
  v8 = [v7 instantMessageAddresses];
  id v9 = [(CNUIUserActionTarget *)self actionsForInstantMessageAddresses:v8 contact:v7 discoveringEnvironment:v6];
  v24[2] = v9;
  id v10 = [v7 socialProfiles];
  id v11 = [(CNUIUserActionTarget *)self actionsForSocialProfiles:v10 contact:v7 discoveringEnvironment:v6];
  v24[3] = v11;
  v12 = [v7 postalAddresses];
  id v13 = [(CNUIUserActionTarget *)self actionsForPostalAddresses:v12 contact:v7 discoveringEnvironment:v6];

  v24[4] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];
  id v15 = objc_msgSend(v14, "_cn_flatten");
  v25[0] = v15;
  objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  id v17 = [v19 observableWithResults:v16];

  return v17;
}

- (id)actionsForEmailAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)actionsForInstantMessageAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)actionsForSocialProfiles:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)actionsForPostalAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (CNTUCallProvider)callProvider
{
  return (CNTUCallProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProvider, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end