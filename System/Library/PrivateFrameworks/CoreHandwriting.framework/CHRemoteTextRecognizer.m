@interface CHRemoteTextRecognizer
+ (id)newRemoteRecognizerWithMode:(int)a3 locales:(id)a4;
+ (int64_t)maxRequestStrokeCountForLocale:(id)a3;
- (BOOL)enableGen2CharacterLMIfAvailable;
- (BOOL)enableGen2ModelIfAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteTextRecognizer:(id)a3;
- (BOOL)shouldUseTextReplacements;
- (CHRemoteTextRecognizer)initWithMode:(int)a3 locale:(id)a4;
- (CHRemoteTextRecognizer)initWithMode:(int)a3 locale:(id)a4 recognizerOptions:(id)a5;
- (CHRemoteTextRecognizer)initWithMode:(int)a3 locales:(id)a4 activeCharacterSetPerLocale:(id)a5 recognizerOptions:(id)a6;
- (NSArray)locales;
- (NSCharacterSet)activeCharacterSet;
- (NSDictionary)activeCharacterSetPerLocale;
- (NSLocale)locale;
- (NSSet)declaredVariables;
- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 error:(id *)a5;
- (id)transcriptionPathsForTokenizedTextResult:(id)a3 withHistory:(id)a4 scores:(id *)a5 error:(id *)a6;
- (int)autoCapitalizationMode;
- (int)autoCorrectionMode;
- (int)baseWritingDirection;
- (int)contentType;
- (int)recognitionMode;
- (unint64_t)hash;
- (void)setActiveCharacterSet:(id)a3;
- (void)setAutoCapitalizationMode:(int)a3;
- (void)setAutoCorrectionMode:(int)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setContentType:(int)a3;
- (void)setDeclaredVariables:(id)a3;
- (void)setShouldUseTextReplacements:(BOOL)a3;
@end

@implementation CHRemoteTextRecognizer

- (CHRemoteTextRecognizer)initWithMode:(int)a3 locale:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = objc_alloc_init(CHRecognizerOptions);
  v10 = (CHRemoteTextRecognizer *)objc_msgSend_initWithMode_locale_recognizerOptions_(self, v8, v4, (uint64_t)v6, (uint64_t)v7, v9);

  return v10;
}

- (CHRemoteTextRecognizer)initWithMode:(int)a3 locale:(id)a4 recognizerOptions:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v17[0] = v8;
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v17, 1, v11, v12);
  active = (CHRemoteTextRecognizer *)objc_msgSend_initWithMode_locales_activeCharacterSetPerLocale_recognizerOptions_(self, v14, v6, (uint64_t)v13, MEMORY[0x1E4F1CC08], (uint64_t)v9);

  return active;
}

- (CHRemoteTextRecognizer)initWithMode:(int)a3 locales:(id)a4 activeCharacterSetPerLocale:(id)a5 recognizerOptions:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (CHRecognizerOptions *)a6;
  if (objc_msgSend_count(v10, v13, v14, v15, v16, v17))
  {
    if (v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v23 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_FAULT, "CHRemoteRecognizer must be initialized with at least one locale", buf, 2u);
  }

  if (!v12) {
LABEL_9:
  }
    uint64_t v12 = objc_alloc_init(CHRecognizerOptions);
LABEL_10:
  uint64_t v24 = objc_msgSend_enableCachingIfAvailable(v12, v18, v19, v20, v21, v22);
  v65.receiver = self;
  v65.super_class = (Class)CHRemoteTextRecognizer;
  v25 = [(CHRemoteRecognizer *)&v65 initWithEnableCachingIfAvailable:v24];
  v31 = v25;
  v32 = v25;
  if (v25)
  {
    v25->_recognitionMode = v8;
    v25->_shouldUseTextReplacements = 1;
    v25->_enableGen2ModelIfAvailable = objc_msgSend_enableGen2ModelIfAvailable(v12, v26, v27, v28, v29, v30);
    v32->_enableGen2CharacterLMIfAvailable = objc_msgSend_enableGen2CharacterLMIfAvailable(v12, v33, v34, v35, v36, v37);
    uint64_t v43 = objc_msgSend_copy(v10, v38, v39, v40, v41, v42);
    activeCharacterSetPerLocale = v32->_activeCharacterSetPerLocale;
    v32->_activeCharacterSetPerLocale = (NSDictionary *)v43;

    if (v11) {
      id v50 = (id)objc_msgSend_copy(v11, v45, v46, v47, v48, v49);
    }
    else {
      id v50 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    v51 = v50;
    objc_storeStrong((id *)&v31[1].super.super.isa, v50);

    v52 = objc_opt_class();
    v32->_shouldUseStrokeReordering = objc_msgSend_shouldUseStrokeReorderingForMode_(v52, v53, v8, v54, v55, v56);
    uint64_t v62 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v57, v58, v59, v60, v61);
    locales = v32->_locales;
    v32->_locales = (NSArray *)v62;
  }
  return v32;
}

