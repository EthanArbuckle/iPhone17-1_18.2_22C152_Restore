id sub_24058A9AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  char isEqualToString;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  unsigned char v45[128];
  uint64_t v46;
  uint64_t vars8;

  v46 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_accountsWithAccountTypeIdentifier_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  v6 = (void *)MEMORY[0x263EFF980];
  v10 = objc_msgSend_count(v5, v7, v8, v9);
  objc_msgSend_arrayWithCapacity_(v6, v11, v10, v12);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v5;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v15)
  {
    v19 = v15;
    v20 = *(void *)v42;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v13);
        }
        v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v23 = objc_msgSend_identifier(v22, v16, v17, v18);
        v27 = objc_msgSend_identifier(*(void **)(a1 + 48), v24, v25, v26);
        isEqualToString = objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29);

        if ((isEqualToString & 1) == 0)
        {
          v31 = objc_msgSend_accountTypeWithIdentifier_(*(void **)(a1 + 32), v16, *(void *)(a1 + 40), v18);
          objc_msgSend_setAccountType_(v22, v32, (uint64_t)v31, v33);

          v38 = objc_msgSend_daAccountSubclassWithBackingAccountInfo_(MEMORY[0x263F38D48], v34, (uint64_t)v22, v35);
          if (v38) {
            objc_msgSend_addObject_(v40, v36, (uint64_t)v38, v37);
          }
        }
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v19);
  }

  return v40;
}

void sub_24058ABCC()
{
  v0 = objc_opt_new();
  objc_msgSend_addObject_(v0, v1, *MEMORY[0x263EFB3E0], v2);
  objc_msgSend_addObject_(v0, v3, *MEMORY[0x263EFB438], v4);
  objc_msgSend_addObject_(v0, v5, *MEMORY[0x263EFB3F0], v6);
  objc_msgSend_addObject_(v0, v7, *MEMORY[0x263EFB460], v8);
  objc_msgSend_addObject_(v0, v9, *MEMORY[0x263EFB3F8], v10);
  v11 = (void *)qword_26AFC67F0;
  qword_26AFC67F0 = (uint64_t)v0;
}

void sub_24058C714(uint64_t a1, const char *a2)
{
  v9[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = *MEMORY[0x263EFB128];
  v9[0] = @"username";
  v9[1] = v3;
  v9[2] = *MEMORY[0x263EFB130];
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v9, 3);
  uint64_t v7 = objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4, v6);
  uint64_t v8 = (void *)qword_26AFC6800;
  qword_26AFC6800 = v7;
}

