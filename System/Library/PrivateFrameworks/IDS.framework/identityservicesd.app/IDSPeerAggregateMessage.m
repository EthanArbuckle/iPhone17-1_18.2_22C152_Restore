@interface IDSPeerAggregateMessage
- (BOOL)addAggregatableMessage:(id)a3;
- (BOOL)expectingMoreResponses;
- (BOOL)fireAndForget;
- (BOOL)hasReceivedAPSDAck;
- (BOOL)hasSpaceForAggregatableMessage:(id)a3;
- (BOOL)isFinalMessage;
- (BOOL)removeAllAggregatableMessages;
- (IDSPeerAggregateMessage)init;
- (IDSPeerAggregateMessage)initWithHighPriority:(BOOL)a3;
- (IDSPeerAggregateMessage)initWithPeerMessage:(id)a3 service:(id)a4 fromIdentity:(id)a5 maxSize:(unint64_t)a6;
- (NSData)fromIdentity;
- (NSData)groupIdentifer;
- (NSData)groupPayload;
- (NSDate)expirationDate;
- (NSDictionary)additionalDictionary;
- (NSMutableSet)individualPeerMessages;
- (NSMutableSet)pendingResponseTokens;
- (NSNumber)chunkNumber;
- (NSNumber)deliveryMinimumTime;
- (NSNumber)deliveryMinimumTimeDelay;
- (NSNumber)priority;
- (NSString)encryptionType;
- (NSString)messageID;
- (NSString)sourcePeerID;
- (NSString)sourceShortHandle;
- (NSString)targetService;
- (id)_processMessageResponseForMessage:(id)a3 withError:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)currentSize;
- (int64_t)maxSize;
- (unint64_t)sizeOfKeysWithValues;
- (void)callAllAckBlocks;
- (void)callAllIndividualCompletionBlocksWithDeliveryContext:(id)a3;
- (void)clearAllPendingResponseTokens;
- (void)logFailureInfo;
- (void)noteResponseForToken:(id)a3;
- (void)setAdditionalDictionary:(id)a3;
- (void)setChunkNumber:(id)a3;
- (void)setCurrentSize:(int64_t)a3;
- (void)setDeliveryMinimumTime:(id)a3;
- (void)setDeliveryMinimumTimeDelay:(id)a3;
- (void)setEncryptionType:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setFromIdentity:(id)a3;
- (void)setGroupIdentifer:(id)a3;
- (void)setGroupPayload:(id)a3;
- (void)setHasReceivedAPSDAck:(BOOL)a3;
- (void)setIndividualPeerMessages:(id)a3;
- (void)setIsFinalMessage:(BOOL)a3;
- (void)setMaxSize:(int64_t)a3;
- (void)setMessageID:(id)a3;
- (void)setPendingResponseTokens:(id)a3;
- (void)setPriority:(id)a3;
- (void)setSourcePeerID:(id)a3;
- (void)setSourceShortHandle:(id)a3;
- (void)setTargetService:(id)a3;
@end

@implementation IDSPeerAggregateMessage

- (IDSPeerAggregateMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSPeerAggregateMessage;
  v2 = [(IDSPeerAggregateMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSPeerAggregateMessage *)v2 setWantsResponse:1];
  }
  return v3;
}

- (IDSPeerAggregateMessage)initWithHighPriority:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(IDSPeerAggregateMessage *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    [(IDSPeerAggregateMessage *)v4 setHighPriority:v3];
    if (!v3) {
      [(IDSPeerAggregateMessage *)v5 setTimeout:1200.0];
    }
    [(IDSPeerAggregateMessage *)v5 setChunkNumber:&off_1009D0CC0];
  }
  return v5;
}

