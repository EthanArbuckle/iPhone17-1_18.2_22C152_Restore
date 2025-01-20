@interface TDSchemaElementProduction
- (id)associatedFileURLWithDocument:(id)a3;
- (id)relativePath;
- (void)generateNewRendition;
@end

@implementation TDSchemaElementProduction

- (id)relativePath
{
  return 0;
}

- (id)associatedFileURLWithDocument:(id)a3
{
  return 0;
}

- (void)generateNewRendition
{
  v3 = -[TDSchemaRenditionSpec initWithEntity:insertIntoManagedObjectContext:]([TDSchemaRenditionSpec alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDSchemaElementProduction entity](self, "entity"), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"SchemaRenditionSpec"), -[TDSchemaElementProduction managedObjectContext](self, "managedObjectContext"));
  [(TDSchemaElementProduction *)self addRenditionsObject:v3];

  [(TDRenditionSpec *)v3 resetToBaseKeySpec];
}

@end