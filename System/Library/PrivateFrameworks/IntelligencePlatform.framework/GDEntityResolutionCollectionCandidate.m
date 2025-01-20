@interface GDEntityResolutionCollectionCandidate
+ (BOOL)supportsSecureCoding;
- (GDEntityResolutionCollectionCandidate)initWithCoder:(id)a3;
- (GDEntityResolutionCollectionCandidate)initWithPrimaryName:(id)a3 personToPerson:(id)a4 aliasConcat:(id)a5 entityAliasConcat:(id)a6 personFromOrganization:(id)a7 personFromLocation:(id)a8 personFromEventLocation:(id)a9 personFromEvent:(id)a10 firstPartyMsgTwoWeeks:(int64_t)a11 firstPartyMsgSixWeeks:(int64_t)a12 firstPartyMsgThreeMonths:(int64_t)a13 firstPartyMsgSixMonths:(int64_t)a14 thirdPartyMsgTwoWeeks:(int64_t)a15 thirdPartyMsgSixWeeks:(int64_t)a16 thirdPartyMsgThreeMonths:(int64_t)a17 thirdPartyMsgSixMonths:(int64_t)a18 callTwoWeeks:(int64_t)a19 callSixWeeks:(int64_t)a20 callTwelveWeeks:(int64_t)a21 callSixMonths:(int64_t)a22 identifier:(id)a23;
- (NSString)aliasConcat;
- (NSString)entityAliasConcat;
- (NSString)identifier;
- (NSString)personFromEvent;
- (NSString)personFromEventLocation;
- (NSString)personFromLocation;
- (NSString)personFromOrganization;
- (NSString)personToPerson;
- (NSString)primaryName;
- (id)description;
- (int64_t)callSixMonths;
- (int64_t)callSixWeeks;
- (int64_t)callTwelveWeeks;
- (int64_t)callTwoWeeks;
- (int64_t)firstPartyMsgSixMonths;
- (int64_t)firstPartyMsgSixWeeks;
- (int64_t)firstPartyMsgThreeMonths;
- (int64_t)firstPartyMsgTwoWeeks;
- (int64_t)thirdPartyMsgSixMonths;
- (int64_t)thirdPartyMsgSixWeeks;
- (int64_t)thirdPartyMsgThreeMonths;
- (int64_t)thirdPartyMsgTwoWeeks;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntityResolutionCollectionCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_personFromEvent, 0);
  objc_storeStrong((id *)&self->_personFromEventLocation, 0);
  objc_storeStrong((id *)&self->_personFromLocation, 0);
  objc_storeStrong((id *)&self->_personFromOrganization, 0);
  objc_storeStrong((id *)&self->_entityAliasConcat, 0);
  objc_storeStrong((id *)&self->_aliasConcat, 0);
  objc_storeStrong((id *)&self->_personToPerson, 0);

  objc_storeStrong((id *)&self->_primaryName, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)callSixMonths
{
  return self->_callSixMonths;
}

- (int64_t)callTwelveWeeks
{
  return self->_callTwelveWeeks;
}

- (int64_t)callSixWeeks
{
  return self->_callSixWeeks;
}

- (int64_t)callTwoWeeks
{
  return self->_callTwoWeeks;
}

- (int64_t)thirdPartyMsgSixMonths
{
  return self->_thirdPartyMsgSixMonths;
}

- (int64_t)thirdPartyMsgThreeMonths
{
  return self->_thirdPartyMsgThreeMonths;
}

- (int64_t)thirdPartyMsgSixWeeks
{
  return self->_thirdPartyMsgSixWeeks;
}

- (int64_t)thirdPartyMsgTwoWeeks
{
  return self->_thirdPartyMsgTwoWeeks;
}

- (int64_t)firstPartyMsgSixMonths
{
  return self->_firstPartyMsgSixMonths;
}

- (int64_t)firstPartyMsgThreeMonths
{
  return self->_firstPartyMsgThreeMonths;
}

- (int64_t)firstPartyMsgSixWeeks
{
  return self->_firstPartyMsgSixWeeks;
}

