@interface CSUTaxonomy
+ (id)taxonomyWithManifestPath:(id)a3 error:(id *)a4;
- (BOOL)_hasVocabularyNamed:(id)a3;
- (BOOL)hasLabelAttributes;
- (CSUTaxonomy)initWithManifestPath:(id)a3 error:(id *)a4;
- (NSArray)vocabularyNames;
- (NSString)name;
- (NSString)version;
- (id).cxx_construct;
- (id)_vocabularyNamed:(id)a3;
- (optional<csu::TaxonomyRelations>)relations;
- (unint64_t)countLabelsInVocabularyNamed:(id)a3;
- (unint64_t)internalCount;
- (void)enumerateLabelsInTaxonomyUsingBlock:(id)a3;
- (void)enumerateLabelsInVocabularyNamed:(id)a3 usingBlock:(id)a4;
@end

@implementation CSUTaxonomy

- (CSUTaxonomy)initWithManifestPath:(id)a3 error:(id *)a4
{
  uint64_t v231 = *MEMORY[0x263EF8340];
  id v211 = a3;
  v227 = &v228;
  v228 = a4;
  v226.receiver = self;
  v226.super_class = (Class)CSUTaxonomy;
  v10 = [(CSUTaxonomy *)&v226 init];
  if (!v10)
  {
    if (!v228)
    {
      v144 = 0;
      goto LABEL_56;
    }
    objc_msgSend_errorForMemoryAllocationFailure(CSUError, v6, v7, v8, v9);
    id v143 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
    v144 = 0;
    id *v228 = v143;
LABEL_56:
    v11 = v211;
    goto LABEL_57;
  }
  v11 = v211;
  if (v211)
  {
    v12 = NSDictionary;
    v13 = objc_msgSend_fileURLWithPath_(NSURL, v6, (uint64_t)v211, v8, v9);
    id v225 = 0;
    uint64_t v16 = objc_msgSend_dictionaryWithContentsOfURL_error_(v12, v14, (uint64_t)v13, (uint64_t)&v225, v15);
    id v209 = v225;
    manifest = v10->_manifest;
    v10->_manifest = (NSDictionary *)v16;

    if (v10->_manifest)
    {
      v22 = objc_msgSend_stringByDeletingLastPathComponent(v211, v18, v19, v20, v21);
      v223[0] = MEMORY[0x263EF8330];
      v223[1] = 3221225472;
      v223[2] = sub_24C691FB0;
      v223[3] = &unk_2652E7F30;
      id v207 = v22;
      id v224 = v207;
      v210 = (void (**)(void, void))MEMORY[0x2532F90C0](v223);
      v208 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v23, @"formatVersion", v24, v25);
      uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v26, @"name", v27, v28);
      name = v10->_name;
      v10->_name = (NSString *)v29;

      uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v31, @"version", v32, v33);
      version = v10->_version;
      v10->_version = (NSString *)v34;

      v206 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v36, @"size", v37, v38);
      v205 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v39, @"vocabularies", v40, v41);
      if (v208)
      {
        if ((objc_msgSend_isEqualToString_(v208, v42, @"1.0.0", v43, v44) & 1) == 0)
        {
          objc_msgSend_stringByAppendingString_(@"Unhandled taxonomy manifest format version ", v45, (uint64_t)v208, v47, v48);
          id v151 = (id)objc_claimAutoreleasedReturnValue();
          if (v228)
          {
            objc_msgSend_errorWithCode_message_(CSUError, v149, 6, (uint64_t)v151, v150);
            id v152 = (id)objc_claimAutoreleasedReturnValue();
            id *v228 = v152;
          }

          goto LABEL_52;
        }
        if (v10->_name && v10->_version && v206 && v205)
        {
          uint64_t v49 = objc_msgSend_unsignedLongValue(v206, v45, v46, v47, v48);
          v10->_internalCount = v49;
          if (v49)
          {
            id v50 = objc_alloc(MEMORY[0x263EFF9A0]);
            uint64_t v55 = objc_msgSend_count(v205, v51, v52, v53, v54);
            v198 = objc_msgSend_initWithCapacity_(v50, v56, v55, v57, v58);
            long long v221 = 0u;
            long long v222 = 0u;
            long long v219 = 0u;
            long long v220 = 0u;
            v59 = v205;
            uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v219, (uint64_t)v230, 16);
            if (!v61) {
              goto LABEL_30;
            }
            exception_object = *(_Unwind_Exception **)v220;
            obj = v59;
LABEL_13:
            uint64_t v196 = v61;
            uint64_t v65 = 0;
            while (1)
            {
              if (*(_Unwind_Exception **)v220 != exception_object) {
                objc_enumerationMutation(obj);
              }
              uint64_t v66 = *(void *)(*((void *)&v219 + 1) + 8 * v65);
              v201 = objc_msgSend_objectForKey_(obj, v62, v66, v63, v64);
              v203 = objc_msgSend_objectForKeyedSubscript_(v201, v67, @"file", v68, v69);
              v73 = objc_msgSend_objectForKeyedSubscript_(v201, v70, @"size", v71, v72);
              v77 = objc_msgSend_objectForKeyedSubscript_(v201, v74, @"visibleSize", v75, v76);
              uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v201, v78, @"startIndex", v79, v80);
              v86 = (void *)v81;
              BOOL v87 = !v203 || v73 == 0;
              BOOL v88 = v87 || v81 == 0;
              if (v88 || v77 == 0) {
                break;
              }
              uint64_t v93 = objc_msgSend_unsignedLongValue(v73, v82, v83, v84, v85);
              if (!v93)
              {
                objc_msgSend_stringWithFormat_(NSString, v90, @"Empty vocabulary %@ in taxonomy %@", v91, v92, v66, v10->_name);
                id started = (id)objc_claimAutoreleasedReturnValue();
                if (v228)
                {
                  objc_msgSend_errorWithCode_message_(CSUError, v157, 6, (uint64_t)started, v158);
                  id v159 = (id)objc_claimAutoreleasedReturnValue();
                  id *v228 = v159;
                }
LABEL_60:

LABEL_66:
                v144 = 0;
                v161 = obj;
                goto LABEL_81;
              }
              v94 = [CSUVocabulary alloc];
              v95 = ((void (**)(void, void *))v210)[2](v210, v203);
              v96 = v77;
              uint64_t v101 = objc_msgSend_unsignedLongValue(v77, v97, v98, v99, v100);
              uint64_t v106 = objc_msgSend_unsignedLongValue(v86, v102, v103, v104, v105);
              id started = (id)objc_msgSend_initWithName_labelFilePath_internalCount_visibleCount_startIndex_(v94, v107, v66, (uint64_t)v95, v93, v101, v106);

              v77 = v96;
              if (!started)
              {
                if (v228)
                {
                  objc_msgSend_errorForMemoryAllocationFailure(CSUError, v109, v110, v111, v112);
                  id v160 = (id)objc_claimAutoreleasedReturnValue();
                  id *v228 = v160;
                }
                goto LABEL_66;
              }
              objc_msgSend_setObject_forKeyedSubscript_(v198, v109, (uint64_t)started, v66, v112);

              if (v196 == ++v65)
              {
                v59 = obj;
                uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v219, (uint64_t)v230, 16);
                if (v61) {
                  goto LABEL_13;
                }
LABEL_30:

                uint64_t v117 = objc_msgSend_copy(v198, v113, v114, v115, v116);
                vocabularies = v10->_vocabularies;
                v10->_vocabularies = (NSDictionary *)v117;

                v123 = objc_msgSend_allKeys(v10->_vocabularies, v119, v120, v121, v122);
                v217[0] = MEMORY[0x263EF8330];
                v217[1] = 3221225472;
                v217[2] = sub_24C6920BC;
                v217[3] = &unk_2652E7F58;
                v124 = v10;
                v218 = v124;
                uint64_t v128 = objc_msgSend_sortedArrayUsingComparator_(v123, v125, (uint64_t)v217, v126, v127);
                vocabularyNames = v124->_vocabularyNames;
                v204 = v124;
                v124->_vocabularyNames = (NSArray *)v128;

                uint64_t v133 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v130, @"relations", v131, v132);
                v202 = (void *)v133;
                if (v133)
                {
                  v134 = v210[2](v210, v133);
                  v135 = (void *)MEMORY[0x263F08AC0];
                  v139 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v136, (uint64_t)v134, v137, v138);
                  v140 = v134;
                  v216 = objc_msgSend_propertyListWithData_options_format_error_(v135, v141, (uint64_t)v139, 0, 0, v228);

                  if (v216)
                  {
                    sub_24C692194((uint64_t)&v204->_relations, &v216);

                    v142 = v204;
                    goto LABEL_69;
                  }
                  v144 = 0;
                  v167 = v140;
                }
                else
                {
                  v142 = v204;
                  if (v204->_relations.__engaged_)
                  {

                    v142 = v204;
                    v204->_relations.__engaged_ = 0;
                  }
LABEL_69:
                  labelAttributes = v142->_labelAttributes;
                  v142->_labelAttributes = 0;

                  uint64_t v166 = objc_msgSend_objectForKeyedSubscript_(v10->_manifest, v163, @"attributes", v164, v165);
                  v167 = (void *)v166;
                  if (v166)
                  {
                    id obja = (id)v166;
                    id v168 = objc_alloc(MEMORY[0x263EFF9A0]);
                    uint64_t v173 = objc_msgSend_count(v167, v169, v170, v171, v172);
                    v177 = objc_msgSend_initWithCapacity_(v168, v174, v173, v175, v176);
                    long long v214 = 0u;
                    long long v215 = 0u;
                    long long v212 = 0u;
                    long long v213 = 0u;
                    id v178 = v167;
                    uint64_t v183 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v179, (uint64_t)&v212, (uint64_t)v229, 16);
                    if (v183)
                    {
                      uint64_t v184 = *(void *)v213;
                      do
                      {
                        for (uint64_t i = 0; i != v183; ++i)
                        {
                          if (*(void *)v213 != v184) {
                            objc_enumerationMutation(v178);
                          }
                          uint64_t v186 = *(void *)(*((void *)&v212 + 1) + 8 * i);
                          v187 = objc_msgSend_objectForKey_(v178, v180, v186, v181, v182);
                          v188 = ((void (**)(void, void *))v210)[2](v210, v187);
                          objc_msgSend_setObject_forKeyedSubscript_(v177, v189, (uint64_t)v188, v186, v190);
                        }
                        uint64_t v183 = objc_msgSend_countByEnumeratingWithState_objects_count_(v178, v180, (uint64_t)&v212, (uint64_t)v229, 16);
                      }
                      while (v183);
                    }

                    uint64_t v194 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v191, (uint64_t)v177, v192, v193);
                    v195 = v204->_labelAttributes;
                    v204->_labelAttributes = (NSDictionary *)v194;

                    v167 = obja;
                  }
                  v144 = v204;
                }

                v161 = v218;
