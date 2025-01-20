@interface IMNicknameController
+ (BOOL)accountsMatchUpToUseNicknames;
+ (BOOL)multiplePhoneNumbersTiedToAppleID;
+ (id)sharedInstance;
- (BOOL)_canUpdatePersonalNickname;
- (BOOL)_nicknameFeatureEnabled;
- (BOOL)handleIsAllowedForSharing:(id)a3;
- (BOOL)handleIsDeniedForSharing:(id)a3;
- (BOOL)hasObservedTransitionForHandleID:(id)a3;
- (BOOL)iCloudSignedInToUseNicknames;
- (BOOL)isActiveForNickname:(id)a3;
- (BOOL)isIgnoredForNickname:(id)a3;
- (BOOL)isInitialLoad;
- (BOOL)isInitialLoadComplete;
- (BOOL)shouldOfferNicknameSharingForChat:(id)a3;
- (BOOL)shouldOfferNicknameSharingForHandles:(id)a3;
- (IMNickname)personalNickname;
- (IMNicknameController)init;
- (NSDictionary)activeRecords;
- (NSDictionary)archivedNicknames;
- (NSDictionary)handledNicknames;
- (NSDictionary)ignoredRecords;
- (NSDictionary)pendingNicknameUpdates;
- (NSDictionary)unknownSenderRecords;
- (NSMutableDictionary)responseHandlers;
- (NSMutableSet)scrutinyNicknameHandles;
- (NSSet)allowListedHandlesForSharing;
- (NSSet)denyListedHandlesForSharing;
- (NSSet)transitionedHandles;
- (id)IMSharedHelperMD5Helper:(id)a3;
- (id)_handleIDsForHandle:(id)a3;
- (id)archivedNicknameForHandleIDs:(id)a3;
- (id)contactStore;
- (id)createSharedProfileStateOracleForHandles:(id)a3;
- (id)currentNicknameForHandleIDs:(id)a3;
- (id)daemonController;
- (id)getNicknameHandlesUnderScrutiny;
- (id)handlesForNicknamesUnderScrutiny;
- (id)imageDataForHandle:(id)a3;
- (id)meCardSharingState;
- (id)nicknameForHandle:(id)a3;
- (id)nicknameForHandleIDs:(id)a3;
- (id)pendingNicknameForHandleIDs:(id)a3;
- (id)personNameComponentsForHandle:(id)a3;
- (id)truncateNameIfNeeded:(id)a3;
- (id)unknownSenderRecordInfoFor:(id)a3;
- (unint64_t)nicknameUpdateForHandle:(id)a3 nicknameIfAvailable:(id *)a4;
- (void)_broadcastNicknamePreferencesDidChange:(id)a3;
- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4;
- (void)allowHandlesForNicknameSharing:(id)a3 forChat:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6;
- (void)allowHandlesForNicknameSharing:(id)a3 fromHandle:(id)a4 forceSend:(BOOL)a5;
- (void)clearHandleFromScrutiny:(id)a3;
- (void)clearPendingNicknameUpdatesForHandle:(id)a3;
- (void)clearPendingNicknameUpdatesForHandle:(id)a3 forceClear:(BOOL)a4;
- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3;
- (void)denyHandlesForNicknameSharing:(id)a3;
- (void)fetchPersonalNicknameWithCompletion:(id)a3;
- (void)ignorePendingNicknameUpdatesForHandle:(id)a3;
- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3;
- (void)markAllAsPending;
- (void)markHandleUnderScrutiny:(id)a3;
- (void)markNickname:(id)a3 asActive:(BOOL)a4;
- (void)markNicknameAsIgnored:(id)a3;
- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4;
- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4;
- (void)sendPersonalNicknameToHandle:(id)a3;
- (void)sendPersonalNicknameToHandle:(id)a3 fromHandle:(id)a4;
- (void)setActiveRecords:(id)a3;
- (void)setAllowListedHandlesForSharing:(id)a3;
- (void)setArchivedNicknames:(id)a3;
- (void)setDenyListedHandlesForSharing:(id)a3;
- (void)setHandledNicknames:(id)a3;
- (void)setIgnoredRecords:(id)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setNicknameHandlesUnderScrutiny;
- (void)setPendingNicknameUpdates:(id)a3;
- (void)setPersonalNickname:(id)a3;
- (void)setPersonalNicknameFromOnboardingResult:(id)a3;
- (void)setResponseHandlers:(id)a3;
- (void)setScrutinyNicknameHandles:(id)a3;
- (void)setTransitionedHandles:(id)a3;
- (void)setUnknownSenderRecords:(id)a3;
- (void)updateIsActiveList:(id)a3;
- (void)updateIsIgnoredList:(id)a3;
- (void)updateLocalNicknameStore;
- (void)updatePendingNicknameForHandleIDs:(id)a3;
- (void)updatePendingNicknames:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5;
- (void)updatePersonalNickname:(id)a3;
- (void)updatePersonalNicknameIfNecessaryWithMeCardSharingResult:(id)a3;
- (void)updateSharingAllowList:(id)a3 denyList:(id)a4;
- (void)updateTransitionedNicknameHandles:(id)a3;
- (void)updateUnknownSenderRecords:(id)a3;
@end

@implementation IMNicknameController

+ (id)sharedInstance
{
  if (qword_1EB3F24B8 != -1) {
    dispatch_once(&qword_1EB3F24B8, &unk_1EF8E5258);
  }
  v2 = (void *)qword_1EB3F2518;

  return v2;
}

- (IMNicknameController)init
{
  v19.receiver = self;
  v19.super_class = (Class)IMNicknameController;
  v2 = [(IMNicknameController *)&v19 init];
  v6 = v2;
  if (v2)
  {
    if (objc_msgSend__nicknameFeatureEnabled(v2, v3, v4, v5))
    {
      objc_msgSend_setIsInitialLoad_(v6, v7, 1, v8);
      objc_msgSend_updateLocalNicknameStore(v6, v9, v10, v11);
      v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
      objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)v6, (uint64_t)sel__broadcastNicknamePreferencesDidChange_, *MEMORY[0x1E4F6DDE8], 0);
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        return v6;
      }
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not loading IMNicknameController", v18, 2u);
      }
    }
  }
  return v6;
}

- (BOOL)_nicknameFeatureEnabled
{
  return MEMORY[0x1F41244D0](self, a2);
}

- (BOOL)_canUpdatePersonalNickname
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  char isAllowMultiplePhoneNumbersSNaPEnabled = objc_msgSend_isAllowMultiplePhoneNumbersSNaPEnabled(v5, v6, v7, v8);

  int v13 = objc_msgSend_iCloudSignedInToUseNicknames(self, v10, v11, v12);
  BOOL result = isAllowMultiplePhoneNumbersSNaPEnabled & v13;
  if ((isAllowMultiplePhoneNumbersSNaPEnabled & 1) == 0)
  {
    if (v13)
    {
      v15 = objc_opt_class();
      return objc_msgSend_multiplePhoneNumbersTiedToAppleID(v15, v16, v17, v18) ^ 1;
    }
  }
  return result;
}

- (void)_broadcastNicknamePreferencesDidChange:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Got IMNicknamePreferencesDidChangeNotification so syncing preferences", v13, 2u);
    }
  }
  v9 = objc_msgSend_daemonController(self, v5, v6, v7);
  objc_msgSend_nicknamePreferencesDidChange(v9, v10, v11, v12);
}

- (id)nicknameForHandle:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend__handleIDsForHandle_(self, v8, (uint64_t)v4, v9);
    int v13 = objc_msgSend_nicknameForHandleIDs_(self, v11, (uint64_t)v10, v12);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Nickname feature not enabled, returning nil nickname for handle %@", (uint8_t *)&v16, 0xCu);
      }
    }
    int v13 = 0;
  }

  return v13;
}

- (unint64_t)nicknameUpdateForHandle:(id)a3 nicknameIfAvailable:(id *)a4
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend__nicknameFeatureEnabled(self, v6, v7, v8))
  {
    v164 = v5;
    objc_msgSend__handleIDsForHandle_(self, v9, (uint64_t)v5, v10);
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v172, (uint64_t)v183, 16);
    if (v16)
    {
      uint64_t v17 = *(void *)v173;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v173 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void *)(*((void *)&v172 + 1) + 8 * v18);
        v20 = objc_msgSend_pendingNicknameUpdates(self, v13, v14, v15);
        v23 = objc_msgSend_objectForKey_(v20, v21, v19, v22);

        if (v23) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v172, (uint64_t)v183, 16);
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      if (a4) {
        *a4 = v23;
      }
      v29 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v26, v27, v28);
      int isNameAndPhotoC3Enabled = objc_msgSend_isNameAndPhotoC3Enabled(v29, v30, v31, v32);

      uint64_t v35 = *MEMORY[0x1E4F1ADE0];
      if (isNameAndPhotoC3Enabled)
      {
        v182[0] = *MEMORY[0x1E4F1ADF0];
        v182[1] = v35;
        uint64_t v36 = *MEMORY[0x1E4F1AFB8];
        v182[2] = *MEMORY[0x1E4F1AE28];
        v182[3] = v36;
        v182[4] = *MEMORY[0x1E4F1AE30];
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v182, 5);
      }
      else
      {
        v181[0] = *MEMORY[0x1E4F1ADF0];
        v181[1] = v35;
        uint64_t v37 = *MEMORY[0x1E4F1AE30];
        v181[2] = *MEMORY[0x1E4F1AE28];
        v181[3] = v37;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v181, 4);
      v38 = };
      v165 = objc_msgSend_cnContactWithKeys_(v164, v39, (uint64_t)v38, v40);

      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v41 = v11;
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v168, (uint64_t)v180, 16);
      if (v46)
      {
        uint64_t v47 = *(void *)v169;
LABEL_23:
        uint64_t v48 = 0;
        while (1)
        {
          if (*(void *)v169 != v47) {
            objc_enumerationMutation(v41);
          }
          uint64_t v49 = *(void *)(*((void *)&v168 + 1) + 8 * v48);
          v50 = objc_msgSend_handledNicknames(self, v43, v44, v45);
          v53 = objc_msgSend_objectForKey_(v50, v51, v49, v52);

          if (v53) {
            break;
          }
          if (v46 == ++v48)
          {
            uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v168, (uint64_t)v180, 16);
            if (v46) {
              goto LABEL_23;
            }
            goto LABEL_29;
          }
        }

        if (objc_msgSend_isCNContactAKnownContact_(MEMORY[0x1E4F6E6D8], v54, (uint64_t)v165, v55))
        {
          int v161 = 0;
          goto LABEL_32;
        }
        if (IMOSLoggingEnabled())
        {
          v123 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v177 = v53;
            _os_log_impl(&dword_1A4AF7000, v123, OS_LOG_TYPE_INFO, "Not displaying nickname update banner for unknown contact with previously handled nickname: %@", buf, 0xCu);
          }
        }
        objc_msgSend_clearPendingNicknameUpdatesForHandle_forceClear_(self, v122, (uint64_t)v164, 1);
        unint64_t v24 = 0;
        if (a4) {
          *a4 = 0;
        }
        goto LABEL_137;
      }
