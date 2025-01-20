@interface CCContactContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCContactContent)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 previousFamilyName:(id)a6 nickname:(id)a7 namePrefix:(id)a8 nameSuffix:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 socialProfiles:(id)a14 instantMessageAddresses:(id)a15 relations:(id)a16 organizationName:(id)a17 departmentName:(id)a18 jobTitle:(id)a19 phoneticGivenName:(id)a20 phoneticMiddleName:(id)a21 phoneticFamilyName:(id)a22 phoneticOrganizationName:(id)a23 note:(id)a24 birthday:(id)a25 nonGregorianBirthday:(id)a26 dates:(id)a27 error:(id *)a28;
- (CCContactContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCContactDate)birthday;
- (CCContactDate)nonGregorianBirthday;
- (NSArray)dates;
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)relations;
- (NSArray)socialProfiles;
- (NSArray)urlAddresses;
- (NSString)departmentName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)jobTitle;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)note;
- (NSString)organizationName;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticOrganizationName;
- (NSString)previousFamilyName;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCContactContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

- (CCContactContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v252 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v243 = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"givenName"];
    v10 = [v6 objectForKeyedSubscript:@"middleName"];
    v192 = [v6 objectForKeyedSubscript:@"familyName"];
    v191 = [v6 objectForKeyedSubscript:@"previousFamilyName"];
    v190 = [v6 objectForKeyedSubscript:@"nickname"];
    v189 = [v6 objectForKeyedSubscript:@"namePrefix"];
    v188 = [v6 objectForKeyedSubscript:@"nameSuffix"];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"phoneNumbers"];
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      id v242 = v8;
      char v13 = CCValidateIsInstanceOfExpectedClass();
      id v14 = v8;

      if ((v13 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v15 = v12;
LABEL_161:

        id v8 = v14;
        goto LABEL_162;
      }
      v168 = a4;
      v183 = v10;
      v161 = self;
      v15 = objc_opt_new();
      long long v238 = 0u;
      long long v239 = 0u;
      long long v240 = 0u;
      long long v241 = 0u;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v238 objects:v251 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v239;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v239 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v238 + 1) + 8 * i);
            v22 = [CCContactPhoneNumber alloc];
            id v237 = 0;
            v23 = [(CCContactPhoneNumber *)v22 initWithJSONDictionary:v21 error:&v237];
            id v24 = v237;
            if (v23) {
              BOOL v25 = v24 == 0;
            }
            else {
              BOOL v25 = 0;
            }
            if (!v25)
            {
              v41 = v24;
              CCSetError();

              v42 = 0;
              v15 = v16;
              self = v161;
              v10 = v183;
              goto LABEL_161;
            }
            [v15 addObject:v23];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v238 objects:v251 count:16];
        }
        while (v18);
      }

      self = v161;
      a4 = v168;
    }
    else
    {
      v15 = 0;
      id v14 = v8;
    }
    uint64_t v26 = [v6 objectForKeyedSubscript:@"emailAddresses"];
    if (v26)
    {
      v27 = (void *)v26;
      objc_opt_class();
      id v236 = v14;
      char v28 = CCValidateIsInstanceOfExpectedClass();
      id v29 = v14;

      if ((v28 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v30 = v27;
LABEL_160:

        id v14 = v29;
        goto LABEL_161;
      }
      v169 = a4;
      v176 = v9;
      v184 = v10;
      v162 = self;
      v30 = objc_opt_new();
      long long v232 = 0u;
      long long v233 = 0u;
      long long v234 = 0u;
      long long v235 = 0u;
      id v31 = v27;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v232 objects:v250 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v233;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v233 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v232 + 1) + 8 * j);
            v37 = [CCContactEmailAddress alloc];
            id v231 = 0;
            v38 = [(CCContactEmailAddress *)v37 initWithJSONDictionary:v36 error:&v231];
            id v39 = v231;
            if (v38) {
              BOOL v40 = v39 == 0;
            }
            else {
              BOOL v40 = 0;
            }
            if (!v40)
            {
              v57 = v39;
              CCSetError();

              v42 = 0;
              v30 = v31;
              self = v162;
              v9 = v176;
              v10 = v184;
              goto LABEL_160;
            }
            [v30 addObject:v38];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v232 objects:v250 count:16];
        }
        while (v33);
      }

      a4 = v169;
      v9 = v176;
    }
    else
    {
      v184 = v10;
      v30 = 0;
      id v29 = v14;
    }
    uint64_t v43 = [v6 objectForKeyedSubscript:@"postalAddresses"];
    if (v43)
    {
      v44 = (void *)v43;
      objc_opt_class();
      id v230 = v29;
      char v45 = CCValidateIsInstanceOfExpectedClass();
      id v46 = v29;

      if ((v45 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        id v47 = v44;
        v10 = v184;
LABEL_159:

        id v29 = v46;
        goto LABEL_160;
      }
      v170 = a4;
      v177 = v9;
      v163 = self;
      v187 = objc_opt_new();
      long long v226 = 0u;
      long long v227 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      id v47 = v44;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v226 objects:v249 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v227;
        do
        {
          for (uint64_t k = 0; k != v49; ++k)
          {
            if (*(void *)v227 != v50) {
              objc_enumerationMutation(v47);
            }
            uint64_t v52 = *(void *)(*((void *)&v226 + 1) + 8 * k);
            v53 = [CCContactPostalAddress alloc];
            id v225 = 0;
            v54 = [(CCContactPostalAddress *)v53 initWithJSONDictionary:v52 error:&v225];
            id v55 = v225;
            if (v54) {
              BOOL v56 = v55 == 0;
            }
            else {
              BOOL v56 = 0;
            }
            if (!v56)
            {
              v72 = v55;
              CCSetError();

              v42 = 0;
              self = v163;
              v9 = v177;
              v10 = v184;
              goto LABEL_159;
            }
            [v187 addObject:v54];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v226 objects:v249 count:16];
        }
        while (v49);
      }

      self = v163;
      a4 = v170;
      v9 = v177;
    }
    else
    {
      v187 = 0;
      id v46 = v29;
    }
    uint64_t v58 = [v6 objectForKeyedSubscript:@"urlAddresses"];
    if (v58)
    {
      v59 = (void *)v58;
      objc_opt_class();
      id v224 = v46;
      char v60 = CCValidateIsInstanceOfExpectedClass();
      id v61 = v46;

      if ((v60 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        id v62 = v59;
        v10 = v184;
LABEL_158:

        id v46 = v61;
        id v47 = v187;
        goto LABEL_159;
      }
      v171 = a4;
      v178 = v9;
      v164 = self;
      v160 = objc_opt_new();
      long long v220 = 0u;
      long long v221 = 0u;
      long long v222 = 0u;
      long long v223 = 0u;
      id v62 = v59;
      uint64_t v63 = [v62 countByEnumeratingWithState:&v220 objects:v248 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v221;
        do
        {
          for (uint64_t m = 0; m != v64; ++m)
          {
            if (*(void *)v221 != v65) {
              objc_enumerationMutation(v62);
            }
            uint64_t v67 = *(void *)(*((void *)&v220 + 1) + 8 * m);
            v68 = [CCContactURLAddress alloc];
            id v219 = 0;
            v69 = [(CCContactURLAddress *)v68 initWithJSONDictionary:v67 error:&v219];
            id v70 = v219;
            if (v69) {
              BOOL v71 = v70 == 0;
            }
            else {
              BOOL v71 = 0;
            }
            if (!v71)
            {
              v89 = v70;
              CCSetError();

              v42 = 0;
              self = v164;
              v9 = v178;
              v10 = v184;
              goto LABEL_158;
            }
            [v160 addObject:v69];
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v220 objects:v248 count:16];
        }
        while (v64);
      }

      self = v164;
      a4 = v171;
      v9 = v178;
    }
    else
    {
      v160 = 0;
      id v61 = v46;
    }
    uint64_t v73 = [v6 objectForKeyedSubscript:@"socialProfiles"];
    if (v73)
    {
      v74 = (void *)v73;
      objc_opt_class();
      id v218 = v61;
      char v75 = CCValidateIsInstanceOfExpectedClass();
      id v76 = v61;

      if ((v75 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        v77 = v74;
        v10 = v184;
LABEL_157:

        id v61 = v76;
        id v62 = v160;
        goto LABEL_158;
      }
      id v157 = v76;
      v172 = a4;
      v179 = v9;
      v165 = self;
      v77 = objc_opt_new();
      long long v214 = 0u;
      long long v215 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      id v78 = v74;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v214 objects:v247 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v215;
        do
        {
          for (uint64_t n = 0; n != v80; ++n)
          {
            v83 = v77;
            if (*(void *)v215 != v81) {
              objc_enumerationMutation(v78);
            }
            uint64_t v84 = *(void *)(*((void *)&v214 + 1) + 8 * n);
            v85 = [CCContactSocialProfile alloc];
            id v213 = 0;
            v86 = [(CCContactSocialProfile *)v85 initWithJSONDictionary:v84 error:&v213];
            id v87 = v213;
            if (v86) {
              BOOL v88 = v87 == 0;
            }
            else {
              BOOL v88 = 0;
            }
            if (!v88)
            {
              v104 = v87;
              CCSetError();

              v42 = 0;
              v77 = v78;
              self = v165;
              v9 = v179;
              v10 = v184;
              id v76 = v157;
              goto LABEL_157;
            }
            v77 = v83;
            [v83 addObject:v86];
          }
          uint64_t v80 = [v78 countByEnumeratingWithState:&v214 objects:v247 count:16];
        }
        while (v80);
      }

      self = v165;
      a4 = v172;
      v9 = v179;
      id v61 = v157;
    }
    else
    {
      v77 = 0;
    }
    uint64_t v90 = [v6 objectForKeyedSubscript:@"instantMessageAddresses"];
    v155 = v77;
    if (v90)
    {
      v91 = (void *)v90;
      objc_opt_class();
      id v212 = v61;
      char v92 = CCValidateIsInstanceOfExpectedClass();
      id v93 = v61;

      if ((v92 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        id v61 = v93;
        id v94 = v91;
        v10 = v184;
LABEL_120:
        v77 = v155;
        goto LABEL_156;
      }
      v173 = a4;
      v180 = v9;
      v166 = self;
      v158 = objc_opt_new();
      long long v208 = 0u;
      long long v209 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      id v61 = v93;
      id v94 = v91;
      uint64_t v95 = [v94 countByEnumeratingWithState:&v208 objects:v246 count:16];
      if (v95)
      {
        uint64_t v96 = v95;
        uint64_t v97 = *(void *)v209;
        do
        {
          for (iuint64_t i = 0; ii != v96; ++ii)
          {
            if (*(void *)v209 != v97) {
              objc_enumerationMutation(v94);
            }
            uint64_t v99 = *(void *)(*((void *)&v208 + 1) + 8 * ii);
            v100 = [CCContactInstantMessageAddress alloc];
            id v207 = 0;
            v101 = [(CCContactInstantMessageAddress *)v100 initWithJSONDictionary:v99 error:&v207];
            id v102 = v207;
            if (v101) {
              BOOL v103 = v102 == 0;
            }
            else {
              BOOL v103 = 0;
            }
            if (!v103)
            {
              v121 = v102;
              CCSetError();

              v42 = 0;
              self = v166;
              v9 = v180;
              v10 = v184;
              goto LABEL_120;
            }
            [v158 addObject:v101];
          }
          uint64_t v96 = [v94 countByEnumeratingWithState:&v208 objects:v246 count:16];
        }
        while (v96);
      }

      self = v166;
      a4 = v173;
      v9 = v180;
      v77 = v155;
    }
    else
    {
      v158 = 0;
    }
    uint64_t v105 = [v6 objectForKeyedSubscript:@"relations"];
    v10 = v184;
    if (v105)
    {
      v106 = (void *)v105;
      objc_opt_class();
      id v206 = v61;
      char v107 = CCValidateIsInstanceOfExpectedClass();
      id v108 = v61;
      v109 = v61;
      id v110 = v108;

      v154 = v110;
      if ((v107 & 1) == 0)
      {
        CCSetError();
        v42 = 0;
        id v111 = v106;
LABEL_127:
        v77 = v155;
        id v94 = v158;
        goto LABEL_155;
      }
      v174 = a4;
      v181 = v9;
      v156 = objc_opt_new();
      long long v202 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      long long v205 = 0u;
      id v111 = v106;
      uint64_t v112 = [v111 countByEnumeratingWithState:&v202 objects:v245 count:16];
      if (v112)
      {
        uint64_t v113 = v112;
        uint64_t v114 = *(void *)v203;
        do
        {
          for (juint64_t j = 0; jj != v113; ++jj)
          {
            if (*(void *)v203 != v114) {
              objc_enumerationMutation(v111);
            }
            uint64_t v116 = *(void *)(*((void *)&v202 + 1) + 8 * jj);
            v117 = [CCContactRelation alloc];
            id v201 = 0;
            v118 = [(CCContactRelation *)v117 initWithJSONDictionary:v116 error:&v201];
            id v119 = v201;
            if (v118) {
              BOOL v120 = v119 == 0;
            }
            else {
              BOOL v120 = 0;
            }
            if (!v120)
            {
              v127 = v119;
              CCSetError();

              v42 = 0;
              v9 = v181;
              v10 = v184;
              goto LABEL_127;
            }
            [v156 addObject:v118];
          }
          uint64_t v113 = [v111 countByEnumeratingWithState:&v202 objects:v245 count:16];
        }
        while (v113);
      }

      v9 = v181;
      v10 = v184;
      a4 = v174;
      v77 = v155;
    }
    else
    {
      v156 = 0;
      v154 = v61;
    }
    v152 = [v6 objectForKeyedSubscript:@"organizationName"];
    v151 = [v6 objectForKeyedSubscript:@"departmentName"];
    v150 = [v6 objectForKeyedSubscript:@"jobTitle"];
    v149 = [v6 objectForKeyedSubscript:@"phoneticGivenName"];
    v148 = [v6 objectForKeyedSubscript:@"phoneticMiddleName"];
    v147 = [v6 objectForKeyedSubscript:@"phoneticFamilyName"];
    v146 = [v6 objectForKeyedSubscript:@"phoneticOrganizationName"];
    v145 = [v6 objectForKeyedSubscript:@"note"];
    uint64_t v122 = [v6 objectForKeyedSubscript:@"birthday"];
    unint64_t v123 = 0x26539B000uLL;
    if (v122)
    {
      id v200 = 0;
      v175 = (void *)v122;
      v124 = [[CCContactDate alloc] initWithJSONDictionary:v122 error:&v200];
      id v125 = v200;
      id v126 = v125;
      if (!v124 || v125)
      {
        CCSetError();
        v42 = 0;
        v153 = v126;
        id v94 = v158;
LABEL_154:

        id v111 = v156;
LABEL_155:

        id v61 = v154;
LABEL_156:

        id v76 = v61;
        goto LABEL_157;
      }

      v175 = v124;
      unint64_t v123 = 0x26539B000;
    }
    else
    {
      v175 = 0;
    }
    v128 = [v6 objectForKeyedSubscript:@"nonGregorianBirthday"];
    if (v128)
    {
      id v129 = objc_alloc(*(Class *)(v123 + 1680));
      id v199 = 0;
      v153 = v128;
      v128 = (void *)[v129 initWithJSONDictionary:v128 error:&v199];
      v130 = (CCContactDate *)v199;
      v124 = v130;
      if (!v128 || v130)
      {
        CCSetError();

        v42 = 0;
        goto LABEL_153;
      }
    }
    v124 = [v6 objectForKeyedSubscript:@"dates"];
    v153 = v128;
    if (!v124)
    {
LABEL_150:
      v144 = v128;
      id v94 = v158;
      v77 = v155;
      v42 = -[CCContactContent initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:]([CCContactContent alloc], "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", v9, v10, v192, v191, v190, v189, v188, v15, v30, v187, v160, v155, v158, v156,
              v152,
              v151,
              v150,
              v149,
              v148,
              v147,
              v146,
              v145,
              v175,
              v144,
              v124,
              a4);
      goto LABEL_154;
    }
    objc_opt_class();
    v198 = v154;
    char v185 = CCValidateIsInstanceOfExpectedClass();
    id v131 = v154;

    if (v185)
    {
      v154 = v131;
      v159 = v30;
      v182 = v9;
      v186 = v10;
      v167 = self;
      v132 = (CCContactDate *)objc_opt_new();
      long long v194 = 0u;
      long long v195 = 0u;
      long long v196 = 0u;
      long long v197 = 0u;
      v124 = v124;
      uint64_t v133 = [(CCContactDate *)v124 countByEnumeratingWithState:&v194 objects:v244 count:16];
      if (v133)
      {
        uint64_t v134 = v133;
        uint64_t v135 = *(void *)v195;
        do
        {
          for (kuint64_t k = 0; kk != v134; ++kk)
          {
            if (*(void *)v195 != v135) {
              objc_enumerationMutation(v124);
            }
            uint64_t v137 = *(void *)(*((void *)&v194 + 1) + 8 * kk);
            v138 = [CCContactDate alloc];
            id v193 = 0;
            v139 = [(CCContactDate *)v138 initWithJSONDictionary:v137 error:&v193];
            id v140 = v193;
            if (v139) {
              BOOL v141 = v140 == 0;
            }
            else {
              BOOL v141 = 0;
            }
            if (!v141)
            {
              v142 = v140;
              CCSetError();

              v42 = 0;
              self = v167;
              v9 = v182;
              v10 = v186;
              v30 = v159;
              goto LABEL_152;
            }
            [(CCContactDate *)v132 addObject:v139];
          }
          uint64_t v134 = [(CCContactDate *)v124 countByEnumeratingWithState:&v194 objects:v244 count:16];
        }
        while (v134);
      }

      self = v167;
      v9 = v182;
      v10 = v186;
      v30 = v159;
      v124 = v132;
      v128 = v153;
      goto LABEL_150;
    }
    CCSetError();
    v42 = 0;
    v154 = v131;
LABEL_152:
    v77 = v155;
LABEL_153:
    id v94 = v158;
    goto LABEL_154;
  }
  CCSetError();
  v42 = 0;
LABEL_162:

  return v42;
}

