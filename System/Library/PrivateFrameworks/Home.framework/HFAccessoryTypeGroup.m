@interface HFAccessoryTypeGroup
+ (HFAccessoryTypeGroup)accessoryTypeGroupWithIdentifier:(id)a3;
+ (id)climateAccessoryTypeGroup;
+ (id)energyAccessoryTypeGroup;
+ (id)hiddenFromScenesAndAutomationsAccessoryTypeGroup;
+ (id)lightAccessoryTypeGroup;
+ (id)mediaAccessoryTypeGroup;
+ (id)otherAccessoryTypeGroup;
+ (id)outletAccessoryTypeGroup;
+ (id)restrictedGuestAccessoryTypeGroups;
+ (id)securityAccessoryTypeGroup;
+ (id)sensorAccessoryTypeGroup;
+ (id)switchAccessoryTypeGroup;
+ (id)unionGroups:(id)a3;
+ (id)waterAccessoryTypeGroup;
+ (void)warmUp;
- (BOOL)containsType:(id)a3;
- (BOOL)intersectsGroup:(id)a3;
- (HFAccessoryTypeGroup)initWithAccessoryTypes:(id)a3;
- (HFAccessoryTypeGroup)initWithName:(id)a3 accessoryTypes:(id)a4;
- (NSSet)types;
- (NSString)_fullName;
- (NSString)debugDescription;
- (NSString)fullName;
- (NSString)name;
- (NSUUID)uniqueIdentifier;
- (id)_initWithIdentifier:(id)a3 name:(id)a4 set:(id)a5;
- (id)_initWithIdentifierString:(id)a3 name:(id)a4 accessoryTypes:(id)a5;
- (id)_initWithName:(id)a3 set:(id)a4;
- (id)filterAccessoryRepresentableObjects:(id)a3;
- (id)groupByIntersectingGroup:(id)a3;
- (id)groupBySubtractingGroup:(id)a3;
- (id)groupByUnioningGroup:(id)a3;
- (void)set_fullName:(id)a3;
@end

@implementation HFAccessoryTypeGroup

- (BOOL)containsType:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessoryTypeGroup *)self types];
  char v6 = objc_msgSend(v5, "na_safeContainsObject:", v4);

  return v6;
}

- (NSSet)types
{
  return self->_types;
}

+ (id)energyAccessoryTypeGroup
{
  if (qword_26AB2E8C0 != -1) {
    dispatch_once(&qword_26AB2E8C0, &__block_literal_global_133_1);
  }
  v2 = (void *)qword_26AB2E8C8;
  return v2;
}

+ (id)climateAccessoryTypeGroup
{
  if (qword_26AB2E8B0 != -1) {
    dispatch_once(&qword_26AB2E8B0, &__block_literal_global_122);
  }
  v2 = (void *)qword_26AB2E8B8;
  return v2;
}

+ (id)mediaAccessoryTypeGroup
{
  if (qword_26AB2E8E0 != -1) {
    dispatch_once(&qword_26AB2E8E0, &__block_literal_global_158);
  }
  v2 = (void *)qword_26AB2E8E8;
  return v2;
}

+ (id)securityAccessoryTypeGroup
{
  if (qword_26AB2E8F0 != -1) {
    dispatch_once(&qword_26AB2E8F0, &__block_literal_global_165);
  }
  v2 = (void *)qword_26AB2E8F8;
  return v2;
}

+ (id)lightAccessoryTypeGroup
{
  if (qword_26AB2E8D0 != -1) {
    dispatch_once(&qword_26AB2E8D0, &__block_literal_global_140);
  }
  v2 = (void *)qword_26AB2E8D8;
  return v2;
}

+ (id)waterAccessoryTypeGroup
{
  if (qword_26AB2E900 != -1) {
    dispatch_once(&qword_26AB2E900, &__block_literal_global_174_0);
  }
  v2 = (void *)qword_26AB2E908;
  return v2;
}

void __48__HFAccessoryTypeGroup_outletAccessoryTypeGroup__block_invoke_2()
{
  v10[4] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = +[HFAccessoryType categoryType:@"3047A1A5-8BFC-4112-9888-21314F438FF3"];
  v10[0] = v2;
  v3 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7D0]];
  v10[1] = v3;
  id v4 = +[HFAccessoryType matterDeviceType:&unk_26C0F60D8];
  v10[2] = v4;
  v5 = +[HFAccessoryType matterDeviceType:&unk_26C0F60F0];
  v10[3] = v5;
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  v7 = [v1 setWithArray:v6];
  uint64_t v8 = [(HFAccessoryTypeGroup *)v0 _initWithName:0 set:v7];
  v9 = (void *)qword_26AB2E918;
  qword_26AB2E918 = v8;
}

