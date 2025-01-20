@interface HUMediaServiceAccountView
- (BOOL)iconImageLoadingInProgress;
- (HFItem)item;
- (HUMediaServiceAccountView)initWithFrame:(CGRect)a3;
- (NSArray)currentConstraints;
- (UIImageView)iconView;
- (UILabel)accountHandleLabel;
- (UILabel)serviceNameLabel;
- (UIStackView)labelStackView;
- (void)_loadServiceIconImage;
- (void)setAccountHandleLabel:(id)a3;
- (void)setCurrentConstraints:(id)a3;
- (void)setIconImageLoadingInProgress:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setItem:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)setServiceNameLabel:(id)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUMediaServiceAccountView

- (HUMediaServiceAccountView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)HUMediaServiceAccountView;
  v3 = -[HUMediaServiceAccountView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [(HUMediaServiceAccountView *)v3 setIconView:v4];

    v5 = [(HUMediaServiceAccountView *)v3 iconView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HUMediaServiceAccountView *)v3 iconView];
    LODWORD(v7) = 1148846080;
    [v6 setContentHuggingPriority:1 forAxis:v7];

    v8 = [(HUMediaServiceAccountView *)v3 iconView];
    LODWORD(v9) = 1148846080;
    [v8 setContentHuggingPriority:0 forAxis:v9];

    v10 = [(HUMediaServiceAccountView *)v3 iconView];
    v11 = [v10 layer];
    [v11 setCornerRadius:15.0];

    v12 = [(HUMediaServiceAccountView *)v3 iconView];
    [v12 setClipsToBounds:1];

    v13 = [(HUMediaServiceAccountView *)v3 iconView];
    [(HUMediaServiceAccountView *)v3 addSubview:v13];

    v14 = objc_opt_new();
    [(HUMediaServiceAccountView *)v3 setServiceNameLabel:v14];

    v15 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:16.0];
    v16 = [(HUMediaServiceAccountView *)v3 serviceNameLabel];
    [v16 setFont:v15];

    v17 = [(HUMediaServiceAccountView *)v3 serviceNameLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = objc_opt_new();
    [(HUMediaServiceAccountView *)v3 setAccountHandleLabel:v18];

    v19 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
    v20 = [(HUMediaServiceAccountView *)v3 accountHandleLabel];
    [v20 setFont:v19];

    v21 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v22 = [(HUMediaServiceAccountView *)v3 accountHandleLabel];
    [v22 setTextColor:v21];

    v23 = [(HUMediaServiceAccountView *)v3 accountHandleLabel];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = objc_opt_new();
    [(HUMediaServiceAccountView *)v3 setLabelStackView:v24];

    v25 = [(HUMediaServiceAccountView *)v3 labelStackView];
    [v25 setAxis:1];

    v26 = [(HUMediaServiceAccountView *)v3 labelStackView];
    [v26 setAlignment:1];

    v27 = [(HUMediaServiceAccountView *)v3 labelStackView];
    [v27 setSpacing:4.0];

    v28 = [(HUMediaServiceAccountView *)v3 labelStackView];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    v29 = [(HUMediaServiceAccountView *)v3 labelStackView];
    v30 = [(HUMediaServiceAccountView *)v3 serviceNameLabel];
    [v29 addArrangedSubview:v30];

    v31 = [(HUMediaServiceAccountView *)v3 labelStackView];
    v32 = [(HUMediaServiceAccountView *)v3 accountHandleLabel];
    [v31 addArrangedSubview:v32];

    v33 = [(HUMediaServiceAccountView *)v3 labelStackView];
    [(HUMediaServiceAccountView *)v3 addSubview:v33];

    [(HUMediaServiceAccountView *)v3 setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)updateConstraints
{
  v3 = objc_opt_new();
  v4 = [(HUMediaServiceAccountView *)self iconView];
  v5 = [v4 topAnchor];
  v6 = [(HUMediaServiceAccountView *)self topAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  v8 = [(HUMediaServiceAccountView *)self iconView];
  double v9 = [v8 leadingAnchor];
  v10 = [(HUMediaServiceAccountView *)self leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:8.0];
  [v3 addObject:v11];

  v12 = [(HUMediaServiceAccountView *)self iconView];
  v13 = [v12 centerYAnchor];
  v14 = [(HUMediaServiceAccountView *)self centerYAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [(HUMediaServiceAccountView *)self iconView];
  v17 = [v16 heightAnchor];
  v18 = [v17 constraintEqualToConstant:56.0];
  [v3 addObject:v18];

  v19 = [(HUMediaServiceAccountView *)self iconView];
  v20 = [v19 widthAnchor];
  v21 = [v20 constraintEqualToConstant:56.0];
  [v3 addObject:v21];

  v22 = [(HUMediaServiceAccountView *)self labelStackView];
  v23 = [v22 centerYAnchor];
  v24 = [(HUMediaServiceAccountView *)self iconView];
  v25 = [v24 centerYAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v3 addObject:v26];

  v27 = [(HUMediaServiceAccountView *)self labelStackView];
  v28 = [v27 leadingAnchor];
  v29 = [(HUMediaServiceAccountView *)self iconView];
  v30 = [v29 trailingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:15.0];
  [v3 addObject:v31];

  v32 = (void *)MEMORY[0x1E4F28DC8];
  v33 = [(HUMediaServiceAccountView *)self currentConstraints];
  [v32 deactivateConstraints:v33];

  [(HUMediaServiceAccountView *)self setCurrentConstraints:v3];
  v34 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v35 = [(HUMediaServiceAccountView *)self currentConstraints];
  [v34 activateConstraints:v35];

  v36.receiver = self;
  v36.super_class = (Class)HUMediaServiceAccountView;
  [(HUMediaServiceAccountView *)&v36 updateConstraints];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = [(HUMediaServiceAccountView *)self item];
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    id v8 = v5;
    if (v7) {
      goto LABEL_8;
    }
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
  }
  id v8 = 0;
LABEL_8:
  id v17 = v8;

  v11 = [v17 mediaService];
  v12 = [v11 serviceName];
  v13 = [(HUMediaServiceAccountView *)self serviceNameLabel];
  [v13 setText:v12];

  v14 = [v17 mediaService];
  v15 = [v14 accountName];
  v16 = [(HUMediaServiceAccountView *)self accountHandleLabel];
  [v16 setText:v15];

  [(HUMediaServiceAccountView *)self _loadServiceIconImage];
  [(HUMediaServiceAccountView *)self setNeedsUpdateConstraints];
}

- (void)_loadServiceIconImage
{
  if (![(HUMediaServiceAccountView *)self iconImageLoadingInProgress])
  {
    [(HUMediaServiceAccountView *)self setIconImageLoadingInProgress:1];
    uint64_t v3 = objc_opt_class();
    id v4 = [(HUMediaServiceAccountView *)self item];
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
      v6 = v4;
      if (v5) {
        goto LABEL_9;
      }
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
    }
    v6 = 0;
LABEL_9:

    double v9 = [v6 mediaService];
    v10 = [v9 iconImageURL];

    v11 = objc_msgSend(MEMORY[0x1E4F42A80], "hf_fetchImageFromURL:", v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__HUMediaServiceAccountView__loadServiceIconImage__block_invoke;
    v13[3] = &unk_1E638B108;
    v13[4] = self;
    id v12 = (id)[v11 addCompletionBlock:v13];
  }
}

void __50__HUMediaServiceAccountView__loadServiceIconImage__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    id v5 = HUIconImageNamed();
    v6 = [*(id *)(a1 + 32) iconView];
    [v6 setImage:v5];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) iconView];
    [v5 setImage:v7];
  }

  [*(id *)(a1 + 32) setIconImageLoadingInProgress:0];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)serviceNameLabel
{
  return self->_serviceNameLabel;
}

- (void)setServiceNameLabel:(id)a3
{
}

- (UILabel)accountHandleLabel
{
  return self->_accountHandleLabel;
}

- (void)setAccountHandleLabel:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (BOOL)iconImageLoadingInProgress
{
  return self->_iconImageLoadingInProgress;
}

- (void)setIconImageLoadingInProgress:(BOOL)a3
{
  self->_iconImageLoadingInProgress = a3;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_accountHandleLabel, 0);
  objc_storeStrong((id *)&self->_serviceNameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end