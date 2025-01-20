@interface CHClientStrokeProvider
+ (BOOL)isNonTextSection:(id)a3;
- (BOOL)hasValidMathAnnotation;
- (CGRect)boundingBox;
- (CHClientStrokeProvider)initWithStrokes:(id)a3 version:(int64_t)a4;
- (CHClientStrokeProvider)initWithURL:(id)a3 version:(int64_t)a4 keepTextOnly:(BOOL)a5;
- (CHClientStrokeProvider)initWithURL:(id)a3 version:(int64_t)a4 keepTextOnly:(BOOL)a5 strokesFromSections:(id)a6 channels:(id)a7 sectionTypes:(id)a8;
- (CHStrokeProviderVersion)strokeProviderVersion;
- (NSArray)orderedStrokes;
- (NSArray)sectionedStrokes;
- (NSMutableDictionary)_strokeIdsByEncoding;
- (NSMutableDictionary)strokesByID;
- (NSMutableDictionary)transcriptionCache;
- (NSOrderedSet)visibleStrokeEncodedIdentifiers;
- (NSString)description;
- (id)cachedTranscriptionForStrokeGroup:(id)a3;
- (id)drawing;
- (id)drawingWithGroups:(id)a3 transforms:(id)a4;
- (id)drawingWithStrokes:(id)a3;
- (id)encodedStrokeIdentifier:(id)a3;
- (id)getStrokeClassificationArray:(int64_t)a3 ofType:(int64_t)a4;
- (id)strokeForIdentifier:(id)a3;
- (id)strokeIdentifierFromData:(id)a3;
- (int64_t)compareOrderOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4;
- (int64_t)groupingPriority;
- (unint64_t)compareStyleOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4;
- (void)loadStrokesBasedOnSectionTypeFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8;
- (void)loadStrokesBasedOnStrokeClassicationType:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8;
- (void)loadStrokesBasedOnUnicodeFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8;
- (void)loadStrokesFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8;
- (void)loadStrokesFrom:(id)a3 withStrokes:(id)a4 types:(id)a5 withTime:(BOOL)a6 atTimestamp:(double)a7 channels:(id)a8 orderedStrokes:(id)a9;
- (void)setHasValidMathAnnotation:(BOOL)a3;
- (void)setStrokeAttributes:(unint64_t)a3 atIndexes:(id)a4;
- (void)updateWithAddedStrokes:(id)a3 removedStrokeIds:(id)a4;
- (void)updateWithGroups:(id)a3 transforms:(id)a4;
@end

@implementation CHClientStrokeProvider

+ (BOOL)isNonTextSection:(id)a3
{
  id v3 = a3;
  v12 = objc_msgSend_objectForKey_(v3, v4, @"type", v5, v6, v7);
  if (v12)
  {
    v13 = objc_msgSend_objectForKey_(v3, v8, @"type", v9, v10, v11);
    if (objc_msgSend_isEqualToString_(v13, v14, @"text", v15, v16, v17))
    {
      LOBYTE(v22) = 0;
    }
    else
    {
      v23 = objc_msgSend_objectForKey_(v3, v18, @"type", v19, v20, v21);
      int v22 = objc_msgSend_isEqualToString_(v23, v24, @"math", v25, v26, v27) ^ 1;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

- (CHClientStrokeProvider)initWithStrokes:(id)a3 version:(int64_t)a4
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CHClientStrokeProvider;
  uint64_t v6 = [(CHClientStrokeProvider *)&v40 init];
  v12 = v6;
  if (v6)
  {
    v6->_version = 0;
    uint64_t v13 = objc_msgSend_array(MEMORY[0x1E4F1C978], v7, v8, v9, v10, v11);
    orderedStrokes = v12->_orderedStrokes;
    v12->_orderedStrokes = (NSArray *)v13;

    uint64_t v20 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16, v17, v18, v19);
    strokesByID = v12->_strokesByID;
    v12->_strokesByID = (NSMutableDictionary *)v20;

    uint64_t v27 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v22, v23, v24, v25, v26);
    strokeIdsByEncoding = v12->__strokeIdsByEncoding;
    v12->__strokeIdsByEncoding = (NSMutableDictionary *)v27;

    uint64_t v34 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v29, v30, v31, v32, v33);
    transcriptionCache = v12->_transcriptionCache;
    v12->_transcriptionCache = (NSMutableDictionary *)v34;

    objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v12, v36, (uint64_t)v5, 0, v37, v38);
  }

  return v12;
}

