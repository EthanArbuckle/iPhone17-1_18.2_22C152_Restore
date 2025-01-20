@interface ABAssistantSyncWorker
- (ABAssistantSyncDelegate)delegate;
- (ABAssistantSyncWorker)initWithDelegate:(id)a3;
- (BOOL)syncAvailable;
- (BOOL)validateKey:(id)a3;
- (NSArray)allContacts;
- (NSArray)contactsChanges;
- (id)_saDomainObjectWithReadactMeCard:(id)a3;
- (id)getCurrentValidity;
- (id)syncSnapshotForKey:(id)a3;
- (id)syncVerificationKeyForKey:(id)a3;
- (int64_t)syncCount;
- (int64_t)syncIndex;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)clearSyncCache;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)registerChangeHistoryClientIdentifier:(id)a3;
- (void)setAllContacts:(id)a3;
- (void)setContactsChanges:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSyncAvailable:(BOOL)a3;
- (void)setSyncCount:(int64_t)a3;
- (void)setSyncIndex:(int64_t)a3;
- (void)syncDidEnd;
- (void)unregisterChangeHistoryClientIdentifier:(id)a3;
@end

@implementation ABAssistantSyncWorker

- (ABAssistantSyncWorker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABAssistantSyncWorker;
  v5 = [(ABAssistantSyncWorker *)&v10 init];
  v7 = v5;
  if (v5)
  {
    objc_msgSend_setDelegate_(v5, v6, (uint64_t)v4);
    objc_msgSend_setSyncAvailable_(v7, v8, 1);
  }

  return v7;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  uint64_t v213 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (os_log_t *)MEMORY[0x263F28380];
  v15 = *MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v206 = "-[ABAssistantSyncWorker beginSyncWithAnchor:validity:forKey:beginInfo:]";
    __int16 v207 = 2112;
    id v208 = v10;
    __int16 v209 = 2112;
    id v210 = v11;
    __int16 v211 = 2112;
    id v212 = v12;
    _os_log_debug_impl(&dword_221CA8000, v15, OS_LOG_TYPE_DEBUG, "%s > beginSyncWithAnchor:%@ validity:%@ forKey:%@", buf, 0x2Au);
  }
  v18 = objc_msgSend_delegate(self, v16, v17);
  objc_msgSend_validateKey_(self, v19, (uint64_t)v12);
  objc_msgSend_setChangeHistoryClientIdentifier_(v18, v20, (uint64_t)v12);
  objc_msgSend_registerChangeHistoryClientIdentifier_(self, v21, (uint64_t)v12);
  v25 = objc_msgSend_getCurrentValidity(self, v22, v23);
  if (v25)
  {
    id v204 = v11;
    if ((objc_msgSend_isEqualToString_(v11, v24, (uint64_t)v25) & 1) == 0)
    {
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB1664();
      }
      objc_msgSend_resetWithValidity_(v13, v28, (uint64_t)v25);
      objc_msgSend_resetCurrentSyncSnapshot(v18, v29, v30);

      id v10 = 0;
    }
    v31 = objc_msgSend_contactStore(v18, v26, v27);
    id v202 = v10;
    v33 = objc_msgSend_anchorWithString_forContactStore_(ABAssistantSyncAnchor, v32, (uint64_t)v10, v31);

    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
      sub_221CB15EC();
    }
    uint64_t v36 = objc_msgSend_getLastClearedSyncAnchor(v18, v34, v35);
    if ((objc_msgSend_shouldFullSync(v33, v37, v38) & 1) == 0
      && objc_msgSend_isOlderThanAnchor_(v33, v39, v36))
    {
      os_log_t v41 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB1550(v41);
      }
      objc_msgSend_resetSync(v33, v42, v43);
    }
    if (objc_msgSend_shouldResetSync(v33, v39, v40)
      && objc_msgSend_hasContactsForFullSync(v18, v44, v45))
    {
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB14D8();
      }
      objc_msgSend_resetWithValidity_(v13, v46, (uint64_t)v25);
      objc_msgSend_resetCurrentSyncSnapshot(v18, v47, v48);
      objc_msgSend_unregisterChangeHistoryClientIdentifier_(self, v49, (uint64_t)v12);
      objc_msgSend_registerChangeHistoryClientIdentifier_(self, v50, (uint64_t)v12);
    }
    if (objc_msgSend_shouldClearChangeHistoryForPreviouslySyncedContacts(v33, v44, v45))
    {
      os_log_t v53 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB143C(v53);
      }
      objc_msgSend_clearChangeHistoryToSyncAnchor_(v18, v54, (uint64_t)v33);
    }
    v203 = (void *)v36;
    if (objc_msgSend_shouldFullSync(v33, v51, v52))
    {
      v57 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB13C4(v57, (uint64_t)v58, v59, v60, v61, v62, v63, v64);
      }
      id v200 = v13;
      if ((objc_msgSend_shouldResumePreviousFullSync(v33, v58, v59) & 1) == 0)
      {
        v67 = objc_msgSend_contactStore(v18, v65, v66);
        uint64_t v70 = objc_msgSend_saveSequenceCount(v67, v68, v69);

        v72 = objc_msgSend_numberWithInt_(NSNumber, v71, v70);
        v75 = objc_msgSend_fullSyncSnapshotProperty(v18, v73, v74);
        objc_msgSend_saveValue_forKey_(ABAssistantSyncInfoPersistence, v76, (uint64_t)v72, v75);

        v77 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
          sub_221CB1338(v70, v77);
        }
        objc_msgSend_resetCurrentSyncSnapshot(v18, v78, v79, v200);
      }
      v80 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB12C0(v80, (uint64_t)v81, v82, v83, v84, v85, v86, v87);
      }
      objc_msgSend_clearSyncCache(self, v81, v82, v200);
      v90 = objc_msgSend_contactsForFullSync(v18, v88, v89);
      objc_msgSend_setAllContacts_(self, v91, (uint64_t)v90);

      v94 = objc_msgSend_allContacts(self, v92, v93);

      if (v94)
      {
        objc_msgSend_setSyncIndex_(self, v95, 0);
        v99 = objc_msgSend_allContacts(self, v97, v98);
        uint64_t v102 = objc_msgSend_count(v99, v100, v101);
        objc_msgSend_setSyncCount_(self, v103, v102);

        v104 = *v14;
        if (os_log_type_enabled((os_log_t)v104, OS_LOG_TYPE_DEBUG)) {
          sub_221CB11B0(self, v104, v105);
        }

        if (objc_msgSend_shouldResumePreviousFullSync(v33, v106, v107))
        {
          v108 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
            sub_221CB1138(v108, (uint64_t)v109, v110, v111, v112, v113, v114, v115);
          }
          while (1)
          {
            uint64_t v116 = objc_msgSend_syncIndex(self, v109, v110);
            if (v116 >= objc_msgSend_syncCount(self, v117, v118)) {
              break;
            }
            v121 = objc_msgSend_allContacts(self, v119, v120);
            uint64_t v124 = objc_msgSend_syncIndex(self, v122, v123);
            v126 = objc_msgSend_objectAtIndexedSubscript_(v121, v125, v124);
            int v129 = objc_msgSend_iOSLegacyIdentifier(v126, v127, v128);

            if (v129 > (int)objc_msgSend_contactLegacyIdentifier(v33, v130, v131))
            {
              os_log_t v151 = *v14;
              if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
                sub_221CB1004(v151, self, v129);
              }
              goto LABEL_49;
            }
            uint64_t v134 = objc_msgSend_syncIndex(self, v132, v133);
            objc_msgSend_setSyncIndex_(self, v135, v134 + 1);
          }
          v145 = *v14;
          if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
            sub_221CB10C0(v145, (uint64_t)v95, v96, v146, v147, v148, v149, v150);
          }
        }
      }
