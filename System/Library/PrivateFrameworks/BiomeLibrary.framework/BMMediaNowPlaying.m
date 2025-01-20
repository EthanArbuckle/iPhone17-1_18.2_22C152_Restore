@interface BMMediaNowPlaying
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMediaNowPlaying)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMediaNowPlaying)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 playbackState:(int)a5 album:(id)a6 artist:(id)a7 duration:(id)a8 genre:(id)a9 title:(id)a10 elapsed:(id)a11 mediaType:(id)a12 iTunesStoreIdentifier:(id)a13 iTunesSubscriptionIdentifier:(id)a14 isAirPlayVideo:(id)a15 outputDevices:(id)a16 bundleID:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isRemoteControl:(id)a21 itemMediaType:(int)a22 itemMediaSubtype:(int)a23;
- (BMMediaNowPlaying)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 playbackState:(int)a5 album:(id)a6 artist:(id)a7 duration:(id)a8 genre:(id)a9 title:(id)a10 elapsed:(id)a11 mediaType:(id)a12 iTunesStoreIdentifier:(id)a13 iTunesSubscriptionIdentifier:(id)a14 isAirPlayVideo:(id)a15 outputDevices:(id)a16 bundleID:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isRemoteControl:(id)a21 itemMediaType:(int)a22 itemMediaSubtype:(int)a23 isAirPlayActive:(id)a24 parentGroupContainsDiscoverableGroupLeader:(id)a25;
- (BOOL)hasDuration;
- (BOOL)hasElapsed;
- (BOOL)hasIsAirPlayActive;
- (BOOL)hasIsAirPlayVideo;
- (BOOL)hasIsRemoteControl;
- (BOOL)hasParentGroupContainsDiscoverableGroupLeader;
- (BOOL)isAirPlayActive;
- (BOOL)isAirPlayVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoteControl;
- (BOOL)parentGroupContainsDiscoverableGroupLeader;
- (NSArray)outputDevices;
- (NSDate)absoluteTimestamp;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleID;
- (NSString)description;
- (NSString)genre;
- (NSString)groupIdentifier;
- (NSString)iTunesAlbumIdentifier;
- (NSString)iTunesArtistIdentifier;
- (NSString)iTunesStoreIdentifier;
- (NSString)iTunesSubscriptionIdentifier;
- (NSString)mediaType;
- (NSString)title;
- (NSString)uniqueID;
- (id)_outputDevicesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)itemMediaSubtype;
- (int)itemMediaType;
- (int)playbackState;
- (unsigned)dataVersion;
- (unsigned)duration;
- (unsigned)elapsed;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasElapsed:(BOOL)a3;
- (void)setHasIsAirPlayActive:(BOOL)a3;
- (void)setHasIsAirPlayVideo:(BOOL)a3;
- (void)setHasIsRemoteControl:(BOOL)a3;
- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMediaNowPlaying

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_hasParentGroupContainsDiscoverableGroupLeader = a3;
}

- (BOOL)hasParentGroupContainsDiscoverableGroupLeader
{
  return self->_hasParentGroupContainsDiscoverableGroupLeader;
}

- (BOOL)parentGroupContainsDiscoverableGroupLeader
{
  return self->_parentGroupContainsDiscoverableGroupLeader;
}

- (void)setHasIsAirPlayActive:(BOOL)a3
{
  self->_hasIsAirPlayActive = a3;
}

- (BOOL)hasIsAirPlayActive
{
  return self->_hasIsAirPlayActive;
}

- (BOOL)isAirPlayActive
{
  return self->_isAirPlayActive;
}

- (int)itemMediaSubtype
{
  return self->_itemMediaSubtype;
}

- (int)itemMediaType
{
  return self->_itemMediaType;
}

- (void)setHasIsRemoteControl:(BOOL)a3
{
  self->_hasIsRemoteControl = a3;
}

- (BOOL)hasIsRemoteControl
{
  return self->_hasIsRemoteControl;
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)iTunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier;
}

- (NSString)iTunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (void)setHasIsAirPlayVideo:(BOOL)a3
{
  self->_hasIsAirPlayVideo = a3;
}

- (BOOL)hasIsAirPlayVideo
{
  return self->_hasIsAirPlayVideo;
}

- (BOOL)isAirPlayVideo
{
  return self->_isAirPlayVideo;
}

- (NSString)iTunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setHasElapsed:(BOOL)a3
{
  self->_hasElapsed = a3;
}

- (BOOL)hasElapsed
{
  return self->_hasElapsed;
}

- (unsigned)elapsed
{
  return self->_elapsed;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)album
{
  return self->_album;
}

