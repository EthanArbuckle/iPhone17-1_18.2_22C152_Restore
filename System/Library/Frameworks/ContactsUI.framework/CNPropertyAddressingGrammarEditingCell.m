@interface CNPropertyAddressingGrammarEditingCell
+ (BOOL)wantsHorizontalLayout;
- (BOOL)allowsCellSelection;
- (id)valueView;
- (void)updateConstraints;
- (void)updateWithPropertyItem:(id)a3;
@end

@implementation CNPropertyAddressingGrammarEditingCell

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertyAddressingGrammarEditingCell;
  [(CNContactCell *)&v4 updateConstraints];
  v3 = [(CNPropertySimpleCell *)self labelLabel];
  objc_msgSend(v3, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
}

- (void)updateWithPropertyItem:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyAddressingGrammarEditingCell;
  id v4 = a3;
  [(CNPropertyCell *)&v11 updateWithPropertyItem:v4];
  objc_opt_class();
  v5 = objc_msgSend(v4, "labeledValue", v11.receiver, v11.super_class);

  v6 = [v5 value];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 localizedShortDescription];
  v10 = [(CNPropertySimpleCell *)self labelLabel];
  [v10 setText:v9];
}

- (id)valueView
{
  return 0;
}

- (BOOL)allowsCellSelection
{
  return 0;
}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

@end