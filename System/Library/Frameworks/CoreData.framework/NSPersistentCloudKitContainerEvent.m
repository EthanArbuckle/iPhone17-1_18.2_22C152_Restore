@interface NSPersistentCloudKitContainerEvent
+ (id)eventTypeString:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)succeeded;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSError)error;
- (NSPersistentCloudKitContainerEvent)initWithCKEvent:(id)a3;
- (NSPersistentCloudKitContainerEventType)type;
- (NSString)storeIdentifier;
- (NSUUID)identifier;
- (id)description;
- (void)dealloc;
@end

@implementation NSPersistentCloudKitContainerEvent

- (NSPersistentCloudKitContainerEvent)initWithCKEvent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCloudKitContainerEvent;
  v4 = [(NSPersistentCloudKitContainerEvent *)&v6 init];
  if (v4)
  {
    v4->_ckEventObjectID = (NSManagedObjectID *)(id)[a3 objectID];
    v4->_identifier = (NSUUID *)(id)[a3 eventIdentifier];
    v4->_storeIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectID"), "persistentStore"), "identifier");
    v4->_type = [a3 cloudKitEventType];
    v4->_startDate = (NSDate *)(id)[a3 startedAt];
    v4->_endDate = (NSDate *)(id)[a3 endedAt];
    v4->_succeeded = [a3 succeeded];
    if (objc_msgSend((id)objc_msgSend(a3, "errorDomain"), "length")) {
      v4->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "errorDomain"), objc_msgSend(a3, "errorCode"), 0);
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_endDate = 0;
  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEvent;
  [(NSPersistentCloudKitContainerEvent *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [(NSUUID *)self->_identifier isEqual:*((void *)a3 + 3)];
      if (v5) {
        LOBYTE(v5) = self->_type == *((void *)a3 + 5);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NSPersistentCloudKitContainerEvent;
  objc_super v3 = objc_msgSend(-[NSPersistentCloudKitContainerEvent description](&v7, sel_description), "mutableCopy");
  [v3 appendFormat:@" { type: %@ store: %@ started: %@ ended: %@", +[NSPersistentCloudKitContainerEvent eventTypeString:](NSPersistentCloudKitContainerEvent, "eventTypeString:", self->_type), self->_storeIdentifier, self->_startDate, self->_endDate];
  if (self->_succeeded) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v3 appendFormat:@" succeeded: %@", v4];
  error = self->_error;
  if (error) {
    [v3 appendFormat:@" error: %@:%ld", -[NSError domain](error, "domain"), -[NSError code](self->_error, "code")];
  }
  [v3 appendString:@" }"];
  return v3;
}

+ (id)eventTypeString:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 3) {
    return off_1E544C860[a3];
  }
  uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "Unknown event type, cannot covert to string: %ld");
  _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
  v12 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v14 = a3;
    _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: Unknown event type, cannot covert to string: %ld", buf, 0xCu);
  }
  return 0;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSPersistentCloudKitContainerEventType)type
{
  return self->_type;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

@end