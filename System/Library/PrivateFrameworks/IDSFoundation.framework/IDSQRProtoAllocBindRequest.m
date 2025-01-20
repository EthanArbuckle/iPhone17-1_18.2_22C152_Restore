@interface IDSQRProtoAllocBindRequest
+ (Class)materialsType;
+ (Class)quicConnectionInfoType;
+ (Class)sessionExperimentsType;
+ (Class)subscribedStreamsType;
- (BOOL)allWildcardSubscription;
- (BOOL)hasAccessToken;
- (BOOL)hasAllWildcardSubscription;
- (BOOL)hasCapabilities;
- (BOOL)hasChannelBindingInfo;
- (BOOL)hasClientContextBlob;
- (BOOL)hasClientHwVersion;
- (BOOL)hasClientOsVersion;
- (BOOL)hasMaxConcurrentStreams;
- (BOOL)hasMaxEmbeddedStatsResponseDelay;
- (BOOL)hasRandomSalt;
- (BOOL)hasReason;
- (BOOL)hasServerBlob;
- (BOOL)hasServiceId;
- (BOOL)hasStateFlags;
- (BOOL)hasTestOption;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoAllocBindTestOption)testOption;
- (IDSQRProtoMaterial)clientContextBlob;
- (NSData)accessToken;
- (NSData)randomSalt;
- (NSData)serverBlob;
- (NSMutableArray)materials;
- (NSMutableArray)quicConnectionInfos;
- (NSMutableArray)sessionExperiments;
- (NSMutableArray)subscribedStreams;
- (NSString)clientHwVersion;
- (NSString)clientOsVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialsAtIndex:(unint64_t)a3;
- (id)quicConnectionInfoAtIndex:(unint64_t)a3;
- (id)reasonAsString:(int)a3;
- (id)sessionExperimentsAtIndex:(unint64_t)a3;
- (id)subscribedStreamsAtIndex:(unint64_t)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (unint64_t)materialsCount;
- (unint64_t)publishedStreamIdsCount;
- (unint64_t)quicConnectionInfosCount;
- (unint64_t)sessionExperimentsCount;
- (unint64_t)subscribedStreamsCount;
- (unsigned)channelBindingInfo;
- (unsigned)maxConcurrentStreams;
- (unsigned)maxEmbeddedStatsResponseDelay;
- (unsigned)publishedStreamIds;
- (unsigned)publishedStreamIdsAtIndex:(unint64_t)a3;
- (unsigned)serviceId;
- (unsigned)stateFlags;
- (void)addMaterials:(id)a3;
- (void)addPublishedStreamIds:(unsigned int)a3;
- (void)addQuicConnectionInfo:(id)a3;
- (void)addSessionExperiments:(id)a3;
- (void)addSubscribedStreams:(id)a3;
- (void)clearMaterials;
- (void)clearPublishedStreamIds;
- (void)clearQuicConnectionInfos;
- (void)clearSessionExperiments;
- (void)clearSubscribedStreams;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessToken:(id)a3;
- (void)setAllWildcardSubscription:(BOOL)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setChannelBindingInfo:(unsigned int)a3;
- (void)setClientContextBlob:(id)a3;
- (void)setClientHwVersion:(id)a3;
- (void)setClientOsVersion:(id)a3;
- (void)setHasAllWildcardSubscription:(BOOL)a3;
- (void)setHasCapabilities:(BOOL)a3;
- (void)setHasChannelBindingInfo:(BOOL)a3;
- (void)setHasMaxConcurrentStreams:(BOOL)a3;
- (void)setHasMaxEmbeddedStatsResponseDelay:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasServiceId:(BOOL)a3;
- (void)setHasStateFlags:(BOOL)a3;
- (void)setMaterials:(id)a3;
- (void)setMaxConcurrentStreams:(unsigned int)a3;
- (void)setMaxEmbeddedStatsResponseDelay:(unsigned int)a3;
- (void)setPublishedStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setQuicConnectionInfos:(id)a3;
- (void)setRandomSalt:(id)a3;
- (void)setReason:(int)a3;
- (void)setServerBlob:(id)a3;
- (void)setServiceId:(unsigned int)a3;
- (void)setSessionExperiments:(id)a3;
- (void)setStateFlags:(unsigned int)a3;
- (void)setSubscribedStreams:(id)a3;
- (void)setTestOption:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoAllocBindRequest

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoAllocBindRequest;
  [(IDSQRProtoAllocBindRequest *)&v3 dealloc];
}

- (void)setServiceId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_serviceId = a3;
}

- (void)setHasServiceId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasServiceId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasClientOsVersion
{
  return self->_clientOsVersion != 0;
}

- (BOOL)hasClientHwVersion
{
  return self->_clientHwVersion != 0;
}

- (void)setCapabilities:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)publishedStreamIdsCount
{
  return self->_publishedStreamIds.count;
}

- (unsigned)publishedStreamIds
{
  return self->_publishedStreamIds.list;
}

- (void)clearPublishedStreamIds
{
}

- (void)addPublishedStreamIds:(unsigned int)a3
{
}

- (unsigned)publishedStreamIdsAtIndex:(unint64_t)a3
{
  p_publishedStreamIds = &self->_publishedStreamIds;
  unint64_t count = self->_publishedStreamIds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_publishedStreamIds->list[a3];
}

- (void)setPublishedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearSubscribedStreams
{
  objc_msgSend_removeAllObjects(self->_subscribedStreams, a2, v2, v3);
}

