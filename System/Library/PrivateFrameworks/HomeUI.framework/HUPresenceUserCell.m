@interface HUPresenceUserCell
- (BOOL)isChecked;
- (BOOL)isDisabled;
- (BOOL)isLocationUnavailable;
- (CNAvatarViewController)avatarViewController;
- (HFUserHandle)userHandle;
- (HULayoutContainerView)avatarContainerView;
- (HUPresenceUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUTitleDescriptionContentView)titleDescriptionView;
- (NSString)deviceName;
- (NSString)userName;
- (UIImageView)checkmarkImageView;
- (void)_setupConstraints;
- (void)_updateCustomSeparatorInset;
- (void)_updateDescriptionText;
- (void)prepareForReuse;
- (void)setChecked:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setLocationUnavailable:(BOOL)a3;
- (void)setUserHandle:(id)a3;
- (void)setUserName:(id)a3;
@end

@implementation HUPresenceUserCell

- (HUPresenceUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HUPresenceUserCell;
  v7 = [(HUPresenceUserCell *)&v45 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = objc_alloc_init(HUTitleDescriptionContentView);
    titleDescriptionView = v7->_titleDescriptionView;
    v7->_titleDescriptionView = v8;

    [(HUTitleDescriptionContentView *)v7->_titleDescriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(HUPresenceUserCell *)v7 contentView];
    [v10 addSubview:v7->_titleDescriptionView];

    v11 = (void *)MEMORY[0x1E4F1BB50];
    v12 = [MEMORY[0x1E4F69090] defaultStore];
    v13 = [v12 backingStore];
    v14 = [v11 settingsWithContactStore:v13 threeDTouchEnabled:0];

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1BB40]) initWithSettings:v14];
    avatarViewController = v7->_avatarViewController;
    v7->_avatarViewController = (CNAvatarViewController *)v15;

    objc_initWeak(&location, v7);
    v17 = [HULayoutContainerView alloc];
    v18 = [(HUPresenceUserCell *)v7 avatarViewController];
    v19 = [v18 view];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __52__HUPresenceUserCell_initWithStyle_reuseIdentifier___block_invoke;
    v42 = &unk_1E638CC98;
    objc_copyWeak(&v43, &location);
    uint64_t v20 = [(HULayoutContainerView *)v17 initWithContentView:v19 layoutBlock:&v39];
    avatarContainerView = v7->_avatarContainerView;
    v7->_avatarContainerView = (HULayoutContainerView *)v20;

    -[HULayoutContainerView setTranslatesAutoresizingMaskIntoConstraints:](v7->_avatarContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v39, v40, v41, v42);
    v22 = [(HUPresenceUserCell *)v7 contentView];
    [v22 addSubview:v7->_avatarContainerView];

    v23 = objc_opt_new();
    [(HUPresenceUserCell *)v7 setBackgroundView:v23];

    [(HUPresenceUserCell *)v7 bounds];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    v32 = [(HUPresenceUserCell *)v7 backgroundView];
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    v33 = [(HUPresenceUserCell *)v7 backgroundView];
    [v33 setAutoresizingMask:18];

    v34 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    checkmarkImageView = v7->_checkmarkImageView;
    v7->_checkmarkImageView = v34;

    [(UIImageView *)v7->_checkmarkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = [(HUPresenceUserCell *)v7 contentView];
    [v36 addSubview:v7->_checkmarkImageView];

    v37 = [(HUPresenceUserCell *)v7 checkmarkImageView];
    [(UITableViewCell *)v7 hu_configureCheckmarkForImageView:v37 checked:0];

    [(HUPresenceUserCell *)v7 _setupConstraints];
    [(HUPresenceUserCell *)v7 _updateCustomSeparatorInset];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __52__HUPresenceUserCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCustomSeparatorInset];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUPresenceUserCell;
  [(HUPresenceUserCell *)&v3 prepareForReuse];
  [(HUPresenceUserCell *)self setUserName:0];
  [(HUPresenceUserCell *)self setUserHandle:0];
  [(HUPresenceUserCell *)self setDeviceName:0];
  [(HUPresenceUserCell *)self setDisabled:0];
  [(HUPresenceUserCell *)self setChecked:0];
  [(HUPresenceUserCell *)self setLocationUnavailable:0];
}

- (void)setUserName:(id)a3
{
  objc_storeStrong((id *)&self->_userName, a3);
  id v5 = a3;
  id v6 = [(HUPresenceUserCell *)self titleDescriptionView];
  [v6 setTitleText:v5];
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);

  [(HUPresenceUserCell *)self _updateDescriptionText];
}

