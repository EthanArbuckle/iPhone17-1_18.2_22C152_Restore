@interface KMMapper_MPMediaEntity
+ (Class)externalObjectClass;
- (BOOL)_addItemWithItemId:(id)a3 itemIdType:(int64_t)a4 fields:(id)a5 error:(id *)a6;
- (BOOL)_itemsFromMediaItem:(id)a3 error:(id *)a4;
- (BOOL)_itemsFromMediaPlaylist:(id)a3 error:(id *)a4;
- (BOOL)_mapAudioBookItem:(id)a3 error:(id *)a4;
- (BOOL)_mapMovieItem:(id)a3 error:(id *)a4;
- (BOOL)_mapMusicItem:(id)a3 error:(id *)a4;
- (BOOL)_mapMusicVideoItem:(id)a3 error:(id *)a4;
- (BOOL)_mapPodcastItem:(id)a3 error:(id *)a4;
- (BOOL)_mapTVShowItem:(id)a3 error:(id *)a4;
- (KMMapper_MPMediaEntity)init;
- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (int64_t)targetItemType;
@end

@implementation KMMapper_MPMediaEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (BOOL)_itemsFromMediaPlaylist:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F11478];
  id v7 = a3;
  v8 = [v7 valueForProperty:v6];
  v9 = [v8 stringValue];

  v10 = [v7 valueForProperty:*MEMORY[0x263F11468]];

  v11 = [[KMFieldValue alloc] initWithFieldType:216 value:v10];
  v14[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  LOBYTE(a4) = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v9 itemIdType:216 fields:v12 error:a4];

  return (char)a4;
}

- (BOOL)_itemsFromMediaItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x263F11358]];
  __int16 v8 = [v7 unsignedLongValue];

  if (v8)
  {
    BOOL v9 = [(KMMapper_MPMediaEntity *)self _mapMusicItem:v6 error:a4];
  }
  else if ((v8 & 0x402) != 0)
  {
    BOOL v9 = [(KMMapper_MPMediaEntity *)self _mapPodcastItem:v6 error:a4];
  }
  else if ((v8 & 4) != 0)
  {
    BOOL v9 = [(KMMapper_MPMediaEntity *)self _mapAudioBookItem:v6 error:a4];
  }
  else if ((v8 & 0x200) != 0)
  {
    BOOL v9 = [(KMMapper_MPMediaEntity *)self _mapTVShowItem:v6 error:a4];
  }
  else if ((v8 & 0x100) != 0)
  {
    BOOL v9 = [(KMMapper_MPMediaEntity *)self _mapMovieItem:v6 error:a4];
  }
  else
  {
    if ((v8 & 0x800) == 0)
    {
      BOOL v10 = 1;
      goto LABEL_6;
    }
    BOOL v9 = [(KMMapper_MPMediaEntity *)self _mapMusicVideoItem:v6 error:a4];
  }
  BOOL v10 = v9;
LABEL_6:

  return v10;
}

- (BOOL)_mapMusicVideoItem:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x263F11240]];
  __int16 v8 = [v7 stringValue];

  BOOL v9 = [v6 valueForProperty:*MEMORY[0x263F11238]];
  BOOL v10 = [[KMFieldValue alloc] initWithFieldType:202 value:v9];
  v22[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  BOOL v12 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v8 itemIdType:202 fields:v11 error:a4];

  if (v12)
  {
    v13 = [v6 valueForProperty:*MEMORY[0x263F11368]];
    v14 = [v13 stringValue];

    v15 = [v6 valueForProperty:*MEMORY[0x263F11400]];
    v16 = [[KMFieldValue alloc] initWithFieldType:214 value:v15];
    v17 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 201, v8, v16);
    v21[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    BOOL v19 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v14 itemIdType:214 fields:v18 error:a4];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_mapMovieItem:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F11368];
  id v7 = a3;
  __int16 v8 = [v7 valueForProperty:v6];
  BOOL v9 = [v8 stringValue];

  BOOL v10 = [v7 valueForProperty:*MEMORY[0x263F11400]];

  v11 = [[KMFieldValue alloc] initWithFieldType:212 value:v10];
  v14[0] = v11;
  BOOL v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  LOBYTE(a4) = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v9 itemIdType:212 fields:v12 error:a4];

  return (char)a4;
}

