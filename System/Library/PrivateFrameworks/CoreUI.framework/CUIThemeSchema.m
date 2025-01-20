@interface CUIThemeSchema
+ (id)defaultSchema;
+ (id)schemaForPlatform:(int64_t)a3;
- (const)categoryForElementDefinition:(id *)a3;
- (const)effectDefinitionAtIndex:(unint64_t)a3;
- (const)effectDefinitionWithName:(id)a3;
- (const)elementCategoryAtIndex:(unint64_t)a3;
- (const)elementDefinitionAtIndex:(unint64_t)a3;
- (const)elementDefinitionWithName:(id)a3;
- (const)materialDefinitionAtIndex:(unint64_t)a3;
- (const)materialDefinitionWithName:(id)a3;
- (const)partDefinitionForWidgetName:(id)a3;
- (const)partDefinitionWithName:(id)a3 forElementDefinition:(id *)a4;
- (const)sortedEffectDefinitionAtIndex:(unint64_t)a3;
- (const)sortedElementDefinitionAtIndex:(unint64_t)a3;
- (const)sortedMaterialDefinitionAtIndex:(unint64_t)a3;
- (id)schemaEffectRenditionsForPartDefinition:(id *)a3;
- (id)schemaMaterialRenditionsForPartDefinition:(id *)a3;
- (id)schemaRenditionsForPartDefinition:(id *)a3;
- (id)widgetNameForPartDefinition:(id *)a3;
- (int64_t)schemaVersion;
- (unint64_t)dimensionDefinitionCountForPartDefinition:(id *)a3;
- (unint64_t)effectDefinitionCount;
- (unint64_t)elementCategoryCount;
- (unint64_t)elementDefinitionCount;
- (unint64_t)materialDefinitionCount;
- (unint64_t)partDefinitionCountForEffectDefinition:(id *)a3;
- (unint64_t)partDefinitionCountForElementDefinition:(id *)a3;
- (unint64_t)partDefinitionCountForMaterialDefinition:(id *)a3;
- (void)enumerateAvailableThemeAttributesInPartDefinition:(id *)a3 usingBlock:(id)a4;
- (void)enumerateAvailableValuesForThemeAttribute:(int)a3 inPartDefinition:(id *)a4 usingBlock:(id)a5;
@end

@implementation CUIThemeSchema

+ (id)defaultSchema
{
  uint64_t v3 = CUICurrentPlatform();
  return [a1 schemaForPlatform:v3];
}

+ (id)schemaForPlatform:(int64_t)a3
{
  if ((unint64_t)a3 > 5 || (id v6 = objc_alloc_init(*off_1E5A5CAB0[a3])) == 0)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"CUIThemeSchema.m", 123, @"[CUIThemeSchema schemaForPlatform:] got an unknown platform %d", a3 object file lineNumber description];
    id v6 = 0;
  }
  return v6;
}

- (int64_t)schemaVersion
{
  return 0;
}

- (const)elementCategoryAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)elementCategoryCount
{
  return 0;
}

- (const)elementDefinitionAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)elementDefinitionCount
{
  return 0;
}

- (const)sortedElementDefinitionAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)partDefinitionCountForElementDefinition:(id *)a3
{
  if (!a3) {
    return 0;
  }
  var4 = a3->var4;
  unint64_t result = -1;
  do
  {
    var0 = var4->var0;
    ++result;
    ++var4;
  }
  while (var0);
  return result;
}

- (unint64_t)dimensionDefinitionCountForPartDefinition:(id *)a3
{
  if (!a3) {
    return 0;
  }
  var5 = a3->var5;
  unint64_t result = -1;
  do
  {
    var0 = var5->var0;
    ++var5;
    ++result;
  }
  while (var0);
  return result;
}

- (const)elementDefinitionWithName:(id)a3
{
  return 0;
}

- (const)partDefinitionWithName:(id)a3 forElementDefinition:(id *)a4
{
  id v6 = (const char *)[a3 UTF8String];
  v13 = v6;
  if (!a4 || !v6) {
    [+[NSException exceptionWithName:NSInvalidArgumentException reason:@"element or part name is invalid" userInfo:0] raise];
  }
  var0 = a4->var4[0].var0;
  if (!var0) {
    goto LABEL_9;
  }
  v15 = (const $F3885B3EB9D075780A86CFBF71B132DC *)&a4[-1].var4[7].var2[4];
  do
  {
    int v16 = strcmp(var0, v13);
    v17 = v15 + 1;
    if (!v16) {
      break;
    }
    var0 = v15[2].var0;
    ++v15;
  }
  while (var0);
  if (v16)
  {
LABEL_9:
    _CUILog(1, (uint64_t)"Unable to find partDefinition for Name: %@", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    return 0;
  }
  return v17;
}

- (id)widgetNameForPartDefinition:(id *)a3
{
  return 0;
}

- (const)partDefinitionForWidgetName:(id)a3
{
  return 0;
}

- (id)schemaRenditionsForPartDefinition:(id *)a3
{
  return 0;
}

- (void)enumerateAvailableThemeAttributesInPartDefinition:(id *)a3 usingBlock:(id)a4
{
}

- (void)enumerateAvailableValuesForThemeAttribute:(int)a3 inPartDefinition:(id *)a4 usingBlock:(id)a5
{
}

- (const)categoryForElementDefinition:(id *)a3
{
  return 0;
}

- (const)effectDefinitionAtIndex:(unint64_t)a3
{
  return 0;
}

- (const)sortedEffectDefinitionAtIndex:(unint64_t)a3
{
  return 0;
}

- (const)effectDefinitionWithName:(id)a3
{
  return 0;
}

- (unint64_t)effectDefinitionCount
{
  return 0;
}

- (unint64_t)partDefinitionCountForEffectDefinition:(id *)a3
{
  if (!a3) {
    return 0;
  }
  var4 = a3->var4;
  unint64_t result = -1;
  do
  {
    var0 = var4->var0;
    ++result;
    ++var4;
  }
  while (var0);
  return result;
}

- (id)schemaEffectRenditionsForPartDefinition:(id *)a3
{
  return 0;
}

- (const)materialDefinitionAtIndex:(unint64_t)a3
{
  return 0;
}

- (const)sortedMaterialDefinitionAtIndex:(unint64_t)a3
{
  return 0;
}

- (const)materialDefinitionWithName:(id)a3
{
  return 0;
}

- (unint64_t)materialDefinitionCount
{
  return 0;
}

- (unint64_t)partDefinitionCountForMaterialDefinition:(id *)a3
{
  if (!a3) {
    return 0;
  }
  var4 = a3->var4;
  unint64_t result = -1;
  do
  {
    var0 = var4->var0;
    ++result;
    ++var4;
  }
  while (var0);
  return result;
}

- (id)schemaMaterialRenditionsForPartDefinition:(id *)a3
{
  return 0;
}

@end