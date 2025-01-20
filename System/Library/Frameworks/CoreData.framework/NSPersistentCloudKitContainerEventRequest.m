@interface NSPersistentCloudKitContainerEventRequest
+ (NSFetchRequest)fetchRequestForEvents;
+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterDate:(NSDate *)date;
+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterEvent:(NSPersistentCloudKitContainerEvent *)event;
+ (NSPersistentCloudKitContainerEventRequest)fetchEventsMatchingFetchRequest:(NSFetchRequest *)fetchRequest;
+ (__CFString)ckEventKeyForKey:(uint64_t)a1;
+ (id)translateExpression:(uint64_t *)a3 orReturnFailureReason:;
+ (uint64_t)translatePredicate:(uint64_t *)a3 orReturnFailureReason:;
- (NSPersistentCloudKitContainerEventRequest)initWithCKEventFetchRequest:(id)a3;
- (NSPersistentCloudKitContainerEventResultType)resultType;
- (unint64_t)requestType;
- (void)dealloc;
- (void)setResultType:(NSPersistentCloudKitContainerEventResultType)resultType;
@end

@implementation NSPersistentCloudKitContainerEventRequest

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterDate:(NSDate *)date
{
  v5 = [[NSFetchRequest alloc] initWithEntityName:+[NSCKEvent entityPath]];
  -[NSFetchRequest setPredicate:](v5, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"startedAt > %@", date]);
  v6 = (void *)[objc_alloc((Class)a1) initWithCKEventFetchRequest:v5];

  return (NSPersistentCloudKitContainerEventRequest *)v6;
}

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsAfterEvent:(NSPersistentCloudKitContainerEvent *)event
{
  v5 = [[NSFetchRequest alloc] initWithEntityName:+[NSCKEvent entityPath]];
  if (event) {
    -[NSFetchRequest setPredicate:](v5, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF > %@", event->_ckEventObjectID]);
  }
  v6 = (void *)[objc_alloc((Class)a1) initWithCKEventFetchRequest:v5];

  return (NSPersistentCloudKitContainerEventRequest *)v6;
}

+ (NSPersistentCloudKitContainerEventRequest)fetchEventsMatchingFetchRequest:(NSFetchRequest *)fetchRequest
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = 0x1E544A000uLL;
  self;
  uint64_t v68 = 0;
  v6 = [(NSFetchRequest *)fetchRequest entityName];
  v7 = (objc_class *)objc_opt_class();
  if (![(NSString *)v6 isEqualToString:NSStringFromClass(v7)])
  {
    v38 = NSString;
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    [(NSFetchRequest *)fetchRequest entityName];
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    NSStringFromSelector(sel_fetchRequest);
    uint64_t v54 = (uint64_t)v40;
    uint64_t v68 = [v38 stringWithFormat:@"Fetch requests for '%@' must use '%@' as the entity name, '%@' is not valid. Please consider using +[%@ %@]."];
    if (!v68) {
      goto LABEL_30;
    }
    v60 = 0;
    goto LABEL_34;
  }
  v8 = [[NSFetchRequest alloc] initWithEntityName:+[NSCKEvent entityPath]];
  [(NSFetchRequest *)v8 setAffectedStores:[(NSFetchRequest *)fetchRequest affectedStores]];
  v60 = v8;
  if (([(NSFetchRequest *)fetchRequest resultType] | 4) == 4)
  {
    [(NSFetchRequest *)v8 setResultType:[(NSFetchRequest *)fetchRequest resultType]];
    goto LABEL_5;
  }
  v9 = NSString;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  +[NSFetchRequest _stringForFetchRequestResultType:0];
  +[NSFetchRequest _stringForFetchRequestResultType:4];
  unint64_t v5 = 0x1E544A000uLL;
  uint64_t v54 = (uint64_t)v11;
  uint64_t v68 = [v9 stringWithFormat:@"'%@' only supports fetch requests with the following result types: %@, %@"];
  if (v68)
  {
LABEL_34:

    v51 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v52 = *MEMORY[0x1E4F1C3C8];
    uint64_t v53 = v68;
    goto LABEL_35;
  }
LABEL_5:
  v58 = (objc_class *)a1;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](-[NSFetchRequest sortDescriptors](fetchRequest, "sortDescriptors"), "count"));
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v59 = fetchRequest;
  obj = [(NSFetchRequest *)fetchRequest sortDescriptors];
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v65;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v65 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v19 = +[NSPersistentCloudKitContainerEventRequest ckEventKeyForKey:](*(void *)(v5 + 3976), (void *)[v18 key]);
        if (v19)
        {
          objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", v19, objc_msgSend(v18, "ascending")));
        }
        else
        {
          uint64_t v20 = v14;
          if (objc_msgSend((id)objc_msgSend(v18, "key"), "isEqualToString:", @"storeIdentifier"))
          {
            v61 = NSString;
            uint64_t v21 = [v18 key];
            v22 = (objc_class *)objc_opt_class();
            v23 = NSStringFromClass(v22);
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            v26 = NSStringFromSelector(sel_affectedStores);
            v27 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v27);
            unint64_t v5 = 0x1E544A000;
            uint64_t v28 = [v61 stringWithFormat:@"Cannot sort events by '%@', it is not a persisted property of '%@'. Use '%@.%@' or '%@.%@' instead.", v21, v23, v25, v26, v56, NSStringFromSelector(sel_affectedStores)];
          }
          else
          {
            int v29 = objc_msgSend((id)objc_msgSend(v18, "key"), "isEqualToString:", @"error");
            v30 = NSString;
            uint64_t v31 = [v18 key];
            v32 = (objc_class *)objc_opt_class();
            v33 = NSStringFromClass(v32);
            if (!v29)
            {
              uint64_t v54 = v31;
              uint64_t v15 = [v30 stringWithFormat:@"Cannot sort events by '%@', it is not an attribute of '%@'."];
              uint64_t v68 = v15;
              goto LABEL_22;
            }
            v34 = NSStringFromSelector(sel_domain);
          }
          uint64_t v15 = v28;
          uint64_t v68 = v28;
          uint64_t v14 = v20;
        }
      }
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_22:
  [(NSFetchRequest *)v60 setSortDescriptors:v12];

  if (v15) {
    goto LABEL_34;
  }
  if ([(NSFetchRequest *)v59 predicate])
  {
    v35 = (void *)+[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:]((uint64_t)NSPersistentCloudKitContainerEventRequest, [(NSFetchRequest *)v59 predicate], &v68);
    [(NSFetchRequest *)v60 setPredicate:v35];

    if (v68) {
      goto LABEL_34;
    }
  }
  if (!v60)
  {
LABEL_30:
    uint64_t v43 = [NSString stringWithUTF8String:"Fetch request validation for NSPersistentCloudKitContainerEventRequest failed but did not report a failure reason."];
    _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, v54);
    v50 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v50, OS_LOG_TYPE_FAULT, "CoreData: Fetch request validation for NSPersistentCloudKitContainerEventRequest failed but did not report a failure reason.", buf, 2u);
    }
    v51 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v52 = *MEMORY[0x1E4F1C3C8];
    uint64_t v53 = 0;
