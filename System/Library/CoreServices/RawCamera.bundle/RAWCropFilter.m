@interface RAWCropFilter
- (id)outputImage;
@end

@implementation RAWCropFilter

- (id)outputImage
{
  inputImage = self->inputImage;
  if (inputImage)
  {
    if (self->inputCropRect)
    {
      v4 = sub_1DDA83E7C();
      v5 = v4;
      if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DDA14000, v5, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWCropFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
      }

      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_1DDBEF7B8;
      v29[3] = &unk_1E6D04A58;
      v29[4] = self;
      v6 = (void (**)(void))MEMORY[0x1E01C46E0](v29);
      objc_msgSend_CGRectValue(self->inputCropRect, v7, v8, v9, v10);
      double v12 = v11;
      double v14 = v13;
      v15 = self->inputImage;
      CGAffineTransformMakeTranslation(&v28, -v16, -v17);
      v21 = objc_msgSend_imageByApplyingTransform_(v15, v18, (uint64_t)&v28, v19, v20);
      objc_msgSend_imageByCroppingToRect_(v21, v22, v23, v24, v25, 0.0, 0.0, v12, v14);
      v26 = (CIImage *)objc_claimAutoreleasedReturnValue();

      v6[2](v6);
    }
    else
    {
      v26 = inputImage;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputCropRect, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end