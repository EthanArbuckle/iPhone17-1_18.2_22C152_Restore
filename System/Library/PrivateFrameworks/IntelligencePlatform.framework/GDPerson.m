@interface GDPerson
+ (unint64_t)triplesColumnsRequiredForRendering;
- (BOOL)isFavorite;
- (GDEntityIdentifier)entityIdentifier;
- (GDPerson)initWithTriplesIterator:(id)a3;
- (GDPersonNameComponents)nameComponents;
- (NSArray)contactIdentifiers;
- (NSArray)customIdentifiers;
- (NSArray)emails;
- (NSArray)names;
- (NSArray)phoneNumbers;
- (NSArray)postalAddressLinks;
- (NSArray)relatedPeople;
- (NSArray)softwareLinks;
- (NSArray)visualIdentifierObjects;
- (NSArray)visualIdentifiers;
- (NSDateComponents)anniversary;
- (NSDateComponents)dateOfBirth;
- (NSDateComponents)nonGregorianDateOfBirth;
- (id)dateComponentsFromJSONString:(id)a3;
- (id)description;
- (int64_t)type;
@end

@implementation GDPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentifierObjects, 0);
  objc_storeStrong((id *)&self->_visualIdentifiers, 0);
  objc_storeStrong((id *)&self->_customIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_anniversary, 0);
  objc_storeStrong((id *)&self->_nonGregorianDateOfBirth, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_relatedPeople, 0);
  objc_storeStrong((id *)&self->_softwareLinks, 0);
  objc_storeStrong((id *)&self->_postalAddressLinks, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_names, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)visualIdentifierObjects
{
  return self->_visualIdentifierObjects;
}

- (NSArray)visualIdentifiers
{
  return self->_visualIdentifiers;
}

- (NSArray)customIdentifiers
{
  return self->_customIdentifiers;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDateComponents)anniversary
{
  return self->_anniversary;
}

- (NSDateComponents)nonGregorianDateOfBirth
{
  return self->_nonGregorianDateOfBirth;
}

- (NSDateComponents)dateOfBirth
{
  return self->_dateOfBirth;
}

- (NSArray)emails
{
  return self->_emails;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)relatedPeople
{
  return self->_relatedPeople;
}

- (NSArray)softwareLinks
{
  return self->_softwareLinks;
}

- (NSArray)postalAddressLinks
{
  return self->_postalAddressLinks;
}

