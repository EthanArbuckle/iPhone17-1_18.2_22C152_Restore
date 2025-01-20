@interface APClientState
+ (BOOL)supportsSecureCoding;
- (APClientState)init;
- (APClientState)initWithCoder:(id)a3;
- (APClientState)initWithLockedAppBundleIdentifiers:(id)a3 hiddenAppBundleIdentifiers:(id)a4 effectivelyLockedBundleIdentifiers:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSSet)effectivelyLockedAppBundleIdentifiers;
- (NSSet)hiddenAppBundleIdentifiers;
- (NSSet)lockedAppBundleIdentifiers;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APClientState

- (NSSet)hiddenAppBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)lockedAppBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)effectivelyLockedAppBundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (APClientState)init
{
  id v3 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v4 = [(APClientState *)self initWithLockedAppBundleIdentifiers:v3 hiddenAppBundleIdentifiers:v3 effectivelyLockedBundleIdentifiers:v3];

  return v4;
}

- (APClientState)initWithLockedAppBundleIdentifiers:(id)a3 hiddenAppBundleIdentifiers:(id)a4 effectivelyLockedBundleIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APClientState;
  v11 = [(APClientState *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    lockedAppBundleIdentifiers = v11->_lockedAppBundleIdentifiers;
    v11->_lockedAppBundleIdentifiers = (NSSet *)v12;

    uint64_t v14 = [v9 copy];
    hiddenAppBundleIdentifiers = v11->_hiddenAppBundleIdentifiers;
    v11->_hiddenAppBundleIdentifiers = (NSSet *)v14;

    uint64_t v16 = [v10 copy];
    effectivelyLockedAppBundleIdentifiers = v11->_effectivelyLockedAppBundleIdentifiers;
    v11->_effectivelyLockedAppBundleIdentifiers = (NSSet *)v16;
  }
  return v11;
}

- (APClientState)initWithCoder:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(APClientState *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"lockedAppBundleIdentifiers"];
    lockedAppBundleIdentifiers = v5->_lockedAppBundleIdentifiers;
    v5->_lockedAppBundleIdentifiers = (NSSet *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"hiddenAppBundleIdentifiers"];
    hiddenAppBundleIdentifiers = v5->_hiddenAppBundleIdentifiers;
    v5->_hiddenAppBundleIdentifiers = (NSSet *)v14;

    uint64_t v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"effectivelyLockedAppBundleIdentifiers"];
    effectivelyLockedAppBundleIdentifiers = v5->_effectivelyLockedAppBundleIdentifiers;
    v5->_effectivelyLockedAppBundleIdentifiers = (NSSet *)v19;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v21 = v5->_hiddenAppBundleIdentifiers;
    v49[0] = v5->_lockedAppBundleIdentifiers;
    v49[1] = v21;
    v49[2] = v5->_effectivelyLockedAppBundleIdentifiers;
    id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
    uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v42;
      v40 = (void *)*MEMORY[0x263F07F70];
      uint64_t v37 = *(void *)v42;
      do
      {
        uint64_t v25 = 0;
        uint64_t v38 = v23;
        do
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(id *)(*((void *)&v41 + 1) + 8 * v25);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = v5;
            id v28 = v4;
            id v29 = v26;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v30 = v29;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v51 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v46;
              while (2)
              {
                uint64_t v34 = 0;
                do
                {
                  if (*(void *)v46 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

                    id v4 = v28;
                    v5 = v27;
                    uint64_t v24 = v37;
                    uint64_t v23 = v38;
                    goto LABEL_19;
                  }
                  ++v34;
                }
                while (v32 != v34);
                uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v51 count:16];
                if (v32) {
                  continue;
                }
                break;
              }
            }

            id v4 = v28;
            v5 = v27;
            uint64_t v24 = v37;
            uint64_t v23 = v38;
          }
          else
          {

LABEL_19:
            v35 = _APMakeNSError(v40, 4864, (uint64_t)"-[APClientState initWithCoder:]", 86, 0);
            [v4 failWithError:v35];

            v5 = 0;
          }
          ++v25;
        }
        while (v25 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v23);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectivelyLockedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockedAppBundleIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  lockedAppBundleIdentifiers = self->_lockedAppBundleIdentifiers;
  id v5 = a3;
  [v5 encodeObject:lockedAppBundleIdentifiers forKey:@"lockedAppBundleIdentifiers"];
  [v5 encodeObject:self->_hiddenAppBundleIdentifiers forKey:@"hiddenAppBundleIdentifiers"];
  [v5 encodeObject:self->_effectivelyLockedAppBundleIdentifiers forKey:@"effectivelyLockedAppBundleIdentifiers"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<APClientState locked: %@ hidden: %@ effectivelyLocked: %@>", self->_lockedAppBundleIdentifiers, self->_hiddenAppBundleIdentifiers, self->_effectivelyLockedAppBundleIdentifiers];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_lockedAppBundleIdentifiers hash];
  uint64_t v4 = [(NSSet *)self->_hiddenAppBundleIdentifiers hash] ^ v3;
  return v4 ^ [(NSSet *)self->_effectivelyLockedAppBundleIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = (id *)v4;
    if ([v5[1] isEqual:self->_lockedAppBundleIdentifiers]
      && [v5[2] isEqual:self->_hiddenAppBundleIdentifiers])
    {
      char v6 = [v5[3] isEqual:self->_effectivelyLockedAppBundleIdentifiers];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end