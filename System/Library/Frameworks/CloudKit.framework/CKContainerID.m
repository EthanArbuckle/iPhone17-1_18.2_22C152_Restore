@interface CKContainerID
+ (BOOL)supportsSecureCoding;
- (BOOL)isAppleInternal;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTestContainer;
- (CKContainerID)initWithCoder:(id)a3;
- (CKContainerID)initWithContainerIdentifier:(id)a3 environment:(int64_t)a4;
- (CKContainerID)initWithSqliteRepresentation:(id)a3;
- (NSString)containerIdentifier;
- (NSString)description;
- (id)CKShortDescriptionRedact:(BOOL)a3;
- (id)ckShortDescription;
- (id)equivalencyProperties;
- (id)redactedDescription;
- (id)representativeDataclass;
- (id)sqliteRepresentation;
- (int64_t)c2ContainerType;
- (int64_t)environment;
- (int64_t)specialContainerType;
- (unint64_t)hash;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setIsAppleInternal:(BOOL)a3;
- (void)setIsTestContainer:(BOOL)a3;
- (void)setSpecialContainerType:(int64_t)a3;
@end

@implementation CKContainerID

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKContainerID *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (void).cxx_destruct
{
}

- (id)ckShortDescription
{
  return (id)objc_msgSend_CKShortDescriptionRedact_(self, a2, 0, v2);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  v5 = NSString;
  v6 = objc_msgSend_containerIdentifier(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_environment(self, v7, v8, v9);
  v13 = @"UNKNOWN ENVIRONMENT";
  if (v10 == 2) {
    v13 = @"Sandbox";
  }
  if (v10 == 1) {
    v13 = @"Production";
  }
  v14 = objc_msgSend_stringWithFormat_(v5, v11, @"%@:%@", v12, v6, v13);

  return v14;
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);
}

- (id)sqliteRepresentation
{
  v5 = NSString;
  id v6 = objc_msgSend_containerIdentifier(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_environment(self, v7, v8, v9);
  v13 = objc_msgSend_stringWithFormat_(v5, v11, @"%@~%ld", v12, v6, v10);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_containerIdentifier(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)v8, @"ContainerIdentifier");

  uint64_t v13 = objc_msgSend_environment(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v15, v14, v13, @"Environment");
}

