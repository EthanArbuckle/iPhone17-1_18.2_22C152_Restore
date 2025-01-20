@interface BBBulletinRequest(protobuf)
+ (id)_actionFromBLTPBAction:()protobuf;
+ (id)bulletinRequestFromProtobuf:()protobuf;
+ (uint64_t)plistTypes;
- (uint64_t)blt_protobuf;
@end

@implementation BBBulletinRequest(protobuf)

+ (id)bulletinRequestFromProtobuf:()protobuf
{
  uint64_t v151 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F2BC58]);
  v6 = [v4 sectionID];
  [v5 setSectionID:v6];

  v7 = [v4 recordID];
  [v5 setRecordID:v7];

  v8 = [v4 publisherBulletinID];
  [v5 setPublisherBulletinID:v8];

  objc_msgSend(v5, "setSectionSubtype:", (int)objc_msgSend(v4, "sectionSubtype"));
  v9 = [v4 title];
  [v5 setTitle:v9];

  v10 = [v4 subtitle];
  [v5 setSubtitle:v10];

  v11 = [v4 messageTitle];
  [v5 setMessage:v11];

  objc_msgSend(v5, "setLoading:", objc_msgSend(v4, "loading"));
  objc_msgSend(v5, "setTurnsOnDisplay:", objc_msgSend(v4, "turnsOnDisplay"));
  v12 = [v4 dismissalID];
  [v5 setDismissalID:v12];

  v13 = (void *)MEMORY[0x263EFFA08];
  v14 = [v4 subsectionIDs];
  v15 = [v13 setWithArray:v14];
  [v5 setSubsectionIDs:v15];

  v16 = [v4 peopleIDs];
  [v5 setPeopleIDs:v16];

  objc_msgSend(v5, "setIgnoresQuietMode:", objc_msgSend(v4, "ignoresQuietMode"));
  v17 = [v4 categoryID];
  [v5 setCategoryID:v17];

  v18 = [v4 threadID];
  [v5 setThreadID:v18];

  objc_msgSend(v5, "setPreemptsPresentedAlert:", objc_msgSend(v4, "preemptsPresentedAlert"));
  if ([v4 suppressDelayForForwardedBulletins]) {
    [v5 setContextValue:MEMORY[0x263EFFA88] forKey:@"BLTSuppressDelayForForwardedBulletinsKey"];
  }
  v19 = [v4 icon];

  if (v19)
  {
    v20 = [v4 icon];
    v21 = BBSectionIconFromBLTPBSectionIcon(v20);
    [v5 setIcon:v21];
  }
  if ([v4 hasDate])
  {
    v22 = (void *)MEMORY[0x263EFF910];
    [v4 date];
    v23 = objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
    [v5 setDate:v23];
  }
  [v5 setDateFormatStyle:1];
  uint64_t v24 = [v4 sockPuppetAppBundleID];
  if (v24) {
    [v5 setContextValue:v24 forKey:@"BLTSockPuppetAppIdentifierKey"];
  }
  v123 = (void *)v24;
  if ([v4 hasRequiredExpirationDate])
  {
    v25 = (void *)MEMORY[0x263EFF910];
    [v4 requiredExpirationDate];
    v26 = objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
    [v5 setExpirationDate:v26];
  }
  v27 = [MEMORY[0x263F2BC40] action];
  [v5 setAcknowledgeAction:v27];

  v28 = [v4 snoozeAction];

  if (v28)
  {
    v29 = [MEMORY[0x263F2BC40] action];
    [v5 setSnoozeAction:v29];
  }
  v30 = [MEMORY[0x263F2BC40] action];
  v124 = v5;
  [v5 setDismissAction:v30];

  if ([v4 hasAttachmentType])
  {
    id v31 = objc_alloc_init(MEMORY[0x263F2BC80]);
    objc_msgSend(v31, "setType:", objc_msgSend(v4, "attachmentType"));
    v32 = [v4 attachmentURLURL];
    [v31 setURL:v32];

    [v124 setPrimaryAttachment:v31];
  }
  v33 = [MEMORY[0x263EFF980] array];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  v34 = [v4 additionalAttachments];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v137 objects:v150 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v138 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        if ([v39 hasURL])
        {
          id v40 = objc_alloc_init(MEMORY[0x263F2BC80]);
          objc_msgSend(v40, "setType:", objc_msgSend(v39, "type"));
          v41 = [v39 attachmentURLURL];
          [v40 setURL:v41];

          [v33 addObject:v40];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v137 objects:v150 count:16];
    }
    while (v36);
  }

  v42 = v124;
  if ([v33 count]) {
    [v124 setAdditionalAttachments:v33];
  }
  uint64_t v43 = [v4 context];
  v122 = (void *)v43;
  if (v43)
  {
    uint64_t v44 = v43;
    v45 = (void *)MEMORY[0x263F08928];
    v46 = [a1 plistTypes];
    id v136 = 0;
    v47 = [v45 unarchivedObjectOfClasses:v46 fromData:v44 error:&v136];
    id v48 = v136;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || v48)
    {
      v49 = blt_general_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        id v121 = (id)objc_opt_class();
        *(_DWORD *)buf = 138413058;
        id v143 = v4;
        __int16 v144 = 2112;
        v145 = v47;
        __int16 v146 = 2112;
        id v147 = v121;
        __int16 v148 = 2112;
        id v149 = v48;
        _os_log_error_impl(&dword_222F4C000, v49, OS_LOG_TYPE_ERROR, "Bulletin %@ failed to unarchive context dictionary, dict=%@ dictClass=%@ error=%@", buf, 0x2Au);
      }
    }
    else
    {
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = __59__BBBulletinRequest_protobuf__bulletinRequestFromProtobuf___block_invoke;
      v134[3] = &unk_2646845E0;
      v135 = v124;
      [v47 enumerateKeysAndObjectsUsingBlock:v134];
      v49 = v135;
    }
  }
  v50 = [v4 alertSuppressionContexts];

  if (v50)
  {
    v51 = [v4 alertSuppressionContexts];
    v52 = [v4 alertSuppressionContextsNulls];
    id v133 = 0;
    v53 = +[BLTObjectSerializer unserializeObject:v51 nulls:v52 error:&v133];
    id v54 = v133;

    if (!v54)
    {
      v55 = [MEMORY[0x263EFFA08] setWithArray:v53];
      [v124 setAlertSuppressionContexts:v55];
    }
  }
  if ([v4 includesSound])
  {
    if ([v4 soundAlertType])
    {
      v56 = objc_msgSend(objc_alloc(MEMORY[0x263F7FC70]), "initWithType:", (int)objc_msgSend(v4, "soundAlertType"));
      v57 = [v4 soundAccountIdentifier];

      if (v57)
      {
        v58 = [v4 soundAccountIdentifier];
        [v56 setTopic:v58];
      }
      v59 = [v4 soundToneIdentifier];

      if (v59)
      {
        v60 = [v4 soundToneIdentifier];
        [v56 setToneIdentifier:v60];
      }
      if ([v4 hasSoundShouldRepeat]) {
        objc_msgSend(v56, "setShouldRepeat:", objc_msgSend(v4, "soundShouldRepeat"));
      }
      if ([v4 hasSoundShouldIgnoreRingerSwitch]) {
        objc_msgSend(v56, "setShouldIgnoreRingerSwitch:", objc_msgSend(v4, "soundShouldIgnoreRingerSwitch"));
      }
      if ([v4 hasSoundMaximumDuration])
      {
        [v4 soundMaximumDuration];
        objc_msgSend(v56, "setMaximumDuration:");
      }
      if ([v4 hasSoundAudioVolume])
      {
        [v4 soundAudioVolume];
        *(float *)&double v61 = v61;
        [v56 setAudioVolume:v61];
      }
      v62 = (void *)[objc_alloc(MEMORY[0x263F2BCC8]) initWithToneAlertConfiguration:v56];
    }
    else
    {
      v62 = (void *)[objc_alloc(MEMORY[0x263F2BCC8]) initWithToneAlert:17];
    }
    v42 = v124;
    [v124 setSound:v62];
  }
  v63 = (void *)MEMORY[0x263EFF980];
  v64 = [v4 supplementaryActions];
  v65 = objc_msgSend(v63, "arrayWithCapacity:", objc_msgSend(v64, "count"));

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v66 = [v4 supplementaryActions];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v129 objects:v141 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v130;
    do
    {
      for (uint64_t j = 0; j != v68; ++j)
      {
        if (*(void *)v130 != v69) {
          objc_enumerationMutation(v66);
        }
        v71 = [a1 _actionFromBLTPBAction:*(void *)(*((void *)&v129 + 1) + 8 * j)];
        [v65 addObject:v71];
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v129 objects:v141 count:16];
    }
    while (v68);
  }

  [v42 setSupplementaryActions:v65];
  v72 = [v4 categoryID];

  if (v72)
  {
    v73 = [v4 categoryID];
    [v42 setContextValue:v73 forKey:@"category"];
  }
  v74 = [v4 teamID];

  if (v74)
  {
    v75 = [v4 teamID];
    [v42 setContextValue:v75 forKey:@"teamID"];
  }
  if ([v4 hasHasCriticalIcon]) {
    objc_msgSend(v42, "setHasCriticalIcon:", objc_msgSend(v4, "hasCriticalIcon"));
  }
  if ([v4 hasHeader])
  {
    v76 = [v4 header];
    [v42 setHeader:v76];
  }
  if ([v4 hasContentType])
  {
    v77 = [v4 contentType];
    [v42 setContentType:v77];
  }
  if ([v4 hasInterruptionLevel]) {
    objc_msgSend(v42, "setInterruptionLevel:", objc_msgSend(v4, "interruptionLevel"));
  }
  if ([v4 hasCommunicationContext])
  {
    v78 = (void *)MEMORY[0x263F2BC60];
    v79 = [v4 communicationContext];
    v80 = [v78 communicationContextFromProtobuf:v79];
    [v42 setCommunicationContext:v80];
  }
  if ([v4 hasFilterCriteria])
  {
    v81 = [v4 filterCriteria];
    [v42 setFilterCriteria:v81];
  }
  if ([v4 hasFollowActivityAction])
  {
    v82 = (void *)MEMORY[0x263F2BC40];
    v83 = [v4 followActivityAction];
    v84 = [v83 identifier];
    v85 = [v4 followActivityAction];
    v86 = [v85 appearance];
    v87 = [v86 title];
    v88 = [v82 actionWithIdentifier:v84 title:v87];

    v42 = v124;
    v89 = [v4 followActivityAction];
    objc_msgSend(v88, "setActivationMode:", (int)objc_msgSend(v89, "activationMode"));

    [v124 setFollowActivityAction:v88];
  }
  if ([v4 hasSubordinateIcon]) {
    objc_msgSend(v42, "setHasSubordinateIcon:", objc_msgSend(v4, "hasSubordinateIcon"));
  }
  if ([v4 hasSummary])
  {
    v90 = (void *)MEMORY[0x263F08928];
    uint64_t v91 = objc_opt_class();
    v92 = [v4 summary];
    id v128 = 0;
    uint64_t v93 = v91;
    v42 = v124;
    v94 = [v90 unarchivedObjectOfClass:v93 fromData:v92 error:&v128];
    id v95 = v128;

    if (v95)
    {
      v96 = blt_general_log();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:].cold.4();
      }
    }
    [v124 setSummary:v94];
  }
  if ([v4 hasThreadSummary])
  {
    v97 = (void *)MEMORY[0x263F08928];
    uint64_t v98 = objc_opt_class();
    v99 = [v4 threadSummary];
    id v127 = 0;
    uint64_t v100 = v98;
    v42 = v124;
    v101 = [v97 unarchivedObjectOfClass:v100 fromData:v99 error:&v127];
    id v102 = v127;

    if (v102)
    {
      v103 = blt_general_log();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:]();
      }
    }
    [v124 setThreadSummary:v101];
  }
  if ([v4 hasAttributedMessage])
  {
    v104 = (void *)MEMORY[0x263F08928];
    uint64_t v105 = objc_opt_class();
    v106 = [v4 attributedMessage];
    id v126 = 0;
    uint64_t v107 = v105;
    v42 = v124;
    v108 = [v104 unarchivedObjectOfClass:v107 fromData:v106 error:&v126];
    id v109 = v126;

    if (v109)
    {
      v110 = blt_general_log();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:]();
      }
    }
    [v124 setAttributedMessage:v108];
  }
  if ([v4 hasEventBehavior])
  {
    v111 = (void *)MEMORY[0x263F08928];
    uint64_t v112 = objc_opt_class();
    v113 = [v4 eventBehavior];
    id v125 = 0;
    uint64_t v114 = v112;
    v42 = v124;
    v115 = [v111 unarchivedObjectOfClass:v114 fromData:v113 error:&v125];
    id v116 = v125;

    if (v116)
    {
      v117 = blt_general_log();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
        +[BBBulletinRequest(protobuf) bulletinRequestFromProtobuf:]();
      }
    }
    [v124 setEventBehavior:v115];
  }
  if ([v4 hasPriorityNotificationStatus])
  {
    [v4 priorityNotificationStatus];
    [v42 setPriorityNotificationStatus:(unint64_t)v118];
  }
  if ([v4 hasIsHighlight]) {
    objc_msgSend(v42, "setIsHighlight:", objc_msgSend(v4, "isHighlight"));
  }
  id v119 = v42;

  return v119;
}

