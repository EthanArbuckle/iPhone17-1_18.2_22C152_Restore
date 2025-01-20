@interface _FBSSnapshot
- (BOOL)capture;
- (BOOL)hasProtectedContent;
- (CGImage)CGImage;
- (CGSize)_scaledSnapshotSize;
- (IOSurface)IOSurface;
- (IOSurface)fallbackIOSurface;
- (_FBSSnapshot)initWithSnapshotContext:(id)a3;
- (_FBSSnapshotContext)context;
- (double)_scale;
- (void)_doInvalidate;
- (void)_synchronizedCaptureWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _FBSSnapshot

- (_FBSSnapshot)initWithSnapshotContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FBSSnapshot;
  v5 = [(_FBSSnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    context = v5->_context;
    v5->_context = (_FBSSnapshotContext *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(_FBSSnapshot *)self _doInvalidate];
  v3.receiver = self;
  v3.super_class = (Class)_FBSSnapshot;
  [(_FBSSnapshot *)&v3 dealloc];
}

- (BOOL)hasProtectedContent
{
  v2 = [(_FBSSnapshot *)self fallbackIOSurface];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)capture
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23___FBSSnapshot_capture__block_invoke;
  v4[3] = &unk_1E58F7008;
  v4[4] = &v5;
  [(_FBSSnapshot *)self _synchronizedCaptureWithCompletion:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (IOSurface)IOSurface
{
  [(_FBSSnapshot *)self _synchronizedCaptureWithCompletion:0];
  protectedSurfaceRef = self->_protectedSurfaceRef;
  if (!protectedSurfaceRef) {
    protectedSurfaceRef = self->_nonProtectedSurfaceRef;
  }
  id v4 = protectedSurfaceRef;

  return v4;
}

- (IOSurface)fallbackIOSurface
{
  [(_FBSSnapshot *)self _synchronizedCaptureWithCompletion:0];
  if (self->_protectedSurfaceRef) {
    BOOL v3 = self->_nonProtectedSurfaceRef;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (CGImage)CGImage
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23___FBSSnapshot_CGImage__block_invoke;
  v4[3] = &unk_1E58F7030;
  v4[4] = self;
  [(_FBSSnapshot *)self _synchronizedCaptureWithCompletion:v4];
  return self->_imageRef;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  [(_FBSSnapshot *)obj _doInvalidate];
  objc_sync_exit(obj);
}

- (void)_doInvalidate
{
  nonProtectedSurfaceRef = self->_nonProtectedSurfaceRef;
  self->_nonProtectedSurfaceRef = 0;

  protectedSurfaceRef = self->_protectedSurfaceRef;
  self->_protectedSurfaceRef = 0;

  imageRef = self->_imageRef;
  if (imageRef)
  {
    CGImageRelease(imageRef);
    self->_imageRef = 0;
  }
}

- (void)_synchronizedCaptureWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20 = (void (**)(id, uint64_t))a3;
  id v4 = self;
  objc_sync_enter(v4);
  obj = v4;
  v18 = [(_FBSSnapshotContext *)v4->_context layers];
  v17 = [(_FBSSnapshotContext *)v4->_context displayConfiguration];
  if (*(_OWORD *)&v4->_imageRef == 0 && !v4->_protectedSurfaceRef)
  {
    if (v17 && [v18 count])
    {
      uint64_t v6 = [v18 count];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v21 = v18;
      uint64_t v7 = [v21 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v21);
            }
            v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v11 = getkCASnapshotContextId();
            v28[0] = v11;
            v12 = [NSNumber numberWithUnsignedInt:[v10 contextID]];
            v29[0] = v12;
            v13 = getkCASnapshotTransform();
            v28[1] = v13;
            v14 = (void *)MEMORY[0x1E4F29238];
            if (v10) {
              [v10 baseTransform];
            }
            else {
              memset(v23, 0, sizeof(v23));
            }
            v15 = [v14 valueWithCATransform3D:v23];
            v29[1] = v15;
            v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

            [v22 addObject:v16];
          }
          uint64_t v7 = [v21 countByEnumeratingWithState:&v24 objects:v30 count:16];
        }
        while (v7);
      }

      [(_FBSSnapshot *)obj _scaledSnapshotSize];
      BSFloatGreaterThanFloat();
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  if (v20) {
    v20[2](v20, v5);
  }

  objc_sync_exit(v4);
}

- (double)_scale
{
}

- (CGSize)_scaledSnapshotSize
{
  [(_FBSSnapshotContext *)self->_context snapshotSize];
  double v4 = v3;
  double v6 = v5;
  [(_FBSSnapshot *)self _scale];
  double v8 = v6 * v7;
  double v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (_FBSSnapshotContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedSurfaceRef, 0);
  objc_storeStrong((id *)&self->_nonProtectedSurfaceRef, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_synchronizedCaptureWithCompletion:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_19C680000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error: Snapshot frame is empty.", buf, 0xCu);
}

@end