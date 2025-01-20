@interface GDEntityResolutionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)includeFeatures;
- (BOOL)includeInferredNames;
- (GDEntityResolutionRequest)initWithCoder:(id)a3;
- (GDEntityResolutionRequest)initWithKgq:(id)a3 mode:(int64_t)a4;
- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5;
- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6;
- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6 includeInferredNames:(BOOL)a7;
- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 mode:(int64_t)a5;
- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6;
- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 spans:(id)a5 mode:(int64_t)a6 includeFeatures:(BOOL)a7;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 includeInferredNames:(BOOL)a6;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 includeInferredNames:(BOOL)a8;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 kgq:(id)a8;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9 includeFeatures:(BOOL)a10;
- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9 includeFeatures:(BOOL)a10 includeInferredNames:(BOOL)a11;
- (NSArray)entityClassFilter;
- (NSArray)sourceIDs;
- (NSArray)spans;
- (NSString)kgq;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)constraint;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntityResolutionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kgq, 0);
  objc_storeStrong((id *)&self->_sourceIDs, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_entityClassFilter, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (BOOL)includeInferredNames
{
  return self->_includeInferredNames;
}

- (BOOL)includeFeatures
{
  return self->_includeFeatures;
}

- (NSString)kgq
{
  return self->_kgq;
}

- (NSArray)sourceIDs
{
  return self->_sourceIDs;
}

- (int64_t)constraint
{
  return self->_constraint;
}

- (int64_t)mode
{
  return self->_mode;
}

- (NSArray)spans
{
  return self->_spans;
}

- (NSArray)entityClassFilter
{
  return self->_entityClassFilter;
}

- (NSString)text
{
  return self->_text;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  BOOL includeFeatures = self->_includeFeatures;
  return (id)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_(v9, v10, (uint64_t)self->_text, (uint64_t)self->_entityClassFilter, (uint64_t)self->_spans, self->_mode, self->_constraint, self->_sourceIDs, self->_kgq, includeFeatures);
}

- (GDEntityResolutionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_text);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9
    || (objc_msgSend_error(v4, v10, v11, v12, v13),
        v59 = objc_claimAutoreleasedReturnValue(),
        v59,
        !v59))
  {
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v19, v16, 0);
    v21 = NSStringFromSelector(sel_entityClassFilter);
    v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21, v23);

    if (!v24)
    {
      v61 = objc_msgSend_error(v4, v25, v26, v27, v28);

      if (v61)
      {
        v60 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    v35 = objc_msgSend_setWithObjects_(v29, v32, v30, v33, v34, v31, 0);
    v36 = NSStringFromSelector(sel_spans);
    v39 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v35, (uint64_t)v36, v38);

    if (!v39)
    {
      v77 = objc_msgSend_error(v4, v40, v41, v42, v43);

      if (v77) {
        goto LABEL_16;
      }
    }
    v44 = NSStringFromSelector(sel_mode);
    int v48 = objc_msgSend_containsValueForKey_(v4, v45, (uint64_t)v44, v46, v47);

    if (v48)
    {
      v49 = NSStringFromSelector(sel_mode);
      uint64_t v53 = objc_msgSend_decodeIntegerForKey_(v4, v50, (uint64_t)v49, v51, v52);

      v58 = objc_msgSend_error(v4, v54, v55, v56, v57);

      if (v58)
      {
LABEL_16:
        v60 = 0;
        goto LABEL_29;
      }
      v128 = self;
    }
    else
    {
      v128 = self;
      uint64_t v53 = 0;
    }
    v62 = NSStringFromSelector(sel_constraint);
    int v66 = objc_msgSend_containsValueForKey_(v4, v63, (uint64_t)v62, v64, v65);

    if (v66)
    {
      v67 = NSStringFromSelector(sel_constraint);
      uint64_t v71 = objc_msgSend_decodeIntegerForKey_(v4, v68, (uint64_t)v67, v69, v70);

      v76 = objc_msgSend_error(v4, v72, v73, v74, v75);

      if (v76)
      {
        v60 = 0;
        self = v128;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v71 = 0;
    }
    v78 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = objc_opt_class();
    v84 = objc_msgSend_setWithObjects_(v78, v81, v79, v82, v83, v80, 0);
    v85 = NSStringFromSelector(sel_sourceIDs);
    v88 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v84, (uint64_t)v85, v87);

    if (v88
      || (objc_msgSend_error(v4, v89, v90, v91, v92),
          v123 = objc_claimAutoreleasedReturnValue(),
          v123,
          !v123))
    {
      uint64_t v93 = objc_opt_class();
      v94 = NSStringFromSelector("kgq");
      v97 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v95, v93, (uint64_t)v94, v96);

      if (!v97)
      {
        v124 = objc_msgSend_error(v4, v98, v99, v100, v101);

        if (v124) {
          goto LABEL_26;
        }
      }
      uint64_t v102 = v71;
      v103 = NSStringFromSelector(sel_includeFeatures);
      char v107 = objc_msgSend_decodeBoolForKey_(v4, v104, (uint64_t)v103, v105, v106);

      v112 = objc_msgSend_error(v4, v108, v109, v110, v111);

      if (v112
        || (NSStringFromSelector(sel_includeInferredNames),
            v113 = objc_claimAutoreleasedReturnValue(),
            char v127 = objc_msgSend_decodeBoolForKey_(v4, v114, (uint64_t)v113, v115, v116),
            v113,
            objc_msgSend_error(v4, v117, v118, v119, v120),
            v121 = objc_claimAutoreleasedReturnValue(),
            v121,
            v121))
      {
LABEL_26:
        v60 = 0;
      }
      else
      {
        BYTE1(v126) = v127;
        LOBYTE(v126) = v107;
        v60 = (GDEntityResolutionRequest *)(id)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(v128, v122, (uint64_t)v9, (uint64_t)v24, (uint64_t)v39, v53, v102, v88, v97, v126);
        v128 = v60;
      }
    }
    else
    {
      v60 = 0;
    }
    self = v128;

    goto LABEL_29;
  }
  v60 = 0;