- (int64_t)firstPartyMsgTwoWeeks
{
  return self->_firstPartyMsgTwoWeeks;
}

- (NSString)personFromEvent
{
  return self->_personFromEvent;
}

- (NSString)personFromEventLocation
{
  return self->_personFromEventLocation;
}

- (NSString)personFromLocation
{
  return self->_personFromLocation;
}

- (NSString)personFromOrganization
{
  return self->_personFromOrganization;
}

- (NSString)entityAliasConcat
{
  return self->_entityAliasConcat;
}

- (NSString)aliasConcat
{
  return self->_aliasConcat;
}

- (NSString)personToPerson
{
  return self->_personToPerson;
}

- (NSString)primaryName
{
  return self->_primaryName;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_primaryName(self, a2, v2, v3, v4);
  v10 = objc_msgSend_stringWithFormat_(v5, v7, @"<GDEntityResolutionCollectionResult: %@>", v8, v9, v6);

  return v10;
}

- (GDEntityResolutionCollectionCandidate)initWithCoder:(id)a3
{
  v304[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_primaryName);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_aliasConcat);
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (!v18)
    {
      v140 = objc_msgSend_error(v4, v19, v20, v21, v22);

      if (v140)
      {
        v18 = 0;
        v135 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v151 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v301 = *MEMORY[0x1E4F28568];
      v302 = @"GDEntityResolutionCollectionResult aliasConcat is nil";
      v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v141, (uint64_t)&v302, (uint64_t)&v301, 1);
      v36 = objc_msgSend_errorWithDomain_code_userInfo_(v151, v152, @"GDErrorDomain", 9, (uint64_t)v27);
      objc_msgSend_failWithError_(v4, v153, (uint64_t)v36, v154, v155);
      goto LABEL_28;
    }
    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_entityAliasConcat);
    v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, (uint64_t)v24, v26);

    if (v27)
    {
      uint64_t v32 = objc_opt_class();
      v33 = NSStringFromSelector(sel_personToPerson);
      v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33, v35);

      if (v36)
      {
        uint64_t v41 = objc_opt_class();
        v42 = NSStringFromSelector(sel_personFromOrganization);
        v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v41, (uint64_t)v42, v44);

        if (v45)
        {
          v286 = self;
          uint64_t v50 = objc_opt_class();
          v51 = NSStringFromSelector(sel_personFromLocation);
          v54 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v50, (uint64_t)v51, v53);

          if (v54)
          {
            uint64_t v59 = objc_opt_class();
            v60 = NSStringFromSelector(sel_personFromLocation);
            uint64_t v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v59, (uint64_t)v60, v62);

            v284 = (void *)v63;
            if (v63)
            {
              uint64_t v68 = objc_opt_class();
              v69 = NSStringFromSelector(sel_personFromEvent);
              uint64_t v72 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v70, v68, (uint64_t)v69, v71);

              v285 = v54;
              if (v72)
              {
                v282 = v45;
                uint64_t v283 = v72;
                v77 = NSStringFromSelector(sel_firstPartyMsgTwoWeeks);
                uint64_t v81 = objc_msgSend_decodeIntegerForKey_(v4, v78, (uint64_t)v77, v79, v80);

                v86 = objc_msgSend_error(v4, v82, v83, v84, v85);

                self = v286;
                if (v86) {
                  goto LABEL_15;
                }
                uint64_t v281 = v81;
                v87 = NSStringFromSelector(sel_firstPartyMsgSixWeeks);
                uint64_t v91 = objc_msgSend_decodeIntegerForKey_(v4, v88, (uint64_t)v87, v89, v90);

                v96 = objc_msgSend_error(v4, v92, v93, v94, v95);

                if (v96) {
                  goto LABEL_15;
                }
                uint64_t v280 = v91;
                v97 = NSStringFromSelector(sel_firstPartyMsgThreeMonths);
                uint64_t v101 = objc_msgSend_decodeIntegerForKey_(v4, v98, (uint64_t)v97, v99, v100);

                v106 = objc_msgSend_error(v4, v102, v103, v104, v105);

                if (v106) {
                  goto LABEL_15;
                }
                uint64_t v279 = v101;
                v107 = NSStringFromSelector(sel_firstPartyMsgSixMonths);
                uint64_t v111 = objc_msgSend_decodeIntegerForKey_(v4, v108, (uint64_t)v107, v109, v110);

                v116 = objc_msgSend_error(v4, v112, v113, v114, v115);

                if (v116) {
                  goto LABEL_15;
                }
                v117 = NSStringFromSelector(sel_thirdPartyMsgTwoWeeks);
                uint64_t v278 = objc_msgSend_decodeIntegerForKey_(v4, v118, (uint64_t)v117, v119, v120);

                v125 = objc_msgSend_error(v4, v121, v122, v123, v124);

                if (v125
                  || (NSStringFromSelector(sel_thirdPartyMsgSixWeeks),
                      v126 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v277 = objc_msgSend_decodeIntegerForKey_(v4, v127, (uint64_t)v126, v128, v129),
                      v126,
                      objc_msgSend_error(v4, v130, v131, v132, v133),
                      v134 = objc_claimAutoreleasedReturnValue(),
                      v134,
                      v134))
                {
LABEL_15:
                  v135 = 0;
LABEL_16:
                  v136 = (void *)v283;
                  v137 = v284;
                  v45 = v282;
LABEL_45:

                  v54 = v285;
                  goto LABEL_46;
                }
                v197 = NSStringFromSelector(sel_thirdPartyMsgThreeMonths);
                uint64_t v276 = objc_msgSend_decodeIntegerForKey_(v4, v198, (uint64_t)v197, v199, v200);

                v205 = objc_msgSend_error(v4, v201, v202, v203, v204);

                if (v205) {
                  goto LABEL_59;
                }
                v206 = NSStringFromSelector(sel_thirdPartyMsgSixMonths);
                uint64_t v210 = objc_msgSend_decodeIntegerForKey_(v4, v207, (uint64_t)v206, v208, v209);

                v215 = objc_msgSend_error(v4, v211, v212, v213, v214);

                if (v215) {
                  goto LABEL_59;
                }
                v216 = NSStringFromSelector(sel_callTwoWeeks);
                uint64_t v275 = objc_msgSend_decodeIntegerForKey_(v4, v217, (uint64_t)v216, v218, v219);

                v224 = objc_msgSend_error(v4, v220, v221, v222, v223);

                if (v224) {
                  goto LABEL_59;
                }
                v225 = NSStringFromSelector(sel_callSixWeeks);
                uint64_t v274 = objc_msgSend_decodeIntegerForKey_(v4, v226, (uint64_t)v225, v227, v228);

                v233 = objc_msgSend_error(v4, v229, v230, v231, v232);

                if (v233) {
                  goto LABEL_59;
                }
                v234 = NSStringFromSelector(sel_callTwelveWeeks);
                uint64_t v273 = objc_msgSend_decodeIntegerForKey_(v4, v235, (uint64_t)v234, v236, v237);

                v242 = objc_msgSend_error(v4, v238, v239, v240, v241);

                if (v242
                  || (NSStringFromSelector(sel_callSixMonths),
                      v243 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v272 = objc_msgSend_decodeIntegerForKey_(v4, v244, (uint64_t)v243, v245, v246),
                      v243,
                      objc_msgSend_error(v4, v247, v248, v249, v250),
                      v251 = objc_claimAutoreleasedReturnValue(),
                      v251,
                      v251))
                {
LABEL_59:
                  v135 = 0;
                  self = v286;
                  goto LABEL_16;
                }
                uint64_t v252 = objc_opt_class();
                v253 = NSStringFromSelector(sel_identifier);
                uint64_t v256 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v254, v252, (uint64_t)v253, v255);

                if (v256)
                {
                  v186 = (void *)v256;
                  uint64_t v271 = v256;
                  uint64_t v270 = v111;
                  v45 = v282;
                  v137 = v284;
                  self = (GDEntityResolutionCollectionCandidate *)objc_retain((id)objc_msgSend_initWithPrimaryName_personToPerson_aliasConcat_entityAliasConcat_personFromOrganization_personFromLocation_personFromEventLocation_personFromEvent_firstPartyMsgTwoWeeks_firstPartyMsgSixWeeks_firstPartyMsgThreeMonths_firstPartyMsgSixMonths_thirdPartyMsgTwoWeeks_thirdPartyMsgSixWeeks_thirdPartyMsgThreeMonths_thirdPartyMsgSixMonths_callTwoWeeks_callSixWeeks_callTwelveWeeks_callSixMonths_identifier_(v286, v257, (uint64_t)v9, (uint64_t)v36, (uint64_t)v18, v27, v282, v285, v284, v283, v281, v280, v279, v270, v278, v277, v276, v210, v275,
                                                                                    v274,
                                                                                    v273,
                                                                                    v272,
                                                                                    v271));
                  v135 = self;
                }
                else
                {
                  v261 = objc_msgSend_error(v4, v257, v258, v259, v260);

                  if (!v261)
                  {
                    v263 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v287 = *MEMORY[0x1E4F28568];
                    v288 = @"GDEntityResolutionCollectionResult identifier is nil";
                    v264 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v262, (uint64_t)&v288, (uint64_t)&v287, 1);
                    v266 = objc_msgSend_errorWithDomain_code_userInfo_(v263, v265, @"GDErrorDomain", 9, (uint64_t)v264);
                    objc_msgSend_failWithError_(v4, v267, (uint64_t)v266, v268, v269);
                  }
                  v186 = 0;
                  v135 = 0;
                  self = v286;
                  v137 = v284;
                  v45 = v282;
                }
              }
              else
              {
                v177 = objc_msgSend_error(v4, v73, v74, v75, v76);

                self = v286;
                v137 = v284;
                if (v177)
                {
                  v136 = 0;
                  v135 = 0;
                  goto LABEL_45;
                }
                v190 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v289 = *MEMORY[0x1E4F28568];
                v290 = @"GDEntityResolutionCollectionResult personFromEvent is nil";
                v186 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v178, (uint64_t)&v290, (uint64_t)&v289, 1);
                v192 = objc_msgSend_errorWithDomain_code_userInfo_(v190, v191, @"GDErrorDomain", 9, (uint64_t)v186);
                objc_msgSend_failWithError_(v4, v193, (uint64_t)v192, v194, v195);

                uint64_t v283 = 0;
                v135 = 0;
              }
