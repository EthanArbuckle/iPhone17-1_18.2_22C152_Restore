@interface HFUserPhotosLibraryItem
- (HFUserPhotosLibraryItem)init;
- (HFUserPhotosLibraryItem)initWithUser:(id)a3 inHome:(id)a4;
- (HMHome)home;
- (HMUser)user;
- (NSString)description;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFUserPhotosLibraryItem

- (HFUserPhotosLibraryItem)initWithUser:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v8, "hf_allUsersIncludingCurrentUser");
  char v10 = [v9 containsObject:v7];

  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)HFUserPhotosLibraryItem;
    v11 = [(HFUserPhotosLibraryItem *)&v16 init];
    p_isa = (id *)&v11->super.super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_user, a3);
      objc_storeStrong(p_isa + 7, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v14 = objc_msgSend(v8, "hf_allUsersIncludingCurrentUser");
    NSLog(&cfstr_SHomeDoesnTInc.isa, self, "-[HFUserPhotosLibraryItem initWithUser:inHome:]", v8, v7, v14);

    v13 = 0;
  }

  return v13;
}

- (HFUserPhotosLibraryItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithUser_inHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUserPhotosLibraryItem.m", 42, @"%s is unavailable; use %@ instead",
    "-[HFUserPhotosLibraryItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFUserPhotosLibraryItem *)self user];
  v6 = [(HFUserPhotosLibraryItem *)self home];
  id v7 = (void *)[v4 initWithUser:v5 inHome:v6];

  [v7 copyLatestResultsFromItem:self];
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v56[1] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  v5 = [(HFUserPhotosLibraryItem *)self user];
  v6 = [HFUserNameFormatter alloc];
  id v7 = [(HFUserPhotosLibraryItem *)self home];
  id v8 = [(HFUserNameFormatter *)v6 initWithHome:v7];

  [(HFUserNameFormatter *)v8 setStyle:0];
  v9 = [(HFUserPhotosLibraryItem *)self home];
  char v10 = objc_msgSend(v9, "hf_handleForUser:", v5);

  if (+[HFUtilities isAMac])
  {
    v11 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:1000];
    v56[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:1];

    v13 = +[HFContactStore defaultStore];
    v14 = [v13 contactForUserHandle:v10 withKeys:v12];

    v15 = [MEMORY[0x263EFEA20] stringFromContact:v14 style:1000];
  }
  else
  {
    v15 = [(HFUserNameFormatter *)v8 stringForObjectValue:v10];
  }
  v22 = HFLocalizedStringWithFormat(@"HFFaceRecognitionUsersPhotosLibraryTableViewCellTitle", @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  [v4 setObject:v22 forKeyedSubscript:@"title"];

  v23 = NSNumber;
  v24 = [(HFUserPhotosLibraryItem *)self home];
  v25 = [v24 personManagerSettings];
  v26 = objc_msgSend(v23, "numberWithInt:", objc_msgSend(v25, "isFaceClassificationEnabled") ^ 1);
  [v4 setObject:v26 forKeyedSubscript:@"isDisabled"];

  v27 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v4 setObject:v27 forKeyedSubscript:@"dependentHomeKitClasses"];

  v28 = [v5 photosPersonManagerSettings];
  if (v28)
  {
    v49 = v15;
    v29 = v8;
    v30 = v10;
    v31 = [(HFUserPhotosLibraryItem *)self user];
    v32 = [(HFUserPhotosLibraryItem *)self home];
    v33 = [v32 currentUser];
    int v34 = [v31 isEqual:v33];

    int v35 = [v28 isImportingFromPhotoLibraryEnabled];
    if (v34)
    {
      if (v35)
      {
        if ([v28 isSharingFaceClassificationsEnabled]) {
          v36 = @"HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextAnyoneInHome";
        }
        else {
          v36 = @"HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextOnlyMe";
        }
      }
      else
      {
        v36 = @"HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextNotConnected";
      }
      char v10 = v30;
    }
    else
    {
      char v10 = v30;
      if (!v35 || ([v28 isSharingFaceClassificationsEnabled] & 1) == 0)
      {
        [v4 setObject:0 forKeyedSubscript:@"description"];
        uint64_t v41 = 1;
        id v8 = v29;
LABEL_20:
        v15 = v49;
        goto LABEL_21;
      }
      v36 = @"HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextShared";
    }
    id v8 = v29;
    v42 = _HFLocalizedStringWithDefaultValue(v36, v36, 1);
    [v4 setObject:v42 forKeyedSubscript:@"description"];

    v43 = [(HFUserPhotosLibraryItem *)self home];
    v44 = [v43 personManagerSettings];
    uint64_t v41 = [v44 isFaceClassificationEnabled] ^ 1;

    goto LABEL_20;
  }
  v37 = NSString;
  v38 = [v5 name];
  v39 = [v37 stringWithFormat:@"externalPersonManagerSettings is nil for user %@", v38];

  v40 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v51 = self;
    __int16 v52 = 2080;
    v53 = "-[HFUserPhotosLibraryItem _subclass_updateWithOptions:]";
    __int16 v54 = 2112;
    v55 = v39;
    _os_log_impl(&dword_20B986000, v40, OS_LOG_TYPE_DEFAULT, "%@ (%s): %@", buf, 0x20u);
  }

  uint64_t v41 = 1;
LABEL_21:
  v45 = [NSNumber numberWithBool:v41];
  [v4 setObject:v45 forKeyedSubscript:@"hidden"];

  v46 = [[HFItemUpdateOutcome alloc] initWithResults:v4];
  v47 = [MEMORY[0x263F58190] futureWithResult:v46];

  return v47;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFUserPhotosLibraryItem *)self user];
  v5 = [v4 name];
  [v3 appendString:v5 withName:@"user"];

  v6 = [(HFUserPhotosLibraryItem *)self home];
  id v7 = [v6 description];
  [v3 appendString:v7 withName:@"home"];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end