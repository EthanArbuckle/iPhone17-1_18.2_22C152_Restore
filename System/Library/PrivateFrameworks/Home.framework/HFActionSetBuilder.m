@interface HFActionSetBuilder
- (BOOL)isActionSetDeleted;
- (BOOL)showInHomeDashboard;
- (HFActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFActionSetBuilder)initWithHome:(id)a3;
- (HFImageIconDescriptor)iconDescriptor;
- (NSSet)hf_accessoryLikeObjects;
- (NSString)name;
- (UIColor)iconTintColor;
- (id)_builderCommitItem;
- (id)_deleteActionSet:(id)a3 fromHome:(id)a4;
- (id)_lazilyUpdateIcon;
- (id)_lazilyUpdateIncludedContext;
- (id)_lazy_performValidation;
- (id)_legacyCommitItemWithOperationType:(id)a3;
- (id)_updateIconOnBuilder:(id)a3;
- (id)_updateValueForContextType:(unint64_t)a3;
- (id)commitItem;
- (id)compareToObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createActionSetBuilder;
- (id)deleteActionSet;
- (id)getOrCreateActionSetBuilder;
- (id)performValidation;
- (id)transformedError:(id)a3 withOperationType:(id)a4;
- (id)updateActionSetBuilder:(id)a3;
- (unint64_t)hash;
- (void)_updateValueForContextType:(unint64_t)a3 onActionSetBuilder:(id)a4;
- (void)notifyObserversForCreatedActionSet:(id)a3;
- (void)notifyObserversForRenamedActionSet:(id)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setIconTintColor:(id)a3;
- (void)setIsActionSetDeleted:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setShowInHomeDashboard:(BOOL)a3;
- (void)updateFromActionSetBuilder:(id)a3;
@end

@implementation HFActionSetBuilder

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v5 = [[HFComparisonResult alloc] initWithObjectA:self objectB:v4];
  if (![(HFComparisonResult *)v5 containsCriticalDifference])
  {
    v6 = [(HFActionSetBuilder *)self name];
    v7 = [v4 name];
    v8 = +[HFPropertyDifference compareObjectA:v6 toObjectB:v7 key:@"name" priority:3];
    [(HFComparisonResult *)v5 add:v8];

    v9 = [(HFActionSetBuilder *)self iconDescriptor];
    v10 = [v4 iconDescriptor];
    v11 = +[HFPropertyDifference compareObjectA:v9 toObjectB:v10 key:@"iconDescriptor" priority:2];
    [(HFComparisonResult *)v5 add:v11];

    v12 = [(HFActionSetBuilder *)self iconTintColor];
    v13 = [v4 iconTintColor];
    v14 = +[HFPropertyDifference compareObjectA:v12 toObjectB:v13 key:@"iconTintColor" priority:2];
    [(HFComparisonResult *)v5 add:v14];

    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HFActionSetBuilder showInHomeDashboard](self, "showInHomeDashboard"));
    v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "showInHomeDashboard"));
    v17 = +[HFPropertyDifference compareObjectA:v15 toObjectB:v16 key:@"showInHomeDashboard" priority:1];
    [(HFComparisonResult *)v5 add:v17];

    v18 = [(HFAbstractBaseActionSetBuilder *)self actions];
    v19 = [v4 actions];
    v20 = +[HFContainedObjectListDifference containedObjectDifferenceWithKey:@"actions" objectsA:v18 objectsB:v19];
    [(HFComparisonResult *)v5 add:v20];
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(HFActionSetBuilder *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)performValidation
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke;
  v6[3] = &unk_264090350;
  v6[4] = self;
  unint64_t v3 = __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke((uint64_t)v6);
  if (v3)
  {
    id v4 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error validating action set builder: %@. Error: %@", buf, 0x16u);
    }
  }
  return v3;
}

id __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) verifyPropertyIsSet:@"name"];
  if (!v2)
  {
    unint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 name];
    v2 = [v3 verifyNameIsNotEmpty:v4];

    if (!v2)
    {
      v5 = [*(id *)(a1 + 32) actionSet];
      v6 = [v5 actionSetType];
      int v7 = [v6 isEqualToString:*MEMORY[0x263F0B958]];

      if (!v7
        || ([*(id *)(a1 + 32) verifyProperty:@"actions" matchesCondition:&__block_literal_global_45 description:@"Action sets must have at least one action"], (v2 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v8 = [*(id *)(a1 + 32) actions];
        __int16 v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_10_0);
        v2 = [v9 firstObject];

        if (v2) {
          id v10 = v2;
        }
      }
    }
  }
  return v2;
}

