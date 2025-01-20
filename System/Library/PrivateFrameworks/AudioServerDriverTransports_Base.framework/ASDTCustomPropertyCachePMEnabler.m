@interface ASDTCustomPropertyCachePMEnabler
- (ASDPropertyAddress)propertyAddress;
- (ASDTCustomProperty)property;
- (ASDTCustomPropertyCachePMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4;
- (id)deviceName;
- (int)enable:(BOOL)a3;
- (void)property;
- (void)setProperty:(id)a3;
- (void)setPropertyAddress:(id)a3;
@end

@implementation ASDTCustomPropertyCachePMEnabler

- (ASDTCustomPropertyCachePMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDTCustomPropertyCachePMEnabler;
  v7 = [(ASDTPMEnabler *)&v11 initWithConfig:v6 forSequencer:a4];
  if (!v7
    || ([v6 asdtPropertyAddress],
        v8 = objc_claimAutoreleasedReturnValue(),
        [(ASDTCustomPropertyCachePMEnabler *)v7 setPropertyAddress:v8],
        v8,
        [(ASDTCustomPropertyCachePMEnabler *)v7 propertyAddress],
        v9 = (ASDTCustomPropertyCachePMEnabler *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v9 = v7;
  }

  return v9;
}

- (id)deviceName
{
  v3 = NSString;
  v4 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
  unsigned int v5 = [v4 selector] >> 29;
  if (v5)
  {
    v29 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
    if ([v29 selector] >> 24 > 0x7E)
    {
      int v7 = 0;
      uint64_t v6 = 32;
    }
    else
    {
      v25 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
      uint64_t v6 = [v25 selector] >> 24;
      int v7 = 1;
    }
  }
  else
  {
    int v7 = 0;
    uint64_t v6 = 32;
  }
  v8 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
  int v9 = [v8 selector] & 0xE00000;
  if (v9)
  {
    v32 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
    if (([v32 selector] >> 16) > 0x7Eu)
    {
      int v36 = 0;
      uint64_t v35 = 32;
    }
    else
    {
      v28 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
      uint64_t v35 = ([v28 selector] >> 16);
      int v36 = 1;
    }
  }
  else
  {
    int v36 = 0;
    uint64_t v35 = 32;
  }
  v10 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
  int v11 = [v10 selector] & 0xE000;
  v42 = v4;
  unsigned int v41 = v5;
  v40 = v8;
  if (v11)
  {
    v31 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
    if (((unsigned __int16)[v31 selector] >> 8) > 0x7Eu)
    {
      int v34 = 0;
      uint64_t v33 = 32;
    }
    else
    {
      v27 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
      uint64_t v33 = ((unsigned __int16)[v27 selector] >> 8);
      int v34 = 1;
    }
  }
  else
  {
    int v34 = 0;
    uint64_t v33 = 32;
  }
  v12 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
  v39 = v10;
  int v37 = [v12 selector] & 0xE0;
  int v38 = v11;
  if (v37)
  {
    v13 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
    unsigned __int8 v14 = [v13 selector];
    v30 = v13;
    int v15 = v9;
    v16 = v3;
    int v17 = v7;
    if (v14 > 0x7Eu)
    {
      int v19 = 0;
      uint64_t v18 = 32;
    }
    else
    {
      v26 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
      uint64_t v18 = [v26 selector];
      int v19 = 1;
    }
  }
  else
  {
    int v15 = v9;
    v16 = v3;
    int v17 = v7;
    int v19 = 0;
    uint64_t v18 = 32;
  }
  v20 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
  uint64_t v21 = [v20 element];
  v22 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
  v23 = objc_msgSend(v16, "stringWithFormat:", @"CacheEnabler S:%c%c%c%c E:%u S:%x", v6, v35, v33, v18, v21, objc_msgSend(v22, "scope"));

  if (v19) {
  if (v37)
  }

  if (v34) {
  if (v38)
  }

  if (v36) {
  if (v15)
  }

  if (v17) {
  if (v41)
  }

  return v23;
}

- (ASDTCustomProperty)property
{
  p_property = &self->_property;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_property);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_property);
  }
  else
  {
    uint64_t v6 = [(ASDTPMDevice *)self parentSequencer];
    int v7 = [v6 parentDevice];
    v8 = [(ASDTCustomPropertyCachePMEnabler *)self propertyAddress];
    int v9 = [v7 customPropertyForAddress:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeWeak((id *)p_property, v9);
    }
    id v10 = objc_loadWeakRetained((id *)p_property);

    if (!v10)
    {
      int v11 = ASDTBaseLogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(ASDTCustomPropertyCachePMEnabler *)self property];
      }
    }
    id v5 = objc_loadWeakRetained((id *)p_property);
  }
  return (ASDTCustomProperty *)v5;
}

- (int)enable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ASDTCustomPropertyCachePMEnabler *)self property];
  if (v5)
  {
    uint64_t v6 = [(ASDTCustomPropertyCachePMEnabler *)self property];
    [v6 setUseCache:v3];

    int v7 = 0;
  }
  else
  {
    int v7 = 560227702;
  }

  return v7;
}

- (void)setProperty:(id)a3
{
}

- (ASDPropertyAddress)propertyAddress
{
  return self->_propertyAddress;
}

- (void)setPropertyAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAddress, 0);
  objc_destroyWeak((id *)&self->_property);
}

- (void)property
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [a1 name];
  id v5 = [a1 propertyAddress];
  int v6 = 138412546;
  int v7 = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "%@: No property found matching address %@", (uint8_t *)&v6, 0x16u);
}

@end