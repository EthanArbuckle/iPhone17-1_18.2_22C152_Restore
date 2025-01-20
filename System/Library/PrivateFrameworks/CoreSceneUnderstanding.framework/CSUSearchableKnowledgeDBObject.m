@interface CSUSearchableKnowledgeDBObject
+ (id)fetchRequest;
+ (unint64_t)getUniqueDbId:(unint64_t)a3 idType:(signed __int16)a4;
- (BOOL)convertToEntity:(id *)a3 error:(id *)a4;
- (void)copyFromEntity:(id)a3;
@end

@implementation CSUSearchableKnowledgeDBObject

+ (id)fetchRequest
{
  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"CSUSearchableKnowledgeDBObject", v2, v3);
}

- (BOOL)convertToEntity:(id *)a3 error:(id *)a4
{
  v8 = objc_msgSend_localizedLabelDictionary(self, a2, (uint64_t)a3, (uint64_t)a4, v4);
  id v71 = 0;
  objc_msgSend_labelDictionaryFromString_directoryWriteBack_error_(CSUSearchableKnowledgeObject, v9, (uint64_t)v8, (uint64_t)&v71, (uint64_t)a4);
  id v10 = v71;

  if (v10)
  {
    v15 = objc_msgSend_localizedSynonymsDictionary(self, v11, v12, v13, v14);
    id v70 = 0;
    objc_msgSend_synonymsDictionaryFromLocaleString_directoryWriteBack_error_(CSUSearchableKnowledgeObject, v16, (uint64_t)v15, (uint64_t)&v70, (uint64_t)a4);
    id v17 = v70;

    BOOL v18 = v17 != 0;
    if (a3 && v17)
    {
      v69 = [CSUSearchableKnowledgeObject alloc];
      uint64_t v23 = objc_msgSend_qid(self, v19, v20, v21, v22);
      uint64_t v28 = objc_msgSend_idType(self, v24, v25, v26, v27);
      objc_msgSend_confidenceValue(self, v29, v30, v31, v32);
      double v34 = v33;
      uint64_t v39 = objc_msgSend_sensitiveLocation(self, v35, v36, v37, v38);
      v44 = objc_msgSend_category(self, v40, v41, v42, v43);
      v49 = objc_msgSend_vertical(self, v45, v46, v47, v48);
      objc_msgSend_longitude(self, v50, v51, v52, v53);
      double v55 = v54;
      objc_msgSend_latitude(self, v56, v57, v58, v59);
      double v61 = v60;
      int v68 = objc_msgSend_version(self, v62, v63, v64, v65);
      *a3 = (id)objc_msgSend_initWithQID_idType_localizedLabelDictionary_confidence_sensitiveLocation_category_vertical_localizedSynonymsDictionary_longitude_latitude_version_(v69, v66, v23, v28, (uint64_t)v10, v39, v44, v49, v34, v55, v61, v17, v68);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)copyFromEntity:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_qid(v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_idType(v4, v10, v11, v12, v13);
  uint64_t UniqueDbId_idType = objc_msgSend_getUniqueDbId_idType_(CSUSearchableKnowledgeDBObject, v15, v9, v14, v16);
  objc_msgSend_setDbUniqueId_(self, v18, UniqueDbId_idType, v19, v20);
  uint64_t v25 = objc_msgSend_qid(v4, v21, v22, v23, v24);
  objc_msgSend_setQid_(self, v26, v25, v27, v28);
  uint64_t v33 = objc_msgSend_idType(v4, v29, v30, v31, v32);
  objc_msgSend_setIdType_(self, v34, v33, v35, v36);
  objc_msgSend_confidenceValue(v4, v37, v38, v39, v40);
  objc_msgSend_setConfidenceValue_(self, v41, v42, v43, v44);
  uint64_t v49 = objc_msgSend_sensitiveLocation(v4, v45, v46, v47, v48);
  objc_msgSend_setSensitiveLocation_(self, v50, v49, v51, v52);
  uint64_t v57 = objc_msgSend_category(v4, v53, v54, v55, v56);
  objc_msgSend_setCategory_(self, v58, (uint64_t)v57, v59, v60);

  uint64_t v65 = objc_msgSend_vertical(v4, v61, v62, v63, v64);
  objc_msgSend_setVertical_(self, v66, (uint64_t)v65, v67, v68);

  objc_msgSend_longitude(v4, v69, v70, v71, v72);
  objc_msgSend_setLongitude_(self, v73, v74, v75, v76);
  objc_msgSend_latitude(v4, v77, v78, v79, v80);
  objc_msgSend_setLatitude_(self, v81, v82, v83, v84);
  uint64_t v89 = objc_msgSend_version(v4, v85, v86, v87, v88);
  objc_msgSend_setVersion_(self, v90, v89, v91, v92);
  v97 = objc_msgSend_localizedLabelDictionary(v4, v93, v94, v95, v96);
  objc_msgSend_stringFromLabelDictionary_(CSUSearchableKnowledgeObject, v98, (uint64_t)v97, v99, v100);
  id v116 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLocalizedLabelDictionary_(self, v101, (uint64_t)v116, v102, v103);
  v108 = objc_msgSend_localizedSynonymsDictionary(v4, v104, v105, v106, v107);

  v112 = objc_msgSend_stringFromSynonymsDictionary_(CSUSearchableKnowledgeObject, v109, (uint64_t)v108, v110, v111);

  objc_msgSend_setLocalizedSynonymsDictionary_(self, v113, (uint64_t)v112, v114, v115);
}

+ (unint64_t)getUniqueDbId:(unint64_t)a3 idType:(signed __int16)a4
{
  return 4 * a3 + a4;
}

@end