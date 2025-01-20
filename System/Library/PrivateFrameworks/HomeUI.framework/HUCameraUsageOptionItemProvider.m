@interface HUCameraUsageOptionItemProvider
- (HUCameraUsageOptionItemProvider)init;
- (HUCameraUsageOptionItemProvider)initWithPresenceEventType:(unint64_t)a3 cameraProfiles:(id)a4;
- (NSMutableSet)items;
- (NSSet)cameraProfiles;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)displayStyle;
- (unint64_t)presenceEventType;
@end

@implementation HUCameraUsageOptionItemProvider

- (HUCameraUsageOptionItemProvider)initWithPresenceEventType:(unint64_t)a3 cameraProfiles:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraUsageOptionItemProvider;
  v7 = [(HFItemProvider *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_presenceEventType = a3;
    uint64_t v9 = [v6 copy];
    cameraProfiles = v8->_cameraProfiles;
    v8->_cameraProfiles = (NSSet *)v9;

    uint64_t v11 = objc_opt_new();
    items = v8->_items;
    v8->_items = (NSMutableSet *)v11;
  }
  return v8;
}

- (HUCameraUsageOptionItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithPresenceEventType_cameraProfiles_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraUsageOptionItemProvider.m", 101, @"%s is unavailable; use %@ instead",
    "-[HUCameraUsageOptionItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_1E6386EF8;
  objc_copyWeak(&v9, &location);
  v3 = [(HFItemProvider *)self reloadItemsWithObjects:&unk_1F19B5A38 keyAdaptor:&__block_literal_global_259 itemAdaptor:&__block_literal_global_77_2 filter:0 itemMap:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_5;
  v6[3] = &unk_1E6385B38;
  objc_copyWeak(&v7, &location);
  v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v4;
}

id __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 usage];

  return [v2 numberWithUnsignedInteger:v3];
}

HUCameraUsageOptionItem *__46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained items];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_4;
  v13[3] = &unk_1E6386108;
  id v6 = v3;
  id v14 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
  id v7 = (HUCameraUsageOptionItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUCameraUsageOptionItem alloc];
    uint64_t v9 = [WeakRetained presenceEventType];
    uint64_t v10 = [v6 unsignedIntegerValue];
    uint64_t v11 = [WeakRetained cameraProfiles];
    id v7 = [(HUCameraUsageOptionItem *)v8 initWithPresence:v9 cameraUsage:v10 cameraProfiles:v11];
  }

  return v7;
}

BOOL __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 usage];
    BOOL v8 = v7 == [*(id *)(a1 + 32) unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __46__HUCameraUsageOptionItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained items];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained items];
  BOOL v8 = [v3 removedItems];
  [v7 minusSet:v8];

  uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUCameraUsageOptionItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (unint64_t)presenceEventType
{
  return self->_presenceEventType;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfiles, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end