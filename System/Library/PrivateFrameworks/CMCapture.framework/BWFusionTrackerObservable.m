@interface BWFusionTrackerObservable
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTimestamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionTimestamp;
- (CGRect)box;
- (char)initWithKind:(long long *)a3 box:(uint64_t)a4 confidence:(void *)a5 timestamp:(double)a6 identifier:(double)a7 metadata:(double)a8;
- (float)confidence;
- (id)metadata;
- (int64_t)objectKind;
- (unint64_t)identifier;
- (void)dealloc;
@end

@implementation BWFusionTrackerObservable

- (char)initWithKind:(long long *)a3 box:(uint64_t)a4 confidence:(void *)a5 timestamp:(double)a6 identifier:(double)a7 metadata:(double)a8
{
  if (!a1) {
    return 0;
  }
  v23.receiver = a1;
  v23.super_class = (Class)BWFusionTrackerObservable;
  v19 = (char *)objc_msgSendSuper2(&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    *((void *)v19 + 5) = a2;
    *((double *)v19 + 1) = a6;
    *((double *)v19 + 2) = a7;
    *((double *)v19 + 3) = a8;
    *((double *)v19 + 4) = a9;
    *((float *)v19 + 12) = a10;
    *((void *)v19 + 14) = a4;
    long long v21 = *a3;
    *(void *)(v19 + 68) = *((void *)a3 + 2);
    *(_OWORD *)(v19 + 52) = v21;
    *((void *)v19 + 13) = a5;
  }
  return v20;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFusionTrackerObservable;
  [(BWFusionTrackerObservable *)&v3 dealloc];
}

- (CGRect)box
{
  double x = self->_box.origin.x;
  double y = self->_box.origin.y;
  double width = self->_box.size.width;
  double height = self->_box.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)objectKind
{
  return self->_objectKind;
}

- (float)confidence
{
  return self->_confidence;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTimestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionTimestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- (id)metadata
{
  return self->_metadata;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

@end