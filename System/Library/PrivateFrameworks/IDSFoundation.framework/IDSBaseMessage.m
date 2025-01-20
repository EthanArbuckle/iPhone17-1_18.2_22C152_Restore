@interface IDSBaseMessage
- (BOOL)_usingOutgoingPush;
- (BOOL)allowDualDelivery;
- (BOOL)allowsServerProvidedLenientAnisetteTimeout;
- (BOOL)forceCellular;
- (BOOL)hasAttemptedAPSDelivery;
- (BOOL)hasReceivedPushAck;
- (BOOL)hasRequiredKeys:(id *)a3;
- (BOOL)highPriority;
- (BOOL)httpDoNotDecodeData;
- (BOOL)ignoreMaxRetryCount;
- (BOOL)ignorePushSigHeaders;
- (BOOL)ignoresNetworkConnectivity;
- (BOOL)isIDSMessage;
- (BOOL)isMMLMessage;
- (BOOL)isMultipleAuthCertCapable;
- (BOOL)isValidMessage;
- (BOOL)isWebTunnelMessage;
- (BOOL)payloadCanBeLogged;
- (BOOL)requiresPushTokenKeys;
- (BOOL)ultraConstrainedAllowed;
- (BOOL)wantsAPSRetries;
- (BOOL)wantsBAASigning;
- (BOOL)wantsBagKey;
- (BOOL)wantsBinaryPush;
- (BOOL)wantsBodySignature;
- (BOOL)wantsBodySigningOnly;
- (BOOL)wantsCFNetworkTimeout;
- (BOOL)wantsClientInfo;
- (BOOL)wantsCompressedBody;
- (BOOL)wantsCustomRetryInterval;
- (BOOL)wantsExtraTimeoutRetry;
- (BOOL)wantsGZip;
- (BOOL)wantsHTTPGet;
- (BOOL)wantsHTTPHeaders;
- (BOOL)wantsIDSServer;
- (BOOL)wantsIDSSignatures;
- (BOOL)wantsIntegerUniqueIDs;
- (BOOL)wantsJSONBody;
- (BOOL)wantsManagedRetries;
- (BOOL)wantsMultipleResponses;
- (BOOL)wantsPushSignatures;
- (BOOL)wantsResponse;
- (BOOL)wantsSignature;
- (BOOL)wantsStatusCodeBasedRetries;
- (BOOL)wantsUDID;
- (BOOL)wantsUserAgentInHeaders;
- (IDSBaseMessage)init;
- (IDSBaseMessageSigningSession)signingSession;
- (NSArray)requiredKeys;
- (NSData)IDCertificate;
- (NSData)pushCertificate;
- (NSData)pushToken;
- (NSData)serviceData;
- (NSDate)creationDate;
- (NSDate)requestEnd;
- (NSDate)requestStart;
- (NSDate)responseReceived;
- (NSDictionary)_cachedBody;
- (NSDictionary)additionalMessageHeaders;
- (NSDictionary)additionalMessageHeadersForOutgoingPush;
- (NSDictionary)additionalQueryStringParameters;
- (NSDictionary)clientInfo;
- (NSDictionary)messageBody;
- (NSDictionary)messageBodyUsingCache;
- (NSDictionary)nonStandardMessageHeadersForOutgoingPush;
- (NSDictionary)responseAlertInfo;
- (NSDictionary)userInfo;
- (NSError)baaSigningError;
- (NSMutableArray)certDataArray;
- (NSMutableArray)privateKeyArray;
- (NSMutableArray)publicKeyArray;
- (NSMutableArray)userIDArray;
- (NSNumber)originalTimestamp;
- (NSNumber)pushAckTimestamp;
- (NSNumber)retryCount;
- (NSNumber)serverTimestamp;
- (NSNumber)serverTimestampReceivedDate;
- (NSString)baaSigningDigest;
- (NSString)bagKey;
- (NSString)dataUsageBundleIdentifier;
- (NSString)dsAuthID;
- (NSString)retryCountKey;
- (NSString)service;
- (NSString)splunkHint;
- (NSString)subService;
- (NSString)topic;
- (NSString)underlyingService;
- (NSString)uniqueIDString;
- (NSString)userAgentHeaderString;
- (NSURL)URLOverride;
- (__SecKey)identityPrivateKey;
- (__SecKey)identityPublicKey;
- (__SecKey)pushPrivateKey;
- (__SecKey)pushPublicKey;
- (double)anisetteHeadersTimeout;
- (double)customRetryInterval;
- (double)timeSent;
- (double)timeout;
- (id)completionBlock;
- (id)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deliveryAcknowledgementBlock;
- (id)messageBodyDataOverride;
- (id)overrideContentType;
- (id)parsedIDSMessageResult;
- (int)maxTimeoutRetries;
- (int)timeoutRetries;
- (int64_t)command;
- (int64_t)deliveryMechanism;
- (int64_t)importanceLevel;
- (int64_t)responseCommand;
- (unint64_t)receivedByteCount;
- (unint64_t)sentByteCount;
- (unint64_t)uniqueID;
- (void)_cacheBody;
- (void)_clearCache;
- (void)_setCachedBody:(id)a3;
- (void)_setUsingOutgoingPush:(BOOL)a3;
- (void)handleResponseDictionary:(id)a3;
- (void)setBaaSigningDigest:(id)a3;
- (void)setBaaSigningError:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContext:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDSAuthID:(id)a3;
- (void)setDeliveryAcknowledgementBlock:(id)a3;
- (void)setDeliveryMechanism:(int64_t)a3;
- (void)setForceCellular:(BOOL)a3;
- (void)setHasAttemptedAPSDelivery:(BOOL)a3;
- (void)setHasReceivedPushAck:(BOOL)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setHttpDoNotDecodeData:(BOOL)a3;
- (void)setIgnoreMaxRetryCount:(BOOL)a3;
- (void)setImportanceLevel:(int64_t)a3;
- (void)setIsMultipleAuthCertCapable:(BOOL)a3;
- (void)setOriginalTimestamp:(id)a3;
- (void)setPushAckTimestamp:(id)a3;
- (void)setReceivedByteCount:(unint64_t)a3;
- (void)setRequestEnd:(id)a3;
- (void)setRequestStart:(id)a3;
- (void)setResponseAlertInfo:(id)a3;
- (void)setResponseReceived:(id)a3;
- (void)setRetryCount:(id)a3;
- (void)setSentByteCount:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setServiceData:(id)a3;
- (void)setSigningSession:(id)a3;
- (void)setSplunkHint:(id)a3;
- (void)setSubService:(id)a3;
- (void)setTimeSent:(double)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutRetries:(int)a3;
- (void)setTopic:(id)a3;
- (void)setURLOverride:(id)a3;
- (void)setUnderlyingService:(id)a3;
- (void)setUniqueID:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setWantsBinaryPush:(BOOL)a3;
- (void)setWantsIntegerUniqueIDs:(BOOL)a3;
- (void)setWantsMultipleResponses:(BOOL)a3;
- (void)setWantsPushSignatures:(BOOL)a3;
- (void)setWantsResponse:(BOOL)a3;
@end

