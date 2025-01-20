@interface FlexSegment
+ (BOOL)canTransitionFromSegment:(id)a3 toSegment:(id)a4 fromBarIndex:(int64_t)a5 checkIfPrevented:(BOOL)a6;
+ (FlexSegment)segmentWithName:(id)a3 inSegments:(id)a4;
+ (id)longLabelForSegmentType:(unint64_t)a3;
+ (id)readInfoFromAudioFileAtPath:(id)a3;
+ (id)segmentsWithType:(unint64_t)a3 inSegments:(id)a4;
+ (id)segmentsWithType:(unint64_t)a3 nameIndex:(id)a4 nameSuffix:(id)a5 inSegments:(id)a6;
+ (id)shortLabelForSegmentType:(unint64_t)a3;
+ (int64_t)crossfadeLengthInSamplesForFromSeg:(id)a3 toSeg:(id)a4 fadeOutTimeInMsec:(int64_t)a5 fadeInTimeInMsec:(int64_t)a6 validFadeOutSamples:(int64_t *)a7 validFadeInSamples:(int64_t *)a8;
+ (int64_t)samplesForTimeInMsec:(int64_t)a3 atSampleRate:(int64_t)a4;
- (BOOL)isPriorityValid;
- (BOOL)linkedPerBarTransitionsToSegmentNamed:(id)a3;
- (BOOL)relinkAllTransitions;
- (BOOL)sliceable;
- (FlexSegment)initWithDictionary:(id)a3;
- (FlexSegment)initWithFileAtPath:(id)a3;
- (NSArray)customBarMarkers;
- (NSDictionary)markers;
- (NSDictionary)metadataValues;
- (NSDictionary)transitions;
- (NSString)name;
- (NSString)nameIndex;
- (NSString)namePrefix;
- (NSString)nameStem;
- (NSString)nameSuffix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsDictionary;
- (id)initAsCrossFade:(id)a3 sampleRate:(int64_t)a4 sampleCount:(int64_t)a5 beatsPerBar:(int64_t)a6;
- (id)metadataValueForKey:(id)a3;
- (id)transitionToSegmentNamed:(id)a3 fromBarIndex:(int64_t)a4;
- (int64_t)barDurationForBarIndex:(int64_t)a3;
- (int64_t)barEndPositionForBarIndex:(int64_t)a3;
- (int64_t)barStartPositionForBarIndex:(int64_t)a3;
- (int64_t)bars;
- (int64_t)beatsPerBar;
- (int64_t)priority;
- (int64_t)sampleCount;
- (int64_t)sampleRate;
- (int64_t)samplesPerBar;
- (unint64_t)errors;
- (unint64_t)type;
- (void)_decodeTypeInfoFromSegmentName;
- (void)addMetadataValue:(id)a3 forKey:(id)a4;
- (void)addOrReplaceTransition:(id)a3 toSegmentNamed:(id)a4 fromBarIndex:(int64_t)a5;
- (void)removeTransitionToSegmentNamed:(id)a3 fromBarIndex:(int64_t)a4;
- (void)setBars:(int64_t)a3;
- (void)setBeatsPerBar:(int64_t)a3;
- (void)setCustomBarMarkers:(id)a3;
- (void)setErrors:(unint64_t)a3;
- (void)setLinkedPerBarTransitions:(BOOL)a3 toSegmentNamed:(id)a4;
- (void)setMarkers:(id)a3;
- (void)setName:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSampleCount:(int64_t)a3;
- (void)setSampleRate:(int64_t)a3;
- (void)setSamplesPerBar:(int64_t)a3;
- (void)setSliceable:(BOOL)a3;
- (void)setTransitions:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FlexSegment

- (FlexSegment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)FlexSegment;
  v8 = [(FlexSegment *)&v124 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_objectForKey_(v4, v5, @"name", v6, v7);
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend__decodeTypeInfoFromSegmentName(v8, v11, v12, v13, v14);
    v18 = objc_msgSend_objectForKey_(v4, v15, @"bars", v16, v17);
    v8->_uint64_t bars = (int)objc_msgSend_intValue(v18, v19, v20, v21, v22);

    v26 = objc_msgSend_objectForKey_(v4, v23, @"priority", v24, v25);
    v8->_priority = (int)objc_msgSend_intValue(v26, v27, v28, v29, v30);

    v34 = objc_msgSend_objectForKey_(v4, v31, @"beatsPerBar", v32, v33);
    v8->_beatsPerBar = (int)objc_msgSend_intValue(v34, v35, v36, v37, v38);

    if (!v8->_beatsPerBar) {
      v8->_beatsPerBar = 4;
    }
    v42 = objc_msgSend_objectForKey_(v4, v39, @"sampleRate", v40, v41);
    v8->_sampleRate = (int)objc_msgSend_intValue(v42, v43, v44, v45, v46);

    v50 = objc_msgSend_objectForKey_(v4, v47, @"sampleCount", v48, v49);
    v8->_uint64_t sampleCount = objc_msgSend_longLongValue(v50, v51, v52, v53, v54);

    v58 = objc_msgSend_objectForKey_(v4, v55, @"sliceable", v56, v57);
    v8->_sliceable = objc_msgSend_BOOLValue(v58, v59, v60, v61, v62);

    if (v8->_sliceable && objc_msgSend_type(v8, v63, v64, v65, v66) != 2) {
      v8->_sliceable = 0;
    }
    v67 = objc_msgSend_objectForKey_(v4, v63, @"customBarMarkers", v65, v66);
    uint64_t v68 = objc_opt_class();
    uint64_t v71 = objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v69, (uint64_t)v67, v68, v70);
    customBarMarkers = v8->_customBarMarkers;
    v8->_customBarMarkers = (NSArray *)v71;

    if (objc_msgSend_count(v8->_customBarMarkers, v73, v74, v75, v76))
    {
      uint64_t sampleCount = -1;
    }
    else
    {
      v81 = v8->_customBarMarkers;
      v8->_customBarMarkers = 0;

      uint64_t bars = v8->_bars;
      uint64_t sampleCount = v8->_sampleCount;
      if (bars >= 1) {
        sampleCount /= bars;
      }
    }
    v8->_samplesPerBar = sampleCount;
    v83 = objc_msgSend_objectForKey_(v4, v77, @"transitions", v78, v79);
    uint64_t v84 = objc_opt_class();
    uint64_t v87 = objc_msgSend_decodeItemsInDict_asClass_(FlexUtilities, v85, (uint64_t)v83, v84, v86);
    transitions = v8->_transitions;
    v8->_transitions = (NSDictionary *)v87;

    if ((objc_msgSend_sliceable(v8, v89, v90, v91, v92) & 1) == 0
      && objc_msgSend_relinkAllTransitions(v8, v93, v94, v95, v96))
    {
      FlexLogForCategory(1uLL);
      v97 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_DEBUG)) {
        sub_217A5EE34(v8, v97, v98, v99, v100);
      }
    }
    if (objc_msgSend_type(v8, v93, v94, v95, v96) == 4)
    {
      v104 = objc_msgSend_objectForKey_(v4, v101, @"markers", v102, v103);
      uint64_t v105 = objc_opt_class();
      uint64_t v108 = objc_msgSend_decodeItemsInDict_asClass_(FlexUtilities, v106, (uint64_t)v104, v105, v107);
      markers = v8->_markers;
      v8->_markers = (NSDictionary *)v108;
    }
    uint64_t v110 = objc_msgSend_objectForKey_(v4, v101, @"peakValue", v102, v103);
    uint64_t v114 = objc_msgSend_objectForKey_(v4, v111, @"loudness", v112, v113);
    if (v110 | v114)
    {
      v115 = objc_opt_new();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_setObject_forKey_(v115, v116, v110, @"PeakValue", v117);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_setObject_forKey_(v115, v118, v114, @"Loudness", v120);
      }
      uint64_t v121 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v118, (uint64_t)v115, v119, v120);
      metadataValues = v8->_metadataValues;
      v8->_metadataValues = (NSDictionary *)v121;
    }
  }

  return v8;
}