BOOL __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

uint64_t __59__HFActionSetBuilder_AutomationBuilders__performValidation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 validationError];
}

- (id)getOrCreateActionSetBuilder
{
  unint64_t v3 = [(HFItemBuilder *)self home];
  int v4 = [v3 areAutomationBuildersSupported];

  if (v4)
  {
    v5 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
    if (v5) {
      goto LABEL_4;
    }
    v6 = [(HFItemBuilder *)self home];
    int v7 = [v6 actionSets];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__HFActionSetBuilder_AutomationBuilders__getOrCreateActionSetBuilder__block_invoke;
    v13[3] = &unk_26408E348;
    v13[4] = self;
    v5 = objc_msgSend(v7, "na_firstObjectPassingTest:", v13);

    if (v5)
    {
LABEL_4:
      v8 = (void *)[v5 copyAsBuilder];
      __int16 v9 = [[HFActionSetBuilderPair alloc] initWithActionSet:v5 builder:v8];
    }
    else
    {
      v12 = [HFActionSetBuilderPair alloc];
      v5 = [(HFItemBuilder *)self home];
      v8 = (void *)[v5 newActionSetBuilder];
      __int16 v9 = [(HFActionSetBuilderPair *)v12 initWithBuilder:v8];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

BOOL __69__HFActionSetBuilder_AutomationBuilders__getOrCreateActionSetBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 name];
  v5 = [v4 lowercaseString];
  v6 = [*(id *)(a1 + 32) name];
  int v7 = [v6 lowercaseString];
  if ([v5 isEqualToString:v7])
  {
    v8 = [v3 actions];
    BOOL v9 = [v8 count] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)updateActionSetBuilder:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = [(HFActionSetBuilder *)self name];
    [v5 setName:v6];

    [(HFActionSetBuilder *)self _updateValueForContextType:3 onActionSetBuilder:v5];
    [(HFAbstractBaseActionSetBuilder *)self updateActionsInBuilder:v5];
    int v7 = (void *)MEMORY[0x263F58190];
    v8 = [(HFActionSetBuilder *)self _updateIconOnBuilder:v5];
    v15[0] = v8;
    BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    id v10 = [v7 combineAllFutures:v9];
  }
  else
  {
    uint64_t v11 = NSStringFromSelector(a2);
    NSLog(&cfstr_PassedANilActi.isa, self, v11);

    v12 = (void *)MEMORY[0x263F58190];
    v13 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 30);
    id v10 = [v12 futureWithError:v13];
  }
  return v10;
}

- (void)_updateValueForContextType:(unint64_t)a3 onActionSetBuilder:(id)a4
{
  v12 = (__CFString *)a4;
  v6 = @"ActionSet's value cannot be updated since it cannot be favorited.";
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_3;
    case 1uLL:
      v6 = @"ActionSet's value cannot be updated since it cannot be included in status.";
LABEL_3:
      NSLog(&v6->isa);
      v6 = v12;
      goto LABEL_4;
    case 3uLL:
      BOOL v8 = [(HFActionSetBuilder *)self showInHomeDashboard];
      int v10 = [(__CFString *)v12 hf_isOnForContextType:3];
      BOOL v9 = v8;
      if (v8 == v10) {
        goto LABEL_7;
      }
      goto LABEL_8;
    default:
LABEL_4:
      char v7 = [(__CFString *)v6 hf_isOnForContextType:a3];
      BOOL v8 = 0;
      BOOL v9 = 0;
      if (v7) {
        goto LABEL_8;
      }
LABEL_7:
      char v11 = [(__CFString *)v12 hf_hasSetForContextType:a3];
      BOOL v9 = v8;
      if ((v11 & 1) == 0) {
LABEL_8:
      }
        [(__CFString *)v12 hf_setValue:v9 forContextType:a3];

      return;
  }
}

- (id)_updateIconOnBuilder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hf_iconDescriptor");
  v6 = [v5 identifier];

  char v7 = objc_msgSend(v4, "hf_iconTintColor");
  BOOL v8 = [(HFActionSetBuilder *)self iconDescriptor];
  BOOL v9 = [v8 identifier];
  int v10 = [v6 isEqualToString:v9];

  if (v10
    && ([(HFActionSetBuilder *)self iconTintColor],
        char v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v7 isEqual:v11],
        v11,
        v12))
  {
    v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v14 = [(HFActionSetBuilder *)self iconDescriptor];
    char v15 = [v14 isSystemImage];

    if ((v15 & 1) == 0)
    {
      v16 = [(HFActionSetBuilder *)self iconDescriptor];
      NSLog(&cfstr_ActionSetBuild.isa, v16);
    }
    v17 = [(HFActionSetBuilder *)self iconDescriptor];
    v18 = [v17 identifier];
    v19 = [(HFActionSetBuilder *)self iconTintColor];
    v13 = objc_msgSend(v4, "hf_setIconIdentifier:andTintColor:", v18, v19);
  }
  return v13;
}