- (void)addSubscribedStreams:(id)a3
{
  v4 = (const char *)a3;
  subscribedStreams = self->_subscribedStreams;
  v9 = (char *)v4;
  if (!subscribedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_subscribedStreams;
    self->_subscribedStreams = v7;

    v4 = v9;
    subscribedStreams = self->_subscribedStreams;
  }
  objc_msgSend_addObject_(subscribedStreams, v4, (uint64_t)v4, v5);
}

- (unint64_t)subscribedStreamsCount
{
  return objc_msgSend_count(self->_subscribedStreams, a2, v2, v3);
}

- (id)subscribedStreamsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_subscribedStreams, a2, a3, v3);
}

+ (Class)subscribedStreamsType
{
  return (Class)objc_opt_class();
}

- (void)setAllWildcardSubscription:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_allWildcardSubscription = a3;
}

- (void)setHasAllWildcardSubscription:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasAllWildcardSubscription
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMaxConcurrentStreams:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_maxConcurrentStreams = a3;
}

- (void)setHasMaxConcurrentStreams:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxConcurrentStreams
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setChannelBindingInfo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_channelBindingInfo = a3;
}

- (void)setHasChannelBindingInfo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannelBindingInfo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaxEmbeddedStatsResponseDelay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_maxEmbeddedStatsResponseDelay = a3;
}

- (void)setHasMaxEmbeddedStatsResponseDelay:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxEmbeddedStatsResponseDelay
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearQuicConnectionInfos
{
  objc_msgSend_removeAllObjects(self->_quicConnectionInfos, a2, v2, v3);
}

- (void)addQuicConnectionInfo:(id)a3
{
  v4 = (const char *)a3;
  quicConnectionInfos = self->_quicConnectionInfos;
  v9 = (char *)v4;
  if (!quicConnectionInfos)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_quicConnectionInfos;
    self->_quicConnectionInfos = v7;

    v4 = v9;
    quicConnectionInfos = self->_quicConnectionInfos;
  }
  objc_msgSend_addObject_(quicConnectionInfos, v4, (uint64_t)v4, v5);
}

- (unint64_t)quicConnectionInfosCount
{
  return objc_msgSend_count(self->_quicConnectionInfos, a2, v2, v3);
}

- (id)quicConnectionInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_quicConnectionInfos, a2, a3, v3);
}

+ (Class)quicConnectionInfoType
{
  return (Class)objc_opt_class();
}

- (void)setStateFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_stateFlags = a3;
}

- (void)setHasStateFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStateFlags
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (int)reason
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)reasonAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      double v5 = @"NEWLY_JOINED";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v4, a3);
      double v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v5 = @"NONE";
  }
  return v5;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"NONE", v5)) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v6, @"NEWLY_JOINED", v7);
  }

  return isEqualToString;
}

- (BOOL)hasRandomSalt
{
  return self->_randomSalt != 0;
}

- (BOOL)hasAccessToken
{
  return self->_accessToken != 0;
}

- (BOOL)hasServerBlob
{
  return self->_serverBlob != 0;
}

- (BOOL)hasTestOption
{
  return self->_testOption != 0;
}

- (void)clearSessionExperiments
{
  objc_msgSend_removeAllObjects(self->_sessionExperiments, a2, v2, v3);
}

- (void)addSessionExperiments:(id)a3
{
  double v4 = (const char *)a3;
  sessionExperiments = self->_sessionExperiments;
  v9 = (char *)v4;
  if (!sessionExperiments)
  {
    double v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_sessionExperiments;
    self->_sessionExperiments = v7;

    double v4 = v9;
    sessionExperiments = self->_sessionExperiments;
  }
  objc_msgSend_addObject_(sessionExperiments, v4, (uint64_t)v4, v5);
}

- (unint64_t)sessionExperimentsCount
{
  return objc_msgSend_count(self->_sessionExperiments, a2, v2, v3);
}

- (id)sessionExperimentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_sessionExperiments, a2, a3, v3);
}

+ (Class)sessionExperimentsType
{
  return (Class)objc_opt_class();
}

- (void)clearMaterials
{
  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)addMaterials:(id)a3
{
  double v4 = (const char *)a3;
  materials = self->_materials;
  v9 = (char *)v4;
  if (!materials)
  {
    double v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_materials;
    self->_materials = v7;

    double v4 = v9;
    materials = self->_materials;
  }
  objc_msgSend_addObject_(materials, v4, (uint64_t)v4, v5);
}

- (unint64_t)materialsCount
{
  return objc_msgSend_count(self->_materials, a2, v2, v3);
}

- (id)materialsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_materials, a2, a3, v3);
}

