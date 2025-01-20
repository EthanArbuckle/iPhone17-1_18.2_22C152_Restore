@interface AFUIContactsController
- (AFUIContactPropertyPickerDelegate)contactPropertyPickerDelegate;
- (AFUIContactsController)init;
- (BOOL)alwaysAllowsNamePicking;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (CNContact)me;
- (CNContactStore)contactStore;
- (NSMutableArray)meDisplayNameObservers;
- (id)_customInfoForContactProperty:(id)a3 useMultilineFallback:(BOOL)a4;
- (id)_meContactInfosForTextContentType:(id)a3 meContact:(id)a4;
- (id)_meDisplayName;
- (id)allContactsViewControllerForTextContentType:(id)a3;
- (id)contactsKeysForTextContentType:(id)a3;
- (id)formattedDateForComponents:(id)a3;
- (id)meCardViewControllerForTextContentType:(id)a3;
- (id)meContactInfosForTextContentType:(id)a3;
- (void)_loadMe;
- (void)addMeDisplayNameObserverAndGetInitialValue:(id)a3;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)copyAddressContactInfoFromContactInfo:(id)a3 toContactInfo:(id)a4;
- (void)copyPhoneContactInfoFromContactInfo:(id)a3 toContactInfo:(id)a4;
- (void)removeMeDisplayNameObserver:(id)a3;
- (void)setAlwaysAllowsNamePicking:(BOOL)a3;
- (void)setContactPropertyPickerDelegate:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setMe:(id)a3;
- (void)setMeDisplayNameObservers:(id)a3;
- (void)unifyPhoneNumberAndAddressDataAcrossContactInfos:(id)a3 withTextContentType:(id)a4;
@end

@implementation AFUIContactsController

- (AFUIContactsController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AFUIContactsController;
  v2 = [(AFUIContactsController *)&v9 init];
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    meDisplayNameObservers = v2->_meDisplayNameObservers;
    v2->_meDisplayNameObservers = v5;

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__loadMe name:*MEMORY[0x263EFE120] object:0];

    [(AFUIContactsController *)v2 _loadMe];
  }
  return v2;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)addMeDisplayNameObserverAndGetInitialValue:(id)a3
{
  id v6 = a3;
  v4 = [(AFUIContactsController *)self meDisplayNameObservers];
  [v4 addObject:v6];

  v5 = [(AFUIContactsController *)self _meDisplayName];
  if (v5) {
    [v6 meDisplayNameChanged:v5];
  }
}

- (void)removeMeDisplayNameObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIContactsController *)self meDisplayNameObservers];
  [v5 removeObject:v4];
}

- (id)allContactsViewControllerForTextContentType:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFEBE0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(AFUIContactsController *)self contactsKeysForTextContentType:v5];
  [v6 setDisplayedPropertyKeys:v7];

  [v6 setDelegate:self];
  [v6 setModalPresentationStyle:2];
  LOBYTE(v7) = AFTextContentTypeIsInNameSet(v5);

  if ((v7 & 1) != 0 || self->_alwaysAllowsNamePicking) && (objc_opt_respondsToSelector()) {
    [v6 setValue:MEMORY[0x263EFFA88] forKey:@"allowsNamePicking"];
  }

  return v6;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5 = a4;
  id v6 = [(AFUIContactsController *)self contactPropertyPickerDelegate];
  -[AFUIContactsController _customInfoForContactProperty:useMultilineFallback:](self, "_customInfoForContactProperty:useMultilineFallback:", v5, [v6 isSingleLineDocument] ^ 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [(AFUIContactsController *)self contactPropertyPickerDelegate];
  [v7 userSelectedContactProperties:v8];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v3 = [(AFUIContactsController *)self contactPropertyPickerDelegate];
  [v3 contactPickerDidCancel];
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFUIContactsController *)self contactPropertyPickerDelegate];
  objc_super v9 = -[AFUIContactsController _customInfoForContactProperty:useMultilineFallback:](self, "_customInfoForContactProperty:useMultilineFallback:", v6, [v8 isSingleLineDocument] ^ 1);

  v10 = [(AFUIContactsController *)self contactPropertyPickerDelegate];
  [v10 userSelectedContactProperties:v9];

  v11 = [v7 navigationController];

  [v11 dismissViewControllerAnimated:1 completion:0];
  return 0;
}

