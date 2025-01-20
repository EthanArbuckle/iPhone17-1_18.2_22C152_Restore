@interface NEIKEv2IdentifierPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEIKEv2IdentifierPayload

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ikeSA);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)parsePayloadData
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v20 = "-[NEIKEv2IdentifierPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_16;
    }
LABEL_7:

    return 0;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v20 = "-[NEIKEv2IdentifierPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_id_hdr_t))";
LABEL_16:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v18 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v18, 4);
  id v9 = objc_getProperty(self, v8, 16, 1);
  id v11 = objc_getProperty(self, v10, 16, 1);
  v12 = objc_msgSend(v9, "subdataWithRange:", 4, objc_msgSend(v11, "length") - 4);

  id v13 = +[NEIKEv2Identifier createIdentifierWithType:v18 data:v12];
  objc_setProperty_atomic(self, v14, v13, 24);

  if (objc_getProperty(self, v15, 24, 1))
  {
    BOOL v7 = [(NEIKEv2IdentifierPayload *)self hasRequiredFields];
  }
  else
  {
    v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v20[0] = v18;
      LOWORD(v20[1]) = 2112;
      *(void *)((char *)&v20[1] + 2) = v12;
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Failed to parse identifier type %u data %@", buf, 0x12u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)generatePayloadData
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1)) {
      goto LABEL_3;
    }
    if ([(NEIKEv2IdentifierPayload *)self hasRequiredFields])
    {
      int v57 = objc_msgSend(objc_getProperty(self, v6, 24, 1), "identifierType");
      id Property = objc_getProperty(self, v7, 24, 1);
      goto LABEL_7;
    }
LABEL_41:
    v54 = ne_log_obj();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "ID payload missing required fields", location, 2u);
    }

    return 0;
  }
  if (([0 hasRequiredFields] & 1) == 0) {
    goto LABEL_41;
  }
  unsigned __int8 v53 = [0 identifierType];
  id Property = 0;
  int v57 = v53;
LABEL_7:
  SEL v10 = [Property identifierData];
  if (self) {
    id v11 = objc_getProperty(self, v9, 24, 1);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v42 = v10;
LABEL_31:
    uint64_t v49 = objc_msgSend(v42, "length", v55) + 4;
    v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v49];
    [v50 appendBytes:&v57 length:4];
    [v50 appendData:v42];
    if (!self)
    {

      id v4 = 0;
      return v4 != 0;
    }
    objc_setProperty_atomic(self, v51, v50, 16);

LABEL_3:
    id v4 = objc_getProperty(self, v3, 16, 1);
    return v4 != 0;
  }
  if (self)
  {
    id v15 = objc_getProperty(self, v14, 24, 1);
    v16 = objc_loadWeakRetained((id *)&self->_ikeSA);
    v24 = v16;
    if (v15)
    {
      if (v16)
      {
        v25 = (id *)v15;
        *(void *)location = 0;
        v26 = [v25 identifierData];
        uint64_t v27 = [v26 length];

        if (v27)
        {
          v35 = -[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v24, location);
          if (v35)
          {
            uint64_t v55 = (uint64_t)v15;
            v56 = v10;
            v36 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v24, location);
            if (v36)
            {
              id v37 = v25[2];
              v38 = [_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE alloc];
              v39 = [v25 identifierData];
              id v40 = v25[4];
              if (v37)
              {
                v41 = [(NEIKEv2CryptoKitHPKE *)v38 initWithPayload:v39 aad:v40 psk:v36 pskID:v35 keyRef:v25[2]];
              }
              else
              {
                id v44 = v25[3];
                v41 = [(NEIKEv2CryptoKitHPKE *)v38 initWithPayload:v39 aad:v40 psk:v36 pskID:v35 keyData:v44];
              }
              id obj = *(id *)location;
              v42 = [(NEIKEv2CryptoKitHPKE *)v41 performHPKESealAndReturnError:&obj];
              objc_storeStrong((id *)location, obj);
            }
            else
            {
              v42 = 0;
            }
            id v15 = (id)v55;
            SEL v10 = v56;
          }
          else
          {
            v42 = 0;
          }

          ErrorInternal = *(void **)location;
        }
        else
        {
          ErrorInternal = (void *)NEIKEv2CreateErrorInternal(@"Missing identifier data", v28, v29, v30, v31, v32, v33, v34, v55);
          v42 = 0;
          *(void *)location = ErrorInternal;
        }
        id v45 = ErrorInternal;
        if (v45)
        {

          v42 = 0;
          v46 = *(void **)location;
        }
        else
        {
          v46 = 0;
        }
      }
      else
      {
        id v45 = (id)NEIKEv2CreateErrorInternal(@"Missing IKE SA", v17, v18, v19, v20, v21, v22, v23, v55);
        v42 = 0;
      }
      id v47 = v45;

      goto LABEL_29;
    }
    id v47 = 0;
  }
  else
  {
    id v47 = 0;
    id v15 = 0;
    v24 = 0;
  }
  v42 = 0;
LABEL_29:

  id v48 = v47;
  if (v42)
  {

    goto LABEL_31;
  }
  v52 = ne_log_obj();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 138412290;
    *(void *)&location[4] = v48;
    _os_log_error_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_ERROR, "Failed to generate encrypted identifier payload: %@", location, 0xCu);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2IdentifierPayload *)objc_getProperty(self, a2, 24, 1);
  }
  return self != 0;
}

- (id)description
{
  return [(NEIKEv2IdentifierPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  SEL v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  SEL v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Identifier" andIndent:v5 options:a4];

  return v7;
}

+ (id)copyTypeDescription
{
  return @"ID";
}

@end