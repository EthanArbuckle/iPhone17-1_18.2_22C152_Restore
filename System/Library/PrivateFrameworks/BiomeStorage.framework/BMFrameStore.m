@interface BMFrameStore
+ (BOOL)expectedTimestamp:(double)a3;
+ (BOOL)writeEmptyFrameStoreWithFileHandle:(id)a3 fileSize:(unint64_t)a4 datastoreVersion:(unint64_t)a5;
+ (BOOL)writeEmptySegmentHeaderWithFileHandleV1:(id)a3 segmentHeaderSize:(unint64_t *)a4;
+ (BOOL)writeEmptySegmentHeaderWithFileHandleV2:(id)a3 segmentHeaderSize:(unint64_t *)a4;
+ (unint64_t)maxEventsPerFrameStoreVersion:(unint64_t)a3 averageEventSize:(unint64_t)a4 segmentSize:(unint64_t)a5;
+ (unsigned)getSegmentVersion:(id)a3 config:(id)a4 stream:(id)a5;
- ($6904A10426020E4F4092C7509944103C)offsetTablePtrFromFrameNumberV2:(unsigned int)a3;
- (BMFileHandle)backingFile;
- (BMFrameStore)initWithFileHandle:(id)a3 permission:(unint64_t)a4 datastoreVersion:(unint64_t)a5;
- (BMFrameStore)initWithFileHandleV1:(id)a3 permission:(unint64_t)a4;
- (BMFrameStore)initWithFileHandleV2:(id)a3 permission:(unint64_t)a4;
- (BMMemoryMapping)frames;
- (BMMemoryMapping)header;
- (BOOL)filterByAgeOnRead;
- (BOOL)getSegmentHeader:(id *)a3 fromFileV1:(id)a4 fileSize:(unint64_t *)a5;
- (BOOL)getSegmentHeader:(id *)a3 fromFileV2:(id)a4 fileSize:(unint64_t *)a5;
- (BOOL)isCheckSumValidAtOffsetV1:(unint64_t)a3;
- (BOOL)isCheckSumValidAtOffsetV2:(unint64_t)a3 frameNumber:(int)a4;
- (BOOL)isRemoteSegment;
- (BOOL)isTombstoneSegment;
- (BOOL)isValidFrameV1:(void *)a3 expectedState:(unsigned int)a4 copyOfData:(id *)a5 frameStatus:(id)a6 validations:(BOOL)a7 enumerationOptions:(unint64_t)a8 errorCode:(int *)a9;
- (BOOL)isValidFrameV2:(void *)a3 currentFrame:(unsigned int)a4 expectedState:(unsigned int)a5 copyOfData:(id *)a6 frameState:(unsigned int)a7 frameSize:(unsigned int)a8 validations:(BOOL)a9 enumerationOptions:(unint64_t)a10 errorCode:(int *)a11;
- (BOOL)offsetIsStartOfFrameStore:(unint64_t)a3;
- (BOOL)pruneOnAccess;
- (NSString)cachedPrintablePathV2;
- (NSString)segmentName;
- (NSString)segmentPath;
- (double)creationTimeOfFrameV2:(unsigned int)a3;
- (double)lastAbsoluteTimestamp;
- (double)maxAge;
- (id)_printablePath;
- (id)_printablePathV2;
- (id)frameWithOffset:(unint64_t)a3 expectedState:(unsigned int)a4;
- (id)frameWithOffsetV1:(unint64_t)a3 expectedState:(unsigned int)a4;
- (id)frameWithOffsetV2:(unint64_t)a3 expectedState:(unsigned int)a4;
- (int)eraseFrameAtOffsetTableV2:(id *)a3;
- (int)firstFrameNumberForTimestampV2:(double)a3 reverse:(BOOL)a4;
- (int)frameCount;
- (int)frameCountFromStartTime:(double)a3 endTime:(double)a4;
- (int)frameCountFromStartTimeV2:(double)a3 endTime:(double)a4;
- (int)frameCountV2;
- (int)frameNumberFromFrameOffsetV2:(unsigned int)a3;
- (int)frameNumberFromOffsetToOffsetTableEntryV2:(unsigned int)a3;
- (int64_t)getReverseOffsetIndex:(unint64_t)a3;
- (uint64_t)sizeToNextWord:(uint64_t)result;
- (unint64_t)frameStoreSize;
- (unint64_t)permission;
- (unsigned)appendFrameHeaderV1:(id *)a3 offset:(unint64_t *)a4;
- (unsigned)appendOffsetTableEntry:(id *)a3 outOffsetForFrame:(unsigned int *)a4 length:(unsigned int)a5 frameCount:(unsigned int *)a6;
- (unsigned)atomicReadTotalFramesV2;
- (unsigned)bytesUsed;
- (unsigned)bytesUsedV1;
- (unsigned)bytesUsedV2;
- (unsigned)countFrameStateInOffsetTable:(unsigned int)a3 startingFrame:(int)a4 endingFrame:(int)a5;
- (unsigned)datastoreVersion;
- (unsigned)frameOffsetFromOffsetTableV2:(id *)a3;
- (unsigned)offsetOfFrameV2:(unsigned int)a3;
- (unsigned)offsetTableOffsetFromFrameNumberV2:(unsigned int)a3;
- (unsigned)sizeOfFrameV2:(unsigned int)a3;
- (unsigned)stateOfFrameV2:(unsigned int)a3;
- (unsigned)writeFrameForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6;
- (unsigned)writeFrameForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7;
- (unsigned)writeFrameV1ForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7;
- (unsigned)writeFrameV2ForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7;
- (void)addToDeletedFrameCount:(unsigned int)a3;
- (void)addToValueAtOffset:(unsigned int)a3 increment:(unsigned int)a4;
- (void)dealloc;
- (void)enumerateFromOffset:(unint64_t)a3 withCallback:(id)a4;
- (void)enumerateWithOptions:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateWithOptionsV1:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateWithOptionsV2:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5;
- (void)markFrameAsRemoved:(id)a3;
- (void)markFrameAsRemovedV1:(id)a3;
- (void)markFrameAsRemovedV2:(id)a3;
- (void)setBackingFile:(id)a3;
- (void)setCachedPrintablePathV2:(id)a3;
- (void)setDatastoreVersion:(unsigned int)a3;
- (void)setFilterByAgeOnRead:(BOOL)a3;
- (void)setFrameStoreSize:(unint64_t)a3;
- (void)setFrames:(id)a3;
- (void)setHeader:(id)a3;
- (void)setLastAbsoluteTimestamp:(double)a3;
- (void)setMaxAge:(double)a3;
- (void)setPermission:(unint64_t)a3;
- (void)setPruneOnAccess:(BOOL)a3;
- (void)start;
- (void)sync;
- (void)updateFrameStoreIndex;
- (void)updateHeader;
- (void)updateHighestDeletedFrame:(id)a3;
- (void)updateHighestDeletedFrameV2:(id)a3 addToDeletedFrameCount:(unsigned int)a4;
- (void)updateToMaxOfHighestDeletedFrameAnd:(unsigned int)a3;
- (void)updateToMaxOfTotalFramesAnd:(unsigned int)a3;
- (void)updateToMaxOfValueAtOffset:(unsigned int)a3 newValue:(int)a4;
@end

@implementation BMFrameStore

- (unsigned)writeFrameV2ForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  v12 = self;
  objc_sync_enter(v12);
  if (a4 >> 31)
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:](a4, v13);
    }
LABEL_21:

LABEL_27:
    LOBYTE(v15) = 1;
    goto LABEL_28;
  }
  if (!a4)
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]();
    }
    goto LABEL_21;
  }
  if ((unint64_t)((a4 + 3) & 0xFFFFFFFC) + 56 > [(BMFrameStore *)v12 frameStoreSize])
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]();
    }

    LOBYTE(v15) = 3;
    goto LABEL_28;
  }
  v16 = [(BMFrameStore *)v12 header];
  uint64_t v17 = [v16 start];

  if (!v17)
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.4();
    }
    goto LABEL_21;
  }
  if (*(_DWORD *)(v17 + 16) != 10)
  {
    v21 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v82) = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__BMFrameStore_V2__writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset__onceToken != -1) {
      dispatch_once(&writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset__onceToken, block);
    }
    os_log_type_t v22 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v21, v22))
    {
      int v23 = *(_DWORD *)(v17 + 16);
      v24 = (void *)MEMORY[0x1E4F4FB78];
      v25 = [(BMFrameStore *)v12 segmentPath];
      v26 = [v24 privacyPathname:v25];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = 10;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v23;
      *(_WORD *)&buf[14] = 2114;
      *(void *)&buf[16] = v26;
      _os_log_impl(&dword_1AD076000, v21, v22, "Segment is the wrong version, expected: %d, found %d in segment: %{public}@", buf, 0x18u);
    }
    goto LABEL_27;
  }
  unsigned int v18 = [(BMFrameStore *)v12 atomicReadTotalFramesV2];
  unsigned int v79 = v18;
  if (v18)
  {
    uint64_t v19 = [(BMFrameStore *)v12 offsetTablePtrFromFrameNumberV2:v18 - 1];
    if (!v19 || *(_DWORD *)(v19 + 4) == 4) {
      goto LABEL_46;
    }
    uint64_t v20 = v79;
  }
  else
  {
    uint64_t v20 = 0;
  }
  unsigned int v78 = [(BMFrameStore *)v12 offsetOfFrameV2:v20];
  v28 = [(BMFrameStore *)v12 frames];
  char v29 = [v28 isValidReadFromOffsetV2:v78 withLength:(a4 + 3) & 0xFFFFFFFC currentFrameCount:v79];

  if ((v29 & 1) == 0)
  {
    v35 = [(BMFrameStore *)v12 frames];
    int v36 = [v35 isValidReadFromOffsetV2:v78 withLength:0 currentFrameCount:v79];

    if (v36)
    {
      *(void *)buf = 0x400000000;
      *(double *)&buf[8] = a6;
      [(BMFrameStore *)v12 appendOffsetTableEntry:buf outOffsetForFrame:0 length:0 frameCount:&v79];
    }
    v37 = __biome_log_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[BMFrameStore appendFrameHeaderV1:offset:]();
    }

    goto LABEL_46;
  }
  [(BMFrameStore *)v12 lastAbsoluteTimestamp];
  if (v30 > a6)
  {
    if ([(BMFrameStore *)v12 isRemoteSegment]
      && ![(BMFrameStore *)v12 isTombstoneSegment])
    {
      id v38 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v38 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
      v39 = __biome_log_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        [(BMFrameStore *)v12 lastAbsoluteTimestamp];
        uint64_t v66 = v65;
        v72 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a6];
        id v74 = [v38 stringFromDate:v72];
        id v67 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [(BMFrameStore *)v12 lastAbsoluteTimestamp];
        v71 = objc_msgSend(v67, "initWithTimeIntervalSinceReferenceDate:");
        id v73 = [v38 stringFromDate:v71];
        v68 = (void *)MEMORY[0x1E4F4FB78];
        v69 = [(BMFrameStore *)v12 segmentPath];
        v70 = [v68 privacyPathname:v69];
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = "-[BMFrameStore(V2) writeFrameV2ForBytes:length:dataVersion:timestamp:outOffset:]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = a6;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v82 = v66;
        __int16 v83 = 2112;
        id v84 = v74;
        __int16 v85 = 2112;
        id v86 = v73;
        __int16 v87 = 2114;
        v88 = v70;
        _os_log_error_impl(&dword_1AD076000, v39, OS_LOG_TYPE_ERROR, "[%s] WARNING (remote data) frame should come in chronological order. Input %f < last %f, (%@ < %@) segment:%{public}@", buf, 0x3Eu);
      }
    }
    else
    {
      [(BMFrameStore *)v12 lastAbsoluteTimestamp];
      if (v31 - a6 >= 3.0) {
        goto LABEL_38;
      }
      double v32 = CFAbsoluteTimeGetCurrent() - a6;
      if (v32 < 0.0) {
        double v32 = -v32;
      }
      if (v32 > 60.0)
      {
LABEL_38:
        id v33 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v33 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        v34 = __biome_log_for_category();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          [(BMFrameStore *)v12 lastAbsoluteTimestamp];
          uint64_t v56 = v55;
          v57 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a6];
          id v58 = [v33 stringFromDate:v57];
          id v59 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [(BMFrameStore *)v12 lastAbsoluteTimestamp];
          v60 = objc_msgSend(v59, "initWithTimeIntervalSinceReferenceDate:");
          id v61 = [v33 stringFromDate:v60];
          v62 = (void *)MEMORY[0x1E4F4FB78];
          v63 = [(BMFrameStore *)v12 segmentPath];
          v64 = [v62 privacyPathname:v63];
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = "-[BMFrameStore(V2) writeFrameV2ForBytes:length:dataVersion:timestamp:outOffset:]";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = a6;
          *(_WORD *)&buf[22] = 2048;
          uint64_t v82 = v56;
          __int16 v83 = 2112;
          id v84 = v58;
          __int16 v85 = 2112;
          id v86 = v61;
          __int16 v87 = 2114;
          v88 = v64;
          _os_log_error_impl(&dword_1AD076000, v34, OS_LOG_TYPE_ERROR, "[%s] Frame should come in chronological order. Input %f < last %f, (%@ < %@) segment:%{public}@", buf, 0x3Eu);
        }
        goto LABEL_27;
      }
      [(BMFrameStore *)v12 lastAbsoluteTimestamp];
      a6 = v40 + 0.0000001;
    }
  }
  v77[0] = a4 + v78 + 8;
  *(double *)&v77[1] = a6;
  unsigned int v15 = [(BMFrameStore *)v12 appendOffsetTableEntry:v77 outOffsetForFrame:&v78 length:a4 frameCount:&v79];
  if (v15)
  {
    v41 = __biome_log_for_category();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = NSStringFromBMFrameWriteStatus(v15);
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.5(v42, buf, v41);
    }

    goto LABEL_28;
  }
  unint64_t v76 = bm_generateChecksum((Bytef *)a3, a4) | (unint64_t)(v9 << 32);
  v43 = [(BMFrameStore *)v12 frames];
  [v43 writeBytes:&v76 toOffset:v78 length:8];

  v44 = [(BMFrameStore *)v12 frames];
  [v44 writeBytes:a3 toOffset:v78 + 8 length:a4];

  uint64_t v75 = v77[0];
  HIDWORD(v77[0]) = 1;
  uint64_t v45 = v77[0];
  uint64_t v46 = v79;
  v47 = [(BMFrameStore *)v12 frames];
  uint64_t v48 = 16 * v46;
  LOBYTE(v46) = 16 * v46 > (unint64_t)[v47 size];

  if (v46)
  {
LABEL_46:
    LOBYTE(v15) = 2;
    goto LABEL_28;
  }
  v49 = [(BMFrameStore *)v12 frames];
  uint64_t v50 = [v49 size];

  v51 = [(BMFrameStore *)v12 frames];
  unint64_t v52 = v50 - v48;
  int v53 = [v51 atomicWriteEightBytes:v45 toOffset:v50 - v48 expected:&v75];

  if (v53 != 1)
  {
    v54 = __biome_log_for_category();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&buf[4] = v75;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v82) = v53;
      _os_log_error_impl(&dword_1AD076000, v54, OS_LOG_TYPE_ERROR, "Unable to update status to written, someone else seems to have overwritten the value. We expect to see %llu, but instead are seeing %llu. The write status is %d", buf, 0x1Cu);
    }

    goto LABEL_27;
  }
  LOBYTE(v15) = 0;
  if (a7) {
    *a7 = v52;
  }
LABEL_28:
  objc_sync_exit(v12);

  return v15;
}

- (BMFrameStore)initWithFileHandleV2:(id)a3 permission:(unint64_t)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v88.receiver = self;
  v88.super_class = (Class)BMFrameStore;
  v8 = [(BMFrameStore *)&v88 init];
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_69:
    v10 = v9;
    goto LABEL_70;
  }
  [(BMFrameStore *)v8 setBackingFile:v7];
  [(BMFrameStore *)v9 setDatastoreVersion:10];
  uint64_t v87 = 0;
  uint64_t v95 = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v92 = 0u;
  if (![(BMFrameStore *)v9 getSegmentHeader:&v92 fromFileV2:v7 fileSize:&v87])
  {
    v4 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (initWithFileHandleV2_permission__onceToken != -1) {
      dispatch_once(&initWithFileHandleV2_permission__onceToken, block);
    }
    os_log_type_t v11 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v4, v11)) {
      goto LABEL_11;
    }
    v12 = (void *)MEMORY[0x1E4F4FB78];
    v13 = [v7 attributes];
    v14 = [v13 path];
    unsigned int v15 = [v12 privacyPathname:v14];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v15;
    _os_log_impl(&dword_1AD076000, v4, v11, "Cannot create frame store from segment file: %{public}@", buf, 0xCu);

    goto LABEL_9;
  }
  [(BMFrameStore *)v9 setDatastoreVersion:v93];
  if ([(BMFrameStore *)v9 datastoreVersion] == 9)
  {
    v10 = [(BMFrameStore *)v9 initWithFileHandleV1:v7 permission:a4];
LABEL_70:
    uint64_t v9 = v10;
    v16 = v10;
    goto LABEL_71;
  }
  if (v93 != 10)
  {
    v4 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_4;
    v85[3] = &unk_1E5E78708;
    v85[4] = buf;
    if (initWithFileHandleV2_permission__onceToken_3 != -1) {
      dispatch_once(&initWithFileHandleV2_permission__onceToken_3, v85);
    }
    os_log_type_t v17 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v4, v17))
    {
      unsigned int v18 = (void *)MEMORY[0x1E4F4FB78];
      uint64_t v19 = [(BMFrameStore *)v9 backingFile];
      uint64_t v20 = [v19 attributes];
      v21 = [v20 path];
      os_log_type_t v22 = [v18 privacyPathname:v21];
      int v23 = v93;
      unsigned int v24 = [(BMFrameStore *)v9 datastoreVersion];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v23;
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = v24;
      _os_log_impl(&dword_1AD076000, v4, v17, "Segment version of %{public}@ doesn't match expected versions. Header set to %{public}d, preferred %{public}d.", buf, 0x18u);
    }
    goto LABEL_11;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0 && !DWORD1(v92))
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) initWithFileHandleV2:permission:](v9);
    }
    goto LABEL_11;
  }
  unint64_t v25 = (v87 + 7) & 0xFFFFFFFFFFFFFFF8;
  [(BMFrameStore *)v9 setFrameStoreSize:v25];
  [(BMFrameStore *)v9 setPermission:a4];
  if (a4 == 2 || a4 == 1)
  {
    v26 = [[BMMemoryMapping alloc] initWithSize:32 protection:2 advice:1 offset:0];
    v27 = [BMMemoryMapping alloc];
    unint64_t v28 = v25 - 32;
    uint64_t v29 = 2;
  }
  else
  {
    if (a4) {
      goto LABEL_27;
    }
    v26 = [[BMMemoryMapping alloc] initWithSize:32 protection:1 advice:1 offset:0];
    v27 = [BMMemoryMapping alloc];
    unint64_t v28 = v25 - 32;
    uint64_t v29 = 1;
  }
  double v30 = [(BMMemoryMapping *)v27 initWithSize:v28 protection:v29 advice:2 offset:32];
  *(void *)buf = v26;
  *(void *)&buf[8] = v30;
  v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

