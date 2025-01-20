@interface CAMOverlayServiceSlider
+ (BOOL)supportsSecureCoding;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEnabled;
- (CAMOverlayDiscreteFloatRange)primaryValues;
- (CAMOverlayFloatValueRange)valueRange;
- (CAMOverlayServiceSlider)initWithCoder:(id)a3;
- (CAMOverlayServiceSlider)initWithIdentifier:(id)a3 sliderType:(int64_t)a4 captureUniqueID:(id)a5;
- (CAMOverlayServiceSlider)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 rangeScale:(int64_t)a6 valueRange:(id)a7 primaryValues:(id)a8;
- (CAMOverlayServiceSlider)sliderWithPrimaryValues:(id)a3;
- (NSDictionary)displayValuesByValue;
- (NSString)captureDeviceUniqueID;
- (NSString)captureSessionUniqueID;
- (NSString)valueFormat;
- (id)_initWithIdentifier:(id)a3 sliderType:(int64_t)a4 captureUniqueID:(id)a5 zoomRange:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayValueRange;
- (id)displayValues;
- (id)initPhotoZoomSliderWithIdentifier:(id)a3 maximumZoomFactor:(double)a4 captureDeviceUniqueID:(id)a5;
- (id)initVideoZoomSliderWithIdentifier:(id)a3 maximumZoomFactor:(double)a4 captureDeviceUniqueID:(id)a5;
- (id)sliderUnpackingDisplayValuesIfNeeded;
- (id)updateWithFloatValue:(float)a3;
- (id)updateWithRecording:(BOOL)a3;
- (id)updateWithStyleDictionary:(id)a3;
- (id)values;
- (int64_t)controlType;
- (int64_t)rangeScale;
- (int64_t)sliderType;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayValuesByValue:(id)a3;
- (void)setValueFormat:(id)a3;
@end

@implementation CAMOverlayServiceSlider

- (CAMOverlayServiceSlider)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 rangeScale:(int64_t)a6 valueRange:(id)a7 primaryValues:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CAMOverlayServiceSlider;
  v17 = [(CAMAbstractOverlayServiceControl *)&v20 _initWithIdentifier:a3 title:a4 imageName:a5];
  v18 = v17;
  if (v17)
  {
    v17->_rangeScale = a6;
    objc_storeStrong((id *)&v17->_valueRange, a7);
    objc_storeStrong((id *)&v18->_primaryValues, a8);
    v18->_sliderType = 0;
  }

  return v18;
}

- (id)initPhotoZoomSliderWithIdentifier:(id)a3 maximumZoomFactor:(double)a4 captureDeviceUniqueID:(id)a5
{
  double v7 = fmax(a4, 1.0);
  id v8 = a5;
  id v9 = a3;
  v10 = [[CAMOverlayContinuousFloatRange alloc] initWithMinimum:1.0 maximum:v7];
  id v11 = [(CAMOverlayServiceSlider *)self _initWithIdentifier:v9 sliderType:5 captureUniqueID:v8 zoomRange:v10];

  return v11;
}

- (id)initVideoZoomSliderWithIdentifier:(id)a3 maximumZoomFactor:(double)a4 captureDeviceUniqueID:(id)a5
{
  double v7 = fmax(a4, 1.0);
  id v8 = a5;
  id v9 = a3;
  v10 = [[CAMOverlayContinuousFloatRange alloc] initWithMinimum:1.0 maximum:v7];
  id v11 = [(CAMOverlayServiceSlider *)self _initWithIdentifier:v9 sliderType:6 captureUniqueID:v8 zoomRange:v10];

  return v11;
}

- (CAMOverlayServiceSlider)initWithIdentifier:(id)a3 sliderType:(int64_t)a4 captureUniqueID:(id)a5
{
  return (CAMOverlayServiceSlider *)[(CAMOverlayServiceSlider *)self _initWithIdentifier:a3 sliderType:a4 captureUniqueID:a5 zoomRange:0];
}

