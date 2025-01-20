@interface BMStoreEnumerator
- (BMFrameStore)currentFrameStore;
- (BMStoreBookmark)bookmark;
- (BMStoreBookmarkEnumerator)bookmarkEnumerator;
- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 bookmark:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 bookmarkEnumerator:(id)a4 error:(id *)a5;
- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 currentFrameStore:(id)a4 frameStoreOffset:(unint64_t)a5 iterationStartTime:(double)a6 endTime:(double)a7 maxEvents:(unint64_t)a8 lastN:(unint64_t)a9 options:(unint64_t)a10 dataType:(Class)a11;
- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 options:(unint64_t)a8;
- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 options:(unint64_t)a8 dataType:(Class)a9;
- (BMStreamDatastore)ds;
- (BMStreamMetadata)metadata;
- (BOOL)advanceBookmarkToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5;
- (BOOL)advanceBookmarkV1ToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5;
- (BOOL)advanceBookmarkV2ToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5;
- (BOOL)isDataAccessible;
- (id)_eventWithFrameStore:(id)a3 frame:(id)a4 error:(unsigned __int8)a5;
- (id)copyNextEventAndMoveBookmark:(BOOL)a3;
- (id)copyNextEventAndMoveBookmark:(BOOL)a3 makeEvent:(id)a4;
- (id)nextEvent;
- (id)peekEvent;
- (void)bookmark;
- (void)nextEventWithContext:(id)a3;
- (void)setEndTime:(double)a3 maxEvents:(unint64_t)a4 lastN:(unint64_t)a5 reverse:(BOOL)a6;
- (void)setFrameStoreOffset:(unint64_t)a3;
@end

@implementation BMStoreEnumerator

- (id)nextEvent
{
  id v2 = [(BMStoreEnumerator *)self copyNextEventAndMoveBookmark:1];
  return v2;
}

- (id)copyNextEventAndMoveBookmark:(BOOL)a3 makeEvent:(id)a4
{
  BOOL v4 = a3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  id v51 = 0;
  v7 = [(BMStoreEnumerator *)self bookmarkEnumerator];

  if (v7)
  {
    v8 = [(BMStoreEnumerator *)self bookmarkEnumerator];
    v9 = [v8 nextBookmark];

    if (!v9)
    {
      v15 = [(BMStoreEnumerator *)self bookmarkEnumerator];
      v16 = [v15 error];

      if (!v16)
      {
        v37 = 0;
        goto LABEL_40;
      }
      __biome_log_for_category();
      v13 = (BMFrameStore *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
      {
        v17 = [(BMStoreEnumerator *)self bookmarkEnumerator];
        v18 = [v17 error];
        v19 = [(BMStoreEnumerator *)self ds];
        v20 = [v19 streamPath];
        *(_DWORD *)buf = 138412546;
        v59 = v18;
        __int16 v60 = 2112;
        v61 = v20;
        _os_log_error_impl(&dword_1AD076000, &v13->super, OS_LOG_TYPE_ERROR, "Error calling -[BMStoreBookmarkEnumerator nextBookmark]: %@ for stream %@ to create frame store", buf, 0x16u);
      }
      goto LABEL_33;
    }
    v10 = [(BMFrameStore *)self->_currentFrameStore segmentName];
    v11 = [v9 segmentName];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      v13 = self->_currentFrameStore;
    }
    else
    {
      v21 = [(BMStoreEnumerator *)self ds];
      v22 = [v9 segmentName];
      id v45 = 0;
      v13 = [v21 segmentWithFilename:v22 error:&v45];
      id v23 = v45;

      if (v23)
      {
        v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v41 = [(BMStoreEnumerator *)self ds];
          v42 = [v41 streamPath];
          v43 = [v9 segmentName];
          *(_DWORD *)buf = 138412802;
          v59 = v42;
          __int16 v60 = 2112;
          v61 = v43;
          __int16 v62 = 2112;
          id v63 = v23;
          _os_log_error_impl(&dword_1AD076000, v24, OS_LOG_TYPE_ERROR, "Unable to create frame store for stream: %@ from segmentName: %@, error:%@", buf, 0x20u);
        }
        goto LABEL_33;
      }
    }
    unint64_t frameStoreOffset = [v9 offset];
  }
  else
  {
    v13 = self->_currentFrameStore;
    unint64_t frameStoreOffset = self->_frameStoreOffset;
  }
  ds = self->_ds;
  unint64_t options = self->_options;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __60__BMStoreEnumerator_copyNextEventAndMoveBookmark_makeEvent___block_invoke;
  v44[3] = &unk_1E5E78778;
  v44[4] = &v52;
  v44[5] = &v46;
  [(BMStreamDatastore *)ds fetchEventFromFrameStore:v13 atOffset:frameStoreOffset withOptions:options callback:v44];
  v27 = (void *)v53[5];
  if (v27)
  {
    if ((self->_options & 8) != 0)
    {
      [v27 creationTimestamp];
      if (v29 >= self->_endTime) {
        goto LABEL_20;
      }
    }
    else
    {
      [v27 creationTimestamp];
      if (v28 <= self->_endTime) {
        goto LABEL_20;
      }
    }
    v30 = (void *)v53[5];
    v53[5] = 0;
  }