- (id)initAsCrossFade:(id)a3 sampleRate:(int64_t)a4 sampleCount:(int64_t)a5 beatsPerBar:(int64_t)a6
{
  id v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FlexSegment;
  uint64_t v12 = [(FlexSegment *)&v22 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_msgSend__decodeTypeInfoFromSegmentName(v13, v14, v15, v16, v17);
    if (v13->_type != 5)
    {
      uint64_t v20 = 0;
      goto LABEL_6;
    }
    *(int64x2_t *)&v13->_priority = vdupq_n_s64(1uLL);
    v13->_sampleRate = a4;
    v13->_uint64_t sampleCount = a5;
    v13->_sliceable = 0;
    v13->_beatsPerBar = a6;
    v13->_samplesPerBar = a5;
    customBarMarkers = v13->_customBarMarkers;
    v13->_customBarMarkers = 0;

    transitions = v13->_transitions;
    v13->_transitions = 0;

    v13->_errors = 0;
  }
  uint64_t v20 = v13;
LABEL_6:

  return v20;
}

- (int64_t)samplesPerBar
{
  if (self->_samplesPerBar == -1) {
    return -1;
  }
  int64_t bars = self->_bars;
  int64_t result = self->_sampleCount;
  if (bars >= 2) {
    result /= bars;
  }
  return result;
}