LABEL_29:

      v53 = 0;
      int v161 = 1;
LABEL_32:
      if (IMOSLoggingEnabled())
      {
        v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v177 = v53;
          _os_log_impl(&dword_1A4AF7000, v57, OS_LOG_TYPE_INFO, "Last handled nickname: %@", buf, 0xCu);
        }
      }
      int isUpdateFromNickname_withOptions = objc_msgSend_isUpdateFromNickname_withOptions_(v23, v56, (uint64_t)v53, 4);
      int v60 = objc_msgSend_isUpdateFromNickname_withOptions_(v23, v59, (uint64_t)v53, 2);
      v64 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v61, v62, v63);
      int v68 = objc_msgSend_isNameAndPhotoC3Enabled(v64, v65, v66, v67);

      if (v68) {
        int v167 = objc_msgSend_isUpdateFromNickname_withOptions_(v23, v69, (uint64_t)v53, 32);
      }
      else {
        int v167 = 0;
      }
      int v163 = objc_msgSend_isUpdateFromNickname_withOptions_(v23, v69, (uint64_t)v53, 16);
      if (isUpdateFromNickname_withOptions)
      {
        if (IMOSLoggingEnabled())
        {
          v76 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v177 = v23;
            __int16 v178 = 2112;
            v179 = v165;
            _os_log_impl(&dword_1A4AF7000, v76, OS_LOG_TYPE_INFO, "Pending nickname update %@ does not match previously handled nickname for contact %@", buf, 0x16u);
          }
        }
        v77 = objc_msgSend_givenName(v165, v73, v74, v75);
        v81 = objc_msgSend_firstName(v23, v78, v79, v80);
        if (objc_msgSend_isEqualToString_(v77, v82, (uint64_t)v81, v83))
        {
          v87 = objc_msgSend_familyName(v165, v84, v85, v86);
          v91 = objc_msgSend_lastName(v23, v88, v89, v90);
          int isEqualToString = objc_msgSend_isEqualToString_(v87, v92, (uint64_t)v91, v93);

          if (isEqualToString)
          {
            if (IMOSLoggingEnabled())
            {
              v95 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A4AF7000, v95, OS_LOG_TYPE_INFO, "Pending nickname name matches names for contact. Setting nameChanged to NO", buf, 2u);
              }
            }
            goto LABEL_50;
          }
        }
        else
        {
        }
        if (IMOSLoggingEnabled())
        {
          v126 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v177 = v23;
            __int16 v178 = 2112;
            v179 = v165;
            _os_log_impl(&dword_1A4AF7000, v126, OS_LOG_TYPE_INFO, "Pending nickname name %@ does not match current contact name %@", buf, 0x16u);
          }
        }
        objc_msgSend_updateNameFromContact_(v23, v124, (uint64_t)v165, v125);
        uint64_t v162 = 2;
        if (v60)
        {
LABEL_51:
          v96 = objc_msgSend_imageData(v165, v70, v71, v72);
          if (!objc_msgSend_length(v96, v97, v98, v99))
          {
            if (IMOSLoggingEnabled())
            {
              v127 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v177 = v165;
                __int16 v178 = 2112;
                v179 = v23;
                _os_log_impl(&dword_1A4AF7000, v127, OS_LOG_TYPE_INFO, "Existing contact does not have an image, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
            }
            int v121 = 1;
            goto LABEL_92;
          }
          v103 = objc_msgSend_imageHash(v23, v100, v101, v102);
          v107 = objc_msgSend_imageHash(v165, v104, v105, v106);
          BOOL v108 = v107 == 0;

          if (v108)
          {
            if (IMOSLoggingEnabled())
            {
              v128 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v177 = v165;
                __int16 v178 = 2112;
                v179 = v23;
                _os_log_impl(&dword_1A4AF7000, v128, OS_LOG_TYPE_INFO, "Could not determine md5 hash of existing image data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
              goto LABEL_89;
            }
          }
          else if (objc_msgSend_length(v103, v109, v110, v111))
          {
            v115 = objc_msgSend_imageHash(v165, v112, v113, v114);
            char isEqual = objc_msgSend_isEqual_(v115, v116, (uint64_t)v103, v117);

            int v119 = IMOSLoggingEnabled();
            if (isEqual)
            {
              if (v119)
              {
                v120 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v177 = v165;
                  __int16 v178 = 2112;
                  v179 = v23;
                  _os_log_impl(&dword_1A4AF7000, v120, OS_LOG_TYPE_INFO, "Photo update has a the same md5 hash as the existing contact photo, suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
                }
              }
              int v121 = 0;
              goto LABEL_91;
            }
            if (v119)
            {
              v128 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v177 = v165;
                __int16 v178 = 2112;
                v179 = v23;
                _os_log_impl(&dword_1A4AF7000, v128, OS_LOG_TYPE_INFO, "Photo update has a distinct md5 hash from the existing contact photo, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
LABEL_89:
            }
          }
          else if (IMOSLoggingEnabled())
          {
            v128 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v177 = v165;
              __int16 v178 = 2112;
              v179 = v23;
              _os_log_impl(&dword_1A4AF7000, v128, OS_LOG_TYPE_INFO, "Could not determine md5 hash of suggested update image data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
            }
            goto LABEL_89;
          }
          int v121 = 1;
LABEL_91:

LABEL_92:
LABEL_93:
          if (!v167)
          {
            int v153 = 0;
LABEL_124:
            if (!v163
              || v161
              && (objc_msgSend_pronouns(v23, v70, v71, v72),
                  v156 = objc_claimAutoreleasedReturnValue(),
                  BOOL v157 = v156 == 0,
                  v156,
                  v157))
            {
              uint64_t v159 = v162 | 4;
              if (!v121) {
                uint64_t v159 = v162;
              }
              if (v153) {
                unint64_t v24 = v159 | 8;
              }
              else {
                unint64_t v24 = v159;
              }
            }
            else
            {
              uint64_t v158 = v162 | 4;
              if (!v121) {
                uint64_t v158 = v162;
              }
              if (v153) {
                v158 |= 8uLL;
              }
              unint64_t v24 = v158 | 0x10;
            }
LABEL_137:

            goto LABEL_138;
          }
          v129 = objc_msgSend_wallpaper(v165, v70, v71, v72);
          v133 = objc_msgSend_dataRepresentation(v129, v130, v131, v132);
          if (!objc_msgSend_length(v133, v134, v135, v136))
          {
            if (IMOSLoggingEnabled())
            {
              v154 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v177 = v165;
                __int16 v178 = 2112;
                v179 = v23;
                _os_log_impl(&dword_1A4AF7000, v154, OS_LOG_TYPE_INFO, "Existing contact does not have a wallpaper, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
            }
            int v153 = 1;
            goto LABEL_123;
          }
          v137 = IMSharedHelperMD5OfDataInBytes();
          v141 = objc_msgSend_wallpaperImageHash(v23, v138, v139, v140);
          if (objc_msgSend_length(v137, v142, v143, v144))
          {
            if (objc_msgSend_length(v141, v145, v146, v147))
            {
              char v150 = objc_msgSend_isEqual_(v137, v148, (uint64_t)v141, v149);
              int v151 = IMOSLoggingEnabled();
              if (v150)
              {
                if (v151)
                {
                  v152 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v177 = v165;
                    __int16 v178 = 2112;
                    v179 = v23;
                    _os_log_impl(&dword_1A4AF7000, v152, OS_LOG_TYPE_INFO, "Wallpaper update has a the same md5 hash as the existing wallpaper, suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
                  }
                }
                int v153 = 0;
                goto LABEL_122;
              }
              if (v151)
              {
                v155 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v177 = v165;
                  __int16 v178 = 2112;
                  v179 = v23;
                  _os_log_impl(&dword_1A4AF7000, v155, OS_LOG_TYPE_INFO, "Wallpaper update has a distinct md5 hash from the existing wallpaper, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
                }
LABEL_120:
              }
            }
            else if (IMOSLoggingEnabled())
            {
              v155 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v177 = v165;
                __int16 v178 = 2112;
                v179 = v23;
                _os_log_impl(&dword_1A4AF7000, v155, OS_LOG_TYPE_INFO, "Could not determine md5 hash of suggested update wallpaper data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
              goto LABEL_120;
            }
          }
          else if (IMOSLoggingEnabled())
          {
            v155 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v177 = v165;
              __int16 v178 = 2112;
              v179 = v23;
              _os_log_impl(&dword_1A4AF7000, v155, OS_LOG_TYPE_INFO, "Could not determine md5 hash of existing wallpaper data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
            }
            goto LABEL_120;
          }
          int v153 = 1;
LABEL_122:

LABEL_123:
          goto LABEL_124;
        }
LABEL_72:
        int v121 = 0;
        goto LABEL_93;
      }
LABEL_50:
      uint64_t v162 = 0;
      if (v60) {
        goto LABEL_51;
      }
      goto LABEL_72;
    }
LABEL_10:
    unint64_t v24 = 0;
    v23 = v11;
LABEL_138:

    id v5 = v164;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v177 = v5;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Nickname feature not enabled, no update for handle %@", buf, 0xCu);
      }
    }
    unint64_t v24 = 0;
  }

  return v24;
}

