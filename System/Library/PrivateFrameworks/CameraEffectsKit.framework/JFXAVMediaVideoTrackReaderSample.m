@interface JFXAVMediaVideoTrackReaderSample
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- ($70930193D4F448A53BB9343C0237EB5F)timeRange;
- (JFXAVMediaVideoTrackReaderSample)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (JFXAVMediaVideoTrackReaderSample)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 duration:(id *)a4;
- (opaqueCMSampleBuffer)sampleBufferRef;
- (void)dealloc;
@end

@implementation JFXAVMediaVideoTrackReaderSample

- (JFXAVMediaVideoTrackReaderSample)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 duration:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)JFXAVMediaVideoTrackReaderSample;
  v6 = [(JFXAVMediaVideoTrackReaderSample *)&v9 init];
  if (v6)
  {
    if (a3) {
      CFRetain(a3);
    }
    long long v7 = *(_OWORD *)&a4->var0;
    v6->_duration.epoch = a4->var3;
    *(_OWORD *)&v6->_duration.value = v7;
    v6->_sampleBufferRef = a3;
  }
  return v6;
}

- (JFXAVMediaVideoTrackReaderSample)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  return [(JFXAVMediaVideoTrackReaderSample *)self initWithSampleBuffer:a3 duration:&v4];
}

- (void)dealloc
{
  CFRelease(self->_sampleBufferRef);
  v3.receiver = self;
  v3.super_class = (Class)JFXAVMediaVideoTrackReaderSample;
  [(JFXAVMediaVideoTrackReaderSample *)&v3 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  long long v4 = [(JFXAVMediaVideoTrackReaderSample *)self sampleBufferRef];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp((CMTime *)retstr, v4);
}

- ($70930193D4F448A53BB9343C0237EB5F)timeRange
{
  [(JFXAVMediaVideoTrackReaderSample *)self presentationTimeStamp];
  [(JFXAVMediaVideoTrackReaderSample *)self duration];
  return ($70930193D4F448A53BB9343C0237EB5F *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v6);
}

- (opaqueCMSampleBuffer)sampleBufferRef
{
  return self->_sampleBufferRef;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

@end