- (FlexSegment)initWithFileAtPath:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)FlexSegment;
  uint64_t v9 = [(FlexSegment *)&v60 init];
  if (!v9)
  {
LABEL_9:
    uint64_t v29 = v9;
    goto LABEL_10;
  }
  v10 = objc_msgSend_lastPathComponent(v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_stringByDeletingPathExtension(v10, v11, v12, v13, v14);
  name = v9->_name;
  v9->_name = (NSString *)v15;

  objc_msgSend__decodeTypeInfoFromSegmentName(v9, v17, v18, v19, v20);
  objc_msgSend_readInfoFromAudioFileAtPath_(FlexSegment, v21, (uint64_t)v4, v22, v23);
  uint64_t v24 = (FlexSegment *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = v24;
  if (v24)
  {
    v9->_sampleRate = objc_msgSend_sampleRate(v24, v25, v26, v27, v28);
    v9->_uint64_t sampleCount = objc_msgSend_sampleCount(v29, v30, v31, v32, v33);
    v9->_beatsPerBar = 4;
    v9->_int64_t bars = objc_msgSend_bars(v29, v34, v35, v36, v37);
    v9->_samplesPerBar = objc_msgSend_samplesPerBar(v29, v38, v39, v40, v41);
    uint64_t v46 = objc_msgSend_customBarMarkers(v29, v42, v43, v44, v45);
    customBarMarkers = v9->_customBarMarkers;
    v9->_customBarMarkers = (NSArray *)v46;

    if (objc_msgSend_type(v9, v48, v49, v50, v51) == 2)
    {
      LODWORD(v56) = 10 * objc_msgSend_intValue(v9->_nameIndex, v52, v53, v54, v55);
      if ((int)v56 >= 100) {
        LODWORD(v56) = 100;
      }
      int64_t v56 = (int)v56;
    }
    else
    {
      int64_t v56 = 0;
    }
    v9->_priority = v56;
    v9->_sliceable = 0;
    uint64_t v57 = objc_opt_new();
    transitions = v9->_transitions;
    v9->_transitions = (NSDictionary *)v57;

    goto LABEL_9;
  }
LABEL_10:

  return v29;
}

- (id)encodeAsDictionary
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  id v11 = objc_msgSend_name(self, v7, v8, v9, v10);
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, @"name", v13);

  uint64_t v14 = NSNumber;
  uint64_t v19 = objc_msgSend_bars(self, v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_numberWithInteger_(v14, v20, v19, v21, v22);
  objc_msgSend_setValue_forKey_(v6, v24, (uint64_t)v23, @"bars", v25);

  uint64_t v26 = NSNumber;
  uint64_t v31 = objc_msgSend_priority(self, v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_numberWithInteger_(v26, v32, v31, v33, v34);
  objc_msgSend_setValue_forKey_(v6, v36, (uint64_t)v35, @"priority", v37);

  uint64_t v38 = NSNumber;
  uint64_t v43 = objc_msgSend_beatsPerBar(self, v39, v40, v41, v42);
  v47 = objc_msgSend_numberWithInteger_(v38, v44, v43, v45, v46);
  objc_msgSend_setValue_forKey_(v6, v48, (uint64_t)v47, @"beatsPerBar", v49);

  uint64_t v50 = NSNumber;
  uint64_t v55 = objc_msgSend_sampleRate(self, v51, v52, v53, v54);
  v59 = objc_msgSend_numberWithInteger_(v50, v56, v55, v57, v58);
  objc_msgSend_setValue_forKey_(v6, v60, (uint64_t)v59, @"sampleRate", v61);

  uint64_t v62 = NSNumber;
  uint64_t v67 = objc_msgSend_sampleCount(self, v63, v64, v65, v66);
  uint64_t v71 = objc_msgSend_numberWithLongLong_(v62, v68, v67, v69, v70);
  objc_msgSend_setValue_forKey_(v6, v72, (uint64_t)v71, @"sampleCount", v73);

  if (objc_msgSend_type(self, v74, v75, v76, v77) == 2
    && objc_msgSend_sliceable(self, v78, v79, v80, v81))
  {
    v82 = NSNumber;
    uint64_t v83 = objc_msgSend_sliceable(self, v78, v79, v80, v81);
    uint64_t v87 = objc_msgSend_numberWithBool_(v82, v84, v83, v85, v86);
    objc_msgSend_setValue_forKey_(v6, v88, (uint64_t)v87, @"sliceable", v89);
  }
  uint64_t v90 = objc_msgSend_customBarMarkers(self, v78, v79, v80, v81);
  uint64_t v94 = objc_msgSend_encodeItemsInArray_(FlexUtilities, v91, (uint64_t)v90, v92, v93);

  if (v94) {
    objc_msgSend_setValue_forKey_(v6, v95, (uint64_t)v94, @"customBarMarkers", v98);
  }
  uint64_t v99 = objc_msgSend_transitions(self, v95, v96, v97, v98);
  uint64_t v104 = objc_msgSend_count(v99, v100, v101, v102, v103);

  if (v104)
  {
    v109 = objc_msgSend_transitions(self, v105, v106, v107, v108);
    uint64_t v113 = objc_msgSend_encodeItemsInDict_(FlexUtilities, v110, (uint64_t)v109, v111, v112);

    if (v113) {
      objc_msgSend_setValue_forKey_(v6, v114, (uint64_t)v113, @"transitions", v115);
    }
  }
  if (objc_msgSend_type(self, v105, v106, v107, v108) == 4)
  {
    uint64_t v120 = objc_msgSend_markers(self, v116, v117, v118, v119);
    uint64_t v125 = objc_msgSend_count(v120, v121, v122, v123, v124);

    if (v125)
    {
      v127 = objc_msgSend_markers(self, v116, v126, v118, v119);
      v131 = objc_msgSend_encodeItemsInDict_(FlexUtilities, v128, (uint64_t)v127, v129, v130);

      if (v131) {
        objc_msgSend_setValue_forKey_(v6, v132, (uint64_t)v131, @"markers", v133);
      }
    }
  }
  v137 = objc_msgSend_metadataValueForKey_(self, v116, @"PeakValue", v118, v119);
  if (v137) {
    objc_msgSend_setValue_forKey_(v6, v134, (uint64_t)v137, @"peakValue", v136);
  }
  v140 = objc_msgSend_metadataValueForKey_(self, v134, @"Loudness", v135, v136);
  if (v140) {
    objc_msgSend_setValue_forKey_(v6, v138, (uint64_t)v140, @"loudness", v139);
  }

  return v6;
}

+ (id)readInfoFromAudioFileAtPath:(id)a3
{
  uint64_t v177 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    id v20 = 0;
    goto LABEL_17;
  }
  objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v3, (uint64_t)v5, 0, v4);
  CFURLRef v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    id v20 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = objc_opt_new();
  ExtAudioFileRef outExtAudioFile = 0;
  if (ExtAudioFileOpenURL(v6, &outExtAudioFile)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = outExtAudioFile == 0;
  }
  if (v11)
  {
LABEL_10:
    uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v8, @"Cannot open audio file: %@", v9, v10, v5);
    uint64_t v19 = FlexLogForCategory(1uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_217A5EF10((uint64_t)v18, v19);
    }

    id v20 = 0;
    goto LABEL_13;
  }
  uint64_t v173 = 0;
  memset(outPropertyData, 0, sizeof(outPropertyData));
  UInt32 ioPropertyDataSize = 40;
  if (ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData)
    || (objc_msgSend_setSampleRate_(v7, v12, (int)*(double *)outPropertyData, v13, v14),
        *(void *)outDataSize = 0,
        UInt32 ioPropertyDataSize = 8,
        ExtAudioFileGetProperty(outExtAudioFile, 0x2366726Du, &ioPropertyDataSize, outDataSize)))
  {
    ExtAudioFileDispose(outExtAudioFile);
    ExtAudioFileRef outExtAudioFile = 0;
    goto LABEL_10;
  }
  objc_msgSend_setSampleCount_(v7, v15, *(uint64_t *)outDataSize, v16, v17);
  ExtAudioFileDispose(outExtAudioFile);
  ExtAudioFileRef outExtAudioFile = 0;
  *(void *)&outPropertyData[0] = 0;
  if (AudioFileOpenURL(v6, kAudioFileReadPermission, 0, (AudioFileID *)outPropertyData)
    || !*(void *)&outPropertyData[0])
  {
    goto LABEL_29;
  }
  outDataSize[0] = 0;
  if (AudioFileGetPropertyInfo(*(AudioFileID *)&outPropertyData[0], 0x6D6B6C73u, outDataSize, 0) || !outDataSize[0])
  {
    AudioFileClose(*(AudioFileID *)&outPropertyData[0]);
    goto LABEL_29;
  }
  uint64_t v25 = (int *)malloc_type_malloc(outDataSize[0], 0xED5210EBuLL);
  if (AudioFileGetProperty(*(AudioFileID *)&outPropertyData[0], 0x6D6B6C73u, outDataSize, v25) || !v25[1])
  {
    id v26 = 0;
    goto LABEL_26;
  }
  unint64_t v38 = 0;
  id v26 = 0;
  uint64_t v39 = (id *)(v25 + 6);
  do
  {
    id v40 = *(v39 - 1);
    if (objc_msgSend_hasPrefix_(v40, v41, @"Tempo:", v42, v43))
    {
      if (objc_msgSend_bpm(v7, v44, v45, v46, v47)) {
        goto LABEL_45;
      }
      id v164 = v26;
      uint64_t v51 = v25;
      uint64_t v52 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v48, (uint64_t)v40, v49, v50);
      objc_msgSend_scanString_intoString_(v52, v53, @"Tempo:", 0, v54);
      v59 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v55, v56, v57, v58);
      id v170 = 0;
      objc_msgSend_scanCharactersFromSet_intoString_(v52, v60, (uint64_t)v59, (uint64_t)&v170, v61);
      id v62 = v170;

      if (objc_msgSend_length(v62, v63, v64, v65, v66))
      {
        int v71 = objc_msgSend_intValue(v62, v67, v68, v69, v70);
        if (v71 >= 1) {
          objc_msgSend_setBpm_(v7, v72, v71, v73, v74);
        }
      }

      uint64_t v25 = v51;
      id v26 = v164;
    }
    else
    {
      uint64_t v75 = *(int *)v39;
      uint64_t v76 = (uint64_t)*((double *)v39 - 2);
      uint64_t v77 = [FlexMarker alloc];
      uint64_t v79 = objc_msgSend_initWithName_markerID_position_(v77, v78, (uint64_t)v40, v75, v76);
      uint64_t v52 = v79;
      if (v79 && objc_msgSend_type(v79, v80, v81, v82, v83))
      {
        if (!v26)
        {
          objc_msgSend_array(MEMORY[0x263EFF980], v84, v85, v86, v87);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_addObject_(v26, v84, (uint64_t)v52, v86, v87);
      }
    }

LABEL_45:
    ++v38;
    v39 += 5;
  }
  while (v38 < v25[1]);
  if (v26)
  {
    objc_msgSend_sortUsingComparator_(v26, v88, (uint64_t)&unk_26C7FE848, v89, v90);
    if (objc_msgSend_count(v26, v91, v92, v93, v94) == 1)
    {
      uint64_t v99 = objc_msgSend_firstObject(v26, v95, v96, v97, v98);
      if (objc_msgSend_type(v99, v100, v101, v102, v103) == 2 && objc_msgSend_number(v99, v104, v105, v106, v107) >= 1)
      {
        uint64_t v112 = objc_msgSend_number(v99, v108, v109, v110, v111);
        objc_msgSend_setBars_(v7, v113, v112, v114, v115);
        uint64_t v120 = objc_msgSend_sampleCount(v7, v116, v117, v118, v119);
        uint64_t v125 = objc_msgSend_bars(v7, v121, v122, v123, v124);
        objc_msgSend_setSamplesPerBar_(v7, v126, v120 / v125, v127, v128);
        objc_msgSend_setCustomBarMarkers_(v7, v129, 0, v130, v131);
      }
      else
      {
        v162 = FlexLogForCategory(1uLL);
        if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG)) {
          sub_217A5EECC(v162);
        }

        id v26 = 0;
      }
    }
    else if (objc_msgSend_count(v26, v95, v96, v97, v98))
    {
      v165 = v25;
      long long v168 = 0u;
      long long v169 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      id v26 = v26;
      uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v132, (uint64_t)&v166, (uint64_t)v176, 16);
      if (v133)
      {
        uint64_t v138 = v133;
        uint64_t v139 = *(void *)v167;
        int v140 = 1;
        while (2)
        {
          uint64_t v141 = 0;
          uint64_t v142 = v140;
          int v163 = v138 + v140;
          do
          {
            if (*(void *)v167 != v139) {
              objc_enumerationMutation(v26);
            }
            v143 = *(void **)(*((void *)&v166 + 1) + 8 * v141);
            if (objc_msgSend_type(v143, v134, v135, v136, v137) != 1
              || v142 + v141 != objc_msgSend_number(v143, v144, v145, v146, v147))
            {

              id v26 = 0;
              goto LABEL_67;
            }
            ++v141;
          }
          while (v138 != v141);
          uint64_t v138 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v134, (uint64_t)&v166, (uint64_t)v176, 16);
          int v140 = v163;
          if (v138) {
            continue;
          }
          break;
        }
      }

      uint64_t v152 = objc_msgSend_count(v26, v148, v149, v150, v151);
      objc_msgSend_setBars_(v7, v153, v152, v154, v155);
      objc_msgSend_setSamplesPerBar_(v7, v156, -1, v157, v158);
      objc_msgSend_setCustomBarMarkers_(v7, v159, (uint64_t)v26, v160, v161);
