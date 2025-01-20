@interface HFDefaultRoomSuggestionVendor
+ (HFDefaultRoomSuggestionVendor)TVAccessorySuggestionVendor;
+ (HFDefaultRoomSuggestionVendor)homeAppSuggestionVendor;
- (HFDefaultRoomSuggestionVendor)init;
- (HFDefaultRoomSuggestionVendor)initWithRoomSuggestionsPlistURL:(id)a3;
- (NSSet)roomSuggestions;
- (NSURL)roomSuggestionsPlistURL;
- (id)prioritizedRoomSuggestions;
@end

@implementation HFDefaultRoomSuggestionVendor

+ (HFDefaultRoomSuggestionVendor)TVAccessorySuggestionVendor
{
  v2 = [HFDefaultRoomSuggestionVendor alloc];
  v3 = HFHomeBundle();
  v4 = [v3 URLForResource:@"HFRoomSuggestions-TVAccessory" withExtension:@"plist"];
  v5 = [(HFDefaultRoomSuggestionVendor *)v2 initWithRoomSuggestionsPlistURL:v4];

  return v5;
}

+ (HFDefaultRoomSuggestionVendor)homeAppSuggestionVendor
{
  v2 = objc_alloc_init(HFDefaultRoomSuggestionVendor);
  return v2;
}

- (HFDefaultRoomSuggestionVendor)initWithRoomSuggestionsPlistURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDefaultRoomSuggestionVendor;
  v5 = [(HFDefaultRoomSuggestionVendor *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    roomSuggestionsPlistURL = v5->_roomSuggestionsPlistURL;
    v5->_roomSuggestionsPlistURL = (NSURL *)v6;
  }
  return v5;
}

- (HFDefaultRoomSuggestionVendor)init
{
  v3 = HFHomeBundle();
  id v4 = [v3 URLForResource:@"HFRoomSuggestions" withExtension:@"plist"];
  v5 = [(HFDefaultRoomSuggestionVendor *)self initWithRoomSuggestionsPlistURL:v4];

  return v5;
}

- (id)prioritizedRoomSuggestions
{
  v2 = [(HFDefaultRoomSuggestionVendor *)self roomSuggestions];
  v3 = [v2 allObjects];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_39_2];

  return v4;
}

uint64_t __59__HFDefaultRoomSuggestionVendor_prioritizedRoomSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "priority"));
  v7 = NSNumber;
  uint64_t v8 = [v5 priority];

  objc_super v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (NSSet)roomSuggestions
{
  roomSuggestions = self->_roomSuggestions;
  if (roomSuggestions)
  {
    v3 = roomSuggestions;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF8F8];
    v7 = [(HFDefaultRoomSuggestionVendor *)self roomSuggestionsPlistURL];
    uint64_t v8 = [v6 dataWithContentsOfURL:v7];

    objc_super v9 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:0];
    objc_opt_class();
    uint64_t v10 = 0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 objectForKey:@"_LOCALIZABLE_"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      uint64_t v21 = 0;
      uint64_t v21 = [v10 count];
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x2020000000;
      char v19 = 0;
      v11 = (void *)MEMORY[0x263EFFA08];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __48__HFDefaultRoomSuggestionVendor_roomSuggestions__block_invoke;
      v17[3] = &unk_264097BE8;
      v17[4] = self;
      v17[5] = v20;
      v17[6] = v18;
      v17[7] = a2;
      v12 = objc_msgSend(v10, "na_map:", v17);
      v13 = [v11 setWithArray:v12];
      v14 = self->_roomSuggestions;
      self->_roomSuggestions = v13;

      v3 = self->_roomSuggestions;
      _Block_object_dispose(v18, 8);
      _Block_object_dispose(v20, 8);
    }
    else
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"HFRoomSuggestionVendor.m", 86, @"Missing or malformatted suggestions plist %@", v9 object file lineNumber description];

      v3 = [MEMORY[0x263EFFA08] set];
    }
  }
  return v3;
}

id __48__HFDefaultRoomSuggestionVendor_roomSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"name"];
  if (v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"priority"];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        v7 = [*(id *)(a1 + 32) roomSuggestionsPlistURL];
        NSLog(&cfstr_RoomSuggestion.isa, v7);
      }
    }
    else
    {
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    objc_super v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = [v3 objectForKeyedSubscript:@"aliases"];
    v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = MEMORY[0x263EFFA68];
    }
    v13 = [v9 setWithArray:v12];

    uint64_t v8 = +[HFRoomSuggestion suggestionWithName:priority:aliases:](HFRoomSuggestion, "suggestionWithName:priority:aliases:", v4, [v6 integerValue], v13);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HFRoomSuggestionVendor.m", 99, @"Missing name in entry %@", v3 object file lineNumber description];
    uint64_t v8 = 0;
  }

  return v8;
}

- (NSURL)roomSuggestionsPlistURL
{
  return self->_roomSuggestionsPlistURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomSuggestionsPlistURL, 0);
  objc_storeStrong((id *)&self->_roomSuggestions, 0);
}

@end