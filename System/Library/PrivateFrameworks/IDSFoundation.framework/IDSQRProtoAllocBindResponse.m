@interface IDSQRProtoAllocBindResponse
+ (Class)activeExperimentsType;
+ (Class)materialsType;
+ (Class)peerPublishedStreamsType;
+ (Class)quicConnectionInfoType;
- (BOOL)hasChannelSettings;
- (BOOL)hasGenerationCounter;
- (BOOL)hasLinkId;
- (BOOL)hasParticipantType;
- (BOOL)hasReportingDataBlob;
- (BOOL)hasSessionStateCounter;
- (BOOL)hasSoftware;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)reportingDataBlob;
- (NSMutableArray)activeExperiments;
- (NSMutableArray)materials;
- (NSMutableArray)peerPublishedStreams;
- (NSMutableArray)quicConnectionInfos;
- (NSString)clientAddress;
- (NSString)software;
- (id)activeExperimentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialsAtIndex:(unint64_t)a3;
- (id)peerPublishedStreamsAtIndex:(unint64_t)a3;
- (id)quicConnectionInfoAtIndex:(unint64_t)a3;
- (unint64_t)activeExperimentsCount;
- (unint64_t)hash;
- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3;
- (unint64_t)lightweightParticipantIdLists;
- (unint64_t)lightweightParticipantIdListsCount;
- (unint64_t)materialsCount;
- (unint64_t)peerPublishedStreamsCount;
- (unint64_t)peerSubscribedStreamIdsCount;
- (unint64_t)quicConnectionInfosCount;
- (unsigned)channelId;
- (unsigned)channelSettings;
- (unsigned)generationCounter;
- (unsigned)linkId;
- (unsigned)participantType;
- (unsigned)peerSubscribedStreamIds;
- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3;
- (unsigned)sessionStateCounter;
- (void)addActiveExperiments:(id)a3;
- (void)addLightweightParticipantIdList:(unint64_t)a3;
- (void)addMaterials:(id)a3;
- (void)addPeerPublishedStreams:(id)a3;
- (void)addPeerSubscribedStreamIds:(unsigned int)a3;
- (void)addQuicConnectionInfo:(id)a3;
- (void)clearActiveExperiments;
- (void)clearLightweightParticipantIdLists;
- (void)clearMaterials;
- (void)clearPeerPublishedStreams;
- (void)clearPeerSubscribedStreamIds;
- (void)clearQuicConnectionInfos;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActiveExperiments:(id)a3;
- (void)setChannelId:(unsigned int)a3;
- (void)setChannelSettings:(unsigned int)a3;
- (void)setClientAddress:(id)a3;
- (void)setGenerationCounter:(unsigned int)a3;
- (void)setHasChannelSettings:(BOOL)a3;
- (void)setHasGenerationCounter:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasParticipantType:(BOOL)a3;
- (void)setHasSessionStateCounter:(BOOL)a3;
- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setLinkId:(unsigned int)a3;
- (void)setMaterials:(id)a3;
- (void)setParticipantType:(unsigned int)a3;
- (void)setPeerPublishedStreams:(id)a3;
- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setQuicConnectionInfos:(id)a3;
- (void)setReportingDataBlob:(id)a3;
- (void)setSessionStateCounter:(unsigned int)a3;
- (void)setSoftware:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoAllocBindResponse

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoAllocBindResponse;
  [(IDSQRProtoAllocBindResponse *)&v3 dealloc];
}

- (BOOL)hasSoftware
{
  return self->_software != 0;
}

- (void)clearPeerPublishedStreams
{
  objc_msgSend_removeAllObjects(self->_peerPublishedStreams, a2, v2, v3);
}

- (void)addPeerPublishedStreams:(id)a3
{
  v4 = (const char *)a3;
  peerPublishedStreams = self->_peerPublishedStreams;
  v9 = (char *)v4;
  if (!peerPublishedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_peerPublishedStreams;
    self->_peerPublishedStreams = v7;

    v4 = v9;
    peerPublishedStreams = self->_peerPublishedStreams;
  }
  objc_msgSend_addObject_(peerPublishedStreams, v4, (uint64_t)v4, v5);
}

- (unint64_t)peerPublishedStreamsCount
{
  return objc_msgSend_count(self->_peerPublishedStreams, a2, v2, v3);
}