- (id)jsonDictionary
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_givenName)
  {
    v4 = [(CCContactContent *)self givenName];
    [v3 setObject:v4 forKeyedSubscript:@"givenName"];
  }
  if (self->_middleName)
  {
    v5 = [(CCContactContent *)self middleName];
    [v3 setObject:v5 forKeyedSubscript:@"middleName"];
  }
  if (self->_familyName)
  {
    id v6 = [(CCContactContent *)self familyName];
    [v3 setObject:v6 forKeyedSubscript:@"familyName"];
  }
  if (self->_previousFamilyName)
  {
    v7 = [(CCContactContent *)self previousFamilyName];
    [v3 setObject:v7 forKeyedSubscript:@"previousFamilyName"];
  }
  if (self->_nickname)
  {
    id v8 = [(CCContactContent *)self nickname];
    [v3 setObject:v8 forKeyedSubscript:@"nickname"];
  }
  if (self->_namePrefix)
  {
    v9 = [(CCContactContent *)self namePrefix];
    [v3 setObject:v9 forKeyedSubscript:@"namePrefix"];
  }
  if (self->_nameSuffix)
  {
    v10 = [(CCContactContent *)self nameSuffix];
    [v3 setObject:v10 forKeyedSubscript:@"nameSuffix"];
  }
  uint64_t v11 = objc_opt_new();
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v12 = [(CCContactContent *)self phoneNumbers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v109 objects:v120 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v110 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v109 + 1) + 8 * i) jsonDictionary];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v109 objects:v120 count:16];
    }
    while (v14);
  }

  [v3 setObject:v11 forKeyedSubscript:@"phoneNumbers"];
  uint64_t v18 = objc_opt_new();
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v19 = [(CCContactContent *)self emailAddresses];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v106 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [*(id *)(*((void *)&v105 + 1) + 8 * j) jsonDictionary];
        [v18 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v105 objects:v119 count:16];
    }
    while (v21);
  }

  [v3 setObject:v18 forKeyedSubscript:@"emailAddresses"];
  BOOL v25 = objc_opt_new();
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v26 = [(CCContactContent *)self postalAddresses];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v101 objects:v118 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v102;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v102 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = [*(id *)(*((void *)&v101 + 1) + 8 * k) jsonDictionary];
        [v25 addObject:v31];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v101 objects:v118 count:16];
    }
    while (v28);
  }

  [v3 setObject:v25 forKeyedSubscript:@"postalAddresses"];
  uint64_t v32 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v33 = [(CCContactContent *)self urlAddresses];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v97 objects:v117 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v98;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v98 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = [*(id *)(*((void *)&v97 + 1) + 8 * m) jsonDictionary];
        [v32 addObject:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v97 objects:v117 count:16];
    }
    while (v35);
  }

  [v3 setObject:v32 forKeyedSubscript:@"urlAddresses"];
  id v39 = objc_opt_new();
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  BOOL v40 = [(CCContactContent *)self socialProfiles];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v93 objects:v116 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v94;
    do
    {
      for (uint64_t n = 0; n != v42; ++n)
      {
        if (*(void *)v94 != v43) {
          objc_enumerationMutation(v40);
        }
        char v45 = [*(id *)(*((void *)&v93 + 1) + 8 * n) jsonDictionary];
        [v39 addObject:v45];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v93 objects:v116 count:16];
    }
    while (v42);
  }

  [v3 setObject:v39 forKeyedSubscript:@"socialProfiles"];
  id v46 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v47 = [(CCContactContent *)self instantMessageAddresses];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v89 objects:v115 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v90;
    do
    {
      for (iuint64_t i = 0; ii != v49; ++ii)
      {
        if (*(void *)v90 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = [*(id *)(*((void *)&v89 + 1) + 8 * ii) jsonDictionary];
        [v46 addObject:v52];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v89 objects:v115 count:16];
    }
    while (v49);
  }

  [v3 setObject:v46 forKeyedSubscript:@"instantMessageAddresses"];
  v53 = objc_opt_new();
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v54 = [(CCContactContent *)self relations];
  uint64_t v55 = [v54 countByEnumeratingWithState:&v85 objects:v114 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v86;
    do
    {
      for (juint64_t j = 0; jj != v56; ++jj)
      {
        if (*(void *)v86 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = [*(id *)(*((void *)&v85 + 1) + 8 * jj) jsonDictionary];
        [v53 addObject:v59];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v85 objects:v114 count:16];
    }
    while (v56);
  }

  [v3 setObject:v53 forKeyedSubscript:@"relations"];
  if (self->_organizationName)
  {
    char v60 = [(CCContactContent *)self organizationName];
    [v3 setObject:v60 forKeyedSubscript:@"organizationName"];
  }
  if (self->_departmentName)
  {
    id v61 = [(CCContactContent *)self departmentName];
    [v3 setObject:v61 forKeyedSubscript:@"departmentName"];
  }
  if (self->_jobTitle)
  {
    id v62 = [(CCContactContent *)self jobTitle];
    [v3 setObject:v62 forKeyedSubscript:@"jobTitle"];
  }
  if (self->_phoneticGivenName)
  {
    uint64_t v63 = [(CCContactContent *)self phoneticGivenName];
    [v3 setObject:v63 forKeyedSubscript:@"phoneticGivenName"];
  }
  if (self->_phoneticMiddleName)
  {
    uint64_t v64 = [(CCContactContent *)self phoneticMiddleName];
    [v3 setObject:v64 forKeyedSubscript:@"phoneticMiddleName"];
  }
  if (self->_phoneticFamilyName)
  {
    uint64_t v65 = [(CCContactContent *)self phoneticFamilyName];
    [v3 setObject:v65 forKeyedSubscript:@"phoneticFamilyName"];
  }
  if (self->_phoneticOrganizationName)
  {
    v66 = [(CCContactContent *)self phoneticOrganizationName];
    [v3 setObject:v66 forKeyedSubscript:@"phoneticOrganizationName"];
  }
  if (self->_note)
  {
    uint64_t v67 = [(CCContactContent *)self note];
    [v3 setObject:v67 forKeyedSubscript:@"note"];
  }
  if (self->_birthday)
  {
    v68 = [(CCContactContent *)self birthday];
    v69 = [v68 jsonDictionary];
    [v3 setObject:v69 forKeyedSubscript:@"birthday"];
  }
  if (self->_nonGregorianBirthday)
  {
    id v70 = [(CCContactContent *)self nonGregorianBirthday];
    BOOL v71 = [v70 jsonDictionary];
    [v3 setObject:v71 forKeyedSubscript:@"nonGregorianBirthday"];
  }
  v72 = objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v73 = [(CCContactContent *)self dates];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v81 objects:v113 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v82;
    do
    {
      for (kuint64_t k = 0; kk != v75; ++kk)
      {
        if (*(void *)v82 != v76) {
          objc_enumerationMutation(v73);
        }
        id v78 = [*(id *)(*((void *)&v81 + 1) + 8 * kk) jsonDictionary];
        [v72 addObject:v78];
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v81 objects:v113 count:16];
    }
    while (v75);
  }

  [v3 setObject:v72 forKeyedSubscript:@"dates"];
  uint64_t v79 = (void *)[v3 copy];

  return v79;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v30 = (void (**)(id, void *))a3;
  if (self->_givenName)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19679 stringValue:self->_givenName];
    v30[2](v30, v5);
  }
  if (self->_middleName)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19680 stringValue:self->_middleName];
    v30[2](v30, v6);
  }
  if (self->_familyName)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19681 stringValue:self->_familyName];
    v30[2](v30, v7);
  }
  if (self->_previousFamilyName)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19682 stringValue:self->_previousFamilyName];
    v30[2](v30, v8);
  }
  if (self->_nickname)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19683 stringValue:self->_nickname];
    v30[2](v30, v9);
  }
  if (self->_namePrefix)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19684 stringValue:self->_namePrefix];
    v30[2](v30, v10);
  }
  if (self->_nameSuffix)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19685 stringValue:self->_nameSuffix];
    v30[2](v30, v11);
  }
  if (self->_phoneNumbers)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19686 repeatedSubMessageValue:self->_phoneNumbers];
    v30[2](v30, v12);
  }
  if (self->_emailAddresses)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19687 repeatedSubMessageValue:self->_emailAddresses];
    v30[2](v30, v13);
  }
  if (self->_postalAddresses)
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19688 repeatedSubMessageValue:self->_postalAddresses];
    v30[2](v30, v14);
  }
  if (self->_urlAddresses)
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19689 repeatedSubMessageValue:self->_urlAddresses];
    v30[2](v30, v15);
  }
  if (self->_socialProfiles)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19690 repeatedSubMessageValue:self->_socialProfiles];
    v30[2](v30, v16);
  }
  if (self->_instantMessageAddresses)
  {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19691 repeatedSubMessageValue:self->_instantMessageAddresses];
    v30[2](v30, v17);
  }
  if (self->_relations)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19692 repeatedSubMessageValue:self->_relations];
    v30[2](v30, v18);
  }
  if (self->_organizationName)
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19693 stringValue:self->_organizationName];
    v30[2](v30, v19);
  }
  if (self->_departmentName)
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19694 stringValue:self->_departmentName];
    v30[2](v30, v20);
  }
  if (self->_jobTitle)
  {
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19695 stringValue:self->_jobTitle];
    v30[2](v30, v21);
  }
  if (self->_phoneticGivenName)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19696 stringValue:self->_phoneticGivenName];
    v30[2](v30, v22);
  }
  if (self->_phoneticMiddleName)
  {
    v23 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19697 stringValue:self->_phoneticMiddleName];
    v30[2](v30, v23);
  }
  if (self->_phoneticFamilyName)
  {
    id v24 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19698 stringValue:self->_phoneticFamilyName];
    v30[2](v30, v24);
  }
  if (self->_phoneticOrganizationName)
  {
    BOOL v25 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19699 stringValue:self->_phoneticOrganizationName];
    v30[2](v30, v25);
  }
  if (self->_note)
  {
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19700 stringValue:self->_note];
    v30[2](v30, v26);
  }
  if (self->_birthday)
  {
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19701 subMessageValue:self->_birthday];
    v30[2](v30, v27);
  }
  if (self->_nonGregorianBirthday)
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19702 subMessageValue:self->_nonGregorianBirthday];
    v30[2](v30, v28);
  }
  if (self->_dates)
  {
    uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19705 repeatedSubMessageValue:self->_dates];
    v30[2](v30, v29);
  }
}