+ (id)newRemoteRecognizerWithMode:(int)a3 locales:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(CHRecognizerOptions);
  v7 = objc_opt_class();
  id v11 = objc_msgSend_effectiveRecognitionLocales_recognitionMode_(v7, v8, (uint64_t)v5, v4, v9, v10);
  uint64_t v12 = objc_opt_class();
  uint64_t v21 = objc_msgSend_defaultActiveCharacterSetForLocales_(v12, v13, (uint64_t)v11, v14, v15, v16);
  switch(v4)
  {
    case 6:
      objc_msgSend_setEnableCachingIfAvailable_(v6, v17, 0, v18, v19, v20);
      objc_msgSend_setEnableGen2ModelIfAvailable_(v6, v26, 1, v27, v28, v29);
      objc_msgSend_setEnableGen2CharacterLMIfAvailable_(v6, v30, 0, v31, v32, v33);
      break;
    case 4:
      objc_msgSend_setEnableCachingIfAvailable_(v6, v17, 0, v18, v19, v20);
      goto LABEL_7;
    case 2:
      objc_msgSend_setEnableCachingIfAvailable_(v6, v17, 1, v18, v19, v20);
LABEL_7:
      objc_msgSend_setEnableGen2ModelIfAvailable_(v6, v22, 1, v23, v24, v25);
      objc_msgSend_setEnableGen2CharacterLMIfAvailable_(v6, v34, 1, v35, v36, v37);
      break;
  }
  v38 = [CHRemoteTextRecognizer alloc];
  active = objc_msgSend_initWithMode_locales_activeCharacterSetPerLocale_recognizerOptions_(v38, v39, v4, (uint64_t)v11, (uint64_t)v21, (uint64_t)v6);

  return active;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_msgSend_firstObject(self->_activeCharacterSetPerLocale, a2, v2, v3, v4, v5);
}

- (NSCharacterSet)activeCharacterSet
{
  Class isa = self[1].super.super.isa;
  v7 = objc_msgSend_firstObject(self->_activeCharacterSetPerLocale, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(isa, v8, (uint64_t)v7, v9, v10, v11);

  return (NSCharacterSet *)v12;
}

- (void)setActiveCharacterSet:(id)a3
{
  uint64_t v42 = (char *)a3;
  Class isa = self[1].super.super.isa;
  uint64_t v10 = objc_msgSend_firstObject(self->_activeCharacterSetPerLocale, v5, v6, v7, v8, v9);
  objc_msgSend_objectForKeyedSubscript_(isa, v11, (uint64_t)v10, v12, v13, v14);
  uint64_t v15 = (char *)objc_claimAutoreleasedReturnValue();

  if (v15 != v42)
  {
    uint64_t v25 = objc_msgSend_mutableCopy(self[1].super.super.isa, v16, v17, v18, v19, v20);
    activeCharacterSetPerLocale = self->_activeCharacterSetPerLocale;
    if (v42)
    {
      uint64_t v27 = objc_msgSend_firstObject(activeCharacterSetPerLocale, v42, v21, v22, v23, v24);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v28, (uint64_t)v42, (uint64_t)v27, v29, v30);
    }
    else
    {
      uint64_t v27 = objc_msgSend_firstObject(activeCharacterSetPerLocale, 0, v21, v22, v23, v24);
      objc_msgSend_removeObjectForKey_(v25, v31, (uint64_t)v27, v32, v33, v34);
    }

    uint64_t v40 = (objc_class *)objc_msgSend_copy(v25, v35, v36, v37, v38, v39);
    Class v41 = self[1].super.super.isa;
    self[1].super.super.Class isa = v40;
  }
}

