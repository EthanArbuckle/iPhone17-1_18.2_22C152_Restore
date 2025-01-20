@interface CNPropertyCell
+ (id)labelStringFromAppName:(id)a3 andPropertyLabel:(id)a4;
- (BOOL)allowsEditing;
- (BOOL)forceSuggested;
- (BOOL)ignoreSuggested;
- (BOOL)isHighlightedProperty;
- (BOOL)isImportant;
- (BOOL)isSuggested;
- (BOOL)shouldShowSuggestionOrigin;
- (BOOL)supportsTintColorValue;
- (BOOL)supportsValueColorUsesLabelColor;
- (CNPresenterDelegate)presentingDelegate;
- (CNPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNPropertyCellDelegate)delegate;
- (UIResponder)firstResponderItem;
- (double)labelWidth;
- (id)appNameForSuggestion:(id)a3;
- (id)labelString;
- (id)property;
- (id)valueString;
- (void)copy:(id)a3;
- (void)performAccessoryAction;
- (void)performDefaultAction;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setCardGroupItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceSuggested:(BOOL)a3;
- (void)setHighlightedProperty:(BOOL)a3;
- (void)setIgnoreSuggested:(BOOL)a3;
- (void)setImportant:(BOOL)a3;
- (void)setLabelWidth:(double)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setProperty:(id)a3;
- (void)tintColorDidChange;
- (void)updateValueWithPropertyItem:(id)a3;
- (void)updateWithPropertyItem:(id)a3;
@end

@implementation CNPropertyCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak(&self->_property);
}

- (void)setPresentingDelegate:(id)a3
{
}

- (CNPresenterDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNPropertyCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPropertyCellDelegate *)WeakRetained;
}

- (void)setLabelWidth:(double)a3
{
  self->_labelWidth = a3;
}

- (double)labelWidth
{
  return self->_labelWidth;
}

- (void)setImportant:(BOOL)a3
{
  self->_important = a3;
}

- (BOOL)isImportant
{
  return self->_important;
}

- (void)setHighlightedProperty:(BOOL)a3
{
  self->_highlightedProperty = a3;
}

- (BOOL)isHighlightedProperty
{
  return self->_highlightedProperty;
}

- (void)setForceSuggested:(BOOL)a3
{
  self->_forceSuggested = a3;
}

- (BOOL)forceSuggested
{
  return self->_forceSuggested;
}

- (void)setIgnoreSuggested:(BOOL)a3
{
  self->_ignoreSuggested = a3;
}

- (BOOL)ignoreSuggested
{
  return self->_ignoreSuggested;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (UIResponder)firstResponderItem
{
  return self->_firstResponderItem;
}

- (id)property
{
  id WeakRetained = objc_loadWeakRetained(&self->_property);

  return WeakRetained;
}

- (void)updateValueWithPropertyItem:(id)a3
{
  v4 = [(CNPropertyCell *)self valueString];
  v5 = [(CNLabeledCell *)self valueView];
  v6 = objc_msgSend(v5, "ab_text");
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v9 = [(CNPropertyCell *)self valueString];
    v8 = [(CNLabeledCell *)self valueView];
    objc_msgSend(v8, "setAb_text:", v9);
  }
}

- (void)updateWithPropertyItem:(id)a3
{
  id v10 = a3;
  v4 = [(CNPropertyCell *)self labelString];
  v5 = [(CNLabeledCell *)self labelView];
  v6 = objc_msgSend(v5, "ab_text");
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [(CNLabeledCell *)self labelView];
    objc_msgSend(v8, "setAb_text:", v4);
  }
  [(CNPropertyCell *)self updateValueWithPropertyItem:v10];
  if ([(CNPropertyCell *)self isSuggested] && ![(CNPropertyCell *)self forceSuggested])
  {
    [(CNPropertyCell *)self setAccessoryType:1];
    id v9 = +[CNUIColorRepository contactCardDisclosureAccessoryTintColor];
    [(CNPropertyCell *)self _setAccessoryTintColor:v9];
  }
  else
  {
    [(CNPropertyCell *)self setAccessoryType:0];
  }
}

- (void)tintColorDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyCell;
  [(CNLabeledCell *)&v9 tintColorDidChange];
  if (![(CNPropertyCell *)self isSuggested]
    && (![(CNPropertyCell *)self isHighlightedProperty]
     || ![(CNPropertyCell *)self isImportant])
    && [(CNPropertyCell *)self supportsTintColorValue])
  {
    v3 = [(CNLabeledCell *)self valueTextAttributes];
    v4 = [(UIView *)self tintColorOverride];
    uint64_t v5 = *MEMORY[0x1E4FB0700];
    v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    char v7 = [v6 isEqual:v4];

    if ((v7 & 1) == 0)
    {
      v8 = (void *)[v3 mutableCopy];
      [v8 setObject:v4 forKeyedSubscript:v5];
      [(CNLabeledCell *)self setValueTextAttributes:v8];
    }
  }
}

- (BOOL)supportsValueColorUsesLabelColor
{
  return 1;
}

- (BOOL)supportsTintColorValue
{
  return 1;
}

- (void)copy:(id)a3
{
  v3 = [(CNPropertyCell *)self propertyItem];
  uint64_t v4 = [v3 displayValue];

  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = &stru_1ED8AC728;
  }
  char v7 = v5;
  v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v6 setString:v7];
}

- (id)valueString
{
  v2 = [(CNPropertyCell *)self propertyItem];
  v3 = [v2 displayValue];

  return v3;
}

