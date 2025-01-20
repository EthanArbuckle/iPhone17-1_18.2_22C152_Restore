@interface HSPCNameServiceRow
+ (id)_reuseIdentifier;
- (HMService)service;
- (HSPCNameServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)defaultTextColor;
- (void)setDefaultTextColor:(id)a3;
- (void)setService:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithService:(id)a3 suggestedName:(id)a4;
@end

@implementation HSPCNameServiceRow

+ (id)_reuseIdentifier
{
  return @"HSPCNameServiceRow";
}

- (HSPCNameServiceRow)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HSPCNameServiceRow;
  v4 = [(HSPCRow *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HSPCRow *)v4 textField];
    v7 = [v6 textColor];
    objc_storeWeak((id *)&v5->_defaultTextColor, v7);

    id v8 = [objc_alloc((Class)HUIconView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v8 setIconSize:2];
    v9 = [(HSPCNameServiceRow *)v5 contentView];
    [v9 addSubview:v8];

    [(HSPCRow *)v5 setLeftView:v8];
  }
  return v5;
}

- (void)updateConstraints
{
  if (![(HSPCRow *)self constraintsSet])
  {
    v3 = [(HSPCRow *)self leftView];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

    v43 = [(HSPCRow *)self leftView];
    v39 = [v43 leadingAnchor];
    v41 = [(HSPCNameServiceRow *)self contentView];
    v37 = [v41 leadingAnchor];
    +[HSPCRow horizontalLeadingMargin];
    v35 = [v39 constraintEqualToAnchor:v37];
    v47[0] = v35;
    v33 = [(HSPCRow *)self leftView];
    v29 = [v33 centerYAnchor];
    v30 = [(HSPCNameServiceRow *)self contentView];
    v4 = [v30 centerYAnchor];
    v5 = [v29 constraintEqualToAnchor:v4];
    v47[1] = v5;
    v6 = [(HSPCRow *)self leftView];
    v7 = [v6 heightAnchor];
    +[HSPCRow leftImageSize];
    v9 = [v7 constraintEqualToConstant:v8];
    v47[2] = v9;
    v10 = [(HSPCRow *)self leftView];
    objc_super v11 = [v10 widthAnchor];
    +[HSPCRow leftImageSize];
    v12 = [v11 constraintEqualToConstant:];
    v47[3] = v12;
    v13 = +[NSArray arrayWithObjects:v47 count:4];
    +[NSLayoutConstraint activateConstraints:v13];

    v14 = [(HSPCRow *)self textField];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v44 = [(HSPCRow *)self textField];
    v40 = [v44 leadingAnchor];
    v42 = [(HSPCRow *)self leftView];
    v38 = [v42 trailingAnchor];
    +[HSPCRow horizontalSpacing];
    v36 = [v40 constraintEqualToAnchor:v38];
    v46[0] = v36;
    v34 = [(HSPCRow *)self textField];
    v31 = [v34 topAnchor];
    v32 = [(HSPCNameServiceRow *)self contentView];
    v28 = [v32 topAnchor];
    v27 = [v31 constraintEqualToAnchor:v28];
    v46[1] = v27;
    v26 = [(HSPCRow *)self textField];
    v25 = [v26 trailingAnchor];
    v15 = [(HSPCNameServiceRow *)self contentView];
    v16 = [v15 trailingAnchor];
    +[HSPCRow horizontalTrailingMargin];
    v18 = [v25 constraintEqualToAnchor:v16 constant:-v17];
    v46[2] = v18;
    v19 = [(HSPCRow *)self textField];
    v20 = [v19 bottomAnchor];
    v21 = [(HSPCNameServiceRow *)self contentView];
    v22 = [v21 bottomAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    v46[3] = v23;
    v24 = +[NSArray arrayWithObjects:v46 count:4];
    +[NSLayoutConstraint activateConstraints:v24];

    [(HSPCRow *)self setConstraintsSet:1];
  }
  v45.receiver = self;
  v45.super_class = (Class)HSPCNameServiceRow;
  [(HSPCNameServiceRow *)&v45 updateConstraints];
}

- (void)updateUIWithService:(id)a3 suggestedName:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  [(HSPCNameServiceRow *)self setService:v29];
  v7 = [v29 accessory];
  unsigned __int8 v8 = [v7 hf_isTelevision];

  v9 = [v29 hf_effectiveServiceType];
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    v10 = +[HFServiceIconFactory defaultIconDescriptorForServiceType:v9 serviceSubtype:0];
  }
  objc_super v11 = [(HSPCRow *)self textField];
  [v11 setText:v6];

  v12 = [(HSPCRow *)self textField];
  [v12 setPlaceholder:v6];

  objc_opt_class();
  v13 = [(HSPCRow *)self leftView];
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v10 && v15) {
    [v15 updateWithIconDescriptor:v10 displayStyle:1 animated:0];
  }
  v16 = [v29 serviceType];
  unsigned int v17 = [v16 isEqualToString:HMServiceTypeInputSource];

  v18 = [v29 hf_characteristicOfType:HMCharacteristicTypeConfiguredName];
  unsigned __int8 v19 = [v18 hf_isWritable];
  v20 = [(HSPCRow *)self textField];
  v21 = v20;
  if (!v17 || (v19 & 1) != 0)
  {
    [v20 setEnabled:1];

    v27 = [(HSPCNameServiceRow *)self defaultTextColor];
    v28 = [(HSPCRow *)self textField];
    [v28 setTextColor:v27];

    v24 = [(HSPCRow *)self textField];
    v25 = v24;
    uint64_t v26 = 3;
  }
  else
  {
    [v20 setEnabled:0];

    v22 = +[UIColor lightGrayColor];
    v23 = [(HSPCRow *)self textField];
    [v23 setTextColor:v22];

    v24 = [(HSPCRow *)self textField];
    v25 = v24;
    uint64_t v26 = 0;
  }
  [v24 setClearButtonMode:v26];

  [(HSPCNameServiceRow *)self setNeedsUpdateConstraints];
}

- (HMService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (HMService *)WeakRetained;
}

- (void)setService:(id)a3
{
}

- (UIColor)defaultTextColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultTextColor);

  return (UIColor *)WeakRetained;
}

- (void)setDefaultTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_defaultTextColor);

  objc_destroyWeak((id *)&self->_service);
}

@end