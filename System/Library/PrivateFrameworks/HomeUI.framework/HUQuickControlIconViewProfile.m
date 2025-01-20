@interface HUQuickControlIconViewProfile
- (HFIconDescriptor)iconDescriptor;
- (NSString)statusString;
- (NSString)supplementaryString;
- (UIColor)statusTextColor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setStatusString:(id)a3;
- (void)setStatusTextColor:(id)a3;
- (void)setSupplementaryString:(id)a3;
@end

@implementation HUQuickControlIconViewProfile

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlIconViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v10 copyWithZone:a3];
  v5 = [(HUQuickControlIconViewProfile *)self statusString];
  [v4 setStatusString:v5];

  v6 = [(HUQuickControlIconViewProfile *)self statusTextColor];
  [v4 setStatusTextColor:v6];

  v7 = [(HUQuickControlIconViewProfile *)self supplementaryString];
  [v4 setSupplementaryString:v7];

  v8 = [(HUQuickControlIconViewProfile *)self iconDescriptor];
  [v4 setIconDescriptor:v8];

  return v4;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
}

- (UIColor)statusTextColor
{
  return self->_statusTextColor;
}

- (void)setStatusTextColor:(id)a3
{
}

- (NSString)supplementaryString
{
  return self->_supplementaryString;
}

- (void)setSupplementaryString:(id)a3
{
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_supplementaryString, 0);
  objc_storeStrong((id *)&self->_statusTextColor, 0);

  objc_storeStrong((id *)&self->_statusString, 0);
}

@end