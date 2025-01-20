@interface VSAccountChannels
+ (id)deserializationResultWithData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)providerInfo;
- (NSSet)channelIDs;
- (NSString)adamID;
- (NSString)providerID;
- (VSAccountChannels)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializationResult;
- (id)serializationResultWithFormat:(unint64_t)a3;
- (unint64_t)hash;
- (void)setAdamID:(id)a3;
- (void)setChannelIDs:(id)a3;
- (void)setProviderID:(id)a3;
- (void)setProviderInfo:(id)a3;
@end

@implementation VSAccountChannels

- (VSAccountChannels)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSAccountChannels;
  v2 = [(VSAccountChannels *)&v6 init];
  v3 = v2;
  if (v2)
  {
    providerID = v2->_providerID;
    v2->_providerID = (NSString *)&stru_1F34B2EC8;
  }
  return v3;
}

+ (id)deserializationResultWithData:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v53 = 0;
  v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v53];
  id v4 = v53;
  if (v3)
  {
    id v5 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v6 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v7 = *MEMORY[0x1E4F1C3C8];
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        [v6 raise:v7, @"Unexpectedly, plist was %@, instead of NSDictionary.", v9 format];
      }
      id v10 = v5;
      v11 = [v10 objectForKey:@"ProviderID"];
      uint64_t v12 = [v10 objectForKey:@"ChannelIDs"];
      v13 = (void *)v12;
      if (v11 && v12)
      {
        id v14 = v11;
        id v15 = v13;
        objc_opt_class();
        v48 = v15;
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v41 = v13;
          v42 = v11;
          id v43 = v10;
          id v45 = v4;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v17 = *MEMORY[0x1E4F1C3C8];
            v18 = (objc_class *)objc_opt_class();
            v19 = NSStringFromClass(v18);
            [v16 raise:v17, @"Unexpectedly, providerIDObject was %@, instead of NSString.", v19 format];
          }
          id v44 = v5;
          v46 = v3;
          id v40 = v14;
          id v47 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v21 = *MEMORY[0x1E4F1C3C8];
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            [v20 raise:v21, @"Unexpectedly, channelIDsObject was %@, instead of NSArray.", v23 format];
          }
          id v24 = v15;
          v39 = objc_alloc_init(VSAccountChannels);
          [(VSAccountChannels *)v39 setProviderID:v47];
          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v26 = v24;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v54 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v50;
            uint64_t v30 = *MEMORY[0x1E4F1C3C8];
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v50 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v33 = (void *)MEMORY[0x1E4F1CA00];
                    v34 = (objc_class *)objc_opt_class();
                    v35 = NSStringFromClass(v34);
                    [v33 raise:v30, @"Unexpectedly, channelIdentifier was %@, instead of NSString.", v35 format];
                  }
                  [v25 addObject:v32];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v54 count:16];
            }
            while (v28);
          }

          [(VSAccountChannels *)v39 setChannelIDs:v25];
          v36 = +[VSFailable failableWithObject:v39];

          id v4 = v45;
          v3 = v46;
          id v10 = v43;
          id v5 = v44;
          v13 = v41;
          v11 = v42;
          id v14 = v40;
          v37 = v47;
        }
        else
        {
          v37 = VSPrivateError(-22, 0);
          v36 = +[VSFailable failableWithError:v37];
        }
      }
      else
      {
        VSPrivateError(-22, 0);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        v36 = +[VSFailable failableWithError:v14];
      }
    }
    else
    {
      VSPrivateError(-22, v4);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v36 = +[VSFailable failableWithError:v10];
    }
  }
  else
  {
    VSPrivateError(-22, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v36 = +[VSFailable failableWithError:v5];
  }

  if (!v36) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
  }

  return v36;
}

- (void)setProviderID:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_1F34B2EC8;
  }
  v8 = v5;
  if ((-[NSString isEqual:](self->_providerID, "isEqual:") & 1) == 0)
  {
    objc_super v6 = (NSString *)[(__CFString *)v8 copy];
    providerID = self->_providerID;
    self->_providerID = v6;
  }
}

