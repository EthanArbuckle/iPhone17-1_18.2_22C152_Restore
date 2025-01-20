@interface NSPersistentCloudKitContainerEventActivity
- (id)beginActivityForPhase:(unint64_t)a3;
- (id)createDictionaryRepresentation;
- (id)endActivityForPhase:(unint64_t)a3 withError:(id)a4;
- (void)dealloc;
- (void)initWithRequestIdentifier:(void *)a1 storeIdentifier:(uint64_t)a2 eventType:(uint64_t)a3;
@end

@implementation NSPersistentCloudKitContainerEventActivity

- (void)initWithRequestIdentifier:(void *)a1 storeIdentifier:(uint64_t)a2 eventType:(uint64_t)a3
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)NSPersistentCloudKitContainerEventActivity;
  v3 = objc_msgSendSuper2(&v5, sel__initWithIdentifier_forStore_activityType_, a2, a3, 0);
  if (v3) {
    v3[8] = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerEventActivity;
  [(NSPersistentCloudKitContainerActivity *)&v3 dealloc];
}

- (id)beginActivityForPhase:(unint64_t)a3
{
  objc_super v5 = [NSPersistentCloudKitContainerSetupPhaseActivity alloc];
  if (self)
  {
    v6 = [(NSPersistentCloudKitContainerSetupPhaseActivity *)v5 initWithPhase:a3 storeIdentifier:self->super._storeIdentifier];
    identifier = self->super._identifier;
    if (!v6) {
      goto LABEL_5;
    }
  }
  else
  {
    v6 = [(NSPersistentCloudKitContainerSetupPhaseActivity *)v5 initWithPhase:a3 storeIdentifier:0];
    identifier = 0;
    if (!v6) {
      goto LABEL_5;
    }
  }
  parentActivityIdentifier = v6->super._parentActivityIdentifier;
  if (parentActivityIdentifier != identifier)
  {

    v6->super._parentActivityIdentifier = identifier;
  }
LABEL_5:
  -[NSMutableDictionary setObject:forKey:](self->_activitiesByPhaseNum, "setObject:forKey:", v6, [NSNumber numberWithUnsignedInteger:a3]);
  return v6;
}

- (id)endActivityForPhase:(unint64_t)a3 withError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = (id)-[NSMutableDictionary objectForKey:](self->_activitiesByPhaseNum, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"));
  if (!v6)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"No activity was found for phase '%@', this is a critical bug in activity tracking for %@. Please file a radar."];
    v8 = +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]((uint64_t)NSPersistentCloudKitContainerSetupPhaseActivity, a3);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    _NSCoreDataLog(17, v7, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v18 = +[NSPersistentCloudKitContainerSetupPhaseActivity stringForPhase:]((uint64_t)NSPersistentCloudKitContainerSetupPhaseActivity, a3);
      v19 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = NSStringFromClass(v19);
      _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: No activity was found for phase '%@', this is a critical bug in activity tracking for %@. Please file a radar.", buf, 0x16u);
    }
  }
  [v6 finishWithError:a4];
  return v6;
}

- (id)createDictionaryRepresentation
{
  v5.receiver = self;
  v5.super_class = (Class)NSPersistentCloudKitContainerEventActivity;
  id v3 = [(NSPersistentCloudKitContainerActivity *)&v5 createDictionaryRepresentation];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_eventType), @"eventType");
  return v3;
}

@end