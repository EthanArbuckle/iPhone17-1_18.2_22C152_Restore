@interface MPModelLibraryPlaylistEditTrackDataSource
- (MPModelLibraryPlaylistEditTrackDataSource)initWithTrackObjects:(id)a3;
- (id)description;
- (void)loadEntriesWithCompletion:(id)a3;
@end

@implementation MPModelLibraryPlaylistEditTrackDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);

  objc_storeStrong((id *)&self->_playlistEntries, 0);
}

- (void)loadEntriesWithCompletion:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPModelLibraryPlaylistEditDataSource *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@ %p : %@>{\n", v4, self, v5];

  return v6;
}

- (MPModelLibraryPlaylistEditTrackDataSource)initWithTrackObjects:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 firstObject];
  v7 = [v6 identifiers];

  v8 = [v7 library];
  uint64_t v9 = [v8 persistentID];

  if (v9)
  {
    v10 = NSString;
    v11 = [v7 library];
    objc_msgSend(v10, "stringWithFormat:", @"l.%lld", objc_msgSend(v11, "persistentID"));
LABEL_5:
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v12 = [v7 universalStore];
  uint64_t v13 = [v12 subscriptionAdamID];

  if (v13)
  {
    v14 = NSString;
    v11 = [v7 universalStore];
    objc_msgSend(v14, "stringWithFormat:", @"s.%lld", objc_msgSend(v11, "subscriptionAdamID"));
    goto LABEL_5;
  }
  v15 = @"u";
LABEL_6:
  v16 = NSString;
  v17 = MSVNanoIDCreateTaggedPointer();
  v18 = [v16 stringWithFormat:@"t-%@-%@", v15, v17];

  v43.receiver = self;
  v43.super_class = (Class)MPModelLibraryPlaylistEditTrackDataSource;
  v19 = [(MPModelLibraryPlaylistEditDataSource *)&v43 initWithIdentifier:v18];
  if (v19)
  {
    v36 = v18;
    SEL v35 = a2;
    v37 = v7;
    uint64_t v20 = [v5 copy];
    tracks = v19->_tracks;
    v19->_tracks = (NSArray *)v20;

    v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v38 = v5;
    id v23 = v5;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v39 + 1) + 8 * v27);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v31 = [MEMORY[0x1E4F28B00] currentHandler];
            [v31 handleFailureInMethod:v35, v19, @"MPModelLibraryPlaylistEditTrackDataSource.m", 40, @"Object is not a song track: %@", objc_opt_class() object file lineNumber description];
          }
          id v29 = [(MPModelLibraryPlaylistEditDataSource *)v19 newPlaylistEntryForTrack:v28];
          if (v29)
          {
            [v22 addObject:v29];
          }
          else
          {
            v30 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v19;
              __int16 v46 = 2114;
              uint64_t v47 = v28;
              _os_log_impl(&dword_1952E8000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create playlist entry for track object %{public}@", buf, 0x16u);
            }
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v25);
    }

    uint64_t v32 = [v22 copy];
    playlistEntries = v19->_playlistEntries;
    v19->_playlistEntries = (NSArray *)v32;

    v7 = v37;
    id v5 = v38;
    v18 = v36;
  }

  return v19;
}

@end