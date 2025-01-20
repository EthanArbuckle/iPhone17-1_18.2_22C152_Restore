@interface NSCloudKitMirroringActivityVoucherManager
- (BOOL)hasVoucherMatching:(id)a3;
- (NSCloudKitMirroringActivityVoucherManager)init;
- (id)_vouchersForEventType:(uint64_t)a1;
- (id)usableVoucherForEventType:(int64_t)a3;
- (unint64_t)countVouchers;
- (void)addVoucher:(id)a3;
- (void)dealloc;
- (void)expireVoucher:(id)a3;
- (void)expireVouchersForEventType:(int64_t)a3;
@end

@implementation NSCloudKitMirroringActivityVoucherManager

- (NSCloudKitMirroringActivityVoucherManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSCloudKitMirroringActivityVoucherManager;
  v2 = [(NSCloudKitMirroringActivityVoucherManager *)&v4 init];
  if (v2) {
    v2->_vouchersByEventType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  self->_vouchersByEventType = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringActivityVoucherManager;
  [(NSCloudKitMirroringActivityVoucherManager *)&v3 dealloc];
}

- (unint64_t)countVouchers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  vouchersByEventType = self->_vouchersByEventType;
  uint64_t v4 = [(NSMutableDictionary *)vouchersByEventType countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(vouchersByEventType);
      }
      v6 += objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_vouchersByEventType, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)), "count");
    }
    uint64_t v5 = [(NSMutableDictionary *)vouchersByEventType countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (BOOL)hasVoucherMatching:(id)a3
{
  return 0;
}

- (void)addVoucher:(id)a3
{
  id v4 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, [a3 eventType]);
  [v4 addObject:a3];
}

- (id)_vouchersForEventType:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = (id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", a2));
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v4, objc_msgSend(NSNumber, "numberWithInteger:", a2));
  }
  return v4;
}

- (void)expireVoucher:(id)a3
{
  id v4 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, [a3 eventType]);
  [v4 removeObject:a3];
}

- (void)expireVouchersForEventType:(int64_t)a3
{
  id v3 = -[NSCloudKitMirroringActivityVoucherManager _vouchersForEventType:]((uint64_t)self, a3);
  [v3 removeAllObjects];
}

- (id)usableVoucherForEventType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Is there a new event type: %@"];
      id v8 = +[NSPersistentCloudKitContainerEvent eventTypeString:a3];
      _NSCoreDataLog(17, v7, v9, v10, v11, v12, v13, v14, (uint64_t)v8);
      uint64_t v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = +[NSPersistentCloudKitContainerEvent eventTypeString:a3];
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Is there a new event type: %@", buf, 0xCu);
      }
      return 0;
    }
    else
    {
      id result = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_vouchersByEventType, "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", 0)), "lastObject");
      if (!result)
      {
        id result = [(NSCloudKitMirroringActivityVoucherManager *)self usableVoucherForEventType:2];
        if (!result)
        {
          return [(NSCloudKitMirroringActivityVoucherManager *)self usableVoucherForEventType:1];
        }
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_vouchersByEventType, "objectForKey:", [NSNumber numberWithInteger:a3]);
    return (id)[v5 lastObject];
  }
  return result;
}

@end