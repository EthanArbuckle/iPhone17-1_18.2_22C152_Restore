@interface ARPRoutingEvent
+ (id)mostRecentRoutingEventInDateInterval:(id)a3 knowledgeStore:(id)a4 eventLimit:(unint64_t)a5 longFormVideoFilter:(id)a6;
- (ARPRoutingEvent)initWithBundleID:(id)a3 outputDeviceID:(id)a4 interval:(id)a5 probabilityVector:(id)a6;
- (NSDateInterval)interval;
- (NSDictionary)probabilityVector;
- (NSString)bundleID;
- (NSString)outputDeviceID;
- (id)description;
@end

@implementation ARPRoutingEvent

- (ARPRoutingEvent)initWithBundleID:(id)a3 outputDeviceID:(id)a4 interval:(id)a5 probabilityVector:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ARPRoutingEvent;
  v14 = [(ARPRoutingEvent *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    bundleID = v14->_bundleID;
    v14->_bundleID = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    outputDeviceID = v14->_outputDeviceID;
    v14->_outputDeviceID = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    interval = v14->_interval;
    v14->_interval = (NSDateInterval *)v19;

    objc_storeStrong((id *)&v14->_probabilityVector, a6);
  }

  return v14;
}

+ (id)mostRecentRoutingEventInDateInterval:(id)a3 knowledgeStore:(id)a4 eventLimit:(unint64_t)a5 longFormVideoFilter:(id)a6
{
  v136[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v99 = (uint64_t (**)(id, void *))a6;
  context = (void *)MEMORY[0x210540040]();
  uint64_t v11 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:0];
  id v12 = (void *)MEMORY[0x263F35110];
  id v13 = [v9 startDate];
  v14 = [v9 endDate];
  uint64_t v15 = [v12 predicateForEventsWithEndInDateRangeFrom:v13 to:v14];

  v16 = (void *)MEMORY[0x263F35110];
  uint64_t v17 = [MEMORY[0x263F350F0] playing];
  uint64_t v18 = [v16 predicateForObjectsWithMetadataKey:v17 andIntegerValue:1];

  +[ARPRoutingSession minimumRoutingEventDuration];
  uint64_t v19 = objc_msgSend(MEMORY[0x263F35110], "predicateForEventsWithMinimumDuration:");
  v20 = (void *)MEMORY[0x263F08730];
  v92 = (void *)v18;
  v93 = (void *)v15;
  v136[0] = v15;
  v136[1] = v18;
  v91 = (void *)v19;
  v136[2] = v19;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:3];
  uint64_t v22 = [v20 andPredicateWithSubpredicates:v21];

  v23 = (void *)MEMORY[0x263F35090];
  v24 = [MEMORY[0x263F35148] nowPlayingStream];
  v135 = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v135 count:1];
  v94 = (void *)v11;
  uint64_t v134 = v11;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
  v90 = (void *)v22;
  v27 = [v23 eventQueryWithPredicate:v22 eventStreams:v25 offset:0 limit:a5 sortDescriptors:v26];

  v28 = [NSString stringWithUTF8String:"ARPRoutingSession.m"];
  v29 = objc_msgSend(v28, "stringByAppendingFormat:", @":%d", 85);
  [v27 setClientName:v29];

  [v27 setTracker:&__block_literal_global_1];
  id v123 = 0;
  v100 = v10;
  v30 = v27;
  v31 = [v10 executeQuery:v27 error:&v123];
  id v32 = v123;
  v33 = ARPLog();
  v34 = v33;
  if (v32)
  {
    v35 = 0;
    goto LABEL_49;
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:](v31, v34);
  }
  oslog = v34;

  v36 = (void *)MEMORY[0x263F35090];
  v37 = [MEMORY[0x263F35148] microLocationVisitStream];
  v133 = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
  v39 = [v36 eventQueryWithPredicate:0 eventStreams:v38 offset:0 limit:1 sortDescriptors:0];

  v40 = [NSString stringWithUTF8String:"ARPRoutingSession.m"];
  v41 = objc_msgSend(v40, "stringByAppendingFormat:", @":%d", 101);
  [v39 setClientName:v41];

  v98 = v39;
  [v39 setTracker:&__block_literal_global_17];
  if (!v99)
  {
    v42 = [getAVSystemControllerClass() sharedAVSystemController];
    v121[0] = MEMORY[0x263EF8330];
    v121[1] = 3221225472;
    v121[2] = __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke_2;
    v121[3] = &unk_2640B40D0;
    id v122 = v42;
    id v43 = v42;
    v99 = (uint64_t (**)(id, void *))MEMORY[0x210540230](v121);
  }
  v87 = v27;
  id v88 = v9;
  +[ARPRoutingSession microLocationCorrelationGracePeriod];
  double v45 = v44;
  id v109 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  v86 = v31;
  id obj = v31;
  unint64_t v46 = 0x263F35000uLL;
  unint64_t v47 = 0x263F35000uLL;
  uint64_t v111 = [obj countByEnumeratingWithState:&v117 objects:v132 count:16];
  if (v111)
  {
    v96 = 0;
    v97 = 0;
    v107 = 0;
    uint64_t v110 = *(void *)v118;
    while (1)
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v118 != v110) {
          objc_enumerationMutation(obj);
        }
        v49 = *(void **)(*((void *)&v117 + 1) + 8 * v48);
        uint64_t v113 = MEMORY[0x210540040]();
        v50 = [v49 metadata];
        v51 = [*(id *)(v47 + 240) outputDeviceIDs];
        v52 = [v50 objectForKeyedSubscript:v51];

        v53 = ARPExtractLongFormVideoOutputDeviceIDs(v52);
        if ([v53 count] == 1)
        {
          v54 = [v53 firstObject];
        }
        else
        {
          v54 = 0;
        }
        v34 = oslog;
        v55 = [v49 stringValue];
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          v82 = [v49 startDate];
          v83 = [v49 endDate];
          *(_DWORD *)buf = 138413058;
          v125 = v55;
          __int16 v126 = 2112;
          v127 = v54;
          __int16 v128 = 2112;
          v129 = v82;
          __int16 v130 = 2112;
          v131 = v83;
          _os_log_debug_impl(&dword_20BE41000, oslog, OS_LOG_TYPE_DEBUG, "Evaluating candiate event %@ -> %@. %@ - %@", buf, 0x2Au);

          v34 = oslog;
        }

        if (v54)
        {
          v56 = [v109 objectForKeyedSubscript:v55];
          if (!v56)
          {
            v56 = objc_msgSend(NSNumber, "numberWithBool:", v99[2](v99, v55));
            [v109 setObject:v56 forKeyedSubscript:v55];
          }
          if ([v56 BOOLValue])
          {
            v102 = v52;
            v57 = [v49 startDate];
            uint64_t v58 = [v57 dateByAddingTimeInterval:-v45];

            v59 = [v49 startDate];
            uint64_t v60 = [v59 dateByAddingTimeInterval:v45];

            v103 = v58;
            v106 = (void *)v60;
            uint64_t v61 = [*(id *)(v46 + 272) predicateForEventsWithStartInDateRangeFrom:v58 to:v60];
            [v98 setPredicate:v61];
            id v114 = v107;
            v62 = [v100 executeQuery:v98 error:&v114];
            id v63 = v114;

            v64 = [v62 firstObject];

            v104 = (void *)v61;
            id v105 = v63;
            v108 = v64;
            if (v63)
            {
              char v65 = 0;
              unint64_t v46 = 0x263F35000;
              v66 = (void *)v113;
              v52 = v102;
              v67 = v103;
              goto LABEL_36;
            }
            if (v64)
            {
              v69 = [v64 metadata];
              v70 = [MEMORY[0x263F350D8] probabilityVector];
              v71 = [v69 objectForKeyedSubscript:v70];

              if (v71)
              {
                v72 = [v108 metadata];
                v73 = [MEMORY[0x263F350D8] probabilityVector];
                uint64_t v89 = [v72 objectForKeyedSubscript:v73];

                id v74 = objc_alloc(MEMORY[0x263F08798]);
                v75 = [v49 startDate];
                v76 = [v49 endDate];
                uint64_t v77 = [v74 initWithStartDate:v75 endDate:v76];

                v78 = [ARPRoutingEvent alloc];
                v79 = [v49 stringValue];
                uint64_t v80 = [(ARPRoutingEvent *)v78 initWithBundleID:v79 outputDeviceID:v54 interval:v77 probabilityVector:v89];

                v81 = (void *)v77;
                char v65 = 0;
                v96 = (void *)v89;
                v97 = (void *)v80;
                goto LABEL_34;
              }
            }
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v67 = v103;
              v125 = v103;
              __int16 v126 = 2112;
              v127 = v106;
              _os_log_debug_impl(&dword_20BE41000, oslog, OS_LOG_TYPE_DEBUG, "Skipping candidate because there is no associated microlocation between %@ and %@", buf, 0x16u);
              char v65 = 1;
              v81 = oslog;
              unint64_t v46 = 0x263F35000;
              v66 = (void *)v113;
            }
            else
            {
              char v65 = 1;
              v81 = oslog;
LABEL_34:
              unint64_t v46 = 0x263F35000;
              v66 = (void *)v113;
              v67 = v103;
            }
            v52 = v102;

LABEL_36:
            if ((v65 & 1) == 0)
            {

              v107 = v105;
              goto LABEL_46;
            }
            v107 = v105;
            v34 = oslog;
          }
          else
          {
            v66 = (void *)v113;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v125 = v55;
              _os_log_debug_impl(&dword_20BE41000, v34, OS_LOG_TYPE_DEBUG, "Skipping candidate because %@ is not a long form video app.", buf, 0xCu);
            }
          }
          v68 = v55;
          unint64_t v47 = 0x263F35000;
          goto LABEL_39;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:](&v115, v116, v34);
        }
        v68 = v34;
        v54 = v55;
        v66 = (void *)v113;