- (unint64_t)hash
{
  v5 = objc_msgSend_containerIdentifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  unint64_t v13 = v9 ^ (2 * objc_msgSend_environment(self, v10, v11, v12));

  return v13;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v15 = a3;
  uint64_t v7 = objc_msgSend_containerIdentifier(self, v4, v5, v6);
  objc_msgSend_addProperty_value_shouldRedact_(v15, v8, @"containerIdentifier", (uint64_t)v7, 0);

  uint64_t v12 = objc_msgSend_environment(self, v9, v10, v11);
  v14 = @"UNKNOWN ENVIRONMENT";
  if (v12 == 2) {
    v14 = @"Sandbox";
  }
  if (v12 == 1) {
    objc_msgSend_addProperty_value_shouldRedact_(v15, v13, @"environment", @"Production", 0);
  }
  else {
    objc_msgSend_addProperty_value_shouldRedact_(v15, v13, @"environment", (uint64_t)v14, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKContainerID *)a3;
  if (self == v4)
  {
    BOOL v29 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v9 = objc_msgSend_containerIdentifier(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_containerIdentifier(v5, v10, v11, v12);
      if (v9 == (void *)v13)
      {
      }
      else
      {
        v17 = (void *)v13;
        v18 = objc_msgSend_containerIdentifier(self, v14, v15, v16);
        v22 = objc_msgSend_containerIdentifier(v5, v19, v20, v21);
        int isEqualToString = objc_msgSend_isEqualToString_(v18, v23, (uint64_t)v22, v24);

        if (!isEqualToString)
        {
          BOOL v29 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      uint64_t v30 = objc_msgSend_environment(self, v26, v27, v28);
      BOOL v29 = v30 == objc_msgSend_environment(v5, v31, v32, v33);
      goto LABEL_10;
    }
    BOOL v29 = 0;
  }
LABEL_11:

  return v29;
}

- (int64_t)environment
{
  return self->_environment;
}

- (CKContainerID)initWithContainerIdentifier:(id)a3 environment:(int64_t)a4
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v124 = 0;
  char v7 = _CKCheckArgument((uint64_t)"containerIdentifier", v6, 0, 0, 0, &v124);
  id v8 = v124;
  uint64_t v9 = v8;
  if ((v7 & 1) == 0)
  {
    v98 = [CKException alloc];
    uint64_t v102 = objc_msgSend_code(v9, v99, v100, v101);
    v106 = objc_msgSend_localizedDescription(v9, v103, v104, v105);
    id v108 = (id)objc_msgSend_initWithCode_format_(v98, v107, v102, @"%@", v106);

    goto LABEL_63;
  }

  if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v109 = [CKException alloc];
    v111 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v110, @"CKErrorDomain", 12, @"environment can not be 0");
    uint64_t v115 = objc_msgSend_code(v111, v112, v113, v114);
    v117 = objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v116, @"CKErrorDomain", 12, @"environment can not be 0");
    v121 = objc_msgSend_localizedDescription(v117, v118, v119, v120);
    id v108 = (id)objc_msgSend_initWithCode_format_(v109, v122, v115, @"%@", v121);

LABEL_63:
    objc_exception_throw(v108);
  }
  v123.receiver = self;
  v123.super_class = (Class)CKContainerID;
  uint64_t v13 = [(CKContainerID *)&v123 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v6, v10, v11, v12);
    containerIdentifier = v13->_containerIdentifier;
    v13->_containerIdentifier = (NSString *)v14;

    v13->_environment = a4;
    if (qword_1EB279BD0 != -1) {
      dispatch_once(&qword_1EB279BD0, &unk_1ED7EF058);
    }
    v19 = (void *)qword_1EB279BA0;
    uint64_t v20 = objc_msgSend_containerIdentifier(v13, v16, v17, v18);
    v23 = objc_msgSend_objectForKeyedSubscript_(v19, v21, (uint64_t)v20, v22);

    if (v23)
    {
LABEL_7:
      uint64_t v27 = objc_msgSend_integerValue(v23, v24, v25, v26);
      objc_msgSend_setSpecialContainerType_(v13, v28, v27, v29);
    }
    else
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v70 = (id)qword_1EB279BA8;
      uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v141, (uint64_t)v149, 16);
      if (v72)
      {
        uint64_t v76 = v72;
        uint64_t v77 = *(void *)v142;
LABEL_42:
        uint64_t v78 = 0;
        while (1)
        {
          if (*(void *)v142 != v77) {
            objc_enumerationMutation(v70);
          }
          uint64_t v79 = *(void *)(*((void *)&v141 + 1) + 8 * v78);
          v80 = objc_msgSend_containerIdentifier(v13, v73, v74, v75);
          char hasPrefix = objc_msgSend_hasPrefix_(v80, v81, v79, v82);

          if (hasPrefix) {
            break;
          }
          if (v76 == ++v78)
          {
            uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v141, (uint64_t)v149, 16);
            if (v76) {
              goto LABEL_42;
            }
            goto LABEL_48;
          }
        }
        v23 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EB279BA8, v73, v79, v75);

        if (v23) {
          goto LABEL_7;
        }
      }
      else
      {
LABEL_48:
      }
      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v84 = (id)qword_1EB279BB0;
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v137, (uint64_t)v148, 16);
      if (v86)
      {
        uint64_t v90 = v86;
        uint64_t v91 = *(void *)v138;
LABEL_52:
        uint64_t v92 = 0;
        while (1)
        {
          if (*(void *)v138 != v91) {
            objc_enumerationMutation(v84);
          }
          uint64_t v93 = *(void *)(*((void *)&v137 + 1) + 8 * v92);
          v94 = objc_msgSend_containerIdentifier(v13, v87, v88, v89);
          char hasSuffix = objc_msgSend_hasSuffix_(v94, v95, v93, v96);

          if (hasSuffix) {
            break;
          }
          if (v90 == ++v92)
          {
            uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v137, (uint64_t)v148, 16);
            if (v90) {
              goto LABEL_52;
            }
            goto LABEL_58;
          }
        }
        v23 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EB279BB0, v87, v93, v89);

        if (v23) {
          goto LABEL_7;
        }
      }
      else
      {
LABEL_58:
      }
      objc_msgSend_setSpecialContainerType_(v13, v24, 0, v26);
    }
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v30 = (id)qword_1EB279BB8;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v133, (uint64_t)v147, 16);
    if (v32)
    {
      uint64_t v36 = v32;
      uint64_t v37 = *(void *)v134;
      while (2)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v134 != v37) {
            objc_enumerationMutation(v30);
          }
          uint64_t v39 = *(void *)(*((void *)&v133 + 1) + 8 * i);
          v40 = objc_msgSend_containerIdentifier(v13, v33, v34, v35);
          LODWORD(v39) = objc_msgSend_isEqualToString_(v40, v41, v39, v42);

          if (v39)
          {
            objc_msgSend_setIsTestContainer_(v13, v33, 1, v35);
            goto LABEL_18;
          }
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v133, (uint64_t)v147, 16);
        if (v36) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    long long v132 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v129 = 0u;
    id v43 = (id)qword_1EB279BC0;
    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v129, (uint64_t)v146, 16);
    if (v45)
    {
      uint64_t v49 = v45;
      uint64_t v50 = *(void *)v130;
      while (2)
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v130 != v50) {
            objc_enumerationMutation(v43);
          }
          uint64_t v52 = *(void *)(*((void *)&v129 + 1) + 8 * j);
          v53 = objc_msgSend_containerIdentifier(v13, v46, v47, v48);
          LODWORD(v52) = objc_msgSend_hasPrefix_(v53, v54, v52, v55);

          if (v52)
          {
            objc_msgSend_setIsTestContainer_(v13, v46, 1, v48);
            goto LABEL_28;
          }
        }
        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v129, (uint64_t)v146, 16);
        if (v49) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v56 = (id)qword_1EB279BC8;
    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v125, (uint64_t)v145, 16);
    if (v58)
    {
      uint64_t v62 = v58;
      uint64_t v63 = *(void *)v126;
      while (2)
      {
        for (uint64_t k = 0; k != v62; ++k)
        {
          if (*(void *)v126 != v63) {
            objc_enumerationMutation(v56);
          }
          uint64_t v65 = *(void *)(*((void *)&v125 + 1) + 8 * k);
          v66 = objc_msgSend_containerIdentifier(v13, v59, v60, v61);
          LODWORD(v65) = objc_msgSend_hasPrefix_(v66, v67, v65, v68);

          if (v65)
          {
            objc_msgSend_setIsAppleInternal_(v13, v59, 1, v61);
            goto LABEL_38;
          }
        }
        uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v125, (uint64_t)v145, 16);
        if (v62) {
          continue;
        }
        break;
      }
    }