@implementation IDSBaseMessage

- (IDSBaseMessage)init
{
  v14.receiver = self;
  v14.super_class = (Class)IDSBaseMessage;
  v2 = [(IDSBaseMessage *)&v14 init];
  if (v2)
  {
    v2->_uniqueID = FastRandomUInt();
    v6 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v3, v4, v5);
    objc_msgSend_setCreationDate_(v2, v7, (uint64_t)v6, v8);

    objc_msgSend_setTimeout_(v2, v9, v10, 20.0);
    objc_msgSend_setHighPriority_(v2, v11, 1, v12);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  double v8 = objc_msgSend_dsAuthID(self, v5, v6, v7);
  objc_msgSend_setDSAuthID_(v4, v9, (uint64_t)v8, v10);

  objc_super v14 = objc_msgSend_topic(self, v11, v12, v13);
  objc_msgSend_setTopic_(v4, v15, (uint64_t)v14, v16);

  unsigned int v17 = FastRandomUInt();
  objc_msgSend_setUniqueID_(v4, v18, v17, v19);
  uint64_t v23 = objc_msgSend_forceCellular(self, v20, v21, v22);
  objc_msgSend_setForceCellular_(v4, v24, v23, v25);
  uint64_t v29 = objc_msgSend_timeoutRetries(self, v26, v27, v28);
  objc_msgSend_setTimeoutRetries_(v4, v30, v29, v31);
  uint64_t v35 = objc_msgSend_highPriority(self, v32, v33, v34);
  objc_msgSend_setHighPriority_(v4, v36, v35, v37);
  v41 = objc_msgSend_userInfo(self, v38, v39, v40);
  objc_msgSend_setUserInfo_(v4, v42, (uint64_t)v41, v43);

  v47 = objc_msgSend_serviceData(self, v44, v45, v46);
  objc_msgSend_setServiceData_(v4, v48, (uint64_t)v47, v49);

  v53 = objc_msgSend_clientInfo(self, v50, v51, v52);
  objc_msgSend_setClientInfo_(v4, v54, (uint64_t)v53, v55);

  uint64_t v59 = objc_msgSend_wantsResponse(self, v56, v57, v58);
  objc_msgSend_setWantsResponse_(v4, v60, v59, v61);
  uint64_t v65 = objc_msgSend_wantsMultipleResponses(self, v62, v63, v64);
  objc_msgSend_setWantsMultipleResponses_(v4, v66, v65, v67);
  uint64_t v71 = objc_msgSend_httpDoNotDecodeData(self, v68, v69, v70);
  objc_msgSend_setHttpDoNotDecodeData_(v4, v72, v71, v73);
  uint64_t v77 = objc_msgSend_wantsBinaryPush(self, v74, v75, v76);
  objc_msgSend_setWantsBinaryPush_(v4, v78, v77, v79);
  uint64_t v83 = objc_msgSend_wantsIntegerUniqueIDs(self, v80, v81, v82);
  objc_msgSend_setWantsIntegerUniqueIDs_(v4, v84, v83, v85);
  v89 = objc_msgSend_creationDate(self, v86, v87, v88);
  objc_msgSend_setCreationDate_(v4, v90, (uint64_t)v89, v91);

  v95 = objc_msgSend_context(self, v92, v93, v94);
  objc_msgSend_setContext_(v4, v96, (uint64_t)v95, v97);

  objc_msgSend_timeSent(self, v98, v99, v100);
  objc_msgSend_setTimeSent_(v4, v101, v102, v103);
  v107 = objc_msgSend_completionBlock(self, v104, v105, v106);
  objc_msgSend_setCompletionBlock_(v4, v108, (uint64_t)v107, v109);

  v113 = objc_msgSend_deliveryAcknowledgementBlock(self, v110, v111, v112);
  objc_msgSend_setDeliveryAcknowledgementBlock_(v4, v114, (uint64_t)v113, v115);

  objc_msgSend_timeout(self, v116, v117, v118);
  objc_msgSend_setTimeout_(v4, v119, v120, v121);
  v125 = objc_msgSend_responseAlertInfo(self, v122, v123, v124);
  objc_msgSend_setResponseAlertInfo_(v4, v126, (uint64_t)v125, v127);

  v131 = objc_msgSend_retryCount(self, v128, v129, v130);
  objc_msgSend_setRetryCount_(v4, v132, (uint64_t)v131, v133);

  v137 = objc_msgSend_originalTimestamp(self, v134, v135, v136);
  objc_msgSend_setOriginalTimestamp_(v4, v138, (uint64_t)v137, v139);

  uint64_t v143 = objc_msgSend_importanceLevel(self, v140, v141, v142);
  objc_msgSend_setImportanceLevel_(v4, v144, v143, v145);
  uint64_t v149 = objc_msgSend_deliveryMechanism(self, v146, v147, v148);
  objc_msgSend_setDeliveryMechanism_(v4, v150, v149, v151);
  v155 = objc_msgSend_service(self, v152, v153, v154);
  objc_msgSend_setService_(v4, v156, (uint64_t)v155, v157);

  v161 = objc_msgSend_subService(self, v158, v159, v160);
  objc_msgSend_setSubService_(v4, v162, (uint64_t)v161, v163);

  v167 = objc_msgSend_underlyingService(self, v164, v165, v166);
  objc_msgSend_setUnderlyingService_(v4, v168, (uint64_t)v167, v169);

  uint64_t hasAttemptedAPSDelivery = objc_msgSend_hasAttemptedAPSDelivery(self, v170, v171, v172);
  objc_msgSend_setHasAttemptedAPSDelivery_(v4, v174, hasAttemptedAPSDelivery, v175);
  v179 = objc_msgSend_signingSession(self, v176, v177, v178);
  objc_msgSend_setSigningSession_(v4, v180, (uint64_t)v179, v181);

  v185 = objc_msgSend_URLOverride(self, v182, v183, v184);
  objc_msgSend_setURLOverride_(v4, v186, (uint64_t)v185, v187);

  uint64_t v191 = objc_msgSend_ignoreMaxRetryCount(self, v188, v189, v190);
  objc_msgSend_setIgnoreMaxRetryCount_(v4, v192, v191, v193);
  v197 = objc_msgSend_pushAckTimestamp(self, v194, v195, v196);
  objc_msgSend_setPushAckTimestamp_(v4, v198, (uint64_t)v197, v199);

  v203 = objc_msgSend_baaSigningDigest(self, v200, v201, v202);
  objc_msgSend_setBaaSigningDigest_(v4, v204, (uint64_t)v203, v205);

  v209 = objc_msgSend_baaSigningError(self, v206, v207, v208);
  objc_msgSend_setBaaSigningError_(v4, v210, (uint64_t)v209, v211);

  v215 = objc_msgSend_splunkHint(self, v212, v213, v214);
  objc_msgSend_setSplunkHint_(v4, v216, (uint64_t)v215, v217);

  v221 = objc_msgSend_requestStart(self, v218, v219, v220);
  objc_msgSend_setRequestStart_(v4, v222, (uint64_t)v221, v223);

  v227 = objc_msgSend_requestEnd(self, v224, v225, v226);
  objc_msgSend_setRequestEnd_(v4, v228, (uint64_t)v227, v229);

  return v4;
}

