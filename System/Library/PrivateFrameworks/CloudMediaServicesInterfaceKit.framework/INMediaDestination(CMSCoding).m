@interface INMediaDestination(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INMediaDestination(CMSCoding)

- (id)cmsCoded
{
  v15[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = [a1 mediaDestinationType];
  if (v2 == 2)
  {
    v14[0] = @"mediaDestinationType";
    v14[1] = @"playlistName";
    v15[0] = @"playlist";
    uint64_t v3 = [a1 playlistName];
    v4 = (void *)v3;
    v5 = &stru_26DE5AB78;
    if (v3) {
      v5 = (__CFString *)v3;
    }
    v15[1] = v5;
    v6 = NSDictionary;
    v7 = (void **)v15;
    v8 = (__CFString **)v14;
    uint64_t v9 = 2;
  }
  else
  {
    v12 = @"mediaDestinationType";
    v4 = INMediaDestinationTypeToString(v2);
    v13 = v4;
    v6 = NSDictionary;
    v7 = &v13;
    v8 = &v12;
    uint64_t v9 = 1;
  }
  v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:v9];

  return v10;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  uint64_t v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3)
  {
    v5 = [v3 cmsOptionalStringForKey:@"mediaDestinationType"];
    uint64_t v6 = INMediaDestinationTypeFromString(v5);

    if (v6 == 1)
    {
      v7 = [MEMORY[0x263F0FC28] libraryDestination];
    }
    else
    {
      uint64_t v8 = [v4 cmsOptionalStringForKey:@"playlistName"];
      uint64_t v9 = (void *)v8;
      v10 = &stru_26DE5AB78;
      if (v8) {
        v10 = (__CFString *)v8;
      }
      v11 = v10;

      v7 = [MEMORY[0x263F0FC28] playlistDestinationWithName:v11];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end