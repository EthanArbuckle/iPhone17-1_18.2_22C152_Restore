@interface EKPersistentAttachment
+ (Class)meltedClass;
+ (id)propertiesToUnloadOnCommit;
+ (id)propertyKeyForUniqueIdentifier;
+ (id)relations;
- (BOOL)shouldSetQuarantineAttributesOnCopiedFile;
- (id)URLString;
- (id)UUID;
- (id)XPropertiesData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)externalID;
- (id)externalModificationTag;
- (id)fileFormat;
- (id)fileNameRaw;
- (id)fileSize;
- (id)localRelativePath;
- (id)securityScopedLocalURLForArchivedDataWrapper;
- (id)securityScopedLocalURLWrapper;
- (id)securityScopedURLWrapperForPendingFileCopy;
- (int)entityType;
- (int)flags;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setFileFormat:(id)a3;
- (void)setFileNameRaw:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setFlags:(int)a3;
- (void)setLocalRelativePath:(id)a3;
- (void)setSecurityScopedLocalURLForArchivedDataWrapper:(id)a3;
- (void)setSecurityScopedLocalURLWrapper:(id)a3;
- (void)setSecurityScopedURLWrapperForPendingFileCopy:(id)a3;
- (void)setShouldSetQuarantineAttributesOnCopiedFile:(BOOL)a3;
- (void)setURLString:(id)a3;
- (void)setUUID:(id)a3;
- (void)setXPropertiesData:(id)a3;
@end

@implementation EKPersistentAttachment

+ (id)relations
{
  if (relations_onceToken_5 != -1) {
    dispatch_once(&relations_onceToken_5, &__block_literal_global_21);
  }
  v2 = (void *)relations_relations_5;

  return v2;
}

void __35__EKPersistentAttachment_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56BA0]];
  v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations_5;
  relations_relations_5 = v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E4F57150];
}

+ (id)propertiesToUnloadOnCommit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__EKPersistentAttachment_propertiesToUnloadOnCommit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToUnloadOnCommit_onceToken != -1) {
    dispatch_once(&propertiesToUnloadOnCommit_onceToken, block);
  }
  uint64_t v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;

  return v2;
}

void __52__EKPersistentAttachment_propertiesToUnloadOnCommit__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentAttachment;
  uint64_t v1 = objc_msgSendSuper2(&v7, sel_propertiesToUnloadOnCommit);
  uint64_t v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit = v1;

  v3 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
  v8[0] = *MEMORY[0x1E4F56B38];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
  v6 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit = v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(EKPersistentAttachment);
  uint64_t v5 = [(EKPersistentAttachment *)self UUID];
  [(EKPersistentAttachment *)v4 setUUID:v5];

  v6 = [(EKPersistentAttachment *)self URLString];
  [(EKPersistentAttachment *)v4 setURLString:v6];

  objc_super v7 = [(EKPersistentAttachment *)self fileNameRaw];
  [(EKPersistentAttachment *)v4 setFileNameRaw:v7];

  v8 = [(EKPersistentAttachment *)self fileFormat];
  [(EKPersistentAttachment *)v4 setFileFormat:v8];

  [(EKPersistentAttachment *)v4 setFlags:[(EKPersistentAttachment *)self flags]];
  v9 = [(EKPersistentAttachment *)self localRelativePath];
  [(EKPersistentAttachment *)v4 setLocalRelativePath:v9];

  v10 = [(EKPersistentAttachment *)self fileSize];
  [(EKPersistentAttachment *)v4 setFileSize:v10];

  v11 = [(EKPersistentAttachment *)self XPropertiesData];
  [(EKPersistentAttachment *)v4 setXPropertiesData:v11];

  v12 = [(EKPersistentAttachment *)self externalID];
  [(EKPersistentAttachment *)v4 setExternalID:v12];

  v13 = [(EKPersistentAttachment *)self securityScopedURLWrapperForPendingFileCopy];
  [(EKPersistentAttachment *)v4 setSecurityScopedURLWrapperForPendingFileCopy:v13];

  [(EKPersistentAttachment *)v4 setShouldSetQuarantineAttributesOnCopiedFile:[(EKPersistentAttachment *)self shouldSetQuarantineAttributesOnCopiedFile]];
  v14 = [(EKPersistentAttachment *)self securityScopedLocalURLWrapper];
  [(EKPersistentAttachment *)v4 setSecurityScopedLocalURLWrapper:v14];

  return v4;
}

- (int)entityType
{
  return 11;
}

- (id)URLString
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56AE8]];
}

- (void)setURLString:(id)a3
{
}

- (id)externalModificationTag
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56AF8]];
}

- (void)setExternalModificationTag:(id)a3
{
}

- (id)fileNameRaw
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56B08]];
}

- (void)setFileNameRaw:(id)a3
{
}

- (id)fileFormat
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56B00]];
}

- (void)setFileFormat:(id)a3
{
}

- (int)flags
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56B18]];
}

- (void)setFlags:(int)a3
{
}

- (id)localRelativePath
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F56B20]];
}

- (void)setLocalRelativePath:(id)a3
{
}

- (id)securityScopedLocalURLWrapper
{
  return [(EKPersistentObject *)self primitiveSecurityScopedURLWrapperValueForKey:*MEMORY[0x1E4F56B30]];
}

- (void)setSecurityScopedLocalURLWrapper:(id)a3
{
}

- (id)securityScopedLocalURLForArchivedDataWrapper
{
  return [(EKPersistentObject *)self primitiveSecurityScopedURLWrapperValueForKey:*MEMORY[0x1E4F56B28]];
}

- (void)setSecurityScopedLocalURLForArchivedDataWrapper:(id)a3
{
}

- (id)fileSize
{
  return [(EKPersistentObject *)self primitiveNumberValueForKey:*MEMORY[0x1E4F56B10]];
}

- (void)setFileSize:(id)a3
{
}

- (id)UUID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57150]];
}

- (void)setUUID:(id)a3
{
}

- (id)XPropertiesData
{
  return [(EKPersistentObject *)self primitiveDataValueForKey:*MEMORY[0x1E4F56AF0]];
}

- (void)setXPropertiesData:(id)a3
{
}

- (id)externalID
{
  return [(EKPersistentObject *)self primitiveStringValueForKey:*MEMORY[0x1E4F57158]];
}

- (void)setExternalID:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(EKPersistentAttachment *)self URLString];
  v6 = [(EKPersistentAttachment *)self fileNameRaw];
  objc_super v7 = [(EKPersistentAttachment *)self fileFormat];
  v8 = [(EKPersistentAttachment *)self fileSize];
  uint64_t v9 = [v8 unsignedLongValue];
  v10 = [(EKPersistentAttachment *)self localRelativePath];
  v11 = [(EKPersistentAttachment *)self UUID];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {URLString = %@; fileName = %@; fileFormat = %@; fileSize = %lu; localRelativePath = %@; UUID = %@;}",
    v4,
    self,
    v5,
    v6,
    v7,
    v9,
    v10,
  v12 = v11);

  return v12;
}

- (id)securityScopedURLWrapperForPendingFileCopy
{
  return [(EKPersistentObject *)self primitiveSecurityScopedURLWrapperValueForKey:*MEMORY[0x1E4F56B38]];
}

- (void)setSecurityScopedURLWrapperForPendingFileCopy:(id)a3
{
}

- (BOOL)shouldSetQuarantineAttributesOnCopiedFile
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56B40]];
}

- (void)setShouldSetQuarantineAttributesOnCopiedFile:(BOOL)a3
{
}

@end