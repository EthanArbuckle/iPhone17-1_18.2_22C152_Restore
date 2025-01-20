@interface PFMirroredManyToManyRelationshipV2
+ (BOOL)_isValidMirroredRelationshipRecord:(id)a3 values:(id)a4;
- (PFMirroredManyToManyRelationshipV2)initWithRecord:(id)a3 andValues:(id)a4 withManagedObjectModel:(id)a5 andType:(unint64_t)a6;
- (PFMirroredManyToManyRelationshipV2)initWithRecordID:(id)a3 forRecordWithID:(id)a4 relatedToRecordWithID:(id)a5 byRelationship:(id)a6 withInverse:(id)a7 andType:(unint64_t)a8;
- (void)populateRecordValues:(id)a3;
@end

@implementation PFMirroredManyToManyRelationshipV2

- (PFMirroredManyToManyRelationshipV2)initWithRecordID:(id)a3 forRecordWithID:(id)a4 relatedToRecordWithID:(id)a5 byRelationship:(id)a6 withInverse:(id)a7 andType:(unint64_t)a8
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)PFMirroredManyToManyRelationshipV2;
  v14 = [(PFMirroredManyToManyRelationshipV2 *)&v25 init];
  if (v14)
  {
    v26[0] = a6;
    v26[1] = a7;
    v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    self;
    v16 = (void *)[v15 mutableCopy];
    [v16 sortUsingComparator:&__block_literal_global_21];
    v17 = (void *)[v16 copy];

    if ((id)[v17 objectAtIndex:0] == a6)
    {
      v18 = v14;
      id v19 = a3;
      id v20 = a4;
      id v21 = a5;
      id v22 = a6;
      id v23 = a7;
    }
    else
    {
      v18 = v14;
      id v19 = a3;
      id v20 = a5;
      id v21 = a4;
      id v22 = a7;
      id v23 = a6;
    }
    -[PFMirroredManyToManyRelationship _setManyToManyRecordID:manyToManyRecordType:ckRecordID:relatedCKRecordID:relationshipDescription:inverseRelationshipDescription:type:](v18, v19, @"CDMR", v20, v21, v22, v23, a8);
  }
  return v14;
}

- (PFMirroredManyToManyRelationshipV2)initWithRecord:(id)a3 andValues:(id)a4 withManagedObjectModel:(id)a5 andType:(unint64_t)a6
{
  v22.receiver = self;
  v22.super_class = (Class)PFMirroredManyToManyRelationshipV2;
  v10 = [(PFMirroredManyToManyRelationshipV2 *)&v22 init];
  if (v10)
  {
    v11 = (void *)[a4 objectForKey:@"CD_recordNames"];
    self;
    v12 = (void *)[v11 componentsSeparatedByString:@":"];
    if ([v12 count] == 2) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    v14 = (void *)[a4 objectForKey:@"CD_relationships"];
    self;
    v15 = (void *)[v14 componentsSeparatedByString:@":"];
    if ([v15 count] != 2) {
      v15 = 0;
    }
    v16 = (void *)[a4 objectForKey:@"CD_entityNames"];
    self;
    v17 = (void *)[v16 componentsSeparatedByString:@":"];
    if ([v17 count] == 2) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v13, "objectAtIndex:", 0), objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    id v20 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v13, "objectAtIndex:", 1), objc_msgSend((id)objc_msgSend(a3, "recordID"), "zoneID"));
    -[PFMirroredManyToManyRelationship _setManyToManyRecordID:manyToManyRecordType:ckRecordID:relatedCKRecordID:relationshipDescription:inverseRelationshipDescription:type:](v10, (void *)[a3 recordID], objc_msgSend(a3, "recordType"), v19, v20, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "entitiesByName"), "objectForKey:", objc_msgSend(v18, "objectAtIndex:", 0)), "relationshipsByName"), "objectForKey:", objc_msgSend(v15, "objectAtIndex:", 0)), objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "entitiesByName"), "objectForKey:",
                            [v18 objectAtIndex:1]),
                      "relationshipsByName"),
                "objectForKey:",
                [v15 objectAtIndex:1]),
      a6);
  }
  return v10;
}

- (void)populateRecordValues:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v5 = [(CKRecordID *)self->super._ckRecordID recordName];
    relatedCKRecordID = self->super._relatedCKRecordID;
  }
  else
  {
    v5 = (NSString *)[0 recordName];
    relatedCKRecordID = 0;
  }
  v16[0] = v5;
  v16[1] = [relatedCKRecordID recordName];
  v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  self;
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v7, "componentsJoinedByString:", @":"), @"CD_recordNames");
  if (self)
  {
    v8 = [(NSPropertyDescription *)self->super._relationshipDescription name];
    inverseRelationshipDescription = self->super._inverseRelationshipDescription;
  }
  else
  {
    v8 = (NSString *)[0 name];
    inverseRelationshipDescription = 0;
  }
  v15[0] = v8;
  v15[1] = [(NSPropertyDescription *)inverseRelationshipDescription name];
  v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  self;
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v10, "componentsJoinedByString:", @":"), @"CD_relationships");
  if (self)
  {
    v11 = [(NSEntityDescription *)[(NSPropertyDescription *)self->super._relationshipDescription entity] name];
    v12 = self->super._inverseRelationshipDescription;
  }
  else
  {
    v11 = (NSString *)objc_msgSend((id)objc_msgSend(0, "entity"), "name");
    v12 = 0;
  }
  v14[0] = v11;
  v14[1] = [(NSEntityDescription *)[(NSPropertyDescription *)v12 entity] name];
  v13 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  self;
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v13, "componentsJoinedByString:", @":"), @"CD_entityNames");
}

+ (BOOL)_isValidMirroredRelationshipRecord:(id)a3 values:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CD_recordNames"), "length");
  if (v5)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CD_relationships"), "length");
    if (v5) {
      LOBYTE(v5) = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CD_entityNames"), "length") != 0;
    }
  }
  return v5;
}

@end