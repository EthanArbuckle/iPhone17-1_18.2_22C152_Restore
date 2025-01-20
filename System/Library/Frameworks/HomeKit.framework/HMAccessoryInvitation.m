@interface HMAccessoryInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMAccessoryInvitation)initWithAccessory:(id)a3 identifier:(id)a4 state:(int64_t)a5;
- (HMAccessoryInvitation)initWithCoder:(id)a3;
- (NSUUID)identifier;
- (int64_t)state;
- (void)setAccessory:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation HMAccessoryInvitation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setAccessory:(id)a3
{
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HMAccessory *)WeakRetained;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(HMAccessoryInvitation *)self state];
    uint64_t v7 = [v5 state];
    BOOL v8 = v6 == v7;
    BOOL v9 = v6 != v7;
    if (!v8) {
      self->_state = [v5 state];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HMAccessoryInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMAccessoryInvitation;
  id v5 = [(HMAccessoryInvitation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryInvitationIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    objc_storeWeak((id *)&v5->_accessory, v8);

    v5->_state = (int)[v4 decodeInt32ForKey:@"HM.accessoryInvitationState"];
  }

  return v5;
}

- (HMAccessoryInvitation)initWithAccessory:(id)a3 identifier:(id)a4 state:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessoryInvitation;
  objc_super v10 = [(HMAccessoryInvitation *)&v14 init];
  if (v10)
  {
    if (v9)
    {
      v11 = (NSUUID *)v9;
    }
    else
    {
      v11 = [MEMORY[0x1E4F29128] UUID];
    }
    identifier = v10->_identifier;
    v10->_identifier = v11;

    objc_storeWeak((id *)&v10->_accessory, v8);
    v10->_state = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end