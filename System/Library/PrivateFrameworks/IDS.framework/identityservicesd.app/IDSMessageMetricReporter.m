@interface IDSMessageMetricReporter
+ (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3;
+ (BOOL)_shouldIgnoreAutoBugCaptureForLegacyFailure:(id)a3;
+ (BOOL)_shouldIgnoreMPError:(id)a3;
+ (id)_metadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9;
+ (id)errorToReportForLegacyError:(id)a3;
+ (id)errorToReportForNGMError:(id)a3;
+ (id)messageMetadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9;
+ (void)noteKeyGenerationForMetric;
+ (void)reportEncryptionSideMetricWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9;
+ (void)reportMessageMetricWithMetadata:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 command:(id)a7 decryptedEqual:(BOOL)a8 triedLastResort:(BOOL)a9 secondaryError:(id)a10 ECError:(id)a11 legacyError:(id)a12 fromDestination:(id)a13 fromToken:(id)a14 toToken:(id)a15;
@end

@implementation IDSMessageMetricReporter

+ (id)_metadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9
{
  id v14 = a3;
  id v35 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a5;
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 queryTimeInterval];
  if (v21 > 0.0)
  {
    [v14 queryTimeInterval];
    v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v20 setObject:v22 forKeyedSubscript:@"ids_querytime"];
  }
  v23 = +[FTDeviceSupport sharedInstance];
  v24 = [v23 productBuildVersion];
  [v20 setObject:v24 forKeyedSubscript:@"ids_build"];

  [v20 setObject:v19 forKeyedSubscript:@"ids_sender_EC_success"];
  if (v17)
  {
    v25 = +[IDSMessageMetricReporter errorToReportForNGMError:v17];

    v26 = [v25 domain];
    [v20 setObject:v26 forKeyedSubscript:@"ids_sender_EC_error_domain"];

    v27 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v25 code]);
    [v20 setObject:v27 forKeyedSubscript:@"ids_sender_EC_enc_error_code"];
  }
  [v20 setObject:v15 forKeyedSubscript:@"ids_sender_leg_success"];
  if (v18)
  {
    v28 = +[IDSMessageMetricReporter errorToReportForLegacyError:v18];

    v29 = [v28 domain];
    [v20 setObject:v29 forKeyedSubscript:@"ids_sender_leg_error_domain"];

    v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 code]);
    [v20 setObject:v30 forKeyedSubscript:@"ids_sender_leg_error_code"];
  }
  [v20 setObject:v35 forKeyedSubscript:@"ids_sender_secondary_success"];
  if (v16)
  {
    v31 = +[IDSMessageMetricReporter errorToReportForNGMError:v16];

    v32 = [v31 domain];
    [v20 setObject:v32 forKeyedSubscript:@"ids_sender_secondary_error_domain"];

    v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 code]);
    [v20 setObject:v33 forKeyedSubscript:@"ids_sender_secondary_enc_error_code"];
  }

  return v20;
}

