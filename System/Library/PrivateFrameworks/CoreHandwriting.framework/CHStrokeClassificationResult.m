@interface CHStrokeClassificationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToStrokeClassificationResult:(id)a3;
- (BOOL)isHighConfidenceForStrokesIdentifiers:(id)a3 script:(id)a4 confidenceThreshold:(double)a5;
- (CHStrokeClassificationResult)init;
- (CHStrokeClassificationResult)initWithCoder:(id)a3;
- (CHStrokeClassificationResult)initWithStrokeClassificationsByStrokeIdentifier:(id)a3 scriptClassificationsByStrokeIdentifier:(id)a4 scriptClassificationRawResultsByStrokeIdentifier:(id)a5 substrokesByStrokeIdentifier:(id)a6 nontextCandidates:(id)a7;
- (NSDictionary)scriptClassificationRawResultsByStrokeIdentifier;
- (NSDictionary)scriptClassificationsByStrokeIdentifier;
- (NSDictionary)strokeClassificationsByStrokeIdentifier;
- (NSDictionary)substrokesByStrokeIdentifier;
- (NSSet)nontextCandidates;
- (NSSet)textStrokeIdentifiers;
- (double)scriptClassificationScoreForStrokeIdentifier:(id)a3 script:(id)a4;
- (id)description;
- (id)differenceFromResult:(id)a3 removedStrokeIds:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subResultForStrokeIdentifiers:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHStrokeClassificationResult

- (CHStrokeClassificationResult)init
{
  v10.receiver = self;
  v10.super_class = (Class)CHStrokeClassificationResult;
  v2 = [(CHStrokeClassificationResult *)&v10 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    strokeClassificationsByStrokeIdentifier = v2->_strokeClassificationsByStrokeIdentifier;
    v2->_strokeClassificationsByStrokeIdentifier = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    substrokesByStrokeIdentifier = v2->_substrokesByStrokeIdentifier;
    v2->_substrokesByStrokeIdentifier = v5;

    v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    nontextCandidates = v2->_nontextCandidates;
    v2->_nontextCandidates = v7;
  }
  return v2;
}

- (CHStrokeClassificationResult)initWithStrokeClassificationsByStrokeIdentifier:(id)a3 scriptClassificationsByStrokeIdentifier:(id)a4 scriptClassificationRawResultsByStrokeIdentifier:(id)a5 substrokesByStrokeIdentifier:(id)a6 nontextCandidates:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v54.receiver = self;
  v54.super_class = (Class)CHStrokeClassificationResult;
  v22 = [(CHStrokeClassificationResult *)&v54 init];
  if (v22)
  {
    uint64_t v23 = objc_msgSend_copy(v12, v17, v18, v19, v20, v21);
    strokeClassificationsByStrokeIdentifier = v22->_strokeClassificationsByStrokeIdentifier;
    v22->_strokeClassificationsByStrokeIdentifier = (NSDictionary *)v23;

    uint64_t v30 = objc_msgSend_copy(v13, v25, v26, v27, v28, v29);
    scriptClassificationsByStrokeIdentifier = v22->_scriptClassificationsByStrokeIdentifier;
    v22->_scriptClassificationsByStrokeIdentifier = (NSDictionary *)v30;

    uint64_t v37 = objc_msgSend_copy(v14, v32, v33, v34, v35, v36);
    scriptClassificationRawResultsByStrokeIdentifier = v22->_scriptClassificationRawResultsByStrokeIdentifier;
    v22->_scriptClassificationRawResultsByStrokeIdentifier = (NSDictionary *)v37;

    uint64_t v44 = objc_msgSend_copy(v15, v39, v40, v41, v42, v43);
    substrokesByStrokeIdentifier = v22->_substrokesByStrokeIdentifier;
    v22->_substrokesByStrokeIdentifier = (NSDictionary *)v44;

    uint64_t v51 = objc_msgSend_copy(v16, v46, v47, v48, v49, v50);
    nontextCandidates = v22->_nontextCandidates;
    v22->_nontextCandidates = (NSSet *)v51;
  }
  return v22;
}

