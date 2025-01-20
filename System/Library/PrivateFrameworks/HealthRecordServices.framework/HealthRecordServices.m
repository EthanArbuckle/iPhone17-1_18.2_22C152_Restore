ValueMetadata *type metadata accessor for ClinicalAccountSummaryTileType()
{
  return &type metadata for ClinicalAccountSummaryTileType;
}

uint64_t HKClinicalAccountStoreClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4624D8];
}

id HKClinicalAccountStoreServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BF78];
  id v1 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_remote_fetchAllAccountsWithCompletion_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v3 forSelector:sel_remote_fetchAccountsForGatewaysWithExternalIDs_completion_ argumentIndex:0 ofReply:1];
  id v4 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchAllEventsForAccountIdentifier_completion_, 0, 1);
  id v5 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion_, 0, 0);
  id v6 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_refreshAccountConnectionInformationForAccountsWithIdentifiers_completion_, 0, 1);

  return v0;
}

void sub_221D3A364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

__CFString *HDHealthRecordsPublicUserAgentString()
{
  return @"AppleHealth/1.0";
}

id HDHealthRecordsPrivateUserAgentString()
{
  if (HDHealthRecordsPrivateUserAgentString_onceToken != -1) {
    dispatch_once(&HDHealthRecordsPrivateUserAgentString_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)HDHealthRecordsPrivateUserAgentString_userAgent;

  return v0;
}

void __HDHealthRecordsPrivateUserAgentString_block_invoke()
{
  id v19 = (id)[@"Health/1.0" mutableCopy];
  v0 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v1 = [v0 currentOSName];
  uint64_t v2 = (void *)v1;
  if (v1) {
    v3 = (__CFString *)v1;
  }
  else {
    v3 = @"Unknown";
  }
  id v4 = v3;

  uint64_t v5 = [v0 currentOSVersion];
  id v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"Unknown";
  }
  v8 = v7;

  [v19 appendFormat:@" %@/%@", v4, v8];
  uint64_t v9 = [v0 currentDeviceProductType];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"Unknown";
  }
  v12 = v11;

  [v19 appendFormat:@" %@", v12];
  if ([v0 isAppleInternalInstall])
  {
    uint64_t v13 = [v0 currentOSBuild];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"Unknown";
    }
    v16 = v15;

    [v19 appendFormat:@" (%@)", v16];
  }
  uint64_t v17 = [v19 copy];
  v18 = (void *)HDHealthRecordsPrivateUserAgentString_userAgent;
  HDHealthRecordsPrivateUserAgentString_userAgent = v17;
}

BOOL HKFHIRResourceQueryModeIncludesFullMode(unint64_t a1)
{
  return a1 < 2;
}

__CFString *NSStringFromHKFHIRResourceQueryMode(unint64_t a1)
{
  if (a1 > 2) {
    return @"{unknown}";
  }
  else {
    return off_2645EE488[a1];
  }
}

uint64_t HKProviderServiceMaximumCompatibleAPIVersion()
{
  if (_os_feature_enabled_impl()) {
    return 8;
  }
  else {
    return 7;
  }
}

BOOL HKProviderServiceIsMinCompatibleAPIVersionSupported(uint64_t a1)
{
  int v2 = _os_feature_enabled_impl();
  uint64_t v3 = 7;
  if (v2) {
    uint64_t v3 = 8;
  }
  return v3 >= a1;
}

__CFString *HKClinicalGatewayFeatureStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_2645EE4B8[a1 - 1];
  }
}

uint64_t HKClinicalGatewayFeatureStatusFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Active"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Inactive"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Disabled"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Removed"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t HKMedicalDownloadableAttachmentStoreClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D45ED80];
}

id HKMedicalDownloadableAttachmentStoreServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BC78];
  id v1 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  [v0 setClasses:v1 forSelector:sel_remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion_ argumentIndex:0 ofReply:0];

  uint64_t v2 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  [v0 setClasses:v2 forSelector:sel_remote_notifyDownloadingCompleteAndRequestMoreWithIdentifiers_requestBatchSize_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_221D41770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

id HDHealthRecordsIngestionServiceInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BCD8];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_processOriginalSignedClinicalDataRecords_options_completion_, 0, 0);
  id v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadIssuerRegistryWithOptions_completion_, 0, 1);
  id v3 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadPublicKeysWithOptions_completion_, 0, 1);

  return v0;
}

__CFString *HKClinicalSharingFeatureStatusToString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2645EE578[a1];
  }

  return v1;
}

__CFString *HKClinicalSharingUserStatusToString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2645EE5A8[a1];
  }

  return v1;
}

__CFString *HKClinicalSharingMultiDeviceStatusToString(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2645EE5D8[a1];
  }

  return v1;
}

uint64_t HKSignedClinicalDataStoreClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4604B0];
}

id HKSignedClinicalDataStoreServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BD38];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertOrReplaceIssuerRegistryEntries_completion_, 0, 0);
  id v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_insertOrReplacePublicKeyEntries_completion_, 0, 0);
  id v3 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchPublicKeyEntriesWithCompletion_, 0, 1);
  id v4 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_removePublicKeyEntriesWithKeyIDs_completion_, 0, 0);
  id v5 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadIssuerRegistryWithOptions_completion_, 0, 1);
  id v6 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_triggerDownloadPublicKeysWithOptions_completion_, 0, 1);

  return v0;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

__CFString *NSStringFromAttachmentStatus(unint64_t a1)
{
  if (a1 > 9) {
    return @"unknown";
  }
  else {
    return off_2645EE8C8[a1];
  }
}

__CFString *NSStringFromHDClinicalAnalyticsExtractionFailureCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"Nil";
  }
  else {
    return off_2645EE928[a1 - 1];
  }
}

id HKClinicalSharingServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BD98];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_shareHealthDataWithOptions_reason_date_completion_, 0, 1);

  return v0;
}

uint64_t HKClinicalSharingSyncObserverServerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BDF8];
}

uint64_t HKClinicalSharingSyncObserverClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D463580];
}

void sub_221D4D6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

__CFString *NSStringFromClinicalIngestionInteractionType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_2645EEB28[a1 - 1];
  }
}

id HDHealthRecordsXPCServiceInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BE58];
  id v1 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  [v0 setClasses:v1 forSelector:sel_remote_processOriginalSignedClinicalDataRecords_options_completion_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v1 forSelector:sel_remote_reprocessOriginalRecords_options_completion_ argumentIndex:0 ofReply:0];
  id v2 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  [v0 setClasses:v2 forSelector:sel_remote_fetchSpotlightSearchResultsForQueryString_completion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t HKClinicalIngestionStoreClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D461A90];
}

id HKClinicalIngestionStoreServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BEB8];
  id v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_remote_ingestHealthRecordsWithOptions_reason_accountIdentifiers_completion_ argumentIndex:2 ofReply:0];

  return v0;
}

__CFString *HKStringFromHKClinicalIngestionState(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(@"HKClinicalIngestionState", "stringByAppendingFormat:", @" %ld", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2645EEBE8[a1];
  }

  return v1;
}

void sub_221D50E28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHKClinicalAccountEventType(uint64_t a1)
{
  uint64_t v1 = @"unknown";
  if (a1 == 1) {
    uint64_t v1 = @"credential state change";
  }
  if (a1 == 2) {
    return @"ignore incoming credential from sync";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromHKOptionalClinicalAccountCredentialState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_2645EEDD0[a1 - 1];
  }
}

uint64_t HKOptionalClinicalAccountCredentialStateFromHKClinicalAccountCredentialState(uint64_t a1)
{
  uint64_t v1 = 1;
  if (a1 == 1) {
    uint64_t v1 = 2;
  }
  if (a1 == 2) {
    return 3;
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromHKFHIRServerAuthenticationPKCEAlgorithm(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"none";
  }
  else {
    return off_2645EEDE8[a1 - 1];
  }
}

uint64_t HKFHIRServerAuthenticationPKCEAlgorithmFromNSString(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"S256"])
  {
    if ([v1 caseInsensitiveCompare:@"plain"])
    {
      if ([v1 caseInsensitiveCompare:@"none"]) {
        uint64_t v2 = 3;
      }
      else {
        uint64_t v2 = 0;
      }
    }
    else
    {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 2;
  }

  return v2;
}

BOOL HKFHIRServerAuthenticationPKCEAlgorithmIsSupported(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t HKClinicalProviderServiceStoreClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D463778];
}

id HKClinicalProviderServiceStoreServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BF18];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchRemoteSearchResultsPageForQuery_completion_, 0, 1);
  id v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_fetchRemoteGatewayWithExternalID_batchID_completion_, 0, 1);

  return v0;
}

void sub_221D59988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221D5F860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_221D5FF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221D60AC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_221D612A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t HKHealthRecordsCurrentEnvironment()
{
  if (![MEMORY[0x263F0A980] isAppleInternalInstall]) {
    return 0;
  }
  v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.healthd"];
  uint64_t v1 = [v0 valueForKey:@"HDCPSEnvironment"];
  id v2 = v1;
  if (!v1 || [v1 integerValue] < 0 || objc_msgSend(v2, "integerValue") > 13) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 integerValue];
  }

  return v3;
}

void HKHealthRecordsSetEnvironment(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.healthd"];
  [v2 setInteger:a1 forKey:@"HDCPSEnvironment"];
}

__CFString *HKHealthRecordsNameForEnvironment(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_2645EF440[a1];
  }
}

uint64_t HKHealthRecordsDaemonConnectionServerInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46BFD8];
}

void sub_221D6592C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_221D65C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t HKVerifiableHealthRecordsParsingServiceInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46C038];
}

id OUTLINED_FUNCTION_1_3(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t HDHealthRecordsLegacyIngestionServiceInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46C098];
}

uint64_t HKClinicalGatewayUnknownBaseURL()
{
  return [NSURL URLWithString:@"localhost"];
}

__CFString *NSStringFromHKClinicalAccountCredentialState(uint64_t a1)
{
  uint64_t v1 = @"default";
  if (a1 == 1) {
    uint64_t v1 = @"needs relogin";
  }
  if (a1 == 2) {
    return @"needs scope upgrade";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromHKClinicalAccountDeletionReason(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_2645EF8B8[a1];
  }
}

__CFString *NSStringFromAccountStateChangeType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_2645EF8D8[a1 - 1];
  }
}

void HKReleaseSecKey(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

id HKSecPolicyNameAppleHealthProviderService()
{
  return (id)*MEMORY[0x263F174A8];
}

uint64_t HKAcceptAuthenticationChallengeWithTrust(__SecTrust *a1)
{
  CFErrorRef error = 0;
  if (SecTrustEvaluateWithError(a1, &error))
  {
    CFArrayRef v2 = SecTrustCopyCertificateChain(a1);
    CFArrayRef v3 = v2;
    if (v2)
    {
      [(__CFArray *)v2 lastObject];

      uint64_t v4 = 1;
      SecTrustStoreForDomain();
      if (SecTrustStoreContains())
      {
LABEL_14:

        return v4;
      }
      _HKInitializeLogging();
      id v5 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        HKAcceptAuthenticationChallengeWithTrust_cold_2(v5);
      }
    }
    else
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        HKAcceptAuthenticationChallengeWithTrust_cold_1(v7);
      }
    }
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  _HKInitializeLogging();
  id v6 = *MEMORY[0x263F09908];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
    HKAcceptAuthenticationChallengeWithTrust_cold_3((uint64_t *)&error, v6);
  }
  if (error) {
    CFRelease(error);
  }
  return 0;
}

id HKClinicalDocumentDownloaderInterface()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D46C0F8];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_beginOrResumeDownloadingAttachments_shouldRequestMore_completion_, 0, 0);

  return v0;
}

uint64_t sub_221D74F08()
{
  return 1;
}

uint64_t sub_221D74F10()
{
  return sub_221D82828();
}

uint64_t sub_221D74F54()
{
  return sub_221D82808();
}

uint64_t sub_221D74F7C()
{
  return sub_221D82828();
}

BOOL static AnalyticsReportingConfiguration.OptInStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AnalyticsReportingConfiguration.OptInStatus.hash(into:)()
{
  return sub_221D82808();
}

uint64_t AnalyticsReportingConfiguration.OptInStatus.hashValue.getter()
{
  return sub_221D82828();
}

BOOL sub_221D75048(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_221D75060()
{
  return sub_221D82828();
}

uint64_t sub_221D750A8()
{
  return sub_221D82808();
}

uint64_t sub_221D750D4()
{
  return sub_221D82828();
}

uint64_t AnalyticsReportingConfiguration.optInStatus.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static AnalyticsReportingConfiguration.forCoreAnalytics(optInStatus:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t static AnalyticsReportingConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(*a1 + 16);
  if (v4 != *(void *)(*a2 + 16)) {
    return 0;
  }
  if (!v4 || v2 == v3) {
    return 1;
  }
  id v5 = (unsigned __int8 *)(v2 + 32);
  id v6 = (unsigned __int8 *)(v3 + 32);
  uint64_t v7 = v4 - 1;
  do
  {
    uint64_t v8 = v7;
    int v9 = *v5 ^ *v6;
    if (v9) {
      break;
    }
    --v7;
    ++v5;
    ++v6;
  }
  while (v8);
  return (v9 ^ 1) & 1;
}

uint64_t sub_221D7519C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = (unsigned __int8 *)(a1 + 32);
  uint64_t v4 = (unsigned __int8 *)(a2 + 32);
  uint64_t v5 = v2 - 1;
  do
  {
    uint64_t v6 = v5;
    int v7 = *v3 ^ *v4;
    if (v7) {
      break;
    }
    --v5;
    ++v3;
    ++v4;
  }
  while (v6);
  return (v7 ^ 1) & 1;
}

uint64_t AnalyticsReportingConfiguration.hash(into:)()
{
  uint64_t v1 = *v0;
  sub_221D82808();
  uint64_t result = sub_221D82808();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1 + 32;
    do
    {
      ++v4;
      uint64_t result = sub_221D82808();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t AnalyticsReportingConfiguration.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_221D827F8();
  sub_221D82808();
  sub_221D82808();
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      sub_221D82808();
      --v2;
    }
    while (v2);
  }
  return sub_221D82828();
}

uint64_t sub_221D752E0(uint64_t *a1, uint64_t *a2)
{
  return sub_221D7519C(*a1, *a2);
}

uint64_t sub_221D752F4()
{
  uint64_t v1 = *v0;
  sub_221D827F8();
  sub_221D82808();
  uint64_t v2 = *(void *)(v1 + 16);
  sub_221D82808();
  if (v2)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      sub_221D82808();
      --v2;
    }
    while (v2);
  }
  return sub_221D82828();
}

unint64_t sub_221D75370()
{
  unint64_t result = qword_267F721D0;
  if (!qword_267F721D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F721D0);
  }
  return result;
}

