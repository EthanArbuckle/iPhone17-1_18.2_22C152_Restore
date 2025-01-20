@interface HFContactController
+ (id)contactForAppleID:(id)a3 keyDescriptors:(id)a4;
+ (id)contactForEmailAddress:(id)a3 keyDescriptors:(id)a4;
+ (id)contactForPhoneNumber:(id)a3 keyDescriptors:(id)a4;
+ (id)stringForRecipientStatus:(unint64_t)a3;
- (BOOL)hasRestrictedGuestIDSCapabilityForDestination:(id)a3;
- (HFContactController)init;
- (HFContactController)initWithKeyDescriptors:(id)a3;
- (HFContactControllerDelegate)delegate;
- (NSArray)descriptors;
- (NSArray)familyMembers;
- (NSArray)pendingDestinations;
- (NSDictionary)familyMemberDsidToContact;
- (NSMutableArray)familyMemberCallbacks;
- (NSMutableDictionary)recipientAvailabilities;
- (NSMutableDictionary)recipientToRestrictedGuestIDSCapability;
- (id)_contactForFamilyMember:(id)a3;
- (id)contactForFamilyMemberWithDsid:(id)a3;
- (unint64_t)familyMembersState;
- (unint64_t)statusForDestination:(id)a3;
- (void)_downloadFamilyMemberPhotos;
- (void)_loadFamilyMembersWithCompletion:(id)a3;
- (void)entriesUpdated:(id)a3;
- (void)fetchFamilyMembersWithCompletion:(id)a3;
- (void)markDestinationsPending:(id)a3;
- (void)restrictedGuestIDSCapabilityUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptors:(id)a3;
- (void)setFamilyMemberCallbacks:(id)a3;
- (void)setFamilyMemberDsidToContact:(id)a3;
- (void)setFamilyMembers:(id)a3;
- (void)setFamilyMembersState:(unint64_t)a3;
- (void)setRecipientAvailabilities:(id)a3;
- (void)setRecipientToRestrictedGuestIDSCapability:(id)a3;
@end

@implementation HFContactController

- (HFContactController)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithKeyDescriptors_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFContactController.m", 67, @"%s is unavailable; use %@ instead",
    "-[HFContactController init]",
    v5);

  return 0;
}

- (HFContactController)initWithKeyDescriptors:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFContactController;
  v6 = [(HFContactController *)&v16 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    recipientAvailabilities = v6->_recipientAvailabilities;
    v6->_recipientAvailabilities = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    recipientToRestrictedGuestIDSCapability = v6->_recipientToRestrictedGuestIDSCapability;
    v6->_recipientToRestrictedGuestIDSCapability = v9;

    objc_storeStrong((id *)&v6->_descriptors, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    familyMemberCallbacks = v6->_familyMemberCallbacks;
    v6->_familyMemberCallbacks = v11;

    v6->_familyMembersState = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __46__HFContactController_initWithKeyDescriptors___block_invoke;
    v14[3] = &unk_26408DDE0;
    v15 = v6;
    [(HFContactController *)v15 _loadFamilyMembersWithCompletion:v14];
  }
  return v6;
}

void __46__HFContactController_initWithKeyDescriptors___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setFamilyMembersState:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "familyMemberCallbacks", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) fetchFamilyMembersWithCompletion:*(void *)(*((void *)&v8 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7 = [*(id *)(a1 + 32) familyMemberCallbacks];
  [v7 removeAllObjects];
}

+ (id)stringForRecipientStatus:(unint64_t)a3
{
  if (a3 < 5) {
    return off_264093188[a3];
  }
  NSLog(&cfstr_UnknownRecipie.isa, a2, a3);
  return @"Unknown";
}

+ (id)contactForAppleID:(id)a3 keyDescriptors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = objc_msgSend(v6, "hf_isPhoneNumber");
  long long v8 = objc_opt_class();
  if (v7) {
    [v8 contactForPhoneNumber:v6 keyDescriptors:v5];
  }
  else {
  long long v9 = [v8 contactForEmailAddress:v6 keyDescriptors:v5];
  }

  return v9;
}