LABEL_20:
  v31 = (void *)v53[5];
  if (!v31)
  {
    uint64_t v33 = 1;
    goto LABEL_30;
  }
  if ([v31 datastoreVersion] == 9
    && ([(id)v53[5] modifiedTimestamp], v32 > self->_iterationStartTime))
  {
    uint64_t v33 = 4;
    if (!v4) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v33 = 1;
    if (!v4) {
      goto LABEL_30;
    }
  }
  if ([(id)v53[5] state] == 1)
  {
    unint64_t maxEvents = self->_maxEvents;
    unint64_t v35 = self->_eventCount + 1;
    self->_eventCount = v35;
    if (v35 > maxEvents)
    {
      v36 = (void *)v53[5];
      v53[5] = 0;
    }
  }
LABEL_30:
  if (v53[5])
  {
    if (v6) {
      v6[2](v6, v47[5], v53[5], v33);
    }
    else {
    v37 = -[BMStoreEnumerator _eventWithFrameStore:frame:error:](self, "_eventWithFrameStore:frame:error:", v47[5]);
    }
    objc_storeStrong((id *)&self->_currentFrameStore, (id)v47[5]);
    v38 = (void *)v53[5];
    if (v4) {
      unint64_t v39 = [v38 nextOffset];
    }
    else {
      unint64_t v39 = [v38 offset];
    }
    self->_unint64_t frameStoreOffset = v39;
    goto LABEL_39;
  }
LABEL_33:
  v37 = 0;
LABEL_39:

LABEL_40:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v37;
}

- (id)copyNextEventAndMoveBookmark:(BOOL)a3
{
  return [(BMStoreEnumerator *)self copyNextEventAndMoveBookmark:a3 makeEvent:0];
}

- (BMStoreBookmarkEnumerator)bookmarkEnumerator
{
  return self->_bookmarkEnumerator;
}

void __60__BMStoreEnumerator_copyNextEventAndMoveBookmark_makeEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)_eventWithFrameStore:(id)a3 frame:(id)a4 error:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [BMStoreEvent alloc];
  v11 = [v9 segmentName];

  int v12 = [(BMStoreEnumerator *)self metadata];
  v13 = [(BMStoreEvent *)v10 initWithFrame:v8 segmentName:v11 error:v5 eventCategory:0 metadata:v12 dataType:self->_dataType];

  return v13;
}

- (BMStreamMetadata)metadata
{
  metadata = self->_metadata;
  if (!metadata)
  {
    BOOL v4 = [(BMStreamDatastore *)self->_ds metadata];
    uint64_t v5 = self->_metadata;
    self->_metadata = v4;

    metadata = self->_metadata;
  }
  return metadata;
}

