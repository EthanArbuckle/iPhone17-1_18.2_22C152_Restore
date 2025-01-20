@interface RAWTIFFIFD
- (NSDictionary)mNamespace;
- (NSDictionary)mNamespaceReverse;
- (NSMutableDictionary)mTagsByID;
- (NSMutableDictionary)mTagsByName;
- (RAWTIFFIFD)initWithNamespace:(id)a3 reverseNamespace:(id)a4;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)dumpMemoryInfoKey:(id)a3 indent:(unint64_t)a4;
- (void)dumpObjCInfoKey:(id)a3 value:(id)a4 indent:(unint64_t)a5;
- (void)setMNamespace:(id)a3;
- (void)setMNamespaceReverse:(id)a3;
- (void)setMTagsByID:(id)a3;
- (void)setMTagsByName:(id)a3;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation RAWTIFFIFD

- (RAWTIFFIFD)initWithNamespace:(id)a3 reverseNamespace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)RAWTIFFIFD;
  v12 = [(RAWTIFFIFD *)&v32 init];
  if (v12)
  {
    v13 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10, v11);
    objc_msgSend_setMTagsByID_(v12, v14, (uint64_t)v13, v15, v16);

    v21 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v17, v18, v19, v20);
    objc_msgSend_setMTagsByName_(v12, v22, (uint64_t)v21, v23, v24);

    objc_msgSend_setMNamespace_(v12, v25, (uint64_t)v6, v26, v27);
    objc_msgSend_setMNamespaceReverse_(v12, v28, (uint64_t)v7, v29, v30);
  }

  return v12;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  mTagsByID = self->mTagsByID;
  id v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(mTagsByID, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  id v42 = a3;
  uint64_t v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v6, a4, v7, v8);
  v14 = objc_msgSend_mTagsByID(self, v10, v11, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v42, (uint64_t)v9, v16);

  v21 = objc_msgSend_mNamespace(self, v17, v18, v19, v20);
  v25 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v9, v23, v24);
  uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v25, v26, @"Name", v27, v28);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = objc_msgSend_mTagsByName(self, v30, v31, v32, v33);
    v39 = objc_msgSend_lowercaseString(v29, v35, v36, v37, v38);
    objc_msgSend_setObject_forKeyedSubscript_(v34, v40, (uint64_t)v42, (uint64_t)v39, v41);
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v7 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB8B0F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB8B0F0))
  {
    qword_1EAB8B0E8 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v4, @"([[:digit:]]+(?:%[[:digit:]]+)?\\[[[:digit:]]+\\])|([[:digit:]]+(?:%[[:digit:]]+)?)|([[:alpha:]][[:alnum:]]*(?:%[[:digit:]]+)?\\[[[:digit:]]\\])|([[:alpha:]][[:alnum:]]*(?:%[[:digit:]]+)?)", 1, 0);
    __cxa_guard_release(&qword_1EAB8B0F0);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB8B100, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB8B100))
  {
    qword_1EAB8B0F8 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v4, @"([[:alnum:]]+)\\[([[:digit:]]+)\\]", 1, 0);
    __cxa_guard_release(&qword_1EAB8B100);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EAB8B110, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EAB8B110))
  {
    qword_1EAB8B108 = (uint64_t)NSClassFromString(&cfstr_Nsblock.isa);
    __cxa_guard_release(&qword_1EAB8B110);
  }
  uint64_t v8 = objc_msgSend_componentsSeparatedByString_(v7, v4, @".", v5, v6);
  uint64_t v13 = objc_msgSend_firstObject(v8, v9, v10, v11, v12);
  v14 = (void *)qword_1EAB8B0E8;
  uint64_t v19 = objc_msgSend_length(v13, v15, v16, v17, v18);
  v21 = objc_msgSend_firstMatchInString_options_range_(v14, v20, (uint64_t)v13, 0, 0, v19);
  if (objc_msgSend_numberOfRanges(v21, v22, v23, v24, v25) != 5) {
    goto LABEL_9;
  }
  if (!objc_msgSend_rangeAtIndex_(v21, v26, 1, v27, v28))
  {
    uint64_t v42 = objc_msgSend_rangeAtIndex_(v21, v29, 1, v30, v31);
    v45 = objc_msgSend_substringWithRange_(v13, v43, v42, (uint64_t)v43, v44);
    v46 = (void *)qword_1EAB8B0F8;
    uint64_t v51 = objc_msgSend_length(v45, v47, v48, v49, v50);
    objc_msgSend_firstMatchInString_options_range_(v46, v52, (uint64_t)v45, 0, 0, v51);
    v53 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_numberOfRanges(v53, v54, v55, v56, v57) == 3)
    {
      uint64_t v61 = objc_msgSend_rangeAtIndex_(v53, v58, 1, v59, v60);
      v265 = objc_msgSend_substringWithRange_(v45, v62, v61, (uint64_t)v62, v63);
      uint64_t v67 = objc_msgSend_rangeAtIndex_(v53, v64, 2, v65, v66);
      v266 = objc_msgSend_substringWithRange_(v45, v68, v67, (uint64_t)v68, v69);
      v74 = objc_msgSend_mTagsByID(self, v70, v71, v72, v73);
      v75 = NSNumber;
      uint64_t v80 = objc_msgSend_integerValue(v265, v76, v77, v78, v79);
      v84 = objc_msgSend_numberWithInteger_(v75, v81, v80, v82, v83);
      v88 = objc_msgSend_objectForKeyedSubscript_(v74, v85, (uint64_t)v84, v86, v87);

      uint64_t v93 = objc_msgSend_integerValue(v266, v89, v90, v91, v92);
      objc_msgSend_objectAtIndexedSubscript_(v88, v94, v93, v95, v96);
      v97 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_28:

        v132 = v265;
        goto LABEL_29;
      }
