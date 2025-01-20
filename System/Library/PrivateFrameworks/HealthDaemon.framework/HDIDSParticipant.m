@interface HDIDSParticipant
- (HDIDSParticipant)init;
- (HDIDSParticipant)initWithDevice:(id)a3;
- (HDIDSParticipant)initWithIdentifier:(id)a3;
- (IDSDevice)device;
- (NSString)destinationIdentifier;
- (NSString)deviceIdentifier;
- (id)description;
@end

@implementation HDIDSParticipant

- (HDIDSParticipant)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDIDSParticipant)initWithDevice:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDIDSParticipant;
  v6 = [(HDIDSParticipant *)&v12 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v5, "hd_destinationIdentifier");
    destinationIdentifier = v6->_destinationIdentifier;
    v6->_destinationIdentifier = (NSString *)v7;

    uint64_t v9 = objc_msgSend(v5, "hd_deviceIdentifier");
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v6;
}

- (HDIDSParticipant)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDIDSParticipant;
  id v5 = [(HDIDSParticipant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    destinationIdentifier = v5->_destinationIdentifier;
    v5->_destinationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 copy];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  device = self->_device;
  if (device)
  {
    id v4 = [(IDSDevice *)device hd_shortDescription];
  }
  else
  {
    id v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v4 = [v5 stringWithFormat:@"<%@:%p destinationIdentifier=%@", v7, self, self->_destinationIdentifier];
  }

  return v4;
}

- (IDSDevice)device
{
  return self->_device;
}

- (NSString)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_destinationIdentifier, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end