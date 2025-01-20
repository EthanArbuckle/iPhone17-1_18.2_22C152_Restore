@interface IDSEncryptionComponent
- (BOOL)_shouldAutoBugCaptureForECError:(id)a3;
- (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3;
- (BOOL)shouldForwardErrorForEncryptionType:(int64_t)a3 forceECC:(BOOL)a4;
- (IDSEncryptionComponent)initWithEncryptionController:(id)a3 pinnedIdentityController:(id)a4;
- (id)runIndividuallyWithInput:(id)a3;
- (id)serviceController;
- (void)_shouldDisableEchnidaEncryption;
- (void)_shouldDisableEncryption:(id)a3 UserDefaultKey:(id)a4;
- (void)_shouldDisableSecondaryEncryption;
@end

@implementation IDSEncryptionComponent

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (IDSEncryptionComponent)initWithEncryptionController:(id)a3 pinnedIdentityController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSEncryptionComponent;
  v9 = [(IDSEncryptionComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_encryptionController, a3);
    objc_storeStrong((id *)&v10->_pinnedIdentityController, a4);
  }

  return v10;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  [(IDSEncryptionComponent *)self _shouldDisableSecondaryEncryption];
  [(IDSEncryptionComponent *)self _shouldDisableEchnidaEncryption];
  id v126 = objc_alloc_init((Class)NSMutableDictionary);
  v137 = [v4 dataToEncrypt];
  v120 = [v4 attributes];
  unsigned int v5 = [v4 isScheduled];
  uint64_t v6 = [v4 service];
  id v119 = objc_alloc_init((Class)NSMutableDictionary);
  v136 = self;
  id v7 = [(IDSEncryptionComponent *)self serviceController];
  v135 = (void *)v6;
  id v8 = [v7 serviceWithIdentifier:v6];

  v114 = v8;
  unsigned int v130 = [v8 requiresPinnedIdentity];
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  v141 = v4;
  id obj = [v4 endpoints];
  id v129 = [obj countByEnumeratingWithState:&v163 objects:v175 count:16];
  if (!v129) {
    goto LABEL_95;
  }
  uint64_t v127 = v5;
  uint64_t v128 = *(void *)v164;
  uint64_t v116 = IDSSendErrorDomain;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v164 != v128) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v163 + 1) + 8 * v9);
      if (v130
        && ![(IDSPinnedIdentityController *)v136->_pinnedIdentityController foundPersistedIdentityForEndpoint:*(void *)(*((void *)&v163 + 1) + 8 * v9) forService:v135])
      {
        id v110 = [objc_alloc((Class)NSError) initWithDomain:v116 code:39 userInfo:0];
        v109 = +[CUTUnsafePromise failedPromiseWithError:v110];

        goto LABEL_102;
      }
      uint64_t v139 = v9;
      uint64_t v162 = 2;
      v11 = [IDSCryptionContext alloc];
      objc_super v12 = [v141 guid];
      v13 = [v141 fromID];
      v14 = +[IDSURI URIWithPrefixedURI:v13];
      v15 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
      v16 = [v15 pushToken];
      v17 = +[IDSPushToken pushTokenWithData:v16];
      v18 = [v10 URI];
      v144 = v10;
      v19 = [v10 pushTokenObject];
      v20 = [(IDSCryptionContext *)v11 initWithGuid:v12 sendingURI:v14 sendingPushToken:v17 receivingURI:v18 receivingPushToken:v19 service:v135];

      v142 = v20;
      [(IDSCryptionContext *)v20 setMessageType:v127];
      if (!v137)
      {
        v27 = 0;
        id v143 = 0;
        id v25 = 0;
        v28 = 0;
        v29 = v144;
        goto LABEL_84;
      }
      id v21 = [v141 encryptionType];
      if ((unint64_t)v21 < 2)
      {
        encryptionController = v136->_encryptionController;
        id v158 = 0;
        id v159 = 0;
        v22 = v144;
        v24 = [(IDSEncryptionController *)encryptionController publicKeyEncryptData:v137 encryptionContext:v20 forceSizeOptimizations:0 resetState:0 withEncryptedAttributes:v120 toEndpoint:v144 usedEncryptionType:&v162 priority:300 metadata:&v159 error:&v158];
        id v143 = v159;
        id v25 = v158;
        goto LABEL_18;
      }
      v22 = v144;
      if (v21 == (id)3)
      {
        v31 = v136->_encryptionController;
        id v160 = 0;
        v24 = [(IDSEncryptionController *)v31 offGridKeyDistributionEncryptData:v137 encryptionContext:v20 toEndpoint:v144 priority:300 error:&v160];
        id v25 = v160;
        id v143 = 0;
        uint64_t v26 = 6;
        goto LABEL_16;
      }
      if (v21 == (id)2)
      {
        v23 = v136->_encryptionController;
        id v161 = 0;
        v24 = [(IDSEncryptionController *)v23 legacyPublicKeyEncryptData:v137 withEncryptedAttributes:v120 toEndpoint:v144 priority:300 error:&v161];
        id v25 = v161;
        id v143 = 0;
        uint64_t v26 = 1;
LABEL_16:
        uint64_t v162 = v26;
        goto LABEL_18;
      }
      id v143 = 0;
      id v25 = 0;
      v24 = 0;
