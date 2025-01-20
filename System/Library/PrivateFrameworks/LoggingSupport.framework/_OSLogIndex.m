@interface _OSLogIndex
- (BOOL)_addFileToIndex:(const char *)a3 error:(id *)a4;
- (BOOL)_buildFileIndex;
- (BOOL)_buildSingleFileIndex:(id *)a3;
- (BOOL)_openTimesyncDatabase;
- (BOOL)_readArchiveMetadata:(id *)a3;
- (BOOL)addReferenceToIndex:(id)a3 error:(id *)a4;
- (_OSLogIndex)init;
- (_OSLogIndex)initWithCollection:(id)a3 buildLocalIndex:(BOOL)a4;
- (_OSLogIndex)initWithCollection:(id)a3 timesync:(_os_timesync_db_s *)a4 metadata:(id)a5;
- (_os_timesync_db_s)timesync;
- (unint64_t)endWalltime;
- (unint64_t)persistStartWalltime;
- (unint64_t)specialStartWalltime;
- (void)_enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingBlock:(id)a5;
- (void)_foreachIndexFile:(id)a3;
- (void)dealloc;
- (void)enumerateEntriesFrom:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6;
- (void)enumerateEntriesFromLastBootWithOptions:(unsigned int)a3 usingBlock:(id)a4;
- (void)enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingCatalogFilter:(id)a5 usingBlock:(id)a6;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)enumerateFilesUsingBlock:(id)a3;
- (void)insertChunkStore:(id)a3;
- (void)insertIndexFile:(id)a3;
@end

@implementation _OSLogIndex

- (void)insertIndexFile:(id)a3
{
}

- (void)dealloc
{
  tsdb = (int *)self->_tsdb;
  if (tsdb) {
    _timesync_db_close(tsdb);
  }
  v4.receiver = self;
  v4.super_class = (Class)_OSLogIndex;
  [(_OSLogIndex *)&v4 dealloc];
}

