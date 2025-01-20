@interface ASDAudioDeviceDSPConfiguration
- (ASDAudioDeviceDSPConfiguration)initWithDictionary:(id)a3 resourcePath:(id)a4 name:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)inputDSP;
- (NSArray)outputDSP;
- (NSSet)dspDeviceProperties;
- (NSSet)underlyingDeviceProperties;
- (NSString)name;
- (unint64_t)hash;
@end

@implementation ASDAudioDeviceDSPConfiguration

- (ASDAudioDeviceDSPConfiguration)initWithDictionary:(id)a3 resourcePath:(id)a4 name:(id)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v91.receiver = self;
  v91.super_class = (Class)ASDAudioDeviceDSPConfiguration;
  v11 = [(ASDAudioDeviceDSPConfiguration *)&v91 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_65;
  }
  objc_storeStrong((id *)&v11->_name, a5);
  v13 = [MEMORY[0x263EFF9C0] set];
  v14 = [MEMORY[0x263EFF9C0] set];
  id obj = [MEMORY[0x263EFF980] array];
  v15 = [MEMORY[0x263EFF980] array];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v87 objects:v95 count:16];
  if (!v17)
  {

LABEL_63:
    objc_storeStrong((id *)&v12->_underlyingDeviceProperties, v13);
    objc_storeStrong((id *)&v12->_dspDeviceProperties, v14);
    v61 = obj;
    objc_storeStrong((id *)&v12->_inputDSP, obj);
    objc_storeStrong((id *)&v12->_outputDSP, v15);
    goto LABEL_64;
  }
  uint64_t v18 = v17;
  v73 = v14;
  v74 = v13;
  v63 = v12;
  id v64 = v10;
  id v65 = v8;
  v19 = (ASDStreamDSPConfiguration *)1;
  v71 = v15;
  uint64_t v72 = *(void *)v88;
  v20 = obj;
  id v70 = v16;
  id v67 = v9;
  do
  {
    uint64_t v21 = 0;
    uint64_t v68 = v18;
    do
    {
      if (*(void *)v88 != v72) {
        objc_enumerationMutation(v16);
      }
      v22 = *(void **)(*((void *)&v87 + 1) + 8 * v21);
      if ((objc_msgSend(v22, "isEqualToString:", @"UnderlyingDeviceProperties", v63, v64, v65) & 1) != 0
        || [v22 isEqualToString:@"DSPDeviceProperties"])
      {
        v23 = [v16 objectForKeyedSubscript:v22];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_58;
        }
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v83 objects:v94 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          unsigned int v66 = v19;
          uint64_t v27 = *(void *)v84;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v84 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_25;
              }
              v30 = [[ASDPropertyAddress alloc] initWithDictionary:v29];
              v31 = [ASDProperty alloc];
              v32 = [v29 objectForKeyedSubscript:@"Value"];
              v33 = [(ASDProperty *)v31 initWithAddress:v30 value:v32];

              uint64_t v34 = [(ASDProperty *)v33 address];
              if (!v34
                || (v35 = (void *)v34,
                    [(ASDProperty *)v33 value],
                    v36 = objc_claimAutoreleasedReturnValue(),
                    v36,
                    v35,
                    !v36))
              {

LABEL_25:
                v19 = 0;
                id v9 = v67;
                uint64_t v18 = v68;
                v20 = obj;
                id v16 = v70;
                goto LABEL_26;
              }
              char v37 = [v22 isEqualToString:@"UnderlyingDeviceProperties"];
              v38 = v74;
              if ((v37 & 1) != 0
                || (char v39 = [v22 isEqualToString:@"DSPDeviceProperties"], v38 = v73, (v39 & 1) != 0))
              {
                [v38 addObject:v33];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v83 objects:v94 count:16];
            if (v26) {
              continue;
            }
            break;
          }
          id v9 = v67;
          uint64_t v18 = v68;
          v20 = obj;
          id v16 = v70;
          v19 = (ASDStreamDSPConfiguration *)v66;
        }
        goto LABEL_26;
      }
      if ([v22 isEqualToString:@"Input"])
      {
        v23 = [v16 objectForKeyedSubscript:v22];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_58;
        }
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v24 = v23;
        uint64_t v40 = [v24 countByEnumeratingWithState:&v79 objects:v93 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          v42 = v19;
          uint64_t v43 = *(void *)v80;
LABEL_33:
          uint64_t v44 = 0;
          while (1)
          {
            if (*(void *)v80 != v43) {
              objc_enumerationMutation(v24);
            }
            uint64_t v45 = *(void *)(*((void *)&v79 + 1) + 8 * v44);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_53;
            }
            v19 = [[ASDStreamDSPConfiguration alloc] initWithDictionary:v45 resourcePath:v9];
            if (!v19) {
              goto LABEL_54;
            }
            [v20 addObject:v19];

            if (v41 == ++v44)
            {
              uint64_t v41 = [v24 countByEnumeratingWithState:&v79 objects:v93 count:16];
              if (v41) {
                goto LABEL_33;
              }
              goto LABEL_52;
            }
          }
        }
        goto LABEL_26;
      }
      if ([v22 isEqualToString:@"Output"])
      {
        v23 = [v16 objectForKeyedSubscript:v22];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_58:

          id v10 = v64;
          id v8 = v65;
          v12 = v63;
          v14 = v73;
          v13 = v74;
          v15 = v71;
          goto LABEL_59;
        }
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v24 = v23;
        uint64_t v46 = [v24 countByEnumeratingWithState:&v75 objects:v92 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          v42 = v19;
          uint64_t v48 = *(void *)v76;
LABEL_45:
          uint64_t v49 = 0;
          while (1)
          {
            if (*(void *)v76 != v48) {
              objc_enumerationMutation(v24);
            }
            uint64_t v50 = *(void *)(*((void *)&v75 + 1) + 8 * v49);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            v19 = [[ASDStreamDSPConfiguration alloc] initWithDictionary:v50 resourcePath:v9];
            if (!v19) {
              goto LABEL_54;
            }
            [v71 addObject:v19];

            if (v47 == ++v49)
            {
              uint64_t v47 = [v24 countByEnumeratingWithState:&v75 objects:v92 count:16];
              if (v47) {
                goto LABEL_45;
              }
LABEL_52:
              id v16 = v70;
              v19 = v42;
              goto LABEL_26;
            }
          }
LABEL_53:
          v19 = 0;
LABEL_54:
          id v16 = v70;
        }