- (int)playbackState
{
  return self->_playbackState;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMMediaNowPlaying *)self uniqueID];
    uint64_t v7 = [v5 uniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMediaNowPlaying *)self uniqueID];
      v10 = [v5 uniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_92;
      }
    }
    v13 = [(BMMediaNowPlaying *)self absoluteTimestamp];
    uint64_t v14 = [v5 absoluteTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMediaNowPlaying *)self absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_92;
      }
    }
    int v19 = [(BMMediaNowPlaying *)self playbackState];
    if (v19 == [v5 playbackState])
    {
      v20 = [(BMMediaNowPlaying *)self album];
      uint64_t v21 = [v5 album];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMMediaNowPlaying *)self album];
        v24 = [v5 album];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_92;
        }
      }
      v26 = [(BMMediaNowPlaying *)self artist];
      uint64_t v27 = [v5 artist];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMMediaNowPlaying *)self artist];
        v30 = [v5 artist];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_92;
        }
      }
      if (-[BMMediaNowPlaying hasDuration](self, "hasDuration") || [v5 hasDuration])
      {
        if (![(BMMediaNowPlaying *)self hasDuration]) {
          goto LABEL_92;
        }
        if (![v5 hasDuration]) {
          goto LABEL_92;
        }
        unsigned int v32 = [(BMMediaNowPlaying *)self duration];
        if (v32 != [v5 duration]) {
          goto LABEL_92;
        }
      }
      v33 = [(BMMediaNowPlaying *)self genre];
      uint64_t v34 = [v5 genre];
      if (v33 == (void *)v34)
      {
      }
      else
      {
        v35 = (void *)v34;
        v36 = [(BMMediaNowPlaying *)self genre];
        v37 = [v5 genre];
        int v38 = [v36 isEqual:v37];

        if (!v38) {
          goto LABEL_92;
        }
      }
      v39 = [(BMMediaNowPlaying *)self title];
      uint64_t v40 = [v5 title];
      if (v39 == (void *)v40)
      {
      }
      else
      {
        v41 = (void *)v40;
        v42 = [(BMMediaNowPlaying *)self title];
        v43 = [v5 title];
        int v44 = [v42 isEqual:v43];

        if (!v44) {
          goto LABEL_92;
        }
      }
      if (-[BMMediaNowPlaying hasElapsed](self, "hasElapsed") || [v5 hasElapsed])
      {
        if (![(BMMediaNowPlaying *)self hasElapsed]) {
          goto LABEL_92;
        }
        if (![v5 hasElapsed]) {
          goto LABEL_92;
        }
        unsigned int v45 = [(BMMediaNowPlaying *)self elapsed];
        if (v45 != [v5 elapsed]) {
          goto LABEL_92;
        }
      }
      v46 = [(BMMediaNowPlaying *)self mediaType];
      uint64_t v47 = [v5 mediaType];
      if (v46 == (void *)v47)
      {
      }
      else
      {
        v48 = (void *)v47;
        v49 = [(BMMediaNowPlaying *)self mediaType];
        v50 = [v5 mediaType];
        int v51 = [v49 isEqual:v50];

        if (!v51) {
          goto LABEL_92;
        }
      }
      v52 = [(BMMediaNowPlaying *)self iTunesStoreIdentifier];
      uint64_t v53 = [v5 iTunesStoreIdentifier];
      if (v52 == (void *)v53)
      {
      }
      else
      {
        v54 = (void *)v53;
        v55 = [(BMMediaNowPlaying *)self iTunesStoreIdentifier];
        v56 = [v5 iTunesStoreIdentifier];
        int v57 = [v55 isEqual:v56];

        if (!v57) {
          goto LABEL_92;
        }
      }
      v58 = [(BMMediaNowPlaying *)self iTunesSubscriptionIdentifier];
      uint64_t v59 = [v5 iTunesSubscriptionIdentifier];
      if (v58 == (void *)v59)
      {
      }
      else
      {
        v60 = (void *)v59;
        v61 = [(BMMediaNowPlaying *)self iTunesSubscriptionIdentifier];
        v62 = [v5 iTunesSubscriptionIdentifier];
        int v63 = [v61 isEqual:v62];

        if (!v63) {
          goto LABEL_92;
        }
      }
      if ([(BMMediaNowPlaying *)self hasIsAirPlayVideo]
        || [v5 hasIsAirPlayVideo])
      {
        if (![(BMMediaNowPlaying *)self hasIsAirPlayVideo]) {
          goto LABEL_92;
        }
        if (![v5 hasIsAirPlayVideo]) {
          goto LABEL_92;
        }
        int v64 = [(BMMediaNowPlaying *)self isAirPlayVideo];
        if (v64 != [v5 isAirPlayVideo]) {
          goto LABEL_92;
        }
      }
      v65 = [(BMMediaNowPlaying *)self outputDevices];
      uint64_t v66 = [v5 outputDevices];
      if (v65 == (void *)v66)
      {
      }
      else
      {
        v67 = (void *)v66;
        v68 = [(BMMediaNowPlaying *)self outputDevices];
        v69 = [v5 outputDevices];
        int v70 = [v68 isEqual:v69];

        if (!v70) {
          goto LABEL_92;
        }
      }
      v71 = [(BMMediaNowPlaying *)self bundleID];
      uint64_t v72 = [v5 bundleID];
      if (v71 == (void *)v72)
      {
      }
      else
      {
        v73 = (void *)v72;
        v74 = [(BMMediaNowPlaying *)self bundleID];
        v75 = [v5 bundleID];
        int v76 = [v74 isEqual:v75];

        if (!v76) {
          goto LABEL_92;
        }
      }
      v77 = [(BMMediaNowPlaying *)self iTunesArtistIdentifier];
      uint64_t v78 = [v5 iTunesArtistIdentifier];
      if (v77 == (void *)v78)
      {
      }
      else
      {
        v79 = (void *)v78;
        v80 = [(BMMediaNowPlaying *)self iTunesArtistIdentifier];
        v81 = [v5 iTunesArtistIdentifier];
        int v82 = [v80 isEqual:v81];

        if (!v82) {
          goto LABEL_92;
        }
      }
      v83 = [(BMMediaNowPlaying *)self iTunesAlbumIdentifier];
      uint64_t v84 = [v5 iTunesAlbumIdentifier];
      if (v83 == (void *)v84)
      {
      }
      else
      {
        v85 = (void *)v84;
        v86 = [(BMMediaNowPlaying *)self iTunesAlbumIdentifier];
        v87 = [v5 iTunesAlbumIdentifier];
        int v88 = [v86 isEqual:v87];

        if (!v88) {
          goto LABEL_92;
        }
      }
      v89 = [(BMMediaNowPlaying *)self groupIdentifier];
      uint64_t v90 = [v5 groupIdentifier];
      if (v89 == (void *)v90)
      {
      }
      else
      {
        v91 = (void *)v90;
        v92 = [(BMMediaNowPlaying *)self groupIdentifier];
        v93 = [v5 groupIdentifier];
        int v94 = [v92 isEqual:v93];

        if (!v94) {
          goto LABEL_92;
        }
      }
      if (![(BMMediaNowPlaying *)self hasIsRemoteControl]
        && ![v5 hasIsRemoteControl]
        || [(BMMediaNowPlaying *)self hasIsRemoteControl]
        && [v5 hasIsRemoteControl]
        && (int v95 = [(BMMediaNowPlaying *)self isRemoteControl],
            v95 == [v5 isRemoteControl]))
      {
        int v96 = [(BMMediaNowPlaying *)self itemMediaType];
        if (v96 == [v5 itemMediaType])
        {
          int v97 = [(BMMediaNowPlaying *)self itemMediaSubtype];
          if (v97 == [v5 itemMediaSubtype])
          {
            if (![(BMMediaNowPlaying *)self hasIsAirPlayActive]
              && ![v5 hasIsAirPlayActive]
              || [(BMMediaNowPlaying *)self hasIsAirPlayActive]
              && [v5 hasIsAirPlayActive]
              && (int v98 = [(BMMediaNowPlaying *)self isAirPlayActive],
                  v98 == [v5 isAirPlayActive]))
            {
              if (!-[BMMediaNowPlaying hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader")&& ![v5 hasParentGroupContainsDiscoverableGroupLeader])
              {
                LOBYTE(v12) = 1;
                goto LABEL_93;
              }
              if (-[BMMediaNowPlaying hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader")&& [v5 hasParentGroupContainsDiscoverableGroupLeader])
              {
                BOOL v99 = [(BMMediaNowPlaying *)self parentGroupContainsDiscoverableGroupLeader];
                int v12 = v99 ^ [v5 parentGroupContainsDiscoverableGroupLeader] ^ 1;
LABEL_93:

                goto LABEL_94;
              }
            }
          }
        }
      }
    }
LABEL_92:
    LOBYTE(v12) = 0;
    goto LABEL_93;
  }
  LOBYTE(v12) = 0;
LABEL_94:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v81[23] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMediaNowPlaying *)self uniqueID];
  id v4 = [(BMMediaNowPlaying *)self absoluteTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMMediaNowPlaying *)self absoluteTimestamp];
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaNowPlaying playbackState](self, "playbackState"));
  v9 = [(BMMediaNowPlaying *)self album];
  uint64_t v10 = [(BMMediaNowPlaying *)self artist];
  if ([(BMMediaNowPlaying *)self hasDuration])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMediaNowPlaying duration](self, "duration"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = [(BMMediaNowPlaying *)self genre];
  v79 = [(BMMediaNowPlaying *)self title];
  if ([(BMMediaNowPlaying *)self hasElapsed])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMediaNowPlaying elapsed](self, "elapsed"));
    id v78 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v78 = 0;
  }
  v77 = [(BMMediaNowPlaying *)self mediaType];
  int v76 = [(BMMediaNowPlaying *)self iTunesStoreIdentifier];
  v75 = [(BMMediaNowPlaying *)self iTunesSubscriptionIdentifier];
  if ([(BMMediaNowPlaying *)self hasIsAirPlayVideo])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying isAirPlayVideo](self, "isAirPlayVideo"));
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v74 = 0;
  }
  v73 = [(BMMediaNowPlaying *)self _outputDevicesJSONArray];
  uint64_t v72 = [(BMMediaNowPlaying *)self bundleID];
  v71 = [(BMMediaNowPlaying *)self iTunesArtistIdentifier];
  int v70 = [(BMMediaNowPlaying *)self iTunesAlbumIdentifier];
  v69 = [(BMMediaNowPlaying *)self groupIdentifier];
  if ([(BMMediaNowPlaying *)self hasIsRemoteControl])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying isRemoteControl](self, "isRemoteControl"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v68 = 0;
  }
  v67 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaNowPlaying itemMediaType](self, "itemMediaType"));
  uint64_t v66 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMediaNowPlaying itemMediaSubtype](self, "itemMediaSubtype"));
  if ([(BMMediaNowPlaying *)self hasIsAirPlayActive])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying isAirPlayActive](self, "isAirPlayActive"));
    id v65 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v65 = 0;
  }
  if ([(BMMediaNowPlaying *)self hasParentGroupContainsDiscoverableGroupLeader])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  v80[0] = @"uniqueID";
  uint64_t v14 = v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v53 = (void *)v14;
  v81[0] = v14;
  v80[1] = @"absoluteTimestamp";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v15;
  v81[1] = v15;
  v80[2] = @"playbackState";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v51 = (void *)v16;
  v81[2] = v16;
  v80[3] = @"album";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v17;
  v81[3] = v17;
  v80[4] = @"artist";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v18;
  v81[4] = v18;
  v80[5] = @"duration";
  uint64_t v19 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v19;
  v81[5] = v19;
  v80[6] = @"genre";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v47 = (void *)v20;
  v81[6] = v20;
  v80[7] = @"title";
  uint64_t v21 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[7] = v21;
  v80[8] = @"elapsed";
  uint64_t v22 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[8] = v22;
  v80[9] = @"mediaType";
  uint64_t v23 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v59 = (void *)v23;
  v81[9] = v23;
  v80[10] = @"iTunesStoreIdentifier";
  uint64_t v24 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v24;
  v81[10] = v24;
  v80[11] = @"iTunesSubscriptionIdentifier";
  uint64_t v25 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v57 = (void *)v25;
  v81[11] = v25;
  v80[12] = @"isAirPlayVideo";
  uint64_t v26 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  int v63 = (void *)v3;
  v81[12] = v26;
  v80[13] = @"outputDevices";
  uint64_t v27 = (uint64_t)v73;
  v28 = (void *)v26;
  if (!v73)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v10;
  v81[13] = v27;
  v80[14] = @"bundleID";
  uint64_t v29 = (uint64_t)v72;
  v30 = (void *)v27;
  if (!v72)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = v7;
  v56 = (void *)v29;
  v81[14] = v29;
  v80[15] = @"iTunesArtistIdentifier";
  uint64_t v31 = (uint64_t)v71;
  if (!v71)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  int v64 = v13;
  v81[15] = v31;
  v80[16] = @"iTunesAlbumIdentifier";
  uint64_t v32 = (uint64_t)v70;
  if (!v70)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v21;
  v81[16] = v32;
  v80[17] = @"groupIdentifier";
  uint64_t v33 = (uint64_t)v69;
  if (!v69)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v45 = (void *)v22;
  uint64_t v42 = v33;
  v81[17] = v33;
  v80[18] = @"isRemoteControl";
  uint64_t v34 = v68;
  if (!v68)
  {
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v33);
  }
  int v44 = v30;
  v60 = (void *)v12;
  v81[18] = v34;
  v80[19] = @"itemMediaType";
  v35 = v67;
  if (!v67)
  {
    v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v32;
  v36 = v11;
  v81[19] = v35;
  v80[20] = @"itemMediaSubtype";
  v37 = v66;
  if (!v66)
  {
    v37 = [MEMORY[0x1E4F1CA98] null];
  }
  int v38 = (void *)v31;
  v81[20] = v37;
  v80[21] = @"isAirPlayActive";
  v39 = v65;
  if (!v65)
  {
    v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[21] = v39;
  v80[22] = @"parentGroupContainsDiscoverableGroupLeader";
  uint64_t v40 = v64;
  if (!v64)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v81[22] = v40;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v81, v80, 23, v42);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  if (!v64) {

  }
  if (!v65) {
  if (!v66)
  }

  if (!v67) {
  if (!v68)
  }

  if (!v69) {
  if (!v70)
  }

  if (!v71) {
  if (!v72)
  }

  if (!v73) {
  if (!v74)
  }

  if (!v75) {
  if (!v76)
  }

  if (!v77) {
  if (!v78)
  }

  if (v79)
  {
    if (v60) {
      goto LABEL_100;
    }
  }
  else
  {

    if (v60)
    {
LABEL_100:
      if (v36) {
        goto LABEL_101;
      }
      goto LABEL_111;
    }
  }

  if (v36)
  {
LABEL_101:
    if (v61) {
      goto LABEL_102;
    }
    goto LABEL_112;
  }
LABEL_111:

  if (v61)
  {
LABEL_102:
    if (v9) {
      goto LABEL_103;
    }
    goto LABEL_113;
  }
LABEL_112:

  if (v9)
  {
LABEL_103:
    if (v8) {
      goto LABEL_104;
    }
    goto LABEL_114;
  }
LABEL_113:

  if (v8)
  {
LABEL_104:
    if (v62) {
      goto LABEL_105;
    }
LABEL_115:

    if (v63) {
      goto LABEL_106;
    }
    goto LABEL_116;
  }
LABEL_114:

  if (!v62) {
    goto LABEL_115;
  }
LABEL_105:
  if (v63) {
    goto LABEL_106;
  }
LABEL_116:

LABEL_106:

  return v54;
}