- (id)IMSharedHelperMD5Helper:(id)a3
{
  return (id)MEMORY[0x1F41244A8](a3, a2);
}

- (void)clearPendingNicknameUpdatesForHandle:(id)a3 forceClear:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend__handleIDsForHandle_(self, v7, (uint64_t)v6, v8);
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v54 = 138412802;
      uint64_t v55 = v9;
      __int16 v56 = 2112;
      id v57 = v6;
      __int16 v58 = 1024;
      BOOL v59 = v4;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Clearing pending nickname update for handle IDs %@ on handle %@, force clear: %{BOOL}d", (uint8_t *)&v54, 0x1Cu);
    }
  }
  uint64_t v14 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v10, v11, v12);
  int isNameAndPhotoC3Enabled = objc_msgSend_isNameAndPhotoC3Enabled(v14, v15, v16, v17);

  if (objc_msgSend__nicknameFeatureEnabled(self, v19, v20, v21))
  {
    if (!isNameAndPhotoC3Enabled || v4)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          int v54 = 138412290;
          uint64_t v55 = v9;
          _os_log_impl(&dword_1A4AF7000, v47, OS_LOG_TYPE_INFO, "Asking the daemon to clear handle IDs: %@", (uint8_t *)&v54, 0xCu);
        }
      }
      unint64_t v24 = objc_msgSend_sharedInstance(IMDaemonController, v44, v45, v46);
      uint64_t v27 = objc_msgSend_allObjects(v9, v48, v49, v50);
      objc_msgSend_clearPendingNicknameUpdatesForHandleIDs_(v24, v51, (uint64_t)v27, v52);
    }
    else
    {
      unint64_t v24 = objc_msgSend_pendingNicknameForHandleIDs_(self, v22, (uint64_t)v9, v23);
      uint64_t v27 = objc_msgSend_currentNicknameForHandleIDs_(self, v25, (uint64_t)v9, v26);
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v54 = 138412546;
          uint64_t v55 = v24;
          __int16 v56 = 2112;
          id v57 = v27;
          _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Found pending nickname: %@, and current nickname %@", (uint8_t *)&v54, 0x16u);
        }
      }
      int isUpdateFromNickname_withOptions = objc_msgSend_isUpdateFromNickname_withOptions_(v24, v28, (uint64_t)v27, 8);
      if (IMOSLoggingEnabled())
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v54 = 67109120;
          LODWORD(v55) = isUpdateFromNickname_withOptions;
          _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Nicknames are different: %{BOOL}d", (uint8_t *)&v54, 8u);
        }
      }
      int v32 = IMOSLoggingEnabled();
      if (isUpdateFromNickname_withOptions)
      {
        if (v32)
        {
          uint64_t v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            int v54 = 138412290;
            uint64_t v55 = v9;
            _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Because the nicknames are different, we're asking the daemon to clear handle IDs: %@", (uint8_t *)&v54, 0xCu);
          }
        }
        uint64_t v37 = objc_msgSend_sharedInstance(IMDaemonController, v33, v34, v35);
        id v41 = objc_msgSend_allObjects(v9, v38, v39, v40);
        objc_msgSend_clearPendingNicknameUpdatesForHandleIDs_(v37, v42, (uint64_t)v41, v43);
      }
      else if (v32)
      {
        v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          LOWORD(v54) = 0;
          _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "Nicknames were the same, no need to clear.", (uint8_t *)&v54, 2u);
        }
      }
    }
  }
}

- (void)clearPendingNicknameUpdatesForHandle:(id)a3
{
}

- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Clearing pending nickname update for handle IDs %@", buf, 0xCu);
    }
  }
  if (objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v4;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v31;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
          uint64_t v18 = objc_msgSend_sharedInstance(IMNicknameController, v11, v12, v13, (void)v30);
          objc_msgSend_markTransitionAsObservedForHandleID_isAutoUpdate_(v18, v19, v17, 0);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v30, (uint64_t)v34, 16);
      }
      while (v14);
    }

    uint64_t v23 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
    uint64_t v27 = objc_msgSend_allObjects(v9, v24, v25, v26);
    objc_msgSend_clearPendingNicknameUpdatesForHandleIDs_(v23, v28, (uint64_t)v27, v29);
  }
}

- (void)ignorePendingNicknameUpdatesForHandle:(id)a3
{
  objc_msgSend__handleIDsForHandle_(self, a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ignorePendingNicknameUpdatesForHandleIDs_(self, v5, (uint64_t)v7, v6);
}

- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Ignoring pending nickname update for handle IDs %@", (uint8_t *)&v19, 0xCu);
    }
  }
  if (objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7))
  {
    uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11);
    uint64_t v16 = objc_msgSend_allObjects(v4, v13, v14, v15);
    objc_msgSend_ignorePendingNicknameUpdatesForHandleIDs_(v12, v17, (uint64_t)v16, v18);
  }
}

- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4
{
  uint64_t v14 = (char *)a3;
  int v9 = objc_msgSend__nicknameFeatureEnabled(self, v6, v7, v8);
  if (v14 && v9)
  {
    uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v14, v10, v11);
    objc_msgSend_acceptPendingNicknameForHandleID_updateType_(v12, v13, (uint64_t)v14, a4);
  }
}

- (BOOL)handleIsAllowedForSharing:(id)a3
{
  id v5 = objc_msgSend__handleIDsForHandle_(self, a2, (uint64_t)a3, v3);
  int v9 = objc_msgSend_allowListedHandlesForSharing(self, v6, v7, v8);
  char v12 = objc_msgSend_intersectsSet_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (BOOL)handleIsDeniedForSharing:(id)a3
{
  id v5 = objc_msgSend__handleIDsForHandle_(self, a2, (uint64_t)a3, v3);
  int v9 = objc_msgSend_denyListedHandlesForSharing(self, v6, v7, v8);
  char v12 = objc_msgSend_intersectsSet_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (void)allowHandlesForNicknameSharing:(id)a3 forChat:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = v10;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v38;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = objc_msgSend__handleIDsForHandle_(self, v17, *(void *)(*((void *)&v37 + 1) + 8 * v21), v18, (void)v37);
        objc_msgSend_unionSet_(v13, v23, (uint64_t)v22, v24);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v19);
  }

  if (objc_msgSend__nicknameFeatureEnabled(self, v25, v26, v27))
  {
    if (v11)
    {
      long long v31 = objc_msgSend_sharedRegistry(IMChatRegistry, v28, v29, v30);
      uint64_t v34 = objc_msgSend_allGUIDsForChat_(v31, v32, (uint64_t)v11, v33);
    }
    else
    {
      uint64_t v34 = 0;
    }
    uint64_t v35 = objc_msgSend_daemonController(self, v28, v29, v30, (void)v37);
    objc_msgSend_allowHandleIDsForNicknameSharing_onChatGUIDs_fromHandle_forceSend_(v35, v36, (uint64_t)v13, (uint64_t)v34, v12, v6);
  }
}

- (void)allowHandlesForNicknameSharing:(id)a3 fromHandle:(id)a4 forceSend:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v8;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v31;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = objc_msgSend__handleIDsForHandle_(self, v14, *(void *)(*((void *)&v30 + 1) + 8 * v18), v15, (void)v30);
        objc_msgSend_unionSet_(v10, v20, (uint64_t)v19, v21);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v16);
  }

  if (objc_msgSend__nicknameFeatureEnabled(self, v22, v23, v24))
  {
    uint64_t v28 = objc_msgSend_daemonController(self, v25, v26, v27);
    objc_msgSend_allowHandleIDsForNicknameSharing_onChatGUIDs_fromHandle_forceSend_(v28, v29, (uint64_t)v10, MEMORY[0x1E4F1CBF0], v9, v5);
  }
}

- (void)sendPersonalNicknameToHandle:(id)a3
{
}

