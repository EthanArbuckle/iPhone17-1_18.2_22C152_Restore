@interface ADSystemService
- (ADSystemService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (BOOL)isSystemService;
- (id)_systemDomains;
- (id)commandsForDomain:(id)a3;
- (id)controlCenterLockRestrictedCommands;
- (id)domains;
- (void)dealloc;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5;
@end

@implementation ADSystemService

- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  v8 = (void (**)(void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v9 = v7;
    id v10 = v12;
    v11 = +[ADCommandCenter sharedCommandCenter];
    [v11 _handleExtractSpeechDataCompleted:v10 inResponseTo:v9 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v174 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!self->_commandMap)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    self->_commandMap = Mutable;
    v14 = (const void *)objc_opt_class();
    CFDictionarySetValue(Mutable, v14, "_saCommandFailed:completion:");
    commandMap = self->_commandMap;
    v16 = (const void *)objc_opt_class();
    CFDictionarySetValue(commandMap, v16, "_saCommandIgnored:completion:");
    v17 = self->_commandMap;
    v18 = (const void *)objc_opt_class();
    CFDictionarySetValue(v17, v18, "_saSendCommands:completion:");
    v19 = self->_commandMap;
    v20 = (const void *)objc_opt_class();
    CFDictionarySetValue(v19, v20, "_saAssistantDestroyed:completion:");
    v21 = self->_commandMap;
    v22 = (const void *)objc_opt_class();
    CFDictionarySetValue(v21, v22, "_saCancelSucceeded:completion:");
    v23 = self->_commandMap;
    v24 = (const void *)objc_opt_class();
    CFDictionarySetValue(v23, v24, "_saRollbackSucceeded:completion:");
    v25 = self->_commandMap;
    v26 = (const void *)objc_opt_class();
    CFDictionarySetValue(v25, v26, "_saSetClientData:completion:");
    v27 = self->_commandMap;
    v28 = (const void *)objc_opt_class();
    CFDictionarySetValue(v27, v28, "_saSetHandoffPayload:completion:");
    v29 = self->_commandMap;
    v30 = (const void *)objc_opt_class();
    CFDictionarySetValue(v29, v30, "_saStartLocalRequest:completion:");
    v31 = self->_commandMap;
    v32 = (const void *)objc_opt_class();
    CFDictionarySetValue(v31, v32, "_saAddResultObjects:completion:");
    v33 = self->_commandMap;
    v34 = (const void *)objc_opt_class();
    CFDictionarySetValue(v33, v34, "_saExecuteCallbacks:completion:");
    v35 = self->_commandMap;
    v36 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v35, v36, "_saInitiateHandoffOnCompanion:completion:");
    v37 = self->_commandMap;
    v38 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v37, v38, "_saSetDeviceTTSMuteState:completion:");
    v39 = self->_commandMap;
    v40 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v39, v40, "_saPing:completion:");
    v41 = self->_commandMap;
    v42 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v41, v42, "_saWaitForCommands:completion:");
    v43 = self->_commandMap;
    v44 = (const void *)objc_opt_class();
    CFDictionarySetValue(v43, v44, "_saSyncGetAnchorsResponse:completion:");
    v45 = self->_commandMap;
    v46 = (const void *)objc_opt_class();
    CFDictionarySetValue(v45, v46, "_saSyncChunkDenied:completion:");
    v47 = self->_commandMap;
    v48 = (const void *)objc_opt_class();
    CFDictionarySetValue(v47, v48, "_saSyncChunkAccepted:completion:");
    v49 = self->_commandMap;
    v50 = (const void *)objc_opt_class();
    CFDictionarySetValue(v49, v50, "_saSASyncGetCachedSyncAnchors:completion:");
    v51 = self->_commandMap;
    v52 = (const void *)objc_opt_class();
    CFDictionarySetValue(v51, v52, "_saSyncGetAnchors:completion:");
    v53 = self->_commandMap;
    v54 = (const void *)objc_opt_class();
    CFDictionarySetValue(v53, v54, "_saSyncClientVerify:completion:");
    v55 = self->_commandMap;
    v56 = (const void *)objc_opt_class();
    CFDictionarySetValue(v55, v56, "_saSyncServerVerifyResponse:completion:");
    v57 = self->_commandMap;
    v58 = (const void *)objc_opt_class();
    CFDictionarySetValue(v57, v58, "_saSyncFinished:completion:");
    v59 = self->_commandMap;
    v60 = (const void *)objc_opt_class();
    CFDictionarySetValue(v59, v60, "_saDomainObjectCreate:completion:");
    v61 = self->_commandMap;
    v62 = (const void *)objc_opt_class();
    CFDictionarySetValue(v61, v62, "_saDomainObjectRetrieve:completion:");
    v63 = self->_commandMap;
    v64 = (const void *)objc_opt_class();
    CFDictionarySetValue(v63, v64, "_saDomainObjectUpdate:completion:");
    v65 = self->_commandMap;
    v66 = (const void *)objc_opt_class();
    CFDictionarySetValue(v65, v66, "_saDomainObjectCancel:completion:");
    v67 = self->_commandMap;
    v68 = (const void *)objc_opt_class();
    CFDictionarySetValue(v67, v68, "_saDomainObjectDelete:completion:");
    v69 = self->_commandMap;
    v70 = (const void *)objc_opt_class();
    CFDictionarySetValue(v69, v70, "_saDomainObjectCommit:completion:");
    v71 = self->_commandMap;
    v72 = (const void *)objc_opt_class();
    CFDictionarySetValue(v71, v72, "_saDomainObjectPunchOut:completion:");
    v73 = self->_commandMap;
    v74 = (const void *)objc_opt_class();
    CFDictionarySetValue(v73, v74, "_sasSpeechPartialResult:completion:");
    v75 = self->_commandMap;
    v76 = (const void *)objc_opt_class();
    CFDictionarySetValue(v75, v76, "_sasSpeechFailure:completion:");
    v77 = self->_commandMap;
    v78 = (const void *)objc_opt_class();
    CFDictionarySetValue(v77, v78, "_sasAbortSpeechRequest:completion:");
    v79 = self->_commandMap;
    v80 = (const void *)objc_opt_class();
    CFDictionarySetValue(v79, v80, "_saStructuredDictationResult:completion:");
    v81 = self->_commandMap;
    v82 = (const void *)objc_opt_class();
    CFDictionarySetValue(v81, v82, "_saStructuredDictationFailure:completion:");
    v83 = self->_commandMap;
    v84 = (const void *)objc_opt_class();
    CFDictionarySetValue(v83, v84, "_sasVoiceSearchPartialResult:completion:");
    v85 = self->_commandMap;
    v86 = (const void *)objc_opt_class();
    CFDictionarySetValue(v85, v86, "_sasVoiceSearchFinalResult:completion:");
    v87 = self->_commandMap;
    v88 = (const void *)objc_opt_class();
    CFDictionarySetValue(v87, v88, "_sasSuspendClientEndpointer:completion:");
    v89 = self->_commandMap;
    v90 = (const void *)objc_opt_class();
    CFDictionarySetValue(v89, v90, "_sasConfirmEndpoint:completion:");
    v91 = self->_commandMap;
    v92 = (const void *)objc_opt_class();
    CFDictionarySetValue(v91, v92, "_sasPronunciationRecognized:completion:");
    v93 = self->_commandMap;
    v94 = (const void *)objc_opt_class();
    CFDictionarySetValue(v93, v94, "_sasServerEndpointFeatures:completion:");
    v95 = self->_commandMap;
    v96 = (const void *)objc_opt_class();
    CFDictionarySetValue(v95, v96, "_sasClientBoundConfusionNetwork:completion:");
    v97 = self->_commandMap;
    v98 = (const void *)objc_opt_class();
    CFDictionarySetValue(v97, v98, "_saClientSetupInfo:completion:");
    v99 = self->_commandMap;
    v100 = (const void *)objc_opt_class();
    CFDictionarySetValue(v99, v100, "_sasResultCandidate:completion:");
    v101 = self->_commandMap;
    v102 = (const void *)objc_opt_class();
    CFDictionarySetValue(v101, v102, "_sasSpeechServerEndpointIdentified:completion:");
    v103 = self->_commandMap;
    v104 = (const void *)objc_opt_class();
    CFDictionarySetValue(v103, v104, "_sasVoiceIdentificationSignal:completion:");
    if ((AFIsHorseman() & 1) == 0)
    {
      v105 = self->_commandMap;
      v106 = (const void *)objc_opt_class();
      CFDictionarySetValue(v105, v106, "_saAcknowledgeAlert:completion:");
    }
    v107 = self->_commandMap;
    v108 = (const void *)objc_opt_class();
    CFDictionarySetValue(v107, v108, "_saDeviceConfiguration:completion:");
    v109 = self->_commandMap;
    v110 = (const void *)objc_opt_class();
    CFDictionarySetValue(v109, v110, "_saDeviceMyriadConfiguration:completion:");
    v111 = self->_commandMap;
    v112 = (const void *)objc_opt_class();
    CFDictionarySetValue(v111, v112, "_saSetLatencyDiagnosticConfiguration:completion:");
    v113 = self->_commandMap;
    v114 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v113, v114, "_saAIRequestSearch:completion:");
    v115 = self->_commandMap;
    v116 = (const void *)objc_opt_class();
    CFDictionarySetValue(v115, v116, "_saAISearchCompleted:completion:");
    v117 = self->_commandMap;
    v118 = (const void *)objc_opt_class();
    CFDictionarySetValue(v117, v118, "_saAIRetrySearch:completion:");
    v119 = self->_commandMap;
    v120 = (const void *)objc_opt_class();
    CFDictionarySetValue(v119, v120, "_saLogSignatureWithABC:completion:");
    v121 = self->_commandMap;
    v122 = (const void *)objc_opt_class();
    CFDictionarySetValue(v121, v122, "_saLogNumericEvent:completion:");
    v123 = self->_commandMap;
    v124 = (const void *)objc_opt_class();
    CFDictionarySetValue(v123, v124, "_saLogStringEvent:completion:");
    v125 = self->_commandMap;
    v126 = (const void *)objc_opt_class();
    CFDictionarySetValue(v125, v126, "_saPerformDataDetection:completion:");
    v127 = self->_commandMap;
    v128 = (const void *)objc_opt_class();
    CFDictionarySetValue(v127, v128, "_saStartUIRequest:completion:");
    v129 = self->_commandMap;
    v130 = (const void *)objc_opt_class();
    CFDictionarySetValue(v129, v130, "_saReplayRequestFromDMHypothesis:completion:");
    v131 = self->_commandMap;
    v132 = (const void *)objc_opt_class();
    CFDictionarySetValue(v131, v132, "_saTTSGetSpeechSynthesisVolume:completion:");
    v133 = self->_commandMap;
    v134 = (const void *)objc_opt_class();
    CFDictionarySetValue(v133, v134, "_saTTSSetSpeechSynthesisVolume:completion:");
    v135 = self->_commandMap;
    v136 = (const void *)objc_opt_class();
    CFDictionarySetValue(v135, v136, "_saNotificationSearch:completion:");
    v137 = self->_commandMap;
    v138 = (const void *)objc_opt_class();
    CFDictionarySetValue(v137, v138, "_saPerformRemoteAnnouncement:completion:");
    v139 = self->_commandMap;
    v140 = (const void *)objc_opt_class();
    CFDictionarySetValue(v139, v140, "_saDismissRemoteAnnouncement:completion:");
  }
  if (!self->_commandMapV2)
  {
    v141 = CFDictionaryCreateMutable(0, 0, 0, 0);
    self->_commandMapV2 = v141;
    v142 = (const void *)objc_opt_class();
    CFDictionarySetValue(v141, v142, "_saRequestCompleted:executionContext:completion:");
    commandMapV2 = self->_commandMapV2;
    v144 = (const void *)objc_opt_class();
    CFDictionarySetValue(commandMapV2, v144, "_saCancelCrossDeviceRequest:executionContext:completion:");
    v145 = self->_commandMapV2;
    v146 = (const void *)objc_opt_class();
    CFDictionarySetValue(v145, v146, "_saExecuteOnRemoteRequest:executionContext:completion:");
    v147 = self->_commandMapV2;
    v148 = (const void *)objc_opt_class();
    CFDictionarySetValue(v147, v148, "_sasSpeechRecognized:executionContext:completion:");
    v149 = self->_commandMapV2;
    v150 = (const void *)objc_opt_class();
    CFDictionarySetValue(v149, v150, "_sasSpeechMultilingualSpeechRecognized:executionContext:completion:");
    v151 = self->_commandMapV2;
    v152 = (const void *)objc_opt_class();
    CFDictionarySetValue(v151, v152, "_sasExtractSpeechData:executionContext:completion:");
    v153 = self->_commandMapV2;
    v154 = (const void *)objc_opt_class();
    CFDictionarySetValue(v153, v154, "_saQuickStop:executionContext:completion:");
    v155 = self->_commandMapV2;
    v156 = (const void *)objc_opt_class();
    CFDictionarySetValue(v155, v156, "_saGetRequestOrigin:executionContext:completion:");
    v157 = self->_commandMapV2;
    v158 = (const void *)objc_opt_class();
    CFDictionarySetValue(v157, v158, "_saGetAssistantData:executionContext:completion:");
    v159 = self->_commandMapV2;
    v160 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v159, v160, "_saPostPersonalDomainActivityNotification:executionContext:completion:");
    v161 = self->_commandMapV2;
    v162 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v161, v162, "_saPostCalendarActivityNotification:executionContext:completion:");
    v163 = self->_commandMapV2;
    v164 = (const void *)objc_opt_class();
    CFDictionaryAddValue(v163, v164, "_saPostUpdatePersonalRequestSettingsNotification:executionContext:completion:");
  }
  v165 = self->_commandMap;
  v166 = (const void *)objc_opt_class();
  Value = (const char *)CFDictionaryGetValue(v165, v166);
  if (Value)
  {
    v168 = Value;
    v169 = +[ADCommandCenter sharedCommandCenter];
    objc_msgSend(v169, v168, v174, v12);
  }
  else
  {
    v170 = self->_commandMapV2;
    v171 = (const void *)objc_opt_class();
    v172 = (const char *)CFDictionaryGetValue(v170, v171);
    v173 = +[ADCommandCenter sharedCommandCenter];
    v169 = v173;
    if (v172) {
      objc_msgSend(v173, v172, v174, v11, v12);
    }
    else {
      [v173 _saUnhandledObject:v174 completion:v12];
    }
  }
}

