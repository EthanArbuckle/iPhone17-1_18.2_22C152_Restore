@interface _NTKPreviewEditSession
- (BOOL)isUserAdjusted;
- (CGSize)presentationSize;
- (NSArray)faceRects;
- (NSDictionary)auxiliaryDict;
- (NTKUltraCubePreviewCoveragePercentageValidator)previewValidator;
- (UIImage)photoImage;
- (UIImage)photoImageMasked;
- (_NTKLayoutDescriptor)layout;
- (id)ultracubeCropPreviewForDevice:(id)a3 subsampleFactor:(double)a4;
- (unsigned)orientation;
- (void)setAuxiliaryDict:(id)a3;
- (void)setFaceRects:(id)a3;
- (void)setLayout:(id)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setPhotoImage:(id)a3;
- (void)setPhotoImageMasked:(id)a3;
- (void)setPresentationSize:(CGSize)a3;
- (void)setPreviewValidator:(id)a3;
- (void)setUserAdjusted:(BOOL)a3;
@end

@implementation _NTKPreviewEditSession

- (id)ultracubeCropPreviewForDevice:(id)a3 subsampleFactor:(double)a4
{
  v6 = [(_NTKPreviewEditSession *)self layout];
  id v7 = [v6 position];

  v8 = [(_NTKPreviewEditSession *)self layout];
  [v8 crop];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGAffineTransformMakeScale(&v27, 1.0 / a4, 1.0 / a4);
  v29.origin.double x = v10;
  v29.origin.double y = v12;
  v29.size.double width = v14;
  v29.size.double height = v16;
  CGRect v30 = CGRectApplyAffineTransform(v29, &v27);
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;

  v21 = [NTKUltraCubeCropPreview alloc];
  v22 = [(_NTKPreviewEditSession *)self photoImage];
  v23 = [(_NTKPreviewEditSession *)self photoImageMasked];
  v24 = [(_NTKPreviewEditSession *)self previewValidator];
  v25 = -[NTKUltraCubeCropPreview initWithPhoto:maskedPhoto:previewValidator:crop:timeLabelPosition:revertable:](v21, "initWithPhoto:maskedPhoto:previewValidator:crop:timeLabelPosition:revertable:", v22, v23, v24, v7, [(_NTKPreviewEditSession *)self isUserAdjusted], x, y, width, height);

  return v25;
}

- (NSDictionary)auxiliaryDict
{
  return self->_auxiliaryDict;
}

- (void)setAuxiliaryDict:(id)a3
{
}

- (NSArray)faceRects
{
  return self->_faceRects;
}

- (void)setFaceRects:(id)a3
{
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (CGSize)presentationSize
{
  double width = self->_presentationSize.width;
  double height = self->_presentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPresentationSize:(CGSize)a3
{
  self->_presentationSize = a3;
}

- (UIImage)photoImage
{
  return self->_photoImage;
}

- (void)setPhotoImage:(id)a3
{
}

- (UIImage)photoImageMasked
{
  return self->_photoImageMasked;
}

- (void)setPhotoImageMasked:(id)a3
{
}

- (NTKUltraCubePreviewCoveragePercentageValidator)previewValidator
{
  return self->_previewValidator;
}

- (void)setPreviewValidator:(id)a3
{
}

- (BOOL)isUserAdjusted
{
  return self->_userAdjusted;
}

- (void)setUserAdjusted:(BOOL)a3
{
  self->_userAdjusted = a3;
}

- (_NTKLayoutDescriptor)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_previewValidator, 0);
  objc_storeStrong((id *)&self->_photoImageMasked, 0);
  objc_storeStrong((id *)&self->_photoImage, 0);
  objc_storeStrong((id *)&self->_faceRects, 0);

  objc_storeStrong((id *)&self->_auxiliaryDict, 0);
}

@end