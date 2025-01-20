@interface NTKUltraCubePreviewFactory
- (BOOL)ultracube_canCrop;
- (BOOL)ultracube_canDelete;
- (CGRect)ultracube_screenBounds;
- (CGSize)ultracube_minimumNormalizedCropSize;
- (CLKFont)font;
- (CLKFont)ultracube_timeLabelFont;
- (NTKCompanionUltraCubePhotosEditor)editor;
- (NTKUltraCubePreviewFactory)initWithIndex:(int64_t)a3 device:(id)a4 typeface:(unint64_t)a5 editor:(id)a6;
- (double)ultracube_screenCornerRadius;
- (int64_t)index;
- (void)ultracube_getOptimizedPreviewWithCompletion:(id)a3;
- (void)ultracube_getPreviewWithCompletion:(id)a3;
@end

@implementation NTKUltraCubePreviewFactory

- (NTKUltraCubePreviewFactory)initWithIndex:(int64_t)a3 device:(id)a4 typeface:(unint64_t)a5 editor:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)NTKUltraCubePreviewFactory;
  v12 = [(NTKUltraCubePreviewFactory *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_editor, a6);
    v13->_index = a3;
    [v10 screenBounds];
    uint64_t v14 = +[NTKUltraCubeContentView timeLabelFontForDevice:v10 size:a5 typeface:0 role:round(0.241116751 * CGRectGetHeight(v23))];
    font = v13->_font;
    v13->_font = (CLKFont *)v14;

    [v10 screenBounds];
    v13->_ultracube_screenBounds.origin.x = v16;
    v13->_ultracube_screenBounds.origin.y = v17;
    v13->_ultracube_screenBounds.size.width = v18;
    v13->_ultracube_screenBounds.size.height = v19;
    [v10 screenCornerRadius];
    v13->_ultracube_screenCornerRadius = v20;
  }

  return v13;
}

- (BOOL)ultracube_canCrop
{
  return [(NTKCompanionUltraCubePhotosEditor *)self->_editor canChangeOriginalCropOfPhotoAtIndex:self->_index];
}

- (BOOL)ultracube_canDelete
{
  return [(NTKCompanionUltraCubePhotosEditor *)self->_editor photosCount] > 1;
}

- (CGSize)ultracube_minimumNormalizedCropSize
{
  int64_t v3 = [(NTKUltraCubePreviewFactory *)self index];
  editor = self->_editor;

  [(NTKCompanionUltraCubePhotosEditor *)editor minimumNormalizedCropSizeForPhotoAtIndex:v3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)ultracube_getPreviewWithCompletion:(id)a3
{
  if (self->_editor)
  {
    id v5 = a3;
    [(NTKCompanionUltraCubePhotosEditor *)self->_editor previewOfLibraryPhotoAtIndex:[(NTKUltraCubePreviewFactory *)self index] completion:v5];
  }
  else
  {
    v4 = (void (**)(id, void))a3;
    id v5 = +[NSError errorWithDomain:@"NTKUltraCubeDomain" code:305 userInfo:0];
    v4[2](v4, 0);
  }
}

- (void)ultracube_getOptimizedPreviewWithCompletion:(id)a3
{
  if (self->_editor)
  {
    id v5 = a3;
    [(NTKCompanionUltraCubePhotosEditor *)self->_editor resetCropOfPhotoAtIndex:[(NTKUltraCubePreviewFactory *)self index] completion:v5];
  }
  else
  {
    v4 = (void (**)(id, void))a3;
    id v5 = +[NSError errorWithDomain:@"NTKUltraCubeDomain" code:305 userInfo:0];
    v4[2](v4, 0);
  }
}

- (CLKFont)ultracube_timeLabelFont
{
  return self->_font;
}

- (CGRect)ultracube_screenBounds
{
  double x = self->_ultracube_screenBounds.origin.x;
  double y = self->_ultracube_screenBounds.origin.y;
  double width = self->_ultracube_screenBounds.size.width;
  double height = self->_ultracube_screenBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)ultracube_screenCornerRadius
{
  return self->_ultracube_screenCornerRadius;
}

- (NTKCompanionUltraCubePhotosEditor)editor
{
  return self->_editor;
}

- (int64_t)index
{
  return self->_index;
}

- (CLKFont)font
{
  return self->_font;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_editor, 0);
}

@end