@interface CNPropertyEmailAddressCell
- (BOOL)isStaticIdentityVerified;
- (BOOL)isVIP;
- (BOOL)shouldPerformDefaultAction;
- (BOOL)shouldShowStar;
- (CNStaticIdentityBadgeView)staticIdentityBadgeView;
- (void)addStaticIdentityBadgeView;
- (void)setStaticIdentityBadgeView:(id)a3;
- (void)setStaticIdentityVerified:(BOOL)a3;
- (void)setVIP:(BOOL)a3;
- (void)updateStaticIdentityBadge;
- (void)updateTransportButtons;
- (void)updateValueWithPropertyItem:(id)a3;
@end

@implementation CNPropertyEmailAddressCell

- (void).cxx_destruct
{
}

- (void)setStaticIdentityBadgeView:(id)a3
{
}

- (CNStaticIdentityBadgeView)staticIdentityBadgeView
{
  return self->_staticIdentityBadgeView;
}

- (BOOL)isStaticIdentityVerified
{
  return self->_staticIdentityVerified;
}

- (BOOL)isVIP
{
  return self->_VIP;
}

- (void)addStaticIdentityBadgeView
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CNStaticIdentityBadgeView);
  [(CNStaticIdentityBadgeView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(CNPropertyEmailAddressCell *)self contentView];
  [v4 addSubview:v3];

  v5 = (void *)MEMORY[0x1E4F1CA48];
  v18.receiver = self;
  v18.super_class = (Class)CNPropertyEmailAddressCell;
  v6 = [(CNLabeledCell *)&v18 constantConstraints];
  v7 = [v5 arrayWithArray:v6];

  v16 = [(CNStaticIdentityBadgeView *)v3 centerYAnchor];
  v17 = [(CNPropertySimpleCell *)self labelLabel];
  v8 = [v17 centerYAnchor];
  v9 = [v16 constraintEqualToAnchor:v8];
  v19[0] = v9;
  v10 = [(CNStaticIdentityBadgeView *)v3 trailingAnchor];
  v11 = [(CNPropertySimpleCell *)self valueLabel];
  v12 = [v11 trailingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v19[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v7 addObjectsFromArray:v14];

  v15 = [(CNPropertyEmailAddressCell *)self contentView];
  [v15 addConstraints:v7];

  [(CNPropertyEmailAddressCell *)self setStaticIdentityBadgeView:v3];
}

- (void)updateStaticIdentityBadge
{
  if ([(CNPropertyEmailAddressCell *)self isStaticIdentityVerified])
  {
    v3 = [(CNPropertyEmailAddressCell *)self staticIdentityBadgeView];

    if (!v3) {
      [(CNPropertyEmailAddressCell *)self addStaticIdentityBadgeView];
    }
  }
  uint64_t v4 = [(CNPropertyEmailAddressCell *)self isStaticIdentityVerified] ^ 1;
  id v5 = [(CNPropertyEmailAddressCell *)self staticIdentityBadgeView];
  [v5 setHidden:v4];
}

- (void)setStaticIdentityVerified:(BOOL)a3
{
  if (self->_staticIdentityVerified != a3)
  {
    self->_staticIdentityVerified = a3;
    [(CNPropertyEmailAddressCell *)self updateStaticIdentityBadge];
  }
}

- (void)updateTransportButtons
{
  if (![(CNPropertySimpleTransportCell *)self allowsActions]
    || [(CNPropertyCell *)self isSuggested])
  {
    v3 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    uint64_t v4 = v3;
    goto LABEL_4;
  }
  v9 = [(CNPropertyCell *)self propertyItem];
  if (([v9 allowsEmail] & 1) == 0)
  {

LABEL_12:
    v16 = [(CNPropertyCell *)self propertyItem];
    int v17 = [v16 allowsIMessage];

    v3 = [(CNPropertySimpleTransportCell *)self transportIcon1];
    uint64_t v4 = v3;
    if (v17)
    {
      uint64_t v5 = 2;
      goto LABEL_5;
    }
LABEL_4:
    uint64_t v5 = 0;
LABEL_5:
    [v3 setTransportType:v5];

    v6 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    v7 = v6;
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  v10 = [(CNPropertyCell *)self propertyItem];
  int v11 = [v10 allowsIMessage];

  if (!v11) {
    goto LABEL_12;
  }
  v12 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  int v13 = [v12 hasCellularTelephonyCapability];

  v14 = [(CNPropertySimpleTransportCell *)self transportIcon1];
  v15 = v14;
  if (v13)
  {
    [v14 setTransportType:4];

    v6 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    v7 = v6;
    uint64_t v8 = 2;
  }
  else
  {
    [v14 setTransportType:2];

    v6 = [(CNPropertySimpleTransportCell *)self transportIcon2];
    v7 = v6;
    uint64_t v8 = 4;
  }
LABEL_6:
  [v6 setTransportType:v8];

  v18.receiver = self;
  v18.super_class = (Class)CNPropertyEmailAddressCell;
  [(CNPropertySimpleTransportCell *)&v18 updateTransportButtons];
}

- (void)updateValueWithPropertyItem:(id)a3
{
  id v4 = a3;
  if ([(CNPropertyEmailAddressCell *)self isEditing])
  {
    v12.receiver = self;
    v12.super_class = (Class)CNPropertyEmailAddressCell;
    [(CNPropertyCell *)&v12 updateValueWithPropertyItem:v4];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F5A1E8];
    v6 = [(CNPropertyCell *)self valueString];
    v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    uint64_t v8 = [(CNPropertySimpleCell *)self valueView];
    v9 = objc_msgSend(v8, "ab_text");
    char v10 = [v7 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      int v11 = [(CNPropertySimpleCell *)self valueView];
      objc_msgSend(v11, "setAb_text:", v7);
    }
  }
}

- (BOOL)shouldPerformDefaultAction
{
  v7.receiver = self;
  v7.super_class = (Class)CNPropertyEmailAddressCell;
  if (![(CNPropertySimpleTransportCell *)&v7 shouldPerformDefaultAction]) {
    return [(CNPropertyCell *)self isSuggested];
  }
  v3 = [(CNPropertyCell *)self propertyItem];
  if ([v3 allowsEmail])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(CNPropertyCell *)self propertyItem];
    BOOL v4 = ([v5 allowsIMessage] & 1) != 0 || -[CNPropertyCell isSuggested](self, "isSuggested");
  }
  return v4;
}

- (void)setVIP:(BOOL)a3
{
  self->_VIP = a3;
  [(CNPropertySimpleTransportCell *)self updateStarIcon];
}

- (BOOL)shouldShowStar
{
  v4.receiver = self;
  v4.super_class = (Class)CNPropertyEmailAddressCell;
  return [(CNPropertySimpleTransportCell *)&v4 shouldShowStar]
      || [(CNPropertyEmailAddressCell *)self isVIP];
}

@end