@interface HKSwitchTableViewCell
+ (id)reuseIdentifier;
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)centersIcon;
- (BOOL)isEnabled;
- (BOOL)isOn;
- (BOOL)shouldHideSwitch;
- (CGSize)iconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HKSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HKSwitchTableViewCellDelegate)delegate;
- (NSString)displayText;
- (id)_displayLabelFont;
- (void)_contextSizeCategoryChanged;
- (void)_setupUI;
- (void)_updateFont;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setCentersIcon:(BOOL)a3;
- (void)setCountText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldHideSwitch:(BOOL)a3;
- (void)switchValueChanged:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAutomationIdentifiersIfNeeded;
- (void)updateAutomationIdentifiersWithBaseIdentifier:(id)a3;
@end

@implementation HKSwitchTableViewCell

- (HKSwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HKSwitchTableViewCell;
  v4 = [(HKSwitchTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    [(HKSwitchTableViewCell *)v4 _setupUI];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__contextSizeCategoryChanged name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKSwitchTableViewCell;
  [(HKSwitchTableViewCell *)&v4 dealloc];
}

- (BOOL)adjustsFontSizeToFitWidth
{
  v2 = [(HKSwitchTableViewCell *)self textLabel];
  char v3 = [v2 adjustsFontSizeToFitWidth];

  return v3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HKSwitchTableViewCell *)self textLabel];
  [v4 setAdjustsFontSizeToFitWidth:v3];
}

- (id)_displayLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
}

- (void)_setupUI
{
  [(HKSwitchTableViewCell *)self setSelectionStyle:0];
  BOOL v3 = [(HKSwitchTableViewCell *)self _displayLabelFont];
  id v4 = [(HKSwitchTableViewCell *)self textLabel];
  [v4 setFont:v3];

  v5 = [(HKSwitchTableViewCell *)self textLabel];
  LODWORD(v6) = 1057803469;
  [v5 _setHyphenationFactor:v6];

  v7 = [MEMORY[0x1E4FB1618] labelColor];
  objc_super v8 = [(HKSwitchTableViewCell *)self textLabel];
  [v8 setTextColor:v7];

  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  countLabel = self->_countLabel;
  self->_countLabel = v9;

  v11 = [(HKSwitchTableViewCell *)self _displayLabelFont];
  [(UILabel *)self->_countLabel setFont:v11];

  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_countLabel setTextColor:v12];

  [(UILabel *)self->_countLabel setTextAlignment:2];
  v13 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  v14 = self->_switch;
  self->_switch = v13;

  [(UISwitch *)self->_switch addTarget:self action:sel_switchValueChanged_ forControlEvents:4096];
  [(UISwitch *)self->_switch setEnabled:self->_enabled];
  id v15 = [(HKSwitchTableViewCell *)self contentView];
  [v15 addSubview:self->_countLabel];
  [v15 addSubview:self->_switch];
}

- (void)_updateFont
{
  BOOL v3 = [(HKSwitchTableViewCell *)self _displayLabelFont];
  id v4 = [(HKSwitchTableViewCell *)self textLabel];
  [v4 setFont:v3];

  id v5 = [(HKSwitchTableViewCell *)self _displayLabelFont];
  [(UILabel *)self->_countLabel setFont:v5];
}

- (void)_contextSizeCategoryChanged
{
  BOOL v3 = [(HKSwitchTableViewCell *)self _displayLabelFont];
  [(UILabel *)self->_countLabel setFont:v3];

  [(HKSwitchTableViewCell *)self setNeedsLayout];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UISwitch setEnabled:](self->_switch, "setEnabled:");
  if (self->_enabled) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  id v4 = [(HKSwitchTableViewCell *)self textLabel];
  [v4 setTextColor:v5];
}

- (void)setShouldHideSwitch:(BOOL)a3
{
  self->_shouldHideSwitch = a3;
  -[UISwitch setHidden:](self->_switch, "setHidden:");
}