- (id)peerPublishedStreamsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_peerPublishedStreams, a2, a3, v3);
}

+ (Class)peerPublishedStreamsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)peerSubscribedStreamIdsCount
{
  return self->_peerSubscribedStreamIds.count;
}

- (unsigned)peerSubscribedStreamIds
{
  return self->_peerSubscribedStreamIds.list;
}

- (void)clearPeerSubscribedStreamIds
{
}

- (void)addPeerSubscribedStreamIds:(unsigned int)a3
{
}

- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3
{
  p_peerSubscribedStreamIds = &self->_peerSubscribedStreamIds;
  unint64_t count = self->_peerSubscribedStreamIds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_peerSubscribedStreamIds->list[a3];
}

- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setLinkId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_linkId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setChannelSettings:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelSettings = a3;
}

- (void)setHasChannelSettings:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelSettings
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasReportingDataBlob
{
  return self->_reportingDataBlob != 0;
}

- (unint64_t)lightweightParticipantIdListsCount
{
  return self->_lightweightParticipantIdLists.count;
}

- (unint64_t)lightweightParticipantIdLists
{
  return self->_lightweightParticipantIdLists.list;
}

- (void)clearLightweightParticipantIdLists
{
}

- (void)addLightweightParticipantIdList:(unint64_t)a3
{
}

- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3
{
  p_lightweightParticipantIdLists = &self->_lightweightParticipantIdLists;
  unint64_t count = self->_lightweightParticipantIdLists.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_lightweightParticipantIdLists->list[a3];
}

- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4
{
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

- (void)setParticipantType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_participantType = a3;
}

- (void)setHasParticipantType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasParticipantType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setGenerationCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_generationCounter = a3;
}

- (void)setHasGenerationCounter:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationCounter
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSessionStateCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sessionStateCounter = a3;
}

- (void)setHasSessionStateCounter:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSessionStateCounter
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearMaterials
{
  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)addMaterials:(id)a3
{
  v4 = (const char *)a3;
  materials = self->_materials;
  v9 = (char *)v4;
  if (!materials)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_materials;
    self->_materials = v7;

    v4 = v9;
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

- (void)clearActiveExperiments
{
  objc_msgSend_removeAllObjects(self->_activeExperiments, a2, v2, v3);
}

- (void)addActiveExperiments:(id)a3
{
  v4 = (const char *)a3;
  activeExperiments = self->_activeExperiments;
  v9 = (char *)v4;
  if (!activeExperiments)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_activeExperiments;
    self->_activeExperiments = v7;

    v4 = v9;
    activeExperiments = self->_activeExperiments;
  }
  objc_msgSend_addObject_(activeExperiments, v4, (uint64_t)v4, v5);
}

- (unint64_t)activeExperimentsCount
{
  return objc_msgSend_count(self->_activeExperiments, a2, v2, v3);
}

- (id)activeExperimentsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_activeExperiments, a2, a3, v3);
}

