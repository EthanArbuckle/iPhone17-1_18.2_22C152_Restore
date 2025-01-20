@interface MPModelPerson
+ (id)__hasSocialPosts_KEY;
+ (id)__name_KEY;
+ (void)__MPModelPropertyPersonHasSocialPosts__MAPPING_MISSING__;
+ (void)__MPModelPropertyPersonName__MAPPING_MISSING__;
@end

@implementation MPModelPerson

+ (id)__name_KEY
{
  return @"MPModelPropertyPersonName";
}

+ (id)__hasSocialPosts_KEY
{
  return @"MPModelPropertyPersonHasSocialPosts";
}

+ (void)__MPModelPropertyPersonHasSocialPosts__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPerson.m" lineNumber:18 description:@"Translator was missing mapping for MPModelPropertyPersonHasSocialPosts"];
}

+ (void)__MPModelPropertyPersonName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPerson.m" lineNumber:17 description:@"Translator was missing mapping for MPModelPropertyPersonName"];
}

@end