- (IDSPeerAggregateMessage)initWithPeerMessage:(id)a3 service:(id)a4 fromIdentity:(id)a5 maxSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(IDSPeerAggregateMessage *)self init];
  if (v13)
  {
    -[IDSPeerAggregateMessage setHighPriority:](v13, "setHighPriority:", [v10 highPriority]);
    if ([(IDSPeerAggregateMessage *)v13 highPriority]) {
      [v10 timeout];
    }
    else {
      double v14 = 1200.0;
    }
    [(IDSPeerAggregateMessage *)v13 setTimeout:v14];
    v15 = [v10 sourcePeerID];
    [(IDSPeerAggregateMessage *)v13 setSourcePeerID:v15];

    v16 = [v10 sourceShortHandle];
    [(IDSPeerAggregateMessage *)v13 setSourceShortHandle:v16];

    v17 = [v10 messageID];
    [(IDSPeerAggregateMessage *)v13 setMessageID:v17];

    -[IDSPeerAggregateMessage setFireAndForget:](v13, "setFireAndForget:", [v10 fireAndForget]);
    -[IDSPeerAggregateMessage setHighPriority:](v13, "setHighPriority:", [v10 highPriority]);
    -[IDSPeerAggregateMessage setWantsResponse:](v13, "setWantsResponse:", [v10 wantsResponse]);
    v18 = [v10 topic];
    [(IDSPeerAggregateMessage *)v13 setTopic:v18];

    v19 = [v10 additionalDictionary];
    [(IDSPeerAggregateMessage *)v13 setAdditionalDictionary:v19];

    v20 = [v10 encryptionType];
    [(IDSPeerAggregateMessage *)v13 setEncryptionType:v20];

    v21 = [v10 expirationDate];
    [(IDSPeerAggregateMessage *)v13 setExpirationDate:v21];

    -[IDSPeerAggregateMessage setWantsMultipleResponses:](v13, "setWantsMultipleResponses:", [v10 wantsResponse]);
    [(IDSPeerAggregateMessage *)v13 setMaxSize:a6];
    v22 = [v10 originalTimestamp];
    [(IDSPeerAggregateMessage *)v13 setOriginalTimestamp:v22];

    v23 = [v10 priority];
    [(IDSPeerAggregateMessage *)v13 setPriority:v23];

    v24 = [v10 deliveryStatusContext];
    [(IDSPeerAggregateMessage *)v13 setDeliveryStatusContext:v24];

    v25 = [v10 userInfo];
    [(IDSPeerAggregateMessage *)v13 setUserInfo:v25];

    v26 = [v10 serviceData];
    [(IDSPeerAggregateMessage *)v13 setServiceData:v26];

    v27 = [v10 clientInfo];
    [(IDSPeerAggregateMessage *)v13 setClientInfo:v27];

    [(IDSPeerAggregateMessage *)v13 setChunkNumber:&off_1009D0CC0];
    [(IDSPeerAggregateMessage *)v13 setTargetService:v11];
    [(IDSPeerAggregateMessage *)v13 setFromIdentity:v12];
    -[IDSPeerAggregateMessage setIgnoreMaxRetryCount:](v13, "setIgnoreMaxRetryCount:", [v10 ignoreMaxRetryCount]);
    v28 = [v10 deliveryMinimumTimeDelay];
    [(IDSPeerAggregateMessage *)v13 setDeliveryMinimumTimeDelay:v28];

    v29 = [v10 deliveryMinimumTime];
    [(IDSPeerAggregateMessage *)v13 setDeliveryMinimumTime:v29];
  }
  return v13;
}

- (BOOL)hasSpaceForAggregatableMessage:(id)a3
{
  int64_t currentSize = self->_currentSize;
  return (unint64_t)[a3 sizeOfKeysWithValues] + currentSize <= self->_maxSize;
}

