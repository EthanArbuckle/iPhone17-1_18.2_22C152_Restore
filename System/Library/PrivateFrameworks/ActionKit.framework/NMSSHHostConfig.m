@interface NMSSHHostConfig
- (NMSSHHostConfig)init;
- (NSArray)hostPatterns;
- (NSArray)identityFiles;
- (NSNumber)port;
- (NSString)hostname;
- (NSString)user;
- (id)arrayByRemovingDuplicateElementsFromArray:(id)a3;
- (id)mergedArray:(id)a3 withArray:(id)a4;
- (void)mergeFrom:(id)a3;
- (void)setHostPatterns:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIdentityFiles:(id)a3;
- (void)setPort:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation NMSSHHostConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityFiles, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_hostPatterns, 0);
}

- (void)setIdentityFiles:(id)a3
{
}

- (NSArray)identityFiles
{
  return self->_identityFiles;
}

- (void)setPort:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setUser:(id)a3
{
}

- (NSString)user
{
  return self->_user;
}

- (void)setHostname:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostPatterns:(id)a3
{
}

- (NSArray)hostPatterns
{
  return self->_hostPatterns;
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  v4 = [(NMSSHHostConfig *)self hostPatterns];
  v5 = [v16 hostPatterns];
  v6 = [(NMSSHHostConfig *)self mergedArray:v4 withArray:v5];
  [(NMSSHHostConfig *)self setHostPatterns:v6];

  v7 = [(NMSSHHostConfig *)self hostname];

  if (!v7)
  {
    v8 = [v16 hostname];
    [(NMSSHHostConfig *)self setHostname:v8];
  }
  v9 = [(NMSSHHostConfig *)self user];

  if (!v9)
  {
    v10 = [v16 user];
    [(NMSSHHostConfig *)self setUser:v10];
  }
  v11 = [(NMSSHHostConfig *)self port];

  if (!v11)
  {
    v12 = [v16 port];
    [(NMSSHHostConfig *)self setPort:v12];
  }
  v13 = [(NMSSHHostConfig *)self identityFiles];
  v14 = [v16 identityFiles];
  v15 = [(NMSSHHostConfig *)self mergedArray:v13 withArray:v14];
  [(NMSSHHostConfig *)self setIdentityFiles:v15];
}

- (id)mergedArray:(id)a3 withArray:(id)a4
{
  v5 = [a3 arrayByAddingObjectsFromArray:a4];
  v6 = [(NMSSHHostConfig *)self arrayByRemovingDuplicateElementsFromArray:v5];

  return v6;
}

- (id)arrayByRemovingDuplicateElementsFromArray:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v10, (void)v13) & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

- (NMSSHHostConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSSHHostConfig;
  v2 = [(NMSSHHostConfig *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x263EFFA68];
    [(NMSSHHostConfig *)v2 setHostPatterns:MEMORY[0x263EFFA68]];
    [(NMSSHHostConfig *)v3 setIdentityFiles:v4];
  }
  return v3;
}

@end