- (CHClientStrokeProvider)initWithURL:(id)a3 version:(int64_t)a4 keepTextOnly:(BOOL)a5
{
  BOOL v186 = a5;
  v194[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v192.receiver = self;
  v192.super_class = (Class)CHClientStrokeProvider;
  uint64_t v7 = [(CHClientStrokeProvider *)&v192 init];
  uint64_t v13 = v7;
  if (v7)
  {
    v7->_version = 0;
    uint64_t v14 = objc_msgSend_array(MEMORY[0x1E4F1C978], v8, v9, v10, v11, v12);
    orderedStrokes = v13->_orderedStrokes;
    v13->_orderedStrokes = (NSArray *)v14;

    uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v16, v17, v18, v19, v20);
    strokesByID = v13->_strokesByID;
    v13->_strokesByID = (NSMutableDictionary *)v21;

    uint64_t v28 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v23, v24, v25, v26, v27);
    strokeIdsByEncoding = v13->__strokeIdsByEncoding;
    v13->__strokeIdsByEncoding = (NSMutableDictionary *)v28;

    uint64_t v35 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v30, v31, v32, v33, v34);
    transcriptionCache = v13->_transcriptionCache;
    v13->_transcriptionCache = (NSMutableDictionary *)v35;

    v42 = objc_msgSend_pathExtension(v6, v37, v38, v39, v40, v41);
    int isEqualToString = objc_msgSend_isEqualToString_(v42, v43, @"json", v44, v45, v46);

    if (isEqualToString)
    {
      v53 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v184 = (uint64_t)v6;
      v54 = objc_msgSend_path(v6, v48, v49, v50, v51, v52);
      v59 = objc_msgSend_dataWithContentsOfFile_(v53, v55, (uint64_t)v54, v56, v57, v58);

      id v191 = 0;
      v62 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v60, (uint64_t)v59, 1, (uint64_t)&v191, v61);
      id v63 = v191;
      v68 = objc_msgSend_objectForKey_(v62, v64, @"channels", v65, v66, v67);
      uint64_t v73 = objc_msgSend_objectForKey_(v62, v69, @"sectionsData", v70, v71, v72);
      v79 = (void *)v73;
      if (v68)
      {
        v80 = objc_msgSend_objectForKeyedSubscript_(v68, v74, @"t", v76, v77, v78);
        BOOL v81 = v80 != 0;

        if (v79) {
          goto LABEL_5;
        }
      }
      else
      {
        BOOL v81 = 0;
        if (v73)
        {
LABEL_5:
          uint64_t v185 = (uint64_t)v68;
          id v178 = v63;
          v180 = v62;
          v182 = v59;
          if (v81)
          {
LABEL_6:
            BOOL v82 = 1;
LABEL_12:
            uint64_t v129 = v184;
            objc_msgSend_array(MEMORY[0x1E4F1CA48], v74, v75, v76, v77, v78, v178, v180, v182);
            v130 = (NSArray *)objc_claimAutoreleasedReturnValue();
            long long v187 = 0u;
            long long v188 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            id v105 = v79;
            uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v131, (uint64_t)&v187, (uint64_t)v193, 16, v132);
            if (v133)
            {
              uint64_t v139 = v133;
              uint64_t v140 = *(void *)v188;
              double v141 = 2.22507386e-308;
              do
              {
                uint64_t v142 = 0;
                do
                {
                  if (*(void *)v188 != v140) {
                    objc_enumerationMutation(v105);
                  }
                  uint64_t v150 = *(void *)(*((void *)&v187 + 1) + 8 * v142);
                  if (!v186
                    || (objc_msgSend_isNonTextSection_(CHClientStrokeProvider, v134, *(void *)(*((void *)&v187 + 1) + 8 * v142), v136, v137, v138) & 1) == 0)
                  {
                    v151 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v134, v135, v136, v137, v138);
                    objc_msgSend_loadStrokesFrom_section_withTime_atTimestamp_channels_orderedStrokes_(v13, v152, v129, v150, v82, v185, v151, v141);
                    v158 = objc_msgSend_lastObject(v151, v153, v154, v155, v156, v157);
                    objc_msgSend_endTimestamp(v158, v159, v160, v161, v162, v163);
                    if (v141 <= v169)
                    {
                      v170 = objc_msgSend_lastObject(v151, v164, v165, v166, v167, v168);
                      objc_msgSend_endTimestamp(v170, v171, v172, v173, v174, v175);
                      double v141 = v176;

                      uint64_t v129 = v184;
                    }

                    objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v13, v143, (uint64_t)v151, 0, v144, v145);
                    objc_msgSend_addObject_(v130, v146, (uint64_t)v151, v147, v148, v149);
                  }
                  ++v142;
                }
                while (v139 != v142);
                uint64_t v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v134, (uint64_t)&v187, (uint64_t)v193, 16, v138);
              }
              while (v139);
            }

            sectionedStrokes = v13->_sectionedStrokes;
            v13->_sectionedStrokes = v130;
            v62 = v181;
            v59 = v183;
            id v63 = v179;
            v68 = (void *)v185;
            goto LABEL_25;
          }
LABEL_11:
          v106 = objc_msgSend_firstObject(v79, v74, v75, v76, v77, v78, v178, v180, v182);
          v111 = objc_msgSend_objectForKeyedSubscript_(v106, v107, @"data", v108, v109, v110);

          v117 = objc_msgSend_firstObject(v111, v112, v113, v114, v115, v116);
          v123 = objc_msgSend_firstObject(v117, v118, v119, v120, v121, v122);
          BOOL v82 = (unint64_t)objc_msgSend_count(v123, v124, v125, v126, v127, v128) > 2;

          goto LABEL_12;
        }
      }
      uint64_t v83 = objc_msgSend_objectForKey_(v62, v74, @"strokeClassification", v76, v77, v78);
      if (v83)
      {
        v89 = (void *)v83;
        uint64_t v90 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v84, v85, v86, v87, v88);
        objc_msgSend_loadStrokesBasedOnStrokeClassicationType_section_withTime_atTimestamp_channels_orderedStrokes_(v13, v91, v184, (uint64_t)v62, v81, (uint64_t)v68, v90, 2.22507386e-308);
        v13->_strokeClassificationGTSource = 1;
        objc_msgSend_array(MEMORY[0x1E4F1CA48], v92, v93, v94, v95, v96);
        v97 = (NSArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v97, v98, v90, v99, v100, v101);
        v102 = v13->_sectionedStrokes;
        v13->_sectionedStrokes = v97;
        sectionedStrokes = v97;

        v104 = v13->_orderedStrokes;
        v13->_orderedStrokes = (NSArray *)v90;

        id v105 = v89;
