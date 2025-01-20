@interface ASNotificationStep
- (NSSet)recordTypes;
- (id)notifyObserverBlock;
- (id)objectTransformationBlock;
- (id)objectsTransformationBlock;
- (id)objectsTransformedFromRecords:(id)a3 cloudKitManager:(id)a4;
- (id)shouldNotifyObserverBlock;
- (void)setNotifyObserverBlock:(id)a3;
- (void)setObjectTransformationBlock:(id)a3;
- (void)setObjectsTransformationBlock:(id)a3;
- (void)setRecordTypes:(id)a3;
- (void)setShouldNotifyObserverBlock:(id)a3;
@end

@implementation ASNotificationStep

- (id)objectsTransformedFromRecords:(id)a3 cloudKitManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASNotificationStep *)self objectsTransformationBlock];

  if (v8)
  {
    v9 = [(ASNotificationStep *)self objectsTransformationBlock];
    v10 = ((void (**)(void, id, id))v9)[2](v9, v7, v6);
  }
  else
  {
    v11 = [(ASNotificationStep *)self objectTransformationBlock];

    if (v11)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __68__ASNotificationStep_objectsTransformedFromRecords_cloudKitManager___block_invoke;
      v13[3] = &unk_265216BE0;
      v13[4] = self;
      id v14 = v7;
      v10 = objc_msgSend(v6, "hk_map:", v13);
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
        -[ASNotificationStep objectsTransformedFromRecords:cloudKitManager:]();
      }
      v10 = (void *)MEMORY[0x263EFFA68];
    }
  }

  return v10;
}

id __68__ASNotificationStep_objectsTransformedFromRecords_cloudKitManager___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectTransformationBlock];
  id v6 = ((void (**)(void, void, id))v5)[2](v5, *(void *)(a1 + 40), v4);

  return v6;
}

- (NSSet)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
}

- (id)objectsTransformationBlock
{
  return self->_objectsTransformationBlock;
}

- (void)setObjectsTransformationBlock:(id)a3
{
}

- (id)objectTransformationBlock
{
  return self->_objectTransformationBlock;
}

- (void)setObjectTransformationBlock:(id)a3
{
}

- (id)shouldNotifyObserverBlock
{
  return self->_shouldNotifyObserverBlock;
}

- (void)setShouldNotifyObserverBlock:(id)a3
{
}

- (id)notifyObserverBlock
{
  return self->_notifyObserverBlock;
}

- (void)setNotifyObserverBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyObserverBlock, 0);
  objc_storeStrong(&self->_shouldNotifyObserverBlock, 0);
  objc_storeStrong(&self->_objectTransformationBlock, 0);
  objc_storeStrong(&self->_objectsTransformationBlock, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
}

- (void)objectsTransformedFromRecords:cloudKitManager:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2474C9000, v0, v1, "Notification step trying to transform objects with no multi-record or single-record transformation blocks set.", v2, v3, v4, v5, v6);
}

@end