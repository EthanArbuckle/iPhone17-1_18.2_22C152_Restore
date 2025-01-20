@interface SGPipelineEnrichment
+ (id)address:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9;
+ (id)birthday:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9;
+ (id)emailAddress:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9;
+ (id)instantMessageAddress:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9;
+ (id)phoneNumber:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9;
+ (id)socialProfile:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9;
- (BOOL)isEvent;
- (BOOL)isPerson;
- (BOOL)pendingGeocode;
- (NSData)contentHash;
- (SGPipelineEnrichment)initWithContactDetailWithKey:(id)a3 type:(unint64_t)a4 extractionInfo:(id)a5 curated:(BOOL)a6 parent:(id)a7 value:(id)a8 context:(id)a9 contextRangeOfInterest:(_NSRange)a10;
- (SGPipelineEnrichment)initWithDuplicateKey:(id)a3 title:(id)a4 parent:(id)a5;
- (SGPipelineEnrichment)initWithIntentPersonAtDate:(id)a3 bundleId:(id)a4 handle:(id)a5 displayName:(id)a6;
- (SGPipelineEnrichment)initWithPseudoContactWithKey:(id)a3 parent:(id)a4 name:(id)a5;
- (id)loggingIdentifier;
- (id)toCloudKitRecordWithId:(id)a3 parentEntityType:(int64_t)a4;
- (void)setContentHash:(id)a3;
- (void)setCreationTimestamp:(SGUnixTimestamp_)a3;
- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3;
- (void)setPendingGeocode:(BOOL)a3;
@end

@implementation SGPipelineEnrichment