LABEL_27:
  double v31 = [v4 lastObject];
  [(BMFrameStore *)v9 setFrames:v31];

  if ((unint64_t)[v4 count] >= 2)
  {
    double v32 = [v4 firstObject];
    [(BMFrameStore *)v9 setHeader:v32];
  }
  id v33 = [(BMFrameStore *)v9 header];

  if (a4 && !v33)
  {
    v34 = __biome_log_for_category();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore initWithFileHandleV1:permission:].cold.5();
    }
  }
  uint64_t v35 = [(BMFrameStore *)v9 header];
  if (v35)
  {
    int v36 = (void *)v35;
    v37 = [(BMFrameStore *)v9 header];
    id v38 = [(BMFrameStore *)v9 backingFile];
    char v39 = [v37 mapWithFileHandle:v38 fileSize:v25];

    if ((v39 & 1) == 0)
    {
      double v40 = __biome_log_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore(V2) initWithFileHandleV2:permission:].cold.4(v9);
      }
    }
  }
  v41 = [(BMFrameStore *)v9 frames];
  v42 = [(BMFrameStore *)v9 backingFile];
  char v43 = [v41 mapWithFileHandle:v42 fileSize:v25];

  if ((v43 & 1) == 0)
  {
    unsigned int v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) initWithFileHandleV2:permission:](v9);
    }
    goto LABEL_10;
  }
  int v44 = DWORD1(v92);
  if (a4 != 1 || !DWORD1(v92)) {
    goto LABEL_62;
  }
  if (v25 < 16 * DWORD1(v92))
  {
    unsigned int v15 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_6;
    v84[3] = &unk_1E5E78708;
    v84[4] = buf;
    if (initWithFileHandleV2_permission__onceToken_5 != -1) {
      dispatch_once(&initWithFileHandleV2_permission__onceToken_5, v84);
    }
    os_log_type_t v45 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v45))
    {
      uint64_t v46 = (void *)MEMORY[0x1E4F4FB78];
      v47 = [(BMFrameStore *)v9 backingFile];
      uint64_t v48 = [v47 attributes];
      v49 = [v48 path];
      uint64_t v50 = [v46 privacyPathname:v49];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v87;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = DWORD1(v92);
      _os_log_impl(&dword_1AD076000, v15, v45, "Attempted to open %{public}@ for writing but the file size is: %zu, which lacks space for an offsetTable with %d frames", buf, 0x1Cu);
    }
    goto LABEL_10;
  }
  uint64_t v51 = 16 * DWORD1(v92);
  unint64_t v52 = [(BMFrameStore *)v9 frames];
  int v53 = (_DWORD *)([v52 end] - v51);

  if (v53[1] == 4)
  {
    unsigned int v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v54 = (void *)MEMORY[0x1E4F4FB78];
      uint64_t v55 = [(BMFrameStore *)v9 backingFile];
      uint64_t v56 = [v55 attributes];
      v57 = [v56 path];
      id v58 = [v54 privacyPathname:v57];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v87;
      _os_log_impl(&dword_1AD076000, v15, OS_LOG_TYPE_INFO, "Attempted to open %{public}@ for writing but the file is already full, and has an EOF, fileSize:%zu", buf, 0x16u);
    }
    goto LABEL_10;
  }
  int v59 = *v53 + 3;
  v60 = [(BMFrameStore *)v9 frames];
  uint64_t v61 = [v60 size];

  signed int v62 = v59 & 0xFFFFFFFC;
  if (v59 < 0 != v63 || v61 - v51 < (unint64_t)v62)
  {
    unsigned int v15 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_8;
    v83[3] = &unk_1E5E78708;
    v83[4] = buf;
    if (initWithFileHandleV2_permission__onceToken_7 != -1) {
      dispatch_once(&initWithFileHandleV2_permission__onceToken_7, v83);
    }
    os_log_type_t v70 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v15, v70))
    {
      v71 = (void *)MEMORY[0x1E4F4FB78];
      uint64_t v82 = [(BMFrameStore *)v9 backingFile];
      v81 = [v82 attributes];
      v80 = [v81 path];
      v72 = [v71 privacyPathname:v80];
      id v73 = [(BMFrameStore *)v9 frames];
      uint64_t v74 = [v73 start];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v72;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v62;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = (char *)v53 - v74;
      __int16 v90 = 2048;
      uint64_t v91 = v87;
      _os_log_impl(&dword_1AD076000, v15, v70, "Segment %{public}@ indicates an endOfFrames value: %d in the last offsetTableEntry (offset): %ld beyond the data space size: %zu", buf, 0x26u);
    }
    goto LABEL_10;
  }
  v64 = [(BMFrameStore *)v9 frames];
  unsigned int v65 = [v64 size] - v51 - v62;

  if (v65 > 0x17)
  {
    int v44 = DWORD1(v92);
LABEL_62:
    if (v44)
    {
      int v75 = 16 * v44;
      unint64_t v76 = [(BMFrameStore *)v9 frames];
      uint64_t v77 = [v76 end] - v75;

      [(BMFrameStore *)v9 setLastAbsoluteTimestamp:*(double *)(v77 + 8)];
    }
    [(BMFrameStore *)v9 lastAbsoluteTimestamp];
    if (!+[BMFrameStore expectedTimestamp:](BMFrameStore, "expectedTimestamp:"))
    {
      unsigned int v78 = __biome_log_for_category();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore(V2) initWithFileHandleV2:permission:](v9);
      }

      [(BMFrameStore *)v9 setLastAbsoluteTimestamp:CFAbsoluteTimeGetCurrent()];
    }

    goto LABEL_69;
  }
  unsigned int v15 = __biome_log_for_category();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    goto LABEL_10;
  }
  uint64_t v66 = (void *)MEMORY[0x1E4F4FB78];
  id v67 = [(BMFrameStore *)v9 backingFile];
  v68 = [v67 attributes];
  v69 = [v68 path];
  v13 = [v66 privacyPathname:v69];
  *(_DWORD *)buf = 138543874;
  *(void *)&buf[4] = v13;
  *(_WORD *)&buf[12] = 1024;
  *(_DWORD *)&buf[14] = v65;
  *(_WORD *)&buf[18] = 2048;
  *(void *)&buf[20] = v87;
  _os_log_impl(&dword_1AD076000, v15, OS_LOG_TYPE_INFO, "Attempted to open %{public}@ for writing but the file is already full, remaining space:%d, fileSize:%zu", buf, 0x1Cu);

LABEL_9:
LABEL_10:

LABEL_11:
  v16 = 0;
LABEL_71:

  return v16;
}

- (BMFileHandle)backingFile
{
  return self->_backingFile;
}

- (void)setDatastoreVersion:(unsigned int)a3
{
  self->_datastoreVersion = a3;
}

- (void)enumerateWithOptionsV2:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void (**)(id, NSObject *, char *))a5;
  if (!v9)
  {
    v99 = [MEMORY[0x1E4F28B00] currentHandler];
    [v99 handleFailureInMethod:a2, self, @"BMFrameStoreV2.m", 925, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if (a4 == 4294967294) {
    goto LABEL_34;
  }
  unsigned int v10 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (!v10) {
    goto LABEL_34;
  }
  unsigned int v11 = v10;
  if ([(BMFrameStore *)self frameStoreSize] < 16 * (unint64_t)v10)
  {
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke;
    v130[3] = &unk_1E5E78708;
    v130[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken != -1) {
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken, v130);
    }
    os_log_type_t v13 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_33;
    }
    unint64_t v14 = [(BMFrameStore *)self frameStoreSize];
    unsigned int v15 = (void *)MEMORY[0x1E4F4FB78];
    v16 = [(BMFrameStore *)self segmentPath];
    os_log_type_t v17 = [v15 privacyPathname:v16];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v11;
    *(_WORD *)&buf[8] = 2048;
    *(void *)&buf[10] = v14;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v17;
    unsigned int v18 = "enumerateWithOptions: frameStore has totalFrames: %d but file size is too small: %zu in segment: %{public}@";
    uint64_t v19 = v12;
    os_log_type_t v20 = v13;
    uint32_t v21 = 28;
LABEL_10:
    _os_log_impl(&dword_1AD076000, v19, v20, v18, buf, v21);

LABEL_33:
    goto LABEL_34;
  }
  if (a4 != 0xFFFFFFFF && a4)
  {
    LODWORD(v22) = [(BMFrameStore *)self frameNumberFromOffsetToOffsetTableEntryV2:a4];
    unsigned int v24 = [(BMFrameStore *)self frames];
    int v23 = ($6904A10426020E4F4092C7509944103C *)([v24 start] + a4);
  }
  else
  {
    if ((a3 & 8) != 0) {
      uint64_t v22 = v11 - 1;
    }
    else {
      uint64_t v22 = 0;
    }
    int v23 = [(BMFrameStore *)self offsetTablePtrFromFrameNumberV2:v22];
  }
  if (v22 == v11)
  {
    if ((a3 & 8) == 0) {
      goto LABEL_34;
    }
    LODWORD(v22) = v11 - 1;
    ++v23;
  }
  if ((v22 & 0x80000000) != 0 || v22 > v11 || !v23)
  {
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_41;
    v129[3] = &unk_1E5E78708;
    v129[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_40 != -1) {
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_40, v129);
    }
    os_log_type_t v26 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v26))
    {
      v27 = (void *)MEMORY[0x1E4F4FB78];
      unint64_t v28 = [(BMFrameStore *)self segmentPath];
      uint64_t v29 = [v27 privacyPathname:v28];
      *(_DWORD *)buf = 134218754;
      *(void *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v22;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v11;
      *(_WORD *)&unsigned char buf[24] = 2114;
      *(void *)&buf[26] = v29;
      _os_log_impl(&dword_1AD076000, v12, v26, "enumerateWithOptions: offset:%zu outside of range for frames, mapping to frame: %d when segment has only %d frames in segment: %{public}@", buf, 0x22u);
    }
    goto LABEL_33;
  }
  unsigned int v117 = v11 - 1;
  unint64_t v25 = -[BMFrameStore offsetTablePtrFromFrameNumberV2:](self, "offsetTablePtrFromFrameNumberV2:");
  if (!v25)
  {
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_43;
    v128[3] = &unk_1E5E78708;
    v128[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_42 != -1) {
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_42, v128);
    }
    os_log_type_t v30 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v12, v30)) {
      goto LABEL_33;
    }
    double v31 = (void *)MEMORY[0x1E4F4FB78];
    v16 = [(BMFrameStore *)self segmentPath];
    os_log_type_t v17 = [v31 privacyPathname:v16];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v11;
    *(_WORD *)&buf[14] = 2114;
    *(void *)&buf[16] = v17;
    unsigned int v18 = "enumerateWithOptions: lastOffsetTable:NULL outside of range for frames, mapping to frame: %d when segment has "
          "only %d frames in segment: %{public}@";
    uint64_t v19 = v12;
    os_log_type_t v20 = v30;
    uint32_t v21 = 24;
    goto LABEL_10;
  }
  if (v25->var0.var0.var1 == 4)
  {
    ++v25;
    if ((a3 & 8) != 0 && v117 == v22)
    {
      LODWORD(v22) = v11 - 2;
      ++v23;
    }
  }
  else
  {
    unsigned int v117 = v11;
  }
  unint64_t v32 = (v25->var0.var0.var0 + 3) & 0xFFFFFFFC;
  if ([(BMFrameStore *)self frameStoreSize] < v32)
  {
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_45;
    v127[3] = &unk_1E5E78708;
    v127[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_44 != -1) {
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_44, v127);
    }
    os_log_type_t v33 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v33))
    {
      unint64_t v34 = [(BMFrameStore *)self frameStoreSize];
      int v35 = v32;
      int v36 = (void *)MEMORY[0x1E4F4FB78];
      v37 = [(BMFrameStore *)self segmentPath];
      id v38 = [v36 privacyPathname:v37];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v35;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v34;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v38;
      _os_log_impl(&dword_1AD076000, v12, v33, "enumerateWithOptions: byteAfterLastFramesDataAtEnumerationStart: %u is larger than the segmentSize: %zu in segment: %{public}@", buf, 0x1Cu);
    }
    goto LABEL_33;
  }
  unsigned int v39 = [(BMFrameStore *)self offsetTableOffsetFromFrameNumberV2:v117 - 1];
  unsigned int v111 = v32;
  if (v39 < v32)
  {
    unsigned int v40 = v39;
    v12 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_47;
    v126[3] = &unk_1E5E78708;
    v126[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_46 != -1) {
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_46, v126);
    }
    os_log_type_t v41 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v41))
    {
      v42 = (void *)MEMORY[0x1E4F4FB78];
      char v43 = [(BMFrameStore *)self segmentPath];
      int v44 = [v42 privacyPathname:v43];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v111;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v40;
      *(_WORD *)&buf[14] = 2114;
      *(void *)&buf[16] = v44;
      _os_log_impl(&dword_1AD076000, v12, v41, "enumerateWithOptions: byteAfterLastFramesDataAtEnumerationStart: %u is beyond the offset for the last table offset entry %u in segment: %{public}@", buf, 0x18u);
    }
    goto LABEL_33;
  }
  char v125 = 0;
  os_log_type_t v45 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v45 timeIntervalSinceReferenceDate];
  double v47 = v46;

  int v109 = 0;
  if ([(BMFrameStore *)self permission])
  {
    unsigned int v48 = v111;
  }
  else
  {
    unsigned int v48 = v111;
    if ([(BMFrameStore *)self pruneOnAccess]
      && [(BMFrameStore *)self filterByAgeOnRead]
      && ([(BMFrameStore *)self maxAge], v49 > 0.0))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(BMFrameStore *)self maxAge];
      double v47 = Current - v51;
      int v109 = 1;
    }
    else
    {
      int v109 = 0;
    }
  }
  int v52 = v22 - 1;
  uint64_t v53 = 1;
  if ((a3 & 8) != 0) {
    uint64_t v53 = 0xFFFFFFFFFFFFFFFLL;
  }
  v54 = &v23[v53];
  if ((a3 & 8) != 0) {
    int v55 = -1;
  }
  else {
    int v55 = 1;
  }
  uint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
  if ((a3 & 8) != 0)
  {
    uint64_t v56 = 1;
    int v52 = v22 + 1;
  }
  uint64_t v57 = (v52 + v55);
  int v110 = v55;
  unsigned int v58 = v52 + 2 * v55;
  int v59 = &v54[v56];
  v116 = v54;
  uint64_t v118 = v56 * 16;
  while (1)
  {
    v114 = v59;
    unsigned int v115 = v58;
    v60 = (void *)MEMORY[0x1AD11E210]();
    if ((v57 & 0x80000000) != 0 || v57 >= v117) {
      goto LABEL_124;
    }
    if (v57)
    {
      uint64_t v61 = v118;
      unsigned int v62 = (*(unsigned int *)((char *)&v54[1].var0.var0.var0 + v118) + 3) & 0xFFFFFFFC;
    }
    else
    {
      unsigned int v62 = 0;
      uint64_t v61 = v118;
    }
    if (v62 < v48) {
      goto LABEL_127;
    }
    if (v62 == v48) {
      goto LABEL_124;
    }
    context = v60;
    char v63 = __biome_log_for_category();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unsigned char buf[24] = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_49;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_48 != -1) {
      dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_48, block);
    }
    unint64_t v64 = a3 & 8;
    os_log_type_t v65 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v63, v65))
    {
      uint64_t v66 = (void *)MEMORY[0x1E4F4FB78];
      id v67 = [(BMFrameStore *)self segmentPath];
      v68 = [v66 privacyPathname:v67];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v62;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v111;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v117;
      *(_WORD *)&buf[20] = 2112;
      *(void *)&buf[22] = v68;
      _os_log_impl(&dword_1AD076000, v63, v65, "enumerateWithOptions: offset (%u) beyond the space used:%u by the currentFrameCount:%d  segment:%@", buf, 0x1Eu);

      unint64_t v64 = a3 & 8;
    }

    unsigned int v48 = v111;
    v60 = context;
    uint64_t v61 = v118;
    if (v64)
    {
LABEL_127:
      v69 = (char *)v54 + v61;
      int v70 = *(unsigned int *)((char *)&v54->var0.var0.var0 + v61);
      uint64_t v71 = v70 - v62;
      if (v71 <= v48) {
        break;
      }
    }
LABEL_121:
    uint64_t v57 = (v57 + v110);
    unsigned int v58 = v115 + v110;
    v54 = ($6904A10426020E4F4092C7509944103C *)((char *)v54 + v118);
    v116 = ($6904A10426020E4F4092C7509944103C *)((char *)v116 + v118);
    int v59 = ($6904A10426020E4F4092C7509944103C *)((char *)v114 + v118);
    if (v125) {
      goto LABEL_34;
    }
  }
  uint64_t v72 = *(unsigned int *)((char *)&v54->var0.var0.var1 + v61);
  switch((int)v72)
  {
    case 0:
      if (v70 != v62) {
        goto LABEL_121;
      }
      goto LABEL_123;
    case 1:
      if (!v109) {
        goto LABEL_93;
      }
      double v77 = *(double *)((char *)&v54->var1 + v61);
      if ((a3 & 8) == 0 || v77 >= v47)
      {
        if (v77 < v47) {
          goto LABEL_121;
        }
LABEL_93:
        if (v125) {
          goto LABEL_124;
        }
        v105 = (char *)v54 + v61;
        contexta = v60;
        id v121 = 0;
        unsigned int v78 = [(BMFrameStore *)self frames];
        unsigned int v103 = v62;
        unsigned int v79 = (uint64_t *)([v78 start] + v62);

        int v120 = 0;
        if (v72 == 1) {
          v80 = &v121;
        }
        else {
          v80 = 0;
        }
        LOBYTE(v100) = v72 == 1;
        int v107 = v72;
        if ([(BMFrameStore *)self isValidFrameV2:v79 currentFrame:v57 expectedState:1 copyOfData:v80 frameState:v72 frameSize:v71 validations:v100 enumerationOptions:a3 errorCode:&v120])
        {
          v81 = [(BMFrameStore *)self frames];
          uint64_t v82 = [v81 start];

          if ((v115 & 0x80000000) != 0 || v115 > v117)
          {
            if ((a3 & 8) != 0) {
              uint64_t v93 = 4294967294;
            }
            else {
              uint64_t v93 = [(BMFrameStore *)self offsetTableOffsetFromFrameNumberV2:v117];
            }
            uint64_t v106 = v93;
            uint64_t v83 = v118;
          }
          else
          {
            uint64_t v83 = v118;
            uint64_t v106 = (uint64_t)v114 + v118 - v82;
          }
          uint64_t v104 = (uint64_t)v116 + v83 - v82;
          uint64_t v102 = *v79;
          v108 = [BMFrame alloc];
          long long v94 = [(BMFrameStore *)self backingFile];
          uint64_t v95 = [v94 attributes];
          uint64_t v96 = [v95 path];
          double v97 = *(double *)((char *)&v54->var1 + v83);
          *(void *)buf = v102;
          memset(&buf[8], 0, 24);
          LODWORD(v101) = v107;
          uint64_t v87 = [(BMFrame *)v108 initWithHeader:buf storePath:v96 data:v121 framePtr:v69 offset:v104 nextOffset:v106 timestamp:v97 datastoreVersion:10 state:v101];

          id v98 = v121;
          id v121 = 0;

          v9[2](v9, v87, &v125);
        }
        else
        {
          unsigned int v48 = v111;
          if (v120 == 5 && *((_DWORD *)v105 + 1) != 1)
          {
LABEL_119:

LABEL_120:
            v60 = contexta;
            goto LABEL_121;
          }
          uint64_t v87 = __biome_log_for_category();
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          unsigned char buf[24] = 16;
          v119[0] = MEMORY[0x1E4F143A8];
          v119[1] = 3221225472;
          v119[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_55;
          v119[3] = &unk_1E5E78708;
          v119[4] = buf;
          if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_54 != -1) {
            dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_54, v119);
          }
          os_log_type_t v88 = *(unsigned char *)(*(void *)&buf[8] + 24);
          _Block_object_dispose(buf, 8);
          if (os_log_type_enabled(v87, v88))
          {
            int v89 = v120;
            __int16 v90 = (void *)MEMORY[0x1E4F4FB78];
            uint64_t v91 = [(BMFrameStore *)self segmentPath];
            long long v92 = [v90 privacyPathname:v91];
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)&buf[4] = v89;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v57;
            *(_WORD *)&buf[14] = 1024;
            *(_DWORD *)&buf[16] = v103;
            *(_WORD *)&buf[20] = 2114;
            *(void *)&buf[22] = v92;
            _os_log_impl(&dword_1AD076000, v87, v88, "isValidFrame returned a %d error for frame number:%d at offset %u, skipping frame in segment: %{public}@", buf, 0x1Eu);
          }
        }
        unsigned int v48 = v111;

        goto LABEL_119;
      }
LABEL_123:
      char v125 = 1;
