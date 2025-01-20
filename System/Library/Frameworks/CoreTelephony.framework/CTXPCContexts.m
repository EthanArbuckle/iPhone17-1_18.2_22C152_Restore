@interface CTXPCContexts
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTXPCContexts)initWithCoder:(id)a3;
- (NSArray)subscriptions;
- (NSUUID)dataPreferred;
- (NSUUID)voicePreferred;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)findForAccount:(id)a3;
- (id)findForSlot:(int64_t)a3;
- (id)findForUuid:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDataPreferred:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setVoicePreferred:(id)a3;
@end

@implementation CTXPCContexts

- (CTXPCContexts)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTXPCContexts;
  v5 = [(CTXPCContexts *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"subscriptions"];
    subscriptions = v5->_subscriptions;
    v5->_subscriptions = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user_data_preferred"];
    dataPreferred = v5->_dataPreferred;
    v5->_dataPreferred = (NSUUID *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user_default_voice"];
    voicePreferred = v5->_voicePreferred;
    v5->_voicePreferred = (NSUUID *)v13;
  }
  return v5;
}

- (id)findForUuid:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CTXPCContexts *)self subscriptions];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 uuid];
        char v11 = [v10 isEqual:v4];

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

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTXPCContexts *)self subscriptions];
  [v3 appendFormat:@", subscriptions=%@", v4];

  v5 = [(CTXPCContexts *)self dataPreferred];
  [v3 appendFormat:@", dataPreferred=%@", v5];

  id v6 = [(CTXPCContexts *)self voicePreferred];
  [v3 appendFormat:@", voicePreferred=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (NSUUID)voicePreferred
{
  return self->_voicePreferred;
}

- (NSUUID)dataPreferred
{
  return self->_dataPreferred;
}

- (void)encodeWithCoder:(id)a3
{
  subscriptions = self->_subscriptions;
  id v5 = a3;
  [v5 encodeObject:subscriptions forKey:@"subscriptions"];
  [v5 encodeObject:self->_dataPreferred forKey:@"user_data_preferred"];
  [v5 encodeObject:self->_voicePreferred forKey:@"user_default_voice"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicePreferred, 0);
  objc_storeStrong((id *)&self->_dataPreferred, 0);

  objc_storeStrong((id *)&self->_subscriptions, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (CTXPCContexts *)a3;
  if (v5 == self) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_38;
  }
  subscriptions = self->_subscriptions;
  if (subscriptions) {
    goto LABEL_4;
  }
  uint64_t v7 = [(CTXPCContexts *)v5 subscriptions];

  if (!v7)
  {
LABEL_15:
    BOOL v12 = 1;
    goto LABEL_38;
  }
  subscriptions = self->_subscriptions;
  if (!subscriptions)
  {
    int v9 = 0;
    goto LABEL_22;
  }
LABEL_4:
  uint64_t v7 = [(CTXPCContexts *)v5 subscriptions];
  if ([subscriptions isEqual:v7])
  {
    int v8 = 0;
    int v9 = 1;
    goto LABEL_6;
  }
  if (self->_subscriptions)
  {
    BOOL v12 = 0;
LABEL_37:

    goto LABEL_38;
  }
  int v9 = 1;
LABEL_22:
  long long v14 = [(CTXPCContexts *)v5 subscriptions];
  if (v14)
  {

    BOOL v12 = 0;
    goto LABEL_36;
  }
  int v8 = 1;
LABEL_6:
  dataPreferred = self->_dataPreferred;
  if (!dataPreferred)
  {
LABEL_19:
    long long v13 = [(CTXPCContexts *)v5 dataPreferred];
    if (v13)
    {
      BOOL v12 = 0;
      goto LABEL_41;
    }
    int v11 = 1;
    goto LABEL_25;
  }
  subscriptions = [(CTXPCContexts *)v5 dataPreferred];
  if (([(NSUUID *)dataPreferred isEqual:subscriptions] & 1) == 0)
  {
    if (self->_dataPreferred)
    {
      BOOL v12 = 0;
      goto LABEL_35;
    }
    goto LABEL_19;
  }
  int v11 = 0;
LABEL_25:
  voicePreferred = self->_voicePreferred;
  if (!voicePreferred) {
    goto LABEL_32;
  }
  v3 = [(CTXPCContexts *)v5 voicePreferred];
  if ([(NSUUID *)voicePreferred isEqual:v3])
  {
    BOOL v12 = 1;
    goto LABEL_33;
  }
  if (self->_voicePreferred)
  {
    BOOL v12 = 0;
  }
  else
  {
LABEL_32:
    long long v16 = [(CTXPCContexts *)v5 voicePreferred];
    BOOL v12 = v16 == 0;

    if (!voicePreferred)
    {
      if (!v11)
      {
LABEL_34:
        if (dataPreferred) {
          goto LABEL_35;
        }
        goto LABEL_42;
      }
      goto LABEL_40;
    }
  }
LABEL_33:

  if ((v11 & 1) == 0) {
    goto LABEL_34;
  }
LABEL_40:
  long long v13 = 0;
LABEL_41:

  if (dataPreferred)
  {
LABEL_35:

    if (v8) {
      goto LABEL_36;
    }
LABEL_43:
    if (!v9) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_42:
  if (!v8) {
    goto LABEL_43;
  }
LABEL_36:
  if (v9) {
    goto LABEL_37;
  }
LABEL_38:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(CTXPCContexts *)self subscriptions];
  id v6 = (void *)[v5 copy];
  [v4 setSubscriptions:v6];

  uint64_t v7 = [(CTXPCContexts *)self dataPreferred];
  int v8 = (void *)[v7 copy];
  [v4 setDataPreferred:v8];

  int v9 = [(CTXPCContexts *)self voicePreferred];
  v10 = (void *)[v9 copy];
  [v4 setVoicePreferred:v10];

  return v4;
}

- (id)findForSlot:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CTXPCContexts *)self subscriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 slotID] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)findForAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(CTXPCContexts *)self subscriptions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 accountID];
        char v11 = [v10 isEqualToString:v4];

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

- (void)setSubscriptions:(id)a3
{
}

- (void)setDataPreferred:(id)a3
{
}

- (void)setVoicePreferred:(id)a3
{
}

@end