+ (id)contactForEmailAddress:(id)a3 keyDescriptors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[HFContactStore defaultStore];
  long long v8 = [v7 contactForEmailAddress:v6 withKeys:v5];

  return v8;
}

+ (id)contactForPhoneNumber:(id)a3 keyDescriptors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = +[HFContactStore defaultStore];
  long long v8 = [v7 contactForPhoneNumber:v6 withKeys:v5];

  return v8;
}

- (NSArray)pendingDestinations
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(HFContactController *)self recipientAvailabilities];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HFContactController_pendingDestinations__block_invoke;
  v9[3] = &unk_2640930F0;
  id v10 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([v5 count]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  int v7 = v6;

  return v7;
}

void __42__HFContactController_pendingDestinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqualToNumber:&unk_26C0F66D8]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)entriesUpdated:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__HFContactController_entriesUpdated___block_invoke;
  v3[3] = &unk_2640930F0;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __38__HFContactController_entriesUpdated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = [a3 unsignedIntegerValue];
  if (v6 >= 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6 + 2;
  }
  id v9 = [*(id *)(a1 + 32) recipientAvailabilities];
  long long v8 = [NSNumber numberWithUnsignedInteger:v7];
  [v9 setObject:v8 forKey:v5];
}

- (void)restrictedGuestIDSCapabilityUpdated:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__HFContactController_restrictedGuestIDSCapabilityUpdated___block_invoke;
  v3[3] = &unk_2640930F0;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __59__HFContactController_restrictedGuestIDSCapabilityUpdated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v10 = [v4 recipientToRestrictedGuestIDSCapability];
  unint64_t v7 = NSNumber;
  uint64_t v8 = [v5 unsignedIntValue];

  id v9 = [v7 numberWithUnsignedInt:v8];
  [v10 setObject:v9 forKey:v6];
}

- (BOOL)hasRestrictedGuestIDSCapabilityForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(HFContactController *)self recipientToRestrictedGuestIDSCapability];
  id v6 = [v5 objectForKey:v4];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

- (void)markDestinationsPending:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id v10 = [(HFContactController *)self recipientAvailabilities];
        [v10 setObject:&unk_26C0F66D8 forKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (unint64_t)statusForDestination:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFContactController *)self recipientAvailabilities];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)fetchFamilyMembersWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    unint64_t v7 = v4;
    if ([(HFContactController *)self familyMembersState])
    {
      uint64_t v5 = [(HFContactController *)self familyMembers];
      v7[2](v7, v5);
    }
    else
    {
      uint64_t v5 = [(HFContactController *)self familyMemberCallbacks];
      uint64_t v6 = (void *)[v7 copy];
      [v5 addObject:v6];
    }
    id v4 = v7;
  }
}

- (id)contactForFamilyMemberWithDsid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFContactController *)self familyMemberDsidToContact];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  unint64_t v7 = (void *)[v6 copy];
  return v7;
}

- (id)_contactForFamilyMember:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  uint64_t v5 = [v3 firstName];
  [v4 setGivenName:v5];

  uint64_t v6 = [v3 lastName];
  [v4 setFamilyName:v6];

  unint64_t v7 = [v3 appleID];
  int v8 = objc_msgSend(v7, "hf_isEmail");

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x263EFEAD0];
    id v10 = [v3 appleID];
    long long v11 = [v9 labeledValueWithLabel:0 value:v10];
    v20[0] = v11;
    long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [v4 setEmailAddresses:v12];
  }
  else
  {
    long long v13 = [v3 appleID];
    int v14 = objc_msgSend(v13, "hf_isPhoneNumber");

    if (!v14) {
      goto LABEL_6;
    }
    v15 = (void *)MEMORY[0x263EFEAD0];
    id v16 = objc_alloc(MEMORY[0x263EFEB28]);
    id v10 = [v3 appleID];
    long long v11 = (void *)[v16 initWithStringValue:v10];
    long long v12 = [v15 labeledValueWithLabel:0 value:v11];
    v19 = v12;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    [v4 setPhoneNumbers:v17];
  }