- (id)textRecognitionResultForDrawing:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = objc_msgSend_locale(self, v10, v11, v12, v13, v14);

  if (!v15)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v16 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v73[0]) = 0;
      _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_FAULT, "A locale is required to build the remote recognition request", (uint8_t *)v73, 2u);
    }
  }
  sub_1C4961130((unsigned __int8 *)self, v8, v9);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v17;
  if (self)
  {
    objc_msgSend_setupXPCConnectionIfNeeded(self, v18, v19, v20, v21, v22);
    uint64_t v29 = objc_msgSend_connection(self, v24, v25, v26, v27, v28);

    if (!v29)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v35 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v73[0]) = 0;
        _os_log_impl(&dword_1C492D000, v35, OS_LOG_TYPE_FAULT, "XPC connection must be non-nil", (uint8_t *)v73, 2u);
      }
    }
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x3032000000;
    v98 = sub_1C4961788;
    v99 = sub_1C4961798;
    id v100 = 0;
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x3032000000;
    v92 = sub_1C4961788;
    v93 = sub_1C4961798;
    id v94 = 0;
    if (objc_msgSend_shouldRemoveUnnaturalGaps(v23, v30, v31, v32, v33, v34))
    {
      Class v41 = objc_msgSend_drawing(v23, v36, v37, v38, v39, v40);
      uint64_t v47 = objc_msgSend_drawingByRemovingUnnaturalHorizontalGaps_(v41, v42, v43, v44, v45, v46, 10000.0);
      objc_msgSend_setDrawing_(v23, v48, (uint64_t)v47, v49, v50, v51);
    }
    objc_msgSend_setHasBeenSubmitted_(v23, v36, 1, v38, v39, v40);
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3032000000;
    v86 = sub_1C4961788;
    v87 = sub_1C4961798;
    id v88 = 0;
    v57 = objc_msgSend_connection(self, v52, v53, v54, v55, v56);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = sub_1C4961A60;
    v82[3] = &unk_1E64E10C8;
    v82[4] = &v83;
    uint64_t v62 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v57, v58, (uint64_t)v82, v59, v60, v61);

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    char v81 = 0;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = sub_1C4961B80;
    v73[3] = &unk_1E64E1118;
    v75 = &v95;
    v76 = &v89;
    v73[4] = self;
    id v63 = v23;
    id v74 = v63;
    v77 = &v78;
    objc_msgSend_handleRecognitionRequest_withReply_(v62, v64, (uint64_t)v63, (uint64_t)v73, v65, v66);
    if (!*((unsigned char *)v79 + 24)) {
      objc_msgSend_logDrawingsAndResultsForRequest_result_error_(self, v67, (uint64_t)v63, 0, v84[5], v68);
    }
    v69 = (void *)v84[5];
    if (!v69) {
      v69 = (void *)v90[5];
    }
    id v70 = v69;
    self = (CHRemoteTextRecognizer *)(id)v96[5];

    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v83, 8);

    _Block_object_dispose(&v89, 8);
    _Block_object_dispose(&v95, 8);

    id v71 = v70;
    if (a5) {
      goto LABEL_21;
    }
  }
  else
  {

    id v71 = 0;
    if (a5) {
LABEL_21:
    }
      *a5 = v71;
  }

  return self;
}

- (id)transcriptionPathsForTokenizedTextResult:(id)a3 withHistory:(id)a4 scores:(id *)a5 error:(id *)a6
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_alloc_init(CHDrawing);
  objc_msgSend_addPoint_(v12, v13, v14, v15, v16, v17, 0.0, 0.0);
  objc_msgSend_endStroke(v12, v18, v19, v20, v21, v22);
  if (v11)
  {
    v69 = CHRecognitionOptionTextBefore;
    v70[0] = v11;
    uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v70, (uint64_t)&v69, 1, v24);
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v26 = sub_1C4961130((unsigned __int8 *)self, v12, v25);
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  uint64_t v66 = sub_1C4961788;
  v67 = sub_1C4961798;
  id v68 = 0;
  uint64_t v32 = objc_msgSend_connection(self, v27, v28, v29, v30, v31);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = sub_1C49617A0;
  v62[3] = &unk_1E64E10C8;
  v62[4] = &v63;
  uint64_t v37 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v32, v33, (uint64_t)v62, v34, v35, v36);

  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1C4961788;
  uint64_t v60 = sub_1C4961798;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1C4961788;
  uint64_t v54 = sub_1C4961798;
  id v55 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1C4961788;
  uint64_t v48 = sub_1C4961798;
  id v49 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1C49618C0;
  v43[3] = &unk_1E64E10F0;
  v43[4] = &v50;
  v43[5] = &v56;
  v43[6] = &v44;
  objc_msgSend_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_(v37, v38, (uint64_t)v10, (uint64_t)v26, (uint64_t)v43, v39);
  if (a6)
  {
    uint64_t v40 = (void *)v64[5];
    if (!v40) {
      uint64_t v40 = (void *)v45[5];
    }
    *a6 = v40;
  }
  if (a5) {
    *a5 = (id) v57[5];
  }
  id v41 = (id)v51[5];
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v63, 8);
  return v41;
}