- (void)sendPersonalNicknameToHandle:(id)a3 fromHandle:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10);
  uint64_t v15 = objc_msgSend_iMessageService(IMServiceImpl, v12, v13, v14);
  uint64_t v18 = objc_msgSend_bestAccountForService_(v11, v16, (uint64_t)v15, v17);

  uint64_t v20 = objc_msgSend_imHandleWithID_alreadyCanonical_(v18, v19, (uint64_t)v7, 0);

  if (v20)
  {
    v24[0] = v20;
    uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v24, 1);
    objc_msgSend_allowHandlesForNicknameSharing_fromHandle_forceSend_(self, v23, (uint64_t)v22, (uint64_t)v6, 1);
  }
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendNameOnlyToHandleIDs_fromHandleID_(v11, v10, (uint64_t)v6, (uint64_t)v5);
}

- (void)denyHandlesForNicknameSharing:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = objc_msgSend__handleIDsForHandle_(self, v9, *(void *)(*((void *)&v26 + 1) + 8 * v13), v10, (void)v26);
        objc_msgSend_unionSet_(v5, v15, (uint64_t)v14, v16);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v11);
  }

  if (objc_msgSend__nicknameFeatureEnabled(self, v17, v18, v19))
  {
    uint64_t v23 = objc_msgSend_daemonController(self, v20, v21, v22);
    objc_msgSend_denyHandleIDsForNicknameSharing_(v23, v24, (uint64_t)v5, v25);
  }
}

- (void)markNickname:(id)a3 asActive:(BOOL)a4
{
  BOOL v4 = a4;
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((objc_msgSend__nicknameFeatureEnabled(self, v7, v8, v9) & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    long long v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LOWORD(v42) = 0;
      _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Nickname feature disabled, not setting personal nickname", (uint8_t *)&v42, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v16 = objc_msgSend_recordID(v6, v10, v11, v12);
  if (!v16
    || (objc_msgSend_handle(v6, v13, v14, v15),
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    long long v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      long long v37 = objc_msgSend_handle(v6, v34, v35, v36);
      id v41 = objc_msgSend_recordID(v6, v38, v39, v40);
      int v42 = 138412546;
      uint64_t v43 = v37;
      __int16 v44 = 2112;
      uint64_t v45 = v41;
      _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Tried marking a nickname as active that is missing a handle or record ID. Handle: %@, RecordID: %@", (uint8_t *)&v42, 0x16u);
    }
    goto LABEL_12;
  }
  uint64_t v21 = objc_msgSend_daemonController(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_handle(v6, v22, v23, v24);
  uint64_t v46 = v25;
  long long v29 = objc_msgSend_recordID(v6, v26, v27, v28);
  v47[0] = v29;
  uint64_t v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v47, (uint64_t)&v46, 1);
  objc_msgSend_markProfileRecords_asActive_(v21, v32, (uint64_t)v31, v4);

LABEL_13:
}

- (BOOL)isActiveForNickname:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_activeRecords(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_handle(v4, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v8, v13, (uint64_t)v12, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_recordID(v4, v16, v17, v18);
    char isEqualToString = objc_msgSend_isEqualToString_(v15, v20, (uint64_t)v19, v21);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (void)markNicknameAsIgnored:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7) & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    long long v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(v41) = 0;
      _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Nickname feature disabled, not setting personal nickname", (uint8_t *)&v41, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v14 = objc_msgSend_recordID(v4, v8, v9, v10);
  if (!v14
    || (objc_msgSend_handle(v4, v11, v12, v13),
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    long long v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = objc_msgSend_handle(v4, v33, v34, v35);
      uint64_t v40 = objc_msgSend_recordID(v4, v37, v38, v39);
      int v41 = 138412546;
      int v42 = v36;
      __int16 v43 = 2112;
      __int16 v44 = v40;
      _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Tried marking a nickname as ignored that is missing a handle or record ID. Handle: %@, RecordID: %@", (uint8_t *)&v41, 0x16u);
    }
    goto LABEL_12;
  }
  uint64_t v19 = objc_msgSend_daemonController(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_handle(v4, v20, v21, v22);
  uint64_t v45 = v23;
  uint64_t v27 = objc_msgSend_recordID(v4, v24, v25, v26);
  v46[0] = v27;
  long long v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v46, (uint64_t)&v45, 1);
  objc_msgSend_markProfileRecordsAsIgnored_(v19, v30, (uint64_t)v29, v31);

LABEL_13:
}

- (BOOL)isIgnoredForNickname:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_ignoredRecords(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_handle(v4, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v8, v13, (uint64_t)v12, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_recordID(v4, v16, v17, v18);
    char isEqualToString = objc_msgSend_isEqualToString_(v15, v20, (uint64_t)v19, v21);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (void)setPersonalNickname:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v38 = 136315138;
      uint64_t v39 = "-[IMNicknameController setPersonalNickname:]";
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Setting personal nickname for %s", (uint8_t *)&v38, 0xCu);
    }
  }
  if (objc_msgSend__nicknameFeatureEnabled(self, v6, v7, v8))
  {
    char canUpdatePersonalNickname = objc_msgSend__canUpdatePersonalNickname(self, v10, v11, v12);
    int v14 = IMOSLoggingEnabled();
    if (canUpdatePersonalNickname)
    {
      if (v14)
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v38 = 138412290;
          uint64_t v39 = v5;
          _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Setting new personal nickname and notifying daemon %@", (uint8_t *)&v38, 0xCu);
        }
      }
      if (v5)
      {
        objc_storeStrong((id *)&self->_personalNickname, a3);
        uint64_t v19 = objc_msgSend_daemonController(self, v16, v17, v18);
        objc_msgSend_setNewPersonalNickname_(v19, v20, (uint64_t)v5, v21);

        uint64_t v25 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v22, v23, v24);
        objc_msgSend_postNotificationName_object_(v25, v26, @"__kIMPersonalNicknameDidChangeNotification", 0);
      }
    }
    else if (v14)
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = NSNumber;
        long long v30 = objc_opt_class();
        uint64_t v34 = objc_msgSend_multiplePhoneNumbersTiedToAppleID(v30, v31, v32, v33);
        objc_msgSend_numberWithBool_(v29, v35, v34, v36);
        long long v37 = (char *)objc_claimAutoreleasedReturnValue();
        int v38 = 138412290;
        uint64_t v39 = v37;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "We can't update the personal nickname - multiplePhoneNumbers: %@}", (uint8_t *)&v38, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Nickname feature disabled, not setting personal nickname", (uint8_t *)&v38, 2u);
    }
  }
}

- (void)fetchPersonalNicknameWithCompletion:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  if (objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7))
  {
    char canUpdatePersonalNickname = objc_msgSend__canUpdatePersonalNickname(self, v8, v9, v10);
    int v12 = IMOSLoggingEnabled();
    if (canUpdatePersonalNickname)
    {
      if (v12)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v43 = "-[IMNicknameController fetchPersonalNicknameWithCompletion:]";
          _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Fetching personal nickname for %s", buf, 0xCu);
        }
      }
      uint64_t v17 = objc_msgSend_personalNickname(self, v13, v14, v15);

      if (v17)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Personal nickname found", buf, 2u);
          }
        }
        if (v4)
        {
          uint64_t v25 = objc_msgSend_personalNickname(self, v21, v22, v23);
          v4[2](v4, v25);
        }
      }
      else if (v4)
      {
        long long v37 = objc_msgSend_daemonController(self, v18, v19, v20);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = sub_1A4B7E038;
        v40[3] = &unk_1E5B7BFC0;
        v40[4] = self;
        int v41 = v4;
        objc_msgSend_fetchPersonalNicknameWithReply_(v37, v38, (uint64_t)v40, v39);
      }
      goto LABEL_28;
    }
    if (v12)
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = NSNumber;
        long long v29 = objc_opt_class();
        uint64_t v33 = objc_msgSend_multiplePhoneNumbersTiedToAppleID(v29, v30, v31, v32);
        objc_msgSend_numberWithBool_(v28, v34, v33, v35);
        uint64_t v36 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        __int16 v43 = v36;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "We can't fetch the personal nickname - multiplePhoneNumbers: %@", buf, 0xCu);
      }
    }
    if (v4) {
LABEL_19:
    }
      v4[2](v4, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Nickname feature disabled, not fetching personal nickname", buf, 2u);
      }
    }
    if (v4) {
      goto LABEL_19;
    }
  }
LABEL_28:
}

- (void)updatePersonalNickname:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v9 = objc_msgSend__nicknameFeatureEnabled(self, v6, v7, v8);
  if (!v5 || v9)
  {
    int canUpdatePersonalNickname = objc_msgSend__canUpdatePersonalNickname(self, v10, v11, v12);
    int v15 = IMOSLoggingEnabled();
    if (!v5 || canUpdatePersonalNickname)
    {
      if (v15)
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v32 = 138412290;
          id v33 = v5;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Received personal nickname from daemon: %@", (uint8_t *)&v32, 0xCu);
        }
      }
      objc_storeStrong((id *)&self->_personalNickname, a3);
      long long v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28, v29);
      objc_msgSend_postNotificationName_object_(v30, v31, @"__kIMPersonalNicknameDidChangeNotification", 0);
    }
    else if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = NSNumber;
        uint64_t v18 = objc_opt_class();
        uint64_t v22 = objc_msgSend_multiplePhoneNumbersTiedToAppleID(v18, v19, v20, v21);
        uint64_t v25 = objc_msgSend_numberWithBool_(v17, v23, v22, v24);
        int v32 = 138412290;
        id v33 = v25;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "We can't update the personal nickname - multiplePhoneNumbers: %@", (uint8_t *)&v32, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Nickname feature disabled, not updating personal nickname", (uint8_t *)&v32, 2u);
    }
  }
}