- (id)toCloudKitRecordWithId:(id)a3 parentEntityType:(int64_t)a4
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v129 = a3;
  v7 = objc_opt_new();
  v8 = [(SGEntity *)self duplicateKey];
  v9 = [v8 entityKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v123 = [MEMORY[0x1E4F28B00] currentHandler];
    [v123 handleFailureInMethod:a2, self, @"SGPipelineEntity+CloudKitRecord.m", 251, @"Invalid parameter not satisfying: %@", @"[self.duplicateKey.entityKey isKindOfClass:[SGPseudoEventKey class]]" object file lineNumber description];
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0x10)
  {
    v124 = [MEMORY[0x1E4F28B00] currentHandler];
    [v124 handleFailureInMethod:a2, self, @"SGPipelineEntity+CloudKitRecord.m", 252, @"Invalid parameter not satisfying: %@", @"parentEntityType == SGEntityTypeWebPage || parentEntityType == SGEntityTypeInteraction" object file lineNumber description];
  }
  [v7 setParentEntityType:a4];
  v11 = [(SGEntity *)self duplicateKey];
  v12 = [v11 entityKey];
  v13 = [v12 groupId];
  [v7 setGroupId:v13];

  v14 = [(SGEntity *)self sourceKey];
  [v7 setSourceKey:v14];

  v15 = [(SGEntity *)self content];
  [v7 setContent:v15];

  v16 = [(SGEntity *)self title];
  [v7 setTitle:v16];

  [(SGEntity *)self creationTimestamp];
  objc_msgSend(v7, "setCreationTimestamp:");
  [(SGEntity *)self lastModifiedTimestamp];
  objc_msgSend(v7, "setLastModifiedTimestamp:");
  v17 = [(SGEntity *)self tags];
  v18 = [MEMORY[0x1E4F5D9F0] allDay];
  uint64_t v19 = [v17 containsObject:v18];

  [v7 setAllDay:v19];
  v20 = [(SGEntity *)self timeRange];
  v21 = v20;
  if ((v19 & 1) == 0 && [v20 isFloating])
  {
    uint64_t v22 = [v21 absoluteRange];

    v21 = (void *)v22;
  }
  v23 = objc_opt_new();
  [v21 start];
  objc_msgSend(v23, "setStart:");
  [v21 end];
  objc_msgSend(v23, "setEnd:");
  v128 = v21;
  if ([v21 isFloating])
  {
    if ((v19 & 1) == 0)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"SGPipelineEntity+CloudKitRecord.m" lineNumber:284 description:@"Only all-day events should be floating. Other events should have a timezone set before being synced up."];
    }
  }
  else
  {
    objc_msgSend(v23, "setStartUTCOffsetSeconds:", objc_msgSend(v21, "startUTCOffsetSeconds"));
    objc_msgSend(v23, "setEndUTCOffsetSeconds:", objc_msgSend(v21, "endUTCOffsetSeconds"));
  }
  v127 = v23;
  [v7 setWhen:v23];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v135 = self;
  v25 = [(SGEntity *)self locations];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v143 objects:v150 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v144 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v143 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x1CB79B230]();
        v32 = objc_opt_new();
        objc_msgSend(v32, "setLocationType:", objc_msgSend(v30, "locationType"));
        v33 = [v30 label];
        [v32 setLabel:v33];

        v34 = [v30 address];
        [v32 setAddress:v34];

        v35 = [v30 airportCode];
        [v32 setAirportCode:v35];

        [v30 latitude];
        [v30 latitude];
        objc_msgSend(v32, "setLatitude:");
        [v30 longitude];
        [v30 longitude];
        objc_msgSend(v32, "setLongitude:");
        [v30 accuracy];
        objc_msgSend(v32, "setAccuracy:");
        [v30 quality];
        objc_msgSend(v32, "setQuality:");
        v36 = [v30 handle];
        [v32 setHandle:v36];

        [v7 addLocations:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v143 objects:v150 count:16];
    }
    while (v27);
  }

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  v37 = [(SGEntity *)v135 tags];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v139 objects:v149 count:16];
  if (!v38)
  {
    v131 = 0;
    v132 = 0;
    v92 = 0;
    v134 = 0;
    v136 = 0;
    v130 = 0;
    v133 = 0;
    v81 = 0;
    v40 = 0;
    v82 = v129;
    goto LABEL_100;
  }
  uint64_t v39 = v38;
  v131 = 0;
  v132 = 0;
  v125 = 0;
  v126 = 0;
  v134 = 0;
  v136 = 0;
  v130 = 0;
  v133 = 0;
  v40 = 0;
  uint64_t v41 = *(void *)v140;
  do
  {
    uint64_t v42 = 0;
    do
    {
      if (*(void *)v140 != v41) {
        objc_enumerationMutation(v37);
      }
      v43 = *(void **)(*((void *)&v139 + 1) + 8 * v42);
      if ([v43 isExtraKey])
      {
        v44 = [v43 value];
        [v7 setExtraKey:v44];
LABEL_30:

        goto LABEL_31;
      }
      if ([v43 isDomain])
      {
        v44 = [v43 value];
        [v7 setDomain:v44];
        goto LABEL_30;
      }
      if ([v43 isTemplateName])
      {
        v44 = [v43 value];
        [v7 setTemplateName:v44];
        goto LABEL_30;
      }
      if ([v43 isSchemaOrg])
      {
        id v45 = v43;

        v40 = v45;
        goto LABEL_31;
      }
      v46 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
      int v47 = [v43 isEqualToEntityTag:v46];

      if (v47)
      {
        [v7 setCancelled:1];
        goto LABEL_31;
      }
      v48 = [MEMORY[0x1E4F5D9F0] extractedFlight];
      int v49 = [v43 isEqualToEntityTag:v48];

      if (v49)
      {
        v50 = v7;
        uint64_t v51 = 1;
LABEL_59:
        [v50 setCategoryType:v51];
        goto LABEL_31;
      }
      v52 = [MEMORY[0x1E4F5D9F0] extractedBus];
      int v53 = [v43 isEqualToEntityTag:v52];

      if (v53)
      {
        v50 = v7;
        uint64_t v51 = 2;
        goto LABEL_59;
      }
      v54 = [MEMORY[0x1E4F5D9F0] extractedTrain];
      int v55 = [v43 isEqualToEntityTag:v54];

      if (v55)
      {
        v50 = v7;
        uint64_t v51 = 3;
        goto LABEL_59;
      }
      v56 = [MEMORY[0x1E4F5D9F0] extractedBoat];
      int v57 = [v43 isEqualToEntityTag:v56];

      if (v57)
      {
        v50 = v7;
        uint64_t v51 = 10;
        goto LABEL_59;
      }
      v58 = [MEMORY[0x1E4F5D9F0] extractedHotel];
      int v59 = [v43 isEqualToEntityTag:v58];

      if (v59)
      {
        v50 = v7;
        uint64_t v51 = 4;
        goto LABEL_59;
      }
      v60 = [MEMORY[0x1E4F5D9F0] extractedCarRental];
      int v61 = [v43 isEqualToEntityTag:v60];

      if (v61)
      {
        v50 = v7;
        uint64_t v51 = 5;
        goto LABEL_59;
      }
      v62 = [MEMORY[0x1E4F5D9F0] extractedTicket];
      int v63 = [v43 isEqualToEntityTag:v62];

      if (v63)
      {
        v50 = v7;
        uint64_t v51 = 6;
        goto LABEL_59;
      }
      v64 = [MEMORY[0x1E4F5D9F0] extractedMovie];
      int v65 = [v43 isEqualToEntityTag:v64];

      if (v65)
      {
        v50 = v7;
        uint64_t v51 = 7;
        goto LABEL_59;
      }
      v66 = [MEMORY[0x1E4F5D9F0] extractedFood];
      int v67 = [v43 isEqualToEntityTag:v66];

      if (v67)
      {
        v50 = v7;
        uint64_t v51 = 8;
        goto LABEL_59;
      }
      v68 = [MEMORY[0x1E4F5D9F0] extractedSocial];
      int v69 = [v43 isEqualToEntityTag:v68];

      if (v69)
      {
        v50 = v7;
        uint64_t v51 = 9;
        goto LABEL_59;
      }
      v70 = [MEMORY[0x1E4F5D9F0] extractedAppointment];
      int v71 = [v43 isEqualToEntityTag:v70];

      if (v71)
      {
        v50 = v7;
        uint64_t v51 = 11;
        goto LABEL_59;
      }
      if ([v43 isInteractionId])
      {
        id v72 = v43;

        v126 = v72;
      }
      else if ([v43 isInteractionGroupId])
      {
        id v73 = v43;

        v134 = v73;
      }
      else if ([v43 isInteractionTeamId])
      {
        id v74 = v43;

        v133 = v74;
      }
      else if ([v43 isInteractionBundleId])
      {
        id v75 = v43;

        v132 = v75;
      }
      else if ([v43 isReservationItemReferences])
      {
        id v76 = v43;

        v125 = v76;
      }
      else if ([v43 isReservationContainerReference])
      {
        id v77 = v43;

        v131 = v77;
      }
      else if ([v43 isEventMetadata])
      {
        id v78 = v43;

        v136 = v78;
      }
      else if ([v43 isIntentResponseUserActivityString])
      {
        id v79 = v43;

        v130 = v79;
      }
LABEL_31:
      ++v42;
    }
    while (v39 != v42);
    uint64_t v80 = [v37 countByEnumeratingWithState:&v139 objects:v149 count:16];
    uint64_t v39 = v80;
  }
  while (v80);
  v81 = v126;

  v82 = v129;
  if (v40)
  {
    v83 = (void *)MEMORY[0x1CB79B230]();
    v84 = (void *)MEMORY[0x1E4F28D90];
    v85 = [v40 value];
    v86 = [v85 dataUsingEncoding:4];
    v87 = [v84 JSONObjectWithData:v86 options:0 error:0];

    if (v87)
    {
      v88 = (void *)MEMORY[0x1CB79B230]();
      id v138 = 0;
      v89 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v87 format:200 options:0 error:&v138];
      v90 = v138;
      if (!v89)
      {
        v91 = sgLogHandle();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v148 = v90;
          _os_log_error_impl(&dword_1CA650000, v91, OS_LOG_TYPE_ERROR, "SGCK Error serializing schema.org to plist: %@", buf, 0xCu);
        }
      }
      [v7 setSchemaOrg:v89];
    }
    else
    {
      v90 = sgLogHandle();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v90, OS_LOG_TYPE_ERROR, "SGCK error converting schema.org to plist.", buf, 2u);
      }
    }
  }
  if (v136)
  {
    v93 = (void *)MEMORY[0x1CB79B230]();
    v94 = (void *)MEMORY[0x1E4F28D90];
    v95 = [v136 value];
    v96 = [v95 dataUsingEncoding:4];
    v37 = [v94 JSONObjectWithData:v96 options:0 error:0];

    if (v37)
    {
      v97 = (void *)MEMORY[0x1CB79B230]();
      id v137 = 0;
      v98 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v37 format:200 options:0 error:&v137];
      v99 = v137;
      if (v98)
      {
        [v7 setMetadata:v98];
        v92 = v125;
      }
      else
      {
        v100 = sgLogHandle();
        v92 = v125;
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v148 = v99;
          _os_log_error_impl(&dword_1CA650000, v100, OS_LOG_TYPE_ERROR, "SGCK Error serializing event metadata to plist: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v99 = sgLogHandle();
      v92 = v125;
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v99, OS_LOG_TYPE_ERROR, "SGCK Error converting event metadata to plist.", buf, 2u);
      }
    }

