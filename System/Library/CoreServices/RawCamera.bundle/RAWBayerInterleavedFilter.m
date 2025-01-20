@interface RAWBayerInterleavedFilter
- (id)outputImage;
@end

@implementation RAWBayerInterleavedFilter

- (id)outputImage
{
  v29[4] = *MEMORY[0x1E4F143B8];
  if (self->inputExtent && self->inputImage00 && self->inputImage01 && self->inputImage10 && self->inputImage11)
  {
    v3 = sub_1DDA83E7C();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWBayerInterleavedFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1DDB6E8A0;
    v27[3] = &unk_1E6D04A58;
    v27[4] = self;
    v5 = (void (**)(void))MEMORY[0x1E01C46E0](v27);
    v13 = objc_msgSend_kernelWithName_(DMKernels, v6, @"_interleaveRGGB", v7, v8);
    if (!v13) {
      goto LABEL_10;
    }
    objc_msgSend_CGRectValue(self->inputExtent, v9, v10, v11, v12);
    double x = v31.origin.x;
    double y = v31.origin.y;
    double width = v31.size.width;
    double height = v31.size.height;
    if (CGRectIsNull(v31)
      || (v32.origin.double x = x, v32.origin.y = y, v32.size.width = width, v32.size.height = height, CGRectIsInfinite(v32)))
    {
LABEL_10:
      v20 = 0;
    }
    else
    {
      inputImage01 = self->inputImage01;
      v29[0] = self->inputImage00;
      v29[1] = inputImage01;
      inputImage11 = self->inputImage11;
      v29[2] = self->inputImage10;
      v29[3] = inputImage11;
      v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v29, 4, v19);
      v20 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v13, v24, (uint64_t)&unk_1F3984140, (uint64_t)v23, v25, x, y, width, height);
    }
    v5[2](v5);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputExtent, 0);
  objc_storeStrong((id *)&self->inputImage11, 0);
  objc_storeStrong((id *)&self->inputImage10, 0);
  objc_storeStrong((id *)&self->inputImage01, 0);

  objc_storeStrong((id *)&self->inputImage00, 0);
}

@end