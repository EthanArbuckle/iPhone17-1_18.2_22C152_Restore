@interface IDSTapToRadarContext
- (BOOL)_isValidClassification:(id)a3;
- (BOOL)_isValidReproducibility:(id)a3;
- (IDSTapToRadarContext)initWithDictionary:(id)a3;
- (IDSTapToRadarContext)initWithTitle:(id)a3 problemDescription:(id)a4;
- (id)getTapToRadarURL;
@end

@implementation IDSTapToRadarContext

- (IDSTapToRadarContext)initWithTitle:(id)a3 problemDescription:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSTapToRadarContext;
  v9 = [(IDSTapToRadarContext *)&v14 init];
  if (v9)
  {
    v15[0] = @"Title";
    v15[1] = @"Description";
    v16[0] = v6;
    v16[1] = v7;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v16, v10, v15, 2);
    rawContext = v9->_rawContext;
    v9->_rawContext = (NSDictionary *)v11;
  }
  return v9;
}

- (IDSTapToRadarContext)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSTapToRadarContext;
  id v6 = [(IDSTapToRadarContext *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawContext, a3);
  }

  return v7;
}

- (id)getTapToRadarURL
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, a2, @"QueryParameter", v2);

  if (v4)
  {
    id v7 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v5, @"QueryParameter", v6);
    objc_msgSend_stringWithFormat_(NSString, v8, @"tap-to-radar://new%@", v9, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = objc_alloc(MEMORY[0x1E4F1CB10]);
    objc_super v14 = objc_msgSend_initWithString_(v11, v12, (uint64_t)v10, v13);
    goto LABEL_33;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F29088]);
  v114 = objc_msgSend_initWithString_(v15, v16, @"tap-to-radar://new", v17);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v19, @"ComponentID", v20);
  if (!v21) {
    goto LABEL_8;
  }
  v24 = (void *)v21;
  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v22, @"ComponentName", v23);
  if (!v25)
  {

    goto LABEL_8;
  }
  v28 = (void *)v25;
  v29 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v26, @"ComponentVersion", v27);

  if (!v29)
  {
LABEL_8:
    objc_msgSend_setObject_forKeyedSubscript_(v18, v22, @"629332", v23, @"ComponentID");
    objc_msgSend_setObject_forKeyedSubscript_(v18, v45, @"IDS", v46, @"ComponentName");
    objc_msgSend_setObject_forKeyedSubscript_(v18, v47, @"New Bugs", v48, @"ComponentVersion");
    goto LABEL_9;
  }
  v30 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v22, @"ComponentID", v23);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v31, (uint64_t)v30, v32, @"ComponentID");

  v35 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v33, @"ComponentName", v34);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v36, (uint64_t)v35, v37, @"ComponentName");

  v40 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v38, @"ComponentVersion", v39);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v41, (uint64_t)v40, v42, @"ComponentVersion");

LABEL_9:
  v51 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v43, @"Title", v44);
  if (v51)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v49, (uint64_t)v51, v52, @"Title");
  }
  else
  {
    v53 = NSString;
    v54 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C320], v49, v50, v52);
    v58 = objc_msgSend_productBuildVersion(v54, v55, v56, v57);
    v61 = objc_msgSend_stringWithFormat_(v53, v59, @"[%@] Tap-to-Radar: Internal IDS error detected", v60, v58);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v62, (uint64_t)v61, v63, @"Title");
  }
  uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v64, @"Description", v65);
  v69 = (void *)v66;
  if (v66) {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v67, v66, v68, @"Description");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v67, @"An internal IDS error was detected; please ensure that a sysdiagnose is attached.",
  }
      v68,
      @"Description");

  uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v70, @"Classification", v71);
  if (v73 && objc_msgSend__isValidClassification_(self, v72, v73, v74)) {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v72, v73, v74, @"Classification");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v72, @"Serious Bug", v74, @"Classification");
  }
  objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v75, @"Reproducibility", v76);
  v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v80 = @"I Didn't Try";
  if (v78 && objc_msgSend__isValidReproducibility_(self, v77, (uint64_t)v78, v79)) {
    v80 = v78;
  }
  v113 = (void *)v73;
  objc_msgSend_setObject_forKeyedSubscript_(v18, v77, (uint64_t)v80, v79, @"Reproducibility");
  uint64_t v83 = objc_msgSend_objectForKeyedSubscript_(self->_rawContext, v81, @"Keywords", v82);
  v86 = (void *)v83;
  if (v83) {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v84, v83, v85, @"Keywords");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v84, @"212336", v85, @"Keywords");
  }

  v90 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v87, v88, v89);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v10 = v18;
  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v91, (uint64_t)&v115, v92, v119, 16);
  if (v93)
  {
    uint64_t v96 = v93;
    uint64_t v97 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v116 != v97) {
          objc_enumerationMutation(v10);
        }
        uint64_t v99 = *(void *)(*((void *)&v115 + 1) + 8 * i);
        v100 = (void *)MEMORY[0x1E4F290C8];
        v101 = objc_msgSend_objectForKeyedSubscript_(v10, v94, v99, v95);
        v104 = objc_msgSend_queryItemWithName_value_(v100, v102, v99, v103, v101);
        objc_msgSend_addObject_(v90, v105, (uint64_t)v104, v106);
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v94, (uint64_t)&v115, v95, v119, 16);
    }
    while (v96);
  }

  id v7 = v114;
  objc_msgSend_setQueryItems_(v114, v107, (uint64_t)v90, v108);
  objc_super v14 = objc_msgSend_URL(v114, v109, v110, v111);

LABEL_33:
  return v14;
}

- (BOOL)_isValidClassification:(id)a3
{
  return objc_msgSend_containsObject_(&unk_1EF0294D0, a2, (uint64_t)a3, v3);
}

- (BOOL)_isValidReproducibility:(id)a3
{
  return objc_msgSend_containsObject_(&unk_1EF0294E8, a2, (uint64_t)a3, v3);
}

- (void).cxx_destruct
{
}

@end