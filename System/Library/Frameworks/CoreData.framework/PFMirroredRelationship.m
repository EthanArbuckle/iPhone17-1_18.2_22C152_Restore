@interface PFMirroredRelationship
+ (BOOL)isValidMirroredRelationshipRecord:(id)a3 values:(id)a4;
+ (PFMirroredManyToManyRelationship)mirroredRelationshipWithDeletedRecordType:(uint64_t)a3 recordID:(uint64_t)a4 andManagedObjectModel:;
+ (PFMirroredManyToManyRelationshipV2)mirroredRelationshipWithManyToManyRecord:(uint64_t)a3 values:(uint64_t)a4 andManagedObjectModel:;
+ (PFMirroredOneToManyRelationship)mirroredRelationshipWithManagedObject:(uint64_t)a3 withRecordID:(uint64_t)a4 relatedToObjectWithRecordID:(uint64_t)a5 byRelationship:;
- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5;
@end

@implementation PFMirroredRelationship

+ (PFMirroredOneToManyRelationship)mirroredRelationshipWithManagedObject:(uint64_t)a3 withRecordID:(uint64_t)a4 relatedToObjectWithRecordID:(uint64_t)a5 byRelationship:
{
  self;
  v9 = [[PFMirroredOneToManyRelationship alloc] initWithManagedObject:a2 withRecordName:a3 relatedToRecordWithRecordName:a4 byRelationship:a5];

  return v9;
}

+ (PFMirroredManyToManyRelationshipV2)mirroredRelationshipWithManyToManyRecord:(uint64_t)a3 values:(uint64_t)a4 andManagedObjectModel:
{
  self;
  if (objc_msgSend((id)objc_msgSend(a2, "recordType"), "hasPrefix:", @"CD_M2M_")) {
    v7 = -[PFMirroredManyToManyRelationship initWithRecordID:recordType:managedObjectModel:andType:]([PFMirroredManyToManyRelationship alloc], "initWithRecordID:recordType:managedObjectModel:andType:", [a2 recordID], objc_msgSend(a2, "recordType"), a4, 0);
  }
  else {
    v7 = [[PFMirroredManyToManyRelationshipV2 alloc] initWithRecord:a2 andValues:a3 withManagedObjectModel:a4 andType:0];
  }

  return v7;
}

+ (PFMirroredManyToManyRelationship)mirroredRelationshipWithDeletedRecordType:(uint64_t)a3 recordID:(uint64_t)a4 andManagedObjectModel:
{
  self;
  v7 = [[PFMirroredManyToManyRelationship alloc] initWithRecordID:a3 recordType:a2 managedObjectModel:a4 andType:1];

  return v7;
}

- (BOOL)updateRelationshipValueUsingImportContext:(id)a3 andManagedObjectContext:(id)a4 error:(id *)a5
{
  return 0;
}

+ (BOOL)isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  int v6 = objc_msgSend((id)objc_msgSend(a3, "recordType"), "hasPrefix:", @"CD_M2M_");
  v7 = off_1E544B188;
  if (!v6) {
    v7 = off_1E544B190;
  }
  v8 = *v7;

  return [(__objc2_class *)v8 _isValidMirroredRelationshipRecord:a3 values:a4];
}

@end