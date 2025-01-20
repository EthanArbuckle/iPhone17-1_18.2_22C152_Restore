@interface CKContextExtractionUtil
+ (id)_renderImageToSurfaceWithImage:(id)a3;
+ (void)renderLeadImage:(id)a3 toDonationItem:(id)a4;
+ (void)renderSnapshot:(id)a3 toDonationItem:(id)a4;
@end

@implementation CKContextExtractionUtil

+ (id)_renderImageToSurfaceWithImage:(id)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 ioSurface];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      [v4 size];
      double v9 = v8;
      double v11 = v10;
      [v4 scale];
      double v13 = v12;
      v28[0] = *MEMORY[0x1E4F2EF70];
      double v14 = v9 * v12;
      v15 = [NSNumber numberWithDouble:v14];
      v29[0] = v15;
      v28[1] = *MEMORY[0x1E4F2EF28];
      double v16 = v11 * v13;
      v17 = [NSNumber numberWithDouble:v16];
      uint64_t v18 = *MEMORY[0x1E4F2EF10];
      v29[1] = v17;
      v29[2] = &unk_1F0E605B0;
      uint64_t v19 = *MEMORY[0x1E4F2EF30];
      v28[2] = v18;
      v28[3] = v19;
      v20 = [NSNumber numberWithUnsignedInt:1111970369];
      v29[3] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

      v22 = (void *)[objc_alloc(MEMORY[0x1E4F2EF78]) initWithProperties:v21];
      [v22 lockWithOptions:1 seed:0];
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      uint64_t v24 = CGIOSurfaceContextCreate();
      if (v24)
      {
        v25 = (CGContext *)v24;
        v26 = (CGImage *)[v4 CGImage];
        v31.origin.x = 0.0;
        v31.origin.y = 0.0;
        v31.size.width = v14;
        v31.size.height = v16;
        CGContextDrawImage(v25, v31, v26);
        CGColorSpaceRelease(DeviceRGB);
        CGContextFlush(v25);
        CFRelease(v25);
        id v7 = v22;
      }
      else
      {
        CGColorSpaceRelease(DeviceRGB);
        id v7 = 0;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)renderLeadImage:(id)a3 toDonationItem:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = +[CKContextExtractionUtil _renderImageToSurfaceWithImage:a3];
    objc_msgSend(v5, "setLeadImage:");
  }
  else
  {
    id v6 = a4;
    [v6 setLeadImage:0];
  }
}

+ (void)renderSnapshot:(id)a3 toDonationItem:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = +[CKContextExtractionUtil _renderImageToSurfaceWithImage:a3];
    objc_msgSend(v5, "setSnapshot:");
  }
  else
  {
    id v6 = a4;
    [v6 setSnapshot:0];
  }
}

@end