LABEL_38:
  }
  return v13;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setSpecialContainerType:(int64_t)a3
{
  self->_specialContainerType = a3;
}

- (void)setIsAppleInternal:(BOOL)a3
{
  self->_isAppleInternal = a3;
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKContainerID *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (CKContainerID)initWithSqliteRepresentation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_componentsSeparatedByString_(v4, v8, @"~", v9);
    if (objc_msgSend_count(v10, v11, v12, v13) == 2)
    {
      uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v10, v14, 0, v15);
      v19 = objc_msgSend_objectAtIndexedSubscript_(v10, v17, 1, v18);
      uint64_t v23 = objc_msgSend_integerValue(v19, v20, v21, v22);

      self = (CKContainerID *)(id)objc_msgSend_initWithContainerIdentifier_environment_(self, v24, (uint64_t)v16, v23);
      uint64_t v25 = self;
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (id)equivalencyProperties
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_sqliteRepresentation(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"sqliteRepresentation");

  uint64_t v12 = objc_msgSend_properties(v3, v9, v10, v11);

  return v12;
}

- (id)representativeDataclass
{
  unint64_t v4 = objc_msgSend_specialContainerType(self, a2, v2, v3) - 1;
  if (v4 <= 0x21 && ((0x25F7F20DBuLL >> v4) & 1) != 0) {
    id v5 = **((id **)&unk_1E54629A0 + v4);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)c2ContainerType
{
  unint64_t v8 = objc_msgSend_specialContainerType(self, a2, v2, v3) - 2;
  if (v8 < 0x11 && ((0x1706Du >> v8) & 1) != 0) {
    return qword_18B1F3AD0[v8];
  }
  if (objc_msgSend_isAppleInternal(self, v5, v6, v7)) {
    return 2;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContainerID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v6 = objc_opt_class();
  unint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ContainerIdentifier");
  uint64_t v11 = objc_msgSend_decodeInt64ForKey_(v4, v9, @"Environment", v10);
  uint64_t v13 = (CKContainerID *)objc_msgSend_initWithContainerIdentifier_environment_(self, v12, (uint64_t)v8, v11);

  return v13;
}

- (int64_t)specialContainerType
{
  return self->_specialContainerType;
}

- (BOOL)isTestContainer
{
  return self->_isTestContainer;
}

- (void)setIsTestContainer:(BOOL)a3
{
  self->_isTestContainer = a3;
}

- (BOOL)isAppleInternal
{
  return self->_isAppleInternal;
}

@end