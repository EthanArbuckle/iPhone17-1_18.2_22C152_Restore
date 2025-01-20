@interface IMThreadSafeBalloonPluginMap
- (IMThreadSafeBalloonPluginMap)initWithConcurrentDataQueue:(id)a3;
- (NSArray)allIdentifiers;
- (NSArray)allPlugins;
- (NSDictionary)dictionaryMapCopy;
- (NSMutableDictionary)map;
- (OS_dispatch_queue)dataQueue;
- (id)pluginForIdentifier:(id)a3;
- (unint64_t)count;
- (unint64_t)pluginCount;
- (void)removePluginWithIdentifier:(id)a3;
- (void)removePluginsWithIdentifiers:(id)a3;
- (void)setMap:(id)a3;
- (void)setPlugin:(id)a3 forIdentifier:(id)a4;
- (void)updateWithMap:(id)a3;
@end

@implementation IMThreadSafeBalloonPluginMap

- (void)updateWithMap:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_dataQueue(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4B34B24;
  v10[3] = &unk_1E5B7B130;
  id v11 = v4;
  v12 = self;
  id v9 = v4;
  dispatch_barrier_sync(v8, v10);
}

- (IMThreadSafeBalloonPluginMap)initWithConcurrentDataQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMThreadSafeBalloonPluginMap;
  id v9 = [(IMThreadSafeBalloonPluginMap *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v6, v7, v8);
    map = v9->_map;
    v9->_map = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_dataQueue, a3);
  }

  return v9;
}

- (NSArray)allPlugins
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1A4B3448C;
  objc_super v13 = sub_1A4B3432C;
  id v14 = 0;
  id v5 = objc_msgSend_dataQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B0FF68;
  v8[3] = &unk_1E5B7BD58;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (NSDictionary)dictionaryMapCopy
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1A4B3448C;
  objc_super v13 = sub_1A4B3432C;
  id v14 = 0;
  id v5 = objc_msgSend_dataQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B10038;
  v8[3] = &unk_1E5B7BD58;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v6;
}

- (unint64_t)pluginCount
{
  return self->_pluginCount;
}

- (void)setPlugin:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_dataQueue(self, v8, v9, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B1014C;
  block[3] = &unk_1E5B7BE70;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_barrier_sync(v11, block);
}

- (id)pluginForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1A4B3448C;
  v19 = sub_1A4B3432C;
  id v20 = 0;
  uint64_t v8 = objc_msgSend_dataQueue(self, v5, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4B101A0;
  block[3] = &unk_1E5B7BDA8;
  id v13 = v4;
  id v14 = &v15;
  block[4] = self;
  id v9 = v4;
  dispatch_sync(v8, block);

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (NSArray)allIdentifiers
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1A4B3448C;
  id v13 = sub_1A4B3432C;
  id v14 = 0;
  id v5 = objc_msgSend_dataQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B0FFD0;
  v8[3] = &unk_1E5B7BD58;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

- (void)removePluginWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dataQueue(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4B75D78;
  v10[3] = &unk_1E5B7B130;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_barrier_sync(v8, v10);
}

- (void)removePluginsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dataQueue(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4B75E80;
  v10[3] = &unk_1E5B7B130;
  id v11 = v4;
  id v12 = self;
  id v9 = v4;
  dispatch_barrier_sync(v8, v10);
}

- (unint64_t)count
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = objc_msgSend_dataQueue(self, a2, v2, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B76068;
  v8[3] = &unk_1E5B7BD58;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)setMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);

  objc_storeStrong((id *)&self->_dataQueue, 0);
}

@end