+ (Class)activeExperimentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoAllocBindResponse;
  v4 = [(IDSQRProtoAllocBindResponse *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v8 = v5;
  clientAddress = self->_clientAddress;
  if (clientAddress) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)clientAddress, v7, @"client_address");
  }
  double v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_channelId, v7);
  objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, @"channel_id");

  software = self->_software;
  if (software) {
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)software, v14, @"software");
  }
  if (objc_msgSend_count(self->_peerPublishedStreams, v13, (uint64_t)software, v14))
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v20 = objc_msgSend_count(self->_peerPublishedStreams, v17, v18, v19);
    v23 = objc_msgSend_initWithCapacity_(v16, v21, v20, v22);
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    v24 = self->_peerPublishedStreams;
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v156, v26, v163, 16);
    if (v27)
    {
      uint64_t v31 = v27;
      uint64_t v32 = *(void *)v157;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v157 != v32) {
            objc_enumerationMutation(v24);
          }
          v34 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v156 + 1) + 8 * i), v28, v29, v30);
          objc_msgSend_addObject_(v23, v35, (uint64_t)v34, v36);
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v28, (uint64_t)&v156, v30, v163, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v8, v37, (uint64_t)v23, v38, @"peer_published_streams");
  }
  v39 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v8, v40, (uint64_t)v39, v41, @"peer_subscribed_stream_ids");

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v45 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v42, self->_linkId, v43);
    objc_msgSend_setObject_forKey_(v8, v46, (uint64_t)v45, v47, @"link_id");

    char has = (char)self->_has;
  }
  if (has)
  {
    v48 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v42, self->_channelSettings, v43);
    objc_msgSend_setObject_forKey_(v8, v49, (uint64_t)v48, v50, @"channel_settings");
  }
  reportingDataBlob = self->_reportingDataBlob;
  if (reportingDataBlob) {
    objc_msgSend_setObject_forKey_(v8, v42, (uint64_t)reportingDataBlob, v43, @"reporting_data_blob");
  }
  v52 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v8, v53, (uint64_t)v52, v54, @"lightweight_participant_id_list");

  if (objc_msgSend_count(self->_quicConnectionInfos, v55, v56, v57))
  {
    id v61 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v65 = objc_msgSend_count(self->_quicConnectionInfos, v62, v63, v64);
    v68 = objc_msgSend_initWithCapacity_(v61, v66, v65, v67);
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v69 = self->_quicConnectionInfos;
    uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v152, v71, v162, 16);
    if (v72)
    {
      uint64_t v76 = v72;
      uint64_t v77 = *(void *)v153;
      do
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v153 != v77) {
            objc_enumerationMutation(v69);
          }
          v79 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v152 + 1) + 8 * j), v73, v74, v75);
          objc_msgSend_addObject_(v68, v80, (uint64_t)v79, v81);
        }
        uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v73, (uint64_t)&v152, v75, v162, 16);
      }
      while (v76);
    }

    objc_msgSend_setObject_forKey_(v8, v82, (uint64_t)v68, v83, @"quic_connection_info");
  }
  char v84 = (char)self->_has;
  if ((v84 & 8) != 0)
  {
    v138 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v58, self->_participantType, v60);
    objc_msgSend_setObject_forKey_(v8, v139, (uint64_t)v138, v140, @"participant_type");

    char v84 = (char)self->_has;
    if ((v84 & 2) == 0)
    {
LABEL_31:
      if ((v84 & 0x10) == 0) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_31;
  }
  v141 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v58, self->_generationCounter, v60);
  objc_msgSend_setObject_forKey_(v8, v142, (uint64_t)v141, v143, @"generation_counter");

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_32:
    v85 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v58, self->_sessionStateCounter, v60);
    objc_msgSend_setObject_forKey_(v8, v86, (uint64_t)v85, v87, @"session_state_counter");
  }
LABEL_33:
  if (objc_msgSend_count(self->_materials, v58, v59, v60))
  {
    id v91 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v95 = objc_msgSend_count(self->_materials, v92, v93, v94);
    v98 = objc_msgSend_initWithCapacity_(v91, v96, v95, v97);
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    v99 = self->_materials;
    uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v148, v101, v161, 16);
    if (v102)
    {
      uint64_t v106 = v102;
      uint64_t v107 = *(void *)v149;
      do
      {
        for (uint64_t k = 0; k != v106; ++k)
        {
          if (*(void *)v149 != v107) {
            objc_enumerationMutation(v99);
          }
          v109 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v148 + 1) + 8 * k), v103, v104, v105);
          objc_msgSend_addObject_(v98, v110, (uint64_t)v109, v111);
        }
        uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v103, (uint64_t)&v148, v105, v161, 16);
      }
      while (v106);
    }

    objc_msgSend_setObject_forKey_(v8, v112, (uint64_t)v98, v113, @"materials");
  }
  if (objc_msgSend_count(self->_activeExperiments, v88, v89, v90))
  {
    id v114 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v118 = objc_msgSend_count(self->_activeExperiments, v115, v116, v117);
    v121 = objc_msgSend_initWithCapacity_(v114, v119, v118, v120);
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    v122 = self->_activeExperiments;
    uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v144, v124, v160, 16);
    if (v125)
    {
      uint64_t v129 = v125;
      uint64_t v130 = *(void *)v145;
      do
      {
        for (uint64_t m = 0; m != v129; ++m)
        {
          if (*(void *)v145 != v130) {
            objc_enumerationMutation(v122);
          }
          v132 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v144 + 1) + 8 * m), v126, v127, v128, (void)v144);
          objc_msgSend_addObject_(v121, v133, (uint64_t)v132, v134);
        }
        uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v126, (uint64_t)&v144, v128, v160, 16);
      }
      while (v129);
    }

    objc_msgSend_setObject_forKey_(v8, v135, (uint64_t)v121, v136, @"active_experiments");
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoAllocBindResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_clientAddress) {
    sub_19DB806A4();
  }
  double v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_software) {
    PBDataWriterWriteStringField();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v6 = self->_peerPublishedStreams;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v58, v8, v65, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v59 != v11) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v58, v14, v65, 16);
    }
    while (v10);
  }

  if (self->_peerSubscribedStreamIds.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v15;
    }
    while (v15 < self->_peerSubscribedStreamIds.count);
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_reportingDataBlob) {
    PBDataWriterWriteDataField();
  }
  if (self->_lightweightParticipantIdLists.count)
  {
    unint64_t v17 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v17;
    }
    while (v17 < self->_lightweightParticipantIdLists.count);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v18 = self->_quicConnectionInfos;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v54, v20, v64, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v25, (uint64_t)&v54, v26, v64, 16);
    }
    while (v22);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v27 = self->_materials;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v50, v29, v63, 16);
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v34, (uint64_t)&v50, v35, v63, 16);
    }
    while (v31);
  }

  char v36 = (char)self->_has;
  if ((v36 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v36 = (char)self->_has;
  }
  if ((v36 & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v37 = self->_activeExperiments;
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v46, v39, v62, 16);
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v47 != v42) {
          objc_enumerationMutation(v37);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v44, (uint64_t)&v46, v45, v62, 16);
    }
    while (v41);
  }
}

