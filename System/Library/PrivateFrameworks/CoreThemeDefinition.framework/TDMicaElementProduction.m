@interface TDMicaElementProduction
- (BOOL)generateRenditionsWithEntityName:(id)a3 document:(id)a4 errorDescription:(id *)a5;
- (id)associatedFileURLWithDocument:(id)a3;
- (id)baseKeySpec;
- (id)copyDataFromAttributes;
- (id)dataFromAttributes;
- (id)relativePath;
- (void)copyAttributesInto:(id)a3;
- (void)dealloc;
- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
- (void)setAttributesFromCopyData:(id)a3;
- (void)setAttributesFromData:(id)a3;
@end

@implementation TDMicaElementProduction

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TDMicaElementProduction;
  [(TDMicaElementProduction *)&v2 dealloc];
}

- (id)baseKeySpec
{
  [(TDMicaElementProduction *)self willAccessValueForKey:@"baseKeySpec"];
  v3 = (void *)[(TDMicaElementProduction *)self primitiveValueForKey:@"baseKeySpec"];
  [(TDMicaElementProduction *)self didAccessValueForKey:@"baseKeySpec"];
  return v3;
}

- (id)relativePath
{
  objc_super v2 = (void *)[(TDMicaElementProduction *)self asset];

  return (id)[v2 sourceRelativePath];
}

- (id)associatedFileURLWithDocument:(id)a3
{
  v4 = (void *)[(TDMicaElementProduction *)self asset];

  return (id)[v4 fileURLWithDocument:a3];
}

- (BOOL)generateRenditionsWithEntityName:(id)a3 document:(id)a4 errorDescription:(id *)a5
{
  return 1;
}

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend(a3, "deleteObjects:", objc_msgSend((id)-[TDMicaElementProduction renditions](self, "renditions"), "allObjects"));
  v7 = (void *)[(TDMicaElementProduction *)self asset];
  v8 = v7;
  if (v4)
  {
    v9 = (void *)[v7 fileURLWithDocument:a3];
    if ([v9 checkResourceIsReachableAndReturnError:0])
    {
      [a3 assetManagementDelegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "willDeleteAsset:atURL:", v8, v9);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v9, 0);
      [a3 assetManagementDelegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "didDeleteAssetAtURL:", v9);
      }
    }
  }

  [a3 deleteObject:v8];
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setRenditionType:", -[TDMicaElementProduction renditionType](self, "renditionType"));
  uint64_t v5 = [(TDMicaElementProduction *)self valueForKey:@"comment"];

  [a3 setValue:v5 forKey:@"comment"];
}

- (id)dataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
  BOOL v4 = (void *)[(TDMicaElementProduction *)self renditionType];
  if (v4) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), @"renditionType");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[TDMicaElementProduction baseKeySpec](self, "baseKeySpec"), "dataFromAttributes"), @"baseKeySpec");
  uint64_t v5 = (void *)MEMORY[0x263F08AC0];

  return (id)[v5 dataWithPropertyList:v3 format:200 options:0 error:0];
}

- (void)setAttributesFromData:(id)a3
{
  BOOL v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = (void *)[(TDMicaElementProduction *)self managedObjectContext];
  uint64_t v6 = [v4 objectForKey:@"baseKeySpec"];
  if (v6) {
    objc_msgSend(-[TDMicaElementProduction baseKeySpec](self, "baseKeySpec"), "setAttributesFromData:", v6);
  }
  uint64_t v7 = [v4 objectForKey:@"renditionType"];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v7)));
    [(TDMicaElementProduction *)self setRenditionType:v8];
  }
}

- (id)copyDataFromAttributes
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:14];
  uint64_t v4 = [(TDMicaElementProduction *)self valueForKey:@"comment"];
  if (v4) {
    [v3 setObject:v4 forKey:@"comment"];
  }
  uint64_t v5 = [(TDMicaElementProduction *)self valueForKey:@"isExcludedFromFilter"];
  if (v5) {
    [v3 setObject:v5 forKey:@"isExcludedFromFilter"];
  }
  uint64_t v6 = (void *)[(TDMicaElementProduction *)self valueForKey:@"renditionType"];
  if (v6) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "identifier")), @"renditionType");
  }
  uint64_t v7 = (void *)[(TDMicaElementProduction *)self valueForKey:@"renditionSubtype"];
  if (v7) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "identifier")), @"renditionSubtype");
  }
  uint64_t v8 = (void *)[(TDMicaElementProduction *)self valueForKey:@"baseKeySpec"];
  if (v8) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v8, "copyDataFromAttributes"), @"baseKeySpec");
  }
  v9 = (void *)[(TDMicaElementProduction *)self asset];
  if (v9) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v9, "copyDataFromAttributes"), @"asset");
  }
  v10 = (void *)[(TDMicaElementProduction *)self mutableSetValueForKey:@"renditions"];
  if ([v10 count])
  {
    v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = objc_msgSend(v10, "allObjects", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v11, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16++), "copyDataFromAttributes"));
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"renditions"];
  }
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = [v4 objectForKey:@"comment"];
  if (v5) {
    [(TDMicaElementProduction *)self setValue:v5 forKey:@"comment"];
  }
  uint64_t v6 = [v4 objectForKey:@"isExcludedFromFilter"];
  if (v6)
  {
    [(TDMicaElementProduction *)self setValue:v6 forKey:@"isExcludedFromFilter"];
  }
}

@end