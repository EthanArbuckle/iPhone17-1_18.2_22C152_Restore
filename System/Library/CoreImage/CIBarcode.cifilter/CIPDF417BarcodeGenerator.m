@interface CIPDF417BarcodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSNumber)inputAlwaysSpecifyCompaction;
- (NSNumber)inputCompactStyle;
- (NSNumber)inputCompactionMode;
- (NSNumber)inputCorrectionLevel;
- (NSNumber)inputDataColumns;
- (NSNumber)inputMaxHeight;
- (NSNumber)inputMaxWidth;
- (NSNumber)inputMinHeight;
- (NSNumber)inputMinWidth;
- (NSNumber)inputPreferredAspectRatio;
- (NSNumber)inputRows;
- (void)setInputAlwaysSpecifyCompaction:(id)a3;
- (void)setInputCompactStyle:(id)a3;
- (void)setInputCompactionMode:(id)a3;
- (void)setInputCorrectionLevel:(id)a3;
- (void)setInputDataColumns:(id)a3;
- (void)setInputMaxHeight:(id)a3;
- (void)setInputMaxWidth:(id)a3;
- (void)setInputMinHeight:(id)a3;
- (void)setInputMinWidth:(id)a3;
- (void)setInputPreferredAspectRatio:(id)a3;
- (void)setInputRows:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIPDF417BarcodeGenerator

