@interface CWFAutoJoinStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAutoJoinStatus:(id)a3;
- (BOOL)result;
- (CWFAutoJoinStatus)init;
- (CWFAutoJoinStatus)initWithCoder:(id)a3;
- (NSArray)joinAttempts;
- (NSDate)endedAt;
- (NSDate)startedAt;
- (NSString)description;
- (NSString)interfaceName;
- (NSUUID)UUID;
- (double)duration;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopy;
- (int64_t)state;
- (int64_t)trigger;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndedAt:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setJoinAttempts:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setStartedAt:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTrigger:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFAutoJoinStatus

- (CWFAutoJoinStatus)init
{
  v10.receiver = self;
  v10.super_class = (Class)CWFAutoJoinStatus;
  v6 = [(CWFAutoJoinStatus *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }
  return v6;
}

- (double)duration
{
  objc_super v10 = objc_msgSend_endedAt(self, a2, v2, v3, v4);
  if (v10)
  {
    v11 = objc_msgSend_endedAt(self, v6, v7, v8, v9);
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    double v17 = v16;
    v22 = objc_msgSend_startedAt(self, v18, v19, v20, v21);
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    double v32 = v17 - v31;
    double v33 = 0.0;
    if (v32 >= 0.0)
    {
      v34 = objc_msgSend_endedAt(self, v27, v28, v29, v30);
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      double v40 = v39;
      v45 = objc_msgSend_startedAt(self, v41, v42, v43, v44);
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      double v33 = v40 - v50;
    }
  }
  else
  {
    double v33 = 0.0;
  }

  return v33;
}

- (id)deepCopy
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v5, (uint64_t)self, 1, 0);
  uint64_t v8 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v3, v7, v4, (uint64_t)v6, 0);

  return v8;
}

