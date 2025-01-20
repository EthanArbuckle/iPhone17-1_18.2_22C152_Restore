@interface DNDSApplicationConfigurationRecord
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSApplicationConfigurationRecord)init;
- (NSNumber)minimumBreakthroughUrgency;
- (NSSet)allowedThreads;
- (NSSet)deniedThreads;
- (NSString)description;
- (id)_initWithMinimumBreakthroughUrgency:(id)a3 allowedThreads:(id)a4 deniedThreads:(id)a5;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSApplicationConfigurationRecord

- (DNDSApplicationConfigurationRecord)init
{
  return (DNDSApplicationConfigurationRecord *)[(DNDSApplicationConfigurationRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 minimumBreakthroughUrgency];
  v6 = [v4 allowedThreads];
  v7 = [v4 deniedThreads];

  id v8 = [(DNDSApplicationConfigurationRecord *)self _initWithMinimumBreakthroughUrgency:v5 allowedThreads:v6 deniedThreads:v7];
  return v8;
}

- (id)_initWithMinimumBreakthroughUrgency:(id)a3 allowedThreads:(id)a4 deniedThreads:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DNDSApplicationConfigurationRecord;
  v11 = [(DNDSApplicationConfigurationRecord *)&v19 init];
  if (v11)
  {
    if (v9) {
      v12 = (NSSet *)v9;
    }
    else {
      v12 = (NSSet *)objc_opt_new();
    }
    allowedThreads = v11->_allowedThreads;
    v11->_allowedThreads = v12;

    if (v10) {
      v14 = (NSSet *)v10;
    }
    else {
      v14 = (NSSet *)objc_opt_new();
    }
    deniedThreads = v11->_deniedThreads;
    v11->_deniedThreads = v14;

    v16 = &unk_1F2A5D8F8;
    if (![(NSSet *)v11->_allowedThreads count] && ![(NSSet *)v11->_deniedThreads count]) {
      v16 = &unk_1F2A5D910;
    }
    if (v8) {
      v17 = v8;
    }
    else {
      v17 = v16;
    }
    objc_storeStrong((id *)&v11->_minimumBreakthroughUrgency, v17);
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(DNDSApplicationConfigurationRecord *)self minimumBreakthroughUrgency];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSApplicationConfigurationRecord *)self allowedThreads];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSApplicationConfigurationRecord *)self deniedThreads];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DNDSApplicationConfigurationRecord *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(DNDSApplicationConfigurationRecord *)self minimumBreakthroughUrgency];
      unint64_t v8 = [(DNDSApplicationConfigurationRecord *)v6 minimumBreakthroughUrgency];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDSApplicationConfigurationRecord *)self minimumBreakthroughUrgency];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_37;
        }
        id v10 = (void *)v9;
        v11 = [(DNDSApplicationConfigurationRecord *)v6 minimumBreakthroughUrgency];
        if (!v11)
        {
          char v13 = 0;
LABEL_36:

          goto LABEL_37;
        }
        v12 = [(DNDSApplicationConfigurationRecord *)self minimumBreakthroughUrgency];
        v3 = [(DNDSApplicationConfigurationRecord *)v6 minimumBreakthroughUrgency];
        if (![v12 isEqual:v3])
        {
          char v13 = 0;
LABEL_35:

          goto LABEL_36;
        }
        v36 = v3;
        v37 = v12;
        v38 = v11;
        v39 = v10;
      }
      v14 = [(DNDSApplicationConfigurationRecord *)self allowedThreads];
      v15 = [(DNDSApplicationConfigurationRecord *)v6 allowedThreads];
      if (v14 != v15)
      {
        uint64_t v16 = [(DNDSApplicationConfigurationRecord *)self allowedThreads];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [(DNDSApplicationConfigurationRecord *)v6 allowedThreads];
          if (v18)
          {
            v35 = v14;
            objc_super v19 = [(DNDSApplicationConfigurationRecord *)self allowedThreads];
            v3 = [(DNDSApplicationConfigurationRecord *)v6 allowedThreads];
            if ([v19 isEqual:v3])
            {
              v31 = v19;
              v32 = v18;
              v33 = v17;
LABEL_17:
              v20 = [(DNDSApplicationConfigurationRecord *)self deniedThreads];
              uint64_t v21 = [(DNDSApplicationConfigurationRecord *)v6 deniedThreads];
              if (v20 == (void *)v21)
              {

                char v13 = 1;
                v27 = v35;
              }
              else
              {
                v22 = (void *)v21;
                v34 = v3;
                uint64_t v23 = [(DNDSApplicationConfigurationRecord *)self deniedThreads];
                if (v23)
                {
                  v24 = (void *)v23;
                  v25 = [(DNDSApplicationConfigurationRecord *)v6 deniedThreads];
                  if (v25)
                  {
                    v30 = v25;
                    v29 = [(DNDSApplicationConfigurationRecord *)self deniedThreads];
                    v26 = [(DNDSApplicationConfigurationRecord *)v6 deniedThreads];
                    char v13 = [v29 isEqual:v26];

                    v25 = v30;
                  }
                  else
                  {
                    char v13 = 0;
                  }
                }
                else
                {

                  char v13 = 0;
                }
                v3 = v34;
                v27 = v35;
              }
              if (v27 != v15)
              {
              }
LABEL_34:
              v11 = v38;
              id v10 = v39;
              v3 = v36;
              v12 = v37;
              if (v7 != v8) {
                goto LABEL_35;
              }
LABEL_37:

              goto LABEL_38;
            }

            v14 = v35;
          }
        }
        char v13 = 0;
        goto LABEL_34;
      }
      v35 = v14;
      goto LABEL_17;
    }
    char v13 = 0;
  }
