@interface CKAllowedSharingOptions
+ (BOOL)supportsSecureCoding;
+ (CKAllowedSharingOptions)standardOptions;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)resolvedOptionsFromOptions:(id)a3 forExistingShare:(id)a4;
+ (void)initialize;
- (BOOL)_optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray:(id)a3;
- (BOOL)supportAllowingAddedParticipantsToInviteOthers;
- (CKAllowedSharingOptions)initWithAllowedParticipantPermissionOptions:(CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions allowedParticipantAccessOptions:(CKSharingParticipantAccessOption)allowedParticipantAccessOptions;
- (CKAllowedSharingOptions)initWithCoder:(id)a3;
- (CKSharingParticipantAccessOption)allowedParticipantAccessOptions;
- (CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions;
- (NSArray)mutableOptionsGroups;
- (_SWCollaborationShareOptions)mutableShareOptions;
- (_SWCollaborationShareOptions)shareOptions;
- (id)_uncachedCollaborationOptionsGroupsFromAllowedOptions;
- (id)_uncachedShareOptionsFromAllowedOptions;
- (id)collaborationOptionsGroupsFromAllowedOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)shareOptionsFromAllowedOptions;
- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (void)_addOptions:(id)a3 toExistingGroupWithID:(id)a4 inOptionsGroups:(id)a5;
- (void)_removeOptionGroupWithID:(id)a3 fromOptionsGroups:(id)a4;
- (void)_resolveCollaborationOptionsGroupsForExistingShare:(id)a3;
- (void)_selectOptionWithIdentifier:(id)a3 inGroups:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedParticipantAccessOptions:(CKSharingParticipantAccessOption)allowedParticipantAccessOptions;
- (void)setAllowedParticipantPermissionOptions:(CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions;
- (void)setMutableOptionsGroups:(id)a3;
- (void)setMutableShareOptions:(id)a3;
- (void)setSupportAllowingAddedParticipantsToInviteOthers:(BOOL)a3;
@end

@implementation CKAllowedSharingOptions

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKAllowedSharingOptions)initWithAllowedParticipantPermissionOptions:(CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions allowedParticipantAccessOptions:(CKSharingParticipantAccessOption)allowedParticipantAccessOptions
{
  v7.receiver = self;
  v7.super_class = (Class)CKAllowedSharingOptions;
  result = [(CKAllowedSharingOptions *)&v7 init];
  if (result)
  {
    result->_allowedParticipantPermissionOptions = allowedParticipantPermissionOptions;
    result->_allowedParticipantAccessOptions = allowedParticipantAccessOptions;
  }
  return result;
}

+ (CKAllowedSharingOptions)standardOptions
{
  v2 = [CKAllowedSharingOptions alloc];
  v4 = objc_msgSend_initWithAllowedParticipantPermissionOptions_allowedParticipantAccessOptions_(v2, v3, 3, 3);

  return (CKAllowedSharingOptions *)v4;
}

- (_SWCollaborationShareOptions)shareOptions
{
  return (_SWCollaborationShareOptions *)((uint64_t (*)(CKAllowedSharingOptions *, char *))MEMORY[0x1F4181798])(self, sel_shareOptionsFromAllowedOptions);
}

- (id)_uncachedShareOptionsFromAllowedOptions
{
  v4 = objc_msgSend_collaborationOptionsGroupsFromAllowedOptions(self, a2, v2, v3);
  uint64_t v5 = CKSharingSummaryStringFromOptionsGroups(v4);
  v6 = (void *)v5;
  objc_super v7 = &stru_1ED7F5C98;
  if (v5) {
    objc_super v7 = (__CFString *)v5;
  }
  v8 = v7;

  v10 = objc_msgSend_shareOptionsWithOptionsGroups_summary_(MEMORY[0x1E4F3BE00], v9, (uint64_t)v4, (uint64_t)v8);

  return v10;
}

- (id)shareOptionsFromAllowedOptions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  mutableShareOptions = v2->_mutableShareOptions;
  if (!mutableShareOptions)
  {
    uint64_t v7 = objc_msgSend__uncachedShareOptionsFromAllowedOptions(v2, v3, v4, v5);
    v8 = v2->_mutableShareOptions;
    v2->_mutableShareOptions = (_SWCollaborationShareOptions *)v7;

    mutableShareOptions = v2->_mutableShareOptions;
  }
  v9 = mutableShareOptions;
  objc_sync_exit(v2);

  return v9;
}

- (id)_uncachedCollaborationOptionsGroupsFromAllowedOptions
{
  v137[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  char v8 = objc_msgSend_allowedParticipantPermissionOptions(self, v5, v6, v7);
  char v9 = v8;
  if ((v8 & 2) != 0)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F3BDE8]);
    v18 = CKLocalizedString(@"COLLABORATION_OPTIONS_PERMISSION_RW", &stru_1ED7F5C98, v12, v13, v14, v15, v16, v17, v130);
    v10 = objc_msgSend_initWithTitle_identifier_(v11, v19, (uint64_t)v18, @"CKSharingPermissionCanMakeChangesOptionID");

    objc_msgSend_addObject_(v4, v20, (uint64_t)v10, v21);
    if ((v9 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v10 = 0;
  if (v8)
  {
LABEL_5:
    id v22 = objc_alloc(MEMORY[0x1E4F3BDE8]);
    v29 = CKLocalizedString(@"COLLABORATION_OPTIONS_PERMISSION_RO", &stru_1ED7F5C98, v23, v24, v25, v26, v27, v28, v130);
    v31 = objc_msgSend_initWithTitle_identifier_(v22, v30, (uint64_t)v29, @"CKSharingPermissionViewOnlyOptionID");

    objc_msgSend_addObject_(v4, v32, (uint64_t)v31, v33);
  }
LABEL_6:
  id v34 = objc_alloc(MEMORY[0x1E4F3BDF8]);
  v41 = CKLocalizedString(@"COLLABORATION_OPTIONS_PERMISSION_TITLE", &stru_1ED7F5C98, v35, v36, v37, v38, v39, v40, v130);
  v43 = objc_msgSend_initWithTitle_identifier_footer_options_(v34, v42, (uint64_t)v41, @"CKSharingPermissionGroupID", 0, v4);

  v44 = objc_opt_new();
  char v48 = objc_msgSend_allowedParticipantAccessOptions(self, v45, v46, v47);
  v49 = 0;
  if ((v48 & 2) == 0) {
    goto LABEL_13;
  }
  v50 = self;
  v51 = v10;
  v135 = v4;
  id v52 = objc_alloc(MEMORY[0x1E4F3BDE8]);
  v59 = CKLocalizedString(@"COLLABORATION_OPTIONS_ACCESS_INVITED", &stru_1ED7F5C98, v53, v54, v55, v56, v57, v58, (uint64_t)v131);
  v61 = objc_msgSend_initWithTitle_identifier_(v52, v60, (uint64_t)v59, @"CKSharingAccessSpecifiedRecipientsOnlyOptionID");

  objc_msgSend_addObject_(v44, v62, (uint64_t)v61, v63);
  v134 = v50;
  v49 = 0;
  if (!objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(v50, v64, v65, v66) || !v61) {
    goto LABEL_11;
  }
  v10 = v51;
  if (v51)
  {
    id v133 = objc_alloc(MEMORY[0x1E4F3BDE8]);
    v131 = CKLocalizedString(@"COLLABORATION_OPTIONS_ADDING_PEOPLE_ALLOW_OTHERS", &stru_1ED7F5C98, v67, v68, v69, v70, v71, v72, (uint64_t)v131);
    v76 = objc_msgSend_identifier(v61, v73, v74, v75);
    v137[0] = v76;
    v80 = objc_msgSend_identifier(v51, v77, v78, v79);
    v137[1] = v80;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v81, (uint64_t)v137, 2);
    v83 = v82 = v43;
    v49 = objc_msgSend_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_(v133, v84, (uint64_t)v131, @"CKSharingAllowOthersToInviteOptionID", 0, 1, v83);

    v43 = v82;
LABEL_11:
    v10 = v51;
  }

  self = v134;
  uint64_t v4 = v135;
LABEL_13:
  if (v48)
  {
    id v85 = objc_alloc(MEMORY[0x1E4F3BDE8]);
    v92 = CKLocalizedString(@"COLLABORATION_OPTIONS_ACCESS_ANYONE", &stru_1ED7F5C98, v86, v87, v88, v89, v90, v91, (uint64_t)v131);
    v94 = objc_msgSend_initWithTitle_identifier_(v85, v93, (uint64_t)v92, @"CKSharingAccessAnyoneWithLinkOptionID");

    objc_msgSend_addObject_(v44, v95, (uint64_t)v94, v96);
  }
  id v97 = objc_alloc(MEMORY[0x1E4F3BDF8]);
  v104 = CKLocalizedString(@"COLLABORATION_OPTIONS_ACCESS_TITLE", &stru_1ED7F5C98, v98, v99, v100, v101, v102, v103, (uint64_t)v131);
  v106 = objc_msgSend_initWithTitle_identifier_footer_options_(v97, v105, (uint64_t)v104, @"CKSharingWhoCanAccessGroupID", 0, v44);

  objc_msgSend_addObject_(v3, v107, (uint64_t)v106, v108);
  objc_msgSend_addObject_(v3, v109, (uint64_t)v43, v110);
  if (v49)
  {
    if (objc_msgSend__optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray_(self, v111, (uint64_t)v3, v113))
    {
      v120 = CKLocalizedString(@"COLLABORATION_OPTIONS_PERMISSION_TITLE", &stru_1ED7F5C98, v114, v115, v116, v117, v118, v119, v132);
    }
    else
    {
      v120 = 0;
    }
    id v121 = objc_alloc(MEMORY[0x1E4F3BDF0]);
    v136 = v49;
    v123 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v122, (uint64_t)&v136, 1);
    v125 = objc_msgSend_initWithTitle_identifier_footer_options_(v121, v124, (uint64_t)v120, @"CKSharingAllowOthersToInviteGroupID", 0, v123);

    objc_msgSend_addObject_(v3, v126, (uint64_t)v125, v127);
  }
  v128 = objc_msgSend_copy(v3, v111, v112, v113);

  return v128;
}

