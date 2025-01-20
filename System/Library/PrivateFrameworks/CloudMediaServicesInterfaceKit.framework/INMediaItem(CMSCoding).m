@interface INMediaItem(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INMediaItem(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3)
  {
    v5 = [v3 cmsOptionalStringForKey:@"identifier"];
    v6 = [v4 cmsOptionalStringForKey:@"title"];
    v7 = [v4 cmsOptionalStringForKey:@"type"];
    uint64_t v8 = INMediaItemTypeFromString(v7);

    v9 = [v4 cmsOptionalDecodedClass:objc_opt_class() forKey:@"artwork"];
    v10 = [v4 cmsOptionalStringForKey:@"artist"];
    v11 = (void *)[objc_alloc(MEMORY[0x263F0FC40]) initWithIdentifier:v5 title:v6 type:v8 artwork:v9 artist:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)cmsCoded
{
  v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v3 = [a1 identifier];
  [v2 cmsSetOptionalObject:v3 forKey:@"identifier"];

  v4 = INMediaItemTypeToString([a1 type]);
  [v2 cmsSetOptionalObject:v4 forKey:@"type"];

  return v2;
}

@end