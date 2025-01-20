@interface CHVisualizationManager
+ (BOOL)variableHeightForRecognitionSessionStatusKey:(id)a3;
+ (CGColor)newColorForVisualizedItemAtIndex:(int64_t)a3;
+ (id)availableRecognitionSessionStatusKeys;
+ (id)availableVisualizationIdentifiers;
+ (id)localizedNameForRecognitionSessionStatusKey:(id)a3;
+ (id)localizedNameForVisualizationIdentifier:(id)a3;
- (BOOL)isEnabledVisualizationForIdentifier:(id)a3;
- (BOOL)statusReportingEnabled;
- (CHRecognitionSession)recognitionSession;
- (CHVisualizationManager)init;
- (CHVisualizationManager)initWithRecognitionSession:(id)a3;
- (CHVisualizationManagerDelegate)delegate;
- (NSArray)renderedResults;
- (id)valueForRecognitionStatusKey:(id)a3;
- (int64_t)visualizationIndexForStrokeGroup:(id)a3;
- (void)dealloc;
- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5;
- (void)recognitionSessionDidChangeStatus:(id)a3;
- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3 forVisualizationIdentifier:(id)a4;
- (void)setStatusReportingEnabled:(BOOL)a3;
- (void)toggleSelectiveVisualizationsAtPoint:(CGPoint)a3;
- (void)visualization:(id)a3 needsDisplayInRect:(CGRect)a4;
- (void)visualizationNeedsDisplay:(id)a3;
@end

@implementation CHVisualizationManager

+ (id)availableVisualizationIdentifiers
{
  if (qword_1EA3C93E0 == -1)
  {
    v2 = (void *)qword_1EA3C93D8;
  }
  else
  {
    dispatch_once(&qword_1EA3C93E0, &unk_1F2012F50);
    v2 = (void *)qword_1EA3C93D8;
  }
  return v2;
}

+ (id)localizedNameForVisualizationIdentifier:(id)a3
{
  id v7 = a3;
  if (qword_1EA3C93F0 != -1) {
    dispatch_once(&qword_1EA3C93F0, &unk_1F2013410);
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C93E8, v3, (uint64_t)v7, v4, v5, v6);
  v9 = (void *)v8;
  v10 = &stru_1F20141C8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  return v11;
}

+ (id)availableRecognitionSessionStatusKeys
{
  v6[10] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CHStatusKeyStatus";
  v6[1] = @"CHStatusKeyEnvironment";
  v6[2] = @"CHStatusKeyLocales";
  v6[3] = @"CHStatusKeyLastDurationTotal";
  v6[4] = @"CHStatusKeyLastDurationDetailed";
  v6[5] = @"CHStatusStrokeCount";
  v6[6] = @"CHStatusKeyGroupCount";
  v6[7] = @"CHStatusKeyTranscript";
  v6[8] = @"CHStatusKeyAllResults";
  v6[9] = @"CHStatusKeyAllMathResults";
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v6, 10, v2, v3);
  return v4;
}

+ (id)localizedNameForRecognitionSessionStatusKey:(id)a3
{
  id v7 = a3;
  if (qword_1EA3C9410 != -1) {
    dispatch_once(&qword_1EA3C9410, &unk_1F2011150);
  }
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C9408, v3, (uint64_t)v7, v4, v5, v6);
  v9 = (void *)v8;
  v10 = &stru_1F20141C8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  return v11;
}

+ (BOOL)variableHeightForRecognitionSessionStatusKey:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], v4, @"CHStatusKeyTranscript", v5, v6, v7, @"CHStatusKeyAllResults", @"CHStatusKeyAllMathResults", 0);
  char v13 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v3, v10, v11, v12);

  return v13;
}

+ (CGColor)newColorForVisualizedItemAtIndex:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v3 = a3 % 10;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v5 = DeviceRGB;
  switch(v3)
  {
    case 0:
      uint64_t v6 = &xmmword_1C4C442D8;
      break;
    case 1:
      uint64_t v6 = &xmmword_1C4C442F8;
      break;
    case 2:
      uint64_t v6 = &xmmword_1C4C44318;
      break;
    case 3:
      uint64_t v6 = &xmmword_1C4C44338;
      break;
    case 4:
      uint64_t v6 = &xmmword_1C4C44358;
      break;
    case 5:
      uint64_t v6 = &xmmword_1C4C44378;
      break;
    case 6:
      uint64_t v6 = &xmmword_1C4C44398;
      break;
    case 7:
      uint64_t v6 = &xmmword_1C4C443B8;
      break;
    case 8:
      uint64_t v6 = &xmmword_1C4C443D8;
      break;
    default:
      uint64_t v6 = &xmmword_1C4C443F8;
      break;
  }
  long long v7 = v6[1];
  v10[0] = *v6;
  v10[1] = v7;
  uint64_t v8 = CGColorCreate(DeviceRGB, (const CGFloat *)v10);
  CGColorSpaceRelease(v5);
  return v8;
}