LABEL_44:

              v136 = (void *)v283;
              goto LABEL_45;
            }
            v170 = objc_msgSend_error(v4, v64, v65, v66, v67);

            if (!v170)
            {
              v285 = v54;
              v184 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v291 = *MEMORY[0x1E4F28568];
              v292 = @"GDEntityResolutionCollectionResult personFromEventLocation is nil";
              uint64_t v283 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v171, (uint64_t)&v292, (uint64_t)&v291, 1);
              v186 = objc_msgSend_errorWithDomain_code_userInfo_(v184, v185, @"GDErrorDomain", 9, v283);
              objc_msgSend_failWithError_(v4, v187, (uint64_t)v186, v188, v189);
              v135 = 0;
              self = v286;
              v137 = 0;
              goto LABEL_44;
            }
            v137 = 0;
            v135 = 0;
            self = v286;
LABEL_46:

            goto LABEL_47;
          }
          v163 = objc_msgSend_error(v4, v55, v56, v57, v58);

          if (!v163)
          {
            v285 = 0;
            v179 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v293 = *MEMORY[0x1E4F28568];
            v294 = @"GDEntityResolutionCollectionResult personFromLocation is nil";
            v137 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v164, (uint64_t)&v294, (uint64_t)&v293, 1);
            v136 = objc_msgSend_errorWithDomain_code_userInfo_(v179, v180, @"GDErrorDomain", 9, (uint64_t)v137);
            objc_msgSend_failWithError_(v4, v181, (uint64_t)v136, v182, v183);
            v135 = 0;
            self = v286;
            goto LABEL_45;
          }
          v54 = 0;
          v135 = 0;
          self = v286;