- (void)setUserHandle:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_userHandle, a3);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F69090] defaultStore];
    v7 = [(HUPresenceUserCell *)self avatarViewController];
    v8 = [v7 descriptorForRequiredKeys];
    v15[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v10 = [v6 contactForUserHandle:v5 withKeys:v9];

    v14 = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v12 = [(HUPresenceUserCell *)self avatarViewController];
    [v12 setContacts:v11];
  }
  else
  {
    v13 = [(HUPresenceUserCell *)self avatarViewController];
    [v13 setContacts:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disabled = a3;
  id v4 = [(HUPresenceUserCell *)self titleDescriptionView];
  [v4 setDisabled:v3];
}

- (void)setLocationUnavailable:(BOOL)a3
{
  self->_locationUnavailable = a3;
  [(HUPresenceUserCell *)self _updateDescriptionText];
}

- (void)_updateDescriptionText
{
  if ([(HUPresenceUserCell *)self isLocationUnavailable]) {
    _HULocalizedStringWithDefaultValue(@"HUPresenceEventUnsupportedUserDescriptionText", @"HUPresenceEventUnsupportedUserDescriptionText", 1);
  }
  else {
  id v4 = [(HUPresenceUserCell *)self deviceName];
  }
  BOOL v3 = [(HUPresenceUserCell *)self titleDescriptionView];
  [v3 setDescriptionText:v4];
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    BOOL v3 = a3;
    self->_checked = a3;
    id v5 = [(HUPresenceUserCell *)self checkmarkImageView];
    [(UITableViewCell *)self hu_configureCheckmarkForImageView:v5 checked:v3];
  }
}

- (void)_setupConstraints
{
  v64[12] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUPresenceUserCell *)self contentView];
  id v4 = [v3 heightAnchor];
  id v5 = [v4 constraintGreaterThanOrEqualToConstant:60.0];

  LODWORD(v6) = 1148829696;
  v63 = v5;
  [v5 setPriority:v6];
  uint64_t v39 = (void *)MEMORY[0x1E4F28DC8];
  v64[0] = v5;
  v62 = [(HUPresenceUserCell *)self checkmarkImageView];
  v59 = [v62 leadingAnchor];
  v61 = [(HUPresenceUserCell *)self contentView];
  v60 = [v61 layoutMarginsGuide];
  v58 = [v60 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:28.0];
  v64[1] = v57;
  v56 = [(HUPresenceUserCell *)self checkmarkImageView];
  v54 = [v56 centerYAnchor];
  v55 = [(HUPresenceUserCell *)self contentView];
  v53 = [v55 layoutMarginsGuide];
  v52 = [v53 centerYAnchor];
  v51 = [v54 constraintEqualToAnchor:v52];
  v64[2] = v51;
  v50 = [(HUPresenceUserCell *)self checkmarkImageView];
  v48 = [v50 heightAnchor];
  v49 = [(HUPresenceUserCell *)self contentView];
  v47 = [v49 heightAnchor];
  v46 = [v48 constraintLessThanOrEqualToAnchor:v47];
  v64[3] = v46;
  objc_super v45 = [(HUPresenceUserCell *)self avatarContainerView];
  id v43 = [v45 leadingAnchor];
  v44 = [(HUPresenceUserCell *)self checkmarkImageView];
  v42 = [v44 trailingAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:15.0];
  v64[4] = v41;
  uint64_t v40 = [(HUPresenceUserCell *)self avatarContainerView];
  v37 = [v40 centerYAnchor];
  v38 = [(HUPresenceUserCell *)self contentView];
  v36 = [v38 centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v64[5] = v35;
  v34 = [(HUPresenceUserCell *)self avatarContainerView];
  v33 = [v34 heightAnchor];
  v32 = [v33 constraintEqualToConstant:37.0];
  v64[6] = v32;
  double v31 = [(HUPresenceUserCell *)self avatarContainerView];
  double v30 = [v31 widthAnchor];
  double v29 = [v30 constraintEqualToConstant:37.0];
  v64[7] = v29;
  double v28 = [(HUPresenceUserCell *)self titleDescriptionView];
  double v26 = [v28 leadingAnchor];
  double v27 = [(HUPresenceUserCell *)self avatarContainerView];
  double v25 = [v27 trailingAnchor];
  double v24 = [v26 constraintEqualToAnchor:v25 constant:12.0];
  v64[8] = v24;
  v23 = [(HUPresenceUserCell *)self titleDescriptionView];
  v21 = [v23 topAnchor];
  v22 = [(HUPresenceUserCell *)self contentView];
  uint64_t v20 = [v22 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v64[9] = v19;
  v18 = [(HUPresenceUserCell *)self titleDescriptionView];
  v17 = [v18 bottomAnchor];
  v7 = [(HUPresenceUserCell *)self contentView];
  v8 = [v7 bottomAnchor];
  v9 = [v17 constraintEqualToAnchor:v8];
  v64[10] = v9;
  v10 = [(HUPresenceUserCell *)self titleDescriptionView];
  v11 = [v10 trailingAnchor];
  v12 = [(HUPresenceUserCell *)self contentView];
  v13 = [v12 readableContentGuide];
  v14 = [v13 trailingAnchor];
  uint64_t v15 = [v11 constraintEqualToAnchor:v14];
  v64[11] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:12];
  [v39 activateConstraints:v16];
}

- (void)_updateCustomSeparatorInset
{
  id v4 = [(HUPresenceUserCell *)self avatarContainerView];
  [v4 frame];
  -[HUPresenceUserCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v3, 0.0, 0.0);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (HFUserHandle)userHandle
{
  return self->_userHandle;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (BOOL)isLocationUnavailable
{
  return self->_locationUnavailable;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (HUTitleDescriptionContentView)titleDescriptionView
{
  return self->_titleDescriptionView;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (HULayoutContainerView)avatarContainerView
{
  return self->_avatarContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarContainerView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_titleDescriptionView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_userName, 0);
}

@end