- (BOOL)_optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    char v10 = 0;
    char v37 = 0;
    uint64_t v11 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_identifier(v13, v6, v7, v8);
        if (objc_msgSend_isEqualToString_(v14, v15, @"CKSharingPermissionGroupID", v16))
        {
          v20 = objc_msgSend_options(v13, v17, v18, v19);
          uint64_t v24 = objc_msgSend_count(v20, v21, v22, v23);

          if (v24 == 1)
          {
            char v37 = 1;
            continue;
          }
        }
        else
        {
        }
        uint64_t v25 = objc_msgSend_identifier(v13, v6, v7, v8);
        if (objc_msgSend_isEqualToString_(v25, v26, @"CKSharingWhoCanAccessGroupID", v27))
        {
          v31 = objc_msgSend_options(v13, v28, v29, v30);
          BOOL v35 = objc_msgSend_count(v31, v32, v33, v34) == 1;
        }
        else
        {
          BOOL v35 = 0;
        }

        v10 |= v35;
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v38, (uint64_t)v42, 16);
      if (!v9) {
        goto LABEL_18;
      }
    }
  }
  char v10 = 0;
  char v37 = 0;
LABEL_18:

  return v37 & v10 & 1;
}

- (id)collaborationOptionsGroupsFromAllowedOptions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  mutableOptionsGroups = v2->_mutableOptionsGroups;
  if (!mutableOptionsGroups)
  {
    uint64_t v7 = objc_msgSend__uncachedCollaborationOptionsGroupsFromAllowedOptions(v2, v3, v4, v5);
    uint64_t v8 = v2->_mutableOptionsGroups;
    v2->_mutableOptionsGroups = (NSArray *)v7;

    mutableOptionsGroups = v2->_mutableOptionsGroups;
  }
  uint64_t v9 = mutableOptionsGroups;
  objc_sync_exit(v2);

  return v9;
}