- (NSString)uniqueIDString
{
  id v4 = NSNumber;
  uint64_t v5 = objc_msgSend_uniqueID(self, a2, v2, v3);
  double v8 = objc_msgSend_numberWithUnsignedLongLong_(v4, v6, v5, v7);
  uint64_t v12 = objc_msgSend_stringValue(v8, v9, v10, v11);

  return (NSString *)v12;
}

- (BOOL)wantsIDSServer
{
  return 1;
}

- (BOOL)wantsCompressedBody
{
  return 0;
}

- (BOOL)wantsJSONBody
{
  return 0;
}

- (BOOL)wantsHTTPHeaders
{
  return 0;
}

- (BOOL)wantsHTTPGet
{
  return 0;
}

- (BOOL)allowDualDelivery
{
  return 0;
}

- (BOOL)wantsBagKey
{
  return 0;
}

- (BOOL)wantsCFNetworkTimeout
{
  return 0;
}

- (int)maxTimeoutRetries
{
  return 0;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 0;
}

- (BOOL)wantsManagedRetries
{
  return 1;
}

- (BOOL)wantsAPSRetries
{
  return 0;
}

- (double)anisetteHeadersTimeout
{
  return -1.0;
}

- (BOOL)allowsServerProvidedLenientAnisetteTimeout
{
  return 0;
}

