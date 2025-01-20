@interface UIView(HoverAdditions)
+ (id)pk_hoverAttributedStringForColor:()HoverAdditions;
+ (id)pk_hoverAttributedStringFromString:()HoverAdditions;
+ (id)pk_hoverLabelFont;
- (id)pk_hoverLabelAttributedString;
- (id)pk_hoverLabelString;
- (void)pk_setHoverLabelAttributedString:()HoverAdditions;
- (void)pk_setHoverLabelString:()HoverAdditions;
@end

@implementation UIView(HoverAdditions)

- (id)pk_hoverLabelString
{
  return objc_getAssociatedObject(a1, &hoverLabelStringKey);
}

- (void)pk_setHoverLabelString:()HoverAdditions
{
}

- (id)pk_hoverLabelAttributedString
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_getAssociatedObject(a1, &hoverLabelAttributedStringKey);
  if (!v2)
  {
    v3 = objc_msgSend(a1, "pk_hoverLabelString");
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E4FB08E0];
      [MEMORY[0x1E4FB08E0] systemFontSize];
      v5 = objc_msgSend(v4, "boldSystemFontOfSize:");
      id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v7 = *MEMORY[0x1E4FB0700];
      v11[0] = *MEMORY[0x1E4FB06F8];
      v11[1] = v7;
      v12[0] = v5;
      v8 = [MEMORY[0x1E4FB1618] labelColor];
      v12[1] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
      v2 = (void *)[v6 initWithString:v3 attributes:v9];
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (void)pk_setHoverLabelAttributedString:()HoverAdditions
{
}

+ (id)pk_hoverLabelFont
{
  v0 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v1 = (void *)MEMORY[0x1E4FB08E0];
  v2 = [v0 fontDescriptor];
  v3 = [v2 fontDescriptorWithSymbolicTraits:2];
  [v0 pointSize];
  v4 = objc_msgSend(v1, "fontWithDescriptor:size:", v3);

  return v4;
}

+ (id)pk_hoverAttributedStringFromString:()HoverAdditions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    v11[0] = *MEMORY[0x1E4FB06F8];
    id v6 = objc_msgSend(a1, "pk_hoverLabelFont");
    v12[0] = v6;
    v11[1] = *MEMORY[0x1E4FB0700];
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v9 = (void *)[v5 initWithString:v4 attributes:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)pk_hoverAttributedStringForColor:()HoverAdditions
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  DKUColorGetRGBAComponents((CGColor *)[a3 CGColor], &v35);
  LODWORD(v3) = vcvtd_n_s64_f64(*(double *)&v35, 8uLL);
  LODWORD(v4) = vcvtd_n_s64_f64(*((double *)&v35 + 1), 8uLL);
  uint64_t v27 = v4;
  LODWORD(v4) = vcvtd_n_s64_f64(v36, 8uLL);
  uint64_t v29 = v4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];
  uint64_t v7 = objc_msgSend(v6, "boldSystemFontOfSize:");
  v30 = [MEMORY[0x1E4FB1618] labelColor];
  v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v33[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = v33[0];
  v33[1] = v9;
  v34[0] = v7;
  v34[1] = v30;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v31[0] = v8;
  v31[1] = v9;
  v32[0] = v7;
  v32[1] = v28;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v10];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"R" attributes:v10];
  [v5 appendAttributedString:v13];

  [v5 appendAttributedString:v12];
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v3);
  v16 = (void *)[v14 initWithString:v15 attributes:v11];
  [v5 appendAttributedString:v16];

  [v5 appendAttributedString:v12];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"G" attributes:v10];
  [v5 appendAttributedString:v17];

  [v5 appendAttributedString:v12];
  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v27);
  v20 = (void *)[v18 initWithString:v19 attributes:v11];
  [v5 appendAttributedString:v20];

  [v5 appendAttributedString:v12];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"B" attributes:v10];
  [v5 appendAttributedString:v21];

  [v5 appendAttributedString:v12];
  id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v29);
  v24 = (void *)[v22 initWithString:v23 attributes:v11];
  [v5 appendAttributedString:v24];

  v25 = (void *)[v5 copy];

  return v25;
}

@end