unint64_t sub_221D753C8()
{
  unint64_t result = qword_267F721D8;
  if (!qword_267F721D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F721D8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AnalyticsReportingConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AnalyticsReportingConfiguration()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AnalyticsReportingConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for AnalyticsReportingConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsReportingConfiguration(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsReportingConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsReportingConfiguration()
{
  return &type metadata for AnalyticsReportingConfiguration;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AnalyticsReportingConfiguration.OptInStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AnalyticsReportingConfiguration.OptInStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x221D756D0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_221D756F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_221D75704(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsReportingConfiguration.OptInStatus()
{
  return &type metadata for AnalyticsReportingConfiguration.OptInStatus;
}

void type metadata accessor for HKCountryCode(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for AnalyticsReportingConfiguration.PayloadType(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for AnalyticsReportingConfiguration.PayloadType(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x221D75824);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_221D7584C()
{
  return 0;
}

ValueMetadata *type metadata accessor for AnalyticsReportingConfiguration.PayloadType()
{
  return &type metadata for AnalyticsReportingConfiguration.PayloadType;
}

unint64_t sub_221D75868()
{
  unint64_t result = qword_267F721E8;
  if (!qword_267F721E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F721E8);
  }
  return result;
}

void *sub_221D758BC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_221D758CC()
{
  return sub_221D82828();
}

uint64_t sub_221D75914()
{
  return sub_221D82808();
}

uint64_t sub_221D75940()
{
  return sub_221D82828();
}

uint64_t sub_221D75984(uint64_t a1, uint64_t a2)
{
  return sub_221D75B70(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_221D7599C(uint64_t a1, id *a2)
{
  uint64_t result = sub_221D825D8();
  *a2 = 0;
  return result;
}

uint64_t sub_221D75A14(uint64_t a1, id *a2)
{
  char v3 = sub_221D825E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_221D75A94@<X0>(uint64_t *a1@<X8>)
{
  sub_221D825F8();
  uint64_t v2 = sub_221D825C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_221D75AD8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_221D75AE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_221D825C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_221D75B2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_221D825F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_221D75B58(uint64_t a1, uint64_t a2)
{
  return sub_221D75B70(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_221D75B70(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_221D825F8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_221D75BB4()
{
  sub_221D825F8();
  sub_221D82628();

  return swift_bridgeObjectRelease();
}

uint64_t sub_221D75C08()
{
  sub_221D825F8();
  sub_221D827F8();
  sub_221D82628();
  uint64_t v0 = sub_221D82828();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_221D75C7C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_221D75C90()
{
  uint64_t v0 = sub_221D825F8();
  uint64_t v2 = v1;
  if (v0 == sub_221D825F8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_221D827C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_221D75D1C(uint64_t a1)
{
  uint64_t v2 = sub_221D75E68(&qword_267F72208, type metadata accessor for HKCountryCode);
  uint64_t v3 = sub_221D75E68(&qword_267F72210, type metadata accessor for HKCountryCode);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_221D75DD8()
{
  return sub_221D75E68(&qword_267F721F0, type metadata accessor for HKCountryCode);
}

uint64_t sub_221D75E20()
{
  return sub_221D75E68(&qword_267F721F8, type metadata accessor for HKCountryCode);
}

uint64_t sub_221D75E68(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_221D75EB0()
{
  return sub_221D75E68(&qword_267F72200, type metadata accessor for HKCountryCode);
}

void type metadata accessor for HKClinicalIngestionInteractionType(uint64_t a1)
{
}

void sub_221D75F0C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_221D75F54()
{
  return sub_221D75E68(&qword_267F72220, type metadata accessor for HKClinicalIngestionInteractionType);
}

Swift::String __swiftcall ClinicalAccountSummaryTileType.keyValueDomainName()()
{
  if (*v0) {
    uint64_t v1 = 0xD000000000000043;
  }
  else {
    uint64_t v1 = 0xD000000000000041;
  }
  if (*v0) {
    uint64_t v2 = (void *)0x8000000221D8B9A0;
  }
  else {
    uint64_t v2 = (void *)0x8000000221D8B9F0;
  }
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

HealthRecordServices::ClinicalAccountSummaryTileType_optional __swiftcall ClinicalAccountSummaryTileType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_221D82788();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t ClinicalAccountSummaryTileType.rawValue.getter()
{
  unint64_t v1 = 0x5579617765746167;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4C746E756F636361;
  }
}

uint64_t sub_221D760B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_221D76118(*a1, *a2);
}

unint64_t sub_221D760C4()
{
  unint64_t result = qword_267F72228;
  if (!qword_267F72228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F72228);
  }
  return result;
}

uint64_t sub_221D76118(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEC0000006E69676FLL;
  unint64_t v3 = 0x4C746E756F636361;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x5579617765746167;
    }
    else {
      unint64_t v5 = 0xD000000000000013;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEE00656461726770;
    }
    else {
      unint64_t v6 = 0x8000000221D8B980;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0x4C746E756F636361;
  unint64_t v6 = 0xEC0000006E69676FLL;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v3 = 0x5579617765746167;
    }
    else {
      unint64_t v3 = 0xD000000000000013;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xEE00656461726770;
    }
    else {
      unint64_t v2 = 0x8000000221D8B980;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_221D827C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_221D76254()
{
  return sub_221D82828();
}

uint64_t sub_221D76310()
{
  sub_221D82628();

  return swift_bridgeObjectRelease();
}

uint64_t sub_221D763B8()
{
  return sub_221D82828();
}

HealthRecordServices::ClinicalAccountSummaryTileType_optional sub_221D76470(Swift::String *a1)
{
  return ClinicalAccountSummaryTileType.init(rawValue:)(*a1);
}

void sub_221D7647C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEC0000006E69676FLL;
  unint64_t v4 = 0xEE00656461726770;
  unint64_t v5 = 0x5579617765746167;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000013;
    unint64_t v4 = 0x8000000221D8B980;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x4C746E756F636361;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_221D764F4()
{
  return sub_221D82658();
}

uint64_t sub_221D76554()
{
  return sub_221D82648();
}

uint64_t getEnumTagSinglePayload for ClinicalAccountSummaryTileType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ClinicalAccountSummaryTileType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x221D76700);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_221D76728(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

unint64_t sub_221D76730()
{
  unint64_t result = qword_267F72230;
  if (!qword_267F72230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F72230);
  }
  return result;
}

ValueMetadata *type metadata accessor for IngestionAnalyticsResponseTimeEvents()
{
  return &type metadata for IngestionAnalyticsResponseTimeEvents;
}

uint64_t sub_221D76794(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t result = MEMORY[0x270FA5388](v7);
  v11 = (void *)((char *)v41 - v10);
  uint64_t v12 = *(void *)(a2 + 16);
  if (!v12) {
    return result;
  }
  uint64_t v43 = v9;
  v41[1] = result;
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  long long v44 = xmmword_221D88190;
  uint64_t v45 = a2;
  while (1)
  {
    uint64_t v16 = *(void *)(a2 + 8 * v13 + 32);
    if (!*(void *)(*(void *)a3 + 16)) {
      break;
    }
    sub_221D7B5B8(a1);
    if ((v17 & 1) == 0) {
      break;
    }
    uint64_t v18 = v43;
    sub_221D78D48((uint64_t)a1, v43, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    v20 = sub_221D7A014(v46, v18);
    v21 = *v19;
    if (!*v19)
    {
      ((void (*)(void *, void))v20)(v46, 0);
      uint64_t v15 = v18;
      goto LABEL_6;
    }
    v22 = v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v22 = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v21 = sub_221D7D190(0, *((void *)v21 + 2) + 1, 1, v21);
      *v22 = v21;
    }
    unint64_t v25 = *((void *)v21 + 2);
    unint64_t v24 = *((void *)v21 + 3);
    if (v25 >= v24 >> 1)
    {
      v21 = sub_221D7D190((char *)(v24 > 1), v25 + 1, 1, v21);
      *v22 = v21;
    }
    *((void *)v21 + 2) = v25 + 1;
    *(void *)&v21[8 * v25 + 32] = v16;
    ((void (*)(void *, void))v20)(v46, 0);
    uint64_t v15 = v43;
LABEL_5:
    a2 = v45;
LABEL_6:
    ++v13;
    sub_221D78F4C(v15, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    if (v12 == v13) {
      return swift_bridgeObjectRelease();
    }
  }
  sub_221D78D48((uint64_t)a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  sub_221D78DB0(0, (unint64_t *)&qword_267F72248, MEMORY[0x263F8D538], MEMORY[0x263F8E0F8]);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v44;
  *(void *)(v26 + 32) = v16;
  char v27 = swift_isUniquelyReferenced_nonNull_native();
  v46[0] = *(void *)a3;
  uint64_t v28 = v46[0];
  *(void *)a3 = 0x8000000000000000;
  unint64_t v30 = sub_221D7B5B8(v11);
  uint64_t v31 = *(void *)(v28 + 16);
  BOOL v32 = (v29 & 1) == 0;
  uint64_t v33 = v31 + v32;
  if (!__OFADD__(v31, v32))
  {
    char v34 = v29;
    if (*(void *)(v28 + 24) < v33)
    {
      sub_221D7738C(v33, v27);
      unint64_t v35 = sub_221D7B5B8(v11);
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_31;
      }
      unint64_t v30 = v35;
      v37 = (void *)v46[0];
      if ((v34 & 1) == 0) {
        goto LABEL_22;
      }
LABEL_3:
      uint64_t v14 = v37[7];
      swift_bridgeObjectRelease();
      *(void *)(v14 + 8 * v30) = v26;
LABEL_4:
      *(void *)a3 = v37;
      swift_bridgeObjectRelease();
      uint64_t v15 = (uint64_t)v11;
      goto LABEL_5;
    }
    if (v27)
    {
      v37 = (void *)v46[0];
      if (v29) {
        goto LABEL_3;
      }
    }
    else
    {
      sub_221D77FA8();
      v37 = (void *)v46[0];
      if (v34) {
        goto LABEL_3;
      }
    }
LABEL_22:
    v37[(v30 >> 6) + 8] |= 1 << v30;
    sub_221D78D48((uint64_t)v11, v37[6] + *(void *)(v42 + 72) * v30, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    *(void *)(v37[7] + 8 * v30) = v26;
    uint64_t v38 = v37[2];
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39) {
      goto LABEL_30;
    }
    v37[2] = v40;
    goto LABEL_4;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  uint64_t result = sub_221D827E8();
  __break(1u);
  return result;
}

unint64_t sub_221D76BA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0xD00000000000002FLL;
  }
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_221D76D28(v1);
  swift_bridgeObjectRelease();
  sub_221D82708();
  sub_221D82638();
  sub_221D827A8();
  sub_221D82638();
  swift_bridgeObjectRelease();
  sub_221D82638();
  sub_221D78DB0(0, (unint64_t *)&qword_267F72270, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
  sub_221D78DFC();
  sub_221D825B8();
  swift_bridgeObjectRelease();
  sub_221D82638();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_221D76D28(uint64_t a1)
{
  sub_221D78E78();
  uint64_t v53 = v3;
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (uint64_t *)((char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v52 = (uint64_t)&v44 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = (uint64_t)&v44 - v9;
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (!v10) {
    return v11;
  }
  uint64_t v44 = v1;
  uint64_t v60 = MEMORY[0x263F8EE78];
  sub_221D7E810(0, v10, 0);
  uint64_t result = sub_221D7E830(a1);
  uint64_t v14 = result;
  uint64_t v15 = 0;
  uint64_t v16 = a1 + 64;
  uint64_t v45 = a1 + 80;
  uint64_t v49 = MEMORY[0x263F8EE58] + 8;
  uint64_t v50 = a1;
  int64_t v46 = v10;
  uint64_t v47 = v13;
  uint64_t v48 = a1 + 64;
  while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v19 = (unint64_t)v14 >> 6;
    if ((*(void *)(v16 + 8 * ((unint64_t)v14 >> 6)) & (1 << v14)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v13) {
      goto LABEL_26;
    }
    uint64_t v54 = v15;
    uint64_t v55 = 1 << v14;
    uint64_t v20 = v53;
    uint64_t v21 = *(int *)(v53 + 48);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = type metadata accessor for IngestionAnalyticsRequestInfo();
    uint64_t v24 = v51;
    sub_221D78D48(v22 + *(void *)(*(void *)(v23 - 8) + 72) * v14, v51, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8 * v14);
    *(void *)(v24 + v21) = v25;
    uint64_t v26 = v52;
    sub_221D78D48(v24, v52, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    *(void *)(v26 + *(int *)(v20 + 48)) = v25;
    sub_221D78EE4(v26, (uint64_t)v6, (uint64_t (*)(void))sub_221D78E78);
    swift_bridgeObjectRetain_n();
    sub_221D78F4C(v24, (uint64_t (*)(void))sub_221D78E78);
    uint64_t v27 = *(void *)((char *)v6 + *(int *)(v20 + 48));
    uint64_t v28 = NSStringFromClinicalIngestionInteractionType(v6[7]);
    uint64_t v29 = sub_221D825F8();
    uint64_t v31 = v30;

    uint64_t v58 = v29;
    uint64_t v59 = v31;
    sub_221D82638();
    swift_bridgeObjectRetain();
    sub_221D82638();
    swift_bridgeObjectRelease();
    sub_221D82638();
    uint64_t v32 = v6[4];
    uint64_t v56 = v6[3];
    uint64_t v57 = v32;
    swift_bridgeObjectRetain_n();
    sub_221D827D8();
    id v33 = (id)HKSensitiveLogItem();
    swift_unknownObjectRelease();
    sub_221D826D8();
    swift_unknownObjectRelease();
    sub_221D82618();
    swift_bridgeObjectRelease();
    sub_221D82638();
    swift_bridgeObjectRelease();
    uint64_t v56 = v58;
    uint64_t v57 = v59;
    sub_221D82638();
    sub_221D7F744(v27);
    sub_221D82638();
    swift_bridgeObjectRelease();
    uint64_t v34 = v56;
    uint64_t v35 = v57;
    sub_221D78F4C((uint64_t)v6, (uint64_t (*)(void))sub_221D78E78);
    uint64_t v11 = v60;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_221D7E810(0, *(void *)(v11 + 16) + 1, 1);
      uint64_t v11 = v60;
    }
    unint64_t v37 = *(void *)(v11 + 16);
    unint64_t v36 = *(void *)(v11 + 24);
    if (v37 >= v36 >> 1)
    {
      uint64_t result = (uint64_t)sub_221D7E810((char *)(v36 > 1), v37 + 1, 1);
      uint64_t v11 = v60;
    }
    *(void *)(v11 + 16) = v37 + 1;
    uint64_t v38 = v11 + 16 * v37;
    *(void *)(v38 + 32) = v34;
    *(void *)(v38 + 40) = v35;
    a1 = v50;
    int64_t v17 = 1 << *(unsigned char *)(v50 + 32);
    if (v14 >= v17) {
      goto LABEL_27;
    }
    uint64_t v16 = v48;
    uint64_t v39 = *(void *)(v48 + 8 * v19);
    if ((v39 & v55) == 0) {
      goto LABEL_28;
    }
    LODWORD(v13) = v47;
    if (*(_DWORD *)(v50 + 36) != v47) {
      goto LABEL_29;
    }
    unint64_t v40 = v39 & (-2 << (v14 & 0x3F));
    if (v40)
    {
      int64_t v17 = __clz(__rbit64(v40)) | v14 & 0xFFFFFFFFFFFFFFC0;
      int64_t v18 = v46;
    }
    else
    {
      unint64_t v41 = v19 + 1;
      unint64_t v42 = (unint64_t)(v17 + 63) >> 6;
      int64_t v18 = v46;
      if (v19 + 1 < v42)
      {
        unint64_t v43 = *(void *)(v48 + 8 * v41);
        if (v43)
        {
LABEL_22:
          int64_t v17 = __clz(__rbit64(v43)) + (v41 << 6);
        }
        else
        {
          while (v42 - 2 != v19)
          {
            unint64_t v43 = *(void *)(v45 + 8 * v19++);
            if (v43)
            {
              unint64_t v41 = v19 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    uint64_t v15 = v54 + 1;
    uint64_t v14 = v17;
    if (v54 + 1 == v18) {
      return v11;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_221D771FC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t, uint64_t, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  v22[0] = a3;
  uint64_t v13 = sub_221D7974C((uint64_t)v22);
  v22[0] = a3;
  unint64_t v14 = sub_221D7F958((uint64_t)v22, a2);
  uint64_t v15 = sub_221D77300(v14, (uint64_t)v13);
  uint64_t v16 = a1[1];
  int64_t v18 = (void *)a1[2];
  uint64_t v17 = a1[3];
  uint64_t v19 = a1[4];
  v22[0] = *a1;
  v22[1] = v16;
  v22[2] = v18;
  v22[3] = v17;
  v22[4] = v19;
  swift_bridgeObjectRetain();
  id v20 = v18;
  swift_bridgeObjectRetain();
  a4(v22, a6, a7, v15);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_221D77300(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_221D78650(a1, (uint64_t)sub_221D78938, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_221D7738C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_221D78BC8();
  int64_t v10 = (void *)sub_221D82748();
  if (*(void *)(v9 + 16))
  {
    uint64_t v27 = v3;
    uint64_t v11 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v12 = (void *)(v9 + 64);
    uint64_t v13 = -1;
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    unint64_t v14 = v13 & *(void *)(v9 + 64);
    int64_t v15 = (unint64_t)(v11 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        if (v21 >= v15) {
          goto LABEL_23;
        }
        unint64_t v22 = v12[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v15) {
            goto LABEL_23;
          }
          unint64_t v22 = v12[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v15)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v27;
                goto LABEL_30;
              }
              uint64_t v25 = 1 << *(unsigned char *)(v9 + 32);
              if (v25 >= 64) {
                bzero((void *)(v9 + 64), ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v12 = -1 << v25;
              }
              uint64_t v3 = v27;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v22 = v12[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_32;
                }
                if (v17 >= v15) {
                  goto LABEL_23;
                }
                unint64_t v22 = v12[v17];
                ++v23;
                if (v22) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_20:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = *(void *)(v9 + 48) + *(void *)(v6 + 72) * v20;
      if (a2)
      {
        sub_221D78EE4(v24, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v18 = *(void *)(*(void *)(v9 + 56) + 8 * v20);
      }
      else
      {
        sub_221D78D48(v24, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v18 = *(void *)(*(void *)(v9 + 56) + 8 * v20);
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_221D77E20((uint64_t)v8, v18, v10);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  void *v3 = v10;
  return result;
}

uint64_t sub_221D77648(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_221D78B20();
  char v38 = a2;
  uint64_t v6 = sub_221D82748();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_221D827F8();
    sub_221D82628();
    uint64_t result = sub_221D82828();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_221D77954(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for IngestionAnalyticsRequestFailure();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_221D78C64();
  int v42 = a2;
  uint64_t v9 = sub_221D82748();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_44;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  uint64_t v39 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  for (int64_t i = 0; ; int64_t i = v45)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (i << 6);
      goto LABEL_22;
    }
    int64_t v21 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v21 >= v38) {
      break;
    }
    unint64_t v22 = v39;
    unint64_t v23 = v39[v21];
    ++i;
    if (!v23)
    {
      int64_t i = v21 + 1;
      if (v21 + 1 >= v38) {
        goto LABEL_37;
      }
      unint64_t v23 = v39[i];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v38)
        {
LABEL_37:
          swift_release();
          uint64_t v3 = v37;
          if ((v42 & 1) == 0) {
            goto LABEL_44;
          }
          goto LABEL_40;
        }
        unint64_t v23 = v39[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t i = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_46;
            }
            if (i >= v38) {
              goto LABEL_37;
            }
            unint64_t v23 = v39[i];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t i = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (i << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v8 + 48) + *(void *)(v40 + 72) * v20;
    uint64_t v44 = *(void *)(v40 + 72);
    int64_t v45 = i;
    if (v42) {
      sub_221D78EE4(v25, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    }
    else {
      sub_221D78D48(v25, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    }
    uint64_t v43 = *(void *)(*(void *)(v8 + 56) + 8 * v20);
    sub_221D827F8();
    unint64_t v26 = (void *)*((void *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_221D82628();
    swift_bridgeObjectRelease();
    sub_221D825F8();
    id v27 = v26;
    sub_221D82628();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_221D82628();
    swift_bridgeObjectRelease();
    sub_221D82628();
    sub_221D82808();
    uint64_t v28 = v41;
    sub_221D82808();
    if (*(void *)&v7[*(int *)(v28 + 24) + 8])
    {
      sub_221D82818();
      swift_bridgeObjectRetain();
      sub_221D82628();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_221D82818();
    }
    uint64_t result = sub_221D82828();
    uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v15 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_221D78EE4((uint64_t)v7, *(void *)(v10 + 48) + v44 * v18, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    *(void *)(*(void *)(v10 + 56) + 8 * v18) = v43;
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  unint64_t v22 = v39;
  if ((v42 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
  if (v36 >= 64) {
    bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v36;
  }
  *(void *)(v8 + 16) = 0;
LABEL_44:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_221D77E20(uint64_t a1, uint64_t a2, void *a3)
{
  sub_221D827F8();
  uint64_t v6 = *(void **)(a1 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v7 = v6;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D82628();
  sub_221D82808();
  sub_221D82828();
  unint64_t v8 = sub_221D826F8();
  *(void *)((char *)a3 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v8;
  uint64_t v9 = a3[6];
  uint64_t v10 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t result = sub_221D78EE4(a1, v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  *(void *)(a3[7] + 8 * v8) = a2;
  ++a3[2];
  return result;
}

void *sub_221D77FA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_221D78BC8();
  uint64_t v5 = *v0;
  uint64_t v6 = sub_221D82738();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v5 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v9 + 8 * v22);
    ++v12;
    if (!v23)
    {
      int64_t v12 = v22 + 1;
      if (v22 + 1 >= v16) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v9 + 8 * v12);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v15 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v26 + 72) * v18;
    sub_221D78D48(*(void *)(v5 + 48) + v19, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
    sub_221D78EE4((uint64_t)v4, *(void *)(v7 + 48) + v19, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    *(void *)(*(void *)(v7 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v9 + 8 * v24);
  if (v23)
  {
    int64_t v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v9 + 8 * v12);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_221D78228()
{
  uint64_t v1 = v0;
  sub_221D78B20();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_221D82738();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_221D783D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IngestionAnalyticsRequestFailure();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_221D78C64();
  uint64_t v5 = *v0;
  uint64_t v6 = sub_221D82738();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v5 + 64);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v9 + 8 * v22);
    ++v12;
    if (!v23)
    {
      int64_t v12 = v22 + 1;
      if (v22 + 1 >= v16) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v9 + 8 * v12);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v15 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v26 + 72) * v18;
    sub_221D78D48(*(void *)(v5 + 48) + v19, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v5 + 56) + v20);
    id result = (void *)sub_221D78EE4((uint64_t)v4, *(void *)(v7 + 48) + v19, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    *(void *)(*(void *)(v7 + 56) + v20) = v21;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v9 + 8 * v24);
  if (v23)
  {
    int64_t v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v9 + 8 * v12);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_221D78650(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_221D78984();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_221D7B718(v7, v8);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      int64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_221D78228();
      int64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v25 = (uint64_t *)(v22[6] + 16 * v15);
    *uint64_t v25 = v10;
    v25[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v28;
LABEL_13:
    sub_221D78984();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = v31;
      do
      {
        uint64_t v40 = (void *)*a5;
        unint64_t v42 = sub_221D7B718(v32, v33);
        uint64_t v43 = v40[2];
        BOOL v44 = (v41 & 1) == 0;
        uint64_t v45 = v43 + v44;
        if (__OFADD__(v43, v44)) {
          goto LABEL_25;
        }
        char v46 = v41;
        if (v40[3] < v45)
        {
          sub_221D77648(v45, 1);
          unint64_t v47 = sub_221D7B718(v32, v33);
          if ((v46 & 1) != (v48 & 1)) {
            goto LABEL_27;
          }
          unint64_t v42 = v47;
        }
        uint64_t v49 = (void *)*a5;
        if (v46)
        {
          swift_bridgeObjectRelease();
          uint64_t v35 = v49[7];
          uint64_t v36 = 8 * v42;

          *(void *)(v35 + v36) = v34;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          uint64_t v50 = (uint64_t *)(v49[6] + 16 * v42);
          *uint64_t v50 = v32;
          v50[1] = v33;
          *(void *)(v49[7] + 8 * v42) = v34;
          uint64_t v51 = v49[2];
          BOOL v27 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v27) {
            goto LABEL_26;
          }
          v49[2] = v52;
        }
        sub_221D78984();
        uint64_t v32 = v37;
        uint64_t v33 = v38;
        uint64_t v34 = v39;
      }
      while (v38);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_221D78B18();
    return swift_release();
  }
  sub_221D77648(v18, a4 & 1);
  unint64_t v20 = sub_221D7B718(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    int64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v23 = v22[7];
    uint64_t v24 = 8 * v15;

    *(void *)(v23 + v24) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_221D827E8();
  __break(1u);
  return result;
}

id sub_221D78938@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  id v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();

  return v4;
}

void sub_221D78984()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          uint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            uint64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            uint64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  uint64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_221D78B18()
{
  return swift_release();
}

void sub_221D78B20()
{
  if (!qword_267F72238)
  {
    sub_221D78B88();
    unint64_t v0 = sub_221D82768();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F72238);
    }
  }
}

unint64_t sub_221D78B88()
{
  unint64_t result = qword_267F72240;
  if (!qword_267F72240)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F72240);
  }
  return result;
}

void sub_221D78BC8()
{
  if (!qword_267F72250)
  {
    type metadata accessor for IngestionAnalyticsRequestInfo();
    sub_221D78D00(&qword_267F72258, (void (*)(uint64_t))type metadata accessor for IngestionAnalyticsRequestInfo);
    unint64_t v0 = sub_221D82768();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F72250);
    }
  }
}

void sub_221D78C64()
{
  if (!qword_267F72260)
  {
    type metadata accessor for IngestionAnalyticsRequestFailure();
    sub_221D78D00(&qword_267F72268, (void (*)(uint64_t))type metadata accessor for IngestionAnalyticsRequestFailure);
    unint64_t v0 = sub_221D82768();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F72260);
    }
  }
}

uint64_t sub_221D78D00(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_221D78D48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_221D78DB0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_221D78DFC()
{
  unint64_t result = qword_267F72278;
  if (!qword_267F72278)
  {
    sub_221D78DB0(255, (unint64_t *)&qword_267F72270, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F72278);
  }
  return result;
}

void sub_221D78E78()
{
  if (!qword_267F72280)
  {
    type metadata accessor for IngestionAnalyticsRequestInfo();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267F72280);
    }
  }
}

uint64_t sub_221D78EE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_221D78F4C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_221D78FAC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v16 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v7 = (void *)a2[2];
    uint64_t v6 = a2[3];
    a1[2] = (uint64_t)v7;
    a1[3] = v6;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = a2[7];
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (char *)a2 + v10;
    uint64_t v12 = (char *)a1 + v10;
    a1[6] = a2[6];
    a1[7] = v9;
    uint64_t v13 = sub_221D825A8();
    char v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    id v15 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v12, v11, v13);
  }
  return v3;
}

uint64_t sub_221D790C8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_221D825A8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_221D79158(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = (void *)a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  uint64_t v8 = a2[7];
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a2 + v9;
  uint64_t v11 = (char *)a1 + v9;
  a1[6] = a2[6];
  a1[7] = v8;
  uint64_t v12 = sub_221D825A8();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  id v14 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v11, v10, v12);
  return a1;
}

void *sub_221D79224(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a1[2];
  a1[2] = v6;
  id v8 = v6;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_221D825A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_221D7931C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_221D825A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_221D793B0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v8 = a2[4];
  a1[3] = a2[3];
  a1[4] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_221D825A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_221D79474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_221D79488);
}

uint64_t sub_221D79488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_221D825A8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_221D79538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_221D7954C);
}

uint64_t sub_221D7954C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_221D825A8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for IngestionAnalyticsRequestInfo()
{
  uint64_t result = qword_26AB1C988;
  if (!qword_26AB1C988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_221D79640()
{
  uint64_t result = sub_221D825A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_221D796F4()
{
  unint64_t result = qword_267F72288;
  if (!qword_267F72288)
  {
    type metadata accessor for IngestionAnalyticsRequestInfo();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F72288);
  }
  return result;
}

__CFString *sub_221D7974C(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_221D825A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
  uint64_t v8 = *(void *)(*(void *)a1 + 16);
  if (v8)
  {
    uint64_t v9 = 0;
    while ((*(unsigned char *)(*(void *)a1 + v9 + 32) & 1) == 0)
    {
      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
    uint64_t v12 = *v2;
    uint64_t v13 = v2[3];
    uint64_t v14 = v2[4];
    v22[0] = *(void *)a1;
    v22[1] = v12;
    long long v23 = *(_OWORD *)(v2 + 1);
    uint64_t v24 = v13;
    uint64_t v25 = v14;
    unint64_t v15 = sub_221D809D0((uint64_t)v22);
    sub_221D79F54();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_221D881E0;
    strcpy((char *)(inited + 32), "resourceType");
    *(unsigned char *)(inited + 45) = 0;
    *(_WORD *)(inited + 46) = -5120;
    *(void *)(inited + 48) = sub_221D825C8();
    *(void *)(inited + 56) = 0x7463617265746E69;
    *(void *)(inited + 64) = 0xEF657079546E6F69;
    unint64_t result = NSStringFromClinicalIngestionInteractionType(v2[7]);
    if (result)
    {
      *(void *)(inited + 72) = result;
      *(void *)(inited + 80) = 0xD000000000000012;
      *(void *)(inited + 88) = 0x8000000221D8BAB0;
      type metadata accessor for IngestionAnalyticsRequestInfo();
      sub_221D82578();
      sub_221D82568();
      BOOL v17 = (void *)sub_221D82588();
      id v18 = objc_msgSend(v17, sel_hk_rfc3339String);

      sub_221D825F8();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v19 = sub_221D825C8();
      swift_bridgeObjectRelease();
      *(void *)(inited + 96) = v19;
      unint64_t v20 = sub_221D7A138(inited);
      return (__CFString *)sub_221D77300(v20, v15);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
LABEL_5:
    uint64_t v10 = MEMORY[0x263F8EE78];
    return (__CFString *)sub_221D7A138(v10);
  }
  return result;
}

uint64_t sub_221D799EC()
{
  sub_221D827F8();
  unint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D82628();
  sub_221D82808();
  return sub_221D82828();
}

uint64_t sub_221D79AD0()
{
  unint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D82628();
  return sub_221D82808();
}

uint64_t sub_221D79BA0()
{
  sub_221D827F8();
  unint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D82628();
  sub_221D82808();
  return sub_221D82828();
}

BOOL sub_221D79C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v26 - v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v26 - v14;
  uint64_t v16 = *(void *)a1;
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v18 = *(void *)(a1 + 32);
  long long v31 = *(_OWORD *)(a1 + 8);
  uint64_t v32 = v17;
  uint64_t v33 = v18;
  uint64_t v19 = *(void *)(a2 + 24);
  uint64_t v20 = *(void *)(a2 + 32);
  uint64_t v26 = *(void *)a2;
  long long v27 = *(_OWORD *)(a2 + 8);
  uint64_t v28 = v19;
  uint64_t v29 = v20;
  uint64_t v30 = v16;
  char v21 = _s20HealthRecordServices16AnalyticsGatewayV2eeoiySbAC_ACtFZ_0(&v30, &v26);
  sub_221D79E94(a1, (uint64_t)v15);
  sub_221D79E94(a2, (uint64_t)v13);
  if (v21)
  {
    if (*((void *)v15 + 5) == *((void *)v13 + 5) && *((void *)v15 + 6) == *((void *)v13 + 6))
    {
      sub_221D79EF8((uint64_t)v15);
      sub_221D79EF8((uint64_t)v13);
      sub_221D79E94(a1, (uint64_t)v10);
      sub_221D79E94(a2, (uint64_t)v7);
    }
    else
    {
      char v23 = sub_221D827C8();
      sub_221D79EF8((uint64_t)v15);
      sub_221D79EF8((uint64_t)v13);
      sub_221D79E94(a1, (uint64_t)v10);
      sub_221D79E94(a2, (uint64_t)v7);
      BOOL v24 = 0;
      if ((v23 & 1) == 0) {
        goto LABEL_11;
      }
    }
    BOOL v24 = *((void *)v10 + 7) == *((void *)v7 + 7);
  }
  else
  {
    sub_221D79EF8((uint64_t)v15);
    sub_221D79EF8((uint64_t)v13);
    sub_221D79E94(a1, (uint64_t)v10);
    sub_221D79E94(a2, (uint64_t)v7);
    BOOL v24 = 0;
  }
LABEL_11:
  sub_221D79EF8((uint64_t)v7);
  sub_221D79EF8((uint64_t)v10);
  return v24;
}

uint64_t sub_221D79E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IngestionAnalyticsRequestInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_221D79EF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IngestionAnalyticsRequestInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_221D79F54()
{
  if (!qword_267F72290)
  {
    sub_221D79FAC();
    unint64_t v0 = sub_221D827B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F72290);
    }
  }
}

void sub_221D79FAC()
{
  if (!qword_267F72298)
  {
    sub_221D78B88();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267F72298);
    }
  }
}

void (*sub_221D7A014(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  uint64_t v5 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[4] = v6;
  sub_221D7DD20(a2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  v4[5] = sub_221D7B7FC(v4, (uint64_t)v6);
  return sub_221D7A0C8;
}

void sub_221D7A0C8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void **)(*a1 + 32);
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  sub_221D7BFD0((uint64_t)v2, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  free(v2);

  free(v1);
}

unint64_t sub_221D7A138(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_221D78B20();
  uint64_t v2 = (void *)sub_221D82758();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_221D7B718(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_221D7A250(uint64_t a1)
{
  sub_221D7DCB8();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (void *)((char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    id v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_221D78C64();
  uint64_t v7 = sub_221D82758();
  id v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = *(int *)(v3 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v23[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v4 + 72);
  swift_retain();
  while (1)
  {
    sub_221D7DD20(v13, (uint64_t)v6, (uint64_t (*)(void))sub_221D7DCB8);
    unint64_t result = sub_221D7B790(v6);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for IngestionAnalyticsRequestFailure();
    unint64_t result = sub_221D7DC50((uint64_t)v6, v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    *(void *)(v8[7] + 8 * v17) = *(void *)((char *)v6 + v10);
    uint64_t v20 = v8[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_221D7A444()
{
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  unint64_t v1 = sub_221D76BA0(v0);
  swift_bridgeObjectRelease();
  sub_221D82638();
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_221D7E318(v2);
  swift_bridgeObjectRelease();
  sub_221D82638();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t IngestionAnalyticsAccumulator.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 120) = sub_221D7A250(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t IngestionAnalyticsAccumulator.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 120) = sub_221D7A250(MEMORY[0x263F8EE78]);
  return v0;
}

void sub_221D7A59C(void *a1, void *a2)
{
  uint64_t v66 = type metadata accessor for IngestionAnalyticsRequestFailure();
  uint64_t v5 = MEMORY[0x270FA5388](v66);
  v70 = (uint64_t *)((char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  id v8 = (uint64_t *)((char *)&v65 - v7);
  uint64_t v74 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v9 = MEMORY[0x270FA5388](v74);
  uint64_t v73 = (uint64_t)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t)&v65 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v68 = (uint64_t *)((char *)&v65 - v15);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (uint64_t *)((char *)&v65 - v16);
  static IngestionAnalyticsAccumulator.analyticsGateway(from:)(a2, v82);
  id v75 = (id)v82[2];
  uint64_t v71 = v82[3];
  uint64_t v72 = v82[0];
  uint64_t v79 = v82[4];
  uint64_t v80 = v82[1];
  id v18 = objc_msgSend(a1, sel_objects);
  sub_221D7DB44(0, &qword_267F722A0);
  unint64_t v19 = sub_221D82668();

  unint64_t v76 = v19;
  if (v19 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_221D82728();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_3;
    }
LABEL_41:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v20) {
    goto LABEL_41;
  }
LABEL_3:
  if (v20 >= 1)
  {
    uint64_t v65 = v13;
    v69 = v8;
    uint64_t v21 = 0;
    uint64_t v22 = v2 + 112;
    char v23 = (uint64_t *)(v2 + 120);
    unint64_t v24 = v76;
    unint64_t v78 = v76 & 0xC000000000000001;
    long long v67 = xmmword_221D88190;
    uint64_t v77 = v20;
    while (1)
    {
      id v25 = v78 ? (id)MEMORY[0x223C906A0](v21, v24) : *(id *)(v24 + 8 * v21 + 32);
      uint64_t v26 = v25;
      if ((objc_msgSend(v25, sel_wasCanceled, v65) & 1) == 0) {
        break;
      }

LABEL_6:
      if (v20 == ++v21)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRetain();
    id v27 = v75;
    swift_bridgeObjectRetain();
    id v28 = objc_msgSend(v26, sel_resourceType);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = sub_221D825F8();
      unint64_t v32 = v31;
    }
    else
    {
      unint64_t v32 = 0xE300000000000000;
      uint64_t v30 = 7104846;
    }
    id v33 = objc_msgSend(v26, sel_interactionType);
    id v34 = objc_msgSend(v26, sel_requestEndTime);
    sub_221D82598();

    uint64_t v35 = v80;
    *unint64_t v17 = v72;
    v17[1] = v35;
    uint64_t v36 = v71;
    v17[2] = (uint64_t)v27;
    v17[3] = v36;
    v17[4] = v79;
    v17[5] = v30;
    v17[6] = v32;
    v17[7] = (uint64_t)v33;
    objc_msgSend(v26, sel_requestDuration);
    uint64_t v38 = v37;
    swift_beginAccess();
    if (*(void *)(*(void *)v22 + 16) && (sub_221D7B5B8(v17), (v39 & 1) != 0))
    {
      uint64_t v40 = v65;
      sub_221D7DD20((uint64_t)v17, v65, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      unint64_t v42 = sub_221D7A014(v82, v40);
      uint64_t v43 = *v41;
      if (*v41)
      {
        BOOL v44 = v41;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *BOOL v44 = v43;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v43 = sub_221D7D190(0, *((void *)v43 + 2) + 1, 1, v43);
          *BOOL v44 = v43;
        }
        unint64_t v47 = *((void *)v43 + 2);
        unint64_t v46 = *((void *)v43 + 3);
        if (v47 >= v46 >> 1)
        {
          uint64_t v43 = sub_221D7D190((char *)(v46 > 1), v47 + 1, 1, v43);
          *BOOL v44 = v43;
        }
        uint64_t v20 = v77;
        *((void *)v43 + 2) = v47 + 1;
        *(void *)&v43[8 * v47 + 32] = v38;
        ((void (*)(uint64_t *, void))v42)(v82, 0);
        uint64_t v48 = v65;
        goto LABEL_24;
      }
      ((void (*)(uint64_t *, void))v42)(v82, 0);
      uint64_t v48 = v40;
    }
    else
    {
      uint64_t v49 = v68;
      sub_221D7DD20((uint64_t)v17, (uint64_t)v68, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      sub_221D7B6C0();
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = v67;
      *(void *)(v50 + 32) = v38;
      char v51 = swift_isUniquelyReferenced_nonNull_native();
      v82[0] = *(void *)v22;
      *(void *)uint64_t v22 = 0x8000000000000000;
      sub_221D7BCDC(v50, v49, v51);
      *(void *)uint64_t v22 = v82[0];
      swift_bridgeObjectRelease();
      uint64_t v48 = (uint64_t)v49;
    }
    uint64_t v20 = v77;
LABEL_24:
    sub_221D7BFD0(v48, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    swift_endAccess();
    if (objc_msgSend(v26, sel_hadError))
    {
      sub_221D7DD20((uint64_t)v17, v73, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      id v52 = objc_msgSend(v26, sel_responseStatusCode);
      id v53 = objc_msgSend(v26, sel_errorCode);
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = sub_221D825F8();
        uint64_t v57 = v56;
      }
      else
      {
        uint64_t v55 = 0;
        uint64_t v57 = 0;
      }
      id v8 = v69;
      sub_221D7DC50(v73, (uint64_t)v69, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      uint64_t v58 = v66;
      *(void *)((char *)v8 + *(int *)(v66 + 20)) = v52;
      uint64_t v59 = (void *)((char *)v8 + *(int *)(v58 + 24));
      *uint64_t v59 = v55;
      v59[1] = v57;
      swift_beginAccess();
      sub_221D7DD20((uint64_t)v8, (uint64_t)v70, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
      uint64_t v2 = *v23;
      if (*(void *)(*v23 + 16))
      {
        unint64_t v60 = sub_221D7B790(v8);
        uint64_t v20 = v77;
        if (v61)
        {
          uint64_t v62 = *(void *)(*(void *)(v2 + 56) + 8 * v60);
          uint64_t v13 = v62 + 1;
          if (__OFADD__(v62, 1))
          {
            __break(1u);
            goto LABEL_40;
          }
        }
        else
        {
          uint64_t v13 = 1;
        }
      }
      else
      {
        uint64_t v20 = v77;
        uint64_t v13 = 1;
      }
      char v63 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v81 = *v23;
      *char v23 = 0x8000000000000000;
      v64 = v70;
      sub_221D7BE5C(v13, v70, v63);
      *char v23 = v81;
      swift_bridgeObjectRelease();
      sub_221D7BFD0((uint64_t)v64, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
      swift_endAccess();

      sub_221D7BFD0((uint64_t)v69, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
      sub_221D7BFD0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    }
    else
    {
      sub_221D7BFD0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    }
    unint64_t v24 = v76;
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t static IngestionAnalyticsAccumulator.analyticsGateway(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_221D7D288();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - v8;
  id v10 = objc_msgSend(a1, sel_externalID);
  uint64_t v11 = sub_221D825F8();
  uint64_t v13 = v12;

  id v14 = objc_msgSend(a1, sel_country);
  if (!v14)
  {
    sub_221D825F8();
    id v14 = (id)sub_221D825C8();
    swift_bridgeObjectRelease();
  }
  id v15 = objc_msgSend(a1, sel_baseURL);
  if (v15)
  {
    uint64_t v16 = v15;
    sub_221D82548();

    uint64_t v17 = sub_221D82558();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 0, 1, v17);
  }
  else
  {
    uint64_t v17 = sub_221D82558();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  }
  sub_221D7DC50((uint64_t)v7, (uint64_t)v9, (uint64_t (*)(void))sub_221D7D288);
  sub_221D82558();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 1, v17) == 1)
  {
    uint64_t result = sub_221D7BFD0((uint64_t)v9, (uint64_t (*)(void))sub_221D7D288);
    unint64_t v20 = 0xE300000000000000;
    uint64_t v21 = 7104846;
  }
  else
  {
    uint64_t v21 = sub_221D82538();
    unint64_t v20 = v22;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v9, v17);
  }
  *a2 = v11;
  a2[1] = v13;
  a2[2] = (uint64_t)v14;
  a2[3] = v21;
  a2[4] = v20;
  return result;
}

uint64_t sub_221D7B024(uint64_t a1)
{
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = v1;
  return MEMORY[0x270FA2498](sub_221D7B044, a1, 0);
}

uint64_t sub_221D7B044()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  swift_beginAccess();
  v0[13] = *(void *)(v2 + 112);
  swift_beginAccess();
  v0[14] = *(void *)(v2 + 120);
  *(void *)(v2 + 112) = MEMORY[0x263F8EE80];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v2 + 120) = sub_221D7A250(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_221D7B138, v1, 0);
}

uint64_t sub_221D7B138()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_beginAccess();
  *(void *)(swift_task_alloc() + 16) = v1 + 112;
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_221D7D2E8(v2, (void (*)(char *, uint64_t))sub_221D7D2E0);
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  swift_endAccess();
  swift_beginAccess();
  *(void *)(swift_task_alloc() + 16) = v1 + 120;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_221D7D590(v3, (void (*)(char *))sub_221D7D588);
  swift_bridgeObjectRelease_n();
  swift_task_dealloc();
  swift_endAccess();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_221D7B288()
{
  swift_beginAccess();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  unint64_t v1 = sub_221D7A250(MEMORY[0x263F8EE78]);
  swift_beginAccess();
  *(void *)(v0 + 120) = v1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_221D7B304(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_beginAccess();
  swift_beginAccess();
  *(void *)(v1 + 112) = MEMORY[0x263F8EE80];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v1 + 120) = sub_221D7A250(MEMORY[0x263F8EE78]);
  uint64_t v3 = swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    uint64_t v5 = 0;
    while (*(unsigned char *)(v2 + v5 + 32) != 1)
    {
      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }
    MEMORY[0x270FA5388](v3);
    uint64_t v8 = swift_bridgeObjectRetain();
    sub_221D7D2E8(v8, (void (*)(char *, uint64_t))sub_221D7D83C);
    uint64_t v6 = swift_bridgeObjectRelease_n();
    uint64_t v7 = *(void *)(v2 + 16);
    if (v7) {
      goto LABEL_8;
    }
    return swift_bridgeObjectRelease();
  }
LABEL_5:
  uint64_t v6 = swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v2 + 16);
  if (!v7) {
    return swift_bridgeObjectRelease();
  }
LABEL_8:
  uint64_t v9 = 0;
  while (*(unsigned char *)(v2 + v9 + 32) != 1)
  {
    if (v7 == ++v9) {
      return swift_bridgeObjectRelease();
    }
  }
  MEMORY[0x270FA5388](v6);
  uint64_t v11 = swift_bridgeObjectRetain();
  sub_221D7D590(v11, (void (*)(char *))sub_221D7D824);
  return swift_bridgeObjectRelease_n();
}

uint64_t IngestionAnalyticsAccumulator.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t IngestionAnalyticsAccumulator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t IngestionAnalyticsAccumulator.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_221D7B5AC()
{
  return v0;
}

unint64_t sub_221D7B5B8(void *a1)
{
  sub_221D827F8();
  uint64_t v2 = (void *)a1[2];
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v3 = v2;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D82628();
  sub_221D82808();
  uint64_t v4 = sub_221D82828();

  return sub_221D7C308(a1, v4);
}

void sub_221D7B6C0()
{
  if (!qword_267F72248)
  {
    unint64_t v0 = sub_221D827B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F72248);
    }
  }
}

unint64_t sub_221D7B718(uint64_t a1, uint64_t a2)
{
  sub_221D827F8();
  sub_221D82628();
  uint64_t v4 = sub_221D82828();

  return sub_221D7C804(a1, a2, v4);
}

unint64_t sub_221D7B790(void *a1)
{
  sub_221D827F8();
  sub_221D7F4DC();
  uint64_t v2 = sub_221D82828();

  return sub_221D7C8E8(a1, v2);
}

void (*sub_221D7B7FC(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x58uLL);
  *a1 = v4;
  uint64_t v5 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[8] = v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_221D7DD20(a2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  v4[9] = sub_221D7D014(v4);
  v4[10] = sub_221D7CE94(v4 + 4, v6, isUniquelyReferenced_nonNull_native);
  return sub_221D7B8DC;
}

void sub_221D7B8DC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  id v3 = *(void **)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 80))();
  sub_221D7BFD0((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  v2(v1, 0);
  free(v3);

  free(v1);
}

unint64_t sub_221D7B96C(int64_t a1, uint64_t a2)
{
  uint64_t v29 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v4 = *(void *)(v29 - 8);
  unint64_t result = MEMORY[0x270FA5388](v29);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = sub_221D826E8();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v12 = (result + 1) & v11;
      uint64_t v13 = *(void *)(v4 + 72);
      uint64_t v31 = a2;
      uint64_t v32 = a2 + 64;
      uint64_t v30 = v13;
      do
      {
        uint64_t v14 = *(void *)(a2 + 48);
        int64_t v33 = v13 * v10;
        sub_221D7DD20(v14 + v13 * v10, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D827F8();
        id v15 = (void *)*((void *)v7 + 2);
        swift_bridgeObjectRetain();
        sub_221D82628();
        swift_bridgeObjectRelease();
        sub_221D825F8();
        id v16 = v15;
        sub_221D82628();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_221D82628();
        swift_bridgeObjectRelease();
        sub_221D82628();
        sub_221D82808();
        uint64_t v17 = sub_221D82828();
        unint64_t result = sub_221D7BFD0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v12)
        {
          if (v18 < v12)
          {
            a2 = v31;
            uint64_t v8 = v32;
            uint64_t v13 = v30;
          }
          else
          {
            a2 = v31;
            uint64_t v8 = v32;
            uint64_t v13 = v30;
            if (a1 >= (uint64_t)v18) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          a2 = v31;
          uint64_t v8 = v32;
          uint64_t v13 = v30;
          if (v18 >= v12 || a1 >= (uint64_t)v18)
          {
LABEL_12:
            uint64_t v19 = *(void *)(a2 + 48);
            unint64_t result = v19 + v13 * a1;
            if (v13 * a1 < v33 || result >= v19 + v33 + v13)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v13 * a1 != v33)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v20 = *(void *)(a2 + 56);
            uint64_t v21 = (void *)(v20 + 8 * a1);
            unint64_t v22 = (void *)(v20 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v21 >= v22 + 1))
            {
              void *v21 = *v22;
              a1 = v10;
            }
          }
        }
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v24 = *v23;
    uint64_t v25 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v23 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v25 = *v23;
    uint64_t v24 = (-1 << a1) - 1;
  }
  *uint64_t v23 = v25 & v24;
  uint64_t v26 = *(void *)(a2 + 16);
  BOOL v27 = __OFSUB__(v26, 1);
  uint64_t v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_221D7BCDC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for IngestionAnalyticsRequestInfo();
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_221D7B5B8(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v20 + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_221D77FA8();
    goto LABEL_7;
  }
  sub_221D7738C(v16, a3 & 1);
  unint64_t v22 = sub_221D7B5B8(a2);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    uint64_t result = sub_221D827E8();
    __break(1u);
    return result;
  }
  unint64_t v13 = v22;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_221D7DD20((uint64_t)a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  return sub_221D7C1A0(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_221D7BE5C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for IngestionAnalyticsRequestFailure();
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_221D7B790(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t result = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v19 = *v4;
    if (v17)
    {
LABEL_8:
      *(void *)(v19[7] + 8 * v13) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_221D783D8();
    goto LABEL_7;
  }
  sub_221D77954(result, a3 & 1);
  uint64_t result = sub_221D7B790(a2);
  if ((v17 & 1) != (v20 & 1))
  {
LABEL_14:
    uint64_t result = sub_221D827E8();
    __break(1u);
    return result;
  }
  unint64_t v13 = result;
  uint64_t v19 = *v4;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_221D7DD20((uint64_t)a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
  return sub_221D7C254(v13, (uint64_t)v10, a1, v19);
}

uint64_t sub_221D7BFD0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_221D7C030(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_221D7B718(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_221D78228();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_221D77648(v15, a4 & 1);
  unint64_t v20 = sub_221D7B718(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_221D827E8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_221D7C1A0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t result = sub_221D7DC50(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_221D7C254(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for IngestionAnalyticsRequestFailure();
  uint64_t result = sub_221D7DC50(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

unint64_t sub_221D7C308(void *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for IngestionAnalyticsRequestInfo() - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v42 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v49 = (uint64_t)&v42 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v48 = (uint64_t)&v42 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (uint64_t *)((char *)&v42 - v17);
  uint64_t v46 = v2 + 64;
  uint64_t v47 = v2;
  uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v20 = a2 & ~v19;
  if ((*(void *)(v2 + 64 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
  {
    uint64_t v42 = ~v19;
    uint64_t v43 = v11;
    uint64_t v21 = *(void *)(v16 + 72);
    BOOL v44 = v8;
    uint64_t v45 = v21;
    do
    {
      sub_221D7DD20(*(void *)(v47 + 48) + v45 * v20, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      uint64_t v26 = v18[3];
      uint64_t v27 = v18[4];
      uint64_t v28 = a1[3];
      uint64_t v29 = a1[4];
      if ((*v18 != *a1 || v18[1] != a1[1]) && (sub_221D827C8() & 1) == 0)
      {
LABEL_3:
        uint64_t v22 = v48;
        sub_221D7DD20((uint64_t)v18, v48, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v23 = v49;
        sub_221D7DD20((uint64_t)a1, v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v22, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v23, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v24 = (uint64_t)v43;
        sub_221D7DD20((uint64_t)v18, (uint64_t)v43, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v25 = (uint64_t)v44;
        sub_221D7DD20((uint64_t)a1, (uint64_t)v44, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
LABEL_4:
        sub_221D7BFD0(v25, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v24, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        goto LABEL_5;
      }
      uint64_t v30 = sub_221D825F8();
      uint64_t v32 = v31;
      if (v30 == sub_221D825F8() && v32 == v33)
      {
        swift_bridgeObjectRelease_n();
        if (v26 == v28) {
          goto LABEL_17;
        }
      }
      else
      {
        char v35 = sub_221D827C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v35 & 1) == 0) {
          goto LABEL_3;
        }
        if (v26 == v28)
        {
LABEL_17:
          if (v27 == v29) {
            goto LABEL_19;
          }
        }
      }
      if ((sub_221D827C8() & 1) == 0) {
        goto LABEL_3;
      }
LABEL_19:
      uint64_t v36 = v48;
      sub_221D7DD20((uint64_t)v18, v48, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      uint64_t v37 = v49;
      sub_221D7DD20((uint64_t)a1, v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      if (*(void *)(v36 + 40) == *(void *)(v37 + 40) && *(void *)(v36 + 48) == *(void *)(v37 + 48))
      {
        sub_221D7BFD0(v48, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v24 = (uint64_t)v43;
        sub_221D7DD20((uint64_t)v18, (uint64_t)v43, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v25 = (uint64_t)v44;
        sub_221D7DD20((uint64_t)a1, (uint64_t)v44, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      }
      else
      {
        char v38 = sub_221D827C8();
        sub_221D7BFD0(v48, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v24 = (uint64_t)v43;
        sub_221D7DD20((uint64_t)v18, (uint64_t)v43, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v25 = (uint64_t)v44;
        sub_221D7DD20((uint64_t)a1, (uint64_t)v44, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        if ((v38 & 1) == 0) {
          goto LABEL_4;
        }
      }
      uint64_t v39 = *(void *)(v24 + 56);
      uint64_t v40 = *(void *)(v25 + 56);
      sub_221D7BFD0(v25, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      sub_221D7BFD0(v24, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      sub_221D7BFD0((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      if (v39 == v40) {
        return v20;
      }
LABEL_5:
      unint64_t v20 = (v20 + 1) & v42;
    }
    while (((*(void *)(v46 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) != 0);
  }
  return v20;
}

unint64_t sub_221D7C804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_221D827C8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_221D827C8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_221D7C8E8(void *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  BOOL v11 = (char *)&v46 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v55 = (uint64_t)&v46 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v54 = (uint64_t)&v46 - v14;
  uint64_t v47 = type metadata accessor for IngestionAnalyticsRequestFailure();
  MEMORY[0x270FA5388](v47);
  uint64_t v17 = (uint64_t *)((char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v52 = v2 + 64;
  uint64_t v53 = v2;
  uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v19 = a2 & ~v18;
  if ((*(void *)(v2 + 64 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
  {
    uint64_t v48 = ~v18;
    uint64_t v49 = v11;
    uint64_t v20 = *(void *)(v15 + 72);
    uint64_t v50 = v8;
    uint64_t v51 = v20;
    do
    {
      sub_221D7DD20(*(void *)(v53 + 48) + v51 * v19, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
      uint64_t v25 = v17[3];
      uint64_t v26 = v17[4];
      uint64_t v27 = a1[3];
      uint64_t v28 = a1[4];
      if ((*v17 != *a1 || v17[1] != a1[1]) && (sub_221D827C8() & 1) == 0)
      {
LABEL_3:
        uint64_t v21 = v54;
        sub_221D7DD20((uint64_t)v17, v54, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v22 = v55;
        sub_221D7DD20((uint64_t)a1, v55, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v21, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v22, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v23 = (uint64_t)v49;
        sub_221D7DD20((uint64_t)v17, (uint64_t)v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v24 = (uint64_t)v50;
        sub_221D7DD20((uint64_t)a1, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
LABEL_4:
        sub_221D7BFD0(v24, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v23, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        goto LABEL_5;
      }
      uint64_t v29 = sub_221D825F8();
      uint64_t v31 = v30;
      if (v29 == sub_221D825F8() && v31 == v32)
      {
        swift_bridgeObjectRelease_n();
        if (v25 == v27) {
          goto LABEL_17;
        }
      }
      else
      {
        char v34 = sub_221D827C8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v34 & 1) == 0) {
          goto LABEL_3;
        }
        if (v25 == v27)
        {
LABEL_17:
          if (v26 == v28) {
            goto LABEL_19;
          }
        }
      }
      if ((sub_221D827C8() & 1) == 0) {
        goto LABEL_3;
      }
LABEL_19:
      uint64_t v35 = v54;
      sub_221D7DD20((uint64_t)v17, v54, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      uint64_t v36 = v55;
      sub_221D7DD20((uint64_t)a1, v55, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      if (*(void *)(v35 + 40) == *(void *)(v36 + 40) && *(void *)(v35 + 48) == *(void *)(v36 + 48))
      {
        sub_221D7BFD0(v54, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v55, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v23 = (uint64_t)v49;
        sub_221D7DD20((uint64_t)v17, (uint64_t)v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v24 = (uint64_t)v50;
        sub_221D7DD20((uint64_t)a1, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      }
      else
      {
        char v37 = sub_221D827C8();
        sub_221D7BFD0(v54, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        sub_221D7BFD0(v55, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v23 = (uint64_t)v49;
        sub_221D7DD20((uint64_t)v17, (uint64_t)v49, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        uint64_t v24 = (uint64_t)v50;
        sub_221D7DD20((uint64_t)a1, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
        if ((v37 & 1) == 0) {
          goto LABEL_4;
        }
      }
      uint64_t v38 = *(void *)(v23 + 56);
      uint64_t v39 = *(void *)(v24 + 56);
      sub_221D7BFD0(v24, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      sub_221D7BFD0(v23, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      if (v38 == v39 && *(void *)((char *)v17 + *(int *)(v47 + 20)) == *(void *)((char *)a1 + *(int *)(v47 + 20)))
      {
        uint64_t v40 = *(int *)(v47 + 24);
        char v41 = (void *)((char *)v17 + v40);
        uint64_t v42 = *(void *)((char *)v17 + v40 + 8);
        uint64_t v43 = (void *)((char *)a1 + v40);
        uint64_t v44 = v43[1];
        if (v42)
        {
          if (v44 && (*v41 == *v43 && v42 == v44 || (sub_221D827C8() & 1) != 0))
          {
LABEL_32:
            sub_221D7BFD0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
            return v19;
          }
        }
        else if (!v44)
        {
          goto LABEL_32;
        }
      }
LABEL_5:
      sub_221D7BFD0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
      unint64_t v19 = (v19 + 1) & v48;
    }
    while (((*(void *)(v52 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) != 0);
  }
  return v19;
}

void (*sub_221D7CE94(void *a1, void *a2, char a3))(uint64_t **a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_221D7B5B8(a2);
  *((unsigned char *)v8 + 32) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    char v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = *(void *)(*(void *)(*v4 + 56) + 8 * v11);
LABEL_12:
        void *v8 = v17;
        return sub_221D7CFC4;
      }
LABEL_11:
      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_221D77FA8();
      goto LABEL_7;
    }
    sub_221D7738C(v14, a3 & 1);
    unint64_t v18 = sub_221D7B5B8(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      unint64_t v11 = v18;
      v8[3] = v18;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t result = (void (*)(uint64_t **))sub_221D827E8();
  __break(1u);
  return result;
}

void sub_221D7CFC4(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_221D7D050(*a1, *((unsigned char *)*a1 + 32), (uint64_t *)(*a1)[2], (*a1)[3], (*a1)[1]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_221D7D014(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_221D7D044;
}

uint64_t sub_221D7D044(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_221D7D050(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for IngestionAnalyticsRequestInfo();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  if (v13)
  {
    uint64_t v14 = (void *)*a3;
    if (a2)
    {
      *(void *)(v14[7] + 8 * a4) = v13;
    }
    else
    {
      sub_221D7DD20(a5, (uint64_t)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
      sub_221D7C1A0(a4, (uint64_t)v12, v13, v14);
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_221D7B96C(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

char *sub_221D7D190(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_221D7B6C0();
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_221D7D288()
{
  if (!qword_267F722A8)
  {
    sub_221D82558();
    unint64_t v0 = sub_221D826C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F722A8);
    }
  }
}

uint64_t sub_221D7D2E0(void *a1, uint64_t a2)
{
  return sub_221D76794(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_221D7D2E8(uint64_t a1, void (*a2)(char *, uint64_t))
{
  sub_221D7DBDC(0, (unint64_t *)&qword_267F72280, (void (*)(uint64_t))type metadata accessor for IngestionAnalyticsRequestInfo);
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v22 - v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v23 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v8;
  int64_t v24 = (unint64_t)(v9 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v13 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v24) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v19 + 1;
      if (v19 + 1 >= v24) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v23 + 8 * v13);
      if (!v20)
      {
        int64_t v13 = v19 + 2;
        if (v19 + 2 >= v24) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v23 + 8 * v13);
        if (!v20)
        {
          int64_t v13 = v19 + 3;
          if (v19 + 3 >= v24) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v23 + 8 * v13);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_5:
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = type metadata accessor for IngestionAnalyticsRequestInfo();
    sub_221D7DD20(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestInfo);
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8 * v15);
    *(void *)&v7[*(int *)(v5 + 48)] = v18;
    swift_bridgeObjectRetain();
    a2(v7, v18);
    uint64_t result = sub_221D7DB80((uint64_t)v7, (unint64_t *)&qword_267F72280, (void (*)(uint64_t))type metadata accessor for IngestionAnalyticsRequestInfo);
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v24) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v13 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v13 >= v24) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v23 + 8 * v13);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_221D7D588(void *a1, uint64_t a2)
{
  return sub_221D7E594(a1, a2);
}

uint64_t sub_221D7D590(uint64_t a1, void (*a2)(char *))
{
  sub_221D7DBDC(0, (unint64_t *)&qword_267F722C0, (void (*)(uint64_t))type metadata accessor for IngestionAnalyticsRequestFailure);
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v8;
  int64_t v23 = (unint64_t)(v9 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v13 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v23) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v22 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v23) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v22 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v23) {
          return swift_release();
        }
        unint64_t v19 = *(void *)(v22 + 8 * v13);
        if (!v19)
        {
          int64_t v13 = v18 + 3;
          if (v18 + 3 >= v23) {
            return swift_release();
          }
          unint64_t v19 = *(void *)(v22 + 8 * v13);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_5:
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = type metadata accessor for IngestionAnalyticsRequestFailure();
    sub_221D7DD20(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
    *(void *)&v7[*(int *)(v5 + 48)] = *(void *)(*(void *)(a1 + 56) + 8 * v15);
    a2(v7);
    uint64_t result = sub_221D7DB80((uint64_t)v7, (unint64_t *)&qword_267F722C0, (void (*)(uint64_t))type metadata accessor for IngestionAnalyticsRequestFailure);
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v23) {
    return swift_release();
  }
  unint64_t v19 = *(void *)(v22 + 8 * v20);
  if (v19)
  {
    int64_t v13 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v13 >= v23) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v22 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_221D7D824(uint64_t a1, uint64_t a2)
{
  return sub_221D7D854(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_221D7E5B8);
}

uint64_t sub_221D7D83C(uint64_t a1, uint64_t a2)
{
  return sub_221D7D854(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_221D771FC);
}

uint64_t sub_221D7D854(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void))
{
  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t type metadata accessor for IngestionAnalyticsAccumulator()
{
  return self;
}

uint64_t method lookup function for IngestionAnalyticsAccumulator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IngestionAnalyticsAccumulator);
}

uint64_t dispatch thunk of IngestionAnalyticsAccumulator.analyticsString.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of IngestionAnalyticsAccumulator.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of IngestionAnalyticsAccumulator.accumulateIngestionAnalytics(from:gateway:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of IngestionAnalyticsAccumulator.consume(from:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 184) + **(int **)(*(void *)v1 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_221D7DA08;
  return v6(a1);
}

uint64_t sub_221D7DA08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of IngestionAnalyticsAccumulator.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of IngestionAnalyticsAccumulator.enumerateAndResetElementsAsPayload(with:block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t sub_221D7DB44(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_221D7DB80(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_221D7DBDC(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_221D7DBDC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t sub_221D7DC50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_221D7DCB8()
{
  if (!qword_26AB1C998)
  {
    type metadata accessor for IngestionAnalyticsRequestFailure();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26AB1C998);
    }
  }
}

uint64_t sub_221D7DD20(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for IngestionAnalyticsRequestFailureEvents()
{
  return &type metadata for IngestionAnalyticsRequestFailureEvents;
}

uint64_t sub_221D7DD98(uint64_t a1)
{
  sub_221D7E7A4();
  uint64_t v56 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v55 = (uint64_t)&v47 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v54 = (uint64_t)&v47 - v9;
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (!v10) {
    return v11;
  }
  uint64_t v47 = v1;
  uint64_t v63 = MEMORY[0x263F8EE78];
  sub_221D7E810(0, v10, 0);
  uint64_t result = sub_221D7E834(a1);
  uint64_t v14 = result;
  uint64_t v15 = 0;
  uint64_t v16 = a1 + 64;
  char v17 = *(unsigned char *)(a1 + 32);
  uint64_t v48 = a1 + 80;
  uint64_t v52 = MEMORY[0x263F8EE58] + 8;
  uint64_t v53 = a1;
  int64_t v49 = v10;
  uint64_t v50 = v13;
  uint64_t v51 = a1 + 64;
  while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << v17)
  {
    unint64_t v20 = (unint64_t)v14 >> 6;
    if ((*(void *)(v16 + 8 * ((unint64_t)v14 >> 6)) & (1 << v14)) == 0) {
      goto LABEL_27;
    }
    if (*(_DWORD *)(a1 + 36) != v13) {
      goto LABEL_28;
    }
    uint64_t v57 = v15;
    uint64_t v58 = 1 << v14;
    uint64_t v21 = v56;
    uint64_t v22 = *(int *)(v56 + 48);
    uint64_t v23 = *(void *)(a1 + 48);
    int64_t v24 = (int *)(type metadata accessor for IngestionAnalyticsRequestFailure() - 8);
    uint64_t v25 = v54;
    sub_221D7E6E8(v23 + *(void *)(*(void *)v24 + 72) * v14, v54);
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8 * v14);
    *(void *)(v25 + v22) = v26;
    uint64_t v27 = v55;
    sub_221D7E6E8(v25, v55);
    *(void *)(v27 + *(int *)(v21 + 48)) = v26;
    sub_221D7E8BC(v27, (uint64_t)v6);
    sub_221D7E920(v25, (uint64_t (*)(void))sub_221D7E7A4);
    uint64_t v28 = *(void *)((char *)v6 + *(int *)(v21 + 48));
    uint64_t v29 = NSStringFromClinicalIngestionInteractionType(v6[7]);
    uint64_t v30 = sub_221D825F8();
    unint64_t v32 = v31;

    uint64_t v61 = v30;
    unint64_t v62 = v32;
    sub_221D82638();
    swift_bridgeObjectRetain();
    sub_221D82638();
    swift_bridgeObjectRelease();
    sub_221D82638();
    unint64_t v33 = v6[4];
    uint64_t v59 = v6[3];
    unint64_t v60 = v33;
    swift_bridgeObjectRetain_n();
    sub_221D827D8();
    id v34 = (id)HKSensitiveLogItem();
    swift_unknownObjectRelease();
    sub_221D826D8();
    swift_unknownObjectRelease();
    sub_221D82618();
    swift_bridgeObjectRelease();
    sub_221D82638();
    swift_bridgeObjectRelease();
    uint64_t v59 = v61;
    unint64_t v60 = v62;
    sub_221D82638();
    uint64_t v61 = *(void *)((char *)v6 + v24[7]);
    sub_221D827A8();
    sub_221D82638();
    swift_bridgeObjectRelease();
    uint64_t v35 = v59;
    unint64_t v36 = v60;
    if (*(void *)((char *)v6 + v24[8] + 8))
    {
      uint64_t v59 = 10272;
      unint64_t v60 = 0xE200000000000000;
      sub_221D82638();
      sub_221D82638();
      uint64_t v59 = v35;
      unint64_t v60 = v36;
      swift_bridgeObjectRetain();
      sub_221D82638();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v35 = v59;
      unint64_t v36 = v60;
    }
    uint64_t v59 = v35;
    unint64_t v60 = v36;
    sub_221D82638();
    uint64_t v61 = v28;
    sub_221D827A8();
    sub_221D82638();
    swift_bridgeObjectRelease();
    uint64_t v38 = v59;
    unint64_t v37 = v60;
    sub_221D7E920((uint64_t)v6, (uint64_t (*)(void))sub_221D7E7A4);
    uint64_t v11 = v63;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_221D7E810(0, *(void *)(v11 + 16) + 1, 1);
      uint64_t v11 = v63;
    }
    unint64_t v40 = *(void *)(v11 + 16);
    unint64_t v39 = *(void *)(v11 + 24);
    if (v40 >= v39 >> 1)
    {
      uint64_t result = (uint64_t)sub_221D7E810((char *)(v39 > 1), v40 + 1, 1);
      uint64_t v11 = v63;
    }
    *(void *)(v11 + 16) = v40 + 1;
    uint64_t v41 = v11 + 16 * v40;
    *(void *)(v41 + 32) = v38;
    *(void *)(v41 + 40) = v37;
    a1 = v53;
    char v17 = *(unsigned char *)(v53 + 32);
    unint64_t v18 = 1 << v17;
    if (v14 >= 1 << v17) {
      goto LABEL_29;
    }
    uint64_t v16 = v51;
    uint64_t v42 = *(void *)(v51 + 8 * v20);
    if ((v42 & v58) == 0) {
      goto LABEL_30;
    }
    LODWORD(v13) = v50;
    if (*(_DWORD *)(v53 + 36) != v50) {
      goto LABEL_31;
    }
    unint64_t v43 = v42 & (-2 << (v14 & 0x3F));
    if (v43)
    {
      unint64_t v18 = __clz(__rbit64(v43)) | v14 & 0xFFFFFFFFFFFFFFC0;
      int64_t v19 = v49;
    }
    else
    {
      unint64_t v44 = v20 + 1;
      unint64_t v45 = (v18 + 63) >> 6;
      int64_t v19 = v49;
      if (v20 + 1 < v45)
      {
        unint64_t v46 = *(void *)(v51 + 8 * v44);
        if (v46)
        {
LABEL_24:
          unint64_t v18 = __clz(__rbit64(v46)) + (v44 << 6);
        }
        else
        {
          while (v45 - 2 != v20)
          {
            unint64_t v46 = *(void *)(v48 + 8 * v20++);
            if (v46)
            {
              unint64_t v44 = v20 + 1;
              goto LABEL_24;
            }
          }
        }
      }
    }
    uint64_t v15 = v57 + 1;
    uint64_t v14 = v18;
    if (v57 + 1 == v19) {
      return v11;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_221D7E318(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0xD000000000000031;
  }
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_221D7DD98(v1);
  swift_bridgeObjectRelease();
  sub_221D82708();
  sub_221D82638();
  sub_221D827A8();
  sub_221D82638();
  swift_bridgeObjectRelease();
  sub_221D82638();
  sub_221D7E74C();
  sub_221D78DFC();
  sub_221D825B8();
  swift_bridgeObjectRelease();
  sub_221D82638();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_221D7E478(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for IngestionAnalyticsRequestFailure();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = sub_221D7E6E8((uint64_t)a1, (uint64_t)v8);
  uint64_t v10 = *v2;
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t result = sub_221D7B790(a1);
    if (v12) {
      uint64_t v11 = *(void *)(*(void *)(v10 + 56) + 8 * result);
    }
    else {
      uint64_t v11 = 0;
    }
  }
  BOOL v13 = __OFADD__(v11, a2);
  uint64_t v14 = v11 + a2;
  if (v13)
  {
    __break(1u);
  }
  else
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_221D7BE5C(v14, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v17;
    swift_bridgeObjectRelease();
    return sub_221D7E920((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for IngestionAnalyticsRequestFailure);
  }
  return result;
}

uint64_t sub_221D7E594(void *a1, uint64_t a2)
{
  return sub_221D7E478(a1, a2);
}

uint64_t sub_221D7E5B8(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *, uint64_t, uint64_t, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  v22[0] = a3;
  unint64_t v11 = sub_221D7F370(v22);
  uint64_t v12 = sub_221D826A8();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v11;
  sub_221D7C030(v12, 0xD00000000000001ALL, 0x8000000221D8BBC0, isUniquelyReferenced_nonNull_native);
  uint64_t v14 = v22[0];
  swift_bridgeObjectRelease();
  uint64_t v15 = *a1;
  uint64_t v16 = a1[1];
  unint64_t v18 = (void *)a1[2];
  uint64_t v17 = a1[3];
  uint64_t v19 = a1[4];
  v22[0] = v15;
  v22[1] = v16;
  void v22[2] = (uint64_t)v18;
  v22[3] = v17;
  v22[4] = v19;
  swift_bridgeObjectRetain();
  id v20 = v18;
  swift_bridgeObjectRetain();
  a4(v22, a6, a7, v14);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_221D7E6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IngestionAnalyticsRequestFailure();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_221D7E74C()
{
  if (!qword_267F72270)
  {
    unint64_t v0 = sub_221D82688();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F72270);
    }
  }
}

void sub_221D7E7A4()
{
  if (!qword_267F722C0)
  {
    type metadata accessor for IngestionAnalyticsRequestFailure();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_267F722C0);
    }
  }
}

char *sub_221D7E810(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_221D7FC54(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_221D7E834(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_221D7E8BC(uint64_t a1, uint64_t a2)
{
  sub_221D7E7A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_221D7E920(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id HKClinicalAccount.supportsSharingToProvider.getter()
{
  id result = objc_msgSend(v0, sel_gateway);
  if (result)
  {
    uint64_t v2 = result;
    unsigned __int8 v3 = HKClinicalGateway.supportsSharingToProvider.getter();

    return (id)(v3 & 1);
  }
  return result;
}

id HKClinicalAccount.isSharingToProviderEnrolled.getter()
{
  unint64_t v1 = v0;
  id result = objc_msgSend(v0, sel_gateway);
  if (result)
  {
    unsigned __int8 v3 = result;
    unsigned __int8 v4 = HKClinicalGateway.supportsSharingToProvider.getter();

    if (v4)
    {
      id v5 = objc_msgSend(v1, sel_clinicalSharingStatus);
      id v6 = objc_msgSend(v5, sel_userStatus);

      return (id)(v6 == (id)2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_221D7EA64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned __int8 v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *unsigned __int8 v4 = *a2;
    unsigned __int8 v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v9 = (void *)a2[2];
    uint64_t v8 = a2[3];
    a1[2] = (uint64_t)v9;
    a1[3] = v8;
    uint64_t v10 = a2[5];
    a1[4] = a2[4];
    a1[5] = v10;
    uint64_t v11 = a2[7];
    a1[6] = a2[6];
    a1[7] = v11;
    uint64_t v12 = *(int *)(type metadata accessor for IngestionAnalyticsRequestInfo() + 28);
    uint64_t v22 = (char *)a2 + v12;
    uint64_t v23 = (char *)v4 + v12;
    uint64_t v13 = sub_221D825A8();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    id v15 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v23, v22, v13);
    uint64_t v16 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    unint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_221D7EBB8(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for IngestionAnalyticsRequestInfo() + 28);
  uint64_t v3 = sub_221D825A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

void *sub_221D7EC68(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v7 = (void *)a2[2];
  uint64_t v6 = a2[3];
  a1[2] = v7;
  a1[3] = v6;
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  uint64_t v10 = *(int *)(type metadata accessor for IngestionAnalyticsRequestInfo() + 28);
  uint64_t v20 = (char *)a1 + v10;
  uint64_t v11 = (char *)a2 + v10;
  uint64_t v12 = sub_221D825A8();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  id v14 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v20, v11, v12);
  uint64_t v15 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_221D7ED74(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a2[2];
  uint64_t v7 = (void *)a1[2];
  a1[2] = v6;
  id v8 = v6;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  uint64_t v9 = *(int *)(type metadata accessor for IngestionAnalyticsRequestInfo() + 28);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_221D825A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v13 = *(int *)(a3 + 24);
  id v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_221D7EEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v7 = *(int *)(type metadata accessor for IngestionAnalyticsRequestInfo() + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_221D825A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

void *sub_221D7EF74(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v8 = a2[4];
  a1[3] = a2[3];
  a1[4] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  uint64_t v10 = *(int *)(type metadata accessor for IngestionAnalyticsRequestInfo() + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_221D825A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  void *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_221D7F06C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_221D7F080);
}

uint64_t sub_221D7F080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_221D7F150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_221D7F164);
}

uint64_t sub_221D7F164(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for IngestionAnalyticsRequestInfo();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t type metadata accessor for IngestionAnalyticsRequestFailure()
{
  uint64_t result = qword_26AB1C780;
  if (!qword_26AB1C780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_221D7F270()
{
  uint64_t result = type metadata accessor for IngestionAnalyticsRequestInfo();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_221D7F318()
{
  unint64_t result = qword_267F722C8;
  if (!qword_267F722C8)
  {
    type metadata accessor for IngestionAnalyticsRequestFailure();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F722C8);
  }
  return result;
}

unint64_t sub_221D7F370(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 16);
  if (v2)
  {
    uint64_t v3 = 0;
    while ((*(unsigned char *)(v1 + v3 + 32) & 1) == 0)
    {
      if (v2 == ++v3) {
        goto LABEL_5;
      }
    }
    sub_221D79F54();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_221D88370;
    *(void *)(inited + 32) = 0x6F43737574617473;
    *(void *)(inited + 40) = 0xEA00000000006564;
    type metadata accessor for IngestionAnalyticsRequestFailure();
    *(void *)(inited + 48) = sub_221D826A8();
    *(void *)(inited + 56) = 0x79654B726F727265;
    *(void *)(inited + 64) = 0xE800000000000000;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_221D825C8();
    swift_bridgeObjectRelease();
    *(void *)(inited + 72) = v7;
    unint64_t v8 = sub_221D7A138(inited);
    uint64_t v10 = v1;
    uint64_t v9 = sub_221D7974C((uint64_t)&v10);
    return sub_221D77300(v8, (uint64_t)v9);
  }
  else
  {
LABEL_5:
    uint64_t v4 = MEMORY[0x263F8EE78];
    return sub_221D7A138(v4);
  }
}

uint64_t sub_221D7F4DC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D82628();
  sub_221D82808();
  uint64_t v3 = type metadata accessor for IngestionAnalyticsRequestFailure();
  sub_221D82808();
  if (!*(void *)(v0 + *(int *)(v3 + 24) + 8)) {
    return sub_221D82818();
  }
  sub_221D82818();
  swift_bridgeObjectRetain();
  sub_221D82628();

  return swift_bridgeObjectRelease();
}

uint64_t sub_221D7F630()
{
  return sub_221D82828();
}

uint64_t sub_221D7F674()
{
  return sub_221D82828();
}

uint64_t sub_221D7F6B0(uint64_t a1, uint64_t a2)
{
  if (sub_221D79C80(a1, a2))
  {
    uint64_t v4 = type metadata accessor for IngestionAnalyticsRequestFailure();
    if (*(void *)(a1 + *(int *)(v4 + 20)) == *(void *)(a2 + *(int *)(v4 + 20)))
    {
      uint64_t v5 = *(int *)(v4 + 24);
      uint64_t v6 = (void *)(a1 + v5);
      uint64_t v7 = *(void *)(a1 + v5 + 8);
      unint64_t v8 = (void *)(a2 + v5);
      uint64_t v9 = v8[1];
      if (v7)
      {
        if (v9)
        {
          BOOL v10 = *v6 == *v8 && v7 == v9;
          if (v10 || (sub_221D827C8() & 1) != 0) {
            return 1;
          }
        }
      }
      else if (!v9)
      {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_221D7F744(uint64_t a1)
{
  uint64_t v1 = 0x6E6F707365722030;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    if (v2 == 1)
    {
      double v4 = *(double *)(a1 + 32);
      sub_221D80910(0, &qword_267F722E8, (void (*)(uint64_t))sub_221D80964);
      uint64_t v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_221D88190;
      uint64_t v6 = MEMORY[0x263F8D5B8];
      *(void *)(v5 + 56) = MEMORY[0x263F8D538];
      *(void *)(v5 + 64) = v6;
      *(double *)(v5 + 32) = v4 * 1000.0;
      return sub_221D82608();
    }
    uint64_t v7 = 0;
    double v8 = *(double *)(a1 + 32);
    do
    {
      uint64_t v9 = a1 + 8 * v7;
      if (*(double *)(v9 + 40) < v8) {
        double v8 = *(double *)(v9 + 40);
      }
      ++v7;
    }
    while (v2 - 1 != v7);
    uint64_t v10 = sub_221D7FB68(a1);
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 16);
      if (v12)
      {
        double v13 = *(double *)(a1 + 32);
        uint64_t v14 = v12 - 1;
        if (v14)
        {
          uint64_t v15 = (double *)(a1 + 40);
          do
          {
            double v16 = *v15++;
            double v17 = v16;
            if (v13 < v16) {
              double v13 = v17;
            }
            --v14;
          }
          while (v14);
        }
        double v18 = *(double *)&v10;
        sub_221D80910(0, &qword_267F722E8, (void (*)(uint64_t))sub_221D80964);
        uint64_t v19 = swift_allocObject();
        uint64_t v20 = MEMORY[0x263F8D6C8];
        uint64_t v21 = MEMORY[0x263F8D750];
        *(_OWORD *)(v19 + 16) = xmmword_221D88460;
        *(void *)(v19 + 56) = v20;
        *(void *)(v19 + 64) = v21;
        *(void *)(v19 + 32) = v2;
        uint64_t v22 = MEMORY[0x263F8D538];
        uint64_t v23 = MEMORY[0x263F8D5B8];
        *(void *)(v19 + 96) = MEMORY[0x263F8D538];
        *(void *)(v19 + 104) = v23;
        *(double *)(v19 + 72) = v8 * 1000.0;
        *(void *)(v19 + 136) = v22;
        *(void *)(v19 + 144) = v23;
        *(double *)(v19 + 112) = v18 * 1000.0;
        *(void *)(v19 + 176) = v22;
        *(void *)(v19 + 184) = v23;
        *(double *)(v19 + 152) = v13 * 1000.0;
        return sub_221D82608();
      }
    }
  }
  return v1;
}

unint64_t sub_221D7F958(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  if (v2)
  {
    double v4 = (unsigned char *)(*(void *)a1 + 32);
    while ((*v4 & 1) == 0)
    {
      ++v4;
      if (!--v2) {
        goto LABEL_5;
      }
    }
    sub_221D80910(0, (unint64_t *)&qword_267F72290, (void (*)(uint64_t))sub_221D79FAC);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_221D88460;
    *(void *)(inited + 32) = 0xD000000000000013;
    *(void *)(inited + 40) = 0x8000000221D8BC50;
    *(void *)(inited + 48) = sub_221D826A8();
    *(void *)(inited + 56) = 0x656D695478616DLL;
    *(void *)(inited + 64) = 0xE700000000000000;
    uint64_t v8 = *(void *)(a2 + 16);
    if (v8)
    {
      double v9 = *(double *)(a2 + 32);
      uint64_t v10 = v8 - 1;
      if (v8 != 1)
      {
        char v11 = (double *)(a2 + 40);
        do
        {
          double v12 = *v11++;
          double v13 = v12;
          if (v9 < v12) {
            double v9 = v13;
          }
          --v10;
        }
        while (v10);
      }
    }
    *(void *)(inited + 72) = sub_221D82698();
    *(void *)(inited + 80) = 0x69546E616964656DLL;
    *(void *)(inited + 88) = 0xEA0000000000656DLL;
    sub_221D7FB68(a2);
    *(void *)(inited + 96) = sub_221D82698();
    *(void *)(inited + 104) = 0x656D69546E696DLL;
    *(void *)(inited + 112) = 0xE700000000000000;
    uint64_t v14 = *(void *)(a2 + 16);
    if (v14)
    {
      double v15 = *(double *)(a2 + 32);
      uint64_t v16 = v14 - 1;
      if (v14 != 1)
      {
        double v17 = (double *)(a2 + 40);
        do
        {
          double v18 = *v17++;
          double v19 = v18;
          if (v18 < v15) {
            double v15 = v19;
          }
          --v16;
        }
        while (v16);
      }
    }
    *(void *)(inited + 120) = sub_221D82698();
    return sub_221D7A138(inited);
  }
  else
  {
LABEL_5:
    uint64_t v5 = MEMORY[0x263F8EE78];
    return sub_221D7A138(v5);
  }
}

uint64_t sub_221D7FB68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v5 = 0.0;
    return *(void *)&v5;
  }
  uint64_t v8 = (char *)a1;
  swift_bridgeObjectRetain_n();
  sub_221D7FE6C(&v8);
  swift_bridgeObjectRelease();
  unint64_t v1 = *((void *)v8 + 2);
  if (v1)
  {
    unint64_t v6 = (v1 - 1) >> 1;
    if (v6 < v1)
    {
      double v5 = *(double *)&v8[8 * v6 + 32];
      swift_release();
      return *(void *)&v5;
    }
    goto LABEL_11;
  }
  if (v1 >> 1 >= v1)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v1 >= 2)
  {
    uint64_t v2 = &v8[8 * (v1 >> 1)];
    double v4 = *((double *)v2 + 3);
    double v3 = *((double *)v2 + 4);
    swift_release();
    double v5 = (v3 + v4) * 0.5;
    return *(void *)&v5;
  }
LABEL_12:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

char *sub_221D7FC54(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_221D808C8(0, &qword_267F722E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_221D7FD64(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_221D808C8(0, (unint64_t *)&qword_267F72248);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  double v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_221D7FE6C(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_221D80854((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_221D7FED8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_221D7FED8(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_221D82798();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v81 = *(double *)(v79 + 8 * i);
        uint64_t v82 = v78;
        do
        {
          uint64_t v83 = v79 + 8 * v82;
          if (v81 >= *(double *)v83) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(void *)(v83 + 8) = *(void *)v83;
          *(double *)(v79 + 8 * v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_136;
    }
    uint64_t v95 = result;
    uint64_t v96 = v3;
    if (v3 > 1)
    {
      uint64_t v6 = v5 >> 1;
      uint64_t result = sub_221D82678();
      *(void *)(result + 16) = v6;
      uint64_t v3 = v96;
      uint64_t v94 = result;
      v98 = (double *)(result + 32);
LABEL_13:
      uint64_t v8 = 0;
      uint64_t v9 = *v2;
      v92 = v2;
      uint64_t v93 = *v2 - 8;
      uint64_t v10 = MEMORY[0x263F8EE78];
      uint64_t v97 = *v2;
      while (1)
      {
        uint64_t v12 = v8++;
        if (v8 < v3)
        {
          double v13 = *(double *)(v9 + 8 * v8);
          double v14 = *(double *)(v9 + 8 * v12);
          uint64_t v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            double v15 = v13;
            while (1)
            {
              double v16 = v15;
              double v15 = *(double *)(v9 + 8 * v8);
              if (v13 < v14 == v15 >= v16) {
                break;
              }
              if (v3 == ++v8)
              {
                uint64_t v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12) {
              goto LABEL_138;
            }
            if (v12 < v8)
            {
              double v17 = (uint64_t *)(v93 + 8 * v8);
              uint64_t v18 = v8;
              uint64_t v19 = v12;
              uint64_t v20 = (uint64_t *)(v9 + 8 * v12);
              do
              {
                if (v19 != --v18)
                {
                  if (!v9) {
                    goto LABEL_144;
                  }
                  uint64_t v21 = *v20;
                  *uint64_t v20 = *v17;
                  *double v17 = v21;
                }
                ++v19;
                --v17;
                ++v20;
              }
              while (v19 < v18);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12)) {
            goto LABEL_135;
          }
          if (v8 - v12 < v95)
          {
            uint64_t v22 = v12 + v95;
            if (__OFADD__(v12, v95)) {
              goto LABEL_139;
            }
            if (v22 >= v3) {
              uint64_t v22 = v3;
            }
            if (v22 < v12)
            {
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
              return result;
            }
            if (v8 != v22)
            {
              uint64_t v23 = (double *)(v93 + 8 * v8);
              do
              {
                double v24 = *(double *)(v9 + 8 * v8);
                uint64_t v25 = v12;
                uint64_t v26 = v23;
                do
                {
                  double v27 = *v26;
                  if (v24 >= *v26) {
                    break;
                  }
                  if (!v9) {
                    goto LABEL_142;
                  }
                  *uint64_t v26 = v24;
                  v26[1] = v27;
                  --v26;
                  ++v25;
                }
                while (v8 != v25);
                ++v8;
                ++v23;
              }
              while (v8 != v22);
              uint64_t v8 = v22;
            }
          }
        }
        if (v8 < v12) {
          goto LABEL_130;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_221D8072C(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        unint64_t v29 = *(void *)(v10 + 16);
        unint64_t v28 = *(void *)(v10 + 24);
        unint64_t v11 = v29 + 1;
        uint64_t v9 = v97;
        if (v29 >= v28 >> 1)
        {
          uint64_t result = (uint64_t)sub_221D8072C((char *)(v28 > 1), v29 + 1, 1, (char *)v10);
          uint64_t v9 = v97;
          uint64_t v10 = result;
        }
        *(void *)(v10 + 16) = v11;
        uint64_t v30 = v10 + 32;
        unint64_t v31 = (uint64_t *)(v10 + 32 + 16 * v29);
        *unint64_t v31 = v12;
        v31[1] = v8;
        if (v29)
        {
          while (1)
          {
            unint64_t v32 = v11 - 1;
            if (v11 >= 4)
            {
              unint64_t v37 = v30 + 16 * v11;
              uint64_t v38 = *(void *)(v37 - 64);
              uint64_t v39 = *(void *)(v37 - 56);
              BOOL v43 = __OFSUB__(v39, v38);
              uint64_t v40 = v39 - v38;
              if (v43) {
                goto LABEL_119;
              }
              uint64_t v42 = *(void *)(v37 - 48);
              uint64_t v41 = *(void *)(v37 - 40);
              BOOL v43 = __OFSUB__(v41, v42);
              uint64_t v35 = v41 - v42;
              char v36 = v43;
              if (v43) {
                goto LABEL_120;
              }
              unint64_t v44 = v11 - 2;
              unint64_t v45 = (uint64_t *)(v30 + 16 * (v11 - 2));
              uint64_t v47 = *v45;
              uint64_t v46 = v45[1];
              BOOL v43 = __OFSUB__(v46, v47);
              uint64_t v48 = v46 - v47;
              if (v43) {
                goto LABEL_121;
              }
              BOOL v43 = __OFADD__(v35, v48);
              uint64_t v49 = v35 + v48;
              if (v43) {
                goto LABEL_123;
              }
              if (v49 >= v40)
              {
                long long v67 = (uint64_t *)(v30 + 16 * v32);
                uint64_t v69 = *v67;
                uint64_t v68 = v67[1];
                BOOL v43 = __OFSUB__(v68, v69);
                uint64_t v70 = v68 - v69;
                if (v43) {
                  goto LABEL_129;
                }
                BOOL v60 = v35 < v70;
                goto LABEL_83;
              }
            }
            else
            {
              if (v11 != 3)
              {
                uint64_t v61 = *(void *)(v10 + 32);
                uint64_t v62 = *(void *)(v10 + 40);
                BOOL v43 = __OFSUB__(v62, v61);
                uint64_t v54 = v62 - v61;
                char v55 = v43;
                goto LABEL_77;
              }
              uint64_t v34 = *(void *)(v10 + 32);
              uint64_t v33 = *(void *)(v10 + 40);
              BOOL v43 = __OFSUB__(v33, v34);
              uint64_t v35 = v33 - v34;
              char v36 = v43;
            }
            if (v36) {
              goto LABEL_122;
            }
            unint64_t v44 = v11 - 2;
            uint64_t v50 = (uint64_t *)(v30 + 16 * (v11 - 2));
            uint64_t v52 = *v50;
            uint64_t v51 = v50[1];
            BOOL v53 = __OFSUB__(v51, v52);
            uint64_t v54 = v51 - v52;
            char v55 = v53;
            if (v53) {
              goto LABEL_124;
            }
            uint64_t v56 = (uint64_t *)(v30 + 16 * v32);
            uint64_t v58 = *v56;
            uint64_t v57 = v56[1];
            BOOL v43 = __OFSUB__(v57, v58);
            uint64_t v59 = v57 - v58;
            if (v43) {
              goto LABEL_126;
            }
            if (__OFADD__(v54, v59)) {
              goto LABEL_128;
            }
            if (v54 + v59 >= v35)
            {
              BOOL v60 = v35 < v59;
LABEL_83:
              if (v60) {
                unint64_t v32 = v44;
              }
              goto LABEL_85;
            }
LABEL_77:
            if (v55) {
              goto LABEL_125;
            }
            uint64_t v63 = (uint64_t *)(v30 + 16 * v32);
            uint64_t v65 = *v63;
            uint64_t v64 = v63[1];
            BOOL v43 = __OFSUB__(v64, v65);
            uint64_t v66 = v64 - v65;
            if (v43) {
              goto LABEL_127;
            }
            if (v66 < v54) {
              goto LABEL_15;
            }
LABEL_85:
            unint64_t v71 = v32 - 1;
            if (v32 - 1 >= v11)
            {
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
              goto LABEL_140;
            }
            if (!v9) {
              goto LABEL_143;
            }
            uint64_t v72 = (uint64_t *)(v30 + 16 * v71);
            uint64_t v73 = *v72;
            uint64_t v74 = v30;
            id v75 = (void *)(v30 + 16 * v32);
            uint64_t v76 = v75[1];
            uint64_t result = sub_221D80528((double *)(v9 + 8 * *v72), (double *)(v9 + 8 * *v75), v9 + 8 * v76, v98);
            if (v1) {
              goto LABEL_113;
            }
            if (v76 < v73) {
              goto LABEL_116;
            }
            if (v32 > *(void *)(v10 + 16)) {
              goto LABEL_117;
            }
            *uint64_t v72 = v73;
            *(void *)(v74 + 16 * v71 + 8) = v76;
            unint64_t v77 = *(void *)(v10 + 16);
            if (v32 >= v77) {
              goto LABEL_118;
            }
            unint64_t v11 = v77 - 1;
            uint64_t result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v32));
            uint64_t v30 = v74;
            *(void *)(v10 + 16) = v77 - 1;
            uint64_t v9 = v97;
            if (v77 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v11 = 1;
LABEL_15:
        uint64_t v3 = v96;
        if (v8 >= v96)
        {
          uint64_t v7 = v94;
          uint64_t v2 = v92;
          goto LABEL_102;
        }
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    v98 = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 == 1)
    {
      uint64_t v94 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_102:
    uint64_t v94 = v7;
    if (v11 >= 2)
    {
      uint64_t v84 = *v2;
      do
      {
        unint64_t v85 = v11 - 2;
        if (v11 < 2) {
          goto LABEL_131;
        }
        if (!v84) {
          goto LABEL_145;
        }
        uint64_t v86 = v10;
        uint64_t v87 = v10 + 32;
        uint64_t v88 = *(void *)(v10 + 32 + 16 * v85);
        uint64_t v89 = *(void *)(v10 + 32 + 16 * (v11 - 1) + 8);
        uint64_t result = sub_221D80528((double *)(v84 + 8 * v88), (double *)(v84 + 8 * *(void *)(v87 + 16 * (v11 - 1))), v84 + 8 * v89, v98);
        if (v1) {
          break;
        }
        if (v89 < v88) {
          goto LABEL_132;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_221D80840(v86);
          uint64_t v86 = result;
        }
        if (v85 >= *(void *)(v86 + 16)) {
          goto LABEL_133;
        }
        v90 = (void *)(v86 + 32 + 16 * v85);
        void *v90 = v88;
        v90[1] = v89;
        unint64_t v91 = *(void *)(v86 + 16);
        if (v11 > v91) {
          goto LABEL_134;
        }
        uint64_t result = (uint64_t)memmove((void *)(v86 + 32 + 16 * (v11 - 1)), (const void *)(v86 + 32 + 16 * v11), 16 * (v91 - v11));
        uint64_t v10 = v86;
        *(void *)(v86 + 16) = v91 - 1;
        unint64_t v11 = v91 - 1;
      }
      while (v91 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
    *(void *)(v94 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_221D80528(double *__dst, double *__src, unint64_t a3, double *a4)
{
  double v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v9 = (char *)__src - (char *)__dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    double v14 = &v4[v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_39;
    }
    double v17 = (double *)(a3 - 8);
    uint64_t v18 = v6;
    while (1)
    {
      uint64_t v19 = v17 + 1;
      double v20 = *--v18;
      double v21 = v20;
      if (*(v14 - 1) < v20) {
        break;
      }
      double v21 = *(v14 - 1);
      uint64_t v18 = v6;
      if (v19 != v14)
      {
        --v14;
LABEL_35:
        *double v17 = v21;
        goto LABEL_36;
      }
      if (v17 >= v14--) {
        goto LABEL_35;
      }
LABEL_36:
      if (v18 > v7)
      {
        --v17;
        uint64_t v6 = v18;
        if (v14 > v4) {
          continue;
        }
      }
      uint64_t v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  double v14 = &v4[v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      double v15 = *v6;
      if (*v6 >= *v4) {
        break;
      }
      BOOL v16 = v7 == v6++;
      if (!v16) {
        goto LABEL_16;
      }
LABEL_17:
      ++v7;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    double v15 = *v4;
    BOOL v16 = v7 == v4++;
    if (v16) {
      goto LABEL_17;
    }
LABEL_16:
    double *v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_39:
  int64_t v23 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= (double *)((char *)v4 + (v23 & 0xFFFFFFFFFFFFFFF8))) {
    memmove(v6, v4, 8 * (v23 >> 3));
  }
  return 1;
}

char *sub_221D8072C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_221D80910(0, &qword_267F722D0, (void (*)(uint64_t))sub_221D80868);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  double v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_221D80840(uint64_t a1)
{
  return sub_221D8072C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_221D80854(uint64_t a1)
{
  return sub_221D7FD64(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_221D80868()
{
  if (!qword_267F722D8)
  {
    unint64_t v0 = sub_221D826B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F722D8);
    }
  }
}

void sub_221D808C8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_221D827B8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_221D80910(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_221D827B8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_221D80964()
{
  unint64_t result = qword_267F722F0;
  if (!qword_267F722F0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_267F722F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for IngestionAnalyticsResponseTime()
{
  return &type metadata for IngestionAnalyticsResponseTime;
}

unint64_t sub_221D809D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)a1 + 16);
  if (v1)
  {
    uint64_t v2 = (unsigned char *)(*(void *)a1 + 32);
    unint64_t v3 = v2;
    uint64_t v4 = *(void *)(*(void *)a1 + 16);
    while ((*v3 & 1) != 0)
    {
      ++v3;
      if (!--v4) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = v1 - 1;
    do
    {
      char v8 = *v2;
      if (*v2) {
        break;
      }
      uint64_t v9 = v7--;
      ++v2;
    }
    while (v9);
    sub_221D79F54();
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_221D88370;
    *(void *)(inited + 32) = 1953722216;
    *(void *)(inited + 40) = 0xE400000000000000;
    if (v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_221D825C8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v11 = sub_221D825C8();
      swift_bridgeObjectRelease();
    }
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = 0x4979617765746167;
    *(void *)(inited + 64) = 0xE900000000000044;
    uint64_t v12 = sub_221D825C8();
    swift_bridgeObjectRelease();
    *(void *)(inited + 72) = v12;
    return sub_221D7A138(inited);
  }
  else
  {
LABEL_5:
    uint64_t v5 = MEMORY[0x263F8EE78];
    return sub_221D7A138(v5);
  }
}

uint64_t AnalyticsGateway.gatewayID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

id AnalyticsGateway.countryCode.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t AnalyticsGateway.baseURL.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnalyticsGateway.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();

  return swift_bridgeObjectRelease();
}

uint64_t AnalyticsGateway.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_221D827F8();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  return sub_221D82828();
}

uint64_t sub_221D80D44()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();

  return swift_bridgeObjectRelease();
}

uint64_t sub_221D80E00()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_221D827F8();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  sub_221D825F8();
  id v2 = v1;
  sub_221D82628();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_221D82628();
  swift_bridgeObjectRelease();
  return sub_221D82828();
}

uint64_t _s20HealthRecordServices16AnalyticsGatewayV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v7 = sub_221D827C8();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  uint64_t v9 = sub_221D825F8();
  uint64_t v11 = v10;
  if (v9 != sub_221D825F8() || v11 != v12)
  {
    char v14 = sub_221D827C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v14 & 1) == 0) {
      return result;
    }
    if (v2 != v4) {
      goto LABEL_17;
    }
LABEL_14:
    if (v3 == v5) {
      return 1;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease_n();
  if (v2 == v4) {
    goto LABEL_14;
  }
LABEL_17:

  return sub_221D827C8();
}

unint64_t sub_221D81000()
{
  unint64_t result = qword_267F722F8;
  if (!qword_267F722F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F722F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AnalyticsGateway(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnalyticsGateway(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AnalyticsGateway(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v5 = (void *)a2[2];
  uint64_t v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  id v6 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AnalyticsGateway(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnalyticsGateway(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsGateway(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsGateway(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsGateway()
{
  return &type metadata for AnalyticsGateway;
}

id HKClinicalGateway.supportsSharingToProvider.getter()
{
  id result = objc_msgSend(v0, sel_features);
  if (result)
  {
    unint64_t v2 = result;
    sub_221D81494();
    unint64_t v3 = sub_221D82668();

    if (v3 >> 62) {
      goto LABEL_20;
    }
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v4; uint64_t v4 = sub_221D82728())
    {
      uint64_t v5 = 4;
      while (1)
      {
        id v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x223C906A0](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
        char v7 = v6;
        uint64_t v8 = v5 - 3;
        if (__OFADD__(v5 - 4, 1)) {
          break;
        }
        id v9 = objc_msgSend(v6, sel_name);
        uint64_t v10 = sub_221D825F8();
        uint64_t v12 = v11;
        if (v10 == sub_221D825F8() && v12 == v13)
        {

          swift_bridgeObjectRelease_n();
LABEL_17:
          swift_bridgeObjectRelease_n();
          id v16 = objc_msgSend(v7, sel_status);

          return (id)(v16 == (id)1);
        }
        char v15 = sub_221D827C8();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v15) {
          goto LABEL_17;
        }

        ++v5;
        if (v8 == v4) {
          goto LABEL_15;
        }
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain();
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  return result;
}

unint64_t sub_221D81494()
{
  unint64_t result = qword_267F72300;
  if (!qword_267F72300)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F72300);
  }
  return result;
}

void HKAcceptAuthenticationChallengeWithTrust_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_221D38000, log, OS_LOG_TYPE_ERROR, "HKAcceptAuthenticationChallengeWithTrust: Could not retrieve trust certificate chain", v1, 2u);
}

void HKAcceptAuthenticationChallengeWithTrust_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_221D38000, log, OS_LOG_TYPE_ERROR, "HKAcceptAuthenticationChallengeWithTrust: SecTrustStore verification failed for root cert", v1, 2u);
}

void HKAcceptAuthenticationChallengeWithTrust_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_221D38000, a2, OS_LOG_TYPE_ERROR, "HKAcceptAuthenticationChallengeWithTrust: Server not trusted: %{public}@", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_221D82538()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_221D82548()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_221D82558()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_221D82568()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_221D82578()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_221D82588()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_221D82598()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_221D825A8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_221D825B8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_221D825C8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_221D825D8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_221D825E8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_221D825F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_221D82608()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_221D82618()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_221D82628()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_221D82638()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_221D82648()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_221D82658()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_221D82668()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_221D82678()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_221D82688()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_221D82698()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_221D826A8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_221D826B8()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_221D826C8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_221D826D8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_221D826E8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_221D826F8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_221D82708()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_221D82718()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_221D82728()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_221D82738()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_221D82748()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_221D82758()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_221D82768()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_221D82788()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_221D82798()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_221D827A8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_221D827B8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_221D827C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_221D827D8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_221D827E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_221D827F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_221D82808()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_221D82818()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_221D82828()
{
  return MEMORY[0x270F9FC90]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKDateMax()
{
  return MEMORY[0x270EF3688]();
}

uint64_t HKDiagnosticStringFromDate()
{
  return MEMORY[0x270EF36A0]();
}

uint64_t HKFHIRReleaseFromNSString()
{
  return MEMORY[0x270EF36C8]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x270EF3768]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x270EF3800]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKSharedResourcesDirectory()
{
  return MEMORY[0x270EF3810]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x270EF3860]();
}

uint64_t NSStringForSignedClinicalDataSourceType()
{
  return MEMORY[0x270EF38B8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

uint64_t SecTrustStoreContains()
{
  return MEMORY[0x270EFDE00]();
}

uint64_t SecTrustStoreForDomain()
{
  return MEMORY[0x270EFDE18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C668](adler, buf, *(void *)&len);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}