- (BOOL)iCloudSignedInToUseNicknames
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], a2, v2, v3);
  int BoolFromDomain_forKey = objc_msgSend_getBoolFromDomain_forKey_(v4, v5, *MEMORY[0x1E4F6DE00], *MEMORY[0x1E4F6DE78]);

  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (BoolFromDomain_forKey) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "iCloud signed in for nicknames: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return BoolFromDomain_forKey;
}

+ (BOOL)accountsMatchUpToUseNicknames
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], a2, v2, v3);
  char BoolFromDomain_forKey = objc_msgSend_getBoolFromDomain_forKey_(v4, v5, *MEMORY[0x1E4F6DE00], *MEMORY[0x1E4F6DE78]);

  return BoolFromDomain_forKey;
}

+ (BOOL)multiplePhoneNumbersTiedToAppleID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E720], a2, v2, v3);
  int BoolFromDomain_forKey = objc_msgSend_getBoolFromDomain_forKey_(v4, v5, *MEMORY[0x1E4F6DE00], *MEMORY[0x1E4F6DE38]);

  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (BoolFromDomain_forKey) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "multiplePhoneNumbersTiedToAppleID: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return BoolFromDomain_forKey;
}

- (BOOL)shouldOfferNicknameSharingForChat:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasMessageFromMe(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_participants(v4, v8, v9, v10);
    char shouldOfferNicknameSharingForHandles = objc_msgSend_shouldOfferNicknameSharingForHandles_(self, v12, (uint64_t)v11, v13);
  }
  else
  {
    char shouldOfferNicknameSharingForHandles = 0;
  }

  return shouldOfferNicknameSharingForHandles;
}

- (BOOL)shouldOfferNicknameSharingForHandles:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  uint64_t v7 = objc_msgSend_personalNickname(self, v4, v5, v6);

  if (!v7) {
    goto LABEL_26;
  }
  uint64_t v11 = objc_msgSend_allowListedHandlesForSharing(self, v8, v9, v10);
  if (!v11)
  {
    uint64_t v18 = objc_msgSend_denyListedHandlesForSharing(self, v12, v13, v14);

    if (v18) {
      goto LABEL_5;
    }
LABEL_26:
    BOOL v49 = 0;
    goto LABEL_29;
  }

LABEL_5:
  uint64_t v19 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E820], v15, v16, v17);
  unint64_t v23 = objc_msgSend_sharingAudience(v19, v20, v21, v22);

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v51;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v53, (uint64_t)v65, 16);
  if (v28)
  {
    uint64_t v29 = *(void *)v54;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        unsigned __int8 isContact = objc_msgSend_isContact(v31, v25, v26, v27);
        int IsAllowedForSharing = objc_msgSend_handleIsAllowedForSharing_(self, v33, (uint64_t)v31, v34);
        int IsDeniedForSharing = objc_msgSend_handleIsDeniedForSharing_(self, v36, (uint64_t)v31, v37);
        int v39 = isContact & (v23 < 2);
        if (IMOSLoggingEnabled())
        {
          uint64_t v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            uint64_t v44 = objc_msgSend_ID(v31, v41, v42, v43);
            uint64_t v45 = (void *)v44;
            uint64_t v46 = @"NO";
            if (v39) {
              uint64_t v47 = @"YES";
            }
            else {
              uint64_t v47 = @"NO";
            }
            *(_DWORD *)buf = 138413058;
            uint64_t v58 = v44;
            if (IsAllowedForSharing) {
              uint64_t v48 = @"YES";
            }
            else {
              uint64_t v48 = @"NO";
            }
            __int16 v59 = 2112;
            if (IsDeniedForSharing) {
              uint64_t v46 = @"YES";
            }
            uint64_t v60 = v47;
            __int16 v61 = 2112;
            uint64_t v62 = v48;
            __int16 v63 = 2112;
            v64 = v46;
            _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Handle ID %@ contact %@ allow listed %@ deny listed %@", buf, 0x2Au);
          }
        }
        if ((v39 | IsAllowedForSharing | IsDeniedForSharing) != 1)
        {
          BOOL v49 = 1;
          goto LABEL_28;
        }
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v53, (uint64_t)v65, 16);
      if (v28) {
        continue;
      }
      break;
    }
  }
  BOOL v49 = 0;
LABEL_28:

LABEL_29:
  return v49;
}

- (id)getNicknameHandlesUnderScrutiny
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)setNicknameHandlesUnderScrutiny
{
  objc_msgSend_scrutinyNicknameHandles(self, a2, v2, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_allObjects(v8, v4, v5, v6);
  IMSetDomainValueForKey();
}

- (id)handlesForNicknamesUnderScrutiny
{
  scrutinyNicknameHandles = self->_scrutinyNicknameHandles;
  if (!scrutinyNicknameHandles)
  {
    uint64_t v6 = objc_msgSend_getNicknameHandlesUnderScrutiny(self, a2, v2, v3);
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v10 = (NSMutableSet *)objc_msgSend_initWithArray_(v7, v8, (uint64_t)v6, v9);
    }
    else
    {
      uint64_t v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    uint64_t v11 = self->_scrutinyNicknameHandles;
    self->_scrutinyNicknameHandles = v10;

    scrutinyNicknameHandles = self->_scrutinyNicknameHandles;
  }

  return scrutinyNicknameHandles;
}

- (void)markHandleUnderScrutiny:(id)a3
{
  objc_msgSend_ID(a3, a2, (uint64_t)a3, v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = objc_msgSend_scrutinyNicknameHandles(self, v5, v6, v7);
  objc_msgSend_addObject_(v8, v9, (uint64_t)v14, v10);

  objc_msgSend_setNicknameHandlesUnderScrutiny(self, v11, v12, v13);
}

- (void)clearHandleFromScrutiny:(id)a3
{
  objc_msgSend_ID(a3, a2, (uint64_t)a3, v3);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v17, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_scrutinyNicknameHandles(self, v8, v9, v10);
    objc_msgSend_removeObject_(v11, v12, (uint64_t)v17, v13);

    objc_msgSend_setNicknameHandlesUnderScrutiny(self, v14, v15, v16);
  }
}

- (id)personNameComponentsForHandle:(id)a3
{
  id v4 = objc_msgSend_nicknameForHandle_(self, a2, (uint64_t)a3, v3);
  id v8 = objc_msgSend_firstName(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_lastName(v4, v9, v10, v11);
  id v13 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v16 = v13;
  if (v8) {
    objc_msgSend_setGivenName_(v13, v14, (uint64_t)v8, v15);
  }
  if (v12) {
    objc_msgSend_setFamilyName_(v16, v14, (uint64_t)v12, v15);
  }

  return v16;
}

- (id)imageDataForHandle:(id)a3
{
  id v4 = objc_msgSend_nicknameForHandle_(self, a2, (uint64_t)a3, v3);
  id v8 = objc_msgSend_avatar(v4, v5, v6, v7);
  int hasImage = objc_msgSend_hasImage(v8, v9, v10, v11);

  if (hasImage)
  {
    uint64_t v16 = objc_msgSend_avatar(v4, v13, v14, v15);
    uint64_t v20 = objc_msgSend_imageData(v16, v17, v18, v19);
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (BOOL)isInitialLoadComplete
{
  return !self->_isInitialLoad;
}

- (id)unknownSenderRecordInfoFor:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_unknownSenderRecords(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  uint64_t v14 = objc_msgSend_processSetOfUnknownSenderRecords_(MEMORY[0x1E4F6E8B8], v12, (uint64_t)v11, v13);

  return v14;
}

- (id)nicknameForHandleIDs:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = a3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v29;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v4);
      }
      uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
      uint64_t v14 = objc_msgSend_pendingNicknameUpdates(self, v7, v8, v9, (void)v28);
      id v17 = objc_msgSend_objectForKey_(v14, v15, v13, v16);

      if (v17) {
        break;
      }
      uint64_t v21 = objc_msgSend_handledNicknames(self, v18, v19, v20);
      uint64_t v24 = objc_msgSend_objectForKey_(v21, v22, v13, v23);

      if (v24)
      {
        uint64_t v26 = v24;
        goto LABEL_13;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v28, (uint64_t)v32, 16);
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v24 = 0;
    uint64_t v26 = v17;
LABEL_13:
    id v25 = v26;

    goto LABEL_14;
  }
LABEL_10:
  id v25 = 0;
  id v17 = v4;
LABEL_14:

  return v25;
}

- (id)pendingNicknameForHandleIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_pendingNicknameUpdates(self, v6, v7, v8, (void)v22);
        uint64_t v16 = objc_msgSend_objectForKey_(v13, v14, v12, v15);

        if (v16)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = (uint64_t)v16;
              _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Found a pending nickname: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = v12;
              _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Handle ID: %@", buf, 0xCu);
            }
          }
          id v18 = v16;

          goto LABEL_23;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v22, (uint64_t)v30, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Found no pending nickname(%@) for handle IDs: %@", buf, 0x16u);
    }
  }
  id v18 = 0;
LABEL_23:

  return v18;
}

- (id)currentNicknameForHandleIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_handledNicknames(self, v6, v7, v8, (void)v22);
        uint64_t v16 = objc_msgSend_objectForKey_(v13, v14, v12, v15);

        if (v16)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = (uint64_t)v16;
              _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Found a current nickname: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = v12;
              _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Handle ID: %@", buf, 0xCu);
            }
          }
          id v18 = v16;

          goto LABEL_23;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v22, (uint64_t)v30, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Found no current nickname(%@) for handle IDs: %@", buf, 0x16u);
    }
  }
  id v18 = 0;
LABEL_23:

  return v18;
}