LABEL_100:
  }
  else
  {
    v136 = 0;
    v92 = v125;
  }
  if ([v7 parentEntityType] == 16)
  {
    v101 = objc_opt_new();
    v102 = [v81 value];
    [v101 setInteractionId:v102];

    v103 = [v134 value];
    [v101 setInteractionGroupId:v103];

    v104 = [v133 value];
    [v101 setInteractionTeamId:v104];

    v105 = [v132 value];
    [v101 setInteractionBundleId:v105];

    v106 = [v130 value];
    [v101 setIntentResponseUserActivityString:v106];

    v107 = [v131 value];

    if (v107)
    {
      id v108 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v109 = [v131 value];
      v110 = (void *)[v108 initWithBase64EncodedString:v109 options:0];

      [v101 setReservationContainerReference:v110];
    }
    v111 = [v92 value];

    if (v111)
    {
      id v112 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v113 = [v92 value];
      v114 = [v112 initWithBase64EncodedString:v113 options:0];

      [v101 setReservationItemReferences:v114];
      [v7 setInteractionInfo:v101];
    }
    else
    {
      v114 = sgLogHandle();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v114, OS_LOG_TYPE_ERROR, "SGCK Reservation item reference value was nil for interaction entity", buf, 2u);
      }
    }
  }
  id v115 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  if (v82) {
    v116 = (void *)[v115 initWithRecordType:@"com_apple_suggestions_ck_event" recordID:v82];
  }
  else {
    v116 = (void *)[v115 initWithRecordType:@"com_apple_suggestions_ck_event"];
  }
  v117 = v116;
  [v116 setObject:&unk_1F2535E80 forKeyedSubscript:@"v"];
  [v117 setObject:&unk_1F2535E80 forKeyedSubscript:@"m"];
  v118 = (void *)MEMORY[0x1E4F93AE0];
  v119 = [v7 data];
  v120 = [v118 compress:v119 lowMemory:1];
  v121 = [v117 encryptedValues];
  [v121 setObject:v120 forKeyedSubscript:@"pe"];

  return v117;
}