- (id)description
{
  v34.receiver = self;
  v34.super_class = (Class)CHStrokeClassificationResult;
  v3 = [(CHStrokeClassificationResult *)&v34 description];
  v9 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_textStrokeIdentifiers(self, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  v32 = objc_msgSend_stringByAppendingFormat_(v3, v28, @" Strokes: %ld, text strokes: %ld", v29, v30, v31, v15, v27);

  return v32;
}

- (NSSet)textStrokeIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textStrokeIdentifiers)
  {
    uint64_t v8 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v2, v3, v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_keysOfEntriesPassingTest_(v8, v9, (uint64_t)&unk_1F2013550, v10, v11, v12);

    textStrokeIdentifiers = v2->_textStrokeIdentifiers;
    v2->_textStrokeIdentifiers = (NSSet *)v13;
  }
  objc_sync_exit(v2);

  uint64_t v15 = v2->_textStrokeIdentifiers;
  return v15;
}

- (BOOL)isEquivalentToStrokeClassificationResult:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
  v22 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v4, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);

  if (v16 == v28)
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    objc_super v34 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v29, v30, v31, v32, v33, 0);
    uint64_t v40 = objc_msgSend_allKeys(v34, v35, v36, v37, v38, v39);

    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v82, (uint64_t)v86, 16, v42);
    if (v48)
    {
      uint64_t v49 = *(void *)v83;
      while (2)
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v83 != v49) {
            objc_enumerationMutation(v40);
          }
          uint64_t v51 = *(void *)(*((void *)&v82 + 1) + 8 * i);
          v52 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v43, v44, v45, v46, v47);
          v57 = objc_msgSend_objectForKey_(v52, v53, v51, v54, v55, v56);

          v63 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v4, v58, v59, v60, v61, v62);
          v68 = objc_msgSend_objectForKey_(v63, v64, v51, v65, v66, v67);

          uint64_t v74 = objc_msgSend_integerValue(v57, v69, v70, v71, v72, v73);
          LOBYTE(v74) = v74 == objc_msgSend_integerValue(v68, v75, v76, v77, v78, v79);

          if ((v74 & 1) == 0)
          {
            BOOL v80 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v82, (uint64_t)v86, 16, v47);
        if (v48) {
          continue;
        }
        break;
      }
    }
    BOOL v80 = 1;
LABEL_13:
  }
  else
  {
    BOOL v80 = 0;
  }

  return v80;
}

- (void)encodeWithCoder:(id)a3
{
  id v49 = a3;
  uint64_t v9 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v49, v10, (uint64_t)v9, @"strokeClassificationsByStrokeIdentifier", v11, v12);

  uint64_t v18 = objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v13, v14, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v49, v19, (uint64_t)v18, @"scriptClassificationsByStrokeIdentifier", v20, v21);

  uint64_t v27 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v22, v23, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v49, v28, (uint64_t)v27, @"scriptClassificationRawResultsByStrokeIdentifier", v29, v30);

  uint64_t v36 = objc_msgSend_substrokesByStrokeIdentifier(self, v31, v32, v33, v34, v35);
  objc_msgSend_encodeObject_forKey_(v49, v37, (uint64_t)v36, @"substrokesByStrokeIdentifier", v38, v39);

  uint64_t v45 = objc_msgSend_nontextCandidates(self, v40, v41, v42, v43, v44);
  objc_msgSend_encodeObject_forKey_(v49, v46, (uint64_t)v45, @"nontextCandidates", v47, v48);
}