+ (id)customAttributes
{
  v39[0] = kCIAttributeFilterCategories;
  v38[0] = kCICategoryGenerator;
  v38[1] = kCICategoryVideo;
  v38[2] = kCICategoryStillImage;
  v38[3] = kCICategoryBuiltIn;
  v15 = +[NSArray arrayWithObjects:v38 count:4];
  v40[0] = v15;
  v40[1] = @"9";
  v39[1] = kCIAttributeFilterAvailable_iOS;
  v39[2] = kCIAttributeFilterAvailable_Mac;
  v40[2] = @"10.11";
  v40[3] = &__NSDictionary0__struct;
  v39[3] = @"inputMessage";
  v39[4] = @"inputMinWidth";
  v36[0] = kCIAttributeMin;
  v36[1] = kCIAttributeSliderMin;
  v37[0] = &off_1DAF0;
  v37[1] = &off_1DAF0;
  v36[2] = kCIAttributeSliderMax;
  v36[3] = kCIAttributeMax;
  v37[2] = &off_1DB08;
  v37[3] = &off_1DB08;
  v36[4] = kCIAttributeType;
  v37[4] = kCIAttributeTypeInteger;
  v14 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];
  v40[4] = v14;
  v39[5] = @"inputMaxWidth";
  v34[0] = kCIAttributeMin;
  v34[1] = kCIAttributeSliderMin;
  v35[0] = &off_1DAF0;
  v35[1] = &off_1DAF0;
  v34[2] = kCIAttributeSliderMax;
  v34[3] = kCIAttributeMax;
  v35[2] = &off_1DB08;
  v35[3] = &off_1DB08;
  v34[4] = kCIAttributeType;
  v35[4] = kCIAttributeTypeInteger;
  v13 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:5];
  v40[5] = v13;
  v39[6] = @"inputMinHeight";
  v32[0] = kCIAttributeMin;
  v32[1] = kCIAttributeSliderMin;
  v33[0] = &off_1DB20;
  v33[1] = &off_1DB20;
  v32[2] = kCIAttributeSliderMax;
  v32[3] = kCIAttributeMax;
  v33[2] = &off_1DB38;
  v33[3] = &off_1DB38;
  v32[4] = kCIAttributeType;
  v33[4] = kCIAttributeTypeInteger;
  v12 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
  v40[6] = v12;
  v39[7] = @"inputMaxHeight";
  v30[0] = kCIAttributeMin;
  v30[1] = kCIAttributeSliderMin;
  v31[0] = &off_1DB20;
  v31[1] = &off_1DB20;
  v30[2] = kCIAttributeSliderMax;
  v30[3] = kCIAttributeMax;
  v31[2] = &off_1DB38;
  v31[3] = &off_1DB38;
  v30[4] = kCIAttributeType;
  v31[4] = kCIAttributeTypeInteger;
  v11 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:5];
  v40[7] = v11;
  v39[8] = @"inputDataColumns";
  v28[0] = kCIAttributeMin;
  v28[1] = kCIAttributeSliderMin;
  v29[0] = &off_1DAC0;
  v29[1] = &off_1DAC0;
  v28[2] = kCIAttributeSliderMax;
  v28[3] = kCIAttributeMax;
  v29[2] = &off_1DB50;
  v29[3] = &off_1DB50;
  v28[4] = kCIAttributeType;
  v29[4] = kCIAttributeTypeInteger;
  v10 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
  v40[8] = v10;
  v39[9] = @"inputRows";
  v26[0] = kCIAttributeMin;
  v26[1] = kCIAttributeSliderMin;
  v27[0] = &off_1DB68;
  v27[1] = &off_1DB68;
  v26[2] = kCIAttributeSliderMax;
  v26[3] = kCIAttributeMax;
  v27[2] = &off_1DB80;
  v27[3] = &off_1DB80;
  v26[4] = kCIAttributeType;
  v27[4] = kCIAttributeTypeInteger;
  v9 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];
  v40[9] = v9;
  v39[10] = @"inputPreferredAspectRatio";
  v24[0] = kCIAttributeMin;
  v24[1] = kCIAttributeSliderMin;
  v25[0] = &off_1DB98;
  v25[1] = &off_1DB98;
  v24[2] = kCIAttributeSliderMax;
  v24[3] = kCIAttributeMax;
  v25[2] = &off_1DBB0;
  v25[3] = &off_1DBB0;
  v8 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v40[10] = v8;
  v39[11] = @"inputCompactionMode";
  v22[0] = kCIAttributeMin;
  v22[1] = kCIAttributeSliderMin;
  v23[0] = &off_1DB98;
  v23[1] = &off_1DB98;
  v22[2] = kCIAttributeSliderMax;
  v22[3] = kCIAttributeMax;
  v23[2] = &off_1DB68;
  v23[3] = &off_1DB68;
  v22[4] = kCIAttributeType;
  v23[4] = kCIAttributeTypeInteger;
  v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
  v40[11] = v7;
  v39[12] = @"inputCompactStyle";
  v20[0] = kCIAttributeMin;
  v20[1] = kCIAttributeSliderMin;
  v21[0] = &__kCFBooleanFalse;
  v21[1] = &__kCFBooleanFalse;
  v20[2] = kCIAttributeSliderMax;
  v20[3] = kCIAttributeMax;
  v21[2] = &__kCFBooleanTrue;
  v21[3] = &__kCFBooleanTrue;
  v20[4] = kCIAttributeType;
  v21[4] = kCIAttributeTypeBoolean;
  v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:5];
  v40[12] = v6;
  v39[13] = @"inputCorrectionLevel";
  v18[0] = kCIAttributeMin;
  v18[1] = kCIAttributeSliderMin;
  v19[0] = &off_1DB98;
  v19[1] = &off_1DB98;
  v18[2] = kCIAttributeSliderMax;
  v18[3] = kCIAttributeMax;
  v19[2] = &off_1DBC8;
  v19[3] = &off_1DBC8;
  v18[4] = kCIAttributeType;
  v19[4] = kCIAttributeTypeInteger;
  v2 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
  v40[13] = v2;
  v39[14] = @"inputAlwaysSpecifyCompaction";
  v16[0] = kCIAttributeMin;
  v16[1] = kCIAttributeSliderMin;
  v17[0] = &__kCFBooleanFalse;
  v17[1] = &__kCFBooleanFalse;
  v16[2] = kCIAttributeSliderMax;
  v16[3] = kCIAttributeMax;
  v17[2] = &__kCFBooleanTrue;
  v17[3] = &__kCFBooleanTrue;
  v16[4] = kCIAttributeType;
  v17[4] = kCIAttributeTypeBoolean;
  v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
  v40[14] = v3;
  v4 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:15];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputAlwaysSpecifyCompaction, 0);
  objc_storeStrong((id *)&self->inputCorrectionLevel, 0);
  objc_storeStrong((id *)&self->inputCompactStyle, 0);
  objc_storeStrong((id *)&self->inputCompactionMode, 0);
  objc_storeStrong((id *)&self->inputPreferredAspectRatio, 0);
  objc_storeStrong((id *)&self->inputRows, 0);
  objc_storeStrong((id *)&self->inputDataColumns, 0);
  objc_storeStrong((id *)&self->inputMaxHeight, 0);
  objc_storeStrong((id *)&self->inputMinHeight, 0);
  objc_storeStrong((id *)&self->inputMaxWidth, 0);
  objc_storeStrong((id *)&self->inputMinWidth, 0);
}