- (_OSLogIndex)initWithCollection:(id)a3 timesync:(_os_timesync_db_s *)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [(_OSLogIndex *)self init];
  v12 = v11;
  if (!v11)
  {
LABEL_33:
    v18 = v12;
    goto LABEL_34;
  }
  objc_storeStrong((id *)&v11->_lcr, a3);
  uint64_t v13 = _timesync_db_openat(*(_DWORD *)a4, ".");
  v12->_tsdb = (_os_timesync_db_s *)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v12->_metadata2, a5);
    if (v10)
    {
      id v14 = v10;
      v15 = [v14 oldestLive];
      v16 = v15;
      if (v15)
      {
        *(_OWORD *)v12->_metadata.olim_oldestlive.uuid = *(_OWORD *)[v15 UUID];
        uint64_t v17 = [v16 continuousTime];
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestlive.uuid);
        uint64_t v17 = 0;
      }
      v12->_metadata.olim_oldestlive.continuous = v17;

      v19 = [v14 oldestPersist];
      v20 = v19;
      if (v19)
      {
        *(_OWORD *)v12->_metadata.olim_oldestpersist.uuid = *(_OWORD *)[v19 UUID];
        uint64_t v21 = [v20 continuousTime];
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestpersist.uuid);
        uint64_t v21 = 0;
      }
      v12->_metadata.olim_oldestpersist.continuous = v21;

      v22 = [v14 oldestSpecial];
      v23 = v22;
      if (v22)
      {
        *(_OWORD *)v12->_metadata.olim_oldestspecial.uuid = *(_OWORD *)[v22 UUID];
        uint64_t v24 = [v23 continuousTime];
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestspecial.uuid);
        uint64_t v24 = 0;
      }
      v12->_metadata.olim_oldestspecial.continuous = v24;

      v25 = [v14 oldestSignpost];
      v26 = v25;
      if (v25)
      {
        *(_OWORD *)v12->_metadata.olim_oldestsignpost.uuid = *(_OWORD *)[v25 UUID];
        uint64_t v27 = [v26 continuousTime];
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldestsignpost.uuid);
        uint64_t v27 = 0;
      }
      v12->_metadata.olim_oldestsignpost.continuous = v27;

      v28 = [v14 oldestHighVolume];
      v29 = v28;
      if (v28)
      {
        *(_OWORD *)v12->_metadata.olim_oldesthighvol.uuid = *(_OWORD *)[v28 UUID];
        uint64_t v30 = [v29 continuousTime];
      }
      else
      {
        uuid_clear(v12->_metadata.olim_oldesthighvol.uuid);
        uint64_t v30 = 0;
      }
      v12->_metadata.olim_oldesthighvol.continuous = v30;

      v31 = [v14 end];
      v32 = v31;
      if (v31)
      {
        *(_OWORD *)v12->_metadata.olim_end.uuid = *(_OWORD *)[v31 UUID];
        uint64_t v33 = [v32 continuousTime];
      }
      else
      {
        uuid_clear(v12->_metadata.olim_end.uuid);
        uint64_t v33 = 0;
      }
      v12->_metadata.olim_end.continuous = v33;

      uint64_t v34 = 0;
      olim_ttl = v12->_metadata.olim_ttl;
      while (2)
      {
        v36 = [v14 timeRefForTTLClass:v34];
        v37 = v36;
        if (v36)
        {
          *(_OWORD *)olim_ttl->timeref.uuid = *(_OWORD *)[v36 UUID];
          uint64_t v38 = [v37 continuousTime];
        }
        else
        {
          uuid_clear(olim_ttl->timeref.uuid);
          uint64_t v38 = 0;
        }
        olim_ttl->timeref.continuous = v38;

        char v40 = 1;
        switch(v34)
        {
          case 0:
            goto LABEL_31;
          case 1:
            char v40 = 3;
            goto LABEL_31;
          case 2:
            char v40 = 7;
            goto LABEL_31;
          case 3:
            char v40 = 14;
LABEL_31:
            olim_ttl->ttl = v40;
            ++olim_ttl;
            ++v34;
            continue;
          case 4:
            v12->_metadata.olim_ttl[4].ttl = 30;

            _os_log_index_metadata_determine_oldest();
          default:
            qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: _tp_class_ttl_to called with invalid tp";
            __break(1u);
            return result;
        }
      }
    }
    goto LABEL_33;
  }
  v18 = 0;
LABEL_34:

  return v18;
}

- (_os_timesync_db_s)timesync
{
  return self->_tsdb;
}

- (_OSLogIndex)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSLogIndex;
  v2 = [(_OSLogIndex *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fileq = v2->_fileq;
    v2->_fileq = v3;
  }
  return v2;
}

- (void)enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingCatalogFilter:(id)a5 usingBlock:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  fileq = self->_fileq;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = ___OSLogIndexSortedByBoot_block_invoke;
  v34[3] = &__block_descriptor_40_e32_B32__0___OSLogIndexFile_8Q16_B24l;
  v34[4] = a3;
  v12 = fileq;
  id v13 = a5;
  id v14 = [(NSMutableArray *)v12 indexesOfObjectsPassingTest:v34];
  v15 = [(NSMutableArray *)v12 objectsAtIndexes:v14];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = ___OSLogIndexSortedByBoot_block_invoke_2;
  v32[3] = &__block_descriptor_44_e11_q24__0_8_16l;
  v32[4] = a3;
  int v33 = v7;
  v16 = [v15 sortedArrayUsingComparator:v32];

  if (self->_metadataValid
    && ((olim_oldest = self->_metadata.olim_oldest) == 0
     || (_timesync_range_intersect((char *)a3, olim_oldest, olim_oldest->continuous, self->_metadata.olim_end.uuid, self->_metadata.olim_end.continuous), self->_metadataValid)))
  {
    p_metadata = &self->_metadata;
  }
  else
  {
    p_metadata = 0;
  }
  v19 = [[_OSLogIndexEnumerator alloc] initWithIndex:self metadata:p_metadata fileBootList:v16 catalogFilter:v13];

  id v20 = +[OSLogEventProxy _make];
  [v20 _setTimesyncDatabase:self->_tsdb];
  [v20 _setIncludeSensitive:(v7 & 1) == 0];
  uint64_t v21 = [(_OSLogCollectionReference *)self->_lcr UUIDTextReference];
  objc_msgSend(v20, "_setUUIDDBFileDescriptor:", objc_msgSend(v21, "fileDescriptor"));

  [v20 _setDoNotTrackActivites:(v7 >> 4) & 1];
  tsdb = self->_tsdb;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __77___OSLogIndex_enumerateEntriesInRange_options_usingCatalogFilter_usingBlock___block_invoke;
  v28 = &unk_1E5A423D8;
  id v30 = v10;
  id v31 = v20;
  v29 = v19;
  id v23 = v10;
  uint64_t v24 = v19;
  [(_OSLogIndexEnumerator *)v24 enumerateTracepointsInRange:a3 timesync:tsdb options:v7 usingBlock:&v25];
  objc_msgSend(v20, "_unmake", v25, v26, v27, v28);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata2, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_lcr, 0);
  objc_storeStrong((id *)&self->_fileq, 0);
}