- (CHStrokeClassificationResult)initWithCoder:(id)a3
{
  v82[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  v82[2] = objc_opt_class();
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v82, 3, v6, v7);
  uint64_t v13 = objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8, v10, v11, v12);
  uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v14, (uint64_t)v13, @"strokeClassificationsByStrokeIdentifier", v15, v16);

  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  v81[2] = objc_opt_class();
  v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v81, 3, v20, v21);
  uint64_t v27 = objc_msgSend_setWithArray_(v18, v23, (uint64_t)v22, v24, v25, v26);
  uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v28, (uint64_t)v27, @"scriptClassificationsByStrokeIdentifier", v29, v30);

  uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  v80[3] = objc_opt_class();
  uint64_t v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v33, (uint64_t)v80, 4, v34, v35);
  uint64_t v41 = objc_msgSend_setWithArray_(v32, v37, (uint64_t)v36, v38, v39, v40);
  uint64_t v45 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v42, (uint64_t)v41, @"substrokesByStrokeIdentifier", v43, v44);

  uint64_t v46 = (void *)MEMORY[0x1E4F1CAD0];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  v79[2] = objc_opt_class();
  uint64_t v50 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v47, (uint64_t)v79, 3, v48, v49);
  uint64_t v55 = objc_msgSend_setWithArray_(v46, v51, (uint64_t)v50, v52, v53, v54);
  uint64_t v59 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v56, (uint64_t)v55, @"scriptClassificationRawResultsByStrokeIdentifier", v57, v58);

  uint64_t v60 = (void *)MEMORY[0x1E4F1CAD0];
  v78[0] = objc_opt_class();
  v78[1] = objc_opt_class();
  v64 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v61, (uint64_t)v78, 2, v62, v63);
  v69 = objc_msgSend_setWithArray_(v60, v65, (uint64_t)v64, v66, v67, v68);
  uint64_t v73 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v70, (uint64_t)v69, @"nontextCandidates", v71, v72);

  v75 = (CHStrokeClassificationResult *)objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(self, v74, (uint64_t)v17, (uint64_t)v31, (uint64_t)v59, (uint64_t)v45, v73);
  return v75;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHStrokeClassificationResult *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        strokeClassificationsByStrokeIdentifier = self->_strokeClassificationsByStrokeIdentifier;
        objc_msgSend_strokeClassificationsByStrokeIdentifier(v5, v6, v7, v8, v9, v10);
        uint64_t v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (strokeClassificationsByStrokeIdentifier == v18)
        {
        }
        else
        {
          uint64_t v19 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v11, v13, v14, v15, v16, v17);
          int isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_strokeClassificationsByStrokeIdentifier, v21, v22, v23);

          if (!isEqual) {
            goto LABEL_20;
          }
        }
        scriptClassificationsByStrokeIdentifier = self->_scriptClassificationsByStrokeIdentifier;
        objc_msgSend_scriptClassificationsByStrokeIdentifier(v11, v25, v26, v27, v28, v29);
        uint64_t v36 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (scriptClassificationsByStrokeIdentifier == v36)
        {
        }
        else
        {
          uint64_t v37 = objc_msgSend_scriptClassificationsByStrokeIdentifier(v11, v31, v32, v33, v34, v35);
          int v42 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_scriptClassificationsByStrokeIdentifier, v39, v40, v41);

          if (!v42) {
            goto LABEL_20;
          }
        }
        scriptClassificationRawResultsByStrokeIdentifier = self->_scriptClassificationRawResultsByStrokeIdentifier;
        objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v11, v43, v44, v45, v46, v47);
        uint64_t v54 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (scriptClassificationRawResultsByStrokeIdentifier == v54)
        {

          goto LABEL_18;
        }
        uint64_t v55 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(v11, v49, v50, v51, v52, v53);
        int v60 = objc_msgSend_isEqual_(v55, v56, (uint64_t)self->_scriptClassificationRawResultsByStrokeIdentifier, v57, v58, v59);

        if (v60)
        {
LABEL_18:
          substrokesByStrokeIdentifier = self->_substrokesByStrokeIdentifier;
          objc_msgSend_substrokesByStrokeIdentifier(v11, v61, v62, v63, v64, v65);
          uint64_t v72 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          if (substrokesByStrokeIdentifier == v72)
          {
          }
          else
          {
            uint64_t v73 = objc_msgSend_substrokesByStrokeIdentifier(v11, v67, v68, v69, v70, v71);
            int v78 = objc_msgSend_isEqual_(v73, v74, (uint64_t)self->_substrokesByStrokeIdentifier, v75, v76, v77);

            if (!v78) {
              goto LABEL_20;
            }
          }
          nontextCandidates = self->_nontextCandidates;
          objc_msgSend_nontextCandidates(v11, v79, v80, v81, v82, v83);
          v90 = (NSSet *)objc_claimAutoreleasedReturnValue();
          if (nontextCandidates == v90)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v91 = objc_msgSend_nontextCandidates(v11, v85, v86, v87, v88, v89);
            LOBYTE(self) = objc_msgSend_isEqual_(v91, v92, (uint64_t)self->_nontextCandidates, v93, v94, v95);
          }
          goto LABEL_26;
        }
LABEL_20:
        LOBYTE(self) = 0;
        goto LABEL_26;
      }
      LOBYTE(self) = 1;
    }
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(self) = 0;
LABEL_27:

  return (char)self;
}