- (NSSet)hf_accessoryLikeObjects
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(HFAbstractBaseActionSetBuilder *)self actions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke;
  v8[3] = &unk_264090B88;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  v6 = (void *)[v5 copy];
  return (NSSet *)v6;
}

void __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containedAccessoryRepresentables];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke_2;
  v4[3] = &unk_264090B60;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __75__HFActionSetBuilder_AccessoryLikeObjectContainer__hf_accessoryLikeObjects__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[HFAccessoryLikeObject accessoryLikeObjectsForAccessoryRepresentable:a2];
  [v2 unionSet:v3];
}

- (HFActionSetBuilder)initWithHome:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HFActionSetBuilder;
  id v3 = [(HFItemBuilder *)&v6 initWithHome:a3];
  if (v3)
  {
    id v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"house.fill"];
    [(HFActionSetBuilder *)v3 setIconDescriptor:v4];

    [(HFActionSetBuilder *)v3 setIsActionSetDeleted:0];
  }
  return v3;
}

- (HFActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HFActionSetBuilder;
  id v4 = [(HFAbstractBaseActionSetBuilder *)&v14 initWithExistingObject:a3 inHome:a4];
  id v5 = v4;
  if (v4)
  {
    objc_super v6 = [(HFAbstractBaseActionSetBuilder *)v4 actionSet];
    char v7 = [v6 name];
    [(HFActionSetBuilder *)v5 setName:v7];

    BOOL v8 = [(HFAbstractBaseActionSetBuilder *)v5 actionSet];
    id v9 = objc_msgSend(v8, "hf_iconDescriptor");
    [(HFActionSetBuilder *)v5 setIconDescriptor:v9];

    int v10 = [(HFAbstractBaseActionSetBuilder *)v5 actionSet];
    char v11 = objc_msgSend(v10, "hf_iconTintColor");
    [(HFActionSetBuilder *)v5 setIconTintColor:v11];

    int v12 = [(HFAbstractBaseActionSetBuilder *)v5 actionSet];
    -[HFActionSetBuilder setShowInHomeDashboard:](v5, "setShowInHomeDashboard:", objc_msgSend(v12, "hf_effectiveShowInHomeDashboard"));

    [(HFActionSetBuilder *)v5 setIsActionSetDeleted:0];
  }
  return v5;
}

- (id)deleteActionSet
{
  id v3 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  id v4 = [(HFItemBuilder *)self home];
  id v5 = [(HFActionSetBuilder *)self _deleteActionSet:v3 fromHome:v4];

  return v5;
}

- (void)updateFromActionSetBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  [(HFActionSetBuilder *)self setName:v5];

  objc_super v6 = [v4 iconDescriptor];
  [(HFActionSetBuilder *)self setIconDescriptor:v6];

  -[HFActionSetBuilder setShowInHomeDashboard:](self, "setShowInHomeDashboard:", [v4 showInHomeDashboard]);
  id v8 = [v4 actionBuilders];

  char v7 = (void *)[v8 mutableCopy];
  [(HFAbstractBaseActionSetBuilder *)self setActionBuilders:v7];
}

- (id)_lazy_performValidation
{
  v16[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(HFItemBuilder *)self lazy_verifyPropertyIsSet:@"name"];
  v16[0] = v4;
  id v5 = [(HFActionSetBuilder *)self name];
  objc_super v6 = [(HFItemBuilder *)self lazy_verifyNameIsNotEmpty:v5];
  v16[1] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v8 = [v3 arrayWithArray:v7];

  id v9 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  int v10 = [v9 actionSetType];
  LODWORD(v6) = [v10 isEqualToString:*MEMORY[0x263F0B958]];

  if (v6)
  {
    char v11 = [(HFItemBuilder *)self lazy_verifyProperty:@"actions" matchesCondition:&__block_literal_global_187 description:@"Action sets must have at least one action"];
    [v8 addObject:v11];
  }
  int v12 = [MEMORY[0x263F58190] chainFutures:v8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __45__HFActionSetBuilder__lazy_performValidation__block_invoke_2;
  v15[3] = &unk_26408CDF0;
  v15[4] = self;
  id v13 = (id)[v12 addFailureBlock:v15];

  return v12;
}

BOOL __45__HFActionSetBuilder__lazy_performValidation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] != 0;
}

