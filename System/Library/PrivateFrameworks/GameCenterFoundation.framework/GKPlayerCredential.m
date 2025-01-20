@interface GKPlayerCredential
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKLocalPlayerInternal)playerInternal;
- (NSDate)scopeModificationDate;
- (NSString)DSID;
- (NSString)accountName;
- (NSString)altDSID;
- (NSString)authenticationToken;
- (NSString)scopeAsString;
- (id)description;
- (int64_t)environment;
- (unint64_t)hash;
- (unsigned)scope;
- (void)setAccountName:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setDSID:(id)a3;
- (void)setEnvironment:(int64_t)a3;
- (void)setPlayerInternal:(id)a3;
- (void)setScope:(unsigned int)a3;
- (void)setScopeModificationDate:(id)a3;
@end

@implementation GKPlayerCredential

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(GKPlayerCredential *)self environment];
    if (v6 != [v5 environment])
    {
      BOOL v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v7 = [(GKPlayerCredential *)self altDSID];
    if (v7
      || ([v5 altDSID], (v7 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(GKPlayerCredential *)self DSID], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v17 = [v5 DSID];

      if (!v17)
      {
        v11 = [(GKPlayerCredential *)self authenticationToken];
        uint64_t v12 = [v5 authenticationToken];
        goto LABEL_10;
      }
    }
    uint64_t v8 = [(GKPlayerCredential *)self altDSID];
    if (!v8
      || (v9 = (void *)v8,
          [v5 altDSID],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      v11 = [(GKPlayerCredential *)self DSID];
      v13 = [v5 DSID];
      char v14 = [v11 isEqual:v13];
      goto LABEL_14;
    }
    v11 = [(GKPlayerCredential *)self altDSID];
    uint64_t v12 = [v5 altDSID];
LABEL_10:
    v13 = (void *)v12;
    char v14 = [v11 isEqualToString:v12];
LABEL_14:
    BOOL v15 = v14;

    goto LABEL_15;
  }
  BOOL v15 = 0;
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  v2 = [(GKPlayerCredential *)self playerInternal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)scopeAsString
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = v3;
  unsigned int scope = self->_scope;
  if ((scope & 2) != 0)
  {
    [v3 appendString:@"Authorized "];
    unsigned int scope = self->_scope;
    if ((scope & 8) == 0)
    {
LABEL_3:
      if ((scope & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((scope & 8) == 0)
  {
    goto LABEL_3;
  }
  [v4 appendString:@"Active "];
  if ((self->_scope & 4) != 0) {
LABEL_4:
  }
    [v4 appendString:@"Primary "];
LABEL_5:
  int64_t v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v7 = [v4 stringByTrimmingCharactersInSet:v6];

  return (NSString *)v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(GKPlayerCredential *)self accountName];
  int64_t v6 = [(GKPlayerInternal *)self->_playerInternal conciseDescription];
  v7 = [(GKPlayerCredential *)self scopeAsString];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p> account:%@ player:(%@) scope:<%@> (%@) environment:%d token:%@ altDSID:%@ DSID:%@", v4, self, v5, v6, v7, self->_scopeModificationDate, self->_environment, self->_authenticationToken, self->_altDSID, self->_DSID];

  return v8;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_13 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_13, &__block_literal_global_49);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_13;

  return v2;
}

void __45__GKPlayerCredential_secureCodedPropertyKeys__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"accountName";
  v3[0] = objc_opt_class();
  v2[1] = @"authenticationToken";
  v3[1] = objc_opt_class();
  v2[2] = @"playerInternal";
  v3[2] = objc_opt_class();
  v2[3] = @"environment";
  v3[3] = objc_opt_class();
  v2[4] = @"scope";
  v3[4] = objc_opt_class();
  v2[5] = @"scopeModificationDate";
  v3[5] = objc_opt_class();
  v2[6] = @"altDSID";
  v3[6] = objc_opt_class();
  v2[7] = @"DSID";
  v3[7] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_13;
  secureCodedPropertyKeys_sSecureCodedKeys_13 = v0;
}

- (GKLocalPlayerInternal)playerInternal
{
  return (GKLocalPlayerInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlayerInternal:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountName:(id)a3
{
}

- (NSString)authenticationToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthenticationToken:(id)a3
{
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (unsigned)scope
{
  return self->_scope;
}

- (void)setScope:(unsigned int)a3
{
  self->_unsigned int scope = a3;
}

- (NSDate)scopeModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setScopeModificationDate:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)DSID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_scopeModificationDate, 0);
  objc_storeStrong((id *)&self->_playerInternal, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);

  objc_storeStrong((id *)&self->_accountName, 0);
}

@end