- (void)_resolveCollaborationOptionsGroupsForExistingShare:(id)a3
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_shareOptions(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_optionsGroups(v8, v9, v10, v11);
  uint64_t v16 = (NSArray *)objc_msgSend_mutableCopy(v12, v13, v14, v15);

  if (objc_msgSend_publicPermission(v4, v17, v18, v19) == 1)
  {
    objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v20, @"CKSharingAccessSpecifiedRecipientsOnlyOptionID", (uint64_t)v16);
    uint64_t v24 = objc_msgSend_participants(v4, v21, v22, v23);
    unint64_t v28 = objc_msgSend_count(v24, v25, v26, v27);

    if (v28 >= 2)
    {
      if (objc_msgSend_allNonOwnerParticipantsHavePermission_(v4, v29, 2, v30))
      {
        objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v31, @"CKSharingPermissionViewOnlyOptionID", (uint64_t)v16);
      }
      else if (objc_msgSend_allNonOwnerParticipantsHavePermission_(v4, v31, 3, v32))
      {
        objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v44, @"CKSharingPermissionCanMakeChangesOptionID", (uint64_t)v16);
      }
      else
      {
        id v45 = objc_alloc(MEMORY[0x1E4F3BDE8]);
        id v52 = CKLocalizedString(@"COLLABORATION_OPTIONS_PERMISSION_MIXED", &stru_1ED7F5C98, v46, v47, v48, v49, v50, v51, v84[0]);
        uint64_t v54 = objc_msgSend_initWithTitle_identifier_selected_(v45, v53, (uint64_t)v52, @"CKSharingPermissionMixedOptionID", 1);

        v85[0] = v54;
        uint64_t v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v55, (uint64_t)v85, 1);
        objc_msgSend__addOptions_toExistingGroupWithID_inOptionsGroups_(self, v57, (uint64_t)v56, @"CKSharingPermissionGroupID", v16);
      }
      if (objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(self, v33, v34, v35))
      {
        if (objc_msgSend_allNonOwnerParticipantsHaveRole_(v4, v58, 2, v59))
        {
          objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v60, @"CKSharingAllowOthersToInviteOptionID", (uint64_t)v16);
        }
        else
        {
          id v61 = objc_alloc(MEMORY[0x1E4F3BDE8]);
          uint64_t v68 = CKLocalizedString(@"COLLABORATION_OPTIONS_ADDING_PEOPLE_ONLY_YOU", &stru_1ED7F5C98, v62, v63, v64, v65, v66, v67, v84[0]);
          uint64_t v70 = objc_msgSend_initWithTitle_identifier_selected_(v61, v69, (uint64_t)v68, @"CKSharingOnlyYouCanInviteOthersOptionID", 0);

          id v71 = objc_alloc(MEMORY[0x1E4F3BDE8]);
          uint64_t v78 = CKLocalizedString(@"COLLABORATION_OPTIONS_ADDING_PEOPLE_MIXED", &stru_1ED7F5C98, v72, v73, v74, v75, v76, v77, v84[0]);
          v80 = objc_msgSend_initWithTitle_identifier_selected_(v71, v79, (uint64_t)v78, @"CKSharingAllowOthersToInviteMixedOptionID", 1);

          v84[0] = (uint64_t)v70;
          v84[1] = (uint64_t)v80;
          v82 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v81, (uint64_t)v84, 2);
          objc_msgSend__addOptions_toExistingGroupWithID_inOptionsGroups_(self, v83, (uint64_t)v82, @"CKSharingAllowOthersToInviteGroupID", v16);
        }
      }
      else
      {
        objc_msgSend__removeOptionGroupWithID_fromOptionsGroups_(self, v58, @"CKSharingAllowOthersToInviteGroupID", (uint64_t)v16);
      }
    }
  }
  else
  {
    objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v20, @"CKSharingAccessAnyoneWithLinkOptionID", (uint64_t)v16);
    if (objc_msgSend_publicPermission(v4, v36, v37, v38) == 3) {
      objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v39, @"CKSharingPermissionCanMakeChangesOptionID", (uint64_t)v16);
    }
    else {
      objc_msgSend__selectOptionWithIdentifier_inGroups_(self, v39, @"CKSharingPermissionViewOnlyOptionID", (uint64_t)v16);
    }
  }
  long long v40 = self;
  objc_sync_enter(v40);
  mutableOptionsGroups = v40->_mutableOptionsGroups;
  v40->_mutableOptionsGroups = v16;
  v42 = v16;

  mutableShareOptions = v40->_mutableShareOptions;
  v40->_mutableShareOptions = 0;

  objc_sync_exit(v40);
}

