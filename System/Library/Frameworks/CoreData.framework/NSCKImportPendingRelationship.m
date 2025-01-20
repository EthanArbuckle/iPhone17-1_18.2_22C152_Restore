@interface NSCKImportPendingRelationship
+ (NSManagedObject)insertPendingRelationshipForFailedRelationship:(uint64_t)a3 forOperation:(uint64_t)a4 inStore:(void *)a5 withManagedObjectContext:;
+ (uint64_t)entityPath;
@end

@implementation NSCKImportPendingRelationship

+ (NSManagedObject)insertPendingRelationshipForFailedRelationship:(uint64_t)a3 forOperation:(uint64_t)a4 inStore:(void *)a5 withManagedObjectContext:
{
  self;
  v9 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKImportPendingRelationship entityPath](), a5);
  uint64_t v10 = MEMORY[0x1E4F1CC28];
  [(NSManagedObject *)v9 setNeedsDelete:MEMORY[0x1E4F1CC28]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NSManagedObject *)v9 setNeedsDelete:MEMORY[0x1E4F1CC28]];
    if (a2)
    {
      -[NSManagedObject setRecordName:](v9, "setRecordName:", [*(id *)(a2 + 32) recordName]);
      v11 = *(void **)(a2 + 32);
    }
    else
    {
      -[NSManagedObject setRecordName:](v9, "setRecordName:", [0 recordName]);
      v11 = 0;
    }
    -[NSManagedObject setRecordZoneName:](v9, "setRecordZoneName:", objc_msgSend((id)objc_msgSend(v11, "zoneID"), "zoneName"));
    if (a2)
    {
      -[NSManagedObject setRecordZoneOwnerName:](v9, "setRecordZoneOwnerName:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 32), "zoneID"), "ownerName"));
      v12 = *(void **)(a2 + 8);
    }
    else
    {
      -[NSManagedObject setRecordZoneOwnerName:](v9, "setRecordZoneOwnerName:", objc_msgSend((id)objc_msgSend(0, "zoneID"), "ownerName"));
      v12 = 0;
    }
    -[NSManagedObject setCdEntityName:](v9, "setCdEntityName:", objc_msgSend((id)objc_msgSend(v12, "entity"), "name"));
    if (a2)
    {
      -[NSManagedObject setRelatedEntityName:](v9, "setRelatedEntityName:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 16), "entity"), "name"));
      v13 = *(void **)(a2 + 24);
    }
    else
    {
      -[NSManagedObject setRelatedEntityName:](v9, "setRelatedEntityName:", objc_msgSend((id)objc_msgSend(0, "entity"), "name"));
      v13 = 0;
    }
    -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", [v13 recordName]);
    if (a2)
    {
      -[NSManagedObject setRelatedRecordZoneName:](v9, "setRelatedRecordZoneName:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 32), "zoneID"), "zoneName"));
      v14 = *(void **)(a2 + 32);
    }
    else
    {
      -[NSManagedObject setRelatedRecordZoneName:](v9, "setRelatedRecordZoneName:", objc_msgSend((id)objc_msgSend(0, "zoneID"), "zoneName"));
      v14 = 0;
    }
    -[NSManagedObject setRelatedRecordZoneOwnerName:](v9, "setRelatedRecordZoneOwnerName:", objc_msgSend((id)objc_msgSend(v14, "zoneID"), "ownerName"));
    if (a2)
    {
      uint64_t v15 = 8;
LABEL_26:
      v21 = *(void **)(a2 + v15);
LABEL_27:
      -[NSManagedObject setRelationshipName:](v9, "setRelationshipName:", [v21 name]);
      goto LABEL_28;
    }
    goto LABEL_38;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2)
    {
      if (*(void *)(a2 + 8) == 1) {
        uint64_t v16 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v16 = v10;
      }
      [(NSManagedObject *)v9 setNeedsDelete:v16];
      v17 = *(void **)(a2 + 16);
    }
    else
    {
      [(NSManagedObject *)v9 setNeedsDelete:MEMORY[0x1E4F1CC28]];
      v17 = 0;
    }
    -[NSManagedObject setCdEntityName:](v9, "setCdEntityName:", objc_msgSend((id)objc_msgSend(v17, "entity"), "name"));
    if (a2)
    {
      -[NSManagedObject setRelatedEntityName:](v9, "setRelatedEntityName:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 24), "entity"), "name"));
      v18 = *(void **)(a2 + 48);
    }
    else
    {
      -[NSManagedObject setRelatedEntityName:](v9, "setRelatedEntityName:", objc_msgSend((id)objc_msgSend(0, "entity"), "name"));
      v18 = 0;
    }
    -[NSManagedObject setRecordName:](v9, "setRecordName:", [v18 recordName]);
    if (a2)
    {
      -[NSManagedObject setRecordZoneName:](v9, "setRecordZoneName:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 48), "zoneID"), "zoneName"));
      v19 = *(void **)(a2 + 48);
    }
    else
    {
      -[NSManagedObject setRecordZoneName:](v9, "setRecordZoneName:", objc_msgSend((id)objc_msgSend(0, "zoneID"), "zoneName"));
      v19 = 0;
    }
    -[NSManagedObject setRecordZoneOwnerName:](v9, "setRecordZoneOwnerName:", objc_msgSend((id)objc_msgSend(v19, "zoneID"), "ownerName"));
    if (a2)
    {
      -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", [*(id *)(a2 + 56) recordName]);
      v20 = *(void **)(a2 + 56);
    }
    else
    {
      -[NSManagedObject setRelatedRecordName:](v9, "setRelatedRecordName:", [0 recordName]);
      v20 = 0;
    }
    -[NSManagedObject setRelatedRecordZoneName:](v9, "setRelatedRecordZoneName:", objc_msgSend((id)objc_msgSend(v20, "zoneID"), "zoneName"));
    if (a2)
    {
      -[NSManagedObject setRelatedRecordZoneOwnerName:](v9, "setRelatedRecordZoneOwnerName:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 56), "zoneID"), "ownerName"));
      uint64_t v15 = 16;
      goto LABEL_26;
    }
    -[NSManagedObject setRelatedRecordZoneOwnerName:](v9, "setRelatedRecordZoneOwnerName:", objc_msgSend((id)objc_msgSend(0, "zoneID"), "ownerName"));
LABEL_38:
    v21 = 0;
    goto LABEL_27;
  }
LABEL_28:
  [(NSManagedObject *)v9 setOperation:a3];
  [a5 assignObject:v9 toPersistentStore:a4];
  return v9;
}

+ (uint64_t)entityPath
{
  self;
  v0 = NSString;
  id v1 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  v2 = (objc_class *)objc_opt_class();
  return [v0 stringWithFormat:@"%@/%@", v1, NSStringFromClass(v2)];
}

@end