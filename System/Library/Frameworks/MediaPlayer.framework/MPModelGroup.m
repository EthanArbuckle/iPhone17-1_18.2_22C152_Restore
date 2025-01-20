@interface MPModelGroup
+ (id)__title_KEY;
+ (id)kind;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyKeyGroupTitle__MAPPING_MISSING__;
- (id)humanDescription;
@end

@implementation MPModelGroup

+ (id)__title_KEY
{
  return @"MPModelPropertyKeyGroupTitle";
}

- (id)humanDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(MPModelObject *)self identifiers];
  v5 = [v4 humanDescription];
  v6 = [v3 stringWithFormat:@"group %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyKeyGroupTitle"])
  {
    v7 = NSString;
    v8 = [(MPModelGroup *)self title];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyKeyGroupTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGroup.m" lineNumber:38 description:@"Translator was missing mapping for MPModelPropertyKeyGroupTitle"];
}

+ (id)kind
{
  return +[MPModelGroupKind identityKind];
}

+ (int64_t)genericObjectType
{
  return 21;
}

@end