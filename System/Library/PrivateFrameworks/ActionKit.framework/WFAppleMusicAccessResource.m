@interface WFAppleMusicAccessResource
+ (BOOL)isSystemResource;
- (WFAppleMusicAccessResource)initWithDefinition:(id)a3;
- (id)associatedAppIdentifier;
- (unint64_t)status;
- (void)dealloc;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFAppleMusicAccessResource

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v8 = (void *)getMPMediaLibraryClass_softClass_28761;
  uint64_t v17 = getMPMediaLibraryClass_softClass_28761;
  if (!getMPMediaLibraryClass_softClass_28761)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getMPMediaLibraryClass_block_invoke_28762;
    v13[3] = &unk_264E5EC88;
    v13[4] = &v14;
    __getMPMediaLibraryClass_block_invoke_28762((uint64_t)v13);
    v8 = (void *)v15[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v14, 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__WFAppleMusicAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v11[3] = &unk_264E5B9F0;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 requestAuthorization:v11];
}

uint64_t __79__WFAppleMusicAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFAppleMusicResourceAvailabilityChangedNotification" object:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (unint64_t)status
{
  return 4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"WFAppleMusicResourceAvailabilityChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFAppleMusicAccessResource;
  [(WFAccessResource *)&v4 dealloc];
}

- (WFAppleMusicAccessResource)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFAppleMusicAccessResource;
  v3 = [(WFAccessResource *)&v7 initWithDefinition:a3];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_refreshAvailabilityWithNotification name:@"WFAppleMusicResourceAvailabilityChangedNotification" object:0];

    v5 = v3;
  }

  return v3;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.Music";
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end