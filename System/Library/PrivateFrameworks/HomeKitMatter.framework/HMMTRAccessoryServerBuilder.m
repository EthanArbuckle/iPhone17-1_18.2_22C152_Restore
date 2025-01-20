@interface HMMTRAccessoryServerBuilder
- (HMMTRAccessoryServer)accessoryServer;
- (HMMTRAccessoryServerBuilder)initWithKeystore:(id)a3 browser:(id)a4;
- (id)addService:(id)a3;
- (id)build;
- (id)category:(id)a3;
- (id)discriminator:(id)a3;
- (id)identifier:(id)a3;
- (id)manufacturer:(id)a3;
- (id)model:(id)a3;
- (id)name:(id)a3;
- (id)nodeID:(id)a3;
- (id)productID:(id)a3;
- (id)productName:(id)a3;
- (id)serialNumber:(id)a3;
- (id)setUpPinCode:(id)a3;
- (id)vendorID:(id)a3;
- (id)vendorName:(id)a3;
- (void)setAccessoryServer:(id)a3;
@end

@implementation HMMTRAccessoryServerBuilder

- (void).cxx_destruct
{
}

- (void)setAccessoryServer:(id)a3
{
}

- (HMMTRAccessoryServer)accessoryServer
{
  return self->_accessoryServer;
}

- (id)build
{
  return self->_accessoryServer;
}

- (id)addService:(id)a3
{
  accessoryServer = self->_accessoryServer;
  id v5 = a3;
  v6 = [(HMMTRAccessoryServer *)accessoryServer primaryAccessory];
  [v5 setAccessory:v6];

  v7 = [(HMMTRAccessoryServer *)self->_accessoryServer primaryAccessory];
  v8 = [v7 services];

  v9 = [MEMORY[0x263EFF980] arrayWithObject:v5];

  [v9 addObjectsFromArray:v8];
  v10 = [(HMMTRAccessoryServer *)self->_accessoryServer primaryAccessory];
  [v10 setServices:v9];

  return self;
}

- (id)productName:(id)a3
{
  return self;
}

- (id)vendorName:(id)a3
{
  return self;
}

- (id)productID:(id)a3
{
  return self;
}

- (id)vendorID:(id)a3
{
  return self;
}

- (id)discriminator:(id)a3
{
  return self;
}

- (id)setUpPinCode:(id)a3
{
  return self;
}

- (id)serialNumber:(id)a3
{
  accessoryServer = self->_accessoryServer;
  id v5 = a3;
  v6 = [(HMMTRAccessoryServer *)accessoryServer primaryAccessory];
  [v6 setSerialNumber:v5];

  return self;
}

- (id)model:(id)a3
{
  accessoryServer = self->_accessoryServer;
  id v5 = a3;
  v6 = [(HMMTRAccessoryServer *)accessoryServer primaryAccessory];
  [v6 setModel:v5];

  return self;
}

- (id)manufacturer:(id)a3
{
  accessoryServer = self->_accessoryServer;
  id v5 = a3;
  v6 = [(HMMTRAccessoryServer *)accessoryServer primaryAccessory];
  [v6 setManufacturer:v5];

  return self;
}

- (id)category:(id)a3
{
  return self;
}

- (id)identifier:(id)a3
{
  accessoryServer = self->_accessoryServer;
  id v5 = a3;
  [(HAPAccessoryServer *)accessoryServer setIdentifier:v5];
  v6 = [(HMMTRAccessoryServer *)self->_accessoryServer primaryAccessory];
  [v6 setIdentifier:v5];

  v7 = [(HMMTRAccessoryServer *)self->_accessoryServer primaryAccessory];
  [v7 setServerIdentifier:v5];

  return self;
}

- (id)nodeID:(id)a3
{
  return self;
}

- (id)name:(id)a3
{
  accessoryServer = self->_accessoryServer;
  id v5 = a3;
  [(HAPAccessoryServer *)accessoryServer setName:v5];
  v6 = [(HMMTRAccessoryServer *)self->_accessoryServer primaryAccessory];
  [v6 setName:v5];

  return self;
}

- (HMMTRAccessoryServerBuilder)initWithKeystore:(id)a3 browser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRAccessoryServerBuilder;
  v8 = [(HMMTRAccessoryServerBuilder *)&v16 init];
  if (v8)
  {
    v9 = [[HMMTRAccessoryServer alloc] initWithKeystore:v6 browser:v7];
    accessoryServer = v8->_accessoryServer;
    v8->_accessoryServer = v9;

    id v11 = objc_alloc(MEMORY[0x263F35860]);
    v12 = v8->_accessoryServer;
    v13 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x263F35B60]];
    v14 = (void *)[v11 initWithServer:v12 instanceID:v13];
    [(HMMTRAccessoryServer *)v8->_accessoryServer setPrimaryAccessory:v14];
  }
  return v8;
}

@end