- (GDPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSArray)names
{
  return self->_names;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_entityIdentifier(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_nameComponents(self, v8, v9, v10, v11);
  v17 = (void *)v12;
  if (v12) {
    v18 = (__CFString *)v12;
  }
  else {
    v18 = &stru_1F0AE2ED0;
  }
  uint64_t v19 = objc_msgSend_dateOfBirth(self, v13, v14, v15, v16);
  v24 = (void *)v19;
  if (v19) {
    v25 = (__CFString *)v19;
  }
  else {
    v25 = &stru_1F0AE2ED0;
  }
  v26 = objc_msgSend_names(self, v20, v21, v22, v23);
  v30 = objc_msgSend_componentsJoinedByString_(v26, v27, @"|", v28, v29);
  unsigned int isFavorite = objc_msgSend_isFavorite(self, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_type(self, v36, v37, v38, v39);
  v44 = objc_msgSend_stringWithFormat_(v6, v41, @"<GDPerson %@, %@, dob:%@, ns:%@, f:%d, t:%td>", v42, v43, v7, v18, v25, v30, isFavorite, v40);

  return v44;
}

- (id)dateComponentsFromJSONString:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7 = objc_msgSend_dataUsingEncoding_(v3, v4, 4, v5, v6);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1B3EB26F0]();
    id v106 = 0;
    uint64_t v10 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v9, (uint64_t)v7, 1, (uint64_t)&v106);
    uint64_t v11 = v106;
    if (v10)
    {
      uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v10, v12, @"calendar", v13, v14);
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v15, v16, @"locale", v17, v18);
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"identifier", v21, v22);

      if (v23)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F1CA20]);
        uint64_t v31 = objc_msgSend_initWithLocaleIdentifier_(v27, v28, (uint64_t)v23, v29, v30);
      }
      else
      {
        uint64_t v31 = 0;
      }
      uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v10, v24, @"calendar", v25, v26);
      uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"timeZone", v35, v36);
      v41 = objc_msgSend_objectForKeyedSubscript_(v37, v38, @"identifier", v39, v40);

      if (v41)
      {
        id v45 = objc_alloc(MEMORY[0x1E4F1CAF0]);
        v49 = objc_msgSend_initWithName_(v45, v46, (uint64_t)v41, v47, v48);
      }
      else
      {
        v49 = 0;
      }
      v50 = objc_msgSend_objectForKeyedSubscript_(v10, v42, @"calendar", v43, v44);
      v54 = objc_msgSend_objectForKeyedSubscript_(v50, v51, @"identifier", v52, v53);

      v104 = (void *)v31;
      v105 = v11;
      if (v54)
      {
        id v55 = objc_alloc(MEMORY[0x1E4F1C9A8]);
        v59 = objc_msgSend_initWithCalendarIdentifier_(v55, v56, (uint64_t)v54, v57, v58);
        v63 = v59;
        if (v49) {
          objc_msgSend_setTimeZone_(v59, v60, (uint64_t)v49, v61, v62);
        }
        if (v31) {
          objc_msgSend_setLocale_(v63, v60, v31, v61, v62);
        }
      }
      else
      {
        v63 = 0;
      }
      uint64_t v32 = objc_opt_new();
      objc_msgSend_setCalendar_(v32, v64, (uint64_t)v63, v65, v66);
      v70 = objc_msgSend_objectForKeyedSubscript_(v10, v67, @"year", v68, v69);
      uint64_t v75 = objc_msgSend_integerValue(v70, v71, v72, v73, v74);
      objc_msgSend_setYear_(v32, v76, v75, v77, v78);

      v82 = objc_msgSend_objectForKeyedSubscript_(v10, v79, @"month", v80, v81);
      uint64_t v87 = objc_msgSend_integerValue(v82, v83, v84, v85, v86);
      objc_msgSend_setMonth_(v32, v88, v87, v89, v90);

      v94 = objc_msgSend_objectForKeyedSubscript_(v10, v91, @"day", v92, v93);
      uint64_t v99 = objc_msgSend_integerValue(v94, v95, v96, v97, v98);
      objc_msgSend_setDay_(v32, v100, v99, v101, v102);

      uint64_t v11 = v105;
    }
    else
    {
      uint64_t v23 = GDViewLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v108 = v3;
        _os_log_error_impl(&dword_1B2996000, v23, OS_LOG_TYPE_ERROR, "GDPerson: failed to decode date components string %@", buf, 0xCu);
      }
      uint64_t v32 = 0;
    }
  }
  else
  {
    uint64_t v11 = GDViewLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v108 = v3;
      _os_log_error_impl(&dword_1B2996000, v11, OS_LOG_TYPE_ERROR, "GDPerson: failed to decode date components string %@", buf, 0xCu);
    }
    uint64_t v32 = 0;
  }

  return v32;
}

