@interface CAMTransientPairedVideo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime;
- (CAMTransientPairedVideo)initWithURL:(id)a3 stillDisplayTime:(id *)a4 filterType:(int64_t)a5;
- (NSURL)url;
- (int64_t)filterType;
@end

@implementation CAMTransientPairedVideo

- (CAMTransientPairedVideo)initWithURL:(id)a3 stillDisplayTime:(id *)a4 filterType:(int64_t)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMTransientPairedVideo;
  v9 = [(CAMTransientPairedVideo *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    long long v12 = *(_OWORD *)&a4->var0;
    *((void *)v9 + 5) = a4->var3;
    *(_OWORD *)(v9 + 24) = v12;
    *((void *)v9 + 2) = a5;
    v13 = v9;
  }

  return (CAMTransientPairedVideo *)v9;
}

- (NSURL)url
{
  return self->_url;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (void).cxx_destruct
{
}

@end