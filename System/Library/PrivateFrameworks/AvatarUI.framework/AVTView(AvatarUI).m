@interface AVTView(AvatarUI)
+ (id)snapshotAVTView:()AvatarUI matchingViewSize:highQuality:logger:;
@end

@implementation AVTView(AvatarUI)

+ (id)snapshotAVTView:()AvatarUI matchingViewSize:highQuality:logger:
{
  v29[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [v10 window];

  if (v12)
  {
    v13 = (void *)MEMORY[0x21052FFD0]();
    [v10 bounds];
    double v15 = v14;
    double v17 = v16;
    v18 = [v10 window];
    v19 = [v18 screen];
    [v19 scale];
    double v21 = v20;

    if (a5)
    {
      *(float *)&double v22 = v21;
      v23 = objc_msgSend(v9, "snapshotWithSize:scaleFactor:", v15, v17, v22);
    }
    else
    {
      uint64_t v28 = *MEMORY[0x263F29630];
      v24 = [NSNumber numberWithInt:1];
      v29[0] = v24;
      v25 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

      *(float *)&double v26 = v21;
      v23 = objc_msgSend(v9, "snapshotWithSize:scaleFactor:options:", v25, v15, v17, v26);
    }
  }
  else
  {
    [v11 logErrorSnapshottingAVTView:@"Can't determine snapshot pixel size without a window"];
    v23 = 0;
  }

  return v23;
}

@end