LABEL_49:
      uint64_t v152 = objc_msgSend_allContacts(self, v95, v96);
      if (v152
        && (v153 = (void *)v152,
            uint64_t v154 = objc_msgSend_syncIndex(self, v55, v56),
            uint64_t v157 = objc_msgSend_syncCount(self, v155, v156),
            v153,
            v154 != v157))
      {
        v144 = v33;
      }
      else
      {
        v158 = objc_msgSend_fullSyncSnapshotProperty(v18, v55, v56);
        v160 = objc_msgSend_valueForKey_(ABAssistantSyncInfoPersistence, v159, (uint64_t)v158);
        int v163 = objc_msgSend_intValue(v160, v161, v162);

        v164 = [ABAssistantSyncAnchor alloc];
        uint64_t v167 = objc_msgSend_contactLegacyIdentifier(v33, v165, v166);
        v144 = objc_msgSend_initWithSequenceNumber_contactLegacyIdentifier_(v164, v168, v163, v167);

        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
          sub_221CB0F8C();
        }
      }
      id v13 = v201;
      id v10 = v202;
    }
    else
    {
      v144 = v33;
      id v10 = v202;
    }
    if (!objc_msgSend_syncCount(self, v55, v56))
    {
      v169 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB0F14(v169, (uint64_t)v170, v171, v172, v173, v174, v175, v176);
      }
      objc_msgSend_clearSyncCache(self, v170, v171);
      v178 = objc_msgSend_copyChangeHistoryAfterSyncAnchor_(v18, v177, (uint64_t)v144);
      objc_msgSend_setContactsChanges_(self, v179, (uint64_t)v178);

      v182 = objc_msgSend_contactsChanges(self, v180, v181);
      uint64_t v185 = objc_msgSend_count(v182, v183, v184);
      objc_msgSend_setSyncCount_(self, v186, v185);

      os_log_t v187 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
        sub_221CB0E84(v187);
      }
      if (!objc_msgSend_syncCount(self, v188, v189)) {
        objc_msgSend_clearSyncCache(self, v190, v191);
      }
    }
    v192 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
      sub_221CB0E0C(v192, v193, v194, v195, v196, v197, v198, v199);
    }

    id v11 = v204;
  }
  else
  {
    v136 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG)) {
      sub_221CB0D94(v136, v137, v138, v139, v140, v141, v142, v143);
    }
  }
}