- (NSArray)dates
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_dates copyItems:1];
  return (NSArray *)v2;
}

- (CCContactDate)nonGregorianBirthday
{
  v2 = (void *)[(CCContactDate *)self->_nonGregorianBirthday copy];
  return (CCContactDate *)v2;
}

- (CCContactDate)birthday
{
  v2 = (void *)[(CCContactDate *)self->_birthday copy];
  return (CCContactDate *)v2;
}

- (NSString)note
{
  v2 = (void *)[(NSString *)self->_note copy];
  return (NSString *)v2;
}

- (NSString)phoneticOrganizationName
{
  v2 = (void *)[(NSString *)self->_phoneticOrganizationName copy];
  return (NSString *)v2;
}

- (NSString)phoneticFamilyName
{
  v2 = (void *)[(NSString *)self->_phoneticFamilyName copy];
  return (NSString *)v2;
}

- (NSString)phoneticMiddleName
{
  v2 = (void *)[(NSString *)self->_phoneticMiddleName copy];
  return (NSString *)v2;
}

- (NSString)phoneticGivenName
{
  v2 = (void *)[(NSString *)self->_phoneticGivenName copy];
  return (NSString *)v2;
}

- (NSString)jobTitle
{
  v2 = (void *)[(NSString *)self->_jobTitle copy];
  return (NSString *)v2;
}

