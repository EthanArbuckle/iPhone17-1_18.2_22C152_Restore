@interface _NTKParmesanImageListReader
- (_NTKParmesanImageListReader)initWithResourceDirectory:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _NTKParmesanImageListReader

- (_NTKParmesanImageListReader)initWithResourceDirectory:(id)a3
{
  uint64_t v139 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v133.receiver = self;
  v133.super_class = (Class)_NTKParmesanImageListReader;
  v128 = [(NTKParmesanAssetReader *)&v133 initWithResourceDirectory:v4];
  if (v128)
  {
    v8 = objc_msgSend_logObject(NTKParmesanFaceBundle, v5, v6, v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (_NTKParmesanImageListReader *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v136 = v9;
      __int16 v137 = 2112;
      uint64_t v138 = (uint64_t)v4;
      v10 = v9;
      _os_log_impl(&dword_246B51000, v8, OS_LOG_TYPE_DEFAULT, "%@: initWithResourceDirectory %@", buf, 0x16u);
    }
    uint64_t v11 = objc_opt_new();
    assets = v128->_assets;
    v128->_assets = (NSMutableArray *)v11;

    if (v4)
    {
      v15 = objc_msgSend_stringByAppendingPathComponent_(v4, v13, (uint64_t)kParmesanReaderImagelistFileName, v14);
      v18 = objc_msgSend_dictionaryWithContentsOfFile_(NSDictionary, v16, (uint64_t)v15, v17);
      v22 = v18;
      if (v18)
      {
        v127 = v15;
        v23 = objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)kParmesanReaderAssetCollectionIdentifierKey, v21);
        objc_msgSend_setAssetCollectionIdentifier_(v128, v24, (uint64_t)v23, v25);

        v28 = objc_msgSend_objectForKeyedSubscript_(v22, v26, (uint64_t)kParmesanReaderPeopleIdentifiersKey, v27);
        objc_msgSend_setPeopleIdentifiers_(v128, v29, (uint64_t)v28, v30);

        v33 = objc_msgSend_objectForKeyedSubscript_(v22, v31, (uint64_t)kParmesanReaderHasPeopleKey, v32);
        uint64_t v37 = objc_msgSend_BOOLValue(v33, v34, v35, v36);
        objc_msgSend_setHasPeople_(v128, v38, v37, v39);

        v42 = objc_msgSend_objectForKeyedSubscript_(v22, v40, (uint64_t)kParmesanReaderHasPetsKey, v41);
        uint64_t v46 = objc_msgSend_BOOLValue(v42, v43, v44, v45);
        objc_msgSend_setHasPets_(v128, v47, v46, v48);

        v51 = objc_msgSend_objectForKeyedSubscript_(v22, v49, (uint64_t)kParmesanReaderHasNatureKey, v50);
        uint64_t v55 = objc_msgSend_BOOLValue(v51, v52, v53, v54);
        objc_msgSend_setHasNature_(v128, v56, v55, v57);

        v60 = objc_msgSend_objectForKeyedSubscript_(v22, v58, (uint64_t)kParmesanReaderHasCityscapesKey, v59);
        uint64_t v64 = objc_msgSend_BOOLValue(v60, v61, v62, v63);
        objc_msgSend_setHasCityscapes_(v128, v65, v64, v66);

        v69 = objc_msgSend_objectForKeyedSubscript_(v22, v67, (uint64_t)kParmesanReaderUUIDStringKey, v68);
        objc_msgSend_setUuidString_(v128, v70, (uint64_t)v69, v71);

        v74 = objc_msgSend_objectForKeyedSubscript_(v22, v72, (uint64_t)kParmesanReaderImageListKey, v73);
        v78 = objc_msgSend_assetCollectionIdentifier(v128, v75, v76, v77);

        int isShuffle = objc_msgSend_isShuffle(v128, v79, v80, v81);
        if (v78) {
          int v86 = 1;
        }
        else {
          int v86 = isShuffle;
        }
        if (v86 == 1 && (((v78 != 0) ^ isShuffle) & 1) == 0)
        {
          v87 = objc_msgSend_logObject(NTKParmesanFaceBundle, v83, v84, v85);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
            sub_246C2AE1C();
          }
        }
        char hasPeople = objc_msgSend_hasPeople(v128, v83, v84, v85);
        v92 = objc_msgSend_peopleIdentifiers(v128, v89, v90, v91);
        char v96 = hasPeople ^ (objc_msgSend_count(v92, v93, v94, v95) == 0);

        if ((v96 & 1) == 0)
        {
          v100 = objc_msgSend_logObject(NTKParmesanFaceBundle, v97, v98, v99);
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
            sub_246C2ADA8();
          }
        }
        v101 = objc_msgSend_objectForKeyedSubscript_(v22, v97, (uint64_t)kParmesanReaderVersionKey, v99);
        v125 = v101;
        v126 = v22;
        if (v101)
        {
          uint64_t v105 = objc_msgSend_integerValue(v101, v102, v103, v104);
          objc_msgSend_setVersion_(v128, v106, v105, v107);
        }
        else
        {
          v109 = objc_msgSend_logObject(NTKParmesanFaceBundle, v102, v103, v104);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
            sub_246C2AD14((uint64_t)v128, v109);
          }

          objc_msgSend_setVersion_(v128, v110, 0, v111);
        }
        long long v131 = 0u;
        long long v132 = 0u;
        long long v129 = 0u;
        long long v130 = 0u;
        v108 = v74;
        uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v112, (uint64_t)&v129, (uint64_t)v134, 16);
        if (v113)
        {
          uint64_t v115 = v113;
          uint64_t v116 = *(void *)v130;
          do
          {
            for (uint64_t i = 0; i != v115; ++i)
            {
              if (*(void *)v130 != v116) {
                objc_enumerationMutation(v108);
              }
              uint64_t v118 = *(void *)(*((void *)&v129 + 1) + 8 * i);
              v122 = objc_msgSend_decodeFromDictionary_inResourceDirectory_(NTKParmesanAsset, v114, v118, (uint64_t)v4);
              if (v122)
              {
                objc_msgSend_addObject_(v128->_assets, v119, (uint64_t)v122, v121);
              }
              else
              {
                v123 = objc_msgSend_logObject(NTKParmesanFaceBundle, v119, v120, v121);
                if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v136 = v128;
                  __int16 v137 = 2112;
                  uint64_t v138 = v118;
                  _os_log_error_impl(&dword_246B51000, v123, OS_LOG_TYPE_ERROR, "%@: Failed to decode imageListItem to NTKParmesanAsset. [item: %@]", buf, 0x16u);
                }
              }
            }
            uint64_t v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(v108, v114, (uint64_t)&v129, (uint64_t)v134, 16);
          }
          while (v115);
        }

        v22 = v126;
        v15 = v127;
      }
      else
      {
        v108 = objc_msgSend_logObject(NTKParmesanFaceBundle, v19, v20, v21);
        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
          sub_246C2AC70((uint64_t)v128, (uint64_t)v15, v108);
        }
      }
    }
  }

  return v128;
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_assets, a2, v2, v3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (objc_msgSend_count(self->_assets, a2, a3, v3) <= a3)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend_objectAtIndexedSubscript_(self->_assets, v6, a3, v7);
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end