void __45__HFActionSetBuilder__lazy_performValidation__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error validating action set builder: %@. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)createActionSetBuilder
{
  v10.receiver = self;
  v10.super_class = (Class)HFActionSetBuilder;
  id v3 = [(HFAbstractBaseActionSetBuilder *)&v10 createActionSetBuilder];
  if (v3)
  {
    id v4 = v3;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke;
    v9[3] = &unk_264099DF8;
    v9[4] = self;
    uint64_t v5 = [v3 flatMap:v9];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_3;
    v8[3] = &unk_264099DF8;
    void v8[4] = self;
    int v6 = [v5 flatMap:v8];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

id __44__HFActionSetBuilder_createActionSetBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_lazy_performValidation");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_2;
  v8[3] = &unk_26408CDC8;
  id v9 = v3;
  id v5 = v3;
  int v6 = [v4 flatMap:v8];

  return v6;
}

uint64_t __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

id __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_3(uint64_t a1, void *a2)
{
  void v15[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) name];
  [v3 setName:v4];

  id v5 = (void *)MEMORY[0x263F58190];
  int v6 = [*(id *)(a1 + 32) _lazilyUpdateIncludedContext];
  v15[0] = v6;
  uint64_t v7 = [*(id *)(a1 + 32) _lazilyUpdateIcon];
  v15[1] = v7;
  __int16 v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  id v9 = [v5 combineAllFutures:v8];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_4;
  v13[3] = &unk_26408CDC8;
  id v14 = v3;
  id v10 = v3;
  char v11 = [v9 flatMap:v13];

  return v11;
}

uint64_t __44__HFActionSetBuilder_createActionSetBuilder__block_invoke_4(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

- (id)commitItem
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(HFActionSetBuilder *)self isActionSetDeleted])
  {
    id v3 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(HFActionSetBuilder *)self name];
      *(_DWORD *)buf = 138412290;
      v36 = v4;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Skipping commit of action set with name: %@. Reason: Action set was previously deleted.", buf, 0xCu);
    }
    id v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    int v6 = HFLogForCategory(0x32uLL);
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

    __int16 v8 = NSString;
    id v9 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
    if (v9) {
      id v10 = @"Committing";
    }
    else {
      id v10 = @"Creating";
    }
    char v11 = [(HFActionSetBuilder *)self name];
    int v12 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
    if (v12)
    {
      id v13 = NSString;
      id v14 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
      char v15 = [v14 uniqueIdentifier];
      v16 = [v13 stringWithFormat:@" (%@)", v15];
      v17 = [v8 stringWithFormat:@"%@ action set: %@%@", v10, v11, v16];
    }
    else
    {
      v17 = [v8 stringWithFormat:@"%@ action set: %@%@", v10, v11, &stru_26C081158];
    }

    v18 = HFLogForCategory(0x32uLL);
    v19 = v18;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v17;
      _os_signpost_emit_with_name_impl(&dword_20B986000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HFActionSetBuilderCommit", "%@", buf, 0xCu);
    }

    v20 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
    v21 = HFOperationEditActionSet;
    if (!v20) {
      v21 = HFOperationAddActionSet;
    }
    v22 = *v21;

    v23 = [(HFItemBuilder *)self home];
    int v24 = [v23 areAutomationBuildersSupported];

    if (v24) {
      [(HFActionSetBuilder *)self _builderCommitItem];
    }
    else {
    v25 = [(HFActionSetBuilder *)self _legacyCommitItemWithOperationType:v22];
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __32__HFActionSetBuilder_commitItem__block_invoke;
    v32[3] = &unk_264099E20;
    id v33 = v17;
    os_signpost_id_t v34 = v7;
    id v26 = v17;
    id v27 = (id)[v25 addCompletionBlock:v32];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __32__HFActionSetBuilder_commitItem__block_invoke_38;
    v30[3] = &unk_26408CE18;
    v30[4] = self;
    v31 = v22;
    v28 = v22;
    id v5 = [v25 recover:v30];
  }
  return v5;
}

