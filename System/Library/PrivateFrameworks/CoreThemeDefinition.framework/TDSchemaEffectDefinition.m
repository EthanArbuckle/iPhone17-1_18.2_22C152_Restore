@interface TDSchemaEffectDefinition
+ (const)elementDefinitionWithName:(id)a3 withSchema:(id)a4;
+ (const)sortedElementDefinitionAtIndex:(unint64_t)a3 withSchema:(id)a4;
+ (unint64_t)elementDefinitionCountWithSchema:(id)a3;
@end

@implementation TDSchemaEffectDefinition

+ (unint64_t)elementDefinitionCountWithSchema:(id)a3
{
  return [a3 effectDefinitionCount];
}

+ (const)sortedElementDefinitionAtIndex:(unint64_t)a3 withSchema:(id)a4
{
  return (const $A3BFAB32BE8B8144AB428F242CA2D26A *)[a4 sortedEffectDefinitionAtIndex:a3];
}

+ (const)elementDefinitionWithName:(id)a3 withSchema:(id)a4
{
  return (const $A3BFAB32BE8B8144AB428F242CA2D26A *)[a4 effectDefinitionWithName:a3];
}

@end