LABEL_35:
    objc_exception_throw((id)[v51 exceptionWithName:v52 reason:v53 userInfo:0]);
  }
  v36 = (void *)[[v58 alloc] initWithCKEventFetchRequest:v60];

  return (NSPersistentCloudKitContainerEventRequest *)v36;
}

+ (NSFetchRequest)fetchRequestForEvents
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);

  return +[NSFetchRequest fetchRequestWithEntityName:v3];
}

- (NSPersistentCloudKitContainerEventRequest)initWithCKEventFetchRequest:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSPersistentCloudKitContainerEventRequest;
  v4 = [(NSPersistentCloudKitContainerEventRequest *)&v8 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_resultType = 0;
    v6 = (NSFetchRequest *)a3;
    v5->_ckEventFetchRequest = v6;
    if ([(NSArray *)[(NSFetchRequest *)v6 affectedStores] count]) {
      [(NSPersistentStoreRequest *)v5 setAffectedStores:[(NSFetchRequest *)v5->_ckEventFetchRequest affectedStores]];
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEventRequest;
  [(NSPersistentStoreRequest *)&v3 dealloc];
}

- (unint64_t)requestType
{
  return 11;
}

+ (__CFString)ckEventKeyForKey:(uint64_t)a1
{
  if ([a2 isEqualToString:@"identifier"]) {
    return @"eventIdentifier";
  }
  if ([a2 isEqualToString:@"type"]) {
    return @"cloudKitEventType";
  }
  if ([a2 isEqualToString:@"startDate"]) {
    return @"startedAt";
  }
  if ([a2 isEqualToString:@"endDate"]) {
    return @"endedAt";
  }
  if (([a2 isEqualToString:@"succeeded"] & 1) == 0)
  {
    if ([a2 isEqualToString:@"error.domain"])
    {
      return @"errorDomain";
    }
    else if ([a2 isEqualToString:@"error.code"])
    {
      return @"errorCode";
    }
    else
    {
      return 0;
    }
  }
  return (__CFString *)a2;
}

+ (uint64_t)translatePredicate:(uint64_t *)a3 orReturnFailureReason:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a2, "subpredicates"), "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v6 = (void *)[a2 subpredicates];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (!v7)
    {
LABEL_10:
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(a2, "compoundPredicateType"), v5);
      goto LABEL_20;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = +[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:](NSPersistentCloudKitContainerEventRequest, *(void *)(*((void *)&v31 + 1) + 8 * v10), a3);
      if (!v11) {
        goto LABEL_19;
      }
      v12 = (void *)v11;
      [v5 addObject:v11];

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = (objc_class *)objc_opt_class();
    uint64_t v16 = [v17 stringWithFormat:@"'%@' does not support predicates of type '%@'.", v19, NSStringFromClass(v20)];
    goto LABEL_15;
  }
  if ([a2 predicateOperatorType] == 11)
  {
    uint64_t v14 = NSString;
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = [v14 stringWithFormat:@"'%@' does not support predicates with custom selectors: %@", NSStringFromClass(v15), a2];
LABEL_15:
    uint64_t v13 = 0;
    *a3 = v16;
    return v13;
  }
  id v5 = +[NSPersistentCloudKitContainerEventRequest translateExpression:orReturnFailureReason:]((uint64_t)NSPersistentCloudKitContainerEventRequest, (void *)[a2 leftExpression], a3);
  if (!v5)
  {
LABEL_19:
    uint64_t v13 = 0;
    goto LABEL_20;
  }
  id v21 = +[NSPersistentCloudKitContainerEventRequest translateExpression:orReturnFailureReason:]((uint64_t)NSPersistentCloudKitContainerEventRequest, (void *)[a2 rightExpression], a3);
  if (v21) {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B98]), "initWithLeftExpression:rightExpression:modifier:type:options:", v5, v21, objc_msgSend(a2, "comparisonPredicateModifier"), objc_msgSend(a2, "predicateOperatorType"), objc_msgSend(a2, "options"));
  }
  else {
    uint64_t v13 = 0;
  }