void __47__HFAccessoryTypeGroup_lightAccessoryTypeGroup__block_invoke_2()
{
  void v10[5] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  v1 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameLights", @"HFAccessoryTypeGroupNameLights", 1);
  v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D780]];
  v3 = +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_26C0F6060, v2);
  v10[1] = v3;
  id v4 = +[HFAccessoryType matterDeviceType:&unk_26C0F6078];
  v10[2] = v4;
  v5 = +[HFAccessoryType matterDeviceType:&unk_26C0F6090];
  v10[3] = v5;
  char v6 = +[HFAccessoryType matterDeviceType:&unk_26C0F60A8];
  v10[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:5];
  uint64_t v8 = [(HFAccessoryTypeGroup *)v0 _initWithIdentifierString:@"563F7D20-6AFC-44CE-986D-63B28F62C9E3" name:v1 accessoryTypes:v7];

  v9 = (void *)qword_26AB2E8D8;
  qword_26AB2E8D8 = v8;
}

void __48__HFAccessoryTypeGroup_switchAccessoryTypeGroup__block_invoke_2()
{
  v11[5] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D828]];
  v3 = +[HFAccessoryType matterDeviceType:](HFAccessoryType, "matterDeviceType:", &unk_26C0F6108, v2);
  v11[1] = v3;
  id v4 = +[HFAccessoryType matterDeviceType:&unk_26C0F6120];
  v11[2] = v4;
  v5 = +[HFAccessoryType matterDeviceType:&unk_26C0F6138];
  v11[3] = v5;
  char v6 = +[HFAccessoryType matterDeviceType:&unk_26C0F6150];
  v11[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
  uint64_t v8 = [v1 setWithArray:v7];
  uint64_t v9 = [(HFAccessoryTypeGroup *)v0 _initWithName:0 set:v8];
  v10 = (void *)qword_26AB2E938;
  qword_26AB2E938 = v9;
}

void __72__HFAccessoryTypeGroup_hiddenFromScenesAndAutomationsAccessoryTypeGroup__block_invoke_2()
{
  v17[10] = *MEMORY[0x263EF8340];
  v14 = [HFAccessoryTypeGroup alloc];
  v0 = (void *)MEMORY[0x263EFFA08];
  v16 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D6D8]];
  v17[0] = v16;
  v15 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D740]];
  v17[1] = v15;
  v1 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D758]];
  v17[2] = v1;
  uint64_t v2 = *MEMORY[0x263F0D880];
  v3 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D880]];
  v17[3] = v3;
  id v4 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D898]];
  v17[4] = v4;
  v5 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D8A0]];
  v17[5] = v5;
  char v6 = +[HFAccessoryType serviceType:v2 subtype:*MEMORY[0x263F0D5B8]];
  v17[6] = v6;
  v7 = +[HFAccessoryType serviceType:v2 subtype:*MEMORY[0x263F0D5C0]];
  v17[7] = v7;
  uint64_t v8 = +[HFAccessoryType serviceType:v2 subtype:*MEMORY[0x263F0D5D8]];
  v17[8] = v8;
  uint64_t v9 = +[HFAccessoryType serviceType:v2 subtype:*MEMORY[0x263F0D5F0]];
  v17[9] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:10];
  v11 = [v0 setWithArray:v10];
  uint64_t v12 = [(HFAccessoryTypeGroup *)v14 _initWithName:0 set:v11];
  v13 = (void *)qword_26AB2E998;
  qword_26AB2E998 = v12;
}

void __49__HFAccessoryTypeGroup_climateAccessoryTypeGroup__block_invoke_2()
{
  v17[12] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  uint64_t v12 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameClimate", @"HFAccessoryTypeGroupNameClimate", 1);
  v16 = +[HFAccessoryType categoryType:@"9D302CDA-1467-4E19-ABC9-9ED36BE34508"];
  v17[0] = v16;
  v15 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D618]];
  v17[1] = v15;
  v14 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D630]];
  v17[2] = v14;
  v13 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D6C8]];
  v17[3] = v13;
  v1 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D708]];
  v17[4] = v1;
  uint64_t v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D720]];
  v17[5] = v2;
  v3 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D730]];
  v17[6] = v3;
  id v4 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D858]];
  v17[7] = v4;
  v5 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D870]];
  v17[8] = v5;
  char v6 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D890]];
  v17[9] = v6;
  v7 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D8B8]];
  v17[10] = v7;
  uint64_t v8 = +[HFAccessoryType matterDeviceType:&unk_26C0F6048];
  void v17[11] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:12];
  uint64_t v10 = [(HFAccessoryTypeGroup *)v0 _initWithIdentifierString:@"0CA6536B-8EAD-4013-AA62-01754F256DD5" name:v12 accessoryTypes:v9];
  v11 = (void *)qword_26AB2E8B8;
  qword_26AB2E8B8 = v10;
}

