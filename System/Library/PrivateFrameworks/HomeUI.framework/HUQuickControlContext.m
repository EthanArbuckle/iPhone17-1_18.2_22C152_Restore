@interface HUQuickControlContext
- (Class)quickControlClass;
- (Class)viewProfileClass;
- (HMHome)home;
- (HUQuickControlContext)initWithQuickControlClass:(Class)a3 controlItems:(id)a4 home:(id)a5 itemUpdater:(id)a6;
- (HUQuickControlItemUpdating)itemUpdater;
- (NSSet)controlItems;
- (id)affectedCharacteristics;
- (unint64_t)controlOrientation;
- (unint64_t)preferredControl;
- (void)setControlOrientation:(unint64_t)a3;
- (void)setPreferredControl:(unint64_t)a3;
@end

@implementation HUQuickControlContext

- (HUQuickControlContext)initWithQuickControlClass:(Class)a3 controlItems:(id)a4 home:(id)a5 itemUpdater:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUQuickControlContext;
  v14 = [(HUQuickControlContext *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_quickControlClass, a3);
    objc_storeStrong((id *)&v15->_controlItems, a4);
    objc_storeStrong((id *)&v15->_home, a5);
    objc_storeWeak((id *)&v15->_itemUpdater, v13);
  }

  return v15;
}

- (id)affectedCharacteristics
{
  v2 = [(HUQuickControlContext *)self controlItems];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_276);

  return v3;
}

id __48__HUQuickControlContext_affectedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 characteristicOptions];
  v4 = [v3 objectForKeyedSubscript:&unk_1F19B52B8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HUQuickControlContext_affectedCharacteristics__block_invoke_2;
  v8[3] = &unk_1E6384F48;
  id v9 = v2;
  id v5 = v2;
  v6 = objc_msgSend(v4, "na_flatMap:", v8);

  return v6;
}

id __48__HUQuickControlContext_affectedCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 valueSource];
  id v5 = [v4 allCharacteristicsForCharacteristicType:v3];

  return v5;
}

- (Class)viewProfileClass
{
  if ([(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()]|| [(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()]|| [(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()])
  {
    goto LABEL_4;
  }
  if ([(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()])
  {
    objc_opt_class();
    id v5 = [(HUQuickControlContext *)self controlItems];
    v6 = [v5 allObjects];
    v7 = [v6 firstObject];
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    v10 = [v9 possibleValueSet];
    id v11 = v10;
    if (v9)
    {
      id v12 = [v10 allValues];
      uint64_t v13 = [v12 count];

      if (v13 == 2)
      {
        +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:v9 preferredControl:[(HUQuickControlContext *)self preferredControl]];
        id v3 = objc_opt_class();
      }
      else
      {
        objc_super v17 = [v9 multiStateCharacteristicType];
        if (([v17 isEqualToString:*MEMORY[0x1E4F2CFF0]] & 1) == 0) {
          [v17 isEqualToString:*MEMORY[0x1E4F2CFE8]];
        }
        id v3 = objc_opt_class();
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  else if ([(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()])
  {
    v14 = [(HUQuickControlContext *)self controlItems];
    v15 = [v14 allObjects];
    v16 = [v15 firstObject];

    +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:v16 preferredControl:[(HUQuickControlContext *)self preferredControl]];
    id v3 = objc_opt_class();
  }
  else
  {
    if ([(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()]|| [(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()]|| [(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()]|| [(objc_class *)[(HUQuickControlContext *)self quickControlClass] isEqual:objc_opt_class()])
    {
LABEL_4:
      id v3 = objc_opt_class();
      goto LABEL_5;
    }
    id v3 = 0;
  }
LABEL_5:

  return (Class)v3;
}

- (Class)quickControlClass
{
  return self->_quickControlClass;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (HMHome)home
{
  return self->_home;
}

- (HUQuickControlItemUpdating)itemUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemUpdater);

  return (HUQuickControlItemUpdating *)WeakRetained;
}

- (unint64_t)preferredControl
{
  return self->_preferredControl;
}

- (void)setPreferredControl:(unint64_t)a3
{
  self->_preferredControl = a3;
}

- (unint64_t)controlOrientation
{
  return self->_controlOrientation;
}

- (void)setControlOrientation:(unint64_t)a3
{
  self->_controlOrientation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemUpdater);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);

  objc_storeStrong((id *)&self->_quickControlClass, 0);
}

@end