void __32__HFActionSetBuilder_commitItem__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x32uLL);
  int v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v4)
    {
      id v9 = [NSString stringWithFormat:@" error: %@", v4];
    }
    else
    {
      id v9 = &stru_26C081158;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_signpost_emit_with_name_impl(&dword_20B986000, v6, OS_SIGNPOST_INTERVAL_END, v7, "HFActionSetBuilderCommit", "%@%@", buf, 0x16u);
    if (v4) {
  }
    }
}

id __32__HFActionSetBuilder_commitItem__block_invoke_38(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  id v3 = [*(id *)(a1 + 32) transformedError:a2 withOperationType:*(void *)(a1 + 40)];
  id v4 = [v2 futureWithError:v3];

  return v4;
}

- (void)notifyObserversForCreatedActionSet:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HFActionSetBuilder_notifyObserversForCreatedActionSet___block_invoke;
  v7[3] = &unk_26408D8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchHomeObserverMessage:v7 sender:0];
}

void __57__HFActionSetBuilder_notifyObserversForCreatedActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didAddActionSet:*(void *)(a1 + 40)];
  }
}

- (void)notifyObserversForRenamedActionSet:(id)a3
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HFActionSetBuilder_notifyObserversForRenamedActionSet___block_invoke;
  v7[3] = &unk_26408D8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchHomeObserverMessage:v7 sender:0];
}

void __57__HFActionSetBuilder_notifyObserversForRenamedActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateNameForActionSet:*(void *)(a1 + 40)];
  }
}

- (id)transformedError:(id)a3 withOperationType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFActionSetBuilder *)self name];
  id v9 = objc_msgSend(v7, "hf_errorWithOperationType:failedItemName:", v6, v8);

  return v9;
}

- (id)_builderCommitItem
{
  id v3 = [(HFActionSetBuilder *)self performValidation];
  if (v3)
  {
    id v4 = [MEMORY[0x263F58190] futureWithError:v3];
  }
  else
  {
    id v5 = [(HFActionSetBuilder *)self getOrCreateActionSetBuilder];
    id v6 = [v5 builder];
    id v7 = [(HFActionSetBuilder *)self updateActionSetBuilder:v6];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__HFActionSetBuilder__builderCommitItem__block_invoke;
    v14[3] = &unk_2640945A0;
    id v8 = v5;
    id v15 = v8;
    v16 = self;
    id v4 = [v7 flatMap:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__HFActionSetBuilder__builderCommitItem__block_invoke_2;
    v12[3] = &unk_264096118;
    v12[4] = self;
    id v13 = v8;
    id v9 = v8;
    id v10 = (id)[v4 addSuccessBlock:v12];
  }
  return v4;
}

id __40__HFActionSetBuilder__builderCommitItem__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [*(id *)(a1 + 40) home];
  id v3 = [v1 commitActionSetInHome:v2];

  return v3;
}

void __40__HFActionSetBuilder__builderCommitItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v3, "setActionSet:");
  id v4 = [*(id *)(a1 + 40) actionSet];

  id v5 = *(void **)(a1 + 32);
  if (v4) {
    [v5 notifyObserversForRenamedActionSet:v6];
  }
  else {
    [v5 notifyObserversForCreatedActionSet:v6];
  }
}

- (id)_legacyCommitItemWithOperationType:(id)a3
{
  v41[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    id v7 = [(HFItemBuilder *)self home];
    id v8 = [v7 actionSets];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke;
    v39[3] = &unk_26408E348;
    v39[4] = self;
    id v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", v39);
    [(HFAbstractBaseActionSetBuilder *)self setActionSet:v9];
  }
  id v10 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  BOOL v11 = v10 == 0;

  __int16 v12 = [(HFActionSetBuilder *)self _lazy_performValidation];
  if (v11)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2;
    v38[3] = &unk_26408CDC8;
    v38[4] = self;
    id v13 = [v12 flatMap:v38];

    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_4;
    v36[3] = &unk_264099E48;
    uint64_t v14 = &v37;
    objc_copyWeak(&v37, &location);
    id v17 = (id)[v13 addSuccessBlock:v36];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_47;
    v35[3] = &unk_26408CDF0;
    v35[4] = self;
    id v18 = (id)[v13 addFailureBlock:v35];
  }
  else
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_48;
    v34[3] = &unk_26408CDC8;
    v34[4] = self;
    id v13 = [v12 flatMap:v34];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_51;
    v32[3] = &unk_264099E70;
    uint64_t v14 = &v33;
    objc_copyWeak(&v33, &location);
    void v32[4] = self;
    id v15 = (id)[v13 addSuccessBlock:v32];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_53;
    v31[3] = &unk_26408CDF0;
    v31[4] = self;
    id v16 = (id)[v13 addFailureBlock:v31];
  }
  objc_destroyWeak(v14);
  v19 = (void *)MEMORY[0x263F58190];
  v41[0] = v13;
  v20 = [(HFAbstractBaseActionSetBuilder *)self lazilyUpdateActions];
  v41[1] = v20;
  v21 = [(HFActionSetBuilder *)self _lazilyUpdateIncludedContext];
  v41[2] = v21;
  v22 = [(HFActionSetBuilder *)self _lazilyUpdateIcon];
  v41[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];
  int v24 = [v19 chainFutures:v23];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_58;
  v28[3] = &unk_26408CE18;
  id v25 = v4;
  id v29 = v25;
  v30 = self;
  id v26 = [v24 recover:v28];

  objc_destroyWeak(&location);
  return v26;
}

