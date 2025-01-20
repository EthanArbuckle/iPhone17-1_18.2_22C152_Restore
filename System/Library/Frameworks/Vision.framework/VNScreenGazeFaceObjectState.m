@interface VNScreenGazeFaceObjectState
- (void)_replaceFaceObservation:(uint64_t)a3 imageWidth:(uint64_t)a4 imageHeight:(int)a5 frameIndex:;
- (void)dealloc;
@end

@implementation VNScreenGazeFaceObjectState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_faceObservation, 0);
}

- (void)dealloc
{
  screenGazeState = self->_screenGazeState;
  if (!screenGazeState) {
    goto LABEL_16;
  }
  v4 = (void **)screenGazeState[4];
  v5 = (void **)screenGazeState[5];
  screenGazeState[8] = 0;
  unint64_t v6 = (char *)v5 - (char *)v4;
  if ((unint64_t)((char *)v5 - (char *)v4) >= 0x11)
  {
    do
    {
      operator delete(*v4);
      v5 = (void **)screenGazeState[5];
      v4 = (void **)(screenGazeState[4] + 8);
      screenGazeState[4] = v4;
      unint64_t v6 = (char *)v5 - (char *)v4;
    }
    while ((unint64_t)((char *)v5 - (char *)v4) > 0x10);
  }
  unint64_t v7 = v6 >> 3;
  if (v7 == 1)
  {
    uint64_t v8 = 128;
  }
  else
  {
    if (v7 != 2) {
      goto LABEL_9;
    }
    uint64_t v8 = 256;
  }
  screenGazeState[7] = v8;
LABEL_9:
  if (v4 != v5)
  {
    do
    {
      v9 = *v4++;
      operator delete(v9);
    }
    while (v4 != v5);
    uint64_t v11 = screenGazeState[4];
    uint64_t v10 = screenGazeState[5];
    if (v10 != v11) {
      screenGazeState[5] = v10 + ((v11 - v10 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  v12 = (void *)screenGazeState[3];
  if (v12) {
    operator delete(v12);
  }
  MEMORY[0x1A62562C0](screenGazeState, 0x1080C40B4A5DF6CLL);
LABEL_16:
  v13.receiver = self;
  v13.super_class = (Class)VNScreenGazeFaceObjectState;
  [(VNScreenGazeFaceObjectState *)&v13 dealloc];
}

- (void)_replaceFaceObservation:(uint64_t)a3 imageWidth:(uint64_t)a4 imageHeight:(int)a5 frameIndex:
{
  id v31 = a2;
  if (x0_0)
  {
    objc_storeStrong((id *)(x0_0 + 8), a2);
    *(void *)(x0_0 + 16) = a3;
    *(void *)(x0_0 + 24) = a4;
    *(_DWORD *)(x0_0 + 32) = a5;
    [*(id *)(x0_0 + 8) unalignedBoundingBox];
    float v10 = cgNormalizedRectToGeometryImageRect(v33, *(void *)(x0_0 + 16));
    float v11 = floorf(v10);
    float v13 = floorf(v12);
    *(float *)(x0_0 + 72) = v11;
    *(float *)(x0_0 + 76) = v13;
    *(float *)(x0_0 + 80) = ceilf((float)(v12 + v15) - v13);
    *(float *)(x0_0 + 84) = ceilf((float)(v10 + v14) - v11);
    v16 = [*(id *)(x0_0 + 8) landmarks];

    if (v16)
    {
      [*(id *)(x0_0 + 8) boundingBox];
      float v17 = cgNormalizedRectToGeometryImageRect(v34, *(void *)(x0_0 + 16));
      float v19 = v18;
      v20 = [*(id *)(x0_0 + 8) landmarks];
      id v21 = [v20 leftPupil];
      [v21 normalizedPoints];

      VisionCoreImagePointForNormalizedPoint();
      *(float *)&double v22 = v22;
      *(float *)&double v23 = v23;
      *(_DWORD *)(x0_0 + 48) = LODWORD(v22);
      *(_DWORD *)(x0_0 + 52) = LODWORD(v23);
      v24 = [*(id *)(x0_0 + 8) landmarks];
      id v25 = [v24 rightPupil];
      [v25 normalizedPoints];

      VisionCoreImagePointForNormalizedPoint();
      *(float *)&double v26 = v26;
      *(float *)&double v27 = v27;
      float v28 = *(float *)(x0_0 + 72) - v17;
      float v29 = *(float *)(x0_0 + 76) - v19;
      float v30 = *(float *)(x0_0 + 52) - v29;
      *(float *)(x0_0 + 48) = *(float *)(x0_0 + 48) - v28;
      *(float *)(x0_0 + 52) = v30;
      *(float *)(x0_0 + 56) = *(float *)&v26 - v28;
      *(float *)(x0_0 + 60) = *(float *)&v27 - v29;
    }
  }
}

@end