@interface HFAccessoryLikeObject
+ (NSMapTable)objectMap;
+ (id)_accessoryLikeObjectForObject:(id)a3;
+ (id)accessoryLikeObjectsForAccessoryRepresentable:(id)a3;
+ (void)_invalidateObjectMap;
+ (void)initialize;
- (BOOL)hf_canShowInControlCenter;
- (BOOL)hf_canSpanMultipleRooms;
- (BOOL)hf_effectiveIsFavorite;
- (BOOL)hf_effectiveShowInHomeDashboard;
- (BOOL)hf_hasSetFavorite;
- (BOOL)hf_hasSetShowInHomeDashboard;
- (BOOL)hf_hasSetVisibleInHomeStatus;
- (BOOL)hf_isFavorite;
- (BOOL)hf_isForcedVisibleInHomeStatus;
- (BOOL)hf_isIdentifiable;
- (BOOL)hf_isInRoom:(id)a3;
- (BOOL)hf_isMatterOnlyAccessory;
- (BOOL)hf_isVisibleInHomeStatus;
- (BOOL)hf_showInHomeDashboard;
- (BOOL)hf_supportsHomeStatus;
- (Class)hf_itemClass;
- (HFAccessoryLikeObject)initWithHomeKitObject:(id)a3;
- (HFAccessoryLikeObjectRootHomeKitObjectProvider)dataSource;
- (HFAccessoryType)hf_accessoryType;
- (HFServiceNameComponents)hf_serviceNameComponents;
- (HMRoom)room;
- (NSSet)hf_associatedAccessories;
- (NSSet)hf_containedCharacteristics;
- (NSSet)hf_containedProfiles;
- (NSSet)hf_containedServices;
- (NSString)debugDescription;
- (NSString)hf_tileSize;
- (id)hf_moveToRoom:(id)a3;
- (id)hf_setTileSize:(id)a3;
- (id)hf_updateIsFavorite:(BOOL)a3;
- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3;
- (id)hf_updateShowInHomeDashboard:(BOOL)a3;
@end

@implementation HFAccessoryLikeObject

- (HFAccessoryLikeObjectRootHomeKitObjectProvider)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HFAccessoryLikeObjectRootHomeKitObjectProvider *)WeakRetained;
}

- (HFAccessoryType)hf_accessoryType
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  v3 = objc_msgSend(v2, "hf_accessoryType");

  return (HFAccessoryType *)v3;
}

- (BOOL)hf_isFavorite
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_isOnForContextType:", 2);

  return v3;
}

- (BOOL)hf_effectiveShowInHomeDashboard
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_shouldBeOnForContextType:", 3);

  return v3;
}

- (BOOL)hf_effectiveIsFavorite
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_shouldBeOnForContextType:", 2);

  return v3;
}

+ (id)_accessoryLikeObjectForObject:(id)a3
{
  v4 = objc_msgSend(a3, "hf_rootAccessoryLikeHomeKitObject");
  os_unfair_lock_lock_with_options();
  v5 = [a1 objectMap];
  v6 = [v5 objectForKey:v4];

  if (!v6 || ([v6 dataSource], v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    uint64_t v8 = [objc_alloc((Class)a1) initWithHomeKitObject:v4];

    v9 = [a1 objectMap];
    [v9 setObject:v8 forKey:v4];

    v6 = (void *)v8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_HFAccessoryLikeObjectMapLock);

  return v6;
}

+ (NSMapTable)objectMap
{
  if (qword_26AB2FBC8 != -1) {
    dispatch_once(&qword_26AB2FBC8, &__block_literal_global_196);
  }
  v2 = (void *)_MergedGlobals_305;
  return (NSMapTable *)v2;
}

- (HFAccessoryLikeObject)initWithHomeKitObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFAccessoryLikeObject;
  v5 = [(HFAccessoryLikeObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (Class)hf_itemClass
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_itemClass");

  return (Class)v3;
}

- (NSSet)hf_containedServices
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_containedServices");

  return (NSSet *)v3;
}

- (NSSet)hf_containedProfiles
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_containedProfiles");

  return (NSSet *)v3;
}

+ (void)initialize
{
  _HFAccessoryLikeObjectMapLock = 0;
}

- (NSSet)hf_associatedAccessories
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_associatedAccessories");

  return (NSSet *)v3;
}

uint64_t __34__HFAccessoryLikeObject_objectMap__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  uint64_t v1 = _MergedGlobals_305;
  _MergedGlobals_305 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)_invalidateObjectMap
{
  char v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating HFAccessoryLikeObject objectMap", v5, 2u);
  }

  os_unfair_lock_lock_with_options();
  id v4 = [a1 objectMap];
  [v4 removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)&_HFAccessoryLikeObjectMapLock);
}

- (HMRoom)room
{
  char v3 = [(HFAccessoryLikeObject *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  v5 = [(HFAccessoryLikeObject *)self dataSource];
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v5, "hf_parentRoom");
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = [(HFAccessoryLikeObject *)self dataSource];
    if (objc_msgSend(v6, "hf_areAllServicesInSameRoom"))
    {
      v9 = [v6 services];
      v10 = [v9 firstObject];
      v7 = objc_msgSend(v10, "hf_parentRoom");
    }
    else
    {
      v7 = 0;
    }
  }

LABEL_9:
  return (HMRoom *)v7;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_serviceNameComponents");

  return (HFServiceNameComponents *)v3;
}