- (NSString)departmentName
{
  v2 = (void *)[(NSString *)self->_departmentName copy];
  return (NSString *)v2;
}

- (NSString)organizationName
{
  v2 = (void *)[(NSString *)self->_organizationName copy];
  return (NSString *)v2;
}

- (NSArray)relations
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_relations copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)instantMessageAddresses
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_instantMessageAddresses copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)socialProfiles
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_socialProfiles copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)urlAddresses
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_urlAddresses copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)postalAddresses
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_postalAddresses copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)emailAddresses
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_emailAddresses copyItems:1];
  return (NSArray *)v2;
}

- (NSArray)phoneNumbers
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_phoneNumbers copyItems:1];
  return (NSArray *)v2;
}

- (NSString)nameSuffix
{
  v2 = (void *)[(NSString *)self->_nameSuffix copy];
  return (NSString *)v2;
}

- (NSString)namePrefix
{
  v2 = (void *)[(NSString *)self->_namePrefix copy];
  return (NSString *)v2;
}

- (NSString)nickname
{
  v2 = (void *)[(NSString *)self->_nickname copy];
  return (NSString *)v2;
}

- (NSString)previousFamilyName
{
  v2 = (void *)[(NSString *)self->_previousFamilyName copy];
  return (NSString *)v2;
}