- (BMStoreBookmark)bookmark
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_currentFrameStore = &self->_currentFrameStore;
  currentFrameStore = self->_currentFrameStore;
  if (!currentFrameStore)
  {
    v11 = 0;
    goto LABEL_40;
  }
  p_unint64_t frameStoreOffset = &self->_frameStoreOffset;
  unint64_t frameStoreOffset = self->_frameStoreOffset;
  if ((~LODWORD(self->_frameStoreOffset) & 0xFFFFFFFE) == 0) {
    goto LABEL_34;
  }
  if ([(BMFrameStore *)currentFrameStore datastoreVersion] == 9)
  {
    unint64_t v7 = *p_frameStoreOffset;
    if (v7 <= (unint64_t)[(BMFrameStore *)*p_currentFrameStore bytesUsed] - 56) {
      goto LABEL_30;
    }
    BOOL v8 = [(BMFrameStore *)*p_currentFrameStore isCheckSumValidAtOffsetV1:*p_frameStoreOffset];
    id v9 = __biome_log_for_category();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (!v8)
    {
      if (v10) {
        [(BMStoreEnumerator *)&self->_frameStoreOffset bookmark];
      }
      goto LABEL_33;
    }
    if (v10) {
      [(BMStoreEnumerator *)&self->_frameStoreOffset bookmark];
    }
    goto LABEL_29;
  }
  if ([(BMFrameStore *)*p_currentFrameStore datastoreVersion] != 10)
  {
    id v9 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__BMStoreEnumerator_bookmark__block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (bookmark_onceToken != -1) {
      dispatch_once(&bookmark_onceToken, block);
    }
    os_log_type_t v13 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v9, v13)) {
      goto LABEL_29;
    }
    unsigned int v14 = [(BMFrameStore *)*p_currentFrameStore datastoreVersion];
    v15 = [(BMFrameStore *)*p_currentFrameStore segmentPath];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v15;
    _os_log_impl(&dword_1AD076000, v9, v13, "BMStoreEnumerator.bookmark: unknown datastoreVersion (%d) in frameStore: %@", buf, 0x12u);
    goto LABEL_18;
  }
  if (*p_frameStoreOffset)
  {
    uint64_t v12 = -[BMFrameStore frameNumberFromOffsetToOffsetTableEntryV2:](*p_currentFrameStore, "frameNumberFromOffsetToOffsetTableEntryV2:");
    if ((v12 & 0x80000000) != 0)
    {
      id v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(BMStoreEnumerator *)&self->_frameStoreOffset bookmark];
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (![(BMStoreEnumerator *)self isDataAccessible])
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v23 = (void *)MEMORY[0x1E4F4FB78];
      v24 = [(BMFrameStore *)*p_currentFrameStore segmentPath];
      v25 = [v23 privacyPathname:v24];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_1AD076000, v9, OS_LOG_TYPE_INFO, "Segment is no longer accessible (bookmark): %{public}@", buf, 0xCu);
    }
    goto LABEL_29;
  }
  int v16 = [(BMFrameStore *)*p_currentFrameStore atomicReadTotalFramesV2];
  if ((int)v12 <= v16) {
    goto LABEL_30;
  }
  int v17 = v16;
  BOOL v18 = [(BMFrameStore *)*p_currentFrameStore isCheckSumValidAtOffsetV2:*p_frameStoreOffset frameNumber:v12];
  id v9 = __biome_log_for_category();
  BOOL v19 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
  if (!v18)
  {
    if (v19)
    {
      unint64_t v30 = *p_frameStoreOffset;
      v31 = (void *)MEMORY[0x1E4F4FB78];
      double v32 = [(BMFrameStore *)*p_currentFrameStore segmentPath];
      uint64_t v33 = [v31 privacyPathname:v32];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v17;
      __int16 v36 = 2114;
      v37 = v33;
      _os_log_fault_impl(&dword_1AD076000, v9, OS_LOG_TYPE_FAULT, "frameStore checksum mismatched, offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);
    }
    goto LABEL_33;
  }
  if (v19)
  {
    unint64_t v20 = *p_frameStoreOffset;
    v21 = (void *)MEMORY[0x1E4F4FB78];
    v22 = [(BMFrameStore *)*p_currentFrameStore segmentPath];
    v15 = [v21 privacyPathname:v22];
    *(_DWORD *)buf = 134218754;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v17;
    __int16 v36 = 2114;
    v37 = v15;
    _os_log_fault_impl(&dword_1AD076000, v9, OS_LOG_TYPE_FAULT, "frameStore checksum matched, although offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);

LABEL_18:
  }
LABEL_29:

LABEL_30:
  unint64_t frameStoreOffset = *p_frameStoreOffset;
  if ((*p_frameStoreOffset & 7) == 0)
  {
LABEL_34:
    if (frameStoreOffset == 4294967294)
    {
      v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[BMStoreEnumerator bookmark](v26);
      }
    }
    v27 = [BMStoreBookmark alloc];
    id v9 = [(BMStreamDatastore *)self->_ds streamId];
    double v28 = [(BMFrameStore *)self->_currentFrameStore segmentName];
    v11 = [(BMStoreBookmark *)v27 initWithStream:v9 segment:v28 iterationStartTime:self->_frameStoreOffset offset:self->_iterationStartTime];

    goto LABEL_39;
  }
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    [(BMStoreEnumerator *)(uint64_t)&self->_frameStoreOffset bookmark];
  }
LABEL_33:
  v11 = 0;
LABEL_39:

LABEL_40:
  return v11;
}

