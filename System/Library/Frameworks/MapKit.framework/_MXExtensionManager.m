@interface _MXExtensionManager
+ (id)_extensionsWithLookupPolicy:(id)a3;
+ (id)_lookupPolicyForAllExtensions;
+ (id)_lookupPolicyForExtensionSupportsIntentClassNames:(id)a3;
+ (id)_lookupPolicyForExtensionWithContainingAppIdentifier:(id)a3 supportsIntentClassNames:(id)a4;
+ (id)_lookupPolicyForExtensionWithContainingAppIdentifiers:(id)a3 supportsIntentClassNames:(id)a4;
+ (id)_lookupPolicyForExtensionWithIdentifier:(id)a3;
+ (id)_lookupPolicyForIntentsExtensions;
+ (id)_lookupPolicyForNonUIExtension;
+ (id)_lookupPolicyForUIExtension;
+ (id)_lookupPolicyWithBlock:(id)a3;
+ (id)_lookupPolicyWithExtensionPointNames:(id)a3;
+ (id)_maps_lookupPolicyForEnabledRidesharingNonUIExtensions;
+ (id)_maps_lookupPolicyForRidesharingNonUIExtensions;
+ (id)_maps_ridesharingAllIntentClassesForNonUIHandling;
+ (id)_maps_ridesharingIntentClassesForUIInteraction;
+ (id)_maps_ridesharingOptionalIntentClassesForNonUIHandling;
+ (id)_maps_ridesharingRequiredIntentClassesForNonUIHandling;
+ (id)_queue;
+ (id)lookupPolicyForExtensionWithCapabilities:(id)a3;
+ (id)lookupPolicyForExtensionWithCapability:(id)a3;
+ (id)lookupPolicyForRestaurantQueueingExtensionWithContainingAppIdentifier:(id)a3;
+ (id)lookupPolicyForRestaurantQueueingExtensions;
+ (id)lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifier:(id)a3;
+ (id)lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifiers:(id)a3;
+ (id)lookupPolicyForRestaurantReservationExtensions;
+ (id)managerWithExtensionLookupPolicy:(id)a3 updateHandler:(id)a4;
+ (id)managerWithLookupPolicy:(id)a3 delegate:(id)a4;
+ (id)restaurantQueueingIntentClassNames;
+ (id)restaurantReservationIntentClassNames;
+ (void)_maps_updateRideBookingExtensions:(id)a3;
+ (void)imageForKey:(id)a3 extension:(id)a4 completion:(id)a5;
- (_MXExtensionLookupPolicy)lookupPolicy;
- (_MXExtensionManager)initWithLookupPolicy:(id)a3 delegate:(id)a4;
- (_MXExtensionManager)initWithLookupPolicy:(id)a3 delegate:(id)a4 extensionProvider:(id)a5;
- (_MXExtensionManagerDelegate)delegate;
- (_MXExtensionProvider)extensionProvider;
- (id)_applyExtensionPredicateWithExtensionsIfNeeded:(id)a3;
- (id)matchingContext;
- (void)dealloc;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setExtensionProvider:(id)a3;
- (void)setMatchingContext:(id)a3;
@end

@implementation _MXExtensionManager

- (id)_applyExtensionPredicateWithExtensionsIfNeeded:(id)a3
{
  if (a3)
  {
    lookupPolicy = self->_lookupPolicy;
    id v4 = a3;
    v5 = [(_MXExtensionLookupPolicy *)lookupPolicy extensionPredicate];
    v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

+ (void)_maps_updateRideBookingExtensions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = GEOConfigGetArray();
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  v20 = v7;
  v8 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
  v9 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = [v15 _containingAppIdentifer];
        if (v16)
        {
          [v9 addObject:v16];
          char v17 = [v8 containsObject:v16];
          int BOOL = GEOConfigGetBOOL();
          if ((v17 & 1) == 0)
          {
            if (BOOL) {
              [v15 _setEnabled:1 error:0];
            }
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v8 unionSet:v9];
  v19 = [v8 allObjects];
  GEOConfigSetArray();
}

- (_MXExtensionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MXExtensionManagerDelegate *)WeakRetained;
}

- (void)setMatchingContext:(id)a3
{
}

- (_MXExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

+ (id)restaurantReservationIntentClassNames
{
  return &unk_1ED97F3B0;
}

+ (id)restaurantQueueingIntentClassNames
{
  return &unk_1ED97F200;
}

+ (id)managerWithLookupPolicy:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_MXExtensionManager alloc] initWithLookupPolicy:v7 delegate:v6];

  v9 = [a1 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke;
  block[3] = &unk_1E54B8188;
  id v10 = v8;
  uint64_t v13 = v10;
  dispatch_async(v9, block);

  return v10;
}