- (void)_selectOptionWithIdentifier:(id)a3 inGroups:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = a4;
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v37, (uint64_t)v42, 16);
  if (v31)
  {
    uint64_t v30 = *(void *)v38;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v10;
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v12 = objc_msgSend_options(v11, v7, v8, v9);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v33, (uint64_t)v41, 16);
        if (v14)
        {
          uint64_t v18 = v14;
          uint64_t v19 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v34 != v19) {
                objc_enumerationMutation(v12);
              }
              uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v22 = objc_msgSend_identifier(v21, v15, v16, v17);
              int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v5, v24);

              if (isEqualToString)
              {
                objc_msgSend_setSelected_(v21, v15, 1, v17);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v26 = objc_msgSend_identifier(v21, v15, v16, v17);
                  objc_msgSend_setSelectedOptionIdentifier_(v11, v27, (uint64_t)v26, v28);
                }
              }
            }
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v33, (uint64_t)v41, 16);
          }
          while (v18);
        }

        uint64_t v10 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, (uint64_t)v42, 16);
    }
    while (v31);
  }
}

- (void)_removeOptionGroupWithID:(id)a3 fromOptionsGroups:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_identifier(v16, v9, v10, v11);
        int isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v5, v19);

        if (isEqualToString)
        {
          id v21 = v16;

          uint64_t v13 = v21;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v12);
    if (v13)
    {
      objc_msgSend_removeObject_(v6, v9, (uint64_t)v13, v11);
    }
  }
}

