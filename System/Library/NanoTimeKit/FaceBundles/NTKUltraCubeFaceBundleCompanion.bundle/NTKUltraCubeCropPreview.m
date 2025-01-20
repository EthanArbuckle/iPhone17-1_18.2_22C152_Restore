@interface NTKUltraCubeCropPreview
- (BOOL)isRevertable;
- (CGRect)crop;
- (NTKUltraCubeCropPreview)initWithPhoto:(id)a3 maskedPhoto:(id)a4 previewValidator:(id)a5 crop:(CGRect)a6 timeLabelPosition:(int64_t)a7 revertable:(BOOL)a8;
- (NTKUltraCubePreviewValidator)previewValidator;
- (UIImage)maskedPhoto;
- (UIImage)photo;
- (id)timeLabelStyleForDevice:(id)a3 font:(id)a4;
- (int64_t)timeLabelPosition;
@end

@implementation NTKUltraCubeCropPreview

- (NTKUltraCubeCropPreview)initWithPhoto:(id)a3 maskedPhoto:(id)a4 previewValidator:(id)a5 crop:(CGRect)a6 timeLabelPosition:(int64_t)a7 revertable:(BOOL)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v24.receiver = self;
  v24.super_class = (Class)NTKUltraCubeCropPreview;
  v21 = [(NTKUltraCubeCropPreview *)&v24 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_photo, a3);
    objc_storeStrong((id *)&v22->_maskedPhoto, a4);
    objc_storeStrong((id *)&v22->_previewValidator, a5);
    v22->_crop.origin.CGFloat x = x;
    v22->_crop.origin.CGFloat y = y;
    v22->_crop.size.CGFloat width = width;
    v22->_crop.size.CGFloat height = height;
    v22->_timeLabelPosition = a7;
    v22->_revertable = a8;
  }

  return v22;
}

- (id)timeLabelStyleForDevice:(id)a3 font:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(NTKUltraCubeCropPreview *)self timeLabelPosition];
  v9 = &NTKUltraCubePhotoTimeElementAboveUnitBaseY;
  if (((v8 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    v9 = &NTKUltraCubePhotoTimeElementBelowUnitBaseY;
  }
  double v10 = *(double *)v9;
  [v7 screenBounds];
  v15 = +[NTKUltraCubeContentView timeLabelStyleForDevice:font:baseline:faceBounds:](NTKUltraCubeContentView, "timeLabelStyleForDevice:font:baseline:faceBounds:", v7, v6, v10, v11, v12, v13, v14);

  return v15;
}

- (UIImage)photo
{
  return self->_photo;
}

- (UIImage)maskedPhoto
{
  return self->_maskedPhoto;
}

- (NTKUltraCubePreviewValidator)previewValidator
{
  return self->_previewValidator;
}

- (CGRect)crop
{
  double x = self->_crop.origin.x;
  double y = self->_crop.origin.y;
  double width = self->_crop.size.width;
  double height = self->_crop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)timeLabelPosition
{
  return self->_timeLabelPosition;
}

- (BOOL)isRevertable
{
  return self->_revertable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewValidator, 0);
  objc_storeStrong((id *)&self->_maskedPhoto, 0);

  objc_storeStrong((id *)&self->_photo, 0);
}

@end