void __48__HFAccessoryTypeGroup_sensorAccessoryTypeGroup__block_invoke_2()
{
  v17[12] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  uint64_t v12 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameSensors", @"HFAccessoryTypeGroupNameSensors", 1);
  v16 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B118]];
  v17[0] = v16;
  v15 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D758]];
  v17[1] = v15;
  v14 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D768]];
  v17[2] = v14;
  v13 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7F8]];
  v17[3] = v13;
  v1 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7A8]];
  v17[4] = v1;
  uint64_t v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D698]];
  v17[5] = v2;
  v3 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D730]];
  v17[6] = v3;
  id v4 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7B8]];
  v17[7] = v4;
  v5 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D858]];
  v17[8] = v5;
  char v6 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D630]];
  v17[9] = v6;
  v7 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D670]];
  v17[10] = v7;
  uint64_t v8 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D688]];
  void v17[11] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:12];
  uint64_t v10 = [(HFAccessoryTypeGroup *)v0 _initWithIdentifierString:@"63489665-5E39-4C17-A590-755E1AAC02AE" name:v12 accessoryTypes:v9];
  v11 = (void *)qword_26AB2E928;
  qword_26AB2E928 = v10;
}

void __50__HFAccessoryTypeGroup_securityAccessoryTypeGroup__block_invoke_2()
{
  v19[14] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  v13 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameSecurity", @"HFAccessoryTypeGroupNameSecurity", 1);
  v18 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B0A8]];
  v19[0] = v18;
  v17 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D670]];
  v19[1] = v17;
  v16 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D688]];
  v19[2] = v16;
  v15 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D698]];
  v19[3] = v15;
  v14 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D6A8]];
  v19[4] = v14;
  uint64_t v12 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D6F8]];
  v19[5] = v12;
  v1 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D798]];
  v19[6] = v1;
  uint64_t v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D788]];
  v19[7] = v2;
  v3 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7A8]];
  v19[8] = v3;
  id v4 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7B8]];
  v19[9] = v4;
  v5 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7D8]];
  v19[10] = v5;
  char v6 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D7F8]];
  v19[11] = v6;
  v7 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D8A8]];
  v19[12] = v7;
  uint64_t v8 = +[HFAccessoryType matterDeviceType:&unk_26C0F60C0];
  v19[13] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:14];
  uint64_t v10 = [(HFAccessoryTypeGroup *)v0 _initWithIdentifierString:@"430C9F25-44E0-4F7E-BE63-1D00B1500545" name:v13 accessoryTypes:v9];
  v11 = (void *)qword_26AB2E8F8;
  qword_26AB2E8F8 = v10;
}

void __47__HFAccessoryTypeGroup_waterAccessoryTypeGroup__block_invoke_2()
{
  v14[8] = *MEMORY[0x263EF8340];
  v13 = [HFAccessoryTypeGroup alloc];
  v0 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameWater", @"HFAccessoryTypeGroupNameWater", 1);
  v1 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D6D8]];
  v14[0] = v1;
  uint64_t v2 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D740]];
  v14[1] = v2;
  v3 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D758]];
  v14[2] = v3;
  uint64_t v4 = *MEMORY[0x263F0D880];
  v5 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D880]];
  v14[3] = v5;
  char v6 = +[HFAccessoryType serviceType:v4 subtype:*MEMORY[0x263F0D5B8]];
  v14[4] = v6;
  v7 = +[HFAccessoryType serviceType:v4 subtype:*MEMORY[0x263F0D5C0]];
  v14[5] = v7;
  uint64_t v8 = +[HFAccessoryType serviceType:v4 subtype:*MEMORY[0x263F0D5D8]];
  v14[6] = v8;
  uint64_t v9 = +[HFAccessoryType serviceType:v4 subtype:*MEMORY[0x263F0D5F0]];
  v14[7] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:8];
  uint64_t v11 = [(HFAccessoryTypeGroup *)v13 _initWithIdentifierString:@"3E68745D-F0E1-4B73-8FBD-0E8978A33403" name:v0 accessoryTypes:v10];
  uint64_t v12 = (void *)qword_26AB2E908;
  qword_26AB2E908 = v11;
}