- (void)enumerateFilesUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_OSLogCollectionReference *)self->_lcr UUIDTextReference];
  uint64_t v6 = [v5 fileDescriptor];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_fileq;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      id v13 = (void *)MEMORY[0x1A622D720](v8);
      id v14 = objc_msgSend(v12, "copyMappedChunkStore:", 0, (void)v16);
      int v15 = (*((uint64_t (**)(id, uint64_t, void, void))v4 + 2))(v4, v6, v14[1], v14[2]);

      if (!v15) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = v8;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
}

- (void)_enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  fileq = self->_fileq;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = ___OSLogIndexSortedByBoot_block_invoke;
  v34[3] = &__block_descriptor_40_e32_B32__0___OSLogIndexFile_8Q16_B24l;
  v34[4] = a3;
  uint64_t v10 = fileq;
  uint64_t v11 = [(NSMutableArray *)v10 indexesOfObjectsPassingTest:v34];
  v12 = [(NSMutableArray *)v10 objectsAtIndexes:v11];

  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = (uint64_t)___OSLogIndexSortedByBoot_block_invoke_2;
  v32 = (const char *)&__block_descriptor_44_e11_q24__0_8_16l;
  *(void *)&v33[0] = a3;
  DWORD2(v33[0]) = v5;
  id v13 = [v12 sortedArrayUsingComparator:&v29];

  if (self->_metadataValid
    && ((olim_oldest = self->_metadata.olim_oldest) == 0
     || (_timesync_range_intersect((char *)a3, olim_oldest, olim_oldest->continuous, self->_metadata.olim_end.uuid, self->_metadata.olim_end.continuous), self->_metadataValid)))
  {
    p_metadata = &self->_metadata;
  }
  else
  {
    p_metadata = 0;
  }
  long long v16 = [[_OSLogIndexEnumerator alloc] initWithIndex:self metadata:p_metadata fileBootList:v13 catalogFilter:0];
  uint64_t v29 = 0;
  uint64_t v30 = (uint64_t)&v29;
  uint64_t v31 = 0x9010000000;
  v32 = "+a";
  memset(v33, 0, sizeof(v33));
  _chunk_support_context_init((uint64_t)v33);
  long long v17 = [(_OSLogCollectionReference *)self->_lcr UUIDTextReference];
  int v18 = [v17 fileDescriptor];
  *(_DWORD *)(v30 + 36) = v18;

  uint64_t v19 = v30;
  *(void *)(v30 + 120) = self->_tsdb;
  if (v5) {
    *(_DWORD *)(v19 + 32) |= 0x80u;
  }
  tsdb = self->_tsdb;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59___OSLogIndex__enumerateEntriesInRange_options_usingBlock___block_invoke;
  v25[3] = &unk_1E5A423B0;
  id v21 = v8;
  id v27 = v21;
  v28 = &v29;
  v22 = v16;
  uint64_t v26 = v22;
  [(_OSLogIndexEnumerator *)v22 enumerateTracepointsInRange:a3 timesync:tsdb options:v5 usingBlock:v25];
  uint64_t v23 = v30;
  uint64_t v24 = v30 + 32;
  *(void *)(v30 + 72) = 0;
  *(_DWORD *)(v23 + 36) = -1;
  _chunk_support_context_clear(v24);

  _Block_object_dispose(&v29, 8);
}

