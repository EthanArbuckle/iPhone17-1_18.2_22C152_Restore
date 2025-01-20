@interface VideoReaderRand
- (id).cxx_construct;
- (id)initFromFile:(id)a3 frameTimes:(const void *)a4;
- (id)initFromFile:(id)a3 withParams:(id)a4;
- (int)getFrameAtTime:(id *)a3 frame:(opaqueCMSampleBuffer *)a4 rawFrameIndex:(unsigned int *)a5;
- (int)indexForTime:(id *)a3;
- (int)reset;
@end

@implementation VideoReaderRand

- (id)initFromFile:(id)a3 frameTimes:(const void *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VideoReaderRand;
  v7 = [(VideoReader *)&v12 initFromFile:v6];
  v8 = v7;
  if (v7)
  {
    v9 = v7 + 320;
    if (v7 + 320 != a4) {
      sub_1DD3B5538(v7 + 320, *(char **)a4, *((void *)a4 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3));
    }
    *((_DWORD *)v8 + 87) = -1431655765 * ((v9[1] - *v9) >> 3);
    *((_DWORD *)v8 + 86) = -1;
    [v8 setReadAheadEnable:0];
    v10 = v8;
  }

  return v8;
}

- (id)initFromFile:(id)a3 withParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[VideoReaderRand initFromFile:frameTimes:](self, "initFromFile:frameTimes:", v6, [v7 frameTimes]);

  return v8;
}

- (int)reset
{
  self->_lastFrameDex = -1;
  v3.receiver = self;
  v3.super_class = (Class)VideoReaderRand;
  return [(VideoReader *)&v3 reset];
}

- (int)indexForTime:(id *)a3
{
  CMTime time1 = *(CMTime *)a3;
  begin = self->_frameTimes.__begin_;
  CMTimeEpoch v6 = *((void *)begin + 2);
  *(_OWORD *)&time2.value = *(_OWORD *)begin;
  time2.epoch = v6;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    LODWORD(v11) = -1;
  }
  else
  {
    unsigned int lastFrameDex = self->_lastFrameDex;
    if ((lastFrameDex & 0x80000000) != 0
      || (CMTime v24 = (CMTime)*a3,
          id v8 = (char *)self->_frameTimes.__begin_ + 24 * lastFrameDex,
          CMTimeEpoch v9 = *((void *)v8 + 2),
          *(_OWORD *)&v23.value = *(_OWORD *)v8,
          v23.epoch = v9,
          CMTimeCompare(&v24, &v23) < 1))
    {
      int v10 = 0;
    }
    else
    {
      int v10 = self->_lastFrameDex;
    }
    LODWORD(v11) = self->_numFrames - 1;
    if (v10 < (int)v11)
    {
      uint64_t v12 = v10;
      do
      {
        v13 = (char *)self->_frameTimes.__begin_ + 24 * v12;
        CMTimeEpoch v14 = *((void *)v13 + 2);
        *(_OWORD *)&v22.value = *(_OWORD *)v13;
        v22.epoch = v14;
        CMTime v21 = (CMTime)*a3;
        if (CMTimeCompare(&v22, &v21) < 1)
        {
          CMTime v20 = (CMTime)*a3;
          uint64_t v15 = v12 + 1;
          v16 = (char *)self->_frameTimes.__begin_ + 24 * v12 + 24;
          CMTimeEpoch v17 = *((void *)v16 + 2);
          *(_OWORD *)&v19.value = *(_OWORD *)v16;
          v19.epoch = v17;
          if (CMTimeCompare(&v20, &v19) < 0)
          {
            LODWORD(v11) = v12;
            return v11;
          }
        }
        else
        {
          uint64_t v15 = v12 + 1;
        }
        uint64_t v11 = self->_numFrames - 1;
        uint64_t v12 = v15;
      }
      while (v15 < v11);
    }
  }
  return v11;
}

- (int)getFrameAtTime:(id *)a3 frame:(opaqueCMSampleBuffer *)a4 rawFrameIndex:(unsigned int *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26 = *a3;
  unsigned int v8 = [(VideoReaderRand *)self indexForTime:&v26];
  if ((v8 & 0x80000000) != 0) {
    return 3;
  }
  signed int v9 = v8;
  begin = self->_frameTimes.__begin_;
  uint64_t v11 = (CMTime *)((char *)begin + 24 * v8);
  CMTime v25 = *v11;
  unsigned int lastFrameDex = self->_lastFrameDex;
  if ((lastFrameDex & 0x80000000) != 0) {
    goto LABEL_7;
  }
  long long v13 = *(_OWORD *)&v11->value;
  time1.epoch = v11->epoch;
  *(_OWORD *)&time1.value = v13;
  CMTimeEpoch v14 = (char *)begin + 24 * lastFrameDex;
  long long v15 = *(_OWORD *)v14;
  time2.epoch = *((void *)v14 + 2);
  *(_OWORD *)&time2.value = v15;
  if (CMTimeCompare(&time1, &time2) < 1 || (int v16 = self->_lastFrameDex, v9 >= v16 + 5))
  {
    [(VideoReaderRand *)self reset];
    int v16 = self->_lastFrameDex;
  }
  if (v16 < 0)
  {
LABEL_7:
    CMTime v22 = v25;
    [(VideoReader *)self setReadStartT:&v22];
    self->_unsigned int lastFrameDex = v9 - 1;
  }
  int v17 = 7;
  while (1)
  {
    int result = [(VideoReader *)self getFrameAsSampleBuf:a4];
    if (result) {
      break;
    }
    [(VideoReader *)self lastPresentationTime];
    CMTime v20 = v25;
    int result = CMTimeCompare(&v21, &v20);
    if (result >= 1)
    {
      NSLog(&cfstr_Videoreaderran.isa);
      return 3;
    }
    int v19 = self->_lastFrameDex + 1;
    self->_unsigned int lastFrameDex = v19;
    if (!result)
    {
      *a5 = v19;
      return result;
    }
    if (!--v17)
    {
      NSLog(&cfstr_Videoreaderran_0.isa, 7);
      return 3;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  p_frameTimes = &self->_frameTimes;
  begin = self->_frameTimes.__begin_;
  if (begin)
  {
    p_frameTimes->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 41) = 0;
  *((void *)self + 42) = 0;
  *((void *)self + 40) = 0;
  return self;
}

@end