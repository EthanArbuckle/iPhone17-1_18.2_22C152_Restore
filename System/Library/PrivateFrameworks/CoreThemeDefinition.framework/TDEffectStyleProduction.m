@interface TDEffectStyleProduction
- (id)associatedFileModificationDateWithDocument:(id)a3;
- (id)displayName;
- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4;
- (void)generateRenditionsWithDocument:(id)a3;
@end

@implementation TDEffectStyleProduction

- (void)generateRenditionsWithDocument:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  obuint64_t j = (id)objc_msgSend((id)-[TDEffectStyleProduction partDefinition](self, "partDefinition"), "renditions");
  v39 = self;
  if (objc_msgSend((id)-[TDEffectStyleProduction renditions](self, "renditions"), "count"))
  {
    NSLog(&cfstr_DeletingExisti.isa);
    v5 = (void *)[(TDEffectStyleProduction *)self managedObjectContext];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v6 = (void *)[(TDEffectStyleProduction *)self renditions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v51 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 deleteObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v8);
    }
  }
  v40 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(obj, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v47;
    unint64_t v14 = 0x263F08000uLL;
    uint64_t v33 = *(void *)v47;
    do
    {
      uint64_t v15 = 0;
      uint64_t v34 = v12;
      do
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
        uint64_t v38 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDEffectStyleProduction entity](v39, "entity", v33), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"EffectRenditionSpec");
        v17 = [[TDEffectRenditionSpec alloc] initWithEntity:v38 insertIntoManagedObjectContext:[(TDEffectStyleProduction *)v39 managedObjectContext]];
        v18 = v17;
        [(TDEffectRenditionSpec *)v17 setProduction:v39];
        [(TDRenditionSpec *)v17 resetToBaseKeySpec];
        v19 = (void *)[(TDEffectRenditionSpec *)v17 keySpec];
        objc_msgSend(v19, "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v16, "key"), a3);
        v20 = (void *)[v16 effectPreset];
        v21 = *(void **)(v14 + 2584);
        [v20 effectScale];
        *(float *)&double v22 = v22;
        -[TDEffectRenditionSpec setEffectScale:](v17, "setEffectScale:", [v21 numberWithFloat:v22]);
        v37 = v20;
        [(TDEffectRenditionSpec *)v17 setComponentsFromEffectPreset:v20 withDocument:a3];
        if (objc_msgSend((id)objc_msgSend(a3, "catalogGlobals"), "supportsMultipleAppearancesForEffects"))
        {
          uint64_t v36 = v15;
          uint64_t v45 = 0;
          id v23 = a3;
          v24 = (void *)[a3 allObjectsForEntity:@"Appearance" withSortDescriptors:0 error:&v45];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v25 = v24;
          uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v42 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * j);
                v31 = v17;
                if ([v19 appearance])
                {
                  v31 = [[TDEffectRenditionSpec alloc] initWithEntity:v38 insertIntoManagedObjectContext:[(TDEffectStyleProduction *)v39 managedObjectContext]];
                  [(TDEffectRenditionSpec *)v31 setProduction:v39];
                  [(TDRenditionSpec *)v31 resetToBaseKeySpec];
                  objc_msgSend(v19, "copyAttributesInto:", -[TDEffectRenditionSpec keySpec](v31, "keySpec"));
                  [(TDEffectRenditionSpec *)v31 setEffectScale:[(TDEffectRenditionSpec *)v17 effectScale]];
                  [(TDEffectRenditionSpec *)v31 setComponentsFromEffectPreset:v37 withDocument:v23];
                  v32 = v31;
                }
                objc_msgSend((id)-[TDEffectRenditionSpec keySpec](v31, "keySpec"), "setAppearance:", v30);
                [v40 addObject:v31];
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v27);
          }
          a3 = v23;
          uint64_t v13 = v33;
          uint64_t v12 = v34;
          unint64_t v14 = 0x263F08000;
          uint64_t v15 = v36;
        }
        else
        {
          [v40 addObject:v17];
        }
        ++v15;
      }
      while (v15 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v12);
  }
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  return 0;
}

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  uint64_t v5 = objc_msgSend((id)-[TDEffectStyleProduction renditions](self, "renditions", a3, a4), "allObjects");

  [a3 deleteObjects:v5];
}

- (id)displayName
{
  if (![(TDEffectStyleProduction *)self name]) {
    return (id)[NSString stringWithFormat:@"Effect: %@ – %@", objc_msgSend((id)objc_msgSend((id)-[TDEffectStyleProduction baseKeySpec](self, "baseKeySpec"), "element"), "displayName"), objc_msgSend((id)objc_msgSend((id)-[TDEffectStyleProduction baseKeySpec](self, "baseKeySpec"), "part"), "displayName")];
  }
  v3 = (void *)[(TDEffectStyleProduction *)self name];

  return (id)[v3 name];
}

@end