@interface FlexMLSegment
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)summaryTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackTime;
- (FlexMLSegment)initWithDuration:(id *)a3 trackTime:(id *)a4 summaryTime:(id *)a5 gainFunction:(id)a6;
- (NSArray)gainFunction;
@end

@implementation FlexMLSegment

- (FlexMLSegment)initWithDuration:(id *)a3 trackTime:(id *)a4 summaryTime:(id *)a5 gainFunction:(id)a6
{
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FlexMLSegment;
  v12 = [(FlexMLSegment *)&v18 init];
  v13 = (FlexMLSegment *)v12;
  if (v12)
  {
    long long v14 = *(_OWORD *)&a3->var0;
    *((void *)v12 + 4) = a3->var3;
    *((_OWORD *)v12 + 1) = v14;
    long long v15 = *(_OWORD *)&a4->var0;
    *((void *)v12 + 7) = a4->var3;
    *(_OWORD *)(v12 + 40) = v15;
    long long v16 = *(_OWORD *)&a5->var0;
    *((void *)v12 + 10) = a5->var3;
    *((_OWORD *)v12 + 4) = v16;
    objc_storeStrong((id *)v12 + 1, a6);
  }

  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)trackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)summaryTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (NSArray)gainFunction
{
  return self->_gainFunction;
}

- (void).cxx_destruct
{
}

@end