- (BOOL)isHighConfidenceForStrokesIdentifiers:(id)a3 script:(id)a4 confidenceThreshold:(double)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v78 = a4;
  uint64_t v76 = v8;
  if (objc_msgSend_count(v8, v9, v10, v11, v12, v13))
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v8;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v79, (uint64_t)v83, 16, v15);
    if (v21)
    {
      uint64_t v22 = *(void *)v80;
      double v23 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          while (1)
          {
            if (*(void *)v80 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v79 + 1) + 8 * i);
            uint64_t v27 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v16, v17, v18, v19, v20);
            uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v27, v28, v26, v29, v30, v31);
            uint64_t v38 = objc_msgSend_integerValue(v32, v33, v34, v35, v36, v37);

            uint64_t v44 = objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v39, v40, v41, v42, v43);
            uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v44, v45, v26, v46, v47, v48);
            uint64_t v55 = objc_msgSend_integerValue(v49, v50, v51, v52, v53, v54);

            if ((objc_msgSend_isMatchingStrokeClassification_scriptClassification_(CHStrokeUtilities, v56, v38, v55, v57, v58) & 1) == 0)break; {
            objc_msgSend_scriptClassificationScoreForStrokeIdentifier_script_(self, v59, v26, (uint64_t)v78, v62, v63);
            }
            double v23 = v23 + v25;
            if (v21 == ++i) {
              goto LABEL_13;
            }
          }
          uint64_t v64 = objc_msgSend_integerValue(v78, v59, v60, v61, v62, v63);
          if (objc_msgSend_isMatchingStrokeClassification_scriptClassification_(CHStrokeUtilities, v65, v38, v64, v66, v67))double v68 = a5; {
          else
          }
            double v68 = 0.0;
          double v23 = v23 + v68;
        }
LABEL_13:
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v79, (uint64_t)v83, 16, v20);
      }
      while (v21);
    }
    else
    {
      double v23 = 0.0;
    }

    BOOL v69 = v23 / (double)(unint64_t)objc_msgSend_count(obj, v70, v71, v72, v73, v74) >= a5;
  }
  else
  {
    BOOL v69 = 0;
  }

  return v69;
}

- (double)scriptClassificationScoreForStrokeIdentifier:(id)a3 script:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v6, v15, v16, v17);
  uint64_t v24 = objc_msgSend_integerValue(v18, v19, v20, v21, v22, v23);

  uint64_t v30 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v25, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)v6, v32, v33, v34);

  uint64_t v40 = objc_msgSend_scriptClassificationAtIndex_(v35, v36, 0, v37, v38, v39);
  uint64_t v46 = objc_msgSend_integerValue(v40, v41, v42, v43, v44, v45);

  uint64_t v51 = objc_msgSend_scriptProbabilityAtIndex_(v35, v47, 0, v48, v49, v50);
  objc_msgSend_floatValue(v51, v52, v53, v54, v55, v56);
  float v58 = v57;

  uint64_t v64 = objc_msgSend_probabilityByScriptClassifications(v35, v59, v60, v61, v62, v63);
  uint64_t v69 = objc_msgSend_objectForKeyedSubscript_(v64, v65, (uint64_t)v7, v66, v67, v68);
  objc_msgSend_floatValue((void *)v69, v70, v71, v72, v73, v74);
  float v76 = v75;

  long long v82 = objc_msgSend_orderedScriptClassification(v35, v77, v78, v79, v80, v81);
  LOBYTE(v69) = objc_msgSend_containsObject_(v82, v83, (uint64_t)v7, v84, v85, v86);

  double v92 = 0.0;
  if (v69)
  {
    uint64_t v93 = objc_msgSend_integerValue(v7, v87, v88, v89, v90, v91);
    double v92 = v76;
    if (v46 != v24)
    {
      double v94 = v58;
      if (v93 == v46)
      {
        if (v46 == 11) {
          double v92 = v58;
        }
        else {
          double v92 = 0.0;
        }
      }
      else
      {
        if (v93 != v24) {
          double v94 = -0.0;
        }
        double v92 = v94 + v92;
      }
    }
  }

  return v92;
}

