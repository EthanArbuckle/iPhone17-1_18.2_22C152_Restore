@interface _OSLogEventStoreMetadata
- (NSUUID)archiveUUID;
- (NSUUID)sourceUUID;
- (_OSLogEventStoreMetadata)initWithCollection:(id)a3 localStorePlist:(id)a4 liveDataDescriptor:(int)a5;
- (_OSLogEventStoreMetadata)initWithDictionary:(id)a3;
- (_OSLogEventStoreTimeRef)end;
- (_OSLogEventStoreTimeRef)oldestHighVolume;
- (_OSLogEventStoreTimeRef)oldestLive;
- (_OSLogEventStoreTimeRef)oldestPersist;
- (_OSLogEventStoreTimeRef)oldestSignpost;
- (_OSLogEventStoreTimeRef)oldestSpecial;
- (id)timeRefForTTLClass:(unsigned __int8)a3;
@end

@implementation _OSLogEventStoreMetadata

- (id)timeRefForTTLClass:(unsigned __int8)a3
{
  return self->_ttls[a3];
}

- (_OSLogEventStoreTimeRef)oldestSpecial
{
  return self->_oldestSpecial;
}

- (_OSLogEventStoreTimeRef)oldestPersist
{
  return self->_oldestPersist;
}

- (_OSLogEventStoreTimeRef)oldestLive
{
  return self->_oldestLive;
}

- (_OSLogEventStoreTimeRef)end
{
  return self->_end;
}

- (_OSLogEventStoreMetadata)initWithCollection:(id)a3 localStorePlist:(id)a4 liveDataDescriptor:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(_OSLogEventStoreMetadata *)self init];
  if (v10)
  {
    uint64_t v11 = _calculateTimeRefForBook(v8, "Persist");
    oldestPersist = v10->_oldestPersist;
    v10->_oldestPersist = (_OSLogEventStoreTimeRef *)v11;

    uint64_t v13 = _calculateTimeRefForBook(v8, "Special");
    oldestSpecial = v10->_oldestSpecial;
    v10->_oldestSpecial = (_OSLogEventStoreTimeRef *)v13;

    uint64_t v15 = _calculateTimeRefForBook(v8, "Signpost");
    oldestSignpost = v10->_oldestSignpost;
    v10->_oldestSignpost = (_OSLogEventStoreTimeRef *)v15;

    v33[0] = 0;
    v33[1] = 0;
    uint64_t v32 = 0;
    if (_OSLogFileFindExhaustivePoint(v5, (uint64_t)v33, (uint64_t)&v32) && *__error() == 2)
    {
      uint64_t v17 = 0;
    }
    else
    {
      v18 = [_OSLogEventStoreTimeRef alloc];
      uint64_t v17 = [(_OSLogEventStoreTimeRef *)v18 initWithUUID:v33 continuous:v32];
    }
    oldestLive = v10->_oldestLive;
    v10->_oldestLive = (_OSLogEventStoreTimeRef *)v17;

    uint64_t v20 = +[_OSLogEventStoreTimeRef timeRef];
    end = v10->_end;
    v10->_end = (_OSLogEventStoreTimeRef *)v20;

    v22 = [v9 objectForKeyedSubscript:@"Identifier"];
    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v22];
    sourceUUID = v10->_sourceUUID;
    v10->_sourceUUID = (NSUUID *)v23;

    objc_storeStrong((id *)&v10->_archiveUUID, v10->_sourceUUID);
    ttls = (id *)v10->_ttls;
    uint64_t v26 = 8u;
    do
    {
      v27 = [NSString stringWithUTF8String:*(void *)((char *)&_OSLogTTLTable + v26)];
      v28 = [v9 objectForKeyedSubscript:v27];

      v29 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v28];
      id v30 = *ttls;
      id *ttls = v29;

      if (!*ttls) {
        objc_storeStrong(ttls, v10->_oldestSpecial);
      }

      v26 += 16;
      ++ttls;
    }
    while (v26 != 88);
  }
  return v10;
}

- (_OSLogEventStoreTimeRef)oldestSignpost
{
  return self->_oldestSignpost;
}

- (_OSLogEventStoreTimeRef)oldestHighVolume
{
  return self->_oldestHighVolume;
}

- (NSUUID)archiveUUID
{
  return self->_archiveUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_archiveUUID, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_oldestLive, 0);
  objc_storeStrong((id *)&self->_oldestHighVolume, 0);
  objc_storeStrong((id *)&self->_oldestSignpost, 0);
  objc_storeStrong((id *)&self->_oldestSpecial, 0);
  objc_storeStrong((id *)&self->_oldestPersist, 0);
  uint64_t v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

- (_OSLogEventStoreMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_OSLogEventStoreMetadata *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"PersistMetadata"];
    v7 = [v6 objectForKeyedSubscript:@"OldestTimeRef"];

    id v8 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v7];
    oldestPersist = v5->_oldestPersist;
    v5->_oldestPersist = v8;

    v10 = [v4 objectForKeyedSubscript:@"SpecialMetadata"];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"OldestTimeRef"];

    v12 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v11];
    oldestSpecial = v5->_oldestSpecial;
    v5->_oldestSpecial = v12;

    v14 = [v4 objectForKeyedSubscript:@"SignpostMetadata"];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"OldestTimeRef"];

    v16 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v15];
    oldestSignpost = v5->_oldestSignpost;
    v5->_oldestSignpost = v16;

    v18 = [v4 objectForKeyedSubscript:@"HighVolumeMetadata"];
    v19 = [v18 objectForKeyedSubscript:@"OldestTimeRef"];

    uint64_t v20 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v19];
    oldestHighVolume = v5->_oldestHighVolume;
    v5->_oldestHighVolume = v20;

    v22 = [v4 objectForKeyedSubscript:@"LiveMetadata"];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"OldestTimeRef"];

    v24 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v23];
    oldestLive = v5->_oldestLive;
    v5->_oldestLive = v24;

    v47 = [v4 objectForKeyedSubscript:@"EndTimeRef"];
    uint64_t v26 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v47];
    end = v5->_end;
    v5->_end = v26;

    v46 = [v4 objectForKeyedSubscript:@"ArchiveIdentifier"];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v46];
    archiveUUID = v5->_archiveUUID;
    v5->_archiveUUID = (NSUUID *)v28;

    id v30 = [v4 objectForKeyedSubscript:@"SourceIdentifier"];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v30];
    sourceUUID = v5->_sourceUUID;
    v5->_sourceUUID = (NSUUID *)v31;

    if (!v5->_oldestPersist || !v5->_oldestSpecial || !v5->_oldestLive || !v5->_end)
    {

      v41 = 0;
      goto LABEL_15;
    }
    v43 = v23;
    v44 = v11;
    v45 = v7;
    v33 = [v4 objectForKeyedSubscript:@"SpecialMetadata"];
    v34 = [v33 objectForKeyedSubscript:@"TTL"];

    ttls = (id *)v5->_ttls;
    uint64_t v36 = 8u;
    do
    {
      if (v34)
      {
        v37 = [NSString stringWithUTF8String:*(void *)((char *)&_OSLogTTLTable + v36)];
        v38 = [v34 objectForKeyedSubscript:v37];

        v39 = [[_OSLogEventStoreTimeRef alloc] initWithDictionary:v38];
        id v40 = *ttls;
        id *ttls = v39;
      }
      if (!*ttls) {
        objc_storeStrong(ttls, v5->_oldestSpecial);
      }
      v36 += 16;
      ++ttls;
    }
    while (v36 != 88);
  }
  v41 = v5;
LABEL_15:

  return v41;
}

@end