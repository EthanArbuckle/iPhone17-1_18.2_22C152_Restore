@interface AFMutableDeviceContext
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)removeContextSnapshotForType:(id)a3;
- (void)removeHistoricalContextForType:(id)a3;
- (void)setContextSnapshot:(id)a3 withMetadata:(id)a4;
- (void)setDeviceInfo:(id)a3;
- (void)setFromLocalDevice:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrivacyClass:(int64_t)a3;
- (void)setSerializedContextSnapshot:(id)a3 withMetadata:(id)a4;
@end

@implementation AFMutableDeviceContext

- (id)description
{
  return [(AFMutableDeviceContext *)self buildDescription];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[AFDeviceContext allocWithZone:a3];
  v5 = [(AFMutableDeviceContext *)self serializedBackingStore];
  id v6 = [(AFMutableDeviceContext *)self fromLocalDevice];
  v7 = [(AFMutableDeviceContext *)self contextCollectorSource];
  v8 = [(AFDeviceContext *)v4 initWithSerializedBackingStore:v5 fromLocalDevice:v6 contextCollectorSource:v7];

  return v8;
}

- (void)removeHistoricalContextForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = OBJC_IVAR___AFDeviceContext__serializedBackingStore;
    uint64_t v6 = AFDeviceContextKeyContexts;
    v7 = [*(id *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__serializedBackingStore] objectForKey:AFDeviceContextKeyContexts];
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      v9 = [v8 objectForKey:v11];
      id v10 = [v9 mutableCopy];

      if (v10)
      {
        [v10 removeObjectForKey:AFDeviceContextKeyHistoricalData];
        [v10 removeObjectForKey:AFDeviceContextKeyHistoricalMetadata];
        [*(id *)&self->AFDeviceContext_opaque[v5] setObject:v8 forKey:v6];
      }
    }
    id v4 = v11;
  }
}

- (void)removeContextSnapshotForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v5 = OBJC_IVAR___AFDeviceContext__serializedBackingStore;
    uint64_t v6 = AFDeviceContextKeyContexts;
    v7 = [*(id *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__serializedBackingStore] objectForKey:AFDeviceContextKeyContexts];
    id v8 = [v7 mutableCopy];

    if (v8)
    {
      v9 = [v8 objectForKey:v11];
      id v10 = [v9 mutableCopy];

      if (v10)
      {
        [v10 removeObjectForKey:AFDeviceContextKeyData];
        [v10 removeObjectForKey:AFDeviceContextKeyMetadata];
        [v8 setObject:v10 forKey:v11];
        [*(id *)&self->AFDeviceContext_opaque[v5] setObject:v8 forKey:v6];
      }
    }
    id v4 = v11;
  }
}

- (void)setSerializedContextSnapshot:(id)a3 withMetadata:(id)a4
{
  id v30 = a4;
  uint64_t v6 = OBJC_IVAR___AFDeviceContext__serializedBackingStore;
  v7 = *(void **)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__serializedBackingStore];
  uint64_t v8 = AFDeviceContextKeyContexts;
  id v9 = a3;
  id v10 = [v7 objectForKey:v8];
  id v11 = [v10 mutableCopy];

  if (!v11) {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v12 = [v30 type];
  v13 = [v11 objectForKey:v12];
  id v14 = [v13 mutableCopy];

  if (v14)
  {
    v15 = [v30 historyConfiguration];
    if ([v15 keepsHistory])
    {
      uint64_t v28 = v6;
      v29 = self;
      uint64_t v27 = AFDeviceContextKeyHistoricalData;
      v16 = objc_msgSend(v14, "objectForKey:");
      v17 = AFNonNilMutableCopyOfArray();

      v26 = [v14 objectForKey:AFDeviceContextKeyData];
      uint64_t v25 = AFDeviceContextKeyHistoricalMetadata;
      v18 = objc_msgSend(v14, "objectForKey:");
      v19 = AFNonNilMutableCopyOfArray();

      v20 = [v14 objectForKey:AFDeviceContextKeyMetadata];
      v21 = [v15 historyBufferSize];
      v22 = (char *)((unsigned char *)[v17 count] - v21);
      if ((uint64_t)v22 >= 0)
      {
        v23 = v22 + 1;
        objc_msgSend(v17, "removeObjectsInRange:", 0, v22 + 1);
        objc_msgSend(v19, "removeObjectsInRange:", 0, v23);
      }
      [v17 addObject:v26];
      [v19 addObject:v20];
      [v14 setObject:v17 forKey:v27];
      [v14 setObject:v19 forKey:v25];

      uint64_t v6 = v28;
      self = v29;
    }
  }
  else
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
  }
  [v14 setObject:v9 forKey:AFDeviceContextKeyData];

  v24 = [v30 backingStore];
  [v14 setObject:v24 forKey:AFDeviceContextKeyMetadata];

  [v11 setObject:v14 forKey:v12];
  [*(id *)&self->AFDeviceContext_opaque[v6] setObject:v11 forKey:v8];
}

- (void)setContextSnapshot:(id)a3 withMetadata:(id)a4
{
  id v6 = a4;
  id v7 = [a3 serializedBackingStore];
  [(AFMutableDeviceContext *)self setSerializedContextSnapshot:v7 withMetadata:v6];
}

- (void)setPrivacyClass:(int64_t)a3
{
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__privacyClass] = a3;
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__dirtyFlags] |= 2uLL;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = [a3 copy];
  uint64_t v5 = *(void **)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__deviceInfo];
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__deviceInfo] = v4;

  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__dirtyFlags] |= 1uLL;
}

- (void)setIdentifier:(id)a3
{
  id v4 = [a3 copy];
  uint64_t v5 = *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__identifier];
  *(void *)&self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__identifier] = v4;
  _objc_release_x1(v4, v5);
}

- (void)setFromLocalDevice:(BOOL)a3
{
  self->AFDeviceContext_opaque[OBJC_IVAR___AFDeviceContext__fromLocalDevice] = a3;
}

@end