- (BOOL)addAggregatableMessage:(id)a3
{
  id v4 = a3;
  individualPeerMessages = self->_individualPeerMessages;
  if (!individualPeerMessages)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_individualPeerMessages;
    self->_individualPeerMessages = v6;

    individualPeerMessages = self->_individualPeerMessages;
  }
  [(NSMutableSet *)individualPeerMessages addObject:v4];
  if ([(IDSPeerAggregateMessage *)self wantsMultipleResponses])
  {
    pendingResponseTokens = self->_pendingResponseTokens;
    if (!pendingResponseTokens)
    {
      v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v10 = self->_pendingResponseTokens;
      self->_pendingResponseTokens = v9;

      pendingResponseTokens = self->_pendingResponseTokens;
    }
    id v11 = [v4 targetToken];
    [(NSMutableSet *)pendingResponseTokens addObject:v11];
  }
  int64_t currentSize = self->_currentSize;
  self->_int64_t currentSize = (int64_t)[v4 sizeOfKeysWithValues] + currentSize;

  return 1;
}

- (BOOL)removeAllAggregatableMessages
{
  return 1;
}

- (void)setGroupPayload:(id)a3
{
  objc_storeStrong((id *)&self->_groupPayload, a3);
  id v5 = a3;
  id v6 = [v5 length];

  self->_currentSize += (int64_t)v6;
}

- (void)setGroupIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifer, a3);
  id v5 = a3;
  id v6 = [v5 length];

  self->_currentSize += (int64_t)v6;
}

- (void)callAllIndividualCompletionBlocksWithDeliveryContext:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_individualPeerMessages;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "completionBlock", (void)v11);
        id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id))v10)[2](v10, v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)clearAllPendingResponseTokens
{
  BOOL v3 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithSet:self->_pendingResponseTokens];
  pendingResponseTokens = self->_pendingResponseTokens;
  self->_pendingResponseTokens = v3;

  id v5 = self->_pendingResponseTokens;

  [(NSMutableSet *)v5 removeAllObjects];
}

- (void)callAllAckBlocks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_individualPeerMessages;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "ackBlock", (void)v9);
        uint64_t v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, IDSPeerAggregateMessage *))v8)[2](v8, self);

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(IDSPeerAggregateMessage *)self setHasReceivedAPSDAck:1];
}

- (void)noteResponseForToken:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 responseToken];
    pendingResponseTokens = self->_pendingResponseTokens;
    *(_DWORD *)buf = 138412546;
    v44 = v6;
    __int16 v45 = 2112;
    v46 = pendingResponseTokens;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing token %@ from %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v34 = [v4 responseToken];
    v36 = self->_pendingResponseTokens;
    _IDSLogV();
  }
  uint64_t v8 = objc_msgSend(v4, "responseToken", v34, v36);
  BOOL v9 = v8 == 0;

  if (v9)
  {
    [(IDSPeerAggregateMessage *)self callAllIndividualCompletionBlocksWithDeliveryContext:v4];
    [(IDSPeerAggregateMessage *)self clearAllPendingResponseTokens];
  }
  else
  {
    if (![(IDSPeerAggregateMessage *)self hasReceivedAPSDAck]) {
      [(IDSPeerAggregateMessage *)self callAllAckBlocks];
    }
    long long v10 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithSet:self->_pendingResponseTokens];
    long long v11 = self->_pendingResponseTokens;
    self->_pendingResponseTokens = v10;

    long long v12 = self->_pendingResponseTokens;
    long long v13 = [v4 responseToken];
    LODWORD(v12) = [(NSMutableSet *)v12 containsObject:v13];

    if (v12)
    {
      long long v14 = self->_pendingResponseTokens;
      v15 = [v4 responseToken];
      [(NSMutableSet *)v14 removeObject:v15];

      id v16 = [objc_alloc((Class)NSMutableSet) initWithSet:self->_individualPeerMessages];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v39;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v39 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v22 = [v21 targetToken];
            v23 = [v4 responseToken];
            unsigned int v24 = [v22 isEqual:v23];

            if (v24)
            {
              v37 = [v21 completionBlock];
              v25 = [v4 responseError];
              id v26 = [v4 responseCode];
              v27 = [v21 targetPeerID];
              v28 = [(IDSPeerAggregateMessage *)self sourcePeerID];
              v29 = [(IDSPeerAggregateMessage *)self targetService];
              v30 = [(IDSPeerAggregateMessage *)self fromIdentity];
              v31 = [(IDSPeerAggregateMessage *)self _processMessageResponseForMessage:v21 withError:v25 resultCode:v26 toURI:v27 fromURI:v28 service:v29 fromIdentity:v30];

              [v4 setResponseError:v31];
              v32 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = [v4 responseTimeStamp];
                *(_DWORD *)buf = 138412290;
                v44 = v33;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "DeliveryContext Timestamp is %@", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                v35 = [v4 responseTimeStamp];
                _IDSLogV();
              }
              ((void (**)(void, id))v37)[2](v37, v4);
              [v17 removeObject:v21];

              goto LABEL_26;
            }
          }
          id v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_26:

      [(IDSPeerAggregateMessage *)self setIndividualPeerMessages:v17];
    }
  }
}