LABEL_31:

  return v60;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_text);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)text, (uint64_t)v6, v8);

  entityClassFilter = self->_entityClassFilter;
  v10 = NSStringFromSelector(sel_entityClassFilter);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)entityClassFilter, (uint64_t)v10, v12);

  spans = self->_spans;
  v14 = NSStringFromSelector(sel_spans);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)spans, (uint64_t)v14, v16);

  int64_t mode = self->_mode;
  uint64_t v18 = NSStringFromSelector(sel_mode);
  objc_msgSend_encodeInteger_forKey_(v5, v19, mode, (uint64_t)v18, v20);

  int64_t constraint = self->_constraint;
  v22 = NSStringFromSelector(sel_constraint);
  objc_msgSend_encodeInteger_forKey_(v5, v23, constraint, (uint64_t)v22, v24);

  sourceIDs = self->_sourceIDs;
  uint64_t v26 = NSStringFromSelector(sel_sourceIDs);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)sourceIDs, (uint64_t)v26, v28);

  kgq = self->_kgq;
  uint64_t v30 = NSStringFromSelector("kgq");
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)kgq, (uint64_t)v30, v32);

  BOOL includeFeatures = self->_includeFeatures;
  uint64_t v34 = NSStringFromSelector(sel_includeFeatures);
  objc_msgSend_encodeBool_forKey_(v5, v35, includeFeatures, (uint64_t)v34, v36);

  BOOL includeInferredNames = self->_includeInferredNames;
  NSStringFromSelector(sel_includeInferredNames);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v38, includeInferredNames, (uint64_t)v40, v39);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 kgq:(id)a8
{
  __int16 v9 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0, a8, v9);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5
{
  __int16 v6 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, 0, a3, v6);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 mode:(int64_t)a4
{
  __int16 v5 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, 0, 0, 0, a4, 0, 0, a3, v5);
}

- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 mode:(int64_t)a5
{
  __int16 v6 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, a3, 0, v6);
}

- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, a3, 0, a6);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9
{
  __int16 v10 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0, 0, v10);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, 0, a3, a6);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7
{
  __int16 v8 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0, 0, v8);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5
{
  __int16 v6 = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, 0, 0, 0, v6);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9 includeFeatures:(BOOL)a10
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10);
}

- (GDEntityResolutionRequest)initWithKgq:(id)a3 text:(id)a4 mode:(int64_t)a5 includeFeatures:(BOOL)a6 includeInferredNames:(BOOL)a7
{
  HIBYTE(v8) = a7;
  LOBYTE(v8) = a6;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, 0, a5, 0, 0, a3, v8);
}

- (GDEntityResolutionRequest)initWithSourceIDs:(id)a3 text:(id)a4 spans:(id)a5 mode:(int64_t)a6 includeFeatures:(BOOL)a7
{
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a4, 0, (uint64_t)a5, a6, 0, a3, 0, a7);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 includeInferredNames:(BOOL)a8
{
  HIBYTE(v9) = a8;
  LOBYTE(v9) = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, 0, 0, v9);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 includeInferredNames:(BOOL)a6
{
  HIBYTE(v7) = a6;
  LOBYTE(v7) = 0;
  return (GDEntityResolutionRequest *)objc_msgSend_initWithText_entityClassFilter_spans_mode_constraint_sourceIDs_kgq_includeFeatures_includeInferredNames_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, 0, 0, 0, v7);
}

- (GDEntityResolutionRequest)initWithText:(id)a3 entityClassFilter:(id)a4 spans:(id)a5 mode:(int64_t)a6 constraint:(int64_t)a7 sourceIDs:(id)a8 kgq:(id)a9 includeFeatures:(BOOL)a10 includeInferredNames:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  v54.receiver = self;
  v54.super_class = (Class)GDEntityResolutionRequest;
  uint64_t v26 = [(GDEntityResolutionRequest *)&v54 init];
  if (v26)
  {
    uint64_t v27 = objc_msgSend_copy(v17, v22, v23, v24, v25);
    text = v26->_text;
    v26->_text = (NSString *)v27;

    uint64_t v33 = objc_msgSend_copy(v18, v29, v30, v31, v32);
    entityClassFilter = v26->_entityClassFilter;
    v26->_entityClassFilter = (NSArray *)v33;

    uint64_t v39 = objc_msgSend_copy(v19, v35, v36, v37, v38);
    spans = v26->_spans;
    v26->_spans = (NSArray *)v39;

    v26->_int64_t mode = a6;
    v26->_int64_t constraint = a7;
    uint64_t v45 = objc_msgSend_copy(v20, v41, v42, v43, v44);
    sourceIDs = v26->_sourceIDs;
    v26->_sourceIDs = (NSArray *)v45;

    uint64_t v51 = objc_msgSend_copy(v21, v47, v48, v49, v50);
    kgq = v26->_kgq;
    v26->_kgq = (NSString *)v51;

    v26->_BOOL includeFeatures = a10;
    v26->_BOOL includeInferredNames = a11;
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end