@interface _GEOMapItemStorageNotificationTrampoline
- (_GEOMapItemStorageNotificationTrampoline)initWithMapItem:(id)a3 mapItemStorage:(id)a4;
- (void)dealloc;
@end

@implementation _GEOMapItemStorageNotificationTrampoline

- (void)dealloc
{
  objc_storeWeak((id *)&self->_storage, 0);
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationToken];

  v4.receiver = self;
  v4.super_class = (Class)_GEOMapItemStorageNotificationTrampoline;
  [(_GEOMapItemStorageNotificationTrampoline *)&v4 dealloc];
}

- (_GEOMapItemStorageNotificationTrampoline)initWithMapItem:(id)a3 mapItemStorage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GEOMapItemStorageNotificationTrampoline;
  v9 = [(_GEOMapItemStorageNotificationTrampoline *)&v19 init];
  v10 = v9;
  v11 = 0;
  if (v9 && v7 && v8)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeWeak((id *)&v10->_storage, v8);
    objc_initWeak(&location, v10);
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75___GEOMapItemStorageNotificationTrampoline_initWithMapItem_mapItemStorage___block_invoke;
    v16[3] = &unk_1E53E30C8;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = [v12 addObserverForName:@"GEOMapItemDidResolveAttribution" object:v7 queue:0 usingBlock:v16];
    notificationToken = v10->_notificationToken;
    v10->_notificationToken = v13;

    v11 = v10;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_destroyWeak((id *)&self->_storage);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end