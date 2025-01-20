@interface BasicMOVReader
- (BOOL)hasReachedEndOfStream;
- (BasicMOVReader)initWithFileURL:(id)a3 error:(id *)a4;
- (__CVBuffer)getNextFrameTimestamp:(id *)a3 error:(id *)a4;
@end

@implementation BasicMOVReader

- (BasicMOVReader)initWithFileURL:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)BasicMOVReader;
  v6 = [(BasicMOVReader *)&v13 init];
  if (v6)
  {
    v7 = (void *)[MEMORY[0x263EFA470] assetWithURL:a3];
    uint64_t v8 = [MEMORY[0x263EFA4C0] assetReaderWithAsset:v7 error:a4];
    v6->_reader = (AVAssetReader *)v8;
    if (v8)
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x263EF9D48]), "objectAtIndex:", 0);
      uint64_t v14 = *MEMORY[0x263F04180];
      v15[0] = [NSNumber numberWithInt:875704422];
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v11 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v9 outputSettings:v10];
      v6->_output = (AVAssetReaderTrackOutput *)v11;
      if ([(AVAssetReader *)v6->_reader canAddOutput:v11]) {
        [(AVAssetReader *)v6->_reader addOutput:v6->_output];
      }
      [(AVAssetReader *)v6->_reader startReading];
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (__CVBuffer)getNextFrameTimestamp:(id *)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  v7 = (opaqueCMSampleBuffer *)[(AVAssetReaderTrackOutput *)self->_output copyNextSampleBuffer];
  if (!v7)
  {
    if ([(AVAssetReader *)self->_reader status] != AVAssetReaderStatusFailed)
    {
      uint64_t v10 = 0;
      self->_hasReachedEndOfStream = 1;
      return v10;
    }
    if (a4)
    {
      uint64_t v11 = (void *)[(NSError *)[(AVAssetReader *)self->_reader error] copy];
LABEL_11:
      uint64_t v10 = 0;
      *a4 = v11;
      return v10;
    }
    return 0;
  }
  uint64_t v8 = v7;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v7);
  if (!ImageBuffer)
  {
    if (a4)
    {
      uint64_t v14 = *MEMORY[0x263F08320];
      v15[0] = @"Sample buffer does not contain pixel data.";
      uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.videoeng.basicmovreader", 1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
      goto LABEL_11;
    }
    return 0;
  }
  uint64_t v10 = ImageBuffer;
  if (a3)
  {
    CMSampleBufferGetPresentationTimeStamp(&v13, v8);
    *(CMTime *)a3 = v13;
  }
  CVPixelBufferRetain(v10);
  CFRelease(v8);
  return v10;
}

- (BOOL)hasReachedEndOfStream
{
  return self->_hasReachedEndOfStream;
}

@end