@interface HUSoftwareUpdateInfoItem
+ (id)_dateFormatter;
+ (id)_iconDescriptorForAccessories:(id)a3;
- (HUSoftwareUpdateInfoItem)init;
- (HUSoftwareUpdateInfoItem)initWithAccessories:(id)a3;
- (NSAttributedString)releaseNotesAttributedString;
- (NSSet)accessories;
- (NSString)releaseNotesHTMLString;
- (id)_releaseNotesResultsFuture;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)description;
- (void)setReleaseNotesAttributedString:(id)a3;
- (void)setReleaseNotesHTMLString:(id)a3;
@end

@implementation HUSoftwareUpdateInfoItem

+ (id)_dateFormatter
{
  if (qword_1EA12E0E0 != -1) {
    dispatch_once(&qword_1EA12E0E0, &__block_literal_global_161);
  }
  v2 = (void *)_MergedGlobals_3_8;

  return v2;
}

uint64_t __42__HUSoftwareUpdateInfoItem__dateFormatter__block_invoke()
{
  v0 = [MEMORY[0x1E4F69160] sharedInstance];
  uint64_t v1 = [v0 relativeDateFormatter];
  v2 = (void *)_MergedGlobals_3_8;
  _MergedGlobals_3_8 = v1;

  [(id)_MergedGlobals_3_8 setDateStyle:2];
  v3 = (void *)_MergedGlobals_3_8;

  return [v3 setTimeStyle:0];
}

+ (id)_iconDescriptorForAccessories:(id)a3
{
  id v3 = a3;
  v4 = [v3 anyObject];
  int v5 = objc_msgSend(v4, "hf_isMediaAccessory");

  if (v5)
  {
    v6 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_13_2);
    if ([v6 count] == 1)
    {
      v7 = [v6 anyObject];

      if (v7) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v8 = (void *)MEMORY[0x1E4F69548];
  v9 = [v3 anyObject];
  v7 = [v8 iconDescriptorForAccessory:v9];

LABEL_7:

  return v7;
}

id __58__HUSoftwareUpdateInfoItem__iconDescriptorForAccessories___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F692A8];
  id v3 = [a2 mediaProfile];
  v4 = [v2 mediaIconDescriptorForMediaContainer:v3];

  int v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v4);

  return v5;
}

- (HUSoftwareUpdateInfoItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  int v5 = NSStringFromSelector(sel_initWithAccessories_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateInfoItem.m", 72, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateInfoItem init]",
    v5);

  return 0;
}

- (HUSoftwareUpdateInfoItem)initWithAccessories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSoftwareUpdateInfoItem;
  v6 = [(HUSoftwareUpdateInfoItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessories, a3);
  }

  return v7;
}

- (id)_releaseNotesResultsFuture
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  id v24 = (id)*MEMORY[0x1E4F44470];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke;
  v18[3] = &unk_1E638D7C0;
  v18[4] = self;
  v18[5] = &v19;
  v4 = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke((uint64_t)v18);
  if (![v4 length] || !objc_msgSend((id)v20[5], "isEqual:", *MEMORY[0x1E4F443F0]))
  {
    [v3 setObject:v4 forKeyedSubscript:@"releaseNotesString"];
    [(HUSoftwareUpdateInfoItem *)self setReleaseNotesHTMLString:0];
    [(HUSoftwareUpdateInfoItem *)self setReleaseNotesAttributedString:0];
    goto LABEL_6;
  }
  id v5 = [(HUSoftwareUpdateInfoItem *)self releaseNotesHTMLString];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    v7 = [(HUSoftwareUpdateInfoItem *)self releaseNotesAttributedString];
    [v3 setObject:v7 forKeyedSubscript:@"releaseNotesAttributedString"];

