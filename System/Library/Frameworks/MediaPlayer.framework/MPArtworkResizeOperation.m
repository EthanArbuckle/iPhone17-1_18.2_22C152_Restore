@interface MPArtworkResizeOperation
- (BOOL)usesExactFittingSizeAsDestinationSize;
- (CGSize)_resizedScaledSizeForScaledImageSize:(CGSize)a3 scaledFittingSize:(CGSize)a4;
- (CGSize)scaledFittingSize;
- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4;
- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4 destinationURL:(id)a5;
- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4 useExactFittingSizeAsDestinationSize:(BOOL)a5 destinationURL:(id)a6;
- (NSError)error;
- (NSURL)destinationURL;
- (OS_dispatch_group)operationGroup;
- (UIImage)image;
- (UIImage)resizedImage;
- (void)main;
- (void)setImage:(id)a3;
- (void)setScaledFittingSize:(CGSize)a3;
- (void)setUsesExactFittingSizeAsDestinationSize:(BOOL)a3;
@end

@implementation MPArtworkResizeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_resizedImage, 0);
}

- (void)setUsesExactFittingSizeAsDestinationSize:(BOOL)a3
{
  self->_usesExactFittingSizeAsDestinationSize = a3;
}

- (BOOL)usesExactFittingSizeAsDestinationSize
{
  return self->_usesExactFittingSizeAsDestinationSize;
}

- (void)setScaledFittingSize:(CGSize)a3
{
  self->_scaledFittingSize = a3;
}

- (CGSize)scaledFittingSize
{
  double width = self->_scaledFittingSize.width;
  double height = self->_scaledFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (OS_dispatch_group)operationGroup
{
  return self->_operationGroup;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (NSError)error
{
  return self->_error;
}

- (UIImage)resizedImage
{
  return self->_resizedImage;
}

- (CGSize)_resizedScaledSizeForScaledImageSize:(CGSize)a3 scaledFittingSize:(CGSize)a4
{
  if (a3.width <= a4.width)
  {
    a4.double width = a3.width;
    double height = a3.height;
  }
  else
  {
    double height = floor(a3.height * a4.width / a3.width);
  }
  if (height > a4.height)
  {
    a4.double width = floor(a3.width * a4.height / a3.height);
    double height = a4.height;
  }
  double width = a4.width;
  double v6 = height;
  result.double height = v6;
  result.double width = width;
  return result;
}

- (void)main
{
  v60[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MPArtworkResizeOperation *)self destinationURL];
  v4 = [v3 path];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:2 error:0];
    double v6 = [MEMORY[0x1E4FB1818] imageWithData:v5];
    resizedImage = self->_resizedImage;
    self->_resizedImage = v6;
  }
  if (!self->_resizedImage)
  {
    v8 = [(MPArtworkResizeOperation *)self image];
    [v8 size];
    double v10 = v9;
    double v12 = v11;

    v13 = [(MPArtworkResizeOperation *)self image];
    [v13 scale];
    double v15 = v14;

    [(MPArtworkResizeOperation *)self scaledFittingSize];
    double v17 = v16;
    double v19 = v18;
    v20 = [(MPArtworkResizeOperation *)self image];

    if (!v20)
    {
      v21 = @"Failed to resize nil image.";
LABEL_15:
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v59 = *MEMORY[0x1E4F28228];
      v60[0] = v21;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
      v24 = [v22 errorWithDomain:@"MPArtworkResizeErrorDomain" code:0 userInfo:v23];
      error = self->_error;
      self->_error = v24;

LABEL_34:
      goto LABEL_35;
    }
    if (v10 <= 0.00000011920929 || v12 <= 0.00000011920929)
    {
      [NSString stringWithFormat:@"Input image has invalid size: {%f, %f}.", *(void *)&v10, *(void *)&v12];
    }
    else if (v15 <= 0.00000011920929)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Input image has invalid scale: %f.", *(void *)&v15, v49);
    }
    else
    {
      if (v17 > 0.00000011920929 && v19 > 0.00000011920929) {
        goto LABEL_16;
      }
      [NSString stringWithFormat:@"Failed to resize image with invalid scaled fitting size: {%f, %f}.", *(void *)&v17, *(void *)&v19];
    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v21) {
      goto LABEL_15;
    }