- (CGSize)iconSize
{
  BOOL v3 = [(HKSwitchTableViewCell *)self imageView];
  id v4 = [v3 image];

  if (v4)
  {
    id v5 = [(HKSwitchTableViewCell *)self imageView];
    double v6 = [v5 image];
    [v6 size];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)HKSwitchTableViewCell;
  -[HKSwitchTableViewCell sizeThatFits:](&v17, sel_sizeThatFits_);
  double v7 = v6;
  double v9 = v8;
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    double v10 = v9 + 5.0;
    [(UISwitch *)self->_switch frame];
    double v12 = v11;
    -[UILabel sizeThatFits:](self->_countLabel, "sizeThatFits:", width, height);
    if (v12 >= v13) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    double v9 = v10 + v14;
  }
  double v15 = v7;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  v114.receiver = self;
  v114.super_class = (Class)HKSwitchTableViewCell;
  [(HKSwitchTableViewCell *)&v114 layoutSubviews];
  [(HKSwitchTableViewCell *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v111 = v7;
  double v9 = v8;
  [(HKSwitchTableViewCell *)self separatorInset];
  double v94 = v10;
  double v11 = [(HKSwitchTableViewCell *)self contentView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v6 + v13;
  double rect = v4 + v15;
  CGFloat v21 = v17 - (v6 + v9);
  int IsUsingAccessibilityContentSizeCategory = HKUIApplicationIsUsingAccessibilityContentSizeCategory();
  [(UISwitch *)self->_switch sizeToFit];
  [(UISwitch *)self->_switch frame];
  double v102 = v17;
  UIRectCenteredYInRect();
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  int v31 = [(HKSwitchTableViewCell *)self _shouldReverseLayoutDirection];
  CGFloat v104 = v26;
  double v106 = v30;
  double v107 = v28;
  CGFloat v95 = v21;
  double v97 = v20;
  double v98 = v19 - (v4 + v111);
  double v32 = v20;
  double v33 = rect;
  double v34 = v21;
  double v35 = v98;
  if (IsUsingAccessibilityContentSizeCategory == v31)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v32);
    v115.origin.x = v24;
    v115.origin.y = v26;
    v115.size.double width = v28;
    v115.size.double height = v30;
    double MinX = MaxX - CGRectGetWidth(v115);
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v32);
  }
  CGFloat v112 = MinX;
  [(UILabel *)self->_countLabel sizeToFit];
  v38 = [(HKSwitchTableViewCell *)self textLabel];
  [v38 frame];
  UIRectCenteredYInRect();
  double v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  double v46 = v45;

  [(UILabel *)self->_countLabel frame];
  UIRectCenteredYInRect();
  double v100 = v48;
  double v101 = v47;
  CGFloat v108 = v46;
  double v96 = v49;
  if ([(HKSwitchTableViewCell *)self _shouldReverseLayoutDirection])
  {
    double v51 = rect;
    CGFloat v50 = v112;
    double v52 = v112;
    CGFloat v53 = v104;
    CGFloat v54 = v42;
    double v55 = v44;
    if ((IsUsingAccessibilityContentSizeCategory & 1) == 0)
    {
      v116.origin.x = v112;
      v116.origin.y = v104;
      v116.size.double height = v106;
      v116.size.double width = v107;
      double v40 = CGRectGetMaxX(v116) + 5.0;
      double v55 = v102 - v40 - v94;
      double v52 = v94;
    }
  }
  else
  {
    CGFloat v53 = v104;
    if (IsUsingAccessibilityContentSizeCategory)
    {
      double v52 = v40;
      double v51 = rect;
      CGFloat v50 = v112;
      CGFloat v54 = v42;
      double v55 = v44;
    }
    else
    {
      v117.origin.x = v112;
      v117.origin.y = v104;
      v117.size.double height = v106;
      v117.size.double width = v107;
      double v56 = CGRectGetMinX(v117);
      v118.origin.x = v40;
      CGFloat v54 = v42;
      v118.origin.y = v42;
      v118.size.double width = v44;
      v118.size.double height = v108;
      double v57 = v56 - CGRectGetMinX(v118);
      CGFloat v50 = v112;
      double v55 = v57 + -5.0;
      v119.origin.x = v20;
      v119.size.double height = v98;
      double v51 = rect;
      v119.origin.y = rect;
      v119.size.double width = v95;
      double v52 = CGRectGetMaxX(v119) + 5.0;
    }
  }
  double v99 = v52;
  double v113 = v50;
  v58 = [(HKSwitchTableViewCell *)self imageView];
  [v58 frame];
  double v60 = v59;
  double recta = v61;
  CGFloat v63 = v62;
  CGFloat v65 = v64;

  v66 = [(HKSwitchTableViewCell *)self imageView];
  v67 = [v66 image];

  double v103 = v65;
  if (v67)
  {
    if ([(HKSwitchTableViewCell *)self _shouldReverseLayoutDirection])
    {
      double v68 = v54;
      double v69 = v97;
      double v70 = v98;
      double v71 = v40;
      if (self->_centersIcon)
      {
        v120.origin.x = v40;
        v120.origin.y = v68;
        v120.size.double width = v55;
        v120.size.double height = v108;
        double v72 = CGRectGetMaxX(v120);
        v121.origin.x = v60;
        v121.origin.y = recta;
        v121.size.double width = v63;
        v121.size.double height = v65;
        double v60 = v72 + CGRectGetWidth(v121) * 0.5;
      }
      else
      {
        double v77 = v51;
        CGFloat v78 = v95;
        double v79 = CGRectGetMaxX(*(CGRect *)&v69);
        v124.origin.x = v60;
        v124.origin.y = recta;
        v124.size.double width = v63;
        v124.size.double height = v65;
        double v60 = v79 - CGRectGetWidth(v124);
      }
      double v73 = v104;
    }
    else
    {
      double v73 = v53;
      double v68 = v54;
      double v74 = v97;
      double v75 = v98;
      double v71 = v40;
      if (self->_centersIcon)
      {
        v122.origin.x = v40;
        v122.origin.y = v68;
        v122.size.double width = v55;
        v122.size.double height = v108;
        double v76 = CGRectGetMinX(v122);
        v123.origin.x = v60;
        v123.origin.y = recta;
        v123.size.double width = v63;
        v123.size.double height = v103;
        double v73 = v104;
        double v60 = (v76 - CGRectGetWidth(v123)) * 0.5 + 0.0;
      }
      else
      {
        double v80 = v51;
        CGFloat v81 = v95;
        double v60 = CGRectGetMinX(*(CGRect *)&v74);
      }
    }
  }
  else
  {
    double v73 = v53;
    double v68 = v54;
    double v71 = v40;
  }
  double v82 = v60;
  double v105 = v63;
  if (IsUsingAccessibilityContentSizeCategory)
  {
    [(UISwitch *)self->_switch frame];
    double v84 = v83;
    [(UILabel *)self->_countLabel frame];
    if (v84 >= v85) {
      double v86 = v84;
    }
    else {
      double v86 = v85;
    }
    double v87 = (v86 + 5.0) * 0.5;
    double v88 = recta - v87;
    double v68 = v68 - v87;
    v125.origin.x = v71;
    v125.origin.y = v68;
    v125.size.double width = v55;
    double v89 = v55;
    double v90 = v108;
    v125.size.double height = v108;
    double v91 = CGRectGetMaxY(v125) + 5.0;
    double v73 = v91;
  }
  else
  {
    double v89 = v55;
    double v90 = v108;
    double v88 = recta;
    double v91 = v96;
  }
  v92 = [(HKSwitchTableViewCell *)self imageView];
  objc_msgSend(v92, "setFrame:", v82, v88, v105, v103);

  v93 = [(HKSwitchTableViewCell *)self textLabel];
  objc_msgSend(v93, "setFrame:", v71, v68, v89, v90);

  -[UISwitch setFrame:](self->_switch, "setFrame:", v113, v73, v107, v106);
  -[UILabel setFrame:](self->_countLabel, "setFrame:", v99, v91, v101, v100);
}