- (void)enumerateEntriesFromLastBootWithOptions:(unsigned int)a3 usingBlock:(id)a4
{
  id v4 = a4;
  _timesync_range_create_since_last_boot();
}

- (void)enumerateEntriesFrom:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  id v6 = a6;
  _timesync_range_create_impl();
}

- (unint64_t)endWalltime
{
  if (self->_metadataValid) {
    return _timesync_continuous_to_wall_time((uint64_t)self->_tsdb, self->_metadata.olim_end.uuid, self->_metadata.olim_end.continuous, 0);
  }
  else {
    return -1;
  }
}

- (unint64_t)specialStartWalltime
{
  if (self->_metadataValid) {
    return _timesync_continuous_to_wall_time((uint64_t)self->_tsdb, self->_metadata.olim_oldestspecial.uuid, self->_metadata.olim_oldestspecial.continuous, 0);
  }
  else {
    return 0;
  }
}

- (unint64_t)persistStartWalltime
{
  if (self->_metadataValid) {
    return _timesync_continuous_to_wall_time((uint64_t)self->_tsdb, self->_metadata.olim_oldestpersist.uuid, self->_metadata.olim_oldestpersist.continuous, 0);
  }
  else {
    return 0;
  }
}

- (BOOL)_buildSingleFileIndex:(id *)a3
{
  uint64_t v5 = [[_OSLogChunkFileReference alloc] initWithCollection:self->_lcr subpath:[(NSString *)self->_file fileSystemRepresentation]];
  id v6 = [[_OSLogIndexFile alloc] initWithTraceFile:v5 error:a3];
  if (v6) {
    [(NSMutableArray *)self->_fileq addObject:v6];
  }

  return v6 != 0;
}

- (BOOL)_buildFileIndex
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(_OSLogCollectionReference *)self->_lcr diagnosticsDirectoryReference];
  int v4 = [v3 fileDescriptor];

  if (fcntl(v4, 50, __s, 1025) < 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v16[0] = __s;
    v16[1] = 0;
    uint64_t v5 = fts_open(v16, 2132, 0);
    if (v5)
    {
      id v6 = v5;
      size_t v7 = strlen(__s);
      *(_WORD *)&__s[v7] = 47;
      id v8 = fts_read(v6);
      if (v8)
      {
        uint64_t v9 = v8;
        size_t v10 = v7 + 1;
        do
        {
          if (v9->fts_level)
          {
            int fts_info = v9->fts_info;
            if (fts_info == 1)
            {
              if (v9->fts_level != 1
                || strcmp(v9->fts_name, "Persist")
                && strcmp(v9->fts_name, "Special")
                && strcmp(v9->fts_name, "Signpost")
                && strcmp(v9->fts_name, "HighVolume"))
              {
                fts_set(v6, v9, 4);
              }
            }
            else if (fts_info == 8)
            {
              v12 = strrchr(v9->fts_name, 46);
              if (v12)
              {
                if (!strcmp(v12, ".tracev3"))
                {
                  fts_path = v9->fts_path;
                  if (!strncmp(fts_path, __s, v10)) {
                    size_t v14 = v10;
                  }
                  else {
                    size_t v14 = 0;
                  }
                  [(_OSLogIndex *)self _addFileToIndex:&fts_path[v14] error:0];
                }
              }
            }
          }
          uint64_t v9 = fts_read(v6);
        }
        while (v9);
      }
      fts_close(v6);
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (void)insertChunkStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_OSLogIndexFile alloc] initWithChunkStore:v4 error:0];

  [(NSMutableArray *)self->_fileq addObject:v5];
}