LABEL_25:

        id v6 = (id)v184;
        goto LABEL_26;
      }
      v194[0] = v62;
      v79 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v84, (uint64_t)v194, 1, v87, v88);
      uint64_t v185 = (uint64_t)v68;
      id v178 = v63;
      v180 = v62;
      v182 = v59;
      if (v81) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
LABEL_26:

  return v13;
}

- (id)cachedTranscriptionForStrokeGroup:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_transcriptionCache, a2, (uint64_t)a3, v3, v4, v5);
}

- (id)getStrokeClassificationArray:(int64_t)a3 ofType:(int64_t)a4
{
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = objc_msgSend_initWithCapacity_(v6, v7, a3, v8, v9, v10);
  if (a3 >= 1)
  {
    do
    {
      uint64_t v16 = objc_msgSend_numberWithLong_(NSNumber, v11, a4, v12, v13, v14);
      objc_msgSend_addObject_(v15, v17, (uint64_t)v16, v18, v19, v20);

      --a3;
    }
    while (a3);
  }
  return v15;
}

- (CHClientStrokeProvider)initWithURL:(id)a3 version:(int64_t)a4 keepTextOnly:(BOOL)a5 strokesFromSections:(id)a6 channels:(id)a7 sectionTypes:(id)a8
{
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v118 = a8;
  v119.receiver = self;
  v119.super_class = (Class)CHClientStrokeProvider;
  uint64_t v16 = [(CHClientStrokeProvider *)&v119 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_version = 0;
    uint64_t v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    orderedStrokes = v17->_orderedStrokes;
    v17->_orderedStrokes = v18;

    uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    strokesByID = v17->_strokesByID;
    v17->_strokesByID = v20;

    int v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    strokeIdsByEncoding = v17->__strokeIdsByEncoding;
    v17->__strokeIdsByEncoding = v22;

    if (v15)
    {
      v29 = objc_msgSend_objectForKeyedSubscript_(v15, v24, @"t", v26, v27, v28);
      BOOL v116 = v29 != 0;
    }
    else
    {
      BOOL v116 = 0;
    }
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v24, v25, v26, v27, v28);
    v117 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v14, v30, v31, v32, v33, v34))
    {
      uint64_t v39 = 0;
      double v40 = 2.22507386e-308;
      objc_msgSend_objectAtIndex_(v14, v35, 0, v36, v37, v38, v17);
      while (1)
        uint64_t v57 = {;
        v62 = objc_msgSend_objectAtIndex_(v118, v58, v39, v59, v60, v61);

        if (!v11
          || (v68 = objc_opt_class(),
              objc_msgSend_isStrokeClassificationTextOrMath_(v68, v69, (uint64_t)v62, v70, v71, v72)))
        {
          uint64_t v73 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v63, v64, v65, v66, v67);
          uint64_t v79 = objc_msgSend_count(v57, v74, v75, v76, v77, v78);
          uint64_t v83 = objc_msgSend_getStrokeClassificationArray_ofType_(v17, v80, v79, (uint64_t)v62, v81, v82);
          objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(v17, v84, (uint64_t)v13, (uint64_t)v57, (uint64_t)v83, v116, v15, v73, v40);
          uint64_t v90 = objc_msgSend_lastObject(v73, v85, v86, v87, v88, v89);
          objc_msgSend_endTimestamp(v90, v91, v92, v93, v94, v95);
          if (v40 <= v101)
          {
            objc_msgSend_lastObject(v73, v96, v97, v98, v99, v100);
            id v102 = v14;
            id v103 = v15;
            BOOL v104 = v11;
            v106 = id v105 = v13;
            objc_msgSend_endTimestamp(v106, v107, v108, v109, v110, v111);
            double v40 = v112;

            id v13 = v105;
            BOOL v11 = v104;
            id v15 = v103;
            id v14 = v102;
            uint64_t v17 = v115;
          }

          objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v17, v41, (uint64_t)v73, 0, v42, v43);
          objc_msgSend_addObject_(v117, v44, (uint64_t)v73, v45, v46, v47);
        }
        if (++v39 >= (unint64_t)objc_msgSend_count(v14, v48, v49, v50, v51, v52)) {
          break;
        }
        objc_msgSend_objectAtIndex_(v14, v53, v39, v54, v55, v56, v115);
      }
    }
    sectionedStrokes = v17->_sectionedStrokes;
    v17->_sectionedStrokes = v117;
  }
  return v17;
}