- (void)setDisplayText:(id)a3
{
  id v4 = a3;
  double v5 = [(HKSwitchTableViewCell *)self textLabel];
  [v5 setText:v4];

  [(HKSwitchTableViewCell *)self setNeedsLayout];
  [(HKSwitchTableViewCell *)self updateAutomationIdentifiersIfNeeded];
}

- (void)setCountText:(id)a3
{
  [(UILabel *)self->_countLabel setText:a3];
  [(HKSwitchTableViewCell *)self setNeedsLayout];
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  double v5 = [(HKSwitchTableViewCell *)self imageView];
  [v5 setImage:v4];

  [(HKSwitchTableViewCell *)self setNeedsLayout];
}

- (BOOL)isOn
{
  return [(UISwitch *)self->_switch isOn];
}

- (void)setOn:(BOOL)a3
{
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setCentersIcon:(BOOL)a3
{
  self->_centersIcon = a3;
  [(HKSwitchTableViewCell *)self setNeedsLayout];
}

- (void)updateAutomationIdentifiersIfNeeded
{
  id v10 = [(HKSwitchTableViewCell *)self textLabel];
  uint64_t v3 = [v10 accessibilityIdentifier];
  if (v3)
  {
    id v4 = (void *)v3;
  }
  else
  {
    double v5 = [(HKSwitchTableViewCell *)self textLabel];
    double v6 = [v5 text];

    if (!v6) {
      return;
    }
    double v7 = [(HKSwitchTableViewCell *)self textLabel];
    double v8 = [v7 text];
    double v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    objc_msgSend(v8, "hk_stringByRemovingCharactersInSet:", v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = [@"UIA.Health" stringByAppendingFormat:@".%@.SwitchCell", v10];
    [(HKSwitchTableViewCell *)self updateAutomationIdentifiersWithBaseIdentifier:v4];
  }
}

- (void)updateAutomationIdentifiersWithBaseIdentifier:(id)a3
{
  id v4 = a3;
  [(HKSwitchTableViewCell *)self setAccessibilityIdentifier:v4];
  double v5 = [v4 stringByAppendingString:@".TitleText"];
  double v6 = [(HKSwitchTableViewCell *)self textLabel];
  [v6 setAccessibilityIdentifier:v5];

  double v7 = [v4 stringByAppendingString:@".CountText"];
  [(UILabel *)self->_countLabel setAccessibilityIdentifier:v7];

  id v8 = [v4 stringByAppendingString:@".Switch"];

  [(UISwitch *)self->_switch setAccessibilityIdentifier:v8];
}

+ (id)reuseIdentifier
{
  return @"HKSwitchTableViewCellIdentifier";
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSwitchTableViewCell;
  [(HKSwitchTableViewCell *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(HKSwitchTableViewCell *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(HKSwitchTableViewCell *)self _updateFont];
      [(HKSwitchTableViewCell *)self setNeedsLayout];
    }
  }
}

- (void)switchValueChanged:(id)a3
{
  id v4 = [(HKSwitchTableViewCell *)self delegate];
  objc_msgSend(v4, "switchCellValueChanged:value:", self, -[UISwitch isOn](self->_switch, "isOn"));
}

- (HKSwitchTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSwitchTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldHideSwitch
{
  return self->_shouldHideSwitch;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)centersIcon
{
  return self->_centersIcon;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_switch, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
}

@end