- (id)controlCenterLockRestrictedCommands
{
  return 0;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:SATTSGroupIdentifier])
  {
    if ([v6 isEqualToString:SATTSGetSpeechSynthesisVolumeClassIdentifier]) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = [v6 isEqualToString:SATTSSetSpeechSynthesisVolumeClassIdentifier];
    }
  }
  else
  {
    id v9 = [(ADSystemService *)self _systemDomains];
    unsigned __int8 v8 = [v9 containsObject:v7];
  }
  return v8;
}

- (id)commandsForDomain:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:SATTSGroupIdentifier])
  {
    v8[0] = SATTSGetSpeechSynthesisVolumeClassIdentifier;
    v8[1] = SATTSSetSpeechSynthesisVolumeClassIdentifier;
    v5 = +[NSArray arrayWithObjects:v8 count:2];
  }
  else
  {
    id v6 = [(ADSystemService *)self _systemDomains];
    if ([v6 containsObject:v4])
    {
      v5 = +[NSArray arrayWithObject:v4];
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)domains
{
  v2 = [(ADSystemService *)self _systemDomains];
  v3 = [v2 allObjects];

  return v3;
}

- (BOOL)isSystemService
{
  return 1;
}

- (id)_systemDomains
{
  if (qword_1005858B8 != -1) {
    dispatch_once(&qword_1005858B8, &stru_100500230);
  }
  v2 = (void *)qword_1005858B0;
  return v2;
}

- (void)dealloc
{
  commandMapV2 = self->_commandMapV2;
  if (commandMapV2) {
    CFRelease(commandMapV2);
  }
  commandMap = self->_commandMap;
  if (commandMap) {
    CFRelease(commandMap);
  }
  v5.receiver = self;
  v5.super_class = (Class)ADSystemService;
  [(ADSystemService *)&v5 dealloc];
}

- (ADSystemService)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADSystemService;
  v2 = [(ADSystemService *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ADService *)v2 setIdentifier:@"SystemService"];
  }
  return v3;
}

@end