- (void)_foreachIndexFile:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_fileq;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)_addFileToIndex:(const char *)a3 error:(id *)a4
{
  uint64_t v6 = [[_OSLogChunkFileReference alloc] initWithCollection:self->_lcr subpath:a3];
  LOBYTE(a4) = [(_OSLogIndex *)self addReferenceToIndex:v6 error:a4];

  return (char)a4;
}

- (BOOL)addReferenceToIndex:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [[_OSLogIndexFile alloc] initWithTraceFile:v6 error:a4];

  if (v7) {
    [(NSMutableArray *)self->_fileq addObject:v7];
  }

  return v7 != 0;
}

- (BOOL)_openTimesyncDatabase
{
  v3 = [(_OSLogCollectionReference *)self->_lcr timesyncReference];
  int v4 = [v3 fileDescriptor];

  uint64_t v5 = (_os_timesync_db_s *)_timesync_db_openat(v4, ".");
  if (v5) {
    self->_tsdb = v5;
  }
  return v5 != 0;
}

- (BOOL)_readArchiveMetadata:(id *)a3
{
  uint64_t v5 = [(_OSLogCollectionReference *)self->_lcr diagnosticsDirectoryReference];
  [v5 fileDescriptor];
  uint64_t v6 = _os_trace_mmap_at();

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:0 deallocator:&__block_literal_global_573];
    uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:a3];
    uint64_t v9 = v8;
    if (v8)
    {
      long long v10 = [v8 objectForKeyedSubscript:@"PersistMetadata"];
      long long v11 = [v10 objectForKeyedSubscript:@"OldestTimeRef"];

      if (v11)
      {
        id v12 = v11;
        long long v13 = [v12 objectForKeyedSubscript:@"UUID"];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uuid_parse((const char *)[v13 UTF8String], self->_metadata.olim_oldestpersist.uuid);
            size_t v14 = [v12 objectForKeyedSubscript:@"ContinuousTime"];
            if (v14)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                self->_metadata.olim_oldestpersist.continuous = [v14 unsignedLongLongValue];
              }
            }
          }
        }

        uint64_t v15 = [v9 objectForKeyedSubscript:@"EndTimeRef"];
        long long v16 = v15;
        if (v15)
        {
          id v17 = v15;
          uint64_t v18 = [v17 objectForKeyedSubscript:@"UUID"];
          if (v18)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uuid_parse((const char *)[v18 UTF8String], self->_metadata.olim_end.uuid);
              uint64_t v19 = [v17 objectForKeyedSubscript:@"ContinuousTime"];
              if (v19)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  self->_metadata.olim_end.continuous = [v19 unsignedLongLongValue];
                }
              }
            }
          }

          id v20 = [v9 objectForKeyedSubscript:@"LiveMetadata"];
          id v21 = [v20 objectForKeyedSubscript:@"OldestTimeRef"];

          if (v21)
          {
            v51 = v21;
            id v22 = v21;
            uint64_t v23 = [v22 objectForKeyedSubscript:@"UUID"];
            if (v23)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uuid_parse((const char *)[v23 UTF8String], self->_metadata.olim_oldestlive.uuid);
                uint64_t v24 = [v22 objectForKeyedSubscript:@"ContinuousTime"];
                if (v24)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    self->_metadata.olim_oldestlive.continuous = [v24 unsignedLongLongValue];
                  }
                }
              }
            }

            uint64_t v25 = [v9 objectForKeyedSubscript:@"SpecialMetadata"];
            if (v25)
            {
              v50 = v25;
              uint64_t v26 = [v25 objectForKeyedSubscript:@"OldestTimeRef"];
              BOOL v27 = v26 != 0;
              if (v26)
              {
                uu = &self->_metadata.olim_oldestspecial;
                id v28 = v26;
                uint64_t v29 = [v28 objectForKeyedSubscript:@"UUID"];
                if (v29)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uuid_parse((const char *)[v29 UTF8String], uu->uuid);
                    uint64_t v30 = [v28 objectForKeyedSubscript:@"ContinuousTime"];
                    if (v30)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        self->_metadata.olim_oldestspecial.continuous = [v30 unsignedLongLongValue];
                      }
                    }
                  }
                }

                v49 = [v9 objectForKeyedSubscript:@"SignpostMetadata"];
                if (v49)
                {
                  id v31 = [v49 objectForKeyedSubscript:@"OldestTimeRef"];
                  v32 = [v31 objectForKeyedSubscript:@"UUID"];
                  if (v32)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uuid_parse((const char *)[v32 UTF8String], self->_metadata.olim_oldestsignpost.uuid);
                      int v33 = [v31 objectForKeyedSubscript:@"ContinuousTime"];
                      if (v33)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          self->_metadata.olim_oldestsignpost.continuous = [v33 unsignedLongLongValue];
                        }
                      }
                    }
                  }
                }
                uint64_t v34 = [v9 objectForKeyedSubscript:@"HighVolumeMetadata"];
                if (v34)
                {
                  id v35 = [v34 objectForKeyedSubscript:@"OldestTimeRef"];
                  v36 = [v35 objectForKeyedSubscript:@"UUID"];
                  if (v36)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uuid_parse((const char *)[v36 UTF8String], self->_metadata.olim_oldesthighvol.uuid);
                      v37 = [v35 objectForKeyedSubscript:@"ContinuousTime"];
                      if (v37)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          self->_metadata.olim_oldesthighvol.continuous = [v37 unsignedLongLongValue];
                        }
                      }
                    }
                  }
                }
                uint64_t v38 = [v50 objectForKeyedSubscript:@"TTL"];
                if (!v38) {
LABEL_58:
                }
                  _os_log_index_metadata_determine_oldest();
                uint64_t v39 = 0;
                char v40 = &byte_1E5A42358;
                while (1)
                {
                  v41 = [NSString stringWithUTF8String:*((void *)v40 + 1)];
                  v42 = [v38 objectForKeyedSubscript:v41];

                  v43 = (char *)self + v39 * 32;
                  id v44 = v42;
                  id v45 = [v44 objectForKeyedSubscript:@"UUID"];
                  if (!v45) {
                    goto LABEL_56;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    goto LABEL_56;
                  }
                  id v45 = v45;
                  uuid_parse((const char *)[v45 UTF8String], self->_metadata.olim_ttl[v39].timeref.uuid);
                  v46 = [v44 objectForKeyedSubscript:@"ContinuousTime"];
                  if (!v46) {
                    break;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    break;
                  }
                  *((void *)v43 + 25) = [v46 unsignedLongLongValue];

                  self->_metadata.olim_ttl[v39].ttl = *v40;
LABEL_57:

                  ++v39;
                  v40 += 16;
                  if (v39 == 5) {
                    goto LABEL_58;
                  }
                }

LABEL_56:
                v43[208] = *v40;
                *(_OWORD *)self->_metadata.olim_ttl[v39].timeref.uuid = *(_OWORD *)uu->uuid;
                *((void *)v43 + 25) = self->_metadata.olim_oldestspecial.continuous;
                goto LABEL_57;
              }

              uint64_t v25 = v50;
              id v21 = v51;
            }
            else
            {
              BOOL v27 = 0;
              id v21 = v51;
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
    v47 = __error();
    _OSLogFailWithPOSIXError((id)*v47, a3);
    return 0;
  }
  return v27;
}

- (_OSLogIndex)initWithCollection:(id)a3 buildLocalIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = [(_OSLogIndex *)self init];
  uint64_t v9 = v8;
  if (v8
    && ((objc_storeStrong((id *)&v8->_lcr, a3), ![(_OSLogIndex *)v9 _openTimesyncDatabase])
     || ([(_OSLogIndex *)v9 _readArchiveMetadata:0], v4)
     && ![(_OSLogIndex *)v9 _buildFileIndex]))
  {
    long long v10 = 0;
  }
  else
  {
    long long v10 = v9;
  }

  return v10;
}

@end