- (id)_outputDevicesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMediaNowPlaying *)self outputDevices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMediaNowPlaying)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v335[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v279 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (!v279 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v279;
LABEL_4:
    uint64_t v7 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v275 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v8 doubleValue];
      id v275 = (id)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      id v14 = v7;
      id v275 = [v8 dateFromString:v14];

      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v275 = v7;
LABEL_16:
      uint64_t v15 = [v5 objectForKeyedSubscript:@"playbackState"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v273 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v273 = v15;
LABEL_23:

LABEL_24:
        uint64_t v17 = [v5 objectForKeyedSubscript:@"album"];
        v276 = v17;
        id v271 = v6;
        if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v274 = 0;
          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v274 = v17;
LABEL_27:
          uint64_t v18 = [v5 objectForKeyedSubscript:@"artist"];
          v272 = (void *)v18;
          if (!v18 || (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v20 = 0;
            goto LABEL_30;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
LABEL_30:
            uint64_t v21 = [v5 objectForKeyedSubscript:@"duration"];
            v269 = (void *)v21;
            if (!v21 || (uint64_t v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v270 = 0;
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v270 = v22;
LABEL_33:
              uint64_t v23 = [v5 objectForKeyedSubscript:@"genre"];
              v268 = (void *)v23;
              if (!v23 || (uint64_t v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v264 = 0;
LABEL_36:
                uint64_t v25 = [v5 objectForKeyedSubscript:@"title"];
                v263 = (void *)v25;
                id v260 = v20;
                if (!v25)
                {
                  id v262 = 0;
                  uint64_t v27 = v270;
                  goto LABEL_50;
                }
                uint64_t v26 = (void *)v25;
                objc_opt_class();
                uint64_t v27 = v270;
                if (objc_opt_isKindOfClass())
                {
                  id v262 = 0;
                  goto LABEL_50;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v262 = v26;
LABEL_50:
                  uint64_t v28 = [v5 objectForKeyedSubscript:@"elapsed"];
                  v259 = (void *)v28;
                  if (!v28 || (uint64_t v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v258 = 0;
LABEL_53:
                    uint64_t v30 = [v5 objectForKeyedSubscript:@"mediaType"];
                    v255 = self;
                    v257 = (void *)v30;
                    if (v30 && (uint64_t v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v270 = v27;
                        if (!a4)
                        {
                          id v256 = 0;
                          long long v13 = 0;
                          long long v12 = v275;
                          uint64_t v66 = v273;
LABEL_221:
                          id v20 = v260;
                          goto LABEL_222;
                        }
                        v253 = v15;
                        id v109 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v110 = *MEMORY[0x1E4F502C8];
                        uint64_t v316 = *MEMORY[0x1E4F28568];
                        id v34 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mediaType"];
                        id v317 = v34;
                        uint64_t v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v317 forKeys:&v316 count:1];
                        v112 = v109;
                        uint64_t v15 = v253;
                        uint64_t v113 = v110;
                        uint64_t v17 = v276;
                        v254 = (void *)v111;
                        id v256 = 0;
                        long long v13 = 0;
                        *a4 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                        goto LABEL_149;
                      }
                      id v256 = v31;
                    }
                    else
                    {
                      id v256 = 0;
                    }
                    uint64_t v32 = [v5 objectForKeyedSubscript:@"iTunesStoreIdentifier"];
                    v254 = (void *)v32;
                    if (!v32 || (uint64_t v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v34 = 0;
LABEL_59:
                      uint64_t v35 = [v5 objectForKeyedSubscript:@"iTunesSubscriptionIdentifier"];
                      v250 = (void *)v35;
                      if (v35 && (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          v270 = v27;
                          if (!a4)
                          {
                            id v37 = 0;
                            long long v13 = 0;
                            long long v12 = v275;
                            uint64_t v66 = v273;
LABEL_219:

                            goto LABEL_220;
                          }
                          v127 = v15;
                          id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v129 = *MEMORY[0x1E4F502C8];
                          uint64_t v312 = *MEMORY[0x1E4F28568];
                          id v249 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"iTunesSubscriptionIdentifier"];
                          id v313 = v249;
                          uint64_t v130 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v313 forKeys:&v312 count:1];
                          v131 = v128;
                          uint64_t v15 = v127;
                          int v38 = (void *)v130;
                          uint64_t v132 = v129;
                          uint64_t v17 = v276;
                          id v37 = 0;
                          long long v13 = 0;
                          *a4 = (id)[v131 initWithDomain:v132 code:2 userInfo:v130];
                          long long v12 = v275;
                          uint64_t v66 = v273;
                          goto LABEL_217;
                        }
                        id v37 = v36;
                      }
                      else
                      {
                        id v37 = 0;
                      }
                      int v38 = [v5 objectForKeyedSubscript:@"isAirPlayVideo"];
                      v251 = v15;
                      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (a4)
                          {
                            id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v266 = *MEMORY[0x1E4F502C8];
                            uint64_t v310 = *MEMORY[0x1E4F28568];
                            id v134 = v34;
                            id v135 = [NSString alloc];
                            uint64_t v215 = objc_opt_class();
                            v136 = v135;
                            id v34 = v134;
                            id obj = (id)[v136 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v215, @"isAirPlayVideo"];
                            id v311 = obj;
                            uint64_t v137 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v311 forKeys:&v310 count:1];
                            uint64_t v138 = v266;
                            uint64_t v17 = v276;
                            v267 = (void *)v137;
                            id v249 = 0;
                            long long v13 = 0;
                            *a4 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v138, 2);
                            long long v12 = v275;
                            uint64_t v15 = v251;
                            uint64_t v66 = v273;

                            goto LABEL_216;
                          }
                          id v249 = 0;
                          long long v13 = 0;
                          long long v12 = v275;
                          uint64_t v66 = v273;
LABEL_217:

                          goto LABEL_218;
                        }
                        id v249 = v38;
                      }
                      else
                      {
                        id v249 = 0;
                      }
                      v39 = [v5 objectForKeyedSubscript:@"outputDevices"];
                      uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
                      int v41 = [v39 isEqual:v40];

                      id v248 = v34;
                      if (v41)
                      {
                        id v238 = v37;
                        v240 = v38;
                        v242 = v7;

                        v39 = 0;
LABEL_84:
                        v265 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v39, "count"));
                        long long v281 = 0u;
                        long long v282 = 0u;
                        long long v283 = 0u;
                        long long v284 = 0u;
                        id v76 = v39;
                        uint64_t v77 = [v76 countByEnumeratingWithState:&v281 objects:v307 count:16];
                        id obj = v76;
                        if (!v77) {
                          goto LABEL_94;
                        }
                        uint64_t v78 = v77;
                        uint64_t v79 = *(void *)v282;
LABEL_86:
                        uint64_t v80 = 0;
                        while (1)
                        {
                          if (*(void *)v282 != v79) {
                            objc_enumerationMutation(obj);
                          }
                          v81 = *(void **)(*((void *)&v281 + 1) + 8 * v80);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            break;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v139 = a4;
                            if (a4)
                            {
                              id v140 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v141 = *MEMORY[0x1E4F502C8];
                              uint64_t v303 = *MEMORY[0x1E4F28568];
                              id v82 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"outputDevices"];
                              id v304 = v82;
                              v142 = (void *)MEMORY[0x1E4F1C9E8];
                              v143 = &v304;
                              v144 = &v303;
                              goto LABEL_133;
                            }
                            goto LABEL_143;
                          }
                          id v82 = v81;
                          v83 = [BMMediaNowPlayingOutputDevice alloc];
                          id v280 = 0;
                          uint64_t v84 = [(BMMediaNowPlayingOutputDevice *)v83 initWithJSONDictionary:v82 error:&v280];
                          id v85 = v280;
                          if (v85)
                          {
                            id v88 = v85;
                            if (a4) {
                              *a4 = v85;
                            }

                            long long v13 = 0;
                            id v237 = obj;
                            uint64_t v7 = v242;
                            long long v12 = v275;
                            uint64_t v17 = v276;
                            goto LABEL_138;
                          }
                          [v265 addObject:v84];

                          ++v80;
                          uint64_t v17 = v276;
                          if (v78 == v80)
                          {
                            id v76 = obj;
                            uint64_t v78 = [obj countByEnumeratingWithState:&v281 objects:v307 count:16];
                            if (v78) {
                              goto LABEL_86;
                            }
LABEL_94:

                            id v82 = [v5 objectForKeyedSubscript:@"bundleID"];
                            if (!v82 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v237 = 0;
                              goto LABEL_97;
                            }
                            objc_opt_class();
                            id v37 = v238;
                            if (objc_opt_isKindOfClass())
                            {
                              id v237 = v82;
LABEL_97:
                              uint64_t v86 = [v5 objectForKeyedSubscript:@"iTunesArtistIdentifier"];
                              v235 = (void *)v86;
                              if (!v86)
                              {
                                id v88 = 0;
                                uint64_t v7 = v242;
                                goto LABEL_153;
                              }
                              v87 = (void *)v86;
                              objc_opt_class();
                              uint64_t v7 = v242;
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v88 = v87;
                                  goto LABEL_153;
                                }
                                if (a4)
                                {
                                  id v165 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v166 = *MEMORY[0x1E4F502C8];
                                  uint64_t v299 = *MEMORY[0x1E4F28568];
                                  id v167 = [NSString alloc];
                                  uint64_t v216 = objc_opt_class();
                                  v168 = v167;
                                  uint64_t v17 = v276;
                                  id v234 = (id)[v168 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v216, @"iTunesArtistIdentifier"];
                                  id v300 = v234;
                                  v233 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v300 forKeys:&v299 count:1];
                                  id v169 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v166, 2);
                                  id v88 = 0;
                                  long long v13 = 0;
                                  *a4 = v169;
                                  long long v12 = v275;
                                  uint64_t v66 = v273;
                                  id v37 = v238;
                                  int v38 = v240;
                                  goto LABEL_210;
                                }
                                id v88 = 0;
                                long long v13 = 0;
                                long long v12 = v275;
                                uint64_t v66 = v273;
                                id v37 = v238;
                                int v38 = v240;
                                goto LABEL_211;
                              }
                              id v88 = 0;
LABEL_153:
                              id v37 = v238;
                              uint64_t v153 = [v5 objectForKeyedSubscript:@"iTunesAlbumIdentifier"];
                              int v38 = v240;
                              v233 = (void *)v153;
                              if (v153 && (v154 = (void *)v153, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v234 = v154;
                                  goto LABEL_156;
                                }
                                if (!a4)
                                {
                                  id v234 = 0;
                                  long long v13 = 0;
                                  long long v12 = v275;
                                  uint64_t v66 = v273;
                                  goto LABEL_210;
                                }
                                id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v243 = *MEMORY[0x1E4F502C8];
                                uint64_t v297 = *MEMORY[0x1E4F28568];
                                id v171 = [NSString alloc];
                                uint64_t v217 = objc_opt_class();
                                v172 = v171;
                                uint64_t v17 = v276;
                                id v239 = (id)[v172 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v217, @"iTunesAlbumIdentifier"];
                                id v298 = v239;
                                v232 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v298 forKeys:&v297 count:1];
                                id v173 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v243, 2);
                                id v234 = 0;
                                long long v13 = 0;
                                *a4 = v173;
                              }
                              else
                              {
                                id v234 = 0;
LABEL_156:
                                uint64_t v155 = [v5 objectForKeyedSubscript:@"groupIdentifier"];
                                v232 = (void *)v155;
                                if (!v155
                                  || (v156 = (void *)v155, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v239 = 0;
LABEL_159:
                                  uint64_t v157 = [v5 objectForKeyedSubscript:@"isRemoteControl"];
                                  v229 = (void *)v157;
                                  if (!v157
                                    || (v158 = (void *)v157, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v231 = 0;
LABEL_162:
                                    uint64_t v159 = [v5 objectForKeyedSubscript:@"itemMediaType"];
                                    v226 = (void *)v159;
                                    if (!v159
                                      || (v160 = (void *)v159, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v230 = 0;
LABEL_189:
                                      uint64_t v184 = [v5 objectForKeyedSubscript:@"itemMediaSubtype"];
                                      v225 = (void *)v184;
                                      if (!v184
                                        || (v185 = (void *)v184, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v228 = 0;
LABEL_197:
                                        uint64_t v187 = [v5 objectForKeyedSubscript:@"isAirPlayActive"];
                                        v224 = (void *)v187;
                                        if (!v187
                                          || (v188 = (void *)v187, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v227 = 0;
LABEL_200:
                                          uint64_t v189 = [v5 objectForKeyedSubscript:@"parentGroupContainsDiscoverableGroupLeader"];
                                          v241 = (void *)v189;
                                          if (!v189
                                            || (v190 = (void *)v189,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v246 = 0;
                                            long long v12 = v275;
                                            uint64_t v66 = v273;
                                            goto LABEL_203;
                                          }
                                          objc_opt_class();
                                          long long v12 = v275;
                                          uint64_t v66 = v273;
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v246 = v190;
LABEL_203:
                                            uint64_t v191 = [v66 intValue];
                                            unsigned int v192 = [v230 intValue];
                                            long long v13 = objc_retain(-[BMMediaNowPlaying initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:](v255, "initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:", v271, v12, v191, v274, v260, v270, v264, v262, v258, v256, v248,
                                                      v37,
                                                      v249,
                                                      v265,
                                                      v237,
                                                      v88,
                                                      v234,
                                                      v239,
                                                      v231,
                                                      __PAIR64__([v228 intValue], v192),
                                                      v227,
                                                      v246));
                                            v255 = v13;
                                            uint64_t v17 = v276;
                                          }
                                          else
                                          {
                                            if (a4)
                                            {
                                              id v247 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v223 = *MEMORY[0x1E4F502C8];
                                              uint64_t v285 = *MEMORY[0x1E4F28568];
                                              v199 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"parentGroupContainsDiscoverableGroupLeader"];
                                              v286 = v199;
                                              v200 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v286 forKeys:&v285 count:1];
                                              *a4 = (id)[v247 initWithDomain:v223 code:2 userInfo:v200];

                                              uint64_t v17 = v276;
                                            }
                                            id v246 = 0;
                                            long long v13 = 0;
                                          }
LABEL_204:

LABEL_205:
LABEL_206:

LABEL_207:
LABEL_208:

LABEL_209:
LABEL_210:

LABEL_211:
LABEL_212:

                                          id v34 = v248;
                                          goto LABEL_213;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v227 = v188;
                                          goto LABEL_200;
                                        }
                                        if (a4)
                                        {
                                          id v194 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v195 = *MEMORY[0x1E4F502C8];
                                          uint64_t v287 = *MEMORY[0x1E4F28568];
                                          id v196 = [NSString alloc];
                                          uint64_t v220 = objc_opt_class();
                                          v197 = v196;
                                          uint64_t v17 = v276;
                                          id v246 = (id)[v197 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v220, @"isAirPlayActive"];
                                          id v288 = v246;
                                          v241 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
                                          id v198 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v195, 2);
                                          long long v13 = 0;
                                          id v227 = 0;
                                          *a4 = v198;
                                          long long v12 = v275;
                                          uint64_t v66 = v273;
                                          goto LABEL_204;
                                        }
                                        id v227 = 0;
                                        long long v13 = 0;
LABEL_253:
                                        long long v12 = v275;
                                        uint64_t v66 = v273;
                                        goto LABEL_205;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v228 = v185;
LABEL_196:

                                        goto LABEL_197;
                                      }
                                      v245 = v7;
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v186 = v185;
                                        id v228 = [NSNumber numberWithInt:BMMediaNowPlayingMediaSubtypeFromString(v186)];

                                        goto LABEL_196;
                                      }
                                      if (a4)
                                      {
                                        id v206 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v207 = *MEMORY[0x1E4F502C8];
                                        uint64_t v289 = *MEMORY[0x1E4F28568];
                                        id v208 = [NSString alloc];
                                        uint64_t v222 = objc_opt_class();
                                        v209 = v208;
                                        uint64_t v17 = v276;
                                        id v227 = (id)[v209 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v222, @"itemMediaSubtype"];
                                        id v290 = v227;
                                        v224 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v290 forKeys:&v289 count:1];
                                        id v210 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v207, 2);
                                        id v228 = 0;
                                        long long v13 = 0;
                                        *a4 = v210;
                                        uint64_t v7 = v245;
                                        goto LABEL_253;
                                      }
                                      id v228 = 0;
                                      long long v13 = 0;
LABEL_257:
                                      int v38 = v240;
                                      uint64_t v7 = v245;
                                      long long v12 = v275;
                                      uint64_t v66 = v273;
                                      goto LABEL_206;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v230 = v160;
LABEL_188:

                                      goto LABEL_189;
                                    }
                                    v245 = v7;
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v183 = v160;
                                      id v230 = [NSNumber numberWithInt:BMMediaNowPlayingMediaTypeFromString(v183)];

                                      goto LABEL_188;
                                    }
                                    if (a4)
                                    {
                                      id v201 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v202 = *MEMORY[0x1E4F502C8];
                                      uint64_t v291 = *MEMORY[0x1E4F28568];
                                      id v203 = [NSString alloc];
                                      uint64_t v221 = objc_opt_class();
                                      v204 = v203;
                                      uint64_t v17 = v276;
                                      id v228 = (id)[v204 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v221, @"itemMediaType"];
                                      id v292 = v228;
                                      v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v292 forKeys:&v291 count:1];
                                      id v205 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v202, 2);
                                      id v230 = 0;
                                      long long v13 = 0;
                                      *a4 = v205;
                                      goto LABEL_257;
                                    }
                                    id v230 = 0;
                                    long long v13 = 0;