- (NSString)description
{
  v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  v11 = objc_msgSend_UUIDString(self->_UUID, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_substringToIndex_(v11, v12, 5, v13, v14);
  objc_msgSend_appendFormat_(v6, v16, @"uuid=%@, ", v17, v18, v15);

  objc_msgSend_appendFormat_(v6, v19, @"intf=%@, ", v20, v21, self->_interfaceName);
  uint64_t v26 = sub_1B4F520D4(self->_trigger, v22, v23, v24, v25);
  objc_msgSend_appendFormat_(v6, v27, @"trigger=%@. ", v28, v29, v26);

  v34 = sub_1B4F54A28(self->_state, v30, v31, v32, v33);
  objc_msgSend_appendFormat_(v6, v35, @"state=%@, ", v36, v37, v34);

  if (self->_result) {
    objc_msgSend_appendFormat_(v6, v38, @"result=%s, ", v39, v40, "yes");
  }
  else {
    objc_msgSend_appendFormat_(v6, v38, @"result=%s, ", v39, v40, "no");
  }
  v41 = sub_1B4F3D76C(self->_startedAt);
  objc_msgSend_appendFormat_(v6, v42, @"start=%@, ", v43, v44, v41);

  v45 = sub_1B4F3D76C(self->_endedAt);
  objc_msgSend_duration(self, v46, v47, v48, v49);
  objc_msgSend_appendFormat_(v6, v51, @"end=%@ (%lums), ", v52, v53, v45, (unint64_t)(v50 * 1000.0));

  objc_msgSend_appendFormat_(v6, v54, @"joins=%@", v55, v56, self->_joinAttempts);
  return (NSString *)v6;
}

- (BOOL)isEqualToAutoJoinStatus:(id)a3
{
  id v5 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v5, v7, v8, v9, v10);
  uint64_t v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  if (UUID != v15)
  {
    if (!self->_UUID || (objc_msgSend_UUID(v5, v11, v12, v13, v14), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_55;
    }
    uint64_t v3 = (void *)v16;
    uint64_t v21 = self->_UUID;
    v22 = objc_msgSend_UUID(v5, v17, v18, v19, v20);
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      char isEqual = 0;
LABEL_54:

      goto LABEL_55;
    }
    v125 = v22;
  }
  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v5, v11, v12, v13, v14);
  uint64_t v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (startedAt != v32)
  {
    if (!self->_startedAt)
    {
      char isEqual = 0;
      goto LABEL_53;
    }
    uint64_t v33 = objc_msgSend_startedAt(v5, v28, v29, v30, v31);
    if (!v33) {
      goto LABEL_43;
    }
    uint64_t v38 = (void *)v33;
    uint64_t v39 = self->_startedAt;
    uint64_t v40 = objc_msgSend_startedAt(v5, v34, v35, v36, v37);
    v41 = v39;
    uint64_t v42 = (void *)v40;
    if ((objc_msgSend_isEqual_(v41, v43, v40, v44, v45) & 1) == 0)
    {

      goto LABEL_43;
    }
    v121 = v42;
    v123 = v38;
  }
  endedAt = self->_endedAt;
  uint64_t v47 = objc_msgSend_endedAt(v5, v28, v29, v30, v31);
  joinAttempts = (NSDate *)v47;
  if (endedAt == (NSDate *)v47)
  {
    v124 = (NSDate *)v47;
    v64 = v3;
LABEL_20:
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v5, v48, v49, v50, v51);
    v66 = (NSString *)objc_claimAutoreleasedReturnValue();
    v120 = interfaceName;
    v122 = v66;
    if (interfaceName == v66)
    {
      v119 = joinAttempts;
      uint64_t v3 = v64;
    }
    else
    {
      if (!self->_interfaceName)
      {
        v119 = joinAttempts;
        char isEqual = 0;
        uint64_t v3 = v64;
        goto LABEL_46;
      }
      uint64_t v71 = objc_msgSend_interfaceName(v5, v67, v68, v69, v70);
      uint64_t v3 = v64;
      if (!v71)
      {
        v119 = joinAttempts;
        LOBYTE(joinAttempts) = 0;
        goto LABEL_48;
      }
      v116 = (void *)v71;
      v118 = self->_interfaceName;
      v76 = objc_msgSend_interfaceName(v5, v72, v73, v74, v75);
      if ((objc_msgSend_isEqual_(v118, v77, (uint64_t)v76, v78, v79) & 1) == 0)
      {

        char isEqual = 0;
        BOOL v112 = endedAt == v124;
        v113 = v124;
        if (!v112)
        {
LABEL_57:

          v110 = v123;
          joinAttempts = v113;
LABEL_58:

          if (startedAt == v32)
          {
LABEL_60:

LABEL_61:
            v22 = v125;
            if (UUID == v15) {
              goto LABEL_55;
            }
            goto LABEL_54;
          }
LABEL_59:

          goto LABEL_60;
        }
LABEL_69:

        v110 = v123;
        if (startedAt == v32) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }
      v115 = v76;
      v119 = joinAttempts;
    }
    int64_t trigger = self->_trigger;
    if (trigger == objc_msgSend_trigger(v5, v67, v68, v69, v70)
      && (int64_t state = self->_state, state == objc_msgSend_state(v5, v82, v83, v84, v85))
      && (int v91 = self->_result, v91 == objc_msgSend_result(v5, v87, v88, v89, v90)))
    {
      joinAttempts = (NSDate *)self->_joinAttempts;
      objc_msgSend_joinAttempts(v5, v92, v93, v94, v95);
      v96 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v101 = v96;
      LOBYTE(joinAttempts) = joinAttempts == v96;
      if ((_BYTE)joinAttempts || !self->_joinAttempts)
      {

        char isEqual = (char)joinAttempts;
LABEL_38:
        v66 = v122;
        if (v120 != v122)
        {

LABEL_48:
          char isEqual = (char)joinAttempts;
LABEL_49:
          v80 = v123;
          joinAttempts = v124;
          if (endedAt != v124)
          {
          }
          goto LABEL_51;
        }
LABEL_46:

        goto LABEL_49;
      }
      objc_msgSend_joinAttempts(v5, v97, v98, v99, v100);
      joinAttempts = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (joinAttempts)
      {
        v106 = self->_joinAttempts;
        v114 = objc_msgSend_joinAttempts(v5, v102, v103, v104, v105);
        char isEqual = objc_msgSend_isEqual_(v106, v107, (uint64_t)v114, v108, v109);

        if (v120 == v122)
        {
        }
        else
        {
        }
        BOOL v112 = endedAt == v124;
        v113 = v124;
        joinAttempts = v119;
        if (!v112) {
          goto LABEL_57;
        }
        goto LABEL_69;
      }
    }
    else
    {
      LOBYTE(joinAttempts) = 0;
    }
    char isEqual = 0;
    goto LABEL_38;
  }
  if (self->_endedAt)
  {
    uint64_t v53 = objc_msgSend_endedAt(v5, v48, v49, v50, v51);
    if (!v53)
    {
      char isEqual = 0;
      v110 = v123;
      goto LABEL_58;
    }
    v124 = joinAttempts;
    v117 = (void *)v53;
    v58 = self->_endedAt;
    uint64_t v59 = objc_msgSend_endedAt(v5, v54, v55, v56, v57);
    v60 = v58;
    joinAttempts = (NSDate *)v59;
    if (objc_msgSend_isEqual_(v60, v61, v59, v62, v63))
    {
      v64 = v3;
      goto LABEL_20;
    }

    if (startedAt == v32)
    {

      goto LABEL_44;
    }

LABEL_43:
LABEL_44:
    char isEqual = 0;
    goto LABEL_61;
  }
  char isEqual = 0;
  v80 = v123;