- (void)copyTo:(id)a3
{
  id v86 = a3;
  objc_msgSend_setClientAddress_(v86, v4, (uint64_t)self->_clientAddress, v5);
  *((_DWORD *)v86 + 16) = self->_channelId;
  software = self->_software;
  if (software) {
    objc_msgSend_setSoftware_(v86, v6, (uint64_t)software, v7);
  }
  if (objc_msgSend_peerPublishedStreamsCount(self, v6, (uint64_t)software, v7))
  {
    objc_msgSend_clearPeerPublishedStreams(v86, v9, v10, v11);
    uint64_t v15 = objc_msgSend_peerPublishedStreamsCount(self, v12, v13, v14);
    if (v15)
    {
      uint64_t v16 = v15;
      for (uint64_t i = 0; i != v16; ++i)
      {
        uint64_t v18 = objc_msgSend_peerPublishedStreamsAtIndex_(self, v9, i, v11);
        objc_msgSend_addPeerPublishedStreams_(v86, v19, (uint64_t)v18, v20);
      }
    }
  }
  if (objc_msgSend_peerSubscribedStreamIdsCount(self, v9, v10, v11))
  {
    objc_msgSend_clearPeerSubscribedStreamIds(v86, v21, v22, v23);
    uint64_t v27 = objc_msgSend_peerSubscribedStreamIdsCount(self, v24, v25, v26);
    if (v27)
    {
      uint64_t v28 = v27;
      for (uint64_t j = 0; j != v28; ++j)
      {
        uint64_t v30 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(self, v21, j, v23);
        objc_msgSend_addPeerSubscribedStreamIds_(v86, v31, v30, v32);
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v86 + 21) = self->_linkId;
    *((unsigned char *)v86 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v86 + 17) = self->_channelSettings;
    *((unsigned char *)v86 + 144) |= 1u;
  }
  reportingDataBlob = self->_reportingDataBlob;
  if (reportingDataBlob) {
    objc_msgSend_setReportingDataBlob_(v86, v21, (uint64_t)reportingDataBlob, v23);
  }
  if (objc_msgSend_lightweightParticipantIdListsCount(self, v21, (uint64_t)reportingDataBlob, v23))
  {
    objc_msgSend_clearLightweightParticipantIdLists(v86, v35, v36, v37);
    uint64_t v41 = objc_msgSend_lightweightParticipantIdListsCount(self, v38, v39, v40);
    if (v41)
    {
      uint64_t v42 = v41;
      for (uint64_t k = 0; k != v42; ++k)
      {
        uint64_t v44 = objc_msgSend_lightweightParticipantIdListAtIndex_(self, v35, k, v37);
        objc_msgSend_addLightweightParticipantIdList_(v86, v45, v44, v46);
      }
    }
  }
  if (objc_msgSend_quicConnectionInfosCount(self, v35, v36, v37))
  {
    objc_msgSend_clearQuicConnectionInfos(v86, v47, v48, v49);
    uint64_t v53 = objc_msgSend_quicConnectionInfosCount(self, v50, v51, v52);
    if (v53)
    {
      uint64_t v54 = v53;
      for (uint64_t m = 0; m != v54; ++m)
      {
        long long v56 = objc_msgSend_quicConnectionInfoAtIndex_(self, v47, m, v49);
        objc_msgSend_addQuicConnectionInfo_(v86, v57, (uint64_t)v56, v58);
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v86 + 24) = self->_participantType;
    *((unsigned char *)v86 + 144) |= 8u;
  }
  if (objc_msgSend_materialsCount(self, v47, v48, v49))
  {
    objc_msgSend_clearMaterials(v86, v59, v60, v61);
    uint64_t v65 = objc_msgSend_materialsCount(self, v62, v63, v64);
    if (v65)
    {
      uint64_t v66 = v65;
      for (uint64_t n = 0; n != v66; ++n)
      {
        v68 = objc_msgSend_materialsAtIndex_(self, v59, n, v61);
        objc_msgSend_addMaterials_(v86, v69, (uint64_t)v68, v70);
      }
    }
  }
  char v71 = (char)self->_has;
  if ((v71 & 2) != 0)
  {
    *((_DWORD *)v86 + 20) = self->_generationCounter;
    *((unsigned char *)v86 + 144) |= 2u;
    char v71 = (char)self->_has;
  }
  if ((v71 & 0x10) != 0)
  {
    *((_DWORD *)v86 + 32) = self->_sessionStateCounter;
    *((unsigned char *)v86 + 144) |= 0x10u;
  }
  if (objc_msgSend_activeExperimentsCount(self, v59, v60, v61))
  {
    objc_msgSend_clearActiveExperiments(v86, v72, v73, v74);
    uint64_t active = objc_msgSend_activeExperimentsCount(self, v75, v76, v77);
    if (active)
    {
      uint64_t v81 = active;
      for (iuint64_t i = 0; ii != v81; ++ii)
      {
        double v83 = objc_msgSend_activeExperimentsAtIndex_(self, v79, ii, v80);
        objc_msgSend_addActiveExperiments_(v86, v84, (uint64_t)v83, v85);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  double v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_clientAddress, v13, (uint64_t)a3, v14);
  uint64_t v16 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = v15;

  *(_DWORD *)(v12 + 64) = self->_channelId;
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_software, v17, (uint64_t)a3, v18);
  double v20 = *(void **)(v12 + 136);
  *(void *)(v12 + 136) = v19;

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v21 = self->_peerPublishedStreams;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v88, v23, v95, 16);
  if (v24)
  {
    uint64_t v27 = v24;
    uint64_t v28 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v89 != v28) {
          objc_enumerationMutation(v21);
        }
        uint64_t v30 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v88 + 1) + 8 * i), v25, (uint64_t)a3, v26);
        objc_msgSend_addPeerPublishedStreams_((void *)v12, v31, (uint64_t)v30, v32);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v25, (uint64_t)&v88, v26, v95, 16);
    }
    while (v27);
  }

  PBRepeatedUInt32Copy();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v12 + 84) = self->_linkId;
    *(unsigned char *)(v12 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v12 + 68) = self->_channelSettings;
    *(unsigned char *)(v12 + 144) |= 1u;
  }
  uint64_t v36 = objc_msgSend_copyWithZone_(self->_reportingDataBlob, v33, (uint64_t)a3, v34);
  double v37 = *(void **)(v12 + 120);
  *(void *)(v12 + 120) = v36;

  PBRepeatedUInt64Copy();
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  double v38 = self->_quicConnectionInfos;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v84, v40, v94, 16);
  if (v41)
  {
    uint64_t v44 = v41;
    uint64_t v45 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v85 != v45) {
          objc_enumerationMutation(v38);
        }
        long long v47 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v84 + 1) + 8 * j), v42, (uint64_t)a3, v43);
        objc_msgSend_addQuicConnectionInfo_((void *)v12, v48, (uint64_t)v47, v49);
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v42, (uint64_t)&v84, v43, v94, 16);
    }
    while (v44);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v12 + 96) = self->_participantType;
    *(unsigned char *)(v12 + 144) |= 8u;
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v50 = self->_materials;
  uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v80, v52, v93, 16);
  if (v53)
  {
    uint64_t v56 = v53;
    uint64_t v57 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v56; ++k)
      {
        if (*(void *)v81 != v57) {
          objc_enumerationMutation(v50);
        }
        long long v59 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v80 + 1) + 8 * k), v54, (uint64_t)a3, v55);
        objc_msgSend_addMaterials_((void *)v12, v60, (uint64_t)v59, v61);
      }
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v54, (uint64_t)&v80, v55, v93, 16);
    }
    while (v56);
  }

  char v62 = (char)self->_has;
  if ((v62 & 2) != 0)
  {
    *(_DWORD *)(v12 + 80) = self->_generationCounter;
    *(unsigned char *)(v12 + 144) |= 2u;
    char v62 = (char)self->_has;
  }
  if ((v62 & 0x10) != 0)
  {
    *(_DWORD *)(v12 + 128) = self->_sessionStateCounter;
    *(unsigned char *)(v12 + 144) |= 0x10u;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v63 = self->_activeExperiments;
  uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v76, v65, v92, 16);
  if (v66)
  {
    uint64_t v69 = v66;
    uint64_t v70 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v69; ++m)
      {
        if (*(void *)v77 != v70) {
          objc_enumerationMutation(v63);
        }
        uint64_t v72 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v76 + 1) + 8 * m), v67, (uint64_t)a3, v68, (void)v76);
        objc_msgSend_addActiveExperiments_((void *)v12, v73, (uint64_t)v72, v74);
      }
      uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v67, (uint64_t)&v76, v68, v92, 16);
    }
    while (v69);
  }

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_45;
  }
  clientAddress = self->_clientAddress;
  uint64_t v11 = v4[9];
  if ((unint64_t)clientAddress | v11)
  {
    if (!objc_msgSend_isEqual_(clientAddress, v8, v11, v9)) {
      goto LABEL_45;
    }
  }
  if (self->_channelId != *((_DWORD *)v4 + 16)) {
    goto LABEL_45;
  }
  software = self->_software;
  uint64_t v13 = v4[17];
  if ((unint64_t)software | v13)
  {
    if (!objc_msgSend_isEqual_(software, v8, v13, v9)) {
      goto LABEL_45;
    }
  }
  peerPublishedStreams = self->_peerPublishedStreams;
  uint64_t v15 = v4[13];
  if ((unint64_t)peerPublishedStreams | v15)
  {
    if (!objc_msgSend_isEqual_(peerPublishedStreams, v8, v15, v9)) {
      goto LABEL_45;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[18] & 4) == 0 || self->_linkId != *((_DWORD *)v4 + 21)) {
      goto LABEL_45;
    }
  }
  else if ((v4[18] & 4) != 0)
  {
    goto LABEL_45;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[18] & 1) == 0 || self->_channelSettings != *((_DWORD *)v4 + 17)) {
      goto LABEL_45;
    }
  }
  else if (v4[18])
  {
    goto LABEL_45;
  }
  reportingDataBlob = self->_reportingDataBlob;
  uint64_t v19 = v4[15];
  if ((unint64_t)reportingDataBlob | v19
    && !objc_msgSend_isEqual_(reportingDataBlob, v16, v19, v17))
  {
    goto LABEL_45;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_45;
  }
  quicConnectionInfos = self->_quicConnectionInfos;
  uint64_t v23 = v4[14];
  if ((unint64_t)quicConnectionInfos | v23)
  {
    if (!objc_msgSend_isEqual_(quicConnectionInfos, v20, v23, v21)) {
      goto LABEL_45;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((v4[18] & 8) == 0 || self->_participantType != *((_DWORD *)v4 + 24)) {
      goto LABEL_45;
    }
  }
  else if ((v4[18] & 8) != 0)
  {
    goto LABEL_45;
  }
  materials = self->_materials;
  uint64_t v26 = v4[11];
  if ((unint64_t)materials | v26)
  {
    if (!objc_msgSend_isEqual_(materials, v20, v26, v21))
    {
LABEL_45:
      char isEqual = 0;
      goto LABEL_46;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[18] & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 20)) {
      goto LABEL_45;
    }
  }
  else if ((v4[18] & 2) != 0)
  {
    goto LABEL_45;
  }
  if ((has & 0x10) != 0)
  {
    if ((v4[18] & 0x10) == 0 || self->_sessionStateCounter != *((_DWORD *)v4 + 32)) {
      goto LABEL_45;
    }
  }
  else if ((v4[18] & 0x10) != 0)
  {
    goto LABEL_45;
  }
  activeExperiments = self->_activeExperiments;
  uint64_t v28 = v4[7];
  if ((unint64_t)activeExperiments | v28) {
    char isEqual = objc_msgSend_isEqual_(activeExperiments, v20, v28, v21);
  }
  else {
    char isEqual = 1;
  }