- (void).cxx_destruct
{
}

- (void)setPendingGeocode:(BOOL)a3
{
  self->_pendingGeocode = a3;
}

- (BOOL)pendingGeocode
{
  return self->_pendingGeocode;
}

- (void)setContentHash:(id)a3
{
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (id)loggingIdentifier
{
  v3 = [(SGEntity *)self duplicateKey];

  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [(SGEntity *)self duplicateKey];
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", @"%tu", objc_msgSend(v5, "hash"));
  }
  else
  {
    v6 = &stru_1F24EEF20;
  }
  if ((unint64_t)[(__CFString *)v6 length] > 0xC)
  {
    -[__CFString substringWithRange:](v6, "substringWithRange:", 0, 12);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (BOOL)isPerson
{
  v2 = [(SGEntity *)self duplicateKey];
  [v2 entityType];
  char IsContact = SGEntityTypeIsContact();

  return IsContact;
}

- (BOOL)isEvent
{
  v2 = [(SGEntity *)self duplicateKey];
  [v2 entityType];
  char IsEvent = SGEntityTypeIsEvent();

  return IsEvent;
}

- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SGPipelineEnrichment;
  [(SGEntity *)&v3 setLastModifiedTimestamp:a3.secondsFromUnixEpoch];
}

- (void)setCreationTimestamp:(SGUnixTimestamp_)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SGPipelineEnrichment;
  [(SGEntity *)&v3 setCreationTimestamp:a3.secondsFromUnixEpoch];
}