LABEL_39:

        ++v48;
      }
      while (v111 != v48);
      uint64_t v84 = [obj countByEnumeratingWithState:&v117 objects:v132 count:16];
      uint64_t v111 = v84;
      if (!v84) {
        goto LABEL_47;
      }
    }
  }
  v96 = 0;
  v97 = 0;
  v107 = 0;
LABEL_46:
  v34 = oslog;
LABEL_47:

  id v32 = v107;
  if (!v107)
  {
    v30 = v87;
    id v9 = v88;
    v31 = v86;
    v35 = v97;
    goto LABEL_52;
  }
  v30 = v87;
  id v9 = v88;
  v31 = v86;
  v35 = v97;
LABEL_49:
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    +[ARPRoutingEvent mostRecentRoutingEventInDateInterval:knowledgeStore:eventLimit:longFormVideoFilter:]((uint64_t)v32, v34);
  }

LABEL_52:

  return v35;
}

uint64_t __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __102__ARPRoutingEvent_mostRecentRoutingEventInDateInterval_knowledgeStore_eventLimit_longFormVideoFilter___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasRouteSharingPolicyLongFormVideo:a2];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ARPRoutingEvent *)self bundleID];
  v6 = [(ARPRoutingEvent *)self outputDeviceID];
  v7 = [(ARPRoutingEvent *)self interval];
  v8 = [(ARPRoutingEvent *)self probabilityVector];
  id v9 = [v3 stringWithFormat:@"<%@ %p> bundleID: %@, outputDeviceID: %@, interval: %@, microLocationProbabilityVector: %@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSDictionary)probabilityVector
{
  return self->_probabilityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityVector, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_outputDeviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (void)mostRecentRoutingEventInDateInterval:(uint64_t)a1 knowledgeStore:(NSObject *)a2 eventLimit:longFormVideoFilter:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE41000, a2, OS_LOG_TYPE_ERROR, "Error fetching most recent routing event: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)mostRecentRoutingEventInDateInterval:(os_log_t)log knowledgeStore:eventLimit:longFormVideoFilter:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_20BE41000, log, OS_LOG_TYPE_DEBUG, "Skipping candidate because it doesn't have exactly one output device.", buf, 2u);
}

+ (void)mostRecentRoutingEventInDateInterval:(void *)a1 knowledgeStore:(NSObject *)a2 eventLimit:longFormVideoFilter:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20BE41000, a2, OS_LOG_TYPE_DEBUG, "Found %@ candidate events for most recent routing event", (uint8_t *)&v4, 0xCu);
}

@end