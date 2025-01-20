@interface HKClinicalGatewayEndpointSchema
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (HKClinicalGatewayEndpointSchema)init;
- (HKClinicalGatewayEndpointSchema)initWithAuth:(id)a3 body:(id)a4 enabled:(BOOL)a5 form:(id)a6 headers:(id)a7 method:(id)a8 minCompatibleAPIVersion:(int64_t)a9 name:(id)a10 query:(id)a11 URL:(id)a12;
- (HKClinicalGatewayEndpointSchema)initWithCoder:(id)a3;
- (NSArray)form;
- (NSArray)headers;
- (NSArray)query;
- (NSDictionary)body;
- (NSString)URL;
- (NSString)auth;
- (NSString)method;
- (NSString)name;
- (int64_t)minCompatibleAPIVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalGatewayEndpointSchema

- (HKClinicalGatewayEndpointSchema)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalGatewayEndpointSchema)initWithAuth:(id)a3 body:(id)a4 enabled:(BOOL)a5 form:(id)a6 headers:(id)a7 method:(id)a8 minCompatibleAPIVersion:(int64_t)a9 name:(id)a10 query:(id)a11 URL:(id)a12
{
  id v43 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v44.receiver = self;
  v44.super_class = (Class)HKClinicalGatewayEndpointSchema;
  v25 = [(HKClinicalGatewayEndpointSchema *)&v44 init];
  if (v25)
  {
    uint64_t v26 = [v43 copy];
    auth = v25->_auth;
    v25->_auth = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    body = v25->_body;
    v25->_body = (NSDictionary *)v28;

    v25->_enabled = a5;
    uint64_t v30 = [v19 copy];
    form = v25->_form;
    v25->_form = (NSArray *)v30;

    uint64_t v32 = [v20 copy];
    headers = v25->_headers;
    v25->_headers = (NSArray *)v32;

    uint64_t v34 = [v21 copy];
    method = v25->_method;
    v25->_method = (NSString *)v34;

    v25->_minCompatibleAPIVersion = a9;
    uint64_t v36 = [v22 copy];
    name = v25->_name;
    v25->_name = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    query = v25->_query;
    v25->_query = (NSArray *)v38;

    uint64_t v40 = [v24 copy];
    URL = v25->_URL;
    v25->_URL = (NSString *)v40;
  }
  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKClinicalGatewayEndpointSchema *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_29:

      goto LABEL_30;
    }
    auth = self->_auth;
    v10 = [(HKClinicalGatewayEndpointSchema *)v8 auth];
    if (auth != v10)
    {
      uint64_t v11 = [(HKClinicalGatewayEndpointSchema *)v8 auth];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_28;
      }
      v3 = (void *)v11;
      v12 = self->_auth;
      v13 = [(HKClinicalGatewayEndpointSchema *)v8 auth];
      if (![(NSString *)v12 isEqualToString:v13])
      {
        char v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v100 = v13;
    }
    body = self->_body;
    v16 = [(HKClinicalGatewayEndpointSchema *)v8 body];
    if (body != v16)
    {
      uint64_t v17 = [(HKClinicalGatewayEndpointSchema *)v8 body];
      if (!v17) {
        goto LABEL_25;
      }
      uint64_t v4 = (void *)v17;
      id v18 = self->_body;
      uint64_t v19 = [(HKClinicalGatewayEndpointSchema *)v8 body];
      id v20 = v18;
      id v21 = (void *)v19;
      if (([(NSDictionary *)v20 isEqual:v19] & 1) == 0)
      {

LABEL_24:
        goto LABEL_25;
      }
      v99 = v21;
    }
    BOOL enabled = self->_enabled;
    if (enabled != [(HKClinicalGatewayEndpointSchema *)v8 enabled])
    {
      char v14 = 0;
      if (body == v16)
      {
LABEL_22:

        goto LABEL_26;
      }
LABEL_21:

      goto LABEL_22;
    }
    v98 = auth;
    id v23 = v16;
    id v24 = body;
    v25 = v3;
    uint64_t v26 = v4;
    form = self->_form;
    uint64_t v28 = [(HKClinicalGatewayEndpointSchema *)v8 form];
    v97 = form;
    if (form == v28)
    {
      uint64_t v4 = v26;
      v3 = v25;
      v94 = v24;
      goto LABEL_32;
    }
    v95 = v25;
    uint64_t v29 = [(HKClinicalGatewayEndpointSchema *)v8 form];
    if (v29)
    {
      v93 = (void *)v29;
      uint64_t v30 = v28;
      v31 = self->_form;
      uint64_t v32 = [(HKClinicalGatewayEndpointSchema *)v8 form];
      v33 = v31;
      uint64_t v34 = (void *)v32;
      if ([(NSArray *)v33 isEqualToArray:v32])
      {
        v94 = v24;
        v88 = v34;
        uint64_t v28 = v30;
        uint64_t v4 = v26;
        v3 = v25;
LABEL_32:
        v16 = v23;
        headers = self->_headers;
        v96 = [(HKClinicalGatewayEndpointSchema *)v8 headers];
        v92 = headers;
        BOOL v37 = headers == v96;
        auth = v98;
        if (!v37)
        {
          uint64_t v38 = [(HKClinicalGatewayEndpointSchema *)v8 headers];
          if (!v38)
          {

            if (v97 == v28)
            {
            }
            else
            {
            }
            v56 = v99;
            if (v94 == v16) {
              goto LABEL_25;
            }
            goto LABEL_64;
          }
          v87 = (void *)v38;
          v90 = v4;
          v39 = v28;
          uint64_t v40 = self->_headers;
          uint64_t v41 = [(HKClinicalGatewayEndpointSchema *)v8 headers];
          v42 = v40;
          id v43 = (void *)v41;
          if (![(NSArray *)v42 isEqualToArray:v41])
          {

            if (v97 == v39)
            {
            }
            else
            {
            }
            if (v94 != v16)
            {
            }
            goto LABEL_25;
          }
          v85 = v43;
          uint64_t v28 = v39;
          uint64_t v4 = v90;
        }
        method = self->_method;
        v91 = [(HKClinicalGatewayEndpointSchema *)v8 method];
        v86 = method;
        if (method == v91)
        {
          v89 = v28;
          int64_t minCompatibleAPIVersion = self->_minCompatibleAPIVersion;
          if (minCompatibleAPIVersion != [(HKClinicalGatewayEndpointSchema *)v8 minCompatibleAPIVersion])
          {
            char v14 = 0;
            v49 = v97;
            goto LABEL_100;
          }
        }
        else
        {
          uint64_t v46 = [(HKClinicalGatewayEndpointSchema *)v8 method];
          if (!v46)
          {

            if (v92 == v96)
            {
            }
            else
            {
            }
            if (v97 != v28)
            {
            }
            if (v94 == v16) {
              goto LABEL_25;
            }

            goto LABEL_24;
          }
          v84 = (void *)v46;
          v89 = v28;
          v47 = self->_method;
          method = [(HKClinicalGatewayEndpointSchema *)v8 method];
          if (![(NSString *)v47 isEqualToString:method])
          {

            if (v92 == v96)
            {
            }
            else
            {
            }
            if (v97 != v89)
            {
            }
            if (v94 != v16)
            {
            }
            goto LABEL_25;
          }
          int64_t v48 = self->_minCompatibleAPIVersion;
          if (v48 != [(HKClinicalGatewayEndpointSchema *)v8 minCompatibleAPIVersion])
          {
            char v14 = 0;
            v49 = v97;
LABEL_99:

LABEL_100:
            if (v92 != v96)
            {
            }
            if (v49 != v89)
            {
            }
            if (v94 == v16) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
        }
        name = self->_name;
        v83 = [(HKClinicalGatewayEndpointSchema *)v8 name];
        if (name == v83)
        {
          v79 = method;
          v82 = name;
LABEL_69:
          query = self->_query;
          v81 = [(HKClinicalGatewayEndpointSchema *)v8 query];
          v76 = query;
          v77 = name;
          if (query == v81)
          {
            method = v79;
          }
          else
          {
            uint64_t v58 = [(HKClinicalGatewayEndpointSchema *)v8 query];
            if (!v58)
            {
              char v14 = 0;
              v49 = v97;
              method = v79;
              goto LABEL_96;
            }
            v75 = (void *)v58;
            v59 = self->_query;
            uint64_t v60 = [(HKClinicalGatewayEndpointSchema *)v8 query];
            v61 = v59;
            v62 = (void *)v60;
            method = v79;
            if (![(NSArray *)v61 isEqualToArray:v60])
            {

              char v14 = 0;
LABEL_116:
              v71 = v83;
              v63 = v86;
              if (v82 == v83)
              {
LABEL_119:

                if (v63 == v91)
                {
                  v72 = v4;
                }
                else
                {
                  v72 = v4;
                }
                if (v92 != v96)
                {
                }
                if (v97 != v89)
                {
                }
                if (v94 != v16)
                {
                }
                goto LABEL_22;
              }

LABEL_118:
              v71 = v83;
              goto LABEL_119;
            }
            v74 = v62;
          }
          URL = self->_URL;
          uint64_t v65 = [(HKClinicalGatewayEndpointSchema *)v8 URL];
          v66 = URL;
          char v14 = URL == (NSString *)v65;
          if (!v14)
          {
            v80 = (void *)v65;
            uint64_t v67 = [(HKClinicalGatewayEndpointSchema *)v8 URL];
            if (v67)
            {
              v68 = self->_URL;
              v73 = (void *)v67;
              v69 = [(HKClinicalGatewayEndpointSchema *)v8 URL];
              char v14 = [(NSString *)v68 isEqualToString:v69];

              if (v76 == v81)
              {
              }
              else
              {
              }
              goto LABEL_116;
            }
            v66 = (NSString *)v80;
          }

          if (v76 == v81)
          {

            v70 = v83;
            v49 = v97;
            if (v82 == v83)
            {
LABEL_98:

              if (v86 == v91) {
                goto LABEL_100;
              }
              goto LABEL_99;
            }
LABEL_97:

            v70 = v83;
            goto LABEL_98;
          }

          v49 = v97;
LABEL_96:

          v70 = v83;
          if (v82 == v83) {
            goto LABEL_98;
          }
          goto LABEL_97;
        }
        uint64_t v52 = [(HKClinicalGatewayEndpointSchema *)v8 name];
        if (!v52)
        {
          char v14 = 0;
          v63 = v86;
          goto LABEL_118;
        }
        v82 = name;
        v78 = (void *)v52;
        v53 = self->_name;
        uint64_t v54 = [(HKClinicalGatewayEndpointSchema *)v8 name];
        v55 = v53;
        name = (NSString *)v54;
        if ([(NSString *)v55 isEqualToString:v54])
        {
          v79 = method;
          goto LABEL_69;
        }

        if (v86 == v91)
        {
        }
        else
        {
        }
        if (v92 != v96)
        {
        }
        if (v97 != v89)
        {
        }
        if (v94 != v16)
        {
          v56 = v99;
LABEL_64:

          goto LABEL_24;
        }
LABEL_25:

        char v14 = 0;
LABEL_26:
        v13 = v100;
        if (auth != v10) {
          goto LABEL_27;
        }
LABEL_28:

        goto LABEL_29;
      }

      objc_super v44 = v99;
      if (v24 != v23) {
        goto LABEL_44;
      }
    }
    else
    {

      if (v24 != v23)
      {
        objc_super v44 = v99;
LABEL_44:

        goto LABEL_46;
      }
    }

LABEL_46:
    char v14 = 0;
    v13 = v100;
    v3 = v95;
    if (v98 == v10) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  char v14 = 1;
LABEL_30:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_auth hash];
  uint64_t v4 = [(NSDictionary *)self->_body hash] ^ v3;
  BOOL enabled = self->_enabled;
  uint64_t v6 = v4 ^ enabled ^ [(NSArray *)self->_form hash];
  uint64_t v7 = [(NSArray *)self->_headers hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_method hash] ^ self->_minCompatibleAPIVersion;
  NSUInteger v9 = [(NSString *)self->_name hash];
  uint64_t v10 = v9 ^ [(NSArray *)self->_query hash];
  return v8 ^ v10 ^ [(NSString *)self->_URL hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  body = self->_body;
  if (body)
  {
    id v14 = 0;
    uint64_t v7 = [MEMORY[0x263F08900] dataWithJSONObject:body options:0 error:&v14];
    id v8 = v14;
    if (!v7)
    {
      _HKInitializeLogging();
      NSUInteger v9 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = v9;
        uint64_t v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543874;
        v16 = v12;
        __int16 v17 = 2114;
        id v18 = v13;
        __int16 v19 = 2114;
        id v20 = v8;
        _os_log_error_impl(&dword_221D38000, v10, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to encode JSON to data: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v5 encodeObject:self->_auth forKey:@"auth"];
  [v5 encodeObject:v7 forKey:@"body"];
  [v5 encodeBool:self->_enabled forKey:@"enabled"];
  [v5 encodeObject:self->_form forKey:@"form"];
  [v5 encodeObject:self->_headers forKey:@"headers"];
  [v5 encodeObject:self->_method forKey:@"method"];
  [v5 encodeInteger:self->_minCompatibleAPIVersion forKey:@"minCompatibleAPIVersion"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_query forKey:@"query"];
  [v5 encodeObject:self->_URL forKey:@"URL"];
}

- (HKClinicalGatewayEndpointSchema)initWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"auth"];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    if (v7)
    {
      id v29 = 0;
      id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v29];
      id v9 = v29;
      if (!v8)
      {
        _HKInitializeLogging();
        uint64_t v10 = (void *)*MEMORY[0x263F09908];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
        {
          id v20 = v10;
          uint64_t v21 = (objc_class *)objc_opt_class();
          id v22 = NSStringFromClass(v21);
          id v23 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138543874;
          v31 = v22;
          __int16 v32 = 2114;
          v33 = v23;
          __int16 v34 = 2114;
          id v35 = v9;
          _os_log_error_impl(&dword_221D38000, v20, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to decode data to JSON: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
    if ([v5 containsValueForKey:@"enabled"])
    {
      uint64_t v12 = [v5 decodeBoolForKey:@"enabled"];
      v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"method"];
      if (v13 && ([v5 containsValueForKey:@"minCompatibleAPIVersion"] & 1) != 0)
      {
        uint64_t v14 = [v5 decodeIntegerForKey:@"minCompatibleAPIVersion"];
        v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
        if (v15)
        {
          uint64_t v27 = v14;
          v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
          if (v16)
          {
            uint64_t v26 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
            v25 = [v5 decodeObjectOfClasses:v26 forKey:@"form"];
            id v24 = [v5 decodeObjectOfClasses:v26 forKey:@"headers"];
            [v5 decodeObjectOfClasses:v26 forKey:@"query"];
            uint64_t v28 = v15;
            id v18 = v17 = v16;
            self = [(HKClinicalGatewayEndpointSchema *)self initWithAuth:v6 body:v8 enabled:v12 form:v25 headers:v24 method:v13 minCompatibleAPIVersion:v27 name:v28 query:v18 URL:v17];

            v16 = v17;
            v15 = v28;

            uint64_t v11 = self;
          }
          else
          {
            objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
            uint64_t v11 = 0;
          }
        }
        else
        {
          objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
          uint64_t v11 = 0;
        }
      }
      else
      {
        objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
        uint64_t v11 = 0;
      }
    }
    else
    {
      objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
      uint64_t v11 = 0;
    }
  }
  else
  {
    objc_msgSend(v5, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSString)auth
{
  return self->_auth;
}

- (NSDictionary)body
{
  return self->_body;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSArray)form
{
  return self->_form;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSString)method
{
  return self->_method;
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)query
{
  return self->_query;
}

- (NSString)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_form, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_auth, 0);
}

@end