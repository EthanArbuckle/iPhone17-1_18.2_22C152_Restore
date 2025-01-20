@interface TKHostToken
+ (BOOL)supportsSecureCoding;
+ (id)keychainItemClasses;
- (BOOL)persistent;
- (NSArray)keychainItems;
- (NSData)configurationData;
- (NSString)slotName;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)queue;
- (TKHostToken)initWithCoder:(id)a3;
- (TKHostToken)initWithTokenID:(id)a3 persistent:(BOOL)a4;
- (TKHostTokenDriver)driver;
- (TKHostTokenRegistry)registry;
- (TKTokenID)tokenID;
- (id)connectionWithError:(id *)a3;
- (id)description;
- (int64_t)connectionCount;
- (void)encodeWithCoder:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)setConnectionCount:(int64_t)a3;
- (void)setDriver:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setKeychainItems:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setSlotName:(id)a3;
@end

@implementation TKHostToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKHostToken)initWithTokenID:(id)a3 persistent:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TKHostToken;
  v8 = [(TKHostToken *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tokenID, a3);
    v9->_persistent = a4;
    keychainItems = v9->_keychainItems;
    v9->_keychainItems = (NSArray *)&__NSArray0__struct;

    id v11 = +[NSString stringWithFormat:@"hosttoken:%@", v7];
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;
  }
  return v9;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)TKHostToken;
  v3 = [(TKHostToken *)&v8 description];
  if ([(TKHostToken *)self persistent]) {
    v4 = "PERS";
  }
  else {
    v4 = "TRNS";
  }
  v5 = [(TKHostToken *)self tokenID];
  v6 = +[NSString stringWithFormat:@"%@ %s-%@", v3, v4, v5];

  return v6;
}

- (id)connectionWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if ([(TKHostToken *)v4 connectionCount])
  {
    v5 = [(TKHostToken *)v4 driver];
    unsigned __int8 v6 = [v5 valid];

    if (v6) {
      goto LABEL_4;
    }
  }
  id v7 = [(TKHostToken *)v4 registry];
  objc_super v8 = [v7 driverCache];
  v9 = [(TKHostToken *)v4 tokenID];
  v10 = [v9 classID];
  id v11 = [v8 hostTokenDriverWithClassID:v10 error:a3];
  [(TKHostToken *)v4 setDriver:v11];

  v12 = [(TKHostToken *)v4 driver];
  v13 = [(TKHostToken *)v4 tokenID];
  dispatch_queue_t v14 = [v12 acquireTokenWithTokenID:v13 error:a3];
  [(TKHostToken *)v4 setEndpoint:v14];

  v15 = [(TKHostToken *)v4 endpoint];

  if (v15) {
LABEL_4:
  }
    v15 = [[TKHostTokenConnection alloc] initWithToken:v4];
  objc_sync_exit(v4);

  return v15;
}

- (void)setKeychainItems:(id)a3
{
  id v5 = a3;
  if (![(NSArray *)self->_keychainItems isEqualToArray:v5])
  {
    id obj = a3;
    id v6 = [&__NSArray0__struct mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v11) mutableCopy];
          [v12 removeObjectForKey:@"pubk"];
          [v12 removeObjectForKey:@"keyUsage"];
          [v6 addObject:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    v13 = [(TKHostToken *)self registry];
    dispatch_queue_t v14 = [v13 keychain];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100004F10;
    v21[3] = &unk_100020598;
    v21[4] = self;
    id v22 = v6;
    id v15 = v6;
    [v14 accessKeychainWithBlock:v21];

    objc_storeStrong((id *)&self->_keychainItems, obj);
    v16 = [(TKHostToken *)self registry];
    objc_super v17 = [v16 beginTransaction:@"setKeychainItems"];
    v18 = [v17 markModified];
    [v18 commit];

    id v5 = v20;
  }
}

+ (id)keychainItemClasses
{
  if (qword_100028018 != -1) {
    dispatch_once(&qword_100028018, &stru_1000205D8);
  }
  v2 = (void *)qword_100028020;

  return v2;
}

- (TKHostToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenid"];
  id v6 = [v4 decodeBoolForKey:@"persistent"];
  id v7 = [(TKHostToken *)self initWithTokenID:v5 persistent:v6];
  if (v6)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    configurationData = v7->_configurationData;
    v7->_configurationData = (NSData *)v8;

    uint64_t v10 = [(id)objc_opt_class() keychainItemClasses];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"items"];
    keychainItems = v7->_keychainItems;
    v7->_keychainItems = (NSArray *)v11;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(TKHostToken *)self tokenID];
  [v7 encodeObject:v4 forKey:@"tokenid"];

  objc_msgSend(v7, "encodeBool:forKey:", -[TKHostToken persistent](self, "persistent"), @"persistent");
  if ([(TKHostToken *)self persistent])
  {
    id v5 = [(TKHostToken *)self configurationData];
    [v7 encodeObject:v5 forKey:@"data"];

    id v6 = [(TKHostToken *)self keychainItems];
    [v7 encodeObject:v6 forKey:@"items"];
  }
}

- (TKTokenID)tokenID
{
  return self->_tokenID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TKHostTokenRegistry)registry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_registry);

  return (TKHostTokenRegistry *)WeakRetained;
}

- (void)setRegistry:(id)a3
{
}

- (TKHostTokenDriver)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
}

- (NSString)slotName
{
  return self->_slotName;
}

- (void)setSlotName:(id)a3
{
}

- (BOOL)persistent
{
  return self->_persistent;
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
}

- (NSArray)keychainItems
{
  return self->_keychainItems;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (int64_t)connectionCount
{
  return self->_connectionCount;
}

- (void)setConnectionCount:(int64_t)a3
{
  self->_connectionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_keychainItems, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_slotName, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_destroyWeak((id *)&self->_registry);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_tokenID, 0);
}

@end