LABEL_27:
      uint64_t v235 = v97[2](v97);

      uint64_t v240 = objc_msgSend_integerValue(v266, v236, v237, v238, v239);
      objc_msgSend_setObject_atIndexedSubscript_(v88, v241, v235, v240, v242);
      v97 = (void (**)(void))v235;
      goto LABEL_28;
    }
LABEL_18:
    uint64_t v41 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend_rangeAtIndex_(v21, v29, 2, v30, v31))
  {
    if (objc_msgSend_rangeAtIndex_(v21, v32, 3, v33, v34))
    {
      if (objc_msgSend_rangeAtIndex_(v21, v35, 4, v36, v37))
      {
LABEL_9:
        uint64_t v41 = 0;
        goto LABEL_32;
      }
      uint64_t v191 = objc_msgSend_rangeAtIndex_(v21, v38, 4, v39, v40);
      v45 = objc_msgSend_substringWithRange_(v13, v192, v191, (uint64_t)v192, v193);
      v198 = objc_msgSend_mTagsByName(self, v194, v195, v196, v197);
      v203 = objc_msgSend_lowercaseString(v45, v199, v200, v201, v202);
      objc_msgSend_objectForKeyedSubscript_(v198, v204, (uint64_t)v203, v205, v206);
      v207 = (void (**)(void))objc_claimAutoreleasedReturnValue();

      if (objc_opt_isKindOfClass())
      {
        v207[2](v207);
        v97 = (void (**)(void))objc_claimAutoreleasedReturnValue();

        objc_msgSend_mTagsByName(self, v208, v209, v210, v211);
        v53 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend_lowercaseString(v45, v212, v213, v214, v215);
        objc_msgSend_setObject_forKeyedSubscript_(v53, v216, (uint64_t)v97, (uint64_t)v132, v217);
        goto LABEL_29;
      }
      v53 = v207;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend_count(v53, v218, v219, v220, v221) != 1)
      {
        uint64_t v41 = v53;
        goto LABEL_30;
      }
      objc_msgSend_firstObject(v53, v222, v223, v224, v225);
      uint64_t v41 = (void (**)(void))objc_claimAutoreleasedReturnValue();

      if (objc_opt_isKindOfClass())
      {
        v132 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v226, (uint64_t)v53, v227, v228);
        v41[2](v41);
        v97 = (void (**)(void))objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_atIndexedSubscript_(v132, v229, (uint64_t)v97, 0, v230);
        goto LABEL_29;
      }
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v135 = objc_msgSend_rangeAtIndex_(v21, v35, 3, v36, v37);
    v45 = objc_msgSend_substringWithRange_(v13, v136, v135, (uint64_t)v136, v137);
    v138 = (void *)qword_1EAB8B0F8;
    uint64_t v143 = objc_msgSend_length(v45, v139, v140, v141, v142);
    objc_msgSend_firstMatchInString_options_range_(v138, v144, (uint64_t)v45, 0, 0, v143);
    v53 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_numberOfRanges(v53, v145, v146, v147, v148) == 3)
    {
      uint64_t v152 = objc_msgSend_rangeAtIndex_(v53, v149, 1, v150, v151);
      v265 = objc_msgSend_substringWithRange_(v45, v153, v152, (uint64_t)v153, v154);
      uint64_t v158 = objc_msgSend_rangeAtIndex_(v53, v155, 2, v156, v157);
      v266 = objc_msgSend_substringWithRange_(v45, v159, v158, (uint64_t)v159, v160);
      v165 = objc_msgSend_mTagsByName(self, v161, v162, v163, v164);
      v170 = objc_msgSend_lowercaseString(v265, v166, v167, v168, v169);
      objc_msgSend_objectForKeyedSubscript_(v165, v171, (uint64_t)v170, v172, v173);
      v174 = (void (**)(void))objc_claimAutoreleasedReturnValue();

      if (objc_opt_isKindOfClass())
      {
        v88 = v174[2](v174);

        v183 = objc_msgSend_mTagsByName(self, v179, v180, v181, v182);
        v188 = objc_msgSend_lowercaseString(v45, v184, v185, v186, v187);
        objc_msgSend_setObject_forKeyedSubscript_(v183, v189, (uint64_t)v88, (uint64_t)v188, v190);
      }
      else
      {
        v88 = v174;
      }
      uint64_t v231 = objc_msgSend_integerValue(v266, v175, v176, v177, v178);
      objc_msgSend_objectAtIndexedSubscript_(v88, v232, v231, v233, v234);
      v97 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  uint64_t v98 = objc_msgSend_rangeAtIndex_(v21, v32, 2, v33, v34);
  v45 = objc_msgSend_substringWithRange_(v13, v99, v98, (uint64_t)v99, v100);
  v105 = objc_msgSend_mTagsByID(self, v101, v102, v103, v104);
  v106 = NSNumber;
  uint64_t v111 = objc_msgSend_integerValue(v45, v107, v108, v109, v110);
  v115 = objc_msgSend_numberWithInteger_(v106, v112, v111, v113, v114);
  objc_msgSend_objectForKeyedSubscript_(v105, v116, (uint64_t)v115, v117, v118);
  uint64_t v41 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  if (objc_opt_isKindOfClass())
  {
    v41[2](v41);
    v97 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    objc_msgSend_mTagsByID(self, v119, v120, v121, v122);
    v53 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v123 = NSNumber;
    uint64_t v128 = objc_msgSend_integerValue(v45, v124, v125, v126, v127);
    v132 = objc_msgSend_numberWithInteger_(v123, v129, v128, v130, v131);
    objc_msgSend_setObject_forKeyedSubscript_(v53, v133, (uint64_t)v97, (uint64_t)v132, v134);
LABEL_29:

    uint64_t v41 = v97;
    goto LABEL_30;
  }
LABEL_31:

LABEL_32:
  if ((unint64_t)objc_msgSend_count(v8, v243, v244, v245, v246) >= 2)
  {
    uint64_t v251 = objc_msgSend_count(v8, v247, v248, v249, v250);
    v254 = objc_msgSend_subarrayWithRange_(v8, v252, 1, v251 - 1, v253);
    v258 = objc_msgSend_componentsJoinedByString_(v254, v255, @".", v256, v257);

    objc_msgSend_objectForKeyedSubscript_(v41, v259, (uint64_t)v258, v260, v261);
    v262 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    if (objc_opt_isKindOfClass())
    {
      uint64_t v263 = v262[2](v262);

      v262 = (void (**)(void))v263;
    }

    uint64_t v41 = v262;
  }

  return v41;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_mTagsByName(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_lowercaseString(v6, v12, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v19, (uint64_t)v16, v18);
}

- (void)dumpObjCInfoKey:(id)a3 value:(id)a4 indent:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = (FILE **)MEMORY[0x1E4F143C8];
    uint64_t v11 = (FILE *)*MEMORY[0x1E4F143C8];
    sub_1DDA49264(__b, a5, 9);
    int v12 = v99;
    uint64_t v13 = (const char *)__b[0];
    id v14 = v8;
    id v19 = (const char *)objc_msgSend_UTF8String(v14, v15, v16, v17, v18);
    uint64_t v20 = (const char *)__b;
    if (v12 < 0) {
      uint64_t v20 = v13;
    }
    fprintf(v11, "%s%s : (\n", v20, v19);
    if (v99 < 0) {
      operator delete(__b[0]);
    }
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = sub_1DDA3B278;
    v97[3] = &unk_1E6D04C38;
    v97[4] = self;
    v97[5] = a5;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v21, (uint64_t)v97, v22, v23);
    uint64_t v24 = *v10;
    sub_1DDA49264(__b, a5, 9);
    if (v99 >= 0) {
      uint64_t v25 = (const char *)__b;
    }
    else {
      uint64_t v25 = (const char *)__b[0];
    }
    fprintf(v24, "%s)\n", v25);
    if (v99 < 0) {
      operator delete(__b[0]);
    }
  }
  else
  {
    id v26 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = (FILE **)MEMORY[0x1E4F143C8];
      uint64_t v28 = (FILE *)*MEMORY[0x1E4F143C8];
      sub_1DDA49264(__b, a5, 9);
      int v29 = v99;
      uint64_t v30 = (const char *)__b[0];
      id v31 = v8;
      uint64_t v36 = (const char *)objc_msgSend_UTF8String(v31, v32, v33, v34, v35);
      uint64_t v37 = (const char *)__b;
      if (v29 < 0) {
        uint64_t v37 = v30;
      }
      fprintf(v28, "%s%s : {\n", v37, v36);
      if (v99 < 0) {
        operator delete(__b[0]);
      }
      uint64_t v42 = objc_msgSend_count(v26, v38, v39, v40, v41);
      NSLog(&cfstr_NsdictionaryLu.isa, v42);
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = sub_1DDA3B424;
      v96[3] = &unk_1E6D04C60;
      v96[4] = self;
      v96[5] = a5;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v43, (uint64_t)v96, v44, v45);
      v46 = *v27;
      sub_1DDA49264(__b, a5, 9);
      if (v99 >= 0) {
        v47 = (const char *)__b;
      }
      else {
        v47 = (const char *)__b[0];
      }
      fprintf(v46, "%s}\n", v47);
      if (v99 < 0) {
        operator delete(__b[0]);
      }
    }
    else
    {
      id v48 = v26;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v49 = (FILE *)*MEMORY[0x1E4F143C8];
        sub_1DDA49264(__b, a5, 9);
        if (v99 >= 0) {
          uint64_t v50 = (const char *)__b;
        }
        else {
          uint64_t v50 = (const char *)__b[0];
        }
        id v51 = v8;
        uint64_t v56 = (const char *)objc_msgSend_UTF8String(v51, v52, v53, v54, v55);
        objc_msgSend_stringValue(v48, v57, v58, v59, v60);
        id v61 = objc_claimAutoreleasedReturnValue();
        uint64_t v66 = (const char *)objc_msgSend_UTF8String(v61, v62, v63, v64, v65);
        fprintf(v49, "%s%s : @%s\n", v50, v56, v66);

        if (v99 < 0) {
          operator delete(__b[0]);
        }
      }
      else
      {
        id v67 = v48;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v68 = (FILE *)*MEMORY[0x1E4F143C8];
          uint64_t v69 = (const char *)__b;
          sub_1DDA49264(__b, a5, 9);
          if (v99 < 0) {
            uint64_t v69 = (const char *)__b[0];
          }
          id v70 = v8;
          v75 = (const char *)objc_msgSend_UTF8String(v70, v71, v72, v73, v74);
          id v76 = v67;
          v81 = (const char *)objc_msgSend_UTF8String(v76, v77, v78, v79, v80);
          fprintf(v68, "%s%s : @\"%s\"\n", v69, v75, v81);
          if (v99 < 0) {
            operator delete(__b[0]);
          }
        }
        else
        {
          id v82 = v67;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v83 = (FILE *)*MEMORY[0x1E4F143C8];
            v84 = (const char *)__b;
            sub_1DDA49264(__b, a5, 9);
            if (v99 < 0) {
              v84 = (const char *)__b[0];
            }
            id v85 = v8;
            uint64_t v90 = (const char *)objc_msgSend_UTF8String(v85, v86, v87, v88, v89);
            uint64_t v95 = objc_msgSend_length(v82, v91, v92, v93, v94);
            fprintf(v83, "%s%s : %lu bytes\n", v84, v90, v95);
            if (v99 < 0) {
              operator delete(__b[0]);
            }
          }
        }
      }
    }
  }
}