LABEL_18:
      if ([v24 length]) {
        BOOL v32 = v25 == 0;
      }
      else {
        BOOL v32 = 0;
      }
      uint64_t v33 = v32;
      if (v32
        || !-[IDSEncryptionComponent shouldForwardErrorForEncryptionType:forceECC:](v136, "shouldForwardErrorForEncryptionType:forceECC:", v162, [v141 encryptionType] == (id)1))
      {
        if (v162 == 4)
        {
          uint64_t v140 = +[NSNumber numberWithBool:v33];
        }
        else
        {
          uint64_t v140 = 0;
        }
        v133 = v24;
        if ((v162 & 0xFFFFFFFFFFFFFFFELL) == 4)
        {
          uint64_t v134 = 0;
        }
        else
        {
          uint64_t v134 = +[NSNumber numberWithBool:v33];
        }
        int v138 = v33;
        uint64_t v51 = v162;
        if (v162 == 4) {
          v52 = v25;
        }
        else {
          v52 = 0;
        }
        id v50 = v52;
        if ((v51 & 0xFFFFFFFFFFFFFFFELL) == 4) {
          v49 = 0;
        }
        else {
          v49 = v25;
        }
        id v46 = v49;
      }
      else
      {
        v34 = +[IDSFoundationLog delivery];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [v141 guid];
          v36 = [v22 pushToken];
          v37 = [v22 URI];
          [v37 prefixedURI];
          v39 = id v38 = v25;
          v40 = v24;
          v41 = (void *)_IDSCopyIDForTokenWithURI();
          id v42 = v41;
          v43 = IDSEncryptionTypeStringFromEncryptionType();

          *(_DWORD *)buf = 138413058;
          uint64_t v168 = (uint64_t)v35;
          __int16 v169 = 2112;
          uint64_t v170 = (uint64_t)v41;
          v24 = v40;
          __int16 v171 = 2112;
          uint64_t v172 = (uint64_t)v43;
          __int16 v173 = 2112;
          id v174 = v38;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "GUID %@ Destination %@ Falling back to legacy encryption { encryptionType: %@, error: %@ }", buf, 0x2Au);

          id v25 = v38;
          v22 = v144;
        }
        v44 = v136->_encryptionController;
        id v157 = 0;
        v45 = [(IDSEncryptionController *)v44 legacyPublicKeyEncryptData:v137 withEncryptedAttributes:v120 toEndpoint:v22 priority:300 error:&v157];
        id v46 = v157;

        uint64_t v162 = 1;
        if ([v45 length]) {
          BOOL v47 = v46 == 0;
        }
        else {
          BOOL v47 = 0;
        }
        uint64_t v48 = v47;
        uint64_t v140 = +[NSNumber numberWithBool:0];
        int v138 = v48;
        +[NSNumber numberWithBool:v48];
        uint64_t v134 = v133 = v45;
        v49 = v25;
        id v50 = v25;
      }
      id v53 = v49;
      v132 = [v143 additionalEncryptionResult];
      v54 = [v132 objectForKey:&off_1009D1740];
      id v55 = v54;
      v56 = v55;
      if (![v55 code])
      {
        v57 = [v55 domain];
        unsigned int v58 = [v57 isEqualToString:@"com.apple.messageprotection"];

        v56 = v55;
        if (v58)
        {

          v56 = 0;
        }
      }
      v131 = v55;
      v59 = (void *)v140;
      if (v54)
      {
        uint64_t v60 = +[NSNumber numberWithBool:v56 == 0];
      }
      else
      {
        uint64_t v60 = 0;
      }
      v61 = +[IDSFoundationLog delivery];
      int v62 = v138;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v168 = v140;
        __int16 v169 = 2112;
        uint64_t v170 = v134;
        __int16 v171 = 2112;
        uint64_t v172 = v60;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Outgoing message - processing metrics { ECSuccess: %@, legacySuccess: %@, secondarySuccess: %@ }", buf, 0x20u);
      }

      if (+[IDSAutoBugCapture isSupported])
      {
        v63 = +[IDSMessageMetricReporter errorToReportForNGMError:v56];
        v124 = +[IDSMessageMetricReporter errorToReportForNGMError:v50];
        v122 = +[IDSMessageMetricReporter errorToReportForLegacyError:v46];
        if (!v138
          || (v64 = &stru_10099BE78,
              [(IDSEncryptionComponent *)v136 _shouldAutoBugCaptureForECError:v50]))
        {
          v117 = v63;
          if (v50 && v46)
          {
            id v65 = v25;
            v66 = [v124 domain];
            id v67 = v50;
            id v68 = [v124 code];
            v69 = [v122 domain];
            id v113 = v68;
            id v50 = v67;
            v22 = v144;
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"EC (%@:%ld) and Legacy (%@:%ld)", v66, v113, v69, [v122 code]);
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_67;
          }
          id v65 = v25;
          if (v50)
          {
            v66 = [v124 domain];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"EC (%@:%ld)", v66, [v124 code]);
LABEL_66:
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_67:
          }
          else
          {
            if (v46)
            {
              v66 = [v122 domain];
              +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Legacy (%@:%ld)", v66, [v122 code]);
              goto LABEL_66;
            }
            v70 = &stru_10099BE78;
          }
          v152[0] = _NSConcreteStackBlock;
          v152[1] = 3221225472;
          v152[2] = sub_100179B4C;
          v152[3] = &unk_1009841B0;
          v64 = v70;
          v153 = v64;
          id v154 = v50;
          id v155 = v46;
          id v156 = v56;
          +[IDSAutoBugCapture triggerCaptureWithEvent:100 context:v64 completion:v152];

          id v25 = v65;
          int v62 = v138;
          v63 = v117;
        }
        if (v56)
        {
          [v63 domain];
          v72 = id v71 = v25;
          v73 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Secondary (%@:%ld)", v72, [v63 code]);

          v147[0] = _NSConcreteStackBlock;
          v147[1] = 3221225472;
          v147[2] = sub_100179C1C;
          v147[3] = &unk_1009841B0;
          v74 = v73;
          int v62 = v138;
          v64 = v74;
          v148 = v74;
          id v149 = v50;
          id v150 = v46;
          id v151 = v56;
          id v25 = v71;
          +[IDSAutoBugCapture triggerCaptureWithEvent:104 context:v64 completion:v147];
        }
        v59 = (void *)v140;
      }
      if (v62)
      {
        v29 = v22;
        v75 = (void *)v60;
        v76 = v50;
        v77 = v46;
        v78 = (void *)v134;
        v79 = v75;
        if (v75 || v59 || !v134)
        {
          v27 = +[IDSMessageMetricReporter messageMetadataWithEndpoint:v29 secondarySuccess:v75 ECSuccess:v59 legacySuccess:v134 secondaryError:v56 ECError:v76 legacyError:v77];
          goto LABEL_82;
        }
        +[IDSMessageMetricReporter reportEncryptionSideMetricWithEndpoint:v29 secondarySuccess:0 ECSuccess:0 legacySuccess:v134 secondaryError:v56 ECError:v76 legacyError:v77];
      }
      else
      {
        id v125 = v50;
        v80 = +[IDSFoundationLog delivery];
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          v81 = [v141 guid];
          [v144 pushToken];
          v83 = id v82 = v25;
          v84 = [v144 URI];
          v85 = [v84 prefixedURI];
          v86 = (void *)_IDSCopyIDForTokenWithURI();
          uint64_t v118 = v60;
          id v123 = v46;
          id v87 = v86;
          v88 = IDSEncryptionTypeStringFromEncryptionType();

          *(_DWORD *)buf = 138413058;
          uint64_t v168 = (uint64_t)v81;
          __int16 v169 = 2112;
          uint64_t v170 = (uint64_t)v86;
          __int16 v171 = 2112;
          uint64_t v172 = (uint64_t)v88;
          __int16 v173 = 2112;
          id v174 = v82;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "GUID %@ Destination %@ Failed encryption type %@ with error %@", buf, 0x2Au);

          v59 = (void *)v140;
          int v62 = v138;

          id v25 = v82;
          uint64_t v60 = v118;

          id v46 = v123;
          v22 = v144;
        }

        id v112 = v46;
        v29 = v22;
        v89 = v22;
        uint64_t v90 = v60;
        v77 = v46;
        v78 = (void *)v134;
        v79 = (void *)v60;
        v76 = v125;
        +[IDSMessageMetricReporter reportEncryptionSideMetricWithEndpoint:v89 secondarySuccess:v90 ECSuccess:v59 legacySuccess:v134 secondaryError:v56 ECError:v125 legacyError:v112];
        id v91 = objc_alloc((Class)NSDictionary);
        v92 = +[NSString stringWithFormat:@"Failed encrypting message %@", v25];
        id v93 = objc_msgSend(v91, "initWithObjectsAndKeys:", v92, NSLocalizedDescriptionKey, v141, @"IDSPipelineParameter", 0);

        id v94 = [objc_alloc((Class)NSError) initWithDomain:v116 code:3 userInfo:v93];
        uint64_t v115 = +[CUTUnsafePromise failedPromiseWithError:v94];

        v59 = (void *)v140;
      }
      v27 = 0;