- (uint64_t)blt_protobuf
{
  return 0;
}

+ (id)_actionFromBLTPBAction:()protobuf
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F2BC40] action];
    id v5 = [v3 identifier];
    [v4 setIdentifier:v5];

    objc_msgSend(v4, "setActivationMode:", (int)objc_msgSend(v3, "activationMode"));
    v6 = NSURL;
    v7 = [v3 launchURL];
    v8 = [v6 URLWithString:v7];
    [v4 setLaunchURL:v8];

    v9 = [v3 appearance];
    LODWORD(v7) = [v9 destructive];

    v10 = (void *)MEMORY[0x263F2BC48];
    v11 = [v3 appearance];
    v12 = [v11 title];
    v13 = [v10 appearanceWithTitle:v12];

    [v13 setStyle:v7];
    [v4 setAppearance:v13];
    objc_msgSend(v4, "setBehavior:", (int)objc_msgSend(v3, "behavior"));
    v14 = [v3 behaviorParameters];

    if (v14)
    {
      v15 = [v3 behaviorParameters];
      v16 = [v3 behaviorParametersNulls];
      uint64_t v20 = 0;
      v17 = +[BLTObjectSerializer unserializeObject:v15 nulls:v16 error:&v20];
      uint64_t v18 = v20;

      if (!v18) {
        [v4 setBehaviorParameters:v17];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (uint64_t)plistTypes
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Error decoding eventBehavior: %@", v2, v3, v4, v5, v6);
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Error decoding attributedMessage: %@", v2, v3, v4, v5, v6);
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Error decoding threadSummary attributed string: %@", v2, v3, v4, v5, v6);
}

+ (void)bulletinRequestFromProtobuf:()protobuf .cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_222F4C000, v0, v1, "Error decoding summary attributed string: %@", v2, v3, v4, v5, v6);
}

@end