- (NSString)description
{
  v28.receiver = self;
  v28.super_class = (Class)CHClientStrokeProvider;
  uint64_t v3 = [(CHClientStrokeProvider *)&v28 description];
  uint64_t v9 = objc_msgSend_strokeProviderVersion(self, v4, v5, v6, v7, v8);
  id v15 = objc_msgSend_orderedStrokes(self, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_stringByAppendingFormat_(v3, v22, @" Version: %@, Strokes: %ld", v23, v24, v25, v9, v21);

  return (NSString *)v26;
}

- (void)updateWithAddedStrokes:(id)a3 removedStrokeIds:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v13 = self->_orderedStrokes;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v105, (uint64_t)v111, 16, v15);
  if (v16)
  {
    uint64_t v22 = v16;
    uint64_t v23 = *(void *)v106;
    if (v6)
    {
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v106 != v23) {
            objc_enumerationMutation(v13);
          }
          uint64_t v25 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend_strokeIdentifier(v25, v17, v18, v19, v20, v21, v95);
          char v31 = objc_msgSend_containsObject_(v6, v27, (uint64_t)v26, v28, v29, v30);

          if ((v31 & 1) == 0) {
            objc_msgSend_addObject_(v12, v17, (uint64_t)v25, v19, v20, v21);
          }
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v105, (uint64_t)v111, 16, v21);
      }
      while (v22);
    }
    else
    {
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v106 != v23) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend_addObject_(v12, v17, *(void *)(*((void *)&v105 + 1) + 8 * j), v19, v20, v21, v95);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v105, (uint64_t)v111, 16, v21);
      }
      while (v22);
    }
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v33 = v95;
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v101, (uint64_t)v110, 16, v35);
  if (v36)
  {
    uint64_t v42 = v36;
    uint64_t v43 = *(void *)v102;
    if (v6)
    {
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v102 != v43) {
            objc_enumerationMutation(v33);
          }
          uint64_t v45 = *(void **)(*((void *)&v101 + 1) + 8 * k);
          uint64_t v46 = objc_msgSend_strokeIdentifier(v45, v37, v38, v39, v40, v41, v95);
          char v51 = objc_msgSend_containsObject_(v6, v47, (uint64_t)v46, v48, v49, v50);

          if ((v51 & 1) == 0)
          {
            strokesByID = self->_strokesByID;
            v53 = objc_msgSend_strokeIdentifier(v45, v37, v38, v39, v40, v41);
            objc_msgSend_setObject_forKey_(strokesByID, v54, (uint64_t)v45, (uint64_t)v53, v55, v56);

            objc_msgSend_addObject_(v12, v57, (uint64_t)v45, v58, v59, v60);
          }
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v37, (uint64_t)&v101, (uint64_t)v110, 16, v41);
      }
      while (v42);
    }
    else
    {
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v102 != v43) {
            objc_enumerationMutation(v33);
          }
          v62 = *(void **)(*((void *)&v101 + 1) + 8 * m);
          id v63 = self->_strokesByID;
          uint64_t v64 = objc_msgSend_strokeIdentifier(v62, v37, v38, v39, v40, v41, v95);
          objc_msgSend_setObject_forKey_(v63, v65, (uint64_t)v62, (uint64_t)v64, v66, v67);

          objc_msgSend_addObject_(v12, v68, (uint64_t)v62, v69, v70, v71);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v37, (uint64_t)&v101, (uint64_t)v110, 16, v41);
      }
      while (v42);
    }
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v72 = v6;
  uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v97, (uint64_t)v109, 16, v74);
  if (v75)
  {
    uint64_t v80 = v75;
    uint64_t v81 = *(void *)v98;
    do
    {
      for (uint64_t n = 0; n != v80; ++n)
      {
        if (*(void *)v98 != v81) {
          objc_enumerationMutation(v72);
        }
        objc_msgSend_removeObjectForKey_(self->_strokesByID, v76, *(void *)(*((void *)&v97 + 1) + 8 * n), v77, v78, v79, v95);
      }
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v76, (uint64_t)&v97, (uint64_t)v109, 16, v79);
    }
    while (v80);
  }

  id v83 = objc_alloc(MEMORY[0x1E4F1C978]);
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = sub_1C49A53F8;
  v96[3] = &unk_1E64E1700;
  v96[4] = self;
  uint64_t v88 = objc_msgSend_sortedArrayUsingComparator_(v12, v84, (uint64_t)v96, v85, v86, v87);
  uint64_t v93 = (NSArray *)objc_msgSend_initWithArray_(v83, v89, (uint64_t)v88, v90, v91, v92);
  orderedStrokes = self->_orderedStrokes;
  self->_orderedStrokes = v93;

  ++self->_version;
}

- (void)setStrokeAttributes:(unint64_t)a3 atIndexes:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C49A54E0;
  v6[3] = &unk_1E64E1728;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend_enumerateIndexesUsingBlock_(a4, a2, (uint64_t)v6, (uint64_t)a4, v4, v5);
}

- (BOOL)hasValidMathAnnotation
{
  return (self->_strokeClassificationGTSource & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)loadStrokesFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  BOOL v11 = a5;
  id v50 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  uint64_t v25 = objc_msgSend_objectForKey_(v14, v17, @"unicodeCodePoints", v18, v19, v20);
  if (v25)
  {
    uint64_t v26 = objc_msgSend_objectForKey_(v14, v21, @"segmentationStrokes", v22, v23, v24);
    BOOL v27 = v26 != 0;
  }
  else
  {
    BOOL v27 = 0;
  }

  uint64_t v32 = objc_msgSend_objectForKey_(v14, v28, @"strokeClassification", v29, v30, v31);
  uint64_t v42 = objc_msgSend_objectForKey_(v14, v33, @"data", v34, v35, v36);
  if (v32
    && (uint64_t v43 = objc_msgSend_length(v32, v37, v38, v39, v40, v41), v43 == objc_msgSend_count(v42, v44, v45, v46, v47, v48)))
  {
    objc_msgSend_loadStrokesBasedOnStrokeClassicationType_section_withTime_atTimestamp_channels_orderedStrokes_(self, v37, (uint64_t)v50, (uint64_t)v14, v11, (uint64_t)v15, v16, a6);
    int64_t v49 = 2;
  }
  else if (v27)
  {
    objc_msgSend_loadStrokesBasedOnUnicodeFrom_section_withTime_atTimestamp_channels_orderedStrokes_(self, v37, (uint64_t)v50, (uint64_t)v14, v11, (uint64_t)v15, v16, a6);
    int64_t v49 = 2;
  }
  else
  {
    objc_msgSend_loadStrokesBasedOnSectionTypeFrom_section_withTime_atTimestamp_channels_orderedStrokes_(self, v37, (uint64_t)v50, (uint64_t)v14, v11, (uint64_t)v15, v16, a6);
    int64_t v49 = 3;
  }
  self->_strokeClassificationGTSource = v49;
}

