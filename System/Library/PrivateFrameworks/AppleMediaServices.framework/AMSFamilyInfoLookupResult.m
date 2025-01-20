@interface AMSFamilyInfoLookupResult
+ (id)_familyMembersFromDictionaryRepresentation:(id)a3;
- (AMSFamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4;
- (BOOL)isCached;
- (BOOL)isHeadOfHouseholdSharingPayment;
- (NSArray)familyMembers;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)headOfHouseholdICloudDSID;
- (id)description;
@end

@implementation AMSFamilyInfoLookupResult

- (AMSFamilyInfoLookupResult)initWithDictionaryRepresentation:(id)a3 cached:(BOOL)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSFamilyInfoLookupResult;
  v7 = [(AMSFamilyInfoLookupResult *)&v18 init];
  v8 = v7;
  if (v7)
  {
    v7->_cached = a4;
    v9 = [v6 valueForKeyPath:@"family.ICloudHohDsid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10) {
      v11 = v10;
    }
    else {
      v11 = &unk_1EDD012A0;
    }
    objc_storeStrong((id *)&v8->_headOfHouseholdICloudDSID, v11);

    v12 = [v6 valueForKeyPath:@"family.hohSharingPayment"];
    if (objc_opt_respondsToSelector())
    {
      v13 = [v6 valueForKeyPath:@"family.hohSharingPayment"];
      v8->_headOfHouseholdSharingPayment = [v13 BOOLValue];
    }
    else
    {
      v8->_headOfHouseholdSharingPayment = 0;
    }

    uint64_t v14 = +[AMSFamilyInfoLookupResult _familyMembersFromDictionaryRepresentation:v6];
    v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v8->_familyMembers, v16);
  }
  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(AMSFamilyInfoLookupResult *)self familyMembers];
  v4 = objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_52);

  v12 = @"family";
  v11[0] = v4;
  v10[0] = @"members";
  v10[1] = @"hohSharingPayment";
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSFamilyInfoLookupResult isHeadOfHouseholdSharingPayment](self, "isHeadOfHouseholdSharingPayment"));
  v11[1] = v5;
  v10[2] = @"ICloudHohDsid";
  id v6 = [(AMSFamilyInfoLookupResult *)self headOfHouseholdICloudDSID];
  v11[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return (NSDictionary *)v8;
}

uint64_t __53__AMSFamilyInfoLookupResult_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)description
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"isCached";
  if ([(AMSFamilyInfoLookupResult *)self isCached]) {
    v3 = @"true";
  }
  else {
    v3 = @"false";
  }
  v11[0] = v3;
  v10[1] = @"hohSharingPayment";
  if ([(AMSFamilyInfoLookupResult *)self isHeadOfHouseholdSharingPayment]) {
    v4 = @"true";
  }
  else {
    v4 = @"false";
  }
  v11[1] = v4;
  v10[2] = @"ICloudHohDsid";
  v5 = [(AMSFamilyInfoLookupResult *)self headOfHouseholdICloudDSID];
  v11[2] = v5;
  void v10[3] = @"familyMembers";
  id v6 = [(AMSFamilyInfoLookupResult *)self familyMembers];
  void v11[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v8 = [self ams_generateDescriptionWithSubObjects:v7];

  return v8;
}

+ (id)_familyMembersFromDictionaryRepresentation:(id)a3
{
  v3 = [a3 valueForKeyPath:@"family.members"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_40);
  id v6 = objc_msgSend(v5, "ams_filterUsingTest:", &__block_literal_global_45_0);

  v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v8 = objc_msgSend(v7, "ams_activeiCloudAccount");
  v9 = objc_msgSend(v8, "ams_DSID");

  id v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
  v12 = objc_msgSend(v11, "ams_DSID");

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_3;
  v20[3] = &unk_1E55A28F0;
  id v13 = v9;
  id v21 = v13;
  id v14 = v12;
  id v22 = v14;
  v15 = objc_msgSend(v6, "ams_firstObjectPassingTest:", v20);
  if (!v15)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_4;
    v18[3] = &unk_1E55A2918;
    id v19 = v14;
    v15 = objc_msgSend(v6, "ams_firstObjectPassingTest:", v18);
  }
  [v15 setCurrentSignedInUser:1];
  v16 = [v6 sortedArrayUsingComparator:&__block_literal_global_50];

  return v16;
}

id __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [[AMSFamilyMember alloc] initWithDictionaryRepresentation:v2];
    id v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      v5 = [MEMORY[0x1E4F1CA98] null];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }

  return v6;
}

BOOL __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CA98];
  id v3 = a2;
  id v4 = [v2 null];

  return v4 != v3;
}

uint64_t __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v5 = [v3 iCloudDSID];
    if ([v5 isEqualToNumber:*(void *)(a1 + 32)] && *(void *)(a1 + 40))
    {
      id v6 = [v4 iTunesDSID];
      uint64_t v7 = [v6 isEqualToNumber:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_4(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  id v3 = [a2 iTunesDSID];
  uint64_t v4 = [v3 isEqualToNumber:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __72__AMSFamilyInfoLookupResult__familyMembersFromDictionaryRepresentation___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 firstName];
  if (v6)
  {
  }
  else
  {
    uint64_t v7 = [v5 firstName];

    if (!v7) {
      goto LABEL_11;
    }
  }
  if (([v4 isCurrentSignedInUser] & 1) != 0
    || ([v5 firstName], v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    uint64_t v7 = -1;
  }
  else if (([v5 isCurrentSignedInUser] & 1) != 0 {
         || ([v4 firstName], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  }
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v10 = [v4 firstName];
    v11 = [v5 firstName];
    uint64_t v7 = [v10 localizedCaseInsensitiveCompare:v11];
  }
LABEL_11:

  return v7;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (NSNumber)headOfHouseholdICloudDSID
{
  return self->_headOfHouseholdICloudDSID;
}

- (BOOL)isHeadOfHouseholdSharingPayment
{
  return self->_headOfHouseholdSharingPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headOfHouseholdICloudDSID, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end