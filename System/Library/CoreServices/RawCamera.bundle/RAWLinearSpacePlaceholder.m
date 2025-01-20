@interface RAWLinearSpacePlaceholder
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
@end

@implementation RAWLinearSpacePlaceholder

- (id)outputImage
{
  v3 = sub_1DDA83E7C();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLinearSpacePlaceholder", (const char *)&unk_1DDC3ACB6, buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DDB74274;
  v8[3] = &unk_1E6D04A58;
  v8[4] = self;
  v5 = (void (**)(void))MEMORY[0x1E01C46E0](v8);
  v6 = self->inputImage;
  v5[2](v5);

  return v6;
}

+ (id)customAttributes
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"inputColorSpace";
  v9[0] = *MEMORY[0x1E4F1E098];
  CFTypeRef v2 = sub_1DDBEE9BC();
  v9[1] = *MEMORY[0x1E4F1E0A0];
  v10[0] = v2;
  v10[1] = @"inputColorSpace";
  v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v10, (uint64_t)v9, 2);
  v11[1] = @"kCIRAWFilterDoesClip";
  uint64_t v5 = *MEMORY[0x1E4F1CFC8];
  v12[0] = v4;
  v12[1] = v5;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v12, (uint64_t)v11, 2);

  return v7;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end