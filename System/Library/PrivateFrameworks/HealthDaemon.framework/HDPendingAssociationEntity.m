@interface HDPendingAssociationEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)indices;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
@end

@implementation HDPendingAssociationEntity

+ (id)databaseTable
{
  return @"pending_associations";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_81;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"parent_uuid";
  v4[1] = @"child_uuid";
  v4[2] = @"destination_sub_uuid";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)indices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F65D28]);
  uint64_t v3 = objc_opt_class();
  v8 = @"child_uuid";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v5 = (void *)[v2 initWithEntity:v3 name:@"child" columns:v4];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v6;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

@end