- (BOOL)isDataAccessible
{
  return [(BMStreamDatastore *)self->_ds isDataAccessible];
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 bookmark:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v104[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 streamId];
  os_log_type_t v13 = [v11 streamId];
  char v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    v15 = [v10 streamId];
    int v16 = [v10 config];
    char v17 = [v16 storeLocationOption];

    if ((v17 & 4) != 0)
    {
      unint64_t v20 = @":subscriptions";
    }
    else
    {
      BOOL v18 = [v10 config];
      char v19 = [v18 storeLocationOption];

      if ((v19 & 2) != 0) {
        unint64_t v20 = @":tombstones";
      }
      else {
        unint64_t v20 = &stru_1F040F758;
      }
    }
    double v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = [v10 segmentDirectory];
      unint64_t v30 = [v11 segmentName];
      *(_DWORD *)buf = 138413314;
      uint64_t v96 = (uint64_t)v15;
      __int16 v97 = 2112;
      *(void *)v98 = v20;
      *(_WORD *)&v98[8] = 2112;
      *(void *)v99 = v29;
      *(_WORD *)&v99[8] = 2112;
      v100 = v30;
      __int16 v101 = 2048;
      uint64_t v102 = [v11 offset];
      _os_log_impl(&dword_1AD076000, v28, OS_LOG_TYPE_DEFAULT, "Enumerator for %@%@ starting from %@/%@+0x%llx", buf, 0x34u);
    }
    v31 = [v11 segmentName];
    id v88 = 0;
    double v32 = [v10 segmentWithFilename:v31 error:&v88];
    id v26 = v88;

    if (v26)
    {
      if (a6)
      {
        v27 = 0;
        *a6 = v26;
LABEL_49:

        goto LABEL_50;
      }
LABEL_48:
      v27 = 0;
      goto LABEL_49;
    }
    if (!v11 || (~[v11 offset] & 0xFFFFFFFE) == 0)
    {
LABEL_19:
      uint64_t v33 = [v11 offset];
      [v11 iterationStartTime];
      double v35 = v34;
      __int16 v36 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v36 timeIntervalSinceReferenceDate];
      uint64_t v38 = [(BMStoreEnumerator *)self initWithStreamDatastore:v10 currentFrameStore:v32 frameStoreOffset:v33 iterationStartTime:-1 endTime:-1 maxEvents:a5 lastN:v35 options:v37 dataType:0];

      self = v38;
      v27 = self;
      goto LABEL_49;
    }
    if ([v32 datastoreVersion] == 9)
    {
      unint64_t v39 = [v11 offset];
      if (v39 <= (unint64_t)[v32 bytesUsed] - 56) {
        goto LABEL_19;
      }
      char v40 = objc_msgSend(v32, "isCheckSumValidAtOffsetV1:", objc_msgSend(v11, "offset"));
      v41 = __biome_log_for_category();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_FAULT);
      if (v40)
      {
        if (v42) {
          -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:](v11, v32, v41);
        }
        goto LABEL_25;
      }
      if (v42) {
        -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:](v11, v32, v41);
      }

      id v83 = [NSString alloc];
      uint64_t v80 = [v11 offset];
      uint64_t v54 = [v32 bytesUsed];
      v55 = (void *)MEMORY[0x1E4F4FB78];
      v56 = [v32 segmentPath];
      id v57 = [v55 privacyPathname:v56];
      v49 = (void *)[v83 initWithFormat:@"frameStore checksum mismatched and is beyond frame offset:%zu bytesUsed:%d for store: %@", v80, v54, v57];

      if (!a6)
      {
LABEL_38:

        goto LABEL_48;
      }
      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v93 = *MEMORY[0x1E4F28568];
      v94 = v49;
      id v51 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v52 = &v94;
      v53 = &v93;
LABEL_37:
      v58 = [v51 dictionaryWithObjects:v52 forKeys:v53 count:1];
      *a6 = [v50 errorWithDomain:@"com.apple.biome.BiomeStorage" code:-1 userInfo:v58];

      goto LABEL_38;
    }
    if ([v32 datastoreVersion] != 10) {
      goto LABEL_19;
    }
    if ([v11 offset])
    {
      uint64_t v43 = objc_msgSend(v32, "frameNumberFromOffsetToOffsetTableEntryV2:", objc_msgSend(v11, "offset"));
      if ((v43 & 0x80000000) != 0)
      {
        v44 = __biome_log_for_category();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
          -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:](v11, v32, v44);
        }

        id v82 = [NSString alloc];
        uint64_t v79 = [v11 offset];
        uint64_t v45 = [v32 frameStoreSize];
        uint64_t v46 = (void *)MEMORY[0x1E4F4FB78];
        v47 = [v32 segmentPath];
        uint64_t v48 = [v46 privacyPathname:v47];
        v49 = (void *)[v82 initWithFormat:@"initWithStreamDatastore: bookmark offset (%zu) is beyond frameStore size:%zu for store: %@", v79, v45, v48];

        if (!a6) {
          goto LABEL_38;
        }
        v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v91 = *MEMORY[0x1E4F28568];
        v92 = v49;
        id v51 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v52 = &v92;
        v53 = &v91;
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v43 = 0;
    }
    if (([v10 isDataAccessible] & 1) == 0)
    {
      id v63 = __biome_log_for_category();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        uint64_t v64 = (void *)MEMORY[0x1E4F4FB78];
        v65 = [v10 streamPath];
        v66 = [v64 privacyPathname:v65];
        *(_DWORD *)buf = 138543362;
        uint64_t v96 = (uint64_t)v66;
        _os_log_impl(&dword_1AD076000, v63, OS_LOG_TYPE_INFO, "Segment is no longer accessible: %{public}@", buf, 0xCu);
      }
      goto LABEL_48;
    }
    uint64_t v59 = [v32 atomicReadTotalFramesV2];
    if ((int)v43 <= (int)v59) {
      goto LABEL_19;
    }
    uint64_t v81 = v59;
    char v84 = objc_msgSend(v32, "isCheckSumValidAtOffsetV2:frameNumber:", objc_msgSend(v11, "offset"), v43);
    v41 = __biome_log_for_category();
    BOOL v60 = os_log_type_enabled(v41, OS_LOG_TYPE_FAULT);
    if ((v84 & 1) == 0)
    {
      if (v60)
      {
        uint64_t v78 = [v11 offset];
        v74 = (void *)MEMORY[0x1E4F4FB78];
        v87 = [v32 segmentPath];
        v75 = [v74 privacyPathname:v87];
        *(_DWORD *)buf = 134218754;
        uint64_t v96 = v78;
        __int16 v97 = 1024;
        *(_DWORD *)v98 = v43;
        *(_WORD *)&v98[4] = 1024;
        *(_DWORD *)&v98[6] = v81;
        *(_WORD *)v99 = 2114;
        *(void *)&v99[2] = v75;
        _os_log_fault_impl(&dword_1AD076000, v41, OS_LOG_TYPE_FAULT, "frameStore checksum mismatched, offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);
      }
      id v86 = [NSString alloc];
      uint64_t v77 = [v11 offset];
      v68 = (void *)MEMORY[0x1E4F4FB78];
      v69 = [v32 segmentPath];
      v70 = [v68 privacyPathname:v69];
      v71 = (void *)[v86 initWithFormat:@"frameStore checksum mismatched, offset %zu, frame:%d is beyond totalFrames:%d for store: %@", v77, v43, v81, v70];

      if (a6)
      {
        v72 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v89 = *MEMORY[0x1E4F28568];
        v90 = v71;
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        *a6 = [v72 errorWithDomain:@"com.apple.biome.BiomeStorage" code:-1 userInfo:v73];
      }
      goto LABEL_48;
    }
    if (v60)
    {
      uint64_t v76 = [v11 offset];
      v61 = (void *)MEMORY[0x1E4F4FB78];
      v85 = [v32 segmentPath];
      __int16 v62 = [v61 privacyPathname:v85];
      *(_DWORD *)buf = 134218754;
      uint64_t v96 = v76;
      __int16 v97 = 1024;
      *(_DWORD *)v98 = v43;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = v81;
      *(_WORD *)v99 = 2114;
      *(void *)&v99[2] = v62;
      _os_log_fault_impl(&dword_1AD076000, v41, OS_LOG_TYPE_FAULT, "frameStore checksum matched, although offset %zu, frame:%d is beyond totalFrames:%d for store: %{public}@", buf, 0x22u);
    }
LABEL_25:

    goto LABEL_19;
  }
  v21 = __biome_log_for_category();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    -[BMStoreEnumerator initWithStreamDatastore:bookmark:options:error:].cold.4();
  }

  id v22 = [NSString alloc];
  id v23 = [v10 streamId];
  v24 = [v11 streamId];
  v15 = (void *)[v22 initWithFormat:@"Data store streamId is %@ while bookmark streamId is %@", v23, v24];

  if (a6)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v103 = *MEMORY[0x1E4F28568];
    v104[0] = v15;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:&v103 count:1];
    [v25 errorWithDomain:@"com.apple.biome.BiomeStorage" code:-1 userInfo:v26];
    v27 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

    goto LABEL_51;
  }
  v27 = 0;
