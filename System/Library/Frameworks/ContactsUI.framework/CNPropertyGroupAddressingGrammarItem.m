@interface CNPropertyGroupAddressingGrammarItem
+ (id)emptyValueForLabel:(id)a3;
+ (id)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5;
- (BOOL)canReorder;
- (BOOL)modified;
- (BOOL)shouldDisableLabelButton;
- (BOOL)shouldShowLanguageLabel;
- (BOOL)showValueWithLabelStyle;
- (BOOL)wasAdded;
- (id)displayLabel;
- (id)displayStringForValue:(id)a3;
- (void)setWasAdded:(BOOL)a3;
@end

@implementation CNPropertyGroupAddressingGrammarItem

+ (id)emptyValueForLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F29040], "empty", a3);
}

+ (id)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  v11 = [v8 value];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  char v14 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A250] + 16))();
  v15 = 0;
  if ((v14 & 1) == 0)
  {
    v17.receiver = a1;
    v17.super_class = (Class)&OBJC_METACLASS___CNPropertyGroupAddressingGrammarItem;
    v15 = objc_msgSendSuper2(&v17, sel_propertyGroupItemWithLabeledValue_group_contact_, v8, v9, v10);
  }

  return v15;
}

- (void)setWasAdded:(BOOL)a3
{
  self->_wasAdded = a3;
}

- (BOOL)wasAdded
{
  return self->_wasAdded;
}

- (id)displayLabel
{
  objc_opt_class();
  v3 = [(CNPropertyGroupItem *)self labeledValue];
  v4 = [v3 value];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A250] + 16))())
  {
    v10.receiver = self;
    v10.super_class = (Class)CNPropertyGroupAddressingGrammarItem;
    uint64_t v7 = [(CNPropertyGroupItem *)&v10 displayLabel];
  }
  else
  {
    uint64_t v7 = [v6 localizedLanguageDescription];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)displayStringForValue:(id)a3
{
  objc_opt_class();
  v4 = [(CNPropertyGroupItem *)self labeledValue];
  v5 = [v4 value];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 localizedShortDescription];
  }
  else
  {
    id v8 = &stru_1ED8AC728;
  }

  return v8;
}

- (BOOL)showValueWithLabelStyle
{
  return 1;
}

- (BOOL)shouldDisableLabelButton
{
  return 1;
}

- (BOOL)canReorder
{
  return 1;
}

- (BOOL)modified
{
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyGroupAddressingGrammarItem;
  if ([(CNPropertyGroupItem *)&v9 modified])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    objc_opt_class();
    v4 = [(CNPropertyGroupItem *)self labeledValue];
    v5 = [v4 value];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if ([(CNPropertyGroupAddressingGrammarItem *)self wasAdded]) {
      int v3 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A250] + 16))() ^ 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)shouldShowLanguageLabel
{
  objc_opt_class();
  int v3 = [(CNPropertyGroupItem *)self group];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    char v6 = [v5 shouldShowLanguageLabel];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

@end