BOOL __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 name];
  id v5 = [v4 lowercaseString];
  BOOL v6 = [*(id *)(a1 + 32) name];
  id v7 = [v6 lowercaseString];
  if ([v5 isEqualToString:v7])
  {
    id v8 = [v3 actions];
    BOOL v9 = [v8 count] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3;
  v3[3] = &unk_26408CD78;
  v3[4] = *(void *)(a1 + 32);
  v1 = [MEMORY[0x263F58190] futureWithCompletionHandlerAdapterBlock:v3];
  return v1;
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 home];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 addActionSetWithName:v5 completionHandler:v4];
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [WeakRetained name];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Created action set with name:%@.", (uint8_t *)&v7, 0xCu);
  }
  [WeakRetained setActionSet:v3];
  [WeakRetained notifyObserversForCreatedActionSet:v3];
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) name];
    int v6 = 138412546;
    int v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to create action set with name:%@. Error: %@", (uint8_t *)&v6, 0x16u);
  }
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_48(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_49;
  v3[3] = &unk_26408CD50;
  v3[4] = *(void *)(a1 + 32);
  v1 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v3];
  return v1;
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_49(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 actionSet];
  id v5 = [*(id *)(a1 + 32) name];
  [v6 updateName:v5 completionHandler:v4];
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_51(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) actionSet];
  [WeakRetained notifyObserversForRenamedActionSet:v3];

  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) name];
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Updated action set name:%@.", (uint8_t *)&v6, 0xCu);
  }
}

void __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HFErrorHandler sharedHandler];
  [v4 logError:v3 operationDescription:@"HFActionSetBuilder.updateName"];

  id v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = [*(id *)(a1 + 32) name];
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "2 Failed to update action set name name:%@. Error: %@", (uint8_t *)&v7, 0x16u);
  }
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_58(uint64_t a1, void *a2)
{
  if (*(__CFString **)(a1 + 32) == @"HFOperationAddActionSet")
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = a2;
    [v5 deleteActionSet];
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F58190];
    id v4 = a2;
    [v3 futureWithNoResult];
  int v7 = };
  uint64_t v8 = [MEMORY[0x263F58190] futureWithError:a2];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_59;
  void v16[3] = &unk_26408CDC8;
  id v9 = v8;
  id v17 = v9;
  id v10 = [v7 flatMap:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_60;
  v14[3] = &unk_26408F1C0;
  id v15 = v9;
  id v11 = v9;
  __int16 v12 = [v10 recover:v14];

  return v12;
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_2_59(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __57__HFActionSetBuilder__legacyCommitItemWithOperationType___block_invoke_3_60(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_lazilyUpdateIncludedContext
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__HFActionSetBuilder__lazilyUpdateIncludedContext__block_invoke;
  v4[3] = &unk_26408E4E0;
  void v4[4] = self;
  v2 = [MEMORY[0x263F58190] lazyFutureWithBlock:v4];
  return v2;
}

void __50__HFActionSetBuilder__lazilyUpdateIncludedContext__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 _updateValueForContextType:3];
  id v4 = [v3 completionHandlerAdapter];

  id v5 = (id)[v6 addCompletionBlock:v4];
}

- (id)_updateValueForContextType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      NSLog(&cfstr_ActionsetSValu.isa, a2);
      goto LABEL_4;
    case 1uLL:
      NSLog(&cfstr_ActionsetSValu_0.isa, a2);
      goto LABEL_4;
    case 3uLL:
      int v5 = [(HFActionSetBuilder *)self showInHomeDashboard];
      goto LABEL_6;
    default:
LABEL_4:
      int v5 = 0;
