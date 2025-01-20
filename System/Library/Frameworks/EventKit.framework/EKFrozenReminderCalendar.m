@interface EKFrozenReminderCalendar
+ (Class)meltedClass;
- (BOOL)_applyChanges:(id)a3 error:(id *)a4;
- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)isColorDisplayOnly;
- (BOOL)isPublished;
- (id)REMColorFromEKHexColorString:(id)a3;
- (id)_account;
- (id)_list;
- (id)allAlarms;
- (id)calendarIdentifier;
- (id)colorStringRaw;
- (id)externalID;
- (id)frozenReminderSource;
- (id)hexColorStringFromREMColor:(id)a3;
- (id)image;
- (id)initNewListInStore:(id)a3;
- (id)publishURLString;
- (id)remObjectID;
- (id)sharedOwnerName;
- (id)sharees;
- (id)source;
- (id)symbolicColorName;
- (id)syncError;
- (id)title;
- (id)updateListWithSaveRequest:(id)a3 error:(id *)a4;
- (int)allowedEntities;
- (int)displayOrder;
- (int)flags;
- (unint64_t)ekSharingStatusFromREMSharingStatus:(int64_t)a3;
- (unint64_t)sharingStatus;
@end

@implementation EKFrozenReminderCalendar

- (id)initNewListInStore:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(EKChangeSet);
  [(EKChangeSet *)v5 setSkipsPersistentObjectCopy:1];
  v6 = (void *)[getREMListClass() newObjectID];
  v7 = [v6 uuid];
  v8 = [v7 UUIDString];
  [(EKChangeSet *)v5 changeSingleValue:v8 forKey:@"UUID" basedOn:0];

  v11.receiver = self;
  v11.super_class = (Class)EKFrozenReminderCalendar;
  v9 = [(EKFrozenReminderObject *)&v11 initWithREMObject:0 inStore:v4 withChanges:v5];

  return v9;
}

- (id)_list
{
  return self->super._remObject;
}

- (id)remObjectID
{
  v3 = [(EKFrozenReminderCalendar *)self _list];

  if (v3)
  {
    id v4 = [(EKFrozenReminderCalendar *)self _list];
    v5 = [v4 objectID];
  }
  else
  {
    id v4 = [(EKFrozenReminderCalendar *)self calendarIdentifier];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    v5 = [getREMListClass() objectIDWithUUID:v6];
  }

  return v5;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)title
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__EKFrozenReminderCalendar_title__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"unlocalizedTitle" backingValue:v4];

  return v2;
}

id __33__EKFrozenReminderCalendar_title__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _list];
  v2 = [v1 name];

  return v2;
}

- (id)colorStringRaw
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__EKFrozenReminderCalendar_colorStringRaw__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"colorStringRaw" backingValue:v4];

  return v2;
}

id __42__EKFrozenReminderCalendar_colorStringRaw__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _list];
  v3 = [v2 ekColor];

  id v4 = [*(id *)(a1 + 32) hexColorStringFromREMColor:v3];

  return v4;
}

- (unint64_t)sharingStatus
{
  v3 = [(EKFrozenReminderCalendar *)self _list];
  uint64_t v4 = [v3 sharingStatus];

  return [(EKFrozenReminderCalendar *)self ekSharingStatusFromREMSharingStatus:v4];
}

- (unint64_t)ekSharingStatusFromREMSharingStatus:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (BOOL)isPublished
{
  return 0;
}

- (id)publishURLString
{
  return 0;
}

- (id)REMColorFromEKHexColorString:(id)a3
{
  v3 = [a3 uppercaseString];
  uint64_t v4 = [getREMColorClass() colorWithHexString:v3];
  if (!v4)
  {
    if ([v3 hasPrefix:@"#"] && objc_msgSend(v3, "length") == 9)
    {
      id REMColorClass = getREMColorClass();
      v6 = [v3 substringToIndex:7];
      uint64_t v4 = [REMColorClass colorWithHexString:v6];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (id)hexColorStringFromREMColor:(id)a3
{
  v3 = [a3 hexString];
  if ((unint64_t)[v3 length] <= 8)
  {
    uint64_t v4 = [v3 stringByAppendingString:@"FF"];

    v3 = (void *)v4;
  }

  return v3;
}

- (id)calendarIdentifier
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__EKFrozenReminderCalendar_calendarIdentifier__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"UUID" backingValue:v4];

  return v2;
}

id __46__EKFrozenReminderCalendar_calendarIdentifier__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _list];
  v2 = [v1 objectID];
  v3 = [v2 uuid];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

- (id)source
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__EKFrozenReminderCalendar_source__block_invoke;
  v4[3] = &unk_1E5B969B0;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"source" backingValue:v4];

  return v2;
}