- (id)differenceFromResult:(id)a3 removedStrokeIds:(id)a4
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v87 = a4;
  uint64_t v86 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v7, v8, v9, v10, v11);
  uint64_t v88 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v12, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v17, v18, v19, v20, v21);
  uint64_t v89 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v23, v24, v25, v26, v27, v22);
  uint64_t v90 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v28, v29, v30, v31, v32);
  uint64_t v91 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v33, v34, v35, v36, v37);
  uint64_t v43 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v38, v39, v40, v41, v42);
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = sub_1C49F8C7C;
  v102[3] = &unk_1E64E2030;
  id v97 = v6;
  id v103 = v97;
  id v92 = v86;
  id v104 = v92;
  id v93 = v22;
  id v105 = v93;
  id v94 = v90;
  id v106 = v94;
  id v95 = v91;
  id v107 = v95;
  id v44 = v89;
  id v108 = v44;
  id v45 = v88;
  id v109 = v45;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v43, v46, (uint64_t)v102, v47, v48, v49);

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v87;
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v98, (uint64_t)v110, 16, v51);
  if (v57)
  {
    uint64_t v58 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v99 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = *(void *)(*((void *)&v98 + 1) + 8 * i);
        uint64_t v61 = objc_msgSend_strokeClassificationsByStrokeIdentifier(v97, v52, v53, v54, v55, v56);
        uint64_t v66 = objc_msgSend_objectForKey_(v61, v62, v60, v63, v64, v65);
        uint64_t v72 = objc_msgSend_integerValue(v66, v67, v68, v69, v70, v71);

        uint64_t v73 = objc_opt_class();
        if (objc_msgSend_isStrokeClassificationTextOrMath_(v73, v74, v72, v75, v76, v77)) {
          objc_msgSend_addObject_(v45, v78, v60, v79, v80, v81);
        }
        else {
          objc_msgSend_addObject_(v44, v78, v60, v79, v80, v81);
        }
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v98, (uint64_t)v110, 16, v56);
    }
    while (v57);
  }

  long long v82 = [CHStrokeClassificationResultDifference alloc];
  uint64_t v84 = objc_msgSend_initWithStrokeIdentifiersForAddedText_removedText_addedNonText_removedNonText_transitionedText_transitionedNonText_(v82, v83, (uint64_t)v92, (uint64_t)v45, (uint64_t)v93, (uint64_t)v44, v94, v95);

  return v84;
}