LABEL_51:

  if (startedAt != v32)
  {
  }
LABEL_53:
  v22 = v125;

  if (UUID != v15) {
    goto LABEL_54;
  }
LABEL_55:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFAutoJoinStatus *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToAutoJoinStatus = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAutoJoinStatus = objc_msgSend_isEqualToAutoJoinStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToAutoJoinStatus = 0;
  }

  return isEqualToAutoJoinStatus;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
  uint64_t v16 = objc_msgSend_hash(self->_startedAt, v12, v13, v14, v15);
  uint64_t v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_endedAt, v17, v18, v19, v20);
  joinAttempts = self->_joinAttempts;
  int64_t v23 = self->_trigger ^ self->_state ^ self->_result;
  return v21 ^ v23 ^ objc_msgSend_hash(joinAttempts, v24, v25, v26, v27);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFAutoJoinStatus, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setStartedAt_(v11, v18, (uint64_t)self->_startedAt, v19, v20);
  objc_msgSend_setEndedAt_(v11, v21, (uint64_t)self->_endedAt, v22, v23);
  objc_msgSend_setTrigger_(v11, v24, self->_trigger, v25, v26);
  objc_msgSend_setState_(v11, v27, self->_state, v28, v29);
  objc_msgSend_setResult_(v11, v30, self->_result, v31, v32);
  objc_msgSend_setJoinAttempts_(v11, v33, (uint64_t)self->_joinAttempts, v34, v35);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v21 = a3;
  objc_msgSend_encodeObject_forKey_(v21, v5, (uint64_t)UUID, @"_UUID", v6);
  objc_msgSend_encodeObject_forKey_(v21, v7, (uint64_t)self->_interfaceName, @"_interfaceName", v8);
  objc_msgSend_encodeObject_forKey_(v21, v9, (uint64_t)self->_startedAt, @"_startedAt", v10);
  objc_msgSend_encodeObject_forKey_(v21, v11, (uint64_t)self->_endedAt, @"_endedAt", v12);
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)self->_joinAttempts, @"_joinAttempts", v14);
  objc_msgSend_encodeInteger_forKey_(v21, v15, self->_trigger, @"_trigger", v16);
  objc_msgSend_encodeInteger_forKey_(v21, v17, self->_state, @"_state", v18);
  objc_msgSend_encodeBool_forKey_(v21, v19, self->_result, @"_result", v20);
}