LABEL_47:

          goto LABEL_48;
        }
        v156 = objc_msgSend_error(v4, v46, v47, v48, v49);

        if (!v156)
        {
          v172 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v295 = *MEMORY[0x1E4F28568];
          v296 = @"GDEntityResolutionCollectionResult personFromOrganization is nil";
          v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v157, (uint64_t)&v296, (uint64_t)&v295, 1);
          v137 = objc_msgSend_errorWithDomain_code_userInfo_(v172, v173, @"GDErrorDomain", 9, (uint64_t)v54);
          objc_msgSend_failWithError_(v4, v174, (uint64_t)v137, v175, v176);
          v135 = 0;
          goto LABEL_46;
        }
        v45 = 0;
LABEL_32:
        v135 = 0;
LABEL_48:

        goto LABEL_49;
      }
      v149 = objc_msgSend_error(v4, v37, v38, v39, v40);

      if (!v149)
      {
        v165 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v297 = *MEMORY[0x1E4F28568];
        v298 = @"GDEntityResolutionCollectionResult personToPerson is nil";
        v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v150, (uint64_t)&v298, (uint64_t)&v297, 1);
        v54 = objc_msgSend_errorWithDomain_code_userInfo_(v165, v166, @"GDErrorDomain", 9, (uint64_t)v45);
        objc_msgSend_failWithError_(v4, v167, (uint64_t)v54, v168, v169);
        v135 = 0;
        goto LABEL_47;
      }
      v36 = 0;