- (BOOL)isEqualToRemoteTextRecognizer:(id)a3
{
  uint64_t v4 = (CHRemoteTextRecognizer *)a3;
  if (self == v4)
  {
    char isEqualToDictionary = 1;
    goto LABEL_12;
  }
  v191.receiver = self;
  v191.super_class = (Class)CHRemoteTextRecognizer;
  if ([(CHRemoteRecognizer *)&v191 isEqualToRemoteRecognizer:v4])
  {
    int v10 = objc_msgSend_recognitionMode(self, v5, v6, v7, v8, v9);
    if (v10 == objc_msgSend_recognitionMode(v4, v11, v12, v13, v14, v15))
    {
      int v21 = objc_msgSend_contentType(self, v16, v17, v18, v19, v20);
      if (v21 == objc_msgSend_contentType(v4, v22, v23, v24, v25, v26))
      {
        int v32 = objc_msgSend_autoCapitalizationMode(self, v27, v28, v29, v30, v31);
        if (v32 == objc_msgSend_autoCapitalizationMode(v4, v33, v34, v35, v36, v37))
        {
          int v43 = objc_msgSend_autoCorrectionMode(self, v38, v39, v40, v41, v42);
          if (v43 == objc_msgSend_autoCorrectionMode(v4, v44, v45, v46, v47, v48))
          {
            uint64_t v54 = objc_msgSend_baseWritingDirection(self, v49, v50, v51, v52, v53);
            if (v54 == objc_msgSend_baseWritingDirection(v4, v55, v56, v57, v58, v59))
            {
              int v65 = objc_msgSend_enableGen2ModelIfAvailable(self, v60, v61, v62, v63, v64);
              if (v65 == objc_msgSend_enableGen2ModelIfAvailable(v4, v66, v67, v68, v69, v70))
              {
                int v76 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v71, v72, v73, v74, v75);
                if (v76 == objc_msgSend_enableGen2CharacterLMIfAvailable(v4, v77, v78, v79, v80, v81))
                {
                  uint64_t v89 = objc_msgSend_locales(self, v82, v83, v84, v85, v86);
                  id v100 = objc_msgSend_locales(v4, v90, v91, v92, v93, v94);
                  if (v89 == v100)
                  {
                  }
                  else
                  {
                    v106 = objc_msgSend_locales(self, v95, v96, v97, v98, v99);
                    if (!v106)
                    {
                      char isEqualToDictionary = 0;
                      goto LABEL_33;
                    }
                    v112 = objc_msgSend_locales(v4, v101, v102, v103, v104, v105);
                    if (!v112) {
                      goto LABEL_28;
                    }
                    v113 = objc_msgSend_locales(self, v107, v108, v109, v110, v111);
                    v119 = objc_msgSend_locales(v4, v114, v115, v116, v117, v118);
                    int isEqualToArray = objc_msgSend_isEqualToArray_(v113, v120, (uint64_t)v119, v121, v122, v123);

                    if (!isEqualToArray) {
                      goto LABEL_10;
                    }
                  }
                  v130 = objc_msgSend_declaredVariables(self, v125, v126, v127, v128, v129);
                  v141 = objc_msgSend_declaredVariables(v4, v131, v132, v133, v134, v135);
                  if (v130 == v141)
                  {
                  }
                  else
                  {
                    v142 = objc_msgSend_declaredVariables(self, v136, v137, v138, v139, v140);
                    v148 = objc_msgSend_declaredVariables(v4, v143, v144, v145, v146, v147);
                    int isEqualToSet = objc_msgSend_isEqualToSet_(v142, v149, (uint64_t)v148, v150, v151, v152);

                    if (!isEqualToSet) {
                      goto LABEL_10;
                    }
                  }
                  uint64_t v89 = objc_msgSend_activeCharacterSetPerLocale(self, v154, v155, v156, v157, v158);
                  id v100 = objc_msgSend_activeCharacterSetPerLocale(v4, v159, v160, v161, v162, v163);
                  if (v89 != v100)
                  {
                    v106 = objc_msgSend_activeCharacterSetPerLocale(self, v164, v165, v166, v167, v168);
                    if (v106)
                    {
                      v179 = objc_msgSend_activeCharacterSetPerLocale(v4, v169, v170, v171, v172, v173);
                      if (v179)
                      {
                        v180 = objc_msgSend_activeCharacterSetPerLocale(self, v174, v175, v176, v177, v178);
                        v186 = objc_msgSend_activeCharacterSetPerLocale(v4, v181, v182, v183, v184, v185);
                        char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v180, v187, (uint64_t)v186, v188, v189, v190);
                      }
                      else
                      {
                        char isEqualToDictionary = 0;
                      }

                      goto LABEL_32;
                    }
LABEL_28:
                    char isEqualToDictionary = 0;
LABEL_32:

                    goto LABEL_33;
                  }
                  char isEqualToDictionary = 1;
                  id v100 = v89;
LABEL_33:

                  goto LABEL_12;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_10:
  char isEqualToDictionary = 0;
LABEL_12:

  return isEqualToDictionary;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteTextRecognizer = objc_msgSend_isEqualToRemoteTextRecognizer_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteTextRecognizer;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  objc_msgSend_locales(self, a2, v2, v3, v4, v5);
  while (1)
    uint64_t v15 = {;
    unint64_t v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);

    if (v7 >= v21) {
      break;
    }
    uint64_t v27 = objc_msgSend_locales(self, v22, v23, v24, v25, v26);
    int v32 = objc_msgSend_objectAtIndexedSubscript_(v27, v28, v7, v29, v30, v31);

    uint64_t v38 = objc_msgSend_activeCharacterSetPerLocale(self, v33, v34, v35, v36, v37);
    int v43 = objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)v32, v40, v41, v42);

    uint64_t v54 = objc_msgSend_hash(v32, v44, v45, v46, v47, v48);
    if (v43) {
      v8 ^= objc_msgSend_hash(v43, v49, v50, v51, v52, v53);
    }
    v9 ^= v54 << v7;

    ++v7;
    objc_msgSend_locales(self, v10, v11, v12, v13, v14);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v55 = objc_msgSend_declaredVariables(self, v22, v23, v24, v25, v26);
  uint64_t v58 = 0;
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v99, (uint64_t)v103, 16, v57);
  if (v64)
  {
    uint64_t v65 = *(void *)v100;
    do
    {
      uint64_t v66 = 0;
      do
      {
        if (*(void *)v100 != v65) {
          objc_enumerationMutation(v55);
        }
        v58 ^= objc_msgSend_hash(*(void **)(*((void *)&v99 + 1) + 8 * v66++), v59, v60, v61, v62, v63);
      }
      while (v64 != v66);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v59, (uint64_t)&v99, (uint64_t)v103, 16, v63);
    }
    while (v64);
  }

  v98.receiver = self;
  v98.super_class = (Class)CHRemoteTextRecognizer;
  unint64_t v67 = [(CHRemoteRecognizer *)&v98 hash];
  unsigned int v73 = objc_msgSend_recognitionMode(self, v68, v69, v70, v71, v72);
  unsigned int v79 = objc_msgSend_contentType(self, v74, v75, v76, v77, v78);
  unsigned int v85 = objc_msgSend_autoCapitalizationMode(self, v80, v81, v82, v83, v84);
  unsigned int v91 = objc_msgSend_autoCorrectionMode(self, v86, v87, v88, v89, v90);
  return v58 ^ v67 ^ v73 ^ (unint64_t)v79 ^ v85 ^ v91 ^ objc_msgSend_baseWritingDirection(self, v92, v93, v94, v95, v96) ^ v8 ^ v9;
}

+ (int64_t)maxRequestStrokeCountForLocale:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  int64_t v9 = objc_msgSend_drawingStrokeLimitForLocale_(v4, v5, (uint64_t)v3, v6, v7, v8);

  return v9;
}

- (int)recognitionMode
{
  return self->_recognitionMode;
}

- (int)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int)a3
{
  self->_contentType = a3;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  self->_autoCapitalizationMode = a3;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (void)setAutoCorrectionMode:(int)a3
{
  self->_autoCorrectionMode = a3;
}

- (int)baseWritingDirection
{
  return (int)self->_declaredVariables;
}

- (void)setBaseWritingDirection:(int)a3
{
  self->_declaredVariables = *(NSSet **)&a3;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (NSSet)declaredVariables
{
  return (NSSet *)self->_locales;
}

- (void)setDeclaredVariables:(id)a3
{
}

- (NSArray)locales
{
  return (NSArray *)self->_activeCharacterSetPerLocale;
}

- (NSDictionary)activeCharacterSetPerLocale
{
  return (NSDictionary *)self[1].super.super.isa;
}

- (BOOL)shouldUseTextReplacements
{
  return self->_shouldUseTextReplacements;
}

- (void)setShouldUseTextReplacements:(BOOL)a3
{
  self->_shouldUseTextReplacements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.super.isa, 0);
  objc_storeStrong((id *)&self->_activeCharacterSetPerLocale, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end