LABEL_67:
      uint64_t v25 = v165;
    }
  }
LABEL_26:
  free(v25);
  AudioFileClose(*(AudioFileID *)&outPropertyData[0]);
  if (!v26)
  {
LABEL_29:
    objc_msgSend_setBars_(v7, v22, 1, v23, v24);
    uint64_t v31 = objc_msgSend_sampleCount(v7, v27, v28, v29, v30);
    objc_msgSend_setSamplesPerBar_(v7, v32, v31, v33, v34);
    objc_msgSend_setCustomBarMarkers_(v7, v35, 0, v36, v37);
    id v26 = 0;
  }

  id v20 = v7;
LABEL_13:

LABEL_16:
LABEL_17:

  return v20;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  objc_msgSend__decodeTypeInfoFromSegmentName(self, v4, v5, v6, v7);
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_name(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v5, v7, @"name %@", v8, v9, v6);

  return v10;
}

+ (id)shortLabelForSegmentType:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_2642B7B08[a3];
  }
}

+ (id)longLabelForSegmentType:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_2642B7B38[a3];
  }
}

- (void)_decodeTypeInfoFromSegmentName
{
  namePrefix = self->_namePrefix;
  self->_namePrefix = (NSString *)&stru_26C7FED08;

  p_nameStem = (void **)&self->_nameStem;
  nameStem = self->_nameStem;
  self->_nameStem = (NSString *)&stru_26C7FED08;

  nameIndex = self->_nameIndex;
  self->_nameIndex = (NSString *)&stru_26C7FED08;

  nameSuffix = self->_nameSuffix;
  self->_nameSuffix = (NSString *)&stru_26C7FED08;

  self->_type = 0;
  uint64_t v12 = objc_msgSend_name(self, v8, v9, v10, v11);

  if (v12)
  {
    uint64_t v17 = (void *)MEMORY[0x263F08B08];
    uint64_t v18 = objc_msgSend_name(self, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_scannerWithString_(v17, v19, (uint64_t)v18, v20, v21);

    id v111 = 0;
    objc_msgSend_scanUpToString_intoString_(v22, v23, @"_", (uint64_t)&v111, v24);
    id v29 = v111;
    if (v29
      && (objc_msgSend_name(self, v25, v26, v27, v28),
          uint64_t v30 = objc_claimAutoreleasedReturnValue(),
          char isEqualToString = objc_msgSend_isEqualToString_(v29, v31, (uint64_t)v30, v32, v33),
          v30,
          (isEqualToString & 1) == 0))
    {
      objc_msgSend_stringWithFormat_(NSString, v25, @"%@_", v27, v28, v29);
      unint64_t v38 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = self->_namePrefix;
      self->_namePrefix = v38;

      uint64_t v35 = objc_msgSend_scanLocation(v22, v40, v41, v42, v43) + 1;
      objc_msgSend_setScanLocation_(v22, v44, v35, v45, v46);
    }
    else
    {
      uint64_t v35 = 0;
      objc_msgSend_setScanLocation_(v22, v25, 0, v27, v28);
    }
    objc_msgSend_scanUpToString_intoString_(v22, v36, @"-", 0, v37);
    uint64_t v51 = objc_msgSend_scanLocation(v22, v47, v48, v49, v50);
    uint64_t v56 = objc_msgSend_name(self, v52, v53, v54, v55);
    uint64_t v61 = objc_msgSend_length(v56, v57, v58, v59, v60);

    objc_msgSend_setScanLocation_(v22, v62, v35, v63, v64);
    if (v51 != v61)
    {
      id v107 = 0;
      objc_msgSend_scanUpToString_intoString_(v22, v65, (uint64_t)&stru_26C7FED08, (uint64_t)&v107, v68);
      id v96 = v107;
      id v73 = v107;
      objc_storeStrong((id *)&self->_nameStem, v96);
      id v84 = 0;
      id v95 = 0;
      unint64_t v97 = 5;
      goto LABEL_23;
    }
    uint64_t v69 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v65, v66, v67, v68);
    id v110 = 0;
    objc_msgSend_scanUpToCharactersFromSet_intoString_(v22, v70, (uint64_t)v69, (uint64_t)&v110, v71);
    id v72 = v110;
    id v73 = v110;

    if (v73)
    {
      objc_storeStrong((id *)&self->_nameStem, v72);
      uint64_t v81 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v77, v78, v79, v80);
      id v109 = 0;
      objc_msgSend_scanCharactersFromSet_intoString_(v22, v82, (uint64_t)v81, (uint64_t)&v109, v83);
      id v84 = v109;

      if (v84)
      {
        uint64_t v86 = NSString;
        uint64_t v87 = objc_msgSend_intValue(v84, v74, v85, v75, v76);
        uint64_t v91 = objc_msgSend_stringWithFormat_(v86, v88, @"%i", v89, v90, v87);
        objc_storeStrong((id *)&self->_nameIndex, v91);
        id v108 = 0;
        objc_msgSend_scanUpToString_intoString_(v22, v92, (uint64_t)&stru_26C7FED08, (uint64_t)&v108, v93);
        id v94 = v108;
        id v95 = v108;
        if (v95) {
          objc_storeStrong((id *)&self->_nameSuffix, v94);
        }

LABEL_15:
        if (objc_msgSend_isEqualToString_(*p_nameStem, v74, @"Body", v75, v76))
        {
          unint64_t v97 = 2;
        }
        else if (objc_msgSend_isEqualToString_(*p_nameStem, v98, @"In", v99, v100))
        {
          unint64_t v97 = 1;
        }
        else if (objc_msgSend_isEqualToString_(*p_nameStem, v101, @"Trans", v102, v103))
        {
          unint64_t v97 = 3;
        }
        else
        {
          if ((objc_msgSend_isEqualToString_(*p_nameStem, v104, @"Out", v105, v106) & 1) == 0)
          {
LABEL_24:

            return;
          }
          unint64_t v97 = 4;
        }
LABEL_23:
        self->_type = v97;
        goto LABEL_24;
      }
    }
    else
    {
      id v84 = 0;
    }
    id v95 = 0;
    goto LABEL_15;
  }
}