void sub_24058C828(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v49[105] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263EFAD90];
  v49[0] = *MEMORY[0x263EFAD58];
  v49[1] = v5;
  uint64_t v6 = *MEMORY[0x263EFADE8];
  v49[2] = *MEMORY[0x263EFADB0];
  v49[3] = v6;
  v49[4] = *MEMORY[0x263EFAE10];
  v49[5] = @"active";
  v49[6] = @"authenticated";
  v49[7] = @"creationDate";
  v49[8] = @"credential";
  v49[9] = @"accountDescription";
  v49[10] = @"enabledDataclasses";
  v49[11] = @"identifier";
  v49[12] = @"owningBundleID";
  v49[13] = @"parentAccountIdentifier";
  v49[14] = @"provisionedDataclasses";
  v49[15] = @"supportsAuthentication";
  v49[16] = @"accountType";
  v49[17] = @"username";
  uint64_t v7 = *MEMORY[0x263F55290];
  v49[18] = @"visible";
  v49[19] = v7;
  uint64_t v8 = *MEMORY[0x263F552A0];
  v49[20] = *MEMORY[0x263F55298];
  v49[21] = v8;
  uint64_t v9 = *MEMORY[0x263F552C0];
  v49[22] = *MEMORY[0x263F552B0];
  v49[23] = v9;
  uint64_t v10 = *MEMORY[0x263F552E8];
  v49[24] = *MEMORY[0x263F552D8];
  v49[25] = v10;
  uint64_t v11 = *MEMORY[0x263F552F8];
  v49[26] = *MEMORY[0x263F552F0];
  v49[27] = v11;
  uint64_t v12 = *MEMORY[0x263F552A8];
  v49[28] = *MEMORY[0x263F55300];
  v49[29] = v12;
  uint64_t v13 = *MEMORY[0x263F552C8];
  v49[30] = *MEMORY[0x263F552B8];
  v49[31] = v13;
  v49[32] = *MEMORY[0x263F552D0];
  v49[33] = @"MCAccountIsManaged";
  v49[34] = @"CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace";
  v49[35] = @"CalAccountPropertyCalDAVAttachmentDownloadHasTakenPlace";
  v49[36] = @"kCalDAVCollectionSetName";
  v49[37] = @"CalAccountPropertyCalDAVLocalDataMigrationHasTakenPlace";
  v49[38] = @"kCalDAVPrincipalIsManuallyConfigured";
  v49[39] = @"kCalDAVPrincipalPathKey";
  v49[40] = @"CalAccountPropertyCalDAVSkipCredentialVerification";
  v49[41] = @"CalAccountPropertyCalDAVSyncHasTakenPlace";
  v49[42] = @"kCalDAVUseKerberos";
  v49[43] = @"kCalDAVWebServicesRecordGUID";
  v49[44] = @"kCalDAVDelegatePrincipalIsWriteableKey";
  v49[45] = @"kCalDAVDelegatePrincipalTitleKey";
  v49[46] = @"CalAccountPropertyExchangeUseExternalURL";
  v49[47] = @"kCalDAVMainPrincipalUIDKey";
  v49[48] = @"kCalDAVPrincipalIsDelegate";
  v49[49] = @"kCalDAVPrincipalsKey";
  v49[50] = @"kCalDAVPushDisabled";
  v49[51] = @"kCalDAVRefreshIntervalKey";
  v49[52] = @"DAAccountValidationDomain";
  v49[53] = @"CalDAVAccountVersion";
  v49[54] = @"CalDAVHostKey";
  v49[55] = @"CalDAVMainPrincipalUID";
  v49[56] = @"CalDAVMobileAccountCollectionSetName";
  v49[57] = @"CalDAVMobileAccountIsWritable";
  v49[58] = @"CalDAVMobileAccountOverriddenPort";
  v49[59] = @"CalDAVMobileAccountOverriddenScheme";
  v49[60] = @"CalDAVMobileAccountOverriddenServer";
  v49[61] = @"CalDAVMobileAccountSearchPropertySet";
  v49[62] = @"CalDAVMobileAccountSearchPropertySetKey_CoreDAV";
  v49[63] = @"CalDAVMobileAccountServerVersion";
  v49[64] = @"WasUpgradedFromLegacy";
  v49[65] = @"CalDAVPortKey";
  v49[66] = @"CalDAVPrincipals";
  v49[67] = @"CalDAVSchemeKey";
  v14 = objc_msgSend_CalDAVSubscribedCalendarsKey(MEMORY[0x263F38F78], a2, a3, a4);
  v49[68] = v14;
  v18 = objc_msgSend_DAAccountDoNotSaveReason(MEMORY[0x263F38F78], v15, v16, v17);
  v49[69] = v18;
  v49[70] = @"DAAccountEmailAddress";
  v49[71] = @"DAAccountHost";
  v22 = objc_msgSend_DAAccountIdentifiersToIgnoreForUniquenessCheck(MEMORY[0x263F38F78], v19, v20, v21);
  v49[72] = v22;
  v49[73] = @"DAOldKeychainURLs";
  v49[74] = @"DAAccountPersistentUUID";
  v49[75] = @"DAAccountPort";
  v26 = objc_msgSend_DAAccountPrincipalPath(MEMORY[0x263F38F78], v23, v24, v25);
  v49[77] = @"ACUIDisplayUsername";
  v49[78] = @"DAAccountUseSSL";
  v49[79] = @"DAAccountUseTrustedSSLCertificate";
  v49[80] = @"DAAccountVersion2";
  v49[81] = @"DAAcountWasUpgradedFromLegacyAccount";
  v49[82] = @"DAAccountDidAutodiscover";
  v49[83] = @"DAEASEndPointFQDN";
  v49[84] = @"DAEncryptionIdentityPersistentReference";
  v49[85] = @"DAExchangeOAuthSupportedKey";
  v49[86] = @"DAExchangeOAuthURI";
  v49[87] = @"DAExchangeOAuthTokenRequestURI";
  v49[88] = @"DAIdentityPersist";
  v49[89] = @"DAIdentityPersistIsManagedByProfile";
  v49[90] = @"DASigningIdentityPersistentReference";
  v49[91] = @"DATrustSettingsExceptions";
  v49[76] = v26;
  v49[92] = @"SubCalCalDAVURL";
  v49[93] = @"SubCalExtRep";
  v30 = objc_msgSend_SubCalFilterAlarmsKey(MEMORY[0x263F38F78], v27, v28, v29);
  v49[94] = v30;
  v49[95] = @"FilterAttachments";
  v49[96] = @"com.apple.ical.urlsubscribe.filtertasks";
  v49[97] = @"isManagedByServer";
  v49[98] = @"RefreshInterval";
  v49[99] = @"SubCalShouldRemoveAlarms";
  v34 = objc_msgSend_SubCalSubscriptionURLKey(MEMORY[0x263F38F78], v31, v32, v33);
  v49[100] = v34;
  v49[101] = @"SubCalSyncId";
  v38 = objc_msgSend_SubCalTitleKey(MEMORY[0x263F38F78], v35, v36, v37);
  v49[102] = v38;
  v49[103] = @"SubCalAccountVersion";
  v42 = objc_msgSend_SubCalInsecureConnectionApproved(MEMORY[0x263F38F78], v39, v40, v41);
  v49[104] = v42;
  v44 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v49, 105);
  uint64_t v47 = objc_msgSend_setWithArray_(v4, v45, (uint64_t)v44, v46);
  v48 = (void *)qword_26AFC67E0;
  qword_26AFC67E0 = v47;
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x270F25140]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}