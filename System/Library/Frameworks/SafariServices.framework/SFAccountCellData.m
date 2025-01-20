@interface SFAccountCellData
+ (id)accountCellDataWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6;
+ (id)accountCellDataWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6 shouldShowReusedPasswordWarning:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)savedAccountIsOnlySavedAccountForHighLevelDomain;
- (BOOL)shouldShowReusedPasswordWarning;
- (NSString)effectiveTitle;
- (NSString)effectiveTitleForSorting;
- (NSString)highLevelDomain;
- (NSString)searchPattern;
- (SFAccountCellData)initWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6 shouldShowReusedPasswordWarning:(BOOL)a7;
- (WBSPasswordWarning)warning;
- (WBSSavedAccount)savedAccount;
- (unint64_t)hash;
- (void)setShouldShowReusedPasswordWarning:(BOOL)a3;
@end

@implementation SFAccountCellData

+ (id)accountCellDataWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6 shouldShowReusedPasswordWarning:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)a1) initWithSavedAccount:v14 warning:v13 searchPattern:v12 savedAccountIsOnlySavedAccountForHighLevelDomain:v8 shouldShowReusedPasswordWarning:v7];

  return v15;
}

+ (id)accountCellDataWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithSavedAccount:v12 warning:v11 searchPattern:v10 savedAccountIsOnlySavedAccountForHighLevelDomain:v6 shouldShowReusedPasswordWarning:0];

  return v13;
}

- (SFAccountCellData)initWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6 shouldShowReusedPasswordWarning:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SFAccountCellData;
  v16 = [(SFAccountCellData *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_savedAccount, a3);
    objc_storeStrong((id *)&v17->_warning, a4);
    uint64_t v18 = [v15 copy];
    searchPattern = v17->_searchPattern;
    v17->_searchPattern = (NSString *)v18;

    v17->_savedAccountIsOnlySavedAccountForHighLevelDomain = a6;
    v17->_savedAccountHash = [v13 hash];
    v17->_warningHash = [v14 hash];
    v17->_shouldShowReusedPasswordWarning = a7;
    v20 = v17;
  }

  return v17;
}

- (NSString)effectiveTitle
{
  return (NSString *)[(WBSSavedAccount *)self->_savedAccount effectiveTitle];
}

- (NSString)effectiveTitleForSorting
{
  return (NSString *)[(WBSSavedAccount *)self->_savedAccount effectiveTitleForSorting];
}

- (NSString)highLevelDomain
{
  return (NSString *)[(WBSSavedAccount *)self->_savedAccount highLevelDomain];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFAccountCellData *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = v5;
      if (self->_savedAccountHash == v5->_savedAccountHash
        && self->_shouldShowReusedPasswordWarning == v5->_shouldShowReusedPasswordWarning
        && self->_warningHash == v5->_warningHash
        && WBSIsEqual()
        && WBSIsEqual())
      {
        char v7 = WBSIsEqual();
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_warningHash ^ self->_savedAccountHash;
  return v2 ^ [(NSString *)self->_searchPattern hash] ^ self->_shouldShowReusedPasswordWarning;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (WBSPasswordWarning)warning
{
  return self->_warning;
}

- (NSString)searchPattern
{
  return self->_searchPattern;
}

- (BOOL)savedAccountIsOnlySavedAccountForHighLevelDomain
{
  return self->_savedAccountIsOnlySavedAccountForHighLevelDomain;
}

- (BOOL)shouldShowReusedPasswordWarning
{
  return self->_shouldShowReusedPasswordWarning;
}

- (void)setShouldShowReusedPasswordWarning:(BOOL)a3
{
  self->_shouldShowReusedPasswordWarning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_warning, 0);

  objc_storeStrong((id *)&self->_savedAccount, 0);
}

@end