LABEL_28:
      v135 = 0;
LABEL_49:

      goto LABEL_50;
    }
    v142 = objc_msgSend_error(v4, v28, v29, v30, v31);

    if (!v142)
    {
      v158 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v299 = *MEMORY[0x1E4F28568];
      v300 = @"GDEntityResolutionCollectionResult entityAliasConcat is nil";
      v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v143, (uint64_t)&v300, (uint64_t)&v299, 1);
      v45 = objc_msgSend_errorWithDomain_code_userInfo_(v158, v159, @"GDErrorDomain", 9, (uint64_t)v36);
      objc_msgSend_failWithError_(v4, v160, (uint64_t)v45, v161, v162);
      goto LABEL_32;
    }
    v27 = 0;
LABEL_24:
    v135 = 0;
LABEL_50:

    goto LABEL_51;
  }
  v138 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v138)
  {
    v144 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v303 = *MEMORY[0x1E4F28568];
    v304[0] = @"GDEntityResolutionCollectionResult primaryName is nil";
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v139, (uint64_t)v304, (uint64_t)&v303, 1);
    v27 = objc_msgSend_errorWithDomain_code_userInfo_(v144, v145, @"GDErrorDomain", 9, (uint64_t)v18);
    objc_msgSend_failWithError_(v4, v146, (uint64_t)v27, v147, v148);
    goto LABEL_24;
  }
  v135 = 0;
LABEL_52:

  return v135;
}