LABEL_51:

  return v27;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 currentFrameStore:(id)a4 frameStoreOffset:(unint64_t)a5 iterationStartTime:(double)a6 endTime:(double)a7 maxEvents:(unint64_t)a8 lastN:(unint64_t)a9 options:(unint64_t)a10 dataType:(Class)a11
{
  id v20 = a3;
  id v21 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BMStoreEnumerator;
  id v22 = [(BMStoreEnumerator *)&v26 init];
  id v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_ds, a3);
    objc_storeStrong((id *)&v23->_currentFrameStore, a4);
    v23->_unint64_t frameStoreOffset = a5;
    v23->_iterationStartTime = a6;
    v23->_endTime = a7;
    v23->_unint64_t maxEvents = a8;
    v23->_eventCount = 0;
    v23->_lastEventCount = a9;
    v23->_unint64_t options = a10;
    v23->_dataType = a11;
    bookmarkEnumerator = v23->_bookmarkEnumerator;
    v23->_bookmarkEnumerator = 0;
  }
  return v23;
}

- (void)bookmark
{
  id v2 = (void *)MEMORY[0x1E4F4FB78];
  v3 = [*a2 segmentPath];
  id v10 = [v2 privacyPathname:v3];
  OUTLINED_FUNCTION_0_0(&dword_1AD076000, v4, v5, "bookmark: offset: %zu not 8-byte aligned %{public}@", v6, v7, v8, v9, 2u);
}

