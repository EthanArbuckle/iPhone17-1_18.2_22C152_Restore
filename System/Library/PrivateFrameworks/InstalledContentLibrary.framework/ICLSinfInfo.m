@interface ICLSinfInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMIDBasedSINF;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMissingRequiredSINF;
- (ICLSinfInfo)initWithCoder:(id)a3;
- (ICLSinfInfo)initWithLegacySinfInfoDictionary:(id)a3;
- (NSDictionary)legacySinfInfoDictionary;
- (NSNumber)applicationDSID;
- (NSNumber)downloaderDSID;
- (NSNumber)familyID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationDSID:(id)a3;
- (void)setDownloaderDSID:(id)a3;
- (void)setFamilyID:(id)a3;
- (void)setHasMIDBasedSINF:(BOOL)a3;
- (void)setIsMissingRequiredSINF:(BOOL)a3;
@end

@implementation ICLSinfInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLSinfInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICLSinfInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationDSID"];
    applicationDSID = v5->_applicationDSID;
    v5->_applicationDSID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyID"];
    familyID = v5->_familyID;
    v5->_familyID = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloaderDSID"];
    downloaderDSID = v5->_downloaderDSID;
    v5->_downloaderDSID = (NSNumber *)v10;

    v5->_hasMIDBasedSINF = [v4 decodeBoolForKey:@"hasMIDBasedSINF"];
    v5->_isMissingRequiredSINF = [v4 decodeBoolForKey:@"isMissingRequiredSINF"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ICLSinfInfo *)self applicationDSID];
  [v7 encodeObject:v4 forKey:@"applicationDSID"];

  v5 = [(ICLSinfInfo *)self familyID];
  [v7 encodeObject:v5 forKey:@"familyID"];

  uint64_t v6 = [(ICLSinfInfo *)self downloaderDSID];
  [v7 encodeObject:v6 forKey:@"downloaderDSID"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"), @"hasMIDBasedSINF");
  objc_msgSend(v7, "encodeBool:forKey:", -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"), @"isMissingRequiredSINF");
}

- (ICLSinfInfo)initWithLegacySinfInfoDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(ICLSinfInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ApplicationDSID"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    [(ICLSinfInfo *)v5 setApplicationDSID:v8];
    v9 = [v4 objectForKeyedSubscript:@"FamilyID"];
    objc_opt_class();
    id v10 = v9;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    [(ICLSinfInfo *)v5 setFamilyID:v11];
    v12 = [v4 objectForKeyedSubscript:@"DownloaderDSID"];
    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    [(ICLSinfInfo *)v5 setDownloaderDSID:v14];
    v15 = [v4 objectForKeyedSubscript:@"HasMIDBasedSINF"];
    [(ICLSinfInfo *)v5 setHasMIDBasedSINF:MIBooleanValue(v15, 0)];

    v16 = [v4 objectForKeyedSubscript:@"MissingSINF"];
    [(ICLSinfInfo *)v5 setIsMissingRequiredSINF:MIBooleanValue(v16, 0)];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(ICLSinfInfo *)self applicationDSID];
  [v4 setApplicationDSID:v5];

  uint64_t v6 = [(ICLSinfInfo *)self familyID];
  [v4 setFamilyID:v6];

  id v7 = [(ICLSinfInfo *)self downloaderDSID];
  [v4 setDownloaderDSID:v7];

  objc_msgSend(v4, "setHasMIDBasedSINF:", -[ICLSinfInfo hasMIDBasedSINF](self, "hasMIDBasedSINF"));
  objc_msgSend(v4, "setIsMissingRequiredSINF:", -[ICLSinfInfo isMissingRequiredSINF](self, "isMissingRequiredSINF"));
  return v4;
}

- (NSDictionary)legacySinfInfoDictionary
{
  v3 = objc_opt_new();
  id v4 = [(ICLSinfInfo *)self applicationDSID];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"ApplicationDSID"];
  }

  v5 = [(ICLSinfInfo *)self familyID];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"FamilyID"];
  }

  uint64_t v6 = [(ICLSinfInfo *)self downloaderDSID];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"DownloaderDSID"];
  }

  BOOL v7 = [(ICLSinfInfo *)self hasMIDBasedSINF];
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  if (v7)
  {
    if ([(ICLSinfInfo *)self hasMIDBasedSINF]) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v8;
    }
    [v3 setObject:v10 forKeyedSubscript:@"HasMIDBasedSINF"];
  }
  if ([(ICLSinfInfo *)self isMissingRequiredSINF])
  {
    if ([(ICLSinfInfo *)self isMissingRequiredSINF]) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v8;
    }
    [v3 setObject:v11 forKeyedSubscript:@"MissingSINF"];
  }
  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLSinfInfo *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(ICLSinfInfo *)self applicationDSID];
      BOOL v7 = [(ICLSinfInfo *)v5 applicationDSID];
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        uint64_t v9 = [(ICLSinfInfo *)self familyID];
        uint64_t v10 = [(ICLSinfInfo *)v5 familyID];
        BOOL v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          v12 = [(ICLSinfInfo *)self downloaderDSID];
          id v13 = [(ICLSinfInfo *)v5 downloaderDSID];
          BOOL v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            BOOL v15 = [(ICLSinfInfo *)self hasMIDBasedSINF];
            if (v15 == [(ICLSinfInfo *)v5 hasMIDBasedSINF])
            {
              BOOL v18 = [(ICLSinfInfo *)self isMissingRequiredSINF];
              if (v18 == [(ICLSinfInfo *)v5 isMissingRequiredSINF])
              {
                BOOL v16 = 1;
                goto LABEL_22;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_21:
                BOOL v16 = 0;
LABEL_22:

                goto LABEL_23;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_21;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_21;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_21;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_21;
      }
      MOLogWrite();
      goto LABEL_21;
    }
    BOOL v16 = 0;
  }
LABEL_23:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ICLSinfInfo *)self hasMIDBasedSINF];
  BOOL v4 = [(ICLSinfInfo *)self isMissingRequiredSINF];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  BOOL v7 = [(ICLSinfInfo *)self applicationDSID];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(ICLSinfInfo *)self familyID];
  uint64_t v10 = v8 ^ [v9 hash];

  BOOL v11 = [(ICLSinfInfo *)self downloaderDSID];
  unint64_t v12 = v10 ^ [v11 hash] ^ v6;

  return v12;
}

- (NSNumber)applicationDSID
{
  return self->_applicationDSID;
}

- (void)setApplicationDSID:(id)a3
{
}

- (NSNumber)familyID
{
  return self->_familyID;
}

- (void)setFamilyID:(id)a3
{
}

- (NSNumber)downloaderDSID
{
  return self->_downloaderDSID;
}

- (void)setDownloaderDSID:(id)a3
{
}

- (BOOL)hasMIDBasedSINF
{
  return self->_hasMIDBasedSINF;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (BOOL)isMissingRequiredSINF
{
  return self->_isMissingRequiredSINF;
}

- (void)setIsMissingRequiredSINF:(BOOL)a3
{
  self->_isMissingRequiredSINF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloaderDSID, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_applicationDSID, 0);
}

@end