LABEL_255:
                                    long long v12 = v275;
                                    uint64_t v66 = v273;
                                    goto LABEL_207;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v231 = v158;
                                    goto LABEL_162;
                                  }
                                  if (a4)
                                  {
                                    id v178 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v179 = *MEMORY[0x1E4F502C8];
                                    uint64_t v293 = *MEMORY[0x1E4F28568];
                                    id v180 = [NSString alloc];
                                    uint64_t v219 = objc_opt_class();
                                    v181 = v180;
                                    uint64_t v17 = v276;
                                    id v230 = (id)[v181 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v219, @"isRemoteControl"];
                                    id v294 = v230;
                                    v226 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v294 forKeys:&v293 count:1];
                                    id v182 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v179, 2);
                                    id v231 = 0;
                                    long long v13 = 0;
                                    *a4 = v182;
                                    goto LABEL_255;
                                  }
                                  id v231 = 0;
                                  long long v13 = 0;
LABEL_251:
                                  long long v12 = v275;
                                  uint64_t v66 = v273;
                                  goto LABEL_208;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v239 = v156;
                                  goto LABEL_159;
                                }
                                if (a4)
                                {
                                  id v174 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v244 = *MEMORY[0x1E4F502C8];
                                  uint64_t v295 = *MEMORY[0x1E4F28568];
                                  id v175 = [NSString alloc];
                                  uint64_t v218 = objc_opt_class();
                                  v176 = v175;
                                  uint64_t v17 = v276;
                                  id v231 = (id)[v176 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v218, @"groupIdentifier"];
                                  id v296 = v231;
                                  v229 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v296 forKeys:&v295 count:1];
                                  id v177 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v244, 2);
                                  id v239 = 0;
                                  long long v13 = 0;
                                  *a4 = v177;
                                  goto LABEL_251;
                                }
                                id v239 = 0;
                                long long v13 = 0;
                              }
                              long long v12 = v275;
                              uint64_t v66 = v273;
                              goto LABEL_209;
                            }
                            uint64_t v7 = v242;
                            if (a4)
                            {
                              id v161 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v162 = *MEMORY[0x1E4F502C8];
                              uint64_t v301 = *MEMORY[0x1E4F28568];
                              id v88 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
                              id v302 = v88;
                              uint64_t v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v302 forKeys:&v301 count:1];
                              uint64_t v164 = v162;
                              uint64_t v17 = v276;
                              v236 = (void *)v163;
                              id v237 = 0;
                              long long v13 = 0;
                              *a4 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v164, 2);
                              long long v12 = v275;
                              uint64_t v66 = v273;
                              int v38 = v240;

                              goto LABEL_212;
                            }
                            id v237 = 0;
                            long long v13 = 0;
                            long long v12 = v275;
                            uint64_t v66 = v273;
                            int v38 = v240;