- (int64_t)barStartPositionForBarIndex:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  unint64_t v5 = a3;
  if (objc_msgSend_bars(self, a2, a3, v3, v4) <= a3) {
    return 0;
  }
  if (objc_msgSend_samplesPerBar(self, v7, v8, v9, v10) != -1)
  {
    v5 *= objc_msgSend_samplesPerBar(self, v11, v12, v13, v14);
    return v5;
  }
  uint64_t v15 = objc_msgSend_customBarMarkers(self, v11, v12, v13, v14);
  unint64_t v20 = objc_msgSend_count(v15, v16, v17, v18, v19);

  if (v20 <= v5) {
    return 0;
  }
  uint64_t v25 = objc_msgSend_customBarMarkers(self, v21, v22, v23, v24);
  id v29 = objc_msgSend_objectAtIndex_(v25, v26, v5, v27, v28);

  if (v5) {
    unint64_t v5 = objc_msgSend_position(v29, v30, v31, v32, v33);
  }

  return v5;
}

- (int64_t)barEndPositionForBarIndex:(int64_t)a3
{
  if (a3 < 0 || objc_msgSend_bars(self, a2, a3, v3, v4) <= a3) {
    return 0;
  }
  if (objc_msgSend_bars(self, v7, v8, v9, v10) - 1 == a3)
  {
    return objc_msgSend_sampleCount(self, v11, v12, v13, v14);
  }
  else
  {
    return objc_msgSend_barStartPositionForBarIndex_(self, v11, a3 + 1, v13, v14);
  }
}