- (CGImage)outputCGImage
{
  if (!self->super.inputMessage) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NSException raise:@"CIPDF417BarcodeGenerator" format:@"CIPDF417BarcodeGenerator filter requires NSData for inputMessage"];
    return 0;
  }
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  inputMinWidth = self->inputMinWidth;
  if (inputMinWidth) {
    [v3 setObject:inputMinWidth forKey:@"PDF417OptionMinWidth"];
  }
  v6 = [(CIPDF417BarcodeGenerator *)self inputMaxWidth];

  if (v6)
  {
    v7 = [(CIPDF417BarcodeGenerator *)self inputMaxWidth];
    [v4 setObject:v7 forKey:@"PDF417OptionMaxWidth"];
  }
  v8 = [(CIPDF417BarcodeGenerator *)self inputMinHeight];

  if (v8)
  {
    v9 = [(CIPDF417BarcodeGenerator *)self inputMinHeight];
    [v4 setObject:v9 forKey:@"PDF417OptionMinHeight"];
  }
  v10 = [(CIPDF417BarcodeGenerator *)self inputMaxHeight];

  if (v10)
  {
    v11 = [(CIPDF417BarcodeGenerator *)self inputMaxHeight];
    [v4 setObject:v11 forKey:@"PDF417OptionMaxHeight"];
  }
  v12 = [(CIPDF417BarcodeGenerator *)self inputDataColumns];

  if (v12)
  {
    v13 = [(CIPDF417BarcodeGenerator *)self inputDataColumns];
    [v4 setObject:v13 forKey:@"PDF417OptionDataColumns"];
  }
  v14 = [(CIPDF417BarcodeGenerator *)self inputRows];

  if (v14)
  {
    v15 = [(CIPDF417BarcodeGenerator *)self inputRows];
    [v4 setObject:v15 forKey:@"PDF417OptionRows"];
  }
  v16 = [(CIPDF417BarcodeGenerator *)self inputPreferredAspectRatio];

  if (v16)
  {
    v17 = [(CIPDF417BarcodeGenerator *)self inputPreferredAspectRatio];
    [v4 setObject:v17 forKey:@"PDF417OptionPreferredAspectRatio"];
  }
  v18 = [(CIPDF417BarcodeGenerator *)self inputCompactionMode];

  if (v18)
  {
    v19 = [(CIPDF417BarcodeGenerator *)self inputCompactionMode];
    [v4 setObject:v19 forKey:@"PDF417OptionCompactionMode"];
  }
  v20 = [(CIPDF417BarcodeGenerator *)self inputCompactStyle];

  if (v20)
  {
    v21 = [(CIPDF417BarcodeGenerator *)self inputCompactStyle];
    [v4 setObject:v21 forKey:@"PDF417OptionUseCompactStyle"];
  }
  v22 = [(CIPDF417BarcodeGenerator *)self inputCorrectionLevel];

  if (v22)
  {
    v23 = [(CIPDF417BarcodeGenerator *)self inputCorrectionLevel];
    [v4 setObject:v23 forKey:@"PDF417OptionErrorCorrectionLevel"];
  }
  v24 = [(CIPDF417BarcodeGenerator *)self inputAlwaysSpecifyCompaction];

  if (v24)
  {
    v25 = [(CIPDF417BarcodeGenerator *)self inputAlwaysSpecifyCompaction];
    [v4 setObject:v25 forKey:@"PDF417OptionAlwaysSpecifyCompaction"];
  }
  CGImageRef v26 = sub_7698(self->super.inputMessage, v4);
  id v27 = 0;
  v28 = v27;
  if (v26)
  {
    CFAutorelease(v26);
  }
  else if (v27)
  {
    v29 = [v27 localizedDescription];
    NSLog(@"%@", v29);
  }
  else
  {
    NSLog(@"CIPDF417BarcodeGenerator could not generate an image");
  }

  return v26;
}

- (NSNumber)inputRows
{
  return self->inputRows;
}

- (NSNumber)inputPreferredAspectRatio
{
  return self->inputPreferredAspectRatio;
}

- (NSNumber)inputMinHeight
{
  return self->inputMinHeight;
}

- (NSNumber)inputMaxWidth
{
  return self->inputMaxWidth;
}

- (NSNumber)inputMaxHeight
{
  return self->inputMaxHeight;
}

- (NSNumber)inputDataColumns
{
  return self->inputDataColumns;
}

- (NSNumber)inputCorrectionLevel
{
  return self->inputCorrectionLevel;
}