- (BOOL)ignoresNetworkConnectivity
{
  return 0;
}

- (BOOL)wantsSignature
{
  return 0;
}

- (BOOL)isWebTunnelMessage
{
  return 0;
}

- (BOOL)wantsBodySignature
{
  return 0;
}

- (BOOL)wantsBAASigning
{
  return 0;
}

- (BOOL)wantsIDSSignatures
{
  return 1;
}

- (BOOL)wantsCustomRetryInterval
{
  return 0;
}

- (double)customRetryInterval
{
  return 0.0;
}

- (NSString)dataUsageBundleIdentifier
{
  return 0;
}

- (id)messageBodyDataOverride
{
  return 0;
}

- (BOOL)isIDSMessage
{
  return 1;
}

- (BOOL)isMMLMessage
{
  return 0;
}

- (BOOL)wantsStatusCodeBasedRetries
{
  return 1;
}

- (BOOL)ultraConstrainedAllowed
{
  return 0;
}

- (BOOL)payloadCanBeLogged
{
  return 1;
}

- (BOOL)isValidMessage
{
  return 1;
}

- (NSDictionary)messageBodyUsingCache
{
  objc_msgSend__cacheBody(self, a2, v2, v3);
  cachedBody = self->_cachedBody;
  if (cachedBody)
  {
    v9 = cachedBody;
  }
  else
  {
    objc_msgSend_messageBody(self, v5, v6, v7);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (void)_cacheBody
{
  if (!self->_cachedBody)
  {
    objc_msgSend_messageBody(self, a2, v2, v3);
    uint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    cachedBody = self->_cachedBody;
    self->_cachedBody = v5;
  }
}

- (void)_clearCache
{
  cachedBody = self->_cachedBody;
  self->_cachedBody = 0;
}

- (void)setRetryCount:(id)a3
{
  uint64_t v5 = (NSNumber *)a3;
  if (self->_retryCount != v5)
  {
    v9 = v5;
    objc_msgSend__clearCache(self, v6, v7, v8);
    objc_storeStrong((id *)&self->_retryCount, a3);
    uint64_t v5 = v9;
  }
}

- (__SecKey)pushPrivateKey
{
  return 0;
}

- (__SecKey)pushPublicKey
{
  return 0;
}

- (NSData)pushCertificate
{
  return 0;
}

- (NSData)pushToken
{
  return 0;
}

- (BOOL)isMultipleAuthCertCapable
{
  return 0;
}

- (NSMutableArray)certDataArray
{
  return 0;
}

- (NSMutableArray)publicKeyArray
{
  return 0;
}

- (NSMutableArray)privateKeyArray
{
  return 0;
}

- (NSMutableArray)userIDArray
{
  return 0;
}

- (__SecKey)identityPrivateKey
{
  return 0;
}

- (__SecKey)identityPublicKey
{
  return 0;
}

- (NSData)IDCertificate
{
  return 0;
}

- (NSNumber)serverTimestamp
{
  return 0;
}

- (NSNumber)serverTimestampReceivedDate
{
  return 0;
}

- (id)overrideContentType
{
  return 0;
}

- (id)parsedIDSMessageResult
{
  return 0;
}

- (BOOL)wantsGZip
{
  return 1;
}

- (BOOL)wantsClientInfo
{
  return 0;
}

- (BOOL)wantsUDID
{
  return 0;
}

- (BOOL)wantsBodySigningOnly
{
  return 0;
}

- (BOOL)ignorePushSigHeaders
{
  return 0;
}

- (BOOL)hasRequiredKeys:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_requiresPushTokenKeys(self, a2, (uint64_t)a3, v3)
    && (objc_msgSend_pushToken(self, v5, v6, v7),
        double v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = objc_msgSend_length(v8, v9, v10, v11),
        v8,
        !v12))
  {
    if (a3)
    {
      objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v5, @"push token", v7);
      BOOL v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v39 = objc_msgSend_requiredKeys(self, v5, v6, v7);
    if (objc_msgSend_count(v39, v13, v14, v15))
    {
      double v19 = objc_msgSend_messageBodyUsingCache(self, v16, v17, v18);
      v20 = self;
      id v21 = v39;
      id v22 = v19;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v21;
      id v25 = 0;
      BOOL v26 = 1;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v41, v24, v49, 16);
      if (v28)
      {
        uint64_t v29 = *(void *)v42;
        uint64_t v30 = 138412546;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v32 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v33 = objc_msgSend_objectForKey_(v22, v27, v32, *(double *)&v30);
            if (!v33)
            {
              double v34 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v46 = v32;
                __int16 v47 = 2112;
                v48 = v20;
                _os_log_impl(&dword_19D9BE000, v34, OS_LOG_TYPE_DEFAULT, "Missing message key: %@   (Message: %@)", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog()) {
                  MarcoLog();
                }
                if (IMShouldLog()) {
                  IMLogString();
                }
              }
              if (_IMWillLog()) {
                _IMAlwaysLog();
              }
              if (MarcoShouldLogCheckpoints()) {
                MarcoNoteCheckpoint();
              }
              _IMWarn();
              if (!v25) {
                id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              objc_msgSend_addObject_(v25, v35, v32, v36, v32, v20);
              BOOL v26 = 0;
            }
          }
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v41, *(double *)&v30, v49, 16);
        }
        while (v28);
      }

      if (a3) {
        *a3 = v25;
      }
    }
    else
    {
      BOOL v26 = 1;
    }
  }
  return v26;
}