- (void)encodeWithCoder:(id)a3
{
  primaryName = self->_primaryName;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_primaryName);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)primaryName, (uint64_t)v6, v8);

  aliasConcat = self->_aliasConcat;
  v10 = NSStringFromSelector(sel_aliasConcat);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)aliasConcat, (uint64_t)v10, v12);

  entityAliasConcat = self->_entityAliasConcat;
  uint64_t v14 = NSStringFromSelector(sel_entityAliasConcat);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)entityAliasConcat, (uint64_t)v14, v16);

  personToPerson = self->_personToPerson;
  v18 = NSStringFromSelector(sel_personToPerson);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)personToPerson, (uint64_t)v18, v20);

  personFromOrganization = self->_personFromOrganization;
  uint64_t v22 = NSStringFromSelector(sel_personFromOrganization);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)personFromOrganization, (uint64_t)v22, v24);

  personFromLocation = self->_personFromLocation;
  uint64_t v26 = NSStringFromSelector(sel_personFromLocation);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)personFromLocation, (uint64_t)v26, v28);

  personFromEventLocation = self->_personFromEventLocation;
  uint64_t v30 = NSStringFromSelector(sel_personFromEvent);
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)personFromEventLocation, (uint64_t)v30, v32);

  personFromEvent = self->_personFromEvent;
  v34 = NSStringFromSelector(sel_personFromEvent);
  objc_msgSend_encodeObject_forKey_(v5, v35, (uint64_t)personFromEvent, (uint64_t)v34, v36);

  int64_t firstPartyMsgTwoWeeks = self->_firstPartyMsgTwoWeeks;
  uint64_t v38 = NSStringFromSelector(sel_firstPartyMsgTwoWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v39, firstPartyMsgTwoWeeks, (uint64_t)v38, v40);

  int64_t firstPartyMsgSixWeeks = self->_firstPartyMsgSixWeeks;
  v42 = NSStringFromSelector(sel_firstPartyMsgSixWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v43, firstPartyMsgSixWeeks, (uint64_t)v42, v44);

  int64_t firstPartyMsgThreeMonths = self->_firstPartyMsgThreeMonths;
  v46 = NSStringFromSelector(sel_firstPartyMsgThreeMonths);
  objc_msgSend_encodeInteger_forKey_(v5, v47, firstPartyMsgThreeMonths, (uint64_t)v46, v48);

  int64_t firstPartyMsgSixMonths = self->_firstPartyMsgSixMonths;
  uint64_t v50 = NSStringFromSelector(sel_firstPartyMsgSixMonths);
  objc_msgSend_encodeInteger_forKey_(v5, v51, firstPartyMsgSixMonths, (uint64_t)v50, v52);

  int64_t thirdPartyMsgTwoWeeks = self->_thirdPartyMsgTwoWeeks;
  v54 = NSStringFromSelector(sel_thirdPartyMsgTwoWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v55, thirdPartyMsgTwoWeeks, (uint64_t)v54, v56);

  int64_t thirdPartyMsgSixWeeks = self->_thirdPartyMsgSixWeeks;
  uint64_t v58 = NSStringFromSelector(sel_thirdPartyMsgSixWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v59, thirdPartyMsgSixWeeks, (uint64_t)v58, v60);

  int64_t thirdPartyMsgThreeMonths = self->_thirdPartyMsgThreeMonths;
  uint64_t v62 = NSStringFromSelector(sel_thirdPartyMsgThreeMonths);
  objc_msgSend_encodeInteger_forKey_(v5, v63, thirdPartyMsgThreeMonths, (uint64_t)v62, v64);

  int64_t thirdPartyMsgSixMonths = self->_thirdPartyMsgSixMonths;
  uint64_t v66 = NSStringFromSelector(sel_thirdPartyMsgSixMonths);
  objc_msgSend_encodeInteger_forKey_(v5, v67, thirdPartyMsgSixMonths, (uint64_t)v66, v68);

  int64_t callTwoWeeks = self->_callTwoWeeks;
  v70 = NSStringFromSelector(sel_callTwoWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v71, callTwoWeeks, (uint64_t)v70, v72);

  int64_t callSixWeeks = self->_callSixWeeks;
  uint64_t v74 = NSStringFromSelector(sel_callSixWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v75, callSixWeeks, (uint64_t)v74, v76);

  int64_t callTwelveWeeks = self->_callTwelveWeeks;
  v78 = NSStringFromSelector(sel_callTwelveWeeks);
  objc_msgSend_encodeInteger_forKey_(v5, v79, callTwelveWeeks, (uint64_t)v78, v80);

  int64_t callSixMonths = self->_callSixMonths;
  v82 = NSStringFromSelector(sel_callSixMonths);
  objc_msgSend_encodeInteger_forKey_(v5, v83, callSixMonths, (uint64_t)v82, v84);

  identifier = self->_identifier;
  NSStringFromSelector(sel_identifier);
  id v88 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v86, (uint64_t)identifier, (uint64_t)v88, v87);
}

