@interface ASDTPMActionNumericPropertyAnalyticsEvent
- (ASDPropertyAddress)propertyAddress;
- (ASDTNumericProperty)numericProperty;
- (ASDTPMActionNumericPropertyAnalyticsEvent)initWithConfig:(id)a3 forSequencer:(id)a4;
- (NSString)fieldName;
- (id)deviceName;
- (id)eventData;
- (void)eventData;
- (void)numericProperty;
- (void)setFieldName:(id)a3;
- (void)setNumericProperty:(id)a3;
- (void)setPropertyAddress:(id)a3;
@end

@implementation ASDTPMActionNumericPropertyAnalyticsEvent

- (ASDTPMActionNumericPropertyAnalyticsEvent)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDTPMActionNumericPropertyAnalyticsEvent;
  v7 = [(ASDTPMActionAnalyticsEvent *)&v14 initWithConfig:v6 forSequencer:a4];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = [v6 asdtPropertyAddress];
  [(ASDTPMActionNumericPropertyAnalyticsEvent *)v7 setPropertyAddress:v8];

  v9 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)v7 propertyAddress];

  if (v9)
  {
    v10 = [v6 asdtPMActionAnalyticsEventField];
    [(ASDTPMActionNumericPropertyAnalyticsEvent *)v7 setFieldName:v10];

    v11 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)v7 fieldName];

    if (v11)
    {
LABEL_4:
      v9 = v7;
      goto LABEL_5;
    }
    v13 = ASDTBaseLogType();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMActionNumericPropertyAnalyticsEvent initWithConfig:forSequencer:](v7);
    }

    v9 = 0;
  }
LABEL_5:

  return v9;
}

- (id)deviceName
{
  v3 = NSString;
  v4 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
  unsigned int v5 = [v4 selector] >> 29;
  if (v5)
  {
    v29 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
    if ([v29 selector] >> 24 > 0x7E)
    {
      int v7 = 0;
      uint64_t v6 = 32;
    }
    else
    {
      v25 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
      uint64_t v6 = [v25 selector] >> 24;
      int v7 = 1;
    }
  }
  else
  {
    int v7 = 0;
    uint64_t v6 = 32;
  }
  v8 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
  int v9 = [v8 selector] & 0xE00000;
  if (v9)
  {
    v32 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
    if (([v32 selector] >> 16) > 0x7Eu)
    {
      int v36 = 0;
      uint64_t v35 = 32;
    }
    else
    {
      v28 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
      uint64_t v35 = ([v28 selector] >> 16);
      int v36 = 1;
    }
  }
  else
  {
    int v36 = 0;
    uint64_t v35 = 32;
  }
  v10 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
  int v11 = [v10 selector] & 0xE000;
  v42 = v4;
  unsigned int v41 = v5;
  v40 = v8;
  if (v11)
  {
    v31 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
    if (((unsigned __int16)[v31 selector] >> 8) > 0x7Eu)
    {
      int v34 = 0;
      uint64_t v33 = 32;
    }
    else
    {
      v27 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
      uint64_t v33 = ((unsigned __int16)[v27 selector] >> 8);
      int v34 = 1;
    }
  }
  else
  {
    int v34 = 0;
    uint64_t v33 = 32;
  }
  v12 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
  v39 = v10;
  int v37 = [v12 selector] & 0xE0;
  int v38 = v11;
  if (v37)
  {
    v13 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
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
      v26 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
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
  v20 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
  uint64_t v21 = [v20 element];
  v22 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
  v23 = objc_msgSend(v16, "stringWithFormat:", @"NumericPropertyAnalyticsEvent: S:%c%c%c%c E:%u S:%x", v6, v35, v33, v18, v21, objc_msgSend(v22, "scope"));

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

- (ASDTNumericProperty)numericProperty
{
  p_numericProperty = &self->_numericProperty;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_numericProperty);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_numericProperty);
  }
  else
  {
    uint64_t v6 = [(ASDTPMDevice *)self parentSequencer];
    int v7 = [v6 parentDevice];
    v8 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self propertyAddress];
    int v9 = [v7 customPropertyForAddress:v8];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 conformsToProtocol:&unk_26FCBCD70])
    {
      objc_storeWeak((id *)p_numericProperty, v9);
    }
    else
    {
      v10 = ASDTBaseLogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ASDTPMActionNumericPropertyAnalyticsEvent numericProperty](self);
      }
    }
    id v5 = objc_loadWeakRetained((id *)p_numericProperty);
  }
  return (ASDTNumericProperty *)v5;
}

- (id)eventData
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self numericProperty];
  v4 = [v3 propertyValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self numericProperty];
    uint64_t v6 = [v5 numericType];

    id v7 = v4;
    unint64_t v8 = [v7 length];
    if (v8 < [NSNumber asdtDataSizeForNumericType:v6])
    {
      int v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(ASDTPMActionNumericPropertyAnalyticsEvent *)self eventData];
      }

      v10 = 0;
      v4 = v7;
      goto LABEL_9;
    }
    int v11 = NSNumber;
    id v12 = v7;
    uint64_t v13 = [v12 bytes];
    unsigned __int8 v14 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self numericProperty];
    v4 = objc_msgSend(v11, "asdtNumberFromData:withNumericType:", v13, objc_msgSend(v14, "numericType"));
  }
  if (v4)
  {
    id v7 = [(ASDTPMActionNumericPropertyAnalyticsEvent *)self fieldName];
    id v16 = v7;
    v17[0] = v4;
    v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
LABEL_9:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:
  return v10;
}

- (void)setNumericProperty:(id)a3
{
}

- (ASDPropertyAddress)propertyAddress
{
  return self->_propertyAddress;
}

- (void)setPropertyAddress:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_propertyAddress, 0);
  objc_destroyWeak((id *)&self->_numericProperty);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v2, v3, "%@: Field name must be specified in config: %@", v4, v5, v6, v7, 2u);
}

- (void)numericProperty
{
  uint64_t v2 = [a1 name];
  int v9 = [a1 propertyAddress];
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v3, v4, "%@: No property found matching address %@", v5, v6, v7, v8, 2u);
}

- (void)eventData
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 name];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 1024;
  int v9 = [a2 length];
  _os_log_error_impl(&dword_2489BC000, a3, OS_LOG_TYPE_ERROR, "%@: Bad property data with length: %u", (uint8_t *)&v6, 0x12u);
}

@end