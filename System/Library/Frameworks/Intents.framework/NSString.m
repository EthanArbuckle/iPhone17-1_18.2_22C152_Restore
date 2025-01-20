@interface NSString
@end

@implementation NSString

void __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsStrings__block_invoke()
{
  id v0 = &unk_1EDBAC6C0;
  v1 = objc_msgSend(&unk_1EDBAC6C0, "if_compactMap:", &__block_literal_global_12);
  v2 = (void *)[v1 mutableCopy];
  [v2 addObjectsFromArray:&unk_1EDBAB328];
  v3 = (void *)[v2 copy];

  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  v5 = (void *)_intents_allowedUnarchiverClassesForProtoAsStrings___classesAsStrings;
  _intents_allowedUnarchiverClassesForProtoAsStrings___classesAsStrings = v4;
}

id __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsStrings__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKey:@"ObjCCollectionType"];
  if ((v3
     || ([v2 objectForKey:@"ObjCType"], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    && ((uint64_t v4 = [v3 rangeOfString:@"<"], v4 != 0x7FFFFFFFFFFFFFFFLL)
     || ([MEMORY[0x1E4F28B88] whitespaceCharacterSet],
         v5 = objc_claimAutoreleasedReturnValue(),
         uint64_t v4 = [v3 rangeOfCharacterFromSet:v5],
         v5,
         v4 != 0x7FFFFFFFFFFFFFFFLL)))
  {
    v6 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, objc_msgSend(v3, "length") - v4, &stru_1EDA6DB28);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsClasses__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "_intents_allowedUnarchiverClassesForProtoAsStrings");
  id v5 = [v1 allObjects];

  id v2 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_94086);
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
  uint64_t v4 = (void *)_intents_allowedUnarchiverClassesForProtoAsClasses___allowedClasses;
  _intents_allowedUnarchiverClassesForProtoAsClasses___allowedClasses = v3;
}

Class __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsClasses__block_invoke_2(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

@end