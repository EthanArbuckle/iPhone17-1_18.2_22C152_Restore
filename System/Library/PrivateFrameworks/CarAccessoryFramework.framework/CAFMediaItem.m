@interface CAFMediaItem
- (CAFMediaItem)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)artist;
- (NSString)ensemble;
- (NSString)identifier;
- (NSString)mediaItemCategoryUserVisibleLabel;
- (NSString)mediaItemGroup;
- (NSString)mediaItemImageIdentifier;
- (NSString)mediaItemName;
- (NSString)mediaItemShortName;
- (NSString)mediaItemType;
- (NSString)title;
- (NSString)userVisibleDescription;
- (id)description;
- (unsigned)frequency;
- (unsigned)mediaItemCategory;
- (unsigned)multicast;
@end

@implementation CAFMediaItem

- (CAFMediaItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAFMediaItem;
  v5 = [(CAFMediaItem *)&v46 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"artist"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      v7 = (NSString *)v6;
    }
    else {
      v7 = 0;
    }

    artist = v5->_artist;
    v5->_artist = v7;

    objc_opt_class();
    id v9 = [v4 objectForKey:@"ensemble"];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      v10 = (NSString *)v9;
    }
    else {
      v10 = 0;
    }

    ensemble = v5->_ensemble;
    v5->_ensemble = v10;

    objc_opt_class();
    id v12 = [v4 objectForKey:@"frequency"];
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v5->_frequency = [v13 unsignedIntValue];
    objc_opt_class();
    id v14 = [v4 objectForKey:@"identifier"];
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
      v15 = (NSString *)v14;
    }
    else {
      v15 = 0;
    }

    identifier = v5->_identifier;
    v5->_identifier = v15;

    objc_opt_class();
    id v17 = [v4 objectForKey:@"mediaItemCategory"];
    if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    v5->_mediaItemCategory = [v18 unsignedCharValue];
    objc_opt_class();
    id v19 = [v4 objectForKey:@"mediaItemCategoryUserVisibleLabel"];
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
      v20 = (NSString *)v19;
    }
    else {
      v20 = 0;
    }

    mediaItemCategoryUserVisibleLabel = v5->_mediaItemCategoryUserVisibleLabel;
    v5->_mediaItemCategoryUserVisibleLabel = v20;

    objc_opt_class();
    id v22 = [v4 objectForKey:@"mediaItemGroup"];
    if (v22 && (objc_opt_isKindOfClass() & 1) != 0) {
      v23 = (NSString *)v22;
    }
    else {
      v23 = 0;
    }

    mediaItemGroup = v5->_mediaItemGroup;
    v5->_mediaItemGroup = v23;

    objc_opt_class();
    id v25 = [v4 objectForKey:@"mediaItemImageIdentifier"];
    if (v25 && (objc_opt_isKindOfClass() & 1) != 0) {
      v26 = (NSString *)v25;
    }
    else {
      v26 = 0;
    }

    mediaItemImageIdentifier = v5->_mediaItemImageIdentifier;
    v5->_mediaItemImageIdentifier = v26;

    objc_opt_class();
    id v28 = [v4 objectForKey:@"mediaItemName"];
    if (v28 && (objc_opt_isKindOfClass() & 1) != 0) {
      v29 = (NSString *)v28;
    }
    else {
      v29 = 0;
    }

    mediaItemName = v5->_mediaItemName;
    v5->_mediaItemName = v29;

    objc_opt_class();
    id v31 = [v4 objectForKey:@"mediaItemShortName"];
    if (v31 && (objc_opt_isKindOfClass() & 1) != 0) {
      v32 = (NSString *)v31;
    }
    else {
      v32 = 0;
    }

    mediaItemShortName = v5->_mediaItemShortName;
    v5->_mediaItemShortName = v32;

    objc_opt_class();
    id v34 = [v4 objectForKey:@"mediaItemType"];
    if (v34 && (objc_opt_isKindOfClass() & 1) != 0) {
      v35 = (NSString *)v34;
    }
    else {
      v35 = 0;
    }

    mediaItemType = v5->_mediaItemType;
    v5->_mediaItemType = v35;

    objc_opt_class();
    id v37 = [v4 objectForKey:@"multicast"];
    if (v37 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v38 = v37;
    }
    else {
      id v38 = 0;
    }

    v5->_multicast = [v38 unsignedCharValue];
    objc_opt_class();
    id v39 = [v4 objectForKey:@"title"];
    if (v39 && (objc_opt_isKindOfClass() & 1) != 0) {
      v40 = (NSString *)v39;
    }
    else {
      v40 = 0;
    }

    title = v5->_title;
    v5->_title = v40;

    objc_opt_class();
    id v42 = [v4 objectForKey:@"userVisibleDescription"];
    if (v42 && (objc_opt_isKindOfClass() & 1) != 0) {
      v43 = (NSString *)v42;
    }
    else {
      v43 = 0;
    }

    userVisibleDescription = v5->_userVisibleDescription;
    v5->_userVisibleDescription = v43;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v41[14] = *MEMORY[0x263EF8340];
  v40[0] = @"artist";
  uint64_t v3 = [(CAFMediaItem *)self artist];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
  }
  id v39 = v4;
  id v31 = (void *)v3;
  v41[0] = v3;
  v40[1] = @"ensemble";
  uint64_t v5 = [(CAFMediaItem *)self ensemble];
  id v38 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  }
  v30 = (void *)v5;
  v41[1] = v5;
  v40[2] = @"frequency";
  id v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAFMediaItem frequency](self, "frequency"));
  v41[2] = v37;
  v40[3] = @"identifier";
  uint64_t v6 = [(CAFMediaItem *)self identifier];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  }
  v29 = (void *)v6;
  v41[3] = v6;
  v40[4] = @"mediaItemCategory";
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFMediaItem mediaItemCategory](self, "mediaItemCategory"));
  v41[4] = v35;
  v40[5] = @"mediaItemCategoryUserVisibleLabel";
  uint64_t v8 = [(CAFMediaItem *)self mediaItemCategoryUserVisibleLabel];
  id v34 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  }
  id v28 = (void *)v8;
  v41[5] = v8;
  v40[6] = @"mediaItemGroup";
  uint64_t v9 = [(CAFMediaItem *)self mediaItemGroup];
  v33 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  }
  v27 = (void *)v9;
  v41[6] = v9;
  v40[7] = @"mediaItemImageIdentifier";
  uint64_t v10 = [(CAFMediaItem *)self mediaItemImageIdentifier];
  v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  }
  v26 = (void *)v10;
  v41[7] = v10;
  v40[8] = @"mediaItemName";
  uint64_t v12 = [(CAFMediaItem *)self mediaItemName];
  id v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  v36 = v7;
  id v25 = (void *)v12;
  v41[8] = v12;
  v40[9] = @"mediaItemShortName";
  uint64_t v14 = [(CAFMediaItem *)self mediaItemShortName];
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  }
  v41[9] = v14;
  v40[10] = @"mediaItemType";
  v16 = [(CAFMediaItem *)self mediaItemType];
  id v17 = v16;
  if (!v16)
  {
    id v17 = [MEMORY[0x263EFF9D0] null];
  }
  v41[10] = v17;
  v40[11] = @"multicast";
  id v18 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CAFMediaItem multicast](self, "multicast"));
  v41[11] = v18;
  v40[12] = @"title";
  id v19 = [(CAFMediaItem *)self title];
  v20 = v19;
  if (!v19)
  {
    v20 = [MEMORY[0x263EFF9D0] null];
  }
  v41[12] = v20;
  v40[13] = @"userVisibleDescription";
  v21 = [(CAFMediaItem *)self userVisibleDescription];
  id v22 = v21;
  if (!v21)
  {
    id v22 = [MEMORY[0x263EFF9D0] null];
  }
  v41[13] = v22;
  id v32 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:14];
  if (!v21) {

  }
  if (!v19) {
  if (!v16)
  }

  if (!v15) {
  if (!v13)
  }

  if (!v11) {
  if (!v33)
  }

  if (!v34) {
  if (!v36)
  }

  if (!v38) {
  if (!v39)
  }

  return (NSDictionary *)v32;
}