- (void)loadStrokesBasedOnStrokeClassicationType:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  BOOL v74 = a5;
  id v75 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a8;
  uint64_t v20 = objc_msgSend_objectForKey_(v13, v16, @"strokeClassification", v17, v18, v19);
  uint64_t v25 = objc_msgSend_objectForKey_(v13, v21, @"data", v22, v23, v24);
  id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = objc_msgSend_length(v20, v27, v28, v29, v30, v31);
  uint64_t v37 = objc_msgSend_initWithCapacity_(v26, v33, v32, v34, v35, v36);
  if (objc_msgSend_length(v20, v38, v39, v40, v41, v42))
  {
    uint64_t v47 = 0;
    for (int i = objc_msgSend_characterAtIndex_(v20, v43, 0, v44, v45, v46);
          ;
          int i = objc_msgSend_characterAtIndex_(v20, v43, v47, v63, v64, v65))
    {
      if (i == 78)
      {
        objc_msgSend_numberWithInt_(NSNumber, v49, 0, v50, v51, v52);
      }
      else if (objc_msgSend_characterAtIndex_(v20, v49, v47, v50, v51, v52) == 77 {
             || objc_msgSend_characterAtIndex_(v20, v66, v47, v67, v68, v69) == 79)
      }
      {
        objc_msgSend_numberWithInt_(NSNumber, v66, 3, v67, v68, v69);
      }
      else if (objc_msgSend_characterAtIndex_(v20, v66, v47, v67, v68, v69) == 85 {
             || objc_msgSend_characterAtIndex_(v20, v70, v47, v71, v72, v73) == 81)
      }
      {
        objc_msgSend_numberWithInt_(NSNumber, v70, 4, v71, v72, v73);
      }
      else
      {
        objc_msgSend_numberWithInt_(NSNumber, v70, 1, v71, v72, v73);
      v53 = };
      objc_msgSend_addObject_(v37, v54, (uint64_t)v53, v55, v56, v57);

      if (++v47 >= (unint64_t)objc_msgSend_length(v20, v58, v59, v60, v61, v62)) {
        break;
      }
    }
  }
  objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(self, v43, (uint64_t)v75, (uint64_t)v25, (uint64_t)v37, v74, v14, v15, a6);
}

- (void)loadStrokesBasedOnUnicodeFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  BOOL v11 = a5;
  id v90 = a3;
  id v13 = a4;
  id v89 = a7;
  id v88 = a8;
  uint64_t v18 = objc_msgSend_objectForKey_(v13, v14, @"segmentationStrokes", v15, v16, v17);
  uint64_t v23 = objc_msgSend_objectForKey_(v13, v19, @"data", v20, v21, v22);
  uint64_t v29 = objc_msgSend_count(v23, v24, v25, v26, v27, v28);

  for (int i = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v30, v29, v31, v32, v33);
  {
    uint64_t v40 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v34, v35, v36, v37, v38);
    objc_msgSend_addObject_(i, v41, (uint64_t)v40, v42, v43, v44);
  }
  uint64_t v45 = objc_msgSend_objectForKey_(v13, v34, @"annotatedCutPoints", v36, v37, v38);
  uint64_t v50 = objc_msgSend_objectForKey_(v13, v46, @"segmentationCodePoints", v47, v48, v49);
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = sub_1C49A5BB4;
  v93[3] = &unk_1E64E1750;
  id v94 = v50;
  id v95 = v45;
  id v96 = i;
  id v51 = i;
  id v86 = v45;
  id v52 = v50;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v53, (uint64_t)v93, v54, v55, v56);
  uint64_t v57 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v63 = objc_msgSend_count(v51, v58, v59, v60, v61, v62);
  uint64_t v68 = objc_msgSend_arrayWithCapacity_(v57, v64, v63, v65, v66, v67);
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = sub_1C49A5E3C;
  v91[3] = &unk_1E64E1778;
  id v92 = v68;
  id v69 = v68;
  objc_msgSend_enumerateObjectsUsingBlock_(v51, v70, (uint64_t)v91, v71, v72, v73);
  uint64_t v78 = objc_msgSend_objectForKey_(v13, v74, @"data", v75, v76, v77);
  v84 = objc_msgSend_copy(v69, v79, v80, v81, v82, v83);
  objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(self, v85, (uint64_t)v90, (uint64_t)v78, (uint64_t)v84, v11, v89, v88, a6);
}

