@interface BaseTrack
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTimestamp;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimestamp;
- (BaseTrack)initWithObservation:(id)a3 identifier:(int64_t)a4 type:(int64_t)a5 atTime:(id *)a6;
- (BaseTrack)pairTrack;
- (CGRect)lastObservationBounds;
- (Detection)firstObservation;
- (Detection)lastObservation;
- (int64_t)identifier;
- (int64_t)type;
- (void)addObservation:(id)a3 atTime:(id *)a4;
- (void)dealloc;
- (void)setPairTrack:(id)a3;
@end

@implementation BaseTrack

- (BaseTrack)initWithObservation:(id)a3 identifier:(int64_t)a4 type:(int64_t)a5 atTime:(id *)a6
{
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BaseTrack;
  v12 = [(BaseTrack *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_firstObservation, a3);
    long long v14 = *(_OWORD *)&a6->var0;
    v13->_firstTimestamp.epoch = a6->var3;
    *(_OWORD *)&v13->_firstTimestamp.value = v14;
    objc_storeStrong((id *)&v13->_lastObservation, a3);
    int64_t var3 = a6->var3;
    *(_OWORD *)&v13->_lastTimestamp.value = *(_OWORD *)&a6->var0;
    v13->_lastTimestamp.epoch = var3;
    v13->_identifier = a4;
    v13->_type = a5;
    v16 = v13;
  }

  return v13;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BaseTrack;
  [(BaseTrack *)&v2 dealloc];
}

- (void)addObservation:(id)a3 atTime:(id *)a4
{
  objc_storeStrong((id *)&self->_lastObservation, a3);
  long long v6 = *(_OWORD *)&a4->var0;
  self->_lastTimestamp.epoch = a4->var3;
  *(_OWORD *)&self->_lastTimestamp.value = v6;
}

- (CGRect)lastObservationBounds
{
  [(Detection *)self->_lastObservation bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (Detection)firstObservation
{
  return self->_firstObservation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (Detection)lastObservation
{
  return self->_lastObservation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (BaseTrack)pairTrack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pairTrack);

  return (BaseTrack *)WeakRetained;
}

- (void)setPairTrack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->pairTrack);
  objc_storeStrong((id *)&self->_lastObservation, 0);

  objc_storeStrong((id *)&self->_firstObservation, 0);
}

@end