- (int64_t)barDurationForBarIndex:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_barEndPositionForBarIndex_(self, a2, a3, v3, v4);
  return v7 - objc_msgSend_barStartPositionForBarIndex_(self, v8, a3, v9, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v9 = objc_alloc_init((Class)objc_opt_class());
  if (v9)
  {
    uint64_t v10 = objc_msgSend_name(self, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend_copyWithZone_(v10, v11, (uint64_t)a3, v12, v13);
    uint64_t v15 = (void *)v9[2];
    v9[2] = v14;

    objc_msgSend__decodeTypeInfoFromSegmentName(v9, v16, v17, v18, v19);
    v9[3] = objc_msgSend_priority(self, v20, v21, v22, v23);
    v9[4] = objc_msgSend_bars(self, v24, v25, v26, v27);
    v9[5] = objc_msgSend_beatsPerBar(self, v28, v29, v30, v31);
    v9[6] = objc_msgSend_samplesPerBar(self, v32, v33, v34, v35);
    id v40 = objc_msgSend_customBarMarkers(self, v36, v37, v38, v39);
    uint64_t v44 = objc_msgSend_copyWithZone_(v40, v41, (uint64_t)a3, v42, v43);
    uint64_t v45 = (void *)v9[7];
    v9[7] = v44;

    v9[8] = objc_msgSend_sampleRate(self, v46, v47, v48, v49);
    v9[9] = objc_msgSend_sampleCount(self, v50, v51, v52, v53);
    *((unsigned char *)v9 + 8) = objc_msgSend_sliceable(self, v54, v55, v56, v57);
    id v62 = objc_msgSend_transitions(self, v58, v59, v60, v61);
    uint64_t v66 = objc_msgSend_copyWithZone_(v62, v63, (uint64_t)a3, v64, v65);
    uint64_t v67 = (void *)v9[10];
    v9[10] = v66;

    id v72 = objc_msgSend_markers(self, v68, v69, v70, v71);
    uint64_t v76 = objc_msgSend_copyWithZone_(v72, v73, (uint64_t)a3, v74, v75);
    uint64_t v77 = (void *)v9[11];
    v9[11] = v76;

    v9[13] = objc_msgSend_errors(self, v78, v79, v80, v81);
    uint64_t v86 = objc_msgSend_metadataValues(self, v82, v83, v84, v85);
    uint64_t v90 = objc_msgSend_copyWithZone_(v86, v87, (uint64_t)a3, v88, v89);
    uint64_t v91 = (void *)v9[14];
    v9[14] = v90;
  }
  return v9;
}

- (BOOL)linkedPerBarTransitionsToSegmentNamed:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_transitions(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKey_((void *)v9, v10, (uint64_t)v4, v11, v12);

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  return (v9 & 1) == 0;
}

- (void)setLinkedPerBarTransitions:(BOOL)a3 toSegmentNamed:(id)a4
{
  int v4 = a3;
  uint64_t v6 = (const char *)a4;
  uint64_t v65 = v6;
  if ((v4 & 1) == 0)
  {
    int v10 = objc_msgSend_sliceable(self, v6, v7, v8, v9);
    uint64_t v6 = v65;
    if (!v10) {
      goto LABEL_28;
    }
  }
  if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v6, (uint64_t)v65, v8, v9) == v4) {
    goto LABEL_28;
  }
  uint64_t v14 = objc_msgSend_transitions(self, v65, v11, v12, v13);
  uint64_t v18 = objc_msgSend_objectForKey_(v14, v15, (uint64_t)v65, v16, v17);

  if ((v4 & 1) == 0)
  {
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v27 = v18;
    }
    else {
      id v27 = 0;
    }
    uint64_t v37 = objc_msgSend_array(MEMORY[0x263EFF980], v19, v20, v21, v22);
    if (objc_msgSend_bars(self, v38, v39, v40, v41) >= 1)
    {
      uint64_t v46 = 0;
      do
      {
        if (v27) {
          uint64_t v47 = objc_msgSend_copy(v27, v42, v43, v44, v45);
        }
        else {
          uint64_t v47 = objc_opt_new();
        }
        uint64_t v51 = (void *)v47;
        objc_msgSend_addObject_(v37, v48, v47, v49, v50);

        ++v46;
      }
      while (v46 < objc_msgSend_bars(self, v52, v53, v54, v55));
    }
    uint64_t v56 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v57 = objc_msgSend_transitions(self, v42, v43, v44, v45);
    objc_msgSend_dictionaryWithDictionary_(v56, v58, (uint64_t)v57, v59, v60);
    uint64_t v61 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKey_(v61, v62, (uint64_t)v37, (uint64_t)v65, v63);
    transitions = self->_transitions;
    self->_transitions = v61;

    goto LABEL_26;
  }
  if (!v18) {
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  objc_msgSend_firstObject(v18, v23, v24, v25, v26);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    id v27 = 0;
  }
  uint64_t v28 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v29 = objc_msgSend_transitions(self, v23, v24, v25, v26);
  objc_msgSend_dictionaryWithDictionary_(v28, v30, (uint64_t)v29, v31, v32);
  uint64_t v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  if (v27) {
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)v27, (uint64_t)v65, v36);
  }
  else {
    objc_msgSend_removeObjectForKey_(v33, v34, (uint64_t)v65, v35, v36);
  }
  uint64_t v37 = self->_transitions;
  self->_transitions = v33;
LABEL_26:

LABEL_27:
LABEL_28:
  MEMORY[0x270F9A758]();
}

- (id)transitionToSegmentNamed:(id)a3 fromBarIndex:(int64_t)a4
{
  id v10 = a3;
  if (!v10)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = objc_msgSend_transitions(self, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_objectForKey_(v11, v12, (uint64_t)v10, v13, v14);

  if (!v15) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v16 = 0;
    if (a4 < 0 || (isKindOfClass & 1) == 0) {
      goto LABEL_12;
    }
    if (objc_msgSend_count(v15, v18, v19, v20, v21) > (unint64_t)a4)
    {
      objc_msgSend_objectAtIndex_(v15, v22, a4, v23, v24);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
LABEL_11:
    id v16 = 0;
    goto LABEL_12;
  }
  id v16 = v15;
LABEL_12:

LABEL_13:
  return v16;
}

- (void)addOrReplaceTransition:(id)a3 toSegmentNamed:(id)a4 fromBarIndex:(int64_t)a5
{
  id v51 = a3;
  id v12 = a4;
  if (v51 && v12)
  {
    uint64_t v13 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v14 = objc_msgSend_transitions(self, v8, v9, v10, v11);
    objc_msgSend_dictionaryWithDictionary_(v13, v15, (uint64_t)v14, v16, v17);
    uint64_t v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v19, (uint64_t)v12, v20, v21))
    {
      if (objc_msgSend_isDefaultTransition(v51, v22, v23, v24, v25)) {
        objc_msgSend_removeObjectForKey_(v18, v26, (uint64_t)v12, v27, v28);
      }
      else {
        objc_msgSend_setObject_forKey_(v18, v26, (uint64_t)v51, (uint64_t)v12, v28);
      }
    }
    else
    {
      uint64_t v29 = objc_msgSend_objectForKey_(v18, v22, (uint64_t)v12, v24, v25);
      if (v29)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ((a5 & 0x8000000000000000) == 0
          && (isKindOfClass & 1) != 0
          && objc_msgSend_count(v29, v31, v32, v33, v34) > (unint64_t)a5)
        {
          uint64_t v38 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v35, (uint64_t)v29, v36, v37);
          if (objc_msgSend_isDefaultTransition(v51, v39, v40, v41, v42))
          {
            uint64_t v45 = objc_opt_new();
            objc_msgSend_setObject_atIndexedSubscript_(v38, v46, (uint64_t)v45, a5, v47);
          }
          else
          {
            objc_msgSend_setObject_atIndexedSubscript_(v38, v43, (uint64_t)v51, a5, v44);
          }
          objc_msgSend_setObject_forKey_(v18, v48, (uint64_t)v38, (uint64_t)v12, v49);
        }
      }
    }
    transitions = self->_transitions;
    self->_transitions = v18;
  }
}

