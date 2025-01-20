@interface HUServiceGroupEditorItemManager
- (HFItem)instructionsItem;
- (HFServiceGroupBuilder)serviceGroupBuilder;
- (HFStaticItem)nameAndIconItem;
- (HFStaticItem)serviceGridItem;
- (HUServiceGroupEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUServiceGroupEditorItemManager)initWithServiceGroupBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_sectionIdentifierForItem:(id)a3;
- (id)_titleForSectionWithIdentifier:(id)a3;
- (id)currentSectionIdentifiers;
- (int64_t)instructionsSectionIndex;
- (int64_t)serviceGridSectionIndex;
- (unint64_t)_numberOfSections;
- (unint64_t)mode;
- (void)setInstructionsItem:(id)a3;
- (void)setNameAndIconItem:(id)a3;
- (void)setServiceGridItem:(id)a3;
@end

@implementation HUServiceGroupEditorItemManager

- (HUServiceGroupEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithServiceGroupBuilder_mode_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceGroupEditorItemManager.m", 36, @"%s is unavailable; use %@ instead",
    "-[HUServiceGroupEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUServiceGroupEditorItemManager)initWithServiceGroupBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUServiceGroupEditorItemManager;
  v10 = [(HFItemManager *)&v13 initWithDelegate:a5 sourceItem:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceGroupBuilder, a3);
    v11->_mode = a4;
  }

  return v11;
}

- (int64_t)instructionsSectionIndex
{
  v2 = [(HUServiceGroupEditorItemManager *)self currentSectionIdentifiers];
  int64_t v3 = [v2 indexOfObject:@"HUServiceGroupEditorInstructionsSectionIdentifier"];

  return v3;
}

- (int64_t)serviceGridSectionIndex
{
  v2 = [(HUServiceGroupEditorItemManager *)self currentSectionIdentifiers];
  int64_t v3 = [v2 indexOfObject:@"HUServiceGroupEditorServiceGridSectionIdentifier"];

  return v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  v5 = [(HUServiceGroupEditorItemManager *)self serviceGroupBuilder];
  if (![(HUServiceGroupEditorItemManager *)self mode])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F695C0]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke;
    v24[3] = &unk_1E6385000;
    id v25 = v5;
    v7 = (void *)[v6 initWithResultsBlock:v24];
    [(HUServiceGroupEditorItemManager *)self setNameAndIconItem:v7];

    v8 = [(HUServiceGroupEditorItemManager *)self nameAndIconItem];
    [v4 addObject:v8];
  }
  id v9 = [HUInstructionsItem alloc];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke_2;
  v22 = &unk_1E6385000;
  id v23 = v5;
  id v10 = v5;
  v11 = [(HFStaticItem *)v9 initWithResultsBlock:&v19];
  -[HUServiceGroupEditorItemManager setInstructionsItem:](self, "setInstructionsItem:", v11, v19, v20, v21, v22);

  v12 = [(HUServiceGroupEditorItemManager *)self instructionsItem];
  [v4 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v14 = (void *)[v13 initWithResults:MEMORY[0x1E4F1CC08]];
  [(HUServiceGroupEditorItemManager *)self setServiceGridItem:v14];

  v15 = [(HUServiceGroupEditorItemManager *)self serviceGridItem];
  [v4 addObject:v15];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v4];
  v26[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

  return v17;
}

id __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v3 = [*(id *)(a1 + 32) primaryServiceType];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F69548] defaultIconDescriptorForServiceType:v3 serviceSubtype:0];
    objc_msgSend(v2, "na_safeSetObject:forKey:", v4, *MEMORY[0x1E4F689E8]);
  }
  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v5;
}

id __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  [v2 setObject:&unk_1F19B4700 forKeyedSubscript:@"instructionsStyle"];
  int64_t v3 = _HULocalizedStringWithDefaultValue(@"HUServiceGroupEditorAccessoriesInstructionsTitle", @"HUServiceGroupEditorAccessoriesInstructionsTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) name];
    id v13 = HULocalizedStringWithFormat(@"HUServiceGroupEditorAccessoriesInstructionsDescriptionWithName", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }
  else
  {
    id v13 = _HULocalizedStringWithDefaultValue(@"HUServiceGroupEditorAccessoriesInstructionsDescriptionWithoutName", @"HUServiceGroupEditorAccessoriesInstructionsDescriptionWithoutName", 1);
  }
  [v2 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v14;
}

- (unint64_t)_numberOfSections
{
  v2 = [(HUServiceGroupEditorItemManager *)self currentSectionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  v4 = [(HUServiceGroupEditorItemManager *)self currentSectionIdentifiers];
  if ([v4 count] <= a3) {
    NSLog(&cfstr_ReceivedIdenti.isa, a3, [v4 count]);
  }
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  return 0;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5 = a3;
  id v6 = [(HUServiceGroupEditorItemManager *)self nameAndIconItem];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = @"HUServiceGroupEditorNameSectionIdentifier";
  }
  else
  {
    uint64_t v9 = [(HUServiceGroupEditorItemManager *)self instructionsItem];
    char v10 = [v5 isEqual:v9];

    if (v10)
    {
      uint64_t v8 = @"HUServiceGroupEditorInstructionsSectionIdentifier";
    }
    else
    {
      uint64_t v11 = [(HUServiceGroupEditorItemManager *)self serviceGridItem];
      char v12 = [v5 isEqual:v11];

      if (v12)
      {
        uint64_t v8 = @"HUServiceGroupEditorServiceGridSectionIdentifier";
      }
      else
      {
        id v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"HUServiceGroupEditorItemManager.m", 135, @"Couldn't find a section for item: %@", v5 object file lineNumber description];

        uint64_t v8 = 0;
      }
    }
  }

  return v8;
}

- (id)currentSectionIdentifiers
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if (![(HUServiceGroupEditorItemManager *)self mode]) {
    [v3 addObject:@"HUServiceGroupEditorNameSectionIdentifier"];
  }
  [v3 addObject:@"HUServiceGroupEditorInstructionsSectionIdentifier"];
  [v3 addObject:@"HUServiceGroupEditorServiceGridSectionIdentifier"];

  return v3;
}

- (HFServiceGroupBuilder)serviceGroupBuilder
{
  return self->_serviceGroupBuilder;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HFStaticItem)nameAndIconItem
{
  return self->_nameAndIconItem;
}

- (void)setNameAndIconItem:(id)a3
{
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
}

- (HFStaticItem)serviceGridItem
{
  return self->_serviceGridItem;
}

- (void)setServiceGridItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGridItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_nameAndIconItem, 0);

  objc_storeStrong((id *)&self->_serviceGroupBuilder, 0);
}

@end