- (id)_initWithIdentifier:(id)a3 sliderType:(int64_t)a4 captureUniqueID:(id)a5 zoomRange:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  switch(a4)
  {
    case 1:
      objc_storeStrong((id *)&self->_captureDeviceUniqueID, a5);
      v19 = [[CAMOverlayDiscreteFloatRange alloc] initWithMinimum:-2.0 maximum:2.0 step:0.333333333];
      valueRange = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v19;

      v21 = [[CAMOverlayDiscreteFloatRange alloc] initWithMinimum:-2.0 maximum:2.0 step:1.0];
      primaryValues = self->_primaryValues;
      self->_primaryValues = v21;

      v13 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
      v23 = [v13 localizedStringForKey:@"EXPOSURE_BIAS_TEXT" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
      valueFormat = self->_valueFormat;
      self->_valueFormat = v23;

      id v16 = @"plusminus";
      v17 = @"SLIDER_EXPOSURE";
      goto LABEL_9;
    case 2:
      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      v25 = [[CAMOverlayContinuousFloatRange alloc] initWithMinimum:-1.0 maximum:1.0];
      v13 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v25;
      id v16 = @"swirl.circle.righthalf.filled";
      v17 = @"SLIDER_STYLE_COLOR";
      goto LABEL_9;
    case 3:
      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      v26 = [[CAMOverlayContinuousFloatRange alloc] initWithMinimum:0.0 maximum:1.0];
      v13 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v26;
      id v16 = @"lifepreserver";
      v17 = @"SLIDER_STYLE_INTENSITY";
      goto LABEL_9;
    case 4:
      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      v27 = [[CAMOverlayContinuousFloatRange alloc] initWithMinimum:-1.0 maximum:1.0];
      v28 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v27;

      v13 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
      v29 = [v13 localizedStringForKey:@"TONE_TEXT" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
      v30 = self->_valueFormat;
      self->_valueFormat = v29;

      id v16 = @"dot.grid.bottomrighthalf.app";
      v17 = @"SLIDER_STYLE_TONE";
      goto LABEL_9;
    case 5:
    case 6:
      objc_storeStrong((id *)&self->_captureDeviceUniqueID, a5);
      self->_rangeScale = 1;
      objc_storeStrong((id *)&self->_valueRange, a6);
      v13 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
      v14 = [v13 localizedStringForKey:@"ZOOM_FACTOR_TEXT" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
      id v15 = self->_valueFormat;
      self->_valueFormat = v14;

      id v16 = @"crosshair.viewfinder";
      v17 = @"SLIDER_ZOOM";
      goto LABEL_9;
    case 7:
      objc_storeStrong((id *)&self->_captureDeviceUniqueID, a5);
      v31 = [[CAMOverlayDiscreteFloatRange alloc] initWithValues:&unk_26FD461E8];
      v32 = self->_valueRange;
      self->_valueRange = (CAMOverlayFloatValueRange *)v31;

      v13 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
      v33 = [v13 localizedStringForKey:@"ZOOM_FACTOR_TEXT" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
      v34 = self->_valueFormat;
      self->_valueFormat = v33;

      id v16 = @"camera.aperture";
      v17 = @"SLIDER_LENS";
LABEL_9:

      v35 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
      v36 = [v35 localizedStringForKey:v17 value:&stru_26FD435D8 table:@"CameraOverlayServices"];
      v38.receiver = self;
      v38.super_class = (Class)CAMOverlayServiceSlider;
      v18 = [(CAMAbstractOverlayServiceControl *)&v38 _initWithIdentifier:v10 title:v36 imageName:v16];

      v18[9] = a4;
      break;
    default:

      v18 = 0;
      break;
  }

  return v18;
}

- (id)displayValueRange
{
  return self->_displayValueRange;
}

- (id)displayValues
{
  return self->_displayValues;
}

- (id)values
{
  return self->_values;
}

- (id)sliderUnpackingDisplayValuesIfNeeded
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v2 = self;
  v3 = [(CAMOverlayServiceSlider *)v2 displayValuesByValue];
  if ([v3 count])
  {
    v4 = [v3 allKeys];
    v5 = [v4 sortedArrayUsingSelector:sel_compare_];

    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    double v7 = v5;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(v7);
          }
          values = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v42 + 1) + 8 * i), (void)v42);
          if ([(NSArray *)v6 count])
          {
            [values doubleValue];
            double v14 = v13;
            id v15 = [(NSArray *)v6 lastObject];
            [v15 doubleValue];
            double v17 = v16;

            if (v14 < v17)
            {

              v23 = v7;
              goto LABEL_17;
            }
          }
          [(NSArray *)v6 addObject:values];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (v6)
    {
      v18 = (CAMOverlayServiceSlider *)[(CAMOverlayServiceSlider *)v2 copy];

      if ([(CAMOverlayServiceSlider *)v2 sliderType] == 7)
      {
        v19 = [[CAMOverlayDiscreteFloatRange alloc] initWithValues:v7];
        valueRange = v18->_valueRange;
        v18->_valueRange = (CAMOverlayFloatValueRange *)v19;

        v21 = [[CAMOverlayDiscreteFloatRange alloc] initWithValues:v6];
        displayValueRange = v18->_displayValueRange;
        v18->_displayValueRange = (CAMOverlayValueRange *)v21;
      }
      else
      {
        v24 = [CAMOverlayContinuousFloatRange alloc];
        v25 = [(NSArray *)v7 firstObject];
        [v25 doubleValue];
        double v27 = v26;
        v28 = [(NSArray *)v7 lastObject];
        [v28 doubleValue];
        uint64_t v30 = [(CAMOverlayContinuousFloatRange *)v24 initWithMinimum:v27 maximum:v29];
        v31 = v18->_valueRange;
        v18->_valueRange = (CAMOverlayFloatValueRange *)v30;

        v32 = [CAMOverlayContinuousFloatRange alloc];
        displayValueRange = [(NSArray *)v6 firstObject];
        [displayValueRange doubleValue];
        double v34 = v33;
        v35 = [(NSArray *)v6 lastObject];
        [v35 doubleValue];
        uint64_t v37 = [(CAMOverlayContinuousFloatRange *)v32 initWithMinimum:v34 maximum:v36];
        objc_super v38 = v18->_displayValueRange;
        v18->_displayValueRange = (CAMOverlayValueRange *)v37;
      }
      displayValues = v18->_displayValues;
      v18->_displayValues = v6;
      v23 = v6;

      v40 = v7;
      values = v18->_values;
      v18->_values = v40;
      v2 = v18;
LABEL_17:
    }
  }

  return v2;
}