- (void)loadStrokesBasedOnSectionTypeFrom:(id)a3 section:(id)a4 withTime:(BOOL)a5 atTimestamp:(double)a6 channels:(id)a7 orderedStrokes:(id)a8
{
  BOOL v11 = a5;
  id v79 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  uint64_t v21 = objc_msgSend_objectForKey_(v14, v17, @"type", v18, v19, v20);

  if (!v21)
  {
    uint64_t v49 = 1;
    goto LABEL_20;
  }
  uint64_t v26 = objc_msgSend_objectForKey_(v14, v22, @"type", v23, v24, v25);
  uint64_t v31 = objc_msgSend_objectForKey_(v14, v27, @"collectionType", v28, v29, v30);
  if (objc_msgSend_isEqualToString_(v26, v32, @"text", v33, v34, v35)
    && (objc_msgSend_isEqualToString_(v31, v36, @"math", v37, v38, v39) & 1) != 0
    || objc_msgSend_isEqualToString_(v26, v36, @"math", v37, v38, v39))
  {
    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v14, v36, @"string", v37, v38, v39);
    if ((objc_msgSend_containsString_(v40, v41, @"hline", v42, v43, v44) & 1) != 0
      || objc_msgSend_containsString_(v40, v45, @"begin{array}{lr}", v46, v47, v48)
      && (objc_msgSend_containsString_(v40, v54, @"end{array}", v55, v56, v57) & 1) != 0)
    {
      uint64_t v49 = 4;
    }
    else
    {
      uint64_t v49 = 3;
    }
    goto LABEL_19;
  }
  if (objc_msgSend_isEqualToString_(v26, v36, @"text", v37, v38, v39))
  {
    uint64_t v49 = 1;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(v26, v50, @"underline", v51, v52, v53) & 1) == 0)
    {
      uint64_t v62 = objc_msgSend_objectForKey_(v14, v58, @"box", v59, v60, v61);
      if (v62)
      {
      }
      else
      {
        uint64_t v49 = objc_msgSend_objectForKey_(v14, v63, @"encircle", v64, v65, v66);

        if (!v49) {
          goto LABEL_19;
        }
      }
      uint64_t v49 = 7;
      goto LABEL_19;
    }
    uint64_t v49 = 6;
  }
LABEL_19:

LABEL_20:
  uint64_t v67 = objc_msgSend_objectForKey_(v14, v22, @"data", v23, v24, v25);
  uint64_t v73 = objc_msgSend_count(v67, v68, v69, v70, v71, v72);
  uint64_t v77 = objc_msgSend_getStrokeClassificationArray_ofType_(self, v74, v73, v49, v75, v76);
  objc_msgSend_loadStrokesFrom_withStrokes_types_withTime_atTimestamp_channels_orderedStrokes_(self, v78, (uint64_t)v79, (uint64_t)v67, (uint64_t)v77, v11, v15, v16, a6);
}

- (void)loadStrokesFrom:(id)a3 withStrokes:(id)a4 types:(id)a5 withTime:(BOOL)a6 atTimestamp:(double)a7 channels:(id)a8 orderedStrokes:(id)a9
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v24 = a9;
  if (v16 && objc_msgSend_count(v16, v19, v20, v21, v22, v23))
  {
    unint64_t v30 = 0;
    double v31 = a7 + 1.0;
    double v32 = 0.0;
    char v33 = 1;
    objc_msgSend_objectAtIndex_(v16, v25, 0, v26, v27, v28, 138412290, v29);
    while (1)
      uint64_t v43 = {;
      uint64_t v49 = objc_msgSend_count(v43, v44, v45, v46, v47, v48);

      if (v49)
      {
        if (v33) {
          double v54 = v31;
        }
        else {
          double v54 = v32;
        }
        if ((v33 & 1 & a6) == 1)
        {
          uint64_t v55 = objc_msgSend_objectAtIndex_(v16, v50, v30, v51, v52, v53);
          uint64_t v60 = objc_msgSend_objectAtIndex_(v55, v56, 0, v57, v58, v59);

          uint64_t v65 = objc_msgSend_valueForKey_(v18, v61, @"t", v62, v63, v64);
          unint64_t v71 = (int)objc_msgSend_intValue(v65, v66, v67, v68, v69, v70);

          if (objc_msgSend_count(v60, v72, v73, v74, v75, v76) > v71)
          {
            uint64_t v81 = objc_msgSend_objectAtIndex_(v60, v77, v71, v78, v79, v80);
            objc_msgSend_doubleValue(v81, v82, v83, v84, v85, v86);
            double v88 = v87;

            if (v88 == 0.0) {
              double v32 = v31;
            }
          }

          double v54 = v32;
        }
        id v89 = objc_msgSend_objectAtIndex_(v17, v50, v30, v51, v52, v53);
        uint64_t v95 = (int)objc_msgSend_intValue(v89, v90, v91, v92, v93, v94);

        id v96 = [CHClientStroke alloc];
        long long v101 = objc_msgSend_objectAtIndex_(v16, v97, v30, v98, v99, v100);
        long long v104 = objc_msgSend_initWithArray_channels_withTimeOffset_type_(v96, v102, (uint64_t)v101, (uint64_t)v18, v95, v103, v54);

        objc_msgSend_addObject_(v24, v105, (uint64_t)v104, v106, v107, v108);
        if (!objc_msgSend_pointsCount(v104, v109, v110, v111, v112, v113))
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v126 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
          {
            uint64_t v132 = objc_msgSend_path(v15, v127, v128, v129, v130, v131);
            *(_DWORD *)buf = v133;
            uint64_t v136 = v132;
            _os_log_impl(&dword_1C492D000, v126, OS_LOG_TYPE_ERROR, "Unexpected empty stroke in document %@", buf, 0xCu);
          }
LABEL_5:
          char v33 = 0;
          goto LABEL_6;
        }
        if (a6) {
          goto LABEL_5;
        }
        objc_msgSend_endTimestamp(v104, v114, v115, v116, v117, v118);
        char v33 = 0;
        double v54 = v119 + 0.1;
      }
      else
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        long long v104 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          uint64_t v125 = objc_msgSend_path(v15, v120, v121, v122, v123, v124);
          *(_DWORD *)buf = v133;
          uint64_t v136 = v125;
          _os_log_impl(&dword_1C492D000, v104, OS_LOG_TYPE_ERROR, "Unexpected empty stroke in document %@", buf, 0xCu);
        }
        double v54 = v32;
      }
