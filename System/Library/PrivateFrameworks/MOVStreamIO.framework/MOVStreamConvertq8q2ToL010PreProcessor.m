@interface MOVStreamConvertq8q2ToL010PreProcessor
- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5;
- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3;
- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4;
- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3;
- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3;
@end

@implementation MOVStreamConvertq8q2ToL010PreProcessor

- (unsigned)encodedPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return 1278226736;
}

- (opaqueCMFormatDescription)formatDescriptionForPixelBuffer:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4
{
  result = a4->var0;
  if (!a4->var1)
  {
    if (result) {
      CFRelease(result);
    }
    result = +[MOVStreamIOUtility formatForPixelBuffer:a3];
    a4->var0 = result;
    a4->var1 = 1;
  }
  return result;
}

- (unsigned)inputPixelFormatFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamWriter getPixelFormatFromStreamData:a3];
}

- (__CVBuffer)processedPixelBufferCopyOf:(__CVBuffer *)a3 streamData:(StreamRecordingData *)a4 error:(id *)a5
{
  v33[6] = *MEMORY[0x263EF8340];
  p_var12 = &a4->var12;
  v9 = (MIOPixelBufferPool *)a4->var12;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (!v9)
  {
    unint64_t v12 = Height;
    v32[0] = *MEMORY[0x263F040F8];
    v13 = [NSNumber numberWithUnsignedLong:(unint64_t)-((double)Width - ceil((double)Width * 0.015625) * 64.0)];
    v33[0] = v13;
    v32[1] = *MEMORY[0x263F04118];
    v14 = [NSNumber numberWithUnsignedLong:v12];
    v33[1] = v14;
    v32[2] = *MEMORY[0x263F04130];
    uint64_t v30 = *MEMORY[0x263F0ED58];
    v15 = [NSNumber numberWithInt:a4->var22];
    v31 = v15;
    v16 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v17 = *MEMORY[0x263F04180];
    v33[2] = v16;
    v33[3] = &unk_26CB7D440;
    uint64_t v18 = *MEMORY[0x263F04240];
    v32[3] = v17;
    v32[4] = v18;
    v19 = [NSNumber numberWithUnsignedLong:Width];
    v33[4] = v19;
    v32[5] = *MEMORY[0x263F040D8];
    v20 = [NSNumber numberWithUnsignedLong:(unint64_t)-((double)v12 - ceil((double)v12 * 0.015625) * 64.0)];
    v33[5] = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];

    uint64_t v28 = *MEMORY[0x263F041C0];
    v29 = &unk_26CB7D458;
    v22 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v9 = [[MIOPixelBufferPool alloc] initWithPixelBuffer:0 bufferAttributes:v21 poolAttributes:v22 error:0];
    if (!v9)
    {
      v25 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create L008 pixel buffer pool for Non-Planar stream." code:19];
      v26 = v25;
      if (a5) {
        *a5 = v25;
      }

      v9 = 0;
      goto LABEL_10;
    }
    objc_storeStrong(p_var12, v9);
  }
  v23 = [(MIOPixelBufferPool *)v9 getPixelBuffer];
  if (!+[MIOPixelBufferUtility transferq8q2PixelBuffer:a3 toL010PixelBuffer:v23])
  {
    CVPixelBufferRelease(v23);
    CVPixelBufferRelease(a3);
    v24 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot convert q8q2 to L010 buffer." code:20];
    id v21 = v24;
    if (a5)
    {
      id v21 = v24;
      *a5 = v21;
    }
LABEL_10:

    v23 = 0;
  }

  return v23;
}

- (opaqueCMFormatDescription)createTrackFormatDescriptionFromStreamData:(StreamRecordingData *)a3
{
  return +[MOVStreamIOUtility createL010FormatDescriptionFromL016FormatDescription:a3->var0];
}

@end