LABEL_213:

                            v151 = v237;
LABEL_214:

                            uint64_t v15 = v251;
                            goto LABEL_216;
                          }
                        }
                        v139 = a4;
                        if (a4)
                        {
                          id v140 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v141 = *MEMORY[0x1E4F502C8];
                          uint64_t v305 = *MEMORY[0x1E4F28568];
                          id v82 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"outputDevices"];
                          id v306 = v82;
                          v142 = (void *)MEMORY[0x1E4F1C9E8];
                          v143 = &v306;
                          v144 = &v305;
LABEL_133:
                          id v88 = [v142 dictionaryWithObjects:v143 forKeys:v144 count:1];
                          uint64_t v145 = v141;
                          uint64_t v17 = v276;
                          id v146 = (id)[v140 initWithDomain:v145 code:2 userInfo:v88];
                          long long v13 = 0;
                          id *v139 = v146;
                          id v237 = obj;
                          uint64_t v7 = v242;
                          long long v12 = v275;
LABEL_138:
                          uint64_t v66 = v273;
                          id v37 = v238;
                          int v38 = v240;
                          goto LABEL_212;
                        }
LABEL_143:
                        long long v13 = 0;
                        v151 = obj;
                        uint64_t v7 = v242;
                        long long v12 = v275;
                        uint64_t v66 = v273;
                        id v37 = v238;
                        int v38 = v240;
                        goto LABEL_214;
                      }
                      if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v238 = v37;
                        v240 = v38;
                        v242 = v7;
                        goto LABEL_84;
                      }
                      id obj = v39;
                      if (a4)
                      {
                        id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v148 = *MEMORY[0x1E4F502C8];
                        uint64_t v308 = *MEMORY[0x1E4F28568];
                        v265 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"outputDevices"];
                        v309 = v265;
                        uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v309 forKeys:&v308 count:1];
                        uint64_t v150 = v148;
                        v151 = (void *)v149;
                        id v152 = (id)[v147 initWithDomain:v150 code:2 userInfo:v149];
                        long long v13 = 0;
                        *a4 = v152;
                        long long v12 = v275;
                        uint64_t v66 = v273;
                        goto LABEL_214;
                      }
                      long long v13 = 0;
                      long long v12 = v275;
                      uint64_t v15 = v251;
                      uint64_t v66 = v273;
LABEL_216:

                      goto LABEL_217;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v34 = v33;
                      goto LABEL_59;
                    }
                    v270 = v27;
                    if (a4)
                    {
                      v114 = v15;
                      id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v116 = *MEMORY[0x1E4F502C8];
                      uint64_t v314 = *MEMORY[0x1E4F28568];
                      id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"iTunesStoreIdentifier"];
                      id v315 = v37;
                      uint64_t v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v315 forKeys:&v314 count:1];
                      v118 = v115;
                      uint64_t v15 = v114;
                      uint64_t v119 = v116;
                      uint64_t v17 = v276;
                      v250 = (void *)v117;
                      id v34 = 0;
                      long long v13 = 0;
                      *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
                      long long v12 = v275;
                      uint64_t v66 = v273;
LABEL_218:
                      uint64_t v27 = v270;
                      goto LABEL_219;
                    }
                    id v34 = 0;
                    long long v13 = 0;
LABEL_149:
                    long long v12 = v275;
                    uint64_t v66 = v273;
                    uint64_t v27 = v270;
