@interface CSUSearchableKnowledgeObject
+ (BOOL)labelDictionaryFromString:(id)a3 directoryWriteBack:(id *)a4 error:(id *)a5;
+ (BOOL)synonymsDictionaryFromLocaleString:(id)a3 directoryWriteBack:(id *)a4 error:(id *)a5;
+ (id)searchDictionary:(id)a3 withLocale:(id)a4;
+ (id)stringFromLabelDictionary:(id)a3;
+ (id)stringFromSynonymsDictionary:(id)a3;
- (BOOL)sensitiveLocation;
- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabel:(id)a5 confidence:(double)a6 sensitiveLation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonyms:(id)a10 longitude:(double)a11 latitute:(double)a12 version:(int)a13 locale:(id)a14;
- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabel:(id)a5 confidence:(double)a6 sensitiveLocation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonyms:(id)a10 longitude:(double)a11 latitute:(double)a12 version:(int)a13;
- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabelDictionary:(id)a5 confidence:(double)a6 sensitiveLocation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonymsDictionary:(id)a10 longitude:(double)a11 latitude:(double)a12 version:(int)a13;
- (NSMutableDictionary)localizedLabelDictionary;
- (NSMutableDictionary)localizedSynonyms;
- (NSMutableDictionary)localizedSynonymsDictionary;
- (NSString)category;
- (NSString)localizedLabel;
- (NSString)vertical;
- (double)confidenceValue;
- (double)latitude;
- (double)longitude;
- (id)localizedLabelWithLocale:(id)a3;
- (id)localizedSynonymsWithLocale:(id)a3;
- (int)version;
- (signed)idType;
- (unint64_t)qid;
- (void)setLocalizedLabel:(id)a3 forLocale:(id)a4;
- (void)setLocalizedSynonyms:(id)a3 forLocale:(id)a4;
@end

@implementation CSUSearchableKnowledgeObject

- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabel:(id)a5 confidence:(double)a6 sensitiveLocation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonyms:(id)a10 longitude:(double)a11 latitute:(double)a12 version:(int)a13
{
  BOOL v17 = a7;
  uint64_t v19 = a4;
  v42[1] = *MEMORY[0x263EF8340];
  id v38 = a5;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = objc_alloc(MEMORY[0x263EFF960]);
  v29 = objc_msgSend_initWithLocaleIdentifier_(v25, v26, @"en_US", v27, v28);
  v41 = v29;
  v42[0] = v38;
  v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v42, (uint64_t)&v41, 1);
  v39 = v29;
  id v40 = v24;
  v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)&v40, (uint64_t)&v39, 1);
  v35 = (CSUSearchableKnowledgeObject *)objc_msgSend_initWithQID_idType_localizedLabelDictionary_confidence_sensitiveLocation_category_vertical_localizedSynonymsDictionary_longitude_latitude_version_(self, v34, a3, v19, (uint64_t)v31, v17, v22, v23, a6, a11, a12, v33, a13);

  return v35;
}

- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabel:(id)a5 confidence:(double)a6 sensitiveLation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonyms:(id)a10 longitude:(double)a11 latitute:(double)a12 version:(int)a13 locale:(id)a14
{
  BOOL v18 = a7;
  uint64_t v20 = a4;
  v40[1] = *MEMORY[0x263EF8340];
  id v23 = a5;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a14;
  id v39 = v27;
  v40[0] = v23;
  v36 = v23;
  v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v40, (uint64_t)&v39, 1);
  id v37 = v27;
  id v38 = v26;
  v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)&v38, (uint64_t)&v37, 1);
  v33 = (CSUSearchableKnowledgeObject *)objc_msgSend_initWithQID_idType_localizedLabelDictionary_confidence_sensitiveLocation_category_vertical_localizedSynonymsDictionary_longitude_latitude_version_(self, v32, a3, v20, (uint64_t)v29, v18, v24, v25, a6, a11, a12, v31, a13);

  return v33;
}

- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabelDictionary:(id)a5 confidence:(double)a6 sensitiveLocation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonymsDictionary:(id)a10 longitude:(double)a11 latitude:(double)a12 version:(int)a13
{
  id v22 = a5;
  id v43 = a8;
  id v23 = a9;
  id v24 = a10;
  v44.receiver = self;
  v44.super_class = (Class)CSUSearchableKnowledgeObject;
  id v25 = [(CSUSearchableKnowledgeObject *)&v44 init];
  id v26 = v25;
  if (v25)
  {
    v25->_idType = a4;
    localizedLabel = v25->_localizedLabel;
    v25->_qid = a3;
    v25->_localizedLabel = 0;

    uint64_t v32 = objc_msgSend_copy(v22, v28, v29, v30, v31);
    localizedLabelDictionary = v26->_localizedLabelDictionary;
    v26->_localizedLabelDictionary = (NSMutableDictionary *)v32;

    v26->_confidenceValue = a6;
    v26->_sensitiveLocation = a7;
    objc_storeStrong((id *)&v26->_category, a8);
    objc_storeStrong((id *)&v26->_vertical, a9);
    localizedSynonyms = v26->_localizedSynonyms;
    v26->_localizedSynonyms = 0;

    uint64_t v39 = objc_msgSend_copy(v24, v35, v36, v37, v38);
    localizedSynonymsDictionary = v26->_localizedSynonymsDictionary;
    v26->_localizedSynonymsDictionary = (NSMutableDictionary *)v39;

    v26->_longitude = a11;
    v26->_latitude = a12;
    v26->_version = a13;
    v41 = v26;
  }

  return v26;
}

+ (BOOL)labelDictionaryFromString:(id)a3 directoryWriteBack:(id *)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v48 = a3;
  if (a4)
  {
    v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v6, v7, v8, v9);
    v46 = a4;
    objc_msgSend_componentsSeparatedByString_(v48, v11, @";", v12, v13);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v14);
          }
          id v22 = objc_msgSend_componentsSeparatedByString_(*(void **)(*((void *)&v49 + 1) + 8 * i), v16, @":", v17, v18);
          if (objc_msgSend_count(v22, v23, v24, v25, v26) != 2)
          {
            id v43 = objc_msgSend_errorForDictionaryDeserialization_(CSUError, v27, @"Corrupted dictionary", v28, v29);
            objc_super v44 = v43;
            if (a5) {
              *a5 = v43;
            }

            BOOL v42 = 0;
            goto LABEL_14;
          }
          uint64_t v30 = (void *)MEMORY[0x263EFF960];
          uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v22, v27, 0, v28, v29);
          v35 = objc_msgSend_localeWithLocaleIdentifier_(v30, v32, (uint64_t)v31, v33, v34);

          uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v22, v36, 1, v37, v38);
          objc_msgSend_setObject_forKeyedSubscript_(v10, v40, (uint64_t)v39, (uint64_t)v35, v41);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v49, (uint64_t)v53, 16);
        if (v19) {
          continue;
        }
        break;
      }
    }

    id *v46 = v10;
    BOOL v42 = 1;
LABEL_14:
  }
  else
  {
    BOOL v42 = 0;
  }

  return v42;
}

+ (id)stringFromLabelDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v35 = a3;
  uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF980], v3, v4, v5, v6);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v35;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_localeIdentifier(v17, v10, v11, v12, v13);
        id v22 = objc_msgSend_objectForKeyedSubscript_(v8, v19, (uint64_t)v17, v20, v21);
        uint64_t v26 = objc_msgSend_stringWithFormat_(NSString, v23, @"%@%@%@", v24, v25, v18, @":", v22);
        objc_msgSend_addObject_(v7, v27, (uint64_t)v26, v28, v29);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v14);
  }

  uint64_t v33 = objc_msgSend_componentsJoinedByString_(v7, v30, @"", v31, v32);;

  return v33;
}