- (void)_loadMe
{
  v16[15] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v16[0] = v3;
  id v4 = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
  uint64_t v5 = *MEMORY[0x263EFDF80];
  v16[1] = v4;
  v16[2] = v5;
  uint64_t v6 = *MEMORY[0x263EFE0A0];
  v16[3] = *MEMORY[0x263EFE070];
  v16[4] = v6;
  uint64_t v7 = *MEMORY[0x263EFDFC8];
  v16[5] = *MEMORY[0x263EFE040];
  v16[6] = v7;
  uint64_t v8 = *MEMORY[0x263EFDFB8];
  v16[7] = *MEMORY[0x263EFE038];
  v16[8] = v8;
  uint64_t v9 = *MEMORY[0x263EFE048];
  v16[9] = *MEMORY[0x263EFE0B8];
  v16[10] = v9;
  uint64_t v10 = *MEMORY[0x263EFE068];
  v16[11] = *MEMORY[0x263EFE018];
  v16[12] = v10;
  uint64_t v11 = *MEMORY[0x263EFDF48];
  v16[13] = *MEMORY[0x263EFE150];
  v16[14] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:15];

  v13 = [(AFUIContactsController *)self contactStore];
  uint64_t v15 = 0;
  v14 = objc_msgSend(v13, "_ios_meContactWithKeysToFetch:error:", v12, &v15);
  [(AFUIContactsController *)self setMe:v14];
}