LABEL_6:
      id v6 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
      if (v5 == objc_msgSend(v6, "hf_isOnForContextType:", a3))
      {
        int v7 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
        int v8 = objc_msgSend(v7, "hf_hasSetForContextType:", a3);

        if (v8)
        {
          id v9 = [MEMORY[0x263F58190] futureWithNoResult];
          goto LABEL_11;
        }
      }
      else
      {
      }
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __49__HFActionSetBuilder__updateValueForContextType___block_invoke;
      v11[3] = &unk_2640911F0;
      char v12 = v5;
      v11[4] = self;
      v11[5] = a3;
      id v9 = [MEMORY[0x263F58190] futureWithBlock:v11];
LABEL_11:
      return v9;
  }
}

void __49__HFActionSetBuilder__updateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) actionSet];
  int v5 = objc_msgSend(v4, "hf_updateValue:forContextType:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__HFActionSetBuilder__updateValueForContextType___block_invoke_2;
  v10[3] = &unk_264099E98;
  char v13 = *(unsigned char *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v6;
  v10[4] = v7;
  id v8 = v3;
  id v9 = (id)[v5 addCompletionBlock:v10];
}

void __49__HFActionSetBuilder__updateValueForContextType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = HFLogForCategory(0x29uLL);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = [*(id *)(a1 + 32) actionSet];
      uint64_t v12 = objc_msgSend(v11, "hf_prettyDescription");
      *(_DWORD *)buf = 67109890;
      int v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      v22 = v12;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to set state:%{BOOL}d for context type:%lu for actionSet:%@. Error: %@", buf, 0x26u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) actionSet];
    uint64_t v12 = objc_msgSend(v11, "hf_prettyDescription");
    *(_DWORD *)buf = 67109634;
    int v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Set state:%{BOOL}d for context type:%lu for actionSet:%@", buf, 0x1Cu);
    goto LABEL_6;
  }

  id v15 = +[HFHomeKitDispatcher sharedDispatcher];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __49__HFActionSetBuilder__updateValueForContextType___block_invoke_68;
  void v16[3] = &unk_26408CDA0;
  void v16[4] = *(void *)(a1 + 32);
  [v15 dispatchHomeObserverMessage:v16 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void __49__HFActionSetBuilder__updateValueForContextType___block_invoke_68(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) actionSet];
    [v5 home:v3 didUpdateApplicationDataForActionSet:v4];
  }
}

- (id)_lazilyUpdateIcon
{
  id v3 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  id v4 = objc_msgSend(v3, "hf_iconDescriptor");
  id v5 = [v4 identifier];

  id v6 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  uint64_t v7 = objc_msgSend(v6, "hf_iconTintColor");

  id v8 = [(HFActionSetBuilder *)self iconDescriptor];
  int v9 = [v8 identifier];
  int v10 = [v5 isEqualToString:v9];

  if (v10
    && ([(HFActionSetBuilder *)self iconTintColor],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v7 isEqual:v11],
        v11,
        v12))
  {
    uint64_t v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke;
    void v16[3] = &unk_26408E4E0;
    void v16[4] = self;
    uint64_t v13 = [MEMORY[0x263F58190] lazyFutureWithBlock:v16];
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

void __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) iconDescriptor];
  char v5 = [v4 isSystemImage];

  if ((v5 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) iconDescriptor];
    NSLog(&cfstr_ActionSetBuild.isa, v6);
  }
  uint64_t v7 = [*(id *)(a1 + 32) actionSet];
  id v8 = [*(id *)(a1 + 32) iconDescriptor];
  int v9 = [v8 identifier];
  int v10 = [*(id *)(a1 + 32) iconTintColor];
  id v11 = objc_msgSend(v7, "hf_setIconIdentifier:andTintColor:", v9, v10);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_2;
  v14[3] = &unk_26408F238;
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v3;
  id v12 = v3;
  id v13 = (id)[v11 addCompletionBlock:v14];
}

void __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = HFLogForCategory(0x29uLL);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = [*(id *)(a1 + 32) iconDescriptor];
      int v10 = [v9 identifier];
      id v11 = [*(id *)(a1 + 32) actionSet];
      id v12 = objc_msgSend(v11, "hf_prettyDescription");
      *(_DWORD *)buf = 138412802;
      id v16 = v10;
      __int16 v17 = 2112;
      int v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to set icon:%@ for actionSet:%@. Error: %@", buf, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [*(id *)(a1 + 32) iconDescriptor];
    int v10 = [v9 identifier];
    id v11 = [*(id *)(a1 + 32) actionSet];
    id v12 = objc_msgSend(v11, "hf_prettyDescription");
    *(_DWORD *)buf = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    int v18 = v12;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Set icon:%@ for actionSet:%@", buf, 0x16u);
    goto LABEL_6;
  }

  id v13 = +[HFHomeKitDispatcher sharedDispatcher];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_74;
  v14[3] = &unk_26408CDA0;
  void v14[4] = *(void *)(a1 + 32);
  [v13 dispatchHomeObserverMessage:v14 sender:0];

  [*(id *)(a1 + 40) finishWithResult:v6 error:v5];
}