+ (BOOL)synonymsDictionaryFromLocaleString:(id)a3 directoryWriteBack:(id *)a4 error:(id *)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v56 = a3;
  uint64_t v54 = a4;
  if (a4)
  {
    objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v6, v7, v8, v9);
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByString_(v56, v10, @";", v11, v12);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v59, (uint64_t)v63, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v60 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = objc_msgSend_componentsSeparatedByString_(*(void **)(*((void *)&v59 + 1) + 8 * i), v14, @":", v15, v16);
          if (objc_msgSend_count(v20, v21, v22, v23, v24) != 2)
          {
            objc_msgSend_errorForDictionaryDeserialization_(CSUError, v25, @"Corrupted dictionary", v26, v27);
            long long v52 = (id *)objc_claimAutoreleasedReturnValue();
            a4 = v52;
            if (a5) {
              *a5 = v52;
            }

            LOBYTE(a4) = 0;
            goto LABEL_14;
          }
          id v28 = objc_alloc(MEMORY[0x263EFF960]);
          uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v20, v29, 0, v30, v31);
          long long v36 = objc_msgSend_initWithLocaleIdentifier_(v28, v33, (uint64_t)v32, v34, v35);

          long long v37 = (void *)MEMORY[0x263EFFA08];
          uint64_t v41 = objc_msgSend_objectAtIndexedSubscript_(v20, v38, 1, v39, v40);
          v45 = objc_msgSend_componentsSeparatedByString_(v41, v42, @", ", v43, v44);
          long long v49 = objc_msgSend_setWithArray_(v37, v46, (uint64_t)v45, v47, v48);

          objc_msgSend_setObject_forKeyedSubscript_(v58, v50, (uint64_t)v49, (uint64_t)v36, v51);
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v59, (uint64_t)v63, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }

    *uint64_t v54 = v58;
    LOBYTE(a4) = 1;
LABEL_14:
  }
  return (char)a4;
}

+ (id)stringFromSynonymsDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v47 = a3;
  uint64_t v48 = objc_msgSend_array(MEMORY[0x263EFF980], v3, v4, v5, v6);
  objc_msgSend_allKeys(v47, v7, v8, v9, v10);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_localeIdentifier(v19, v12, v13, v14, v15);
        uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v47, v21, (uint64_t)v19, v22, v23);
        uint64_t v29 = objc_msgSend_allObjects(v24, v25, v26, v27, v28);
        uint64_t v33 = objc_msgSend_componentsJoinedByString_(v29, v30, @", ", v31, v32);

        long long v37 = objc_msgSend_stringWithFormat_(NSString, v34, @"%@%@%@", v35, v36, v20, @":", v33);
        objc_msgSend_addObject_(v48, v38, (uint64_t)v37, v39, v40);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v16);
  }

  uint64_t v44 = objc_msgSend_componentsJoinedByString_(v48, v41, @"", v42, v43);;

  return v44;
}

