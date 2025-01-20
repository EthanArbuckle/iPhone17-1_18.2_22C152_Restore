@interface ABAccountScorer
- (ABAccountScorer)initWithAddressBook:(void *)a3 accountStore:(id)a4 account:(void *)a5 defaultSourceID:(int)a6;
- (ACAccountStore)accountStore;
- (NSString)accountDisambiguationDescription;
- (NSString)accountType;
- (NSString)accountTypeDescription;
- (double)score;
- (int)_findBestSourceID;
- (int)defaultSourceID;
- (int)sourceID;
- (void)account;
- (void)addressBook;
- (void)calculateScore;
- (void)dealloc;
- (void)setAccount:(void *)a3;
- (void)setAccountStore:(id)a3;
- (void)setAccountType:(id)a3;
- (void)setAddressBook:(void *)a3;
- (void)setDefaultSourceID:(int)a3;
- (void)setScore:(double)a3;
- (void)setSourceID:(int)a3;
@end

@implementation ABAccountScorer

- (ABAccountScorer)initWithAddressBook:(void *)a3 accountStore:(id)a4 account:(void *)a5 defaultSourceID:(int)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ABAccountScorer;
  v12 = [(ABAccountScorer *)&v15 init];
  if (v12)
  {
    v12->_addressBook = (void *)CFRetain(a3);
    objc_storeStrong((id *)&v12->_accountStore, a4);
    v12->_account = (void *)CFRetain(a5);
    v12->_score = 0.0;
    v12->_sourceID = -1;
    v12->_defaultSourceID = a6;
    v13 = v12;
  }

  return v12;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  account = self->_account;
  if (account) {
    CFRelease(account);
  }
  v5.receiver = self;
  v5.super_class = (Class)ABAccountScorer;
  [(ABAccountScorer *)&v5 dealloc];
}

- (NSString)accountTypeDescription
{
  v3 = (void *)ABAccountCopyIdentifier([(ABAccountScorer *)self account]);
  v4 = [(ABAccountScorer *)self accountStore];
  objc_super v5 = [v4 accountWithIdentifier:v3];
  v6 = [v5 displayAccount];

  v7 = [v6 accountType];
  v8 = [v7 accountTypeDescription];

  return (NSString *)v8;
}

- (NSString)accountDisambiguationDescription
{
  v3 = (void *)ABAccountCopyIdentifier([(ABAccountScorer *)self account]);
  v4 = [(ABAccountScorer *)self accountStore];
  objc_super v5 = [v4 accountWithIdentifier:v3];
  v6 = [v5 displayAccount];

  v7 = [v6 username];

  return (NSString *)v7;
}

- (void)calculateScore
{
  v16[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F177C0];
  v15[0] = *MEMORY[0x1E4F17750];
  v15[1] = v3;
  v16[0] = &unk_1EF050388;
  v16[1] = &unk_1EF050398;
  uint64_t v4 = *MEMORY[0x1E4F17778];
  v15[2] = *MEMORY[0x1E4F17878];
  v15[3] = v4;
  v16[2] = &unk_1EF0503A8;
  v16[3] = &unk_1EF0503B8;
  uint64_t v5 = *MEMORY[0x1E4F17798];
  v15[4] = *MEMORY[0x1E4F177D0];
  v15[5] = v5;
  v16[4] = &unk_1EF0503C8;
  v16[5] = &unk_1EF0503D8;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  uint64_t v7 = [(ABAccountScorer *)self accountStore];
  v8 = ABAccountStoreGetAccountTypeForAccount((void *)v7, [(ABAccountScorer *)self account]);
  [(ABAccountScorer *)self setAccountType:v8];

  v9 = [(ABAccountScorer *)self accountType];
  LOBYTE(v7) = +[ABFacebookMigrator isAccountTypeFacebook:v9];

  if ((v7 & 1) == 0)
  {
    [(ABAccountScorer *)self setSourceID:[(ABAccountScorer *)self _findBestSourceID]];
    if ([(ABAccountScorer *)self sourceID] != -1)
    {
      v10 = [(ABAccountScorer *)self accountType];
      id v11 = [v6 objectForKeyedSubscript:v10];

      if (v11) {
        [v11 doubleValue];
      }
      else {
        double v12 = 1.0;
      }
      [(ABAccountScorer *)self setScore:v12];
      int v13 = [(ABAccountScorer *)self sourceID];
      if (v13 == [(ABAccountScorer *)self defaultSourceID])
      {
        [(ABAccountScorer *)self score];
        [(ABAccountScorer *)self setScore:v14 + 0.5];
      }
    }
  }
}

- (int)_findBestSourceID
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ABRecordRef DefaultSourceForAccount = ABAddressBookGetDefaultSourceForAccount([(ABAccountScorer *)self addressBook], (uint64_t)[(ABAccountScorer *)self account]);
  if (DefaultSourceForAccount)
  {
    return ABRecordGetRecordID(DefaultSourceForAccount);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = (id)ABAddressBookCopyArrayOfAllSourcesInAccount((uint64_t)[(ABAccountScorer *)self addressBook], [(ABAccountScorer *)self account]);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(const void **)(*((void *)&v12 + 1) + 8 * i);
          if (!ABSourceIsContentReadonly((uint64_t)v10))
          {
            ABRecordID RecordID = ABRecordGetRecordID(v10);
            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    ABRecordID RecordID = -1;
LABEL_15:

    return RecordID;
  }
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
}

- (int)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int)a3
{
  self->_sourceID = a3;
}

- (void)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(void *)a3
{
  self->_addressBook = a3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void)account
{
  return self->_account;
}

- (void)setAccount:(void *)a3
{
  self->_account = a3;
}

- (int)defaultSourceID
{
  return self->_defaultSourceID;
}

- (void)setDefaultSourceID:(int)a3
{
  self->_defaultSourceID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
}

@end