- (NSString)familyName
{
  v2 = (void *)[(NSString *)self->_familyName copy];
  return (NSString *)v2;
}

- (NSString)middleName
{
  v2 = (void *)[(NSString *)self->_middleName copy];
  return (NSString *)v2;
}

- (NSString)givenName
{
  v2 = (void *)[(NSString *)self->_givenName copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  id v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  id v62 = a4;
  uint64_t v63 = v6;
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]])
  {
    uint64_t v67 = 0;
    v68 = 0;
    uint64_t v65 = 0;
    v66 = 0;
    uint64_t v64 = 0;
    v69 = 0;
    id v70 = 0;
    v10 = 0;
    goto LABEL_87;
  }
  v10 = 0;
  v69 = 0;
  id v70 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  v66 = 0;
  uint64_t v67 = 0;
  v68 = 0;
  id v11 = 0;
  v12 = (int *)MEMORY[0x263F317B8];
  uint64_t v13 = (int *)MEMORY[0x263F317B0];
LABEL_3:
  if (*(void *)&v7[*v12]) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v11 == 0;
  }
  if (v14)
  {
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v17 = 0;
    while (1)
    {
      uint64_t v18 = *v8;
      unint64_t v19 = *(void *)&v7[v18];
      if (v19 == -1 || v19 >= *(void *)&v7[*v9]) {
        break;
      }
      char v20 = *(unsigned char *)(*(void *)&v7[*v13] + v19);
      *(void *)&v7[v18] = v19 + 1;
      v17 |= (unint64_t)(v20 & 0x7F) << v15;
      if ((v20 & 0x80) == 0) {
        goto LABEL_17;
      }
      v15 += 7;
      if (v16++ >= 9)
      {
        unint64_t v17 = 0;
        if (*(void *)&v7[*v12]) {
          goto LABEL_87;
        }
LABEL_18:
        switch((v17 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 16;
            goto LABEL_71;
          case 2u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 24;
            goto LABEL_71;
          case 3u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 32;
            goto LABEL_71;
          case 4u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 40;
            goto LABEL_71;
          case 5u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 48;
            goto LABEL_71;
          case 6u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 56;
            goto LABEL_71;
          case 7u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 64;
            goto LABEL_71;
          case 8u:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v68) {
              v68 = objc_opt_new();
            }
            BOOL v25 = [CCContactPhoneNumber alloc];
            v80[0] = 0;
            uint64_t v26 = [(CCItemMessage *)v25 initWithData:v24 error:v80];
            id v11 = v80[0];
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v68;
            goto LABEL_80;
          case 9u:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v67) {
              uint64_t v67 = objc_opt_new();
            }
            uint64_t v28 = [CCContactEmailAddress alloc];
            id v79 = 0;
            uint64_t v26 = [(CCItemMessage *)v28 initWithData:v24 error:&v79];
            id v11 = v79;
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v67;
            goto LABEL_80;
          case 0xAu:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v66) {
              v66 = objc_opt_new();
            }
            uint64_t v29 = [CCContactPostalAddress alloc];
            id v78 = 0;
            uint64_t v26 = [(CCItemMessage *)v29 initWithData:v24 error:&v78];
            id v11 = v78;
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v66;
            goto LABEL_80;
          case 0xBu:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v65) {
              uint64_t v65 = objc_opt_new();
            }
            v30 = [CCContactURLAddress alloc];
            id v77 = 0;
            uint64_t v26 = [(CCItemMessage *)v30 initWithData:v24 error:&v77];
            id v11 = v77;
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v65;
            goto LABEL_80;
          case 0xCu:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v64) {
              uint64_t v64 = objc_opt_new();
            }
            id v31 = [CCContactSocialProfile alloc];
            id v76 = 0;
            uint64_t v26 = [(CCItemMessage *)v31 initWithData:v24 error:&v76];
            id v11 = v76;
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v64;
            goto LABEL_80;
          case 0xDu:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v70) {
              id v70 = objc_opt_new();
            }
            uint64_t v32 = [CCContactInstantMessageAddress alloc];
            id v75 = 0;
            uint64_t v26 = [(CCItemMessage *)v32 initWithData:v24 error:&v75];
            id v11 = v75;
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v70;
            goto LABEL_80;
          case 0xEu:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v69) {
              v69 = objc_opt_new();
            }
            uint64_t v33 = [CCContactRelation alloc];
            id v74 = 0;
            uint64_t v26 = [(CCItemMessage *)v33 initWithData:v24 error:&v74];
            id v11 = v74;
            if (v11 || !v26) {
              goto LABEL_81;
            }
            uint64_t v27 = v69;
            goto LABEL_80;
          case 0xFu:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 128;
            goto LABEL_71;
          case 0x10u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 136;
            goto LABEL_71;
          case 0x11u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 144;
            goto LABEL_71;
          case 0x12u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 152;
            goto LABEL_71;
          case 0x13u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 160;
            goto LABEL_71;
          case 0x14u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 168;
            goto LABEL_71;
          case 0x15u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 176;
            goto LABEL_71;
          case 0x16u:
            CCPBReaderReadStringNoCopy();
            uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            id v11 = 0;
            uint64_t v23 = 184;