- (void)setEndTime:(double)a3 maxEvents:(unint64_t)a4 lastN:(unint64_t)a5 reverse:(BOOL)a6
{
  self->_endTime = a3;
  self->_unint64_t maxEvents = a4;
  uint64_t v6 = 8;
  if (!a6) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = self->_options & 0xFFFFFFFFFFFFFFF7 | v6;
  self->_lastEventCount = a5;
  self->_unint64_t options = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkEnumerator, 0);
  objc_storeStrong((id *)&self->_ds, 0);
  objc_storeStrong((id *)&self->_currentFrameStore, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 options:(unint64_t)a8 dataType:(Class)a9
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  char v17 = v16;
  BOOL v18 = a4 < a5;
  if ((a8 & 8) == 0) {
    BOOL v18 = a4 > a5;
  }
  if (!v18)
  {
    if ([v16 isDataAccessible])
    {
      if (a7 == -1) {
        unint64_t v22 = a8 & 8;
      }
      else {
        unint64_t v22 = (a8 ^ 8) & 8;
      }
      if (a7 == -1)
      {
        double v23 = a5;
      }
      else
      {
        a8 ^= 8uLL;
        double v23 = a4;
      }
      if (a7 == -1) {
        a5 = a4;
      }
      v24 = [v17 segmentContainingTimestamp:a5];
      self = [(BMStoreEnumerator *)self initWithStreamDatastore:v17 currentFrameStore:v24 frameStoreOffset:0xFFFFFFFFLL iterationStartTime:-1 endTime:a7 maxEvents:a8 lastN:CFAbsoluteTimeGetCurrent() options:v23 dataType:a9];

      if (!self) {
        goto LABEL_50;
      }
      unint64_t v40 = 0;
      BOOL v25 = [(BMStoreEnumerator *)self advanceBookmarkToStartTime:&v40 eventsFound:a7 lastN:a5];
      if ([v17 isDataAccessible])
      {
        if (a7 == -1)
        {
LABEL_49:
          self->_unint64_t maxEvents = a6;
LABEL_50:
          self = self;
          uint64_t v33 = self;
          goto LABEL_35;
        }
        if (v40) {
          char v26 = v25;
        }
        else {
          char v26 = 1;
        }
        if (v26) {
          goto LABEL_47;
        }
        p_currentFrameStore = &self->_currentFrameStore;
        if ([(BMFrameStore *)self->_currentFrameStore datastoreVersion] == 9)
        {
          unint64_t frameStoreOffset = self->_frameStoreOffset;
          if (v22)
          {
            if (frameStoreOffset != 4294967294) {
              goto LABEL_47;
            }
            goto LABEL_45;
          }
          if (frameStoreOffset + 56 != [(BMFrameStore *)*p_currentFrameStore bytesUsed])
          {
LABEL_47:
            self->_endTime = a5;
            self->_options ^= 8uLL;
            if (v40 < a6) {
              a6 = v40;
            }
            goto LABEL_49;
          }
        }
        else
        {
          if ([(BMFrameStore *)*p_currentFrameStore datastoreVersion] != 10)
          {
            p_super = __biome_log_for_category();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
              -[BMStoreEnumerator initWithStreamDatastore:startTime:endTime:maxEvents:lastN:options:dataType:]((id *)&self->_currentFrameStore);
            }
            goto LABEL_46;
          }
          double v35 = [(BMStoreEnumerator *)self currentFrameStore];
          uint64_t v36 = [v35 atomicReadTotalFramesV2];

          unint64_t v37 = self->_frameStoreOffset;
          if (v22)
          {
            if (v37 != 4294967294) {
              goto LABEL_47;
            }
          }
          else if (v37 != [(BMFrameStore *)*p_currentFrameStore offsetTableOffsetFromFrameNumberV2:v36])
          {
            goto LABEL_47;
          }
        }
LABEL_45:
        self->_unint64_t frameStoreOffset = 0xFFFFFFFFLL;
        unint64_t v39 = [v17 segmentContainingTimestamp:v23];
        p_super = &self->_currentFrameStore->super;
        self->_currentFrameStore = v39;
LABEL_46:

        goto LABEL_47;
      }
      char v19 = __biome_log_for_category();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      double v32 = (void *)MEMORY[0x1E4F4FB78];
      unint64_t v30 = [v17 streamPath];
      id v20 = [v32 privacyPathname:v30];
      *(_DWORD *)buf = 138543362;
      BOOL v42 = v20;
      v31 = "Segment is no longer accessible: %{public}@ (after advanceBookmarkToStartTime)";
    }
    else
    {
      char v19 = __biome_log_for_category();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      double v29 = (void *)MEMORY[0x1E4F4FB78];
      unint64_t v30 = [v17 streamPath];
      id v20 = [v29 privacyPathname:v30];
      *(_DWORD *)buf = 138543362;
      BOOL v42 = v20;
      v31 = "Segment is no longer accessible: %{public}@";
    }
    _os_log_impl(&dword_1AD076000, v19, OS_LOG_TYPE_INFO, v31, buf, 0xCu);

LABEL_33:
    goto LABEL_34;
  }
  char v19 = __biome_log_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v17 streamId];
    id v21 = "YES";
    *(_DWORD *)buf = 138544130;
    BOOL v42 = v20;
    __int16 v43 = 2048;
    if ((a8 & 8) == 0) {
      id v21 = "NO";
    }
    double v44 = a4;
    __int16 v45 = 2048;
    double v46 = a5;
    __int16 v47 = 2080;
    uint64_t v48 = v21;
    _os_log_impl(&dword_1AD076000, v19, OS_LOG_TYPE_INFO, "initWithStreamDatastore: stream: %{public}@ with startTime: %f, endTime: %f, and reverse: %s will result in no events, so returning nil", buf, 0x2Au);
    goto LABEL_33;
  }
LABEL_34:

  uint64_t v33 = 0;
