@interface IMDHandle
- (BOOL)cachedOffGridMode;
- (BOOL)isBetterDefinedThan:(id)a3;
- (BOOL)isBusiness;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStewie;
- (BOOL)matchesLoginHandleForAnyAccount;
- (IMDHandle)initWithID:(id)a3 unformattedID:(id)a4 countryCode:(id)a5;
- (IMDHandle)initWithID:(id)a3 unformattedID:(id)a4 countryCode:(id)a5 personCentricID:(id)a6;
- (NSDictionary)handleInfo;
- (NSString)CNContactID;
- (NSString)ID;
- (NSString)countryCode;
- (NSString)normalizedID;
- (NSString)personCentricID;
- (NSString)unformattedID;
- (id)description;
- (int64_t)compareIDs:(id)a3;
- (unint64_t)hash;
- (void)cachedOffGridModeAndLastPublisherWithCompletion:(id)a3;
- (void)dealloc;
- (void)isOffGridModeWithCompletion:(id)a3;
- (void)setCNContactID:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setID:(id)a3;
- (void)setPersonCentricID:(id)a3;
- (void)setUnformattedID:(id)a3;
@end

@implementation IMDHandle

- (NSString)personCentricID
{
  if (IMSharedHelperPersistMergeID()) {
    return self->_personCentricID;
  }
  else {
    return 0;
  }
}

- (NSString)CNContactID
{
  return self->_CNContactID;
}

- (NSString)ID
{
  return self->_id;
}

- (IMDHandle)initWithID:(id)a3 unformattedID:(id)a4 countryCode:(id)a5
{
  return [(IMDHandle *)self initWithID:a3 unformattedID:a4 countryCode:a5 personCentricID:0];
}

- (IMDHandle)initWithID:(id)a3 unformattedID:(id)a4 countryCode:(id)a5 personCentricID:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)IMDHandle;
  v10 = [(IMDHandle *)&v13 init];
  if (v10)
  {
    v10->_id = (NSString *)a3;
    v10->_unformattedID = (NSString *)a4;
    v10->_countryCode = (NSString *)a5;
    if (IMSharedHelperPersistMergeID()) {
      v11 = (NSString *)a6;
    }
    else {
      v11 = 0;
    }
    v10->_personCentricID = v11;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDHandle;
  [(IMDHandle *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if (a3 == self) {
    goto LABEL_12;
  }
  v5 = [(IMDHandle *)self ID];
  uint64_t v6 = [a3 ID];
  if (v5 != (NSString *)v6)
  {
    BOOL v7 = [(NSString *)v5 isEqualToString:v6];
    if (!v7) {
      return v7;
    }
  }
  v8 = [(IMDHandle *)self unformattedID];
  uint64_t v9 = [a3 unformattedID];
  if (v8 != (NSString *)v9)
  {
    BOOL v7 = [(NSString *)v8 isEqualToString:v9];
    if (!v7) {
      return v7;
    }
  }
  v10 = [(IMDHandle *)self countryCode];
  uint64_t v11 = [a3 countryCode];
  if (v10 == (NSString *)v11)
  {
LABEL_12:
    LOBYTE(v7) = 1;
    return v7;
  }

  LOBYTE(v7) = [(NSString *)v10 isEqualToString:v11];
  return v7;
}

- (int64_t)compareIDs:(id)a3
{
  v4 = [(IMDHandle *)self ID];
  uint64_t v5 = [a3 ID];

  return [(NSString *)v4 caseInsensitiveCompare:v5];
}

- (BOOL)isBetterDefinedThan:(id)a3
{
  return (-[IMDHandle unformattedID](self, "unformattedID") || ![a3 unformattedID])
      && (-[IMDHandle countryCode](self, "countryCode") || ![a3 countryCode])
      && (-[IMDHandle CNContactID](self, "CNContactID") || ![a3 CNContactID]);
}

- (unint64_t)hash
{
  v2 = (void *)[NSString stringWithFormat:@"<%@:%@:%@>", self->_id, self->_unformattedID, self->_countryCode];

  return [v2 hash];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"[%@: <%@:%@:%@:%@:%@>]", NSStringFromClass(v4), self->_id, self->_unformattedID, self->_countryCode, self->_personCentricID, self->_CNContactID];
}

- (NSDictionary)handleInfo
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self->_id, *MEMORY[0x1E4F6C5C8], self->_unformattedID, *MEMORY[0x1E4F6C648], self->_countryCode, *MEMORY[0x1E4F6C5A0], self->_personCentricID, *MEMORY[0x1E4F6C608], 0);
}

- (BOOL)isBusiness
{
}

- (BOOL)isStewie
{
}

- (void)setPersonCentricID:(id)a3
{
  if (IMSharedHelperPersistMergeID())
  {
    personCentricID = self->_personCentricID;
    if (personCentricID != a3)
    {

      self->_personCentricID = (NSString *)a3;
    }
  }
}

- (NSString)normalizedID
{
  [(IMDHandle *)self ID];

  JUMPOUT(0x1E0169B80);
}

- (BOOL)matchesLoginHandleForAnyAccount
{
  objc_super v3 = +[IMDAccountController sharedInstance];
  v4 = [(IMDHandle *)self ID];

  return [(IMDAccountController *)v3 accountAssociatedWithHandle:v4];
}

- (BOOL)cachedOffGridMode
{
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isCarrierPigeonEnabled");
  if (v3) {
    LOBYTE(v3) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E7B0], "sharedInstance"), "offGridModeForHandle:", self) == 2;
  }
  return v3;
}

- (void)cachedOffGridModeAndLastPublisherWithCompletion:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F6E7B0] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D986C990;
  v6[3] = &unk_1E6B78360;
  v6[4] = a3;
  [v5 cachedOffGridModeAndLastPublisherForHandle:self completion:v6];
}

- (void)isOffGridModeWithCompletion:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isCarrierPigeonEnabled"))
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F6E7B0] sharedInstance];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1D986CA78;
    v7[3] = &unk_1E6B78388;
    v7[4] = a3;
    [v5 offGridModeForHandle:self completion:v7];
  }
  else
  {
    uint64_t v6 = (void (*)(id, void))*((void *)a3 + 2);
    v6(a3, 0);
  }
}

- (void)setID:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)unformattedID
{
  return self->_unformattedID;
}

- (void)setUnformattedID:(id)a3
{
}

- (void)setCNContactID:(id)a3
{
}

@end