+ (Class)materialsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoAllocBindRequest;
  double v4 = [(IDSQRProtoAllocBindRequest *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, self->_serviceId, v7);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, @"service_id");
  }
  clientOsVersion = self->_clientOsVersion;
  if (clientOsVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientOsVersion, v7, @"client_os_version");
  }
  clientHwVersion = self->_clientHwVersion;
  if (clientHwVersion) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientHwVersion, v7, @"client_hw_version");
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v13 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_capabilities, v7);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, v15, @"capabilities");
  }
  v16 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, v18, @"published_stream_ids");

  if (objc_msgSend_count(self->_subscribedStreams, v19, v20, v21))
  {
    id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v29 = objc_msgSend_count(self->_subscribedStreams, v26, v27, v28);
    v32 = objc_msgSend_initWithCapacity_(v25, v30, v29, v31);
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    v33 = self->_subscribedStreams;
    uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v167, v35, v174, 16);
    if (v36)
    {
      uint64_t v40 = v36;
      uint64_t v41 = *(void *)v168;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v168 != v41) {
            objc_enumerationMutation(v33);
          }
          v43 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v167 + 1) + 8 * i), v37, v38, v39);
          objc_msgSend_addObject_(v32, v44, (uint64_t)v43, v45);
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v37, (uint64_t)&v167, v39, v174, 16);
      }
      while (v40);
    }

    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v32, v47, @"subscribed_streams");
  }
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v93 = objc_msgSend_numberWithBool_(NSNumber, v22, self->_allWildcardSubscription, v24);
  objc_msgSend_setObject_forKey_(v6, v94, (uint64_t)v93, v95, @"all_wildcard_subscription");

  *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_20:
    v49 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v22, self->_maxConcurrentStreams, v24);
    objc_msgSend_setObject_forKey_(v6, v50, (uint64_t)v49, v51, @"max_concurrent_streams");

    *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  }
LABEL_21:
  if ((*(unsigned char *)&has & 2) == 0)
  {
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v90 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v22, self->_channelBindingInfo, v24);
  objc_msgSend_setObject_forKey_(v6, v91, (uint64_t)v90, v92, @"channel_binding_info");

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_23:
    v52 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v22, self->_maxEmbeddedStatsResponseDelay, v24);
    objc_msgSend_setObject_forKey_(v6, v53, (uint64_t)v52, v54, @"max_embedded_stats_response_delay");
  }
LABEL_24:
  if (objc_msgSend_count(self->_quicConnectionInfos, v22, v23, v24))
  {
    id v58 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v62 = objc_msgSend_count(self->_quicConnectionInfos, v59, v60, v61);
    v65 = objc_msgSend_initWithCapacity_(v58, v63, v62, v64);
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    v66 = self->_quicConnectionInfos;
    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v163, v68, v173, 16);
    if (v69)
    {
      uint64_t v73 = v69;
      uint64_t v74 = *(void *)v164;
      do
      {
        for (uint64_t j = 0; j != v73; ++j)
        {
          if (*(void *)v164 != v74) {
            objc_enumerationMutation(v66);
          }
          v76 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v163 + 1) + 8 * j), v70, v71, v72);
          objc_msgSend_addObject_(v65, v77, (uint64_t)v76, v78);
        }
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v70, (uint64_t)&v163, v72, v173, 16);
      }
      while (v73);
    }

    objc_msgSend_setObject_forKey_(v6, v79, (uint64_t)v65, v80, @"quic_connection_info");
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v81 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v55, self->_stateFlags, v57);
    objc_msgSend_setObject_forKey_(v6, v82, (uint64_t)v81, v83, @"state_flags");
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    v85 = objc_msgSend_dictionaryRepresentation(clientContextBlob, v55, v56, v57);
    objc_msgSend_setObject_forKey_(v6, v86, (uint64_t)v85, v87, @"client_context_blob");
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    int reason = self->_reason;
    if (reason)
    {
      if (reason == 1)
      {
        v89 = @"NEWLY_JOINED";
        objc_msgSend_setObject_forKey_(v6, v55, @"NEWLY_JOINED", v57, @"reason");
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v55, @"(unknown: %i)", v57, self->_reason);
        v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v96, (uint64_t)v89, v97, @"reason");
      }
    }
    else
    {
      v89 = @"NONE";
      objc_msgSend_setObject_forKey_(v6, v55, @"NONE", v57, @"reason");
    }
  }
  randomSalt = self->_randomSalt;
  if (randomSalt) {
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)randomSalt, v57, @"random_salt");
  }
  accessToken = self->_accessToken;
  if (accessToken) {
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)accessToken, v57, @"access_token");
  }
  serverBlob = self->_serverBlob;
  if (serverBlob) {
    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)serverBlob, v57, @"server_blob");
  }
  testOption = self->_testOption;
  if (testOption)
  {
    v102 = objc_msgSend_dictionaryRepresentation(testOption, v55, (uint64_t)serverBlob, v57);
    objc_msgSend_setObject_forKey_(v6, v103, (uint64_t)v102, v104, @"test_option");
  }
  if (objc_msgSend_count(self->_sessionExperiments, v55, (uint64_t)serverBlob, v57))
  {
    id v108 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v112 = objc_msgSend_count(self->_sessionExperiments, v109, v110, v111);
    v115 = objc_msgSend_initWithCapacity_(v108, v113, v112, v114);
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v116 = self->_sessionExperiments;
    uint64_t v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v117, (uint64_t)&v159, v118, v172, 16);
    if (v119)
    {
      uint64_t v123 = v119;
      uint64_t v124 = *(void *)v160;
      do
      {
        for (uint64_t k = 0; k != v123; ++k)
        {
          if (*(void *)v160 != v124) {
            objc_enumerationMutation(v116);
          }
          v126 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v159 + 1) + 8 * k), v120, v121, v122);
          objc_msgSend_addObject_(v115, v127, (uint64_t)v126, v128);
        }
        uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v120, (uint64_t)&v159, v122, v172, 16);
      }
      while (v123);
    }

    objc_msgSend_setObject_forKey_(v6, v129, (uint64_t)v115, v130, @"session_experiments");
  }
  if (objc_msgSend_count(self->_materials, v105, v106, v107))
  {
    id v131 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v135 = objc_msgSend_count(self->_materials, v132, v133, v134);
    v138 = objc_msgSend_initWithCapacity_(v131, v136, v135, v137);
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    v139 = self->_materials;
    uint64_t v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v140, (uint64_t)&v155, v141, v171, 16);
    if (v142)
    {
      uint64_t v146 = v142;
      uint64_t v147 = *(void *)v156;
      do
      {
        for (uint64_t m = 0; m != v146; ++m)
        {
          if (*(void *)v156 != v147) {
            objc_enumerationMutation(v139);
          }
          v149 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v155 + 1) + 8 * m), v143, v144, v145);
          objc_msgSend_addObject_(v138, v150, (uint64_t)v149, v151);
        }
        uint64_t v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(v139, v143, (uint64_t)&v155, v145, v171, 16);
      }
      while (v146);
    }

    objc_msgSend_setObject_forKey_(v6, v152, (uint64_t)v138, v153, @"materials");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoAllocBindRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_clientOsVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientHwVersion) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_publishedStreamIds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_publishedStreamIds.count);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v6 = self->_subscribedStreams;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v55, v8, v62, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v55, v14, v62, 16);
    }
    while (v10);
  }

  $6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_21:
    PBDataWriterWriteUint32Field();
    *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  }