- (BOOL)_mapTVShowItem:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x263F11218]];
  __int16 v8 = [v7 stringValue];

  BOOL v9 = [v6 valueForProperty:*MEMORY[0x263F11220]];
  BOOL v10 = [[KMFieldValue alloc] initWithFieldType:232 value:v9];
  v22[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  BOOL v12 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v8 itemIdType:232 fields:v11 error:a4];

  if (v12)
  {
    v13 = [v6 valueForProperty:*MEMORY[0x263F11368]];
    v14 = [v13 stringValue];

    v15 = [v6 valueForProperty:*MEMORY[0x263F11400]];
    v16 = [[KMFieldValue alloc] initWithFieldType:230 value:v15];
    v17 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 231, v8, v16);
    v21[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    BOOL v19 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v14 itemIdType:230 fields:v18 error:a4];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_mapAudioBookItem:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x263F11240]];
  __int16 v8 = [v7 stringValue];

  BOOL v9 = [v6 valueForProperty:*MEMORY[0x263F11238]];
  BOOL v10 = [[KMFieldValue alloc] initWithFieldType:206 value:v9];
  v22[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  BOOL v12 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v8 itemIdType:206 fields:v11 error:a4];

  if (v12)
  {
    v13 = [v6 valueForProperty:*MEMORY[0x263F11368]];
    v14 = [v13 stringValue];

    v15 = [v6 valueForProperty:*MEMORY[0x263F11400]];
    v16 = [[KMFieldValue alloc] initWithFieldType:208 value:v15];
    v17 = -[KMFieldValue initWithFieldType:value:]([KMFieldValue alloc], "initWithFieldType:value:", 205, v8, v16);
    v21[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    BOOL v19 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v14 itemIdType:208 fields:v18 error:a4];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_mapPodcastItem:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x263F11240]];
  __int16 v8 = [v7 stringValue];

  BOOL v9 = [v6 valueForProperty:*MEMORY[0x263F11238]];
  BOOL v10 = [[KMFieldValue alloc] initWithFieldType:218 value:v9];
  v38[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  BOOL v12 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v8 itemIdType:218 fields:v11 error:a4];

  if (v12)
  {
    v13 = [v6 valueForProperty:*MEMORY[0x263F11218]];
    v14 = [v13 stringValue];

    v15 = [v6 valueForProperty:*MEMORY[0x263F11220]];
    v16 = [[KMFieldValue alloc] initWithFieldType:224 value:v15];
    v37 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    BOOL v18 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v14 itemIdType:224 fields:v17 error:a4];

    if (v18)
    {
      BOOL v19 = [v6 valueForProperty:*MEMORY[0x263F11388]];
      uint64_t v20 = [v19 stringValue];

      v33 = [v6 valueForProperty:*MEMORY[0x263F11390]];
      v21 = [[KMFieldValue alloc] initWithFieldType:222 value:v33];
      v36 = v21;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      v34 = (void *)v20;
      LODWORD(v20) = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v20 itemIdType:222 fields:v22 error:a4];

      if (v20)
      {
        v23 = [v6 valueForProperty:*MEMORY[0x263F11368]];
        v31 = [v23 stringValue];

        v32 = [v6 valueForProperty:*MEMORY[0x263F11400]];
        v30 = [[KMFieldValue alloc] initWithFieldType:228 value:v32];
        v35[0] = v30;
        v29 = [[KMFieldValue alloc] initWithFieldType:217 value:v8];
        v35[1] = v29;
        v24 = [[KMFieldValue alloc] initWithFieldType:223 value:v14];
        v35[2] = v24;
        v25 = [[KMFieldValue alloc] initWithFieldType:221 value:v34];
        v35[3] = v25;
        v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
        BOOL v27 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v31 itemIdType:220 fields:v26 error:a4];
      }
      else
      {
        BOOL v27 = 0;
      }
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)_mapMusicItem:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x263F11218]];
  __int16 v8 = [v7 stringValue];

  BOOL v9 = [v6 valueForProperty:*MEMORY[0x263F11220]];
  BOOL v10 = [[KMFieldValue alloc] initWithFieldType:204 value:v9];
  v38[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  BOOL v12 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v8 itemIdType:204 fields:v11 error:a4];

  if (v12)
  {
    v13 = [v6 valueForProperty:*MEMORY[0x263F11240]];
    v14 = [v13 stringValue];

    v15 = [v6 valueForProperty:*MEMORY[0x263F11238]];
    v16 = [[KMFieldValue alloc] initWithFieldType:202 value:v15];
    v37 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    BOOL v18 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v14 itemIdType:202 fields:v17 error:a4];

    if (v18)
    {
      BOOL v19 = [v6 valueForProperty:*MEMORY[0x263F112A8]];
      uint64_t v20 = [v19 stringValue];

      v33 = [v6 valueForProperty:*MEMORY[0x263F112A0]];
      v21 = [[KMFieldValue alloc] initWithFieldType:210 value:v33];
      v36 = v21;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
      v34 = (void *)v20;
      LODWORD(v20) = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v20 itemIdType:210 fields:v22 error:a4];

      if (v20)
      {
        v23 = [v6 valueForProperty:*MEMORY[0x263F11368]];
        v31 = [v23 stringValue];

        v32 = [v6 valueForProperty:*MEMORY[0x263F11400]];
        v30 = [[KMFieldValue alloc] initWithFieldType:228 value:v32];
        v35[0] = v30;
        v29 = [[KMFieldValue alloc] initWithFieldType:203 value:v8];
        v35[1] = v29;
        v24 = [[KMFieldValue alloc] initWithFieldType:201 value:v14];
        v35[2] = v24;
        v25 = [[KMFieldValue alloc] initWithFieldType:209 value:v34];
        v35[3] = v25;
        v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
        BOOL v27 = [(KMMapper_MPMediaEntity *)self _addItemWithItemId:v31 itemIdType:228 fields:v26 error:a4];
      }
      else
      {
        BOOL v27 = 0;
      }
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (BOOL)_addItemWithItemId:(id)a3 itemIdType:(int64_t)a4 fields:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  if ((unint64_t)(a4 - 202) > 0x1E) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = dword_22477B9BC[a4 - 202];
  }
  v13 = [NSString stringWithFormat:@"%X-%@", v12, v10];
  builder = self->_builder;
  id v43 = 0;
  id v15 = [(KVItemBuilder *)builder setItemType:5 itemId:v13 error:&v43];
  id v16 = v43;

  if (v15)
  {
    v33 = a6;
    v34 = v13;
    id v35 = v11;
    id v36 = v10;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v15 = v11;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      char v19 = 0;
      uint64_t v20 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v23 = [v22 value];

          if (v23)
          {
            v24 = self->_builder;
            uint64_t v25 = [v22 fieldType];
            v26 = [v22 value];
            id v38 = v16;
            BOOL v27 = [(KVItemBuilder *)v24 addFieldWithType:v25 value:v26 error:&v38];
            id v28 = v38;

            if (!v27)
            {
              KMMapperSetBuilderError((uint64_t)v33, v28);

              LOBYTE(v15) = 0;
              id v16 = v28;
              id v11 = v35;
              id v10 = v36;
              v13 = v34;
              goto LABEL_24;
            }
            char v19 = 1;
            id v16 = v28;
          }
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v19 = 0;
    }
    v29 = v16;

    v30 = self->_builder;
    id v37 = v16;
    v31 = [(KVItemBuilder *)v30 buildItemWithError:&v37];
    id v16 = v37;

    LOBYTE(v15) = v31 != 0;
    if (v31)
    {
      id v10 = v36;
      v13 = v34;
      if (v19) {
        [(NSMutableArray *)self->_items addObject:v31];
      }
    }
    else
    {
      KMMapperSetBuilderError((uint64_t)v33, v16);
      id v10 = v36;
      v13 = v34;
    }

    id v11 = v35;
  }
  else
  {
    KMMapperSetBuilderError((uint64_t)a6, v16);
  }
LABEL_24:

  return (char)v15;
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v7 = a3;
  __int16 v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  items = self->_items;
  self->_items = v8;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (![(KMMapper_MPMediaEntity *)self _itemsFromMediaItem:v7 error:a5])
    {
LABEL_7:
      id v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ![(KMMapper_MPMediaEntity *)self _itemsFromMediaPlaylist:v7 error:a5])
    {
      goto LABEL_7;
    }
  }
  id v10 = self->_items;
LABEL_8:
  id v11 = v10;

  return v11;
}

- (int64_t)targetItemType
{
  return 5;
}

- (KMMapper_MPMediaEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)KMMapper_MPMediaEntity;
  v2 = [(KMMapper_MPMediaEntity *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

+ (Class)externalObjectClass
{
  return (Class)objc_opt_class();
}

@end