- (CWFAutoJoinStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CWFAutoJoinStatus;
  id v5 = [(CWFAutoJoinStatus *)&v47 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_UUID", v8);
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_interfaceName", v13);
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"_startedAt", v18);
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"_endedAt", v23);
    endedAt = v5->_endedAt;
    v5->_endedAt = (NSDate *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v32 = objc_msgSend_setWithObjects_(v26, v29, v27, v30, v31, v28, 0);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, @"_joinAttempts", v34);
    joinAttempts = v5->_joinAttempts;
    v5->_joinAttempts = (NSArray *)v35;

    v5->_int64_t trigger = objc_msgSend_decodeIntegerForKey_(v4, v37, @"_trigger", v38, v39);
    v5->_int64_t state = objc_msgSend_decodeIntegerForKey_(v4, v40, @"_state", v41, v42);
    v5->_result = objc_msgSend_decodeBoolForKey_(v4, v43, @"_result", v44, v45);
  }

  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSDate)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(id)a3
{
}

- (NSArray)joinAttempts
{
  return self->_joinAttempts;
}

- (void)setJoinAttempts:(id)a3
{
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_int64_t trigger = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinAttempts, 0);
  objc_storeStrong((id *)&self->_endedAt, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = objc_msgSend_UUID(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"uuid", v15);

  uint64_t v20 = objc_msgSend_interfaceName(self, v16, v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, @"interface_name", v22);

  uint64_t v27 = objc_msgSend_startedAt(self, v23, v24, v25, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, @"started_at", v29);

  uint64_t v34 = objc_msgSend_endedAt(self, v30, v31, v32, v33);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, @"ended_at", v36);

  uint64_t v37 = NSNumber;
  objc_msgSend_duration(self, v38, v39, v40, v41);
  v46 = objc_msgSend_numberWithUnsignedInteger_(v37, v43, (unint64_t)(v42 * 1000.0), v44, v45);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)v46, @"duration", v48);

  uint64_t v49 = NSNumber;
  uint64_t v54 = objc_msgSend_result(self, v50, v51, v52, v53);
  v58 = objc_msgSend_numberWithBool_(v49, v55, v54, v56, v57);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, @"result", v60);

  unint64_t v65 = objc_msgSend_state(self, v61, v62, v63, v64);
  uint64_t v70 = sub_1B4F54A28(v65, v66, v67, v68, v69);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v71, (uint64_t)v70, @"state", v72);

  unint64_t v77 = objc_msgSend_trigger(self, v73, v74, v75, v76);
  v82 = sub_1B4F520D4(v77, v78, v79, v80, v81);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v83, (uint64_t)v82, @"trigger", v84);

  id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v90 = objc_msgSend_joinAttempts(self, v86, v87, v88, v89, 0);
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v92)
  {
    uint64_t v97 = v92;
    uint64_t v98 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v97; ++i)
      {
        if (*(void *)v113 != v98) {
          objc_enumerationMutation(v90);
        }
        uint64_t v100 = objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((void *)&v112 + 1) + 8 * i), v93, v94, v95, v96);
        objc_msgSend_addObject_(v85, v101, (uint64_t)v100, v102, v103);
      }
      uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v112, (uint64_t)v116, 16);
    }
    while (v97);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v104, (uint64_t)v85, @"join_attempts", v105);
  uint64_t v109 = sub_1B4F59CC8(v3, 0, 1u);
  if (v109)
  {
    v110 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v106, (uint64_t)v109, v107, v108);
  }
  else
  {
    v110 = 0;
  }

  return v110;
}

@end