- (NSArray)requiredKeys
{
  return (NSArray *)objc_msgSend_array(MEMORY[0x1E4F1C978], a2, v2, v3);
}

- (BOOL)requiresPushTokenKeys
{
  return 0;
}

- (BOOL)wantsUserAgentInHeaders
{
  return 1;
}

- (NSString)userAgentHeaderString
{
  return (NSString *)@"User-Agent";
}

- (int64_t)command
{
  return 0;
}

- (int64_t)responseCommand
{
  return 0;
}

- (NSString)bagKey
{
  return (NSString *)&stru_1EEFDAD58;
}

- (NSString)retryCountKey
{
  return (NSString *)@"rc";
}

- (NSDictionary)additionalMessageHeaders
{
  return 0;
}

- (NSDictionary)additionalQueryStringParameters
{
  return 0;
}

- (NSDictionary)additionalMessageHeadersForOutgoingPush
{
  return 0;
}

- (NSDictionary)nonStandardMessageHeadersForOutgoingPush
{
  return 0;
}

- (NSDictionary)messageBody
{
  double v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v7 = objc_msgSend_serviceData(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"service-data", v7);
  }

  double v11 = objc_msgSend_clientInfo(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"client-data", v11);
  }

  uint64_t v17 = objc_msgSend_retryCount(self, v12, v13, v14);
  if (v17)
  {
    double v19 = (const void *)objc_msgSend_retryCountKey(self, v15, v16, v18);
    CFDictionarySetValue(v3, v19, v17);
  }

  uint64_t v23 = objc_msgSend_originalTimestamp(self, v20, v21, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"oe", v23);
  }

  if ((objc_msgSend_wantsResponse(self, v24, v25, v26) & 1) == 0) {
    CFDictionarySetValue(v3, @"nr", &unk_1EF028DC8);
  }
  return (NSDictionary *)v3;
}