- (void)removeTransitionToSegmentNamed:(id)a3 fromBarIndex:(int64_t)a4
{
  uint64_t v6 = (const char *)a3;
  if (v6)
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v38 = (uint64_t)v6;
    uint64_t v11 = objc_msgSend_transitions(self, v6, v7, v8, v9);
    objc_msgSend_dictionaryWithDictionary_(v10, v12, (uint64_t)v11, v13, v14);
    uint64_t v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v16, v38, v17, v18))
    {
      objc_msgSend_removeObjectForKey_(v15, v19, v38, v20, v21);
    }
    else
    {
      uint64_t v22 = objc_msgSend_objectForKey_(v15, v19, v38, v20, v21);
      if (v22)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ((a4 & 0x8000000000000000) == 0
          && (isKindOfClass & 1) != 0
          && objc_msgSend_count(v22, v24, v25, v26, v27) > (unint64_t)a4)
        {
          uint64_t v31 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v28, (uint64_t)v22, v29, v30);
          uint64_t v32 = objc_opt_new();
          objc_msgSend_setObject_atIndexedSubscript_(v31, v33, (uint64_t)v32, a4, v34);

          objc_msgSend_setObject_forKey_(v15, v35, (uint64_t)v31, v38, v36);
        }
      }
    }
    transitions = self->_transitions;
    self->_transitions = v15;
  }
  MEMORY[0x270F9A758]();
}

+ (BOOL)canTransitionFromSegment:(id)a3 toSegment:(id)a4 fromBarIndex:(int64_t)a5 checkIfPrevented:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v15 = objc_msgSend_type(v9, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_type(v10, v16, v17, v18, v19);
  LOBYTE(v25) = 0;
  if (v15 == 5 || !v15 || !v20 || v20 == 5) {
    goto LABEL_33;
  }
  if (v15 == 3)
  {
    BOOL v26 = (v20 & 0xFFFFFFFFFFFFFFFDLL) == 1;
LABEL_10:
    int v25 = !v26;
    if (!v25) {
      goto LABEL_33;
    }
    goto LABEL_17;
  }
  if (v15 != 2)
  {
    if (v15 == 1)
    {
      BOOL v26 = v20 == 1;
      goto LABEL_10;
    }
LABEL_30:
    LOBYTE(v25) = 0;
    goto LABEL_33;
  }
  if ((unint64_t)(v20 - 3) >= 2)
  {
    if (v20 != 2) {
      goto LABEL_30;
    }
    uint64_t v44 = objc_msgSend_nameIndex(v9, v21, v22, v23, v24);
    uint64_t v49 = objc_msgSend_nameIndex(v10, v45, v46, v47, v48);
    uint64_t v52 = objc_msgSend_compare_options_(v44, v50, (uint64_t)v49, 65, v51);

    if (v52 != -1)
    {
      if (!v52)
      {
        uint64_t v53 = objc_msgSend_nameSuffix(v9, v21, v22, v23, v24);
        uint64_t v58 = objc_msgSend_nameSuffix(v10, v54, v55, v56, v57);
        uint64_t v62 = objc_msgSend_caseInsensitiveCompare_(v53, v59, (uint64_t)v58, v60, v61);

        uint64_t v67 = objc_msgSend_nameIndex(v9, v63, v64, v65, v66);
        id v72 = objc_msgSend_nameIndex(v10, v68, v69, v70, v71);
        int isEqualToString = objc_msgSend_isEqualToString_(v67, v73, (uint64_t)v72, v74, v75);

        if (v62 == 1) {
          int v25 = isEqualToString;
        }
        else {
          int v25 = 1;
        }
        if (!v25) {
          goto LABEL_33;
        }
        goto LABEL_17;
      }
      goto LABEL_30;
    }
  }
  LOBYTE(v25) = 1;
LABEL_17:
  if (v6)
  {
    uint64_t v27 = objc_msgSend_name(v10, v21, v22, v23, v24);
    int v31 = objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v9, v28, (uint64_t)v27, v29, v30);

    if (v31) {
      a5 = objc_msgSend_bars(v9, v32, v33, v34, v35) - 1;
    }
    uint64_t v36 = objc_msgSend_name(v10, v32, v33, v34, v35);
    uint64_t v39 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v9, v37, (uint64_t)v36, a5, v38);

    if (v39) {
      int v25 = objc_msgSend_prevented(v39, v40, v41, v42, v43) ^ 1;
    }
    else {
      LOBYTE(v25) = 1;
    }
  }
LABEL_33:

  return v25;
}

- (BOOL)isPriorityValid
{
  if (objc_msgSend_type(self, a2, v2, v3, v4) != 2) {
    return 1;
  }
  if (objc_msgSend_priority(self, v6, v7, v8, v9) < 1) {
    return 0;
  }
  return objc_msgSend_priority(self, v10, v11, v12, v13) < 101;
}

- (BOOL)relinkAllTransitions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v6 = objc_msgSend_transitions(self, a2, v2, v3, v4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    char v13 = 0;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(self, v9, v16, v10, v11) & 1) == 0)
        {
          char v13 = 1;
          objc_msgSend_setLinkedPerBarTransitions_toSegmentNamed_(self, v9, 1, v16, v11);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (void)setBars:(int64_t)a3
{
  if (self->_bars != a3)
  {
    objc_msgSend_relinkAllTransitions(self, a2, a3, v3, v4);
    self->_int64_t bars = a3;
  }
}

- (void)setSliceable:(BOOL)a3
{
  if (!a3) {
    objc_msgSend_relinkAllTransitions(self, a2, a3, v3, v4);
  }
  self->_sliceable = a3;
}

+ (id)segmentsWithType:(unint64_t)a3 inSegments:(id)a4
{
  unint64_t v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a4;
  uint64_t v11 = objc_msgSend_array(v5, v7, v8, v9, v10);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_217A5E5F8;
  uint64_t v24 = &unk_2642B7A98;
  id v25 = v11;
  unint64_t v26 = a3;
  id v12 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v13, (uint64_t)&v21, v14, v15);

  long long v19 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v16, (uint64_t)v12, v17, v18, v21, v22, v23, v24);

  return v19;
}