- (CAMOverlayServiceSlider)sliderWithPrimaryValues:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(CAMOverlayServiceSlider *)self copy];
  v6 = (void *)v5[14];
  v5[14] = v4;

  return (CAMOverlayServiceSlider *)v5;
}

- (int64_t)controlType
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [(CAMOverlayServiceSlider *)self sliderType];
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
  if (v4)
  {
    int64_t v7 = [(CAMOverlayServiceSlider *)self sliderType];
    uint64_t v8 = [(CAMOverlayServiceSlider *)self captureDeviceUniqueID];
    if (v8)
    {
      uint64_t v9 = (void *)[v5 initWithIdentifier:v6 sliderType:v7 captureUniqueID:v8];
    }
    else
    {
      id v15 = [(CAMOverlayServiceSlider *)self captureSessionUniqueID];
      uint64_t v9 = (void *)[v5 initWithIdentifier:v6 sliderType:v7 captureUniqueID:v15];
    }
    uint64_t v16 = [(CAMOverlayServiceSlider *)self primaryValues];
    v6 = (void *)v9[14];
    v9[14] = v16;
  }
  else
  {
    uint64_t v10 = [(CAMAbstractOverlayServiceControl *)self title];
    id v11 = [(CAMAbstractOverlayServiceControl *)self imageName];
    int64_t v12 = [(CAMOverlayServiceSlider *)self rangeScale];
    double v13 = [(CAMOverlayServiceSlider *)self valueRange];
    double v14 = [(CAMOverlayServiceSlider *)self primaryValues];
    uint64_t v9 = (void *)[v5 initWithIdentifier:v6 title:v10 imageName:v11 rangeScale:v12 valueRange:v13 primaryValues:v14];
  }
  double v17 = [(CAMOverlayServiceSlider *)self displayValuesByValue];
  [v9 setDisplayValuesByValue:v17];

  v18 = [(CAMOverlayServiceSlider *)self valueFormat];
  [v9 setValueFormat:v18];

  [v9 setEnabled:self->super._enabled];
  return v9;
}

