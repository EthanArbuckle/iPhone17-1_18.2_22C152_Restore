@interface CIBurstThumbnailCluster
- (CIBurstThumbnailCluster)init;
- (CIBurstThumbnailCluster)initWithImageData:(id)a3 dict:(id)a4 identifier:(id)a5 imageProps:(id)a6 completionBlock:(id)a7;
- (CIBurstYUVImage)image;
- (NSMutableArray)burstImages;
- (NSMutableDictionary)imageProps;
- (__IOSurface)fullsizeJpegData;
- (float)computeMergeCost:(id)a3 :(int *)a4 :(int)a5;
- (id)completionBlock;
- (void)addItemsFromCluster:(id)a3;
- (void)dealloc;
- (void)releaseImage;
- (void)setBurstImages:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setFullsizeJpegData:(__IOSurface *)a3;
- (void)setImage:(id)a3;
- (void)setImageProps:(id)a3;
@end

@implementation CIBurstThumbnailCluster

- (CIBurstThumbnailCluster)init
{
  self->burstImages = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  self->imageProps = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIBurstThumbnailCluster;
  return [(CIBurstThumbnailCluster *)&v4 init];
}

- (CIBurstThumbnailCluster)initWithImageData:(id)a3 dict:(id)a4 identifier:(id)a5 imageProps:(id)a6 completionBlock:(id)a7
{
  v33.receiver = self;
  v33.super_class = (Class)CIBurstThumbnailCluster;
  v12 = [(CIBurstThumbnailCluster *)&v33 init];
  v12->burstImages = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  [(CIBurstThumbnailCluster *)v12 setImageProps:a6];
  [(CIBurstThumbnailCluster *)v12 setImage:a3];
  [(CIBurstThumbnailCluster *)v12 setCompletionBlock:a7];
  v13 = [[CIBurstImageStat alloc] initWithIdentifier:a5];
  BurstLoggingMessage("ThumbnailCluster - adding %s\n", (const char *)[a5 UTF8String]);
  if (!a4) {
    goto LABEL_28;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v15 = [a4 objectForKey:@"JpegData"];
  if (v15)
  {
    [(CIBurstThumbnailCluster *)v12 setFullsizeJpegData:v15];
    [(CIBurstImageStat *)v13 setFullsizeJpegData:[(CIBurstThumbnailCluster *)v12 fullsizeJpegData]];
    -[CIBurstImageStat setFullsizeJpegSize:](v13, "setFullsizeJpegSize:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"JpegDataSize"), "intValue"));
  }
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v16 = [a4 objectForKey:*MEMORY[0x1E4F2FCA0]];
  if (v16)
  {
    v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    -[CIBurstImageStat setOrientation:](v13, "setOrientation:", [v17 intValue]);
  }
  uint64_t v18 = [a4 objectForKey:*MEMORY[0x1E4F2FC20]];
  if (!v18)
  {
LABEL_28:
    BurstLoggingMessage("[CIBurstThumbnailCluster initWithImageData] : no error\n");
    goto LABEL_29;
  }
  v19 = (void *)v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = (void *)[v19 objectForKey:@"6"];
    if (v20) {
      uint64_t v21 = [v20 intValue];
    }
    else {
      uint64_t v21 = 0;
    }
    [(CIBurstImageStat *)v13 setAEAverage:v21];
    v22 = (void *)[v19 objectForKey:@"5"];
    if (v22) {
      uint64_t v23 = [v22 intValue];
    }
    else {
      uint64_t v23 = 0;
    }
    [(CIBurstImageStat *)v13 setAETarget:v23];
    v24 = (void *)[v19 objectForKey:@"4"];
    if (v24) {
      BOOL v25 = [v24 intValue] != 0;
    }
    else {
      BOOL v25 = 0;
    }
    [(CIBurstImageStat *)v13 setAEStable:v25];
    v26 = (void *)[v19 objectForKey:@"7"];
    if (v26) {
      BOOL v27 = [v26 intValue] != 0;
    }
    else {
      BOOL v27 = 0;
    }
    [(CIBurstImageStat *)v13 setAFStable:v27];
    uint64_t v28 = [v19 objectForKey:@"2"];
    if (!v28 || [(CIBurstImageStat *)v13 setAEMatrix:v28]) {
      [(CIBurstImageStat *)v13 computeAEMatrix:a3];
    }
    CFDictionaryRef v29 = (const __CFDictionary *)[v19 objectForKey:@"3"];
    if (v29)
    {
      memset(&v32, 0, sizeof(v32));
      CMTimeMakeFromDictionary(&v32, v29);
      CMTime time = v32;
      [(CIBurstImageStat *)v13 setTimestamp:CMTimeGetSeconds(&time)];
    }
    goto LABEL_28;
  }
LABEL_12:
  BurstLoggingMessage("[CIBurstThumbnailCluster initWithImageData] : metadata parsing error\n");
LABEL_29:
  [(NSMutableArray *)v12->burstImages addObject:v13];

  return v12;
}

- (void)dealloc
{
  burstImages = self->burstImages;
  if (burstImages)
  {

    self->burstImages = 0;
  }
  [(CIBurstThumbnailCluster *)self releaseImage];
  v4.receiver = self;
  v4.super_class = (Class)CIBurstThumbnailCluster;
  [(CIBurstThumbnailCluster *)&v4 dealloc];
}

- (void)releaseImage
{
  image = self->image;
  if (image)
  {

    self->image = 0;
  }
  imageProps = self->imageProps;
  if (imageProps)
  {

    self->imageProps = 0;
  }
  if ([(CIBurstThumbnailCluster *)self fullsizeJpegData])
  {
    CFRelease([(CIBurstThumbnailCluster *)self fullsizeJpegData]);
    [(CIBurstThumbnailCluster *)self setFullsizeJpegData:0];
  }
}

- (void)addItemsFromCluster:(id)a3
{
}

- (float)computeMergeCost:(id)a3 :(int *)a4 :(int)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(NSMutableArray *)self->burstImages count];
  v24 = a3;
  float v10 = -1.0;
  if ((float)((float)a5 / 1.5) >= (float)(unint64_t)([*((id *)a3 + 1) count] + v9))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = self->burstImages;
    uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      uint64_t v23 = *(void *)v31;
      float v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v13 = (void *)v24[1];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                int v19 = [v12 temporalOrder];
                int v20 = [v18 temporalOrder] + v19 * a5;
                if (v10 < (float)a4[v20]) {
                  float v10 = (float)a4[v20];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v15);
          }
        }
        uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v25);
    }
    else
    {
      return 0.0;
    }
  }
  return v10;
}

- (NSMutableArray)burstImages
{
  return self->burstImages;
}

- (void)setBurstImages:(id)a3
{
  self->burstImages = (NSMutableArray *)a3;
}

- (NSMutableDictionary)imageProps
{
  return self->imageProps;
}

- (void)setImageProps:(id)a3
{
  self->imageProps = (NSMutableDictionary *)a3;
}

- (CIBurstYUVImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
  self->image = (CIBurstYUVImage *)a3;
}

- (id)completionBlock
{
  return self->completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  self->completionBlock = a3;
}

- (__IOSurface)fullsizeJpegData
{
  return self->_fullsizeJpegData;
}

- (void)setFullsizeJpegData:(__IOSurface *)a3
{
  self->_fullsizeJpegData = a3;
}

@end