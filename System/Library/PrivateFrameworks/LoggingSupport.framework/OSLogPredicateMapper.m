@interface OSLogPredicateMapper
@end

@implementation OSLogPredicateMapper

void __38___OSLogPredicateMapper_validKeyPaths__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)validKeyPaths__validKeyPaths;
  validKeyPaths__validKeyPaths = (uint64_t)v0;

  unsigned int outCount = 0;
  v2 = protocol_copyPropertyList((Protocol *)&unk_1EF44CA28, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      unsigned int v9 = 0;
      v4 = property_copyAttributeList(v2[i], &v9);
      if (v9)
      {
        unint64_t v5 = 0;
        uint64_t v6 = 16 * v9;
        while (strcmp(v4[v5 / 0x10].name, "R"))
        {
          v5 += 16;
          if (v6 == v5) {
            goto LABEL_7;
          }
        }
        free(v4);
        v7 = (void *)validKeyPaths__validKeyPaths;
        v8 = [NSString stringWithUTF8String:property_getName(v2[i])];
        [v7 addObject:v8];
      }
      else
      {
LABEL_7:
        free(v4);
      }
    }
  }
  free(v2);
}

void __62___OSLogPredicateMapper_mapLeftExpression_andRightExpression___block_invoke()
{
  id v0 = (void *)mapLeftExpression_andRightExpression__keypathMaps;
  mapLeftExpression_andRightExpression__keypathMaps = (uint64_t)&unk_1EF44B010;
}

void __51___OSLogPredicateMapper_mapSignpostTypeExpression___block_invoke()
{
  id v0 = (void *)mapSignpostTypeExpression__types;
  mapSignpostTypeExpression__types = (uint64_t)&unk_1EF44AFE8;
}

void __52___OSLogPredicateMapper_mapSignpostScopeExpression___block_invoke()
{
  id v0 = (void *)mapSignpostScopeExpression__scopes;
  mapSignpostScopeExpression__scopes = (uint64_t)&unk_1EF44AFC0;
}

void __50___OSLogPredicateMapper_mapMessageTypeExpression___block_invoke()
{
  id v0 = (void *)mapMessageTypeExpression__messageTypes;
  mapMessageTypeExpression__messageTypes = (uint64_t)&unk_1EF44AF98;
}

void __48___OSLogPredicateMapper_mapEventTypeExpression___block_invoke()
{
  id v0 = (void *)mapEventTypeExpression__eventTypes;
  mapEventTypeExpression__eventTypes = (uint64_t)&unk_1EF44AF70;
}

@end