@interface VideoAccessIndex
- (AVAsset)asset;
- (AVAssetTrack)videoTrack;
- (VideoReaderRand)readerRand;
- (id).cxx_construct;
- (id)initFromFile:(id)a3 pixelFormat:(unsigned int)a4 frameTimes:(const void *)a5;
- (int)getFrameAtIndex:(unsigned int)a3 pixBuf:(__CVBuffer *)a4;
- (void)setReaderRand:(id)a3;
@end

@implementation VideoAccessIndex

- (id)initFromFile:(id)a3 pixelFormat:(unsigned int)a4 frameTimes:(const void *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VideoAccessIndex;
  v9 = [(VideoAccessIndex *)&v19 init];
  if (v9)
  {
    id v10 = [[VideoReaderRand alloc] initFromFile:v8 frameTimes:a5];
    v11 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v10;

    v12 = (void *)*((void *)v9 + 7);
    if (!v12)
    {
      v17 = 0;
      goto LABEL_8;
    }
    [v12 setPixelFormatOptions:v6];
    if (v9 + 8 != a5) {
      sub_1DD3B5538(v9 + 8, *(char **)a5, *((void *)a5 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3));
    }
    *((_DWORD *)v9 + 8) = -1431655765 * ((*((void *)v9 + 2) - *((void *)v9 + 1)) >> 3);
    uint64_t v13 = [*((id *)v9 + 7) videoTrack];
    v14 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v13;

    uint64_t v15 = [*((id *)v9 + 7) asset];
    v16 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v15;
  }
  v17 = v9;
LABEL_8:

  return v17;
}

- (int)getFrameAtIndex:(unsigned int)a3 pixBuf:(__CVBuffer *)a4
{
  if (self->numFrames < a3) {
    return 4;
  }
  uint64_t v6 = (char *)self->mFrameTimes.__begin_ + 24 * a3;
  int v14 = 0;
  CMSampleBufferRef sbuf = 0;
  readerRand = self->readerRand;
  uint64_t v8 = *((void *)v6 + 2);
  long long v11 = *(_OWORD *)v6;
  uint64_t v12 = v8;
  int v4 = [(VideoReaderRand *)readerRand getFrameAtTime:&v11 frame:&sbuf rawFrameIndex:&v14];
  if (!v4)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    *a4 = ImageBuffer;
    CFRetain(ImageBuffer);
    CFRelease(sbuf);
  }
  return v4;
}

- (AVAssetTrack)videoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 40, 1);
}

- (AVAsset)asset
{
  return (AVAsset *)objc_getProperty(self, a2, 48, 1);
}

- (VideoReaderRand)readerRand
{
  return (VideoReaderRand *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReaderRand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->readerRand, 0);
  objc_storeStrong((id *)&self->asset, 0);
  objc_storeStrong((id *)&self->videoTrack, 0);
  begin = self->mFrameTimes.__begin_;
  if (begin)
  {
    self->mFrameTimes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end