LABEL_124:
LABEL_34:

      return;
    case 2:
      if ((a3 & 2) == 0) {
        goto LABEL_121;
      }
      goto LABEL_93;
    case 3:
      if ((a3 & 1) == 0) {
        goto LABEL_121;
      }
      goto LABEL_93;
    case 4:
      goto LABEL_123;
    case 5:
      contexta = v60;
      id v73 = __biome_log_for_category();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      unsigned char buf[24] = 16;
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_51;
      v123[3] = &unk_1E5E78708;
      v123[4] = buf;
      if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_50 != -1) {
        dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_50, v123);
      }
      os_log_type_t v84 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (!os_log_type_enabled(v73, v84)) {
        goto LABEL_106;
      }
      __int16 v85 = (void *)MEMORY[0x1E4F4FB78];
      id v86 = [(BMFrameStore *)self segmentPath];
      unint64_t v76 = [v85 privacyPathname:v86];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v62;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v76;
      _os_log_impl(&dword_1AD076000, v73, v84, "Found frame with state: BMFrameStateUnknown at offset:%u in segment: %{public}@", buf, 0x12u);

      goto LABEL_105;
    default:
      contexta = v60;
      id v73 = __biome_log_for_category();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      unsigned char buf[24] = 16;
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_53;
      v122[3] = &unk_1E5E78708;
      v122[4] = buf;
      if (enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_52 != -1) {
        dispatch_once(&enumerateWithOptionsV2_fromOffset_usingBlock__onceToken_52, v122);
      }
      os_log_type_t v74 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (!os_log_type_enabled(v73, v74)) {
        goto LABEL_106;
      }
      uint64_t v75 = [(BMFrameStore *)self _printablePathV2];
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v72;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v57;
      *(_WORD *)&buf[14] = 2114;
      *(void *)&buf[16] = v75;
      unint64_t v76 = (void *)v75;
      *(_WORD *)&unsigned char buf[24] = 1024;
      *(_DWORD *)&buf[26] = v62;
      *(_WORD *)&buf[30] = 1024;
      *(_DWORD *)&buf[32] = v71;
      __int16 v132 = 1024;
      int v133 = (a3 & 8) >> 3;
      _os_log_impl(&dword_1AD076000, v73, v74, "Unrecognized frame state: %d, frame number:%d, segment:%{public}@ offset:%u frame size:%u reverse:%d", buf, 0x2Au);
LABEL_105:

LABEL_106:
      unsigned int v48 = v111;

      goto LABEL_120;
  }
}

- (unsigned)atomicReadTotalFramesV2
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(BMFrameStore *)self header];
  uint64_t v4 = [v3 start];

  if (*(_DWORD *)(v4 + 16) == 10) {
    return atomic_load((unsigned int *)(v4 + 4));
  }
  v6 = __biome_log_for_category();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  char v14 = 16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__BMFrameStore_V2__atomicReadTotalFramesV2__block_invoke;
  block[3] = &unk_1E5E78708;
  block[4] = &buf;
  if (atomicReadTotalFramesV2_onceToken != -1) {
    dispatch_once(&atomicReadTotalFramesV2_onceToken, block);
  }
  os_log_type_t v7 = *(unsigned char *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (void *)MEMORY[0x1E4F4FB78];
    uint64_t v9 = [(BMFrameStore *)self segmentPath];
    unsigned int v10 = [v8 privacyPathname:v9];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1AD076000, v6, v7, "Seeking totalFrames but not a V2 frameStore: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  return 0;
}

- (BMMemoryMapping)header
{
  return self->_header;
}

- (unint64_t)frameStoreSize
{
  return self->_frameStoreSize;
}

- (NSString)segmentName
{
  v2 = [(BMFileHandle *)self->_backingFile attributes];
  v3 = [v2 filename];

  return (NSString *)v3;
}

- ($6904A10426020E4F4092C7509944103C)offsetTablePtrFromFrameNumberV2:(unsigned int)a3
{
  unint64_t v4 = 16 * (a3 + 1);
  v5 = [(BMFrameStore *)self frames];
  unint64_t v6 = [v5 size];

  if (v4 > v6) {
    return 0;
  }
  v8 = [(BMFrameStore *)self frames];
  os_log_type_t v7 = ($6904A10426020E4F4092C7509944103C *)([v8 end] - v4);

  return v7;
}

- (void)setLastAbsoluteTimestamp:(double)a3
{
  self->_lastAbsoluteTimestamp = a3;
}

- (double)lastAbsoluteTimestamp
{
  return self->_lastAbsoluteTimestamp;
}

- (unsigned)offsetTableOffsetFromFrameNumberV2:(unsigned int)a3
{
  unint64_t v4 = 16 * (a3 + 1);
  v5 = [(BMFrameStore *)self frames];
  unint64_t v6 = [v5 size];

  if (v4 > v6) {
    return -2;
  }
  v8 = [(BMFrameStore *)self frames];
  unsigned int v7 = [v8 size] - v4;

  return v7;
}

- (int)frameNumberFromOffsetToOffsetTableEntryV2:(unsigned int)a3
{
  v5 = [(BMFrameStore *)self frames];
  unint64_t v6 = [v5 size];

  if (v6 < a3) {
    return -1;
  }
  v8 = [(BMFrameStore *)self frames];
  int v7 = (([v8 size] - a3) >> 4) - 1;

  return v7;
}

- (BMMemoryMapping)frames
{
  return self->_frames;
}

- (BOOL)isValidFrameV2:(void *)a3 currentFrame:(unsigned int)a4 expectedState:(unsigned int)a5 copyOfData:(id *)a6 frameState:(unsigned int)a7 frameSize:(unsigned int)a8 validations:(BOOL)a9 enumerationOptions:(unint64_t)a10 errorCode:(int *)a11
{
  uint64_t v11 = *(void *)&a8;
  v68[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = a3 & 3;
  if ((a3 & 3) != 0)
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"isValidFrameV2: Frame is not 4-byte aligned:%d", a3);
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v67 = *MEMORY[0x1E4F28568];
    v68[0] = v16;
    unsigned int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
    uint64_t v19 = (void *)[v17 initWithDomain:@"com.apple.Biome.BMFramestore" code:1 userInfo:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }
  BOOL v20 = v15 == 0;
  uint32_t v21 = [(BMFrameStore *)self frames];
  uint64_t v22 = [v21 end];

  if (!v20) {
    goto LABEL_23;
  }
  unint64_t v23 = v22 - ((void)a3 + 8);
  if ((v23 & 0x8000000000000000) != 0 || v23 < v11)
  {
    os_log_type_t v26 = [(BMFrameStore *)self frames];
    uint64_t v27 = [v26 start];

    unint64_t v28 = (void *)[[NSString alloc] initWithFormat:@"isValidFrameV2: Frame size:%d runs past the remaining free space in the segment:%td, frame intended to start at offset:%td", v11, v23, (char *)a3 - v27];
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v65 = *MEMORY[0x1E4F28568];
    uint64_t v66 = v28;
    os_log_type_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    uint64_t v31 = [v29 initWithDomain:@"com.apple.Biome.BMFramestore" code:2 userInfo:v30];

LABEL_22:
    uint64_t v19 = (void *)v31;
    goto LABEL_23;
  }
  if (a7 != a5 && a9)
  {
    id v24 = [NSString alloc];
    if (a5 >= 6)
    {
      unint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"BMFrameStateUnknown(%lu)", a5);
    }
    else
    {
      unint64_t v25 = *(&off_1E5E78AB8 + (int)a5);
    }
    if (a7 >= 6)
    {
      v37 = objc_msgSend(NSString, "stringWithFormat:", @"BMFrameStateUnknown(%lu)", a7);
    }
    else
    {
      v37 = *(&off_1E5E78AB8 + (int)a7);
    }
    id v38 = (void *)[v24 initWithFormat:@"isValidFrame: Unexpected frame state. Expected: %@, found: %@", v25, v37];

    id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v63 = *MEMORY[0x1E4F28568];
    unint64_t v64 = v38;
    unsigned int v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    uint64_t v31 = [v39 initWithDomain:@"com.apple.Biome.BMFramestore" code:3 userInfo:v40];

    goto LABEL_22;
  }
  if (!a6) {
    goto LABEL_16;
  }
  unint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)a3 + 8 length:v11 - 8];
  id v33 = *a6;
  *a6 = v32;

  BOOL v34 = 1;
  if (a5 - 1 > 1 || !a9) {
    goto LABEL_40;
  }
  id v35 = *a6;
  uLong Checksum = bm_generateChecksum((Bytef *)[v35 bytes], (int)v11 - 8);

  if (Checksum == *(_DWORD *)a3)
  {
LABEL_16:
    BOOL v34 = 1;
    goto LABEL_40;
  }
  uint64_t v50 = (void *)[[NSString alloc] initWithFormat:@"Checksums don't match. Header: %u, Generated checksum: %u. Skipping frame.", *(unsigned int *)a3, Checksum];
  id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v61 = *MEMORY[0x1E4F28568];
  unsigned int v62 = v50;
  int v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  uint64_t v53 = [v51 initWithDomain:@"com.apple.Biome.BMFramestore" code:5 userInfo:v52];

  id v54 = *a6;
  *a6 = 0;

  uint64_t v19 = (void *)v53;
LABEL_23:
  int v41 = [v19 code];
  if (a11) {
    *a11 = v41;
  }
  if (v41 == 5 || v41 == 3)
  {
    unsigned int v42 = [(BMFrameStore *)self stateOfFrameV2:a4];
    if ((a10 & 1) != 0 && v42 == 3 || (a10 & 2) != 0 && v42 == 2)
    {
      BOOL v43 = 0;
      BOOL v34 = 1;
    }
    else
    {
      BOOL v34 = 0;
      BOOL v43 = (v42 & 0xFFFFFFFE) != 2;
    }
  }
  else
  {
    BOOL v34 = 0;
    BOOL v43 = 1;
  }
  int v44 = [(BMFrameStore *)self frames];
  uint64_t v45 = [v44 start];

  if (v43)
  {
    double v46 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v60) = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __135__BMFrameStore_V2__isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode__onceToken != -1) {
      dispatch_once(&isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode__onceToken, block);
    }
    os_log_type_t v47 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v46, v47))
    {
      unsigned int v48 = [(BMFrameStore *)self _printablePathV2];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&buf[4] = v48;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (char *)a3 - v45;
      *(_WORD *)&buf[22] = 2112;
      v60 = v19;
      _os_log_impl(&dword_1AD076000, v46, v47, "isValidFrame failed, path:%{public}@, offset:%td error:%@", buf, 0x20u);
    }
  }
LABEL_40:

  return v34;
}

- (BOOL)pruneOnAccess
{
  return self->_pruneOnAccess;
}

- (unint64_t)permission
{
  return self->_permission;
}

+ (BOOL)expectedTimestamp:(double)a3
{
  return CFAbsoluteTimeGetCurrent() + 604800.0 > a3 && a3 >= 0.0;
}

- (void)setPermission:(unint64_t)a3
{
  self->_permission = a3;
}

- (void)setHeader:(id)a3
{
}

- (void)setFrames:(id)a3
{
}

- (void)setFrameStoreSize:(unint64_t)a3
{
  self->_frameStoreSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrintablePathV2, 0);
  objc_storeStrong((id *)&self->_backingFile, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_cachedPrintablePath, 0);
  objc_storeStrong((id *)&self->_framePointers, 0);
}

- (void)setPruneOnAccess:(BOOL)a3
{
  self->_pruneOnAccess = a3;
}

- (void)setMaxAge:(double)a3
{
  self->_maxAge = a3;
}

- (void)setFilterByAgeOnRead:(BOOL)a3
{
  self->_filterByAgeOnRead = a3;
}

- (void)enumerateWithOptions:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  unsigned int datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    [(BMFrameStore *)self enumerateWithOptionsV2:a3 fromOffset:a4 usingBlock:v8];
  }
  else if (datastoreVersion == 9)
  {
    [(BMFrameStore *)self enumerateWithOptionsV1:a3 fromOffset:a4 usingBlock:v8];
  }
  else
  {
    unsigned int v10 = __biome_log_for_category();
    *(void *)long long buf = 0;
    uint64_t v15 = buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__BMFrameStore_enumerateWithOptions_fromOffset_usingBlock___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (enumerateWithOptions_fromOffset_usingBlock__onceToken != -1) {
      dispatch_once(&enumerateWithOptions_fromOffset_usingBlock__onceToken, block);
    }
    os_log_type_t v11 = v15[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v10, v11))
    {
      unsigned int v12 = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1AD076000, v10, v11, "-[BMFrameStore enumerateWithOptions:fromOffset:usingBlock:] called with unexpected dataVersion:%d", buf, 8u);
    }
  }
}

- (unsigned)datastoreVersion
{
  return self->_datastoreVersion;
}

- (BMFrameStore)initWithFileHandle:(id)a3 permission:(unint64_t)a4 datastoreVersion:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5 == 10)
  {
    uint64_t v9 = [(BMFrameStore *)self initWithFileHandleV2:v8 permission:a4];
    goto LABEL_5;
  }
  if (a5 == 9)
  {
    uint64_t v9 = [(BMFrameStore *)self initWithFileHandleV1:v8 permission:a4];
LABEL_5:
    self = v9;
    unsigned int v10 = self;
    goto LABEL_11;
  }
  os_log_type_t v11 = __biome_log_for_category();
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v20 = 16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__BMFrameStore_initWithFileHandle_permission_datastoreVersion___block_invoke;
  block[3] = &unk_1E5E78708;
  block[4] = buf;
  if (initWithFileHandle_permission_datastoreVersion__onceToken != -1) {
    dispatch_once(&initWithFileHandle_permission_datastoreVersion__onceToken, block);
  }
  os_log_type_t v12 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F4FB78];
    char v14 = [v8 attributes];
    uint64_t v15 = [v14 path];
    uint64_t v16 = [v13 privacyPathname:v15];
    *(_DWORD *)long long buf = 138543618;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    _os_log_impl(&dword_1AD076000, v11, v12, "Segment version of %{public}@ doesn't match expected versions: %lu.", buf, 0x16u);
  }
  unsigned int v10 = 0;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  if (self->_permission) {
    [(BMFrameStore *)self sync];
  }
  v3.receiver = self;
  v3.super_class = (Class)BMFrameStore;
  [(BMFrameStore *)&v3 dealloc];
}

- (void)setBackingFile:(id)a3
{
  id v15 = a3;
  objc_storeStrong((id *)&self->_backingFile, a3);
  id v5 = [NSString alloc];
  unint64_t v6 = [MEMORY[0x1E4F4FBA0] remoteDevices];
  int v7 = (void *)[v5 initWithFormat:@"/%@/", v6];

  id v8 = [(BMFrameStore *)self segmentPath];
  int v9 = [v8 containsString:v7];

  if (v9) {
    self->_isRemoteSegment = 1;
  }
  id v10 = [NSString alloc];
  os_log_type_t v11 = [MEMORY[0x1E4F4FBA0] tombstones];
  os_log_type_t v12 = (void *)[v10 initWithFormat:@"/%@/", v11];

  uint64_t v13 = [(BMFrameStore *)self segmentPath];
  int v14 = [v13 containsString:v12];

  if (v14) {
    self->_isTombstoneSegment = 1;
  }
}

- (NSString)segmentPath
{
  v2 = [(BMFileHandle *)self->_backingFile attributes];
  objc_super v3 = [v2 path];

  return (NSString *)v3;
}

- (void)sync
{
  obj = self;
  objc_sync_enter(obj);
  [(BMMemoryMapping *)obj->_header sync];
  [(BMMemoryMapping *)obj->_frames sync];
  objc_sync_exit(obj);
}

- (unsigned)appendOffsetTableEntry:(id *)a3 outOffsetForFrame:(unsigned int *)a4 length:(unsigned int)a5 frameCount:(unsigned int *)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([(BMFrameStore *)self datastoreVersion] != 10)
  {
    uint64_t v16 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v49) = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__BMFrameStore_V2__appendOffsetTableEntry_outOffsetForFrame_length_frameCount___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (appendOffsetTableEntry_outOffsetForFrame_length_frameCount__onceToken != -1) {
      dispatch_once(&appendOffsetTableEntry_outOffsetForFrame_length_frameCount__onceToken, block);
    }
    os_log_type_t v17 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v16, v17))
    {
      unsigned int v18 = [(BMFrameStore *)self datastoreVersion];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1AD076000, v16, v17, "appendOffsetTable called with unexpected dataVersion:%d", buf, 8u);
    }

    return 1;
  }
  unsigned int v44 = a5;
  v46[0] = 0;
  v46[1] = 0;
  LODWORD(v11) = *a6;
  unint64_t v12 = 16 * (*a6 + 1);
  uint64_t v13 = [(BMFrameStore *)self frames];
  unint64_t v14 = [v13 size];

  if (v12 > v14) {
    return 2;
  }
  uint64_t v19 = [(BMFrameStore *)self frames];
  unint64_t v20 = [v19 size] - v12;

  uint64_t v21 = [(BMFrameStore *)self frames];
  int v22 = [v21 atomicWriteEightBytes:a3->var0.var1 toOffset:v20 expected:v46];

  if (v22 != 1)
  {
    while (HIDWORD(v46[0]) != 4)
    {
      uint64_t v11 = (v11 + 1);
      unint64_t v23 = 16 * v11;
      id v24 = [(BMFrameStore *)self frames];
      unint64_t v25 = [v24 size];

      if (v23 > v25) {
        break;
      }
      os_log_type_t v26 = [(BMFrameStore *)self frames];
      unint64_t v27 = [v26 end] - v23;

      double v28 = *(double *)(v27 + 8);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (v28 >= Current) {
        CFAbsoluteTime Current = v28;
      }
      a3->double var1 = Current;
      uint64_t v30 = (LODWORD(v46[0]) + 3) & 0xFFFFFFFC;
      a3->var0.var0.var0 = v44 + 8 + v30;
      v46[0] = 0;
      uint64_t v31 = [(BMFrameStore *)self frames];
      char v32 = [v31 isValidReadFromOffsetV2:v30 withLength:(v44 + 3) & 0xFFFFFFFC currentFrameCount:v11];

      if ((v32 & 1) == 0)
      {
        id v33 = [(BMFrameStore *)self frames];
        int v34 = [v33 isValidReadFromOffsetV2:v30 withLength:0 currentFrameCount:v11];

        if (!v34)
        {
          BOOL v43 = __biome_log_for_category();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            -[BMFrameStore appendFrameHeaderV1:offset:]();
          }

          return 2;
        }
        a3->var0.double var1 = 0x400000000;
      }
      v20 -= 16;
      id v35 = [(BMFrameStore *)self frames];
      int v36 = [v35 atomicWriteEightBytes:a3->var0.var1 toOffset:v20 expected:v46];

      if (v36 == 1) {
        goto LABEL_19;
      }
    }
    return 2;
  }
LABEL_19:
  if (a4) {
    *a4 = a3->var0.var0.var0 - v44 - 8;
  }
  [(BMFrameStore *)self updateToMaxOfTotalFramesAnd:(v11 + 1)];
  *a6 = v11 + 1;
  [(BMFrameStore *)self setLastAbsoluteTimestamp:a3->var1];
  double var1 = a3->var1;
  id v38 = [(BMFrameStore *)self frames];
  uint64_t v39 = *(void *)([v38 start] + v20 + 8);

  uint64_t v45 = v39;
  unsigned int v40 = [(BMFrameStore *)self frames];
  int v41 = [v40 atomicWriteEightBytes:*(void *)&var1 toOffset:v20 + 8 expected:&v45];

  if (v41 != 1)
  {
    unsigned int v42 = __biome_log_for_category();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 1024;
      int v49 = v41;
      _os_log_error_impl(&dword_1AD076000, v42, OS_LOG_TYPE_ERROR, "Unable to update creationTimestamp. We expect to see %llu, but instead are seeing %llu. The write status is %d", buf, 0x1Cu);
    }

    return 1;
  }
  return 2 * (a3->var0.var0.var1 == 4);
}