- (void)_addOptions:(id)a3 toExistingGroupWithID:(id)a4 inOptionsGroups:(id)a5
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v79, (uint64_t)v84, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v74 = v8;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v80 != v18) {
          objc_enumerationMutation(v10);
        }
        v20 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        id v21 = objc_msgSend_identifier(v20, v13, v14, v15);
        int isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v9, v23);

        if (isEqualToString)
        {
          id v25 = v20;

          uint64_t v17 = v25;
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v79, (uint64_t)v84, 16);
    }
    while (v16);
    id v8 = v74;
    if (v17)
    {
      uint64_t v26 = objc_msgSend_title(v17, v13, v14, v15);
      uint64_t v30 = objc_msgSend_identifier(v17, v27, v28, v29);
      int v33 = objc_msgSend_isEqualToString_(v30, v31, @"CKSharingAllowOthersToInviteGroupID", v32);

      if (v33
        && (objc_msgSend__optionsGroupsOnlyContainsSingleOptionInPermissionArrayAndWhoCanAccessArray_(self, v34, (uint64_t)v10, v35) & 1) == 0)
      {
        uint64_t v42 = CKLocalizedString(@"COLLABORATION_OPTIONS_ADDING_PEOPLE_TITLE", &stru_1ED7F5C98, v36, v37, v38, v39, v40, v41, v73);

        uint64_t v26 = (void *)v42;
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v43 = v74;
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v75, (uint64_t)v83, 16);
      if (v45)
      {
        uint64_t v49 = v45;
        uint64_t v50 = 0;
        uint64_t v51 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v76 != v51) {
              objc_enumerationMutation(v43);
            }
            uint64_t v53 = *(void **)(*((void *)&v75 + 1) + 8 * j);
            if (objc_msgSend_isSelected(v53, v46, v47, v48))
            {
              id v54 = v53;

              uint64_t v50 = v54;
            }
          }
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v75, (uint64_t)v83, 16);
        }
        while (v49);
      }
      else
      {
        uint64_t v50 = 0;
      }

      id v55 = objc_alloc(MEMORY[0x1E4F3BDF8]);
      uint64_t v59 = objc_msgSend_options(v17, v56, v57, v58);
      uint64_t v62 = objc_msgSend_arrayByAddingObjectsFromArray_(v59, v60, (uint64_t)v43, v61);
      uint64_t v64 = objc_msgSend_initWithTitle_identifier_footer_options_(v55, v63, (uint64_t)v26, (uint64_t)v9, 0, v62);

      if (v50)
      {
        uint64_t v68 = objc_msgSend_identifier(v50, v65, v66, v67);
        objc_msgSend_setSelectedOptionIdentifier_(v64, v69, (uint64_t)v68, v70);
      }
      objc_msgSend_removeObject_(v10, v65, (uint64_t)v17, v67);
      objc_msgSend_addObject_(v10, v71, (uint64_t)v64, v72);

      id v8 = v74;
    }
  }
}

