@interface CAMOverlayServiceControl
+ (BOOL)supportsSecureCoding;
- (CAMOverlayDiscreteFloatRange)primaryValues;
- (CAMOverlayServiceControl)init;
- (CAMOverlayServiceControl)initWithCoder:(id)a3;
- (CAMOverlayServiceControl)initWithIdentifier:(id)a3;
- (CAMOverlayValueRange)valueRange;
- (NSString)captureDeviceUniqueID;
- (NSString)valueFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)captureDeviceProperty;
- (int64_t)rangeScale;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureDeviceProperty:(int64_t)a3;
- (void)setCaptureDeviceUniqueID:(id)a3;
- (void)setImageName:(id)a3;
- (void)setPrimaryValues:(id)a3;
- (void)setRangeScale:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setValueFormat:(id)a3;
- (void)setValueRange:(id)a3;
@end

@implementation CAMOverlayServiceControl

- (CAMOverlayServiceControl)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayServiceControl;
  result = [(CAMAbstractOverlayServiceControl *)&v4 _initWithIdentifier:a3 title:&stru_26FD435D8 imageName:&stru_26FD435D8];
  if (result)
  {
    result->_captureDeviceProperty = 0;
    result->_rangeScale = 0;
  }
  return result;
}

- (CAMOverlayServiceControl)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  objc_super v4 = [v3 UUIDString];
  v5 = [(CAMOverlayServiceControl *)self initWithIdentifier:v4];

  return v5;
}

- (void)setTitle:(id)a3
{
}

- (void)setImageName:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(CAMAbstractOverlayServiceControl *)self identifier];
  v6 = (void *)[v4 initWithIdentifier:v5];

  v7 = [(CAMOverlayServiceControl *)self valueRange];
  [v6 setValueRange:v7];

  v8 = [(CAMOverlayServiceControl *)self valueFormat];
  [v6 setValueFormat:v8];

  v9 = [(CAMOverlayServiceControl *)self primaryValues];
  [v6 setPrimaryValues:v9];

  v10 = [(CAMAbstractOverlayServiceControl *)self imageName];
  [v6 setImageName:v10];

  v11 = [(CAMAbstractOverlayServiceControl *)self title];
  [v6 setTitle:v11];

  objc_msgSend(v6, "setRangeScale:", -[CAMOverlayServiceControl rangeScale](self, "rangeScale"));
  v12 = [(CAMOverlayServiceControl *)self captureDeviceUniqueID];
  [v6 setCaptureDeviceUniqueID:v12];

  objc_msgSend(v6, "setCaptureDeviceProperty:", -[CAMOverlayServiceControl captureDeviceProperty](self, "captureDeviceProperty"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayServiceControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CAMOverlayServiceControl;
  v5 = [(CAMAbstractOverlayServiceControl *)&v46 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"%@.%@", v12, @"valueRange"];
    uint64_t v14 = [v4 decodeObjectOfClasses:v9 forKey:v13];
    valueRange = v5->_valueRange;
    v5->_valueRange = (CAMOverlayValueRange *)v14;

    v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v17 stringWithFormat:@"%@.%@", v19, @"valueFormat"];
    uint64_t v21 = [v4 decodeObjectOfClasses:v16 forKey:v20];
    valueFormat = v5->_valueFormat;
    v5->_valueFormat = (NSString *)v21;

    v23 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v24 = NSString;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = [v24 stringWithFormat:@"%@.%@", v26, @"primaryValues"];
    uint64_t v28 = [v4 decodeObjectOfClasses:v23 forKey:v27];
    primaryValues = v5->_primaryValues;
    v5->_primaryValues = (CAMOverlayDiscreteFloatRange *)v28;

    v30 = NSString;
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    v33 = [v30 stringWithFormat:@"%@.%@", v32, @"rangeScale"];
    v5->_rangeScale = [v4 decodeIntegerForKey:v33];

    v34 = NSString;
    v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    v37 = [v34 stringWithFormat:@"%@.%@", v36, @"captureDeviceProperty"];
    v5->_captureDeviceProperty = [v4 decodeIntegerForKey:v37];

    v38 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v39 = NSString;
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    v42 = [v39 stringWithFormat:@"%@.%@", v41, @"captureDeviceUniqueID"];
    uint64_t v43 = [v4 decodeObjectOfClasses:v38 forKey:v42];
    captureDeviceUniqueID = v5->_captureDeviceUniqueID;
    v5->_captureDeviceUniqueID = (NSString *)v43;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)CAMOverlayServiceControl;
  id v4 = a3;
  [(CAMAbstractOverlayServiceControl *)&v35 encodeWithCoder:v4];
  v5 = [(CAMOverlayServiceControl *)self valueRange];
  v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"%@.%@", v8, @"valueRange", v35.receiver, v35.super_class];
  [v4 encodeObject:v5 forKey:v9];

  v10 = [(CAMOverlayServiceControl *)self valueFormat];
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  uint64_t v14 = [v11 stringWithFormat:@"%@.%@", v13, @"valueFormat"];
  [v4 encodeObject:v10 forKey:v14];

  v15 = [(CAMOverlayServiceControl *)self primaryValues];
  v16 = NSString;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v19 = [v16 stringWithFormat:@"%@.%@", v18, @"primaryValues"];
  [v4 encodeObject:v15 forKey:v19];

  int64_t v20 = [(CAMOverlayServiceControl *)self rangeScale];
  uint64_t v21 = NSString;
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v24 = [v21 stringWithFormat:@"%@.%@", v23, @"rangeScale"];
  [v4 encodeInteger:v20 forKey:v24];

  int64_t v25 = [(CAMOverlayServiceControl *)self captureDeviceProperty];
  v26 = NSString;
  v27 = (objc_class *)objc_opt_class();
  uint64_t v28 = NSStringFromClass(v27);
  v29 = [v26 stringWithFormat:@"%@.%@", v28, @"captureDeviceProperty"];
  [v4 encodeInteger:v25 forKey:v29];

  v30 = [(CAMOverlayServiceControl *)self captureDeviceUniqueID];
  v31 = NSString;
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  v34 = [v31 stringWithFormat:@"%@.%@", v33, @"captureDeviceUniqueID"];
  [v4 encodeObject:v30 forKey:v34];
}

- (NSString)captureDeviceUniqueID
{
  return self->_captureDeviceUniqueID;
}

- (void)setCaptureDeviceUniqueID:(id)a3
{
}

- (int64_t)captureDeviceProperty
{
  return self->_captureDeviceProperty;
}

- (void)setCaptureDeviceProperty:(int64_t)a3
{
  self->_captureDeviceProperty = a3;
}

- (CAMOverlayValueRange)valueRange
{
  return self->_valueRange;
}

- (void)setValueRange:(id)a3
{
}

- (NSString)valueFormat
{
  return self->_valueFormat;
}

- (void)setValueFormat:(id)a3
{
}

- (CAMOverlayDiscreteFloatRange)primaryValues
{
  return self->_primaryValues;
}

- (void)setPrimaryValues:(id)a3
{
}

- (int64_t)rangeScale
{
  return self->_rangeScale;
}

- (void)setRangeScale:(int64_t)a3
{
  self->_rangeScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryValues, 0);
  objc_storeStrong((id *)&self->_valueFormat, 0);
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, 0);
}

@end