LABEL_46:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_clientAddress, a2, v2, v3);
  unsigned int channelId = self->_channelId;
  uint64_t v39 = v5;
  uint64_t v37 = objc_msgSend_hash(self->_software, v6, v7, v8);
  uint64_t v35 = objc_msgSend_hash(self->_peerPublishedStreams, v9, v10, v11);
  uint64_t v14 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v16 = 2654435761 * self->_linkId;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v17 = 2654435761 * self->_channelSettings;
      goto LABEL_6;
    }
  }
  uint64_t v17 = 0;
LABEL_6:
  uint64_t v18 = objc_msgSend_hash(self->_reportingDataBlob, v12, v13, v15, v35);
  uint64_t v19 = PBRepeatedUInt64Hash();
  uint64_t v25 = objc_msgSend_hash(self->_quicConnectionInfos, v20, v21, v22);
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v27 = 2654435761 * self->_participantType;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = objc_msgSend_hash(self->_materials, v23, v24, v26);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v32 = 2654435761 * self->_generationCounter;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v33 = 0;
    return (2654435761 * channelId) ^ v39 ^ v37 ^ v36 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v25 ^ v27 ^ v28 ^ v32 ^ v33 ^ objc_msgSend_hash(self->_activeExperiments, v29, v30, v31);
  }
  uint64_t v32 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v33 = 2654435761 * self->_sessionStateCounter;
  return (2654435761 * channelId) ^ v39 ^ v37 ^ v36 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v25 ^ v27 ^ v28 ^ v32 ^ v33 ^ objc_msgSend_hash(self->_activeExperiments, v29, v30, v31);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v7 = *((void *)v5 + 9);
  if (v7) {
    objc_msgSend_setClientAddress_(self, v4, v7, v6);
  }
  self->_unsigned int channelId = *((_DWORD *)v5 + 16);
  uint64_t v8 = *((void *)v5 + 17);
  if (v8) {
    objc_msgSend_setSoftware_(self, v4, v8, v6);
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v9 = *((id *)v5 + 13);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v79, v11, v86, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v80 != v16) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addPeerPublishedStreams_(self, v13, *(void *)(*((void *)&v79 + 1) + 8 * i), v14);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v13, (uint64_t)&v79, v14, v86, 16);
    }
    while (v15);
  }

  uint64_t v21 = objc_msgSend_peerSubscribedStreamIdsCount(v5, v18, v19, v20);
  if (v21)
  {
    uint64_t v24 = v21;
    for (uint64_t j = 0; j != v24; ++j)
    {
      uint64_t v26 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(v5, v22, j, v23);
      objc_msgSend_addPeerSubscribedStreamIds_(self, v27, v26, v28);
    }
  }
  char v29 = *((unsigned char *)v5 + 144);
  if ((v29 & 4) != 0)
  {
    self->_linkId = *((_DWORD *)v5 + 21);
    *(unsigned char *)&self->_has |= 4u;
    char v29 = *((unsigned char *)v5 + 144);
  }
  if (v29)
  {
    self->_channelSettings = *((_DWORD *)v5 + 17);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v30 = *((void *)v5 + 15);
  if (v30) {
    objc_msgSend_setReportingDataBlob_(self, v22, v30, v23);
  }
  uint64_t v31 = objc_msgSend_lightweightParticipantIdListsCount(v5, v22, v30, v23);
  if (v31)
  {
    uint64_t v34 = v31;
    for (uint64_t k = 0; k != v34; ++k)
    {
      uint64_t v36 = objc_msgSend_lightweightParticipantIdListAtIndex_(v5, v32, k, v33);
      objc_msgSend_addLightweightParticipantIdList_(self, v37, v36, v38);
    }
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v39 = *((id *)v5 + 14);
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v75, v41, v85, 16);
  if (v42)
  {
    uint64_t v45 = v42;
    uint64_t v46 = *(void *)v76;
    do
    {
      for (uint64_t m = 0; m != v45; ++m)
      {
        if (*(void *)v76 != v46) {
          objc_enumerationMutation(v39);
        }
        objc_msgSend_addQuicConnectionInfo_(self, v43, *(void *)(*((void *)&v75 + 1) + 8 * m), v44);
      }
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v43, (uint64_t)&v75, v44, v85, 16);
    }
    while (v45);
  }

  if ((*((unsigned char *)v5 + 144) & 8) != 0)
  {
    self->_participantType = *((_DWORD *)v5 + 24);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v48 = *((id *)v5 + 11);
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v71, v50, v84, 16);
  if (v51)
  {
    uint64_t v54 = v51;
    uint64_t v55 = *(void *)v72;
    do
    {
      for (uint64_t n = 0; n != v54; ++n)
      {
        if (*(void *)v72 != v55) {
          objc_enumerationMutation(v48);
        }
        objc_msgSend_addMaterials_(self, v52, *(void *)(*((void *)&v71 + 1) + 8 * n), v53);
      }
      uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v52, (uint64_t)&v71, v53, v84, 16);
    }
    while (v54);
  }

  char v57 = *((unsigned char *)v5 + 144);
  if ((v57 & 2) != 0)
  {
    self->_generationCounter = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 2u;
    char v57 = *((unsigned char *)v5 + 144);
  }
  if ((v57 & 0x10) != 0)
  {
    self->_sessionStateCounter = *((_DWORD *)v5 + 32);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v58 = *((id *)v5 + 7);
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v67, v60, v83, 16);
  if (v61)
  {
    uint64_t v64 = v61;
    uint64_t v65 = *(void *)v68;
    do
    {
      for (iuint64_t i = 0; ii != v64; ++ii)
      {
        if (*(void *)v68 != v65) {
          objc_enumerationMutation(v58);
        }
        objc_msgSend_addActiveExperiments_(self, v62, *(void *)(*((void *)&v67 + 1) + 8 * ii), v63, (void)v67);
      }
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v62, (uint64_t)&v67, v63, v83, 16);
    }
    while (v64);
  }
}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
}