LABEL_220:

                    self = v255;
                    goto LABEL_221;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v258 = v29;
                    goto LABEL_53;
                  }
                  if (a4)
                  {
                    int v98 = v15;
                    id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v100 = *MEMORY[0x1E4F502C8];
                    uint64_t v318 = *MEMORY[0x1E4F28568];
                    v101 = self;
                    v102 = v7;
                    id v103 = v20;
                    id v104 = [NSString alloc];
                    uint64_t v213 = objc_opt_class();
                    v105 = v104;
                    id v20 = v103;
                    uint64_t v7 = v102;
                    self = v101;
                    id v256 = (id)[v105 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v213, @"elapsed"];
                    id v319 = v256;
                    uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v319 forKeys:&v318 count:1];
                    v107 = v99;
                    uint64_t v15 = v98;
                    uint64_t v108 = v100;
                    uint64_t v17 = v276;
                    v257 = (void *)v106;
                    id v258 = 0;
                    long long v13 = 0;
                    *a4 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2);
                    long long v12 = v275;
                    uint64_t v66 = v273;
LABEL_222:

                    goto LABEL_223;
                  }
                  id v258 = 0;
                  long long v13 = 0;
                  long long v12 = v275;
                  uint64_t v66 = v273;
LABEL_223:

                  goto LABEL_224;
                }
                if (a4)
                {
                  v92 = v15;
                  id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v94 = *MEMORY[0x1E4F502C8];
                  uint64_t v320 = *MEMORY[0x1E4F28568];
                  id v258 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"title"];
                  id v321 = v258;
                  uint64_t v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v321 forKeys:&v320 count:1];
                  int v96 = v93;
                  uint64_t v15 = v92;
                  uint64_t v97 = v94;
                  uint64_t v17 = v276;
                  v259 = (void *)v95;
                  id v262 = 0;
                  long long v13 = 0;
                  *a4 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v97, 2);
                  long long v12 = v275;
                  uint64_t v66 = v273;
                  uint64_t v27 = v270;
                  goto LABEL_223;
                }
                id v262 = 0;
                long long v13 = 0;
                long long v12 = v275;
                uint64_t v66 = v273;
                uint64_t v27 = v270;
LABEL_224:

                goto LABEL_225;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v264 = v24;
                goto LABEL_36;
              }
              if (a4)
              {
                v252 = v15;
                id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v68 = *MEMORY[0x1E4F502C8];
                uint64_t v322 = *MEMORY[0x1E4F28568];
                v69 = v7;
                id v70 = v20;
                id v71 = [NSString alloc];
                uint64_t v212 = objc_opt_class();
                uint64_t v72 = v71;
                id v20 = v70;
                uint64_t v7 = v69;
                id v262 = (id)[v72 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v212, @"genre"];
                id v323 = v262;
                uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v323 forKeys:&v322 count:1];
                id v74 = v67;
                uint64_t v15 = v252;
                uint64_t v75 = v68;
                uint64_t v17 = v276;
                v263 = (void *)v73;
                id v264 = 0;
                long long v13 = 0;
                *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2);
                long long v12 = v275;
                uint64_t v66 = v273;
                uint64_t v27 = v270;
                goto LABEL_224;
              }
              id v264 = 0;
              long long v13 = 0;
              long long v12 = v275;
              uint64_t v66 = v273;
              uint64_t v27 = v270;
LABEL_225:

              goto LABEL_226;
            }
            uint64_t v27 = a4;
            if (a4)
            {
              v55 = v15;
              id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v57 = *MEMORY[0x1E4F502C8];
              uint64_t v324 = *MEMORY[0x1E4F28568];
              v58 = self;
              uint64_t v59 = v7;
              id v60 = v20;
              id v61 = [NSString alloc];
              uint64_t v211 = objc_opt_class();
              v62 = v61;
              id v20 = v60;
              uint64_t v7 = v59;
              self = v58;
              id v264 = (id)[v62 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v211, @"duration"];
              id v325 = v264;
              uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v325 forKeys:&v324 count:1];
              int v64 = v56;
              uint64_t v15 = v55;
              uint64_t v65 = v57;
              uint64_t v17 = v276;
              v268 = (void *)v63;
              long long v13 = 0;
              *a4 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
              uint64_t v27 = 0;
              long long v12 = v275;
              uint64_t v66 = v273;
              goto LABEL_225;
            }
            long long v13 = 0;
LABEL_123:
            long long v12 = v275;
            uint64_t v66 = v273;
LABEL_226:

            goto LABEL_227;
          }
          if (a4)
          {
            v48 = v15;
            id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v50 = *MEMORY[0x1E4F502C8];
            uint64_t v326 = *MEMORY[0x1E4F28568];
            uint64_t v51 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"artist"];
            uint64_t v327 = v51;
            uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v327 forKeys:&v326 count:1];
            uint64_t v53 = v49;
            uint64_t v15 = v48;
            uint64_t v54 = v50;
            uint64_t v17 = v276;
            v269 = (void *)v52;
            id v20 = 0;
            long long v13 = 0;
            *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2);
            uint64_t v27 = (id *)v51;
            goto LABEL_123;
          }
          id v20 = 0;
          long long v13 = 0;
LABEL_117:
          long long v12 = v275;
          uint64_t v66 = v273;
LABEL_227:

          id v6 = v271;
          goto LABEL_228;
        }
        if (a4)
        {
          uint64_t v42 = v15;
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v328 = *MEMORY[0x1E4F28568];
          id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"album"];
          id v329 = v20;
          uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v329 forKeys:&v328 count:1];
          v46 = v43;
          uint64_t v15 = v42;
          uint64_t v47 = v44;
          uint64_t v17 = v276;
          v272 = (void *)v45;
          id v274 = 0;
          long long v13 = 0;
          *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);
          goto LABEL_117;
        }
        id v274 = 0;
        long long v13 = 0;
        long long v12 = v275;
        uint64_t v66 = v273;
LABEL_228:

        goto LABEL_229;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        id v273 = [NSNumber numberWithInt:BMMediaNowPlayingPlaybackStateFromString(v16)];

        goto LABEL_23;
      }
      if (a4)
      {
        id v277 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v89 = *MEMORY[0x1E4F502C8];
        uint64_t v330 = *MEMORY[0x1E4F28568];
        id v274 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"playbackState"];
        id v331 = v274;
        uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v331 forKeys:&v330 count:1];
        uint64_t v91 = v89;
        uint64_t v17 = (void *)v90;
        long long v13 = 0;
        *a4 = (id)[v277 initWithDomain:v91 code:2 userInfo:v90];
        uint64_t v66 = 0;
        long long v12 = v275;
        goto LABEL_228;
      }
      long long v13 = 0;
      long long v12 = v275;
      uint64_t v66 = 0;
LABEL_229:

      goto LABEL_230;
    }
    if (a4)
    {
      id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v121 = *MEMORY[0x1E4F502C8];
      uint64_t v332 = *MEMORY[0x1E4F28568];
      v122 = self;
      id v123 = [NSString alloc];
      uint64_t v214 = objc_opt_class();
      v124 = v123;
      self = v122;
      uint64_t v66 = (void *)[v124 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", v214, @"absoluteTimestamp"];
      v333 = v66;
      uint64_t v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v333 forKeys:&v332 count:1];
      v126 = v120;
      uint64_t v15 = (void *)v125;
      long long v12 = 0;
      long long v13 = 0;
      *a4 = (id)[v126 initWithDomain:v121 code:2 userInfo:v125];
      goto LABEL_229;
    }
    long long v12 = 0;
    long long v13 = 0;
LABEL_230:

    goto LABEL_231;
  }
  if (a4)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F502C8];
    uint64_t v334 = *MEMORY[0x1E4F28568];
    long long v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
    v335[0] = v12;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v335 forKeys:&v334 count:1];
    id v6 = 0;
    long long v13 = 0;
    *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v7];
    goto LABEL_230;
  }
  id v6 = 0;
  long long v13 = 0;
LABEL_231:

  return v13;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMediaNowPlaying *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_album) {
    PBDataWriterWriteStringField();
  }
  if (self->_artist) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasDuration) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_genre) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasElapsed) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_mediaType) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesStoreIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesSubscriptionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsAirPlayVideo) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_outputDevices;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesArtistIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_iTunesAlbumIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsRemoteControl) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsAirPlayActive) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasParentGroupContainsDiscoverableGroupLeader) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v102.receiver = self;
  v102.super_class = (Class)BMMediaNowPlaying;
  id v5 = [(BMEventBase *)&v102 init];
  if (!v5) {
    goto LABEL_154;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  id v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    long long v11 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    long long v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v21 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = v10[261];
          goto LABEL_68;
        case 2u:
          *((unsigned char *)&v5->super.super.isa + v11[262]) = 1;
          uint64_t v25 = *v7;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v8])
          {
            double v27 = *(double *)(*(void *)&v4[*v12] + v26);
            *(void *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v27 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v27;
          continue;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v31 = *v7;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v12] + v32);
              *(void *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                BOOL v20 = v29++ >= 9;
                if (v20)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v30) = 0;
          }