LABEL_81:

LABEL_53:
LABEL_54:

                v145 = v209;
                goto LABEL_55;
              }
            }
            objc_msgSend_stringWithFormat_(NSString, v82, @"Malformed properties for vocabulary named %@ in taxonomy %@", v84, v85, v66, v10->_name);
            id started = (id)objc_claimAutoreleasedReturnValue();
            if (v228)
            {
              objc_msgSend_errorWithCode_message_(CSUError, v154, 6, (uint64_t)started, v155);
              id v156 = (id)objc_claimAutoreleasedReturnValue();
              id *v228 = v156;
            }
            goto LABEL_60;
          }
          sub_24C69202C((const char ****)&v227, @"Invalid manifest file, declared size of taxonomy is 0");
LABEL_52:
          v144 = 0;
          goto LABEL_53;
        }
        if (!v228) {
          goto LABEL_52;
        }
        objc_msgSend_errorWithCode_message_(CSUError, v45, 6, @"Invalid manifest file, missing required information", v48);
        id v148 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v228) {
          goto LABEL_52;
        }
        objc_msgSend_errorWithCode_message_(CSUError, v42, 6, @"Invalid manifest file, does not have the format version", v44);
        id v148 = (id)objc_claimAutoreleasedReturnValue();
      }
      v144 = 0;
      id *v228 = v148;
      goto LABEL_53;
    }
    v145 = v209;
    if (v228)
    {
      objc_msgSend_stringByAppendingString_(@"Could not load taxonomy manifest file ", v18, (uint64_t)v211, v20, v21);
      id v207 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithCode_message_underlyingError_(CSUError, v146, 1, (uint64_t)v207, (uint64_t)v209);
      id v147 = (id)objc_claimAutoreleasedReturnValue();
      v144 = 0;
      id *v228 = v147;
      goto LABEL_54;
    }
    v144 = 0;
