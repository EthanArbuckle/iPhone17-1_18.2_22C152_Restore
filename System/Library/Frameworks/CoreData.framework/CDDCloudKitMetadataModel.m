@interface CDDCloudKitMetadataModel
+ (id)newMetadataModel;
+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:;
+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:;
@end

@implementation CDDCloudKitMetadataModel

+ (id)newMetadataModel
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(NSManagedObjectModel);
  v3 = objc_alloc_init(NSEntityDescription);
  v4 = (objc_class *)objc_opt_class();
  [(NSEntityDescription *)v3 setName:NSStringFromClass(v4)];
  [(NSEntityDescription *)v3 setManagedObjectClassName:[(NSEntityDescription *)v3 name]];
  v16[0] = @"bundleIdentifier";
  v16[1] = @"storePath";
  v17[0] = &unk_1ED7E9820;
  v17[1] = &unk_1ED7E9838;
  v16[2] = @"fileProtectionType";
  v15[0] = &unk_1ED7E2950;
  v15[1] = MEMORY[0x1E4F1CC28];
  v15[2] = *MEMORY[0x1E4F28378];
  v17[2] = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v17[3] = &unk_1ED7E9850;
  v16[3] = @"storeConfigurationName";
  v16[4] = @"containerIdentifier";
  v17[4] = &unk_1ED7E9868;
  +[CDDCloudKitMetadataModel addAttributes:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5], v3);
  v5 = objc_alloc_init(NSEntityDescription);
  v6 = (objc_class *)objc_opt_class();
  [(NSEntityDescription *)v5 setName:NSStringFromClass(v6)];
  [(NSEntityDescription *)v5 setManagedObjectClassName:[(NSEntityDescription *)v5 name]];
  +[CDDCloudKitMetadataModel addAttributes:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, &unk_1ED7E22F8, v5);
  v13 = @"registeredClient";
  v12[0] = &unk_1ED7E29C8;
  v12[1] = v3;
  v12[2] = [MEMORY[0x1E4F1CA98] null];
  v12[3] = &unk_1ED7E29E0;
  v12[4] = &unk_1ED7E29F8;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  +[CDDCloudKitMetadataModel addRelationships:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1], v5);
  v9[4] = &unk_1ED7E29C8;
  v10 = @"scheduledActivities";
  v9[0] = &unk_1ED7E29F8;
  v9[1] = v5;
  v9[2] = @"registeredClient";
  v9[3] = &unk_1ED7E2A10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  +[CDDCloudKitMetadataModel addRelationships:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1], v3);
  v8[0] = v3;
  v8[1] = v5;
  -[NSManagedObjectModel setEntities:](v2, "setEntities:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2]);

  return v2;
}

+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:
{
  self;
  v5 = objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CDDCloudKitMetadataModel_addAttributes_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_1E544C920;
  v6[4] = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
  [a3 setProperties:v5];
}

+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:
{
  self;
  v5 = objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CDDCloudKitMetadataModel_addRelationships_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_1E544C920;
  v6[4] = v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v6];
  [a3 setProperties:v5];
}

void __63__CDDCloudKitMetadataModel_addAttributes_toPropertiesOfEntity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8 = objc_alloc_init(NSAttributeDescription);
  [(NSPropertyDescription *)v8 setName:a2];
  -[NSAttributeDescription setAttributeType:](v8, "setAttributeType:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "unsignedIntegerValue"));
  if ([(NSAttributeDescription *)v8 attributeType] == NSTransformableAttributeType) {
    [(NSAttributeDescription *)v8 setValueTransformerName:+[NSCloudKitMirroringDelegate cloudKitMetadataTransformerName]];
  }
  if ((unint64_t)[a3 count] >= 2)
  {
    -[NSPropertyDescription setOptional:](v8, "setOptional:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "BOOLValue"));
    if ((unint64_t)[a3 count] >= 3)
    {
      uint64_t v6 = [(NSAttributeDescription *)v8 attributeType];
      uint64_t v7 = [a3 objectAtIndex:2];
      if (v6 == 1800) {
        [(NSAttributeDescription *)v8 setAttributeValueClassName:v7];
      }
      else {
        [(NSAttributeDescription *)v8 setDefaultValue:v7];
      }
    }
  }
  [*(id *)(a1 + 32) addObject:v8];
}

void __66__CDDCloudKitMetadataModel_addRelationships_toPropertiesOfEntity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = objc_alloc_init(NSRelationshipDescription);
  [(NSPropertyDescription *)v7 setName:a2];
  -[NSRelationshipDescription setMaxCount:](v7, "setMaxCount:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "unsignedIntegerValue"));
  -[NSRelationshipDescription setDestinationEntity:](v7, "setDestinationEntity:", [a3 objectAtIndex:1]);
  if ((unint64_t)[a3 count] >= 3)
  {
    uint64_t v6 = [a3 objectAtIndex:2];
    if (v6 != [MEMORY[0x1E4F1CA98] null])
    {
      [(NSRelationshipDescription *)v7 setInverseRelationship:[(NSDictionary *)[(NSEntityDescription *)[(NSRelationshipDescription *)v7 destinationEntity] relationshipsByName] objectForKey:v6]];
      if ([(NSRelationshipDescription *)v7 inverseRelationship]) {
        [[(NSRelationshipDescription *)v7 inverseRelationship] setInverseRelationship:v7];
      }
    }
    if ((unint64_t)[a3 count] >= 4)
    {
      -[NSRelationshipDescription setDeleteRule:](v7, "setDeleteRule:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "unsignedIntegerValue"));
      if ((unint64_t)[a3 count] >= 5) {
        -[NSPropertyDescription setOptional:](v7, "setOptional:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "BOOLValue"));
      }
    }
  }
  [*(id *)(a1 + 32) addObject:v7];
}

@end