LABEL_107:
          if (v30 >= 6) {
            LODWORD(v30) = 0;
          }
          uint64_t v93 = 48;
          goto LABEL_139;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_68;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 88;
          goto LABEL_68;
        case 6u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          v5->_hasDuration = 1;
          while (2)
          {
            uint64_t v38 = *v7;
            uint64_t v39 = *(void *)&v4[v38];
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)&v4[*v12] + v39);
              *(void *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v20 = v36++ >= 9;
                if (v20)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v37) = 0;
          }
LABEL_113:
          uint64_t v94 = 52;
          goto LABEL_118;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_68;
        case 8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
          goto LABEL_68;
        case 9u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v37 = 0;
          v5->_hasElapsed = 1;
          while (2)
          {
            uint64_t v44 = *v7;
            uint64_t v45 = *(void *)&v4[v44];
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)&v4[*v12] + v45);
              *(void *)&v4[v44] = v46;
              v37 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v20 = v43++ >= 9;
                if (v20)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v37) = 0;
          }
LABEL_117:
          uint64_t v94 = 56;
LABEL_118:
          *(_DWORD *)((char *)&v5->super.super.isa + v94) = v37;
          continue;
        case 0xAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 112;
          goto LABEL_68;
        case 0xBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 120;
          goto LABEL_68;
        case 0xCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 128;
          goto LABEL_68;
        case 0xDu:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasIsAirPlayVideo = 1;
          while (2)
          {
            uint64_t v51 = *v7;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v12] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v20 = v49++ >= 9;
                if (v20)
                {
                  uint64_t v50 = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v50 = 0;
          }
LABEL_122:
          BOOL v95 = v50 != 0;
          uint64_t v96 = 34;
          goto LABEL_148;
        case 0xEu:
          uint64_t v103 = 0;
          uint64_t v104 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_156;
          }
          v55 = v11;
          id v56 = v10;
          id v57 = [[BMMediaNowPlayingOutputDevice alloc] initByReadFrom:v4];
          if (!v57) {
            goto LABEL_156;
          }
          v58 = v57;
          [v6 addObject:v57];
          PBReaderRecallMark();

          id v10 = v56;
          long long v11 = v55;
          continue;
        case 0xFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 144;
          goto LABEL_68;
        case 0x10u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 152;
          goto LABEL_68;
        case 0x11u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 160;
          goto LABEL_68;
        case 0x12u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 168;
LABEL_68:
          uint64_t v59 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x13u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v62 = 0;
          v5->_hasIsRemoteControl = 1;
          while (2)
          {
            uint64_t v63 = *v7;
            uint64_t v64 = *(void *)&v4[v63];
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)&v4[*v12] + v64);
              *(void *)&v4[v63] = v65;
              v62 |= (unint64_t)(v66 & 0x7F) << v60;
              if (v66 < 0)
              {
                v60 += 7;
                BOOL v20 = v61++ >= 9;
                if (v20)
                {
                  uint64_t v62 = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v62 = 0;
          }
LABEL_126:
          BOOL v95 = v62 != 0;
          uint64_t v96 = 36;
          goto LABEL_148;
        case 0x14u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v69 = *v7;
            uint64_t v70 = *(void *)&v4[v69];
            unint64_t v71 = v70 + 1;
            if (v70 == -1 || v71 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v72 = *(unsigned char *)(*(void *)&v4[*v12] + v70);
              *(void *)&v4[v69] = v71;
              v30 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                BOOL v20 = v68++ >= 9;
                if (v20)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v30) = 0;
          }
LABEL_130:
          if (v30 >= 3) {
            LODWORD(v30) = 0;
          }
          uint64_t v93 = 60;
          goto LABEL_139;
        case 0x15u:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v75 = *v7;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)&v4[*v12] + v76);
              *(void *)&v4[v75] = v77;
              v30 |= (unint64_t)(v78 & 0x7F) << v73;
              if (v78 < 0)
              {
                v73 += 7;
                BOOL v20 = v74++ >= 9;
                if (v20)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v30) = 0;
          }
LABEL_136:
          if (v30 >= 8) {
            LODWORD(v30) = 0;
          }
          uint64_t v93 = 64;
LABEL_139:
          *(_DWORD *)((char *)&v5->super.super.isa + v93) = v30;
          continue;
        case 0x16u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          v5->_hasIsAirPlayActive = 1;
          while (2)
          {
            uint64_t v82 = *v7;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v12] + v83);
              *(void *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                BOOL v20 = v80++ >= 9;
                if (v20)
                {
                  uint64_t v81 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            uint64_t v81 = 0;
          }
LABEL_143:
          BOOL v95 = v81 != 0;
          uint64_t v96 = 38;
          goto LABEL_148;
        case 0x17u:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          v5->_hasParentGroupContainsDiscoverableGroupLeader = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_156:

          goto LABEL_153;
      }
      while (1)
      {
        uint64_t v89 = *v7;
        uint64_t v90 = *(void *)&v4[v89];
        unint64_t v91 = v90 + 1;
        if (v90 == -1 || v91 > *(void *)&v4[*v8]) {
          break;
        }
        char v92 = *(unsigned char *)(*(void *)&v4[*v12] + v90);
        *(void *)&v4[v89] = v91;
        v88 |= (unint64_t)(v92 & 0x7F) << v86;
        if ((v92 & 0x80) == 0) {
          goto LABEL_145;
        }
        v86 += 7;
        BOOL v20 = v87++ >= 9;
        if (v20)
        {
          uint64_t v88 = 0;
          goto LABEL_147;
        }
      }
      v4[*v9] = 1;
LABEL_145:
      if (v4[*v9]) {
        uint64_t v88 = 0;
      }
LABEL_147:
      BOOL v95 = v88 != 0;
      uint64_t v96 = 40;
