@interface HFPinCodeItem
+ (id)na_identity;
- (BOOL)hasRestrictions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGuest;
- (BOOL)isUnknownGuest;
- (BOOL)isUnknownGuestFromMatter;
- (HFPinCodeItem)initWithPinCode:(id)a3 inHome:(id)a4 onAccessory:(id)a5;
- (HMAccessCodeUserInformation)userLabel;
- (HMHome)home;
- (HMUser)user;
- (NSArray)accessories;
- (NSString)pinCodeValue;
- (NSString)unknownMatterGuestUniqueID;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_userHandle;
- (id)_userName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)isEnabledOnAccessory;
- (unint64_t)hash;
- (void)setAccessories:(id)a3;
- (void)setHasRestrictions:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setIsEnabledOnAccessory:(id)a3;
- (void)setPinCodeValue:(id)a3;
- (void)setUnknownMatterGuestUniqueID:(id)a3;
- (void)setUserLabel:(id)a3;
- (void)updateFromPinCode:(id)a3;
@end

@implementation HFPinCodeItem

- (HFPinCodeItem)initWithPinCode:(id)a3 inHome:(id)a4 onAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HFPinCodeItem;
  v11 = [(HFPinCodeItem *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    [(HFPinCodeItem *)v12 updateFromPinCode:v8];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HFPinCodeItem_initWithPinCode_inHome_onAccessory___block_invoke;
    aBlock[3] = &unk_264093B40;
    id v17 = v10;
    v13 = _Block_copy(aBlock);
    id isEnabledOnAccessory = v12->_isEnabledOnAccessory;
    v12->_id isEnabledOnAccessory = v13;
  }
  return v12;
}

uint64_t __52__HFPinCodeItem_initWithPinCode_inHome_onAccessory___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsObject:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(HFPinCodeItem *)self home];
  v6 = (void *)v4[11];
  v4[11] = v5;

  uint64_t v7 = [(HFPinCodeItem *)self userLabel];
  id v8 = (void *)v4[12];
  v4[12] = v7;

  id v9 = [(HFPinCodeItem *)self pinCodeValue];
  uint64_t v10 = [v9 copy];
  v11 = (void *)v4[8];
  v4[8] = v10;

  v12 = [(HFPinCodeItem *)self accessories];
  uint64_t v13 = [v12 copy];
  v14 = (void *)v4[9];
  v4[9] = v13;

  *((unsigned char *)v4 + 56) = [(HFPinCodeItem *)self hasRestrictions];
  v15 = [(HFPinCodeItem *)self isEnabledOnAccessory];
  uint64_t v16 = [v15 copy];
  id v17 = (void *)v4[13];
  v4[13] = v16;

  objc_super v18 = [(HFPinCodeItem *)self unknownMatterGuestUniqueID];
  uint64_t v19 = [v18 copy];
  v20 = (void *)v4[10];
  v4[10] = v19;

  return v4;
}

+ (id)na_identity
{
  if (_MergedGlobals_5_1 != -1) {
    dispatch_once(&_MergedGlobals_5_1, &__block_literal_global_4_3);
  }
  v2 = (void *)qword_26AB2E7C8;
  return v2;
}

void __28__HFPinCodeItem_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_10_4];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_12_1];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_14_2];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_16_2 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_19_1];
  uint64_t v5 = [v0 build];

  v6 = (void *)qword_26AB2E7C8;
  qword_26AB2E7C8 = v5;
}

id __28__HFPinCodeItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 userLabel];
  id v4 = [v3 simpleLabel];

  if (!v4)
  {
    uint64_t v5 = [v2 userLabel];
    v6 = [v5 user];
    id v4 = [v6 uniqueIdentifier];

    if (!v4)
    {
      uint64_t v7 = [v2 userLabel];
      id v8 = [v7 removedUserInfo];
      id v4 = [v8 userUUID];
    }
  }

  return v4;
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 pinCodeValue];
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 unknownMatterGuestUniqueID];
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 accessories];
}

uint64_t __28__HFPinCodeItem_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = v4;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (void)updateFromPinCode:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = HFLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Updating HFPinCodeItem with values from new HFPinCode. item: %@ PinCode: %@", (uint8_t *)&v11, 0x16u);
  }

  v6 = [v4 userLabel];
  [(HFPinCodeItem *)self setUserLabel:v6];

  uint64_t v7 = [v4 pinCodeValue];
  [(HFPinCodeItem *)self setPinCodeValue:v7];

  -[HFPinCodeItem setHasRestrictions:](self, "setHasRestrictions:", [v4 hasRestrictions]);
  id v8 = [v4 accessories];
  uint64_t v9 = [v8 allObjects];
  [(HFPinCodeItem *)self setAccessories:v9];

  uint64_t v10 = [v4 unknownMatterGuestUniqueID];
  [(HFPinCodeItem *)self setUnknownMatterGuestUniqueID:v10];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFPinCodeItem *)self accessories];
  id v5 = (id)[v3 appendObject:v4 withName:@"accessories"];

  v6 = [(HFPinCodeItem *)self userLabel];
  uint64_t v7 = [v6 user];
  id v8 = (id)[v3 appendObject:v7 withName:@"user"];

  uint64_t v9 = [(HFPinCodeItem *)self userLabel];
  uint64_t v10 = [v9 simpleLabel];
  id v11 = (id)[v3 appendBool:v10 != 0 withName:@"hasSimpleLabel"];

  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFPinCodeItem hasRestrictions](self, "hasRestrictions"), @"hasRestrictions");
  __int16 v13 = [(HFPinCodeItem *)self userLabel];
  id v14 = [v13 removedUserInfo];
  uint64_t v15 = [v14 userUUID];
  id v16 = (id)[v3 appendObject:v15 withName:@"removedUserUUID"];

  id v17 = [(HFPinCodeItem *)self user];
  id v18 = (id)[v3 appendObject:v17 withName:@"user"];

  uint64_t v19 = [(HFPinCodeItem *)self unknownMatterGuestUniqueID];
  id v20 = (id)[v3 appendObject:v19 withName:@"unknownMatterGuestUniqueID"];

  v21 = [v3 build];

  return v21;
}