- (id)_saDomainObjectWithReadactMeCard:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_delegate(self, v5, v6);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = v4;
  id v11 = v9;
  id v12 = v9;
  if (isKindOfClass)
  {
    id v13 = (void *)MEMORY[0x263F333F0];
    v24[0] = v9;
    v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, (uint64_t)v24, 1);
    uint64_t v17 = objc_msgSend_contactStore(v7, v15, v16);
    objc_msgSend_markMeContactInPeople_usingStore_(v13, v18, (uint64_t)v14, v17);

    v21 = objc_msgSend_me(v11, v19, v20);

    id v12 = v11;
    if (v21)
    {
      v22 = (void *)*MEMORY[0x263F28380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
        sub_221CB16DC(v22);
      }
      id v12 = _AFRedactedCopyPerson();
    }
  }

  return v12;
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v235 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_t *)MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
    sub_221CB1B30();
  }
  id v11 = objc_msgSend_delegate(self, v9, v10);
  if (objc_msgSend_syncAvailable(self, v12, v13))
  {
    uint64_t v16 = objc_msgSend_syncIndex(self, v14, v15);
    id v224 = v6;
    if (v16 < objc_msgSend_syncCount(self, v17, v18))
    {
      v21 = objc_msgSend_allContacts(self, v19, v20);

      if (v21)
      {
        os_log_t v24 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
          sub_221CB1990(v24, self);
        }
        while (1)
        {
          uint64_t v27 = objc_msgSend_syncIndex(self, v25, v26);
          if (v27 >= objc_msgSend_syncCount(self, v28, v29))
          {
            uint64_t v199 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
              sub_221CB1918(v199, v200, v201, v202, v203, v204, v205, v206);
            }
            goto LABEL_44;
          }
          v32 = objc_msgSend_allContacts(self, v30, v31);
          uint64_t v35 = objc_msgSend_syncIndex(self, v33, v34);
          v37 = objc_msgSend_objectAtIndexedSubscript_(v32, v36, v35);

          v39 = objc_msgSend_newSADomainObjectFromCNContact_(v11, v38, (uint64_t)v37);
          os_log_t v41 = objc_msgSend__saDomainObjectWithReadactMeCard_(self, v40, (uint64_t)v39);
          objc_msgSend_setObject_(v7, v42, (uint64_t)v41);

          os_log_t v43 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v82 = v43;
            uint64_t v85 = objc_msgSend_object(v7, v83, v84);
            v88 = objc_msgSend_identifier(v85, v86, v87);
            v91 = objc_msgSend_postAnchor(v7, v89, v90);
            *(_DWORD *)buf = 136315650;
            v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
            __int16 v227 = 2112;
            uint64_t v228 = (uint64_t)v88;
            __int16 v229 = 2112;
            v230 = v91;
            _os_log_debug_impl(&dword_221CA8000, v82, OS_LOG_TYPE_DEBUG, "%s change sync found next contact to sync, changeInfo.object=%@, changeInfo.postAnchor=%@", buf, 0x20u);
          }
          uint64_t v46 = objc_msgSend_syncIndex(self, v44, v45);
          if (v46 >= objc_msgSend_syncCount(self, v47, v48) - 1)
          {
            uint64_t v64 = objc_msgSend_fullSyncSnapshotProperty(v11, v49, v50);
            uint64_t v66 = objc_msgSend_valueForKey_(ABAssistantSyncInfoPersistence, v65, (uint64_t)v64);
            int v69 = objc_msgSend_intValue(v66, v67, v68);

            uint64_t v72 = objc_msgSend_iOSLegacyIdentifier(v37, v70, v71);
            uint64_t v74 = objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, v73, v69, v72);
            objc_msgSend_setPostAnchor_(v7, v75, (uint64_t)v74);

            os_log_t v76 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              v58 = v76;
              uint64_t v61 = objc_msgSend_postAnchor(v7, v92, v93);
              *(_DWORD *)buf = 136315394;
              v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
              __int16 v227 = 2112;
              uint64_t v228 = (uint64_t)v61;
              uint64_t v62 = v58;
              uint64_t v63 = "%s full sync synthesizing end anchor, changeInfo.postAnchor = %@";
              goto LABEL_18;
            }
          }
          else
          {
            uint64_t v51 = objc_msgSend_iOSLegacyIdentifier(v37, v49, v50);
            os_log_t v53 = objc_msgSend_stringValueForFullSyncWithContactLegacyIdentifier_(ABAssistantSyncAnchor, v52, v51);
            objc_msgSend_setPostAnchor_(v7, v54, (uint64_t)v53);

            os_log_t v55 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
            {
              v58 = v55;
              uint64_t v61 = objc_msgSend_postAnchor(v7, v59, v60);
              *(_DWORD *)buf = 136315394;
              v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
              __int16 v227 = 2112;
              uint64_t v228 = (uint64_t)v61;
              uint64_t v62 = v58;
              uint64_t v63 = "%s full sync record anchor, changeInfo.postAnchor = %@";
LABEL_18:
              _os_log_debug_impl(&dword_221CA8000, v62, OS_LOG_TYPE_DEBUG, v63, buf, 0x16u);
            }
          }
          v77 = objc_msgSend_object(v7, v56, v57);

          uint64_t v80 = objc_msgSend_syncIndex(self, v78, v79);
          objc_msgSend_setSyncIndex_(self, v81, v80 + 1);

          if (v77) {
            goto LABEL_44;
          }
        }
      }
      uint64_t v113 = objc_msgSend_contactsChanges(self, v22, v23);

      if (!v113) {
        goto LABEL_44;
      }
      os_log_t v114 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
        sub_221CB1868(v114, self);
      }
      while (1)
      {
        uint64_t v117 = objc_msgSend_syncIndex(self, v115, v116);
        if (v117 >= objc_msgSend_syncCount(self, v118, v119))
        {
          __int16 v207 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
            sub_221CB17F0(v207, v208, v209, v210, v211, v212, v213, v214);
          }
          goto LABEL_44;
        }
        v122 = objc_msgSend_contactsChanges(self, v120, v121);
        uint64_t v125 = objc_msgSend_syncIndex(self, v123, v124);
        v127 = objc_msgSend_objectAtIndexedSubscript_(v122, v126, v125);

        os_log_t v128 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        {
          log = v128;
          uint64_t v178 = objc_msgSend_syncIndex(self, v176, v177);
          uint64_t v181 = objc_msgSend_contactIdentifier(v127, v179, v180);
          uint64_t v184 = objc_msgSend_changeType(v127, v182, v183);
          os_log_t v187 = objc_msgSend_changeAnchor(v127, v185, v186);
          uint64_t v190 = objc_msgSend_sequenceNumber(v187, v188, v189);
          *(_DWORD *)buf = 136316162;
          v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
          __int16 v227 = 2048;
          uint64_t v228 = v178;
          __int16 v229 = 2112;
          v230 = v181;
          __int16 v231 = 2048;
          uint64_t v232 = v184;
          __int16 v233 = 2048;
          uint64_t v234 = v190;
          _os_log_debug_impl(&dword_221CA8000, log, OS_LOG_TYPE_DEBUG, "%s self.syncIndex = %li, contactIdentifier = %@, changeType = %li, sequenceNumber = %li", buf, 0x34u);
        }
        uint64_t v131 = objc_msgSend_changeType(v127, v129, v130);
        v135 = objc_msgSend_contactIdentifier(v127, v132, v133);
        if (v131 == 2)
        {
          v136 = objc_msgSend_newSADomainObjectFromDeletedContactIdentifier_(v11, v134, (uint64_t)v135);
          uint64_t v138 = objc_msgSend__saDomainObjectWithReadactMeCard_(self, v137, (uint64_t)v136);
          objc_msgSend_setObject_(v7, v139, (uint64_t)v138);

          objc_msgSend_setIsDelete_(v7, v140, 1);
          os_log_t v141 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            v144 = v141;
            uint64_t v147 = objc_msgSend_object(v7, v145, v146);
            uint64_t v150 = objc_msgSend_identifier(v147, v148, v149);
            *(_DWORD *)buf = 136315394;
            v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
            __int16 v227 = 2112;
            uint64_t v228 = (uint64_t)v150;
            os_log_t v151 = v144;
            uint64_t v152 = "%s change sync found next contact to sync, changeInfo.isDelete=YES, changeInfo.object=%@";
LABEL_39:
            _os_log_debug_impl(&dword_221CA8000, v151, OS_LOG_TYPE_DEBUG, v152, buf, 0x16u);
          }
        }
        else
        {
          v153 = objc_msgSend_newSADomainObjectFromCNContactWithIdentifier_(v11, v134, (uint64_t)v135);
          v155 = objc_msgSend__saDomainObjectWithReadactMeCard_(self, v154, (uint64_t)v153);
          objc_msgSend_setObject_(v7, v156, (uint64_t)v155);

          os_log_t v157 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
          {
            v144 = v157;
            uint64_t v147 = objc_msgSend_object(v7, v195, v196);
            uint64_t v150 = objc_msgSend_identifier(v147, v197, v198);
            *(_DWORD *)buf = 136315394;
            v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
            __int16 v227 = 2112;
            uint64_t v228 = (uint64_t)v150;
            os_log_t v151 = v144;
            uint64_t v152 = "%s change sync found next contact to sync, changeInfo.object=%@";
            goto LABEL_39;
          }
        }
        v158 = objc_msgSend_changeAnchor(v127, v142, v143);
        uint64_t v161 = objc_msgSend_sequenceNumber(v158, v159, v160);
        uint64_t v164 = objc_msgSend_iOSLegacyIdentifier(v127, v162, v163);
        uint64_t v166 = objc_msgSend_stringValueWithSequenceNumber_contactLegacyIdentifier_(ABAssistantSyncAnchor, v165, v161, v164);
        objc_msgSend_setPostAnchor_(v7, v167, (uint64_t)v166);

        os_log_t v168 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v191 = v168;
          uint64_t v194 = objc_msgSend_postAnchor(v7, v192, v193);
          *(_DWORD *)buf = 136315394;
          v226 = "-[ABAssistantSyncWorker getChangeAfterAnchor:changeInfo:]";
          __int16 v227 = 2112;
          uint64_t v228 = (uint64_t)v194;
          _os_log_debug_impl(&dword_221CA8000, v191, OS_LOG_TYPE_DEBUG, "%s change sync anchor, changeInfo.postAnchor = %@", buf, 0x16u);
        }
        uint64_t v171 = objc_msgSend_object(v7, v169, v170);

        uint64_t v174 = objc_msgSend_syncIndex(self, v172, v173);
        objc_msgSend_setSyncIndex_(self, v175, v174 + 1);

        if (v171) {
          goto LABEL_44;
        }
      }
    }
    uint64_t v102 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
      sub_221CB1A40(v102, (uint64_t)v103, v104, v105, v106, v107, v108, v109);
    }
    objc_msgSend_setPostAnchor_(v7, v103, (uint64_t)v6);
    objc_msgSend_setObject_(v7, v110, 0);
    objc_msgSend_clearSyncCache(self, v111, v112);