LABEL_55:

    goto LABEL_56;
  }
  if (v228)
  {
    objc_msgSend_errorForInvalidArgument_named_(CSUError, v6, 0, @"taxonomy manifest path", v9);
    id v143 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v144 = 0;
LABEL_57:

  return v144;
}

+ (id)taxonomyWithManifestPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [CSUTaxonomy alloc];
  uint64_t v9 = objc_msgSend_initWithManifestPath_error_(v6, v7, (uint64_t)v5, (uint64_t)a4, v8);

  return v9;
}

- (id)_vocabularyNamed:(id)a3
{
  id v5 = objc_msgSend_objectForKey_(self->_vocabularies, a2, (uint64_t)a3, v3, v4);
  return v5;
}

- (BOOL)hasLabelAttributes
{
  return self->_labelAttributes != 0;
}

- (BOOL)_hasVocabularyNamed:(id)a3
{
  id v5 = objc_msgSend__vocabularyNamed_(self, a2, (uint64_t)a3, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (unint64_t)countLabelsInVocabularyNamed:(id)a3
{
  id v5 = objc_msgSend__vocabularyNamed_(self, a2, (uint64_t)a3, v3, v4);
  v10 = v5;
  if (v5)
  {
    unint64_t v11 = objc_msgSend_count(v5, v6, v7, v8, v9);

    return v11;
  }
  else
  {

    return 0;
  }
}

- (void)enumerateLabelsInVocabularyNamed:(id)a3 usingBlock:(id)a4
{
  id v14 = a4;
  uint64_t v9 = objc_msgSend__vocabularyNamed_(self, v6, (uint64_t)a3, v7, v8);
  v13 = v9;
  if (v9) {
    objc_msgSend__enumerateVisibleLabelsInVocabularyUsingBlock_(v9, v10, (uint64_t)v14, v11, v12);
  }
}

- (void)enumerateLabelsInTaxonomyUsingBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_vocabularyNames;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v17, (uint64_t)v25, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_24C6925BC;
      v14[3] = &unk_2652E7F80;
      id v15 = v4;
      uint64_t v16 = &v21;
      objc_msgSend_enumerateLabelsInVocabularyNamed_usingBlock_(self, v10, v9, (uint64_t)v14, v11);
      LOBYTE(v9) = *((unsigned char *)v22 + 24) == 0;

      if ((v9 & 1) == 0) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v17, (uint64_t)v25, 16);
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (NSArray)vocabularyNames
{
  return self->_vocabularyNames;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)internalCount
{
  return self->_internalCount;
}

- (optional<csu::TaxonomyRelations>)relations
{
  retstr->var0.__null_state_ = 0;
  retstr->__engaged_ = 0;
  if (LOBYTE(self[3].var0.__val_._count))
  {
    id v4 = self;
    self = (optional<csu::TaxonomyRelations> *)*(id *)&self[2].__engaged_;
    unint64_t data = (unint64_t)v4[3].var0.__val_._data;
    retstr->var0.__val_._unint64_t data = (NSData *)self;
    retstr->var0.__val_._count = data;
    retstr->__engaged_ = 1;
  }
  return self;
}

- (void).cxx_destruct
{
  if (self->_relations.__engaged_) {

  }
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vocabularyNames, 0);
  objc_storeStrong((id *)&self->_vocabularies, 0);
  objc_storeStrong((id *)&self->_labelAttributes, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 64) = 0;
  *((unsigned char *)self + 80) = 0;
  return self;
}

@end