LABEL_6:

      ++v30;
      double v32 = v54;
      if (v30 >= objc_msgSend_count(v16, v34, v35, v36, v37, v38)) {
        break;
      }
      objc_msgSend_objectAtIndex_(v16, v39, v30, v40, v41, v42, v133, v134);
    }
  }
}

- (CGRect)boundingBox
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = self->_orderedStrokes;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16, v8);
  if (v9)
  {
    uint64_t v15 = v9;
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_boundingBox(*(void **)(*((void *)&v26 + 1) + 8 * v17), v10, v11, v12, v13, v14, (void)v26);
        v35.origin.CGFloat x = v18;
        v35.origin.CGFloat y = v19;
        v35.size.CGFloat width = v20;
        v35.size.CGFloat height = v21;
        v32.origin.CGFloat x = x;
        v32.origin.CGFloat y = y;
        v32.size.CGFloat width = width;
        v32.size.CGFloat height = height;
        CGRect v33 = CGRectUnion(v32, v35);
        CGFloat x = v33.origin.x;
        CGFloat y = v33.origin.y;
        CGFloat width = v33.size.width;
        CGFloat height = v33.size.height;
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v26, (uint64_t)v30, 16, v14);
    }
    while (v15);
  }

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CHStrokeProviderVersion)strokeProviderVersion
{
  return (CHStrokeProviderVersion *)objc_msgSend_numberWithInteger_(NSNumber, a2, self->_version, v2, v3, v4);
}

- (id)drawing
{
  uint64_t v7 = objc_msgSend_allKeys(self->_strokesByID, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_drawingWithStrokes_(self, v8, (uint64_t)v7, v9, v10, v11);

  return v12;
}

- (id)drawingWithStrokes:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CHDrawing);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v31, (uint64_t)v35, 16, v7);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(self->_strokesByID, v9, *(void *)(*((void *)&v31 + 1) + 8 * i), v10, v11, v12);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = sub_1C49A686C;
        v29[3] = &unk_1E64E17A0;
        uint64_t v17 = v5;
        unint64_t v30 = v17;
        objc_msgSend_enumeratePointsWithTimestep_usingBlock_(v16, v18, (uint64_t)v29, v19, v20, v21, 0.00833333333);
        objc_msgSend_endStroke(v17, v22, v23, v24, v25, v26);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, (uint64_t)v35, 16, v12);
    }
    while (v13);
  }

  return v5;
}

- (id)drawingWithGroups:(id)a3 transforms:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(CHDrawing);
  uint64_t v14 = objc_msgSend_allKeys(self->_strokesByID, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_mutableCopy(v14, v15, v16, v17, v18, v19);

  if (objc_msgSend_count(v6, v21, v22, v23, v24, v25))
  {
    uint64_t v30 = 0;
    objc_msgSend_objectAtIndexedSubscript_(v6, v26, 0, v27, v28, v29);
    while (1)
      uint64_t v55 = {;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v67, (uint64_t)v71, 16, v57);
      if (v58)
      {
        uint64_t v63 = v58;
        uint64_t v64 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v63; ++i)
          {
            if (*(void *)v68 != v64) {
              objc_enumerationMutation(v55);
            }
            objc_msgSend_removeObject_(v20, v59, *(void *)(*((void *)&v67 + 1) + 8 * i), v60, v61, v62);
          }
          uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v59, (uint64_t)&v67, (uint64_t)v71, 16, v62);
        }
        while (v63);
      }
      long long v31 = objc_msgSend_drawingWithStrokes_(self, v59, (uint64_t)v55, v60, v61, v62);
      uint64_t v36 = objc_msgSend_objectAtIndexedSubscript_(v7, v32, v30, v33, v34, v35);
      uint64_t v41 = objc_msgSend_newDrawingWithTransform_(v31, v37, (uint64_t)v36, v38, v39, v40);

      objc_msgSend_appendDrawing_(v8, v42, (uint64_t)v41, v43, v44, v45);
      if (++v30 >= (unint64_t)objc_msgSend_count(v6, v46, v47, v48, v49, v50)) {
        break;
      }
      objc_msgSend_objectAtIndexedSubscript_(v6, v51, v30, v52, v53, v54);
    }
  }

  return v8;
}

- (void)updateWithGroups:(id)a3 transforms:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v94 = a4;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10, v11);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v93 = self;
  uint64_t v18 = objc_msgSend_orderedStrokes(self, v13, v14, v15, v16, v17);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v95, (uint64_t)v99, 16, v20);
  if (v21)
  {
    uint64_t v27 = v21;
    uint64_t v28 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        while (1)
        {
          if (*(void *)v96 != v28) {
            objc_enumerationMutation(v18);
          }
          uint64_t v35 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          uint64_t v36 = objc_msgSend_strokeIdentifier(v35, v22, v23, v24, v25, v26);
          if (objc_msgSend_count(v6, v37, v38, v39, v40, v41)) {
            break;
          }
LABEL_5:
          uint64_t v30 = objc_msgSend_newStrokeWithoutTransformation(v35, v42, v43, v44, v45, v46);
          objc_msgSend_addObject_(v12, v31, (uint64_t)v30, v32, v33, v34);

          if (++i == v27) {
            goto LABEL_3;
          }
        }
        uint64_t v47 = 0;
        while (1)
        {
          uint64_t v48 = objc_msgSend_objectAtIndexedSubscript_(v6, v42, v47, v44, v45, v46);
          if (objc_msgSend_containsObject_(v48, v49, (uint64_t)v36, v50, v51, v52)) {
            break;
          }

          if (++v47 >= (unint64_t)objc_msgSend_count(v6, v57, v58, v59, v60, v61)) {
            goto LABEL_5;
          }
        }
        uint64_t v62 = objc_msgSend_objectAtIndexedSubscript_(v94, v53, v47, v54, v55, v56);
        long long v67 = objc_msgSend_newStrokeWithTransformation_(v35, v63, (uint64_t)v62, v64, v65, v66);
        objc_msgSend_addObject_(v12, v68, (uint64_t)v67, v69, v70, v71);
      }