void __47__HFAccessoryTypeGroup_mediaAccessoryTypeGroup__block_invoke_2()
{
  v13[8] = *MEMORY[0x263EF8340];
  uint64_t v12 = [HFAccessoryTypeGroup alloc];
  v0 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameSpeakersAndTVs", @"HFAccessoryTypeGroupNameSpeakersAndTVs", 1);
  v1 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B010]];
  v13[0] = v1;
  uint64_t v2 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B030]];
  v13[1] = v2;
  v3 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B038]];
  v13[2] = v3;
  uint64_t v4 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B0A0]];
  v13[3] = v4;
  v5 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B160]];
  v13[4] = v5;
  char v6 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D808]];
  v13[5] = v6;
  v7 = +[HFAccessoryType serviceType:*MEMORY[0x263F0D850]];
  v13[6] = v7;
  uint64_t v8 = +[HFAccessoryType mediaSystemType];
  v13[7] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:8];
  uint64_t v10 = [(HFAccessoryTypeGroup *)v12 _initWithIdentifierString:@"7A5BD1AB-6478-4560-AD68-D91053B75F44" name:v0 accessoryTypes:v9];
  uint64_t v11 = (void *)qword_26AB2E8E8;
  qword_26AB2E8E8 = v10;
}

+ (id)switchAccessoryTypeGroup
{
  if (qword_26AB2E930 != -1) {
    dispatch_once(&qword_26AB2E930, &__block_literal_global_196);
  }
  uint64_t v2 = (void *)qword_26AB2E938;
  return v2;
}

+ (id)outletAccessoryTypeGroup
{
  if (qword_26AB2E910 != -1) {
    dispatch_once(&qword_26AB2E910, &__block_literal_global_181);
  }
  uint64_t v2 = (void *)qword_26AB2E918;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fullName, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __47__HFAccessoryTypeGroup_otherAccessoryTypeGroup__block_invoke_2()
{
  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameOther", @"HFAccessoryTypeGroupNameOther", 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(HFAccessoryTypeGroup *)v0 _initWithIdentifierString:@"7FADD792-61A4-4340-A849-215882E2F008" name:v3 accessoryTypes:MEMORY[0x263EFFA68]];
  uint64_t v2 = (void *)qword_26AB2E948;
  qword_26AB2E948 = v1;
}

void __48__HFAccessoryTypeGroup_energyAccessoryTypeGroup__block_invoke_2()
{
  v0 = [HFAccessoryTypeGroup alloc];
  _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameEnergy", @"HFAccessoryTypeGroupNameEnergy", 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(HFAccessoryTypeGroup *)v0 _initWithIdentifierString:@"b92aceee-dff5-4773-a058-c5e64bc487b2" name:v3 accessoryTypes:MEMORY[0x263EFFA68]];
  uint64_t v2 = (void *)qword_26AB2E8C8;
  qword_26AB2E8C8 = v1;
}

+ (id)unionGroups:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  uint64_t v12 = __Block_byref_object_dispose__4;
  uint64_t v4 = [HFAccessoryTypeGroup alloc];
  v13 = [(HFAccessoryTypeGroup *)v4 initWithAccessoryTypes:MEMORY[0x263EFFA68]];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__HFAccessoryTypeGroup_unionGroups___block_invoke;
  v7[3] = &unk_26408EDB0;
  v7[4] = &v8;
  objc_msgSend(v3, "na_each:", v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (HFAccessoryTypeGroup)initWithAccessoryTypes:(id)a3
{
  return [(HFAccessoryTypeGroup *)self initWithName:0 accessoryTypes:a3];
}

uint64_t __36__HFAccessoryTypeGroup_unionGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) groupByUnioningGroup:a2];
  return MEMORY[0x270F9A758]();
}

- (id)_initWithIdentifierString:(id)a3 name:(id)a4 accessoryTypes:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F08C38];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[[v8 alloc] initWithUUIDString:v11];

  v13 = [MEMORY[0x263EFFA08] setWithArray:v9];

  id v14 = [(HFAccessoryTypeGroup *)self _initWithIdentifier:v12 name:v10 set:v13];
  return v14;
}

