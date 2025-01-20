@interface NSPersistentCloudKitContainerEventResult
- (NSPersistentCloudKitContainerEventResult)initWithResult:(id)a3 ofType:(int64_t)a4;
- (NSPersistentCloudKitContainerEventResult)initWithSubresults:(id)a3;
- (NSPersistentCloudKitContainerEventResultType)resultType;
- (id)result;
- (void)dealloc;
@end

@implementation NSPersistentCloudKitContainerEventResult

- (NSPersistentCloudKitContainerEventResult)initWithResult:(id)a3 ofType:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSPersistentCloudKitContainerEventResult;
  v6 = [(NSPersistentCloudKitContainerEventResult *)&v8 init];
  if (v6)
  {
    v6->_result = a3;
    v6->_resultType = a4;
  }
  return v6;
}

- (NSPersistentCloudKitContainerEventResult)initWithSubresults:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 count])
  {
    uint64_t v5 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainerEventResult initialized without any subresults to aggregate."];
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v36);
    v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainerEventResult initialized without any subresults to aggregate.", buf, 2u);
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)NSPersistentCloudKitContainerEventResult;
  v13 = [(NSPersistentCloudKitContainerEventResult *)&v42 init];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v37 = v13;
    v13->_resultType = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "resultType");
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v15 = [a3 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(a3);
          }
          v19 = *(void **)(*((void *)&v38 + 1) + 8 * v18);
          uint64_t v20 = [v19 resultType];
          if (v20 == 1)
          {
            uint64_t v22 = objc_msgSend((id)objc_msgSend(v19, "result"), "lastObject");
            if (v22)
            {
              v23 = (void *)v22;
              v24 = (void *)[v14 lastObject];
              uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "integerValue") + objc_msgSend(v23, "integerValue"));
              if ([v14 count]) {
                [v14 replaceObjectAtIndex:0 withObject:v25];
              }
              else {
                [v14 addObject:v25];
              }
            }
          }
          else if (v20)
          {
            uint64_t v26 = [NSString stringWithUTF8String:"Unknown NSPersistentCloudKitContainerEventResultType in subResult: %@"];
            _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)v19);
            v33 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v19;
              _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Unknown NSPersistentCloudKitContainerEventResultType in subResult: %@", buf, 0xCu);
            }
          }
          else
          {
            v21 = (void *)[v19 result];
            if ([v21 count]) {
              [v14 addObjectsFromArray:v21];
            }
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v34 = [a3 countByEnumeratingWithState:&v38 objects:v45 count:16];
        uint64_t v16 = v34;
      }
      while (v34);
    }
    v13 = v37;
    v37->_result = (id)[v14 copy];
  }
  return v13;
}

- (void)dealloc
{
  self->_result = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEventResult;
  [(NSPersistentCloudKitContainerEventResult *)&v3 dealloc];
}

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSPersistentCloudKitContainerEventResultType)resultType
{
  return self->_resultType;
}

@end