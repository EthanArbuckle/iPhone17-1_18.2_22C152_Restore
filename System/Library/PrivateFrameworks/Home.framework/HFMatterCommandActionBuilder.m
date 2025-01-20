@interface HFMatterCommandActionBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)canUpdateWithActionBuilder:(id)a3;
- (BOOL)enforceExecutionOrder;
- (BOOL)hasSameTargetAsAction:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (BOOL)updateWithActionBuilder:(id)a3;
- (HFMatterCommandActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFMatterCommandActionBuilder)initWithHome:(id)a3 commands:(id)a4 accessory:(id)a5 enforceExecutionOrder:(BOOL)a6;
- (HMAccessory)accessory;
- (NSArray)commands;
- (NSString)description;
- (id)actionCommandFieldsFor:(id)a3;
- (id)actionExpectedValuesFor:(id)a3;
- (id)commitItem;
- (id)containedAccessoryRepresentables;
- (id)copyForCreatingNewAction;
- (id)createNewAction;
- (id)performValidation;
- (id)validationError;
- (void)setAccessory:(id)a3;
- (void)setCommands:(id)a3;
- (void)setEnforceExecutionOrder:(BOOL)a3;
- (void)updateCommandsWith:(id)a3;
@end

@implementation HFMatterCommandActionBuilder

- (id)actionExpectedValuesFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = _sSo28HFMatterCommandActionBuilderC4HomeE20actionExpectedValues3forSaySDySSypGGSgSo08HMMatterB0C_tF_0(v4);

  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE940);
    v7 = (void *)sub_20BCE76F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)actionCommandFieldsFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = _sSo28HFMatterCommandActionBuilderC4HomeE06actionB6Fields3forSDySSypGSgSo08HMMatterB0C_tF_0();

  if (v6)
  {
    v7 = (void *)sub_20BCE7510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)updateCommandsWith:(id)a3
{
  sub_20BA50C04();
  uint64_t v4 = sub_20BCE7710();
  v5 = self;
  HFMatterCommandActionBuilder.updateCommands(with:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  HFMatterCommandActionBuilder.description.getter();

  v3 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFMatterCommandActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(HFItemBuilder *)self home];
  v16.receiver = self;
  v16.super_class = (Class)HFMatterCommandActionBuilder;
  v7 = [(HFItemBuilder *)&v16 initWithExistingObject:v5 inHome:v6];

  if (v7)
  {
    v8 = [(HFActionBuilder *)v7 action];
    uint64_t v9 = [v8 commands];
    commands = v7->_commands;
    v7->_commands = (NSArray *)v9;

    v11 = [(HFActionBuilder *)v7 action];
    v7->_enforceExecutionOrder = [v11 enforceExecutionOrder];

    v12 = [(HFActionBuilder *)v7 action];
    uint64_t v13 = [v12 representedAccessory];
    accessory = v7->_accessory;
    v7->_accessory = (HMAccessory *)v13;
  }
  return v7;
}

- (id)copyForCreatingNewAction
{
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [(HFItemBuilder *)self home];
  id v5 = (void *)[v3 initWithHome:v4];

  uint64_t v6 = [(HFMatterCommandActionBuilder *)self commands];
  [v5 setCommands:v6];

  objc_msgSend(v5, "setEnforceExecutionOrder:", -[HFMatterCommandActionBuilder enforceExecutionOrder](self, "enforceExecutionOrder"));
  v7 = [(HFMatterCommandActionBuilder *)self accessory];
  [v5 setAccessory:v7];

  return v5;
}

- (HFMatterCommandActionBuilder)initWithHome:(id)a3 commands:(id)a4 accessory:(id)a5 enforceExecutionOrder:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(HFItemBuilder *)self initWithHome:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_commands, a4);
    objc_storeStrong((id *)&v14->_accessory, a5);
    v14->_enforceExecutionOrder = a6;
  }

  return v14;
}

- (id)containedAccessoryRepresentables
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(HFMatterCommandActionBuilder *)self accessory];
  uint64_t v4 = objc_msgSend(v2, "na_arrayWithSafeObject:", v3);

  return v4;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HFMatterCommandActionBuilder *)self accessory];
    uint64_t v9 = [v8 matterNodeID];
    v10 = [v7 accessory];
    id v11 = [v10 matterNodeID];
    BOOL v12 = v9 == v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4 = a3;
  if ([(HFMatterCommandActionBuilder *)self canUpdateWithActionBuilder:v4])
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    v8 = [v7 commands];
    [(HFMatterCommandActionBuilder *)self updateCommandsWith:v8];

    uint64_t v9 = [(HFMatterCommandActionBuilder *)self commands];
    v10 = [v7 commands];
    if ([v9 isEqualToArray:v10])
    {
      BOOL v11 = [(HFMatterCommandActionBuilder *)self enforceExecutionOrder];
      int v12 = v11 ^ [v7 enforceExecutionOrder];
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (id)createNewAction
{
  uint64_t v3 = [(HFMatterCommandActionBuilder *)self commands];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(HFMatterCommandActionBuilder *)self accessory];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      BOOL v7 = [(HFMatterCommandActionBuilder *)self enforceExecutionOrder];

      if (v7)
      {
        id v8 = objc_alloc(MEMORY[0x263F0E4B0]);
        uint64_t v9 = [(HFMatterCommandActionBuilder *)self commands];
        v10 = objc_msgSend(v8, "initWithMatterCommands:enforceExecutionOrder:", v9, -[HFMatterCommandActionBuilder enforceExecutionOrder](self, "enforceExecutionOrder"));
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  uint64_t v9 = [(HFMatterCommandActionBuilder *)self commands];
  BOOL v11 = [(HFMatterCommandActionBuilder *)self accessory];
  NSLog(&cfstr_Hfmattercomman.isa, self, v9, v11, [(HFMatterCommandActionBuilder *)self enforceExecutionOrder]);

  v10 = 0;
LABEL_7:

  return v10;
}

- (id)performValidation
{
  return [(HFItemBuilder *)self lazy_verifyPropertiesAreSet:&unk_26C0F8140];
}

- (id)validationError
{
  return [(HFItemBuilder *)self verifyPropertiesAreSet:&unk_26C0F8158];
}

- (id)commitItem
{
  uint64_t v3 = [(HFMatterCommandActionBuilder *)self performValidation];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__HFMatterCommandActionBuilder_commitItem__block_invoke;
  v6[3] = &unk_26408CDC8;
  v6[4] = self;
  id v4 = [v3 flatMap:v6];

  return v4;
}

id __42__HFMatterCommandActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) createNewAction];
    [*(id *)(a1 + 32) setAction:v3];
  }
  id v4 = (void *)MEMORY[0x263F58190];
  uint64_t v5 = [*(id *)(a1 + 32) action];
  uint64_t v6 = [v4 futureWithResult:v5];

  return v6;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HFActionBuilder *)self action];
  uint64_t v9 = [v8 representedAccessory];

  if (v7)
  {
    v10 = [v9 uniqueIdentifier];
    BOOL v11 = [(HFMatterCommandActionBuilder *)self accessory];
    int v12 = [v11 uniqueIdentifier];
    BOOL v13 = v10 == v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (BOOL)enforceExecutionOrder
{
  return self->_enforceExecutionOrder;
}

- (void)setEnforceExecutionOrder:(BOOL)a3
{
  self->_enforceExecutionOrder = a3;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_commands, 0);
}

@end