- (id)_processMessageResponseForMessage:(id)a3 withError:(id)a4 resultCode:(int64_t)a5 toURI:(id)a6 fromURI:(id)a7 service:(id)a8 fromIdentity:(id)a9
{
  id v15 = a3;
  id v56 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v55 = a9;
  uint64_t v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v58 = a5;
    __int16 v59 = 2112;
    id v60 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Processing response %ld for message %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    int64_t v42 = a5;
    id v45 = v15;
    _IDSLogV();
  }
  if ((unint64_t)a5 < 2 || a5 == 1003) {
    goto LABEL_13;
  }
  if (a5 == 1002)
  {
    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [(IDSPeerAggregateMessage *)self pushToken];
      *(_DWORD *)buf = 138412802;
      int64_t v58 = (int64_t)v17;
      __int16 v59 = 2112;
      id v60 = v16;
      __int16 v61 = 2112;
      id v62 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Message has been removed, Add Honeybee support here to grab logs from the other side who sent this FromURI:%@ ToURI:%@ Token:%@ ", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v49 = [(IDSPeerAggregateMessage *)self pushToken];
      _IDSWarnV();

      v50 = [(IDSPeerAggregateMessage *)self pushToken];
      _IDSLogV();

      [(IDSPeerAggregateMessage *)self pushToken];
      v48 = id v45 = v16;
      int64_t v42 = (int64_t)v17;
      _IDSLogTransport();
    }
LABEL_13:
    char v22 = 1;
    goto LABEL_15;
  }
  char v22 = 0;
LABEL_15:
  v23 = +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:](IDSURI, "URIWithPrefixedURI:withServiceLoggingHint:", v17, v18, v42, v45, v48);
  if (v22)
  {
    unsigned int v24 = 0;
  }
  else
  {
    if (a5 == 7000)
    {
      long long v38 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        int64_t v58 = (int64_t)v17;
        __int16 v59 = 2112;
        id v60 = v16;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Message was rate limited from the server, failing message (%@ -> %@)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        id v43 = v17;
        id v46 = v16;
        _IDSLogTransport();
      }
      if (+[IDSAutoBugCapture isSupported]) {
        +[IDSAutoBugCapture triggerCaptureWithEvent:102 context:@"NiceRateLimited" completion:&stru_100980900];
      }
    }
    else if (a5 == 5032)
    {
      v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v15 targetToken];
        id v27 = [v26 debugDescription];
        v28 = [v15 targetSessionToken];
        v29 = [v28 debugDescription];
        *(_DWORD *)buf = 138413570;
        int64_t v58 = (int64_t)v15;
        __int16 v59 = 2112;
        id v60 = v16;
        __int16 v61 = 2112;
        id v62 = v17;
        __int16 v63 = 2112;
        id v64 = v27;
        __int16 v65 = 2112;
        v66 = v29;
        __int16 v67 = 2112;
        id v68 = v18;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Bad signature {message: %@, localURI: %@, remoteURI: %@, remotePushToken: %@, sessionToken: %@, service: %@}", buf, 0x3Eu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v30 = [v15 targetToken];
        v31 = [v30 debugDescription];
        v32 = [v15 targetSessionToken];
        v53 = [v32 debugDescription];
        id v54 = v18;
        id v51 = v17;
        v52 = v31;
        id v43 = v15;
        id v46 = v16;
        _IDSLogV();
      }
      v33 = +[IDSPeerIDManager sharedInstance];
      v34 = [v15 targetToken];
      LOBYTE(v47) = 0;
      v35 = [v33 sessionTokenForURI:v16 pushToken:v34 fromURI:v23 service:v18 expirationDate:0 refreshDate:0 fromIdentity:v55 includeSelfDevice:v47];

      v36 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v58 = (int64_t)v35;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, " current sessionToken: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v44 = v35;
        _IDSLogV();
      }
      v37 = +[IDSPeerIDManager sharedInstance];
      [v37 forgetPeerTokensForURI:v16 fromURI:v23 service:v18];
    }
    else
    {
      long long v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unknown Error, Failing message", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    long long v40 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v56, NSUnderlyingErrorKey, 0);
    unsigned int v24 = +[NSError errorWithDomain:IDSSendErrorDomain code:2 userInfo:v40];
  }

  return v24;
}

