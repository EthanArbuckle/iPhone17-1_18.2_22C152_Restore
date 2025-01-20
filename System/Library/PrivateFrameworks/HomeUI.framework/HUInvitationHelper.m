@interface HUInvitationHelper
+ (id)_dateFormatter;
+ (id)dateFormatter;
- (BOOL)isUnknownContact;
- (CNContact)inviterContact;
- (CNContactFormatter)contactsFormatter;
- (HFContactController)contactsController;
- (HMIncomingHomeInvitation)invitation;
- (HUInvitationHelper)initWithMode:(unint64_t)a3;
- (HUInvitationHelperDelegate)delegate;
- (NSArray)familyMembers;
- (NSString)detailText;
- (NSString)homeInvitationTitle;
- (NSString)inviterID;
- (id)requiredKeyDescriptors;
- (unint64_t)mode;
- (void)_updateInviterContactInfo;
- (void)contactController:(id)a3 didFinishDownloadingFamilyMemberAvatar:(id)a4;
- (void)setContactsController:(id)a3;
- (void)setContactsFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyMembers:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setInviterContact:(id)a3;
- (void)setInviterID:(id)a3;
- (void)setIsUnknownContact:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation HUInvitationHelper

- (HUInvitationHelper)initWithMode:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)HUInvitationHelper;
  v4 = [(HUInvitationHelper *)&v18 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    contactsFormatter = v5->_contactsFormatter;
    v5->_contactsFormatter = v6;

    id v8 = objc_alloc(MEMORY[0x1E4F69088]);
    v9 = [(HUInvitationHelper *)v5 requiredKeyDescriptors];
    uint64_t v10 = [v8 initWithKeyDescriptors:v9];
    contactsController = v5->_contactsController;
    v5->_contactsController = (HFContactController *)v10;

    [(HFContactController *)v5->_contactsController setDelegate:v5];
    familyMembers = v5->_familyMembers;
    v5->_familyMembers = (NSArray *)MEMORY[0x1E4F1CBF0];

    objc_initWeak(&location, v5);
    v13 = v5->_contactsController;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __35__HUInvitationHelper_initWithMode___block_invoke;
    v15[3] = &unk_1E6386408;
    objc_copyWeak(&v16, &location);
    [(HFContactController *)v13 fetchFamilyMembersWithCompletion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __35__HUInvitationHelper_initWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "Fetched family members: %@", (uint8_t *)&v13, 0xCu);
  }

  v6 = (void *)[v3 copy];
  [WeakRetained setFamilyMembers:v6];

  v7 = [WeakRetained invitation];

  if (v7)
  {
    [WeakRetained _updateInviterContactInfo];
    uint64_t v8 = [WeakRetained delegate];
    if (v8)
    {
      v9 = (void *)v8;
      uint64_t v10 = [WeakRetained delegate];
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        v12 = [WeakRetained delegate];
        [v12 invitationUtilityDidUpdateInformation:WeakRetained];
      }
    }
  }
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
  if (a3)
  {
    [(HUInvitationHelper *)self _updateInviterContactInfo];
  }
  else
  {
    [(HUInvitationHelper *)self setInviterContact:0];
    [(HUInvitationHelper *)self setIsUnknownContact:1];
  }
}

- (void)_updateInviterContactInfo
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUInvitationHelper *)self requiredKeyDescriptors];
  v4 = [(HUInvitationHelper *)self invitation];
  v5 = [v4 inviter];
  v6 = [v5 userID];

  if (!v6)
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v21 = [(HUInvitationHelper *)self invitation];
      v22 = [v21 inviter];
      v23 = objc_msgSend(v22, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Inviter userID is nil - %@", buf, 0xCu);
    }
    id v9 = 0;
    goto LABEL_14;
  }
  v7 = [MEMORY[0x1E4F29088] componentsWithString:v6];
  uint64_t v8 = [v7 scheme];
  if ([v8 isEqualToString:@"mailto"])
  {
  }
  else
  {
    uint64_t v10 = [v7 scheme];
    int v11 = [v10 isEqualToString:@"tel"];

    if (!v11) {
      goto LABEL_9;
    }
  }
  uint64_t v12 = [v7 path];

  v6 = (void *)v12;
