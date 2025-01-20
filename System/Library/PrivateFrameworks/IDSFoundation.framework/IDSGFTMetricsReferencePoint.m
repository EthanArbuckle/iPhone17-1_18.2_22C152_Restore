@interface IDSGFTMetricsReferencePoint
- (IDSGFTMetricsReferencePoint)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6;
- (NSString)fromType;
- (id)collectForTimeBase:(double)a3 anonymize:(BOOL)a4;
- (id)description;
- (id)fromUniqueID;
- (id)instanceForID:(id)a3;
- (void)event:(id)a3;
- (void)event:(id)a3 time:(double)a4;
- (void)event:(id)a3 uniqueID:(id)a4;
- (void)event:(id)a3 uniqueID:(id)a4 reason:(id)a5;
- (void)event:(id)a3 uniqueID:(id)a4 reason:(id)a5 time:(double)a6;
- (void)event:(id)a3 uniqueID:(id)a4 time:(double)a5;
- (void)setFromType:(id)a3;
- (void)setFromUniqueID:(id)a3;
@end

@implementation IDSGFTMetricsReferencePoint

- (IDSGFTMetricsReferencePoint)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IDSGFTMetricsReferencePoint;
  v15 = [(IDSGFTMetricsReferencePoint *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromType, a3);
    objc_storeStrong(&v16->_fromUniqueID, a4);
    objc_storeStrong((id *)&v16->_anonymizer, a5);
    objc_storeStrong((id *)&v16->_template, a6);
    uint64_t v20 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v17, v18, v19);
    attributes = v16->_attributes;
    v16->_attributes = (NSMutableDictionary *)v20;

    uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v22, v23, v24);
    times = v16->_times;
    v16->_times = (NSMutableDictionary *)v25;

    v16->_lock._os_unfair_lock_opaque = 0;
    v27 = v16;
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<IDSGFTMetricsReferencePoint %@(%@) %@>", *(double *)&self->_fromType, self->_fromType, self->_fromUniqueID, self->_times);
}

- (id)instanceForID:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], v4, v5, v7);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  id v12 = objc_msgSend_objectForKeyedSubscript_(self->_times, v8, (uint64_t)v6, v9);
  if (!v12)
  {
    id v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v13);
    objc_msgSend_setObject_forKeyedSubscript_(self->_times, v14, (uint64_t)v12, v15, v6);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (void)event:(id)a3
{
  objc_msgSend_event_uniqueID_reason_(self, a2, (uint64_t)a3, v3, &stru_1EEFDAD58, &unk_1EF028DE0);
}

- (void)event:(id)a3 time:(double)a4
{
}

- (void)event:(id)a3 uniqueID:(id)a4
{
  objc_msgSend_event_uniqueID_reason_(self, a2, (uint64_t)a3, v4, a4, &unk_1EF028DE0);
}

- (void)event:(id)a3 uniqueID:(id)a4 time:(double)a5
{
}

- (void)event:(id)a3 uniqueID:(id)a4 reason:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  double v10 = ids_monotonic_time();
  objc_msgSend_event_uniqueID_reason_time_(self, v11, (uint64_t)v12, v10, v9, v8);
}

