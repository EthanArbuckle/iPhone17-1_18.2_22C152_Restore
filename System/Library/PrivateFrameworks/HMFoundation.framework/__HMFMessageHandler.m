@interface __HMFMessageHandler
+ (id)expiredReceiverTarget;
+ (id)handlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 selector:(SEL)a6;
+ (id)logCategory;
- (BOOL)hasReceiver:(id)a3;
- (BOOL)invokeWithMessage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMFMessageReceiver)receiver;
- (NSArray)attributeDescriptions;
- (NSArray)policies;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)target;
- (OS_dispatch_queue)queue;
- (__HMFMessageHandler)initWithReceiver:(id)a3 name:(id)a4 policies:(id)a5;
- (id)_canonicalizePolicyList:(id)a3;
- (id)logIdentifier;
- (unint64_t)hash;
@end

@implementation __HMFMessageHandler

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (__HMFMessageHandler *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6 && [(NSString *)self->_name isEqualToString:v6[2]])
    {
      unint64_t v7 = atomic_load((unint64_t *)&self->_receiver);
      unint64_t v8 = atomic_load(v6 + 1);
      if (v7) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      BOOL v11 = !v9 && v7 == v8;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  v3 = [WeakRetained messageTargetUUID];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() expiredReceiverTarget];
  }
  v6 = v5;

  return (NSUUID *)v6;
}

+ (id)handlerWithReceiver:(id)a3 name:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = NSString;
    v18 = HMFMethodDescription();
    v19 = [v17 stringWithFormat:@"Receiver does not respond to %@", v18];
    id v20 = [v15 exceptionWithName:v16 reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  v12 = [(__HMFMessageHandler *)[__HMFSelectorMessageHandler alloc] initWithReceiver:v9 name:v10 policies:v11];
  if (a6) {
    SEL v13 = a6;
  }
  else {
    SEL v13 = 0;
  }
  v12->_selector = v13;

  return v12;
}

- (__HMFMessageHandler)initWithReceiver:(id)a3 name:(id)a4 policies:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    _HMFPreconditionFailure(@"name");
  }
  id v11 = v10;
  if (!v10) {
    _HMFPreconditionFailure(@"policies");
  }
  if (v8)
  {
    v25.receiver = self;
    v25.super_class = (Class)__HMFMessageHandler;
    v12 = [(__HMFMessageHandler *)&v25 init];
    SEL v13 = v12;
    if (v12)
    {
      objc_storeWeak((id *)&v12->_receiver, v8);
      uint64_t v14 = +[HMFObjectCacheNSString hmf_cachedInstanceForString:v9];
      name = v13->_name;
      v13->_name = (NSString *)v14;

      uint64_t v16 = [(__HMFMessageHandler *)v13 _canonicalizePolicyList:v11];
      uint64_t v17 = +[HMFObjectCacheNSArray hmf_cachedPolicyLists:v16];
      policies = v13->_policies;
      v13->_policies = (NSArray *)v17;
    }
    v19 = v13;
    id v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x19F3A87A0]();
    v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier(v19);
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      __int16 v28 = 2112;
      uint64_t v29 = 0;
      _os_log_impl(&dword_19D57B000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid receiver: %@", buf, 0x16u);
    }
    id v20 = 0;
  }

  return v20;
}

- (id)_canonicalizePolicyList:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x19F3A87A0]();
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47____HMFMessageHandler__canonicalizePolicyList___block_invoke;
  v9[3] = &unk_1E5958700;
  id v10 = v5;
  id v6 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  unint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_56];

  return v7;
}

- (OS_dispatch_queue)queue
{
  v2 = [(__HMFMessageHandler *)self receiver];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 messageReceiveQueue];
  }
  else
  {
    id v3 = 0;
  }

  return (OS_dispatch_queue *)v3;
}

- (HMFMessageReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  return (HMFMessageReceiver *)WeakRetained;
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

+ (id)expiredReceiverTarget
{
  if (qword_1EB4EE9B8 != -1) {
    dispatch_once(&qword_1EB4EE9B8, &__block_literal_global_37);
  }
  v2 = (void *)qword_1EB4EE9C0;
  return v2;
}

- (BOOL)invokeWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  unint64_t v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(__HMFMessageHandler *)self name];
  uint64_t v6 = [(__HMFMessageHandler *)self target];
  unint64_t v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"%@ %@(%@)", v4, v5, v7];

  return (NSString *)v8;
}

- (NSArray)attributeDescriptions
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = [HMFAttributeDescription alloc];
  id v4 = [(__HMFMessageHandler *)self name];
  id v5 = [(HMFAttributeDescription *)v3 initWithName:@"Name" value:v4];
  v18[0] = v5;
  uint64_t v6 = [HMFAttributeDescription alloc];
  unint64_t v7 = [(__HMFMessageHandler *)self target];
  id v8 = [v7 UUIDString];
  id v9 = [(HMFAttributeDescription *)v6 initWithName:@"Target" value:v8];
  v18[1] = v9;
  id v10 = [HMFAttributeDescription alloc];
  id v11 = [(__HMFMessageHandler *)self policies];
  v12 = [(HMFAttributeDescription *)v10 initWithName:@"Policies" value:v11];
  v18[2] = v12;
  SEL v13 = [HMFAttributeDescription alloc];
  uint64_t v14 = [(__HMFMessageHandler *)self receiver];
  v15 = [(HMFAttributeDescription *)v13 initWithName:@"Receiver" value:v14 options:1 formatter:0];
  v18[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return (NSArray *)v16;
}

- (BOOL)hasReceiver:(id)a3
{
  p_receiver = (unint64_t *)&self->_receiver;
  id v4 = a3;
  id v5 = (id)atomic_load(p_receiver);
  LOBYTE(p_receiver) = v5 == v4;

  return (char)p_receiver;
}

+ (id)logCategory
{
  if (qword_1EB4EE9C8 != -1) {
    dispatch_once(&qword_1EB4EE9C8, &__block_literal_global_58);
  }
  v2 = (void *)qword_1EB4EE9D0;
  return v2;
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(__HMFMessageHandler *)self name];
  id v5 = [(__HMFMessageHandler *)self target];
  uint64_t v6 = [v5 UUIDString];
  unint64_t v7 = [v3 stringWithFormat:@"%@(%@)", v4, v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

@end