LABEL_44:
    v215 = *v8;
    id v6 = v224;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
      sub_221CB1778(v215, v216, v217, v218, v219, v220, v221, v222);
    }
  }
  else
  {
    v94 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
      sub_221CB1AB8(v94, v95, v96, v97, v98, v99, v100, v101);
    }
  }
}

- (void)syncDidEnd
{
  v3 = *MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
    sub_221CB1BA8(v3, (uint64_t)v4, v5, v6, v7, v8, v9, v10);
  }
  objc_msgSend_clearSyncCache(self, v4, v5);
}

- (id)syncSnapshotForKey:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_delegate(self, v5, v6);
  objc_msgSend_setChangeHistoryClientIdentifier_(v7, v8, (uint64_t)v4);
  id v9 = objc_alloc_init(MEMORY[0x263F286B0]);
  id v12 = objc_msgSend_getCurrentValidity(self, v10, v11);
  objc_msgSend_setValidity_(v9, v13, (uint64_t)v12);

  uint64_t v16 = objc_msgSend_currentSyncSnapshotCount(v7, v14, v15);
  objc_msgSend_setCount_(v9, v17, v16);
  uint64_t v20 = objc_msgSend_currentSyncSnapshotAnchorString(v7, v18, v19);
  objc_msgSend_setAnchor_(v9, v21, (uint64_t)v20);

  v22 = (void *)*MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
    sub_221CB1C20((uint64_t)v4, v22, v9);
  }

  return v9;
}

