@interface BMNowPlayingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMNowPlayingEvent)initWithDKEvent:(id)a3 outputDevices:(id)a4;
- (BMNowPlayingEvent)initWithDKEvent:(id)a3 outputDevices:(id)a4 iTunesArtistIdentifier:(id)a5 iTunesAlbumIdentifier:(id)a6;
- (BMNowPlayingEvent)initWithProto:(id)a3;
- (BMNowPlayingEvent)initWithProtoData:(id)a3;
- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 iTunesStoreIdentifier:(id)a14 iTunesSubscriptionIdentifier:(id)a15 iTunesArtistIdentifier:(id)a16 iTunesAlbumIdentifier:(id)a17 isAirPlayVideo:(BOOL)a18 outputDevices:(id)a19;
- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 iTunesStoreIdentifier:(id)a14 iTunesSubscriptionIdentifier:(id)a15 isAirPlayVideo:(BOOL)a16 outputDevices:(id)a17;
- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 itemMediaType:(int)a14 itemMediaSubtype:(int)a15 iTunesStoreIdentifier:(id)a16 iTunesSubscriptionIdentifier:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isAirPlayVideo:(BOOL)a21 isRemoteControl:(BOOL)a22 outputDevices:(id)a23;
- (BOOL)isAirPlayVideo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoteControl;
- (NSArray)outputDevices;
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
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (int)itemMediaSubtype;
- (int)itemMediaType;
- (unint64_t)hash;
- (unint64_t)playbackState;
- (unsigned)dataVersion;
- (unsigned)duration;
- (unsigned)elapsed;
- (void)proto;
@end

@implementation BMNowPlayingEvent

- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 iTunesStoreIdentifier:(id)a14 iTunesSubscriptionIdentifier:(id)a15 isAirPlayVideo:(BOOL)a16 outputDevices:(id)a17
{
  LOBYTE(v19) = a16;
  LODWORD(v18) = a12;
  return -[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:](self, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:", a3, a4, a6, a7, a8, *(void *)&a9, a5, a10, a11, v18, a13, a14, a15, 0, 0,
           v19,
           a17);
}

- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 iTunesStoreIdentifier:(id)a14 iTunesSubscriptionIdentifier:(id)a15 iTunesArtistIdentifier:(id)a16 iTunesAlbumIdentifier:(id)a17 isAirPlayVideo:(BOOL)a18 outputDevices:(id)a19
{
  LOWORD(v21) = a18;
  LODWORD(v20) = a12;
  return -[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:](self, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:", a3, a4, a6, a7, a8, *(void *)&a9, a5, a10, a11, v20, a13, 0, a14, a15, a16,
           a17,
           0,
           v21,
           a19);
}

- (BMNowPlayingEvent)initWithUniqueID:(id)a3 bundleID:(id)a4 absoluteTimestamp:(double)a5 playbackState:(unint64_t)a6 album:(id)a7 artist:(id)a8 duration:(unsigned int)a9 genre:(id)a10 title:(id)a11 elapsed:(unsigned int)a12 mediaType:(id)a13 itemMediaType:(int)a14 itemMediaSubtype:(int)a15 iTunesStoreIdentifier:(id)a16 iTunesSubscriptionIdentifier:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isAirPlayVideo:(BOOL)a21 isRemoteControl:(BOOL)a22 outputDevices:(id)a23
{
  id v47 = a3;
  id v35 = a4;
  id v45 = a4;
  id v42 = a7;
  id v37 = a8;
  id v40 = a8;
  id v48 = a10;
  id v46 = a11;
  id v44 = a13;
  id v43 = a16;
  id v41 = a17;
  id v27 = a18;
  id v28 = a19;
  id v29 = a20;
  id v30 = a23;
  v49.receiver = self;
  v49.super_class = (Class)BMNowPlayingEvent;
  v31 = [(BMEventBase *)&v49 init];
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_uniqueID, a3);
    objc_storeStrong((id *)&v32->_bundleID, v35);
    v32->_absoluteTimestamp = a5;
    v32->_playbackState = a6;
    objc_storeStrong((id *)&v32->_album, a7);
    objc_storeStrong((id *)&v32->_artist, v37);
    v32->_duration = a9;
    objc_storeStrong((id *)&v32->_genre, a10);
    objc_storeStrong((id *)&v32->_title, a11);
    v32->_elapsed = a12;
    objc_storeStrong((id *)&v32->_mediaType, a13);
    v32->_itemMediaType = a14;
    v32->_itemMediaSubtype = a15;
    objc_storeStrong((id *)&v32->_iTunesStoreIdentifier, a16);
    objc_storeStrong((id *)&v32->_iTunesSubscriptionIdentifier, a17);
    objc_storeStrong((id *)&v32->_iTunesArtistIdentifier, a18);
    objc_storeStrong((id *)&v32->_iTunesAlbumIdentifier, a19);
    objc_storeStrong((id *)&v32->_groupIdentifier, a20);
    v32->_isAirPlayVideo = a21;
    v32->_isRemoteControl = a22;
    objc_storeStrong((id *)&v32->_outputDevices, a23);
  }

  return v32;
}

