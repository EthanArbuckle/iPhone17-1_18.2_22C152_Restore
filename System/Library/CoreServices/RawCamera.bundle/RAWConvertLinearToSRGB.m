@interface RAWConvertLinearToSRGB
- (id)outputImage;
@end

@implementation RAWConvertLinearToSRGB

- (id)outputImage
{
  if (self->inputImage)
  {
    v3 = sub_1DDA83E7C();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWConvertLinearToSRGB", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1DDB77568;
    v14[3] = &unk_1E6D04A58;
    v14[4] = self;
    v5 = (void (**)(void))MEMORY[0x1E01C46E0](v14);
    v6 = self->inputImage;
    v10 = objc_msgSend_kernelWithName_(RAWKernels, v7, @"raw_linear_to_srgb", v8, v9);
    v12 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v11, (uint64_t)v10, (uint64_t)v6, 0, self->inputColorSpace, 1);

    v5[2](v5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end