- (id)appNameForSuggestion:(id)a3
{
  id v4 = a3;
  if ([v4 isSuggested])
  {
    uint64_t v5 = [v4 localizedAppName];
    if (!v5)
    {
      v6 = [(CNPropertyCell *)self delegate];
      char v7 = [v6 contactViewCache];
      v8 = [v7 contactStore];

      uint64_t v11 = 0;
      objc_super v9 = [v8 originForSuggestion:v4 error:&v11];
      uint64_t v5 = [v9 localizedApplicationName];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowSuggestionOrigin
{
  v3 = [(CNPropertyCell *)self propertyItem];
  id v4 = [v3 contact];
  int v5 = [v4 isSuggestedMe];

  if (v5)
  {
    v6 = [(CNPropertyCell *)self propertyItem];
    if ([v6 isSuggested]) {
      int v7 = [(CNPropertyCell *)self isEditing] ^ 1;
    }
    else {
      LOBYTE(v7) = 0;
    }

    return v7;
  }
  else
  {
    return [(CNPropertyCell *)self isSuggested];
  }
}

- (id)labelString
{
  v3 = [(CNPropertyCell *)self propertyItem];
  id v4 = [v3 displayLabel];
  int v5 = [v3 property];
  v6 = CNUILocalizedStringForPropertyWithFormatKey(@"LOWERCASE_LABEL", v5);

  BOOL v7 = [(CNPropertyCell *)self shouldShowSuggestionOrigin];
  v8 = [(CNPropertyCell *)self propertyItem];
  objc_super v9 = v8;
  if (v7)
  {
    id v10 = [v8 labeledValue];
    uint64_t v11 = [v10 valueOrigin];

    if (v11)
    {
      v12 = [(CNPropertyCell *)self propertyItem];
      v13 = [v12 labeledValue];
      v14 = [v13 valueOrigin];
      uint64_t v15 = [v14 localizedApplicationName];

      id v16 = [(id)objc_opt_class() labelStringFromAppName:v15 andPropertyLabel:v6];

      id v4 = (void *)v15;
    }
    else
    {
      v18 = [v3 labeledValue];
      uint64_t v19 = [(CNPropertyCell *)self appNameForSuggestion:v18];

      id v16 = [(id)objc_opt_class() labelStringFromAppName:v19 andPropertyLabel:v6];

      id v4 = (void *)v19;
    }
  }
  else
  {
    int v17 = [v8 isSuggested];

    if (!v17) {
      goto LABEL_8;
    }
    id v16 = v6;
  }

  id v4 = v16;
LABEL_8:

  return v4;
}

- (BOOL)isSuggested
{
  if ([(CNPropertyCell *)self forceSuggested]) {
    return 1;
  }
  if ([(CNPropertyCell *)self ignoreSuggested]) {
    return 0;
  }
  id v4 = [(CNPropertyCell *)self propertyItem];
  if ([v4 isSuggested])
  {
    char v3 = 1;
  }
  else
  {
    int v5 = [(CNPropertyCell *)self propertyItem];
    v6 = [v5 contact];
    char v3 = [v6 isSuggested];
  }
  return v3;
}

- (void)setCardGroupItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNPropertyCell;
  int v5 = [(CNContactCell *)&v8 cardGroupItem];
  v6 = v5;
  if (v4 && !v5 || v5 && ([v5 isEqual:v4] & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)CNPropertyCell;
    [(CNContactCell *)&v7 setCardGroupItem:v4];
    if (v4) {
      [(CNPropertyCell *)self updateWithPropertyItem:v4];
    }
  }
}

- (void)setProperty:(id)a3
{
  id obj = a3;
  id v4 = [obj value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [obj label];
    objc_super v7 = [(CNLabeledCell *)self labelView];
    objc_msgSend(v7, "setAb_text:", v6);

    objc_super v8 = [obj value];
    objc_super v9 = [(CNLabeledCell *)self valueView];
    objc_msgSend(v9, "setAb_text:", v8);
  }
  objc_storeWeak(&self->_property, obj);
}

- (void)performAccessoryAction
{
  char v3 = [(CNPropertyCell *)self propertyItem];
  int v4 = [v3 isSuggested];

  if (v4)
  {
    id v6 = [(CNPropertyCell *)self delegate];
    int v5 = [(CNPropertyCell *)self propertyItem];
    [v6 propertyCell:self performActionForItem:v5 withTransportType:0];
  }
}

- (void)performDefaultAction
{
  id v4 = [(CNPropertyCell *)self delegate];
  char v3 = [(CNPropertyCell *)self propertyItem];
  [v4 propertyCell:self performActionForItem:v3 withTransportType:0];
}

- (CNPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CNPropertyCell;
  id v4 = [(CNLabeledCell *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(CNPropertyCell *)v4 setAccessoryType:0];
  return v4;
}

+ (id)labelStringFromAppName:(id)a3 andPropertyLabel:(id)a4
{
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F5A298];
  objc_super v7 = *(uint64_t (**)(uint64_t, id))(*MEMORY[0x1E4F5A298] + 16);
  id v8 = a4;
  LOBYTE(v7) = v7(v6, v5);
  objc_super v9 = NSString;
  id v10 = CNContactsUIBundle();
  uint64_t v11 = v10;
  if (v7)
  {
    v12 = [v10 localizedStringForKey:@"SUGGESTION_UNKNOWN_ORIGIN" value:&stru_1ED8AC728 table:@"Localized"];
  }
  else
  {
    v12 = [v10 localizedStringForKey:@"SUGGESTION_FOUND_IN_APP" value:&stru_1ED8AC728 table:@"Localized"];
    id v15 = v5;
  }
  v13 = objc_msgSend(v9, "stringWithFormat:", v12, v8, v15);

  return v13;
}

@end