- (BOOL)expectingMoreResponses
{
  return [(NSMutableSet *)self->_pendingResponseTokens count] != 0;
}

- (void)logFailureInfo
{
  BOOL v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSPeerAggregateMessage *)self messageID];
    id v5 = [(IDSPeerAggregateMessage *)self uniqueIDString];
    *(_DWORD *)buf = 138412546;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Msg with GUID: %@ & i:%@ is missing 255s", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v6 = [(IDSPeerAggregateMessage *)self messageID];
    long long v13 = [(IDSPeerAggregateMessage *)self uniqueIDString];
    _IDSLogV();
  }
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    pendingResponseTokens = self->_pendingResponseTokens;
    *(_DWORD *)buf = 138412290;
    id v15 = pendingResponseTokens;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  BOOL v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    chunkNumber = self->_chunkNumber;
    *(_DWORD *)buf = 138412290;
    id v15 = chunkNumber;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Chunk: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  long long v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isFinalMessage) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    id v15 = (id)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "WasLast?: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (unint64_t)sizeOfKeysWithValues
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = self->_individualPeerMessages;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v19 + 1) + 8 * i) sizeOfKeysWithValues];
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  BOOL v9 = [(IDSPeerAggregateMessage *)self messageID];
  long long v10 = v9;
  if (v9 && (long long v11 = (const char *)[v9 UTF8String]) != 0)
  {
    memset(uu, 170, sizeof(uu));
    uuid_parse(v11, uu);
    jw_uuid_to_data();
    id v12 = 0;
    id v13 = [v12 length];
  }
  else
  {
    id v13 = 0;
  }
  long long v14 = [(IDSPeerAggregateMessage *)self sourcePeerID];
  id v15 = [v14 lengthOfBytesUsingEncoding:4];

  __int16 v16 = [(IDSPeerAggregateMessage *)self encryptionType];
  id v17 = [v16 lengthOfBytesUsingEncoding:4];

  return (unint64_t)v15 + (void)v13 + v6 + (unint64_t)v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)IDSPeerAggregateMessage;
  id v4 = [(IDSPeerAggregateMessage *)&v22 copyWithZone:a3];
  id v5 = [(IDSPeerAggregateMessage *)self sourcePeerID];
  [v4 setSourcePeerID:v5];

  uint64_t v6 = [(IDSPeerAggregateMessage *)self encryptionType];
  [v4 setEncryptionType:v6];

  uint64_t v7 = [(IDSPeerAggregateMessage *)self messageID];
  [v4 setMessageID:v7];

  uint64_t v8 = [(IDSPeerAggregateMessage *)self priority];
  [v4 setPriority:v8];

  BOOL v9 = [(IDSPeerAggregateMessage *)self expirationDate];
  [v4 setExpirationDate:v9];

  long long v10 = [(IDSPeerAggregateMessage *)self additionalDictionary];
  [v4 setAdditionalDictionary:v10];

  long long v11 = [(IDSPeerAggregateMessage *)self individualPeerMessages];
  [v4 setIndividualPeerMessages:v11];

  id v12 = [(IDSPeerAggregateMessage *)self pendingResponseTokens];
  id v13 = [v12 mutableCopy];
  [v4 setPendingResponseTokens:v13];

  objc_msgSend(v4, "setMaxSize:", -[IDSPeerAggregateMessage maxSize](self, "maxSize"));
  objc_msgSend(v4, "setCurrentSize:", -[IDSPeerAggregateMessage currentSize](self, "currentSize"));
  objc_msgSend(v4, "setFireAndForget:", -[IDSPeerAggregateMessage fireAndForget](self, "fireAndForget"));
  objc_msgSend(v4, "setHasReceivedAPSDAck:", -[IDSPeerAggregateMessage hasReceivedAPSDAck](self, "hasReceivedAPSDAck"));
  long long v14 = [(IDSPeerAggregateMessage *)self chunkNumber];
  [v4 setChunkNumber:v14];

  objc_msgSend(v4, "setIsFinalMessage:", -[IDSPeerAggregateMessage isFinalMessage](self, "isFinalMessage"));
  id v15 = [(IDSPeerAggregateMessage *)self targetService];
  [v4 setTargetService:v15];

  __int16 v16 = [(IDSPeerAggregateMessage *)self fromIdentity];
  [v4 setFromIdentity:v16];

  id v17 = [(IDSPeerAggregateMessage *)self groupPayload];
  [v4 setGroupPayload:v17];

  id v18 = [(IDSPeerAggregateMessage *)self groupIdentifer];
  [v4 setGroupIdentifer:v18];

  long long v19 = [(IDSPeerAggregateMessage *)self deliveryMinimumTimeDelay];
  [v4 setDeliveryMinimumTimeDelay:v19];

  long long v20 = [(IDSPeerAggregateMessage *)self deliveryMinimumTime];
  [v4 setDeliveryMinimumTime:v20];

  return v4;
}