- (NSSet)hf_containedCharacteristics
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_containedCharacteristics");

  return (NSSet *)v3;
}

- (BOOL)hf_isInRoom:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessoryLikeObject *)self room];

  if (v5)
  {
    v6 = [(HFAccessoryLikeObject *)self room];
    v7 = [v6 uniqueIdentifier];
    objc_super v8 = [v4 uniqueIdentifier];
    char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
  }
  else
  {
    v6 = [(HFAccessoryLikeObject *)self accessories];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__HFAccessoryLikeObject_hf_isInRoom___block_invoke;
    v11[3] = &unk_26408D968;
    id v12 = v4;
    char v9 = objc_msgSend(v6, "na_any:", v11);
  }
  return v9;
}

uint64_t __37__HFAccessoryLikeObject_hf_isInRoom___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 room];
  id v4 = [v3 uniqueIdentifier];
  v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (BOOL)hf_canSpanMultipleRooms
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_canSpanMultipleRooms");

  return v3;
}

- (BOOL)hf_isIdentifiable
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_isIdentifiable");

  return v3;
}

- (BOOL)hf_canShowInControlCenter
{
  char v3 = [(HFAccessoryLikeObject *)self homeKitObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(HFAccessoryLikeObject *)self homeKitObject];
  uint64_t v6 = v5;
  if (isKindOfClass)
  {
    char v7 = objc_msgSend(v5, "hf_showsAsAccessoryInControlCentre");
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0) {
      return 1;
    }
    uint64_t v6 = [(HFAccessoryLikeObject *)self homeKitObject];
    char v7 = objc_msgSend(v6, "hf_showsAsServiceInControlCentre");
  }
  BOOL v9 = v7;

  return v9;
}

- (BOOL)hf_isMatterOnlyAccessory
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_isMatterOnlyAccessory");

  return v3;
}

- (id)hf_moveToRoom:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessoryLikeObject *)self dataSource];
  uint64_t v6 = objc_msgSend(v5, "hf_moveToRoom:", v4);

  return v6;
}

- (NSString)debugDescription
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HFAccessoryLikeObject *)self homeKitObject];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p-%@>", v4, self, v5];

  return (NSString *)v6;
}

- (BOOL)hf_hasSetFavorite
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_hasSetForContextType:", 2);

  return v3;
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(HFAccessoryLikeObject *)self dataSource];
  v5 = objc_msgSend(v4, "hf_updateValue:forContextType:", v3, 2);

  return v5;
}

- (BOOL)hf_supportsHomeStatus
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_supportsHomeStatus");

  return v3;
}

- (BOOL)hf_isVisibleInHomeStatus
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_isVisibleInHomeStatus");

  return v3;
}

- (BOOL)hf_hasSetVisibleInHomeStatus
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_hasSetVisibleInHomeStatus");

  return v3;
}

- (BOOL)hf_isForcedVisibleInHomeStatus
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_isForcedVisibleInHomeStatus");

  return v3;
}

- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(HFAccessoryLikeObject *)self dataSource];
  v5 = objc_msgSend(v4, "hf_updateIsVisibleInHomeStatus:", v3);

  return v5;
}

- (BOOL)hf_showInHomeDashboard
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_isOnForContextType:", 3);

  return v3;
}

- (BOOL)hf_hasSetShowInHomeDashboard
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  char v3 = objc_msgSend(v2, "hf_hasSetForContextType:", 3);

  return v3;
}

- (id)hf_updateShowInHomeDashboard:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(HFAccessoryLikeObject *)self dataSource];
  v5 = objc_msgSend(v4, "hf_updateValue:forContextType:", v3, 3);

  return v5;
}

- (NSString)hf_tileSize
{
  v2 = [(HFAccessoryLikeObject *)self dataSource];
  BOOL v3 = objc_msgSend(v2, "hf_tileSize");

  return (NSString *)v3;
}

- (id)hf_setTileSize:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessoryLikeObject *)self dataSource];
  uint64_t v6 = objc_msgSend(v5, "hf_setTileSize:", v4);

  return v6;
}

+ (id)accessoryLikeObjectsForAccessoryRepresentable:(id)a3
{
  id v3 = a3;
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
    id v7 = [MEMORY[0x263EFFA08] setWithObject:v6];
LABEL_6:
    char v8 = v7;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    v10 = (void *)MEMORY[0x263EFFA08];
    v11 = objc_msgSend(v4, "hf_accessoryLikeObject");
    char v8 = objc_msgSend(v10, "na_setWithSafeObject:", v11);
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0 {
         || (objc_msgSend(v4, "hf_accessoryLikeObjects"), (char v8 = objc_claimAutoreleasedReturnValue()) == 0))
  }
  {
    if (qword_26AB2FBD0 != -1) {
      dispatch_once(&qword_26AB2FBD0, &__block_literal_global_19_11);
    }
    id v7 = (id)qword_26AB2FBD8;
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

uint64_t __71__HFAccessoryLikeObject_accessoryLikeObjectsForAccessoryRepresentable___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] set];
  uint64_t v1 = qword_26AB2FBD8;
  qword_26AB2FBD8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void).cxx_destruct
{
}

@end