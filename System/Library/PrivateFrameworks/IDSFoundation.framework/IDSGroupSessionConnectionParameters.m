@interface IDSGroupSessionConnectionParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGroupSessionConnectionParameters:(id)a3;
- (IDSGroupSessionConnectionParameters)initWithStringRepresentation:(id)a3;
- (NSData)salt;
- (NSString)multiplexer;
- (NSString)sessionID;
- (id)description;
- (id)stringRepresentation;
- (unint64_t)participantID;
- (void)setMultiplexer:(id)a3;
- (void)setParticipantID:(unint64_t)a3;
- (void)setSalt:(id)a3;
- (void)setSessionID:(id)a3;
@end

@implementation IDSGroupSessionConnectionParameters

- (IDSGroupSessionConnectionParameters)initWithStringRepresentation:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)IDSGroupSessionConnectionParameters;
  v6 = [(IDSGroupSessionConnectionParameters *)&v87 init];
  if (!v6) {
    goto LABEL_20;
  }
  v8 = objc_msgSend_componentsSeparatedByString_(v4, v5, @":", v7);
  if ((unint64_t)objc_msgSend_count(v8, v9, v10, v11) <= 2)
  {
    v15 = objc_msgSend_Multiplexer(IDSFoundationLog, v12, v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_msgSend_count(v8, v16, v17, v18);
      *(_DWORD *)buf = 134217984;
      uint64_t v89 = v19;
      v20 = "Parameters string doesn't have enough fields (%lu) for the three required parameters";
LABEL_5:
      v21 = v15;
      uint32_t v22 = 12;
LABEL_15:
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v8, v12, 0, v14);
  multiplexer = v6->_multiplexer;
  v6->_multiplexer = (NSString *)v23;

  uint64_t v27 = objc_msgSend_objectAtIndexedSubscript_(v8, v25, 1, v26);
  sessionID = v6->_sessionID;
  v6->_sessionID = (NSString *)v27;

  v31 = objc_msgSend_objectAtIndexedSubscript_(v8, v29, 2, v30);
  uint64_t v35 = objc_msgSend_length(v31, v32, v33, v34);

  if (!v35)
  {
    v15 = objc_msgSend_Multiplexer(IDSFoundationLog, v36, v37, v38);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v20 = "Parameters participant string needs be non-empty";
    goto LABEL_14;
  }
  objc_msgSend_objectAtIndexedSubscript_(v8, v36, 2, v38);
  id v39 = objc_claimAutoreleasedReturnValue();
  v43 = (const char *)objc_msgSend_UTF8String(v39, v40, v41, v42);
  v6->_participantID = strtoull(v43, 0, 10);

  if ((unint64_t)objc_msgSend_count(v8, v44, v45, v46) < 4
    || (objc_msgSend_objectAtIndexedSubscript_(v8, v47, 3, v48),
        v49 = objc_claimAutoreleasedReturnValue(),
        int v52 = objc_msgSend_containsString_(v49, v50, @"S", v51),
        v49,
        !v52))
  {
LABEL_19:

LABEL_20:
    v63 = v6;
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend_count(v8, v53, v54, v55) > 4)
  {
    v64 = objc_msgSend_objectAtIndexedSubscript_(v8, v56, 4, v58);
    uint64_t v68 = objc_msgSend_length(v64, v65, v66, v67);

    if (v68)
    {
      id v72 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v75 = objc_msgSend_objectAtIndexedSubscript_(v8, v73, 4, v74);
      uint64_t v78 = objc_msgSend_initWithBase64EncodedString_options_(v72, v76, (uint64_t)v75, v77, 0);
      salt = v6->_salt;
      v6->_salt = (NSData *)v78;

      if (!v6->_salt)
      {
        v15 = objc_msgSend_Multiplexer(IDSFoundationLog, v80, v81, v82);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v86 = objc_msgSend_objectAtIndexedSubscript_(v8, v84, 4, v85);
          *(_DWORD *)buf = 138412290;
          uint64_t v89 = (uint64_t)v86;
          _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "Parameters string salt field %@ could not convert to NSData", buf, 0xCu);
        }
        goto LABEL_16;
      }
      goto LABEL_19;
    }
    v15 = objc_msgSend_Multiplexer(IDSFoundationLog, v69, v70, v71);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v20 = "Parameters salt string is empty";