- (id)archivedNicknameForHandleIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v22, (uint64_t)v30, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_archivedNicknames(self, v6, v7, v8, (void)v22);
        uint64_t v16 = objc_msgSend_objectForKey_(v13, v14, v12, v15);

        if (v16)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = (uint64_t)v16;
              _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Found an archived nickname: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v27 = v12;
              _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Handle ID: %@", buf, 0xCu);
            }
          }
          id v18 = v16;

          goto LABEL_23;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v22, (uint64_t)v30, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = 0;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Found no archived nickname(%@) for handle IDs: %@", buf, 0x16u);
    }
  }
  id v18 = 0;
LABEL_23:

  return v18;
}

- (BOOL)hasObservedTransitionForHandleID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_transitionedHandles(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!objc_msgSend_length(v6, v7, v8, v9))
  {
    int v38 = IMLogHandleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB7740(v38);
    }
    goto LABEL_21;
  }
  if ((objc_msgSend__nicknameFeatureEnabled(self, v10, v11, v12) & 1) == 0)
  {
    int v38 = IMLogHandleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB7784(v38);
    }
LABEL_21:

    goto LABEL_22;
  }
  if (!objc_msgSend_hasObservedTransitionForHandleID_(self, v13, (uint64_t)v6, v14))
  {
LABEL_15:
    uint64_t v33 = objc_msgSend_daemonController(self, v15, v16, v17);
    uint64_t v36 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v34, (uint64_t)v6, v35);
    objc_msgSend_markNicknamesAsTransitionedForHandleIDs_isAutoUpdate_(v33, v37, (uint64_t)v36, v4);

    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v6;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Handle ID has already transitioned: %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
    id v40 = v6;
    uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)&v40, 1);
    long long v24 = objc_msgSend_setWithArray_(v20, v22, (uint64_t)v21, v23);

    uint64_t v27 = objc_msgSend_currentNicknameForHandleIDs_(self, v25, (uint64_t)v24, v26);
    long long v30 = objc_msgSend_pendingNicknameForHandleIDs_(self, v28, (uint64_t)v24, v29);
    if (!objc_msgSend_isUpdateFromNickname_withOptions_(v30, v31, (uint64_t)v27, 34))
    {

      goto LABEL_22;
    }
    if (IMOSLoggingEnabled())
    {
      int v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "There is a new pending photo or wallpaper", buf, 2u);
      }
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    int v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Auto-update off", buf, 2u);
    }
  }
LABEL_22:
}

- (id)createSharedProfileStateOracleForHandles:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v8, v9, v10);
    uint64_t v15 = objc_msgSend_firstObject(v4, v12, v13, v14);
    id v18 = objc_msgSend_fetchCNContactForHandleWithID_(v11, v16, (uint64_t)v15, v17);

    long long v22 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v19, v20, v21);
    uint64_t v26 = objc_msgSend_getContactStore(v22, v23, v24, v25);

    uint64_t v29 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v27, (uint64_t)v4, v28);
    int v32 = objc_msgSend_currentNicknameForHandleIDs_(self, v30, (uint64_t)v29, v31);
    uint64_t v35 = objc_msgSend_pendingNicknameForHandleIDs_(self, v33, (uint64_t)v29, v34);
    int v38 = objc_msgSend_archivedNicknameForHandleIDs_(self, v36, (uint64_t)v29, v37);
    id v39 = objc_alloc(MEMORY[0x1E4F1BAB8]);
    int v41 = objc_msgSend_initWithContact_contactStore_archivedNickname_currentNickname_pendingNickname_(v39, v40, (uint64_t)v18, (uint64_t)v26, v38, v32, v35);
  }
  else
  {
    id v42 = IMLogHandleForCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB77C8(v42);
    }

    int v41 = 0;
  }

  return v41;
}

- (void)updateLocalNicknameStore
{
  char v5 = objc_msgSend__nicknameFeatureEnabled(self, a2, v2, v3);
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Updating nickname store!", buf, 2u);
      }
    }
    uint64_t v11 = objc_msgSend_daemonController(self, v7, v8, v9);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = sub_1A4B7FF54;
    v57[3] = &unk_1E5B7BFE8;
    v57[4] = self;
    objc_msgSend_fetchPersonalNicknameWithReply_(v11, v12, (uint64_t)v57, v13);

    uint64_t v17 = objc_msgSend_daemonController(self, v14, v15, v16);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = sub_1A4B7FFFC;
    v56[3] = &unk_1E5B7C010;
    v56[4] = self;
    objc_msgSend_fetchNicknamesWithReply_(v17, v18, (uint64_t)v56, v19);

    uint64_t v23 = objc_msgSend_daemonController(self, v20, v21, v22);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = sub_1A4B80614;
    v55[3] = &unk_1E5B7C038;
    v55[4] = self;
    objc_msgSend_fetchHandleSharingStateWithReply_(v23, v24, (uint64_t)v55, v25);

    uint64_t v29 = objc_msgSend_daemonController(self, v26, v27, v28);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = sub_1A4B806EC;
    v54[3] = &unk_1E5B7C060;
    v54[4] = self;
    objc_msgSend_fetchTransitionedNicknameHandlesWithReply_(v29, v30, (uint64_t)v54, v31);

    uint64_t v35 = objc_msgSend_daemonController(self, v32, v33, v34);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = sub_1A4B80794;
    v53[3] = &unk_1E5B7B0B8;
    v53[4] = self;
    objc_msgSend_fetchActiveNicknamesWithReply_(v35, v36, (uint64_t)v53, v37);

    int v41 = objc_msgSend_daemonController(self, v38, v39, v40);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = sub_1A4B8083C;
    v52[3] = &unk_1E5B7B0B8;
    v52[4] = self;
    objc_msgSend_fetchIgnoredNicknameHandlesWithReply_(v41, v42, (uint64_t)v52, v43);

    uint64_t v47 = objc_msgSend_daemonController(self, v44, v45, v46);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = sub_1A4B808E4;
    v51[3] = &unk_1E5B7B0B8;
    v51[4] = self;
    objc_msgSend_fetchUnknownSenderRecordsWithReply_(v47, v48, (uint64_t)v51, v49);
  }
  else if (v6)
  {
    uint64_t v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "Nickname feature disabled, not updating nickname store", buf, 2u);
    }
  }
}

- (void)updatePendingNicknames:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v68 = objc_msgSend_count(v8, v14, v15, v16);
      __int16 v69 = 2048;
      uint64_t v70 = objc_msgSend_count(v9, v17, v18, v19);
      __int16 v71 = 2048;
      uint64_t v72 = objc_msgSend_count(v10, v20, v21, v22);
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Nickname store updated, got %lu pending, %lu handled nicknames, %lu archived nicknames", buf, 0x20u);
    }
  }
  objc_msgSend_setPendingNicknameUpdates_(self, v11, (uint64_t)v8, v12);
  objc_msgSend_setHandledNicknames_(self, v23, (uint64_t)v9, v24);
  objc_msgSend_setArchivedNicknames_(self, v25, (uint64_t)v10, v26);
  v65 = @"handleIDs";
  uint64_t v33 = objc_msgSend_allKeys(v9, v27, v28, v29);
  uint64_t v34 = v33;
  if (!v33)
  {
    uint64_t v34 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v30, v31, v32);
  }
  uint64_t v66 = v34;
  uint64_t v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v66, (uint64_t)&v65, 1);
  if (!v33) {

  }
  v63[0] = @"pendingNicknames";
  int v38 = v8;
  if (!v8)
  {
    int v38 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v35, v36, v37);
  }
  v64[0] = v38;
  v63[1] = @"handledNicknames";
  uint64_t v39 = v9;
  if (!v9)
  {
    uint64_t v39 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v35, v36, v37);
  }
  v64[1] = v39;
  v63[2] = @"archivedNicknames";
  uint64_t v40 = v10;
  if (!v10)
  {
    uint64_t v40 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v35, v36, v37);
  }
  v64[2] = v40;
  uint64_t v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v64, (uint64_t)v63, 3);
  if (!v10) {

  }
  if (!v9) {
  if (!v8)
  }

  uint64_t v45 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v41, v42, v43);
  objc_msgSend_postNotificationName_object_userInfo_(v45, v46, @"__kIMNicknameDidChangeNotification", 0, v62);

  uint64_t v50 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v47, v48, v49);
  objc_msgSend_postNotificationName_object_userInfo_(v50, v51, @"__kIMPendingNicknamesDidChangeNotification", 0, v44);

  if (objc_msgSend_isInitialLoad(self, v52, v53, v54))
  {
    objc_msgSend_setIsInitialLoad_(self, v55, 0, v56);
    uint64_t v60 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v57, v58, v59);
    objc_msgSend_postNotificationName_object_(v60, v61, @"__kIMNicknameControllerDidLoadNotification", 0);
  }
}

- (void)updateSharingAllowList:(id)a3 denyList:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v40 = objc_msgSend_count(v6, v11, v12, v13);
      __int16 v41 = 2048;
      uint64_t v42 = objc_msgSend_count(v7, v14, v15, v16);
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Got new allow list data, count: %lu, deny list count: %lu", buf, 0x16u);
    }
  }
  objc_msgSend_setAllowListedHandlesForSharing_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_setDenyListedHandlesForSharing_(self, v17, (uint64_t)v7, v18);
  uint64_t v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
  uint64_t v26 = objc_msgSend_handledNicknames(self, v23, v24, v25, @"handleIDs");
  uint64_t v33 = objc_msgSend_allKeys(v26, v27, v28, v29);
  uint64_t v34 = v33;
  if (!v33)
  {
    uint64_t v34 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v30, v31, v32);
  }
  int v38 = v34;
  uint64_t v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)&v38, (uint64_t)&v37, 1);
  objc_msgSend_postNotificationName_object_userInfo_(v22, v36, @"__kIMNicknameDidChangeNotification", 0, v35);

  if (!v33) {
}
  }