- (BMNowPlayingEvent)initWithDKEvent:(id)a3 outputDevices:(id)a4
{
  return [(BMNowPlayingEvent *)self initWithDKEvent:a3 outputDevices:a4 iTunesArtistIdentifier:0 iTunesAlbumIdentifier:0];
}

- (BMNowPlayingEvent)initWithDKEvent:(id)a3 outputDevices:(id)a4 iTunesArtistIdentifier:(id)a5 iTunesAlbumIdentifier:(id)a6
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 metadata];
  v14 = [get_DKNowPlayingMetadataKeyClass() iTunesStoreIdentifier];
  v15 = [v13 objectForKeyedSubscript:v14];

  v16 = [v9 metadata];
  v17 = [get_DKNowPlayingMetadataKeyClass() iTunesSubscriptionIdentifier];
  uint64_t v18 = [v16 objectForKeyedSubscript:v17];

  v93 = [v9 source];
  v100 = [v93 itemID];
  v92 = [v9 value];
  v99 = [v92 stringValue];
  v91 = [v9 startDate];
  [v91 timeIntervalSinceReferenceDate];
  double v20 = v19;
  uint64_t v21 = [v9 metadata];
  v89 = [get_DKNowPlayingMetadataKeyClass() playing];
  v90 = v21;
  v87 = objc_msgSend(v21, "objectForKeyedSubscript:");
  uint64_t v22 = [v87 integerValue];
  uint64_t v23 = v22;
  if (v22 >= 6)
  {
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[BMNowPlayingEvent initWithDKEvent:outputDevices:iTunesArtistIdentifier:iTunesAlbumIdentifier:](v23);
    }

    uint64_t v77 = 0;
  }
  else
  {
    uint64_t v77 = v22;
  }
  v25 = [v9 metadata];
  v85 = [get_DKNowPlayingMetadataKeyClass() album];
  v86 = v25;
  v84 = objc_msgSend(v25, "objectForKeyedSubscript:");
  v26 = [v9 metadata];
  v82 = [get_DKNowPlayingMetadataKeyClass() artist];
  v83 = v26;
  v81 = objc_msgSend(v26, "objectForKeyedSubscript:");
  id v27 = [v9 metadata];
  v79 = [get_DKNowPlayingMetadataKeyClass() duration];
  v80 = v27;
  v78 = objc_msgSend(v27, "objectForKeyedSubscript:");
  uint64_t v69 = [v78 unsignedLongValue];
  id v28 = [v9 metadata];
  v75 = [get_DKNowPlayingMetadataKeyClass() genre];
  v76 = v28;
  v74 = objc_msgSend(v28, "objectForKeyedSubscript:");
  id v29 = [v9 metadata];
  v72 = [get_DKNowPlayingMetadataKeyClass() title];
  v73 = v29;
  v71 = objc_msgSend(v29, "objectForKeyedSubscript:");
  id v30 = [v9 metadata];
  [get_DKNowPlayingMetadataKeyClass() elapsed];
  v68 = v70 = v30;
  v67 = objc_msgSend(v30, "objectForKeyedSubscript:");
  int v61 = [v67 unsignedLongValue];
  v31 = [v9 metadata];
  v65 = [get_DKNowPlayingMetadataKeyClass() mediaType];
  v66 = v31;
  v64 = objc_msgSend(v31, "objectForKeyedSubscript:");
  v95 = v15;
  v63 = [v15 stringValue];
  v94 = v18;
  v62 = [v18 stringValue];
  v97 = v11;
  v60 = [v11 stringValue];
  v96 = v12;
  v59 = [v12 stringValue];
  v98 = v9;
  v32 = [v9 metadata];
  v57 = [get_DKNowPlayingMetadataKeyClass() isAirPlayVideo];
  v58 = v32;
  v56 = objc_msgSend(v32, "objectForKeyedSubscript:");
  char v55 = [v56 BOOLValue];
  id v33 = v10;
  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v33, "count"));
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v35 = v33;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v102 objects:v106 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v103;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v103 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = *(void **)(*((void *)&v102 + 1) + 8 * v39);
        id v41 = [BMNowPlayingOutputDevice alloc];
        unint64_t v42 = [v40 deviceType];
        unint64_t v43 = v42;
        if (v42 >= 5)
        {
          id v45 = __biome_log_for_category();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v108 = v43;
            _os_log_fault_impl(&dword_18E67D000, v45, OS_LOG_TYPE_FAULT, "BMNowPlayingAVOutputDeviceType: Unrecognized value for outputDevice: %ld", buf, 0xCu);
          }

          unint64_t v44 = 0;
        }
        else
        {
          unint64_t v44 = v42 + 1;
        }
        unint64_t v46 = [v40 deviceSubType];
        unint64_t v47 = v46;
        if (v46 >= 0x14)
        {
          objc_super v49 = __biome_log_for_category();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v108 = v47;
            _os_log_fault_impl(&dword_18E67D000, v49, OS_LOG_TYPE_FAULT, "BMNowPlayingAVOutputDeviceSubType: Unrecognized value for outputSubtype: %ld", buf, 0xCu);
          }

          unint64_t v48 = 0;
        }
        else
        {
          unint64_t v48 = v46 + 1;
        }
        v50 = [v40 deviceID];
        v51 = [(BMNowPlayingOutputDevice *)v41 initWithDeviceType:v44 deviceSubType:v48 deviceId:v50];
        [v34 addObject:v51];

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v102 objects:v106 count:16];
    }
    while (v37);
  }

  LOBYTE(v54) = v55;
  LODWORD(v53) = v61;
  v101 = -[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:](self, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:isAirPlayVideo:outputDevices:", v100, v99, v77, v84, v81, v69, v20, v74, v71, v53, v64, v63, v62, v60, v59,
           v54,
           v34);

  return v101;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"NowPlaying event with uniqueId:%@", self->_uniqueID];

  return (NSString *)v2;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMNowPlayingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMNowPlayingEvent)initWithProto:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v44 = self;
      id v45 = v4;
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v7 = [v5 outputDevices];
      v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v9 = [v5 outputDevices];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v48 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v15 = [BMNowPlayingOutputDevice alloc];
            uint64_t v16 = (int)[v14 outputDeviceType];
            uint64_t v17 = (int)[v14 outputDeviceSubType];
            uint64_t v18 = [v14 outputDeviceId];
            double v19 = [(BMNowPlayingOutputDevice *)v15 initWithDeviceType:v16 deviceSubType:v17 deviceId:v18];
            [v8 addObject:v19];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v11);
      }

      uint64_t v43 = (int)[v5 playbackState];
      unsigned int v42 = [v5 itemMediaType];
      unsigned int v39 = [v5 itemMediaSubtype];
      id v41 = [v5 uniqueId];
      id v40 = [v5 bundleId];
      [v5 absoluteTimestamp];
      double v21 = v20;
      uint64_t v38 = [v5 album];
      uint64_t v37 = [v5 artist];
      unsigned int v36 = [v5 duration];
      unint64_t v46 = [v5 genre];
      v34 = [v5 title];
      int v35 = [v5 elapsed];
      id v33 = [v5 mediaType];
      v32 = [v5 iTunesStoreIdentifier];
      v31 = [v5 iTunesSubscriptionIdentifier];
      uint64_t v22 = [v5 iTunesArtistIdentifier];
      uint64_t v23 = [v5 iTunesAlbumIdentifier];
      v24 = [v5 groupIdentifier];
      char v25 = [v5 isAirPlayVideo];
      BYTE1(v30) = [v5 isRemoteControl];
      LOBYTE(v30) = v25;
      LODWORD(v29) = v35;
      self = objc_retain(-[BMNowPlayingEvent initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:](v44, "initWithUniqueID:bundleID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:itemMediaType:itemMediaSubtype:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isAirPlayVideo:isRemoteControl:outputDevices:", v41, v40, v43, v38, v37, v36, v21, v46, v34, v29, v33, __PAIR64__(v39, v42), v32, v31,
                 v22,
                 v23,
                 v24,
                 v30,
                 v8));

      v26 = v5;
      id v27 = self;
      id v4 = v45;
    }
    else
    {
      v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[BMNowPlayingEvent initWithProto:]((uint64_t)self, v26);
      }
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (BMNowPlayingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBNowPlayingEvent alloc] initWithData:v4];

    self = [(BMNowPlayingEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_outputDevices, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_outputDevices;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "proto", (void)v17);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v10 = objc_opt_new();
  [v10 setUniqueId:self->_uniqueID];
  [v10 setBundleId:self->_bundleID];
  [v10 setAbsoluteTimestamp:self->_absoluteTimestamp];
  unint64_t playbackState = self->_playbackState;
  if (playbackState >= 6)
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMNowPlayingEvent proto](playbackState);
    }
  }
  else
  {
    uint64_t itemMediaType = self->_itemMediaType;
    if (itemMediaType >= 3)
    {
      v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[BMNowPlayingEvent proto](itemMediaType);
      }
    }
    else
    {
      uint64_t itemMediaSubtype = self->_itemMediaSubtype;
      if (itemMediaSubtype < 8)
      {
        [v10 setPlaybackState:self->_playbackState];
        [v10 setAlbum:self->_album];
        [v10 setArtist:self->_artist];
        [v10 setDuration:self->_duration];
        [v10 setGenre:self->_genre];
        [v10 setTitle:self->_title];
        [v10 setElapsed:self->_elapsed];
        [v10 setMediaType:self->_mediaType];
        [v10 setItemMediaType:itemMediaType];
        [v10 setItemMediaSubtype:itemMediaSubtype];
        [v10 setITunesStoreIdentifier:self->_iTunesStoreIdentifier];
        [v10 setITunesSubscriptionIdentifier:self->_iTunesSubscriptionIdentifier];
        [v10 setITunesArtistIdentifier:self->_iTunesArtistIdentifier];
        [v10 setITunesAlbumIdentifier:self->_iTunesAlbumIdentifier];
        [v10 setGroupIdentifier:self->_groupIdentifier];
        [v10 setIsAirPlayVideo:self->_isAirPlayVideo];
        [v10 setIsRemoteControl:self->_isRemoteControl];
        [v10 setOutputDevices:v3];
        id v14 = v10;
        goto LABEL_19;
      }
      v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[BMNowPlayingEvent proto](itemMediaSubtype);
      }
    }
  }

  id v14 = 0;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  double v3 = (double)self->_playbackState
     + (self->_absoluteTimestamp + (double)(31 * [(NSString *)self->_uniqueID hash])) * 31.0;
  double v4 = (double)[(NSString *)self->_album hash] + v3 * 31.0;
  unint64_t v5 = [(NSString *)self->_artist hash];
  LODWORD(v6) = self->_duration;
  double v7 = (double)[(NSString *)self->_genre hash] + ((double)v6 + ((double)v5 + v4 * 31.0) * 31.0) * 31.0;
  unint64_t v8 = [(NSString *)self->_title hash];
  LODWORD(v9) = self->_elapsed;
  double v10 = (double)self->_itemMediaSubtype
      + ((double)self->_itemMediaType
       + ((double)[(NSString *)self->_mediaType hash] + ((double)v9 + ((double)v8 + v7 * 31.0) * 31.0) * 31.0)
       * 31.0)
      * 31.0;
  double v11 = (double)[(NSString *)self->_iTunesStoreIdentifier hash] + v10 * 31.0;
  double v12 = (double)[(NSString *)self->_iTunesSubscriptionIdentifier hash] + v11 * 31.0;
  double v13 = (double)[(NSString *)self->_iTunesArtistIdentifier hash] + v12 * 31.0;
  double v14 = (double)[(NSString *)self->_iTunesAlbumIdentifier hash] + v13 * 31.0;
  unint64_t v15 = [(NSString *)self->_groupIdentifier hash];
  LOBYTE(v16) = self->_isAirPlayVideo;
  *(double *)&unint64_t v17 = (double)v16;
  double v18 = *(double *)&v17 + ((double)v15 + v14 * 31.0) * 31.0;
  LOBYTE(v17) = self->_isRemoteControl;
  double v19 = (double)(unint64_t)[(NSArray *)self->_outputDevices hash] + ((double)v17 + v18 * 31.0) * 31.0;
  return (unint64_t)(v19 + (double)[(NSString *)self->_bundleID hash]);
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_110;
  }
  id v8 = v7;
  unint64_t v9 = v8;
  uniqueID = self->_uniqueID;
  double v11 = uniqueID;
  if (uniqueID)
  {
LABEL_5:
    double v12 = [v9 uniqueID];
    char v81 = [(NSString *)v11 isEqual:v12];

    if (uniqueID) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  double v3 = [v8 uniqueID];
  if (v3)
  {
    double v11 = self->_uniqueID;
    goto LABEL_5;
  }
  char v81 = 1;
LABEL_9:

LABEL_10:
  bundleID = self->_bundleID;
  unint64_t v15 = bundleID;
  if (bundleID) {
    goto LABEL_13;
  }
  double v3 = [v9 bundleID];
  if (v3)
  {
    unint64_t v15 = self->_bundleID;
LABEL_13:
    unint64_t v16 = [v9 bundleID];
    char v80 = [(NSString *)v15 isEqual:v16];

    if (bundleID) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  char v80 = 1;
LABEL_16:

LABEL_17:
  album = self->_album;
  double v18 = album;
  if (album) {
    goto LABEL_20;
  }
  double v3 = [v9 album];
  if (v3)
  {
    double v18 = self->_album;
LABEL_20:
    double v19 = [v9 album];
    char v79 = [(NSString *)v18 isEqual:v19];

    if (album) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  char v79 = 1;
LABEL_23:

LABEL_24:
  artist = self->_artist;
  double v21 = artist;
  if (artist) {
    goto LABEL_27;
  }
  double v3 = [v9 artist];
  if (v3)
  {
    double v21 = self->_artist;
LABEL_27:
    uint64_t v22 = [v9 artist];
    char v78 = [(NSString *)v21 isEqual:v22];

    if (artist) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  char v78 = 1;
LABEL_30:

LABEL_31:
  genre = self->_genre;
  v24 = genre;
  if (genre) {
    goto LABEL_34;
  }
  double v3 = [v9 genre];
  if (v3)
  {
    v24 = self->_genre;
LABEL_34:
    char v25 = [v9 genre];
    char v77 = [(NSString *)v24 isEqual:v25];

    if (genre) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  char v77 = 1;
LABEL_37:

LABEL_38:
  title = self->_title;
  id v27 = title;
  if (title) {
    goto LABEL_41;
  }
  double v3 = [v9 title];
  if (v3)
  {
    id v27 = self->_title;
LABEL_41:
    id v28 = [v9 title];
    char v76 = [(NSString *)v27 isEqual:v28];

    if (title) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  char v76 = 1;
LABEL_44:

LABEL_45:
  mediaType = self->_mediaType;
  uint64_t v30 = mediaType;
  if (mediaType) {
    goto LABEL_48;
  }
  double v3 = [v9 mediaType];
  if (v3)
  {
    uint64_t v30 = self->_mediaType;
LABEL_48:
    v31 = [v9 mediaType];
    char v75 = [v30 isEqual:v31];

    if (mediaType) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  char v75 = 1;
LABEL_51:

LABEL_52:
  uint64_t v32 = 112;
  iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
  v34 = iTunesStoreIdentifier;
  if (iTunesStoreIdentifier) {
    goto LABEL_55;
  }
  uint64_t v30 = [v9 iTunesStoreIdentifier];
  if (v30)
  {
    v34 = self->_iTunesStoreIdentifier;
LABEL_55:
    uint64_t v32 = [v9 iTunesStoreIdentifier];
    char v74 = [(NSString *)v34 isEqual:v32];

    if (iTunesStoreIdentifier) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  char v74 = 1;
LABEL_58:

LABEL_59:
  uint64_t v35 = 120;
  iTunesSubscriptionIdentifier = self->_iTunesSubscriptionIdentifier;
  uint64_t v37 = iTunesSubscriptionIdentifier;
  if (iTunesSubscriptionIdentifier) {
    goto LABEL_62;
  }
  uint64_t v32 = [v9 iTunesSubscriptionIdentifier];
  if (v32)
  {
    uint64_t v37 = self->_iTunesSubscriptionIdentifier;
LABEL_62:
    uint64_t v35 = [v9 iTunesSubscriptionIdentifier];
    char v73 = [(NSString *)v37 isEqual:v35];

    if (iTunesSubscriptionIdentifier) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  char v73 = 1;
LABEL_65:

LABEL_66:
  iTunesArtistIdentifier = self->_iTunesArtistIdentifier;
  unsigned int v39 = iTunesArtistIdentifier;
  if (iTunesArtistIdentifier) {
    goto LABEL_69;
  }
  uint64_t v35 = [v9 iTunesArtistIdentifier];
  if (v35)
  {
    unsigned int v39 = self->_iTunesArtistIdentifier;
LABEL_69:
    double v4 = [v9 iTunesArtistIdentifier];
    char v40 = [(NSString *)v39 isEqual:v4];

    if (iTunesArtistIdentifier) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  char v40 = 1;
LABEL_72:

LABEL_73:
  iTunesAlbumIdentifier = self->_iTunesAlbumIdentifier;
  unsigned int v42 = iTunesAlbumIdentifier;
  if (iTunesAlbumIdentifier) {
    goto LABEL_76;
  }
  double v4 = [v9 iTunesAlbumIdentifier];
  if (v4)
  {
    unsigned int v42 = self->_iTunesAlbumIdentifier;
LABEL_76:
    unint64_t v5 = [v9 iTunesAlbumIdentifier];
    char v72 = [(NSString *)v42 isEqual:v5];

    if (iTunesAlbumIdentifier) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  char v72 = 1;
LABEL_79:

LABEL_80:
  groupIdentifier = self->_groupIdentifier;
  unint64_t v44 = groupIdentifier;
  if (!groupIdentifier)
  {
    unint64_t v5 = [v9 groupIdentifier];
    if (!v5)
    {
      char v46 = 1;
LABEL_86:

      goto LABEL_87;
    }
    unint64_t v44 = self->_groupIdentifier;
  }
  id v45 = [v9 groupIdentifier];
  char v46 = [(NSString *)v44 isEqual:v45];

  if (!groupIdentifier) {
    goto LABEL_86;
  }
LABEL_87:
  uint64_t v47 = [(NSArray *)self->_outputDevices count];
  long long v48 = [v9 outputDevices];
  uint64_t v49 = [v48 count];

  if (v47 == v49)
  {
    uint64_t v50 = v47 - 1;
    if (v47 < 1)
    {
      LOBYTE(v56) = 1;
    }
    else
    {
      char v70 = v46;
      id v71 = v7;
      char v51 = v40;
      uint64_t v52 = 0;
      do
      {
        uint64_t v53 = [(NSArray *)self->_outputDevices objectAtIndexedSubscript:v52];
        uint64_t v54 = [v9 outputDevices];
        char v55 = [v54 objectAtIndexedSubscript:v52];
        int v56 = [v53 isEqual:v55];

        if (v56) {
          BOOL v57 = v50 == v52;
        }
        else {
          BOOL v57 = 1;
        }
        ++v52;
      }
      while (!v57);
      char v40 = v51;
      id v7 = v71;
      char v46 = v70;
    }
  }
  else
  {
    LOBYTE(v56) = 0;
  }
  double absoluteTimestamp = self->_absoluteTimestamp;
  [v9 absoluteTimestamp];
  if (absoluteTimestamp == v59
    && (unint64_t playbackState = self->_playbackState, playbackState == [v9 playbackState])
    && (unsigned int duration = self->_duration, duration == [v9 duration])
    && (unsigned int elapsed = self->_elapsed, elapsed == [v9 elapsed])
    && (int itemMediaType = self->_itemMediaType, itemMediaType == [v9 itemMediaType])
    && (int itemMediaSubtype = self->_itemMediaSubtype,
        itemMediaSubtype == [v9 itemMediaSubtype])
    && (int isAirPlayVideo = self->_isAirPlayVideo, isAirPlayVideo == [v9 isAirPlayVideo]))
  {
    int isRemoteControl = self->_isRemoteControl;
    int v67 = [v9 isRemoteControl];
    char v68 = v81;
    if (isRemoteControl != v67) {
      char v68 = 0;
    }
    char v13 = v68 & v80 & v79 & v78 & v77 & v76 & v75 & v74 & v73 & v40 & v72 & v46 & v56;
  }
  else
  {
    char v13 = 0;
  }

LABEL_110:
  return v13;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)title
{
  return self->_title;
}

- (unsigned)elapsed
{
  return self->_elapsed;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (int)itemMediaType
{
  return self->_itemMediaType;
}

- (int)itemMediaSubtype
{
  return self->_itemMediaSubtype;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (NSString)iTunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier;
}

- (NSString)iTunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier;
}

- (NSString)iTunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)isAirPlayVideo
{
  return self->_isAirPlayVideo;
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (void)initWithDKEvent:(uint64_t)a1 outputDevices:iTunesArtistIdentifier:iTunesAlbumIdentifier:.cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithUnsignedInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMNowPlayingEvent: unable to convert MRPlaybackState enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBNowPlayingEvent proto", v5, 0xCu);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMNowPlayingEvent: unable to convert BMNowPlayingPlaybackState enum value: %@", v4, v5, v6, v7, v8);
}

@end