LABEL_35:

  return v33;
}

- (BOOL)advanceBookmarkToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  currentFrameStore = self->_currentFrameStore;
  if (!currentFrameStore) {
    return 0;
  }
  if ([(BMFrameStore *)currentFrameStore datastoreVersion] == 9)
  {
    return [(BMStoreEnumerator *)self advanceBookmarkV1ToStartTime:a4 eventsFound:a5 lastN:a3];
  }
  if ([(BMFrameStore *)self->_currentFrameStore datastoreVersion] != 10)
  {
    id v11 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&long long v17 = buf;
    *((void *)&v17 + 1) = 0x2020000000;
    char v18 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__BMStoreEnumerator_advanceBookmarkToStartTime_eventsFound_lastN___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (advanceBookmarkToStartTime_eventsFound_lastN__onceToken != -1) {
      dispatch_once(&advanceBookmarkToStartTime_eventsFound_lastN__onceToken, block);
    }
    os_log_type_t v12 = *(unsigned char *)(v17 + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v11, v12))
    {
      unsigned int v13 = [(BMFrameStore *)self->_currentFrameStore datastoreVersion];
      char v14 = [(BMFrameStore *)self->_currentFrameStore segmentPath];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v13;
      LOWORD(v17) = 2112;
      *(void *)((char *)&v17 + 2) = v14;
      _os_log_impl(&dword_1AD076000, v11, v12, "advanceBookmarkToStartTime: unknown datastoreVersion (%d) in frameStore: %@", buf, 0x12u);
    }
    return 0;
  }
  return [(BMStoreEnumerator *)self advanceBookmarkV2ToStartTime:a4 eventsFound:a5 lastN:a3];
}

- (BOOL)advanceBookmarkV2ToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a5 == -1)
  {
    unint64_t options = self->_options;
    if ([(BMStoreEnumerator *)self isDataAccessible])
    {
      uint64_t v9 = [(BMFrameStore *)self->_currentFrameStore firstFrameNumberForTimestampV2:(options >> 3) & 1 reverse:a3];
      if (v9 == -1)
      {
        if ((options & 8) != 0) {
          unint64_t v14 = 4294967294;
        }
        else {
          unint64_t v14 = [(BMFrameStore *)self->_currentFrameStore offsetTableOffsetFromFrameNumberV2:[(BMFrameStore *)self->_currentFrameStore atomicReadTotalFramesV2]];
        }
        BOOL result = 0;
        self->_unint64_t frameStoreOffset = v14;
      }
      else
      {
        self->_unint64_t frameStoreOffset = [(BMFrameStore *)self->_currentFrameStore offsetTableOffsetFromFrameNumberV2:v9];
        return 1;
      }
    }
    else
    {
      self->_unint64_t frameStoreOffset = 4294967294;
      id v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = (void *)MEMORY[0x1E4F4FB78];
        os_log_type_t v12 = [(BMFrameStore *)self->_currentFrameStore segmentPath];
        unsigned int v13 = [v11 privacyPathname:v12];
        int v15 = 138543362;
        id v16 = v13;
        _os_log_impl(&dword_1AD076000, v10, OS_LOG_TYPE_INFO, "Segment is no longer accessible: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      return 0;
    }
  }
  else
  {
    return -[BMStoreEnumerator advanceBookmarkV1ToStartTime:eventsFound:lastN:](self, "advanceBookmarkV1ToStartTime:eventsFound:lastN:", a4);
  }
  return result;
}

- (void)setFrameStoreOffset:(unint64_t)a3
{
  self->_unint64_t frameStoreOffset = a3;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 bookmarkEnumerator:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 streamId];
  os_log_type_t v12 = [v9 config];
  uint64_t v13 = [v12 storeLocationOption] & 6;

  if (v13)
  {
    unint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"BMStoreEnumerator.m" lineNumber:69 description:@"enumerating bookmarks for a subscription or tombstone is not supported"];
  }
  unint64_t v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v9 streamPath];
    *(_DWORD *)buf = 138412802;
    BOOL v25 = v11;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_1AD076000, v14, OS_LOG_TYPE_DEFAULT, "Enumerator for %@ from %@ using bookmarkEnumerator %@", buf, 0x20u);
  }
  v23.receiver = self;
  v23.super_class = (Class)BMStoreEnumerator;
  id v16 = [(BMStoreEnumerator *)&v23 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ds, a3);
    objc_storeStrong((id *)&v17->_bookmarkEnumerator, a4);
    currentFrameStore = v17->_currentFrameStore;
    v17->_currentFrameStore = 0;

    v17->_unint64_t frameStoreOffset = 0;
    v17->_iterationStartTime = CFAbsoluteTimeGetCurrent();
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v19 timeIntervalSinceReferenceDate];
    v17->_endTime = v20;

    *(_OWORD *)&v17->_unint64_t maxEvents = xmmword_1AD0A1930;
    *(_OWORD *)&v17->_lastEventCount = xmmword_1AD0A1930;
    v17->_dataType = 0;
  }

  return v17;
}