- (void)updateTransitionedNicknameHandles:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSNumber;
      uint64_t v12 = objc_msgSend_count(v4, v8, v9, v10);
      uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(v11, v13, v12, v14);
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Got new transitioned list data, count: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  objc_msgSend_setTransitionedHandles_(self, v5, (uint64_t)v4, v6);
}

- (void)updateIsActiveList:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v32[0] = @"activeRecords";
  id v8 = v7;
  if (!v7)
  {
    id v8 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v4, v5, v6);
  }
  v32[1] = @"previousActiveRecords";
  v33[0] = v8;
  uint64_t v9 = objc_msgSend_activeRecords(self, v4, v5, v6);
  int v16 = objc_msgSend_copy(v9, v10, v11, v12);
  uint64_t v17 = v16;
  if (!v16)
  {
    uint64_t v17 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v13, v14, v15);
  }
  v33[1] = v17;
  uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v33, (uint64_t)v32, 2);
  if (!v16) {

  }
  if (!v7) {
  uint64_t v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
  }
  objc_msgSend_postNotificationName_object_userInfo_(v22, v23, @"__kIMActiveNicknamesDidChangeNotification", 0, v18);

  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v30 = 134217984;
      uint64_t v31 = objc_msgSend_count(v7, v27, v28, v29);
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Got new active list data, count: %lu", (uint8_t *)&v30, 0xCu);
    }
  }
  objc_msgSend_setActiveRecords_(self, v24, (uint64_t)v7, v25);
}

- (void)updateIsIgnoredList:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = objc_msgSend_count(v4, v8, v9, v10);
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Got new ignored list data, count: %lu", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend_setIgnoredRecords_(self, v5, (uint64_t)v4, v6);
}

- (void)updateUnknownSenderRecords:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = objc_msgSend_count(v4, v8, v9, v10);
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Got new unknown senders list data, count: %lu", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend_setUnknownSenderRecords_(self, v5, (uint64_t)v4, v6);
}

- (id)_handleIDsForHandle:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v3)
  {
    id v8 = objc_msgSend_ID(v3, v4, v5, v6);
    objc_msgSend_addObject_(v7, v9, (uint64_t)v8, v10);

    uint64_t v13 = objc_msgSend_cnContactWithKeys_(v3, v11, MEMORY[0x1E4F1CBF0], v12);
    int v16 = objc_msgSend_phoneNumbersForCNContact_(MEMORY[0x1E4F6E6D8], v14, (uint64_t)v13, v15);
    uint64_t v19 = objc_msgSend_emailsForCNContact_(MEMORY[0x1E4F6E6D8], v17, (uint64_t)v13, v18);
    if (objc_msgSend_count(v16, v20, v21, v22))
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v26 = v16;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v51, (uint64_t)v56, 16);
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v52 != v30) {
              objc_enumerationMutation(v26);
            }
            uint64_t v32 = IMCanonicalizeFormattedString();
            objc_msgSend_addObject_(v7, v33, (uint64_t)v32, v34);
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v35, (uint64_t)&v51, (uint64_t)v56, 16);
        }
        while (v29);
      }
    }
    if (objc_msgSend_count(v19, v23, v24, v25))
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v36 = v19;
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v47, (uint64_t)v55, 16);
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v48 != v40) {
              objc_enumerationMutation(v36);
            }
            uint64_t v42 = IMCanonicalizeFormattedString();
            objc_msgSend_addObject_(v7, v43, (uint64_t)v42, v44, v47);
          }
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v45, (uint64_t)&v47, (uint64_t)v55, 16);
        }
        while (v39);
      }
    }
  }

  return v7;
}

- (void)updatePendingNicknameForHandleIDs:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearPendingNicknamePhotoUpdateForHandleIDs_(v9, v7, (uint64_t)v3, v8);
}

- (void)setPersonalNicknameFromOnboardingResult:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7))
  {
    if (objc_msgSend__canUpdatePersonalNickname(self, v8, v9, v10))
    {
      uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E820], v11, v12, v13);
      objc_msgSend_setSharingEnabled_(v14, v15, 1, v16);

      uint64_t v20 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E820], v17, v18, v19);
      uint64_t v24 = objc_msgSend_sharingAudience(v4, v21, v22, v23);
      objc_msgSend_setSharingAudience_(v20, v25, v24, v26);

      int v30 = objc_msgSend_didPersistImageToContact(v4, v27, v28, v29);
      if (IMOSLoggingEnabled())
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          uint64_t v35 = @"YES";
          if (v30) {
            uint64_t v35 = @"NO";
          }
          int v102 = 138412290;
          v103 = v35;
          _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Nickname photo forked in onboarding: %@", (uint8_t *)&v102, 0xCu);
        }
      }
      id v36 = objc_msgSend_meCardSharingState(self, v31, v32, v33);
      objc_msgSend_setImageForkedFromMeCard_(v36, v37, v30 ^ 1u, v38);

      id v39 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      uint64_t v43 = objc_msgSend_givenName(v4, v40, v41, v42);
      uint64_t v46 = objc_msgSend_truncateNameIfNeeded_(self, v44, (uint64_t)v43, v45);

      long long v50 = objc_msgSend_familyName(v4, v47, v48, v49);
      long long v53 = objc_msgSend_truncateNameIfNeeded_(self, v51, (uint64_t)v50, v52);

      objc_msgSend_setGivenName_(v39, v54, (uint64_t)v46, v55);
      objc_msgSend_setFamilyName_(v39, v56, (uint64_t)v53, v57);
      __int16 v61 = objc_msgSend_imageData(v4, v58, v59, v60);
      if (IMOSLoggingEnabled())
      {
        v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          uint64_t v66 = @"YES";
          if (!v61) {
            uint64_t v66 = @"NO";
          }
          int v102 = 138412290;
          v103 = v66;
          _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "Onboarding result has imageData: %@", (uint8_t *)&v102, 0xCu);
        }
      }
      if (v61)
      {
        objc_msgSend_cropRect(v4, v62, v63, v64);
        uint64_t v67 = (void *)IMCroppedImageDataFromDataWithCropRect();

        objc_msgSend_setImageData_(v39, v68, (uint64_t)v67, v69);
      }
      else
      {
        uint64_t v67 = 0;
      }
      v81 = objc_msgSend_wallpaper(v4, v62, v63, v64);
      objc_msgSend_setWallpaper_(v39, v82, (uint64_t)v81, v83);

      v87 = objc_msgSend_watchWallpaperImageData(v4, v84, v85, v86);
      objc_msgSend_setWatchWallpaperImageData_(v39, v88, (uint64_t)v87, v89);

      id v90 = objc_alloc(MEMORY[0x1E4F6E8B8]);
      uint64_t v93 = (__CFString *)objc_msgSend_initWithMeContact_(v90, v91, (uint64_t)v39, v92);
      if (IMOSLoggingEnabled())
      {
        v96 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
        {
          int v102 = 138412290;
          v103 = v93;
          _os_log_impl(&dword_1A4AF7000, v96, OS_LOG_TYPE_INFO, "Setting personal nickname after onboarding to %@", (uint8_t *)&v102, 0xCu);
        }
      }
      objc_msgSend_setPersonalNickname_(self, v94, (uint64_t)v93, v95);
      v100 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v97, v98, v99);
      objc_msgSend_postNotificationName_object_(v100, v101, @"__kIMNicknameOnboardingDidFinishNotification", 0);
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v71 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        uint64_t v72 = NSNumber;
        uint64_t v73 = objc_opt_class();
        uint64_t v77 = objc_msgSend_multiplePhoneNumbersTiedToAppleID(v73, v74, v75, v76);
        objc_msgSend_numberWithBool_(v72, v78, v77, v79);
        uint64_t v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v102 = 138412290;
        v103 = v80;
        _os_log_impl(&dword_1A4AF7000, v71, OS_LOG_TYPE_INFO, "We can't set the personal nickname after onboarding - multiplePhoneNumbers: %@", (uint8_t *)&v102, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v70 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      LOWORD(v102) = 0;
      _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_INFO, "Nickname feature is disabled, don't set personal nickname after onboarding", (uint8_t *)&v102, 2u);
    }
  }
}

