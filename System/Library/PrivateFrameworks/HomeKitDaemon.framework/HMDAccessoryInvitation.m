@interface HMDAccessoryInvitation
+ (BOOL)supportsSecureCoding;
- (HMDAccessory)accessory;
- (HMDAccessoryInvitation)initWithAccessory:(id)a3 identifier:(id)a4 state:(int64_t)a5;
- (HMDAccessoryInvitation)initWithCoder:(id)a3;
- (NSUUID)identifier;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccessoryInvitation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)state
{
  return self->_state;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(HMDAccessoryInvitation *)self identifier];
  [v6 encodeObject:v4 forKey:@"HM.accessoryInvitationIdentifier"];

  v5 = [(HMDAccessoryInvitation *)self accessory];
  [v6 encodeConditionalObject:v5 forKey:@"accessory"];

  objc_msgSend(v6, "encodeInt32:forKey:", -[HMDAccessoryInvitation state](self, "state"), @"HM.accessoryInvitationState");
}

- (HMDAccessoryInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryInvitation;
  v5 = [(HMDAccessoryInvitation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryInvitationIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
    objc_storeWeak((id *)&v5->_accessory, v8);

    v5->_state = (int)[v4 decodeInt32ForKey:@"HM.accessoryInvitationState"];
  }

  return v5;
}

- (HMDAccessoryInvitation)initWithAccessory:(id)a3 identifier:(id)a4 state:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryInvitation;
  objc_super v10 = [(HMDAccessoryInvitation *)&v13 init];
  if (v10)
  {
    v11 = v9;
    if (!v9)
    {
      v11 = [MEMORY[0x263F08C38] UUID];
    }
    objc_storeStrong((id *)&v10->_identifier, v11);
    if (!v9) {

    }
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