- (unsigned)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(unsigned int)a3
{
  self->_unsigned int channelId = a3;
}

- (NSString)software
{
  return self->_software;
}

- (void)setSoftware:(id)a3
{
}

- (NSMutableArray)peerPublishedStreams
{
  return self->_peerPublishedStreams;
}

- (void)setPeerPublishedStreams:(id)a3
{
}

- (unsigned)linkId
{
  return self->_linkId;
}

- (unsigned)channelSettings
{
  return self->_channelSettings;
}

- (NSData)reportingDataBlob
{
  return self->_reportingDataBlob;
}

- (void)setReportingDataBlob:(id)a3
{
}

- (NSMutableArray)quicConnectionInfos
{
  return self->_quicConnectionInfos;
}

- (void)setQuicConnectionInfos:(id)a3
{
}

- (unsigned)participantType
{
  return self->_participantType;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

- (NSMutableArray)materials
{
  return self->_materials;
}

- (void)setMaterials:(id)a3
{
}

- (NSMutableArray)activeExperiments
{
  return self->_activeExperiments;
}

- (void)setActiveExperiments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_software, 0);
  objc_storeStrong((id *)&self->_reportingDataBlob, 0);
  objc_storeStrong((id *)&self->_quicConnectionInfos, 0);
  objc_storeStrong((id *)&self->_peerPublishedStreams, 0);
  objc_storeStrong((id *)&self->_materials, 0);
  objc_storeStrong((id *)&self->_clientAddress, 0);
  objc_storeStrong((id *)&self->_activeExperiments, 0);
}

@end