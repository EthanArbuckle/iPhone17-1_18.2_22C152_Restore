@interface CHCTLD
- (CHCTLD)init;
- (CHCTLD)initWithType:(unint64_t)a3;
- (CRCTLD)ctld;
- (CRCTLDConfig)ctldConfig;
- (id)mergeStrokeGroups:(id)a3;
- (id)orderStrokeGroups:(id)a3;
- (id)reflowableLineRegions:(id)a3;
- (id)strokeGroupRegions:(id)a3;
- (void)setCtld:(id)a3;
- (void)setCtldConfig:(id)a3;
@end

@implementation CHCTLD

- (CHCTLD)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHCTLD;
  v2 = [(CHCTLD *)&v8 init];
  if (v2)
  {
    v3 = (CRCTLD *)objc_alloc_init(MEMORY[0x1E4FAF110]);
    ctld = v2->_ctld;
    v2->_ctld = v3;

    uint64_t v5 = sub_1C4A575A4(0);
    ctldConfig = v2->_ctldConfig;
    v2->_ctldConfig = (CRCTLDConfig *)v5;
  }
  return v2;
}

- (CHCTLD)initWithType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CHCTLD;
  v4 = [(CHCTLD *)&v10 init];
  if (v4)
  {
    uint64_t v5 = (CRCTLD *)objc_alloc_init(MEMORY[0x1E4FAF110]);
    ctld = v4->_ctld;
    v4->_ctld = v5;

    uint64_t v7 = sub_1C4A575A4(a3);
    ctldConfig = v4->_ctldConfig;
    v4->_ctldConfig = (CRCTLDConfig *)v7;
  }
  return v4;
}

- (id)orderStrokeGroups:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v5;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, (uint64_t)v33, 16, v14);
  if (v20)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v12);
        }
        v23 = objc_msgSend_subregions(*(void **)(*((void *)&v29 + 1) + 8 * i), v15, v16, v17, v18, v19, (void)v29);
        objc_msgSend_addObjectsFromArray_(v11, v24, (uint64_t)v23, v25, v26, v27);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, (uint64_t)v33, 16, v19);
    }
    while (v20);
  }

  return v11;
}

- (id)strokeGroupRegions:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v5;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, (uint64_t)v33, 16, v14);
  if (v20)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v12);
        }
        v23 = objc_msgSend_subregions(*(void **)(*((void *)&v29 + 1) + 8 * i), v15, v16, v17, v18, v19, (void)v29);
        objc_msgSend_addObject_(v11, v24, (uint64_t)v23, v25, v26, v27);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, (uint64_t)v33, 16, v19);
    }
    while (v20);
  }

  return v11;
}

- (id)reflowableLineRegions:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9, v10);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v5;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, (uint64_t)v33, 16, v14);
  if (v20)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v12);
        }
        v23 = objc_msgSend_subregions(*(void **)(*((void *)&v29 + 1) + 8 * i), v15, v16, v17, v18, v19, (void)v29);
        objc_msgSend_addObject_(v11, v24, (uint64_t)v23, v25, v26, v27);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, (uint64_t)v33, 16, v19);
    }
    while (v20);
  }

  return v11;
}

- (id)mergeStrokeGroups:(id)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  v99 = objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7, v8, v9);
  id v100 = (id)objc_claimAutoreleasedReturnValue();
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  obuint64_t j = v99;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v108, (uint64_t)v113, 16, v11);
  if (v12)
  {
    uint64_t v102 = *(void *)v109;
    do
    {
      uint64_t v103 = v12;
      for (uint64_t i = 0; i != v103; ++i)
      {
        if (*(void *)v109 != v102) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        uint64_t v20 = objc_msgSend_subregions(v19, v13, v14, v15, v16, v17);
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v104, (uint64_t)v112, 16, v22);
        if (v28)
        {
          id v29 = 0;
          uint64_t v30 = *(void *)v105;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              while (1)
              {
                if (*(void *)v105 != v30) {
                  objc_enumerationMutation(v20);
                }
                long long v32 = *(void **)(*((void *)&v104 + 1) + 8 * j);
                if (v29) {
                  break;
                }
                id v29 = v32;
                if (v28 == ++j) {
                  goto LABEL_14;
                }
              }
              v33 = objc_msgSend_strokeIdentifiers(*(void **)(*((void *)&v104 + 1) + 8 * j), v23, v24, v25, v26, v27);
              v39 = objc_msgSend_firstStrokeIdentifier(v29, v34, v35, v36, v37, v38);
              v45 = objc_msgSend_lastStrokeIdentifier(v32, v40, v41, v42, v43, v44);
              objc_msgSend_bounds(v29, v46, v47, v48, v49, v50);
              CGFloat v52 = v51;
              CGFloat v54 = v53;
              CGFloat v56 = v55;
              CGFloat v58 = v57;
              objc_msgSend_bounds(v32, v59, v60, v61, v62, v63);
              v118.origin.double x = v64;
              v118.origin.double y = v65;
              v118.size.double width = v66;
              v118.size.double height = v67;
              v116.origin.double x = v52;
              v116.origin.double y = v54;
              v116.size.double width = v56;
              v116.size.double height = v58;
              CGRect v117 = CGRectUnion(v116, v118);
              double x = v117.origin.x;
              double y = v117.origin.y;
              double width = v117.size.width;
              double height = v117.size.height;
              uint64_t v77 = objc_msgSend_classification(v29, v72, v73, v74, v75, v76);
              objc_msgSend_groupingConfidence(v29, v78, v79, v80, v81, v82);
              double v84 = v83;
              objc_msgSend_firstStrokeOrigin(v29, v85, v86, v87, v88, v89);
              uint64_t v93 = objc_msgSend_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_(v29, v90, (uint64_t)v33, 0, (uint64_t)v39, (uint64_t)v45, v77, x, y, width, height, v84, v91, v92);

              id v29 = (id)v93;
            }
LABEL_14:
            uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v104, (uint64_t)v112, 16, v27);
          }
          while (v28);

          if (v29) {
            objc_msgSend_addObject_(v100, v94, (uint64_t)v29, v95, v96, v97);
          }
        }
        else
        {

          id v29 = 0;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v108, (uint64_t)v113, 16, v17);
    }
    while (v12);
  }

  return v100;
}

- (CRCTLD)ctld
{
  return (CRCTLD *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCtld:(id)a3
{
}

- (CRCTLDConfig)ctldConfig
{
  return (CRCTLDConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCtldConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctldConfig, 0);
  objc_storeStrong((id *)&self->_ctld, 0);
}

@end