- (CHVisualizationManager)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  int64_t v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use initWithRecognitionSession: instead.", v5, 2u);
  }

  return 0;
}

- (CHVisualizationManager)initWithRecognitionSession:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHVisualizationManager;
  uint64_t v6 = [(CHVisualizationManager *)&v19 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recognitionSession, a3);
    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    enabledVisualizationIDs = v7->__enabledVisualizationIDs;
    v7->__enabledVisualizationIDs = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeVisualizationIDs = v7->__activeVisualizationIDs;
    v7->__activeVisualizationIDs = v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeVisualizationsByID = v7->__activeVisualizationsByID;
    v7->__activeVisualizationsByID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    strokeGroupIndexByAncestorID = v7->__strokeGroupIndexByAncestorID;
    v7->__strokeGroupIndexByAncestorID = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    renderedResults = v7->__renderedResults;
    v7->__renderedResults = v16;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self && self->__registeredAsChangeObserver) {
    objc_msgSend_unregisterChangeObserver_(self->_recognitionSession, a2, (uint64_t)self, v3, v4, v5);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v7 = objc_msgSend_allValues(self->__activeVisualizationsByID, a2, v2, v3, v4, v5);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v22, (uint64_t)v26, 16, v9);
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v7);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend_delegate(v18, v10, v11, v12, v13, v14);
        objc_super v19 = (CHVisualizationManager *)objc_claimAutoreleasedReturnValue();
        BOOL v20 = v19 == self;

        if (v20) {
          objc_msgSend_setDelegate_(v18, v10, 0, v12, v13, v14);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v22, (uint64_t)v26, 16, v14);
    }
    while (v15);
  }

  v21.receiver = self;
  v21.super_class = (Class)CHVisualizationManager;
  [(CHVisualizationManager *)&v21 dealloc];
}