- (void)updatePersonalNicknameIfNecessaryWithMeCardSharingResult:(id)a3
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend__nicknameFeatureEnabled(self, v5, v6, v7))
  {
    if (objc_msgSend__canUpdatePersonalNickname(self, v8, v9, v10))
    {
      uint64_t v14 = objc_msgSend_meCardSharingState(self, v11, v12, v13);
      char v18 = objc_msgSend_nameForkedFromMeCard(v14, v15, v16, v17);

      if (v18)
      {
LABEL_22:
        uint64_t v69 = objc_msgSend_meCardSharingState(self, v19, v20, v21);
        int v73 = objc_msgSend_imageForkedFromMeCard(v69, v70, v71, v72);

        int v77 = objc_msgSend_didSaveImageToMeCard(v4, v74, v75, v76);
        if (v73 == v77)
        {
          if (IMOSLoggingEnabled())
          {
            v81 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              v82 = @"YES";
              if (v77) {
                v82 = @"NO";
              }
              *(_DWORD *)buf = 138412290;
              long long v171 = v82;
              _os_log_impl(&dword_1A4AF7000, v81, OS_LOG_TYPE_INFO, "Nickname photo now forked: %@", buf, 0xCu);
            }
          }
          uint64_t v83 = objc_msgSend_meCardSharingState(self, v78, v79, v80);
          objc_msgSend_setImageForkedFromMeCard_(v83, v84, v77 ^ 1u, v85);
        }
        id v86 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
        id v90 = objc_msgSend_givenName(v4, v87, v88, v89);
        long long v169 = objc_msgSend_truncateNameIfNeeded_(self, v91, (uint64_t)v90, v92);

        v96 = objc_msgSend_familyName(v4, v93, v94, v95);
        uint64_t v99 = objc_msgSend_truncateNameIfNeeded_(self, v97, (uint64_t)v96, v98);

        objc_msgSend_setGivenName_(v86, v100, (uint64_t)v169, v101);
        objc_msgSend_setFamilyName_(v86, v102, (uint64_t)v99, v103);
        objc_msgSend_personalNickname(self, v104, v105, v106);
        v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v111 = objc_msgSend_contactImage(v4, v108, v109, v110);

        if (v111
          && (objc_msgSend_contactImage(v4, v112, v113, v114),
              v115 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_imageData(v115, v116, v117, v118),
              int v119 = objc_claimAutoreleasedReturnValue(),
              BOOL v120 = v119 == 0,
              v119,
              v115,
              v120))
        {
          int v135 = 0;
          uint64_t v125 = 0;
          int v134 = 1;
        }
        else
        {
          int v121 = objc_msgSend_avatar(v107, v112, v113, v114);
          uint64_t v125 = objc_msgSend_imageData(v121, v122, v123, v124);

          if (v111)
          {
            v129 = objc_msgSend_contactImage(v4, v126, v127, v128);
            uint64_t v133 = objc_msgSend_imageData(v129, v130, v131, v132);

            int v134 = 0;
            int v135 = 1;
            uint64_t v125 = (void *)v133;
          }
          else
          {
            int v134 = 0;
            int v135 = 0;
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v139 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
          {
            uint64_t v140 = @"YES";
            if (v111) {
              v141 = @"YES";
            }
            else {
              v141 = @"NO";
            }
            if (v134) {
              v142 = @"YES";
            }
            else {
              v142 = @"NO";
            }
            *(_DWORD *)buf = 138412802;
            long long v171 = v141;
            __int16 v172 = 2112;
            long long v173 = v142;
            if (!v135) {
              uint64_t v140 = @"NO";
            }
            __int16 v174 = 2112;
            long long v175 = v140;
            _os_log_impl(&dword_1A4AF7000, v139, OS_LOG_TYPE_INFO, "imageUpdated = %@, imageDeleted = %@, shouldCrop = %@", buf, 0x20u);
          }
        }
        if (v135)
        {
          uint64_t v143 = objc_msgSend_contactImage(v4, v136, v137, v138);
          objc_msgSend_cropRect(v143, v144, v145, v146);
          uint64_t v147 = IMCroppedImageDataFromDataWithCropRect();

          uint64_t v125 = (void *)v147;
        }
        objc_msgSend_setImageData_(v86, v136, (uint64_t)v125, v138);
        int v151 = objc_msgSend_wallpaper(v4, v148, v149, v150);
        objc_msgSend_setWallpaper_(v86, v152, (uint64_t)v151, v153);

        BOOL v157 = objc_msgSend_watchWallpaperImageData(v4, v154, v155, v156);
        objc_msgSend_setWatchWallpaperImageData_(v86, v158, (uint64_t)v157, v159);

        id v160 = objc_alloc(MEMORY[0x1E4F6E8B8]);
        int v163 = (__CFString *)objc_msgSend_initWithMeContact_(v160, v161, (uint64_t)v86, v162);
        v165 = v163;
        if (!v107
          || (v134 | objc_msgSend_isUpdateFromNickname_withOptions_(v163, v164, (uint64_t)v107, 8)) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            long long v168 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v168, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              long long v171 = v107;
              __int16 v172 = 2112;
              long long v173 = v165;
              _os_log_impl(&dword_1A4AF7000, v168, OS_LOG_TYPE_INFO, "Updating personal nickname from %@ to %@", buf, 0x16u);
            }
          }
          objc_msgSend_setPersonalNickname_(self, v166, (uint64_t)v165, v167);
        }

        goto LABEL_58;
      }
      uint64_t v22 = objc_msgSend_contactStore(self, v19, v20, v21);
      uint64_t v26 = objc_msgSend_keysForNicknameHandling(MEMORY[0x1E4F6E6D8], v23, v24, v25);
      uint64_t v29 = objc_msgSend_fetchMeContactWithKeys_(v22, v27, (uint64_t)v26, v28);

      uint64_t v33 = objc_msgSend_givenName(v29, v30, v31, v32);
      uint64_t v37 = objc_msgSend_givenName(v4, v34, v35, v36);
      if (objc_msgSend_isEqualToString_(v33, v38, (uint64_t)v37, v39))
      {
        uint64_t v43 = objc_msgSend_familyName(v29, v40, v41, v42);
        long long v47 = objc_msgSend_familyName(v4, v44, v45, v46);
        char isEqualToString = objc_msgSend_isEqualToString_(v43, v48, (uint64_t)v47, v49);

        if (isEqualToString)
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
      }
      if (IMOSLoggingEnabled())
      {
        v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "Nickname name now forked", buf, 2u);
        }
      }
      uint64_t v66 = objc_msgSend_meCardSharingState(self, v62, v63, v64);
      objc_msgSend_setNameForkedFromMeCard_(v66, v67, 1, v68);

      goto LABEL_21;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        long long v53 = NSNumber;
        long long v54 = objc_opt_class();
        uint64_t v58 = objc_msgSend_multiplePhoneNumbersTiedToAppleID(v54, v55, v56, v57);
        objc_msgSend_numberWithBool_(v53, v59, v58, v60);
        __int16 v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        long long v171 = v61;
        _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "We can't update the personal nickname if necessary - multiplePhoneNumbers: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v51, OS_LOG_TYPE_INFO, "Nickname feature is disabled, don't update personal nickname with me card sharing result", buf, 2u);
    }
  }
LABEL_58:
}

- (id)truncateNameIfNeeded:(id)a3
{
  id v3 = a3;
  if ((unint64_t)objc_msgSend_length(v3, v4, v5, v6) < 0xC9)
  {
    id v9 = v3;
  }
  else
  {
    objc_msgSend_substringToIndex_(v3, v7, 200, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

- (id)daemonController
{
  return (id)objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
}

- (id)meCardSharingState
{
  return (id)objc_msgSend_sharedInstance(MEMORY[0x1E4F6E820], a2, v2, v3);
}

- (id)contactStore
{
  return (id)objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], a2, v2, v3);
}

- (void)markAllAsPending
{
  objc_msgSend_daemonController(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_markAllNicknamesAsPending(v7, v4, v5, v6);
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (IMNickname)personalNickname
{
  return self->_personalNickname;
}

- (NSDictionary)pendingNicknameUpdates
{
  return self->_pendingNicknameUpdates;
}

- (void)setPendingNicknameUpdates:(id)a3
{
}

- (NSDictionary)handledNicknames
{
  return self->_handledNicknames;
}

- (void)setHandledNicknames:(id)a3
{
}

- (NSDictionary)archivedNicknames
{
  return self->_archivedNicknames;
}

- (void)setArchivedNicknames:(id)a3
{
}

- (NSSet)allowListedHandlesForSharing
{
  return self->_allowListedHandlesForSharing;
}

- (void)setAllowListedHandlesForSharing:(id)a3
{
}

- (NSSet)denyListedHandlesForSharing
{
  return self->_denyListedHandlesForSharing;
}

- (void)setDenyListedHandlesForSharing:(id)a3
{
}

- (NSSet)transitionedHandles
{
  return self->_transitionedHandles;
}

- (void)setTransitionedHandles:(id)a3
{
}

- (NSDictionary)activeRecords
{
  return self->_activeRecords;
}

- (void)setActiveRecords:(id)a3
{
}

- (NSDictionary)ignoredRecords
{
  return self->_ignoredRecords;
}

- (void)setIgnoredRecords:(id)a3
{
}

- (NSDictionary)unknownSenderRecords
{
  return self->_unknownSenderRecords;
}

- (void)setUnknownSenderRecords:(id)a3
{
}

- (NSMutableSet)scrutinyNicknameHandles
{
  return self->_scrutinyNicknameHandles;
}

- (void)setScrutinyNicknameHandles:(id)a3
{
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrutinyNicknameHandles, 0);
  objc_storeStrong((id *)&self->_unknownSenderRecords, 0);
  objc_storeStrong((id *)&self->_ignoredRecords, 0);
  objc_storeStrong((id *)&self->_activeRecords, 0);
  objc_storeStrong((id *)&self->_transitionedHandles, 0);
  objc_storeStrong((id *)&self->_denyListedHandlesForSharing, 0);
  objc_storeStrong((id *)&self->_allowListedHandlesForSharing, 0);
  objc_storeStrong((id *)&self->_archivedNicknames, 0);
  objc_storeStrong((id *)&self->_handledNicknames, 0);
  objc_storeStrong((id *)&self->_pendingNicknameUpdates, 0);
  objc_storeStrong((id *)&self->_personalNickname, 0);

  objc_storeStrong((id *)&self->_responseHandlers, 0);
}

@end