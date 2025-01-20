@interface VCPCtrTracker
- (BOOL)lostTrackInd;
- (BOOL)stableInd;
- (CGPoint)box;
- (VCPCtrTracker)init;
- (float)confidence;
- (void)dealloc;
- (void)setBox:(CGPoint *)a3;
- (void)setConfidence:(float)a3;
- (void)setLostTrackInd:(BOOL)a3;
- (void)setStableInd:(BOOL)a3;
- (void)setupTrackerWithReferenceFrame:(__CVBuffer *)a3 withROI:(CGPoint *)a4;
- (void)trackInFrame:(__CVBuffer *)a3;
@end

@implementation VCPCtrTracker

- (VCPCtrTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)VCPCtrTracker;
  result = [(VCPCtrTracker *)&v3 init];
  if (result)
  {
    result->P = 0;
    result->context = 0;
  }
  return result;
}

- (void)dealloc
{
  context = self->context;
  if (context) {
    ctrTrackerInitialization_freeContext(context);
  }
  P = self->P;
  if (P) {
    free(P);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPCtrTracker;
  [(VCPCtrTracker *)&v5 dealloc];
}

- (void)setupTrackerWithReferenceFrame:(__CVBuffer *)a3 withROI:(CGPoint *)a4
{
  P = self->P;
  if (!P)
  {
    P = (CGPoint *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    self->P = P;
  }
  for (uint64_t i = 0; i != 4; ++i)
    P[i] = a4[i];
  context = self->context;
  if (context)
  {
    ctrTrackerInitialization_cleanUpContext((uint64_t)context);
    v10 = self->context;
  }
  else
  {
    v10 = ($CC4E71048F5C91AC453A993CA384816F *)ctrTrackerInitialization_allocContext();
    self->context = v10;
  }
  ctrTrackerInitialization_setUpTracker(a3, (uint64_t *)v10, (float64x2_t *)a4);
}

- (void)trackInFrame:(__CVBuffer *)a3
{
  self->_confidence = *(float *)self->context->var1;
}

- (CGPoint)box
{
  return self->P;
}

- (void)setBox:(CGPoint *)a3
{
  self->P = a3;
}

- (BOOL)stableInd
{
  return self->stable;
}

- (void)setStableInd:(BOOL)a3
{
  self->stable = a3;
}

- (BOOL)lostTrackInd
{
  return self->lostTrack;
}

- (void)setLostTrackInd:(BOOL)a3
{
  self->lostTrack = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end