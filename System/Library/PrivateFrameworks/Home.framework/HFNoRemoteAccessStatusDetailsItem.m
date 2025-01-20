@interface HFNoRemoteAccessStatusDetailsItem
- (HFNoRemoteAccessStatusDetailsItem)init;
- (HFNoRemoteAccessStatusDetailsItem)initWithHome:(id)a3;
- (HMHome)home;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFNoRemoteAccessStatusDetailsItem

- (HFNoRemoteAccessStatusDetailsItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFNoRemoteAccessStatusDetailsItem.m", 23, @"%s is unavailable; use %@ instead",
    "-[HFNoRemoteAccessStatusDetailsItem init]",
    v5);

  return 0;
}

- (HFNoRemoteAccessStatusDetailsItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFNoRemoteAccessStatusDetailsItem;
  v6 = [(HFNoRemoteAccessStatusDetailsItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  id v5 = [(HFNoRemoteAccessStatusDetailsItem *)self home];
  uint64_t v6 = objc_msgSend(v5, "hf_remoteAccessState");

  v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v8 = [v7 homeManager];
  char v9 = [v8 residentProvisioningStatus];

  if (v9)
  {
    [(HFMutableItemUpdateOutcome *)v4 setObject:&unk_26C0F65A0 forKeyedSubscript:@"priority"];
    if (v6 == 1) {
      v16 = @"HFStatusDetailsNeedsTwoFactorAuthTitle";
    }
    else {
      v16 = @"HFStatusDetailsRemoteAccessAvailableButNeedsTwoFactorAuthTitle";
    }
    v17 = _HFLocalizedStringWithDefaultValue(v16, v16, 1);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v17 forKeyedSubscript:@"title"];

    v18 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsNeedsTwoFactorAuthSettingsLink", @"HFStatusDetailsNeedsTwoFactorAuthSettingsLink", 1);
    v19 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsNeedsTwoFactorAuthLearnMoreLink", @"HFStatusDetailsNeedsTwoFactorAuthLearnMoreLink", 1);
    v26 = HFLocalizedStringWithFormat(@"HFStatusDetailsNeedsTwoFactorAuthDescriptionFormat", @"%1$@ %2$@", v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    v27 = objc_msgSend(NSURL, "hf_openiCloudPasswordAndSecurityURL");
    v28 = [NSURL URLWithString:@"https://support.apple.com/kb/HT204915"];
    v29 = objc_msgSend(MEMORY[0x263F086A0], "hf_attributedLinkStringForString:linkString:linkURL:", v26, v18, v27);
    v30 = objc_msgSend(MEMORY[0x263F086A0], "hf_attributedLinkStringForAttributedString:linkString:linkURL:", v29, v19, v28);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v30 forKeyedSubscript:@"description"];

    v37 = HFLocalizedStringWithFormat(@"HFStatusDetailsNeedsTwoFactorAuthShortDescriptionFormat", @"%1$@", v31, v32, v33, v34, v35, v36, (uint64_t)v18);
    v38 = objc_msgSend(MEMORY[0x263F086A0], "hf_attributedLinkStringForString:linkString:linkURL:", v37, v18, v27);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v38 forKeyedSubscript:@"shortDescription"];

    [(HFMutableItemUpdateOutcome *)v4 setObject:v28 forKeyedSubscript:@"destinationURL"];
LABEL_11:

LABEL_21:
    goto LABEL_22;
  }
  if ((v9 & 2) == 0 || v6 != 1)
  {
    if (v6 != 1
      || ([(HFNoRemoteAccessStatusDetailsItem *)self home],
          v39 = objc_claimAutoreleasedReturnValue(),
          int v40 = objc_msgSend(v39, "hf_isCurrentLocationHome"),
          v39,
          v40))
    {
      [(HFMutableItemUpdateOutcome *)v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
      goto LABEL_22;
    }
    [(HFMutableItemUpdateOutcome *)v4 setObject:&unk_26C0F65A0 forKeyedSubscript:@"priority"];
    v41 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsNoRemoteAccessTitle", @"HFStatusDetailsNoRemoteAccessTitle", 1);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v41 forKeyedSubscript:@"title"];

    v18 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsNoRemoteAccessDescription", @"HFStatusDetailsNoRemoteAccessDescription", 1);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v18 forKeyedSubscript:@"shortDescription"];
    v19 = +[HFURLComponents aboutResidentDeviceURL];
    id v42 = objc_alloc(MEMORY[0x263F089B8]);
    v43 = [v18 stringByAppendingString:@" "];
    v26 = (void *)[v42 initWithString:v43];

    id v44 = objc_alloc(MEMORY[0x263F086A0]);
    v45 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsNoRemoteAccessLearnMoreLink", @"HFStatusDetailsNoRemoteAccessLearnMoreLink", 1);
    uint64_t v52 = *MEMORY[0x263F1C258];
    v53 = v19;
    v46 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v47 = (void *)[v44 initWithString:v45 attributes:v46];
    [v26 appendAttributedString:v47];

    [(HFMutableItemUpdateOutcome *)v4 setObject:v26 forKeyedSubscript:@"description"];
    [(HFMutableItemUpdateOutcome *)v4 setObject:v19 forKeyedSubscript:@"destinationURL"];
    goto LABEL_11;
  }
  [(HFMutableItemUpdateOutcome *)v4 setObject:&unk_26C0F65A0 forKeyedSubscript:@"priority"];
  v10 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsNoRemoteAccessNotAtHomeTitle", @"HFStatusDetailsNoRemoteAccessNotAtHomeTitle", 1);
  [(HFMutableItemUpdateOutcome *)v4 setObject:v10 forKeyedSubscript:@"title"];

  v11 = [(HFNoRemoteAccessStatusDetailsItem *)self home];
  int v12 = objc_msgSend(v11, "hf_hasAppleTVs");

  v13 = [(HFNoRemoteAccessStatusDetailsItem *)self home];
  int v14 = objc_msgSend(v13, "hf_hasHomePods");

  if (v12 && v14)
  {
    v15 = @"HFStatusDetailsNoRemoteAccessDescription_AppleTVHomePod";
LABEL_20:
    v18 = _HFLocalizedStringWithDefaultValue(v15, v15, 1);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v18 forKeyedSubscript:@"description"];
    goto LABEL_21;
  }
  if (v12)
  {
    v15 = @"HFStatusDetailsNoRemoteAccessDescription_AppleTV";
    goto LABEL_20;
  }
  if (v14)
  {
    v15 = @"HFStatusDetailsNoRemoteAccessDescription_HomePod";
    goto LABEL_20;
  }
  v51 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v55 = self;
    _os_log_error_impl(&dword_20B986000, v51, OS_LOG_TYPE_ERROR, "%@ Asked to show 'No Remote Access' but there are no HomePods or Apple TVs in the home.", buf, 0xCu);
  }

LABEL_22:
  uint64_t v48 = MEMORY[0x263EFFA88];
  [(HFMutableItemUpdateOutcome *)v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"remoteAccessDependency"];
  [(HFMutableItemUpdateOutcome *)v4 setObject:v48 forKeyedSubscript:@"currentHomeDependency"];
  v49 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v49;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end