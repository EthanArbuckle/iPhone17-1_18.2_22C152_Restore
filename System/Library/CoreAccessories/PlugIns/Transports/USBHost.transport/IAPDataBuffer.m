@interface IAPDataBuffer
- (AccessoryIAPInterface)parentiAPInterface;
- (IAPDataBuffer)initWithiAPInterface:(id)a3;
- (void)dealloc;
- (void)setParentiAPInterface:(id)a3;
@end

@implementation IAPDataBuffer

- (IAPDataBuffer)initWithiAPInterface:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IAPDataBuffer;
  v5 = [(IAPDataBuffer *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_dataBufferInLen = 1024;
    v5->_dataBufferIn = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xD90FDF98uLL);
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v9 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[IAPDataBuffer initWithiAPInterface:]((uint64_t *)&v6->_dataBufferInLen, v9);
    }

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "hard-code dataBufferInLen to 1024, change to calculate similarly to old project", v13, 2u);
    }

    objc_storeWeak((id *)&v6->_parentiAPInterface, v4);
  }

  return v6;
}

- (void)dealloc
{
  dataBufferIn = self->_dataBufferIn;
  if (dataBufferIn)
  {
    free(dataBufferIn);
    self->_dataBufferIn = 0;
  }
  self->_dataBufferInLen = 0;
  v4.receiver = self;
  v4.super_class = (Class)IAPDataBuffer;
  [(IAPDataBuffer *)&v4 dealloc];
}

- (AccessoryIAPInterface)parentiAPInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentiAPInterface);
  return (AccessoryIAPInterface *)WeakRetained;
}

- (void)setParentiAPInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithiAPInterface:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222C74000, a2, OS_LOG_TYPE_DEBUG, "Setting bulk in reads to _dataBufferInLen = %zu", (uint8_t *)&v3, 0xCu);
}

@end