LABEL_71:
            id v24 = *(Class *)((char *)&self->super.super.isa + v23);
            *(Class *)((char *)&self->super.super.isa + v23) = v22;
            goto LABEL_82;
          case 0x17u:
            uint64_t v34 = [CCContactDate alloc];
            id v24 = CCPBReaderReadDataNoCopy();
            id v73 = 0;
            uint64_t v35 = [(CCItemMessage *)v34 initWithData:v24 error:&v73];
            id v11 = v73;
            uint64_t v36 = 192;
            goto LABEL_74;
          case 0x18u:
            v37 = [CCContactDate alloc];
            id v24 = CCPBReaderReadDataNoCopy();
            id v72 = 0;
            uint64_t v35 = [(CCItemMessage *)v37 initWithData:v24 error:&v72];
            id v11 = v72;
            uint64_t v36 = 200;
LABEL_74:
            v38 = *(Class *)((char *)&self->super.super.isa + v36);
            *(Class *)((char *)&self->super.super.isa + v36) = v35;

            goto LABEL_82;
          case 0x19u:
            id v24 = CCPBReaderReadDataNoCopy();
            if (!v10) {
              v10 = objc_opt_new();
            }
            id v39 = [CCContactDate alloc];
            id v71 = 0;
            uint64_t v26 = [(CCItemMessage *)v39 initWithData:v24 error:&v71];
            id v11 = v71;
            if (!v11 && v26)
            {
              uint64_t v27 = v10;
LABEL_80:
              objc_msgSend(v27, "addObject:", v26, v62, v63);
            }
LABEL_81:

            goto LABEL_82;
          default:
            if (CCPBReaderSkipValueWithTag())
            {
              id v11 = 0;
            }
            else
            {
              BOOL v40 = (objc_class *)objc_opt_class();
              id v24 = NSStringFromClass(v40);
              CCSkipFieldErrorForMessage();
              id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:
            }
            if (*(void *)&v7[*v8] >= *(void *)&v7[*v9]) {
              goto LABEL_88;
            }
            goto LABEL_3;
        }
      }
    }
    *(void *)&v7[*v12] = 1;
LABEL_17:
    if (!*(void *)&v7[*v12]) {
      goto LABEL_18;
    }
LABEL_87:
    id v11 = 0;
  }
LABEL_88:
  uint64_t v41 = (NSArray *)objc_msgSend(v68, "copy", v62);
  phoneNumbers = self->_phoneNumbers;
  self->_phoneNumbers = v41;

  uint64_t v43 = (NSArray *)[v67 copy];
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v43;

  char v45 = (NSArray *)[v66 copy];
  postalAddresses = self->_postalAddresses;
  self->_postalAddresses = v45;

  id v47 = (NSArray *)[v65 copy];
  urlAddresses = self->_urlAddresses;
  self->_urlAddresses = v47;

  uint64_t v49 = (NSArray *)[v64 copy];
  socialProfiles = self->_socialProfiles;
  self->_socialProfiles = v49;

  v51 = (NSArray *)[v70 copy];
  instantMessageAddresses = self->_instantMessageAddresses;
  self->_instantMessageAddresses = v51;

  v53 = (NSArray *)[v69 copy];
  relations = self->_relations;
  self->_relations = v53;

  uint64_t v55 = (NSArray *)[v10 copy];
  dates = self->_dates;
  self->_dates = v55;

  if (v11)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v7[*MEMORY[0x263F317B8]])
    {
      BOOL v60 = 1;
      goto LABEL_93;
    }
    uint64_t v57 = (objc_class *)objc_opt_class();
    uint64_t v58 = NSStringFromClass(v57);
    v59 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v60 = 0;
LABEL_93:

  return v60;
}