- (id)description
{
  id v19 = NSString;
  uint64_t v18 = objc_opt_class();
  id v17 = [(CAFMediaItem *)self artist];
  v16 = [(CAFMediaItem *)self ensemble];
  uint64_t v15 = [(CAFMediaItem *)self frequency];
  v20 = [(CAFMediaItem *)self identifier];
  unsigned int v14 = [(CAFMediaItem *)self mediaItemCategory];
  uint64_t v3 = [(CAFMediaItem *)self mediaItemCategoryUserVisibleLabel];
  id v4 = [(CAFMediaItem *)self mediaItemGroup];
  uint64_t v5 = [(CAFMediaItem *)self mediaItemImageIdentifier];
  uint64_t v6 = [(CAFMediaItem *)self mediaItemName];
  id v13 = [(CAFMediaItem *)self mediaItemShortName];
  v7 = [(CAFMediaItem *)self mediaItemType];
  unsigned int v8 = [(CAFMediaItem *)self multicast];
  uint64_t v9 = [(CAFMediaItem *)self title];
  uint64_t v10 = [(CAFMediaItem *)self userVisibleDescription];
  objc_msgSend(v19, "stringWithFormat:", @"<%@: %p { %@: %@, %@: %@, %@: %u, %@: %@, %@: %hhu, %@: %@, %@: %@, %@: %@, %@: %@, %@: %@, %@: %@, %@: %hhu, %@: %@, %@: %@ }>", v18, self, @"artist", v17, @"ensemble", v16, @"frequency", v15, @"identifier", v20, @"mediaItemCategory", v14, @"mediaItemCategoryUserVisibleLabel", v3, @"mediaItemGroup", v4,
    @"mediaItemImageIdentifier",
    v5,
    @"mediaItemName",
    v6,
    @"mediaItemShortName",
    v13,
    @"mediaItemType",
    v7,
    @"multicast",
    v8,
    @"title",
    v9,
    @"userVisibleDescription",
  v11 = v10);

  return v11;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)ensemble
{
  return self->_ensemble;
}

- (unsigned)frequency
{
  return self->_frequency;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)mediaItemCategory
{
  return self->_mediaItemCategory;
}

- (NSString)mediaItemCategoryUserVisibleLabel
{
  return self->_mediaItemCategoryUserVisibleLabel;
}

- (NSString)mediaItemGroup
{
  return self->_mediaItemGroup;
}

- (NSString)mediaItemImageIdentifier
{
  return self->_mediaItemImageIdentifier;
}

- (NSString)mediaItemName
{
  return self->_mediaItemName;
}

- (NSString)mediaItemShortName
{
  return self->_mediaItemShortName;
}

- (NSString)mediaItemType
{
  return self->_mediaItemType;
}

- (unsigned)multicast
{
  return self->_multicast;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)userVisibleDescription
{
  return self->_userVisibleDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaItemType, 0);
  objc_storeStrong((id *)&self->_mediaItemShortName, 0);
  objc_storeStrong((id *)&self->_mediaItemName, 0);
  objc_storeStrong((id *)&self->_mediaItemImageIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaItemGroup, 0);
  objc_storeStrong((id *)&self->_mediaItemCategoryUserVisibleLabel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ensemble, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end