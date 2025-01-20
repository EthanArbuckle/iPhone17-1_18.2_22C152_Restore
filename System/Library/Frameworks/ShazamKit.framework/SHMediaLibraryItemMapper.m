@interface SHMediaLibraryItemMapper
+ (id)libraryGroupFromShazamLibraryGroup:(id)a3;
+ (id)libraryTrackFromShazamLibraryTrack:(id)a3;
+ (id)shazamLibraryGroupFromLibraryGroup:(id)a3;
+ (id)shazamLibraryTrackFromLibraryTrack:(id)a3;
@end

@implementation SHMediaLibraryItemMapper

+ (id)shazamLibraryTrackFromLibraryTrack:(id)a3
{
  id v3 = a3;
  v4 = [v3 metadata];

  if (v4)
  {
    v5 = [SHLLibraryItemMetadata alloc];
    v6 = [v3 metadata];
    v7 = [v6 encodedSystemData];
    v8 = [(SHLLibraryItemMetadata *)v5 initWithEncodedSystemData:v7];

    v9 = [SHLMutableLibraryTrack alloc];
    v10 = [v3 identifier];
    v11 = [(SHLLibraryTrack *)v9 initWithIdentifier:v10 metadata:v8];
  }
  else
  {
    v12 = [SHLMutableLibraryTrack alloc];
    v8 = [v3 identifier];
    v11 = [(SHLLibraryTrack *)v12 initWithIdentifier:v8];
  }

  v13 = [v3 shazamKey];

  if (!v13)
  {
    v37 = [v3 identifier];
    v38 = +[NSString stringWithFormat:@"A valid Shazam track requires a ShazamID. Library item (%@) is missing a ShazamID.", v37];
    id v39 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v38 userInfo:0];

    objc_exception_throw(v39);
  }
  v14 = [v3 shazamKey];
  v15 = [v14 validatedKey];
  v16 = +[SHLShazamKey keyWithValue:v15];
  [(SHLLibraryTrack *)v11 setShazamKey:v16];

  v17 = [v3 recognitionIdentifier];
  [(SHLLibraryTrack *)v11 setRecognitionIdentifier:v17];

  v18 = [v3 creationDate];
  [(SHLLibraryTrack *)v11 setDate:v18];

  v19 = [v3 title];
  [(SHLLibraryTrack *)v11 setTitle:v19];

  v20 = [v3 subtitle];
  [(SHLLibraryTrack *)v11 setSubtitle:v20];

  v21 = [v3 providerIdentifier];
  [(SHLLibraryTrack *)v11 setProviderIdentifier:v21];

  v22 = [v3 providerName];
  [(SHLLibraryTrack *)v11 setProviderName:v22];

  v23 = [v3 associatedGroupIdentifier];
  [(SHLLibraryTrack *)v11 setAssociatedGroupIdentifier:v23];

  v24 = [v3 location];
  [(SHLLibraryTrack *)v11 setLocation:v24];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v25 = [v3 labels];
  id v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v41;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v31 = [SHLLibraryLabel alloc];
        uint64_t v32 = [v30 name];
        v33 = [(SHLLibraryLabel *)v31 initWithName:v32];

        v34 = [(SHLLibraryTrack *)v11 labels];
        LOBYTE(v32) = [v34 containsObject:v33];

        if ((v32 & 1) == 0) {
          [(SHLLibraryTrack *)v11 addLabel:v33];
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v27);
  }

  id v35 = [(SHLMutableLibraryTrack *)v11 copy];

  return v35;
}

+ (id)libraryTrackFromShazamLibraryTrack:(id)a3
{
  id v3 = a3;
  id v4 = [v3 metadata];

  if (v4)
  {
    id v5 = objc_alloc((Class)SHMediaLibraryItemMetadata);
    v6 = [v3 metadata];
    v7 = [v6 encodedSystemData];
    id v4 = [v5 initWithEncodedSystemData:v7];
  }
  v8 = [v3 labels];
  v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v10 = objc_msgSend(v3, "labels", 0);
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v16 = objc_alloc((Class)SHMediaLibraryLabel);
        v17 = [v15 name];
        id v18 = [v16 initWithName:v17];

        [v9 addObject:v18];
      }
      id v12 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }

  id v19 = objc_alloc((Class)SHMediaLibraryTrack);
  v20 = [v3 identifier];
  id v21 = [v9 copy];
  id v22 = [v19 _initWithIdentifier:v20 metadata:v4 labels:v21];

  v23 = [v3 shazamKey];

  if (v23)
  {
    id v24 = objc_alloc((Class)SHShazamKey);
    v25 = [v3 shazamKey];
    id v26 = [v25 validatedKey];
    id v27 = [v24 initWithKey:v26];
    [v22 setShazamKey:v27];
  }
  uint64_t v28 = [v3 providerIdentifier];
  [v22 setProviderIdentifier:v28];

  v29 = [v3 providerName];
  [v22 setProviderName:v29];

  v30 = [v3 date];
  [v22 setCreationDate:v30];

  v31 = [v3 recognitionIdentifier];
  [v22 setRecognitionIdentifier:v31];

  uint64_t v32 = [v3 title];
  [v22 setTitle:v32];

  v33 = [v3 subtitle];
  [v22 setSubtitle:v33];

  v34 = [v3 associatedGroupIdentifier];
  [v22 setAssociatedGroupIdentifier:v34];

  id v35 = [v3 location];
  [v22 setLocation:v35];

  return v22;
}

+ (id)shazamLibraryGroupFromLibraryGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metadata];

  if (v5)
  {
    v6 = [SHLLibraryItemMetadata alloc];
    v7 = [v4 metadata];
    v8 = [v7 encodedSystemData];
    id v5 = [(SHLLibraryItemMetadata *)v6 initWithEncodedSystemData:v8];
  }
  v9 = [v4 tracksToSave];
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = objc_msgSend(v4, "tracksToSave", 0);
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [a1 shazamLibraryTrackFromLibraryTrack:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  v17 = [SHLLibraryGroup alloc];
  id v18 = [v4 identifier];
  id v19 = [v10 copy];
  id v20 = [(SHLLibraryGroup *)v17 _initWithIdentifier:v18 metadata:v5 tracksToSave:v19];

  return v20;
}

+ (id)libraryGroupFromShazamLibraryGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metadata];

  if (v5)
  {
    id v6 = objc_alloc((Class)SHMediaLibraryItemMetadata);
    v7 = [v4 metadata];
    v8 = [v7 encodedSystemData];
    id v5 = [v6 initWithEncodedSystemData:v8];
  }
  v9 = [v4 tracksToSave];
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = objc_msgSend(v4, "tracksToSave", 0);
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [a1 libraryTrackFromShazamLibraryTrack:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v17 = objc_alloc((Class)SHMediaLibraryGroup);
  id v18 = [v4 identifier];
  id v19 = [v10 copy];
  id v20 = [v17 _initWithIdentifier:v18 metadata:v5 tracksToSave:v19];

  return v20;
}

@end