- (void)setEnabled:(BOOL)a3 forVisualizationIdentifier:(id)a4
{
  int v4 = a3;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v106 = a4;
  if (objc_msgSend_isEnabledVisualizationForIdentifier_(self, v6, (uint64_t)v106, v7, v8, v9) == v4) {
    goto LABEL_38;
  }
  if (v4)
  {
    if (self) {
      objc_msgSend_addObject_(self->__enabledVisualizationIDs, v10, (uint64_t)v106, v11, v12, v13);
    }
    else {
      objc_msgSend_addObject_(0, v10, (uint64_t)v106, v11, v12, v13);
    }
  }
  else if (self)
  {
    objc_msgSend_removeObject_(self->__enabledVisualizationIDs, v10, (uint64_t)v106, v11, v12, v13);
  }
  else
  {
    objc_msgSend_removeObject_(0, v10, (uint64_t)v106, v11, v12, v13);
  }
  if (!self) {
    goto LABEL_38;
  }
  uint64_t v14 = objc_opt_class();
  objc_msgSend_availableVisualizationIdentifiers(v14, v15, v16, v17, v18, v19);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v107, (uint64_t)v113, 16, v22);
  v28 = v20;
  if (!v27) {
    goto LABEL_36;
  }
  char v29 = 0;
  uint64_t v30 = *(void *)v108;
  do
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      if (*(void *)v108 != v30) {
        objc_enumerationMutation(v20);
      }
      v32 = *(void **)(*((void *)&v107 + 1) + 8 * i);
      int isEnabledVisualizationForIdentifier = objc_msgSend_isEnabledVisualizationForIdentifier_(self, v23, (uint64_t)v32, v24, v25, v26);
      id v34 = v32;
      int v39 = objc_msgSend_containsObject_(self->__activeVisualizationIDs, v35, (uint64_t)v34, v36, v37, v38);

      if (((isEnabledVisualizationForIdentifier ^ 1 | v39) & 1) == 0)
      {
        id v57 = v34;
        if (objc_msgSend_containsObject_(self->__activeVisualizationIDs, v58, (uint64_t)v57, v59, v60, v61))
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v62 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C492D000, v62, OS_LOG_TYPE_FAULT, "Cannot activate an already active visualization", buf, 2u);
          }
        }
        id v63 = v57;
        self;
        if (qword_1EA3C9400 != -1) {
          dispatch_once(&qword_1EA3C9400, &unk_1F2011130);
        }
        v68 = (objc_class *)(id)objc_msgSend_objectForKeyedSubscript_((void *)qword_1EA3C93F8, v64, (uint64_t)v63, v65, v66, v67);

        if (v68)
        {
          id v73 = [v68 alloc];
          v79 = objc_msgSend_recognitionSession(self, v74, v75, v76, v77, v78);
          v84 = objc_msgSend_initWithRecognitionSession_(v73, v80, (uint64_t)v79, v81, v82, v83);

          objc_msgSend_setObject_forKey_(self->__activeVisualizationsByID, v85, (uint64_t)v84, (uint64_t)v63, v86, v87);
          objc_msgSend_setDelegate_(v84, v88, (uint64_t)self, v89, v90, v91);
        }
        objc_msgSend_addObject_(self->__activeVisualizationIDs, v69, (uint64_t)v63, v70, v71, v72);
        v92 = self->__activeVisualizationIDs;
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = sub_1C4B400AC;
        v111[3] = &unk_1E64E4158;
        v111[4] = self;
        objc_msgSend_sortUsingComparator_(v92, v93, (uint64_t)v111, v94, v95, v96);

        goto LABEL_11;
      }
      if (((isEnabledVisualizationForIdentifier | v39 ^ 1) & 1) == 0)
      {
        id v40 = v34;
        v50 = objc_msgSend_objectForKeyedSubscript_(self->__activeVisualizationsByID, v41, (uint64_t)v40, v42, v43, v44);
        if (v50) {
          objc_msgSend_removeObjectForKey_(self->__activeVisualizationsByID, v45, (uint64_t)v40, v47, v48, v49);
        }
        objc_msgSend_delegate(v50, v45, v46, v47, v48, v49);
        v51 = (CHVisualizationManager *)objc_claimAutoreleasedReturnValue();
        BOOL v52 = v51 == self;

        if (v52) {
          objc_msgSend_setDelegate_(v50, v53, 0, v54, v55, v56);
        }
        objc_msgSend_removeObject_(self->__activeVisualizationIDs, v53, (uint64_t)v40, v54, v55, v56);

LABEL_11:
        char v29 = 1;
        continue;
      }
    }
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v107, (uint64_t)v113, 16, v26);
  }
  while (v27);

  if (v29)
  {
    v28 = objc_msgSend_delegate(self, v97, v98, v99, v100, v101);
    objc_msgSend_visualizationManagerNeedsDisplay_(v28, v102, (uint64_t)self, v103, v104, v105);
LABEL_36:
  }
  sub_1C4B3F06C((uint64_t)self);

LABEL_38:
}

- (BOOL)isEnabledVisualizationForIdentifier:(id)a3
{
  id v8 = a3;
  if (self) {
    char v9 = objc_msgSend_containsObject_(self->__enabledVisualizationIDs, v4, (uint64_t)v8, v5, v6, v7);
  }
  else {
    char v9 = objc_msgSend_containsObject_(0, v4, (uint64_t)v8, v5, v6, v7);
  }
  BOOL v10 = v9;

  return v10;
}

- (void)setStatusReportingEnabled:(BOOL)a3
{
  if (self->_statusReportingEnabled != a3)
  {
    self->_statusReportingEnabled = a3;
    sub_1C4B3F06C((uint64_t)self);
  }
}

- (NSArray)renderedResults
{
  return (NSArray *)objc_msgSend_allObjects(self->__renderedResults, a2, v2, v3, v4, v5);
}

- (id)valueForRecognitionStatusKey:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_statusReportingEnabled(self, v5, v6, v7, v8, v9))
  {
    v33 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v10, v11, v12, v13, v14);
    v32 = objc_msgSend_localizedStringForKey_value_table_(v33, v34, @"<Status Reporting Disabled>", (uint64_t)&stru_1F20141C8, 0, v35);