LABEL_26:
      }
      ++v21;
    }
    while (v21 != v18);
    uint64_t v51 = [v16 countByEnumeratingWithState:&v87 objects:v95 count:16];
    uint64_t v18 = v51;
  }
  while (v51);

  char v52 = (char)v19;
  id v10 = v64;
  id v8 = v65;
  v12 = v63;
  v14 = v73;
  v13 = v74;
  v15 = v71;
  if (v52) {
    goto LABEL_63;
  }
LABEL_59:
  BOOL v53 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v53) {
    -[ASDAudioDeviceDSPConfiguration initWithDictionary:resourcePath:name:](v53, v54, v55, v56, v57, v58, v59, v60);
  }

  v12 = 0;
  v61 = obj;
LABEL_64:

LABEL_65:
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASDAudioDeviceDSPConfiguration *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ASDAudioDeviceDSPConfiguration *)v5 name];
      v7 = [(ASDAudioDeviceDSPConfiguration *)self name];
      if ([v6 isEqual:v7])
      {
        id v8 = [(ASDAudioDeviceDSPConfiguration *)v5 underlyingDeviceProperties];
        id v9 = [(ASDAudioDeviceDSPConfiguration *)self underlyingDeviceProperties];
        if ([v8 isEqual:v9])
        {
          id v10 = [(ASDAudioDeviceDSPConfiguration *)v5 dspDeviceProperties];
          v11 = [(ASDAudioDeviceDSPConfiguration *)self dspDeviceProperties];
          if ([v10 isEqual:v11])
          {
            v12 = [(ASDAudioDeviceDSPConfiguration *)v5 inputDSP];
            uint64_t v18 = [(ASDAudioDeviceDSPConfiguration *)self inputDSP];
            if (objc_msgSend(v12, "isEqual:"))
            {
              uint64_t v17 = [(ASDAudioDeviceDSPConfiguration *)v5 outputDSP];
              [(ASDAudioDeviceDSPConfiguration *)self outputDSP];
              v13 = id v16 = v12;
              char v14 = [v17 isEqual:v13];

              v12 = v16;
            }
            else
            {
              char v14 = 0;
            }
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(ASDAudioDeviceDSPConfiguration *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(ASDAudioDeviceDSPConfiguration *)self underlyingDeviceProperties];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(ASDAudioDeviceDSPConfiguration *)self dspDeviceProperties];
  uint64_t v8 = [v7 hash];
  id v9 = [(ASDAudioDeviceDSPConfiguration *)self inputDSP];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(ASDAudioDeviceDSPConfiguration *)self outputDSP];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)underlyingDeviceProperties
{
  return self->_underlyingDeviceProperties;
}

- (NSSet)dspDeviceProperties
{
  return self->_dspDeviceProperties;
}

- (NSArray)inputDSP
{
  return self->_inputDSP;
}

- (NSArray)outputDSP
{
  return self->_outputDSP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDSP, 0);
  objc_storeStrong((id *)&self->_inputDSP, 0);
  objc_storeStrong((id *)&self->_dspDeviceProperties, 0);
  objc_storeStrong((id *)&self->_underlyingDeviceProperties, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 name:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end