LABEL_22:
  if ((*(unsigned char *)&has & 2) == 0)
  {
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v16 = self->_quicConnectionInfos;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v51, v18, v61, 16);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v23, (uint64_t)&v51, v24, v61, 16);
    }
    while (v20);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_clientContextBlob) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v25 = self->_materials;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v47, v27, v60, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v48 != v30) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v47, v33, v60, 16);
    }
    while (v29);
  }

  if (self->_randomSalt) {
    PBDataWriterWriteDataField();
  }
  if (self->_accessToken) {
    PBDataWriterWriteDataField();
  }
  if (self->_serverBlob) {
    PBDataWriterWriteDataField();
  }
  if (self->_testOption) {
    PBDataWriterWriteSubmessage();
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v34 = self->_sessionExperiments;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v43, v36, v59, 16);
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v34);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v41, (uint64_t)&v43, v42, v59, 16);
    }
    while (v38);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4[32] = self->_serviceId;
    *((unsigned char *)v4 + 172) |= 0x20u;
  }
  clientOsVersiouint64_t n = self->_clientOsVersion;
  id v78 = v4;
  if (clientOsVersion) {
    objc_msgSend_setClientOsVersion_(v4, v5, (uint64_t)clientOsVersion, v6);
  }
  clientHwVersiouint64_t n = self->_clientHwVersion;
  if (clientHwVersion) {
    objc_msgSend_setClientHwVersion_(v78, v5, (uint64_t)clientHwVersion, v6);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v78 + 4) = self->_capabilities;
    *((unsigned char *)v78 + 172) |= 1u;
  }
  if (objc_msgSend_publishedStreamIdsCount(self, v5, (uint64_t)clientHwVersion, v6))
  {
    objc_msgSend_clearPublishedStreamIds(v78, v9, v10, v11);
    uint64_t v15 = objc_msgSend_publishedStreamIdsCount(self, v12, v13, v14);
    if (v15)
    {
      uint64_t v16 = v15;
      for (uint64_t i = 0; i != v16; ++i)
      {
        uint64_t v18 = objc_msgSend_publishedStreamIdsAtIndex_(self, v9, i, v11);
        objc_msgSend_addPublishedStreamIds_(v78, v19, v18, v20);
      }
    }
  }
  if (objc_msgSend_subscribedStreamsCount(self, v9, v10, v11))
  {
    objc_msgSend_clearSubscribedStreams(v78, v21, v22, v23);
    uint64_t v27 = objc_msgSend_subscribedStreamsCount(self, v24, v25, v26);
    if (v27)
    {
      uint64_t v28 = v27;
      for (uint64_t j = 0; j != v28; ++j)
      {
        uint64_t v30 = objc_msgSend_subscribedStreamsAtIndex_(self, v21, j, v23);
        objc_msgSend_addSubscribedStreams_(v78, v31, (uint64_t)v30, v32);
      }
    }
  }
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    v34 = v78;
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v34 = v78;
  *((unsigned char *)v78 + 168) = self->_allWildcardSubscription;
  *((unsigned char *)v78 + 172) |= 0x80u;
  *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_19:
    v34[22] = self->_maxConcurrentStreams;
    *((unsigned char *)v34 + 172) |= 4u;
    *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  }
LABEL_20:
  if ((*(unsigned char *)&has & 2) != 0)
  {
    v34[12] = self->_channelBindingInfo;
    *((unsigned char *)v34 + 172) |= 2u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_22:
    v34[23] = self->_maxEmbeddedStatsResponseDelay;
    *((unsigned char *)v34 + 172) |= 8u;
  }
