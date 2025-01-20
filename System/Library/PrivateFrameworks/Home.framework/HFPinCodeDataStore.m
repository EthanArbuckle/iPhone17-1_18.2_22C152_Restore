@interface HFPinCodeDataStore
- (HFPinCode)currentUserPinCode;
- (HFPinCodeDataStore)init;
- (NSMutableDictionary)guestPINCodes;
- (NSMutableDictionary)otherEcosystemGuestPINCodes;
- (NSMutableDictionary)removedUserPINCodes;
- (NSMutableDictionary)userPINCodes;
- (id)guestPinCodeFromItem:(id)a3;
- (id)pinCodeForCodeValue:(id)a3;
- (id)pinCodeFromItem:(id)a3;
- (void)mergeData:(id)a3;
- (void)setCurrentUserPinCode:(id)a3;
- (void)setGuestPINCodes:(id)a3;
- (void)setOtherEcosystemGuestPINCodes:(id)a3;
- (void)setRemovedUserPINCodes:(id)a3;
- (void)setUserPINCodes:(id)a3;
- (void)updateWithPinCode:(id)a3 forOldCodeValue:(id)a4;
@end

@implementation HFPinCodeDataStore

- (HFPinCodeDataStore)init
{
  v12.receiver = self;
  v12.super_class = (Class)HFPinCodeDataStore;
  v2 = [(HFPinCodeDataStore *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    userPINCodes = v2->_userPINCodes;
    v2->_userPINCodes = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    removedUserPINCodes = v2->_removedUserPINCodes;
    v2->_removedUserPINCodes = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    guestPINCodes = v2->_guestPINCodes;
    v2->_guestPINCodes = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    otherEcosystemGuestPINCodes = v2->_otherEcosystemGuestPINCodes;
    v2->_otherEcosystemGuestPINCodes = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (void)mergeData:(id)a3
{
  id v12 = a3;
  v4 = [(HFPinCodeDataStore *)self userPINCodes];
  uint64_t v5 = [v12 userPINCodes];
  [v4 addEntriesFromDictionary:v5];

  v6 = [(HFPinCodeDataStore *)self removedUserPINCodes];
  uint64_t v7 = [v12 removedUserPINCodes];
  [v6 addEntriesFromDictionary:v7];

  v8 = [(HFPinCodeDataStore *)self guestPINCodes];
  uint64_t v9 = [v12 guestPINCodes];
  [v8 addEntriesFromDictionary:v9];

  v10 = [v12 currentUserPinCode];

  if (v10)
  {
    v11 = [v12 currentUserPinCode];
    [(HFPinCodeDataStore *)self setCurrentUserPinCode:v11];
  }
}

- (id)pinCodeFromItem:(id)a3
{
  id v4 = a3;
  if ([v4 isUnknownGuestFromMatter])
  {
    uint64_t v5 = [(HFPinCodeDataStore *)self otherEcosystemGuestPINCodes];
    v6 = [v4 unknownMatterGuestUniqueID];
    uint64_t v7 = [v5 objectForKey:v6];
  }
  else
  {
    uint64_t v5 = [v4 pinCodeValue];
    uint64_t v7 = [(HFPinCodeDataStore *)self pinCodeForCodeValue:v5];
  }

  return v7;
}

- (id)pinCodeForCodeValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFPinCodeDataStore *)self guestPINCodes];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = [(HFPinCodeDataStore *)self userPINCodes];
    v6 = [v7 objectForKey:v4];
  }
  return v6;
}

- (id)guestPinCodeFromItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPinCodeDataStore *)self guestPINCodes];
  v6 = [v4 pinCodeValue];
  uint64_t v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    if (![v4 isUnknownGuestFromMatter]) {
      goto LABEL_4;
    }
    v8 = [(HFPinCodeDataStore *)self otherEcosystemGuestPINCodes];
    uint64_t v9 = [v4 unknownMatterGuestUniqueID];
    uint64_t v7 = [v8 objectForKey:v9];

    if (!v7)
    {
LABEL_4:
      v10 = [(HFPinCodeDataStore *)self userPINCodes];
      v11 = [v4 pinCodeValue];
      id v12 = [v10 objectForKey:v11];

      if (v12)
      {
        v13 = HFLogForCategory(0x33uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315138;
          v16 = "-[HFPinCodeDataStore guestPinCodeFromItem:]";
          _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "(%s) Expected a guest PIN Code, but found a user code instead.", (uint8_t *)&v15, 0xCu);
        }
      }
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (void)updateWithPinCode:(id)a3 forOldCodeValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 pinCodeValue];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__HFPinCodeDataStore_updateWithPinCode_forOldCodeValue___block_invoke;
    aBlock[3] = &unk_264096B80;
    id v9 = v7;
    id v19 = v9;
    id v20 = v8;
    id v21 = v6;
    id v10 = v8;
    v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    id v12 = [(HFPinCodeDataStore *)self guestPINCodes];
    v13 = [v12 objectForKey:v9];

    if (v13)
    {
      uint64_t v14 = [(HFPinCodeDataStore *)self guestPINCodes];
    }
    else
    {
      int v15 = [(HFPinCodeDataStore *)self userPINCodes];
      v16 = [v15 objectForKey:v9];

      if (!v16)
      {
        NSLog(&cfstr_CouldNotFindPi.isa);
        goto LABEL_8;
      }
      uint64_t v14 = [(HFPinCodeDataStore *)self userPINCodes];
    }
    uint64_t v17 = (void *)v14;
    v11[2](v11, v14);

LABEL_8:
    goto LABEL_9;
  }
  NSLog(&cfstr_TryingToUpdate.isa);
LABEL_9:
}

void __56__HFPinCodeDataStore_updateWithPinCode_forOldCodeValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)] & 1) == 0) {
    [v3 removeObjectForKey:*(void *)(a1 + 32)];
  }
  [v3 setValue:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)userPINCodes
{
  return self->_userPINCodes;
}

- (void)setUserPINCodes:(id)a3
{
}

- (NSMutableDictionary)removedUserPINCodes
{
  return self->_removedUserPINCodes;
}

- (void)setRemovedUserPINCodes:(id)a3
{
}

- (NSMutableDictionary)guestPINCodes
{
  return self->_guestPINCodes;
}

- (void)setGuestPINCodes:(id)a3
{
}

- (NSMutableDictionary)otherEcosystemGuestPINCodes
{
  return self->_otherEcosystemGuestPINCodes;
}

- (void)setOtherEcosystemGuestPINCodes:(id)a3
{
}

- (HFPinCode)currentUserPinCode
{
  return self->_currentUserPinCode;
}

- (void)setCurrentUserPinCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserPinCode, 0);
  objc_storeStrong((id *)&self->_otherEcosystemGuestPINCodes, 0);
  objc_storeStrong((id *)&self->_guestPINCodes, 0);
  objc_storeStrong((id *)&self->_removedUserPINCodes, 0);
  objc_storeStrong((id *)&self->_userPINCodes, 0);
}

@end