LABEL_14:
    v21 = v15;
    uint32_t v22 = 2;
    goto LABEL_15;
  }
  v15 = objc_msgSend_Multiplexer(IDSFoundationLog, v56, v57, v58);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = objc_msgSend_count(v8, v59, v60, v61);
    *(_DWORD *)buf = 134217984;
    uint64_t v89 = v62;
    v20 = "Parameters string doesn't have enough fields (%lu) for salt";
    goto LABEL_5;
  }
LABEL_16:

  v63 = 0;
LABEL_21:

  return v63;
}

- (id)stringRepresentation
{
  if (objc_msgSend_length(self->_multiplexer, a2, v2, v3) && objc_msgSend_length(self->_sessionID, v5, v6, v7))
  {
    v8 = objc_msgSend_stringWithFormat_(NSString, v5, @"%@:%@:%llu", *(double *)&self->_multiplexer, self->_multiplexer, self->_sessionID, self->_participantID);
    if (objc_msgSend_length(self->_salt, v9, v10, v11))
    {
      double v14 = NSString;
      v15 = objc_msgSend_base64EncodedStringWithOptions_(self->_salt, v12, 0, v13);
      uint64_t v18 = objc_msgSend_stringWithFormat_(v14, v16, @"%@:S:%@", v17, v8, v15);

      v8 = (void *)v18;
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend_Multiplexer(IDSFoundationLog, v5, v6, v7);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v19, OS_LOG_TYPE_DEFAULT, "Parameters need required multiplexer and sessionID to be non-empty", buf, 2u);
    }

    v8 = 0;
  }
  return v8;
}

- (id)description
{
  uint64_t v6 = objc_msgSend_length(self->_salt, a2, v2, v3);
  multiplexer = self->_multiplexer;
  if (v6) {
    objc_msgSend_stringWithFormat_(NSString, v5, @"MUXConnParams: multiplexer %@ session %@ participant %llu salt %@", v7, multiplexer, self->_sessionID, self->_participantID, self->_salt);
  }
  else {
  v9 = objc_msgSend_stringWithFormat_(NSString, v5, @"MUXConnParams: multiplexer %@ session %@ participant %llu", v7, multiplexer, self->_sessionID, self->_participantID);
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToGroupSessionConnectionParameters = objc_msgSend_isEqualToGroupSessionConnectionParameters_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToGroupSessionConnectionParameters = 0;
  }

  return isEqualToGroupSessionConnectionParameters;
}

- (BOOL)isEqualToGroupSessionConnectionParameters:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_multiplexer(v4, v5, v6, v7);
  if (objc_msgSend_isEqual_(v8, v9, (uint64_t)self->_multiplexer, v10))
  {
    double v14 = objc_msgSend_sessionID(v4, v11, v12, v13);
    if (objc_msgSend_isEqual_(v14, v15, (uint64_t)self->_sessionID, v16)
      && objc_msgSend_participantID(v4, v17, v18, v19) == self->_participantID)
    {
      objc_msgSend_salt(v4, v20, v21, v22);
      v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (v25 == self->_salt)
      {
        char isEqual = 1;
      }
      else
      {
        uint64_t v27 = objc_msgSend_salt(v4, v23, v24, v26);
        char isEqual = objc_msgSend_isEqual_(v27, v28, (uint64_t)self->_salt, v29);
      }
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (NSString)multiplexer
{
  return self->_multiplexer;
}

- (void)setMultiplexer:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(unint64_t)a3
{
  self->_participantID = a3;
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);
}

@end