- (id)_meContactInfosForTextContentType:(id)a3 meContact:(id)a4
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v126 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  uint64_t v7 = [v5 emailAddresses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v154 objects:v163 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v155;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v155 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v154 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x263EFEAD0];
        v14 = [v12 label];
        uint64_t v15 = [v13 localizedStringForLabel:v14];
        v16 = (void *)v15;
        v17 = &stru_26FCB6C48;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        v18 = v17;

        v19 = [v6 objectForKey:v18];
        if (v19
          || (v19 = [[AFUIContactInfo alloc] initWithLabel:v18],
              [v6 setObject:v19 forKey:v18],
              v19))
        {
          v20 = [v12 value];
          [(AFUIContactInfo *)v19 setEmailString:v20];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v154 objects:v163 count:16];
    }
    while (v9);
  }

  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  v21 = [v5 urlAddresses];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v150 objects:v162 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v151;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v151 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v150 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x263EFEAD0];
        v28 = [v26 label];
        uint64_t v29 = [v27 localizedStringForLabel:v28];
        v30 = (void *)v29;
        v31 = &stru_26FCB6C48;
        if (v29) {
          v31 = (__CFString *)v29;
        }
        v32 = v31;

        v33 = [v6 objectForKey:v32];
        if (v33
          || (v33 = [[AFUIContactInfo alloc] initWithLabel:v32],
              [v6 setObject:v33 forKey:v32],
              v33))
        {
          v34 = [v26 value];
          [(AFUIContactInfo *)v33 setUrlString:v34];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v150 objects:v162 count:16];
    }
    while (v23);
  }

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  obuint64_t j = [v5 phoneNumbers];
  id v131 = (id)[obj countByEnumeratingWithState:&v146 objects:v161 count:16];
  if (v131)
  {
    uint64_t v35 = *(void *)v147;
    unint64_t v36 = 0x263EFE000uLL;
    do
    {
      for (k = 0; k != v131; k = (char *)k + 1)
      {
        if (*(void *)v147 != v35) {
          objc_enumerationMutation(obj);
        }
        v38 = *(void **)(*((void *)&v146 + 1) + 8 * (void)k);
        v39 = (void *)MEMORY[0x263EFEAD0];
        v40 = [v38 label];
        uint64_t v41 = [v39 localizedStringForLabel:v40];
        v42 = (void *)v41;
        v43 = &stru_26FCB6C48;
        if (v41) {
          v43 = (__CFString *)v41;
        }
        v44 = v43;

        v45 = [v6 objectForKey:v44];
        if (v45
          || (v45 = [[AFUIContactInfo alloc] initWithLabel:v44],
              [v6 setObject:v45 forKey:v44],
              v45))
        {
          v46 = [v38 value];
          v47 = [v46 stringValue];
          [(AFUIContactInfo *)v45 setPhoneString:v47];

          v48 = [v38 value];
          v49 = [v48 digitsRemovingDialingCode];

          if (v49)
          {
            [(AFUIContactInfo *)v45 setPhoneNationalNumberString:v49];
            if ([v49 length] == 10)
            {
              v50 = [v49 substringToIndex:3];
              [(AFUIContactInfo *)v45 setPhoneAreaCodeString:v50];

              v51 = [v49 substringFromIndex:3];
              [(AFUIContactInfo *)v45 setPhoneLocalNumberString:v51];
            }
            else if ([v49 length] == 7)
            {
              [(AFUIContactInfo *)v45 setPhoneAreaCodeString:&stru_26FCB6C48];
              [(AFUIContactInfo *)v45 setPhoneLocalNumberString:v49];
            }
            [(AFUIContactInfo *)v45 setPhoneExtensionString:&stru_26FCB6C48];
          }
          v52 = *(void **)(v36 + 2856);
          v53 = [v38 value];
          uint64_t v54 = [v53 countryCode];
          unint64_t v55 = v36;
          v56 = (void *)v54;
          if (v54)
          {
            v57 = [v52 dialingCodeForISOCountryCode:v54];
          }
          else
          {
            [*(id *)(v55 + 2856) defaultCountryCode];
            v128 = v44;
            id v58 = v5;
            id v59 = v6;
            v61 = uint64_t v60 = v35;
            v57 = [v52 dialingCodeForISOCountryCode:v61];

            uint64_t v35 = v60;
            id v6 = v59;
            id v5 = v58;
            v44 = v128;
          }

          if (v57) {
            [(AFUIContactInfo *)v45 setPhoneCountryCodeString:v57];
          }

          unint64_t v36 = 0x263EFE000;
        }
      }
      id v131 = (id)[obj countByEnumeratingWithState:&v146 objects:v161 count:16];
    }
    while (v131);
  }

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v129 = [v5 postalAddresses];
  uint64_t v62 = [v129 countByEnumeratingWithState:&v142 objects:v160 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    id v132 = *(id *)v143;
    do
    {
      for (uint64_t m = 0; m != v63; ++m)
      {
        if (*(id *)v143 != v132) {
          objc_enumerationMutation(v129);
        }
        v65 = *(void **)(*((void *)&v142 + 1) + 8 * m);
        v66 = (void *)MEMORY[0x263EFEAD0];
        v67 = [v65 label];
        uint64_t v68 = [v66 localizedStringForLabel:v67];
        v69 = (void *)v68;
        v70 = &stru_26FCB6C48;
        if (v68) {
          v70 = (__CFString *)v68;
        }
        v71 = v70;

        v72 = [v65 value];
        v73 = [v72 street];
        v74 = [v73 componentsSeparatedByString:@"\n"];

        v75 = [v6 objectForKey:v71];
        if (v75
          || (v75 = [[AFUIContactInfo alloc] initWithLabel:v71],
              [v6 setObject:v75 forKey:v71],
              v75))
        {
          if (v74)
          {
            v76 = [v74 objectAtIndex:0];
            [(AFUIContactInfo *)v75 setStreetAddressLine1String:v76];
          }
          if ((unint64_t)[v74 count] >= 2)
          {
            v77 = [v74 objectAtIndex:1];
            [(AFUIContactInfo *)v75 setStreetAddressLine2String:v77];
          }
          v78 = [v65 value];
          v79 = [v78 subLocality];
          [(AFUIContactInfo *)v75 setSublocalityString:v79];

          v80 = [v65 value];
          v81 = [v80 city];
          [(AFUIContactInfo *)v75 setCityString:v81];

          v82 = [v65 value];
          v83 = [v82 state];
          [(AFUIContactInfo *)v75 setStateString:v83];

          v84 = [v65 value];
          v85 = [v84 postalCode];
          [(AFUIContactInfo *)v75 setPostalCodeString:v85];

          v86 = [v65 value];
          v87 = [v86 country];
          [(AFUIContactInfo *)v75 setCountryString:v87];

          v88 = (void *)MEMORY[0x263EFEB38];
          v89 = [v65 value];
          v90 = [v88 singleLineStringFromPostalAddress:v89 addCountryName:0];

          [(AFUIContactInfo *)v75 setFullStreetAddressString:v90];
        }
      }
      uint64_t v63 = [v129 countByEnumeratingWithState:&v142 objects:v160 count:16];
    }
    while (v63);
  }

  v91 = [v6 allKeys];
  uint64_t v92 = [v91 count];

  if (!v92)
  {
    v93 = objc_alloc_init(AFUIContactInfo);
    [v6 setObject:v93 forKey:&stru_26FCB6C48];
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v133 = [v6 allKeys];
  uint64_t v94 = [v133 countByEnumeratingWithState:&v138 objects:v159 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v139;
    do
    {
      for (uint64_t n = 0; n != v95; ++n)
      {
        if (*(void *)v139 != v96) {
          objc_enumerationMutation(v133);
        }
        v98 = [v6 objectForKey:*(void *)(*((void *)&v138 + 1) + 8 * n)];
        v99 = [MEMORY[0x263EFEA20] stringFromContact:v5 style:0];
        [v98 setNameString:v99];

        v100 = [v5 givenName];
        [v98 setGivenNameString:v100];

        v101 = [v5 familyName];
        [v98 setFamilyNameString:v101];

        v102 = [v5 middleName];
        [v98 setMiddleNameString:v102];

        v103 = [v5 namePrefix];
        [v98 setNamePrefixString:v103];

        v104 = [v5 nameSuffix];
        [v98 setNameSuffixString:v104];

        v105 = [v5 nickname];
        [v98 setNicknameString:v105];

        v106 = [v5 jobTitle];
        [v98 setJobTitleString:v106];

        v107 = [v5 organizationName];
        [v98 setOrganizationNameString:v107];

        v108 = [v5 birthday];
        v109 = [(AFUIContactsController *)self formattedDateForComponents:v108];
        [v98 setBirthdateString:v109];

        v110 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v108, "day"));
        v111 = [v110 stringValue];
        [v98 setBirthdateDayString:v111];

        v112 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v108, "month"));
        v113 = [v112 stringValue];
        [v98 setBirthdateMonthString:v113];

        v114 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v108, "year"));
        v115 = [v114 stringValue];
        [v98 setBirthdateYearString:v115];
      }
      uint64_t v95 = [v133 countByEnumeratingWithState:&v138 objects:v159 count:16];
    }
    while (v95);
  }

  [(AFUIContactsController *)self unifyPhoneNumberAndAddressDataAcrossContactInfos:v6 withTextContentType:v126];
  v116 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  if (_meContactInfosForTextContentType_meContact__onceToken != -1) {
    dispatch_once(&_meContactInfosForTextContentType_meContact__onceToken, &__block_literal_global_10);
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v117 = (id)_meContactInfosForTextContentType_meContact__preferredLabelOrder;
  uint64_t v118 = [v117 countByEnumeratingWithState:&v134 objects:v158 count:16];
  if (v118)
  {
    uint64_t v119 = v118;
    uint64_t v120 = *(void *)v135;
    do
    {
      for (iuint64_t i = 0; ii != v119; ++ii)
      {
        if (*(void *)v135 != v120) {
          objc_enumerationMutation(v117);
        }
        v122 = [MEMORY[0x263EFEAD0] localizedStringForLabel:*(void *)(*((void *)&v134 + 1) + 8 * ii)];
        v123 = [v6 objectForKey:v122];
        if (v123)
        {
          [v116 addObject:v123];
          [v6 removeObjectForKey:v122];
        }
      }
      uint64_t v119 = [v117 countByEnumeratingWithState:&v134 objects:v158 count:16];
    }
    while (v119);
  }

  v124 = [v6 allValues];
  [v116 addObjectsFromArray:v124];

  return v116;
}

