@interface NSPersistentCloudKitContainerSetupPhaseActivity
+ (__CFString)stringForPhase:(uint64_t)a1;
- (NSPersistentCloudKitContainerSetupPhaseActivity)initWithPhase:(unint64_t)a3 storeIdentifier:(id)a4;
- (id)createDictionaryRepresentation;
@end

@implementation NSPersistentCloudKitContainerSetupPhaseActivity

+ (__CFString)stringForPhase:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  if (a2 < 7) {
    return off_1E544F6E8[a2];
  }
  uint64_t v4 = [NSString stringWithUTF8String:"I don't know how to create a string for this phase: %lu"];
  _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a2);
  v11 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a2;
    _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to create a string for this phase: %lu", buf, 0xCu);
  }
  return &stru_1ED787880;
}

- (NSPersistentCloudKitContainerSetupPhaseActivity)initWithPhase:(unint64_t)a3 storeIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSPersistentCloudKitContainerSetupPhaseActivity;
  result = -[NSPersistentCloudKitContainerActivity _initWithIdentifier:forStore:activityType:](&v6, sel__initWithIdentifier_forStore_activityType_, [MEMORY[0x1E4F29128] UUID], a4, 4);
  if (result) {
    result->_phase = a3;
  }
  return result;
}

- (id)createDictionaryRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)NSPersistentCloudKitContainerSetupPhaseActivity;
  id v3 = [(NSPersistentCloudKitContainerActivity *)&v5 createDictionaryRepresentation];
  objc_msgSend(v3, "setObject:forKey:", +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]((uint64_t)NSPersistentCloudKitContainerSetupPhaseActivity, self->_phase), @"phase");
  return v3;
}

@end