- (id)serializationResultWithFormat:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_super v6 = [(VSAccountChannels *)self providerID];
  [v5 setObject:v6 forKey:@"ProviderID"];

  uint64_t v7 = [(VSAccountChannels *)self channelIDs];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 allObjects];
    [v5 setObject:v9 forKey:@"ChannelIDs"];
  }
  id v15 = 0;
  id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:a3 options:0 error:&v15];
  id v11 = v15;
  if (v10)
  {
    uint64_t v12 = +[VSFailable failableWithObject:v10];
    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v14 = VSPrivateError(-21, v11);
  uint64_t v12 = +[VSFailable failableWithError:v14];

  if (!v12) {
LABEL_5:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
LABEL_6:

  return v12;
}

- (id)serializationResult
{
  return [(VSAccountChannels *)self serializationResultWithFormat:100];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  id v5 = [(VSAccountChannels *)self providerID];
  objc_super v6 = [v4 stringWithFormat:@"%@ = %@", @"providerID", v5];
  [v3 addObject:v6];

  uint64_t v7 = NSString;
  v8 = [(VSAccountChannels *)self adamID];
  v9 = [v7 stringWithFormat:@"%@ = %@", @"adamID", v8];
  [v3 addObject:v9];

  id v10 = NSString;
  id v11 = [(VSAccountChannels *)self channelIDs];
  uint64_t v12 = [v10 stringWithFormat:@"%@ = %@", @"channelIDs", v11];
  [v3 addObject:v12];

  v13 = NSString;
  id v14 = [(VSAccountChannels *)self providerInfo];
  id v15 = [v13 stringWithFormat:@"%@ = %@", @"providerInfo", v14];
  [v3 addObject:v15];

  v16 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)VSAccountChannels;
  uint64_t v17 = [(VSAccountChannels *)&v21 description];
  v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v16 stringWithFormat:@"<%@ %@>", v17, v18];

  return v19;
}

- (unint64_t)hash
{
  id v3 = [(VSAccountChannels *)self providerID];
  uint64_t v4 = [v3 hash];

  id v5 = [(VSAccountChannels *)self adamID];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(VSAccountChannels *)self channelIDs];
  uint64_t v8 = [v7 hash];

  v9 = [(VSAccountChannels *)self providerInfo];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VSAccountChannels *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        LOBYTE(v14) = 0;
LABEL_29:

        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        v9 = (objc_class *)objc_opt_class();
        unint64_t v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSAccountChannels.", v10 format];
      }
      id v11 = v6;
      uint64_t v12 = [(VSAccountChannels *)self providerID];
      v13 = [(VSAccountChannels *)v11 providerID];
      int v14 = [v12 isEqual:v13];

      if (!v14)
      {
LABEL_28:

        goto LABEL_29;
      }
      id v15 = [(VSAccountChannels *)self adamID];
      v16 = [(VSAccountChannels *)v11 adamID];
      id v17 = v15;
      id v18 = v16;
      if (v17 == v18)
      {
      }
      else
      {
        v19 = v18;
        LOBYTE(v14) = 0;
        if (!v17 || !v18) {
          goto LABEL_27;
        }
        char v20 = [v17 isEqual:v18];

        if ((v20 & 1) == 0) {
          goto LABEL_20;
        }
      }
      objc_super v21 = [(VSAccountChannels *)self channelIDs];
      v22 = [(VSAccountChannels *)v11 channelIDs];
      id v17 = v21;
      id v23 = v22;
      if (v17 == v23)
      {

LABEL_22:
        id v25 = [(VSAccountChannels *)self providerInfo];
        id v26 = [(VSAccountChannels *)v11 providerInfo];
        id v17 = v25;
        id v27 = v26;
        v19 = v27;
        if (v17 == v27)
        {
          LOBYTE(v14) = 1;
        }
        else
        {
          LOBYTE(v14) = 0;
          if (v17 && v27) {
            LOBYTE(v14) = [v17 isEqual:v27];
          }
        }
        goto LABEL_27;
      }
      v19 = v23;
      LOBYTE(v14) = 0;
      if (v17 && v23)
      {
        char v24 = [v17 isEqual:v23];

        if ((v24 & 1) == 0)
        {
LABEL_20:
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        goto LABEL_22;
      }
LABEL_27:

      goto LABEL_28;
    }
    LOBYTE(v14) = 0;
  }
LABEL_30:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(VSAccountChannels);
  uint64_t v5 = [(NSString *)self->_providerID copy];
  providerID = v4->_providerID;
  v4->_providerID = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_adamID copy];
  adamID = v4->_adamID;
  v4->_adamID = (NSString *)v7;

  uint64_t v9 = [(NSSet *)self->_channelIDs copy];
  channelIDs = v4->_channelIDs;
  v4->_channelIDs = (NSSet *)v9;

  uint64_t v11 = [(NSDictionary *)self->_providerInfo copy];
  providerInfo = v4->_providerInfo;
  v4->_providerInfo = (NSDictionary *)v11;

  return v4;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSSet)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
}

- (NSDictionary)providerInfo
{
  return self->_providerInfo;
}

- (void)setProviderInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerInfo, 0);
  objc_storeStrong((id *)&self->_channelIDs, 0);
  objc_storeStrong((id *)&self->_adamID, 0);

  objc_storeStrong((id *)&self->_providerID, 0);
}

@end