LABEL_23:
  if (objc_msgSend_quicConnectionInfosCount(self, v21, v22, v23))
  {
    objc_msgSend_clearQuicConnectionInfos(v78, v35, v36, v37);
    uint64_t v41 = objc_msgSend_quicConnectionInfosCount(self, v38, v39, v40);
    if (v41)
    {
      uint64_t v42 = v41;
      for (uint64_t k = 0; k != v42; ++k)
      {
        long long v44 = objc_msgSend_quicConnectionInfoAtIndex_(self, v35, k, v37);
        objc_msgSend_addQuicConnectionInfo_(v78, v45, (uint64_t)v44, v46);
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v78 + 36) = self->_stateFlags;
    *((unsigned char *)v78 + 172) |= 0x40u;
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob) {
    objc_msgSend_setClientContextBlob_(v78, v35, (uint64_t)clientContextBlob, v37);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v78 + 28) = self->_reason;
    *((unsigned char *)v78 + 172) |= 0x10u;
  }
  if (objc_msgSend_materialsCount(self, v35, (uint64_t)clientContextBlob, v37))
  {
    objc_msgSend_clearMaterials(v78, v48, v49, v50);
    uint64_t v54 = objc_msgSend_materialsCount(self, v51, v52, v53);
    if (v54)
    {
      uint64_t v55 = v54;
      for (uint64_t m = 0; m != v55; ++m)
      {
        long long v57 = objc_msgSend_materialsAtIndex_(self, v48, m, v50);
        objc_msgSend_addMaterials_(v78, v58, (uint64_t)v57, v59);
      }
    }
  }
  randomSalt = self->_randomSalt;
  if (randomSalt) {
    objc_msgSend_setRandomSalt_(v78, v48, (uint64_t)randomSalt, v50);
  }
  accessTokeuint64_t n = self->_accessToken;
  if (accessToken) {
    objc_msgSend_setAccessToken_(v78, v48, (uint64_t)accessToken, v50);
  }
  serverBlob = self->_serverBlob;
  if (serverBlob) {
    objc_msgSend_setServerBlob_(v78, v48, (uint64_t)serverBlob, v50);
  }
  testOptiouint64_t n = self->_testOption;
  if (testOption) {
    objc_msgSend_setTestOption_(v78, v48, (uint64_t)testOption, v50);
  }
  if (objc_msgSend_sessionExperimentsCount(self, v48, (uint64_t)testOption, v50))
  {
    objc_msgSend_clearSessionExperiments(v78, v64, v65, v66);
    uint64_t v70 = objc_msgSend_sessionExperimentsCount(self, v67, v68, v69);
    if (v70)
    {
      uint64_t v73 = v70;
      for (uint64_t n = 0; n != v73; ++n)
      {
        v75 = objc_msgSend_sessionExperimentsAtIndex_(self, v71, n, v72);
        objc_msgSend_addSessionExperiments_(v78, v76, (uint64_t)v75, v77);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = v12;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v12 + 128) = self->_serviceId;
    *(unsigned char *)(v12 + 172) |= 0x20u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_clientOsVersion, v13, (uint64_t)a3, v14);
  v17 = *(void **)(v15 + 72);
  *(void *)(v15 + 72) = v16;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_clientHwVersion, v18, (uint64_t)a3, v19);
  uint64_t v21 = *(void **)(v15 + 64);
  *(void *)(v15 + 64) = v20;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v15 + 32) = self->_capabilities;
    *(unsigned char *)(v15 + 172) |= 1u;
  }
  PBRepeatedUInt32Copy();
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v22 = self->_subscribedStreams;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v104, v24, v111, 16);
  if (v25)
  {
    uint64_t v28 = v25;
    uint64_t v29 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v105 != v29) {
          objc_enumerationMutation(v22);
        }
        double v31 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v104 + 1) + 8 * i), v26, (uint64_t)a3, v27);
        objc_msgSend_addSubscribedStreams_((void *)v15, v32, (uint64_t)v31, v33);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v26, (uint64_t)&v104, v27, v111, 16);
    }
    while (v28);
  }

  $6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  *(unsigned char *)(v15 + 168) = self->_allWildcardSubscription;
  *(unsigned char *)(v15 + 172) |= 0x80u;
  *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_14:
    *(_DWORD *)(v15 + 88) = self->_maxConcurrentStreams;
    *(unsigned char *)(v15 + 172) |= 4u;
    *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  }
LABEL_15:
  if ((*(unsigned char *)&has & 2) == 0)
  {
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  *(_DWORD *)(v15 + 48) = self->_channelBindingInfo;
  *(unsigned char *)(v15 + 172) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_17:
    *(_DWORD *)(v15 + 92) = self->_maxEmbeddedStatsResponseDelay;
    *(unsigned char *)(v15 + 172) |= 8u;
  }