- (SGPipelineEnrichment)initWithContactDetailWithKey:(id)a3 type:(unint64_t)a4 extractionInfo:(id)a5 curated:(BOOL)a6 parent:(id)a7 value:(id)a8 context:(id)a9 contextRangeOfInterest:(_NSRange)a10
{
  BOOL v12 = a6;
  id v16 = a5;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a3;
  v21 = [v19 duplicateKey];
  [v21 entityType];
  int IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"SGPipelineEnrichment.m" lineNumber:81 description:@"The parent entity cannot be a contact"];
  }
  if (a4 > 6)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v23 = qword_1CA8D0C20[a4];
    uint64_t v24 = qword_1CA8D0C58[a4];
  }
  v25 = [SGDuplicateKey alloc];
  if (v12) {
    uint64_t v26 = v23;
  }
  else {
    uint64_t v26 = v24;
  }
  uint64_t v27 = [v19 duplicateKey];
  uint64_t v28 = [(SGDuplicateKey *)v25 initWithEntityKey:v20 entityType:v26 parentKey:v27];

  v29 = [(SGPipelineEnrichment *)self initWithDuplicateKey:v28 title:v18 parent:v19];
  if (v29)
  {
    [(SGEntity *)v29 setExtractionInfo:v16];
    [(SGEntity *)v29 setContent:v17];
    -[SGEntity setContentRangeOfInterest:](v29, "setContentRangeOfInterest:", a10.location, a10.length);
  }

  return v29;
}

- (SGPipelineEnrichment)initWithIntentPersonAtDate:(id)a3 bundleId:(id)a4 handle:(id)a5 displayName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SGPipelineEnrichment.m", 62, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SGPipelineEnrichment.m", 63, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

LABEL_3:
  v15 = +[SGDuplicateKey duplicateKeyForInteractionWithBundleId:v12 personHandle:v13];
  id v16 = [(SGPipelineEnrichment *)self initWithDuplicateKey:v15 title:v14 parent:0];
  if (v16)
  {
    [v11 timeIntervalSince1970];
    -[SGPipelineEnrichment setCreationTimestamp:](v16, "setCreationTimestamp:");
  }

  return v16;
}

- (SGPipelineEnrichment)initWithPseudoContactWithKey:(id)a3 parent:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGPipelineEnrichment.m", 51, @"Invalid parameter not satisfying: %@", @"identityKey" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGPipelineEnrichment.m", 52, @"Invalid parameter not satisfying: %@", @"parent" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = [v10 duplicateKey];
  id v13 = +[SGDuplicateKey duplicateKeyForPseudoContactWithIdentity:v9 parentKey:v12];
  id v14 = [(SGPipelineEnrichment *)self initWithDuplicateKey:v13 title:v11 parent:v10];

  return v14;
}

- (SGPipelineEnrichment)initWithDuplicateKey:(id)a3 title:(id)a4 parent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SGPipelineEnrichment;
  id v11 = [(SGEntity *)&v17 init];
  if (v11)
  {
    [v10 creationTimestamp];
    -[SGPipelineEnrichment setCreationTimestamp:](v11, "setCreationTimestamp:");
    [v10 lastModifiedTimestamp];
    -[SGPipelineEnrichment setLastModifiedTimestamp:](v11, "setLastModifiedTimestamp:");
    id v12 = [v10 sourceKey];
    [(SGEntity *)v11 setSourceKey:v12];

    [(SGEntity *)v11 setDuplicateKey:v8];
    [(SGEntity *)v11 setTitle:v9];
    if (v10)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__SGPipelineEnrichment_initWithDuplicateKey_title_parent___block_invoke;
      v14[3] = &unk_1E65BFD88;
      id v15 = v10;
      id v16 = v11;
      [v15 runWithDissectorLock:v14];
    }
  }

  return v11;
}

