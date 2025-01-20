@interface MIOMovieMetadataUtility
+ (BOOL)isTrack:(id)a3 forStreamId:(id)a4 mediaType:(id)a5;
+ (id)attachmentsTrackInAsset:(id)a3 forTrack:(id)a4;
+ (id)findAllAssociatedMetadataTracksInAsset:(id)a3 forTrack:(id)a4;
+ (id)findStreamIdFromQTTagsOfTrack:(id)a3;
- (AVMutableMovie)movie;
- (BOOL)addMovieMetadataItem:(id)a3;
- (BOOL)applyChangesError:(id *)a3;
- (BOOL)setCustomTrackMetadataForStream:(id)a3 mediaType:(int64_t)a4 metadata:(id)a5 error:(id *)a6;
- (BOOL)setMovieMetadata:(id)a3;
- (MIOMovieMetadataUtility)initWithURL:(id)a3 error:(id *)a4;
- (id)customTrackMetadataForStream:(id)a3 mediaType:(int64_t)a4 error:(id *)a5;
- (id)metadataForMovie;
- (id)trackForStreamId:(id)a3 mediaType:(int64_t)a4 error:(id *)a5;
- (void)setMovie:(id)a3;
@end

@implementation MIOMovieMetadataUtility

+ (BOOL)isTrack:(id)a3 forStreamId:(id)a4 mediaType:(id)a5
{
  id v23 = a1;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v24 = a4;
  id v8 = a5;
  v9 = [v7 mediaType];
  char v10 = [v9 isEqualToString:v8];

  if (v10)
  {
    [v7 metadata];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "identifier", v23);
          int v17 = [@"mdta/com.apple.track_kind" isEqualToString:v16];

          if (v17)
          {
            v21 = [v15 value];
            char v20 = [v21 isEqualToString:v24];

            v19 = v11;
            goto LABEL_14;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v18 = [(id)objc_opt_class() findStreamIdFromQTTagsOfTrack:v7];
    v19 = v18;
    if (v18) {
      char v20 = [v18 isEqualToString:v24];
    }
    else {
      char v20 = 0;
    }
LABEL_14:
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

+ (id)findAllAssociatedMetadataTracksInAsset:(id)a3 forTrack:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v5 tracksWithMediaType:*MEMORY[0x263EF9D08]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    uint64_t v11 = *MEMORY[0x263EFA1B0];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "associatedTracksOfType:", v11, (void)v17);
        if ([v14 containsObject:v6]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15 = (void *)[v7 copy];

  return v15;
}

+ (id)attachmentsTrackInAsset:(id)a3 forTrack:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() findAllAssociatedMetadataTracksInAsset:v5 forTrack:v6];
  id v8 = [@"mdta/com.apple.stream_sample_attachments" componentsSeparatedByString:@"/"];
  uint64_t v9 = [v8 objectAtIndexedSubscript:1];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = +[MOVStreamIOUtility getCustomAssociatedMetadataStreamIdFromTrack:v14];
        if ([v15 isEqualToString:v9])
        {
          id v16 = v14;

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_11:

  return v16;
}