- (BMStoreEnumerator)initWithStreamDatastore:(id)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(unint64_t)a6 lastN:(unint64_t)a7 options:(unint64_t)a8
{
  return [(BMStoreEnumerator *)self initWithStreamDatastore:a3 startTime:a6 endTime:a7 maxEvents:a8 lastN:0 options:a4 dataType:a5];
}

- (void)nextEventWithContext:(id)a3
{
  uint64_t v6 = (void (**)(id, void *, BMFrameStore *))a3;
  uint64_t v4 = (void *)MEMORY[0x1AD11E210]();
  uint64_t v5 = [(BMStoreEnumerator *)self nextEvent];
  v6[2](v6, v5, self->_currentFrameStore);
}

- (id)peekEvent
{
  id v2 = [(BMStoreEnumerator *)self copyNextEventAndMoveBookmark:0];
  return v2;
}

uint64_t __66__BMStoreEnumerator_advanceBookmarkToStartTime_eventsFound_lastN___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)advanceBookmarkV1ToStartTime:(double)a3 eventsFound:(unint64_t *)a4 lastN:(unint64_t)a5
{
  int v27 = 0;
  v24 = a4;
  char v25 = 0;
  id v7 = 0;
  unint64_t options = self->_options;
  location = (id *)&self->_currentFrameStore;
  do
  {
    uint64_t v8 = (void *)MEMORY[0x1AD11E210]();
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    unint64_t v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    id v42 = 0;
    uint64_t v31 = 0;
    double v32 = &v31;
    uint64_t v33 = 0x3032000000;
    double v34 = __Block_byref_object_copy_;
    double v35 = __Block_byref_object_dispose_;
    id v36 = 0;
    currentFrameStore = self->_currentFrameStore;
    ds = self->_ds;
    unint64_t frameStoreOffset = self->_frameStoreOffset;
    unint64_t v12 = self->_options;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__BMStoreEnumerator_advanceBookmarkV1ToStartTime_eventsFound_lastN___block_invoke;
    v30[3] = &unk_1E5E78778;
    v30[4] = &v37;
    v30[5] = &v31;
    [(BMStreamDatastore *)ds fetchEventFromFrameStore:currentFrameStore atOffset:frameStoreOffset withOptions:v12 callback:v30];
    uint64_t v13 = (void *)v38[5];
    if (!v13) {
      goto LABEL_17;
    }
    if ((options & 8) == 0)
    {
      [v13 creationTimestamp];
      if (v14 > self->_endTime)
      {
        [v7 creationTimestamp];
        if (v15 >= a3) {
          goto LABEL_9;
        }
        goto LABEL_17;
      }
      objc_storeStrong(location, (id)v32[5]);
      [(id)v38[5] creationTimestamp];
      if (v18 < a3) {
        goto LABEL_15;
      }
LABEL_13:
      if (a5 != -1 && ++v27 < a5)
      {
LABEL_15:
        self->_unint64_t frameStoreOffset = objc_msgSend((id)v38[5], "nextOffset", v24);
        id v20 = (id)v38[5];
        id v21 = v7;
        id v7 = v20;

        int v22 = 0;
        goto LABEL_18;
      }
      self->_unint64_t frameStoreOffset = objc_msgSend((id)v38[5], "offset", v24);
      char v25 = 1;
      goto LABEL_17;
    }
    [v13 creationTimestamp];
    if (v16 >= self->_endTime)
    {
      objc_storeStrong(location, (id)v32[5]);
      [(id)v38[5] creationTimestamp];
      if (v19 > a3) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    [v7 creationTimestamp];
    if (v17 <= a3) {
LABEL_9:
    }
      self->_unint64_t frameStoreOffset = [v7 offset];
LABEL_17:
    int v22 = 1;
LABEL_18:
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }
  while (!v22);
  if (v24) {
    unint64_t *v24 = v27;
  }

  return v25 & 1;
}

void __68__BMStoreEnumerator_advanceBookmarkV1ToStartTime_eventsFound_lastN___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

uint64_t __29__BMStoreEnumerator_bookmark__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BMFrameStore)currentFrameStore
{
  return self->_currentFrameStore;
}

- (BMStreamDatastore)ds
{
  return self->_ds;
}

- (void)initWithStreamDatastore:bookmark:options:error:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  id v2 = [v1 streamId];
  v3 = [v0 streamId];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1AD076000, v4, v5, "Data store streamId is %{public}@ while bookmark streamId is %{public}@", v6, v7, v8, v9, v10);
}

- (void)initWithStreamDatastore:(id *)a1 startTime:endTime:maxEvents:lastN:options:dataType:.cold.1(id *a1)
{
  id v2 = (void *)MEMORY[0x1E4F4FB78];
  v3 = [*a1 segmentPath];
  uint64_t v4 = [v2 privacyPathname:v3];
  [*a1 datastoreVersion];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1AD076000, v5, v6, "initWithStreamDatastore: %{public}@  has unexpected dataVersion:%lu", v7, v8, v9, v10, v11);
}

@end