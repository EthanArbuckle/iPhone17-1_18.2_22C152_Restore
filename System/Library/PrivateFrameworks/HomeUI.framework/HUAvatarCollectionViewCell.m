@interface HUAvatarCollectionViewCell
- (BOOL)showAccessLevelDescription;
- (CNAvatarViewController)avatarViewController;
- (HFItem)item;
- (HFUserHandle)userHandle;
- (HUAvatarCollectionViewCell)initWithFrame:(CGRect)a3;
- (HUAvatarContentView)avatarContentView;
- (NSString)description;
- (UIView)avatarView;
- (double)avatarSize;
- (id)contentConfiguration;
- (void)_setupConstraints;
- (void)prepareForReuse;
- (void)setAvatarContentView:(id)a3;
- (void)setAvatarSize:(double)a3;
- (void)setContentConfiguration:(id)a3;
- (void)setItem:(id)a3;
- (void)setShowAccessLevelDescription:(BOOL)a3;
- (void)setUserHandle:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUAvatarCollectionViewCell

- (HUAvatarCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUAvatarCollectionViewCell;
  v3 = -[HUAvatarCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [HUAvatarContentView alloc];
    v5 = [MEMORY[0x1E4F42B58] cellConfiguration];
    uint64_t v6 = [(HUAvatarContentView *)v4 initWithConfiguration:v5];
    avatarContentView = v3->_avatarContentView;
    v3->_avatarContentView = (HUAvatarContentView *)v6;

    v8 = [(HUAvatarCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_avatarContentView];

    v3->_showAccessLevelDescription = 0;
    uint64_t v9 = [(HUAvatarCollectionViewCell *)v3 defaultContentConfiguration];
    contentConfiguration = v3->_contentConfiguration;
    v3->_contentConfiguration = (UIContentConfiguration *)v9;

    [(HUAvatarCollectionViewCell *)v3 _setupConstraints];
  }
  return v3;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  v4 = [(HUAvatarCollectionViewCell *)self userHandle];
  v5 = [v4 userID];
  [v3 appendString:v5 withName:@"userHandle"];

  uint64_t v6 = [(HUAvatarCollectionViewCell *)self item];
  id v7 = (id)[v3 appendObject:v6 withName:@"item"];

  v8 = [v3 build];

  return (NSString *)v8;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HUAvatarCollectionViewCell;
  [(HUAvatarCollectionViewCell *)&v5 prepareForReuse];
  [(HUAvatarCollectionViewCell *)self setUserHandle:0];
  v3 = [(HUAvatarCollectionViewCell *)self defaultContentConfiguration];
  v4 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  [v4 setConfiguration:v3];
}

- (HFUserHandle)userHandle
{
  v2 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  v3 = [v2 userHandle];

  return (HFUserHandle *)v3;
}

- (void)setUserHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  [v5 setUserHandle:v4];
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  id v4 = [(HUAvatarCollectionViewCell *)self item];
  id v9 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v4];

  id v5 = [(HUAvatarCollectionViewCell *)self item];
  uint64_t v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AD8]];

  if ([(HUAvatarCollectionViewCell *)self showAccessLevelDescription] && v7) {
    [v9 setSecondaryText:v7];
  }
  v8 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  [v8 setConfiguration:v9];
}

- (void)setContentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contentConfiguration, a3);
  id v5 = a3;
  id v6 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  [v6 setConfiguration:v5];
}

- (void)setAvatarSize:(double)a3
{
  self->_avatarSize = a3;
  id v4 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  [v4 setAvatarSize:a3];
}

- (void)_setupConstraints
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v3 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  v23 = [v25 leadingAnchor];
  v24 = [(HUAvatarCollectionViewCell *)self contentView];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v20 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  v18 = [v20 trailingAnchor];
  v19 = [(HUAvatarCollectionViewCell *)self contentView];
  v17 = [v19 trailingAnchor];
  v15 = [v18 constraintEqualToAnchor:v17];
  v26[1] = v15;
  v14 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  id v4 = [v14 topAnchor];
  id v5 = [(HUAvatarCollectionViewCell *)self contentView];
  id v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  v26[2] = v7;
  v8 = [(HUAvatarCollectionViewCell *)self avatarContentView];
  id v9 = [v8 bottomAnchor];
  v10 = [(HUAvatarCollectionViewCell *)self contentView];
  v11 = [v10 bottomAnchor];
  objc_super v12 = [v9 constraintEqualToAnchor:v11];
  v26[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
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

- (HUAvatarContentView)avatarContentView
{
  return self->_avatarContentView;
}

- (void)setAvatarContentView:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_avatarContentView, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end