@interface _GEOSingleTileSetMapRegionTileKeyEnumerator
- (BOOL)continueEnumeratingTileKeysWithBlock:(id)a3;
- (_GEOSingleTileSetMapRegionTileKeyEnumerator)initWithMapRegion:(id)a3 tileSet:(id)a4 zoomMode:(int64_t)a5;
- (unint64_t)count;
@end

@implementation _GEOSingleTileSetMapRegionTileKeyEnumerator

- (_GEOSingleTileSetMapRegionTileKeyEnumerator)initWithMapRegion:(id)a3 tileSet:(id)a4 zoomMode:(int64_t)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_GEOSingleTileSetMapRegionTileKeyEnumerator;
  v11 = [(_GEOSingleTileSetMapRegionTileKeyEnumerator *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_region, a3);
    v12->_style = [v10 style];
    v12->_size = [v10 size];
    v12->_scale = [v10 scale];
    v12->_zoomMode = a5;
    if (a5 == 1)
    {
      v17 = [MEMORY[0x1E4F1CA48] array];
      unsigned int v18 = objc_msgSend(v10, "minimumZoomLevelInRect:", 0.0, 0.0, 268435456.0, 268435456.0);
      uint64_t v19 = objc_msgSend(v10, "largestZoomLevelLEQ:inRect:", 0xFFFFFFFFLL, 0.0, 0.0, 268435456.0, 268435456.0);
      if (v19 >= v18)
      {
        uint64_t v20 = v19;
        do
        {
          v21 = [NSNumber numberWithUnsignedInt:v20];
          [(NSArray *)v17 addObject:v21];

          if (!v20) {
            break;
          }
          uint64_t v20 = objc_msgSend(v10, "largestZoomLevelLEQ:inRect:", (v20 - 1), 0.0, 0.0, 268435456.0, 268435456.0);
        }
        while (v20 >= v18);
      }
      zoomLevels = v12->_zoomLevels;
      v12->_zoomLevels = v17;
    }
    else
    {
      if (a5)
      {
LABEL_11:
        v22 = v12;
        goto LABEL_12;
      }
      uint64_t v13 = objc_msgSend(v10, "largestZoomLevelLEQ:inRect:", 0xFFFFFFFFLL, 0.0, 0.0, 268435456.0, 268435456.0);
      zoomLevels = [NSNumber numberWithUnsignedInt:v13];
      v25[0] = zoomLevels;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      v16 = v12->_zoomLevels;
      v12->_zoomLevels = (NSArray *)v15;
    }
    goto LABEL_11;
  }
LABEL_12:

  return v12;
}

- (BOOL)continueEnumeratingTileKeysWithBlock:(id)a3
{
  id v4 = a3;
  unint64_t currentZIndex = self->_currentZIndex;
  if (currentZIndex >= [(NSArray *)self->_zoomLevels count])
  {
    BOOL v15 = 1;
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    do
    {
      unint64_t v6 = self->_currentZIndex;
      if (v6 >= [(NSArray *)self->_zoomLevels count]) {
        break;
      }
      v7 = [(NSArray *)self->_zoomLevels objectAtIndexedSubscript:self->_currentZIndex];
      unsigned int v8 = [v7 unsignedIntValue];

      region = self->_region;
      unsigned int style = self->_style;
      int size = self->_size;
      uint64_t scale = self->_scale;
      unsigned int currentOffset = self->_currentOffset;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84___GEOSingleTileSetMapRegionTileKeyEnumerator_continueEnumeratingTileKeysWithBlock___block_invoke;
      v17[3] = &unk_1E53EBED0;
      id v18 = v4;
      uint64_t v19 = &v20;
      v17[4] = self;
      if (_GEOEnumerateTileKeysForRegion(region, style, size, scale, v8, currentOffset, v17))
      {
        ++self->_currentZIndex;
        self->_unsigned int currentOffset = 0;
      }
    }
    while (!*((unsigned char *)v21 + 24));
    unint64_t v14 = self->_currentZIndex;
    BOOL v15 = v14 >= [(NSArray *)self->_zoomLevels count];
    _Block_object_dispose(&v20, 8);
  }

  return v15;
}

- (unint64_t)count
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_zoomLevels;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += _GEONumberOfTileKeysForRegion(self->_region, self->_style, self->_size, self->_scale, objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsignedIntValue", (void)v10));
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomLevels, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end