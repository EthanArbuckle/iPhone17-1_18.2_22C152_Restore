@interface AMSBagDataSourceChange
- (AMSBagDataSourceChange)initWithProfile:(id)a3 profileVersion:(id)a4 originalData:(id)a5 originalExpirationDate:(id)a6 updatedData:(id)a7 updatedExpirationDate:(id)a8 changedKeys:(id)a9 loadedBagIdentifier:(id)a10 loadedBagPartialIdentifier:(id)a11 accountIdentifier:(id)a12;
- (NSDate)originalExpirationDate;
- (NSDate)updatedExpirationDate;
- (NSDictionary)originalData;
- (NSDictionary)updatedData;
- (NSSet)changedKeys;
- (NSString)accountIdentifier;
- (NSString)loadedBagIdentifier;
- (NSString)loadedBagPartialIdentifier;
- (NSString)profile;
- (NSString)profileVersion;
@end

@implementation AMSBagDataSourceChange

- (AMSBagDataSourceChange)initWithProfile:(id)a3 profileVersion:(id)a4 originalData:(id)a5 originalExpirationDate:(id)a6 updatedData:(id)a7 updatedExpirationDate:(id)a8 changedKeys:(id)a9 loadedBagIdentifier:(id)a10 loadedBagPartialIdentifier:(id)a11 accountIdentifier:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id obj = a6;
  id v20 = a6;
  v21 = v17;
  id v55 = v20;
  id v22 = a7;
  id v53 = a8;
  id v54 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  if (!v21)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagDataSourceChange.m", 26, @"Unexpected nil reference: %s", "profile");
  }
  v27 = v18;
  if (!v18)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagDataSourceChange.m", 27, @"Unexpected nil reference: %s", "profileVersion");
  }
  v28 = v23;
  if (v22)
  {
    if (v24) {
      goto LABEL_7;
    }
  }
  else
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagDataSourceChange.m", 28, @"Unexpected nil reference: %s", "updatedData");

    if (v24) {
      goto LABEL_7;
    }
  }
  v50 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AMSBagDataSourceChange.m", 29, @"Unexpected nil reference: %s", "loadedBagIdentifier");

LABEL_7:
  v57.receiver = self;
  v57.super_class = (Class)AMSBagDataSourceChange;
  v29 = [(AMSBagDataSourceChange *)&v57 init];
  if (v29)
  {
    uint64_t v30 = [v21 copy];
    profile = v29->_profile;
    v29->_profile = (NSString *)v30;

    uint64_t v32 = [v27 copy];
    profileVersion = v29->_profileVersion;
    v29->_profileVersion = (NSString *)v32;

    uint64_t v34 = [v19 copy];
    originalData = v29->_originalData;
    v29->_originalData = (NSDictionary *)v34;

    objc_storeStrong((id *)&v29->_originalExpirationDate, obj);
    uint64_t v36 = [v22 copy];
    updatedData = v29->_updatedData;
    v29->_updatedData = (NSDictionary *)v36;

    objc_storeStrong((id *)&v29->_updatedExpirationDate, v53);
    uint64_t v38 = [v28 copy];
    changedKeys = v29->_changedKeys;
    v29->_changedKeys = (NSSet *)v38;

    uint64_t v40 = [v24 copy];
    loadedBagIdentifier = v29->_loadedBagIdentifier;
    v29->_loadedBagIdentifier = (NSString *)v40;

    uint64_t v42 = [v25 copy];
    loadedBagPartialIdentifier = v29->_loadedBagPartialIdentifier;
    v29->_loadedBagPartialIdentifier = (NSString *)v42;

    uint64_t v44 = [v26 copy];
    accountIdentifier = v29->_accountIdentifier;
    v29->_accountIdentifier = (NSString *)v44;
  }
  return v29;
}

- (NSSet)changedKeys
{
  return self->_changedKeys;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDictionary)updatedData
{
  return self->_updatedData;
}

- (NSDate)updatedExpirationDate
{
  return self->_updatedExpirationDate;
}

- (NSString)loadedBagPartialIdentifier
{
  return self->_loadedBagPartialIdentifier;
}

- (NSString)loadedBagIdentifier
{
  return self->_loadedBagIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeys, 0);
  objc_storeStrong((id *)&self->_updatedExpirationDate, 0);
  objc_storeStrong((id *)&self->_updatedData, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_originalExpirationDate, 0);
  objc_storeStrong((id *)&self->_originalData, 0);
  objc_storeStrong((id *)&self->_loadedBagPartialIdentifier, 0);
  objc_storeStrong((id *)&self->_loadedBagIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (NSDictionary)originalData
{
  return self->_originalData;
}

- (NSDate)originalExpirationDate
{
  return self->_originalExpirationDate;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

@end