- (GDEntityResolutionCollectionCandidate)initWithPrimaryName:(id)a3 personToPerson:(id)a4 aliasConcat:(id)a5 entityAliasConcat:(id)a6 personFromOrganization:(id)a7 personFromLocation:(id)a8 personFromEventLocation:(id)a9 personFromEvent:(id)a10 firstPartyMsgTwoWeeks:(int64_t)a11 firstPartyMsgSixWeeks:(int64_t)a12 firstPartyMsgThreeMonths:(int64_t)a13 firstPartyMsgSixMonths:(int64_t)a14 thirdPartyMsgTwoWeeks:(int64_t)a15 thirdPartyMsgSixWeeks:(int64_t)a16 thirdPartyMsgThreeMonths:(int64_t)a17 thirdPartyMsgSixMonths:(int64_t)a18 callTwoWeeks:(int64_t)a19 callSixWeeks:(int64_t)a20 callTwelveWeeks:(int64_t)a21 callSixMonths:(int64_t)a22 identifier:(id)a23
{
  id v92 = a3;
  id v29 = a4;
  id v30 = a5;
  id v31 = a6;
  id v32 = a7;
  id v33 = a8;
  id v34 = a10;
  id v35 = a23;
  v93.receiver = self;
  v93.super_class = (Class)GDEntityResolutionCollectionCandidate;
  uint64_t v40 = [(GDEntityResolutionCollectionCandidate *)&v93 init];
  if (v40)
  {
    uint64_t v41 = objc_msgSend_copy(v92, v36, v37, v38, v39);
    primaryName = v40->_primaryName;
    v40->_primaryName = (NSString *)v41;

    uint64_t v47 = objc_msgSend_copy(v29, v43, v44, v45, v46);
    personToPerson = v40->_personToPerson;
    v40->_personToPerson = (NSString *)v47;

    uint64_t v53 = objc_msgSend_copy(v30, v49, v50, v51, v52);
    aliasConcat = v40->_aliasConcat;
    v40->_aliasConcat = (NSString *)v53;

    uint64_t v59 = objc_msgSend_copy(v31, v55, v56, v57, v58);
    entityAliasConcat = v40->_entityAliasConcat;
    v40->_entityAliasConcat = (NSString *)v59;

    uint64_t v65 = objc_msgSend_copy(v32, v61, v62, v63, v64);
    personFromOrganization = v40->_personFromOrganization;
    v40->_personFromOrganization = (NSString *)v65;

    uint64_t v71 = objc_msgSend_copy(v33, v67, v68, v69, v70);
    personFromLocation = v40->_personFromLocation;
    v40->_personFromLocation = (NSString *)v71;

    uint64_t v77 = objc_msgSend_copy(v34, v73, v74, v75, v76);
    personFromEventLocation = v40->_personFromEventLocation;
    v40->_personFromEventLocation = (NSString *)v77;

    uint64_t v83 = objc_msgSend_copy(v34, v79, v80, v81, v82);
    personFromEvent = v40->_personFromEvent;
    v40->_personFromEvent = (NSString *)v83;

    v40->_int64_t firstPartyMsgTwoWeeks = a11;
    v40->_int64_t firstPartyMsgSixWeeks = a12;
    v40->_int64_t firstPartyMsgThreeMonths = a13;
    v40->_int64_t firstPartyMsgSixMonths = a14;
    v40->_int64_t thirdPartyMsgTwoWeeks = a15;
    v40->_int64_t thirdPartyMsgSixWeeks = a16;
    v40->_int64_t thirdPartyMsgThreeMonths = a17;
    v40->_int64_t thirdPartyMsgSixMonths = a18;
    v40->_int64_t callTwoWeeks = a19;
    v40->_int64_t callSixWeeks = a20;
    v40->_int64_t callTwelveWeeks = a21;
    v40->_int64_t callSixMonths = a22;
    uint64_t v89 = objc_msgSend_copy(v35, v85, v86, v87, v88);
    identifier = v40->_identifier;
    v40->_identifier = (NSString *)v89;
  }
  return v40;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end