LABEL_9:
  [(HUInvitationHelper *)self setInviterID:v6];
  int v13 = [(HUInvitationHelper *)self familyMembers];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__HUInvitationHelper__updateInviterContactInfo__block_invoke;
  v24[3] = &unk_1E6386430;
  id v9 = v6;
  id v25 = v9;
  id v14 = objc_msgSend(v13, "na_firstObjectPassingTest:", v24);

  if (!v14)
  {
    v19 = [MEMORY[0x1E4F69088] contactForAppleID:v9 keyDescriptors:v3];
    [(HUInvitationHelper *)self setInviterContact:v19];

LABEL_14:
    id v14 = [(HUInvitationHelper *)self inviterContact];
    v20 = [v14 givenName];
    -[HUInvitationHelper setIsUnknownContact:](self, "setIsUnknownContact:", [v9 isEqualToString:v20]);

    goto LABEL_15;
  }
  uint64_t v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Inviter matches a family member", buf, 2u);
  }

  id v16 = [(HUInvitationHelper *)self contactsController];
  v17 = [v14 dsid];
  objc_super v18 = [v16 contactForFamilyMemberWithDsid:v17];
  [(HUInvitationHelper *)self setInviterContact:v18];

  [(HUInvitationHelper *)self setIsUnknownContact:0];
LABEL_15:
}

uint64_t __47__HUInvitationHelper__updateInviterContactInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 memberPhoneNumbers];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [v3 appleID];
    uint64_t v5 = [v6 isEqualToString:*(void *)(a1 + 32)];
  }
  return v5;
}

- (NSString)homeInvitationTitle
{
  BOOL v3 = [(HUInvitationHelper *)self isUnknownContact];
  unint64_t v4 = [(HUInvitationHelper *)self mode];
  unint64_t v5 = v4;
  if (v3)
  {
    if (v4 == 1) {
      v6 = @"HUUserManagementInvitation_UnknownInviteHomeName_Onboarding";
    }
    else {
      v6 = @"HUUserManagementInvitation_UnknownInviteHomeName_HomeSettings";
    }
    goto LABEL_8;
  }
  v7 = [(HUInvitationHelper *)self invitation];
  uint64_t v8 = v7;
  if (v5)
  {
    int v9 = [v7 isInviteeRestrictedGuest];

    if (v9)
    {
      v6 = @"HUUserManagementInvitation_Onboarding_RestrictedGuest";
LABEL_8:
      uint64_t v10 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
      goto LABEL_12;
    }
    uint64_t v8 = [(HUInvitationHelper *)self invitation];
    int v11 = [v8 homeName];
    HULocalizedStringWithFormat(@"HUUserManagementInvitation_Onboarding_HomeName", @"%@", v18, v19, v20, v21, v22, v23, (uint64_t)v11);
  }
  else
  {
    int v11 = [v7 homeName];
    HULocalizedStringWithFormat(@"HUUserManagementInvitation_HomeSettingsCell_HomeName", @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
  uint64_t v10 = };

LABEL_12:

  return (NSString *)v10;
}

- (NSString)detailText
{
  BOOL v3 = [(id)objc_opt_class() _dateFormatter];
  unint64_t v4 = (void *)[v3 copy];
  [v4 setDateStyle:1];
  [v4 setTimeStyle:0];
  [v4 setDoesRelativeDateFormatting:1];
  unint64_t v5 = (void *)[v4 copy];
  [v5 setDateStyle:0];
  [v5 setTimeStyle:1];
  v6 = [(HUInvitationHelper *)self invitation];
  v7 = [v6 startDate];

  uint64_t v8 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  int v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
  int v11 = [v8 startOfDayForDate:v9];
  uint64_t v12 = objc_msgSend(v10, "hf_dateByAddingDays:toDate:", -1, v11);

  v79 = (void *)v12;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v9];
  v78 = v13;
  if ([(HUInvitationHelper *)self mode])
  {
    if ([(HUInvitationHelper *)self isUnknownContact])
    {
      if ([v13 containsDate:v7])
      {
        uint64_t v14 = [v4 stringFromDate:v7];
        uint64_t v15 = [v5 stringFromDate:v7];
        v73 = [(HUInvitationHelper *)self inviterID];
        uint64_t v22 = HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_RelativeDate_UnknownContact", @"%@ %@ %@", v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      }
      else
      {
        uint64_t v14 = [v3 stringFromDate:v7];
        uint64_t v15 = [(HUInvitationHelper *)self inviterID];
        uint64_t v22 = HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_OtherDate_UnknownContact", @"%@ %@", v52, v53, v54, v55, v56, v57, (uint64_t)v14);
      }
      goto LABEL_16;
    }
    v75 = v8;
    v42 = [(HUInvitationHelper *)self invitation];
    int v43 = [v42 isInviteeRestrictedGuest];

    if (v43)
    {
      uint64_t v14 = [(HUInvitationHelper *)self contactsFormatter];
      uint64_t v15 = [(HUInvitationHelper *)self inviterContact];
      v44 = [v14 stringFromContact:v15];
      [(HUInvitationHelper *)self invitation];
      v45 = v77 = v7;
      v72 = [v45 homeName];
      uint64_t v22 = HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_RestrictedGuest", @"%@ %@", v46, v47, v48, v49, v50, v51, (uint64_t)v44);

      v7 = v77;
    }
    else
    {
      if (![v13 containsDate:v7])
      {
        uint64_t v14 = [v3 stringFromDate:v7];
        uint64_t v15 = [(HUInvitationHelper *)self inviterID];
        uint64_t v22 = HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_OtherDate", @"%@ %@", v64, v65, v66, v67, v68, v69, (uint64_t)v14);
        goto LABEL_15;
      }
      uint64_t v14 = [v4 stringFromDate:v7];
      uint64_t v15 = [v5 stringFromDate:v7];
      v44 = [(HUInvitationHelper *)self inviterID];
      uint64_t v22 = HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_RelativeDate", @"%@ %@ %@", v58, v59, v60, v61, v62, v63, (uint64_t)v14);
    }

LABEL_15:
    uint64_t v8 = v75;
    goto LABEL_16;
  }
  v76 = v7;
  uint64_t v23 = [(HUInvitationHelper *)self contactsFormatter];
  v24 = [(HUInvitationHelper *)self inviterContact];
  id v25 = [v23 stringFromContact:v24];
  uint64_t v22 = HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_HomeSettings", @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);

  v32 = [(HUInvitationHelper *)self invitation];
  LODWORD(v25) = [v32 isInviteeRestrictedGuest];

  if (!v25)
  {
    v7 = v76;
    goto LABEL_17;
  }
  uint64_t v14 = [(HUInvitationHelper *)self contactsFormatter];
  uint64_t v15 = [(HUInvitationHelper *)self inviterContact];
  v33 = [v14 stringFromContact:v15];
  v34 = [(HUInvitationHelper *)self invitation];
  v71 = [v34 homeName];
  HULocalizedStringWithFormat(@"HUUserManagementInvitationInfo_HomeSettings_RestrictedGuest", @"%@ %@", v35, v36, v37, v38, v39, v40, (uint64_t)v33);
  uint64_t v41 = v74 = v3;

  uint64_t v22 = (void *)v41;
  BOOL v3 = v74;
  v7 = v76;
LABEL_16:

LABEL_17:

  return (NSString *)v22;
}

- (void)contactController:(id)a3 didFinishDownloadingFamilyMemberAvatar:(id)a4
{
  id v6 = a3;
  v7 = [a4 dsid];
  id v17 = [v6 contactForFamilyMemberWithDsid:v7];

  uint64_t v8 = [(HUInvitationHelper *)self inviterContact];
  int v9 = [v8 identifier];
  uint64_t v10 = [v17 identifier];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    [(HUInvitationHelper *)self setInviterContact:v17];
    uint64_t v12 = [(HUInvitationHelper *)self delegate];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [(HUInvitationHelper *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v16 = [(HUInvitationHelper *)self delegate];
        [v16 invitationUtilityDidUpdateInformation:self];
      }
    }
  }
}

