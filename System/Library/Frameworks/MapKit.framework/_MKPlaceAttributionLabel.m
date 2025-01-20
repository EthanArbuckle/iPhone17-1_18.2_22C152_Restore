@interface _MKPlaceAttributionLabel
- (NSString)imagePlaceholder;
- (UIImage)image;
- (double)imageBaselineOffset;
- (id)attributionWithString:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageBaselineOffset:(double)a3;
- (void)setImagePlaceholder:(id)a3;
@end

@implementation _MKPlaceAttributionLabel

- (id)attributionWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(_MKPlaceAttributionLabel *)self image];

  if (v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F42698]);
    v6 = [(_MKPlaceAttributionLabel *)self image];
    [v5 setImage:v6];

    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v9 = [(_MKPlaceAttributionLabel *)self image];
    [v9 size];
    objc_msgSend(v5, "setBounds:", v7, v8, v10, v11);
  }
  id v12 = v4;
  v13 = [(_MKPlaceAttributionLabel *)self imagePlaceholder];

  if (v13)
  {
    v14 = [(_MKPlaceAttributionLabel *)self imagePlaceholder];
    v15 = [v12 componentsSeparatedByString:v14];

    v16 = v12;
    if ([v15 count])
    {
      v16 = [v15 objectAtIndex:0];
    }
    if ((unint64_t)[v15 count] < 2)
    {
      v17 = 0;
    }
    else
    {
      v17 = [v15 objectAtIndex:1];
    }
  }
  else
  {
    v17 = 0;
    v16 = v12;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if ([v16 length])
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v16];
    [v18 appendAttributedString:v19];
  }
  v20 = [(_MKPlaceAttributionLabel *)self image];

  if (v20)
  {
    v21 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v5];
    [v18 appendAttributedString:v21];

    uint64_t v22 = *MEMORY[0x1E4F424D8];
    v23 = NSNumber;
    [(_MKPlaceAttributionLabel *)self imageBaselineOffset];
    v24 = objc_msgSend(v23, "numberWithDouble:");
    objc_msgSend(v18, "addAttribute:value:range:", v22, v24, objc_msgSend(v18, "length") - 1, 1);
  }
  if ([v17 length])
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v17];
    [v18 appendAttributedString:v25];
  }

  return v18;
}

- (UIImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
}

- (double)imageBaselineOffset
{
  return self->imageBaselineOffset;
}

- (void)setImageBaselineOffset:(double)a3
{
  self->imageBaselineOffset = a3;
}

- (NSString)imagePlaceholder
{
  return self->imagePlaceholder;
}

- (void)setImagePlaceholder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imagePlaceholder, 0);

  objc_storeStrong((id *)&self->image, 0);
}

@end