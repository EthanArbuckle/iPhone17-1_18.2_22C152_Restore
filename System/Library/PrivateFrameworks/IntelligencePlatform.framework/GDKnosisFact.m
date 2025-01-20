@interface GDKnosisFact
+ (BOOL)supportsSecureCoding;
- (GDKnosisFact)initWithCoder:(id)a3;
- (GDKnosisFact)initWithFactId:(id)a3 score:(id)a4 subjectId:(id)a5 subjectAlias:(id)a6 subjectPopularity:(id)a7 subjectIsa:(id)a8 predicateId:(id)a9 predicateAlias:(id)a10 predicatePopularity:(id)a11 objectID:(id)a12 objectAlias:(id)a13 objectPopularity:(id)a14 qualifiers:(id)a15;
- (NSArray)objectAlias;
- (NSArray)predicateAlias;
- (NSArray)qualifiers;
- (NSArray)subjectAlias;
- (NSArray)subjectIsa;
- (NSNumber)objectPopularity;
- (NSNumber)predicatePopularity;
- (NSNumber)score;
- (NSNumber)subjectPopularity;
- (NSString)factId;
- (NSString)objectID;
- (NSString)predicateId;
- (NSString)subjectId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisFact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiers, 0);
  objc_storeStrong((id *)&self->_objectPopularity, 0);
  objc_storeStrong((id *)&self->_objectAlias, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_predicatePopularity, 0);
  objc_storeStrong((id *)&self->_predicateAlias, 0);
  objc_storeStrong((id *)&self->_predicateId, 0);
  objc_storeStrong((id *)&self->_subjectIsa, 0);
  objc_storeStrong((id *)&self->_subjectPopularity, 0);
  objc_storeStrong((id *)&self->_subjectAlias, 0);
  objc_storeStrong((id *)&self->_subjectId, 0);
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_factId, 0);
}

- (NSArray)qualifiers
{
  return self->_qualifiers;
}

- (NSNumber)objectPopularity
{
  return self->_objectPopularity;
}