- (HMUser)user
{
  id v2 = [(HFPinCodeItem *)self userLabel];
  uint64_t v3 = [v2 user];

  return (HMUser *)v3;
}

- (BOOL)isGuest
{
  id v2 = [(HFPinCodeItem *)self userLabel];
  uint64_t v3 = [v2 user];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)_userName
{
  uint64_t v3 = [(HFPinCodeItem *)self userLabel];
  uint64_t v4 = [v3 simpleLabel];
  if (v4) {
    goto LABEL_2;
  }
  v6 = [(HFPinCodeItem *)self user];
  id v5 = [v6 name];

  if (!v5)
  {
    id v8 = [(HFPinCodeItem *)self userLabel];
    uint64_t v3 = [v8 removedUserInfo];

    uint64_t v4 = [v3 name];
LABEL_2:
    id v5 = (void *)v4;
  }
  return v5;
}

- (id)_userHandle
{
  uint64_t v3 = [(HFPinCodeItem *)self userLabel];
  uint64_t v4 = [v3 user];

  if (v4)
  {
    id v5 = [(HFPinCodeItem *)self home];
    v6 = [(HFPinCodeItem *)self userLabel];
    uint64_t v7 = [v6 user];
    objc_msgSend(v5, "hf_handleForUser:", v7);
    id v8 = (HFUserHandle *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = [(HFPinCodeItem *)self userLabel];
    uint64_t v10 = [v9 removedUserInfo];
    id v5 = [v10 userID];

    if (v5) {
      id v8 = [[HFUserHandle alloc] initWithType:1 userID:v5];
    }
    else {
      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isUnknownGuest
{
  if (![(HFPinCodeItem *)self isGuest]) {
    return 0;
  }
  uint64_t v3 = [(HFPinCodeItem *)self _userName];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)isUnknownGuestFromMatter
{
  uint64_t v3 = [(HFPinCodeItem *)self pinCodeValue];
  if ([v3 length])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(HFPinCodeItem *)self userLabel];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      v6 = [(HFPinCodeItem *)self unknownMatterGuestUniqueID];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  id v5 = [(HFPinCodeItem *)self _userName];
  if (![v5 length])
  {
    uint64_t v6 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeUnknownGuestPlaceholderLabel", @"HFPinCodeUnknownGuestPlaceholderLabel", 1);

    [v4 setObject:@"Home.Locks.Pincodes.Guest.Unknown" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
    id v5 = (void *)v6;
  }
  [v4 setObject:v5 forKeyedSubscript:@"title"];
  [v4 setObject:@"Home.Locks.Pincodes.Guest.Name" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  uint64_t v7 = [(HFPinCodeItem *)self _userHandle];
  if (!v7)
  {
    id v8 = [MEMORY[0x263F1C6C8] configurationWithPointSize:26.0];
    uint64_t v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"number.circle.fill" withConfiguration:v8];
    [v4 setObject:v9 forKeyedSubscript:@"iconImage"];
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"userID");
  uint64_t v10 = [(HFPinCodeItem *)self userLabel];
  id v11 = [v10 user];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x263EFFA08];
    __int16 v13 = [(HFPinCodeItem *)self userLabel];
    id v14 = [v13 user];
    uint64_t v15 = [v12 setWithObject:v14];

    [v4 setObject:v15 forKeyedSubscript:@"dependentHomeKitObjects"];
  }
  id v16 = NSNumber;
  id v17 = [(HFPinCodeItem *)self isEnabledOnAccessory];
  id v18 = [(HFPinCodeItem *)self accessories];
  if (((unsigned int (**)(void, void *))v17)[2](v17, v18)) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  id v20 = [v16 numberWithInteger:v19];
  [v4 setObject:v20 forKeyedSubscript:@"state"];

  v21 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v4 setObject:v21 forKeyedSubscript:@"dependentHomeKitClasses"];

  v22 = (void *)MEMORY[0x263F58190];
  v23 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v24 = [v22 futureWithResult:v23];

  return v24;
}

- (NSString)pinCodeValue
{
  return self->_pinCodeValue;
}

- (void)setPinCodeValue:(id)a3
{
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (BOOL)hasRestrictions
{
  return self->_hasRestrictions;
}

- (void)setHasRestrictions:(BOOL)a3
{
  self->_hasRestrictions = a3;
}

- (NSString)unknownMatterGuestUniqueID
{
  return self->_unknownMatterGuestUniqueID;
}

- (void)setUnknownMatterGuestUniqueID:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMAccessCodeUserInformation)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
}

- (id)isEnabledOnAccessory
{
  return self->_isEnabledOnAccessory;
}

- (void)setIsEnabledOnAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isEnabledOnAccessory, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_unknownMatterGuestUniqueID, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_pinCodeValue, 0);
}

@end