LABEL_6:
    v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
    goto LABEL_7;
  }
  v10 = objc_msgSend(MEMORY[0x1E4F28B18], "hf_safeAttributedStringWithHTML:attributes:", v4, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_3;
  v15[3] = &unk_1E638D7E8;
  v15[4] = self;
  id v16 = v4;
  id v11 = v3;
  id v17 = v11;
  v12 = [v10 flatMap:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_4;
  v13[3] = &unk_1E6387340;
  id v14 = v11;
  v8 = [v12 recover:v13];

LABEL_7:
  _Block_object_dispose(&v19, 8);

  return v8;
}

__CFString *__54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessories];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_29_0);

  v4 = objc_msgSend(v3, "hf_softwareUpdateDocumentation");
  id v5 = [v4 releaseNotes];
  char v6 = [v5 stringValue];

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (id)*MEMORY[0x1E4F443F0]);
    v7 = [v4 releaseNotes];
LABEL_7:
    v12 = v7;
    v13 = [v7 stringValue];

    goto LABEL_8;
  }
  v8 = [v4 textReleaseNotes];
  objc_super v9 = [v8 stringValue];

  if (v9)
  {
    v7 = [v4 textReleaseNotes];
    goto LABEL_7;
  }
  v10 = [v4 releaseNotesSummary];
  id v11 = [v10 stringValue];

  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (id)*MEMORY[0x1E4F443F0]);
    v7 = [v4 releaseNotesSummary];
    goto LABEL_7;
  }
  v13 = &stru_1F18F92B8;
LABEL_8:

  return v13;
}

BOOL __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_softwareUpdateDocumentation");
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_3(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v4 setReleaseNotesHTMLString:v3];
  char v6 = objc_msgSend(v5, "hf_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters");

  [*(id *)(a1 + 32) setReleaseNotesAttributedString:v6];
  v7 = [*(id *)(a1 + 32) releaseNotesAttributedString];
  [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:@"releaseNotesAttributedString"];

  v8 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v9 = *(void *)(a1 + 48);

  return [v8 futureWithResult:v9];
}