- (void)handleResponseDictionary:(id)a3
{
  objc_msgSend_objectForKey_(a3, a2, @"alert", v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseAlertInfo_(self, v5, (uint64_t)v7, v6);
}

- (BOOL)_usingOutgoingPush
{
  return self->_usingOutgoingPush;
}

- (void)_setUsingOutgoingPush:(BOOL)a3
{
  self->_usingOutgoingPush = a3;
}

- (NSDictionary)_cachedBody
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)_setCachedBody:(id)a3
{
}

- (unint64_t)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(unint64_t)a3
{
  self->_uniqueID = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeSent
{
  return self->_timeSent;
}

- (void)setTimeSent:(double)a3
{
  self->_timeSent = a3;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)deliveryAcknowledgementBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setDeliveryAcknowledgementBlock:(id)a3
{
}

- (NSString)topic
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTopic:(id)a3
{
}

- (BOOL)hasReceivedPushAck
{
  return self->_hasReceivedPushAck;
}

- (void)setHasReceivedPushAck:(BOOL)a3
{
  self->_hasReceivedPushAck = a3;
}

- (BOOL)hasAttemptedAPSDelivery
{
  return self->_hasAttemptedAPSDelivery;
}

- (void)setHasAttemptedAPSDelivery:(BOOL)a3
{
  self->_uint64_t hasAttemptedAPSDelivery = a3;
}

- (NSNumber)pushAckTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setPushAckTimestamp:(id)a3
{
}

- (int64_t)importanceLevel
{
  return self->_importanceLevel;
}

- (void)setImportanceLevel:(int64_t)a3
{
  self->_importanceLevel = a3;
}

- (int64_t)deliveryMechanism
{
  return self->_deliveryMechanism;
}

- (void)setDeliveryMechanism:(int64_t)a3
{
  self->_deliveryMechanism = a3;
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setService:(id)a3
{
}

- (NSString)subService
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSubService:(id)a3
{
}

- (NSString)underlyingService
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUnderlyingService:(id)a3
{
}

- (BOOL)forceCellular
{
  return self->_forceCellular;
}

- (void)setForceCellular:(BOOL)a3
{
  self->_forceCellular = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)wantsBinaryPush
{
  return self->_wantsBinaryPush;
}

- (void)setWantsBinaryPush:(BOOL)a3
{
  self->_wantsBinaryPush = a3;
}

- (BOOL)wantsIntegerUniqueIDs
{
  return self->_wantsIntegerUniqueIDs;
}

- (void)setWantsIntegerUniqueIDs:(BOOL)a3
{
  self->_wantsIntegerUniqueIDs = a3;
}

- (BOOL)wantsResponse
{
  return self->_wantsResponse;
}

- (void)setWantsResponse:(BOOL)a3
{
  self->_wantsResponse = a3;
}

- (BOOL)wantsMultipleResponses
{
  return self->_wantsMultipleResponses;
}

- (void)setWantsMultipleResponses:(BOOL)a3
{
  self->_wantsMultipleResponses = a3;
}

- (BOOL)httpDoNotDecodeData
{
  return self->_httpDoNotDecodeData;
}

- (void)setHttpDoNotDecodeData:(BOOL)a3
{
  self->_httpDoNotDecodeData = a3;
}

- (int)timeoutRetries
{
  return self->_timeoutRetries;
}

- (void)setTimeoutRetries:(int)a3
{
  self->_timeoutRetries = a3;
}

- (NSDictionary)responseAlertInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setResponseAlertInfo:(id)a3
{
}

- (BOOL)ignoreMaxRetryCount
{
  return self->_ignoreMaxRetryCount;
}

- (void)setIgnoreMaxRetryCount:(BOOL)a3
{
  self->_ignoreMaxRetryCount = a3;
}

- (BOOL)wantsPushSignatures
{
  return self->_wantsPushSignatures;
}

- (void)setWantsPushSignatures:(BOOL)a3
{
  self->_wantsPushSignatures = a3;
}

- (void)setIsMultipleAuthCertCapable:(BOOL)a3
{
  self->_isMultipleAuthCertCapable = a3;
}

- (IDSBaseMessageSigningSession)signingSession
{
  return self->_signingSession;
}

- (void)setSigningSession:(id)a3
{
}

- (NSString)baaSigningDigest
{
  return self->_baaSigningDigest;
}

- (void)setBaaSigningDigest:(id)a3
{
}

- (NSError)baaSigningError
{
  return self->_baaSigningError;
}

- (void)setBaaSigningError:(id)a3
{
}

- (NSString)splunkHint
{
  return self->_splunkHint;
}

- (void)setSplunkHint:(id)a3
{
}

- (NSString)dsAuthID
{
  return self->_dsAuthID;
}

- (void)setDSAuthID:(id)a3
{
}

- (NSData)serviceData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceData:(id)a3
{
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientInfo:(id)a3
{
}

- (NSNumber)retryCount
{
  return self->_retryCount;
}

- (NSURL)URLOverride
{
  return (NSURL *)objc_getProperty(self, a2, 200, 1);
}

- (void)setURLOverride:(id)a3
{
}

- (NSNumber)originalTimestamp
{
  return self->_originalTimestamp;
}

- (void)setOriginalTimestamp:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (id)context
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setContext:(id)a3
{
}

- (unint64_t)sentByteCount
{
  return self->_sentByteCount;
}

- (void)setSentByteCount:(unint64_t)a3
{
  self->_sentByteCount = a3;
}

- (unint64_t)receivedByteCount
{
  return self->_receivedByteCount;
}

- (void)setReceivedByteCount:(unint64_t)a3
{
  self->_receivedByteCount = a3;
}

- (NSDate)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(id)a3
{
}

- (NSDate)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(id)a3
{
}

- (NSDate)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseReceived, 0);
  objc_storeStrong((id *)&self->_requestEnd, 0);
  objc_storeStrong((id *)&self->_requestStart, 0);
  objc_storeStrong((id *)&self->_originalTimestamp, 0);
  objc_storeStrong((id *)&self->_splunkHint, 0);
  objc_storeStrong((id *)&self->_baaSigningError, 0);
  objc_storeStrong((id *)&self->_baaSigningDigest, 0);
  objc_storeStrong((id *)&self->_responseAlertInfo, 0);
  objc_storeStrong((id *)&self->_pushAckTimestamp, 0);
  objc_storeStrong((id *)&self->_URLOverride, 0);
  objc_storeStrong((id *)&self->_underlyingService, 0);
  objc_storeStrong((id *)&self->_subService, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong(&self->_deliveryAcknowledgementBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_dataUsageBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dsAuthID, 0);
  objc_storeStrong((id *)&self->_responseAlert, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_serviceData, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_cachedBody, 0);
}

@end