- (id)requiredKeys
{
  v5.receiver = self;
  v5.super_class = (Class)IDSPeerAggregateMessage;
  v2 = [(IDSPeerAggregateMessage *)&v5 requiredKeys];
  id v3 = [v2 mutableCopy];

  if (!v3) {
    id v3 = objc_alloc_init((Class)NSMutableArray);
  }
  [v3 addObject:@"dtl"];

  return v3;
}

- (id)messageBody
{
  v62.receiver = self;
  v62.super_class = (Class)IDSPeerAggregateMessage;
  id v3 = [(IDSPeerAggregateMessage *)&v62 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  objc_super v5 = [(IDSPeerAggregateMessage *)self messageID];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (const char *)[v5 UTF8String];
    if (v7)
    {
      memset(uu, 170, sizeof(uu));
      uuid_parse(v7, uu);
      uint64_t v61 = 0;
      jw_uuid_to_data();
      id v8 = 0;
      if (v8) {
        CFDictionarySetValue(Mutable, @"U", v8);
      }
    }
  }
  additionalDictionary = self->_additionalDictionary;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10007B6B4;
  v59[3] = &unk_100980928;
  long long v10 = Mutable;
  id v60 = v10;
  [(NSDictionary *)additionalDictionary enumerateKeysAndObjectsUsingBlock:v59];
  long long v11 = [(IDSPeerAggregateMessage *)self sourcePeerID];
  if (v11)
  {
    CFDictionarySetValue(v10, @"sP", v11);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070BF00();
  }

  id v12 = [(IDSPeerAggregateMessage *)self sourceShortHandle];
  if (v12) {
    CFDictionarySetValue(v10, @"sPs", v12);
  }

  if ([(IDSPeerAggregateMessage *)self fireAndForget])
  {
    CFDictionarySetValue(v10, IDSExpirationDateKey, &off_1009D0CD8);
  }
  else
  {
    id v13 = [(IDSPeerAggregateMessage *)self expirationDate];

    if (v13)
    {
      long long v14 = [(IDSPeerAggregateMessage *)self expirationDate];
      [v14 timeIntervalSince1970];
      __int16 v16 = +[NSNumber numberWithUnsignedLong:(unint64_t)v15];

      if (v16) {
        CFDictionarySetValue(v10, IDSExpirationDateKey, v16);
      }
    }
  }
  uint64_t v17 = [(IDSPeerAggregateMessage *)self encryptionType];
  if (v17)
  {
    id v18 = (void *)v17;
    long long v19 = [(IDSPeerAggregateMessage *)self encryptionType];
    long long v20 = IDSEncryptionTypeStringFromEncryptionType();
    unsigned __int8 v21 = [v19 isEqualToIgnoringCase:v20];

    if ((v21 & 1) == 0)
    {
      objc_super v22 = [(IDSPeerAggregateMessage *)self encryptionType];
      if (v22) {
        CFDictionarySetValue(v10, @"E", v22);
      }
    }
  }
  v23 = [(IDSPeerAggregateMessage *)self groupPayload];
  id v24 = [v23 length];

  if (v24)
  {
    v25 = IDSEncryptionTypeStringFromEncryptionType();
    if (v25) {
      CFDictionarySetValue(v10, @"E", v25);
    }
  }
  id v26 = [(IDSPeerAggregateMessage *)self additionalDictionary];
  id v27 = [v26 objectForKey:@"c"];

  v28 = [(IDSPeerAggregateMessage *)self topic];
  uint64_t v29 = IDSServiceNameiMessageLite;
  if ([v28 isEqualToString:IDSServiceNameiMessageLite])
  {
    id v30 = [v27 unsignedIntegerValue];

    if (v30 != (id)100) {
      goto LABEL_34;
    }
    v28 = IDSEncryptionTypeStringFromEncryptionType();
    if (v28) {
      CFDictionarySetValue(v10, @"E", v28);
    }
  }

LABEL_34:
  v31 = [(IDSPeerAggregateMessage *)self topic];
  if ([v31 isEqualToString:v29])
  {
    if ([v27 unsignedIntegerValue] == (id)100)
    {

LABEL_39:
      CFDictionarySetValue(v10, IDSDesiredProtocolKey, &off_1009D0CD8);
      goto LABEL_40;
    }
    id v32 = [v27 unsignedIntegerValue];

    if (v32 == (id)128) {
      goto LABEL_39;
    }
  }
  else
  {
  }
LABEL_40:
  uint64_t v33 = [(IDSPeerAggregateMessage *)self priority];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(IDSPeerAggregateMessage *)self priority];
    unsigned int v36 = [v35 intValue];

    if (v36 != 10)
    {
      v37 = [(IDSPeerAggregateMessage *)self priority];
      if (v37) {
        CFDictionarySetValue(v10, @"pri", v37);
      }
    }
  }
  long long v38 = [(IDSPeerAggregateMessage *)self chunkNumber];
  if (v38) {
    CFDictionarySetValue(v10, @"fcn", v38);
  }

  if ([(IDSPeerAggregateMessage *)self isFinalMessage]) {
    CFDictionarySetValue(v10, @"flc", &off_1009D0CC0);
  }
  long long v39 = [(IDSPeerAggregateMessage *)self deliveryMinimumTimeDelay];

  if (v39)
  {
    long long v40 = [(IDSPeerAggregateMessage *)self deliveryMinimumTimeDelay];
    if (v40) {
      CFDictionarySetValue(v10, IDSDeliveryMinimumTimeDelayKey, v40);
    }
  }
  long long v41 = [(IDSPeerAggregateMessage *)self deliveryMinimumTime];

  if (v41)
  {
    int64_t v42 = [(IDSPeerAggregateMessage *)self deliveryMinimumTime];
    if (v42) {
      CFDictionarySetValue(v10, IDSDeliveryMinimumTimeKey, v42);
    }
  }
  id v43 = [(IDSPeerAggregateMessage *)self groupPayload];
  if (v43) {
    CFDictionarySetValue(v10, @"P", v43);
  }

  v44 = [(IDSPeerAggregateMessage *)self groupIdentifer];
  if (v44) {
    CFDictionarySetValue(v10, @"gI", v44);
  }

  id v45 = objc_alloc_init((Class)NSMutableArray);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v46 = self->_individualPeerMessages;
  id v47 = [(NSMutableSet *)v46 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v56;
    do
    {
      for (i = 0; i != v48; i = (char *)i + 1)
      {
        if (*(void *)v56 != v49) {
          objc_enumerationMutation(v46);
        }
        id v51 = objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "dictionaryRepresentation", (void)v55);
        [v45 addObject:v51];
      }
      id v48 = [(NSMutableSet *)v46 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v48);
  }

  id v52 = v45;
  if (v52)
  {
    CFDictionarySetValue(v10, @"dtl", v52);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070BE64();
  }

  v53 = v10;
  return v53;
}