+ (id)messageMetadataWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (CUTIsInternalInstall())
  {
    v22 = [a1 _metadataWithEndpoint:v15 secondarySuccess:v16 ECSuccess:v17 legacySuccess:v18 secondaryError:v19 ECError:v20 legacyError:v21];
    v23 = +[NSKeyedArchiver archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (void)reportEncryptionSideMetricWithEndpoint:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 secondaryError:(id)a7 ECError:(id)a8 legacyError:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = +[IMLockdownManager sharedInstance];
  unsigned int v23 = [v22 isInternalInstall];

  if (v23)
  {
    v24 = [a1 _metadataWithEndpoint:v15 secondarySuccess:v16 ECSuccess:v17 legacySuccess:v18 secondaryError:v19 ECError:v20 legacyError:v21];
    v25 = +[CUTReporting RTCSessionPromiseWithBatchingInterval:30.0];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10004C930;
    v27[3] = &unk_10097FCA8;
    id v28 = v24;
    id v26 = v24;
    [v25 registerResultBlock:v27];
  }
}

+ (void)reportMessageMetricWithMetadata:(id)a3 secondarySuccess:(id)a4 ECSuccess:(id)a5 legacySuccess:(id)a6 command:(id)a7 decryptedEqual:(BOOL)a8 triedLastResort:(BOOL)a9 secondaryError:(id)a10 ECError:(id)a11 legacyError:(id)a12 fromDestination:(id)a13 fromToken:(id)a14 toToken:(id)a15
{
  BOOL v78 = a8;
  id v87 = a3;
  id v88 = a4;
  id v19 = a5;
  id v20 = a6;
  id v81 = a7;
  id v84 = a10;
  id v86 = a11;
  id v85 = a12;
  id v80 = a13;
  id v83 = a14;
  id v82 = a15;
  id v21 = +[IMLockdownManager sharedInstance];
  unsigned int v22 = [v21 isInternalInstall];

  if (!v22) {
    goto LABEL_82;
  }
  id v23 = objc_alloc_init((Class)NSMutableDictionary);
  v24 = +[NSNumber numberWithBool:a9];
  [v23 setObject:v24 forKeyedSubscript:@"ids_tried_last_resort"];

  v25 = +[IMUserDefaults sharedDefaults];
  uint64_t v26 = [v25 appValueForKey:@"LastKeyGeneration"];
  v27 = (void *)v26;
  if (v26) {
    id v28 = (_UNKNOWN **)v26;
  }
  else {
    id v28 = &off_1009D0BB8;
  }
  [v23 setObject:v28 forKeyedSubscript:@"ids_lastgeneration"];

  if (v20) {
    [v23 setObject:v20 forKeyedSubscript:@"ids_recieved_leg_success"];
  }
  if (v19) {
    [v23 setObject:v19 forKeyedSubscript:@"ids_recieved_EC_success"];
  }
  if (v88) {
    [v23 setObject:v88 forKeyedSubscript:@"ids_recieved_secondary_success"];
  }
  if (v81) {
    [v23 setObject:v81 forKeyedSubscript:@"ids_msg_command"];
  }
  if (v19 && v20)
  {
    v29 = +[NSNumber numberWithBool:v78];
    [v23 setObject:v29 forKeyedSubscript:@"ids_decrypt_equal"];
  }
  if (v86)
  {
    v30 = +[IDSMessageMetricReporter errorToReportForNGMError:v86];
    v31 = [v30 domain];
    [v23 setObject:v31 forKeyedSubscript:@"ids_EC_error_domain"];

    v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 code]);
    [v23 setObject:v32 forKeyedSubscript:@"ids_EC_error_code"];

    v33 = [v30 domain];
    if ([v33 isEqualToString:IDSDecryptionErrorDomain])
    {
      id v34 = [v30 code];

      if (v34 != (id)13)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v35 = +[IDSRegistrationKeyManager sharedInstance];
      v33 = [v35 errorContainerToReport];

      v36 = [[IDSNGMKeyLoadingMetric alloc] initWithErrorContainer:v33 missingIdentity:1 missingPrekey:1];
      v37 = [(IDSNGMKeyLoadingMetric *)v36 dictionaryRepresentation];
      [v23 addEntriesFromDictionary:v37];
    }
    goto LABEL_21;
  }