- (NSArray)objectAlias
{
  return self->_objectAlias;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (NSNumber)predicatePopularity
{
  return self->_predicatePopularity;
}

- (NSArray)predicateAlias
{
  return self->_predicateAlias;
}

- (NSString)predicateId
{
  return self->_predicateId;
}

- (NSArray)subjectIsa
{
  return self->_subjectIsa;
}

- (NSNumber)subjectPopularity
{
  return self->_subjectPopularity;
}

- (NSArray)subjectAlias
{
  return self->_subjectAlias;
}

- (NSString)subjectId
{
  return self->_subjectId;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)factId
{
  return self->_factId;
}

- (GDKnosisFact)initWithCoder:(id)a3
{
  v209[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_factId);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_score);
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (!v18)
    {
      v156 = objc_msgSend_error(v4, v19, v20, v21, v22);

      if (v156)
      {
        v18 = 0;
        v153 = 0;
LABEL_59:

        goto LABEL_60;
      }
      v166 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v206 = *MEMORY[0x1E4F28568];
      v207 = @"GDKnosisFact score is nil";
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v157, (uint64_t)&v207, (uint64_t)&v206, 1);
      v42 = objc_msgSend_errorWithDomain_code_userInfo_(v166, v167, @"GDErrorDomain", 9, (uint64_t)v27);
      objc_msgSend_failWithError_(v4, v168, (uint64_t)v42, v169, v170);
      goto LABEL_26;
    }
    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_subjectId);
    v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, (uint64_t)v24, v26);

    if (v27)
    {
      v32 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      v38 = objc_msgSend_setWithObjects_(v32, v35, v33, v36, v37, v34, 0);
      v39 = NSStringFromSelector(sel_subjectAlias);
      v42 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v38, (uint64_t)v39, v41);

      if (!v42)
      {
        v165 = objc_msgSend_error(v4, v43, v44, v45, v46);

        if (v165)
        {
          v42 = 0;
LABEL_26:
          v153 = 0;
LABEL_57:

          goto LABEL_58;
        }
      }
      uint64_t v47 = objc_opt_class();
      v48 = NSStringFromSelector(sel_subjectPopularity);
      v51 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v47, (uint64_t)v48, v50);

      if (v51
        || (objc_msgSend_error(v4, v52, v53, v54, v55),
            v171 = objc_claimAutoreleasedReturnValue(),
            v171,
            !v171))
      {
        v201 = self;
        v56 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v57 = objc_opt_class();
        uint64_t v58 = objc_opt_class();
        v62 = objc_msgSend_setWithObjects_(v56, v59, v57, v60, v61, v58, 0);
        v63 = NSStringFromSelector(sel_subjectIsa);
        v66 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v64, (uint64_t)v62, (uint64_t)v63, v65);

        if (v66
          || (objc_msgSend_error(v4, v67, v68, v69, v70),
              v177 = objc_claimAutoreleasedReturnValue(),
              v177,
              !v177))
        {
          v199 = v66;
          uint64_t v71 = objc_opt_class();
          v72 = NSStringFromSelector(sel_predicateId);
          uint64_t v75 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v71, (uint64_t)v72, v74);

          v200 = (void *)v75;
          if (v75
            || (objc_msgSend_error(v4, v76, v77, v78, v79),
                v178 = objc_claimAutoreleasedReturnValue(),
                v178,
                !v178))
          {
            v80 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v81 = objc_opt_class();
            uint64_t v82 = objc_opt_class();
            v86 = objc_msgSend_setWithObjects_(v80, v83, v81, v84, v85, v82, 0);
            v87 = NSStringFromSelector(sel_predicateAlias);
            uint64_t v90 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v88, (uint64_t)v86, (uint64_t)v87, v89);

            v198 = (void *)v90;
            if (v90
              || (objc_msgSend_error(v4, v91, v92, v93, v94),
                  v179 = objc_claimAutoreleasedReturnValue(),
                  v179,
                  !v179))
            {
              uint64_t v95 = objc_opt_class();
              v96 = NSStringFromSelector(sel_predicatePopularity);
              uint64_t v99 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, v95, (uint64_t)v96, v98);

              v197 = (void *)v99;
              if (v99
                || (objc_msgSend_error(v4, v100, v101, v102, v103),
                    v180 = objc_claimAutoreleasedReturnValue(),
                    v180,
                    !v180))
              {
                uint64_t v104 = objc_opt_class();
                v105 = NSStringFromSelector(sel_objectID);
                uint64_t v108 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v106, v104, (uint64_t)v105, v107);

                v196 = (void *)v108;
                if (v108
                  || (objc_msgSend_error(v4, v109, v110, v111, v112),
                      v181 = objc_claimAutoreleasedReturnValue(),
                      v181,
                      !v181))
                {
                  v113 = (void *)MEMORY[0x1E4F1CAD0];
                  uint64_t v114 = objc_opt_class();
                  uint64_t v115 = objc_opt_class();
                  v119 = objc_msgSend_setWithObjects_(v113, v116, v114, v117, v118, v115, 0);
                  v120 = NSStringFromSelector(sel_objectAlias);
                  uint64_t v123 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v121, (uint64_t)v119, (uint64_t)v120, v122);

                  v128 = v200;
                  v195 = (void *)v123;
                  if (v123
                    || (objc_msgSend_error(v4, v124, v125, v126, v127),
                        v182 = objc_claimAutoreleasedReturnValue(),
                        v182,
                        !v182))
                  {
                    uint64_t v129 = objc_opt_class();
                    v130 = NSStringFromSelector(sel_objectPopularity);
                    uint64_t v133 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v131, v129, (uint64_t)v130, v132);

                    v66 = v199;
                    v194 = (void *)v133;
                    if (v133
                      || (objc_msgSend_error(v4, v134, v135, v136, v137),
                          v183 = objc_claimAutoreleasedReturnValue(),
                          v183,
                          !v183))
                    {
                      v138 = (void *)MEMORY[0x1E4F1CAD0];
                      uint64_t v139 = objc_opt_class();
                      uint64_t v140 = objc_opt_class();
                      v144 = objc_msgSend_setWithObjects_(v138, v141, v139, v142, v143, v140, 0);
                      v145 = NSStringFromSelector(sel_qualifiers);
                      v148 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v146, (uint64_t)v144, (uint64_t)v145, v147);

                      if (v148)
                      {
                        self = (GDKnosisFact *)(id)objc_msgSend_initWithFactId_score_subjectId_subjectAlias_subjectPopularity_subjectIsa_predicateId_predicateAlias_predicatePopularity_objectID_objectAlias_objectPopularity_qualifiers_(v201, v149, (uint64_t)v9, (uint64_t)v18, (uint64_t)v27, v42, v51, v199, v200, v198, v197, v196, v195, v194, v148);
                        v153 = self;
                      }
                      else
                      {
                        v184 = objc_msgSend_error(v4, v149, v150, v151, v152);

                        self = v201;
                        if (!v184)
                        {
                          v186 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v202 = *MEMORY[0x1E4F28568];
                          v203 = @"GDKnosisFact qualifiers is nil";
                          v187 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v185, (uint64_t)&v203, (uint64_t)&v202, 1);
                          v189 = objc_msgSend_errorWithDomain_code_userInfo_(v186, v188, @"GDErrorDomain", 9, (uint64_t)v187);
                          objc_msgSend_failWithError_(v4, v190, (uint64_t)v189, v191, v192);

                          self = v201;
                        }
                        v153 = 0;
                      }

                      v128 = v200;
                    }
                    else
                    {
                      v153 = 0;
                      self = v201;
                    }
                  }
                  else
                  {
                    v153 = 0;
                    self = v201;
                    v66 = v199;
                  }
                }
                else
                {
                  v153 = 0;
                  v128 = v200;
                  self = v201;
                  v66 = v199;
                }
              }
              else
              {
                v153 = 0;
                v128 = v200;
                self = v201;
                v66 = v199;
              }
            }
            else
            {
              v153 = 0;
              v128 = v200;
              self = v201;
              v66 = v199;
            }
          }
          else
          {
            v153 = 0;
            v128 = 0;
            self = v201;
          }
        }
        else
        {
          v153 = 0;
          self = v201;
        }

        goto LABEL_56;
      }
      v51 = 0;