LABEL_3:
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v95, (uint64_t)v99, 16, v26);
    }
    while (v27);
  }

  uint64_t v72 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v78 = objc_msgSend_strokesByID(v93, v73, v74, v75, v76, v77);
  uint64_t v84 = objc_msgSend_allKeys(v78, v79, v80, v81, v82, v83);
  id v89 = objc_msgSend_setWithArray_(v72, v85, (uint64_t)v84, v86, v87, v88);
  objc_msgSend_updateWithAddedStrokes_removedStrokeIds_(v93, v90, (uint64_t)v12, (uint64_t)v89, v91, v92);
}

- (NSArray)orderedStrokes
{
  return self->_orderedStrokes;
}

- (id)strokeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_strokesByID(self, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v4, v12, v13, v14);

  return v15;
}

- (int64_t)compareOrderOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v11 = objc_msgSend_integerValue(a3, v6, v7, v8, v9, v10);
  uint64_t v17 = objc_msgSend_integerValue(v5, v12, v13, v14, v15, v16);

  if (v11 >= v17) {
    int64_t v18 = 0;
  }
  else {
    int64_t v18 = -1;
  }
  if (v11 > v17) {
    return 1;
  }
  else {
    return v18;
  }
}

- (unint64_t)compareStyleOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  return 0;
}

- (id)strokeIdentifierFromData:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v10 = objc_msgSend_objectForKey_(v5->__strokeIdsByEncoding, v6, (uint64_t)v4, v7, v8, v9);

  if (v10)
  {
    uint64_t v15 = objc_msgSend_objectForKey_(v5->__strokeIdsByEncoding, v11, (uint64_t)v4, v12, v13, v14);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v17 = objc_opt_class();
    uint64_t v23 = objc_msgSend_encodedStrokeIdentifier(v4, v18, v19, v20, v21, v22);
    id v31 = 0;
    uint64_t v15 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v16, v24, v17, (uint64_t)v23, (uint64_t)&v31, v25);
    id v26 = v31;

    objc_msgSend_setObject_forKey_(v5->__strokeIdsByEncoding, v27, (uint64_t)v15, (uint64_t)v4, v28, v29);
  }
  objc_sync_exit(v5);

  return v15;
}

- (id)encodedStrokeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_objectForKey_(self->_strokesByID, v5, (uint64_t)v4, v6, v7, v8);

  if (v9)
  {
    uint64_t v14 = objc_msgSend_objectForKey_(self->_strokesByID, v10, (uint64_t)v4, v11, v12, v13);
    uint64_t v20 = objc_msgSend_encodedStrokeIdentifier(v14, v15, v16, v17, v18, v19);
  }
  else
  {
    uint64_t v21 = [CHEncodedStrokeIdentifier alloc];
    uint64_t v39 = 0;
    uint64_t v14 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v22, (uint64_t)v4, 1, (uint64_t)&v39, v23);
    uint64_t v20 = objc_msgSend_initWithData_(v21, v24, (uint64_t)v14, v25, v26, v27);
  }
  uint64_t v28 = (void *)v20;

  uint64_t v29 = self;
  objc_sync_enter(v29);
  uint64_t v34 = objc_msgSend_objectForKey_(v29->__strokeIdsByEncoding, v30, (uint64_t)v28, v31, v32, v33);

  if (!v34) {
    objc_msgSend_setObject_forKey_(v29->__strokeIdsByEncoding, v35, (uint64_t)v4, (uint64_t)v28, v36, v37);
  }
  objc_sync_exit(v29);

  return v28;
}

- (NSOrderedSet)visibleStrokeEncodedIdentifiers
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v7 = objc_msgSend_allKeys(self->__strokeIdsByEncoding, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_orderedSetWithArray_(v6, v8, (uint64_t)v7, v9, v10, v11);

  return (NSOrderedSet *)v12;
}

- (int64_t)groupingPriority
{
  return self->groupingPriority;
}

- (NSMutableDictionary)strokesByID
{
  return self->_strokesByID;
}

- (NSArray)sectionedStrokes
{
  return self->_sectionedStrokes;
}

- (void)setHasValidMathAnnotation:(BOOL)a3
{
  self->_hasValidMathAnnotatiouint64_t n = a3;
}

- (NSMutableDictionary)transcriptionCache
{
  return self->_transcriptionCache;
}

- (NSMutableDictionary)_strokeIdsByEncoding
{
  return self->__strokeIdsByEncoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__strokeIdsByEncoding, 0);
  objc_storeStrong((id *)&self->_transcriptionCache, 0);
  objc_storeStrong((id *)&self->_sectionedStrokes, 0);
  objc_storeStrong((id *)&self->_strokesByID, 0);
  objc_storeStrong((id *)&self->_orderedStrokes, 0);
}

@end