LABEL_148:
      *((unsigned char *)&v5->super.super.isa + v96) = v95;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v97 = [v6 copy];
  outputDevices = v5->_outputDevices;
  v5->_outputDevices = (NSArray *)v97;

  int v99 = v4[*v9];
  if (v99) {
LABEL_153:
  }
    uint64_t v100 = 0;
  else {
LABEL_154:
  }
    uint64_t v100 = v5;

  return v100;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  char v28 = [(BMMediaNowPlaying *)self uniqueID];
  double v27 = [(BMMediaNowPlaying *)self absoluteTimestamp];
  uint64_t v25 = BMMediaNowPlayingPlaybackStateAsString([(BMMediaNowPlaying *)self playbackState]);
  unint64_t v26 = [(BMMediaNowPlaying *)self album];
  uint64_t v23 = [(BMMediaNowPlaying *)self artist];
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMediaNowPlaying duration](self, "duration"));
  uint64_t v22 = [(BMMediaNowPlaying *)self genre];
  uint64_t v16 = [(BMMediaNowPlaying *)self title];
  int v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMediaNowPlaying elapsed](self, "elapsed"));
  unint64_t v15 = [(BMMediaNowPlaying *)self mediaType];
  unsigned int v14 = [(BMMediaNowPlaying *)self iTunesStoreIdentifier];
  BOOL v20 = [(BMMediaNowPlaying *)self iTunesSubscriptionIdentifier];
  char v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying isAirPlayVideo](self, "isAirPlayVideo"));
  long long v12 = [(BMMediaNowPlaying *)self outputDevices];
  long long v11 = [(BMMediaNowPlaying *)self bundleID];
  char v13 = [(BMMediaNowPlaying *)self iTunesArtistIdentifier];
  id v10 = [(BMMediaNowPlaying *)self iTunesAlbumIdentifier];
  uint64_t v3 = [(BMMediaNowPlaying *)self groupIdentifier];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying isRemoteControl](self, "isRemoteControl"));
  id v5 = BMMediaNowPlayingMediaTypeAsString([(BMMediaNowPlaying *)self itemMediaType]);
  uint64_t v6 = BMMediaNowPlayingMediaSubtypeAsString([(BMMediaNowPlaying *)self itemMediaSubtype]);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying isAirPlayActive](self, "isAirPlayActive"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaNowPlaying parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
  unint64_t v18 = objc_msgSend(v17, "initWithFormat:", @"BMMediaNowPlaying with uniqueID: %@, absoluteTimestamp: %@, playbackState: %@, album: %@, artist: %@, duration: %@, genre: %@, title: %@, elapsed: %@, mediaType: %@, iTunesStoreIdentifier: %@, iTunesSubscriptionIdentifier: %@, isAirPlayVideo: %@, outputDevices: %@, bundleID: %@, iTunesArtistIdentifier: %@, iTunesAlbumIdentifier: %@, groupIdentifier: %@, isRemoteControl: %@, itemMediaType: %@, itemMediaSubtype: %@, isAirPlayActive: %@, parentGroupContainsDiscoverableGroupLeader: %@", v28, v27, v25, v26, v23, v24, v22, v16, v21, v15, v14, v20, v19, v12, v11, v13,
                  v10,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v18;
}

- (BMMediaNowPlaying)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 playbackState:(int)a5 album:(id)a6 artist:(id)a7 duration:(id)a8 genre:(id)a9 title:(id)a10 elapsed:(id)a11 mediaType:(id)a12 iTunesStoreIdentifier:(id)a13 iTunesSubscriptionIdentifier:(id)a14 isAirPlayVideo:(id)a15 outputDevices:(id)a16 bundleID:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isRemoteControl:(id)a21 itemMediaType:(int)a22 itemMediaSubtype:(int)a23 isAirPlayActive:(id)a24 parentGroupContainsDiscoverableGroupLeader:(id)a25
{
  id v58 = a3;
  id v28 = a4;
  id v45 = a6;
  id v57 = a6;
  id v56 = a7;
  id v60 = a8;
  id v55 = a9;
  id v54 = a10;
  id v29 = a11;
  id v53 = a12;
  id v52 = a13;
  id v51 = a14;
  id v30 = a15;
  id v50 = a16;
  id v49 = a17;
  id v48 = a18;
  id v47 = a19;
  id v31 = a20;
  uint64_t v32 = v28;
  id v33 = a21;
  char v34 = v29;
  id v35 = a24;
  id v36 = a25;
  v61.receiver = self;
  v61.super_class = (Class)BMMediaNowPlaying;
  uint64_t v37 = [(BMEventBase *)&v61 init];
  if (v37)
  {
    v37->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v37->_uniqueID, a3);
    if (v32)
    {
      v37->_hasRaw_absoluteTimestamp = 1;
      [v32 timeIntervalSinceReferenceDate];
    }
    else
    {
      v37->_hasRaw_absoluteTimestamp = 0;
      double v38 = -1.0;
    }
    v37->_raw_absoluteTimestamp = v38;
    v37->_playbackState = a5;
    objc_storeStrong((id *)&v37->_album, v45);
    objc_storeStrong((id *)&v37->_artist, a7);
    if (v60)
    {
      v37->_hasDuration = 1;
      unsigned int v39 = [v60 unsignedIntValue];
    }
    else
    {
      unsigned int v39 = 0;
      v37->_hasDuration = 0;
    }
    v37->_duration = v39;
    objc_storeStrong((id *)&v37->_genre, a9);
    objc_storeStrong((id *)&v37->_title, a10);
    if (v34)
    {
      v37->_hasElapsed = 1;
      unsigned int v40 = [v34 unsignedIntValue];
    }
    else
    {
      unsigned int v40 = 0;
      v37->_hasElapsed = 0;
    }
    v37->_elapsed = v40;
    objc_storeStrong((id *)&v37->_mediaType, a12);
    objc_storeStrong((id *)&v37->_iTunesStoreIdentifier, a13);
    objc_storeStrong((id *)&v37->_iTunesSubscriptionIdentifier, a14);
    if (v30)
    {
      v37->_hasIsAirPlayVideo = 1;
      id v41 = v30;
      v37->_isAirPlayVideo = [v30 BOOLValue];
    }
    else
    {
      id v41 = 0;
      v37->_hasIsAirPlayVideo = 0;
      v37->_isAirPlayVideo = 0;
    }
    objc_storeStrong((id *)&v37->_outputDevices, a16);
    objc_storeStrong((id *)&v37->_bundleID, a17);
    objc_storeStrong((id *)&v37->_iTunesArtistIdentifier, a18);
    objc_storeStrong((id *)&v37->_iTunesAlbumIdentifier, a19);
    objc_storeStrong((id *)&v37->_groupIdentifier, a20);
    if (v33)
    {
      v37->_hasIsRemoteControl = 1;
      v37->_isRemoteControl = [v33 BOOLValue];
    }
    else
    {
      v37->_hasIsRemoteControl = 0;
      v37->_isRemoteControl = 0;
    }
    v37->_itemMediaType = a22;
    v37->_itemMediaSubtype = a23;
    if (v35)
    {
      v37->_hasIsAirPlayActive = 1;
      v37->_isAirPlayActive = [v35 BOOLValue];
    }
    else
    {
      v37->_hasIsAirPlayActive = 0;
      v37->_isAirPlayActive = 0;
    }
    id v30 = v41;
    if (v36)
    {
      v37->_hasParentGroupContainsDiscoverableGroupLeader = 1;
      v37->_parentGroupContainsDiscoverableGroupLeader = [v36 BOOLValue];
    }
    else
    {
      v37->_hasParentGroupContainsDiscoverableGroupLeader = 0;
      v37->_parentGroupContainsDiscoverableGroupLeader = 0;
    }
  }

  return v37;
}

+ (id)protoFields
{
  v27[23] = *MEMORY[0x1E4F143B8];
  unint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"uniqueID" number:1 type:13 subMessageClass:0];
  v27[0] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:2 type:0 subMessageClass:0];
  v27[1] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"playbackState" number:3 type:4 subMessageClass:0];
  v27[2] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"album" number:4 type:13 subMessageClass:0];
  v27[3] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"artist" number:5 type:13 subMessageClass:0];
  v27[4] = v22;
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"duration" number:6 type:4 subMessageClass:0];
  v27[5] = v21;
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"genre" number:7 type:13 subMessageClass:0];
  v27[6] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"title" number:8 type:13 subMessageClass:0];
  v27[7] = v19;
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"elapsed" number:9 type:4 subMessageClass:0];
  v27[8] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaType" number:10 type:13 subMessageClass:0];
  v27[9] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"iTunesStoreIdentifier" number:11 type:13 subMessageClass:0];
  v27[10] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"iTunesSubscriptionIdentifier" number:12 type:13 subMessageClass:0];
  v27[11] = v15;
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAirPlayVideo" number:13 type:12 subMessageClass:0];
  v27[12] = v14;
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"outputDevices" number:14 type:14 subMessageClass:objc_opt_class()];
  v27[13] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:15 type:13 subMessageClass:0];
  v27[14] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"iTunesArtistIdentifier" number:16 type:13 subMessageClass:0];
  v27[15] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"iTunesAlbumIdentifier" number:17 type:13 subMessageClass:0];
  v27[16] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"groupIdentifier" number:18 type:13 subMessageClass:0];
  v27[17] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRemoteControl" number:19 type:12 subMessageClass:0];
  v27[18] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemMediaType" number:20 type:4 subMessageClass:0];
  v27[19] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"itemMediaSubtype" number:21 type:4 subMessageClass:0];
  v27[20] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isAirPlayActive" number:22 type:12 subMessageClass:0];
  v27[21] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"parentGroupContainsDiscoverableGroupLeader" number:23 type:12 subMessageClass:0];
  v27[22] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:23];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF38D0;
}

+ (id)columns
{
  v27[23] = *MEMORY[0x1E4F143B8];
  unint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:1];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"playbackState" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"album" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"artist" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"duration" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"genre" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"title" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"elapsed" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaType" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"iTunesStoreIdentifier" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"iTunesSubscriptionIdentifier" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAirPlayVideo" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"outputDevices_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_347];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"iTunesArtistIdentifier" dataType:2 requestOnly:0 fieldNumber:16 protoDataType:13 convertedType:0];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"iTunesAlbumIdentifier" dataType:2 requestOnly:0 fieldNumber:17 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"groupIdentifier" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRemoteControl" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemMediaType" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"itemMediaSubtype" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isAirPlayActive" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"parentGroupContainsDiscoverableGroupLeader" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:12 convertedType:0];
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v23;
  v27[4] = v22;
  v27[5] = v21;
  v27[6] = v20;
  v27[7] = v19;
  v27[8] = v18;
  v27[9] = v17;
  v27[10] = v16;
  v27[11] = v15;
  v27[12] = v14;
  v27[13] = v2;
  v27[14] = v3;
  v27[15] = v4;
  v27[16] = v13;
  v27[17] = v5;
  v27[18] = v12;
  v27[19] = v6;
  v27[20] = v11;
  v27[21] = v7;
  v27[22] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:23];

  return v10;
}

id __28__BMMediaNowPlaying_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _outputDevicesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMMediaNowPlaying alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[11] = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

- (BMMediaNowPlaying)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 playbackState:(int)a5 album:(id)a6 artist:(id)a7 duration:(id)a8 genre:(id)a9 title:(id)a10 elapsed:(id)a11 mediaType:(id)a12 iTunesStoreIdentifier:(id)a13 iTunesSubscriptionIdentifier:(id)a14 isAirPlayVideo:(id)a15 outputDevices:(id)a16 bundleID:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isRemoteControl:(id)a21 itemMediaType:(int)a22 itemMediaSubtype:(int)a23
{
  return -[BMMediaNowPlaying initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:](self, "initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:", a3, a4, *(void *)&a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           __PAIR64__(a23, a22),
           0,
           0);
}

@end