LABEL_30:
      v153 = 0;
LABEL_56:

      goto LABEL_57;
    }
    v158 = objc_msgSend_error(v4, v28, v29, v30, v31);

    if (!v158)
    {
      v172 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v204 = *MEMORY[0x1E4F28568];
      v205 = @"GDKnosisFact subjectId is nil";
      v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v159, (uint64_t)&v205, (uint64_t)&v204, 1);
      v51 = objc_msgSend_errorWithDomain_code_userInfo_(v172, v173, @"GDErrorDomain", 9, (uint64_t)v42);
      objc_msgSend_failWithError_(v4, v174, (uint64_t)v51, v175, v176);
      goto LABEL_30;
    }
    v27 = 0;
LABEL_22:
    v153 = 0;
LABEL_58:

    goto LABEL_59;
  }
  v154 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v154)
  {
    v160 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v208 = *MEMORY[0x1E4F28568];
    v209[0] = @"GDKnosisFact factId is nil";
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v155, (uint64_t)v209, (uint64_t)&v208, 1);
    v27 = objc_msgSend_errorWithDomain_code_userInfo_(v160, v161, @"GDErrorDomain", 9, (uint64_t)v18);
    objc_msgSend_failWithError_(v4, v162, (uint64_t)v27, v163, v164);
    goto LABEL_22;
  }
  v153 = 0;
LABEL_60:

  return v153;
}

- (void)encodeWithCoder:(id)a3
{
  factId = self->_factId;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_factId);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)factId, (uint64_t)v6, v8);

  score = self->_score;
  v10 = NSStringFromSelector(sel_score);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)score, (uint64_t)v10, v12);

  subjectId = self->_subjectId;
  uint64_t v14 = NSStringFromSelector(sel_subjectId);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)subjectId, (uint64_t)v14, v16);

  subjectAlias = self->_subjectAlias;
  v18 = NSStringFromSelector(sel_subjectAlias);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)subjectAlias, (uint64_t)v18, v20);

  subjectPopularity = self->_subjectPopularity;
  uint64_t v22 = NSStringFromSelector(sel_subjectPopularity);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)subjectPopularity, (uint64_t)v22, v24);

  subjectIsa = self->_subjectIsa;
  uint64_t v26 = NSStringFromSelector(sel_subjectIsa);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)subjectIsa, (uint64_t)v26, v28);

  predicateId = self->_predicateId;
  uint64_t v30 = NSStringFromSelector(sel_predicateId);
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)predicateId, (uint64_t)v30, v32);

  predicateAlias = self->_predicateAlias;
  uint64_t v34 = NSStringFromSelector(sel_predicateAlias);
  objc_msgSend_encodeObject_forKey_(v5, v35, (uint64_t)predicateAlias, (uint64_t)v34, v36);

  predicatePopularity = self->_predicatePopularity;
  v38 = NSStringFromSelector(sel_predicatePopularity);
  objc_msgSend_encodeObject_forKey_(v5, v39, (uint64_t)predicatePopularity, (uint64_t)v38, v40);

  objectID = self->_objectID;
  v42 = NSStringFromSelector(sel_objectID);
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)objectID, (uint64_t)v42, v44);

  objectAlias = self->_objectAlias;
  uint64_t v46 = NSStringFromSelector(sel_objectAlias);
  objc_msgSend_encodeObject_forKey_(v5, v47, (uint64_t)objectAlias, (uint64_t)v46, v48);

  objectPopularity = self->_objectPopularity;
  uint64_t v50 = NSStringFromSelector(sel_objectPopularity);
  objc_msgSend_encodeObject_forKey_(v5, v51, (uint64_t)objectPopularity, (uint64_t)v50, v52);

  qualifiers = self->_qualifiers;
  NSStringFromSelector(sel_qualifiers);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v54, (uint64_t)qualifiers, (uint64_t)v56, v55);
}