- (CCContactContent)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 previousFamilyName:(id)a6 nickname:(id)a7 namePrefix:(id)a8 nameSuffix:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 socialProfiles:(id)a14 instantMessageAddresses:(id)a15 relations:(id)a16 organizationName:(id)a17 departmentName:(id)a18 jobTitle:(id)a19 phoneticGivenName:(id)a20 phoneticMiddleName:(id)a21 phoneticFamilyName:(id)a22 phoneticOrganizationName:(id)a23 note:(id)a24 birthday:(id)a25 nonGregorianBirthday:(id)a26 dates:(id)a27 error:(id *)a28
{
  uint64_t v214 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v34 = a4;
  id v35 = a5;
  id v36 = a6;
  id v37 = a7;
  id v145 = a8;
  id v148 = a9;
  id v147 = a10;
  id v146 = a11;
  id v144 = a12;
  id v143 = a13;
  id v142 = a14;
  id v141 = a15;
  id v140 = a16;
  id v139 = a17;
  id v38 = a18;
  id v137 = a19;
  id v136 = a20;
  id v135 = a21;
  id v134 = a22;
  id v133 = a23;
  id v132 = a24;
  id v131 = a25;
  id v129 = a26;
  id v130 = a27;
  id v39 = objc_opt_new();
  v128 = v35;
  v138 = v38;
  if (v33)
  {
    objc_opt_class();
    uint64_t v205 = 0;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v41 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_137;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v41 = 0;
  }
  uint64_t v42 = v145;
  if (v34)
  {
    objc_opt_class();
    id v204 = v41;
    int v43 = CCValidateIsInstanceOfExpectedClass();
    id v44 = v41;

    if (!v43) {
      goto LABEL_14;
    }
    CCPBDataWriterWriteStringField();
    if (!v35)
    {
LABEL_8:
      id v41 = v44;
      if (v36) {
        goto LABEL_9;
      }
LABEL_18:
      id v44 = v41;
      if (!v37)
      {
LABEL_11:
        id v41 = v44;
        if (v145) {
          goto LABEL_12;
        }
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v44 = v41;
    if (!v35) {
      goto LABEL_8;
    }
  }
  objc_opt_class();
  id v203 = v44;
  int v50 = CCValidateIsInstanceOfExpectedClass();
  id v41 = v44;

  if (!v50) {
    goto LABEL_25;
  }
  CCPBDataWriterWriteStringField();
  if (!v36) {
    goto LABEL_18;
  }
LABEL_9:
  objc_opt_class();
  id v202 = v41;
  int v45 = CCValidateIsInstanceOfExpectedClass();
  id v44 = v41;

  if (v45)
  {
    CCPBDataWriterWriteStringField();
    if (!v37) {
      goto LABEL_11;
    }
LABEL_19:
    objc_opt_class();
    id v201 = v44;
    int v51 = CCValidateIsInstanceOfExpectedClass();
    id v41 = v44;

    if (v51)
    {
      CCPBDataWriterWriteStringField();
      if (v145)
      {
LABEL_12:
        objc_opt_class();
        id v200 = v41;
        int v46 = CCValidateIsInstanceOfExpectedClass();
        id v44 = v41;

        if (v46)
        {
          CCPBDataWriterWriteStringField();
          goto LABEL_22;
        }
        goto LABEL_14;
      }
LABEL_21:
      id v44 = v41;
LABEL_22:
      if (v148)
      {
        objc_opt_class();
        id v199 = v44;
        int v52 = CCValidateIsInstanceOfExpectedClass();
        id v41 = v44;

        if (!v52)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          CCSetError();
          uint64_t v49 = 0;
LABEL_51:
          v53 = self;
          goto LABEL_141;
        }
        CCPBDataWriterWriteStringField();
      }
      else
      {
        id v41 = v44;
      }
      id v126 = v33;
      if (!v147)
      {
        id v55 = v41;
        goto LABEL_40;
      }
      id v47 = v36;
      uint64_t v48 = v37;
      objc_opt_class();
      id v198 = v41;
      int v54 = CCValidateArrayValues();
      id v55 = v41;

      if (v54)
      {
        long long v196 = 0u;
        long long v197 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v56 = v147;
        uint64_t v57 = [v56 countByEnumeratingWithState:&v194 objects:v213 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v195;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v195 != v59) {
                objc_enumerationMutation(v56);
              }
              id v61 = [*(id *)(*((void *)&v194 + 1) + 8 * i) data];
              CCPBDataWriterWriteDataField();
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v194 objects:v213 count:16];
          }
          while (v58);
        }

        id v33 = v126;
        id v37 = v48;
        id v36 = v47;
LABEL_40:
        if (v146)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          objc_opt_class();
          id v193 = v55;
          int v62 = CCValidateArrayValues();
          id v41 = v55;

          if (!v62) {
            goto LABEL_138;
          }
          long long v191 = 0u;
          long long v192 = 0u;
          long long v189 = 0u;
          long long v190 = 0u;
          id v63 = v146;
          uint64_t v64 = [v63 countByEnumeratingWithState:&v189 objects:v212 count:16];
          if (v64)
          {
            uint64_t v65 = v64;
            uint64_t v66 = *(void *)v190;
            do
            {
              for (uint64_t j = 0; j != v65; ++j)
              {
                if (*(void *)v190 != v66) {
                  objc_enumerationMutation(v63);
                }
                v68 = [*(id *)(*((void *)&v189 + 1) + 8 * j) data];
                CCPBDataWriterWriteDataField();
              }
              uint64_t v65 = [v63 countByEnumeratingWithState:&v189 objects:v212 count:16];
            }
            while (v65);
          }

          id v33 = v126;
          id v37 = v48;
          id v36 = v47;
        }
        else
        {
          id v41 = v55;
        }
        if (v144)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          objc_opt_class();
          id v188 = v41;
          int v69 = CCValidateArrayValues();
          id v70 = v41;

          if (!v69) {
            goto LABEL_132;
          }
          long long v186 = 0u;
          long long v187 = 0u;
          long long v184 = 0u;
          long long v185 = 0u;
          id v71 = v144;
          uint64_t v72 = [v71 countByEnumeratingWithState:&v184 objects:v211 count:16];
          if (v72)
          {
            uint64_t v73 = v72;
            uint64_t v74 = *(void *)v185;
            do
            {
              for (uint64_t k = 0; k != v73; ++k)
              {
                if (*(void *)v185 != v74) {
                  objc_enumerationMutation(v71);
                }
                id v76 = [*(id *)(*((void *)&v184 + 1) + 8 * k) data];
                CCPBDataWriterWriteDataField();
              }
              uint64_t v73 = [v71 countByEnumeratingWithState:&v184 objects:v211 count:16];
            }
            while (v73);
          }

          id v33 = v126;
          id v37 = v48;
          id v36 = v47;
        }
        else
        {
          id v70 = v41;
        }
        if (v143)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          objc_opt_class();
          id v183 = v70;
          int v77 = CCValidateArrayValues();
          id v41 = v70;

          if (!v77) {
            goto LABEL_138;
          }
          long long v181 = 0u;
          long long v182 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          id v78 = v143;
          uint64_t v79 = [v78 countByEnumeratingWithState:&v179 objects:v210 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v180;
            do
            {
              for (uint64_t m = 0; m != v80; ++m)
              {
                if (*(void *)v180 != v81) {
                  objc_enumerationMutation(v78);
                }
                long long v83 = [*(id *)(*((void *)&v179 + 1) + 8 * m) data];
                CCPBDataWriterWriteDataField();
              }
              uint64_t v80 = [v78 countByEnumeratingWithState:&v179 objects:v210 count:16];
            }
            while (v80);
          }

          id v33 = v126;
          id v37 = v48;
          id v36 = v47;
        }
        else
        {
          id v41 = v70;
        }
        if (v142)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          objc_opt_class();
          id v178 = v41;
          int v84 = CCValidateArrayValues();
          id v70 = v41;

          if (!v84) {
            goto LABEL_132;
          }
          long long v176 = 0u;
          long long v177 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          id v85 = v142;
          uint64_t v86 = [v85 countByEnumeratingWithState:&v174 objects:v209 count:16];
          if (v86)
          {
            uint64_t v87 = v86;
            uint64_t v88 = *(void *)v175;
            do
            {
              for (uint64_t n = 0; n != v87; ++n)
              {
                if (*(void *)v175 != v88) {
                  objc_enumerationMutation(v85);
                }
                long long v90 = [*(id *)(*((void *)&v174 + 1) + 8 * n) data];
                CCPBDataWriterWriteDataField();
              }
              uint64_t v87 = [v85 countByEnumeratingWithState:&v174 objects:v209 count:16];
            }
            while (v87);
          }

          id v33 = v126;
          id v37 = v48;
          id v36 = v47;
        }
        else
        {
          id v70 = v41;
        }
        if (v141)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          objc_opt_class();
          id v173 = v70;
          int v91 = CCValidateArrayValues();
          id v41 = v70;

          if (!v91) {
            goto LABEL_138;
          }
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          id v92 = v141;
          uint64_t v93 = [v92 countByEnumeratingWithState:&v169 objects:v208 count:16];
          if (v93)
          {
            uint64_t v94 = v93;
            uint64_t v95 = *(void *)v170;
            do
            {
              for (iuint64_t i = 0; ii != v94; ++ii)
              {
                if (*(void *)v170 != v95) {
                  objc_enumerationMutation(v92);
                }
                long long v97 = [*(id *)(*((void *)&v169 + 1) + 8 * ii) data];
                CCPBDataWriterWriteDataField();
              }
              uint64_t v94 = [v92 countByEnumeratingWithState:&v169 objects:v208 count:16];
            }
            while (v94);
          }

          id v33 = v126;
          id v37 = v48;
          id v36 = v47;
        }
        else
        {
          id v41 = v70;
        }
        if (v140)
        {
          id v47 = v36;
          uint64_t v48 = v37;
          objc_opt_class();
          id v168 = v41;
          int v98 = CCValidateArrayValues();
          id v70 = v41;

          if (!v98) {
            goto LABEL_132;
          }
          long long v166 = 0u;
          long long v167 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          id v99 = v140;
          uint64_t v100 = [v99 countByEnumeratingWithState:&v164 objects:v207 count:16];
          if (v100)
          {
            uint64_t v101 = v100;
            uint64_t v102 = *(void *)v165;
            do
            {
              for (juint64_t j = 0; jj != v101; ++jj)
              {
                if (*(void *)v165 != v102) {
                  objc_enumerationMutation(v99);
                }
                long long v104 = [*(id *)(*((void *)&v164 + 1) + 8 * jj) data];
                CCPBDataWriterWriteDataField();
              }
              uint64_t v101 = [v99 countByEnumeratingWithState:&v164 objects:v207 count:16];
            }
            while (v101);
          }

          id v33 = v126;
          id v37 = v48;
          id v36 = v47;
        }
        else
        {
          id v70 = v41;
        }
        if (v139)
        {
          objc_opt_class();
          id v163 = v70;
          int v105 = CCValidateIsInstanceOfExpectedClass();
          id v41 = v70;

          if (!v105) {
            goto LABEL_137;
          }
          CCPBDataWriterWriteStringField();
        }
        else
        {
          id v41 = v70;
        }
        if (v138)
        {
          objc_opt_class();
          id v162 = v41;
          int v106 = CCValidateIsInstanceOfExpectedClass();
          id v70 = v41;

          if (!v106) {
            goto LABEL_131;
          }
          CCPBDataWriterWriteStringField();
        }
        else
        {
          id v70 = v41;
        }
        if (v137)
        {
          objc_opt_class();
          id v161 = v70;
          int v107 = CCValidateIsInstanceOfExpectedClass();
          id v41 = v70;

          if (!v107) {
            goto LABEL_137;
          }
          CCPBDataWriterWriteStringField();
        }
        else
        {
          id v41 = v70;
        }
        if (v136)
        {
          objc_opt_class();
          id v160 = v41;
          int v108 = CCValidateIsInstanceOfExpectedClass();
          id v70 = v41;

          if (!v108) {
            goto LABEL_131;
          }
          CCPBDataWriterWriteStringField();
        }
        else
        {
          id v70 = v41;
        }
        if (v135)
        {
          objc_opt_class();
          id v159 = v70;
          int v109 = CCValidateIsInstanceOfExpectedClass();
          id v41 = v70;

          if (!v109) {
            goto LABEL_137;
          }
          CCPBDataWriterWriteStringField();
        }
        else
        {
          id v41 = v70;
        }
        if (!v134)
        {
          id v70 = v41;
          goto LABEL_134;
        }
        objc_opt_class();
        id v158 = v41;
        int v110 = CCValidateIsInstanceOfExpectedClass();
        id v70 = v41;

        if (v110)
        {
          CCPBDataWriterWriteStringField();
LABEL_134:
          if (!v133)
          {
            id v41 = v70;
            goto LABEL_143;
          }
          objc_opt_class();
          id v157 = v70;
          int v111 = CCValidateIsInstanceOfExpectedClass();
          id v41 = v70;

          if (v111)
          {
            CCPBDataWriterWriteStringField();
LABEL_143:
            id v47 = v36;
            if (!v132)
            {
              uint64_t v48 = v37;
              id v70 = v41;
              goto LABEL_147;
            }
            uint64_t v48 = v37;
            objc_opt_class();
            id v156 = v41;
            int v113 = CCValidateIsInstanceOfExpectedClass();
            id v70 = v41;

            if (v113)
            {
              CCPBDataWriterWriteStringField();
LABEL_147:
              if (!v131)
              {
                id v41 = v70;
                goto LABEL_151;
              }
              objc_opt_class();
              id v155 = v70;
              int v114 = CCValidateIsInstanceOfExpectedClass();
              id v41 = v70;

              if (v114)
              {
                v115 = [v131 data];
                CCPBDataWriterWriteDataField();

LABEL_151:
                if (!v129)
                {
                  id v70 = v41;
                  goto LABEL_155;
                }
                objc_opt_class();
                id v154 = v41;
                int v116 = CCValidateIsInstanceOfExpectedClass();
                id v70 = v41;

                if (v116)
                {
                  v117 = [v129 data];
                  CCPBDataWriterWriteDataField();

LABEL_155:
                  if (v130)
                  {
                    objc_opt_class();
                    id v153 = v70;
                    int v118 = CCValidateArrayValues();
                    id v41 = v70;

                    if (!v118)
                    {
                      CCSetError();
                      uint64_t v49 = 0;
                      v53 = self;
                      id v33 = v126;
                      goto LABEL_140;
                    }
                    long long v151 = 0u;
                    long long v152 = 0u;
                    long long v149 = 0u;
                    long long v150 = 0u;
                    id v119 = v130;
                    uint64_t v120 = [v119 countByEnumeratingWithState:&v149 objects:v206 count:16];
                    if (v120)
                    {
                      uint64_t v121 = v120;
                      uint64_t v122 = *(void *)v150;
                      do
                      {
                        for (kuint64_t k = 0; kk != v121; ++kk)
                        {
                          if (*(void *)v150 != v122) {
                            objc_enumerationMutation(v119);
                          }
                          v124 = [*(id *)(*((void *)&v149 + 1) + 8 * kk) data];
                          CCPBDataWriterWriteDataField();
                        }
                        uint64_t v121 = [v119 countByEnumeratingWithState:&v149 objects:v206 count:16];
                      }
                      while (v121);
                    }

                    id v33 = v126;
                  }
                  else
                  {
                    id v41 = v70;
                  }
                  id v125 = [v39 immutableData];
                  v53 = [(CCItemMessage *)self initWithData:v125 error:a28];

                  uint64_t v49 = v53;
LABEL_140:
                  uint64_t v42 = v145;
                  goto LABEL_141;
                }
                goto LABEL_132;
              }
LABEL_138:
              CCSetError();
              uint64_t v49 = 0;
              goto LABEL_139;
            }
LABEL_132:
            CCSetError();
            uint64_t v49 = 0;
            id v41 = v70;
LABEL_139:
            v53 = self;
            goto LABEL_140;
          }
LABEL_137:
          id v47 = v36;
          uint64_t v48 = v37;
          goto LABEL_138;
        }
LABEL_131:
        id v47 = v36;
        uint64_t v48 = v37;
        goto LABEL_132;
      }
      CCSetError();
      uint64_t v49 = 0;
      id v41 = v55;
      goto LABEL_51;
    }
LABEL_25:
    id v47 = v36;
    uint64_t v48 = v37;
    CCSetError();
    uint64_t v49 = 0;
    goto LABEL_26;
  }
LABEL_14:
  id v47 = v36;
  uint64_t v48 = v37;
  CCSetError();
  uint64_t v49 = 0;
  id v41 = v44;
LABEL_26:
  v53 = self;
LABEL_141:

  return v49;
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 19668) > 0x6D) {
    return 0;
  }
  else {
    return *(&off_26539BEF0 + (unsigned __int16)(a3 - 19668));
  }
}

+ (unsigned)itemType
{
  return 19668;
}

@end