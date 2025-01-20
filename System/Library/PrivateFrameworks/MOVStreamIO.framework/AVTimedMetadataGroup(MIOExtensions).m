@interface AVTimedMetadataGroup(MIOExtensions)
+ (id)attachmentsMIOTimedMetadataGroupForDictionary:()MIOExtensions pts:error:;
+ (id)attachmentsMIOTimedMetadataGroupForPixelBuffer:()MIOExtensions pts:error:;
+ (id)attachmentsMIOTimedMetadataGroupForSampleBuffer:()MIOExtensions pts:error:;
+ (id)metadataGroupForMetadataStreamFromData:()MIOExtensions timeStamp:copyData:;
@end

@implementation AVTimedMetadataGroup(MIOExtensions)

+ (id)attachmentsMIOTimedMetadataGroupForSampleBuffer:()MIOExtensions pts:error:
{
  v13[1] = *MEMORY[0x263EF8340];
  CMTime start = *a4;
  v5 = objc_msgSend(MEMORY[0x263EFA748], "attachmentsMIOTimedMetadataItemForSampleBuffer:pts:error:", a3, &start);
  id v6 = objc_alloc(MEMORY[0x263EFA8C0]);
  v13[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  CMTime start = *a4;
  CMTime v10 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
  CMTimeRangeMake(&v11, &start, &v10);
  v8 = (void *)[v6 initWithItems:v7 timeRange:&v11];

  return v8;
}

+ (id)attachmentsMIOTimedMetadataGroupForPixelBuffer:()MIOExtensions pts:error:
{
  v13[1] = *MEMORY[0x263EF8340];
  CMTime start = *a4;
  v5 = objc_msgSend(MEMORY[0x263EFA748], "attachmentsMIOMetadataItemForPixelBuffer:pts:error:", a3, &start);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFA8C0]);
    v13[0] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    CMTime start = *a4;
    CMTime v10 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v11, &start, &v10);
    v8 = (void *)[v6 initWithItems:v7 timeRange:&v11];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)attachmentsMIOTimedMetadataGroupForDictionary:()MIOExtensions pts:error:
{
  v13[1] = *MEMORY[0x263EF8340];
  CMTime start = *a4;
  v5 = objc_msgSend(MEMORY[0x263EFA748], "attachmentsMIOMetadataItemForDictionary:pts:error:", a3, &start);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFA8C0]);
    v13[0] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    CMTime start = *a4;
    CMTime v10 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v11, &start, &v10);
    v8 = (void *)[v6 initWithItems:v7 timeRange:&v11];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)metadataGroupForMetadataStreamFromData:()MIOExtensions timeStamp:copyData:
{
  id v6 = [MEMORY[0x263EFA748] metadataItemsForMetadataStreamFromData:a3 copyData:a5];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFA8C0]);
    CMTime start = *a4;
    CMTime v10 = *(CMTime *)*(void *)&MEMORY[0x263F01098];
    CMTimeRangeMake(&v12, &start, &v10);
    v8 = (void *)[v7 initWithItems:v6 timeRange:&v12];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end