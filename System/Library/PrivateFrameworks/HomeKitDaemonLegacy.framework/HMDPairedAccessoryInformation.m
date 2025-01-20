@interface HMDPairedAccessoryInformation
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryBrowserDelegate)delegate;
- (HMDPairedAccessoryInformation)init;
- (HMDPairedAccessoryInformation)initWithIdentifier:(id)a3 transports:(unint64_t)a4 setupHash:(id)a5 delegate:(id)a6;
- (NSData)setupHash;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)transports;
@end

@implementation HMDPairedAccessoryInformation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMDPairedAccessoryInformation)initWithIdentifier:(id)a3 transports:(unint64_t)a4 setupHash:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDPairedAccessoryInformation;
  v13 = [(HMDPairedAccessoryInformation *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_transports = a4;
    uint64_t v16 = [v11 copy];
    setupHash = v13->_setupHash;
    v13->_setupHash = (NSData *)v16;

    objc_storeWeak((id *)&v13->_delegate, v12);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDPairedAccessoryInformation *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      v8 = [(HMDPairedAccessoryInformation *)v6 identifier];
      v9 = [(HMDPairedAccessoryInformation *)self identifier];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)transports
{
  return self->_transports;
}

- (HMDAccessoryBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessoryBrowserDelegate *)WeakRetained;
}

- (NSData)setupHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDPairedAccessoryInformation *)self identifier];
  v5 = [(HMDPairedAccessoryInformation *)self setupHash];
  v6 = [v3 stringWithFormat:@"Identifier: %@, setupHash: %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(HMDPairedAccessoryInformation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDPairedAccessoryInformation)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end