- (NSString)sourcePeerID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSourcePeerID:(id)a3
{
}

- (NSString)sourceShortHandle
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSourceShortHandle:(id)a3
{
}

- (NSString)encryptionType
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setEncryptionType:(id)a3
{
}

- (NSString)messageID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setMessageID:(id)a3
{
}

- (NSString)targetService
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setTargetService:(id)a3
{
}

- (NSNumber)priority
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setPriority:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSData)fromIdentity
{
  return (NSData *)objc_getProperty(self, a2, 320, 1);
}

- (void)setFromIdentity:(id)a3
{
}

- (NSDictionary)additionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setAdditionalDictionary:(id)a3
{
}

- (NSMutableSet)individualPeerMessages
{
  return (NSMutableSet *)objc_getProperty(self, a2, 336, 1);
}

- (void)setIndividualPeerMessages:(id)a3
{
}

- (NSMutableSet)pendingResponseTokens
{
  return (NSMutableSet *)objc_getProperty(self, a2, 344, 1);
}

- (void)setPendingResponseTokens:(id)a3
{
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int64_t)a3
{
  self->_maxSize = a3;
}

- (int64_t)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(int64_t)a3
{
  self->_int64_t currentSize = a3;
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (BOOL)hasReceivedAPSDAck
{
  return self->_hasReceivedAPSDAck;
}

- (void)setHasReceivedAPSDAck:(BOOL)a3
{
  self->_hasReceivedAPSDAck = a3;
}

- (NSNumber)chunkNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setChunkNumber:(id)a3
{
}

- (BOOL)isFinalMessage
{
  return self->_isFinalMessage;
}

- (void)setIsFinalMessage:(BOOL)a3
{
  self->_isFinalMessage = a3;
}

- (NSData)groupPayload
{
  return self->_groupPayload;
}

- (NSData)groupIdentifer
{
  return self->_groupIdentifer;
}

- (NSNumber)deliveryMinimumTimeDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
}

- (NSNumber)deliveryMinimumTime
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setDeliveryMinimumTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryMinimumTime, 0);
  objc_storeStrong((id *)&self->_deliveryMinimumTimeDelay, 0);
  objc_storeStrong((id *)&self->_groupIdentifer, 0);
  objc_storeStrong((id *)&self->_groupPayload, 0);
  objc_storeStrong((id *)&self->_chunkNumber, 0);
  objc_storeStrong((id *)&self->_pendingResponseTokens, 0);
  objc_storeStrong((id *)&self->_individualPeerMessages, 0);
  objc_storeStrong((id *)&self->_additionalDictionary, 0);
  objc_storeStrong((id *)&self->_fromIdentity, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_targetService, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);
  objc_storeStrong((id *)&self->_sourceShortHandle, 0);

  objc_storeStrong((id *)&self->_sourcePeerID, 0);
}

@end