LABEL_82:

      if (!v62)
      {
        int v100 = 0;
        v28 = v133;
        goto LABEL_90;
      }
      v28 = v133;
LABEL_84:
      v95 = [IDSEncryptedData alloc];
      v96 = [(IDSEncryptedData *)v95 initWithData:v28 encryptionType:v162 payloadMetadata:v27];
      [v126 setObject:v96 forKey:v29];
      if (v96)
      {
        v97 = [v29 URI];
        v98 = [v29 pushTokenObject];
        v99 = [v97 URIByAddingPushToken:v98];

        if (v99) {
          [v119 setObject:v96 forKey:v99];
        }
      }
      int v100 = 1;
LABEL_90:

      if (!v100)
      {
        v109 = (void *)v115;
LABEL_102:

        v104 = v119;
        goto LABEL_103;
      }
      uint64_t v9 = v139 + 1;
    }
    while (v129 != (id)(v139 + 1));
    id v101 = [obj countByEnumeratingWithState:&v163 objects:v175 count:16];
    id v129 = v101;
  }
  while (v101);
LABEL_95:

  v102 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    v103 = [v141 guid];
    *(_DWORD *)buf = 138412290;
    uint64_t v168 = (uint64_t)v103;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "GUID %@ finished encryption", buf, 0xCu);
  }
  v104 = v119;
  if ([v119 count])
  {
    v105 = [v141 guid];
    id v106 = [v105 copy];

    [v119 debugDescription];
    v146 = v145 = v106;
    id v107 = v146;
    id v108 = v106;
    cut_dispatch_log_queue();

    v104 = v119;
  }
  [v141 setEndpointsToEncryptedData:v126];
  v109 = +[CUTUnsafePromise fulfilledPromiseWithValue:v141];
LABEL_103:

  return v109;
}

- (BOOL)shouldForwardErrorForEncryptionType:(int64_t)a3 forceECC:(BOOL)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4 && !a4;
}

- (BOOL)_shouldAutoBugCaptureForECError:(id)a3
{
  if (a3) {
    return !-[IDSEncryptionComponent _shouldIgnoreAutoBugCaptureForECFailure:](self, "_shouldIgnoreAutoBugCaptureForECFailure:");
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:IDSEncryptionErrorDomain]) {
    BOOL v5 = [v3 code] == (id)13;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_shouldDisableEncryption:(id)a3 UserDefaultKey:(id)a4
{
  id v10 = a4;
  id v5 = a3;
  uint64_t v6 = +[IDSServerBag sharedInstanceForBagType:1];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 BOOLValue];
      id v9 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ids"];
      if (v8 != [v9 BOOLForKey:v10]) {
        [v9 setBool:v8 forKey:v10];
      }
    }
  }
}

- (void)_shouldDisableSecondaryEncryption
{
}

- (void)_shouldDisableEchnidaEncryption
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedIdentityController, 0);

  objc_storeStrong((id *)&self->_encryptionController, 0);
}

@end