- (_MXExtensionManager)initWithLookupPolicy:(id)a3 delegate:(id)a4 extensionProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v11 = +[_MXExtensionProvider sharedProvider];
  }
  v15.receiver = self;
  v15.super_class = (Class)_MXExtensionManager;
  uint64_t v12 = [(_MXExtensionManager *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_lookupPolicy, a3);
    objc_storeStrong((id *)&v13->_extensionProvider, v11);
  }

  return v13;
}

- (_MXExtensionManager)initWithLookupPolicy:(id)a3 delegate:(id)a4
{
  return [(_MXExtensionManager *)self initWithLookupPolicy:a3 delegate:a4 extensionProvider:0];
}

+ (id)_queue
{
  if (_MergedGlobals_165 != -1) {
    dispatch_once(&_MergedGlobals_165, &__block_literal_global_84);
  }
  v2 = (void *)qword_1EB316118;

  return v2;
}

+ (id)_lookupPolicyWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46___MXExtensionManager__lookupPolicyWithBlock___block_invoke;
  v9[3] = &unk_1E54BCE38;
  id v10 = v3;
  id v5 = v3;
  id v6 = [v4 predicateWithBlock:v9];
  id v7 = [[_MXExtensionLookupPolicy alloc] initWithPredicate:v6];

  return v7;
}

+ (id)_maps_ridesharingAllIntentClassesForNonUIHandling
{
  v2 = objc_msgSend((id)objc_opt_class(), "_maps_ridesharingOptionalIntentClassesForNonUIHandling");
  id v3 = objc_msgSend((id)objc_opt_class(), "_maps_ridesharingRequiredIntentClassesForNonUIHandling");
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

+ (id)_maps_ridesharingOptionalIntentClassesForNonUIHandling
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_maps_ridesharingRequiredIntentClassesForNonUIHandling
{
  void v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)_maps_ridesharingIntentClassesForUIInteraction
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_maps_lookupPolicyForEnabledRidesharingNonUIExtensions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90___MXExtensionManager_Ridesharing___maps_lookupPolicyForEnabledRidesharingNonUIExtensions__block_invoke;
  void v4[3] = &__block_descriptor_40_e22_B16__0___MXExtension_8l;
  void v4[4] = a1;
  v2 = [a1 _lookupPolicyWithBlock:v4];

  return v2;
}

+ (id)_maps_lookupPolicyForRidesharingNonUIExtensions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83___MXExtensionManager_Ridesharing___maps_lookupPolicyForRidesharingNonUIExtensions__block_invoke;
  void v4[3] = &__block_descriptor_40_e22_B16__0___MXExtension_8l;
  void v4[4] = a1;
  v2 = [a1 _lookupPolicyWithBlock:v4];

  return v2;
}

+ (id)lookupPolicyForRestaurantQueueingExtensionWithContainingAppIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 restaurantQueueingIntentClassNames];
  id v6 = +[_MXExtensionManager _lookupPolicyForExtensionWithContainingAppIdentifier:v4 supportsIntentClassNames:v5];

  return v6;
}

+ (id)lookupPolicyForRestaurantQueueingExtensions
{
  v2 = [a1 restaurantQueueingIntentClassNames];
  id v3 = +[_MXExtensionManager _lookupPolicyForExtensionSupportsIntentClassNames:v2];

  return v3;
}

+ (id)lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 restaurantReservationIntentClassNames];
  id v6 = +[_MXExtensionManager _lookupPolicyForExtensionWithContainingAppIdentifier:v4 supportsIntentClassNames:v5];

  return v6;
}

+ (id)lookupPolicyForRestaurantReservationExtensionWithContainingAppIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [a1 restaurantReservationIntentClassNames];
  id v6 = +[_MXExtensionManager _lookupPolicyForExtensionWithContainingAppIdentifiers:v4 supportsIntentClassNames:v5];

  return v6;
}

+ (id)lookupPolicyForRestaurantReservationExtensions
{
  v2 = [a1 restaurantReservationIntentClassNames];
  id v3 = +[_MXExtensionManager _lookupPolicyForExtensionSupportsIntentClassNames:v2];

  return v3;
}