- (void)setValueFormat:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v10 = 0;
    id v5 = [NSString stringWithValidatedFormat:v4, @"%@", &v10, @"test" validFormatSpecifiers error];
    id v6 = v10;
    if (v5)
    {
      int64_t v7 = (NSString *)[v4 copy];
      valueFormat = self->_valueFormat;
      self->_valueFormat = v7;
    }
    else
    {
      valueFormat = os_log_create("com.apple.camera.overlay", "Client");
      if (os_log_type_enabled(valueFormat, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v12 = v4;
        __int16 v13 = 2114;
        double v14 = self;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_error_impl(&dword_2496FE000, valueFormat, OS_LOG_TYPE_ERROR, "Invalid value format %{public}@ for %{public}@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v9 = self->_valueFormat;
    self->_valueFormat = 0;
  }
}

- (BOOL)isEnabled
{
  v12.receiver = self;
  v12.super_class = (Class)CAMOverlayServiceSlider;
  BOOL v3 = [(CAMAbstractOverlayServiceControl *)&v12 isEnabled];
  if (v3)
  {
    int v4 = [(CAMOverlayFloatValueRange *)self->_valueRange isDiscrete];
    valueRange = self->_valueRange;
    if (v4)
    {
      LOBYTE(v3) = (unint64_t)[(CAMOverlayFloatValueRange *)valueRange count] > 1;
    }
    else if ([(CAMOverlayFloatValueRange *)valueRange isFloatingPoint])
    {
      id v6 = self->_valueRange;
      [(CAMOverlayFloatValueRange *)v6 minimum];
      double v8 = v7;
      [(CAMOverlayFloatValueRange *)v6 maximum];
      double v10 = v9;

      LOBYTE(v3) = v8 != v10;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMOverlayServiceSlider;
  if ([(CAMAbstractOverlayServiceControl *)&v19 isContentEqual:v4])
  {
    int64_t sliderType = self->_sliderType;
    if (sliderType == [v4 sliderType])
    {
      valueRange = self->_valueRange;
      double v7 = [v4 valueRange];
      if (![(CAMOverlayFloatValueRange *)valueRange isEqualToRange:v7])
      {
        BOOL v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v8 = 112;
      primaryValues = self->_primaryValues;
      double v10 = [v4 primaryValues];
      if (primaryValues != v10)
      {
        id v11 = self->_primaryValues;
        uint64_t v8 = [v4 primaryValues];
        if (![(CAMOverlayDiscreteFloatRange *)v11 isEqualToRange:v8])
        {
          BOOL v12 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v13 = 128;
      valueFormat = self->_valueFormat;
      __int16 v15 = [v4 valueFormat];
      if (valueFormat == v15
        || (id v16 = self->_valueFormat,
            [v4 valueFormat],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v16 isEqualToString:v13]))
      {
        int64_t rangeScale = self->_rangeScale;
        BOOL v12 = rangeScale == [v4 rangeScale];
        if (valueFormat == v15)
        {

LABEL_15:
          if (primaryValues == v10)
          {
LABEL_17:

            goto LABEL_18;
          }
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        BOOL v12 = 0;
      }

      goto LABEL_15;
    }
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (CAMOverlayServiceSlider)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@.%@", v7, @"sliderType"];
  uint64_t v78 = [v4 decodeIntegerForKey:v8];

  double v9 = NSString;
  double v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  BOOL v12 = [v9 stringWithFormat:@"%@.%@", v11, @"rangeScale"];
  uint64_t v77 = [v4 decodeIntegerForKey:v12];

  uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  double v14 = NSString;
  __int16 v15 = (objc_class *)objc_opt_class();
  id v16 = NSStringFromClass(v15);
  uint64_t v17 = [v14 stringWithFormat:@"%@.%@", v16, @"identifier"];
  uint64_t v82 = [v4 decodeObjectOfClasses:v13 forKey:v17];

  v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  objc_super v19 = NSString;
  objc_super v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v22 = [v19 stringWithFormat:@"%@.%@", v21, @"title"];
  uint64_t v81 = [v4 decodeObjectOfClasses:v18 forKey:v22];

  v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v24 = NSString;
  v25 = (objc_class *)objc_opt_class();
  double v26 = NSStringFromClass(v25);
  double v27 = [v24 stringWithFormat:@"%@.%@", v26, @"imageName"];
  uint64_t v80 = [v4 decodeObjectOfClasses:v23 forKey:v27];

  v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  double v29 = NSString;
  uint64_t v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  v32 = [v29 stringWithFormat:@"%@.%@", v31, @"captureDeviceUniqueID"];
  v84 = [v4 decodeObjectOfClasses:v28 forKey:v32];

  double v33 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  double v34 = NSString;
  v35 = (objc_class *)objc_opt_class();
  double v36 = NSStringFromClass(v35);
  uint64_t v37 = [v34 stringWithFormat:@"%@.%@", v36, @"captureSessionUniqueID"];
  uint64_t v79 = [v4 decodeObjectOfClasses:v33 forKey:v37];

  objc_super v38 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v39 = NSString;
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  long long v42 = [v39 stringWithFormat:@"%@.%@", v41, @"primaryValues"];
  v83 = [v4 decodeObjectOfClasses:v38 forKey:v42];

  long long v43 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  long long v44 = NSString;
  long long v45 = (objc_class *)objc_opt_class();
  v46 = NSStringFromClass(v45);
  uint64_t v47 = [v44 stringWithFormat:@"%@.%@", v46, @"valueFormat"];
  v48 = [v4 decodeObjectOfClasses:v43 forKey:v47];

  v49 = (void *)MEMORY[0x263EFFA08];
  uint64_t v50 = objc_opt_class();
  v51 = objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v52 = NSString;
  v53 = (objc_class *)objc_opt_class();
  v54 = NSStringFromClass(v53);
  v55 = [v52 stringWithFormat:@"%@.%@", v54, @"valueRange"];
  v56 = [v4 decodeObjectOfClasses:v51 forKey:v55];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v57 = v56;
  }
  else {
    v57 = 0;
  }
  id v58 = v57;
  switch(v78)
  {
    case 0:
      v59 = (void *)v82;
      v60 = (void *)v80;
      if (!v82) {
        goto LABEL_22;
      }
      v61 = (void *)v81;
      v62 = (void *)v79;
      if (v81 && v80 && v56 && v83)
      {
        v74 = [(CAMOverlayServiceSlider *)self initWithIdentifier:v82 title:v81 imageName:v80 rangeScale:v77 valueRange:v56 primaryValues:v83];
        goto LABEL_21;
      }
      break;
    case 1:
      v59 = (void *)v82;
      v60 = (void *)v80;
      if (!v82) {
        goto LABEL_22;
      }
      v61 = (void *)v81;
      v62 = (void *)v79;
      if (v84)
      {
        v63 = self;
        uint64_t v64 = v82;
        goto LABEL_20;
      }
      break;
    case 2:
    case 3:
    case 4:
      v59 = (void *)v82;
      v60 = (void *)v80;
      if (!v82)
      {
LABEL_22:
        v61 = (void *)v81;
        goto LABEL_25;
      }
      v61 = (void *)v81;
      v62 = (void *)v79;
      if (v79)
      {
        v63 = self;
        uint64_t v64 = v82;
LABEL_20:
        v74 = -[CAMOverlayServiceSlider initWithIdentifier:sliderType:captureUniqueID:](v63, "initWithIdentifier:sliderType:captureUniqueID:", v64);
LABEL_21:
        self = v74;
      }
      break;
    case 5:
    case 6:
    case 7:
      v59 = (void *)v82;
      if (v82 && v84)
      {
        self = -[CAMOverlayServiceSlider _initWithIdentifier:sliderType:captureUniqueID:zoomRange:](self, "_initWithIdentifier:sliderType:captureUniqueID:zoomRange:", v82);
        v65 = (void *)MEMORY[0x263EFFA08];
        uint64_t v66 = objc_opt_class();
        v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
        v68 = NSString;
        v69 = (objc_class *)objc_opt_class();
        v70 = NSStringFromClass(v69);
        v71 = [v68 stringWithFormat:@"%@.%@", v70, @"displayValuesByValue"];
        v72 = [v4 decodeObjectOfClasses:v67 forKey:v71];
        displayValuesByValue = self->_displayValuesByValue;
        self->_displayValuesByValue = v72;
      }
      goto LABEL_24;
    default:
      v59 = (void *)v82;
LABEL_24:
      v60 = (void *)v80;
      v61 = (void *)v81;
LABEL_25:
      v62 = (void *)v79;
      break;
  }
  if (v48) {
    [(CAMOverlayServiceSlider *)self setValueFormat:v48];
  }
  v75 = [(CAMAbstractOverlayServiceControl *)self identifier];

  if (!v75)
  {

    self = 0;
  }

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  v45.receiver = self;
  v45.super_class = (Class)CAMOverlayServiceSlider;
  id v4 = a3;
  [(CAMAbstractOverlayServiceControl *)&v45 encodeWithCoder:v4];
  int64_t v5 = [(CAMOverlayServiceSlider *)self sliderType];
  id v6 = NSString;
  double v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  double v9 = [v6 stringWithFormat:@"%@.%@", v8, @"sliderType", v45.receiver, v45.super_class];
  [v4 encodeInteger:v5 forKey:v9];

  int64_t v10 = [(CAMOverlayServiceSlider *)self rangeScale];
  id v11 = NSString;
  BOOL v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  double v14 = [v11 stringWithFormat:@"%@.%@", v13, @"rangeScale"];
  [v4 encodeInteger:v10 forKey:v14];

  __int16 v15 = [(CAMOverlayServiceSlider *)self valueRange];
  id v16 = NSString;
  uint64_t v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  objc_super v19 = [v16 stringWithFormat:@"%@.%@", v18, @"valueRange"];
  [v4 encodeObject:v15 forKey:v19];

  objc_super v20 = [(CAMOverlayServiceSlider *)self primaryValues];
  v21 = NSString;
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v24 = [v21 stringWithFormat:@"%@.%@", v23, @"primaryValues"];
  [v4 encodeObject:v20 forKey:v24];

  v25 = [(CAMOverlayServiceSlider *)self displayValuesByValue];
  double v26 = NSString;
  double v27 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v27);
  double v29 = [v26 stringWithFormat:@"%@.%@", v28, @"displayValuesByValue"];
  [v4 encodeObject:v25 forKey:v29];

  uint64_t v30 = [(CAMOverlayServiceSlider *)self captureDeviceUniqueID];
  v31 = NSString;
  v32 = (objc_class *)objc_opt_class();
  double v33 = NSStringFromClass(v32);
  double v34 = [v31 stringWithFormat:@"%@.%@", v33, @"captureDeviceUniqueID"];
  [v4 encodeObject:v30 forKey:v34];

  v35 = [(CAMOverlayServiceSlider *)self captureSessionUniqueID];
  double v36 = NSString;
  uint64_t v37 = (objc_class *)objc_opt_class();
  objc_super v38 = NSStringFromClass(v37);
  v39 = [v36 stringWithFormat:@"%@.%@", v38, @"captureSessionUniqueID"];
  [v4 encodeObject:v35 forKey:v39];

  v40 = [(CAMOverlayServiceSlider *)self valueFormat];
  v41 = NSString;
  long long v42 = (objc_class *)objc_opt_class();
  long long v43 = NSStringFromClass(v42);
  long long v44 = [v41 stringWithFormat:@"%@.%@", v43, @"valueFormat"];
  [v4 encodeObject:v40 forKey:v44];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)sliderType
{
  return self->_sliderType;
}

- (CAMOverlayFloatValueRange)valueRange
{
  return self->_valueRange;
}

- (NSDictionary)displayValuesByValue
{
  return self->_displayValuesByValue;
}

- (void)setDisplayValuesByValue:(id)a3
{
}

- (NSString)captureDeviceUniqueID
{
  return self->_captureDeviceUniqueID;
}

- (NSString)captureSessionUniqueID
{
  return self->_captureSessionUniqueID;
}

- (CAMOverlayDiscreteFloatRange)primaryValues
{
  return self->_primaryValues;
}

- (int64_t)rangeScale
{
  return self->_rangeScale;
}

- (NSString)valueFormat
{
  return self->_valueFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFormat, 0);
  objc_storeStrong((id *)&self->_primaryValues, 0);
  objc_storeStrong((id *)&self->_captureSessionUniqueID, 0);
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, 0);
  objc_storeStrong((id *)&self->_displayValuesByValue, 0);
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_displayValues, 0);
  objc_storeStrong((id *)&self->_displayValueRange, 0);
}

- (id)updateWithStyleDictionary:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([(CAMOverlayServiceSlider *)self sliderType] - 2) > 2)
  {
    id v7 = 0;
  }
  else
  {
    int64_t v5 = [CAMOverlayServiceControlUpdate alloc];
    id v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
    id v7 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 styleDictionary:v4];
  }
  return v7;
}

- (id)updateWithFloatValue:(float)a3
{
  int64_t v5 = [CAMOverlayServiceControlUpdate alloc];
  id v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
  *(float *)&double v7 = a3;
  id v8 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 floatValue:v7];

  return v8;
}

- (id)updateWithRecording:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [CAMOverlayServiceControlUpdate alloc];
  id v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
  id v7 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 isRecording:v3];

  return v7;
}

@end