- (void)updateToMaxOfValueAtOffset:(unsigned int)a3 newValue:(int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(BMFrameStore *)self datastoreVersion] == 10)
  {
    int v7 = [(BMFrameStore *)self header];
    uint64_t v8 = [v7 start];

    int v9 = atomic_load((unsigned int *)(v8 + a3));
    if (v9 < a4)
    {
      int v10 = v9;
      do
      {
        atomic_compare_exchange_strong((atomic_uint *volatile)(v8 + a3), (unsigned int *)&v10, a4);
        if (v10 == v9) {
          break;
        }
        int v9 = v10;
      }
      while (v10 < a4);
    }
  }
  else
  {
    uint64_t v11 = __biome_log_for_category();
    *(void *)long long buf = 0;
    uint64_t v16 = buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__BMFrameStore_V2__updateToMaxOfValueAtOffset_newValue___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (updateToMaxOfValueAtOffset_newValue__onceToken != -1) {
      dispatch_once(&updateToMaxOfValueAtOffset_newValue__onceToken, block);
    }
    os_log_type_t v12 = v16[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v11, v12))
    {
      unsigned int v13 = [(BMFrameStore *)self datastoreVersion];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v13;
      _os_log_impl(&dword_1AD076000, v11, v12, "updateToMaxOfValueAtOffset called with unexpected datastoreVersion:%d", buf, 8u);
    }
  }
}

- (void)updateToMaxOfTotalFramesAnd:(unsigned int)a3
{
}

+ (BOOL)writeEmptyFrameStoreWithFileHandle:(id)a3 fileSize:(unint64_t)a4 datastoreVersion:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  memset(&v28, 0, sizeof(v28));
  if (!fstat([v7 fd], &v28))
  {
    if (v28.st_size)
    {
      int v9 = __biome_log_for_category();
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v30 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken != -1) {
        dispatch_once(&writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken, block);
      }
      os_log_type_t v10 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F4FB78];
        os_log_type_t v12 = [v7 attributes];
        unsigned int v13 = [v12 path];
        unint64_t v14 = [v11 privacyPathname:v13];
        *(_DWORD *)long long buf = 138543362;
        *(void *)&buf[4] = v14;
        _os_log_impl(&dword_1AD076000, v9, v10, "Attempted to write a non-empty file %{public}@ with an empty frame store", buf, 0xCu);
      }
    }
    else
    {
      if (a5 - 11 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v8 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v30 = 16;
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        id v24 = __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke_32;
        unint64_t v25 = &unk_1E5E78708;
        os_log_type_t v26 = buf;
        if (writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken_31 != -1) {
          dispatch_once(&writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion__onceToken_31, &v22);
        }
        os_log_type_t v17 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v8, v17))
        {
          char v18 = (void *)MEMORY[0x1E4F4FB78];
          uint64_t v19 = objc_msgSend(v7, "attributes", v22, v23, v24, v25, v26);
          unint64_t v20 = [v19 path];
          uint64_t v21 = [v18 privacyPathname:v20];
          *(_DWORD *)long long buf = 138543618;
          *(void *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a5;
          _os_log_impl(&dword_1AD076000, v8, v17, "Segment version of %{public}@ doesn't match expected versions: %lu.", buf, 0x16u);
        }
        goto LABEL_4;
      }
      *(void *)long long buf = -1;
      if (a5 == 10)
      {
        if (![(id)objc_opt_class() writeEmptySegmentHeaderWithFileHandleV2:v7 segmentHeaderSize:buf])goto LABEL_11; {
      }
        }
      else if (a5 == 9 {
             && ([(id)objc_opt_class() writeEmptySegmentHeaderWithFileHandleV1:v7 segmentHeaderSize:buf] & 1) == 0)
      }
      {
        goto LABEL_11;
      }
      if (*(void *)buf <= a4)
      {
        if (!ftruncate([v7 fd], a4))
        {
          BOOL v15 = 1;
          goto LABEL_12;
        }
        __error();
        int v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[BMFrameStore writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:]();
        }
      }
      else
      {
        int v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[BMFrameStore writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:](v7);
        }
      }
    }

    goto LABEL_11;
  }
  __error();
  uint64_t v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.6();
  }
LABEL_4:

LABEL_11:
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)getSegmentHeader:(id *)a3 fromFileV2:(id)a4 fileSize:(unint64_t *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  memset(&v16.st_size, 0, 48);
  if (fstat(objc_msgSend(v7, "fd", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v16))
  {
    __error();
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.6(v7);
    }
LABEL_4:

LABEL_24:
    BOOL v13 = 0;
    goto LABEL_25;
  }
  if (!v16.st_size)
  {
    int v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:](v7);
    }
    goto LABEL_23;
  }
  if (v16.st_size <= 0x37uLL)
  {
    int v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:](v7);
    }
LABEL_23:

    goto LABEL_24;
  }
  v20[0] = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  __long long buf = 0u;
  ssize_t v10 = pread([v7 fd], &__buf, 0x38uLL, 0);
  if (v10 < 0)
  {
    __error();
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:](v7);
    }
    goto LABEL_4;
  }
  if (v10 != 56)
  {
    int v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.5(v7);
    }
    goto LABEL_23;
  }
  uint64_t v11 = 52;
  if (v18 == 9)
  {
    p_long long buf = (long long *)((char *)v20 + 4);
  }
  else
  {
    uint64_t v11 = 0;
    p_long long buf = &__buf;
  }
  if (*(_DWORD *)((char *)&__buf + v11) != *(_DWORD *)"SEGB")
  {
    int v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) getSegmentHeader:fromFileV2:fileSize:].cold.4(p_buf, v7, v9);
    }
    goto LABEL_23;
  }
  if (a5) {
    *a5 = v16.st_size;
  }
  if (a3)
  {
    long long v15 = v18;
    *(_OWORD *)a3->var0.var0 = __buf;
    *(_OWORD *)&a3->var2.var3 = v15;
    *((_OWORD *)&a3->var2 + 2) = v19;
    *((void *)&a3->var2 + 6) = v20[0];
  }
  BOOL v13 = 1;
LABEL_25:

  return v13;
}

- (unsigned)writeFrameForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    return [(BMFrameStore *)self writeFrameV2ForBytes:a3 length:a4 dataVersion:*(void *)&a5 timestamp:a7 outOffset:a6];
  }
  else if (datastoreVersion == 9)
  {
    return [(BMFrameStore *)self writeFrameV1ForBytes:a3 length:a4 dataVersion:*(void *)&a5 timestamp:a7 outOffset:a6];
  }
  else
  {
    ssize_t v10 = __biome_log_for_category();
    *(void *)long long buf = 0;
    long long v15 = buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__BMFrameStore_writeFrameForBytes_length_dataVersion_timestamp_outOffset___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (writeFrameForBytes_length_dataVersion_timestamp_outOffset__onceToken != -1) {
      dispatch_once(&writeFrameForBytes_length_dataVersion_timestamp_outOffset__onceToken, block);
    }
    os_log_type_t v11 = v15[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v10, v11))
    {
      unsigned int v12 = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1AD076000, v10, v11, "writeFrameForBytes with unexpected dataVersion:%d", buf, 8u);
    }

    return 1;
  }
}

- (unsigned)offsetOfFrameV2:(unsigned int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (!a3) {
    return 0;
  }
  unsigned int v6 = v5;
  if (v5 < a3)
  {
    id v7 = __biome_log_for_category();
    *(void *)long long buf = 0;
    uint64_t v21 = buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__BMFrameStore_V2__offsetOfFrameV2___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (offsetOfFrameV2__onceToken != -1) {
      dispatch_once(&offsetOfFrameV2__onceToken, block);
    }
    os_log_type_t v8 = v21[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = (void *)MEMORY[0x1E4F4FB78];
      ssize_t v10 = [(BMFrameStore *)self segmentPath];
      os_log_type_t v11 = [v9 privacyPathname:v10];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v21) = 1024;
      *(_DWORD *)((char *)&v21 + 2) = v6;
      HIWORD(v21) = 2114;
      uint64_t v22 = (uint64_t)v11;
      _os_log_impl(&dword_1AD076000, v7, v8, "offsetOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);
    }
    return 0;
  }
  unint64_t v12 = 16 * a3;
  BOOL v13 = [(BMFrameStore *)self frames];
  unint64_t v14 = [v13 size];

  if (v12 > v14) {
    return 0;
  }
  uint64_t v16 = [(BMFrameStore *)self frames];
  char v17 = (unsigned int *)([v16 end] - v12);

  unsigned int v18 = *v17;
  if (!*v17)
  {
    if (v17[1] == 4) {
      unsigned int v18 = [(BMFrameStore *)self offsetOfFrameV2:a3 - 1];
    }
    else {
      unsigned int v18 = 0;
    }
  }
  return (v18 + 3) & 0xFFFFFFFC;
}

- (void)start
{
  return [(BMMemoryMapping *)self->_frames start];
}

- (int)firstFrameNumberForTimestampV2:(double)a3 reverse:(BOOL)a4
{
  int v4 = a4;
  unsigned int v7 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (v7)
  {
    unsigned int v8 = v7;
    uint64_t v9 = v7 - 1;
    [(BMFrameStore *)self creationTimeOfFrameV2:0];
    if (v10 <= a3)
    {
      if (v10 == a3)
      {
        if (v4)
        {
          if ((int)v9 < 1)
          {
            LODWORD(v9) = 1;
          }
          else
          {
            double v11 = v10;
            uint64_t v9 = 1;
            while (1)
            {
              [(BMFrameStore *)self creationTimeOfFrameV2:v9];
              if (v12 != v11) {
                break;
              }
              uint64_t v9 = (v9 + 1);
              if (v8 == v9)
              {
                LODWORD(v9) = v8;
                break;
              }
            }
          }
          LODWORD(v9) = v9 - 1;
        }
        else
        {
          LODWORD(v9) = 0;
        }
      }
      else
      {
        [(BMFrameStore *)self creationTimeOfFrameV2:v9];
        if (v13 >= a3)
        {
          if (v13 == a3)
          {
            if ((v4 & 1) == 0)
            {
              uint64_t v9 = v8 - 2;
              if ((int)(v8 - 2) >= 0)
              {
                double v14 = v13;
                while (1)
                {
                  [(BMFrameStore *)self creationTimeOfFrameV2:v9];
                  if (v15 != v14) {
                    break;
                  }
                  BOOL v16 = (int)v9 <= 0;
                  uint64_t v9 = (v9 - 1);
                  if (v16)
                  {
                    LODWORD(v9) = -1;
                    break;
                  }
                }
              }
              LODWORD(v9) = v9 + 1;
            }
          }
          else
          {
            int v18 = 0;
            if ((v9 & 0x80000000) != 0)
            {
LABEL_38:
              LODWORD(v9) = v18 - v4;
            }
            else
            {
              int v19 = v9;
              while (1)
              {
                int v20 = v19 - v18;
                if (v19 < v18) {
                  ++v20;
                }
                LODWORD(v21) = v18 + (v20 >> 1);
                [(BMFrameStore *)self creationTimeOfFrameV2:v21];
                double v23 = v22;
                if (v22 == a3) {
                  break;
                }
                if (v22 < a3) {
                  int v18 = v21 + 1;
                }
                else {
                  int v19 = v21 - 1;
                }
                if (v19 < v18) {
                  goto LABEL_38;
                }
              }
              if (v4)
              {
                if ((int)v21 > (int)v9) {
                  LODWORD(v9) = v21;
                }
                while (v9 != v21)
                {
                  uint64_t v21 = (v21 + 1);
                  [(BMFrameStore *)self creationTimeOfFrameV2:v21];
                  if (v24 > v23)
                  {
                    LODWORD(v9) = v21 - 1;
                    return v9;
                  }
                }
              }
              else
              {
                do
                {
                  LODWORD(v9) = v21;
                  BOOL v25 = __OFSUB__(v21, 1);
                  uint64_t v21 = (v21 - 1);
                  if ((int)v21 < 0 != v25) {
                    break;
                  }
                  [(BMFrameStore *)self creationTimeOfFrameV2:v21];
                }
                while (v26 >= v23);
              }
            }
          }
        }
        else if (!v4)
        {
          LODWORD(v9) = -1;
        }
      }
    }
    else
    {
      LODWORD(v9) = v4 << 31 >> 31;
    }
  }
  else
  {
    LODWORD(v9) = -1;
  }
  return v9;
}

- (double)creationTimeOfFrameV2:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (v5 <= a3)
  {
    unsigned int v12 = v5;
    double v13 = __biome_log_for_category();
    *(void *)long long buf = 0;
    double v23 = buf;
    uint64_t v24 = 0x2020000000;
    char v25 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__BMFrameStore_V2__creationTimeOfFrameV2___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (creationTimeOfFrameV2__onceToken != -1) {
      dispatch_once(&creationTimeOfFrameV2__onceToken, block);
    }
    os_log_type_t v14 = v23[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v13, v14))
    {
      double v15 = (void *)MEMORY[0x1E4F4FB78];
      BOOL v16 = [(BMFrameStore *)self segmentPath];
      char v17 = [v15 privacyPathname:v16];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v12;
      HIWORD(v23) = 2114;
      uint64_t v24 = (uint64_t)v17;
      _os_log_impl(&dword_1AD076000, v13, v14, "creationTimeOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);
    }
    int v18 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v18 timeIntervalSinceReferenceDate];
    double v9 = v19;
  }
  else
  {
    unint64_t v6 = 16 * (a3 + 1);
    unsigned int v7 = [(BMFrameStore *)self frames];
    unint64_t v8 = [v7 size];

    double v9 = 0.0;
    if (v6 <= v8)
    {
      double v10 = [(BMFrameStore *)self frames];
      unint64_t v11 = [v10 end] - v6;

      return *(double *)(v11 + 8);
    }
  }
  return v9;
}

+ (BOOL)writeEmptySegmentHeaderWithFileHandleV2:(id)a3 segmentHeaderSize:(unint64_t *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 32;
  }
  v12[0] = *(_DWORD *)"SEGB";
  v12[1] = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  long long v14 = xmmword_1AD0A1A20;
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v12 length:32];
  id v11 = 0;
  char v7 = [v5 overwriteWithData:v6 error:&v11];
  id v8 = v11;
  if (v8) {
    char v7 = 0;
  }

  if ((v7 & 1) == 0)
  {
    double v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMFrameStore writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:](v5);
    }
  }
  return v7;
}

+ (unsigned)getSegmentVersion:(id)a3 config:(id)a4 stream:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v7 resolvedPathWithStreamIdentifier:a5];
  if (([MEMORY[0x1E4F4FB78] isTestPathOverridden] & 1) != 0
    || ([MEMORY[0x1E4F4FB80] current],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = objc_msgSend(v10, "reliesOnDirectAccessForDomain:", objc_msgSend(v7, "domain")),
        v10,
        v11))
  {
    uint64_t v12 = [MEMORY[0x1E4F4FB68] fileManagerWithDirectAccessToDirectory:v9 cachingOptions:0];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F4FB68] fileManagerWithMediatedAccessToDirectory:v9 useCase:*MEMORY[0x1E4F4FB18] domain:0 user:geteuid()];
  }
  double v13 = (void *)v12;
  long long v14 = [[BMSegmentManager alloc] initWithDirectory:v9 fileManager:v12 permission:0 config:v7];
  double v15 = [(BMSegmentManager *)v14 path];
  BOOL v16 = [v15 stringByAppendingPathComponent:v8];

  char v17 = objc_msgSend(v13, "fileHandleForFileAtPath:flags:protection:error:", v16, 0, objc_msgSend(MEMORY[0x1E4F4FB58], "biomeProtectionClassToOSProtectionClass:", objc_msgSend(v7, "protectionClass")), 0);

  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  if (pread(objc_msgSend(v17, "fd", 0, 0), &v20, 0x38uLL, 0) < 0) {
    unsigned int v18 = -1;
  }
  else {
    unsigned int v18 = v21;
  }

  return v18;
}

- (BOOL)getSegmentHeader:(id *)a3 fromFileV1:(id)a4 fileSize:(unint64_t *)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  memset(&v16.st_size, 0, 48);
  if (fstat(objc_msgSend(v7, "fd", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v16))
  {
    __error();
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.6();
    }
LABEL_4:

LABEL_24:
    BOOL v13 = 0;
    goto LABEL_25;
  }
  if (!v16.st_size)
  {
    double v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:](v7);
    }
    goto LABEL_23;
  }
  if (v16.st_size <= 0x37uLL)
  {
    double v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:](v7);
    }
LABEL_23:

    goto LABEL_24;
  }
  v20[0] = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  __long long buf = 0u;
  ssize_t v10 = pread([v7 fd], &__buf, 0x38uLL, 0);
  if (v10 < 0)
  {
    __error();
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:]();
    }
    goto LABEL_4;
  }
  if (v10 != 56)
  {
    double v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.5(v7);
    }
    goto LABEL_23;
  }
  uint64_t v11 = 52;
  if (v18 == 9)
  {
    p_long long buf = (long long *)((char *)v20 + 4);
  }
  else
  {
    uint64_t v11 = 0;
    p_long long buf = &__buf;
  }
  if (*(_DWORD *)((char *)&__buf + v11) != 1111967059)
  {
    double v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore getSegmentHeader:fromFileV1:fileSize:].cold.4(p_buf, v7, v9);
    }
    goto LABEL_23;
  }
  if (a5) {
    *a5 = v16.st_size;
  }
  if (a3)
  {
    long long v15 = v18;
    *(_OWORD *)a3->var0.var0 = __buf;
    *(_OWORD *)&a3->var2.var3 = v15;
    *((_OWORD *)&a3->var2 + 2) = v19;
    *((void *)&a3->var2 + 6) = v20[0];
  }
  BOOL v13 = 1;
LABEL_25:

  return v13;
}

uint64_t __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __77__BMFrameStore_writeEmptyFrameStoreWithFileHandle_fileSize_datastoreVersion___block_invoke_32(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (BOOL)writeEmptySegmentHeaderWithFileHandleV1:(id)a3 segmentHeaderSize:(unint64_t *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = v5;
  if (a4) {
    *a4 = 56;
  }
  id v7 = [v5 attributes];
  id v8 = [v7 filename];
  double v9 = v8;
  memset(v22, 0, sizeof(v22));
  int v23 = 1111967059;
  v20[0] = 56;
  v20[1] = 0;
  int v21 = 9;
  if (v8)
  {
    size_t v10 = strlen((const char *)[v8 UTF8String]);
    if (v10 >= 0x20)
    {
      uint64_t v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[BMFrameStore writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:]();
      }

      size_t v10 = 31;
    }
    __memcpy_chk();
    bzero((char *)v22 + v10, 32 - v10);
  }
  else
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AD076000, v12, OS_LOG_TYPE_INFO, "No segment name provided for the segment header", buf, 2u);
    }
  }
  BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v20 length:56];
  id v18 = 0;
  char v14 = [v6 overwriteWithData:v13 error:&v18];
  id v15 = v18;
  if (v15) {
    char v14 = 0;
  }

  if ((v14 & 1) == 0)
  {
    stat v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[BMFrameStore writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:](v6);
    }
  }
  return v14;
}