void __70__AFUIContactsController__meContactInfosForTextContentType_meContact___block_invoke()
{
  v6[8] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFE8D0];
  v6[0] = *MEMORY[0x263EFE8D8];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x263EFE8B8];
  v6[2] = *MEMORY[0x263EFE8F8];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x263EFE900];
  v6[4] = *MEMORY[0x263EFE910];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x263EFE908];
  v6[6] = *MEMORY[0x263EFE8C0];
  v6[7] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  id v5 = (void *)_meContactInfosForTextContentType_meContact__preferredLabelOrder;
  _meContactInfosForTextContentType_meContact__preferredLabelOrder = v4;
}

- (id)meContactInfosForTextContentType:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUIContactsController *)self me];
  id v6 = [(AFUIContactsController *)self _meContactInfosForTextContentType:v4 meContact:v5];

  return v6;
}

- (id)formattedDateForComponents:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 dateFromComponents:v4];

  id v7 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
  [v7 setLocale:v8];

  [v7 setLocalizedDateFormatFromTemplate:@"ddMMyyyy"];
  uint64_t v9 = [v7 stringFromDate:v6];

  return v9;
}

- (void)unifyPhoneNumberAndAddressDataAcrossContactInfos:(id)a3 withTextContentType:(id)a4
{
  id v68 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x263EFEAD0] localizedStringForLabel:*MEMORY[0x263EFE8B8]];
  id v7 = [MEMORY[0x263EFEAD0] localizedStringForLabel:*MEMORY[0x263EFE8D8]];
  uint64_t v8 = [MEMORY[0x263EFEAD0] localizedStringForLabel:*MEMORY[0x263EFE8D0]];
  uint64_t v9 = [MEMORY[0x263EFEAD0] localizedStringForLabel:*MEMORY[0x263EFE8F8]];
  uint64_t v10 = [MEMORY[0x263EFEAD0] localizedStringForLabel:*MEMORY[0x263EFE908]];
  uint64_t v11 = [v68 objectForKey:v6];
  v12 = v68;
  if (v11)
  {
    v13 = [v68 objectForKey:v6];
    uint64_t v14 = [v13 phoneString];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
LABEL_23:

      v12 = v68;
      goto LABEL_24;
    }
    v16 = [v68 objectForKey:v6];
    v17 = [v16 fullStreetAddressString];

    v12 = v68;
    if (v17)
    {
      uint64_t v11 = [v68 objectForKey:v7];
      v13 = [v68 objectForKey:v8];
      uint64_t v15 = [v68 objectForKey:v9];
      v66 = [v68 objectForKey:v6];
      if (v11)
      {
        v18 = [v11 fullStreetAddressString];

        if (!v18) {
          [(AFUIContactsController *)self copyAddressContactInfoFromContactInfo:v66 toContactInfo:v11];
        }
        v19 = [v11 emailString];

        if (!v19)
        {
          v20 = [v66 emailString];
          [v11 setEmailString:v20];
        }
      }
      if (v13)
      {
        v21 = [v13 fullStreetAddressString];

        if (!v21) {
          [(AFUIContactsController *)self copyAddressContactInfoFromContactInfo:v66 toContactInfo:v13];
        }
        uint64_t v22 = [v13 emailString];

        if (!v22)
        {
          uint64_t v23 = [v66 emailString];
          [v13 setEmailString:v23];
        }
      }
      if (v15)
      {
        uint64_t v24 = [v15 fullStreetAddressString];

        if (!v24) {
          [(AFUIContactsController *)self copyAddressContactInfoFromContactInfo:v66 toContactInfo:v15];
        }
        v25 = [v15 emailString];

        if (!v25)
        {
          v26 = [v66 emailString];
          [v15 setEmailString:v26];
        }
      }
      if (AFTextContentTypeIsInPhoneSet(v5)) {
        [v68 removeObjectForKey:v6];
      }

      goto LABEL_23;
    }
  }
