@interface AssistantBridgeAppCell
+ (id)_iconCache;
- (id)blankIcon;
- (id)getLazyIcon;
@end

@implementation AssistantBridgeAppCell

+ (id)_iconCache
{
  if (qword_15528 != -1) {
    dispatch_once(&qword_15528, &stru_10748);
  }
  v2 = (void *)qword_15520;

  return v2;
}

- (id)blankIcon
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AD04(v3);
  }
  v4 = [(AssistantBridgeAppCell *)self getLazyIconID];
  v5 = +[AssistantBridgeAppCell _iconCache];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)AssistantBridgeAppCell;
    v6 = [(AssistantBridgeAppCell *)&v13 blankIcon];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v8 = [WeakRetained propertyForKey:PSIconImageShouldFlipForRightToLeftKey];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = [v6 imageFlippedForRightToLeftLayoutDirection];

    v6 = (void *)v10;
  }
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AC78((uint64_t)v6, v11);
  }

  return v6;
}

- (id)getLazyIcon
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AE1C(v3);
  }
  uint64_t v26 = 0;
  v27[0] = &v26;
  v27[1] = 0x3032000000;
  v27[2] = sub_A5DC;
  v27[3] = sub_A5EC;
  id v28 = 0;
  v4 = [(AssistantBridgeAppCell *)self getLazyIconID];
  v5 = +[AssistantBridgeAppCell _iconCache];
  uint64_t v6 = [v5 objectForKey:v4];
  v7 = *(void **)(v27[0] + 40);
  *(void *)(v27[0] + 40) = v6;

  if (!*(void *)(v27[0] + 40))
  {
    v8 = +[UIScreen mainScreen];
    unsigned int v9 = [v8 traitCollection];
    [v9 displayScale];
    double v11 = v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    objc_super v13 = +[NanoResourceGrabber sharedInstance];
    if (v11 <= 2.0) {
      uint64_t v14 = 47;
    }
    else {
      uint64_t v14 = 48;
    }
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_A5F4;
    v23 = &unk_10770;
    v25 = &v26;
    v15 = v12;
    v24 = v15;
    [v13 getIconForBundleID:v4 iconVariant:v14 block:&v20 timeout:60.0];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(v27[0] + 40))
    {
      v16 = +[AssistantBridgeAppCell _iconCache];
      [v16 setObject:*(void *)(v27[0] + 40) forKey:v4];
    }
  }
  v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_AD88((uint64_t)v27, v17);
  }
  id v18 = *(id *)(v27[0] + 40);

  _Block_object_dispose(&v26, 8);

  return v18;
}

@end