+ (id)resolvedOptionsFromOptions:(id)a3 forExistingShare:(id)a4
{
  id v5 = a4;
  id v9 = objc_msgSend_copy(a3, v6, v7, v8);
  if (objc_msgSend_publicPermission(v5, v10, v11, v12) != 1) {
    goto LABEL_7;
  }
  uint64_t v16 = objc_msgSend_currentUserParticipant(v5, v13, v14, v15);
  if (objc_msgSend_role(v16, v17, v18, v19) == 1)
  {
  }
  else
  {
    id v25 = objc_msgSend_currentUserParticipant(v5, v20, v21, v22);
    uint64_t v29 = objc_msgSend_role(v25, v26, v27, v28);

    if (v29 != 2) {
      objc_msgSend_setSupportAllowingAddedParticipantsToInviteOthers_(v9, v23, 0, v24);
    }
  }
  if (objc_msgSend_allNonOwnerParticipantsHavePermission_(v5, v23, 2, v24)) {
LABEL_7:
  }
    objc_msgSend_setSupportAllowingAddedParticipantsToInviteOthers_(v9, v13, 0, v15);
  objc_msgSend__resolveCollaborationOptionsGroupsForExistingShare_(v9, v13, (uint64_t)v5, v15);

  return v9;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"UTCollaborationOptionsType";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v4, 1);

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v10 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v9, v8, (uint64_t)v7, a5);

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"UTCollaborationOptionsType";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v4, 1);

  return (NSArray *)v2;
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v5 = (void (**)(id, void *, id))a4;
  id v10 = 0;
  id v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v6, (uint64_t)self, 1, &v10);
  id v8 = v10;
  if (v5) {
    v5[2](v5, v7, v8);
  }

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_allowedParticipantPermissionOptions(self, v5, v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v9, v8, @"CKSharingAllowedParticipantPermissionOptionsKey");
  uint64_t v13 = objc_msgSend_allowedParticipantAccessOptions(self, v10, v11, v12);
  objc_msgSend_encodeInteger_forKey_(v4, v14, v13, @"CKSharingAllowedParticipantAccessOptionsKey");
  uint64_t v18 = objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v4, v19, v18, @"CKSharingSupportAllowingAddedParticipantsToInviteOthersKey");
  uint64_t v23 = objc_msgSend_shareOptions(self, v20, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"CKSharingCollaborationShareOptionsKey");

  objc_msgSend_shareOptions(self, v25, v26, v27);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_optionsGroups(v33, v28, v29, v30);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, @"CKSharingCollaborationOptionsGroupsKey");
}

