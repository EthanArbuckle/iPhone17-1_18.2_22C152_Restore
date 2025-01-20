@interface CBService
- (BOOL)isPrimary;
- (CBPeripheral)peripheral;
- (CBService)initWithPeripheral:(id)a3 dictionary:(id)a4;
- (NSArray)characteristics;
- (NSArray)includedServices;
- (NSNumber)endHandle;
- (NSNumber)startHandle;
- (id)description;
- (id)handleCharacteristicsDiscovered:(id)a3;
- (id)handleIncludedServicesDiscovered:(id)a3;
- (void)invalidate;
- (void)setCharacteristics:(id)a3;
- (void)setIncludedServices:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
@end

@implementation CBService

- (CBService)initWithPeripheral:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v9 = +[CBUUID UUIDWithData:v8];
  v17.receiver = self;
  v17.super_class = (Class)CBService;
  v10 = [(CBAttribute *)&v17 initWithUUID:v9];

  if (v10)
  {
    objc_storeWeak((id *)&v10->_peripheral, v6);
    v11 = [v7 objectForKeyedSubscript:@"kCBMsgArgType"];
    v10->_isPrimary = [v11 BOOLValue];

    uint64_t v12 = [v7 objectForKeyedSubscript:@"kCBMsgArgServiceStartHandle"];
    startHandle = v10->_startHandle;
    v10->_startHandle = (NSNumber *)v12;

    uint64_t v14 = [v7 objectForKeyedSubscript:@"kCBMsgArgServiceEndHandle"];
    endHandle = v10->_endHandle;
    v10->_endHandle = (NSNumber *)v14;
  }
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isPrimary) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  id v6 = [(CBAttribute *)self UUID];
  id v7 = [v3 stringWithFormat:@"<%@: %p, isPrimary = %@, UUID = %@>", v4, self, v5, v6];

  return v7;
}

- (void)invalidate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_includedServices;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  [(CBService *)self setIncludedServices:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = self->_characteristics;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "invalidate", (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  [(CBService *)self setCharacteristics:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);
  [WeakRetained removeAttributeForHandle:self->_startHandle];
}

- (id)handleIncludedServicesDiscovered:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgServices"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_includedServices];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = v4;
  uint64_t v7 = self;
  id v8 = v6;
  uint64_t v32 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v32)
  {
LABEL_25:

    v28 = v7;
    v29 = (void *)[v5 copy];
    [(CBService *)v28 setIncludedServices:v29];

    v27 = v28;
    goto LABEL_26;
  }
  uint64_t v10 = *(void *)v35;
  *(void *)&long long v9 = 138412546;
  long long v31 = v9;
LABEL_4:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v35 != v10) {
      objc_enumerationMutation(v8);
    }
    uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
    uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"kCBMsgArgServiceStartHandle", v31);
    p_peripheral = (id *)&v7->_peripheral;
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_peripheral);
    v33 = (void *)v13;
    long long v16 = [WeakRetained attributeForHandle:v13];

    if (v16)
    {
      if (([v5 containsObject:v16] & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_5;
    }
    long long v17 = [v12 objectForKeyedSubscript:@"kCBMsgArgUUID"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v17 length] != 2 && objc_msgSend(v17, "length") != 4 && objc_msgSend(v17, "length") != 16)
    {
      break;
    }
    long long v18 = [CBService alloc];
    uint64_t v19 = v10;
    long long v20 = v5;
    id v21 = v8;
    v22 = v7;
    id v23 = objc_loadWeakRetained((id *)&v7->_peripheral);
    long long v16 = [(CBService *)v18 initWithPeripheral:v23 dictionary:v12];

    id v24 = objc_loadWeakRetained(p_peripheral);
    v25 = [(CBService *)v16 startHandle];
    [v24 setAttribute:v16 forHandle:v25];

    uint64_t v7 = v22;
    id v8 = v21;
    uint64_t v5 = v20;
    uint64_t v10 = v19;

    if (([v5 containsObject:v16] & 1) == 0)
    {
LABEL_16:
      [v5 addObject:v16];
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      v26 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v31;
        v39 = v16;
        __int16 v40 = 2112;
        v41 = v7;
        _os_log_debug_impl(&dword_1AB9F0000, v26, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }
LABEL_5:

    if (v32 == ++v11)
    {
      uint64_t v32 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v32) {
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBService handleIncludedServicesDiscovered:]();
  }

  v27 = 0;
LABEL_26:

  return v27;
}

- (id)handleCharacteristicsDiscovered:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKeyedSubscript:@"kCBMsgArgCharacteristics"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_characteristics];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  id v25 = v6;
  if (!v7)
  {
LABEL_25:

    v22 = (void *)[v5 copy];
    [(CBService *)self setCharacteristics:v22];

    id v6 = v25;
    id v21 = self;
    goto LABEL_26;
  }
  uint64_t v9 = v7;
  uint64_t v26 = *(void *)v28;
  *(void *)&long long v8 = 138412546;
  long long v24 = v8;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v28 != v26) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
    uint64_t v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"kCBMsgArgCharacteristicHandle", v24);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);
    long long v14 = [WeakRetained attributeForHandle:v12];

    if (v14)
    {
      if (([v5 containsObject:v14] & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_5;
    }
    long long v15 = [v11 objectForKeyedSubscript:@"kCBMsgArgUUID"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v15 length] != 2 && objc_msgSend(v15, "length") != 4 && objc_msgSend(v15, "length") != 16)
    {
      break;
    }
    long long v14 = [[CBCharacteristic alloc] initWithService:self dictionary:v11];
    id v16 = objc_loadWeakRetained((id *)&self->_peripheral);
    long long v17 = [(CBCharacteristic *)v14 handle];
    [v16 setAttribute:v14 forHandle:v17];

    id v18 = objc_loadWeakRetained((id *)&self->_peripheral);
    uint64_t v19 = [(CBCharacteristic *)v14 valueHandle];
    [v18 setAttribute:v14 forHandle:v19];

    id v6 = v25;
    if (([v5 containsObject:v14] & 1) == 0)
    {
LABEL_16:
      [v5 addObject:v14];
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      long long v20 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v24;
        uint64_t v32 = v14;
        __int16 v33 = 2112;
        long long v34 = self;
        _os_log_debug_impl(&dword_1AB9F0000, v20, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }
LABEL_5:

    if (v9 == ++v10)
    {
      uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (!v9) {
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBService handleCharacteristicsDiscovered:]();
  }

  id v21 = 0;
LABEL_26:

  return v21;
}

- (CBPeripheral)peripheral
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);

  return (CBPeripheral *)WeakRetained;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSArray)includedServices
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIncludedServices:(id)a3
{
}

- (NSArray)characteristics
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCharacteristics:(id)a3
{
}

- (NSNumber)startHandle
{
  return self->_startHandle;
}

- (NSNumber)endHandle
{
  return self->_endHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endHandle, 0);
  objc_storeStrong((id *)&self->_startHandle, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_includedServices, 0);

  objc_destroyWeak((id *)&self->_peripheral);
}

- (void)handleIncludedServicesDiscovered:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1AB9F0000, v0, v1, "Data in %@ does not contain a valid UUID for included service handle = %@");
}

- (void)handleCharacteristicsDiscovered:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1AB9F0000, v0, v1, "Data in %@ does not contain a valid UUID for characteristic handle = %@");
}

@end