@interface ASDAudioDeviceDSPDatabase
- (ASDAudioDeviceDSPDatabase)initWithDictionary:(id)a3 resourcePath:(id)a4 deviceUID:(id)a5;
- (NSSet)dspConfigurations;
- (NSSet)referencedDSPDeviceProperties;
- (NSSet)referencedUnderlyingDeviceProperties;
- (NSString)deviceUID;
- (id)dspConfigurationForDevice:(id)a3;
@end

@implementation ASDAudioDeviceDSPDatabase

- (ASDAudioDeviceDSPDatabase)initWithDictionary:(id)a3 resourcePath:(id)a4 deviceUID:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v84.receiver = self;
  v84.super_class = (Class)ASDAudioDeviceDSPDatabase;
  v11 = [(ASDAudioDeviceDSPDatabase *)&v84 init];
  if (v11)
  {
    p_isa = (id *)&v11->super.isa;
    id v60 = v10;
    objc_storeStrong((id *)&v11->_deviceUID, a5);
    obuint64_t j = [MEMORY[0x263EFF9C0] set];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v89 count:16];
    v61 = (ASDAudioDeviceDSPDatabase *)p_isa;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v81;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v81 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          v19 = [v13 objectForKeyedSubscript:v18];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (v20 = [[ASDAudioDeviceDSPConfiguration alloc] initWithDictionary:v19 resourcePath:v9 name:v18]) == 0)
          {

            BOOL v49 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v49) {
              -[ASDAudioDeviceDSPDatabase initWithDictionary:resourcePath:deviceUID:](v49, v50, v51, v52, v53, v54, v55, v56);
            }
            v22 = v61;
            v47 = 0;
            goto LABEL_43;
          }
          v21 = v20;
          [obj addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v80 objects:v89 count:16];
        p_isa = (id *)&v61->super.isa;
        if (v15) {
          continue;
        }
        break;
      }
    }
    id v58 = v9;
    id v59 = v8;

    objc_storeStrong(p_isa + 2, obj);
    v22 = [MEMORY[0x263EFF9C0] set];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v23 = [p_isa dspConfigurations];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v77 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          v29 = objc_msgSend(v28, "underlyingDeviceProperties", v58, v59);
          uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v87 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v73;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v73 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = [*(id *)(*((void *)&v72 + 1) + 8 * k) address];
                [v22 addObject:v34];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v87 count:16];
            }
            while (v31);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v25);
    }

    objc_storeStrong((id *)&v61->_referencedUnderlyingDeviceProperties, v22);
    v35 = [MEMORY[0x263EFF9C0] set];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v63 = [(ASDAudioDeviceDSPDatabase *)v61 dspConfigurations];
    uint64_t v36 = [v63 countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v69 != v38) {
            objc_enumerationMutation(v63);
          }
          v40 = *(void **)(*((void *)&v68 + 1) + 8 * m);
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v41 = objc_msgSend(v40, "dspDeviceProperties", v58, v59);
          uint64_t v42 = [v41 countByEnumeratingWithState:&v64 objects:v85 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v65;
            do
            {
              for (uint64_t n = 0; n != v43; ++n)
              {
                if (*(void *)v65 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = [*(id *)(*((void *)&v64 + 1) + 8 * n) address];
                [(NSSet *)v35 addObject:v46];
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v64 objects:v85 count:16];
            }
            while (v43);
          }
        }
        uint64_t v37 = [v63 countByEnumeratingWithState:&v68 objects:v86 count:16];
      }
      while (v37);
    }

    v47 = v61;
    referencedDSPDeviceProperties = v61->_referencedDSPDeviceProperties;
    v61->_referencedDSPDeviceProperties = v35;

    id v9 = v58;
    id v8 = v59;
LABEL_43:
    id v10 = v60;
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (id)dspConfigurationForDevice:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [(ASDAudioDeviceDSPDatabase *)self dspConfigurations];
  uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v39;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v39 != v28) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(id *)(*((void *)&v38 + 1) + 8 * v5);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v7 = [v6 underlyingDeviceProperties];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
      id v9 = v6;
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v11 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(v7);
            }
            id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v14 = [v13 address];
            uint64_t v15 = [v4 getProperty:v14];

            uint64_t v16 = [v13 value];
            LOBYTE(v14) = [v15 isEqual:v16];

            if ((v14 & 1) == 0)
            {

              id v9 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        id v9 = v6;
      }
LABEL_16:

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v17 = [v6 dspDeviceProperties];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            uint64_t v23 = [v22 address];
            uint64_t v24 = [v4 getProperty:v23];

            uint64_t v25 = [v22 value];
            LOBYTE(v23) = [v24 isEqual:v25];

            if ((v23 & 1) == 0)
            {

              goto LABEL_27;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      if (v9) {
        break;
      }
LABEL_27:
      if (++v5 == v29)
      {
        uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v29) {
          goto LABEL_3;
        }
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    id v9 = 0;
  }

  return v9;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (NSSet)dspConfigurations
{
  return self->_dspConfigurations;
}

- (NSSet)referencedUnderlyingDeviceProperties
{
  return self->_referencedUnderlyingDeviceProperties;
}

- (NSSet)referencedDSPDeviceProperties
{
  return self->_referencedDSPDeviceProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedDSPDeviceProperties, 0);
  objc_storeStrong((id *)&self->_referencedUnderlyingDeviceProperties, 0);
  objc_storeStrong((id *)&self->_dspConfigurations, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 deviceUID:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end