LABEL_27:

    goto LABEL_28;
  }
  if (objc_msgSend_isEqualToString_(v4, v10, @"CHStatusKeyStatus", v12, v13, v14))
  {
    id v20 = objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
    uint64_t v26 = objc_msgSend_status(v20, v21, v22, v23, v24, v25);
    v32 = CHLocalizedDescriptionForRecognitionSessionStatus(v26, v27, v28, v29, v30, v31);
  }
  else
  {
    v32 = 0;
  }
  if (objc_msgSend_isEqualToString_(v4, v15, @"CHStatusKeyEnvironment", v17, v18, v19))
  {
    v41 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v36, v37, v38, v39, v40);
    v33 = objc_msgSend_localizedStringForKey_value_table_(v41, v42, @"In process", (uint64_t)&stru_1F20141C8, 0, v43);

    uint64_t v49 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v44, v45, v46, v47, v48);
    BOOL v52 = objc_msgSend_localizedStringForKey_value_table_(v49, v50, @"Out of process", (uint64_t)&stru_1F20141C8, 0, v51);

    v58 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v53, v54, v55, v56, v57);
    uint64_t v61 = objc_msgSend_localizedStringForKey_value_table_(v58, v59, @"Automatic", (uint64_t)&stru_1F20141C8, 0, v60);

    uint64_t v67 = objc_msgSend_recognitionSession(self, v62, v63, v64, v65, v66);
    id v73 = objc_msgSend_lastRecognitionResult(v67, v68, v69, v70, v71, v72);
    uint64_t v79 = objc_msgSend_recognitionEnvironment(v73, v74, v75, v76, v77, v78);

    v85 = objc_msgSend_recognitionSession(self, v80, v81, v82, v83, v84);
    uint64_t v91 = objc_msgSend_recognitionEnvironment(v85, v86, v87, v88, v89, v90);

    uint64_t v96 = v33;
    if (v91)
    {
      if (v91 == 1)
      {
LABEL_11:
        id v97 = v96;
LABEL_25:
        id v156 = v97;

        v32 = v156;
        goto LABEL_26;
      }
      if (v91 == 2)
      {
        uint64_t v96 = v52;
        goto LABEL_11;
      }
LABEL_26:

      goto LABEL_27;
    }
    if (v79 != 1)
    {
      if (v79 != 2) {
        goto LABEL_26;
      }
      uint64_t v96 = v52;
    }
    objc_msgSend_stringWithFormat_(NSString, v92, @"%@ (%@)", v93, v94, v95, v61, v96);
    id v97 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (objc_msgSend_isEqualToString_(v4, v36, @"CHStatusKeyLocales", v38, v39, v40))
  {
    uint64_t v103 = objc_msgSend_recognitionSession(self, v98, v99, v100, v101, v102);
    long long v109 = objc_msgSend_lastRecognitionResult(v103, v104, v105, v106, v107, v108);
    v115 = objc_msgSend_preferredLocales(v109, v110, v111, v112, v113, v114);

    if (v115)
    {
      objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v115, v116, @", ", (uint64_t)&unk_1F2011190, v117, v118);
      v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v119 = &stru_1F20141C8;
    }

    v32 = v119;
    goto LABEL_28;
  }
  if (objc_msgSend_isEqualToString_(v4, v98, @"CHStatusKeyLastDurationTotal", v100, v101, v102))
  {
    long long v291 = 0u;
    long long v292 = 0u;
    long long v290 = 0u;
    v125 = objc_msgSend_recognitionSession(self, v120, v121, v122, v123, v124);
    v131 = objc_msgSend_lastRecognitionResult(v125, v126, v127, v128, v129, v130);
    v137 = v131;
    if (v131)
    {
      objc_msgSend_generationDuration(v131, v132, v133, v134, v135, v136);
    }
    else
    {
      long long v291 = 0u;
      long long v292 = 0u;
      long long v290 = 0u;
    }

    uint64_t v191 = objc_msgSend_stringWithFormat_(NSString, v187, @"%0.2fs", v188, v189, v190, *((void *)&v292 + 1));
LABEL_42:
    v242 = (void *)v191;

    v32 = v242;
    goto LABEL_28;
  }
  if (objc_msgSend_isEqualToString_(v4, v120, @"CHStatusKeyLastDurationDetailed", v122, v123, v124))
  {
    long long v291 = 0u;
    long long v292 = 0u;
    long long v290 = 0u;
    v143 = objc_msgSend_recognitionSession(self, v138, v139, v140, v141, v142);
    v149 = objc_msgSend_lastRecognitionResult(v143, v144, v145, v146, v147, v148);
    v155 = v149;
    if (v149)
    {
      objc_msgSend_generationDuration(v149, v150, v151, v152, v153, v154);
    }
    else
    {
      long long v291 = 0u;
      long long v292 = 0u;
      long long v290 = 0u;
    }

    uint64_t v191 = objc_msgSend_stringWithFormat_(NSString, v238, @"%0.2fs Clutter Filtering, %0.2fs Stroke class., %0.2fs Grouping, %0.2fs Recog., %0.2fs Princ. Lines", v239, v240, v241, v290, v291, (void)v292);
    goto LABEL_42;
  }
  if (objc_msgSend_isEqualToString_(v4, v138, @"CHStatusStrokeCount", v140, v141, v142))
  {
    v163 = objc_msgSend_recognitionSession(self, v158, v159, v160, v161, v162);
    v169 = objc_msgSend_latestStrokeProvider(v163, v164, v165, v166, v167, v168);

    v175 = objc_msgSend_orderedStrokes(v169, v170, v171, v172, v173, v174);
    uint64_t v181 = objc_msgSend_count(v175, v176, v177, v178, v179, v180);

    uint64_t v186 = objc_msgSend_stringWithFormat_(NSString, v182, @"%ld", v183, v184, v185, v181);
LABEL_39:
    v237 = (void *)v186;

    goto LABEL_50;
  }
  if (objc_msgSend_isEqualToString_(v4, v158, @"CHStatusKeyGroupCount", v160, v161, v162))
  {
    v197 = objc_msgSend_recognitionSession(self, v192, v193, v194, v195, v196);
    v203 = objc_msgSend_lastRecognitionResult(v197, v198, v199, v200, v201, v202);
    v169 = objc_msgSend_strokeGroupingResult(v203, v204, v205, v206, v207, v208);

    v214 = objc_msgSend_strokeGroups(v169, v209, v210, v211, v212, v213);
    uint64_t v220 = objc_msgSend_count(v214, v215, v216, v217, v218, v219);

    v226 = objc_msgSend_textStrokeGroups(v169, v221, v222, v223, v224, v225);
    uint64_t v232 = objc_msgSend_count(v226, v227, v228, v229, v230, v231);

    uint64_t v186 = objc_msgSend_stringWithFormat_(NSString, v233, @"%ld text, %ld non-text", v234, v235, v236, v232, v220 - v232);
    goto LABEL_39;
  }
  if (objc_msgSend_isEqualToString_(v4, v192, @"CHStatusKeyTranscript", v194, v195, v196))
  {
    v169 = objc_msgSend_recognitionSession(self, v243, v244, v245, v246, v247);
    v253 = objc_msgSend_lastRecognitionResult(v169, v248, v249, v250, v251, v252);
    uint64_t v259 = objc_msgSend_highConfidenceDebugDescription(v253, v254, v255, v256, v257, v258);
  }
  else if (objc_msgSend_isEqualToString_(v4, v243, @"CHStatusKeyAllResults", v245, v246, v247))
  {
    v169 = objc_msgSend_recognitionSession(self, v260, v261, v262, v263, v264);
    v253 = objc_msgSend_lastRecognitionResult(v169, v265, v266, v267, v268, v269);
    v289[0] = MEMORY[0x1E4F143A8];
    v289[1] = 3221225472;
    v289[2] = sub_1C4B3FD14;
    v289[3] = &unk_1E64E4108;
    v289[4] = self;
    uint64_t v259 = objc_msgSend_allResultsDebugDescriptionWithGroupHeaderBlock_(v253, v270, (uint64_t)v289, v271, v272, v273);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v4, v260, @"CHStatusKeyAllMathResults", v262, v263, v264))goto LABEL_28; {
    v169 = objc_msgSend_recognitionSession(self, v274, v275, v276, v277, v278);
    }
    v253 = objc_msgSend_lastRecognitionResult(v169, v279, v280, v281, v282, v283);
    v288[0] = MEMORY[0x1E4F143A8];
    v288[1] = 3221225472;
    v288[2] = sub_1C4B3FDC4;
    v288[3] = &unk_1E64E4130;
    v288[4] = self;
    uint64_t v259 = objc_msgSend_allMathResultsDebugDescriptionWithGroupHeaderBlock_(v253, v284, (uint64_t)v288, v285, v286, v287);
  }
  v237 = (void *)v259;

