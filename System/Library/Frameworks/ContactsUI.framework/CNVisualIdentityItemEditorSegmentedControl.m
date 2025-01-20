@interface CNVisualIdentityItemEditorSegmentedControl
+ (id)segmentedControlForItemType:(unint64_t)a3;
- (BOOL)allowsTextInputForCurrentEditorType;
- (CNVisualIdentityItemEditorSegmentedControl)initWithItems:(id)a3;
- (void)selectStyleSegment;
- (void)selectTextSegment;
- (void)setStyleOnlyMode;
- (void)setStyleSegmentEnabled:(BOOL)a3;
- (void)setTextAndStyleMode;
- (void)setTextSegmentEnabled:(BOOL)a3;
@end

@implementation CNVisualIdentityItemEditorSegmentedControl

- (void)selectStyleSegment
{
}

- (void)selectTextSegment
{
}

- (void)setStyleSegmentEnabled:(BOOL)a3
{
}

- (void)setTextSegmentEnabled:(BOOL)a3
{
}

- (void)setStyleOnlyMode
{
  [(CNVisualIdentityItemEditorSegmentedControl *)self setStyleSegmentEnabled:1];
  [(CNVisualIdentityItemEditorSegmentedControl *)self setTextSegmentEnabled:0];

  [(CNVisualIdentityItemEditorSegmentedControl *)self selectStyleSegment];
}

- (void)setTextAndStyleMode
{
  [(CNVisualIdentityItemEditorSegmentedControl *)self setStyleSegmentEnabled:1];
  [(CNVisualIdentityItemEditorSegmentedControl *)self setTextSegmentEnabled:1];

  [(CNVisualIdentityItemEditorSegmentedControl *)self selectTextSegment];
}

- (BOOL)allowsTextInputForCurrentEditorType
{
  return [(CNVisualIdentityItemEditorSegmentedControl *)self selectedSegmentIndex] == 0;
}

- (CNVisualIdentityItemEditorSegmentedControl)initWithItems:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityItemEditorSegmentedControl;
  v3 = [(CNVisualIdentityItemEditorSegmentedControl *)&v7 initWithItems:a3];
  v4 = v3;
  if (v3)
  {
    [(CNVisualIdentityItemEditorSegmentedControl *)v3 setSelectedSegmentIndex:0];
    [(CNVisualIdentityItemEditorSegmentedControl *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = v4;
  }

  return v4;
}

+ (id)segmentedControlForItemType:(unint64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = CNContactsUIBundle();
  v5 = v4;
  if (a3 == 4) {
    v6 = @"PHOTO_TEXT_STYLE_EDITOR_EMOJI_LABEL";
  }
  else {
    v6 = @"PHOTO_TEXT_STYLE_EDITOR_TEXT_LABEL";
  }
  objc_super v7 = [v4 localizedStringForKey:v6 value:&stru_1ED8AC728 table:@"Localized"];

  v8 = [CNVisualIdentityItemEditorSegmentedControl alloc];
  v14[0] = v7;
  v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"PHOTO_TEXT_STYLE_EDITOR_STYLE_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v14[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [(CNVisualIdentityItemEditorSegmentedControl *)v8 initWithItems:v11];

  return v12;
}

@end