- (void)event:(id)a3 uniqueID:(id)a4 reason:(id)a5 time:(double)a6
{
  id v27 = a3;
  id v10 = a5;
  double v13 = objc_msgSend_instanceForID_(self, v11, (uint64_t)a4, v12);
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  v17 = objc_msgSend_objectForKeyedSubscript_(v13, v15, (uint64_t)v27, v16);

  if (!v17)
  {
    uint64_t v18 = [IDSGFTMetricsReferencePointEvent alloc];
    v21 = objc_msgSend_numberWithDouble_(NSNumber, v19, v20, a6);
    double v24 = objc_msgSend_initWithTime_reason_(v18, v22, (uint64_t)v21, v23, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, v26, v27);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)collectForTimeBase:(double)a3 anonymize:(BOOL)a4
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a4, a3);
  id v101 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceTimeForTimeBase_(self, v6, v7, a3);
  double v9 = v8;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  obj = self->_times;
  uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v110, v11, v117, 16);
  if (v102)
  {
    uint64_t v99 = *(void *)v111;
    unint64_t v15 = 0x1E4F29000uLL;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v111 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v110 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend_mutableCopy(self->_template, v12, v13, v14);
        objc_msgSend_addEntriesFromDictionary_(v18, v19, (uint64_t)self->_attributes, v20);
        uint64_t v103 = v16;
        if (a4)
        {
          double v23 = objc_msgSend_anonymizeID_(self->_anonymizer, v21, (uint64_t)self->_fromUniqueID, v22);
          objc_msgSend_setObject_forKeyedSubscript_(v18, v24, (uint64_t)v23, v25, @"fromID");

          v28 = objc_msgSend_anonymizeID_(self->_anonymizer, v26, v17, v27);
          objc_msgSend_setObject_forKeyedSubscript_(v18, v29, (uint64_t)v28, v30, @"toID");
        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(v18, v21, (uint64_t)self->_fromUniqueID, v22, @"fromID");
          objc_msgSend_setObject_forKeyedSubscript_(v18, v34, v17, v35, @"toID");
        }
        v36 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v31, v32, v33);
        objc_msgSend_setObject_forKeyedSubscript_(v18, v37, (uint64_t)v36, v38, @"events");

        v41 = objc_msgSend_objectForKeyedSubscript_(self->_times, v39, v17, v40);
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v106, 0.0, v116, 16);
        if (v105)
        {
          uint64_t v104 = *(void *)v107;
          do
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v107 != v104) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v106 + 1) + 8 * v45);
              v47 = objc_msgSend_objectForKeyedSubscript_(v41, v43, v46, v44);
              v51 = objc_msgSend_time(v47, v48, v49, v50);
              objc_msgSend_doubleValue(v51, v52, v53, v54);
              double v56 = round((v55 - v9) * 1000.0 / 5.0) * 5.0;

              v59 = objc_msgSend_stringWithFormat_(*(void **)(v15 + 24), v57, @"%@.%@", v58, self->_fromType, v46);
              v114[0] = @"name";
              v114[1] = @"interval";
              v115[0] = v59;
              objc_msgSend_numberWithDouble_(NSNumber, v60, v61, v56);
              v63 = v62 = self;
              v115[1] = v63;
              v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v64, (uint64_t)v115, v65, v114, 2);

              v69 = objc_msgSend_objectForKeyedSubscript_(v18, v67, @"events", v68);
              objc_msgSend_addObject_(v69, v70, (uint64_t)v66, v71);

              v74 = objc_msgSend_objectForKeyedSubscript_(v41, v72, v46, v73);
              objc_msgSend_reason(v74, v75, v76, v77);
              v79 = v78 = v18;
              int v83 = objc_msgSend_intValue(v79, v80, v81, v82);

              if (v83)
              {
                v86 = objc_msgSend_stringWithFormat_(NSString, v84, @"%@.%@-reason", v85, v62->_fromType, v46);
                v89 = objc_msgSend_objectForKeyedSubscript_(v41, v87, v46, v88);
                v93 = objc_msgSend_reason(v89, v90, v91, v92);
                objc_msgSend_setObject_forKeyedSubscript_(v78, v94, (uint64_t)v93, v95, v86);
              }
              ++v45;
              self = v62;
              unint64_t v15 = 0x1E4F29000;
              uint64_t v18 = v78;
            }
            while (v105 != v45);
            uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v106, v44, v116, 16);
          }
          while (v105);
        }
        objc_msgSend_addObject_(v101, v43, (uint64_t)v18, v44);

        uint64_t v16 = v103 + 1;
      }
      while (v103 + 1 != v102);
      uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v110, v14, v117, 16);
    }
    while (v102);
  }

  os_unfair_lock_unlock(lock);
  return v101;
}

- (NSString)fromType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFromType:(id)a3
{
}

- (id)fromUniqueID
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setFromUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fromUniqueID, 0);
  objc_storeStrong((id *)&self->_fromType, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_anonymizer, 0);
  objc_storeStrong((id *)&self->_times, 0);
}

@end