void __39__HFActionSetBuilder__lazilyUpdateIcon__block_invoke_74(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) actionSet];
    [v5 home:v3 didUpdateApplicationDataForActionSet:v4];
  }
}

- (id)_deleteActionSet:(id)a3 fromHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];

  if (v7 && v8)
  {
    int v9 = [v6 actionSetType];
    int v10 = [v9 isEqualToString:*MEMORY[0x263F0B958]];
    id v11 = (void *)MEMORY[0x263F58190];
    if (v10)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke;
      v28[3] = &unk_26408E218;
      id v12 = v7;
      id v29 = v12;
      id v13 = v6;
      id v30 = v13;
      uint64_t v14 = [v11 futureWithErrorOnlyHandlerAdapterBlock:v28];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_2;
      v24[3] = &unk_26408D260;
      id v25 = v12;
      id v26 = v13;
      id v27 = self;
      id v15 = [v14 addCompletionBlock:v24];

      id v16 = v29;
    }
    else
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_79;
      v22[3] = &unk_26408F0C8;
      v22[4] = self;
      id v23 = v6;
      id v15 = [v11 futureWithBlock:v22];
      id v16 = v23;
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_80;
    v20[3] = &unk_26408CDC8;
    id v21 = v9;
    id v18 = v9;
    __int16 v17 = [v15 flatMap:v20];
  }
  else
  {
    __int16 v17 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v17;
}

uint64_t __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeActionSet:*(void *)(a1 + 40) completionHandler:a2];
}

void __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_3;
  id v13 = &unk_26408D8F0;
  id v14 = a1[4];
  id v15 = a1[5];
  [v5 dispatchHomeObserverMessage:&v10 sender:0];

  objc_msgSend(a1[6], "setActionSet:", 0, v10, v11, v12, v13);
  [a1[6] setIsActionSetDeleted:1];
  id v6 = HFLogForCategory(0x29uLL);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend(a1[5], "hf_prettyDescription");
      int v9 = [a1[6] home];
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Failed to delete actionSet (error = %@) :%@ home:%@", buf, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(a1[5], "hf_prettyDescription");
    int v9 = [a1[6] home];
    *(_DWORD *)buf = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Deleted actionSet:%@ home:%@", buf, 0x16u);
    goto LABEL_6;
  }
}

void __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didRemoveActionSet:*(void *)(a1 + 40)];
  }
}

void __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 removeAllActions];
  id v5 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "hf_prettyDescription");
    id v7 = [*(id *)(a1 + 32) home];
    int v8 = 138412546;
    int v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Removed all actions from actionSet:%@ home:%@", (uint8_t *)&v8, 0x16u);
  }
  [v4 finishWithNoResult];
}

uint64_t __48__HFActionSetBuilder__deleteActionSet_fromHome___block_invoke_80(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFActionSetBuilder;
  id v5 = -[HFAbstractBaseActionSetBuilder copyWithZone:](&v11, sel_copyWithZone_);
  id v6 = [(HFActionSetBuilder *)self name];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setName:v7];

  objc_msgSend(v5, "setShowInHomeDashboard:", -[HFActionSetBuilder showInHomeDashboard](self, "showInHomeDashboard"));
  int v8 = [(HFActionSetBuilder *)self iconDescriptor];
  [v5 setIconDescriptor:v8];

  int v9 = [(HFActionSetBuilder *)self iconTintColor];
  [v5 setIconTintColor:v9];

  objc_msgSend(v5, "setIsActionSetDeleted:", -[HFActionSetBuilder isActionSetDeleted](self, "isActionSetDeleted"));
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)showInHomeDashboard
{
  return self->_showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->_showInHomeDashboard = a3;
}

- (HFImageIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (UIColor)iconTintColor
{
  return self->_iconTintColor;
}

- (void)setIconTintColor:(id)a3
{
}

- (BOOL)isActionSetDeleted
{
  return self->_isActionSetDeleted;
}

- (void)setIsActionSetDeleted:(BOOL)a3
{
  self->_isActionSetDeleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconTintColor, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end