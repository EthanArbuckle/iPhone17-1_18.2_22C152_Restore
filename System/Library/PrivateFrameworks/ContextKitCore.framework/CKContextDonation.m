@interface CKContextDonation
+ (BOOL)supportsSecureCoding;
+ (id)establishServiceConnection;
- (CKContextDonation)initWithCoder:(id)a3;
- (CKContextDonation)initWithDonations:(id)a3 donorBundleIdentifier:(id)a4;
- (CKContextDonation)initWithDonorBundleIdentifier:(id)a3;
- (CKContextUserActivity)associatedUserActivity;
- (NSArray)items;
- (NSString)donorBundleIdentifier;
- (id)_concatenatedRequestTextUsingDebugText:(BOOL)a3;
- (id)concatenatedRequestsDebugText;
- (id)concatenatedRequestsText;
- (id)description;
- (unint64_t)nonce;
- (unint64_t)remoteProcesses;
- (void)addItem:(id)a3;
- (void)donate;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedUserActivity:(id)a3;
- (void)setNonce:(unint64_t)a3;
- (void)setRemoteProcesses:(unint64_t)a3;
@end

@implementation CKContextDonation

- (CKContextDonation)initWithDonorBundleIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKContextDonation;
  v6 = [(CKContextDonation *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    items = v6->_items;
    v6->_items = v7;

    objc_storeStrong((id *)&v6->_donorBundleIdentifier, a3);
    v9 = v6;
  }

  return v6;
}

- (CKContextDonation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"donations"];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  self->_remoteProcesses = [v4 decodeIntegerForKey:@"remoteProcesses"];
  v10 = [(CKContextDonation *)self initWithDonations:v8 donorBundleIdentifier:v9];
  if (v10)
  {
    v10->_nonce = [v4 decodeInt64ForKey:@"nonce"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
    associatedUserActivity = v10->_associatedUserActivity;
    v10->_associatedUserActivity = (CKContextUserActivity *)v11;
  }
  return v10;
}

- (CKContextDonation)initWithDonations:(id)a3 donorBundleIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [(CKContextDonation *)self initWithDonorBundleIdentifier:a4];
  v8 = v7;
  if (v7) {
    [(NSMutableArray *)v7->_items addObjectsFromArray:v6];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = self->_items;
  objc_sync_enter(v4);
  [v5 encodeObject:self->_items forKey:@"donations"];
  objc_sync_exit(v4);

  [v5 encodeObject:self->_donorBundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeInt64:self->_nonce forKey:@"nonce"];
  [v5 encodeInteger:self->_remoteProcesses forKey:@"remoteProcesses"];
  [v5 encodeObject:self->_associatedUserActivity forKey:@"userActivity"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_donated);
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CKContextDonation addItem:]();
    }
  }
  else
  {
    id v6 = self->_items;
    objc_sync_enter(v6);
    [(NSMutableArray *)self->_items addObject:v4];
    objc_sync_exit(v6);
  }
}

- (id)description
{
  v3 = self->_items;
  objc_sync_enter(v3);
  id v4 = [NSString stringWithFormat:@"Donation with bundle ID: %@, number of items: %i", self->_donorBundleIdentifier, -[NSMutableArray count](self->_items, "count")];
  objc_sync_exit(v3);

  return v4;
}

- (id)concatenatedRequestsText
{
  return [(CKContextDonation *)self _concatenatedRequestTextUsingDebugText:0];
}

- (id)concatenatedRequestsDebugText
{
  return [(CKContextDonation *)self _concatenatedRequestTextUsingDebugText:1];
}

- (id)_concatenatedRequestTextUsingDebugText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  unsigned __int8 v5 = self->_items;
  objc_sync_enter(v5);
  if ([(NSMutableArray *)self->_items count])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = self->_items;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (v3) {
            [v11 debugText];
          }
          else {
          v12 = objc_msgSend(v11, "text", (void)v15);
          }
          if (objc_msgSend(v12, "length", (void)v15)) {
            [v6 addObject:v12];
          }
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v13 = [v6 componentsJoinedByString:@" "];
  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v5);

  return v13;
}

- (void)donate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((atomic_exchange((atomic_uchar *volatile)&self->_donated, 1u) & 1) == 0)
  {
    BOOL v3 = self->_items;
    objc_sync_enter(v3);
    uint64_t v4 = [(NSMutableArray *)self->_items count];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      unint64_t remoteProcesses = self->_remoteProcesses;
      donorBundleIdentifier = self->_donorBundleIdentifier;
      *(_DWORD *)buf = 134218498;
      uint64_t v9 = v4;
      __int16 v10 = 2048;
      unint64_t v11 = remoteProcesses;
      __int16 v12 = 2112;
      v13 = donorBundleIdentifier;
      _os_log_impl(&dword_2129CD000, &_os_log_internal, OS_LOG_TYPE_INFO, "Donating %lu items/%lu remotes from %@", buf, 0x20u);
    }
    if (v4 || self->_remoteProcesses)
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __27__CKContextDonation_donate__block_invoke;
      activity_block[3] = &unk_2641970C8;
      activity_block[4] = self;
      _os_activity_initiate(&dword_2129CD000, "CKContextDonation donate", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
    objc_sync_exit(v3);
  }
}

void __27__CKContextDonation_donate__block_invoke(uint64_t a1)
{
  id v3 = +[CKContextDonation establishServiceConnection];
  v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v2 donate:*(void *)(a1 + 32)];

  [v3 invalidate];
}

void __27__CKContextDonation_donate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __27__CKContextDonation_donate__block_invoke_2_cold_1(a2);
  }
}

+ (id)establishServiceConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.siri.context.service"];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C3CB308];
  uint64_t v4 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:sel_donate_ argumentIndex:0 ofReply:0];

  [v2 setRemoteObjectInterface:v3];
  [v2 resume];

  return v2;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (CKContextUserActivity)associatedUserActivity
{
  return self->_associatedUserActivity;
}

- (void)setAssociatedUserActivity:(id)a3
{
}

- (unint64_t)remoteProcesses
{
  return self->_remoteProcesses;
}

- (void)setRemoteProcesses:(unint64_t)a3
{
  self->_unint64_t remoteProcesses = a3;
}

- (unint64_t)nonce
{
  return self->_nonce;
}

- (void)setNonce:(unint64_t)a3
{
  self->_nonce = a3;
}

- (NSString)donorBundleIdentifier
{
  return self->_donorBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donorBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedUserActivity, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)addItem:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2129CD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Attempted to add CKContextDonationItem after donation", v0, 2u);
}

void __27__CKContextDonation_donate__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2129CD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "XPC Error in donateWithReply: %@", (uint8_t *)&v1, 0xCu);
}

@end