@interface HUAvatarTableViewCell
- (BOOL)showAccessLevelDescription;
- (CNAvatarViewController)avatarViewController;
- (HFItem)item;
- (HFUserHandle)userHandle;
- (HUAvatarContentView)avatarContentView;
- (HUAvatarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)description;
- (UIView)avatarView;
- (double)avatarSize;
- (id)contentConfiguration;
- (void)_setupConstraints;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAvatarContentView:(id)a3;
- (void)setAvatarSize:(double)a3;
- (void)setContentConfiguration:(id)a3;
- (void)setItem:(id)a3;
- (void)setShowAccessLevelDescription:(BOOL)a3;
- (void)setUserHandle:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUAvatarTableViewCell

- (HUAvatarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HUAvatarTableViewCell;
  v4 = [(HUAvatarTableViewCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [HUAvatarContentView alloc];
    v6 = [MEMORY[0x1E4F42B58] cellConfiguration];
    uint64_t v7 = [(HUAvatarContentView *)v5 initWithConfiguration:v6];
    avatarContentView = v4->_avatarContentView;
    v4->_avatarContentView = (HUAvatarContentView *)v7;

    v9 = [(HUAvatarTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_avatarContentView];

    v4->_showAccessLevelDescription = 0;
    uint64_t v10 = [(HUAvatarTableViewCell *)v4 defaultContentConfiguration];
    contentConfiguration = v4->_contentConfiguration;
    v4->_contentConfiguration = (UIContentConfiguration *)v10;

    [(HUAvatarTableViewCell *)v4 _setupConstraints];
  }
  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  v4 = [(HUAvatarTableViewCell *)self userHandle];
  v5 = [v4 userID];
  [v3 appendString:v5 withName:@"userHandle"];

  v6 = [(HUAvatarTableViewCell *)self item];
  id v7 = (id)[v3 appendObject:v6 withName:@"item"];

  v8 = [v3 build];

  return (NSString *)v8;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUAvatarTableViewCell;
  [(HUAvatarTableViewCell *)&v5 prepareForReuse];
  [(HUAvatarTableViewCell *)self setUserHandle:0];
  v3 = [(HUAvatarTableViewCell *)self defaultContentConfiguration];
  v4 = [(HUAvatarTableViewCell *)self avatarContentView];
  [v4 setConfiguration:v3];
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)HUAvatarTableViewCell;
  [(HUAvatarTableViewCell *)&v22 layoutSubviews];
  uint64_t v3 = [(HUAvatarTableViewCell *)self effectiveUserInterfaceLayoutDirection];
  v4 = [(HUAvatarTableViewCell *)self avatarContentView];
  objc_super v5 = [v4 listContentView];
  v6 = [v5 textLayoutGuide];
  [v6 layoutFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(HUAvatarTableViewCell *)self avatarContentView];
  v16 = [v15 listContentView];
  -[HUAvatarTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v16, v8, v10, v12, v14);
  double v18 = v17;
  double v20 = v19;

  if (v3 == 1)
  {
    [(HUAvatarTableViewCell *)self bounds];
    double v18 = v21 - (v18 + v20);
  }
  -[HUAvatarTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v18, 0.0, 0.0);
}

- (HFUserHandle)userHandle
{
  v2 = [(HUAvatarTableViewCell *)self avatarContentView];
  uint64_t v3 = [v2 userHandle];

  return (HFUserHandle *)v3;
}

- (void)setUserHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvatarTableViewCell *)self avatarContentView];
  [v5 setUserHandle:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  id v4 = [(HUAvatarTableViewCell *)self defaultContentConfiguration];
  id v5 = [(HUAvatarTableViewCell *)self item];
  id v9 = +[HUListContentConfigurationUtilities labelConfiguration:v4 forItem:v5];

  v6 = [(HUAvatarTableViewCell *)self item];
  double v7 = [v6 latestResults];
  double v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AD8]];

  if ([(HUAvatarTableViewCell *)self showAccessLevelDescription] && v8) {
    [v9 setSecondaryText:v8];
  }
  [(HUAvatarTableViewCell *)self setContentConfiguration:v9];
}

- (void)setContentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contentConfiguration, a3);
  id v5 = a3;
  id v6 = [(HUAvatarTableViewCell *)self avatarContentView];
  [v6 setConfiguration:v5];
}

- (void)setAvatarSize:(double)a3
{
  self->_avatarSize = a3;
  id v4 = [(HUAvatarTableViewCell *)self avatarContentView];
  [v4 setAvatarSize:a3];
}

- (void)_setupConstraints
{
  v26[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAvatarTableViewCell *)self avatarContentView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [(HUAvatarTableViewCell *)self avatarContentView];
  v23 = [v25 leadingAnchor];
  v24 = [(HUAvatarTableViewCell *)self contentView];
  objc_super v22 = [v24 leadingAnchor];
  double v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  double v20 = [(HUAvatarTableViewCell *)self avatarContentView];
  double v18 = [v20 trailingAnchor];
  double v19 = [(HUAvatarTableViewCell *)self contentView];
  double v17 = [v19 trailingAnchor];
  v15 = [v18 constraintEqualToAnchor:v17];
  v26[1] = v15;
  double v14 = [(HUAvatarTableViewCell *)self avatarContentView];
  id v4 = [v14 topAnchor];
  id v5 = [(HUAvatarTableViewCell *)self contentView];
  id v6 = [v5 topAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  v26[2] = v7;
  double v8 = [(HUAvatarTableViewCell *)self avatarContentView];
  id v9 = [v8 bottomAnchor];
  double v10 = [(HUAvatarTableViewCell *)self contentView];
  double v11 = [v10 bottomAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];
  v26[3] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  [v16 activateConstraints:v13];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (id)contentConfiguration
{
  return self->_contentConfiguration;
}

- (double)avatarSize
{
  return self->_avatarSize;
}

- (BOOL)showAccessLevelDescription
{
  return self->_showAccessLevelDescription;
}

- (void)setShowAccessLevelDescription:(BOOL)a3
{
  self->_showAccessLevelDescription = a3;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (HUAvatarContentView)avatarContentView
{
  return self->_avatarContentView;
}

- (void)setAvatarContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarContentView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end