@interface _MXBundleBlacklistEntry
+ (id)blacklistEntriesFromDefaultsValue:(id)a3;
- (BOOL)_isVersionValueAllowed:(id)a3;
- (BOOL)isBundleRecordAllowed:(id)a3;
- (BOOL)isExtensionAllowed:(id)a3;
- (_MXBundleBlacklistEntry)initWithBundleIdentifier:(id)a3 minimumDisallowedVersion:(id)a4 maximumDisallowedVersion:(id)a5;
@end

@implementation _MXBundleBlacklistEntry

+ (id)blacklistEntriesFromDefaultsValue:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v4;
    id v6 = v4;
    uint64_t v25 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v25) {
      goto LABEL_27;
    }
    uint64_t v7 = *(void *)v27;
    uint64_t v8 = MEMORY[0x1E4F1CC38];
    uint64_t v22 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v11 = [v6 objectForKey:v10];
        if (![v11 isEqual:v8])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          v12 = [v11 objectForKey:@"MinimumVersion"];
          v13 = [v11 objectForKey:@"MaximumVersion"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v12 = 0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v13 = 0;
          }
          v14 = v5;
          id v15 = a1;
          id v16 = objc_alloc((Class)a1);
          if (v12)
          {
            v17 = [[_MXVersion alloc] initWithVersionString:v12];
            v24 = v17;
            if (v13) {
              goto LABEL_16;
            }
LABEL_18:
            v18 = 0;
          }
          else
          {
            v17 = 0;
            if (!v13) {
              goto LABEL_18;
            }
LABEL_16:
            v23 = [[_MXVersion alloc] initWithVersionString:v13];
            v18 = v23;
          }
          v19 = (void *)[v16 initWithBundleIdentifier:v10 minimumDisallowedVersion:v17 maximumDisallowedVersion:v18];
          v5 = v14;
          [v14 addObject:v19];

          if (v13) {
          a1 = v15;
          }
          uint64_t v7 = v22;
          if (v12) {

          }
          uint64_t v8 = MEMORY[0x1E4F1CC38];
          goto LABEL_24;
        }
        v12 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:v10 minimumDisallowedVersion:0 maximumDisallowedVersion:0];
        [v5 addObject:v12];
LABEL_24:

LABEL_25:
      }
      uint64_t v25 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v25)
      {
LABEL_27:

        id v4 = v21;
        goto LABEL_29;
      }
    }
  }
  v5 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_29:

  return v5;
}

- (_MXBundleBlacklistEntry)initWithBundleIdentifier:(id)a3 minimumDisallowedVersion:(id)a4 maximumDisallowedVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MXBundleBlacklistEntry;
  v11 = [(_MXBundleBlacklistEntry *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_minimum, a4);
    objc_storeStrong((id *)&v11->_maximum, a5);
  }

  return v11;
}

- (BOOL)_isVersionValueAllowed:(id)a3
{
  id v4 = (_MXVersion *)a3;
  if (*(_OWORD *)&self->_minimum != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(_MXVersion *)v4 stringValue];

      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v5 = 0;
        BOOL v8 = 0;
        goto LABEL_16;
      }
      uint64_t v5 = (uint64_t)v4;
      if (v4)
      {
LABEL_4:
        id v4 = [[_MXVersion alloc] initWithVersionString:v5];
        minimum = self->_minimum;
        maximum = self->_maximum;
        if (minimum)
        {
          if (maximum)
          {
            if ([(_MXVersion *)maximum compare:v4] == -1)
            {
              BOOL v8 = 1;
              goto LABEL_16;
            }
            minimum = self->_minimum;
          }
          maximum = v4;
        }
        else
        {
          minimum = v4;
        }
        BOOL v8 = [(_MXVersion *)maximum compare:minimum] == -1;
LABEL_16:

        id v4 = (_MXVersion *)v5;
        goto LABEL_17;
      }
    }
    id v4 = 0;
  }
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)isBundleRecordAllowed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:self->_bundleIdentifier];

  if (v6)
  {
    uint64_t v7 = [v4 bundleVersion];
    BOOL v8 = [(_MXBundleBlacklistEntry *)self _isVersionValueAllowed:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)isExtensionAllowed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:self->_bundleIdentifier];

  if (v6)
  {
    uint64_t v7 = [v4 version];
    BOOL v8 = [(_MXBundleBlacklistEntry *)self _isVersionValueAllowed:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end