@interface HFNaturalLightingActionBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)canUpdateWithActionBuilder:(id)a3;
- (BOOL)hasSameTargetAsAction:(id)a3;
- (BOOL)naturalLightEnabled;
- (BOOL)updateWithActionBuilder:(id)a3;
- (HFNaturalLightingActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HMLightProfile)lightProfile;
- (id)commitItem;
- (id)compareToObject:(id)a3;
- (id)containedAccessoryRepresentables;
- (id)copyForCreatingNewAction;
- (id)createNewAction;
- (id)description;
- (id)performValidation;
- (id)validationError;
- (unint64_t)hash;
- (void)setLightProfile:(id)a3;
- (void)setNaturalLightEnabled:(BOOL)a3;
@end

@implementation HFNaturalLightingActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFNaturalLightingActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HFNaturalLightingActionBuilder;
  v4 = [(HFItemBuilder *)&v13 initWithExistingObject:a3 inHome:a4];
  if (v4)
  {
    objc_opt_class();
    v5 = [(HFActionBuilder *)v4 action];
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [v7 lightProfile];
    lightProfile = v4->_lightProfile;
    v4->_lightProfile = (HMLightProfile *)v8;

    char v10 = [v7 isNaturalLightingEnabled];
    v4->_naturalLightEnabled = v10;
    if (!v4->_lightProfile)
    {
      v11 = [(HFActionBuilder *)v4 action];

      if (v11) {
        NSLog(&cfstr_FailedToGetLig.isa);
      }
    }
  }
  return v4;
}

- (id)copyForCreatingNewAction
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(HFItemBuilder *)self home];
  v5 = (void *)[v3 initWithHome:v4];

  v6 = [(HFNaturalLightingActionBuilder *)self lightProfile];
  [v5 setLightProfile:v6];

  objc_msgSend(v5, "setNaturalLightEnabled:", -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"));
  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"), @"naturalLightEnabled");
  v5 = [(HFNaturalLightingActionBuilder *)self lightProfile];
  id v6 = (id)[v3 appendObject:v5 withName:@"lightProfile"];

  id v7 = [v3 build];

  return v7;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 lightProfile];
  v9 = [(HFNaturalLightingActionBuilder *)self lightProfile];
  char v10 = [v8 isEqual:v9];

  return v10;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4 = a3;
  if ([(HFNaturalLightingActionBuilder *)self canUpdateWithActionBuilder:v4])
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (!v7
      || (int v8 = [(HFNaturalLightingActionBuilder *)self naturalLightEnabled],
          v8 == [v7 naturalLightEnabled]))
    {
      BOOL v9 = 0;
    }
    else
    {
      -[HFNaturalLightingActionBuilder setNaturalLightEnabled:](self, "setNaturalLightEnabled:", [v7 naturalLightEnabled]);
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)createNewAction
{
  id v3 = [(HFNaturalLightingActionBuilder *)self lightProfile];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F0E450]);
    id v5 = [(HFNaturalLightingActionBuilder *)self lightProfile];
    id v6 = objc_msgSend(v4, "initWithLightProfile:naturalLightingEnabled:", v5, -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"));
  }
  else
  {
    id v7 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "HFNaturalLightingActionBuilder doesn't have a light profile, so returning nil for -createNewAction", v9, 2u);
    }

    id v6 = 0;
  }
  return v6;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [(HFNaturalLightingActionBuilder *)self lightProfile];
    BOOL v9 = [v7 lightProfile];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)containedAccessoryRepresentables
{
  v2 = [(HFNaturalLightingActionBuilder *)self lightProfile];
  id v3 = [v2 services];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)performValidation
{
  return [(HFItemBuilder *)self lazy_verifyPropertiesAreSet:&unk_26C0F8110];
}

- (id)validationError
{
  return [(HFItemBuilder *)self verifyPropertiesAreSet:&unk_26C0F8128];
}

- (id)commitItem
{
  id v3 = [(HFNaturalLightingActionBuilder *)self performValidation];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HFNaturalLightingActionBuilder_commitItem__block_invoke;
  v7[3] = &unk_26408CDC8;
  v7[4] = self;
  id v4 = [v3 flatMap:v7];
  id v5 = [v4 recover:&__block_literal_global_353];

  return v5;
}

id __44__HFNaturalLightingActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];

  if (v2)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_2;
    v11[3] = &unk_26408CD50;
    v11[4] = *(void *)(a1 + 32);
    id v3 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_3;
    v10[3] = &unk_26408CDC8;
    v10[4] = *(void *)(a1 + 32);
    id v4 = [v3 flatMap:v10];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) createNewAction];
    [*(id *)(a1 + 32) setAction:v5];

    id v6 = [*(id *)(a1 + 32) action];

    id v7 = (void *)MEMORY[0x263F58190];
    if (v6)
    {
      int v8 = [*(id *)(a1 + 32) action];
      [v7 futureWithResult:v8];
    }
    else
    {
      int v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", -1);
      [v7 futureWithError:v8];
    id v4 = };
  }
  return v4;
}

void __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 action];
  objc_msgSend(v5, "updateNaturalLightingEnabled:completionHandler:", objc_msgSend(*(id *)(a1 + 32), "naturalLightEnabled"), v4);
}

id __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58190];
  v2 = [*(id *)(a1 + 32) action];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

id __44__HFNaturalLightingActionBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = objc_msgSend(a2, "hf_errorWithOperationType:failedItemName:", @"HFOperationEditActionSet", 0);
  id v4 = [v2 futureWithError:v3];

  return v4;
}

- (void)setLightProfile:(id)a3
{
  id v5 = (HMLightProfile *)a3;
  id v6 = [(HFActionBuilder *)self action];

  if (v6)
  {
    int v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HFActionBuilder.m" lineNumber:1021 description:@"Cannot change the lightProfile for an existing action!"];
  }
  lightProfile = self->_lightProfile;
  self->_lightProfile = v5;
}

- (HMLightProfile)lightProfile
{
  return self->_lightProfile;
}

- (BOOL)naturalLightEnabled
{
  return self->_naturalLightEnabled;
}

- (void)setNaturalLightEnabled:(BOOL)a3
{
  self->_naturalLightEnabled = a3;
}

- (void).cxx_destruct
{
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFNaturalLightingActionBuilder;
  id v5 = [(HFActionBuilder *)&v13 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    id v6 = [(HFNaturalLightingActionBuilder *)self lightProfile];
    id v7 = [v4 lightProfile];
    int v8 = +[HFPropertyDifference compareObjectA:v6 toObjectB:v7 key:@"lightProfile" priority:3];
    [v5 add:v8];

    BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HFNaturalLightingActionBuilder naturalLightEnabled](self, "naturalLightEnabled"));
    char v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "naturalLightEnabled"));
    v11 = +[HFPropertyDifference compareObjectA:v9 toObjectB:v10 key:@"naturalLightEnabled" priority:2];
    [v5 add:v11];
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(HFNaturalLightingActionBuilder *)self lightProfile];
  id v5 = [v4 uniqueIdentifier];
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

@end