- (id)syncVerificationKeyForKey:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](a3, sel_stringByAppendingString_, @".verification");
}

- (void)clearSyncCache
{
  objc_msgSend_setSyncIndex_(self, a2, 0);
  objc_msgSend_setSyncCount_(self, v3, 0);
  objc_msgSend_setAllContacts_(self, v4, 0);

  objc_msgSend_setContactsChanges_(self, v5, 0);
}

- (id)getCurrentValidity
{
  id v4 = objc_msgSend_delegate(self, a2, v2);
  uint64_t v7 = objc_msgSend_contactStore(v4, v5, v6);
  id v14 = 0;
  id v9 = objc_msgSend_identifierWithError_(v7, v8, (uint64_t)&v14);
  id v10 = v14;

  if (v9)
  {
    id v12 = objc_msgSend_stringWithFormat_(NSString, v11, @"%i %@", 16, v9);
  }
  else
  {
    if (v10)
    {
      objc_msgSend_setSyncAvailable_(self, v11, 0);
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
        sub_221CB1D2C();
      }
    }
    id v12 = 0;
  }

  return v12;
}

- (BOOL)validateKey:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_delegate(self, v5, v6);
  id v10 = objc_msgSend_expectedSyncKeyPrefix(v7, v8, v9);
  char hasPrefix = objc_msgSend_hasPrefix_(v4, v11, (uint64_t)v10);

  if ((hasPrefix & 1) == 0)
  {
    uint64_t v13 = (void *)*MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB1DA4(v13);
    }
    uint64_t v16 = (void *)MEMORY[0x263EFF940];
    uint64_t v17 = objc_msgSend_expectedSyncKeyPrefix(v7, v14, v15);
    objc_msgSend_raise_format_(v16, v18, @"wrong key", @"expecting key prefix %@", v17);
  }
  return 1;
}

