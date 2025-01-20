@interface PHImageDisplaySpec
- (BOOL)hasExplicitCrop;
- (CGRect)normalizedCropRect;
- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable;
- (CGSize)requestSizeFromFullSizedWidth:(int64_t)a3 height:(int64_t)a4;
- (CGSize)requestSizeFromFullSizedWidth:(int64_t)a3 height:(int64_t)a4 resizeMode:(int64_t)a5;
- (CGSize)targetSize;
- (PHImageDisplaySpec)init;
- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3;
- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4;
- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 normalizedCropRect:(CGRect)a5;
- (id)description;
- (id)shortDescription;
- (int64_t)contentMode;
- (void)setContentMode:(int64_t)a3;
- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3;
- (void)setNormalizedCropRect:(CGRect)a3;
- (void)setTargetSize:(CGSize)a3;
@end

@implementation PHImageDisplaySpec

- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable
{
  double width = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width;
  double height = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3
{
  self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = a3;
}

- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 normalizedCropRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v10 = a3.height;
  double v11 = a3.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PHImageDisplaySpec;
  v12 = [(PHImageDisplaySpec *)&v21 init];
  v13 = v12;
  if (v12)
  {
    -[PHImageDisplaySpec setNormalizedCropRect:](v12, "setNormalizedCropRect:", x, y, width, height);
    v13->_contentMode = a4;
    if (v11 <= 0.0 || v10 <= 0.0)
    {
      double v14 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if ((v11 != *MEMORY[0x1E4F1DB30] || v10 != v15) && (v11 != -1.0 || v10 != -1.0))
      {
        v18 = PLImageManagerGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v25.double width = v11;
          v25.double height = v10;
          v19 = NSStringFromSize(v25);
          *(_DWORD *)buf = 138543362;
          v23 = v19;
          _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "Invalid target size specified for image request (%{public}@, defaulting to max size", buf, 0xCu);
        }
      }
    }
    else
    {
      double v14 = v11;
      double v15 = v10;
    }
    v13->_targetSize.double width = v14;
    v13->_targetSize.double height = v15;
  }
  return v13;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v13 = 0;
  self->_normalizedCropRect.origin.CGFloat x = PHSanitizeNormalizedCropRect(&v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_normalizedCropRect.origin.CGFloat y = v8;
  self->_normalizedCropRect.size.CGFloat width = v9;
  self->_normalizedCropRect.size.CGFloat height = v10;
  if (v13)
  {
    double v11 = PLImageManagerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      v12 = NSStringFromRect(v17);
      *(_DWORD *)buf = 138543362;
      double v15 = v12;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "Invalid crop rect specified for image request (%{public}@, will attempt to fix if possible, otherwise will ignore crop rect", buf, 0xCu);
    }
  }
}

- (BOOL)hasExplicitCrop
{
  return !CGRectEqualToRect(self->_normalizedCropRect, *MEMORY[0x1E4F1DB28]);
}

- (CGSize)requestSizeFromFullSizedWidth:(int64_t)a3 height:(int64_t)a4 resizeMode:(int64_t)a5
{
  if (a3 && a4 && self->_targetSize.width > 0.0 && self->_targetSize.height > 0.0)
  {
    [(PHImageDisplaySpec *)self normalizedCropRect];
    double width = v24.size.width;
    double height = v24.size.height;
    BOOL v11 = CGRectEqualToRect(v24, *MEMORY[0x1E4F1DB28]);
    [(PHImageDisplaySpec *)self targetSize];
    double v13 = v12;
    double v15 = v14;
    double v16 = v12 / v14;
    int64_t v17 = [(PHImageDisplaySpec *)self contentMode];
    if (v17 == 1 && a5 == 2) {
      double v19 = v16;
    }
    else {
      double v19 = (double)a3 / (double)a4;
    }
    double v20 = (double)a3 / (double)a4 * width / height;
    if (v11) {
      double v20 = v19;
    }
    if (v17 == 1)
    {
      if (v20 > v16)
      {
LABEL_16:
        double v13 = v15 * v20;
LABEL_21:
        double v21 = round(v13);
        double v22 = round(v15);
        goto LABEL_22;
      }
    }
    else
    {
      if (v17)
      {
        double v13 = *MEMORY[0x1E4F1DB30];
        double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        goto LABEL_21;
      }
      if (v20 <= v16) {
        goto LABEL_16;
      }
    }
    double v15 = v13 / v20;
    goto LABEL_21;
  }
  double v21 = *MEMORY[0x1E4F1DB30];
  double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_22:
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (CGSize)requestSizeFromFullSizedWidth:(int64_t)a3 height:(int64_t)a4
{
  [(PHImageDisplaySpec *)self requestSizeFromFullSizedWidth:a3 height:a4 resizeMode:1];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  v6 = [(PHImageDisplaySpec *)self shortDescription];
  v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  return v7;
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = DCIM_NSStringFromCGSize();
  double v5 = (void *)v4;
  int64_t contentMode = self->_contentMode;
  v7 = @"fit";
  if (contentMode) {
    v7 = 0;
  }
  if (contentMode == 1) {
    CGFloat v8 = @"fill";
  }
  else {
    CGFloat v8 = v7;
  }
  CGFloat v9 = [v3 stringWithFormat:@"size: %@, cm: %@", v4, v8];

  if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], self->_normalizedCropRect))
  {
    CGFloat v10 = DCIM_NSStringFromCGRect();
    uint64_t v11 = [v9 stringByAppendingFormat:@", crop: %@", v10];

    CGFloat v9 = (void *)v11;
  }

  return v9;
}

- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4
{
  return -[PHImageDisplaySpec initWithTargetSize:contentMode:normalizedCropRect:](self, "initWithTargetSize:contentMode:normalizedCropRect:", a4, a3.width, a3.height, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PHImageDisplaySpec)initWithTargetSize:(CGSize)a3
{
  return -[PHImageDisplaySpec initWithTargetSize:contentMode:](self, "initWithTargetSize:contentMode:", 0, a3.width, a3.height);
}

- (PHImageDisplaySpec)init
{
  return -[PHImageDisplaySpec initWithTargetSize:](self, "initWithTargetSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

@end