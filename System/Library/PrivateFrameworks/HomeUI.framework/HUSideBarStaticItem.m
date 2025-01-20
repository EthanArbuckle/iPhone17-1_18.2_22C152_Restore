@interface HUSideBarStaticItem
- (HUSideBarStaticItem)initWithSideBarStaticItemType:(unint64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)resultDictionary;
- (unint64_t)type;
@end

@implementation HUSideBarStaticItem

- (id)resultDictionary
{
  v16[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUSideBarStaticItem *)self type];
  if (v3 == 2)
  {
    v11[0] = *MEMORY[0x1E4F68AB8];
    v4 = HFLocalizedString();
    v12[0] = v4;
    v11[1] = *MEMORY[0x1E4F68A00];
    int v8 = [MEMORY[0x1E4F69758] isAMac];
    v9 = @"star.fill";
    if (v8) {
      v9 = @"star";
    }
    v12[1] = v9;
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = v12;
    v7 = v11;
  }
  else if (v3 == 1)
  {
    v13[0] = *MEMORY[0x1E4F68AB8];
    v4 = HFLocalizedString();
    v13[1] = *MEMORY[0x1E4F68A00];
    v14[0] = v4;
    v14[1] = @"deskclock";
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = v14;
    v7 = v13;
  }
  else
  {
    if (v3) {
      goto LABEL_10;
    }
    v15[0] = *MEMORY[0x1E4F68AB8];
    v4 = HFLocalizedString();
    v15[1] = *MEMORY[0x1E4F68A00];
    v16[0] = v4;
    v16[1] = @"house";
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = v16;
    v7 = v15;
  }
  v2 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:2];

LABEL_10:

  return v2;
}

- (HUSideBarStaticItem)initWithSideBarStaticItemType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUSideBarStaticItem;
  result = [(HFStaticItem *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  objc_super v5 = (void *)MEMORY[0x1E4F69228];
  v6 = [(HUSideBarStaticItem *)self resultDictionary];
  v7 = [v5 outcomeWithResults:v6];
  [v4 finishWithResult:v7];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

@end