uint64_t __63__BMFrameStore_initWithFileHandle_permission_datastoreVersion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BMFrameStore)initWithFileHandleV1:(id)a3 permission:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMFrameStore;
  id v7 = [(BMFrameStore *)&v45 init];
  uint64_t v8 = (uint64_t)v7;
  if (!v7) {
    goto LABEL_51;
  }
  [(BMFrameStore *)v7 setBackingFile:v6];
  *(_DWORD *)(v8 + 28) = 9;
  unint64_t v44 = 0;
  uint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  if (([(id)v8 getSegmentHeader:&v48 fromFileV1:v6 fileSize:&v44] & 1) == 0)
  {
    uint64_t v11 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v47) = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (initWithFileHandleV1_permission__onceToken != -1) {
      dispatch_once(&initWithFileHandleV1_permission__onceToken, block);
    }
    os_log_type_t v12 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v11, v12)) {
      goto LABEL_18;
    }
    BOOL v13 = (void *)MEMORY[0x1E4F4FB78];
    char v14 = [v6 attributes];
    id v15 = [v14 path];
    stat v16 = [v13 privacyPathname:v15];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&buf[4] = v16;
    char v17 = "Cannot create frame store from segment file: %{public}@";
    id v18 = v11;
    os_log_type_t v19 = v12;
    uint32_t v20 = 12;
    goto LABEL_17;
  }
  int v9 = v49;
  *(_DWORD *)(v8 + 28) = v49;
  if (v9 != 9)
  {
    if (v9 == 10)
    {
      size_t v10 = (BMFrameStore *)(id)[(id)v8 initWithFileHandleV2:v6 permission:a4];
LABEL_52:
      uint64_t v8 = (uint64_t)v10;
      id v29 = v10;
      goto LABEL_53;
    }
    uint64_t v11 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v47) = 16;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke_35;
    v42[3] = &unk_1E5E78708;
    v42[4] = buf;
    if (initWithFileHandleV1_permission__onceToken_34 != -1) {
      dispatch_once(&initWithFileHandleV1_permission__onceToken_34, v42);
    }
    os_log_type_t v26 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (!os_log_type_enabled(v11, v26)) {
      goto LABEL_18;
    }
    unint64_t v27 = (void *)MEMORY[0x1E4F4FB78];
    char v14 = [*(id *)(v8 + 64) attributes];
    id v15 = [v14 path];
    stat v16 = [v27 privacyPathname:v15];
    int v28 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)long long buf = 138543874;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v49;
    *(_WORD *)&buf[18] = 1026;
    *(_DWORD *)&buf[20] = v28;
    char v17 = "Segment version of %{public}@ doesn't match expected versions. Header set to %{public}d, preferred %{public}d.";
    id v18 = v11;
    os_log_type_t v19 = v26;
    uint32_t v20 = 24;
LABEL_17:
    _os_log_impl(&dword_1AD076000, v18, v19, v17, buf, v20);

    goto LABEL_18;
  }
  uint64_t v21 = v44;
  if ((unint64_t)v48 <= v44)
  {
    if (a4 == 1 && v44 - 1 < (unint64_t)v48)
    {
      uint64_t v11 = __biome_log_for_category();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      char v30 = (void *)MEMORY[0x1E4F4FB78];
      int v23 = [*(id *)(v8 + 64) attributes];
      uint64_t v24 = [v23 path];
      char v25 = [v30 privacyPathname:v24];
      *(_DWORD *)long long buf = 138543874;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2048;
      unint64_t v47 = v44;
      _os_log_impl(&dword_1AD076000, v11, OS_LOG_TYPE_INFO, "Attempted to open %{public}@ for writing but the file is already full, byteUsed:%llu, fileSize:%zu", buf, 0x20u);
LABEL_24:

      goto LABEL_18;
    }
    if (!((unint64_t)v48 | a4 & 0xFFFFFFFFFFFFFFFDLL))
    {
      uint64_t v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore initWithFileHandleV1:permission:](v8);
      }
      goto LABEL_18;
    }
    *(void *)(v8 + 40) = v44;
    *(void *)(v8 + 72) = a4;
    uint64_t v31 = memoryMappingsForPermissionV1(a4, (uint64_t *)&v48, v21);
    uint64_t v32 = [v31 lastObject];
    id v33 = *(void **)(v8 + 56);
    *(void *)(v8 + 56) = v32;

    if ((unint64_t)[v31 count] >= 2)
    {
      uint64_t v34 = [v31 firstObject];
      id v35 = *(void **)(v8 + 48);
      *(void *)(v8 + 48) = v34;
    }
    int v36 = *(void **)(v8 + 48);
    if (a4 && !v36)
    {
      v37 = __biome_log_for_category();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore initWithFileHandleV1:permission:].cold.5();
      }

      int v36 = *(void **)(v8 + 48);
    }
    if (v36 && ([v36 mapWithFileHandle:*(void *)(v8 + 64) fileSize:v44] & 1) == 0)
    {
      id v38 = __biome_log_for_category();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore initWithFileHandleV1:permission:].cold.4();
      }
    }
    if (([*(id *)(v8 + 56) mapWithFileHandle:*(void *)(v8 + 64) fileSize:v44] & 1) == 0)
    {
      uint64_t v39 = __biome_log_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore initWithFileHandleV1:permission:]();
      }

      goto LABEL_19;
    }
    if (*(_DWORD *)(v8 + 28) == 9) {
      *(void *)(v8 + 80) = *((void *)&v48 + 1);
    }
    if (!+[BMFrameStore expectedTimestamp:](BMFrameStore, "expectedTimestamp:"))
    {
      unsigned int v40 = __biome_log_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore initWithFileHandleV1:permission:]();
      }

      *(CFAbsoluteTime *)(v8 + 80) = CFAbsoluteTimeGetCurrent();
    }

LABEL_51:
    size_t v10 = (BMFrameStore *)(id)v8;
    goto LABEL_52;
  }
  uint64_t v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    long long v22 = (void *)MEMORY[0x1E4F4FB78];
    int v23 = [*(id *)(v8 + 64) attributes];
    uint64_t v24 = [v23 path];
    char v25 = [v22 privacyPathname:v24];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2050;
    unint64_t v47 = v44;
    _os_log_error_impl(&dword_1AD076000, v11, OS_LOG_TYPE_ERROR, "Segment header in %{public}@ says file size is %{public}llu but that is larger than the actual file size(%{public}lu).", buf, 0x20u);
    goto LABEL_24;
  }
LABEL_18:

LABEL_19:
  id v29 = 0;
LABEL_53:

  return v29;
}

uint64_t __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __48__BMFrameStore_initWithFileHandleV1_permission___block_invoke_35(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (id)_printablePath
{
  cachedPrintablePath = self->_cachedPrintablePath;
  if (!cachedPrintablePath)
  {
    int v4 = (void *)MEMORY[0x1E4F4FB78];
    id v5 = [(BMFileHandle *)self->_backingFile attributes];
    id v6 = [v5 path];
    id v7 = [v4 privacyPathname:v6];
    uint64_t v8 = self->_cachedPrintablePath;
    self->_cachedPrintablePath = v7;

    cachedPrintablePath = self->_cachedPrintablePath;
  }
  return cachedPrintablePath;
}

- (BOOL)isValidFrameV1:(void *)a3 expectedState:(unsigned int)a4 copyOfData:(id *)a5 frameStatus:(id)a6 validations:(BOOL)a7 enumerationOptions:(unint64_t)a8 errorCode:(int *)a9
{
  char v52 = a8;
  size_t v10 = self;
  v63[1] = *MEMORY[0x1E4F143B8];
  if ((a3 & 7) != 0)
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"isValidFrame: Frame is not 8-byte aligned:%d", a3);
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v62 = *MEMORY[0x1E4F28568];
    v63[0] = v11;
    BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
    char v14 = (void *)[v12 initWithDomain:@"com.apple.Biome.BMFramestore" code:1 userInfo:v13];

    p_frames = &v10->_frames;
    [(BMMemoryMapping *)v10->_frames end];
    goto LABEL_19;
  }
  BOOL v16 = a7;
  p_frames = &self->_frames;
  uint32_t v20 = [(BMMemoryMapping *)self->_frames end] - ((void)a3 + 32);
  if ((uint64_t)v20 < 0 || a6.var0 > (unint64_t)v20)
  {
    int v23 = (char *)((char *)a3 - (char *)[(BMMemoryMapping *)*p_frames start]);
    uint64_t v24 = (void *)[[NSString alloc] initWithFormat:@"isValidFrame: Frame size:%d runs past the remaining free space in the segment:%td, frame intended to start at offset:%td", a6, v20, v23];
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v60 = *MEMORY[0x1E4F28568];
    uint64_t v61 = v24;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    v26 = size_t v10 = self;
    char v14 = (void *)[v25 initWithDomain:@"com.apple.Biome.BMFramestore" code:2 userInfo:v26];

    goto LABEL_19;
  }
  if (v16 && a6.var1 != a4)
  {
    id v21 = [NSString alloc];
    if (a4 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"BMFrameStateUnknown(%lu)", a4);
      size_t v10 = self;
      long long v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v22 = off_1E5E78868[a4];
      size_t v10 = self;
    }
    if (a6.var1 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"BMFrameStateUnknown(%lu)", HIDWORD(*(unint64_t *)&a6));
      id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v33 = off_1E5E78868[*(uint64_t *)&a6 >> 32];
    }
    uint64_t v34 = (void *)[v21 initWithFormat:@"isValidFrame: Unexpected frame state. Expected: %@, found: %@", v22, v33];

    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v58 = *MEMORY[0x1E4F28568];
    int v59 = v34;
    int v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    char v14 = (void *)[v35 initWithDomain:@"com.apple.Biome.BMFramestore" code:3 userInfo:v36];

    goto LABEL_19;
  }
  if (a5)
  {
    unint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)a3 + 32 length:a6.var0];
    id v28 = *a5;
    *a5 = v27;

    char v14 = 0;
    unsigned int v29 = a4 - 1;
    BOOL v30 = 1;
    if (v29 <= 1 && v16)
    {
      id v31 = *a5;
      uLong v32 = crc32(0, (const Bytef *)[v31 bytes], a6.var0);

LABEL_40:
      size_t v10 = self;
      if (*((_DWORD *)a3 + 6) == v32)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      unint64_t v47 = (void *)[[NSString alloc] initWithFormat:@"Checksums don't match. Header: %u, Generated checksum: %u. Skipping frame.", *((unsigned int *)a3 + 6), v32];
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v56 = *MEMORY[0x1E4F28568];
      uint64_t v57 = v47;
      long long v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      char v14 = (void *)[v48 initWithDomain:@"com.apple.Biome.BMFramestore" code:5 userInfo:v49];

      if (a5)
      {
        id v50 = *a5;
        *a5 = 0;
      }
LABEL_19:
      int v37 = [v14 code];
      if (a9) {
        *a9 = v37;
      }
      if (v37 == 3 || v37 == 5)
      {
        unint64_t v38 = atomic_load((unint64_t *)a3);
        unint64_t v39 = HIDWORD(v38);
        if ((v52 & 1) != 0 && v39 == 3 || (v52 & 2) != 0 && v39 == 2)
        {
          [(BMMemoryMapping *)*p_frames start];
          BOOL v30 = 1;
          goto LABEL_36;
        }
        BOOL v41 = (v39 & 0xFFFFFFFE) == 2;
        uint64_t v40 = [(BMMemoryMapping *)*p_frames start];
        if (v41)
        {
LABEL_35:
          BOOL v30 = 0;
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v40 = [(BMMemoryMapping *)*p_frames start];
      }
      unsigned int v42 = __biome_log_for_category();
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v55) = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __109__BMFrameStore_isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode__onceToken != -1) {
        dispatch_once(&isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode__onceToken, block);
      }
      os_log_type_t v43 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v42, v43))
      {
        unint64_t v44 = [(BMFrameStore *)v10 _printablePath];
        *(_DWORD *)long long buf = 138543874;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = (char *)a3 - v40;
        *(_WORD *)&buf[22] = 2112;
        int v55 = v14;
        _os_log_impl(&dword_1AD076000, v42, v43, "isValidFrame failed, path:%{public}@, offset:%td error:%@", buf, 0x20u);
      }
      goto LABEL_35;
    }
  }
  else
  {
    char v14 = 0;
    unsigned int v46 = a4 - 1;
    BOOL v30 = 1;
    if (v46 <= 1 && v16)
    {
      uLong v32 = crc32(0, (const Bytef *)a3 + 32, a6.var0);
      goto LABEL_40;
    }
  }
LABEL_36:

  return v30;
}

uint64_t __109__BMFrameStore_isValidFrameV1_expectedState_copyOfData_frameStatus_validations_enumerationOptions_errorCode___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)enumerateFromOffset:(unint64_t)a3 withCallback:(id)a4
{
}

- (id)frameWithOffsetV1:(unint64_t)a3 expectedState:(unsigned int)a4
{
  if ((a3 & 7) != 0)
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore frameWithOffsetV1:expectedState:]();
    }
LABEL_10:

    int v9 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)&a4;
  p_frames = &self->_frames;
  if ([(BMMemoryMapping *)self->_frames size] < a3)
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore frameWithOffsetV1:expectedState:]();
    }
    goto LABEL_10;
  }
  if ([(BMMemoryMapping *)*p_frames size] - a3 <= 0x1F)
  {
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore frameWithOffsetV1:expectedState:]();
    }
    goto LABEL_10;
  }
  uint64_t v11 = (char *)([(BMMemoryMapping *)self->_frames start] + a3);
  unint64_t v12 = atomic_load((unint64_t *)v11);
  double v13 = *((double *)v11 + 1);
  long long v27 = *((_OWORD *)v11 + 1);
  id v26 = 0;
  if (v6 == 3) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2 * (v6 == 2);
  }
  BOOL v15 = [(BMFrameStore *)self isValidFrameV1:v11 expectedState:v6 copyOfData:&v26 frameStatus:v12 validations:1 enumerationOptions:v14 errorCode:0];
  int v9 = 0;
  if (v15)
  {
    BOOL v16 = &v11[-[BMFrameStore sizeToNextWord:]((uint64_t)self, v12)];
    char v17 = [BMFrame alloc];
    id v18 = [(BMFileHandle *)self->_backingFile attributes];
    os_log_type_t v19 = [v18 path];
    id v20 = v26;
    id v21 = &v11[-(uint64_t)[(BMMemoryMapping *)self->_frames start]];
    long long v22 = [(BMMemoryMapping *)self->_frames start];
    v24[0] = v12;
    *(double *)&v24[1] = v13;
    long long v25 = v27;
    LODWORD(v23) = HIDWORD(v12);
    int v9 = [(BMFrame *)v17 initWithHeader:v24 storePath:v19 data:v20 framePtr:v11 offset:v21 nextOffset:v16 - v22 + 32 timestamp:v13 datastoreVersion:9 state:v23];
  }
LABEL_11:
  return v9;
}

- (uint64_t)sizeToNextWord:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (*(_DWORD *)(result + 28) != 9)
    {
      int v4 = __biome_log_for_category();
      *(void *)long long buf = 0;
      int v9 = buf;
      uint64_t v10 = 0x2020000000;
      char v11 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__BMFrameStore_sizeToNextWord___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (sizeToNextWord__onceToken != -1) {
        dispatch_once(&sizeToNextWord__onceToken, block);
      }
      os_log_type_t v5 = v9[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v4, v5))
      {
        int v6 = *(_DWORD *)(v3 + 28);
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1AD076000, v4, v5, "sizeToNextWord called with unexpected dataVersion:%d", buf, 8u);
      }
    }
    return (a2 + 7) & 0xFFFFFFF8;
  }
  return result;
}

- (id)frameWithOffset:(unint64_t)a3 expectedState:(unsigned int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    int v6 = [(BMFrameStore *)self frameWithOffsetV2:a3 expectedState:*(void *)&a4];
  }
  else if (datastoreVersion == 9)
  {
    int v6 = [(BMFrameStore *)self frameWithOffsetV1:a3 expectedState:*(void *)&a4];
  }
  else
  {
    id v7 = __biome_log_for_category();
    *(void *)long long buf = 0;
    double v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BMFrameStore_frameWithOffset_expectedState___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (frameWithOffset_expectedState__onceToken != -1) {
      dispatch_once(&frameWithOffset_expectedState__onceToken, block);
    }
    os_log_type_t v8 = v13[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v7, v8))
    {
      unsigned int v9 = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1AD076000, v7, v8, "[BMFrameStore frameWithOffset:expectedState:] with unexpected dataVersion:%d", buf, 8u);
    }

    int v6 = 0;
  }
  return v6;
}

uint64_t __46__BMFrameStore_frameWithOffset_expectedState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)updateFrameStoreIndex
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_datastoreVersion == 9)
  {
    framePointers = self->_framePointers;
    if (framePointers)
    {
      if ([(NSMutableOrderedSet *)framePointers count])
      {
        int v4 = [(NSMutableOrderedSet *)self->_framePointers lastObject];
        os_log_type_t v5 = (unint64_t *)[v4 unsignedLongValue];

        LODWORD(v4) = atomic_load(v5);
        int v6 = [(BMMemoryMapping *)self->_frames start];
        uint64_t v7 = (char *)v5 - v6 + -[BMFrameStore sizeToNextWord:]((uint64_t)self, (int)v4) + 32;
LABEL_12:
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __37__BMFrameStore_updateFrameStoreIndex__block_invoke_65;
        v13[3] = &unk_1E5E787A0;
        v13[4] = self;
        [(BMFrameStore *)self enumerateWithOptions:35 fromOffset:v7 usingBlock:v13];
        return;
      }
    }
    else
    {
      char v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      uint64_t v12 = self->_framePointers;
      self->_framePointers = v11;
    }
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  os_log_type_t v8 = __biome_log_for_category();
  *(void *)long long buf = 0;
  uint64_t v16 = buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 16;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__BMFrameStore_updateFrameStoreIndex__block_invoke;
  block[3] = &unk_1E5E78708;
  block[4] = buf;
  if (updateFrameStoreIndex_onceToken != -1) {
    dispatch_once(&updateFrameStoreIndex_onceToken, block);
  }
  os_log_type_t v9 = v16[24];
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v8, v9))
  {
    unsigned int datastoreVersion = self->_datastoreVersion;
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&buf[4] = datastoreVersion;
    _os_log_impl(&dword_1AD076000, v8, v9, "updateFrameStoreIndex called with unexpected dataVersion:%d", buf, 8u);
  }
}

uint64_t __37__BMFrameStore_updateFrameStoreIndex__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void __37__BMFrameStore_updateFrameStoreIndex__block_invoke_65(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", objc_msgSend(a2, "framePtr"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (int64_t)getReverseOffsetIndex:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_datastoreVersion != 9)
  {
    os_log_type_t v8 = __biome_log_for_category();
    *(void *)long long buf = 0;
    char v15 = buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__BMFrameStore_getReverseOffsetIndex___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (getReverseOffsetIndex__onceToken != -1) {
      dispatch_once(&getReverseOffsetIndex__onceToken, block);
    }
    os_log_type_t v9 = v15[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1AD076000, v8, v9, "updateFrameStoreIndex called with unexpected dataVersion:%d", buf, 8u);
    }

    return -1;
  }
  [(BMFrameStore *)self updateFrameStoreIndex];
  framePointers = self->_framePointers;
  if (!framePointers || ![(NSMutableOrderedSet *)framePointers count]) {
    return -1;
  }
  int v6 = self->_framePointers;
  if (a3 == 0xFFFFFFFF) {
    return [(NSMutableOrderedSet *)self->_framePointers count] - 1;
  }
  char v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", -[BMMemoryMapping start](self->_frames, "start") + a3);
  int64_t v12 = [(NSMutableOrderedSet *)v6 indexOfObject:v11];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  else {
    return v12;
  }
}

uint64_t __38__BMFrameStore_getReverseOffsetIndex___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __59__BMFrameStore_enumerateWithOptions_fromOffset_usingBlock___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)enumerateWithOptionsV1:(unint64_t)a3 fromOffset:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  os_log_type_t v9 = (void (**)(id, void *, char *))a5;
  if (!v9)
  {
    uint64_t v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2, self, @"BMFrameStore.m", 925, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if ([(BMFrameStore *)self bytesUsed] >= 0x38)
  {
    unsigned int v10 = [(BMFrameStore *)self bytesUsed];
    if (a4 != 4294967294)
    {
      if (a4 == 0xFFFFFFFF) {
        unint64_t v11 = 0;
      }
      else {
        unint64_t v11 = a4;
      }
      if ((v11 & 7) != 0)
      {
        int64_t v12 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        unsigned char buf[24] = 16;
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke;
        v114[3] = &unk_1E5E78708;
        v114[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken != -1) {
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken, v114);
        }
        os_log_type_t v13 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&buf[4] = v11;
          _os_log_impl(&dword_1AD076000, v12, v13, "enumerateWithOptions: startingOffset (%lu) is not 8-byte aligned", buf, 0xCu);
        }

        goto LABEL_26;
      }
      unsigned int v14 = v10;
      if (v11 == [(BMMemoryMapping *)self->_frames size]) {
        goto LABEL_26;
      }
      if (v11 > [(BMMemoryMapping *)self->_frames size])
      {
        char v15 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        unsigned char buf[24] = 16;
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_79;
        v113[3] = &unk_1E5E78708;
        v113[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_78 != -1) {
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_78, v113);
        }
        os_log_type_t v16 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v15, v16))
        {
          unint64_t v17 = [(BMMemoryMapping *)self->_frames size];
          uint64_t v18 = (void *)MEMORY[0x1E4F4FB78];
          uint64_t v19 = [(BMFrameStore *)self segmentPath];
          id v20 = [v18 privacyPathname:v19];
          *(_DWORD *)long long buf = 134218498;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&unsigned char buf[24] = v20;
          _os_log_impl(&dword_1AD076000, v15, v16, "enumerateWithOptions: offset (%lu) beyond segment size (%lu) segment:%@", buf, 0x20u);
        }