LABEL_16:
    -[MPArtworkResizeOperation _resizedScaledSizeForScaledImageSize:scaledFittingSize:](self, "_resizedScaledSizeForScaledImageSize:scaledFittingSize:", v10 * v15, v12 * v15, v17, v19);
    double v27 = v26;
    double v29 = v28;
    BOOL v30 = [(MPArtworkResizeOperation *)self usesExactFittingSizeAsDestinationSize];
    if (v30) {
      double v31 = v17;
    }
    else {
      double v31 = v27;
    }
    if (v30) {
      double v32 = v19;
    }
    else {
      double v32 = v29;
    }
    BOOL v33 = v32 > v29 + 0.00000011920929 || v31 > v27 + 0.00000011920929;
    double v34 = v27 / v15;
    double v35 = v29 / v15;
    double v36 = v31 / v15;
    double v37 = round((v31 / v15 - v34) * 0.5);
    double v38 = v32 / v15;
    double v39 = round((v32 / v15 - v35) * 0.5);
    v21 = [MEMORY[0x1E4FB17E0] preferredFormat];
    [(__CFString *)v21 setOpaque:!v33];
    [(__CFString *)v21 setScale:v15];
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v21, v36, v38);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __32__MPArtworkResizeOperation_main__block_invoke;
    v54[3] = &unk_1E57F3358;
    v54[4] = self;
    *(double *)&v54[5] = v37;
    *(double *)&v54[6] = v39;
    *(double *)&v54[7] = v34;
    *(double *)&v54[8] = v35;
    v40 = [v23 imageWithActions:v54];
    v41 = self->_resizedImage;
    self->_resizedImage = v40;

    v42 = [(UIImage *)self->_resizedImage CGImage];
    if (v42)
    {
      CGImageRef v43 = CGImageRetain(v42);
      v44 = v43;
      if (v3 && self->_resizedImage && v43)
      {
        v45 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __32__MPArtworkResizeOperation_main__block_invoke_20;
        block[3] = &unk_1E57F71A0;
        BOOL v53 = v33;
        id v51 = v3;
        v52 = v44;
        dispatch_async(v45, block);

        goto LABEL_34;
      }
    }
    else
    {
      v46 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = self->_resizedImage;
        v48 = [(MPArtworkResizeOperation *)self image];
        *(_DWORD *)buf = 138543618;
        v56 = v47;
        __int16 v57 = 2114;
        v58 = v48;
        _os_log_impl(&dword_1952E8000, v46, OS_LOG_TYPE_ERROR, "[MPArtwork] failed to create scaled image for resized image: %{public}@ from image: %{public}@", buf, 0x16u);
      }
      v44 = 0;
    }
    CGImageRelease(v44);
    goto LABEL_34;
  }
LABEL_35:
}

void __32__MPArtworkResizeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)[a2 CGContext], kCGInterpolationHigh);
  id v3 = [*(id *)(a1 + 32) image];
  objc_msgSend(v3, "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __32__MPArtworkResizeOperation_main__block_invoke_20(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v5 = v13;

  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F79AF8] devicePreferredImageFormat];
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t FileImageDestination = MSVImageUtilitiesCreateFileImageDestination();
    if (FileImageDestination)
    {
      double v9 = (CGImageDestination *)FileImageDestination;
      if (v7) {
        MSVImageUtilitiesAddImageToDestination();
      }
      else {
        MSVImageUtilitiesAddJPEGToDestination();
      }
      if (!CGImageDestinationFinalize(v9))
      {
        double v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          double v12 = [*(id *)(a1 + 32) path];
          *(_DWORD *)buf = 138543362;
          double v15 = v12;
          _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "[MPArtwork] Could not write resized image to %{public}@: Failed to finalize CGImageDestination", buf, 0xCu);
        }
      }
      CFRelease(v9);
    }
  }
  else
  {
    double v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      double v15 = v2;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_ERROR, "[MPArtwork] Failed to create directory at '%{public}@' with error: %{public}@", buf, 0x16u);
    }
  }
  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4 useExactFittingSizeAsDestinationSize:(BOOL)a5 destinationURL:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v12 = a3;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MPArtworkResizeOperation;
  double v14 = [(MPArtworkResizeOperation *)&v19 init];
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_destinationURL, a6);
    v15->_scaledFittingSize.CGFloat width = width;
    v15->_scaledFittingSize.CGFloat height = height;
    objc_storeStrong((id *)&v15->_image, a3);
    dispatch_group_t v16 = dispatch_group_create();
    operationGroup = v15->_operationGroup;
    v15->_operationGroup = (OS_dispatch_group *)v16;

    v15->_usesExactFittingSizeAsDestinationSize = a5;
  }

  return v15;
}

- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4 destinationURL:(id)a5
{
  return -[MPArtworkResizeOperation initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:](self, "initWithImage:scaledFittingSize:useExactFittingSizeAsDestinationSize:destinationURL:", a3, 0, a5, a4.width, a4.height);
}

- (MPArtworkResizeOperation)initWithImage:(id)a3 scaledFittingSize:(CGSize)a4
{
  return -[MPArtworkResizeOperation initWithImage:scaledFittingSize:destinationURL:](self, "initWithImage:scaledFittingSize:destinationURL:", a3, 0, a4.width, a4.height);
}

@end