@interface TDSchemaDefinition
+ (const)elementDefinitionWithName:(id)a3 withSchema:(id)a4;
+ (const)sortedElementDefinitionAtIndex:(unint64_t)a3 withSchema:(id)a4;
+ (unint64_t)elementDefinitionCountWithSchema:(id)a3;
- (id)displayName;
- (id)previewImage;
@end

@implementation TDSchemaDefinition

- (id)previewImage
{
  id result = (id)objc_msgSend((id)-[TDSchemaDefinition parts](self, "parts"), "count");
  if (result)
  {
    v4 = objc_msgSend((id)-[TDSchemaDefinition parts](self, "parts"), "anyObject");
    return (id)[v4 previewImage];
  }
  return result;
}

- (id)displayName
{
  int64_t v3 = +[CoreThemeDocument targetPlatformForMOC:[(TDSchemaDefinition *)self managedObjectContext]];
  id result = (id)objc_msgSend((id)objc_opt_class(), "elementDefinitionWithName:withSchema:", -[TDSchemaDefinition name](self, "name"), objc_msgSend(MEMORY[0x263F383D0], "schemaForPlatform:", v3));
  if (result)
  {
    uint64_t v5 = *((void *)result + 1);
    v6 = NSString;
    return (id)[v6 stringWithUTF8String:v5];
  }
  return result;
}

+ (unint64_t)elementDefinitionCountWithSchema:(id)a3
{
  return 0;
}

+ (const)sortedElementDefinitionAtIndex:(unint64_t)a3 withSchema:(id)a4
{
  return 0;
}

+ (const)elementDefinitionWithName:(id)a3 withSchema:(id)a4
{
  return 0;
}

@end