LABEL_25:

        goto LABEL_26;
      }
      int64_t v21 = v14 - 56;
      if (v11 > v21)
      {
        char v15 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        unsigned char buf[24] = 16;
        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_81;
        v112[3] = &unk_1E5E78708;
        v112[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_80 != -1) {
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_80, v112);
        }
        os_log_type_t v22 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v15, v22))
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F4FB78];
          uint64_t v24 = [(BMFrameStore *)self segmentPath];
          long long v25 = [v23 privacyPathname:v24];
          *(_DWORD *)long long buf = 134218498;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v21;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v25;
          _os_log_impl(&dword_1AD076000, v15, v22, "enumerateWithOptions: offset (%lu) beyond the bytesUsed (%u) segment:%@", buf, 0x1Cu);
        }
        goto LABEL_25;
      }
      if (v11 == v21) {
        goto LABEL_26;
      }
      char v111 = 0;
      id v26 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v26 timeIntervalSinceReferenceDate];
      double v28 = v27;

      unsigned int v29 = [(BMMemoryMapping *)self->_frames start];
      unint64_t v30 = a3 & 8;
      if (!self->_permission && self->_pruneOnAccess && self->_filterByAgeOnRead && self->_maxAge > 0.0)
      {
        char v90 = 0;
        double v28 = CFAbsoluteTimeGetCurrent() - self->_maxAge;
        if ((a3 & 8) == 0) {
          goto LABEL_37;
        }
      }
      else
      {
        char v90 = 1;
        if ((a3 & 8) == 0) {
          goto LABEL_37;
        }
      }
      if (self->_permission)
      {
        id v31 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        unsigned char buf[24] = 16;
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_84;
        v110[3] = &unk_1E5E78708;
        v110[4] = buf;
        uLong v32 = v29;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_83 != -1) {
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_83, v110);
        }
        os_log_type_t v33 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v31, v33))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1AD076000, v31, v33, "Use of reverse enumeration is only supported for reading.", buf, 2u);
        }
        unsigned int v29 = v32;
      }
      else
      {
        int64_t v34 = [(BMFrameStore *)self getReverseOffsetIndex:a4];
        if (v34 != -1) {
          goto LABEL_38;
        }
        id v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&buf[4] = a4;
          _os_log_impl(&dword_1AD076000, v31, OS_LOG_TYPE_INFO, "Reverse enumeration offset not found %zu.", buf, 0xCu);
        }
      }

LABEL_37:
      int64_t v34 = -1;
LABEL_38:
      int64_t v96 = v34;
      if (v111) {
        goto LABEL_26;
      }
      int v100 = 0;
      id v35 = 0;
      unint64_t v85 = v30 >> 3;
      int v97 = 1;
      unint64_t v94 = v21;
      while (1)
      {
        context = (void *)MEMORY[0x1AD11E210]();
        id v109 = 0;
        if (v30)
        {
          if (v96 < 0) {
            goto LABEL_149;
          }
          int v37 = -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_framePointers, "objectAtIndexedSubscript:");
          uint64_t v36 = [v37 integerValue];

          --v96;
        }
        else if (v100)
        {
          uint64_t v36 = (uint64_t)v35 + v11;
        }
        else
        {
          uint64_t v36 = (uint64_t)v29 + v11;
        }
        int64_t v38 = v36 - (unint64_t)[(BMMemoryMapping *)self->_frames start];
        if (v38 >= v21 || (unint64_t)([(BMMemoryMapping *)self->_frames end] - v36) < 0x20)
        {
LABEL_149:

          goto LABEL_26;
        }
        uint64_t v93 = v35;
        unint64_t v39 = atomic_load((unint64_t *)v36);
        unint64_t v40 = HIDWORD(v39);
        long long v108 = 0uLL;
        double v41 = *(double *)(v36 + 8);
        long long v108 = *(_OWORD *)(v36 + 16);
        unint64_t v42 = -[BMFrameStore sizeToNextWord:]((uint64_t)self, v39);
        int64_t v91 = v38;
        int v95 = v40;
        switch((int)v40)
        {
          case 0:
            char v43 = 1;
            int v44 = 1;
            if (!v42)
            {
              char v111 = 1;
              char v43 = 0;
            }
            break;
          case 1:
            char v45 = v90;
            if (v41 >= v28) {
              char v45 = 1;
            }
            char v43 = v45 ^ 1;
            int v44 = 1;
            if ((a3 & 8) != 0 && (v45 & 1) == 0)
            {
              char v43 = 0;
              goto LABEL_65;
            }
            break;
          case 2:
            int v44 = 1;
            char v43 = (a3 & 2) == 0;
            break;
          case 3:
            int v44 = 1;
            char v43 = (a3 & 1) == 0;
            break;
          case 4:
            goto LABEL_64;
          case 5:
            unsigned int v46 = __biome_log_for_category();
            *(void *)long long buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x2020000000;
            unsigned char buf[24] = 16;
            v107[0] = MEMORY[0x1E4F143A8];
            v107[1] = 3221225472;
            v107[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_86;
            v107[3] = &unk_1E5E78708;
            v107[4] = buf;
            if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_85 != -1) {
              dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_85, v107);
            }
            os_log_type_t v47 = *(unsigned char *)(*(void *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            if (os_log_type_enabled(v46, v47))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1AD076000, v46, v47, "Found frame with state: BMFrameStateUnknown", buf, 2u);
            }

LABEL_64:
            char v43 = 0;
            int v44 = 1;
LABEL_65:
            char v111 = 1;
            break;
          default:
            char v43 = 0;
            int v44 = 0;
            break;
        }
        unint64_t v99 = v36 + 32;
        unint64_t v48 = [(BMFrameStore *)self frameStoreSize];
        unint64_t v49 = v48;
        int v50 = v100;
        BOOL v51 = (v100 & 1) == 0 || v48 >= v42;
        uint64_t v52 = 8;
        if (v51) {
          uint64_t v52 = v42;
        }
        uint64_t v92 = v52;
        if (!v44 || v48 < v42) {
          break;
        }
        if (v100) {
          int v53 = 0;
        }
        else {
          int v53 = v100;
        }
        if (v111)
        {
          int v50 = v53;
          unsigned int v29 = (void *)(v36 + 32);
          int v54 = v95;
LABEL_123:
          if ((a3 & 0x10) != 0 || v49 >= v42 && (v54 == 1 || v54 == 4)) {
            goto LABEL_149;
          }
          int v100 = v50;
          if ((unint64_t)v29 - (unint64_t)[(BMMemoryMapping *)self->_frames start] + 8 >= v94) {
            goto LABEL_149;
          }
          char v111 = 0;
          if (v100)
          {
            unint64_t v11 = 8;
            int64_t v21 = v94;
          }
          else
          {
            uint64_t v71 = __biome_log_for_category();
            *(void *)long long buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x2020000000;
            unsigned char buf[24] = 16;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_102;
            block[3] = &unk_1E5E78708;
            block[4] = buf;
            if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_101 != -1) {
              dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_101, block);
            }
            os_log_type_t v72 = *(unsigned char *)(*(void *)&buf[8] + 24);
            _Block_object_dispose(buf, 8);
            int64_t v21 = v94;
            if (os_log_type_enabled(v71, v72))
            {
              id v73 = [(BMFrameStore *)self _printablePath];
              *(_DWORD *)long long buf = 138543362;
              *(void *)&buf[4] = v73;
              _os_log_impl(&dword_1AD076000, v71, v72, "After unrecognized frame in %{public}@, skipping ahead to find valid frames", buf, 0xCu);
            }
            int v100 = 1;
            unint64_t v11 = 8;
            unsigned int v29 = (void *)(v36 + 32);
          }
          goto LABEL_135;
        }
        if ((v43 & 1) == 0)
        {
          unint64_t v59 = atomic_load((unint64_t *)v36);
          unsigned int v104 = 0;
          if ((a3 & 0x20) == 0 && HIDWORD(v59) == 1) {
            uint64_t v60 = &v109;
          }
          else {
            uint64_t v60 = 0;
          }
          int64_t v21 = v94;
          if (-[BMFrameStore isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:](self, "isValidFrameV1:expectedState:copyOfData:frameStatus:validations:enumerationOptions:errorCode:", v36, 1, v60, v59, &v104))
          {
            if (v100)
            {
              uint64_t v61 = [(BMMemoryMapping *)self->_frames start];
              uint64_t v62 = __biome_log_for_category();
              *(void *)long long buf = 0;
              *(void *)&uint8_t buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x2020000000;
              unsigned char buf[24] = 16;
              v103[0] = MEMORY[0x1E4F143A8];
              v103[1] = 3221225472;
              v103[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_104;
              v103[3] = &unk_1E5E78708;
              v103[4] = buf;
              if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_103 != -1) {
                dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_103, v103);
              }
              os_log_type_t v63 = *(unsigned char *)(*(void *)&buf[8] + 24);
              _Block_object_dispose(buf, 8);
              if (os_log_type_enabled(v62, v63))
              {
                uint64_t v101 = v36 - (void)v61;
                unint64_t v64 = [(BMFrameStore *)self _printablePath];
                *(_DWORD *)long long buf = 138543618;
                *(void *)&buf[4] = v64;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v101;
                _os_log_impl(&dword_1AD076000, v62, v63, "After a corrupted frame found a valid frame in %{public}@ at offset: %td", buf, 0x16u);
              }
            }
            if ((a3 & 8) != 0)
            {
              if (v96 < 0) {
                goto LABEL_140;
              }
              os_log_type_t v74 = -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_framePointers, "objectAtIndexedSubscript:");
              uint64_t v75 = [v74 integerValue];
              unint64_t v102 = v75 - (unint64_t)[(BMMemoryMapping *)self->_frames start];
            }
            else
            {
              if ((char *)v99 < [(BMMemoryMapping *)self->_frames end] - v92)
              {
                unint64_t v65 = v99 + v92 - (unint64_t)[(BMMemoryMapping *)self->_frames start];
                goto LABEL_141;
              }
LABEL_140:
              unint64_t v65 = 4294967294;
LABEL_141:
              unint64_t v102 = v65;
            }
            unint64_t v76 = [BMFrame alloc];
            double v77 = [(BMFileHandle *)self->_backingFile attributes];
            unsigned int v78 = [v77 path];
            *(void *)long long buf = v59;
            *(double *)&uint8_t buf[8] = v41;
            *(_OWORD *)&uint8_t buf[16] = v108;
            LODWORD(v83) = HIDWORD(v59);
            unsigned int v79 = [(BMFrame *)v76 initWithHeader:buf storePath:v78 data:v109 framePtr:v36 offset:v91 nextOffset:v102 timestamp:v41 datastoreVersion:9 state:v83];

            id v80 = v109;
            id v109 = 0;

            v9[2](v9, v79, &v111);
            int64_t v21 = v94;
            unint64_t v11 = v92;
          }
          else
          {
            unint64_t v11 = v92;
            if ((a3 & 0x10) == 0 && v104 <= 5 && ((1 << v104) & 0x2C) != 0)
            {
              if ((v53 & 1) == 0) {
                int v53 = 1;
              }
              unint64_t v11 = 8;
            }
          }

          int v100 = v53;
          unsigned int v29 = (void *)(v36 + 32);
          goto LABEL_136;
        }
        int v100 = v53;
        int64_t v21 = v94;
        unsigned int v29 = (void *)(v36 + 32);
        unint64_t v11 = v52;
LABEL_135:

LABEL_136:
        ++v97;
        id v35 = (unint64_t *)v36;
        unint64_t v30 = a3 & 8;
        if (v111) {
          goto LABEL_26;
        }
      }
      if (v100)
      {
        unsigned int v29 = (void *)(v36 + 32);
        int v54 = v95;
      }
      else
      {
        if (v93)
        {
          unint64_t v55 = atomic_load(v93);
          unsigned int v88 = -[BMFrameStore sizeToNextWord:]((uint64_t)self, v55);
          if (HIDWORD(v55) == 1)
          {
            *(void *)long long buf = 0;
            LODWORD(v87) = 1;
            BOOL v56 = [(BMFrameStore *)self isValidFrameV1:v93 expectedState:1 copyOfData:buf frameStatus:v55 | 0x100000000 validations:1 enumerationOptions:a3 errorCode:0];
            uint64_t v57 = @"Not Valid";
            if (v56) {
              uint64_t v57 = @"Valid";
            }
            int v89 = v57;
            uint64_t v58 = *(void **)buf;
            *(void *)long long buf = 0;
          }
          else
          {
            unint64_t v87 = HIDWORD(v55);
            int v89 = @"Not Checked";
          }
        }
        else
        {
          unsigned int v88 = 0;
          LODWORD(v87) = 5;
          int v89 = @"Not Checked";
        }
        uint64_t v66 = __biome_log_for_category();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v81 = [(BMFrameStore *)self _printablePath];
          *(_DWORD *)long long buf = 67109378;
          *(_DWORD *)&buf[4] = v95;
          *(_WORD *)&uint8_t buf[8] = 2114;
          *(void *)&buf[10] = v81;
          _os_log_error_impl(&dword_1AD076000, v66, OS_LOG_TYPE_ERROR, "Unrecognized frame state:%d in segment: %{public}@", buf, 0x12u);
        }
        uint64_t v67 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        unsigned char buf[24] = 16;
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_97;
        v106[3] = &unk_1E5E78708;
        v106[4] = buf;
        if (enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_96 != -1) {
          dispatch_once(&enumerateWithOptionsV1_fromOffset_usingBlock__onceToken_96, v106);
        }
        os_log_type_t v68 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v67, v68))
        {
          uint64_t v69 = [(BMFrameStore *)self _printablePath];
          id v86 = (void *)v69;
          if (v93)
          {
            if (v87 >= 6)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"BMFrameStateUnknown(%lu)", v87);
              os_log_type_t v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
              int v70 = v84;
              uint64_t v69 = (uint64_t)v86;
            }
            else
            {
              int v70 = off_1E5E78868[(int)v87];
              os_log_type_t v84 = v70;
            }
          }
          else
          {
            int v70 = @"no prev frame";
          }
          *(_DWORD *)long long buf = 67111426;
          *(_DWORD *)&buf[4] = v95;
          *(_WORD *)&uint8_t buf[8] = 2114;
          *(void *)&buf[10] = v69;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v91;
          *(_WORD *)&unsigned char buf[28] = 2048;
          *(void *)&buf[30] = v92;
          __int16 v116 = 1024;
          int v117 = v85;
          __int16 v118 = 1024;
          int v119 = v97;
          __int16 v120 = 2114;
          id v121 = v70;
          __int16 v122 = 2114;
          v123 = v89;
          __int16 v124 = 2048;
          unint64_t v125 = v11;
          __int16 v126 = 2048;
          uint64_t v127 = v88;
          _os_log_impl(&dword_1AD076000, v67, v68, "Unrecognized frame state: %d, segment:%{public}@ frame offset:%td frame size:%zu reverse:%d, frameCount=%d, prevFrameState:%{public}@, prevFrameValid:%{public}@ prevLastSize/offset:%zu prevStateSize:%zu", buf, 0x5Au);
          if (v93) {
        }
          }
        int v54 = v95;

        unsigned int v29 = (void *)(v36 + 32);
        int v50 = v100;
      }
      char v111 = 1;
      goto LABEL_123;
    }
  }
LABEL_26:
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_79(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_81(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_84(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_86(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_97(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_102(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__BMFrameStore_enumerateWithOptionsV1_fromOffset_usingBlock___block_invoke_104(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)updateHeader
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(v1 + 64) attributes];
  id v3 = [v2 filename];
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_1AD076000, v0, OS_LOG_TYPE_DEBUG, "Frame store: %@, bytesUsed: %llu", v4, 0x16u);
}

uint64_t __28__BMFrameStore_updateHeader__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

BOOL __28__BMFrameStore_updateHeader__block_invoke_105(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return a3 > a2;
}

BOOL __28__BMFrameStore_updateHeader__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)&a3 > *(double *)&a2;
}

- (unsigned)appendFrameHeaderV1:(id *)a3 offset:(unint64_t *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_datastoreVersion != 9)
  {
    uint64_t v19 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v29) = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__BMFrameStore_appendFrameHeaderV1_offset___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (appendFrameHeaderV1_offset__onceToken != -1) {
      dispatch_once(&appendFrameHeaderV1_offset__onceToken, block);
    }
    os_log_type_t v20 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v19, v20))
    {
      unsigned int datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1AD076000, v19, v20, "-[BMFrameStore appendFrameHeaderV1:offset:] called with unexpected dataVersion:%d", buf, 8u);
    }

    return 1;
  }
  uint64_t v26 = 0;
  uint64_t v7 = -[BMFrameStore sizeToNextWord:]((uint64_t)self, a3->var0.var0.var0) + 32;
  if ([(BMMemoryMapping *)self->_frames atomicWriteEightBytes:a3->var0.var1 toOffset:*a4 expected:&v26] == 1)
  {
LABEL_10:
    [(BMMemoryMapping *)self->_frames updateToMaxOfCurrentWriteOffsetAnd:v7 + *a4];
    self->_lastAbsoluteTimestamp = a3->var1.var0;
    double var0 = a3->var1.var0;
    unsigned int v14 = [(BMMemoryMapping *)self->_frames start];
    unint64_t v15 = *a4;
    uint64_t v16 = *(void *)&v14[*a4 + 8];
    uint64_t v25 = v16;
    int v17 = [(BMMemoryMapping *)self->_frames atomicWriteEightBytes:*(void *)&var0 toOffset:v15 + 8 expected:&v25];
    if (v17 == 1)
    {
      [(BMMemoryMapping *)self->_frames writeBytes:&a3->var1.var1 toOffset:*a4 + 16 length:16];
      return 2 * (a3->var0.var0.var1 == 4);
    }
    int v22 = v17;
    uint64_t v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 1024;
      int v29 = v22;
      _os_log_error_impl(&dword_1AD076000, v23, OS_LOG_TYPE_ERROR, "Unable to update creationTimestamp. We expect to see %llu, but instead are seeing %llu. The write status is %d", buf, 0x1Cu);
    }

    return 1;
  }
  while (1)
  {
    double v8 = *(double *)([(BMMemoryMapping *)self->_frames start] + *a4 + 8);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (v8 >= Current) {
      CFAbsoluteTime Current = v8;
    }
    a3->var1.double var0 = Current;
    a3->var1.double var1 = Current;
    if (HIDWORD(v26) == 4) {
      return 2;
    }
    unint64_t v10 = *a4;
    *a4 = v10 + -[BMFrameStore sizeToNextWord:]((uint64_t)self, v26) + 32;
    uint64_t v26 = 0;
    if (!-[BMMemoryMapping isValidReadFromOffset:withLength:](self->_frames, "isValidReadFromOffset:withLength:"))
    {
      if (![(BMMemoryMapping *)self->_frames isValidReadFromOffset:*a4 withLength:32])
      {
        uint64_t v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[BMFrameStore appendFrameHeaderV1:offset:]();
        }

        return 2;
      }
      unsigned int v11 = [(BMMemoryMapping *)self->_frames size] - *(_DWORD *)a4 - 32;
      double v12 = a3->var1.var0;
      a3->var0.var0.double var0 = v11;
      a3->var0.var0.double var1 = 4;
      a3->var1.double var1 = v12;
      *(void *)&a3->var1.var2 = 0;
    }
    if ([(BMMemoryMapping *)self->_frames atomicWriteEightBytes:a3->var0.var1 toOffset:*a4 expected:&v26] == 1)goto LABEL_10; {
  }
    }
}

uint64_t __43__BMFrameStore_appendFrameHeaderV1_offset___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (BOOL)offsetIsStartOfFrameStore:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  return [(BMFrameStore *)self datastoreVersion] == 10
      && [(BMFrameStore *)self frameStoreSize] - 48 == a3;
}