- (CKAllowedSharingOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKAllowedSharingOptions;
  uint64_t v7 = [(CKAllowedSharingOptions *)&v28 init];
  if (v7)
  {
    v7->_allowedParticipantPermissionOptions = objc_msgSend_decodeIntegerForKey_(v4, v5, @"CKSharingAllowedParticipantPermissionOptionsKey", v6);
    v7->_allowedParticipantAccessOptions = objc_msgSend_decodeIntegerForKey_(v4, v8, @"CKSharingAllowedParticipantAccessOptionsKey", v9);
    v7->_supportAllowingAddedParticipantsToInviteOthers = objc_msgSend_decodeBoolForKey_(v4, v10, @"CKSharingSupportAllowingAddedParticipantsToInviteOthersKey", v11);
    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"CKSharingCollaborationShareOptionsKey");
    mutableShareOptions = v7->_mutableShareOptions;
    v7->_mutableShareOptions = (_SWCollaborationShareOptions *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v23 = objc_msgSend_setWithObjects_(v16, v21, v17, v22, v18, v19, v20, 0);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, @"CKSharingCollaborationOptionsGroupsKey");
    mutableOptionsGroups = v7->_mutableOptionsGroups;
    v7->_mutableOptionsGroups = (NSArray *)v25;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKAllowedSharingOptions);
  v4->_allowedParticipantPermissionOptions = objc_msgSend_allowedParticipantPermissionOptions(self, v5, v6, v7);
  v4->_allowedParticipantAccessOptions = objc_msgSend_allowedParticipantAccessOptions(self, v8, v9, v10);
  v4->_supportAllowingAddedParticipantsToInviteOthers = objc_msgSend_supportAllowingAddedParticipantsToInviteOthers(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_mutableShareOptions(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  mutableShareOptions = v4->_mutableShareOptions;
  v4->_mutableShareOptions = (_SWCollaborationShareOptions *)v21;

  uint64_t v26 = objc_msgSend_mutableOptionsGroups(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_CKDeepCopy(v26, v27, v28, v29);
  mutableOptionsGroups = v4->_mutableOptionsGroups;
  v4->_mutableOptionsGroups = (NSArray *)v30;

  return v4;
}

- (CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions
{
  return self->_allowedParticipantPermissionOptions;
}

- (void)setAllowedParticipantPermissionOptions:(CKSharingParticipantPermissionOption)allowedParticipantPermissionOptions
{
  self->_allowedParticipantPermissionOptions = allowedParticipantPermissionOptions;
}

- (CKSharingParticipantAccessOption)allowedParticipantAccessOptions
{
  return self->_allowedParticipantAccessOptions;
}

- (void)setAllowedParticipantAccessOptions:(CKSharingParticipantAccessOption)allowedParticipantAccessOptions
{
  self->_allowedParticipantAccessOptions = allowedParticipantAccessOptions;
}

- (_SWCollaborationShareOptions)mutableShareOptions
{
  return self->_mutableShareOptions;
}

- (void)setMutableShareOptions:(id)a3
{
}

- (NSArray)mutableOptionsGroups
{
  return self->_mutableOptionsGroups;
}

- (void)setMutableOptionsGroups:(id)a3
{
}

- (BOOL)supportAllowingAddedParticipantsToInviteOthers
{
  return self->_supportAllowingAddedParticipantsToInviteOthers;
}

- (void)setSupportAllowingAddedParticipantsToInviteOthers:(BOOL)a3
{
  self->_supportAllowingAddedParticipantsToInviteOthers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableOptionsGroups, 0);

  objc_storeStrong((id *)&self->_mutableShareOptions, 0);
}

@end