- (GDKnosisFact)initWithFactId:(id)a3 score:(id)a4 subjectId:(id)a5 subjectAlias:(id)a6 subjectPopularity:(id)a7 subjectIsa:(id)a8 predicateId:(id)a9 predicateAlias:(id)a10 predicatePopularity:(id)a11 objectID:(id)a12 objectAlias:(id)a13 objectPopularity:(id)a14 qualifiers:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v116 = a7;
  id v115 = a8;
  uint64_t v24 = v21;
  id v114 = a9;
  v25 = v22;
  id v113 = a10;
  id v26 = a11;
  v27 = v23;
  id v28 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a15;
  v117.receiver = self;
  v117.super_class = (Class)GDKnosisFact;
  uint64_t v36 = [(GDKnosisFact *)&v117 init];
  if (v36)
  {
    uint64_t v37 = objc_msgSend_copy(v20, v32, v33, v34, v35);
    factId = v36->_factId;
    v36->_factId = (NSString *)v37;

    uint64_t v43 = objc_msgSend_copy(v24, v39, v40, v41, v42);
    score = v36->_score;
    v36->_score = (NSNumber *)v43;

    uint64_t v49 = objc_msgSend_copy(v25, v45, v46, v47, v48);
    subjectId = v36->_subjectId;
    v36->_subjectId = (NSString *)v49;

    uint64_t v55 = objc_msgSend_copy(v27, v51, v52, v53, v54);
    subjectAlias = v36->_subjectAlias;
    v36->_subjectAlias = (NSArray *)v55;

    uint64_t v61 = objc_msgSend_copy(v116, v57, v58, v59, v60);
    subjectPopularity = v36->_subjectPopularity;
    v36->_subjectPopularity = (NSNumber *)v61;

    uint64_t v67 = objc_msgSend_copy(v115, v63, v64, v65, v66);
    subjectIsa = v36->_subjectIsa;
    v36->_subjectIsa = (NSArray *)v67;

    uint64_t v73 = objc_msgSend_copy(v114, v69, v70, v71, v72);
    predicateId = v36->_predicateId;
    v36->_predicateId = (NSString *)v73;

    uint64_t v79 = objc_msgSend_copy(v113, v75, v76, v77, v78);
    predicateAlias = v36->_predicateAlias;
    v36->_predicateAlias = (NSArray *)v79;

    uint64_t v85 = objc_msgSend_copy(v26, v81, v82, v83, v84);
    predicatePopularity = v36->_predicatePopularity;
    v36->_predicatePopularity = (NSNumber *)v85;

    uint64_t v91 = objc_msgSend_copy(v28, v87, v88, v89, v90);
    objectID = v36->_objectID;
    v36->_objectID = (NSString *)v91;

    uint64_t v97 = objc_msgSend_copy(v29, v93, v94, v95, v96);
    objectAlias = v36->_objectAlias;
    v36->_objectAlias = (NSArray *)v97;

    uint64_t v103 = objc_msgSend_copy(v30, v99, v100, v101, v102);
    objectPopularity = v36->_objectPopularity;
    v36->_objectPopularity = (NSNumber *)v103;

    uint64_t v109 = objc_msgSend_copy(v31, v105, v106, v107, v108);
    qualifiers = v36->_qualifiers;
    v36->_qualifiers = (NSArray *)v109;
  }
  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end