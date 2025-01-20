@interface GKAchievementDescription
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_achievementDescriptionFromGame:(id)a3 propertyListDictionary:(id)a4;
+ (id)_loadLocalAchievementDescriptionsForGame:(id)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (void)loadAchievementDescriptionsForGame:(id)a3 withCompletionHandler:(id)a4;
+ (void)loadAchievementDescriptionsWithCompletionHandler:(void *)completionHandler;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKAchievementDescription)init;
- (GKAchievementDescription)initWithCoder:(id)a3;
- (GKAchievementDescription)initWithInternalRepresentation:(id)a3;
- (GKAchievementInternal)internal;
- (UIImage)image;
- (id)description;
- (id)game;
- (id)imageNameForIcon;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setInternal:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKAchievementDescription

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKAchievementDescription *)self internal];
    v7 = [v5 internal];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GKAchievementDescription *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (GKAchievementDescription)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[GKInternalRepresentation internalRepresentation];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKAchievementDescription;
  id v5 = [(GKAchievementDescription *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_internal, v4);
  }

  return v6;
}

- (GKAchievementDescription)init
{
  return [(GKAchievementDescription *)self initWithInternalRepresentation:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAchievementDescription)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  objc_super v8 = [v5 decodeObjectOfClasses:v7 forKey:@"internal"];

  v9 = [(GKAchievementDescription *)self initWithInternalRepresentation:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GKAchievementDescription *)self internal];
  [v4 encodeObject:v5 forKey:@"internal"];
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)GKAchievementDescription;
  unint64_t v3 = [(GKAchievementDescription *)&v10 description];
  id v4 = [(GKAchievementDescription *)self identifier];
  id v5 = [(GKAchievementDescription *)self title];
  if ([(GKAchievementDescription *)self isHidden]) {
    uint64_t v6 = @"hidden";
  }
  else {
    uint64_t v6 = @"visible";
  }
  v7 = [(GKAchievementDescription *)self achievedDescription];
  objc_super v8 = [v3 stringByAppendingFormat:@"id: %@\t%@\t%@\t%@", v4, v5, v6, v7];

  return v8;
}

- (id)imageNameForIcon
{
  return 0;
}

- (id)game
{
  return 0;
}

+ (void)loadAchievementDescriptionsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = +[GKGame currentGame];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__GKAchievementDescription_loadAchievementDescriptionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E646DCF0;
  id v8 = v4;
  id v6 = v4;
  [a1 loadAchievementDescriptionsForGame:v5 withCompletionHandler:v7];
}

void __77__GKAchievementDescription_loadAchievementDescriptionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

+ (id)_achievementDescriptionFromGame:(id)a3 propertyListDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(GKLocalizedAchievementDescription);
  [(GKLocalizedAchievementDescription *)v7 setGame:v6];

  id v8 = +[GKInternalRepresentation internalRepresentation];
  id v9 = [v5 objectForKeyedSubscript:@"identifier"];
  [v8 setIdentifier:v9];

  objc_super v10 = [v5 objectForKeyedSubscript:@"nameKey"];
  [v8 setTitle:v10];

  v11 = [v5 objectForKeyedSubscript:@"earnedDescriptionKey"];
  [v8 setAchievedDescription:v11];

  v12 = [v5 objectForKeyedSubscript:@"unearnedDescriptionKey"];
  [v8 setUnachievedDescription:v12];

  v13 = [v5 objectForKeyedSubscript:@"maximumPoints"];
  objc_msgSend(v8, "setMaximumPoints:", (unsigned __int16)objc_msgSend(v13, "intValue"));

  v14 = [v5 objectForKeyedSubscript:@"hiddenUntilSubmitted"];
  objc_msgSend(v8, "setHidden:", objc_msgSend(v14, "BOOLValue"));

  v15 = [v5 objectForKeyedSubscript:@"canReplay"];
  objc_msgSend(v8, "setReplayable:", objc_msgSend(v15, "BOOLValue"));

  v16 = [v5 objectForKeyedSubscript:@"iconImageName"];

  [(GKLocalizedAchievementDescription *)v7 setIconImageName:v16];
  [(GKAchievementDescription *)v7 setInternal:v8];

  return v7;
}

+ (id)_loadLocalAchievementDescriptionsForGame:(id)a3
{
  id v4 = a3;
  id v5 = [v4 gameDescriptorDictionary];
  id v6 = +[GKContentPropertyList localPropertyListForGameDescriptor:v5];

  uint64_t v7 = [v6 achievementDescriptions];
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__GKAchievementDescription__loadLocalAchievementDescriptionsForGame___block_invoke;
    v10[3] = &unk_1E646E498;
    id v12 = a1;
    id v11 = v4;
    id v8 = [v7 _gkMapWithBlock:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __69__GKAchievementDescription__loadLocalAchievementDescriptionsForGame___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _achievementDescriptionFromGame:*(void *)(a1 + 32) propertyListDictionary:a2];
}

+ (void)loadAchievementDescriptionsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _loadLocalAchievementDescriptionsForGame:v6];
  id v9 = v8;
  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke;
    block[3] = &unk_1E646DC30;
    id v32 = v7;
    id v31 = v8;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v11 = v32;
  }
  else
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__3;
    v28[4] = __Block_byref_object_dispose__3;
    v29 = 0;
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v14 = +[GKDaemonProxy proxyForLocalPlayer];
    v15 = [v14 gameStatService];
    v16 = [v6 gameDescriptor];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_49;
    v24[3] = &unk_1E646E4C0;
    id v17 = v12;
    id v25 = v17;
    v27 = v28;
    v18 = v13;
    v26 = v18;
    [v15 getAchievementDescriptionsForGameDescriptor:v16 handler:v24];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E646E4E8;
    id v21 = v17;
    id v22 = v7;
    v23 = v28;
    id v10 = v7;
    id v19 = v17;
    dispatch_group_notify(v18, MEMORY[0x1E4F14428], v20);

    _Block_object_dispose(v28, 8);
    id v11 = v29;
  }
}

uint64_t __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count] >= 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = [GKAchievementDescription alloc];
          v14 = -[GKAchievementDescription initWithInternalRepresentation:](v13, "initWithInternalRepresentation:", v12, (void)v18);
          [*(id *)(a1 + 32) addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v6;
  id v17 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __85__GKAchievementDescription_loadAchievementDescriptionsForGame_withCompletionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = result;
    if ([*(id *)(result + 32) count]) {
      uint64_t v3 = *(void *)(v2 + 32);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
    id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
    return v5(v1, v3, v4);
  }
  return result;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKAchievementDescription;
  uint64_t v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  id v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKAchievementDescription;
  id v5 = -[GKAchievementDescription methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(GKAchievementDescription *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKAchievementDescription;
  if (-[GKAchievementDescription respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKAchievementDescription *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  if (class_respondsToSelector((Class)a1, a3)) {
    return 1;
  }
  int v5 = GKApplicationLinkedOnOrAfter(393216, 0);
  BOOL result = 0;
  if (v5)
  {
    return +[GKAchievementInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKAchievementDescription *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKAchievementDescription *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKAchievementInternal)internal
{
  return (GKAchievementInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end