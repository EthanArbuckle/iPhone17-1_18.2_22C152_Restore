@interface HUUserManagementUserCell
- (HUUserManagementUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)displayName;
- (NSString)invitationStatusString;
- (void)layoutSubviews;
- (void)setDisplayName:(id)a3;
- (void)setInvitationStatusString:(id)a3;
@end

@implementation HUUserManagementUserCell

- (HUUserManagementUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUUserManagementUserCell;
  v4 = [(HUUserManagementUserCell *)&v10 initWithStyle:1 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F428B8] labelColor];
    v6 = [(HUUserManagementUserCell *)v4 textLabel];
    [v6 setTextColor:v5];

    v7 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
    v8 = [(HUUserManagementUserCell *)v4 detailTextLabel];
    [v8 setTextColor:v7];

    [(HUUserManagementUserCell *)v4 setAccessoryType:1];
    [(HUUserManagementUserCell *)v4 setSelectionStyle:3];
  }
  return v4;
}

- (void)setDisplayName:(id)a3
{
  v6 = (NSString *)a3;
  if (self->_displayName != v6)
  {
    objc_storeStrong((id *)&self->_displayName, a3);
    v5 = [(HUUserManagementUserCell *)self textLabel];
    [v5 setText:v6];
  }
}

- (void)setInvitationStatusString:(id)a3
{
  v6 = (NSString *)a3;
  if (self->_invitationStatusString != v6)
  {
    objc_storeStrong((id *)&self->_invitationStatusString, a3);
    v5 = [(HUUserManagementUserCell *)self detailTextLabel];
    [v5 setText:v6];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)HUUserManagementUserCell;
  [(HUUserManagementUserCell *)&v13 layoutSubviews];
  v3 = [(HUUserManagementUserCell *)self textLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(HUUserManagementUserCell *)self textLabel];
  objc_msgSend(v12, "setFrame:", v5, v7 + -1.0, v9, v11);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)invitationStatusString
{
  return self->_invitationStatusString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationStatusString, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end