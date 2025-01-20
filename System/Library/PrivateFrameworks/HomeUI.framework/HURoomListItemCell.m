@interface HURoomListItemCell
+ (BOOL)requiresConstraintBasedLayout;
- (HFIconDescriptor)roomIconDescriptor;
- (HURoomListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)roomName;
- (UILabel)nameLabel;
- (void)prepareForReuse;
- (void)setRoomIconDescriptor:(id)a3;
- (void)setRoomName:(id)a3;
@end

@implementation HURoomListItemCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HURoomListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v40[5] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)HURoomListItemCell;
  v4 = [(HURoomListItemCell *)&v39 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v5;

    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v4->_nameLabel setFont:v7];

    v8 = [(HURoomListItemCell *)v4 contentView];
    [v8 addSubview:v4->_nameLabel];

    v27 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(HURoomListItemCell *)v4 contentView];
    v37 = [v38 heightAnchor];
    v36 = [v37 constraintGreaterThanOrEqualToConstant:44.0];
    v40[0] = v36;
    v35 = [(HURoomListItemCell *)v4 nameLabel];
    v33 = [v35 leadingAnchor];
    v34 = [(HURoomListItemCell *)v4 contentView];
    v32 = [v34 layoutMarginsGuide];
    v31 = [v32 leadingAnchor];
    v30 = [v33 constraintEqualToAnchor:v31];
    v40[1] = v30;
    v29 = [(HURoomListItemCell *)v4 nameLabel];
    v26 = [v29 trailingAnchor];
    v28 = [(HURoomListItemCell *)v4 contentView];
    v25 = [v28 layoutMarginsGuide];
    v24 = [v25 trailingAnchor];
    v23 = [v26 constraintEqualToAnchor:v24];
    v40[2] = v23;
    v22 = [(HURoomListItemCell *)v4 nameLabel];
    v20 = [v22 centerYAnchor];
    v21 = [(HURoomListItemCell *)v4 contentView];
    v19 = [v21 layoutMarginsGuide];
    v9 = [v19 centerYAnchor];
    v10 = [v20 constraintEqualToAnchor:v9];
    v40[3] = v10;
    v11 = [(HURoomListItemCell *)v4 nameLabel];
    v12 = [v11 heightAnchor];
    v13 = [(HURoomListItemCell *)v4 contentView];
    v14 = [v13 layoutMarginsGuide];
    v15 = [v14 heightAnchor];
    v16 = [v12 constraintEqualToAnchor:v15];
    v40[4] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
    [v27 activateConstraints:v17];
  }
  return v4;
}

- (void)prepareForReuse
{
  [(HURoomListItemCell *)self setRoomName:0];
  v3.receiver = self;
  v3.super_class = (Class)HURoomListItemCell;
  [(HURoomListItemCell *)&v3 prepareForReuse];
}

- (NSString)roomName
{
  v2 = [(HURoomListItemCell *)self nameLabel];
  objc_super v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setRoomName:(id)a3
{
  id v4 = a3;
  id v5 = [(HURoomListItemCell *)self nameLabel];
  [v5 setText:v4];
}

- (HFIconDescriptor)roomIconDescriptor
{
  return self->_roomIconDescriptor;
}

- (void)setRoomIconDescriptor:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_roomIconDescriptor, 0);
}

@end