- (id)subResultForStrokeIdentifiers:(id)a3
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v10 = objc_msgSend_count(v3, v5, v6, v7, v8, v9, v3);
  v194 = objc_msgSend_dictionaryWithCapacity_(v4, v11, v10, v12, v13, v14);
  uint64_t v15 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v21 = objc_msgSend_count(v3, v16, v17, v18, v19, v20);
  v193 = objc_msgSend_dictionaryWithCapacity_(v15, v22, v21, v23, v24, v25);
  uint64_t v26 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v32 = objc_msgSend_count(v3, v27, v28, v29, v30, v31);
  v195 = objc_msgSend_dictionaryWithCapacity_(v26, v33, v32, v34, v35, v36);
  uint64_t v37 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v43 = objc_msgSend_count(v3, v38, v39, v40, v41, v42);
  v196 = objc_msgSend_dictionaryWithCapacity_(v37, v44, v43, v45, v46, v47);
  uint64_t v48 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v54 = objc_msgSend_count(v3, v49, v50, v51, v52, v53);
  uint64_t v59 = objc_msgSend_setWithCapacity_(v48, v55, v54, v56, v57, v58);
  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  id v60 = v3;
  uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v204, (uint64_t)v209, 16, v62);
  if (v191)
  {
    uint64_t v192 = *(void *)v205;
    while (2)
    {
      for (uint64_t i = 0; i != v191; ++i)
      {
        if (*(void *)v205 != v192) {
          objc_enumerationMutation(v60);
        }
        uint64_t v68 = *(void *)(*((void *)&v204 + 1) + 8 * i);
        uint64_t v69 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v63, v64, v65, v66, v67);
        v197 = objc_msgSend_objectForKeyedSubscript_(v69, v70, v68, v71, v72, v73);
        if (!v197) {
          goto LABEL_24;
        }
        uint64_t v79 = objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v74, v75, v76, v77, v78);
        uint64_t v89 = objc_msgSend_objectForKeyedSubscript_(v79, v80, v68, v81, v82, v83);
        if (!v89) {
          goto LABEL_23;
        }
        uint64_t v90 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v84, v85, v86, v87, v88);
        long long v100 = objc_msgSend_objectForKeyedSubscript_(v90, v91, v68, v92, v93, v94);
        if (!v100)
        {

LABEL_23:
LABEL_24:

LABEL_25:
          v189 = 0;
          goto LABEL_26;
        }
        long long v101 = objc_msgSend_substrokesByStrokeIdentifier(self, v95, v96, v97, v98, v99);
        id v106 = objc_msgSend_objectForKeyedSubscript_(v101, v102, v68, v103, v104, v105);
        BOOL v107 = v106 == 0;

        if (v107) {
          goto LABEL_25;
        }
        v113 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v108, v109, v110, v111, v112);
        v118 = objc_msgSend_objectForKeyedSubscript_(v113, v114, v68, v115, v116, v117);
        objc_msgSend_setObject_forKey_(v194, v119, (uint64_t)v118, v68, v120, v121);

        v127 = objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v122, v123, v124, v125, v126);
        v132 = objc_msgSend_objectForKeyedSubscript_(v127, v128, v68, v129, v130, v131);
        objc_msgSend_setObject_forKey_(v193, v133, (uint64_t)v132, v68, v134, v135);

        v141 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v136, v137, v138, v139, v140);
        v146 = objc_msgSend_objectForKeyedSubscript_(v141, v142, v68, v143, v144, v145);
        objc_msgSend_setObject_forKey_(v195, v147, (uint64_t)v146, v68, v148, v149);

        v155 = objc_msgSend_substrokesByStrokeIdentifier(self, v150, v151, v152, v153, v154);
        v160 = objc_msgSend_objectForKeyedSubscript_(v155, v156, v68, v157, v158, v159);
        objc_msgSend_setObject_forKey_(v196, v161, (uint64_t)v160, v68, v162, v163);
      }
      uint64_t v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v63, (uint64_t)&v204, (uint64_t)v209, 16, v67);
      if (v191) {
        continue;
      }
      break;
    }
  }

  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  v169 = objc_msgSend_nontextCandidates(self, v164, v165, v166, v167, v168);
  uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v170, (uint64_t)&v200, (uint64_t)v208, 16, v171);
  if (v177)
  {
    uint64_t v178 = *(void *)v201;
    do
    {
      for (uint64_t j = 0; j != v177; ++j)
      {
        if (*(void *)v201 != v178) {
          objc_enumerationMutation(v169);
        }
        v180 = *(void **)(*((void *)&v200 + 1) + 8 * j);
        v181 = objc_msgSend_strokeIdentifier(v180, v172, v173, v174, v175, v176);
        int v186 = objc_msgSend_containsObject_(v60, v182, (uint64_t)v181, v183, v184, v185);

        if (v186) {
          objc_msgSend_addObject_(v59, v172, (uint64_t)v180, v174, v175, v176);
        }
      }
      uint64_t v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v172, (uint64_t)&v200, (uint64_t)v208, 16, v176);
    }
    while (v177);
  }

  v187 = [CHStrokeClassificationResult alloc];
  v189 = objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(v187, v188, (uint64_t)v194, (uint64_t)v193, (uint64_t)v195, (uint64_t)v196, v59);
LABEL_26:

  return v189;
}

- (NSDictionary)strokeClassificationsByStrokeIdentifier
{
  return self->_strokeClassificationsByStrokeIdentifier;
}

- (NSDictionary)scriptClassificationsByStrokeIdentifier
{
  return self->_scriptClassificationsByStrokeIdentifier;
}

- (NSDictionary)scriptClassificationRawResultsByStrokeIdentifier
{
  return self->_scriptClassificationRawResultsByStrokeIdentifier;
}

- (NSDictionary)substrokesByStrokeIdentifier
{
  return self->_substrokesByStrokeIdentifier;
}

- (NSSet)nontextCandidates
{
  return self->_nontextCandidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nontextCandidates, 0);
  objc_storeStrong((id *)&self->_substrokesByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationRawResultsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptClassificationsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeClassificationsByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_textStrokeIdentifiers, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHMutableStrokeClassificationResult alloc];
  uint64_t v10 = objc_msgSend_strokeClassificationsByStrokeIdentifier(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_scriptClassificationsByStrokeIdentifier(self, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_scriptClassificationRawResultsByStrokeIdentifier(self, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_substrokesByStrokeIdentifier(self, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_nontextCandidates(self, v29, v30, v31, v32, v33);
  uint64_t v36 = objc_msgSend_initWithStrokeClassificationsByStrokeIdentifier_scriptClassificationsByStrokeIdentifier_scriptClassificationRawResultsByStrokeIdentifier_substrokesByStrokeIdentifier_nontextCandidates_(v4, v35, (uint64_t)v10, (uint64_t)v16, (uint64_t)v22, (uint64_t)v28, v34);

  return v36;
}

@end