LABEL_20:
  if (!((unint64_t)a3 | v13))
  {
    uint64_t v22 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainerEventRequest predicate translation failed but did not return a failure reason: %@"];
    _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)a2);
    int v29 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = a2;
      _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainerEventRequest predicate translation failed but did not return a failure reason: %@", buf, 0xCu);
    }
    return 0;
  }
  return v13;
}

+ (id)translateExpression:(uint64_t *)a3 orReturnFailureReason:
{
  self;
  if ([a2 expressionType] != 3)
  {
    if ([a2 expressionType] != 13)
    {
      v6 = a2;
      goto LABEL_8;
    }
    uint64_t v7 = (void *)+[NSPersistentCloudKitContainerEventRequest translatePredicate:orReturnFailureReason:](NSPersistentCloudKitContainerEventRequest, [a2 predicate], a3);
    if (v7) {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29028]), "initWithExpression:usingIteratorExpression:predicate:", objc_msgSend(a2, "collection"), objc_msgSend(a2, "variableExpression"), v7);
    }
    else {
      uint64_t v8 = 0;
    }

    return (id)v8;
  }
  v4 = (void *)[a2 keyPath];
  id v5 = +[NSPersistentCloudKitContainerEventRequest ckEventKeyForKey:]((uint64_t)NSPersistentCloudKitContainerEventRequest, v4);
  if (!v5)
  {
    if ([v4 isEqualToString:@"storeIdentifier"])
    {
      uint64_t v10 = NSString;
      uint64_t v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromSelector(sel_affectedStores);
      uint64_t v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      uint64_t v18 = [v10 stringWithFormat:@"Cannot query events by '%@', it is not a persisted property of '%@'. Use '%@.%@' or '%@.%@' instead.", v4, v12, v14, v15, v17, NSStringFromSelector(sel_affectedStores)];
    }
    else
    {
      int v19 = [v4 isEqualToString:@"error"];
      uint64_t v20 = NSString;
      id v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      uint64_t v23 = v22;
      if (v19)
      {
        uint64_t v24 = NSStringFromSelector(sel_domain);
      }
      else
      {
        uint64_t v18 = [v20 stringWithFormat:@"Cannot query events by '%@', it is not an attribute of '%@'.", v4, v22, v25, v26, v27, v28];
      }
    }
    uint64_t v8 = 0;
    *a3 = v18;
    return (id)v8;
  }
  v6 = (void *)[MEMORY[0x1E4F28C68] expressionForKeyPath:v5];
LABEL_8:

  return v6;
}

- (NSPersistentCloudKitContainerEventResultType)resultType
{
  return self->_resultType;
}

- (void)setResultType:(NSPersistentCloudKitContainerEventResultType)resultType
{
  self->_resultType = resultType;
}

@end