LABEL_50:
  v32 = v237;
LABEL_28:

  return v32;
}

- (void)drawVisualizationInRect:(CGRect)a3 context:(CGContext *)a4 viewBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  objc_msgSend_removeAllObjects(self->__renderedResults, a2, (uint64_t)a4, v5, v6, v7);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v18 = self->__activeVisualizationIDs;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v48, (uint64_t)v52, 16, v20);
  if (v21)
  {
    uint64_t v22 = *(void *)v49;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v48 + 1) + 8 * v23);
        uint64_t v25 = self->__activeVisualizationsByID;
        uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v25, v26, v24, v27, v28, v29, (void)v48);

        if (v30)
        {
          CGContextSaveGState(a4);
          objc_msgSend_drawVisualizationInRect_context_viewBounds_(v30, v31, (uint64_t)a4, v32, v33, v34, v16, v15, v14, v13, x, y, width, height);
          CGContextRestoreGState(a4);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            renderedResults = self->__renderedResults;
            v41 = objc_msgSend_renderedResults(v30, v35, v36, v37, v38, v39);
            objc_msgSend_addObjectsFromArray_(renderedResults, v42, (uint64_t)v41, v43, v44, v45);
          }
        }

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v46, (uint64_t)&v48, (uint64_t)v52, 16, v47);
    }
    while (v21);
  }
}

- (void)toggleSelectiveVisualizationsAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  if (self) {
    self = (CHVisualizationManager *)self->__activeVisualizationsByID;
  }
  uint64_t v9 = objc_msgSend_allValues(self, a2, v3, v4, v5, v6, (void)v20);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v24, 16, v11);
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_toggleVisualizationRegionAtPoint_(*(void **)(*((void *)&v20 + 1) + 8 * i), v12, v13, v14, v15, v16, x, y);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v20, (uint64_t)v24, 16, v16);
    }
    while (v17);
  }
}

- (void)visualizationNeedsDisplay:(id)a3
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3, v3, v4, v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visualizationManagerNeedsDisplay_(v11, v7, (uint64_t)self, v8, v9, v10);
}

- (void)visualization:(id)a3 needsDisplayInRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend_delegate(self, a2, (uint64_t)a3, v4, v5, v6);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_visualizationManager_needsDisplayInRect_(v16, v12, (uint64_t)self, v13, v14, v15, x, y, width, height);
}

- (int64_t)visualizationIndexForStrokeGroup:(id)a3
{
  v167[1] = *MEMORY[0x1E4F143B8];
  id v156 = a3;
  if (self) {
    strokeGroupIndexByAncestorID = self->__strokeGroupIndexByAncestorID;
  }
  else {
    strokeGroupIndexByAncestorID = 0;
  }
  uint64_t v5 = strokeGroupIndexByAncestorID;
  uint64_t v6 = NSNumber;
  uint64_t v12 = objc_msgSend_ancestorIdentifier(v156, v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_numberWithInteger_(v6, v13, v12, v14, v15, v16);
  long long v22 = objc_msgSend_objectForKeyedSubscript_(v5, v18, (uint64_t)v17, v19, v20, v21);

  if (v22)
  {
    uint64_t v28 = objc_msgSend_integerValue(v22, v23, v24, v25, v26, v27);
  }
  else
  {
    if (self)
    {
      uint64_t v29 = objc_msgSend_recognitionSession(self, v23, v24, v25, v26, v27);
      uint64_t v35 = objc_msgSend_lastRecognitionResult(v29, v30, v31, v32, v33, v34);
      v41 = objc_msgSend_strokeGroupingResult(v35, v36, v37, v38, v39, v40);
      v155 = objc_msgSend_strokeGroups(v41, v42, v43, v44, v45, v46);

      uint64_t v47 = (void *)MEMORY[0x1E4F29008];
      long long v48 = NSStringFromSelector(sel_ancestorIdentifier);
      uint64_t v52 = objc_msgSend_sortDescriptorWithKey_ascending_(v47, v49, (uint64_t)v48, 1, v50, v51);

      uint64_t v154 = (void *)v52;
      v167[0] = v52;
      uint64_t v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v53, (uint64_t)v167, 1, v54, v55);
      uint64_t v61 = objc_msgSend_sortedArrayUsingDescriptors_(v155, v57, (uint64_t)v56, v58, v59, v60);

      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      id v62 = v61;
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v162, (uint64_t)v166, 16, v64);
      if (v65)
      {
        unint64_t v66 = 0;
        uint64_t v67 = *(void *)v163;
        while (2)
        {
          uint64_t v68 = 0;
          unint64_t v153 = v66;
          unint64_t v69 = v65 + v66;
          do
          {
            if (*(void *)v163 != v67) {
              objc_enumerationMutation(v62);
            }
            uint64_t v70 = *(void **)(*((void *)&v162 + 1) + 8 * v68);
            uint64_t v71 = self->__strokeGroupIndexByAncestorID;
            uint64_t v72 = NSNumber;
            uint64_t v78 = objc_msgSend_ancestorIdentifier(v70, v73, v74, v75, v76, v77);
            uint64_t v83 = objc_msgSend_numberWithInteger_(v72, v79, v78, v80, v81, v82);
            uint64_t v88 = objc_msgSend_objectForKeyedSubscript_(v71, v84, (uint64_t)v83, v85, v86, v87);

            if (!v88)
            {
              unint64_t v69 = v153 + v68;
              goto LABEL_17;
            }
            ++v68;
          }
          while (v65 != v68);
          uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v89, (uint64_t)&v162, (uint64_t)v166, 16, v90);
          unint64_t v66 = v69;
          if (v65) {
            continue;
          }
          break;
        }
      }
      else
      {
        unint64_t v69 = 0;
      }
LABEL_17:

      uint64_t v158 = 0;
      uint64_t v159 = &v158;
      uint64_t v160 = 0x2020000000;
      uint64_t v161 = -1;
      uint64_t v91 = self->__strokeGroupIndexByAncestorID;
      v157[0] = MEMORY[0x1E4F143A8];
      v157[1] = 3221225472;
      v157[2] = sub_1C4B409B0;
      v157[3] = &unk_1E64E4180;
      v157[4] = &v158;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v91, v92, (uint64_t)v157, v93, v94, v95);
      uint64_t v101 = v159[3] + 1;
      while (v69 < objc_msgSend_count(v62, v96, v97, v98, v99, v100))
      {
        uint64_t v106 = objc_msgSend_objectAtIndexedSubscript_(v62, v102, v69, v103, v104, v105);
        uint64_t v111 = objc_msgSend_numberWithInteger_(NSNumber, v107, v101, v108, v109, v110);
        uint64_t v112 = self->__strokeGroupIndexByAncestorID;
        uint64_t v113 = NSNumber;
        uint64_t v119 = objc_msgSend_ancestorIdentifier(v106, v114, v115, v116, v117, v118);
        uint64_t v124 = objc_msgSend_numberWithInteger_(v113, v120, v119, v121, v122, v123);
        objc_msgSend_setObject_forKeyedSubscript_(v112, v125, (uint64_t)v111, (uint64_t)v124, v126, v127);

        ++v69;
        ++v101;
      }
      _Block_object_dispose(&v158, 8);

      uint64_t v128 = self->__strokeGroupIndexByAncestorID;
    }
    else
    {
      uint64_t v128 = 0;
    }
    uint64_t v129 = v128;
    uint64_t v130 = NSNumber;
    uint64_t v136 = objc_msgSend_ancestorIdentifier(v156, v131, v132, v133, v134, v135);
    uint64_t v141 = objc_msgSend_numberWithInteger_(v130, v137, v136, v138, v139, v140);
    long long v22 = objc_msgSend_objectForKeyedSubscript_(v129, v142, (uint64_t)v141, v143, v144, v145);

    if (!v22)
    {
      int64_t v151 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_24;
    }
    uint64_t v28 = objc_msgSend_integerValue(v22, v146, v147, v148, v149, v150);
  }
  int64_t v151 = v28;
LABEL_24:

  return v151;
}

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4B40AD0;
  v6[3] = &unk_1E64E11E0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)recognitionSessionDidChangeStatus:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4B40D64;
  block[3] = &unk_1E64E0D48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (CHVisualizationManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CHVisualizationManagerDelegate *)a3;
}

- (BOOL)statusReportingEnabled
{
  return self->_statusReportingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__renderedResults, 0);
  objc_storeStrong((id *)&self->__strokeGroupIndexByAncestorID, 0);
  objc_storeStrong((id *)&self->__activeVisualizationsByID, 0);
  objc_storeStrong((id *)&self->__activeVisualizationIDs, 0);
  objc_storeStrong((id *)&self->__enabledVisualizationIDs, 0);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
}

@end