- (id)groupByUnioningGroup:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [HFAccessoryTypeGroup alloc];
    char v6 = [(HFAccessoryTypeGroup *)self types];
    v7 = [v4 types];

    uint64_t v8 = [v6 setByAddingObjectsFromSet:v7];
    id v9 = [(HFAccessoryTypeGroup *)v5 _initWithName:0 set:v8];
  }
  else
  {
    id v9 = self;
  }
  return v9;
}

- (HFAccessoryTypeGroup)initWithName:(id)a3 accessoryTypes:(id)a4
{
  char v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a3;
  uint64_t v8 = [v6 setWithArray:a4];
  id v9 = [(HFAccessoryTypeGroup *)self _initWithName:v7 set:v8];

  return v9;
}

- (id)_initWithName:(id)a3 set:(id)a4
{
  char v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [(HFAccessoryTypeGroup *)self _initWithIdentifier:v9 name:v8 set:v7];

  return v10;
}

- (id)_initWithIdentifier:(id)a3 name:(id)a4 set:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFAccessoryTypeGroup;
  uint64_t v12 = [(HFAccessoryTypeGroup *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uniqueIdentifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

+ (void)warmUp
{
  id v3 = (id)[a1 climateAccessoryTypeGroup];
  id v4 = (id)[a1 energyAccessoryTypeGroup];
  id v5 = (id)[a1 lightAccessoryTypeGroup];
  id v6 = (id)[a1 mediaAccessoryTypeGroup];
  id v7 = (id)[a1 securityAccessoryTypeGroup];
  id v8 = (id)[a1 waterAccessoryTypeGroup];
  id v9 = (id)[a1 hiddenFromScenesAndAutomationsAccessoryTypeGroup];
  id v10 = (id)[a1 sensorAccessoryTypeGroup];
  id v11 = (id)[a1 otherAccessoryTypeGroup];
}

+ (id)otherAccessoryTypeGroup
{
  if (qword_26AB2E940 != -1) {
    dispatch_once(&qword_26AB2E940, &__block_literal_global_208_0);
  }
  uint64_t v2 = (void *)qword_26AB2E948;
  return v2;
}

+ (id)hiddenFromScenesAndAutomationsAccessoryTypeGroup
{
  if (qword_26AB2E990 != -1) {
    dispatch_once(&qword_26AB2E990, &__block_literal_global_232);
  }
  uint64_t v2 = (void *)qword_26AB2E998;
  return v2;
}

+ (id)sensorAccessoryTypeGroup
{
  if (qword_26AB2E920 != -1) {
    dispatch_once(&qword_26AB2E920, &__block_literal_global_189_0);
  }
  uint64_t v2 = (void *)qword_26AB2E928;
  return v2;
}

+ (id)restrictedGuestAccessoryTypeGroups
{
  uint64_t v2 = objc_opt_new();
  if (qword_26AB2E950 != -1) {
    dispatch_once(&qword_26AB2E950, &__block_literal_global_216);
  }
  id v3 = (id)qword_26AB2E958;
  if (qword_26AB2E960 != -1) {
    dispatch_once(&qword_26AB2E960, &__block_literal_global_220);
  }
  id v4 = (id)qword_26AB2E968;
  if (qword_26AB2E970 != -1) {
    dispatch_once(&qword_26AB2E970, &__block_literal_global_224);
  }
  id v5 = (id)qword_26AB2E978;
  if (qword_26AB2E980 != -1) {
    dispatch_once(&qword_26AB2E980, &__block_literal_global_228);
  }
  id v6 = (id)qword_26AB2E988;
  [v2 addObject:v3];
  [v2 addObject:v4];
  [v2 addObject:v5];
  [v2 addObject:v6];

  return v2;
}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_2()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  uint64_t v1 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B048]];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  uint64_t v3 = [(HFAccessoryTypeGroup *)v0 initWithAccessoryTypes:v2];
  id v4 = (void *)qword_26AB2E958;
  qword_26AB2E958 = v3;
}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_4()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  uint64_t v1 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B088]];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  uint64_t v3 = [(HFAccessoryTypeGroup *)v0 initWithAccessoryTypes:v2];
  id v4 = (void *)qword_26AB2E968;
  qword_26AB2E968 = v3;
}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_6()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  uint64_t v1 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B058]];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  uint64_t v3 = [(HFAccessoryTypeGroup *)v0 initWithAccessoryTypes:v2];
  id v4 = (void *)qword_26AB2E978;
  qword_26AB2E978 = v3;
}

