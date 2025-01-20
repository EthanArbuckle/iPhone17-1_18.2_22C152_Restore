@interface HMDWatchSync
- (BOOL)inProgress;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRetry;
- (HMDWatchSync)initWithIdentifier:(id)a3 syncOption:(unint64_t)a4;
- (HMDWatchSync)initWithIdentifier:(id)a3 syncOption:(unint64_t)a4 inProgress:(BOOL)a5 isRetry:(BOOL)a6;
- (HMDWatchSync)initWithSyncOption:(unint64_t)a3;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)syncOption;
- (void)setInProgress:(BOOL)a3;
- (void)setSyncOption:(unint64_t)a3;
@end

@implementation HMDWatchSync

- (void).cxx_destruct
{
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSyncOption:(unint64_t)a3
{
  self->_syncOption = a3;
}

- (unint64_t)syncOption
{
  return self->_syncOption;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDWatchSync *)self identifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v18[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v7 = [(HMDWatchSync *)self syncOption];
  if (v7 > 2) {
    v8 = @"Unknown watch sync option";
  }
  else {
    v8 = off_1E6A07D58[v7];
  }
  v9 = (void *)[v6 initWithName:@"Sync Option" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDWatchSync *)self inProgress];
  v11 = HMFBooleanToString();
  v12 = (void *)[v10 initWithName:@"In Progress" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDWatchSync *)self isRetry];
  v14 = HMFBooleanToString();
  v15 = (void *)[v13 initWithName:@"Is Retry" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HMDWatchSync alloc];
  v5 = [(HMDWatchSync *)self identifier];
  id v6 = [(HMDWatchSync *)v4 initWithIdentifier:v5 syncOption:[(HMDWatchSync *)self syncOption] inProgress:[(HMDWatchSync *)self inProgress] isRetry:[(HMDWatchSync *)self isRetry]];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [(HMDWatchSync *)self identifier];
  uint64_t v4 = [v3 hash];

  unint64_t v5 = [(HMDWatchSync *)self syncOption] ^ v4;
  unint64_t v6 = v5 ^ [(HMDWatchSync *)self inProgress];
  return v6 ^ [(HMDWatchSync *)self isRetry];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  unint64_t v7 = v6;
  if (v6)
  {
    v8 = [v6 identifier];
    v9 = [(HMDWatchSync *)self identifier];
    if ([v8 isEqual:v9]
      && (uint64_t v10 = [v7 syncOption], v10 == -[HMDWatchSync syncOption](self, "syncOption"))
      && (int v11 = [v7 inProgress], v11 == -[HMDWatchSync inProgress](self, "inProgress")))
    {
      int v14 = [v7 isRetry];
      int v12 = v14 ^ [(HMDWatchSync *)self isRetry] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (HMDWatchSync)initWithIdentifier:(id)a3 syncOption:(unint64_t)a4
{
  return [(HMDWatchSync *)self initWithIdentifier:a3 syncOption:a4 inProgress:0 isRetry:1];
}

- (HMDWatchSync)initWithSyncOption:(unint64_t)a3
{
  unint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [(HMDWatchSync *)self initWithIdentifier:v5 syncOption:a3 inProgress:0 isRetry:0];

  return v6;
}

- (HMDWatchSync)initWithIdentifier:(id)a3 syncOption:(unint64_t)a4 inProgress:(BOOL)a5 isRetry:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDWatchSync;
  int v12 = [(HMDWatchSync *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_syncOption = a4;
    v13->_inProgress = a5;
    v13->_isRetry = a6;
  }

  return v13;
}

@end