- (unsigned)writeFrameForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6
{
  return [(BMFrameStore *)self writeFrameForBytes:a3 length:a4 dataVersion:*(void *)&a5 timestamp:0 outOffset:a6];
}

- (unsigned)writeFrameV1ForBytes:(const void *)a3 length:(unint64_t)a4 dataVersion:(unsigned int)a5 timestamp:(double)a6 outOffset:(unint64_t *)a7
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  double v12 = self;
  objc_sync_enter(v12);
  if (a4 >> 31)
  {
    os_log_type_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:](a4, v13);
    }
LABEL_27:

LABEL_28:
    LOBYTE(v15) = 1;
    goto LABEL_29;
  }
  if (!a4)
  {
    os_log_type_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]();
    }
    goto LABEL_27;
  }
  if (a4 + 88 <= v12->_frameStoreSize)
  {
    if (![(BMMemoryMapping *)v12->_header start])
    {
      os_log_type_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.4();
      }
      goto LABEL_27;
    }
    uint64_t v47 = 0;
    uint64_t v47 = [(BMMemoryMapping *)v12->_frames currentWriteOffset];
    if ([(BMMemoryMapping *)v12->_frames isValidReadFromOffset:v47 withLength:a4 + 32])
    {
      if (v12->_lastAbsoluteTimestamp > a6)
      {
        if ([(BMFrameStore *)v12 isRemoteSegment]
          && ![(BMFrameStore *)v12 isTombstoneSegment])
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          [v21 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
          int v22 = __biome_log_for_category();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            double lastAbsoluteTimestamp = v12->_lastAbsoluteTimestamp;
            int v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a6];
            id v45 = [v21 stringFromDate:v44];
            char v43 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v12->_lastAbsoluteTimestamp];
            id v38 = [v21 stringFromDate:v43];
            unint64_t v39 = (void *)MEMORY[0x1E4F4FB78];
            unint64_t v40 = [(BMFrameStore *)v12 segmentPath];
            double v41 = [v39 privacyPathname:v40];
            *(_DWORD *)long long buf = 136316418;
            *(void *)&buf[4] = "-[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]";
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = a6;
            *(_WORD *)&buf[22] = 2048;
            unint64_t v55 = *(void *)&lastAbsoluteTimestamp;
            __int16 v56 = 2112;
            id v57 = v45;
            __int16 v58 = 2112;
            id v59 = v38;
            __int16 v60 = 2114;
            uint64_t v61 = v41;
            _os_log_error_impl(&dword_1AD076000, v22, OS_LOG_TYPE_ERROR, "[%s] WARNING (remote data) frame should come in chronological order. Input %f < last %f, (%@ < %@) segment:%{public}@", buf, 0x3Eu);
          }
        }
        else
        {
          if (v12->_lastAbsoluteTimestamp - a6 >= 3.0) {
            goto LABEL_22;
          }
          double v16 = CFAbsoluteTimeGetCurrent() - a6;
          if (v16 < 0.0) {
            double v16 = -v16;
          }
          if (v16 > 60.0)
          {
LABEL_22:
            id v17 = objc_alloc_init(MEMORY[0x1E4F28C10]);
            [v17 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            uint64_t v18 = __biome_log_for_category();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              double v30 = v12->_lastAbsoluteTimestamp;
              id v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a6];
              id v32 = [v17 stringFromDate:v31];
              os_log_type_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v12->_lastAbsoluteTimestamp];
              id v34 = [v17 stringFromDate:v33];
              id v35 = (void *)MEMORY[0x1E4F4FB78];
              uint64_t v36 = [(BMFrameStore *)v12 segmentPath];
              int v37 = [v35 privacyPathname:v36];
              *(_DWORD *)long long buf = 136316418;
              *(void *)&buf[4] = "-[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]";
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = a6;
              *(_WORD *)&buf[22] = 2048;
              unint64_t v55 = *(void *)&v30;
              __int16 v56 = 2112;
              id v57 = v32;
              __int16 v58 = 2112;
              id v59 = v34;
              __int16 v60 = 2114;
              uint64_t v61 = v37;
              _os_log_error_impl(&dword_1AD076000, v18, OS_LOG_TYPE_ERROR, "[%s] Frame should come in chronological order. Input %f < last %f, (%@ < %@) segment:%{public}@", buf, 0x3Eu);
            }
            goto LABEL_28;
          }
          a6 = v12->_lastAbsoluteTimestamp + 0.0000001;
        }
      }
      unsigned int v23 = crc32(0, (const Bytef *)a3, a4);
      *(_DWORD *)long long buf = a4;
      *(_DWORD *)&buf[4] = 0;
      *(double *)&uint8_t buf[8] = a6;
      *(double *)&uint8_t buf[16] = a6;
      unint64_t v55 = __PAIR64__(a5, v23);
      unsigned int v15 = [(BMFrameStore *)v12 appendFrameHeaderV1:buf offset:&v47];
      if (v15)
      {
        uint64_t v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v25 = NSStringFromBMFrameWriteStatus(v15);
          -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:].cold.5(v25, v48, v24);
        }
      }
      else
      {
        [(BMMemoryMapping *)v12->_frames writeBytes:a3 toOffset:v47 + 32 length:a4];
        uint64_t v46 = *(void *)buf;
        *(_DWORD *)&buf[4] = 1;
        uint64_t v26 = *(void *)buf;
        int v27 = [(BMMemoryMapping *)v12->_frames atomicWriteEightBytes:*(void *)buf toOffset:v47 expected:&v46];
        [(BMFrameStore *)v12 updateHeader];
        if (v27 != 1)
        {
          int v29 = __biome_log_for_category();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)unint64_t v48 = 134218496;
            uint64_t v49 = v46;
            __int16 v50 = 2048;
            uint64_t v51 = v26;
            __int16 v52 = 1024;
            int v53 = v27;
            _os_log_error_impl(&dword_1AD076000, v29, OS_LOG_TYPE_ERROR, "Unable to update status to written, someone else seems to have overwritten the value. We expect to see %llu, but instead are seeing %llu. The write status is %d", v48, 0x1Cu);
          }

          goto LABEL_28;
        }
        if (a7)
        {
          uint64_t v28 = [(BMMemoryMapping *)v12->_frames offset];
          LOBYTE(v15) = 0;
          *a7 = v47 + v28;
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
    }
    else
    {
      if ([(BMMemoryMapping *)v12->_frames isValidReadFromOffset:v47 withLength:32])
      {
        *(_DWORD *)long long buf = [(BMMemoryMapping *)v12->_frames freeSpace] - 32;
        *(_DWORD *)&buf[4] = 4;
        *(double *)&uint8_t buf[8] = a6;
        *(double *)&uint8_t buf[16] = a6;
        unint64_t v55 = 0;
        [(BMFrameStore *)v12 appendFrameHeaderV1:buf offset:&v47];
      }
      os_log_type_t v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BMFrameStore appendFrameHeaderV1:offset:]();
      }

      LOBYTE(v15) = 2;
    }
  }
  else
  {
    unsigned int v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:]();
    }

    LOBYTE(v15) = 3;
  }
LABEL_29:
  objc_sync_exit(v12);

  return v15;
}

uint64_t __74__BMFrameStore_writeFrameForBytes_length_dataVersion_timestamp_outOffset___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (int)frameCount
{
  if ([(BMFrameStore *)self datastoreVersion] == 9)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    int v9 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__BMFrameStore_frameCount__block_invoke;
    v5[3] = &unk_1E5E787E8;
    v5[4] = &v6;
    [(BMFrameStore *)self enumerateFromOffset:0 withCallback:v5];
    int v3 = *((_DWORD *)v7 + 6);
    _Block_object_dispose(&v6, 8);
    return v3;
  }
  if ([(BMFrameStore *)self datastoreVersion] != 10) {
    return 0;
  }
  return [(BMFrameStore *)self frameCountV2];
}

uint64_t __26__BMFrameStore_frameCount__block_invoke(uint64_t result)
{
  return result;
}

- (int)frameCountFromStartTime:(double)a3 endTime:(double)a4
{
  if ([(BMFrameStore *)self datastoreVersion] == 9)
  {
    uint64_t v10 = 0;
    unsigned int v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__BMFrameStore_frameCountFromStartTime_endTime___block_invoke;
    v9[3] = &unk_1E5E78810;
    *(double *)&v9[5] = a4;
    *(double *)&v9[6] = a3;
    v9[4] = &v10;
    [(BMFrameStore *)self enumerateFromOffset:0 withCallback:v9];
    int v7 = *((_DWORD *)v11 + 6);
    _Block_object_dispose(&v10, 8);
    return v7;
  }
  if ([(BMFrameStore *)self datastoreVersion] != 10) {
    return 0;
  }
  return [(BMFrameStore *)self frameCountFromStartTimeV2:a3 endTime:a4];
}

void __48__BMFrameStore_frameCountFromStartTime_endTime___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  [v7 creationTimestamp];
  if (v5 <= *(double *)(a1 + 40))
  {
    [v7 creationTimestamp];
    if (v6 >= *(double *)(a1 + 48)) {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  else
  {
    *a3 = 1;
  }
}

- (void)markFrameAsRemoved:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int datastoreVersion = self->_datastoreVersion;
  if (datastoreVersion == 10)
  {
    [(BMFrameStore *)self markFrameAsRemovedV2:v4];
  }
  else if (datastoreVersion == 9)
  {
    [(BMFrameStore *)self markFrameAsRemovedV1:v4];
  }
  else
  {
    double v6 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v15 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__BMFrameStore_markFrameAsRemoved___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (markFrameAsRemoved__onceToken != -1) {
      dispatch_once(&markFrameAsRemoved__onceToken, block);
    }
    os_log_type_t v7 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F4FB78];
      int v9 = [(BMFileHandle *)self->_backingFile attributes];
      uint64_t v10 = [v9 path];
      unsigned int v11 = [v8 privacyPathname:v10];
      uint64_t v12 = self->_datastoreVersion;
      *(_DWORD *)long long buf = 138543618;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1AD076000, v6, v7, "Segment version of %{public}@ doesn't match expected versions: %lu.", buf, 0x16u);
    }
  }
}

uint64_t __35__BMFrameStore_markFrameAsRemoved___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)markFrameAsRemovedV1:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  rsize_t v6 = atomic_load((unint64_t *)[v4 framePtr]);
  os_log_type_t v7 = (atomic_ullong *)[v4 framePtr];
  unint64_t v8 = v6 | 0x200000000;
  rsize_t v9 = v6;
  atomic_compare_exchange_strong(v7, &v9, v8);
  if (v9 == v6)
  {
    uint64_t v10 = [v4 framePtr];
    uint64_t v11 = [v4 framePtr];
    rsize_t v6 = v6;
    *(_DWORD *)(v10 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    errno_t v12 = memset_s((void *)(v11 + 32), v6, 0, v6);
    if (v12)
    {
      int v13 = __biome_log_for_category();
      *(void *)long long buf = 0;
      uint64_t v18 = buf;
      uint64_t v19 = 0x2020000000;
      char v20 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__BMFrameStore_markFrameAsRemovedV1___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (markFrameAsRemovedV1__onceToken != -1) {
        dispatch_once(&markFrameAsRemovedV1__onceToken, block);
      }
      os_log_type_t v14 = v18[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&buf[4] = v12;
        _os_log_impl(&dword_1AD076000, v13, v14, "Failed to zero out memory. %{public, darwin.errno}d", buf, 8u);
      }
    }
    else
    {
      uint64_t v15 = v6 | 0x200000000;
      atomic_compare_exchange_strong(v7, (unint64_t *)&v15, v6 | 0x300000000);
      if (v15 == v8) {
        goto LABEL_10;
      }
      int v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore markFrameAsRemovedV1:]();
      }
    }
  }
  else
  {
    int v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore markFrameAsRemovedV1:]();
    }
  }

LABEL_10:
  objc_sync_exit(v5);
}

uint64_t __37__BMFrameStore_markFrameAsRemovedV1___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __31__BMFrameStore_sizeToNextWord___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (unint64_t)maxEventsPerFrameStoreVersion:(unint64_t)a3 averageEventSize:(unint64_t)a4 segmentSize:(unint64_t)a5
{
  uint64_t v5 = 3;
  if (a3 == 9) {
    uint64_t v5 = 7;
  }
  uint64_t v6 = -4;
  if (a3 == 9) {
    uint64_t v6 = -8;
  }
  uint64_t v7 = -32;
  if (a3 == 9) {
    uint64_t v7 = -56;
  }
  uint64_t v8 = 24;
  if (a3 == 9) {
    uint64_t v8 = 32;
  }
  return (v7 + a5) / (v8 + ((v5 + a4) & v6));
}

- (BOOL)isRemoteSegment
{
  return self->_isRemoteSegment;
}

- (BOOL)isTombstoneSegment
{
  return self->_isTombstoneSegment;
}

- (BOOL)filterByAgeOnRead
{
  return self->_filterByAgeOnRead;
}

- (double)maxAge
{
  return self->_maxAge;
}

- (NSString)cachedPrintablePathV2
{
  return self->_cachedPrintablePathV2;
}

- (void)setCachedPrintablePathV2:(id)a3
{
}

- (unsigned)bytesUsed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(BMFrameStore *)self datastoreVersion] == 9)
  {
    return [(BMFrameStore *)self bytesUsedV1];
  }
  else if ([(BMFrameStore *)self datastoreVersion] == 10)
  {
    return [(BMFrameStore *)self bytesUsedV2];
  }
  else
  {
    id v4 = __biome_log_for_category();
    *(void *)long long buf = 0;
    rsize_t v9 = buf;
    uint64_t v10 = 0x2020000000;
    char v11 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__BMFrameStore_Inspection__bytesUsed__block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (bytesUsed_onceToken != -1) {
      dispatch_once(&bytesUsed_onceToken, block);
    }
    os_log_type_t v5 = v9[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v4, v5))
    {
      unsigned int datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1AD076000, v4, v5, "bytesUsed called with a framestore with an unexpected datastoreVersion:%d", buf, 8u);
    }

    return [(BMFrameStore *)self frameStoreSize];
  }
}

uint64_t __37__BMFrameStore_Inspection__bytesUsed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)bytesUsedV1
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  if ([(BMMemoryMapping *)self->_header atomicReadAtOffset:0 value:&v8] == 1) {
    return v8;
  }
  id v4 = __biome_log_for_category();
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v10 = 16;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BMFrameStore_Inspection__bytesUsedV1__block_invoke;
  v7[3] = &unk_1E5E78708;
  v7[4] = buf;
  if (bytesUsedV1_onceToken != -1) {
    dispatch_once(&bytesUsedV1_onceToken, v7);
  }
  os_log_type_t v5 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (os_log_type_enabled(v4, v5))
  {
    header = self->_header;
    *(_DWORD *)long long buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = header;
    _os_log_impl(&dword_1AD076000, v4, v5, "Unable to atomically read the bytesUsed value from the frame header %@ %@", buf, 0x16u);
  }

  return 0;
}

uint64_t __39__BMFrameStore_Inspection__bytesUsedV1__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)bytesUsedV2
{
  unsigned int v3 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  id v4 = [(BMFrameStore *)self frames];
  os_log_type_t v5 = (_DWORD *)([v4 end] - (int)(16 * v3));

  return ((*v5 + 3) & 0xFFFFFFFC) + 16 * v3 + 32;
}

- (BOOL)isCheckSumValidAtOffsetV1:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_datastoreVersion != 9)
  {
    uint64_t v8 = __biome_log_for_category();
    *(void *)long long buf = 0;
    int v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__BMFrameStore_Inspection__isCheckSumValidAtOffsetV1___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (isCheckSumValidAtOffsetV1__onceToken != -1) {
      dispatch_once(&isCheckSumValidAtOffsetV1__onceToken, block);
    }
    os_log_type_t v9 = v13[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v8, v9))
    {
      unsigned int datastoreVersion = self->_datastoreVersion;
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = datastoreVersion;
      _os_log_impl(&dword_1AD076000, v8, v9, "isCheckSumValidAtOffsetV1 called with unexpected dataVersion:%d", buf, 8u);
    }

    return 0;
  }
  if ((a3 & 7) != 0) {
    return 0;
  }
  os_log_type_t v5 = [(BMMemoryMapping *)self->_frames start] + a3;
  if ((char *)((unint64_t)v5 + 8) > [(BMMemoryMapping *)self->_frames end]) {
    return 0;
  }
  unint64_t v6 = atomic_load((unint64_t *)v5);
  if (a3 + v6 > [(BMMemoryMapping *)self->_frames size]) {
    return 0;
  }
  return HIDWORD(v6) != 1 || *((_DWORD *)v5 + 6) == crc32(0, (const Bytef *)v5 + 32, v6);
}

uint64_t __54__BMFrameStore_Inspection__isCheckSumValidAtOffsetV1___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __43__BMFrameStore_V2__atomicReadTotalFramesV2__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (int)frameNumberFromFrameOffsetV2:(unsigned int)a3
{
  uint64_t v5 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (!v5) {
    return -1;
  }
  int v6 = v5;
  unsigned int v7 = -1;
  if ([(BMFrameStore *)self offsetOfFrameV2:v5] > a3)
  {
    signed int v8 = v6 - 1;
    if ((v8 & 0x80000000) == 0)
    {
      signed int v9 = 0;
      while (1)
      {
        int v10 = v8 - v9;
        if (v8 < v9) {
          ++v10;
        }
        unsigned int v7 = v9 + (v10 >> 1);
        unsigned int v11 = [(BMFrameStore *)self offsetOfFrameV2:v7];
        if (v11 == a3) {
          break;
        }
        if (v11 < a3) {
          signed int v9 = v7 + 1;
        }
        else {
          signed int v8 = v7 - 1;
        }
        if (v8 < v9) {
          return -1;
        }
      }
    }
  }
  return v7;
}

- (unsigned)frameOffsetFromOffsetTableV2:(id *)a3
{
  if (!a3) {
    return 0;
  }
  unsigned int v3 = a3 + 1;
  id v4 = [(BMFrameStore *)self frames];
  uint64_t v5 = [v4 end];

  if (($6904A10426020E4F4092C7509944103C *)v5 == v3) {
    return 0;
  }
  else {
    return (v3->var0.var0.var0 + 3) & 0xFFFFFFFC;
  }
}

- (int)frameCountV2
{
  v2 = [(BMFrameStore *)self start];
  unsigned int v3 = atomic_load(v2 - 7);
  unsigned int v4 = atomic_load(v2 - 2);
  return v3 - v4;
}

- (int)frameCountFromStartTimeV2:(double)a3 endTime:(double)a4
{
  int result = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (result)
  {
    int v8 = result;
    uint64_t v9 = [(BMFrameStore *)self firstFrameNumberForTimestampV2:0 reverse:a3];
    uint64_t v10 = [(BMFrameStore *)self firstFrameNumberForTimestampV2:1 reverse:a4];
    unsigned int v11 = [(BMFrameStore *)self start];
    unsigned int v12 = atomic_load(v11 - 2);
    unsigned int v13 = atomic_load(v11 - 3);
    if (v12) {
      BOOL v14 = v13 >= v9;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      if (v9 || v10 != v8 - 1)
      {
        return [(BMFrameStore *)self countFrameStateInOffsetTable:1 startingFrame:v9 endingFrame:v10];
      }
      else
      {
        return v8 - v12;
      }
    }
    else
    {
      return v10 - v9 + 1;
    }
  }
  return result;
}

- (int)eraseFrameAtOffsetTableV2:(id *)a3
{
  uint64_t v5 = a3 + 1;
  int v6 = [(BMFrameStore *)self frames];
  if (($6904A10426020E4F4092C7509944103C *)[v6 end] == v5) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = (v5->var0.var0.var0 + 3) & 0xFFFFFFFC;
  }

  rsize_t v8 = a3->var0.var0.var0 - v7 - 8;
  uint64_t v9 = [(BMFrameStore *)self frames];
  uint64_t v10 = (_DWORD *)([v9 start] + v7);

  int result = memset_s(v10 + 2, v8, 0, v8);
  _DWORD *v10 = 0;
  return result;
}