+ (id)searchDictionary:(id)a3 withLocale:(id)a4
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v111 = v5;
  v112 = v6;
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v7, (uint64_t)v6, v8, v9);
  uint64_t v14 = v10;
  if (v10)
  {
    id v15 = v10;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x263EFF508];
    uint64_t v17 = objc_msgSend_objectForKey_(v6, v11, *MEMORY[0x263EFF508], v12, v13);
    uint64_t v18 = *MEMORY[0x263EFF4D0];
    v113 = objc_msgSend_objectForKey_(v6, v19, *MEMORY[0x263EFF4D0], v20, v21);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id obj = v5;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v123, (uint64_t)v129, 16);
    if (v26)
    {
      uint64_t v27 = *(void *)v124;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v124 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          uint64_t v30 = objc_msgSend_objectForKey_(v29, v23, v16, v24, v25);
          if (objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v17, v32, v33))
          {
            long long v37 = objc_msgSend_objectForKey_(v29, v34, v18, v35, v36);
            int isEqualToString = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)v113, v39, v40);

            if (isEqualToString)
            {
              uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(obj, v23, (uint64_t)v29, v24, v25);
LABEL_35:
              id v15 = (id)v92;

              goto LABEL_36;
            }
          }
          else
          {
          }
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v123, (uint64_t)v129, 16);
        if (v26) {
          continue;
        }
        break;
      }
    }

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id obj = obj;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v119, (uint64_t)v128, 16);
    if (v46)
    {
      uint64_t v47 = *(void *)v120;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v120 != v47) {
            objc_enumerationMutation(obj);
          }
          long long v49 = *(void **)(*((void *)&v119 + 1) + 8 * j);
          long long v50 = objc_msgSend_objectForKey_(v49, v43, v16, v44, v45);
          if (objc_msgSend_isEqualToString_(v50, v51, (uint64_t)v17, v52, v53))
          {
            v57 = objc_msgSend_objectForKey_(v49, v54, v18, v55, v56);
            BOOL v58 = v57 == 0;

            if (v58)
            {
              uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(obj, v43, (uint64_t)v49, v44, v45);
              goto LABEL_35;
            }
          }
          else
          {
          }
        }
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v119, (uint64_t)v128, 16);
      }
      while (v46);
    }

    v63 = objc_msgSend_allKeys(obj, v59, v60, v61, v62);
    v67 = objc_msgSend_sortedArrayUsingComparator_(v63, v64, (uint64_t)&unk_26FEDDBA8, v65, v66);

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v68 = v67;
    uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v115, (uint64_t)v127, 16);
    if (v73)
    {
      uint64_t v74 = *(void *)v116;
      while (2)
      {
        for (uint64_t k = 0; k != v73; ++k)
        {
          if (*(void *)v116 != v74) {
            objc_enumerationMutation(v68);
          }
          v76 = *(void **)(*((void *)&v115 + 1) + 8 * k);
          v77 = objc_msgSend_objectForKey_(v76, v70, v16, v71, v72);
          int v81 = objc_msgSend_isEqualToString_(v77, v78, (uint64_t)v17, v79, v80);

          if (v81)
          {
            objc_msgSend_objectForKeyedSubscript_(obj, v70, (uint64_t)v76, v71, v72);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            v86 = v68;
            goto LABEL_46;
          }
        }
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v70, (uint64_t)&v115, (uint64_t)v127, 16);
        if (v73) {
          continue;
        }
        break;
      }
    }

    id v82 = objc_alloc(MEMORY[0x263EFF960]);
    v86 = objc_msgSend_initWithLocaleIdentifier_(v82, v83, @"en", v84, v85);
    v90 = objc_msgSend_objectForKeyedSubscript_(obj, v87, (uint64_t)v86, v88, v89);
    v91 = v90;
    if (v90)
    {
      id v15 = v90;
    }
    else
    {
      id v94 = objc_alloc(MEMORY[0x263EFF960]);
      v98 = objc_msgSend_initWithLocaleIdentifier_(v94, v95, @"en_US", v96, v97);
      v102 = objc_msgSend_objectForKeyedSubscript_(obj, v99, (uint64_t)v98, v100, v101);
      if (v102)
      {
        v103 = v98;
      }
      else
      {
        id v104 = objc_alloc(MEMORY[0x263EFF960]);
        v103 = objc_msgSend_initWithLocaleIdentifier_(v104, v105, @"en-US", v106, v107);

        v102 = objc_msgSend_objectForKeyedSubscript_(obj, v108, (uint64_t)v103, v109, v110);
      }
      id v15 = v102;
    }
LABEL_46:

LABEL_36:
    uint64_t v14 = 0;
  }

  return v15;
}

- (id)localizedLabelWithLocale:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_localizedLabelDictionary(self, v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_searchDictionary_withLocale_(CSUSearchableKnowledgeObject, v10, (uint64_t)v9, (uint64_t)v4, v11);

  return v12;
}

- (id)localizedSynonymsWithLocale:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_localizedSynonymsDictionary(self, v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_searchDictionary_withLocale_(CSUSearchableKnowledgeObject, v10, (uint64_t)v9, (uint64_t)v4, v11);

  return v12;
}

- (void)setLocalizedLabel:(id)a3 forLocale:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_localizedLabelDictionary(self, v7, v8, v9, v10);
  objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)v14, (uint64_t)v6, v13);
}

- (void)setLocalizedSynonyms:(id)a3 forLocale:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_localizedSynonymsDictionary(self, v7, v8, v9, v10);
  objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)v14, (uint64_t)v6, v13);
}

- (unint64_t)qid
{
  return self->_qid;
}

- (signed)idType
{
  return self->_idType;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSMutableDictionary)localizedLabelDictionary
{
  return self->_localizedLabelDictionary;
}

- (double)confidenceValue
{
  return self->_confidenceValue;
}

- (BOOL)sensitiveLocation
{
  return self->_sensitiveLocation;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)vertical
{
  return self->_vertical;
}

- (NSMutableDictionary)localizedSynonyms
{
  return self->_localizedSynonyms;
}

- (NSMutableDictionary)localizedSynonymsDictionary
{
  return self->_localizedSynonymsDictionary;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSynonymsDictionary, 0);
  objc_storeStrong((id *)&self->_localizedSynonyms, 0);
  objc_storeStrong((id *)&self->_vertical, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_localizedLabelDictionary, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
}

@end