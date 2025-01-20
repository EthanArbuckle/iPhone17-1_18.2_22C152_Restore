@interface MKPlaceViewStyleProvider
+ (id)attributionStringWithText:(id)a3 image:(id)a4 placeholder:(id)a5;
+ (id)attributionStringWithTitle:(id)a3 displayName:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6;
@end

@implementation MKPlaceViewStyleProvider

+ (id)attributionStringWithTitle:(id)a3 displayName:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  if (v10 | (unint64_t)a5)
  {
    id v11 = a5;
    v12 = objc_alloc_init(_MKPlaceAttributionLabel);
    [(_MKPlaceAttributionLabel *)v12 setImage:v11];

    v13 = [(_MKPlaceAttributionLabel *)v12 image];
    if (v13) {
      v14 = @"%@";
    }
    else {
      v14 = 0;
    }
    [(_MKPlaceAttributionLabel *)v12 setImagePlaceholder:v14];

    double v15 = -3.5;
    if (v6) {
      double v15 = -12.0;
    }
    [(_MKPlaceAttributionLabel *)v12 setImageBaselineOffset:v15];
    v16 = [(_MKPlaceAttributionLabel *)v12 image];

    if (v10 && !v16)
    {
      uint64_t v17 = [v9 stringByReplacingOccurrencesOfString:@"%@" withString:v10];

      id v9 = (id)v17;
    }
    v18 = [(_MKPlaceAttributionLabel *)v12 attributionWithString:v9];
  }
  else
  {
    v18 = 0;
  }
  uint64_t v19 = [v18 length];
  uint64_t v20 = *MEMORY[0x1E4F42508];
  v21 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0];
  objc_msgSend(v18, "addAttribute:value:range:", v20, v21, 0, v19);

  return v18;
}

+ (id)attributionStringWithText:(id)a3 image:(id)a4 placeholder:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = objc_alloc_init(_MKPlaceAttributionLabel);
  [(_MKPlaceAttributionLabel *)v10 setImage:v8];

  [(_MKPlaceAttributionLabel *)v10 setImagePlaceholder:v7];
  id v11 = [(_MKPlaceAttributionLabel *)v10 attributionWithString:v9];

  return v11;
}

@end