- (unsigned)stateOfFrameV2:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (v5 <= a3)
  {
    unsigned int v12 = v5;
    unsigned int v13 = __biome_log_for_category();
    *(void *)long long buf = 0;
    char v20 = buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__BMFrameStore_V2__stateOfFrameV2___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (stateOfFrameV2__onceToken != -1) {
      dispatch_once(&stateOfFrameV2__onceToken, block);
    }
    os_log_type_t v14 = v20[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (void *)MEMORY[0x1E4F4FB78];
      uint64_t v16 = [(BMFrameStore *)self segmentPath];
      id v17 = [v15 privacyPathname:v16];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v12;
      HIWORD(v20) = 2114;
      uint64_t v21 = (uint64_t)v17;
      _os_log_impl(&dword_1AD076000, v13, v14, "stateOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);
    }
  }
  else
  {
    unint64_t v6 = 16 * (a3 + 1);
    unsigned int v7 = [(BMFrameStore *)self frames];
    unint64_t v8 = [v7 size];

    if (v6 <= v8)
    {
      uint64_t v9 = [(BMFrameStore *)self frames];
      unint64_t v10 = [v9 end] - v6;

      return *(_DWORD *)(v10 + 4);
    }
  }
  return 5;
}

uint64_t __35__BMFrameStore_V2__stateOfFrameV2___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __42__BMFrameStore_V2__creationTimeOfFrameV2___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)sizeOfFrameV2:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  if (v5 <= a3)
  {
    unsigned int v12 = v5;
    unsigned int v13 = __biome_log_for_category();
    *(void *)long long buf = 0;
    char v20 = buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__BMFrameStore_V2__sizeOfFrameV2___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (sizeOfFrameV2__onceToken != -1) {
      dispatch_once(&sizeOfFrameV2__onceToken, block);
    }
    os_log_type_t v14 = v20[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (void *)MEMORY[0x1E4F4FB78];
      uint64_t v16 = [(BMFrameStore *)self segmentPath];
      id v17 = [v15 privacyPathname:v16];
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&buf[4] = a3;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v12;
      HIWORD(v20) = 2114;
      uint64_t v21 = (uint64_t)v17;
      _os_log_impl(&dword_1AD076000, v13, v14, "sizeOfFrame requested for frame:%u is beyond totalFrames:%u: %{public}@", buf, 0x18u);
    }
    return 0;
  }
  unint64_t v6 = 16 * (a3 + 1);
  unsigned int v7 = [(BMFrameStore *)self frames];
  unint64_t v8 = [v7 size];

  if (v6 > v8) {
    return 0;
  }
  uint64_t v9 = [(BMFrameStore *)self frames];
  unint64_t v10 = (unsigned int *)([v9 end] - v6);

  unsigned int result = *v10;
  if (a3) {
    result -= (v10[4] + 3) & 0xFFFFFFFC;
  }
  return result;
}

uint64_t __34__BMFrameStore_V2__sizeOfFrameV2___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __36__BMFrameStore_V2__offsetOfFrameV2___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_6(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __52__BMFrameStore_V2__initWithFileHandleV2_permission___block_invoke_8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (id)_printablePathV2
{
  unsigned int v3 = [(BMFrameStore *)self cachedPrintablePathV2];

  if (!v3)
  {
    unsigned int v4 = (void *)MEMORY[0x1E4F4FB78];
    unsigned int v5 = [(BMFrameStore *)self backingFile];
    unint64_t v6 = [v5 attributes];
    unsigned int v7 = [v6 path];
    unint64_t v8 = [v4 privacyPathname:v7];
    [(BMFrameStore *)self setCachedPrintablePathV2:v8];
  }
  return [(BMFrameStore *)self cachedPrintablePathV2];
}

uint64_t __135__BMFrameStore_V2__isValidFrameV2_currentFrame_expectedState_copyOfData_frameState_frameSize_validations_enumerationOptions_errorCode___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (id)frameWithOffsetV2:(unint64_t)a3 expectedState:(unsigned int)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((a3 & 3) != 0)
  {
    unsigned int v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore(V2) frameWithOffsetV2:expectedState:]();
    }

LABEL_11:
    os_log_type_t v14 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = *(void *)&a4;
  unsigned int v8 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  unint64_t v9 = a3;
  if (!a3)
  {
    unint64_t v10 = [(BMFrameStore *)self frames];
    unint64_t v9 = [v10 size] - 16;
  }
  unsigned int v11 = [(BMFrameStore *)self frames];
  unint64_t v12 = [v11 size] - 16 * v8;

  if (v9 < v12)
  {
    unsigned int v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v34 = [(BMFrameStore *)self frames];
      *(_DWORD *)long long buf = 134218496;
      *(void *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v34 size] - 16 * v8;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v39) = v8;
      _os_log_error_impl(&dword_1AD076000, v13, OS_LOG_TYPE_ERROR, "frameWithOffsetV2: offset (%lu) is above the offset table (%lu), totalFrames:%d", buf, 0x1Cu);
    }
    goto LABEL_11;
  }
  uint64_t v16 = [(BMFrameStore *)self frameNumberFromOffsetToOffsetTableEntryV2:v9];
  unsigned int v17 = [(BMFrameStore *)self offsetOfFrameV2:v16];
  uint64_t v18 = [(BMFrameStore *)self frames];
  uint64_t v19 = (uint64_t *)([v18 start] + v17);

  char v20 = [(BMFrameStore *)self frames];
  unint64_t v21 = [v20 start] + v9;

  id v37 = 0;
  uint64_t v22 = 2 * (v6 == 2);
  if (v6 == 3) {
    uint64_t v22 = 1;
  }
  LOBYTE(v35) = 1;
  BOOL v23 = [(BMFrameStore *)self isValidFrameV2:v19 currentFrame:v16 expectedState:v6 copyOfData:&v37 frameState:*(unsigned int *)(v21 + 4) frameSize:*(_DWORD *)v21 - v17 validations:v35 enumerationOptions:v22 errorCode:0];
  os_log_type_t v14 = 0;
  if (v23)
  {
    uint64_t v24 = *v19;
    uint64_t v25 = [BMFrame alloc];
    uint64_t v26 = [(BMFrameStore *)self backingFile];
    int v27 = [v26 attributes];
    uint64_t v28 = [v27 path];
    id v29 = v37;
    double v30 = [(BMFrameStore *)self frames];
    uint64_t v31 = [v30 start];
    double v32 = *(double *)(v21 + 8);
    int v33 = *(_DWORD *)(v21 + 4);
    *(void *)long long buf = v24;
    *(void *)&uint8_t buf[16] = 0;
    uint64_t v39 = 0;
    *(void *)&uint8_t buf[8] = 0;
    LODWORD(v36) = v33;
    os_log_type_t v14 = [(BMFrame *)v25 initWithHeader:buf storePath:v28 data:v29 framePtr:v21 offset:a3 nextOffset:v21 - v31 + 16 timestamp:v32 datastoreVersion:10 state:v36];
  }
LABEL_12:
  return v14;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_41(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_43(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_45(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_47(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_49(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_51(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_53(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__BMFrameStore_V2__enumerateWithOptionsV2_fromOffset_usingBlock___block_invoke_55(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __56__BMFrameStore_V2__updateToMaxOfValueAtOffset_newValue___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)addToValueAtOffset:(unsigned int)a3 increment:(unsigned int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(BMFrameStore *)self datastoreVersion] == 10)
  {
    unsigned int v7 = [(BMFrameStore *)self header];
    uint64_t v8 = [v7 start];

    unsigned int v9 = atomic_load((unsigned int *)(v8 + a3));
    if (a4)
    {
      unsigned int v10 = v9;
      do
      {
        atomic_compare_exchange_strong((atomic_uint *volatile)(v8 + a3), &v10, v9 + a4);
        BOOL v11 = v10 == v9;
        unsigned int v9 = v10;
      }
      while (!v11);
    }
  }
  else
  {
    unint64_t v12 = __biome_log_for_category();
    *(void *)long long buf = 0;
    unsigned int v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BMFrameStore_V2__addToValueAtOffset_increment___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (addToValueAtOffset_increment__onceToken != -1) {
      dispatch_once(&addToValueAtOffset_increment__onceToken, block);
    }
    os_log_type_t v13 = v17[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v12, v13))
    {
      unsigned int v14 = [(BMFrameStore *)self datastoreVersion];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v14;
      _os_log_impl(&dword_1AD076000, v12, v13, "addToValueAtOffset called with unexpected datastoreVersion:%d", buf, 8u);
    }
  }
}

uint64_t __49__BMFrameStore_V2__addToValueAtOffset_increment___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)addToDeletedFrameCount:(unsigned int)a3
{
}

- (void)updateToMaxOfHighestDeletedFrameAnd:(unsigned int)a3
{
}

uint64_t __79__BMFrameStore_V2__appendOffsetTableEntry_outOffsetForFrame_length_frameCount___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __80__BMFrameStore_V2__writeFrameV2ForBytes_length_dataVersion_timestamp_outOffset___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)updateHighestDeletedFrameV2:(id)a3 addToDeletedFrameCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(BMFrameStore *)self updateHighestDeletedFrame:a3];
  [(BMFrameStore *)self addToDeletedFrameCount:v4];
}

- (void)updateHighestDeletedFrame:(id)a3
{
  id v7 = a3;
  if ([(BMFrameStore *)self datastoreVersion] == 10)
  {
    int v4 = [v7 framePtr];
    unsigned int v5 = [(BMFrameStore *)self frames];
    uint64_t v6 = v4 - [v5 start];

    [(BMFrameStore *)self updateToMaxOfHighestDeletedFrameAnd:[(BMFrameStore *)self frameNumberFromOffsetToOffsetTableEntryV2:v6]];
  }
}

- (void)markFrameAsRemovedV2:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (atomic_ullong *)[v4 framePtr];
  atomic_ullong v7 = *v6;
  unint64_t v8 = *v6 | 0x200000000;
  atomic_ullong v9 = *v6;
  atomic_compare_exchange_strong(v6, (unint64_t *)&v9, v8);
  if (v9 == v7)
  {
    int v10 = [(BMFrameStore *)v5 eraseFrameAtOffsetTableV2:v6];
    if (v10)
    {
      BOOL v11 = __biome_log_for_category();
      *(void *)long long buf = 0;
      uint64_t v16 = buf;
      uint64_t v17 = 0x2020000000;
      char v18 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__BMFrameStore_V2__markFrameAsRemovedV2___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (markFrameAsRemovedV2__onceToken != -1) {
        dispatch_once(&markFrameAsRemovedV2__onceToken, block);
      }
      os_log_type_t v12 = v16[24];
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1AD076000, v11, v12, "Failed to zero out memory. %{public, darwin.errno}d", buf, 8u);
      }
    }
    else
    {
      unint64_t v13 = v8;
      atomic_compare_exchange_strong(v6, &v13, v7 | 0x300000000);
      if (v13 == v8) {
        goto LABEL_10;
      }
      BOOL v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[BMFrameStore markFrameAsRemovedV1:]();
      }
    }
  }
  else
  {
    BOOL v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMFrameStore markFrameAsRemovedV1:]();
    }
  }

LABEL_10:
  objc_sync_exit(v5);
}

uint64_t __41__BMFrameStore_V2__markFrameAsRemovedV2___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (unsigned)countFrameStateInOffsetTable:(unsigned int)a3 startingFrame:(int)a4 endingFrame:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  unsigned int v9 = [(BMFrameStore *)self atomicReadTotalFramesV2];
  unsigned int v10 = 0;
  if ((v6 & 0x80000000) == 0 && v9)
  {
    int v11 = v9 - 1;
    if (v9 > a5) {
      int v11 = a5;
    }
    if (v11 >= (int)v6)
    {
      unsigned int v10 = 0;
      int v12 = v11 + 1;
      do
      {
        if ([(BMFrameStore *)self stateOfFrameV2:v6] == a3) {
          ++v10;
        }
        uint64_t v6 = (v6 + 1);
      }
      while (v12 != v6);
    }
    else
    {
      return 0;
    }
  }
  return v10;
}

- (BOOL)isCheckSumValidAtOffsetV2:(unint64_t)a3 frameNumber:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  char v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(BMFrameStore *)self datastoreVersion] != 10)
  {
    unsigned int v14 = __biome_log_for_category();
    *(void *)long long buf = 0;
    uint64_t v19 = buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__BMFrameStore_V2__isCheckSumValidAtOffsetV2_frameNumber___block_invoke;
    block[3] = &unk_1E5E78708;
    block[4] = buf;
    if (isCheckSumValidAtOffsetV2_frameNumber__onceToken != -1) {
      dispatch_once(&isCheckSumValidAtOffsetV2_frameNumber__onceToken, block);
    }
    os_log_type_t v15 = v19[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v14, v15))
    {
      unsigned int v16 = [(BMFrameStore *)self datastoreVersion];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1AD076000, v14, v15, "isCheckSumValidAtOffsetV2 called with unexpected dataVersion:%d", buf, 8u);
    }

    return 0;
  }
  if ((v5 & 7) != 0) {
    return 0;
  }
  unsigned int v7 = [(BMFrameStore *)self offsetOfFrameV2:v4];
  unsigned int v8 = [(BMFrameStore *)self sizeOfFrameV2:v4];
  unsigned int v9 = [(BMFrameStore *)self frames];
  unint64_t v10 = [v9 size];

  if (v10 < v8 + v7) {
    return 0;
  }
  int v11 = [(BMFrameStore *)self frames];
  uint64_t v12 = [v11 start];

  return [(BMFrameStore *)self stateOfFrameV2:v4] != 1
      || bm_generateChecksum((Bytef *)(v12 + v7 + 8), v8 - 8) == *(_DWORD *)(v12 + v7);
}

uint64_t __58__BMFrameStore_V2__isCheckSumValidAtOffsetV2_frameNumber___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (void)getSegmentHeader:(void *)a1 fromFileV1:fileSize:.cold.1(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v4, v5, "Segment file %{public}@ is invalid because the current size is 0 bytes", v6, v7, v8, v9, v10);
}

- (void)getSegmentHeader:(void *)a1 fromFileV1:fileSize:.cold.2(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v4, v5, "Segment file %{public}@ is invalid because the current size is less than a segment header.", v6, v7, v8, v9, v10);
}

- (void)getSegmentHeader:fromFileV1:fileSize:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  v2 = [v1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v4, v5, "Unable to read segment file segment header %{public}@ error %{darwin.errno}d.", v6, v7, v8, v9, v10);
}

- (void)getSegmentHeader:(_DWORD *)a1 fromFileV1:(void *)a2 fileSize:(NSObject *)a3 .cold.4(_DWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = *a1;
  uint64_t v6 = (void *)MEMORY[0x1E4F4FB78];
  uint64_t v7 = [a2 attributes];
  uint64_t v8 = [v7 path];
  uint64_t v9 = [v6 privacyPathname:v8];
  v10[0] = 68290050;
  v10[1] = 4;
  __int16 v11 = 2082;
  uint64_t v12 = a1;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 2114;
  unsigned int v16 = v9;
  __int16 v17 = 1042;
  int v18 = 4;
  __int16 v19 = 2082;
  uint64_t v20 = "SEGB";
  _os_log_error_impl(&dword_1AD076000, a3, OS_LOG_TYPE_ERROR, "Segment header magic '%{public}.4s' (0x%04X) in file %{public}@ doesn't match expected magic '%{public}.4s'.", (uint8_t *)v10, 0x32u);
}

- (void)getSegmentHeader:(void *)a1 fromFileV1:fileSize:.cold.5(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v4, v5, "Unable to read segment file's segment header %{public}@. Received data of %{public}d length.", v6, v7, v8, v9, v10);
}

- (void)getSegmentHeader:fromFileV1:fileSize:.cold.6()
{
  OUTLINED_FUNCTION_2_0();
  v2 = [v1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v4, v5, "Failed to fstat %{public}@ with error: %{darwin.errno}d", v6, v7, v8, v9, v10);
}

+ (void)writeEmptyFrameStoreWithFileHandle:(void *)a1 fileSize:datastoreVersion:.cold.1(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v4, v5, "Invalid file size of %{public}@ since it is less than a valid segment header's size.", v6, v7, v8, v9, v10);
}

+ (void)writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  v2 = [v1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AD076000, v4, v5, "Exception when truncating file %{public}@. %{darwin.errno}d", v6, v7, v8, v9, v10);
}

+ (void)writeEmptySegmentHeaderWithFileHandleV1:(void *)a1 segmentHeaderSize:.cold.1(void *a1)
{
  v2 = [a1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  unsigned int v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v4, v5, "Could not write the segment header to %{public}@", v6, v7, v8, v9, v10);
}

+ (void)writeEmptySegmentHeaderWithFileHandleV1:segmentHeaderSize:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  __int16 v2 = 2050;
  uint64_t v3 = 31;
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "Segment name is too large to store in the segment header. Truncating the segment name of %{public}zu to %{public}lu", v1, 0x16u);
}

- (void)initWithFileHandleV1:(uint64_t)a1 permission:.cold.1(uint64_t a1)
{
  __int16 v2 = [*(id *)(a1 + 64) attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_5_0(), "privacyPathname:");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v4, v5, "Not mapping an empty file %{public}@", v6, v7, v8, v9, v10);
}

- (void)initWithFileHandleV1:permission:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  id v1 = [v0 _printablePath];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v2, v3, "Found a bad lastAbsoluteTimestamp in header for segment file %{public}@ time: %f", v4, v5, v6, v7, v8);
}

- (void)initWithFileHandleV1:permission:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  id v0 = (void *)MEMORY[0x1E4F4FB78];
  uint64_t v2 = [v1 segmentPath];
  uint64_t v3 = [v0 privacyPathname:v2];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v4, v5, "Failed to map frames for %{public}@ with permission %lu", v6, v7, v8, v9, v10);
}

- (void)initWithFileHandleV1:permission:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v2 = [*v1 attributes];
  [v2 path];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v4, v5, "Failed to map header for %{public}@ with permission %lu", v6, v7, v8, v9, v10);
}

- (void)initWithFileHandleV1:permission:.cold.5()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "The Frame Header should never be nil when initializing with write or prune permissions", v2, v3, v4, v5, v6);
}

- (void)frameWithOffsetV1:expectedState:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  [*v0 size];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v1, v2, "frameWithOffsetV1: offset (%lu) is beyond frame size (%lu)", v3, v4, v5, v6, v7);
}

- (void)frameWithOffsetV1:expectedState:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  [*v0 size];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v1, v2, "frameWithOffsetV1: current offset (%lu) leaves insufficient space in the segment size (%lu) for a BMFrameHeader", v3, v4, v5, v6, v7);
}

- (void)frameWithOffsetV1:expectedState:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "frameWithOffsetV1: offset is not 8-byte aligned:%zu", v1, 0xCu);
}

- (void)appendFrameHeaderV1:offset:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_1AD076000, v0, OS_LOG_TYPE_DEBUG, "No space left to write to the mapped region", v1, 2u);
}

- (void)writeFrameV1ForBytes:(uint64_t)a1 length:(NSObject *)a2 dataVersion:timestamp:outOffset:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134349312;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0x7FFFFFFFLL;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Sample too large %{public}zu but only %zu supported", (uint8_t *)&v2, 0x16u);
}

- (void)writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Sample is empty but only non-empty samples are supported", v2, v3, v4, v5, v6);
}

- (void)writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:.cold.3()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Attempt to write data too large to fit in segment", v2, v3, v4, v5, v6);
}

- (void)writeFrameV1ForBytes:length:dataVersion:timestamp:outOffset:.cold.4()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Failed to find a segment header while writing. Dropping incoming data", v2, v3, v4, v5, v6);
}

- (void)writeFrameV1ForBytes:(os_log_t)log length:dataVersion:timestamp:outOffset:.cold.5(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1AD076000, log, OS_LOG_TYPE_DEBUG, "Unable to write frame for reason: %@", buf, 0xCu);
}

- (void)markFrameAsRemovedV1:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Unable to mark frame as deleted", v2, v3, v4, v5, v6);
}

- (void)markFrameAsRemovedV1:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Unable to mark frame as pre-delete", v2, v3, v4, v5, v6);
}

@end