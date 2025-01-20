@interface NSCFURLSessionXPC
@end

@implementation NSCFURLSessionXPC

void __33____NSCFURLSessionXPC_initialize__block_invoke()
{
  context = (void *)MEMORY[0x18531D6D0]();
  sBgSessionManagerInterface = (uint64_t)(id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECFE97A8];
  sBgSessionInterface = (uint64_t)(id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECFE9808];
  sBgSessionClientInterface = (uint64_t)(id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ECFDB530];
  [(id)sBgSessionManagerInterface setInterface:sBgSessionInterface forSelector:sel_createSessionWithConfiguration_clientProxy_cachesDirectory_options_reply_ argumentIndex:0 ofReply:1];
  [(id)sBgSessionManagerInterface setInterface:sBgSessionClientInterface forSelector:sel_createSessionWithConfiguration_clientProxy_cachesDirectory_options_reply_ argumentIndex:1 ofReply:0];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [(id)sBgSessionManagerInterface setClasses:v9 forSelector:sel_createSessionWithConfiguration_clientProxy_cachesDirectory_options_reply_ argumentIndex:3 ofReply:0];
  [(id)sBgSessionManagerInterface setClasses:v9 forSelector:sel_createSessionWithConfiguration_clientProxy_cachesDirectory_options_reply_ argumentIndex:1 ofReply:1];
  v10 = (void *)sBgSessionClientInterface;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0), sel_credStorage_allCredentialsWithReply_, 0, 1);
  v15 = (void *)sBgSessionClientInterface;
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0), sel_credStorage_credentialsForProtectionSpace_reply_, 0, 1);
  v20 = (void *)sBgSessionClientInterface;
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0), sel_credStorage_getInitialCredentialDictionariesWithReply_, 0, 1);
  v25 = (void *)sBgSessionClientInterface;
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, v31, v32, objc_opt_class(), 0), sel_backgroundTask_didCompleteWithError_taskMetrics_info_reply_, 3, 0);
  v33 = (void *)sBgSessionClientInterface;
  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v34, "setWithObjects:", v35, v36, v37, objc_opt_class(), 0), sel_credStorage_getInitialCredentialDictionariesWithReply_, 1, 1);
  v38 = (void *)[(id)sBgSessionClientInterface classesForSelector:sel_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_ argumentIndex:2 ofReply:0];
  objc_msgSend((id)sBgSessionClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v38, "setByAddingObject:", objc_opt_class()), sel_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_, 2, 0);
  Class Class = objc_getClass("AVAssetVariant");
  if (Class) {
    objc_msgSend((id)sBgSessionClientInterface, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend((id)objc_msgSend((id)sBgSessionClientInterface, "classesForSelector:argumentIndex:ofReply:", sel_backgroundAVAssetDownloadTask_willDownloadVariants_reply_, 1, 0), "setByAddingObject:", Class), sel_backgroundAVAssetDownloadTask_willDownloadVariants_reply_, 1, 0);
  }
  v40 = (void *)[MEMORY[0x1E4F1CA48] array];
  Class v41 = objc_getClass("AVAssetDownloadConfiguration");
  if (v41) {
    [v40 addObject:v41];
  }
  if ([v40 count])
  {
    uint64_t v42 = objc_msgSend((id)objc_msgSend((id)sBgSessionInterface, "classesForSelector:argumentIndex:ofReply:", sel_avAssetDownloadTaskWithDownloadToken_URL_destinationURL_temporaryDestinationURL_assetTitle_assetArtworkData_options_assetOptions_identifier_uniqueIdentifier_taskKind_enableSPIDelegateCallbacks_reply_, 6, 0), "setByAddingObjectsFromArray:", v40);
    [(id)sBgSessionInterface setClasses:v42 forSelector:sel_avAssetDownloadTaskWithDownloadToken_URL_destinationURL_temporaryDestinationURL_assetTitle_assetArtworkData_options_assetOptions_identifier_uniqueIdentifier_taskKind_enableSPIDelegateCallbacks_reply_ argumentIndex:6 ofReply:0];
  }
  v43 = (void *)sBgSessionInterface;
  v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  objc_msgSend(v43, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v44, "setWithObjects:", v45, v46, v47, objc_opt_class(), 0), sel_uploadTaskWithRequest_originalRequest_fromFile_sandboxExtensionData_identifier_uniqueIdentifier_potentialCredentials_reply_, 6, 0);
  v48 = (void *)sBgSessionInterface;
  v49 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v49, "setWithObjects:", v50, v51, v52, objc_opt_class(), 0), sel_uploadTaskWithResumableUploadState_request_originalRequest_fromFile_sandboxExtensionData_identifier_uniqueIdentifier_potentialCredentials_reply_, 7, 0);
  v53 = (void *)sBgSessionInterface;
  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  objc_msgSend(v53, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v54, "setWithObjects:", v55, v56, v57, v58, v59, v60, v61, v62, objc_opt_class(), 0), sel_resumeTaskWithIdentifier_withProperties_, 1, 0);
}

@end