LABEL_18:
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  double v35 = self->_quicConnectionInfos;
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v100, v37, v110, 16);
  if (v38)
  {
    uint64_t v41 = v38;
    uint64_t v42 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v101 != v42) {
          objc_enumerationMutation(v35);
        }
        long long v44 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v100 + 1) + 8 * j), v39, (uint64_t)a3, v40);
        objc_msgSend_addQuicConnectionInfo_((void *)v15, v45, (uint64_t)v44, v46);
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v39, (uint64_t)&v100, v40, v110, 16);
    }
    while (v41);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v15 + 144) = self->_stateFlags;
    *(unsigned char *)(v15 + 172) |= 0x40u;
  }
  uint64_t v49 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v47, (uint64_t)a3, v48);
  double v50 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = v49;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v15 + 112) = self->_reason;
    *(unsigned char *)(v15 + 172) |= 0x10u;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v51 = self->_materials;
  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v96, v53, v109, 16);
  if (v54)
  {
    uint64_t v57 = v54;
    uint64_t v58 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v57; ++k)
      {
        if (*(void *)v97 != v58) {
          objc_enumerationMutation(v51);
        }
        uint64_t v60 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v96 + 1) + 8 * k), v55, (uint64_t)a3, v56);
        objc_msgSend_addMaterials_((void *)v15, v61, (uint64_t)v60, v62);
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v55, (uint64_t)&v96, v56, v109, 16);
    }
    while (v57);
  }

  uint64_t v65 = objc_msgSend_copyWithZone_(self->_randomSalt, v63, (uint64_t)a3, v64);
  double v66 = *(void **)(v15 + 104);
  *(void *)(v15 + 104) = v65;

  uint64_t v69 = objc_msgSend_copyWithZone_(self->_accessToken, v67, (uint64_t)a3, v68);
  uint64_t v70 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v69;

  uint64_t v73 = objc_msgSend_copyWithZone_(self->_serverBlob, v71, (uint64_t)a3, v72);
  uint64_t v74 = *(void **)(v15 + 120);
  *(void *)(v15 + 120) = v73;

  uint64_t v77 = objc_msgSend_copyWithZone_(self->_testOption, v75, (uint64_t)a3, v76);
  id v78 = *(void **)(v15 + 160);
  *(void *)(v15 + 160) = v77;

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v79 = self->_sessionExperiments;
  uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v92, v81, v108, 16);
  if (v82)
  {
    uint64_t v85 = v82;
    uint64_t v86 = *(void *)v93;
    do
    {
      for (uint64_t m = 0; m != v85; ++m)
      {
        if (*(void *)v93 != v86) {
          objc_enumerationMutation(v79);
        }
        v88 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v92 + 1) + 8 * m), v83, (uint64_t)a3, v84, (void)v92);
        objc_msgSend_addSessionExperiments_((void *)v15, v89, (uint64_t)v88, v90);
      }
      uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v83, (uint64_t)&v92, v84, v108, 16);
    }
    while (v85);
  }

  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x20) == 0 || self->_serviceId != *((_DWORD *)v4 + 32)) {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x20) != 0)
  {
    goto LABEL_70;
  }
  clientOsVersiouint64_t n = self->_clientOsVersion;
  uint64_t v11 = v4[9];
  if ((unint64_t)clientOsVersion | v11 && !objc_msgSend_isEqual_(clientOsVersion, v8, v11, v9)) {
    goto LABEL_70;
  }
  clientHwVersiouint64_t n = self->_clientHwVersion;
  uint64_t v13 = v4[8];
  if ((unint64_t)clientHwVersion | v13)
  {
    if (!objc_msgSend_isEqual_(clientHwVersion, v8, v13, v9)) {
      goto LABEL_70;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 172) & 1) == 0 || self->_capabilities != v4[4]) {
      goto LABEL_70;
    }
  }
  else if (*((unsigned char *)v4 + 172))
  {
    goto LABEL_70;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_70;
  }
  subscribedStreams = self->_subscribedStreams;
  uint64_t v17 = v4[19];
  if ((unint64_t)subscribedStreams | v17)
  {
    if (!objc_msgSend_isEqual_(subscribedStreams, v14, v17, v15)) {
      goto LABEL_70;
    }
  }
  $6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x80) == 0) {
      goto LABEL_70;
    }
    if (self->_allWildcardSubscription)
    {
      if (!*((unsigned char *)v4 + 168)) {
        goto LABEL_70;
      }
    }
    else if (*((unsigned char *)v4 + 168))
    {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x80) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 4) == 0 || self->_maxConcurrentStreams != *((_DWORD *)v4 + 22)) {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 4) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 2) == 0 || self->_channelBindingInfo != *((_DWORD *)v4 + 12)) {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 2) != 0)
  {
    goto LABEL_70;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 8) == 0 || self->_maxEmbeddedStatsResponseDelay != *((_DWORD *)v4 + 23)) {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 8) != 0)
  {
    goto LABEL_70;
  }
  quicConnectionInfos = self->_quicConnectionInfos;
  uint64_t v20 = v4[12];
  if ((unint64_t)quicConnectionInfos | v20)
  {
    if (!objc_msgSend_isEqual_(quicConnectionInfos, v14, v20, v15)) {
      goto LABEL_70;
    }
    *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x40) == 0 || self->_stateFlags != *((_DWORD *)v4 + 36)) {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x40) != 0)
  {
    goto LABEL_70;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v22 = v4[7];
  if ((unint64_t)clientContextBlob | v22)
  {
    if (objc_msgSend_isEqual_(clientContextBlob, v14, v22, v15))
    {
      *(unsigned char *)&$6ED8184BF6C186D3D086A5ADEA9C2B68 has = self->_has;
      goto LABEL_53;
    }
LABEL_70:
    char isEqual = 0;
    goto LABEL_71;
  }
LABEL_53:
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 172) & 0x10) == 0 || self->_reason != *((_DWORD *)v4 + 28)) {
      goto LABEL_70;
    }
  }
  else if ((*((unsigned char *)v4 + 172) & 0x10) != 0)
  {
    goto LABEL_70;
  }
  materials = self->_materials;
  uint64_t v24 = v4[10];
  if ((unint64_t)materials | v24 && !objc_msgSend_isEqual_(materials, v14, v24, v15)) {
    goto LABEL_70;
  }
  randomSalt = self->_randomSalt;
  uint64_t v26 = v4[13];
  if ((unint64_t)randomSalt | v26)
  {
    if (!objc_msgSend_isEqual_(randomSalt, v14, v26, v15)) {
      goto LABEL_70;
    }
  }
  accessTokeuint64_t n = self->_accessToken;
  uint64_t v28 = v4[5];
  if ((unint64_t)accessToken | v28)
  {
    if (!objc_msgSend_isEqual_(accessToken, v14, v28, v15)) {
      goto LABEL_70;
    }
  }
  serverBlob = self->_serverBlob;
  uint64_t v30 = v4[15];
  if ((unint64_t)serverBlob | v30)
  {
    if (!objc_msgSend_isEqual_(serverBlob, v14, v30, v15)) {
      goto LABEL_70;
    }
  }
  testOptiouint64_t n = self->_testOption;
  uint64_t v32 = v4[20];
  if ((unint64_t)testOption | v32)
  {
    if (!objc_msgSend_isEqual_(testOption, v14, v32, v15)) {
      goto LABEL_70;
    }
  }
  sessionExperiments = self->_sessionExperiments;
  uint64_t v34 = v4[17];
  if ((unint64_t)sessionExperiments | v34) {
    char isEqual = objc_msgSend_isEqual_(sessionExperiments, v14, v34, v15);
  }
  else {
    char isEqual = 1;
  }