- (NSNumber)inputCompactionMode
{
  return self->inputCompactionMode;
}

- (NSNumber)inputCompactStyle
{
  return self->inputCompactStyle;
}

- (NSNumber)inputAlwaysSpecifyCompaction
{
  return self->inputAlwaysSpecifyCompaction;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"inputOptions"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      v9 = [v8 objectForKey:@"PDF417OptionMinWidth"];

      if (v9)
      {
        v10 = [v8 objectForKey:@"PDF417OptionMinWidth"];
        [(CIPDF417BarcodeGenerator *)self setInputMinWidth:v10];
      }
      v11 = [v8 objectForKey:@"PDF417OptionMaxWidth"];

      if (v11)
      {
        v12 = [v8 objectForKey:@"PDF417OptionMaxWidth"];
        [(CIPDF417BarcodeGenerator *)self setInputMaxWidth:v12];
      }
      v13 = [v8 objectForKey:@"PDF417OptionMinHeight"];

      if (v13)
      {
        v14 = [v8 objectForKey:@"PDF417OptionMinHeight"];
        [(CIPDF417BarcodeGenerator *)self setInputMinHeight:v14];
      }
      v15 = [v8 objectForKey:@"PDF417OptionMaxHeight"];

      if (v15)
      {
        v16 = [v8 objectForKey:@"PDF417OptionMaxHeight"];
        [(CIPDF417BarcodeGenerator *)self setInputMaxHeight:v16];
      }
      v17 = [v8 objectForKey:@"PDF417OptionDataColumns"];

      if (v17)
      {
        v18 = [v8 objectForKey:@"PDF417OptionDataColumns"];
        [(CIPDF417BarcodeGenerator *)self setInputDataColumns:v18];
      }
      v19 = [v8 objectForKey:@"PDF417OptionRows"];

      if (v19)
      {
        v20 = [v8 objectForKey:@"PDF417OptionRows"];
        [(CIPDF417BarcodeGenerator *)self setInputRows:v20];
      }
      v21 = [v8 objectForKey:@"PDF417OptionPreferredAspectRatio"];

      if (v21)
      {
        v22 = [v8 objectForKey:@"PDF417OptionPreferredAspectRatio"];
        [(CIPDF417BarcodeGenerator *)self setInputPreferredAspectRatio:v22];
      }
      v23 = [v8 objectForKey:@"PDF417OptionCompactionMode"];

      if (v23)
      {
        v24 = [v8 objectForKey:@"PDF417OptionCompactionMode"];
        [(CIPDF417BarcodeGenerator *)self setInputCompactionMode:v24];
      }
      v25 = [v8 objectForKey:@"PDF417OptionUseCompactStyle"];

      if (v25)
      {
        CGImageRef v26 = [v8 objectForKey:@"PDF417OptionUseCompactStyle"];
        [(CIPDF417BarcodeGenerator *)self setInputCompactStyle:v26];
      }
      id v27 = [v8 objectForKey:@"PDF417OptionErrorCorrectionLevel"];

      if (v27)
      {
        v28 = [v8 objectForKey:@"PDF417OptionErrorCorrectionLevel"];
        [(CIPDF417BarcodeGenerator *)self setInputCorrectionLevel:v28];
      }
      v29 = [v8 objectForKey:@"PDF417OptionAlwaysSpecifyCompaction"];

      if (v29)
      {
        v30 = [v8 objectForKey:@"PDF417OptionAlwaysSpecifyCompaction"];
        [(CIPDF417BarcodeGenerator *)self setInputAlwaysSpecifyCompaction:v30];
      }
    }
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)CIPDF417BarcodeGenerator;
    [(CIPDF417BarcodeGenerator *)&v31 setValue:v6 forUndefinedKey:v7];
  }
}

- (void)setInputRows:(id)a3
{
}

- (void)setInputPreferredAspectRatio:(id)a3
{
}

- (void)setInputMinWidth:(id)a3
{
}

- (void)setInputMinHeight:(id)a3
{
}

- (void)setInputMaxWidth:(id)a3
{
}

- (void)setInputMaxHeight:(id)a3
{
}

- (void)setInputDataColumns:(id)a3
{
}

- (void)setInputCorrectionLevel:(id)a3
{
}

- (void)setInputCompactionMode:(id)a3
{
}

- (void)setInputCompactStyle:(id)a3
{
}

- (void)setInputAlwaysSpecifyCompaction:(id)a3
{
}

- (NSNumber)inputMinWidth
{
  return self->inputMinWidth;
}

@end