+ (id)segmentsWithType:(unint64_t)a3 nameIndex:(id)a4 nameSuffix:(id)a5 inSegments:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263EFF980];
  id v12 = a6;
  uint64_t v17 = objc_msgSend_array(v11, v13, v14, v15, v16);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  int v31 = sub_217A5E788;
  uint64_t v32 = &unk_2642B7AC0;
  id v33 = v9;
  id v34 = v10;
  id v35 = v17;
  unint64_t v36 = a3;
  id v18 = v17;
  id v19 = v10;
  id v20 = v9;
  objc_msgSend_enumerateObjectsUsingBlock_(v12, v21, (uint64_t)&v29, v22, v23);

  uint64_t v27 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v24, (uint64_t)v18, v25, v26, v29, v30, v31, v32);

  return v27;
}

+ (FlexSegment)segmentWithName:(id)a3 inSegments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_217A5E994;
  id v20 = sub_217A5E9A4;
  id v21 = 0;
  if (v5)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_217A5E9AC;
    v13[3] = &unk_2642B7AE8;
    id v14 = v5;
    uint64_t v15 = &v16;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, (uint64_t)v13, v8, v9);

    id v10 = (void *)v17[5];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;
  _Block_object_dispose(&v16, 8);

  return (FlexSegment *)v11;
}

+ (int64_t)samplesForTimeInMsec:(int64_t)a3 atSampleRate:(int64_t)a4
{
  int32_t v4 = a4;
  CMTimeMake(&time, a3, 1000);
  CMTimeConvertScale(&v6, &time, v4, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v6.value;
}

+ (int64_t)crossfadeLengthInSamplesForFromSeg:(id)a3 toSeg:(id)a4 fadeOutTimeInMsec:(int64_t)a5 fadeInTimeInMsec:(int64_t)a6 validFadeOutSamples:(int64_t *)a7 validFadeInSamples:(int64_t *)a8
{
  id v13 = a3;
  id v14 = a4;
  uint64_t v19 = objc_msgSend_sampleRate(v13, v15, v16, v17, v18);
  int64_t v22 = objc_msgSend_samplesForTimeInMsec_atSampleRate_(FlexSegment, v20, a5, v19, v21);
  if (v22 > objc_msgSend_sampleCount(v13, v23, v24, v25, v26)) {
    int64_t v22 = objc_msgSend_sampleCount(v13, v27, v28, v29, v30);
  }
  if (v22 > objc_msgSend_sampleCount(v14, v27, v28, v29, v30)) {
    int64_t v22 = objc_msgSend_sampleCount(v14, v31, v32, v33, v34);
  }
  int64_t v35 = objc_msgSend_samplesForTimeInMsec_atSampleRate_(FlexSegment, v31, a6, v19, v34);
  if (v35 > objc_msgSend_sampleCount(v14, v36, v37, v38, v39)) {
    int64_t v35 = objc_msgSend_sampleCount(v14, v40, v41, v42, v43);
  }
  if (a7) {
    *a7 = v22;
  }
  if (a8) {
    *a8 = v35;
  }
  if (v35 <= v22) {
    int64_t v44 = v22;
  }
  else {
    int64_t v44 = v35;
  }

  return v44;
}

- (void)addMetadataValue:(id)a3 forKey:(id)a4
{
  if (self->_metadataValues)
  {
    CMTime v6 = (void *)MEMORY[0x263EFF9A0];
    id v7 = a4;
    id v8 = a3;
    id v13 = objc_msgSend_metadataValues(self, v9, v10, v11, v12);
    objc_msgSend_dictionaryWithDictionary_(v6, v14, (uint64_t)v13, v15, v16);
    int v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKey_(v31, v17, (uint64_t)v8, (uint64_t)v7, v18);
    objc_msgSend_dictionaryWithDictionary_(NSDictionary, v19, (uint64_t)v31, v20, v21);
    int64_t v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadataValues = self->_metadataValues;
    self->_metadataValues = v22;

    uint64_t v24 = v31;
  }
  else
  {
    uint64_t v25 = NSDictionary;
    id v26 = a4;
    id v27 = a3;
    objc_msgSend_dictionaryWithObject_forKey_(v25, v28, (uint64_t)v27, (uint64_t)v26, v29);
    uint64_t v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    uint64_t v24 = self->_metadataValues;
    self->_metadataValues = v30;
  }
}

- (id)metadataValueForKey:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_metadataValues, a2, (uint64_t)a3, v3, v4);
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)bars
{
  return self->_bars;
}

- (int64_t)beatsPerBar
{
  return self->_beatsPerBar;
}

- (void)setBeatsPerBar:(int64_t)a3
{
  self->_beatsPerBar = a3;
}

- (void)setSamplesPerBar:(int64_t)a3
{
  self->_samplesPerBar = a3;
}

- (NSArray)customBarMarkers
{
  return self->_customBarMarkers;
}

- (void)setCustomBarMarkers:(id)a3
{
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (int64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(int64_t)a3
{
  self->_uint64_t sampleCount = a3;
}

- (BOOL)sliceable
{
  return self->_sliceable;
}

- (NSDictionary)transitions
{
  return self->_transitions;
}

- (void)setTransitions:(id)a3
{
}

- (NSDictionary)markers
{
  return self->_markers;
}

- (void)setMarkers:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)errors
{
  return self->_errors;
}

- (void)setErrors:(unint64_t)a3
{
  self->_errors = a3;
}

- (NSDictionary)metadataValues
{
  return self->_metadataValues;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameStem
{
  return self->_nameStem;
}

- (NSString)nameIndex
{
  return self->_nameIndex;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_nameIndex, 0);
  objc_storeStrong((id *)&self->_nameStem, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_markers, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_storeStrong((id *)&self->_customBarMarkers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end