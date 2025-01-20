@interface CRUFollowUpHeaderCell
+ (int64_t)cellStyle;
- (CRUFollowUpHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)createFollowUpSubtitle;
- (id)createFollowUpTitle;
- (void)handleTapOnLabel;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)updateConstraints;
@end

@implementation CRUFollowUpHeaderCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)createFollowUpTitle
{
  id v2 = objc_alloc_init(MEMORY[0x263F828E0]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setNumberOfLines:0];
  [v2 setLineBreakMode:0];
  v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  [v2 setFont:v3];

  v4 = [MEMORY[0x263F5FBC0] appearance];
  v5 = [v4 textColor];
  if (v5)
  {
    [v2 setTextColor:v5];
  }
  else
  {
    v6 = [MEMORY[0x263F825C8] labelColor];
    [v2 setTextColor:v6];
  }
  LODWORD(v7) = 1144750080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v7];

  return v2;
}

- (id)createFollowUpSubtitle
{
  id v2 = objc_alloc_init(MEMORY[0x263F828E0]);
  v3 = [MEMORY[0x263F5FBC0] appearance];
  v4 = [v3 textColor];
  if (v4)
  {
    [v2 setTextColor:v4];
  }
  else
  {
    v5 = [MEMORY[0x263F825C8] labelColor];
    [v2 setTextColor:v5];
  }
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setNumberOfLines:0];
  [v2 setLineBreakMode:0];
  v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [v2 setFont:v6];

  LODWORD(v7) = 1144750080;
  [v2 setContentCompressionResistancePriority:0 forAxis:v7];

  return v2;
}

- (CRUFollowUpHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CRUFollowUpHeaderCell;
  v5 = -[CRUFollowUpHeaderCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(CRUFollowUpHeaderCell *)v5 createFollowUpTitle];
    followTitle = v6->_followTitle;
    v6->_followTitle = (UILabel *)v7;

    uint64_t v9 = [(CRUFollowUpHeaderCell *)v6 createFollowUpSubtitle];
    followSubtitle = v6->_followSubtitle;
    v6->_followSubtitle = (UILabel *)v9;

    v11 = [(CRUFollowUpHeaderCell *)v6 contentView];
    [v11 addSubview:v6->_followTitle];
    [v11 addSubview:v6->_followSubtitle];
    [(CRUFollowUpHeaderCell *)v6 layoutSubviews];
  }
  return v6;
}

- (void)handleTapOnLabel
{
  id v6 = [MEMORY[0x263F01880] defaultWorkspace];
  id v2 = NSURL;
  v3 = objc_opt_new();
  v4 = [v3 localizedStringWithKey:@"FINISH_REPAIR_KB_URL" defaultString:@"FINISH_REPAIR_KB_URL"];
  v5 = [v2 URLWithString:v4];
  [v6 openURL:v5 configuration:0 completionHandler:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CRUFollowUpHeaderCell;
  [(PSTableCell *)&v3 layoutSubviews];
  [(CRUFollowUpHeaderCell *)self setNeedsUpdateConstraints];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CRUFollowUpHeaderCell;
  id v4 = a3;
  [(PSTableCell *)&v18 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F352A8], v18.receiver, v18.super_class);

  id v6 = [v5 title];
  [(UILabel *)self->_followTitle setText:v6];

  uint64_t v7 = objc_opt_new();
  id v8 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v9 = [v5 informativeText];
  v10 = (void *)[v8 initWithString:v9];

  v11 = [v5 informativeText];
  v12 = [v7 localizedStringWithKey:@"LEARN_MORE_ELLIPSE" defaultString:@"LEARN_MORE_ELLIPSE"];
  uint64_t v13 = [v11 rangeOfString:v12];
  uint64_t v15 = v14;

  if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F81520], @"http://www.apple.com", v13, v15);
  }
  [(UILabel *)self->_followSubtitle setAttributedText:v10];
  [(UILabel *)self->_followSubtitle setUserInteractionEnabled:1];
  followSubtitle = self->_followSubtitle;
  v17 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTapOnLabel];
  [(UILabel *)followSubtitle addGestureRecognizer:v17];

  [(CRUFollowUpHeaderCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
  objc_super v3 = _NSDictionaryOfVariableBindings(&cfstr_FollowtitleFol.isa, self->_followTitle, self->_followSubtitle, 0);
  id v4 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[_followTitle]-|" options:0 metrics:0 views:v3];
  v5 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[_followSubtitle]-|" options:0 metrics:0 views:v3];
  id v6 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-11-[_followTitle]-[_followSubtitle]-11-|" options:0 metrics:0 views:v3];
  uint64_t v7 = [v4 arrayByAddingObjectsFromArray:v5];
  id v8 = [v7 arrayByAddingObjectsFromArray:v6];
  constraints = self->_constraints;
  self->_constraints = v8;

  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  v10.receiver = self;
  v10.super_class = (Class)CRUFollowUpHeaderCell;
  [(CRUFollowUpHeaderCell *)&v10 updateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_followSubtitle, 0);

  objc_storeStrong((id *)&self->_followTitle, 0);
}

@end