LABEL_71:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v55 = 2654435761 * self->_serviceId;
  }
  else {
    uint64_t v55 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_clientOsVersion, a2, v2, v3);
  uint64_t v58 = objc_msgSend_hash(self->_clientHwVersion, v6, v7, v8);
  if (*(unsigned char *)&self->_has) {
    unint64_t v54 = 2654435761u * self->_capabilities;
  }
  else {
    unint64_t v54 = 0;
  }
  uint64_t v9 = PBRepeatedUInt32Hash();
  uint64_t v13 = objc_msgSend_hash(self->_subscribedStreams, v10, v11, v12);
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v18 = 2654435761 * self->_maxConcurrentStreams;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  uint64_t v17 = 2654435761 * self->_allWildcardSubscription;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    uint64_t v19 = 2654435761 * self->_channelBindingInfo;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v19 = 0;
LABEL_14:
  uint64_t v56 = v19;
  uint64_t v57 = v18;
  uint64_t v20 = v13;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v21 = 2654435761 * self->_maxEmbeddedStatsResponseDelay;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v24 = objc_msgSend_hash(self->_quicConnectionInfos, v14, v15, v16);
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v26 = 2654435761 * self->_stateFlags;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = objc_msgSend_hash(self->_clientContextBlob, v22, v23, v25);
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v31 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v32 = v5 ^ v55 ^ v58 ^ v54 ^ v9 ^ v20 ^ v17 ^ v57 ^ v56 ^ v21 ^ v24 ^ v26 ^ v27;
  uint64_t v33 = v31 ^ objc_msgSend_hash(self->_materials, v28, v29, v30);
  uint64_t v37 = v33 ^ objc_msgSend_hash(self->_randomSalt, v34, v35, v36);
  uint64_t v41 = v37 ^ objc_msgSend_hash(self->_accessToken, v38, v39, v40);
  uint64_t v45 = v32 ^ v41 ^ objc_msgSend_hash(self->_serverBlob, v42, v43, v44);
  uint64_t v49 = objc_msgSend_hash(self->_testOption, v46, v47, v48);
  return v45 ^ v49 ^ objc_msgSend_hash(self->_sessionExperiments, v50, v51, v52);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  uint64_t v7 = v4;
  if ((v4[172] & 0x20) != 0)
  {
    self->_serviceId = *((_DWORD *)v4 + 32);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  uint64_t v8 = *((void *)v4 + 9);
  if (v8) {
    objc_msgSend_setClientOsVersion_(self, v5, v8, v6);
  }
  uint64_t v9 = *((void *)v7 + 8);
  if (v9) {
    objc_msgSend_setClientHwVersion_(self, v5, v9, v6);
  }
  if (v7[172])
  {
    self->_capabilities = *((void *)v7 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v10 = objc_msgSend_publishedStreamIdsCount(v7, v5, v9, v6);
  if (v10)
  {
    uint64_t v13 = v10;
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t v15 = objc_msgSend_publishedStreamIdsAtIndex_(v7, v11, i, v12);
      objc_msgSend_addPublishedStreamIds_(self, v16, v15, v17);
    }
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v18 = *((id *)v7 + 19);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v78, v20, v85, 16);
  if (v21)
  {
    uint64_t v24 = v21;
    uint64_t v25 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v79 != v25) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend_addSubscribedStreams_(self, v22, *(void *)(*((void *)&v78 + 1) + 8 * j), v23);
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v78, v23, v85, 16);
    }
    while (v24);
  }

  int v27 = v7[172];
  if ((v27 & 0x80000000) == 0)
  {
    if ((v27 & 4) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  self->_allWildcardSubscriptiouint64_t n = v7[168];
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v27) = v7[172];
  if ((v27 & 4) != 0)
  {
LABEL_21:
    self->_maxConcurrentStreams = *((_DWORD *)v7 + 22);
    *(unsigned char *)&self->_has |= 4u;
    LOBYTE(v27) = v7[172];
  }
LABEL_22:
  if ((v27 & 2) == 0)
  {
    if ((v27 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  self->_channelBindingInfo = *((_DWORD *)v7 + 12);
  *(unsigned char *)&self->_has |= 2u;
  if ((v7[172] & 8) != 0)
  {
LABEL_24:
    self->_maxEmbeddedStatsResponseDelay = *((_DWORD *)v7 + 23);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_25:
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v28 = *((id *)v7 + 12);
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v74, v30, v84, 16);
  if (v31)
  {
    uint64_t v34 = v31;
    uint64_t v35 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v75 != v35) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend_addQuicConnectionInfo_(self, v32, *(void *)(*((void *)&v74 + 1) + 8 * k), v33);
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v32, (uint64_t)&v74, v33, v84, 16);
    }
    while (v34);
  }

  if ((v7[172] & 0x40) != 0)
  {
    self->_stateFlags = *((_DWORD *)v7 + 36);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v40 = *((void *)v7 + 7);
  if (clientContextBlob)
  {
    if (v40) {
      objc_msgSend_mergeFrom_(clientContextBlob, v37, v40, v38);
    }
  }
  else if (v40)
  {
    objc_msgSend_setClientContextBlob_(self, v37, v40, v38);
  }
  if ((v7[172] & 0x10) != 0)
  {
    self->_int reason = *((_DWORD *)v7 + 28);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v41 = *((id *)v7 + 10);
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v70, v43, v83, 16);
  if (v44)
  {
    uint64_t v47 = v44;
    uint64_t v48 = *(void *)v71;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v71 != v48) {
          objc_enumerationMutation(v41);
        }
        objc_msgSend_addMaterials_(self, v45, *(void *)(*((void *)&v70 + 1) + 8 * m), v46);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v45, (uint64_t)&v70, v46, v83, 16);
    }
    while (v47);
  }

  uint64_t v52 = *((void *)v7 + 13);
  if (v52) {
    objc_msgSend_setRandomSalt_(self, v50, v52, v51);
  }
  uint64_t v53 = *((void *)v7 + 5);
  if (v53) {
    objc_msgSend_setAccessToken_(self, v50, v53, v51);
  }
  uint64_t v54 = *((void *)v7 + 15);
  if (v54) {
    objc_msgSend_setServerBlob_(self, v50, v54, v51);
  }
  testOptiouint64_t n = self->_testOption;
  uint64_t v56 = *((void *)v7 + 20);
  if (testOption)
  {
    if (v56) {
      objc_msgSend_mergeFrom_(testOption, v50, v56, v51);
    }
  }
  else if (v56)
  {
    objc_msgSend_setTestOption_(self, v50, v56, v51);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v57 = *((id *)v7 + 17);
  uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v66, v59, v82, 16);
  if (v60)
  {
    uint64_t v63 = v60;
    uint64_t v64 = *(void *)v67;
    do
    {
      for (uint64_t n = 0; n != v63; ++n)
      {
        if (*(void *)v67 != v64) {
          objc_enumerationMutation(v57);
        }
        objc_msgSend_addSessionExperiments_(self, v61, *(void *)(*((void *)&v66 + 1) + 8 * n), v62, (void)v66);
      }
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v61, (uint64_t)&v66, v62, v82, 16);
    }
    while (v63);
  }
}