- (GDPerson)initWithTriplesIterator:(id)a3
{
  uint64_t v400 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v398.receiver = self;
  v398.super_class = (Class)GDPerson;
  uint64_t v5 = [(GDPerson *)&v398 init];
  if (!v5) {
    goto LABEL_83;
  }
  v385 = objc_opt_new();
  v384 = objc_opt_new();
  v383 = objc_opt_new();
  v390 = objc_opt_new();
  v389 = objc_opt_new();
  v388 = objc_opt_new();
  v387 = objc_opt_new();
  v386 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  long long v394 = 0u;
  long long v395 = 0u;
  long long v396 = 0u;
  long long v397 = 0u;
  id v382 = v4;
  id obj = v4;
  uint64_t v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v394, (uint64_t)v399, 16);
  if (!v392) {
    goto LABEL_80;
  }
  uint64_t v391 = *(void *)v395;
  do
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = v7;
      if (*(void *)v395 != v391) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = v8;
      uint64_t v17 = v6;
      uint64_t v18 = *(void **)(*((void *)&v394 + 1) + 8 * v14);
      if (!v5->_entityIdentifier)
      {
        uint64_t v19 = [GDEntityIdentifier alloc];
        v24 = objc_msgSend_subject(v18, v20, v21, v22, v23);
        uint64_t v28 = objc_msgSend_initWithString_(v19, v25, (uint64_t)v24, v26, v27);
        entityIdentifier = v5->_entityIdentifier;
        v5->_entityIdentifier = (GDEntityIdentifier *)v28;
      }
      uint64_t v30 = objc_msgSend_predicate(v18, v10, v11, v12, v13, v382);
      if (objc_msgSend_isEqual_(v30, v31, @"PS225", v32, v33))
      {
        uint64_t v38 = objc_msgSend_relationshipPredicate(v18, v34, v35, v36, v37);
        if (objc_msgSend_isEqual_(v38, v39, @"PS1", v40, v41))
        {
          v46 = objc_msgSend_object(v18, v42, v43, v44, v45);
          int isEqual = objc_msgSend_isEqual_(v46, v47, @"CS29", v48, v49);

          if (isEqual)
          {
            v51 = [GDLocationLink alloc];
            v56 = objc_msgSend_relationshipIdIterator(obj, v52, v53, v54, v55);
            v60 = objc_msgSend_initWithRelationshipIdTriplesIterator_(v51, v57, (uint64_t)v56, v58, v59);

            if (v60) {
              objc_msgSend_addObject_(v390, v61, (uint64_t)v60, v62, v63);
            }
            goto LABEL_26;
          }
        }
        else
        {
        }
      }
      if (objc_msgSend_isEqual_(v30, v34, @"nm_hasSoftware", v36, v37))
      {
        uint64_t v68 = objc_msgSend_relationshipPredicate(v18, v64, v65, v66, v67);
        if (objc_msgSend_isEqual_(v68, v69, @"PS1", v70, v71))
        {
          v76 = objc_msgSend_object(v18, v72, v73, v74, v75);
          int v80 = objc_msgSend_isEqual_(v76, v77, @"nm_softwareRelationshipType", v78, v79);

          if (v80)
          {
            uint64_t v81 = [GDSoftwareLink alloc];
            uint64_t v86 = objc_msgSend_relationshipIdIterator(obj, v82, v83, v84, v85);
            v60 = objc_msgSend_initWithRelationshipIdTriplesIterator_(v81, v87, (uint64_t)v86, v88, v89);

            if (v60) {
              objc_msgSend_addObject_(v389, v90, (uint64_t)v60, v91, v92);
            }
            goto LABEL_26;
          }
        }
        else
        {
        }
      }
      if (objc_msgSend_isEqual_(v30, v64, @"PS598", v66, v67))
      {
        uint64_t v97 = objc_msgSend_relationshipPredicate(v18, v93, v94, v95, v96);
        if (objc_msgSend_isEqual_(v97, v98, @"PS1", v99, v100))
        {
          v105 = objc_msgSend_object(v18, v101, v102, v103, v104);
          int v109 = objc_msgSend_isEqual_(v105, v106, @"CS168", v107, v108);

          if (v109)
          {
            v110 = [GDPersonLink alloc];
            v115 = objc_msgSend_relationshipIdIterator(obj, v111, v112, v113, v114);
            v60 = objc_msgSend_initWithRelationshipIdTriplesIterator_(v110, v116, (uint64_t)v115, v117, v118);

            if (v60) {
              objc_msgSend_addObject_(v388, v119, (uint64_t)v60, v120, v121);
            }
            goto LABEL_26;
          }
        }
        else
        {
        }
      }
      if (objc_msgSend_isEqual_(v30, v93, @"PS72", v95, v96))
      {
        v126 = objc_msgSend_relationshipPredicate(v18, v122, v123, v124, v125);
        if (objc_msgSend_isEqual_(v126, v127, @"PS1", v128, v129))
        {
          v134 = objc_msgSend_object(v18, v130, v131, v132, v133);
          int v138 = objc_msgSend_isEqual_(v134, v135, @"CS22", v136, v137);

          if (v138)
          {
            v139 = [GDPersonIdentifier alloc];
            v144 = objc_msgSend_relationshipIdIterator(obj, v140, v141, v142, v143);
            v60 = objc_msgSend_initWithRelationshipIdTriplesIterator_(v139, v145, (uint64_t)v144, v146, v147);

            if (!v60)
            {
LABEL_26:
              uint64_t v6 = v17;
LABEL_39:
              v7 = v15;
              goto LABEL_40;
            }
            v152 = objc_msgSend_type(v60, v148, v149, v150, v151);
            int v156 = objc_msgSend_isEqual_(v152, v153, @"CNContact", v154, v155);

            uint64_t v6 = v17;
            if (v156)
            {
              v161 = objc_msgSend_identifier(v60, v157, v158, v159, v160);
              objc_msgSend_addObject_(v387, v162, (uint64_t)v161, v163, v164);
              v7 = v15;
            }
            else
            {
              v217 = objc_msgSend_type(v60, v157, v158, v159, v160);
              int v221 = objc_msgSend_isEqual_(v217, v218, @"INPerson", v219, v220);

              v7 = v15;
              if (!v221) {
                goto LABEL_40;
              }
              v161 = objc_msgSend_identifier(v60, v222, v223, v224, v225);
              objc_msgSend_addObject_(v386, v226, (uint64_t)v161, v227, v228);
            }

            goto LABEL_40;
          }
        }
        else
        {
        }
      }
      if (objc_msgSend_isEqual_(v30, v122, @"nm_hasVisualIdentifier", v124, v125))
      {
        v168 = [GDVisualIdentifier alloc];
        v173 = objc_msgSend_relationshipIdIterator(obj, v169, v170, v171, v172);
        v60 = objc_msgSend_initWithRelationshipIdTriplesIterator_(v168, v174, (uint64_t)v173, v175, v176);

        uint64_t v6 = v17;
        if (!v60) {
          goto LABEL_39;
        }
        v181 = objc_msgSend_visualIdentifier(v60, v177, v178, v179, v180);
        objc_msgSend_addObject_(v17, v182, (uint64_t)v181, v183, v184);

        v7 = v15;
        objc_msgSend_addObject_(v15, v185, (uint64_t)v60, v186, v187);
LABEL_40:
        v8 = v16;
LABEL_41:

        goto LABEL_42;
      }
      uint64_t v6 = v17;
      v8 = v16;
      if (objc_msgSend_isEqual_(v30, v165, @"PS545", v166, v167))
      {
        v60 = objc_msgSend_prefixes(v16, v188, v189, v190, v191);
        v196 = objc_msgSend_object(v18, v192, v193, v194, v195);
        objc_msgSend_addObject_(v60, v197, (uint64_t)v196, v198, v199);

        v7 = v15;
        goto LABEL_41;
      }
      v7 = v15;
      if (objc_msgSend_isEqual_(v30, v188, @"PS312", v190, v191))
      {
        uint64_t v204 = objc_msgSend_givenNames(v16, v200, v201, v202, v203);
LABEL_59:
        v60 = (void *)v204;
        v237 = objc_msgSend_object(v18, v205, v206, v207, v208);
        objc_msgSend_addObject_(v60, v238, (uint64_t)v237, v239, v240);

        goto LABEL_41;
      }
      if (objc_msgSend_isEqual_(v30, v200, @"PS546", v202, v203))
      {
        uint64_t v204 = objc_msgSend_middleNames(v16, v209, v210, v211, v212);
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v30, v209, @"PS441", v211, v212))
      {
        uint64_t v204 = objc_msgSend_familyNames(v16, v213, v214, v215, v216);
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v30, v213, @"PS547", v215, v216))
      {
        uint64_t v204 = objc_msgSend_suffixes(v16, v229, v230, v231, v232);
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v30, v229, @"PS89", v231, v232))
      {
        uint64_t v204 = objc_msgSend_nicknames(v16, v233, v234, v235, v236);
        goto LABEL_59;
      }
      if (objc_msgSend_isEqual_(v30, v233, @"PS33", v235, v236))
      {
        v60 = objc_msgSend_object(v18, v241, v242, v243, v244);
        objc_msgSend_addObject_(v385, v245, (uint64_t)v60, v246, v247);
        goto LABEL_41;
      }
      if (objc_msgSend_isEqual_(v30, v241, @"PS37", v243, v244))
      {
        v60 = objc_msgSend_object(v18, v248, v249, v250, v251);
        uint64_t v255 = objc_msgSend_dateComponentsFromJSONString_(v5, v252, (uint64_t)v60, v253, v254);
        dateOfBirth = v5->_dateOfBirth;
        v5->_dateOfBirth = (NSDateComponents *)v255;
LABEL_68:

        goto LABEL_41;
      }
      if (objc_msgSend_isEqual_(v30, v248, @"nm_nonGregorianBirthday", v250, v251))
      {
        v60 = objc_msgSend_object(v18, v257, v258, v259, v260);
        uint64_t v264 = objc_msgSend_dateComponentsFromJSONString_(v5, v261, (uint64_t)v60, v262, v263);
        dateOfBirth = v5->_nonGregorianDateOfBirth;
        v5->_nonGregorianDateOfBirth = (NSDateComponents *)v264;
        goto LABEL_68;
      }
      if (objc_msgSend_isEqual_(v30, v257, @"nm_anniversary", v259, v260))
      {
        v60 = objc_msgSend_object(v18, v265, v266, v267, v268);
        uint64_t v272 = objc_msgSend_dateComponentsFromJSONString_(v5, v269, (uint64_t)v60, v270, v271);
        dateOfBirth = v5->_anniversary;
        v5->_anniversary = (NSDateComponents *)v272;
        goto LABEL_68;
      }
      if ((objc_msgSend_isEqual_(v30, v265, @"PS407", v267, v268) & 1) != 0
        || (objc_msgSend_relationshipPredicate(v18, v273, v274, v275, v276),
            v277 = objc_claimAutoreleasedReturnValue(),
            int v281 = objc_msgSend_isEqual_(v277, v278, @"PS407", v279, v280),
            v277,
            v281))
      {
        v60 = objc_msgSend_object(v18, v273, v274, v275, v276);
        objc_msgSend_addObject_(v384, v282, (uint64_t)v60, v283, v284);
        goto LABEL_40;
      }
      if ((objc_msgSend_isEqual_(v30, v273, @"PS406", v275, v276) & 1) != 0
        || (objc_msgSend_relationshipPredicate(v18, v285, v286, v287, v288),
            v289 = objc_claimAutoreleasedReturnValue(),
            int v293 = objc_msgSend_isEqual_(v289, v290, @"PS406", v291, v292),
            v289,
            v293))
      {
        v60 = objc_msgSend_object(v18, v285, v286, v287, v288);
        objc_msgSend_addObject_(v383, v294, (uint64_t)v60, v295, v296);
        goto LABEL_40;
      }
      if (objc_msgSend_isEqual_(v30, v285, @"nm_personType", v287, v288))
      {
        v60 = objc_msgSend_object(v18, v297, v298, v299, v300);
        v5->_type = objc_msgSend_integerValue(v60, v301, v302, v303, v304);
        goto LABEL_40;
      }
      v8 = v16;
      if (objc_msgSend_isEqual_(v30, v297, @"nm_isFavorite", v299, v300))
      {
        v60 = objc_msgSend_object(v18, v305, v306, v307, v308);
        v5->_unsigned int isFavorite = objc_msgSend_integerValue(v60, v309, v310, v311, v312) != 0;
        goto LABEL_41;
      }
