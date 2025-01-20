@interface EKFrozenReminderObject
+ (BOOL)canCommitSelf;
+ (Class)meltedClass;
+ (id)uniqueIdentifierForREMObject:(id)a3;
- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)existsInStore;
- (BOOL)isCompletelyEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4;
- (BOOL)isFrozen;
- (BOOL)isNew;
- (BOOL)isPartialObject;
- (BOOL)isPropertyUnavailable:(id)a3;
- (EKChangeSet)uncommittedChanges;
- (EKFrozenReminderObject)initWithREMObject:(id)a3 inStore:(id)a4;
- (EKFrozenReminderObject)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5;
- (NSArray)path;
- (id)REMObject;
- (id)changeSet;
- (id)existingMeltedObject;
- (id)remObjectID;
- (id)uniqueIdentifier;
- (id)updateParentToCommitSelf:(id)a3;
- (id)updatedFrozenObjectWithChanges:(id)a3;
- (id)updatedFrozenObjectWithChanges:(id)a3 updatedChildren:(id)a4;
- (id)valueForSingleValueKey:(id)a3 backingValue:(id)a4;
- (int)entityType;
- (unint64_t)hash;
- (void)setPath:(id)a3;
@end

@implementation EKFrozenReminderObject

- (EKFrozenReminderObject)initWithREMObject:(id)a3 inStore:(id)a4
{
  return [(EKFrozenReminderObject *)self initWithREMObject:a3 inStore:a4 withChanges:0];
}

- (EKFrozenReminderObject)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EKFrozenReminderObject;
  v13 = [(EKPersistentObject *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_remObject, a3);
    objc_storeWeak((id *)&v14->_reminderStore, v11);
    v15 = [v11 eventStore];
    [(EKPersistentObject *)v14 _setEventStore:v15];

    objc_storeStrong((id *)&v14->_changeSet, a5);
    changeSet = v14->_changeSet;
    if (changeSet)
    {
      if (![(EKChangeSet *)changeSet skipsPersistentObjectCopy])
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:v14 file:@"EKFrozenReminderObject.m" lineNumber:36 description:@"You must set skipsPersistentObjectCopy on change sets used by EKFrozenReminderObject."];
      }
    }
  }

  return v14;
}

- (id)REMObject
{
  return self->_remObject;
}

- (id)remObjectID
{
  return (id)[self->_remObject objectID];
}

- (id)updatedFrozenObjectWithChanges:(id)a3
{
  return [(EKFrozenReminderObject *)self updatedFrozenObjectWithChanges:a3 updatedChildren:0];
}

- (id)updatedFrozenObjectWithChanges:(id)a3 updatedChildren:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    changeSet = self->_changeSet;
    if (!changeSet)
    {
      id v10 = (void *)[v6 copy];
      [v10 setSkipsPersistentObjectCopy:1];
LABEL_8:
      [v10 replaceUniqueMultiValueObjectsWithUpdatedObjects:v8];
      id v11 = objc_alloc((Class)objc_opt_class());
      id v12 = [(EKFrozenReminderObject *)self REMObject];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_reminderStore);
      v14 = (EKFrozenReminderObject *)[v11 initWithREMObject:v12 inStore:WeakRetained withChanges:v10];

      goto LABEL_10;
    }
LABEL_6:
    id v10 = (void *)[(EKChangeSet *)changeSet copy];
    [v10 setSkipsPersistentObjectCopy:1];
    if (v6) {
      [v10 addChangesAndUpdateUniqueMultiValueObjects:v6];
    }
    goto LABEL_8;
  }
  if (v7)
  {
    changeSet = self->_changeSet;
    if (changeSet) {
      goto LABEL_6;
    }
  }
  v14 = self;
LABEL_10:

  return v14;
}

- (id)valueForSingleValueKey:(id)a3 backingValue:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if ([(EKChangeSet *)self->_changeSet hasUnsavedChangeForKey:v6]) {
    [(EKChangeSet *)self->_changeSet valueForSingleValueKey:v6 basedOn:0];
  }
  else {
  v8 = v7[2](v7);
  }

  return v8;
}

- (EKChangeSet)uncommittedChanges
{
  return self->_changeSet;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = +[EKReminderStore log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[EKFrozenReminderObject _applyChangesToSaveRequest:error:]((uint64_t)self, v6);
  }

  [(EKFrozenReminderObject *)self doesNotRecognizeSelector:a2];
  return 0;
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  v3 = [a3 objectID];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

+ (BOOL)canCommitSelf
{
  return 1;
}

- (id)updateParentToCommitSelf:(id)a3
{
  id v4 = a3;
  v5 = +[EKReminderStore log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(EKFrozenReminderObject *)(uint64_t)self updateParentToCommitSelf:v5];
  }

  return v4;
}

- (BOOL)isFrozen
{
  return 1;
}

- (BOOL)isPartialObject
{
  return 0;
}

- (id)uniqueIdentifier
{
  return 0;
}

- (id)changeSet
{
  return 0;
}

- (id)existingMeltedObject
{
  return 0;
}

- (BOOL)isPropertyUnavailable:(id)a3
{
  return 0;
}

+ (Class)meltedClass
{
  return 0;
}

- (BOOL)isCompletelyEqual:(id)a3
{
  return a3 == self;
}

- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4
{
  return a3 == self;
}

- (BOOL)isNew
{
  v2 = [(EKFrozenReminderObject *)self REMObject];
  BOOL v3 = v2 == 0;

  return v3;
}

- (int)entityType
{
  return -1;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (EKFrozenReminderObject *)a3;
  if (v5 == self)
  {
    char v7 = 1;
    goto LABEL_12;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = v5;
    v9 = [(EKFrozenReminderObject *)self uniqueIdentifier];
    if (v9
      || ([(EKFrozenReminderObject *)v8 uniqueIdentifier],
          (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = [(EKFrozenReminderObject *)self uniqueIdentifier];
      id v11 = [(EKFrozenReminderObject *)v8 uniqueIdentifier];
      char v7 = [v10 isEqual:v11];

      if (v9)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v7 = 1;
    }

    goto LABEL_11;
  }
  char v7 = 0;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EKFrozenReminderObject *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)existsInStore
{
  return 1;
}

- (NSArray)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_remObject, 0);
  objc_destroyWeak((id *)&self->_reminderStore);

  objc_storeStrong((id *)&self->_changeSet, 0);
}

- (void)_applyChangesToSaveRequest:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "_applyChangesToSaveRequest:error: called on a class (%{public}@) that doesn't provide an implementation.", (uint8_t *)&v5, 0xCu);
}

- (void)updateParentToCommitSelf:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "This object doesn't know how to update its parent. self=%@, parent=%@", (uint8_t *)&v3, 0x16u);
}

@end