void __58__HFAccessoryTypeGroup_restrictedGuestAccessoryTypeGroups__block_invoke_8()
{
  v5[1] = *MEMORY[0x263EF8340];
  v0 = [HFAccessoryTypeGroup alloc];
  uint64_t v1 = +[HFAccessoryType categoryType:*MEMORY[0x263F0B100]];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  uint64_t v3 = [(HFAccessoryTypeGroup *)v0 initWithAccessoryTypes:v2];
  id v4 = (void *)qword_26AB2E988;
  qword_26AB2E988 = v3;
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HFAccessoryTypeGroup *)self fullName];
  id v6 = [v3 stringWithFormat:@"<%@:%p> %@", v4, self, v5];

  return (NSString *)v6;
}

+ (HFAccessoryTypeGroup)accessoryTypeGroupWithIdentifier:(id)a3
{
  v23[10] = *MEMORY[0x263EF8340];
  id v20 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  v19 = [a1 climateAccessoryTypeGroup];
  v23[0] = v19;
  v18 = [a1 energyAccessoryTypeGroup];
  v23[1] = v18;
  id v5 = [a1 lightAccessoryTypeGroup];
  v23[2] = v5;
  id v6 = [a1 mediaAccessoryTypeGroup];
  v23[3] = v6;
  id v7 = [a1 securityAccessoryTypeGroup];
  v23[4] = v7;
  id v8 = [a1 outletAccessoryTypeGroup];
  v23[5] = v8;
  id v9 = [a1 sensorAccessoryTypeGroup];
  v23[6] = v9;
  id v10 = [a1 switchAccessoryTypeGroup];
  v23[7] = v10;
  id v11 = [a1 waterAccessoryTypeGroup];
  v23[8] = v11;
  uint64_t v12 = [a1 otherAccessoryTypeGroup];
  v23[9] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:10];
  id v14 = [v4 setWithArray:v13];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __57__HFAccessoryTypeGroup_accessoryTypeGroupWithIdentifier___block_invoke;
  v21[3] = &unk_26408EDD8;
  id v22 = v20;
  id v15 = v20;
  v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v21);

  return (HFAccessoryTypeGroup *)v16;
}

uint64_t __57__HFAccessoryTypeGroup_accessoryTypeGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)intersectsGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAccessoryTypeGroup *)self types];
  id v6 = [v4 types];

  LOBYTE(v4) = [v5 intersectsSet:v6];
  return (char)v4;
}

- (id)groupByIntersectingGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [HFAccessoryTypeGroup alloc];
    id v6 = [(HFAccessoryTypeGroup *)self types];
    id v7 = [v4 types];
    id v8 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v7);
    id v9 = [(HFAccessoryTypeGroup *)v5 _initWithName:0 set:v8];
  }
  else
  {
    if (qword_26AB2E9A0 != -1) {
      dispatch_once(&qword_26AB2E9A0, &__block_literal_global_241);
    }
    id v9 = (id)qword_26AB2E9A8;
  }

  return v9;
}

uint64_t __49__HFAccessoryTypeGroup_groupByIntersectingGroup___block_invoke_2()
{
  v0 = objc_alloc_init(HFAccessoryTypeGroup);
  uint64_t v1 = qword_26AB2E9A8;
  qword_26AB2E9A8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)groupBySubtractingGroup:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [HFAccessoryTypeGroup alloc];
    id v6 = [(HFAccessoryTypeGroup *)self types];
    id v7 = [v4 types];

    id v8 = objc_msgSend(v6, "na_setByRemovingObjectsFromSet:", v7);
    id v9 = [(HFAccessoryTypeGroup *)v5 _initWithName:0 set:v8];
  }
  else
  {
    id v9 = self;
  }
  return v9;
}

- (NSString)fullName
{
  uint64_t v3 = [(HFAccessoryTypeGroup *)self _fullName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(HFAccessoryTypeGroup *)self name];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)_fullName
{
  return self->__fullName;
}

- (void)set_fullName:(id)a3
{
}

- (id)filterAccessoryRepresentableObjects:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  void v5[2] = __71__HFAccessoryTypeGroup_Filtering__filterAccessoryRepresentableObjects___block_invoke;
  v5[3] = &unk_26408FD78;
  v5[4] = self;
  uint64_t v3 = objc_msgSend(a3, "na_filter:", v5);
  return v3;
}

uint64_t __71__HFAccessoryTypeGroup_Filtering__filterAccessoryRepresentableObjects___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "hf_accessoryType");
  uint64_t v4 = [v2 containsType:v3];

  return v4;
}

@end