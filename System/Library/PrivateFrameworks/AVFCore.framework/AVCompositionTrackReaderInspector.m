@interface AVCompositionTrackReaderInspector
- (BOOL)isDecodable;
- (BOOL)isPlayable;
- (OpaqueFigMutableComposition)_mutableComposition;
- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3;
- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5;
- (id)segments;
- (int)decodabilityValidationResult;
- (int)playabilityValidationResult;
- (void)dealloc;
@end

@implementation AVCompositionTrackReaderInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AVCompositionTrackReaderInspector;
  v6 = [(AVTrackReaderInspector *)&v9 _initWithAsset:a3 trackID:*(void *)&a4 trackIndex:a5];
  if (v6)
  {
    CFTypeRef v7 = (CFTypeRef)[a3 _mutableComposition];
    if (v7) {
      CFTypeRef v7 = CFRetain(v7);
    }
    v6[12] = v7;
  }
  return v6;
}

- (void)dealloc
{
  figMutableComposition = self->_figMutableComposition;
  if (figMutableComposition) {
    CFRelease(figMutableComposition);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCompositionTrackReaderInspector;
  [(AVTrackReaderInspector *)&v4 dealloc];
}

- (BOOL)isPlayable
{
  return 1;
}

- (int)playabilityValidationResult
{
  return 0;
}

- (BOOL)isDecodable
{
  return 1;
}

- (int)decodabilityValidationResult
{
  return 0;
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return self->_figMutableComposition;
}

- (id)segments
{
  v3 = [(AVCompositionTrackReaderInspector *)self _mutableComposition];
  uint64_t v4 = [(AVTrackReaderInspector *)self trackID];
  uint64_t v27 = 0;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFTypeRef v7 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t *, void, void))(v6 + 56);
  if (!v7 || v7(v3, v4, &v27, 0, 0) || v27 < 1)
  {
    v8 = 0;
LABEL_11:
    free(v8);
    return (id)[MEMORY[0x1E4F1C978] array];
  }
  v8 = (unsigned int *)malloc_type_malloc(108 * v27, 0x1060040CB727B4DuLL);
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = v27;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v11 = v10 ? v10 : 0;
  v14 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, void, uint64_t, unsigned int *))(v11 + 56);
  if (!v14) {
    goto LABEL_11;
  }
  if (v14(v3, v4, 0, v9, v8)) {
    goto LABEL_11;
  }
  uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v27];
  if (!v15) {
    goto LABEL_11;
  }
  v12 = (void *)v15;
  if (v27 >= 1)
  {
    uint64_t v16 = 0;
    v17 = (id *)(v8 + 26);
    do
    {
      id v18 = *(v17 - 1);
      uint64_t v19 = *(unsigned int *)v17;
      long long v20 = *(_OWORD *)(v17 - 13);
      long long v21 = *(_OWORD *)(v17 - 9);
      v26[1] = *(_OWORD *)(v17 - 11);
      v26[2] = v21;
      v26[0] = v20;
      long long v22 = *(_OWORD *)(v17 - 7);
      long long v23 = *(_OWORD *)(v17 - 3);
      v25[1] = *(_OWORD *)(v17 - 5);
      v25[2] = v23;
      v25[0] = v22;
      v24 = +[AVCompositionTrackSegment compositionTrackSegmentWithURL:v18 trackID:v19 sourceTimeRange:v26 targetTimeRange:v25];
      if (!v24) {
        break;
      }
      [v12 addObject:v24];
      ++v16;
      v17 = (id *)((char *)v17 + 108);
    }
    while (v16 < v27);
  }
  free(v8);
  return v12;
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  return 0;
}

@end