- (void)registerChangeHistoryClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_delegate(self, v5, v6);
  id v10 = objc_msgSend_contactStore(v7, v8, v9);
  id v14 = 0;
  objc_msgSend_registerChangeHistoryClientIdentifier_error_(v10, v11, (uint64_t)v4, &v14);
  id v12 = v14;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB1E40();
    }
    objc_msgSend_setSyncAvailable_(self, v13, 0);
  }
}

- (void)unregisterChangeHistoryClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_delegate(self, v5, v6);
  id v10 = objc_msgSend_contactStore(v7, v8, v9);
  id v14 = 0;
  objc_msgSend_unregisterChangeHistoryClientIdentifier_error_(v10, v11, (uint64_t)v4, &v14);
  id v12 = v14;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB1EBC();
    }
    objc_msgSend_setSyncAvailable_(self, v13, 0);
  }
}

- (ABAssistantSyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ABAssistantSyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)allContacts
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAllContacts:(id)a3
{
}

- (NSArray)contactsChanges
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContactsChanges:(id)a3
{
}

- (int64_t)syncIndex
{
  return self->_syncIndex;
}

- (void)setSyncIndex:(int64_t)a3
{
  self->_syncIndex = a3;
}

- (int64_t)syncCount
{
  return self->_syncCount;
}

- (void)setSyncCount:(int64_t)a3
{
  self->_syncCount = a3;
}

- (BOOL)syncAvailable
{
  return self->_syncAvailable;
}

- (void)setSyncAvailable:(BOOL)a3
{
  self->_syncAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsChanges, 0);
  objc_storeStrong((id *)&self->_allContacts, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end