- (unsigned)serviceId
{
  return self->_serviceId;
}

- (NSString)clientOsVersion
{
  return self->_clientOsVersion;
}

- (void)setClientOsVersion:(id)a3
{
}

- (NSString)clientHwVersion
{
  return self->_clientHwVersion;
}

- (void)setClientHwVersion:(id)a3
{
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (NSMutableArray)subscribedStreams
{
  return self->_subscribedStreams;
}

- (void)setSubscribedStreams:(id)a3
{
}

- (BOOL)allWildcardSubscription
{
  return self->_allWildcardSubscription;
}

- (unsigned)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (unsigned)channelBindingInfo
{
  return self->_channelBindingInfo;
}

- (unsigned)maxEmbeddedStatsResponseDelay
{
  return self->_maxEmbeddedStatsResponseDelay;
}

- (NSMutableArray)quicConnectionInfos
{
  return self->_quicConnectionInfos;
}

- (void)setQuicConnectionInfos:(id)a3
{
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (IDSQRProtoMaterial)clientContextBlob
{
  return self->_clientContextBlob;
}

- (void)setClientContextBlob:(id)a3
{
}

- (NSData)randomSalt
{
  return self->_randomSalt;
}

- (void)setRandomSalt:(id)a3
{
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (NSData)serverBlob
{
  return self->_serverBlob;
}

- (void)setServerBlob:(id)a3
{
}

- (IDSQRProtoAllocBindTestOption)testOption
{
  return self->_testOption;
}

- (void)setTestOption:(id)a3
{
}

- (NSMutableArray)sessionExperiments
{
  return self->_sessionExperiments;
}

- (void)setSessionExperiments:(id)a3
{
}

- (NSMutableArray)materials
{
  return self->_materials;
}

- (void)setMaterials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOption, 0);
  objc_storeStrong((id *)&self->_subscribedStreams, 0);
  objc_storeStrong((id *)&self->_sessionExperiments, 0);
  objc_storeStrong((id *)&self->_serverBlob, 0);
  objc_storeStrong((id *)&self->_randomSalt, 0);
  objc_storeStrong((id *)&self->_quicConnectionInfos, 0);
  objc_storeStrong((id *)&self->_materials, 0);
  objc_storeStrong((id *)&self->_clientOsVersion, 0);
  objc_storeStrong((id *)&self->_clientHwVersion, 0);
  objc_storeStrong((id *)&self->_clientContextBlob, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end