LABEL_22:
  if (v85)
  {
    v38 = +[IDSMessageMetricReporter errorToReportForLegacyError:v85];
    v39 = [v38 domain];
    [v23 setObject:v39 forKeyedSubscript:@"ids_legacy_error_domain"];

    v40 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v38 code]);
    [v23 setObject:v40 forKeyedSubscript:@"ids_legacy_error_code"];
  }
  if (v84)
  {
    v41 = +[IDSMessageMetricReporter errorToReportForNGMError:v84];
    v42 = [v41 domain];
    [v23 setObject:v42 forKeyedSubscript:@"ids_secondary_error_domain"];

    v43 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 code]);
    [v23 setObject:v43 forKeyedSubscript:@"ids_secondary_error_code"];
  }
  if (v87)
  {
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    v47 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0);
    id v98 = 0;
    v48 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v47 fromData:v87 error:&v98];
    id v49 = v98;

    if (v49)
    {
      v50 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v100 = v49;
        __int16 v101 = 2112;
        id v102 = v87;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Failed to get payload metadata {payloadMetadataError: %@, payloadMetadataData: %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v74 = v49;
        id v75 = v87;
        _IDSLogV();
      }
    }
    if (v48)
    {
      [v23 addEntriesFromDictionary:v48];
    }
  }
  if (v83 && v82)
  {
    v51 = +[IMUserDefaults sharedDefaults];
    v52 = [v51 appValueForKey:@"ConversationSalt"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v53 = v52;
    }
    else
    {
      id v54 = [objc_alloc((Class)NSMutableData) initWithLength:32];
      arc4random_buf([v54 mutableBytes], 0x20uLL);
      id v53 = [v54 copy];

      if (v53)
      {
        v55 = +[IMUserDefaults sharedDefaults];
        [v55 setAppValue:v53 forKey:@"ConversationSalt"];
      }
    }
    if (v53)
    {
      id v56 = [v83 mutableCopy];
      [v56 appendData:v82];
      v57 = IDSSaltedHash();
      if (v57) {
        [v23 setObject:v57 forKeyedSubscript:@"ids_conversation_id"];
      }
    }
  }
  v58 = +[CUTReporting RTCSessionPromiseWithBatchingInterval:](CUTReporting, "RTCSessionPromiseWithBatchingInterval:", 30.0, v74, v75);
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_10004D72C;
  v96[3] = &unk_10097FCA8;
  id v59 = v23;
  id v97 = v59;
  [v58 registerResultBlock:v96];
  if (+[IDSAutoBugCapture isSupported])
  {
    if (v80)
    {
      v79 = +[NSSet setWithObject:](NSSet, "setWithObject:");
    }
    else
    {
      v79 = 0;
    }
    unsigned __int8 v60 = [v19 BOOLValue];
    unsigned __int8 v61 = [v20 BOOLValue];
    unsigned __int8 v62 = [v88 BOOLValue];
    if ((v19 == 0) | v60 & 1) {
      unsigned int v63 = 0;
    }
    else {
      unsigned int v63 = !+[IDSMessageMetricReporter _shouldIgnoreAutoBugCaptureForECFailure:v86];
    }
    if (v20) {
      char v64 = v61;
    }
    else {
      char v64 = 1;
    }
    if (v64) {
      unsigned int v65 = 0;
    }
    else {
      unsigned int v65 = !+[IDSMessageMetricReporter _shouldIgnoreAutoBugCaptureForLegacyFailure:v85];
    }
    if (v88) {
      char v66 = v62;
    }
    else {
      char v66 = 1;
    }
    if ((v63 | v65) == 1)
    {
      v67 = [v59 objectForKeyedSubscript:@"ids_EC_error_domain"];
      v77 = [v59 objectForKeyedSubscript:@"ids_EC_error_code"];
      v76 = [v59 objectForKeyedSubscript:@"ids_legacy_error_domain"];
      v68 = [v59 objectForKeyedSubscript:@"ids_legacy_error_code"];
      if ((v63 & v65) == 1)
      {
        v69 = +[NSString stringWithFormat:@"EC (%@:%@) and Legacy (%@:%@)", v67, v77, v76, v68];
      }
      else if (v63)
      {
        v69 = +[NSString stringWithFormat:@"EC (%@:%@)", v67, v77];
      }
      else if (v65)
      {
        v69 = +[NSString stringWithFormat:@"Legacy (%@:%@)", v76, v68];
      }
      else
      {
        v69 = 0;
      }
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_10004D8A4;
      v92[3] = &unk_10097FCD0;
      id v70 = v69;
      id v93 = v70;
      id v94 = v20;
      id v95 = v19;
      +[IDSAutoBugCapture triggerCaptureWithEvent:101 destinations:v79 context:v70 completion:v92];
    }
    else
    {
      id v70 = 0;
    }
    if ((v66 & 1) == 0)
    {
      v71 = [v59 objectForKeyedSubscript:@"ids_secondary_error_domain"];
      v72 = [v59 objectForKeyedSubscript:@"ids_secondary_error_code"];
      if (![v71 isEqualToString:@"com.apple.messageprotection"]
        || ([v72 isEqualToNumber:&off_1009D0BD0] & 1) == 0
        && ([v72 isEqualToNumber:&off_1009D0BE8] & 1) == 0)
      {
        v73 = +[NSString stringWithFormat:@"Secondary (%@:%@)", v71, v72];

        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_10004D9A8;
        v89[3] = &unk_10097FCF8;
        id v70 = v73;
        id v90 = v70;
        id v91 = v88;
        +[IDSAutoBugCapture triggerCaptureWithEvent:105 destinations:v79 context:v70 completion:v89];
      }
    }
  }
