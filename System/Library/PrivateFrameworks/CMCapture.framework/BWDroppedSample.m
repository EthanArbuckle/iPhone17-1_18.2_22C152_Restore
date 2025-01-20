@interface BWDroppedSample
+ (id)newDroppedSampleFromDroppedSample:(id)a3 backPressureSemaphoresToIgnore:(id)a4;
+ (id)newDroppedSampleWithReason:(id)a3 pts:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts;
- (NSArray)backPressureSemaphoresToIgnore;
- (NSString)reason;
- (void)_initDroppedSampleWithReason:(uint64_t)a3 pts:(uint64_t)a4 backPressureSemaphoresToIgnore:;
- (void)dealloc;
@end

@implementation BWDroppedSample

+ (id)newDroppedSampleWithReason:(id)a3 pts:(id *)a4
{
  v6 = [BWDroppedSample alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  return -[BWDroppedSample _initDroppedSampleWithReason:pts:backPressureSemaphoresToIgnore:](v6, a3, (uint64_t)&v8, 0);
}

- (void)_initDroppedSampleWithReason:(uint64_t)a3 pts:(uint64_t)a4 backPressureSemaphoresToIgnore:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)BWDroppedSample;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  if (v7)
  {
    v7[1] = [a2 copy];
    uint64_t v8 = *(void *)(a3 + 16);
    *((_OWORD *)v7 + 1) = *(_OWORD *)a3;
    v7[4] = v8;
    v7[5] = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a4];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDroppedSample;
  [(BWDroppedSample *)&v3 dealloc];
}

- (NSString)reason
{
  return self->_reason;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

+ (id)newDroppedSampleFromDroppedSample:(id)a3 backPressureSemaphoresToIgnore:(id)a4
{
  v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:a4];
  uint64_t v6 = (uint64_t)v5;
  if (*((void *)a3 + 5)) {
    objc_msgSend(v5, "addObjectsFromArray:");
  }
  v7 = [BWDroppedSample alloc];
  uint64_t v8 = (void *)*((void *)a3 + 1);
  long long v10 = *((_OWORD *)a3 + 1);
  uint64_t v11 = *((void *)a3 + 4);
  return -[BWDroppedSample _initDroppedSampleWithReason:pts:backPressureSemaphoresToIgnore:](v7, v8, (uint64_t)&v10, v6);
}

- (NSArray)backPressureSemaphoresToIgnore
{
  return self->_backPressureSemaphoresToIgnore;
}

@end