- (void)dumpMemoryInfoKey:(id)a3 indent:(unint64_t)a4
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v148 = a3;
  id v9 = objc_msgSend_mTagsByID(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_count(v9, v10, v11, v12, v13);

  if (v14)
  {
    id v19 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v20 = __p;
    sub_1DDA49264(__p, a4, 9);
    if (v161 < 0) {
      uint64_t v20 = (void **)__p[0];
    }
    id v21 = v148;
    id v26 = (const char *)objc_msgSend_UTF8String(v21, v22, v23, v24, v25);
    id v31 = objc_msgSend_mTagsByID(self, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_count(v31, v32, v33, v34, v35);
    fprintf(v19, "%s%s : TagsByID( %lu items\n", (const char *)v20, v26, v36);

    if (v161 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v41 = objc_msgSend_mTagsByID(self, v37, v38, v39, v40);
    v46 = objc_msgSend_allKeys(v41, v42, v43, v44, v45);
    uint64_t v50 = objc_msgSend_sortedArrayUsingComparator_(v46, v47, (uint64_t)&unk_1F395CB90, v48, v49);

    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    obuint64_t j = v50;
    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v156, (uint64_t)v163, 16);
    if (v56)
    {
      uint64_t v57 = *(void *)v157;
      uint64_t v58 = a4 + 1;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v157 != v57) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = *(void **)(*((void *)&v156 + 1) + 8 * i);
          id v61 = objc_msgSend_mTagsByID(self, v52, v53, v54, v55);
          uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)v60, v63, v64);

          uint64_t v66 = v65;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v71 = objc_msgSend_stringValue(v60, v67, v68, v69, v70);
            objc_msgSend_dumpMemoryInfoKey_indent_(v66, v72, (uint64_t)v71, v58, v73);
          }
          else
          {
            NSClassFromString(&cfstr_Nsblock.isa);
            if (objc_opt_isKindOfClass())
            {
              uint64_t v71 = objc_msgSend_stringValue(v60, v74, v75, v76, v77);
              uint64_t v78 = v66[2](v66);
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v79, (uint64_t)v71, (uint64_t)v78, v58);
            }
            else
            {
              uint64_t v71 = objc_msgSend_stringValue(v60, v74, v75, v76, v77);
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v80, (uint64_t)v71, (uint64_t)v66, v58);
            }
          }
        }
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v156, (uint64_t)v163, 16);
      }
      while (v56);
    }

    v81 = (FILE *)*MEMORY[0x1E4F143C8];
    sub_1DDA49264(__p, a4, 9);
    if (v161 >= 0) {
      id v82 = __p;
    }
    else {
      id v82 = (void **)__p[0];
    }
    fprintf(v81, "%s)\n", (const char *)v82);
    if (v161 < 0) {
      operator delete(__p[0]);
    }
  }
  uint64_t v83 = objc_msgSend_mTagsByName(self, v15, v16, v17, v18);
  BOOL v88 = objc_msgSend_count(v83, v84, v85, v86, v87) == 0;

  if (!v88)
  {
    uint64_t v89 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v90 = __p;
    sub_1DDA49264(__p, a4, 9);
    if (v161 < 0) {
      uint64_t v90 = (void **)__p[0];
    }
    id v91 = v148;
    uint64_t v96 = (const char *)objc_msgSend_UTF8String(v91, v92, v93, v94, v95);
    v101 = objc_msgSend_mTagsByName(self, v97, v98, v99, v100);
    uint64_t v106 = objc_msgSend_count(v101, v102, v103, v104, v105);
    fprintf(v89, "%s%s : TagsByName( %lu items\n", (const char *)v90, v96, v106);

    if (v161 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v111 = objc_msgSend_mTagsByName(self, v107, v108, v109, v110);
    v116 = objc_msgSend_allKeys(v111, v112, v113, v114, v115);
    uint64_t v120 = objc_msgSend_sortedArrayUsingComparator_(v116, v117, (uint64_t)&unk_1F395CBB0, v118, v119);

    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id obja = v120;
    uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v121, (uint64_t)&v152, (uint64_t)v162, 16);
    if (v125)
    {
      uint64_t v126 = *(void *)v153;
      uint64_t v127 = a4 + 1;
      do
      {
        for (uint64_t j = 0; j != v125; ++j)
        {
          if (*(void *)v153 != v126) {
            objc_enumerationMutation(obja);
          }
          uint64_t v129 = *(void *)(*((void *)&v152 + 1) + 8 * j);
          uint64_t v130 = objc_msgSend_stringWithFormat_(NSString, v122, @"@\"%@\"", v123, v124, v129);
          uint64_t v135 = objc_msgSend_mTagsByName(self, v131, v132, v133, v134);
          v139 = objc_msgSend_objectForKeyedSubscript_(v135, v136, v129, v137, v138);

          uint64_t v140 = v139;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_dumpMemoryInfoKey_indent_(v140, v141, (uint64_t)v130, v127, v142);
          }
          else
          {
            NSClassFromString(&cfstr_Nsblock.isa);
            if (objc_opt_isKindOfClass())
            {
              v144 = v140[2](v140);
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v145, (uint64_t)v130, (uint64_t)v144, v127);
            }
            else
            {
              objc_msgSend_dumpObjCInfoKey_value_indent_(self, v143, (uint64_t)v130, (uint64_t)v140, v127);
            }
          }
        }
        uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v122, (uint64_t)&v152, (uint64_t)v162, 16);
      }
      while (v125);
    }

    uint64_t v146 = (FILE *)*MEMORY[0x1E4F143C8];
    sub_1DDA49264(__p, a4, 9);
    if (v161 >= 0) {
      uint64_t v147 = __p;
    }
    else {
      uint64_t v147 = (void **)__p[0];
    }
    fprintf(v146, "%s)\n", (const char *)v147);
    if (v161 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (NSMutableDictionary)mTagsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMTagsByID:(id)a3
{
}

- (NSMutableDictionary)mTagsByName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMTagsByName:(id)a3
{
}

- (NSDictionary)mNamespace
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMNamespace:(id)a3
{
}

- (NSDictionary)mNamespaceReverse
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMNamespaceReverse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNamespaceReverse, 0);
  objc_storeStrong((id *)&self->mNamespace, 0);
  objc_storeStrong((id *)&self->mTagsByName, 0);

  objc_storeStrong((id *)&self->mTagsByID, 0);
}

@end