+ (id)findStreamIdFromQTTagsOfTrack:(id)a3
{
  v3 = [a3 metadataForFormat:*MEMORY[0x263EF9DE0]];
  uint64_t v4 = *MEMORY[0x263EF9E90];
  id v5 = [MEMORY[0x263EFA748] metadataItemsFromArray:v3 withKey:*MEMORY[0x263EF9F90] keySpace:*MEMORY[0x263EF9E90]];
  id v6 = [v5 firstObject];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 stringValue];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFA748] metadataItemsFromArray:v3 withKey:*MEMORY[0x263EF9F98] keySpace:v4];
    id v10 = [v9 firstObject];
    id v7 = v10;
    if (v10)
    {
      id v8 = [v10 stringValue];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (MIOMovieMetadataUtility)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIOMovieMetadataUtility;
  id v7 = [(MIOMovieMetadataUtility *)&v11 init];
  if (!v7
    || (id v8 = (void *)[objc_alloc(MEMORY[0x263EFA798]) initWithURL:v6 options:0 error:a4],
        [(MIOMovieMetadataUtility *)v7 setMovie:v8],
        v8,
        [(MIOMovieMetadataUtility *)v7 movie],
        uint64_t v9 = (MIOMovieMetadataUtility *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v9 = v7;
  }

  return v9;
}

- (id)trackForStreamId:(id)a3 mediaType:(int64_t)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = +[MIOMediaTypeUtility matchingAVMediaTypeFromMIOMediaType:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = [(MIOMovieMetadataUtility *)self movie];
  objc_super v11 = [v10 tracksWithMediaType:v9];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(id)objc_opt_class() isTrack:v15 forStreamId:v8 mediaType:v9])
        {
          id v16 = v15;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  objc_super v11 = [NSString stringWithFormat:@"Cannot find track for stream '%@'.", v8];
  [MEMORY[0x263F087E8] populateReaderError:a5 message:v11 code:7];
  id v16 = 0;
LABEL_11:

  return v16;
}

- (id)customTrackMetadataForStream:(id)a3 mediaType:(int64_t)a4 error:(id *)a5
{
  id v5 = [(MIOMovieMetadataUtility *)self trackForStreamId:a3 mediaType:a4 error:a5];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 metadata];
    id v8 = +[MOVStreamIOUtility nonMIOTrackMetadataItemsInMetadataItems:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)setCustomTrackMetadataForStream:(id)a3 mediaType:(int64_t)a4 metadata:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v20 = a5;
  long long v21 = [(MIOMovieMetadataUtility *)self trackForStreamId:a3 mediaType:a4 error:a6];
  if (v21)
  {
    id v10 = objc_opt_new();
    [v21 metadata];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v16 = [v15 identifier];
          long long v17 = +[MOVStreamIOUtility reservedMIOTrackMetadataKeys];
          int v18 = [v17 containsObject:v16];

          if (v18) {
            [v10 addObject:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    if ([v20 count]) {
      [v10 addObjectsFromArray:v20];
    }
    [v21 setMetadata:v10];
  }
  return v21 != 0;
}

- (id)metadataForMovie
{
  v3 = objc_opt_new();
  uint64_t v4 = [(MIOMovieMetadataUtility *)self movie];
  id v5 = [v4 metadata];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__MIOMovieMetadataUtility_metadataForMovie__block_invoke;
  v10[3] = &unk_2643AF9F0;
  id v6 = v3;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];

  if ([v6 count]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __43__MIOMovieMetadataUtility_metadataForMovie__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 identifier];
  BOOL v4 = +[MOVStreamIOUtility isMOVStreamIOMovMetadataIdentifier:v3];

  if (!v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (BOOL)setMovieMetadata:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(MIOMovieMetadataUtility *)self movie];
  id v7 = [v6 metadata];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__MIOMovieMetadataUtility_setMovieMetadata___block_invoke;
  v11[3] = &unk_2643AF9F0;
  id v8 = v5;
  id v12 = v8;
  [v7 enumerateObjectsUsingBlock:v11];

  if ([v4 count]) {
    [v8 addObjectsFromArray:v4];
  }
  uint64_t v9 = [(MIOMovieMetadataUtility *)self movie];
  [v9 setMetadata:v8];

  return 1;
}

void __44__MIOMovieMetadataUtility_setMovieMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 identifier];
  BOOL v4 = +[MOVStreamIOUtility isMOVStreamIOMovMetadataIdentifier:v3];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (BOOL)addMovieMetadataItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MIOMovieMetadataUtility *)self movie];
  id v6 = [v5 metadata];
  id v7 = (void *)[v6 mutableCopy];

  [v7 addObject:v4];
  id v8 = [(MIOMovieMetadataUtility *)self movie];
  [v8 setMetadata:v7];

  return 1;
}

- (BOOL)applyChangesError:(id *)a3
{
  id v5 = [(MIOMovieMetadataUtility *)self movie];
  id v6 = [(MIOMovieMetadataUtility *)self movie];
  id v7 = [v6 URL];
  LOBYTE(a3) = [v5 writeMovieHeaderToURL:v7 fileType:*MEMORY[0x263EF9898] options:0 error:a3];

  return (char)a3;
}

- (AVMutableMovie)movie
{
  return (AVMutableMovie *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMovie:(id)a3
{
}

- (void).cxx_destruct
{
}

@end