LABEL_24:
  uint64_t v27 = [v12 objectForKey:v6];
  v28 = v68;
  if (v27)
  {
    uint64_t v29 = (void *)v27;
    v30 = [v68 objectForKey:v6];
    v31 = [v30 phoneString];

    v28 = v68;
    if (!v31)
    {
      uint64_t v36 = [v68 objectForKey:v7];
      if (!v36) {
        goto LABEL_40;
      }
      v37 = (void *)v36;
      v38 = [v68 objectForKey:v7];
      v39 = [v38 phoneString];

      if (v39)
      {
        v40 = [v68 objectForKey:v7];
        uint64_t v41 = [v68 objectForKey:v6];
        [(AFUIContactsController *)self copyPhoneContactInfoFromContactInfo:v40 toContactInfo:v41];

        char v42 = AFTextContentTypeIsInAddressSet(v5);
        v43 = v7;
      }
      else
      {
LABEL_40:
        uint64_t v53 = [v68 objectForKey:v8];
        if (!v53) {
          goto LABEL_45;
        }
        uint64_t v54 = (void *)v53;
        unint64_t v55 = [v68 objectForKey:v8];
        v56 = [v55 phoneString];

        if (!v56)
        {
LABEL_45:
          uint64_t v59 = [v68 objectForKey:v9];
          v28 = v68;
          if (!v59) {
            goto LABEL_26;
          }
          uint64_t v60 = (void *)v59;
          v61 = [v68 objectForKey:v9];
          uint64_t v62 = [v61 phoneString];

          v28 = v68;
          if (!v62) {
            goto LABEL_26;
          }
          uint64_t v63 = [v68 objectForKey:v9];
          v64 = [v68 objectForKey:v6];
          [(AFUIContactsController *)self copyPhoneContactInfoFromContactInfo:v63 toContactInfo:v64];

          int v65 = AFTextContentTypeIsInAddressSet(v5);
          v28 = v68;
          v43 = v9;
          if (!v65) {
            goto LABEL_26;
          }
LABEL_44:
          [v28 removeObjectForKey:v43];
          v28 = v68;
          goto LABEL_26;
        }
        v57 = [v68 objectForKey:v8];
        id v58 = [v68 objectForKey:v6];
        [(AFUIContactsController *)self copyPhoneContactInfoFromContactInfo:v57 toContactInfo:v58];

        char v42 = AFTextContentTypeIsInAddressSet(v5);
        v43 = v8;
      }
      v28 = v68;
      if ((v42 & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_44;
    }
  }
LABEL_26:
  uint64_t v32 = [v28 objectForKey:v6];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [v68 objectForKey:v6];
    uint64_t v35 = [v34 urlString];
    if (v35)
    {
    }
    else
    {
      v44 = [v68 objectForKey:v6];
      v45 = [v44 fullStreetAddressString];

      if (v45)
      {
        uint64_t v46 = [v68 objectForKey:v10];
        if (v46)
        {
          v47 = (void *)v46;
          v48 = [v68 objectForKey:v10];
          v49 = [v48 urlString];

          if (v49)
          {
            v50 = [v68 objectForKey:v10];
            v51 = [v50 urlString];
            v52 = [v68 objectForKey:v6];
            [v52 setUrlString:v51];

            if ([v5 isEqualToString:*MEMORY[0x263F295A8]]) {
              [v68 removeObjectForKey:v10];
            }
          }
        }
      }
    }
  }
}