LABEL_82:
}

+ (id)errorToReportForNGMError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v5 = IDSDecryptionErrorDomain;
  if ([v4 isEqualToString:IDSDecryptionErrorDomain]
    && [v3 code] == (id)15)
  {
    goto LABEL_6;
  }
  v6 = [v3 domain];
  if ([v6 isEqualToString:IDSEncryptionErrorDomain]
    && [v3 code] == (id)15)
  {

LABEL_6:
LABEL_9:
    v9 = [v3 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v3;
    }
    id v13 = v12;
    goto LABEL_13;
  }
  v7 = [v3 domain];
  if ([v7 isEqualToString:v5])
  {
    id v8 = [v3 code];

    if (v8 == (id)2) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = [v3 domain];
  if ([v14 isEqualToString:v5])
  {
    id v15 = [v3 code];

    if (v15 == (id)12)
    {
      id v16 = [v3 userInfo];
      v9 = [v16 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (!v9)
      {
        id v13 = v3;
        goto LABEL_14;
      }
      v11 = [v9 userInfo];
      uint64_t v17 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];
      id v18 = (void *)v17;
      if (v17) {
        id v19 = (void *)v17;
      }
      else {
        id v19 = v9;
      }
      id v13 = v19;

LABEL_13:
LABEL_14:

      goto LABEL_25;
    }
  }
  else
  {
  }
  id v13 = v3;
LABEL_25:

  return v13;
}

+ (id)errorToReportForLegacyError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v5 = IDSDecryptionErrorDomain;
  if ([v4 isEqualToString:IDSDecryptionErrorDomain]
    && [v3 code] == (id)11)
  {
    goto LABEL_6;
  }
  v6 = [v3 domain];
  if ([v6 isEqualToString:IDSEncryptionErrorDomain]
    && [v3 code] == (id)10)
  {

LABEL_6:
LABEL_9:
    v9 = [v3 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v3;
    }
    id v13 = v12;
    goto LABEL_13;
  }
  v7 = [v3 domain];
  if ([v7 isEqualToString:v5])
  {
    id v8 = [v3 code];

    if (v8 == (id)2) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = [v3 domain];
  if ([v14 isEqualToString:v5])
  {
    id v15 = [v3 code];

    if (v15 == (id)9)
    {
      id v16 = [v3 userInfo];
      v9 = [v16 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (!v9)
      {
        id v13 = v3;
        goto LABEL_14;
      }
      v11 = [v9 userInfo];
      uint64_t v17 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];
      id v18 = (void *)v17;
      if (v17) {
        id v19 = (void *)v17;
      }
      else {
        id v19 = v9;
      }
      id v13 = v19;

LABEL_13:
LABEL_14:

      goto LABEL_25;
    }
  }
  else
  {
  }
  id v13 = v3;
LABEL_25:

  return v13;
}

+ (void)noteKeyGenerationForMetric
{
  id v4 = +[IMUserDefaults sharedDefaults];
  v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setAppValue:v3 forKey:@"LastKeyGeneration"];
}

+ (BOOL)_shouldIgnoreAutoBugCaptureForECFailure:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

  v7 = [v4 domain];
  if (![v7 isEqualToString:IDSDecryptionErrorDomain]) {
    goto LABEL_6;
  }
  if ([v4 code] != (id)14)
  {
    if ([v4 code] == (id)15)
    {
      unsigned __int8 v8 = [a1 _shouldIgnoreMPError:v6];
      goto LABEL_7;
    }
LABEL_6:
    unsigned __int8 v8 = 0;
    goto LABEL_7;
  }
  unsigned __int8 v8 = 1;
LABEL_7:

  return v8;
}

+ (BOOL)_shouldIgnoreMPError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"com.apple.messageprotection"]) {
    BOOL v5 = [v3 code] == (id)5 || objc_msgSend(v3, "code") == (id)801;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)_shouldIgnoreAutoBugCaptureForLegacyFailure:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:IDSDecryptionErrorDomain]) {
    BOOL v5 = [v3 code] == (id)5;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end