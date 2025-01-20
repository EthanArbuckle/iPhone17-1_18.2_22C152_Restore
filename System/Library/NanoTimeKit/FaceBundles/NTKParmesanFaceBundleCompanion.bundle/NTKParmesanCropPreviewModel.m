@interface NTKParmesanCropPreviewModel
- (BOOL)isRevertable;
- (BOOL)useDepthEffect;
- (NTKParmesanCrop)crop;
- (NTKParmesanCropPreviewModel)initWithPhoto:(id)a3 maskedPhoto:(id)a4 previewValidator:(id)a5 crop:(id)a6 timeLayout:(id)a7 useDepthEffect:(BOOL)a8 revertable:(BOOL)a9;
- (NTKParmesanPreviewValidator)previewValidator;
- (NTKParmesanTimeLayout)timeLayout;
- (UIImage)maskedPhoto;
- (UIImage)photo;
- (id)description;
@end

@implementation NTKParmesanCropPreviewModel

- (NTKParmesanCropPreviewModel)initWithPhoto:(id)a3 maskedPhoto:(id)a4 previewValidator:(id)a5 crop:(id)a6 timeLayout:(id)a7 useDepthEffect:(BOOL)a8 revertable:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v23 = a5;
  id v22 = a6;
  id v18 = a7;
  v24.receiver = self;
  v24.super_class = (Class)NTKParmesanCropPreviewModel;
  v19 = [(NTKParmesanCropPreviewModel *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_photo, a3);
    objc_storeStrong((id *)&v20->_maskedPhoto, a4);
    objc_storeStrong((id *)&v20->_previewValidator, a5);
    objc_storeStrong((id *)&v20->_crop, a6);
    objc_storeStrong((id *)&v20->_timeLayout, a7);
    v20->_useDepthEffect = a8;
    v20->_revertable = a9;
  }

  return v20;
}

- (id)description
{
  v5 = NSString;
  photo = self->_photo;
  maskedPhoto = self->_maskedPhoto;
  objc_msgSend_cgRect(self->_crop, a2, v2, v3);
  if (v12 <= 1.0) {
    objc_msgSend_stringWithFormat_(NSString, v8, @"{ %.5f, %.5f, %.5f, %.5f }", v9, v10, v11, *(void *)&v12, v13);
  }
  else {
  uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"{ %.1f, %.1f, %.1f, %.1f }", v9, v10, v11, *(void *)&v12, v13);
  }
  id v17 = (void *)v14;
  id v18 = "YES";
  if (self->_useDepthEffect) {
    v19 = "YES";
  }
  else {
    v19 = "NO";
  }
  if (!self->_revertable) {
    id v18 = "NO";
  }
  v20 = objc_msgSend_stringWithFormat_(v5, v15, @"[previewModel: photo=%@, mask=%@, crop=%@, timelayout=%@, useDepth=%s, revertable=%s]", v16, photo, maskedPhoto, v14, self->_timeLayout, v19, v18);

  return v20;
}

- (UIImage)photo
{
  return self->_photo;
}

- (UIImage)maskedPhoto
{
  return self->_maskedPhoto;
}

- (NTKParmesanPreviewValidator)previewValidator
{
  return self->_previewValidator;
}

- (NTKParmesanCrop)crop
{
  return self->_crop;
}

- (NTKParmesanTimeLayout)timeLayout
{
  return self->_timeLayout;
}

- (BOOL)isRevertable
{
  return self->_revertable;
}

- (BOOL)useDepthEffect
{
  return self->_useDepthEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLayout, 0);
  objc_storeStrong((id *)&self->_crop, 0);
  objc_storeStrong((id *)&self->_previewValidator, 0);
  objc_storeStrong((id *)&self->_maskedPhoto, 0);

  objc_storeStrong((id *)&self->_photo, 0);
}

@end