LABEL_6:

  return v4;
}

- (void)_loadFamilyMembersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F3BF40]);
  [v5 setCachePolicy:2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke;
  v7[3] = &unk_264093140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 startRequestWithCompletionHandler:v7];
}

void __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_2;
  v10[3] = &unk_264090938;
  id v11 = v6;
  id v12 = v5;
  unint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

void __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = HFLogForCategory(0x28uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v3;
      _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Error loading family members: %@", buf, 0xCu);
    }
  }
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [*(id *)(a1 + 40) members];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) members];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_39;
    v17 = &unk_264093118;
    id v9 = v4;
    id v18 = v9;
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 48);
    id v19 = v10;
    uint64_t v20 = v11;
    [v8 enumerateObjectsUsingBlock:&v14];

    if (objc_msgSend(v9, "count", v14, v15, v16, v17))
    {
      id v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"appleID" ascending:1];
      v21 = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      [v9 sortUsingDescriptors:v13];

      [*(id *)(a1 + 48) setFamilyMembers:v9];
      [*(id *)(a1 + 48) setFamilyMemberDsidToContact:v10];
      [*(id *)(a1 + 48) _downloadFamilyMemberPhotos];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __56__HFContactController__loadFamilyMembersWithCompletion___block_invoke_39(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 isMe] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v6];
    uint64_t v3 = [*(id *)(a1 + 48) _contactForFamilyMember:v6];
    id v4 = *(void **)(a1 + 40);
    id v5 = [v6 dsid];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

- (void)_downloadFamilyMemberPhotos
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(HFContactController *)self familyMembers];
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_alloc(MEMORY[0x263F3BF50]);
        id v9 = [v7 dsid];
        id v10 = (void *)[v8 initWithFamilyMemberDSID:v9 size:1 localFallback:1];

        [v10 setUseMonogramAsLastResort:0];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __50__HFContactController__downloadFamilyMemberPhotos__block_invoke;
        v12[3] = &unk_264093168;
        v12[4] = self;
        v12[5] = v7;
        [v10 startRequestWithCompletionHandler:v12];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __50__HFContactController__downloadFamilyMemberPhotos__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HFContactController__downloadFamilyMemberPhotos__block_invoke_2;
    block[3] = &unk_26408D388;
    long long v6 = *(_OWORD *)(a1 + 32);
    id v7 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __50__HFContactController__downloadFamilyMemberPhotos__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) familyMemberDsidToContact];
  id v3 = [*(id *)(a1 + 40) dsid];
  id v5 = [v2 objectForKeyedSubscript:v3];

  [v5 setImageData:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  [v4 contactController:*(void *)(a1 + 32) didFinishDownloadingFamilyMemberAvatar:*(void *)(a1 + 40)];
}

- (HFContactControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFContactControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)recipientAvailabilities
{
  return self->_recipientAvailabilities;
}

- (void)setRecipientAvailabilities:(id)a3
{
}

- (NSMutableDictionary)recipientToRestrictedGuestIDSCapability
{
  return self->_recipientToRestrictedGuestIDSCapability;
}

- (void)setRecipientToRestrictedGuestIDSCapability:(id)a3
{
}

- (unint64_t)familyMembersState
{
  return self->_familyMembersState;
}

- (void)setFamilyMembersState:(unint64_t)a3
{
  self->_familyMembersState = a3;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (NSDictionary)familyMemberDsidToContact
{
  return self->_familyMemberDsidToContact;
}

- (void)setFamilyMemberDsidToContact:(id)a3
{
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (NSMutableArray)familyMemberCallbacks
{
  return self->_familyMemberCallbacks;
}

- (void)setFamilyMemberCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberCallbacks, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_familyMemberDsidToContact, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_recipientToRestrictedGuestIDSCapability, 0);
  objc_storeStrong((id *)&self->_recipientAvailabilities, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end