- (void)copyAddressContactInfoFromContactInfo:(id)a3 toContactInfo:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = [v16 fullStreetAddressString];
  [v5 setFullStreetAddressString:v6];

  id v7 = [v16 streetAddressLine1String];

  if (v7)
  {
    uint64_t v8 = [v16 streetAddressLine1String];
    [v5 setStreetAddressLine1String:v8];
  }
  uint64_t v9 = [v16 streetAddressLine2String];

  if (v9)
  {
    uint64_t v10 = [v16 streetAddressLine2String];
    [v5 setStreetAddressLine2String:v10];
  }
  uint64_t v11 = [v16 sublocalityString];
  [v5 setSublocalityString:v11];

  v12 = [v16 cityString];
  [v5 setCityString:v12];

  v13 = [v16 stateString];
  [v5 setStateString:v13];

  uint64_t v14 = [v16 postalCodeString];
  [v5 setPostalCodeString:v14];

  uint64_t v15 = [v16 countryString];
  [v5 setCountryString:v15];
}

- (void)copyPhoneContactInfoFromContactInfo:(id)a3 toContactInfo:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  id v6 = [v14 phoneString];
  [v5 setPhoneString:v6];

  id v7 = [v14 phoneNationalNumberString];

  if (v7)
  {
    uint64_t v8 = [v14 phoneNationalNumberString];
    [v5 setPhoneNationalNumberString:v8];

    uint64_t v9 = [v14 phoneAreaCodeString];
    [v5 setPhoneAreaCodeString:v9];

    uint64_t v10 = [v14 phoneLocalNumberString];
    [v5 setPhoneLocalNumberString:v10];

    uint64_t v11 = [v14 phoneExtensionString];
    [v5 setPhoneExtensionString:v11];
  }
  v12 = [v14 phoneCountryCodeString];

  if (v12)
  {
    v13 = [v14 phoneCountryCodeString];
    [v5 setPhoneCountryCodeString:v13];
  }
}

- (id)_meDisplayName
{
  uint64_t v3 = [(AFUIContactsController *)self me];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x263EFEA20];
    id v5 = [(AFUIContactsController *)self me];
    id v6 = [v4 stringFromContact:v5 style:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)contactsKeysForTextContentType:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  if (AFTextContentTypeIsInPhoneSet(v3))
  {
    id v5 = (void *)MEMORY[0x263EFE070];
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F294E0]])
  {
    id v5 = (void *)MEMORY[0x263EFDF80];
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F295A8]])
  {
    id v5 = (void *)MEMORY[0x263EFE150];
  }
  else
  {
    if (!AFTextContentTypeIsInAddressSet(v3)) {
      goto LABEL_10;
    }
    id v5 = (void *)MEMORY[0x263EFE0A0];
  }
  [v4 addObject:*v5];
LABEL_10:
  if ([v4 count]) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)meCardViewControllerForTextContentType:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFEBF8];
  id v5 = a3;
  id v6 = [(AFUIContactsController *)self me];
  id v7 = [v4 viewControllerForContact:v6];

  uint64_t v8 = [(AFUIContactsController *)self contactsKeysForTextContentType:v5];

  [v7 setDisplayedPropertyKeys:v8];
  [v7 setAllowsEditing:0];
  [v7 setDelegate:self];
  [v7 setModalPresentationStyle:2];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v7];

  return v9;
}

