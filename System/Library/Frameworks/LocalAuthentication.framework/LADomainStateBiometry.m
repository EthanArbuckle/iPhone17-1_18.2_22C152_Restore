@interface LADomainStateBiometry
- (LADomainStateBiometry)initWithResult:(id)a3;
- (NSData)stateHash;
- (id)description;
- (int64_t)biometryType;
@end

@implementation LADomainStateBiometry

- (LADomainStateBiometry)initWithResult:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LADomainStateBiometry;
  v5 = [(LADomainStateBiometry *)&v28 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F72E48]];
    id v23 = v4;
    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F72E58]];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v16 = [v10 objectForKeyedSubscript:v15];
          int v17 = [v16 BOOLValue];

          if (v17)
          {
            v5->_biometryType = [v15 integerValue];
            v18 = (void *)MEMORY[0x1E4F72F50];
            v19 = [v9 objectForKeyedSubscript:v15];
            uint64_t v20 = [v18 saltHash:v19 withBundleID:v7];

            stateHash = v5->_stateHash;
            v5->_stateHash = (NSData *)v20;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    id v4 = v23;
  }

  return v5;
}

- (id)description
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSString;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[LADomainStateBiometry biometryType](self, "biometryType"));
  v7 = [v5 stringWithFormat:@"biometryType: %@", v6];
  v15[0] = v7;
  v8 = NSString;
  v9 = [(LADomainStateBiometry *)self stateHash];
  id v10 = [v8 stringWithFormat:@"stateHash: %@", v9];
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v12 = [v11 componentsJoinedByString:@"; "];
  uint64_t v13 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];

  return v13;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void).cxx_destruct
{
}

@end