id __34__EKFrozenReminderCalendar_source__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _list];
  v3 = [v2 account];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  v5 = [WeakRetained eventStore];
  v6 = [v3 objectID];
  v7 = [v6 uuid];
  v8 = [v7 UUIDString];
  v9 = [v5 eventSourceIDForReminderSourceID:v8];

  if (!v9) {
    goto LABEL_3;
  }
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  objc_super v11 = [v10 eventStore];
  v12 = [v11 sourceWithIdentifier:v9];

  v13 = [v12 backingObject];

  if (!v13)
  {
LABEL_3:
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    v13 = [v14 frozenObjectForReminderObject:v3];
  }

  return v13;
}

- (id)_account
{
  v3 = [(EKFrozenReminderCalendar *)self frozenReminderSource];
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = [v3 remAccount];
  }
  else
  {
    v6 = [(EKFrozenReminderCalendar *)self _list];
    v5 = [v6 account];
  }

  return v5;
}

- (BOOL)_applyChanges:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"unlocalizedTitle"])
  {
    v7 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"unlocalizedTitle" basedOn:0];
    [v6 setName:v7];
  }
  if ([(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"colorStringRaw"])
  {
    v8 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"colorStringRaw" basedOn:0];
    v9 = [(EKFrozenReminderCalendar *)self REMColorFromEKHexColorString:v8];
    [v6 setColor:v9];
  }
  if (![(EKChangeSet *)self->super._changeSet hasUnsavedChangeForKey:@"source"]) {
    goto LABEL_8;
  }
  id v10 = [(EKFrozenReminderCalendar *)self frozenReminderSource];
  if (v10)
  {
    objc_super v11 = v10;
    v12 = [v10 REMObject];
    v13 = [v6 saveRequest];
    id v14 = [v13 updateAccount:v12];

    [v14 addListChangeItem:v6];
LABEL_8:
    BOOL v15 = 1;
    goto LABEL_9;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithEKErrorCode:24];
    BOOL v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_9:

  return v15;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = -[EKFrozenReminderCalendar updateListWithSaveRequest:error:](self, "updateListWithSaveRequest:error:", a3);
  if (v6) {
    BOOL v7 = [(EKFrozenReminderCalendar *)self _applyChanges:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)frozenReminderSource
{
  v2 = [(EKChangeSet *)self->super._changeSet valueForSingleValueKey:@"source" basedOn:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 reminderSource];
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)updateListWithSaveRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([(EKFrozenReminderObject *)self isNew])
  {
    listChange = self->_listChange;
    if (!listChange)
    {
      BOOL v7 = [(EKFrozenReminderCalendar *)self frozenReminderSource];
      v8 = [v7 REMObject];
      v9 = [v5 updateAccount:v8];
      uint64_t v10 = [(EKFrozenReminderCalendar *)self title];
      objc_super v11 = (void *)v10;
      v12 = &stru_1EF932508;
      if (v10) {
        v12 = (__CFString *)v10;
      }
      v13 = v12;

      id v14 = [(EKFrozenReminderCalendar *)self remObjectID];
      BOOL v15 = [v5 addListWithName:v13 toAccountChangeItem:v9 listObjectID:v14];

      v16 = self->_listChange;
      self->_listChange = v15;

      listChange = self->_listChange;
    }
    v17 = listChange;
  }
  else
  {
    v18 = [(EKFrozenReminderCalendar *)self _list];
    v17 = [v5 updateList:v18];
  }

  return v17;
}

- (int)displayOrder
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__EKFrozenReminderCalendar_displayOrder__block_invoke;
  v5[3] = &unk_1E5B96908;
  v5[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"displayOrder" backingValue:v5];
  int v3 = [v2 intValue];

  return v3;
}

id __40__EKFrozenReminderCalendar_displayOrder__block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) _list];
  int v3 = objc_msgSend(v1, "numberWithInteger:", objc_msgSend(v2, "daDisplayOrder"));

  return v3;
}

- (int)flags
{
  return 0;
}

- (int)allowedEntities
{
  return 8;
}

- (id)allAlarms
{
  return 0;
}

- (id)sharees
{
  return 0;
}

- (id)symbolicColorName
{
  return 0;
}

- (id)externalID
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__EKFrozenReminderCalendar_externalID__block_invoke;
  v4[3] = &unk_1E5B96988;
  v4[4] = self;
  v2 = [(EKFrozenReminderObject *)self valueForSingleValueKey:@"UUID" backingValue:v4];

  return v2;
}

id __38__EKFrozenReminderCalendar_externalID__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _list];
  v2 = [v1 externalIdentifier];

  return v2;
}

- (BOOL)isColorDisplayOnly
{
  return 0;
}

- (id)sharedOwnerName
{
  v2 = [(EKFrozenReminderCalendar *)self _list];
  int v3 = [v2 sharedOwnerName];

  return v3;
}

- (id)syncError
{
  return 0;
}

- (id)image
{
  return 0;
}

- (void).cxx_destruct
{
}

@end