+ (id)managerWithExtensionLookupPolicy:(id)a3 updateHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_MXExtensionManager alloc] initWithLookupPolicy:v7 delegate:0];

  id v9 = [a1 _queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke;
  v15[3] = &unk_1E54B8630;
  id v10 = v8;
  v16 = v10;
  id v17 = v6;
  id v11 = v6;
  dispatch_async(v9, v15);

  uint64_t v12 = v17;
  uint64_t v13 = v10;

  return v13;
}

- (void)invalidate
{
  if (self->_matchingContext)
  {
    id v3 = +[_MXExtensionProvider sharedProvider];
    [v3 removeExtensionUpdateHandler:self->_matchingContext];

    id matchingContext = self->_matchingContext;
    self->_id matchingContext = 0;
  }
}

- (void)dealloc
{
  [(_MXExtensionManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_MXExtensionManager;
  [(_MXExtensionManager *)&v3 dealloc];
}

+ (id)_extensionsWithLookupPolicy:(id)a3
{
  id v3 = a3;
  id v4 = +[_MXExtensionProvider sharedProvider];
  id v5 = [v4 _currentExtensions];

  if (v5)
  {
    id v6 = [v3 extensionPredicate];
    id v7 = [v5 filteredArrayUsingPredicate:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (id)_lookupPolicyForUIExtension
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F300F0];
  v7[0] = @"com.apple.maps.ui-services";
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [a1 _lookupPolicyWithExtensionPointNames:v4];

  return v5;
}

+ (id)_lookupPolicyForNonUIExtension
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F300E8];
  v7[0] = @"com.apple.maps.services";
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [a1 _lookupPolicyWithExtensionPointNames:v4];

  return v5;
}

+ (id)_lookupPolicyForAllExtensions
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"com.apple.maps.services";
  v7[1] = @"com.apple.maps.ui-services";
  uint64_t v3 = *MEMORY[0x1E4F300F0];
  v7[2] = *MEMORY[0x1E4F300E8];
  void v7[3] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  id v5 = [a1 _lookupPolicyWithExtensionPointNames:v4];

  return v5;
}

+ (id)_lookupPolicyForIntentsExtensions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F300F0];
  v7[0] = *MEMORY[0x1E4F300E8];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [a1 _lookupPolicyWithExtensionPointNames:v4];

  return v5;
}

+ (id)_lookupPolicyWithExtensionPointNames:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"extensionPointIdentifier", a3];
  id v4 = [[_MXExtensionLookupPolicy alloc] initWithPredicate:v3];

  return v4;
}

+ (id)lookupPolicyForExtensionWithCapability:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62___MXExtensionManager_lookupPolicyForExtensionWithCapability___block_invoke;
  v8[3] = &unk_1E54BCDC0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 _lookupPolicyWithBlock:v8];

  return v6;
}

+ (id)lookupPolicyForExtensionWithCapabilities:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64___MXExtensionManager_lookupPolicyForExtensionWithCapabilities___block_invoke;
  v8[3] = &unk_1E54BCDC0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 _lookupPolicyWithBlock:v8];

  return v6;
}

+ (id)_lookupPolicyForExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___MXExtensionManager__lookupPolicyForExtensionWithIdentifier___block_invoke;
  v8[3] = &unk_1E54BCDC0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 _lookupPolicyWithBlock:v8];

  return v6;
}

+ (id)_lookupPolicyForExtensionSupportsIntentClassNames:(id)a3
{
  return (id)[a1 _lookupPolicyForExtensionWithContainingAppIdentifier:0 supportsIntentClassNames:a3];
}

+ (id)_lookupPolicyForExtensionWithContainingAppIdentifiers:(id)a3 supportsIntentClassNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke;
  v11[3] = &unk_1E54BCE10;
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = +[_MXExtensionManager _lookupPolicyWithBlock:v11];

  return v9;
}

+ (id)_lookupPolicyForExtensionWithContainingAppIdentifier:(id)a3 supportsIntentClassNames:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = [a1 _lookupPolicyForExtensionWithContainingAppIdentifiers:v8 supportsIntentClassNames:v7];

  return v9;
}

+ (void)imageForKey:(id)a3 extension:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[_MXExtensionProvider sharedProvider];
  [v10 imageForKey:v9 extension:v8 completion:v7];
}

- (_MXExtensionLookupPolicy)lookupPolicy
{
  return self->_lookupPolicy;
}

- (id)matchingContext
{
  return self->_matchingContext;
}

- (void)setDelegate:(id)a3
{
}

- (void)setExtensionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_matchingContext, 0);

  objc_storeStrong((id *)&self->_lookupPolicy, 0);
}

@end