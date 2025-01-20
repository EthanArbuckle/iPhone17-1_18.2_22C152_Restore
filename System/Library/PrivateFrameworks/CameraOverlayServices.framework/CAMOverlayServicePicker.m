@interface CAMOverlayServicePicker
+ (BOOL)supportsSecureCoding;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEnabled;
- (CAMOverlayServicePicker)initWithCoder:(id)a3;
- (CAMOverlayServicePicker)initWithIdentifier:(id)a3 pickerType:(int64_t)a4 captureUniqueID:(id)a5;
- (CAMOverlayServicePicker)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 valueTitles:(id)a6;
- (NSArray)valueTitles;
- (NSString)captureSessionUniqueID;
- (id)updateWithIndexValue:(int64_t)a3;
- (id)updateWithStyleDictionary:(id)a3;
- (int64_t)controlType;
- (int64_t)pickerType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMOverlayServicePicker

- (CAMOverlayServicePicker)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 valueTitles:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CAMOverlayServicePicker;
  v11 = [(CAMAbstractOverlayServiceControl *)&v28 _initWithIdentifier:a3 title:a4 imageName:a5];
  v12 = v11;
  if (v11)
  {
    v11->_pickerType = 0;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
          v20 = objc_msgSend((id)objc_opt_class(), "_preferredLocale", (void)v24);
          v21 = [v19 uppercaseStringWithLocale:v20];
          [(NSArray *)v13 addObject:v21];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    valueTitles = v12->_valueTitles;
    v12->_valueTitles = v13;
  }
  return v12;
}

- (CAMOverlayServicePicker)initWithIdentifier:(id)a3 pickerType:(int64_t)a4 captureUniqueID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4)
  {
    if (a4 == 1)
    {
      id v10 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
      v11 = [v10 localizedStringForKey:@"PICKER_STYLE" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
      v13.receiver = self;
      v13.super_class = (Class)CAMOverlayServicePicker;
      self = [(CAMAbstractOverlayServiceControl *)&v13 _initWithIdentifier:v8 title:v11 imageName:@"dot.dot.grid.app"];

      objc_storeStrong((id *)&self->_captureSessionUniqueID, a5);
      self->_pickerType = 1;
    }
  }
  else
  {

    self = 0;
  }

  return self;
}

- (int64_t)controlType
{
  return 1;
}

- (BOOL)isEnabled
{
  v5.receiver = self;
  v5.super_class = (Class)CAMOverlayServicePicker;
  BOOL v3 = [(CAMAbstractOverlayServiceControl *)&v5 isEnabled];
  if (v3) {
    LOBYTE(v3) = [(NSArray *)self->_valueTitles count] > 1;
  }
  return v3;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMOverlayServicePicker;
  if ([(CAMAbstractOverlayServiceControl *)&v10 isContentEqual:v4]
    && (int64_t pickerType = self->_pickerType, pickerType == [v4 pickerType]))
  {
    valueTitles = self->_valueTitles;
    v7 = [v4 valueTitles];
    BOOL v8 = [(NSArray *)valueTitles isEqualToArray:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CAMOverlayServicePicker;
  id v4 = a3;
  [(CAMAbstractOverlayServiceControl *)&v20 encodeWithCoder:v4];
  objc_super v5 = [(CAMOverlayServicePicker *)self valueTitles];
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  BOOL v8 = NSStringFromClass(v7);
  id v9 = [v6 stringWithFormat:@"%@.%@", v8, @"valueTitles", v20.receiver, v20.super_class];
  [v4 encodeObject:v5 forKey:v9];

  objc_super v10 = [(CAMOverlayServicePicker *)self captureSessionUniqueID];
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  objc_super v13 = NSStringFromClass(v12);
  id v14 = [v11 stringWithFormat:@"%@.%@", v13, @"captureSessionUniqueID"];
  [v4 encodeObject:v10 forKey:v14];

  int64_t v15 = [(CAMOverlayServicePicker *)self pickerType];
  uint64_t v16 = NSString;
  uint64_t v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  v19 = [v16 stringWithFormat:@"%@.%@", v18, @"pickerType"];
  [v4 encodeInteger:v15 forKey:v19];
}

- (CAMOverlayServicePicker)initWithCoder:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  BOOL v8 = [v4 stringWithFormat:@"%@.%@", v7, @"pickerType"];
  uint64_t v46 = [v5 decodeIntegerForKey:v8];

  id v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  objc_super v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  objc_super v13 = [v10 stringWithFormat:@"%@.%@", v12, @"identifier"];
  uint64_t v44 = [v5 decodeObjectOfClasses:v9 forKey:v13];

  id v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  int64_t v15 = NSString;
  uint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  uint64_t v18 = [v15 stringWithFormat:@"%@.%@", v17, @"title"];
  uint64_t v45 = [v5 decodeObjectOfClasses:v14 forKey:v18];

  v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  objc_super v20 = NSString;
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [v20 stringWithFormat:@"%@.%@", v22, @"imageName"];
  long long v24 = [v5 decodeObjectOfClasses:v19 forKey:v23];

  long long v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  long long v26 = NSString;
  long long v27 = (objc_class *)objc_opt_class();
  objc_super v28 = NSStringFromClass(v27);
  v29 = [v26 stringWithFormat:@"%@.%@", v28, @"captureSessionUniqueID"];
  uint64_t v30 = [v5 decodeObjectOfClasses:v25 forKey:v29];

  v31 = (void *)MEMORY[0x263EFFA08];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v34 = NSString;
  v35 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v35);
  v37 = [v34 stringWithFormat:@"%@.%@", v36, @"valueTitles"];
  v38 = [v5 decodeObjectOfClasses:v33 forKey:v37];

  if (v46 == 1)
  {
    v39 = (void *)v44;
    if (v44)
    {
      v40 = (void *)v45;
      if (!v30) {
        goto LABEL_14;
      }
      v41 = [(CAMOverlayServicePicker *)self initWithIdentifier:v44 pickerType:1 captureUniqueID:v30];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v39 = (void *)v44;
  if (v46)
  {
LABEL_13:
    v40 = (void *)v45;
    goto LABEL_14;
  }
  v40 = (void *)v45;
  if (v44 && v45 && v24 && v38 && !v30)
  {
    v41 = [(CAMOverlayServicePicker *)self initWithIdentifier:v44 title:v45 imageName:v24 valueTitles:v38];
LABEL_12:
    self = v41;
  }
LABEL_14:
  v42 = [(CAMAbstractOverlayServiceControl *)self identifier];

  if (!v42)
  {

    self = 0;
  }

  return self;
}

- (int64_t)pickerType
{
  return self->_pickerType;
}

- (NSString)captureSessionUniqueID
{
  return self->_captureSessionUniqueID;
}

- (NSArray)valueTitles
{
  return self->_valueTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTitles, 0);
  objc_storeStrong((id *)&self->_captureSessionUniqueID, 0);
}

- (id)updateWithStyleDictionary:(id)a3
{
  id v4 = a3;
  if ([(CAMOverlayServicePicker *)self pickerType] == 1)
  {
    id v5 = [CAMOverlayServiceControlUpdate alloc];
    v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
    id v7 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 styleDictionary:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)updateWithIndexValue:(int64_t)a3
{
  id v5 = [CAMOverlayServiceControlUpdate alloc];
  v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
  id v7 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 indexValue:a3];

  return v7;
}

@end