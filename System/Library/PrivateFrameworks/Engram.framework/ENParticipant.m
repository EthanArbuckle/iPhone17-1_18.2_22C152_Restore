@interface ENParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsEngram;
- (ENAccountPublicKey)accountPublicKey;
- (ENParticipant)initWithAccountPublicKey:(id)a3 aliases:(id)a4 devices:(id)a5;
- (ENParticipant)initWithCoder:(id)a3;
- (NSArray)devices;
- (NSSet)aliases;
- (id)description;
- (id)deviceWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountPublicKey:(id)a3;
- (void)setAliases:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation ENParticipant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENParticipant)initWithAccountPublicKey:(id)a3 aliases:(id)a4 devices:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ENParticipant;
  v12 = [(ENParticipant *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountPublicKey, a3);
    objc_storeStrong((id *)&v13->_aliases, a4);
    objc_storeStrong((id *)&v13->_devices, a5);
  }

  return v13;
}

- (ENParticipant)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"kENParticipantAliasesKey"];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"kENParticipantDevicesKey"];

  v13 = [(ENParticipant *)self initWithAccountPublicKey:0 aliases:v8 devices:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ENParticipant *)self accountPublicKey];
  [v4 encodeObject:v5 forKey:@"kENParticipantAccountPublicKey"];

  uint64_t v6 = [(ENParticipant *)self aliases];
  [v4 encodeObject:v6 forKey:@"kENParticipantAliasesKey"];

  id v7 = [(ENParticipant *)self devices];
  [v4 encodeObject:v7 forKey:@"kENParticipantDevicesKey"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(ENParticipant *)self aliases];
  uint64_t v6 = [(ENParticipant *)self accountPublicKey];
  BOOL v7 = [(ENParticipant *)self supportsEngram];
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  id v9 = [v3 stringWithFormat:@"<%@ %p aliases: %@ accountPublicKey: %@, supportEngram: %@>", v4, self, v5, v6, v8];

  return v9;
}

- (BOOL)supportsEngram
{
  v3 = [(ENParticipant *)self accountPublicKey];
  if (v3)
  {
    uint64_t v4 = [(ENParticipant *)self devices];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)deviceWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(ENParticipant *)self devices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (ENAccountPublicKey)accountPublicKey
{
  return self->_accountPublicKey;
}

- (void)setAccountPublicKey:(id)a3
{
}

- (NSSet)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_accountPublicKey, 0);
}

@end