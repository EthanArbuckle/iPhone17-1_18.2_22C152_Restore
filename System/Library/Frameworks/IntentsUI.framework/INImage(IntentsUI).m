@interface INImage(IntentsUI)
+ (double)imageSizeForIntentResponse:()IntentsUI;
+ (id)imageWithCGImage:()IntentsUI;
+ (id)imageWithUIImage:()IntentsUI;
- (void)fetchUIImageWithCompletion:()IntentsUI;
@end

@implementation INImage(IntentsUI)

- (void)fetchUIImageWithCompletion:()IntentsUI
{
  v4 = a3;
  if (v4)
  {
    v5 = [a1 _imageData];

    if (v5)
    {
      v6 = (void *)MEMORY[0x263F1C6B0];
      v7 = [a1 _imageData];
      v8 = [v6 imageWithData:v7];
      v4[2](v4, v8);

LABEL_4:
      goto LABEL_20;
    }
    v9 = [a1 _name];

    if (!v9)
    {
      v27 = [a1 _uri];

      if (!v27) {
        goto LABEL_20;
      }
      v28 = [a1 _uri];
      int v29 = [v28 isFileURL];

      if (!v29)
      {
        v39 = [MEMORY[0x263F08BF8] sharedSession];
        v40 = [a1 _uri];
        v42[0] = MEMORY[0x263EF8330];
        v42[1] = 3221225472;
        v42[2] = __49__INImage_IntentsUI__fetchUIImageWithCompletion___block_invoke;
        v42[3] = &unk_263FD6D90;
        v43 = v4;
        v41 = [v39 dataTaskWithURL:v40 completionHandler:v42];

        [v41 resume];
        goto LABEL_20;
      }
      v30 = (void *)MEMORY[0x263F1C6B0];
      v7 = [a1 _uri];
      v31 = [v7 absoluteString];
      v32 = [v30 imageWithContentsOfFile:v31];
      v4[2](v4, v32);

      goto LABEL_4;
    }
    v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = [a1 _bundleIdentifier];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [a1 _bundleIdentifier];
      v14 = [v10 bundleIdentifier];
      char v15 = [v13 isEqualToString:v14];

      if ((v15 & 1) == 0)
      {
        v16 = (void *)MEMORY[0x263F01888];
        v17 = [a1 _bundleIdentifier];
        v18 = [v16 bundleProxyForIdentifier:v17];

        v19 = (void *)MEMORY[0x263F086E0];
        v20 = [v18 bundleURL];
        v21 = [v20 path];
        uint64_t v22 = [v19 bundleWithPath:v21];

        if (!v22)
        {
          v23 = (void *)MEMORY[0x263F086E0];
          v24 = [a1 _bundleIdentifier];
          uint64_t v22 = [v23 bundleWithIdentifier:v24];
        }
        v10 = (void *)v22;
      }
    }
    uint64_t v25 = [a1 _bundleIdentifier];
    if (v25)
    {
      v26 = (void *)v25;
    }
    else
    {
      v33 = [a1 _bundlePath];

      if (!v33)
      {
LABEL_19:
        v36 = (void *)MEMORY[0x263F1C6B0];
        v37 = [a1 _name];
        v38 = [v36 imageNamed:v37 inBundle:v10 compatibleWithTraitCollection:0];
        v4[2](v4, v38);

        goto LABEL_20;
      }
      v34 = (void *)MEMORY[0x263F086E0];
      v26 = [a1 _bundlePath];
      uint64_t v35 = [v34 bundleWithPath:v26];

      v10 = (void *)v35;
    }

    goto LABEL_19;
  }
LABEL_20:
}

+ (double)imageSizeForIntentResponse:()IntentsUI
{
  return 60.0;
}

+ (id)imageWithUIImage:()IntentsUI
{
  v3 = a3;
  v4 = UIImagePNGRepresentation(v3);
  v5 = [MEMORY[0x263F0FB88] imageWithImageData:v4];
  [(UIImage *)v3 size];
  double v7 = v6;
  [(UIImage *)v3 size];
  [v5 _setImageSize:v7];
  unint64_t v8 = [(UIImage *)v3 renderingMode];

  if (v8 <= 2) {
    [v5 _setRenderingMode:v8];
  }

  return v5;
}

+ (id)imageWithCGImage:()IntentsUI
{
  v4 = (void *)MEMORY[0x263F0FB88];
  DataProvider = CGImageGetDataProvider(image);
  CFDataRef v6 = CGDataProviderCopyData(DataProvider);
  double v7 = [v4 imageWithImageData:v6];

  double Width = (double)CGImageGetWidth(image);
  objc_msgSend(v7, "_setImageSize:", Width, (double)CGImageGetHeight(image));

  return v7;
}

@end