LABEL_42:

      ++v14;
    }
    while (v392 != v14);
    uint64_t v313 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v394, (uint64_t)v399, 16);
    uint64_t v392 = v313;
  }
  while (v313);
LABEL_80:

  v318 = (GDPerson *)v5->_entityIdentifier;
  if (v318)
  {
    uint64_t v319 = objc_msgSend_copy(v385, v314, v315, v316, v317);
    names = v5->_names;
    v5->_names = (NSArray *)v319;

    v321 = [GDPersonNameComponents alloc];
    uint64_t v325 = objc_msgSend_initWithNameComponentsBuilder_(v321, v322, (uint64_t)v8, v323, v324);
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (GDPersonNameComponents *)v325;

    uint64_t v331 = objc_msgSend_copy(v384, v327, v328, v329, v330);
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v331;

    uint64_t v337 = objc_msgSend_copy(v383, v333, v334, v335, v336);
    emails = v5->_emails;
    v5->_emails = (NSArray *)v337;

    uint64_t v343 = objc_msgSend_copy(v390, v339, v340, v341, v342);
    postalAddressLinks = v5->_postalAddressLinks;
    v5->_postalAddressLinks = (NSArray *)v343;

    uint64_t v349 = objc_msgSend_copy(v389, v345, v346, v347, v348);
    softwareLinks = v5->_softwareLinks;
    v5->_softwareLinks = (NSArray *)v349;

    uint64_t v355 = objc_msgSend_copy(v388, v351, v352, v353, v354);
    relatedPeople = v5->_relatedPeople;
    v5->_relatedPeople = (NSArray *)v355;

    uint64_t v361 = objc_msgSend_copy(v387, v357, v358, v359, v360);
    contactIdentifiers = v5->_contactIdentifiers;
    v5->_contactIdentifiers = (NSArray *)v361;

    uint64_t v367 = objc_msgSend_copy(v386, v363, v364, v365, v366);
    customIdentifiers = v5->_customIdentifiers;
    v5->_customIdentifiers = (NSArray *)v367;

    uint64_t v373 = objc_msgSend_copy(v6, v369, v370, v371, v372);
    visualIdentifiers = v5->_visualIdentifiers;
    v5->_visualIdentifiers = (NSArray *)v373;

    uint64_t v379 = objc_msgSend_copy(v7, v375, v376, v377, v378);
    visualIdentifierObjects = v5->_visualIdentifierObjects;
    v5->_visualIdentifierObjects = (NSArray *)v379;
  }
  id v4 = v382;
  if (v318) {
LABEL_83:
  }
    v318 = v5;

  return v318;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end