void __58__SGPipelineEnrichment_initWithDuplicateKey_title_parent___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "tags", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = [MEMORY[0x1E4F5D9F0] isSent];
        if ([v7 isEqual:v8] & 1) != 0 || (objc_msgSend(v7, "isAppleMailMessageId"))
        {

LABEL_9:
          [*(id *)(a1 + 40) addTag:v7];
          goto LABEL_10;
        }
        char v9 = [v7 isMailboxIdentifier];

        if (v9) {
          goto LABEL_9;
        }
LABEL_10:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v10 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = v10;
    }
    while (v10);
  }
}

+ (id)socialProfile:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  BOOL v26 = a6;
  id v13 = a9;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [SGContactDetailKey alloc];
  id v19 = [v17 label];
  id v20 = [v17 value];
  SGNormalizeSocialProfile(v20);
  objc_claimAutoreleasedReturnValue();
  v21 = [(SGContactDetailKey *)v18 initWithIdentityKey:v16 label:v19 normalizedValue:v20];

  uint64_t v22 = [SGPipelineEnrichment alloc];
  uint64_t v23 = [v17 value];

  uint64_t v24 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v22, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v21, 4, v13, v26, v15, v23, v14, a8.location, a8.length);
  return v24;
}

+ (id)instantMessageAddress:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  BOOL v27 = a6;
  id v13 = a9;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [SGContactDetailKey alloc];
  id v19 = [v17 label];
  id v20 = [v17 value];
  v21 = SGNormalizeInstantMessageAddress(v20);
  uint64_t v22 = [(SGContactDetailKey *)v18 initWithIdentityKey:v16 label:v19 normalizedValue:v21];

  uint64_t v23 = [SGPipelineEnrichment alloc];
  uint64_t v24 = [v17 value];

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 3, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)birthday:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  BOOL v27 = a6;
  id v13 = a9;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [SGContactDetailKey alloc];
  id v19 = [v17 label];
  id v20 = [v17 value];
  v21 = SGNormalizeBirthday(v20);
  uint64_t v22 = [(SGContactDetailKey *)v18 initWithIdentityKey:v16 label:v19 normalizedValue:v21];

  uint64_t v23 = [SGPipelineEnrichment alloc];
  uint64_t v24 = [v17 value];

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 6, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)emailAddress:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  BOOL v27 = a6;
  id v13 = a9;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [SGContactDetailKey alloc];
  id v19 = [v17 label];
  id v20 = [v17 value];
  v21 = SGNormalizeEmailAddress();
  uint64_t v22 = [(SGContactDetailKey *)v18 initWithIdentityKey:v16 label:v19 normalizedValue:v21];

  uint64_t v23 = [SGPipelineEnrichment alloc];
  uint64_t v24 = [v17 value];

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 2, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)phoneNumber:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  BOOL v28 = a6;
  id v13 = a9;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [SGContactDetailKey alloc];
  id v19 = [v17 label];
  id v20 = [v17 value];
  v21 = SGNormalizePhoneNumber();
  uint64_t v22 = [(SGContactDetailKey *)v18 initWithIdentityKey:v16 label:v19 normalizedValue:v21];

  uint64_t v23 = [SGPipelineEnrichment alloc];
  uint64_t v24 = [v17 value];

  v25 = MEMORY[0x1CB79A420](v24);
  BOOL v26 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 0, v13, v28, v15, v25, v14, a8.location, a8.length);

  return v26;
}

+ (id)address:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  BOOL v27 = a6;
  id v13 = a9;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [SGContactDetailKey alloc];
  id v19 = [v17 label];
  id v20 = [v17 value];
  v21 = SGNormalizeAddress(v20);
  uint64_t v22 = [(SGContactDetailKey *)v18 initWithIdentityKey:v16 label:v19 normalizedValue:v21];

  uint64_t v23 = [SGPipelineEnrichment alloc];
  uint64_t v24 = [v17 value];

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 1, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

@end