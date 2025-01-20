@interface BLSHFlipbookHistoryFrame
- (BLSHFlipbookHistoryFrame)initWithFrame:(id)a3;
- (BLSHRenderedFlipbookFrame)hostFrame;
- (BOOL)isRetainingSurface;
- (__IOSurface)rawSurface;
- (__IOSurface)surface;
- (unint64_t)retainedMemoryUsage;
- (void)stopRetainingSurface;
@end

@implementation BLSHFlipbookHistoryFrame

- (BLSHFlipbookHistoryFrame)initWithFrame:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 presentationTime];
  uint64_t v7 = [v5 frameId];
  [v5 apl];
  int v9 = v8;
  [v5 aplDimming];
  int v11 = v10;
  uint64_t v12 = [v5 memoryUsage];
  [v5 rawSurfaceFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v5 isInverted];
  v22 = objc_msgSend(v5, "bls_specifier");
  v23 = objc_msgSend(v5, "bls_uuid");
  v28.receiver = self;
  v28.super_class = (Class)BLSHFlipbookHistoryFrame;
  LODWORD(v24) = v9;
  LODWORD(v25) = v11;
  v26 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](&v28, sel_initWithPresentationTime_frameId_apl_aplDimming_memoryUsage_rawSurfaceFrameRect_inverted_specifier_uuid_, v6, v7, v12, v21, v22, v23, v24, v25, v14, v16, v18, v20);

  if (v26)
  {
    v26->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v26->_hostFrame, v5);
    objc_storeStrong((id *)&v26->_lock_retainedHostFrame, a3);
  }

  return v26;
}

- (BOOL)isRetainingSurface
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_retainedHostFrame != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)retainedMemoryUsage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(BLSHRenderedFlipbookFrame *)self->_lock_retainedHostFrame memoryUsage];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)stopRetainingSurface
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_retainedHostFrame = self->_lock_retainedHostFrame;
  self->_lock_retainedHostFrame = 0;

  os_unfair_lock_unlock(p_lock);
}

- (__IOSurface)surface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostFrame);
  v3 = (__IOSurface *)[WeakRetained surface];

  return v3;
}

- (__IOSurface)rawSurface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostFrame);
  v3 = (__IOSurface *)[WeakRetained rawSurface];

  return v3;
}

- (BLSHRenderedFlipbookFrame)hostFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostFrame);

  return (BLSHRenderedFlipbookFrame *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostFrame);

  objc_storeStrong((id *)&self->_lock_retainedHostFrame, 0);
}

@end