- (id)_customInfoForContactProperty:(id)a3 useMultilineFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v8 = [v6 contact];
  uint64_t v9 = [v8 givenName];

  if (v9)
  {
    uint64_t v10 = [v8 givenName];
    [v7 setObject:v10 forKey:*MEMORY[0x263F294F8]];
  }
  uint64_t v11 = [v8 middleName];

  if (v11)
  {
    v12 = [v8 middleName];
    [v7 setObject:v12 forKey:*MEMORY[0x263F29510]];
  }
  v13 = [v8 familyName];

  if (v13)
  {
    id v14 = [v8 familyName];
    [v7 setObject:v14 forKey:*MEMORY[0x263F294E8]];
  }
  uint64_t v15 = [v8 namePrefix];

  if (v15)
  {
    id v16 = [v8 namePrefix];
    [v7 setObject:v16 forKey:*MEMORY[0x263F29520]];
  }
  v17 = [v8 nameSuffix];

  if (v17)
  {
    v18 = [v8 nameSuffix];
    [v7 setObject:v18 forKey:*MEMORY[0x263F29528]];
  }
  if ([v8 isKeyAvailable:@"nickname"])
  {
    v19 = [v8 nickname];

    if (v19)
    {
      v20 = [v8 nickname];
      [v7 setObject:v20 forKey:*MEMORY[0x263F29538]];
    }
  }
  if ([v8 isKeyAvailable:@"jobTitle"])
  {
    v21 = [v8 jobTitle];

    if (v21)
    {
      uint64_t v22 = [v8 jobTitle];
      [v7 setObject:v22 forKey:*MEMORY[0x263F29500]];
    }
  }
  if ([v8 isKeyAvailable:@"organizationName"])
  {
    uint64_t v23 = [v8 organizationName];

    if (v23)
    {
      uint64_t v24 = [v8 organizationName];
      [v7 setObject:v24 forKey:*MEMORY[0x263F29550]];
    }
  }
  v25 = [MEMORY[0x263EFEA20] stringFromContact:v8 style:0];
  if ([v25 length]) {
    [v7 setObject:v25 forKey:*MEMORY[0x263F29518]];
  }
  v26 = [v6 key];
  if ([v26 isEqualToString:*MEMORY[0x263EFDFC8]]) {
    goto LABEL_37;
  }
  uint64_t v27 = [v6 key];
  if ([v27 isEqualToString:*MEMORY[0x263EFE038]])
  {
LABEL_36:

LABEL_37:
LABEL_38:
    [v7 setObject:MEMORY[0x263EFFA88] forKey:@"didPickContactNamePropertyKey"];
    id v34 = v7;
    goto LABEL_39;
  }
  v28 = [v6 key];
  if ([v28 isEqualToString:*MEMORY[0x263EFDFB8]])
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v29 = [v6 key];
  if ([v29 isEqualToString:*MEMORY[0x263EFE040]])
  {
LABEL_34:

    goto LABEL_35;
  }
  BOOL v72 = v4;
  v30 = [v6 key];
  if ([v30 isEqualToString:*MEMORY[0x263EFE048]])
  {
LABEL_33:

    goto LABEL_34;
  }
  v71 = v30;
  v31 = [v6 key];
  if ([v31 isEqualToString:*MEMORY[0x263EFE050]])
  {
LABEL_32:

    v30 = v71;
    goto LABEL_33;
  }
  v70 = v31;
  uint64_t v32 = [v6 key];
  if ([v32 isEqualToString:*MEMORY[0x263EFE018]])
  {
LABEL_31:

    v31 = v70;
    goto LABEL_32;
  }
  v69 = v32;
  v33 = [v6 key];
  if ([v33 isEqualToString:*MEMORY[0x263EFE068]])
  {

    uint64_t v32 = v69;
    goto LABEL_31;
  }
  v67 = [v6 key];
  char v68 = [v67 isEqualToString:@"displayName"];

  if (v68) {
    goto LABEL_38;
  }
  uint64_t v36 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setObject:v36 forKey:*MEMORY[0x263F29540]];
    v37 = [v6 key];
    int v38 = [v37 isEqualToString:*MEMORY[0x263EFDF80]];

    if (v38) {
      [v7 setObject:v36 forKey:*MEMORY[0x263F294E0]];
    }
    v39 = [v6 key];
    int v40 = [v39 isEqualToString:*MEMORY[0x263EFE150]];

    if (v40) {
      [v7 setObject:v36 forKey:*MEMORY[0x263F295A8]];
    }
    id v34 = v7;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = [(AFUIContactsController *)self formattedDateForComponents:v36];
      [v7 setObject:v41 forKey:*MEMORY[0x263F29540]];
      char v42 = [v6 key];
      int v43 = [v42 isEqualToString:*MEMORY[0x263EFDF48]];

      if (v43) {
        [v7 setObject:v41 forKey:*MEMORY[0x263F29468]];
      }
      id v34 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v48 = v36;
          v49 = [v48 street];

          if (v49)
          {
            v50 = [v48 street];
            [v7 setObject:v50 forKey:*MEMORY[0x263F29568]];
          }
          v51 = [v48 city];

          if (v51)
          {
            v52 = [v48 city];
            [v7 setObject:v52 forKey:*MEMORY[0x263F29450]];
          }
          uint64_t v53 = [v48 state];

          if (v53)
          {
            uint64_t v54 = [v48 state];
            [v7 setObject:v54 forKey:*MEMORY[0x263F29460]];
          }
          unint64_t v55 = [v48 subLocality];

          if (v55)
          {
            v56 = [v48 subLocality];
            [v7 setObject:v56 forKey:*MEMORY[0x263F29578]];
          }
          v57 = [v48 postalCode];

          if (v57)
          {
            id v58 = [v48 postalCode];
            [v7 setObject:v58 forKey:*MEMORY[0x263F29560]];
          }
          uint64_t v59 = [v48 country];

          if (v59)
          {
            uint64_t v60 = [v48 country];
            [v7 setObject:v60 forKey:*MEMORY[0x263F29488]];
          }
          if (v72) {
            [MEMORY[0x263EFEB38] stringFromPostalAddress:v48 style:0];
          }
          else {
          v66 = [MEMORY[0x263EFEB38] singleLineStringFromPostalAddress:v48 addCountryName:0];
          }
          [v7 setObject:v66 forKey:*MEMORY[0x263F294F0]];
          [v7 setObject:v66 forKey:*MEMORY[0x263F29540]];

          id v34 = v7;
        }
        else
        {
          id v34 = 0;
        }
        goto LABEL_82;
      }
      id v41 = v36;
      v44 = [v41 stringValue];
      [v7 setObject:v44 forKey:*MEMORY[0x263F295A0]];

      v45 = [v41 digitsRemovingDialingCode];
      if (v45)
      {
        [v7 setObject:v45 forKey:@"tel-national"];
        if ([v45 length] == 10)
        {
          uint64_t v46 = [v45 substringToIndex:3];
          [v7 setObject:v46 forKey:@"tel-area-code"];

          v47 = [v45 substringFromIndex:3];
          [v7 setObject:v47 forKey:@"tel-local"];
        }
        else if ([v45 length] == 7)
        {
          [v7 setObject:v45 forKey:@"tel-local"];
        }
      }
      v61 = (void *)MEMORY[0x263EFEB28];
      uint64_t v62 = [v41 countryCode];
      if (v62)
      {
        uint64_t v63 = [v61 dialingCodeForISOCountryCode:v62];
      }
      else
      {
        v64 = [MEMORY[0x263EFEB28] defaultCountryCode];
        uint64_t v63 = [v61 dialingCodeForISOCountryCode:v64];
      }
      if (v63) {
        [v7 setObject:v63 forKey:@"tel-country-code"];
      }
      int v65 = [v41 stringValue];
      [v7 setObject:v65 forKey:*MEMORY[0x263F29540]];

      id v34 = v7;
    }
  }
LABEL_82:

LABEL_39:

  return v34;
}

- (BOOL)alwaysAllowsNamePicking
{
  return self->_alwaysAllowsNamePicking;
}

- (void)setAlwaysAllowsNamePicking:(BOOL)a3
{
  self->_alwaysAllowsNamePicking = a3;
}

- (AFUIContactPropertyPickerDelegate)contactPropertyPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactPropertyPickerDelegate);

  return (AFUIContactPropertyPickerDelegate *)WeakRetained;
}

- (void)setContactPropertyPickerDelegate:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (CNContact)me
{
  return (CNContact *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMe:(id)a3
{
}

- (NSMutableArray)meDisplayNameObservers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMeDisplayNameObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meDisplayNameObservers, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_destroyWeak((id *)&self->_contactPropertyPickerDelegate);
}

@end