+ (id)dateFormatter
{
  v2 = [(id)objc_opt_class() _dateFormatter];
  BOOL v3 = (void *)[v2 copy];

  return v3;
}

+ (id)_dateFormatter
{
  if (qword_1EBA477A8 != -1) {
    dispatch_once(&qword_1EBA477A8, &__block_literal_global_24);
  }
  v2 = (void *)_MergedGlobals_614;

  return v2;
}

uint64_t __36__HUInvitationHelper__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_614;
  _MergedGlobals_614 = (uint64_t)v0;

  [(id)_MergedGlobals_614 setTimeStyle:0];
  [(id)_MergedGlobals_614 setDateStyle:1];
  v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)_MergedGlobals_614 setLocale:v2];

  BOOL v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [(id)_MergedGlobals_614 setTimeZone:v3];

  unint64_t v4 = (void *)_MergedGlobals_614;

  return [v4 setFormattingContext:5];
}

- (id)requiredKeyDescriptors
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1BB38] descriptorForRequiredKeysWithThreeDTouchEnabled:1];
  v7[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = *MEMORY[0x1E4F1AEE0];
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];

  return v5;
}

- (HUInvitationHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUInvitationHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (CNContact)inviterContact
{
  return self->_inviterContact;
}

- (void)setInviterContact:(id)a3
{
}

- (BOOL)isUnknownContact
{
  return self->_isUnknownContact;
}

- (void)setIsUnknownContact:(BOOL)a3
{
  self->_isUnknownContact = a3;
}

- (HFContactController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
}

- (NSString)inviterID
{
  return self->_inviterID;
}

- (void)setInviterID:(id)a3
{
}

- (CNContactFormatter)contactsFormatter
{
  return self->_contactsFormatter;
}

- (void)setContactsFormatter:(id)a3
{
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_contactsFormatter, 0);
  objc_storeStrong((id *)&self->_inviterID, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong((id *)&self->_inviterContact, 0);
  objc_storeStrong((id *)&self->_invitation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end