LABEL_38:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSApplicationConfigurationRecord *)self minimumBreakthroughUrgency];
  uint64_t v6 = [(DNDSApplicationConfigurationRecord *)self allowedThreads];
  v7 = [(DNDSApplicationConfigurationRecord *)self deniedThreads];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; minimumBreakthroughUrgency: %@; ; allowedThreads: %@; ; deniedThreads: %@; >",
    v4,
    self,
    v5,
    v6,
  unint64_t v8 = v7);

  return (NSString *)v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableApplicationConfigurationRecord alloc];
  return [(DNDSApplicationConfigurationRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"minimumBreakthroughUrgency", objc_opt_class());
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v8 = objc_msgSend(v5, "bs_safeArrayForKey:", @"allowedThreads");
  uint64_t v9 = [v7 setWithArray:v8];

  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  v11 = objc_msgSend(v5, "bs_safeArrayForKey:", @"deniedThreads");

  v12 = [v10 setWithArray:v11];

  char v13 = (void *)[objc_alloc((Class)a1) _initWithMinimumBreakthroughUrgency:v6 allowedThreads:v9 deniedThreads:v12];
  return v13;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = [a3 healingSource];
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  unint64_t v8 = v7;

  uint64_t v9 = [(DNDSApplicationConfigurationRecord *)self minimumBreakthroughUrgency];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v9, @"minimumBreakthroughUrgency");

  id v10 = [(DNDSApplicationConfigurationRecord *)self allowedThreads];
  v11 = [v10 allObjects];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v11, @"allowedThreads");

  v12 = [(DNDSApplicationConfigurationRecord *)self deniedThreads];
  char v13 = [v12 allObjects];
  objc_msgSend(v8, "bs_setSafeObject:forKey:", v13, @"deniedThreads");

  return v8;
}

- (NSNumber)minimumBreakthroughUrgency
{
  return self->_minimumBreakthroughUrgency;
}

- (NSSet)allowedThreads
{
  return self->_allowedThreads;
}

- (NSSet)deniedThreads
{
  return self->_deniedThreads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedThreads, 0);
  objc_storeStrong((id *)&self->_allowedThreads, 0);
  objc_storeStrong((id *)&self->_minimumBreakthroughUrgency, 0);
}

@end