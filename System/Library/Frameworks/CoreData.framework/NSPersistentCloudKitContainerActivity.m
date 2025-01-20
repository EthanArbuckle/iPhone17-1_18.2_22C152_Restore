@interface NSPersistentCloudKitContainerActivity
- (id)_initWithIdentifier:(id)a3 forStore:(id)a4 activityType:(unint64_t)a5;
- (id)createDictionaryRepresentation;
- (void)dealloc;
- (void)finishWithError:(id)a3;
@end

@implementation NSPersistentCloudKitContainerActivity

- (id)_initWithIdentifier:(id)a3 forStore:(id)a4 activityType:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NSPersistentCloudKitContainerActivity;
  v8 = [(NSPersistentCloudKitContainerActivity *)&v11 init];
  if (v8)
  {
    v8->_identifier = (NSUUID *)a3;
    v8->_storeIdentifier = (NSString *)a4;
    v9 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v8->_activityType = a5;
    v8->_startDate = v9;
  }
  return v8;
}

- (void)dealloc
{
  self->_error = 0;
  self->_parentActivityIdentifier = 0;

  self->_endDate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerActivity;
  [(NSPersistentCloudKitContainerActivity *)&v3 dealloc];
}

- (id)createDictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKey:@"identifier"];
  [v3 setObject:self->_storeIdentifier forKey:@"storeIdentifier"];
  parentActivityIdentifier = self->_parentActivityIdentifier;
  if (parentActivityIdentifier) {
    [v3 setObject:parentActivityIdentifier forKey:@"parentActivityIdentifier"];
  }
  unint64_t activityType = self->_activityType;
  self;
  if (activityType >= 5)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"I don't know how to create a string for activity type '%lu'"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, activityType);
    v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v20 = activityType;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to create a string for activity type '%lu'", buf, 0xCu);
    }
    v6 = &stru_1ED787880;
  }
  else
  {
    v6 = off_1E544F6C0[activityType];
  }
  [v3 setObject:v6 forKey:@"activityType"];
  [v3 setObject:self->_startDate forKey:@"startDate"];
  endDate = self->_endDate;
  if (endDate) {
    [v3 setObject:endDate forKey:@"endDate"];
  }
  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }
  if (self->_endDate) {
    BOOL v17 = self->_error == 0;
  }
  else {
    BOOL v17 = 0;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v17), @"succeeded");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_endDate != 0), @"finished");
  return v3;
}

- (void)finishWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_endDate)
  {
    uint64_t v4 = [NSString stringWithUTF8String:"Illegal attempt to finish an activity multiple times: %@"];
    _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)self);
    uint64_t v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to finish an activity multiple times: %@", buf, 0xCu);
    }
  }
  else
  {
    self->_endDate = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    self->_error = (NSError *)a3;
  }
}

@end