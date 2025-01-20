@interface HKPickerViewTitleMeasurer
+ (double)pickerView:(id)a3 maxWidthForComponent:(int64_t)a4;
+ (id)_pickerTitleFont;
@end

@implementation HKPickerViewTitleMeasurer

+ (id)_pickerTitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] boldSystemFontOfSize:23.5];
}

+ (double)pickerView:(id)a3 maxWidthForComponent:(int64_t)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 delegate];
  double v9 = 0.0;
  if (v8)
  {
    v10 = (void *)v8;
    uint64_t v11 = [v7 dataSource];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v7 dataSource];
      int64_t v14 = [v13 numberOfComponentsInPickerView:v7];

      if (v14 > a4)
      {
        v15 = [v7 delegate];
        char v16 = objc_opt_respondsToSelector();

        v17 = [v7 delegate];
        char v18 = objc_opt_respondsToSelector();

        v19 = [v7 delegate];
        char v20 = objc_opt_respondsToSelector();

        if (v16 & 1) == 0 || (v18 & 1) != 0 || (v20)
        {
          v32 = [MEMORY[0x1E4F28B00] currentHandler];
          [v32 handleFailureInMethod:a2 object:a1 file:@"HKPickerViewTitleMeasurer.m" lineNumber:36 description:@"Measurement of views and attributed titles are unsupported."];
        }
        v21 = [v7 dataSource];
        uint64_t v22 = [v21 pickerView:v7 numberOfRowsInComponent:a4];

        if (v22 >= 1)
        {
          uint64_t v23 = 0;
          uint64_t v24 = *MEMORY[0x1E4FB06F8];
          do
          {
            v25 = [v7 delegate];
            v26 = [v25 pickerView:v7 titleForRow:v23 forComponent:a4];

            uint64_t v33 = v24;
            v27 = [a1 _pickerTitleFont];
            v34[0] = v27;
            v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
            [v26 sizeWithAttributes:v28];
            double v30 = v29 + 20.0;

            if (v9 < (double)(uint64_t)v30) {
              double v9 = (double)(uint64_t)v30;
            }

            ++v23;
          }
          while (v22 != v23);
        }
      }
    }
    else
    {
    }
  }

  return v9;
}

@end