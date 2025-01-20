@interface HMMTRPairingWindowInfoTableEntry
- (HMMTRAccessoryServer)accessoryServer;
- (HMMTRPairingWindowInfoTableEntry)initWithAccessoryServer:(id)a3 expirationDate:(id)a4;
- (NSDate)expirationDate;
@end

@implementation HMMTRPairingWindowInfoTableEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HMMTRAccessoryServer)accessoryServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryServer);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (HMMTRPairingWindowInfoTableEntry)initWithAccessoryServer:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMTRPairingWindowInfoTableEntry;
  v8 = [(HMMTRPairingWindowInfoTableEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessoryServer, v6);
    objc_storeStrong((id *)&v9->_expirationDate, a4);
  }

  return v9;
}

@end