uint64_t __54__HUSoftwareUpdateInfoItem__releaseNotesResultsFuture__block_invoke_4(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = [(HUSoftwareUpdateInfoItem *)self _releaseNotesResultsFuture];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1E6386B98;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  uint64_t v3 = [*(id *)(a1 + 40) accessories];
  uint64_t v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_39_1);

  id v5 = [NSNumber numberWithBool:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68C48]];

  id v6 = [*(id *)(a1 + 40) accessories];
  uint64_t v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_42_1) ^ 1;

  v8 = [NSNumber numberWithBool:v7];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v9 = [*(id *)(a1 + 40) accessories];
  uint64_t v10 = objc_msgSend(v9, "na_all:", &__block_literal_global_44);

  id v11 = [NSNumber numberWithBool:v10];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68C58]];

  v12 = [*(id *)(a1 + 40) accessories];
  v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_46_0);

  id v14 = [MEMORY[0x1E4F695B0] progressForAccessoriesDownloadingSoftwareUpdate:v13];
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68C60]];

  v15 = [*(id *)(a1 + 40) accessories];
  id v16 = [v15 anyObject];
  id v17 = objc_msgSend(v16, "hf_userFriendlyLocalizedCapitalizedDescription");
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v18 = objc_opt_class();
  uint64_t v19 = [*(id *)(a1 + 40) accessories];
  v20 = [v18 _iconDescriptorForAccessories:v19];
  [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

  uint64_t v21 = [*(id *)(a1 + 40) accessories];
  v22 = objc_msgSend(v21, "na_flatMap:", &__block_literal_global_49_0);
  [*(id *)(a1 + 32) setObject:v22 forKeyedSubscript:@"affectedAccessories"];

  v23 = [*(id *)(a1 + 40) accessories];
  id v24 = [v23 anyObject];
  v25 = [v24 manufacturer];
  v26 = v25;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateInfoItemProviderUnknownPublisher", @"HUSoftwareUpdateInfoItemProviderUnknownPublisher", 1);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  [*(id *)(a1 + 32) setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  v29 = [*(id *)(a1 + 40) accessories];
  v30 = [v29 anyObject];
  v31 = objc_msgSend(v30, "hf_softwareUpdateDisplayableVersion");

  if (v31)
  {
    uint64_t v38 = HULocalizedStringWithFormat(@"HUSoftwareUpdateVersionFormat", @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
    if (v38)
    {
      v39 = (void *)v38;
      [*(id *)(a1 + 32) setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F68A58]];
    }
  }
  v40 = [*(id *)(a1 + 40) accessories];
  v41 = [v40 anyObject];
  v42 = objc_msgSend(v41, "hf_softwareUpdateReleaseDate");

  if (v42)
  {
    v43 = [(id)objc_opt_class() _dateFormatter];
    v44 = [v43 stringFromDate:v42];
  }
  else
  {
    v44 = 0;
  }
  v45 = [*(id *)(a1 + 40) accessories];
  v46 = [v45 anyObject];
  unint64_t v47 = objc_msgSend(v46, "hf_softwareUpdateDownloadSize");

  if (v47 < 2)
  {
    v55 = 0;
LABEL_15:
    if (v44)
    {
      id v56 = v44;
    }
    else
    {
      id v56 = v55;
      v55 = v56;
    }
    goto LABEL_18;
  }
  uint64_t v48 = [MEMORY[0x1E4F28B68] stringFromByteCount:v47 countStyle:0];
  v55 = (void *)v48;
  if (!v42 || !v48) {
    goto LABEL_15;
  }
  HULocalizedStringWithFormat(@"HUSoftwareUpdateCombinedReleaseDateAndSizeFormat", @"%@%@", v49, v50, v51, v52, v53, v54, (uint64_t)v44);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v57 = v56;
  [*(id *)(a1 + 32) setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F68AA8]];
  v58 = [*(id *)(a1 + 40) accessories];
  uint64_t v59 = objc_msgSend(v58, "na_all:", &__block_literal_global_68_1);

  v60 = [NSNumber numberWithBool:v59];
  [*(id *)(a1 + 32) setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F68C68]];

  if (v59)
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A08]];
    v61 = @"HUSoftwareUpdateControlTitle_Requested";
  }
  else
  {
    v61 = @"HUSoftwareUpdateControlTitle_Update";
  }
  v62 = _HULocalizedStringWithDefaultValue(v61, v61, 1);
  [*(id *)(a1 + 32) setObject:v62 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  v63 = [*(id *)(a1 + 40) accessories];
  [*(id *)(a1 + 32) setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v64 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v65 = objc_opt_class();
  v66 = objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
  [*(id *)(a1 + 32) setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  uint64_t v67 = MEMORY[0x1E4F1CC38];
  [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B00]];
  [*(id *)(a1 + 32) setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F68AF8]];
  [*(id *)(a1 + 32) setObject:v67 forKeyedSubscript:*MEMORY[0x1E4F68A78]];
  v68 = (void *)MEMORY[0x1E4F7A0D8];
  v69 = [MEMORY[0x1E4F69228] outcomeWithResults:*(void *)(a1 + 32)];
  v70 = [v68 futureWithResult:v69];

  return v70;
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSoftwareUpdateInProgress");
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_softwareUpdatePossessesNecessaryDocumentation");
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isSoftwareUpdateInstalled");
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isDownloadingSoftwareUpdate");
}

id __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = a2;
  uint64_t v4 = [v2 setWithObject:v3];
  id v5 = objc_msgSend(v3, "hf_bridgedAccessories");

  [v4 addObjectsFromArray:v5];

  return v4;
}

uint64_t __56__HUSoftwareUpdateInfoItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasRequestedSoftwareUpdate");
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  uint64_t v4 = [(HUSoftwareUpdateInfoItem *)self latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), @"hidden", 1);

  uint64_t v7 = [(HUSoftwareUpdateInfoItem *)self accessories];
  v8 = objc_msgSend(v7, "hf_prettyDescription");
  id v9 = (id)[v3 appendObject:v8 withName:@"accessories"];

  uint64_t v10 = [v3 build];

  return v10;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (NSString)releaseNotesHTMLString
{
  return self->_releaseNotesHTMLString;
}

- (void)setReleaseNotesHTMLString:(id)a3
{
}

- (NSAttributedString)releaseNotesAttributedString
{
  return self->_releaseNotesAttributedString;
}

- (void)setReleaseNotesAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseNotesAttributedString, 0);
  objc_storeStrong((id *)&self->_releaseNotesHTMLString, 0);

  objc_storeStrong((id *)&self->_accessories, 0);
}

@end