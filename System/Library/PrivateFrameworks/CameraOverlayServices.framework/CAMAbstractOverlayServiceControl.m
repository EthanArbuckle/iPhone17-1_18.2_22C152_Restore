@interface CAMAbstractOverlayServiceControl
+ (BOOL)supportsSecureCoding;
+ (id)_preferredLocale;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)isEnabled;
- (BOOL)persistentlyVisible;
- (CAMAbstractOverlayServiceControl)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)imageName;
- (NSString)title;
- (id)_initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5;
- (id)description;
- (id)updateWithEnabled:(BOOL)a3;
- (id)validateUpdate:(id)a3;
- (int64_t)controlType;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation CAMAbstractOverlayServiceControl

+ (id)_preferredLocale
{
  if (_preferredLocale_onceToken != -1) {
    dispatch_once(&_preferredLocale_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_preferredLocale_preferredLocale;
  return v2;
}

void __52__CAMAbstractOverlayServiceControl__preferredLocale__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 preferredLocalizations];
  id v4 = [v1 firstObject];

  uint64_t v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
  v3 = (void *)_preferredLocale_preferredLocale;
  _preferredLocale_preferredLocale = v2;
}

- (id)_initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CAMAbstractOverlayServiceControl;
  v12 = [(CAMAbstractOverlayServiceControl *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v14 = [(id)objc_opt_class() _preferredLocale];
    uint64_t v15 = [v10 uppercaseStringWithLocale:v14];
    title = v13->_title;
    v13->_title = (NSString *)v15;

    objc_storeStrong((id *)&v13->_imageName, a5);
    v13->_enabled = 1;
  }

  return v13;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = a3;
  title = self->_title;
  v6 = [v4 title];
  if ([(NSString *)title isEqualToString:v6])
  {
    imageName = self->_imageName;
    v8 = [v4 imageName];
    if ([(NSString *)imageName isEqualToString:v8])
    {
      int64_t controlType = self->_controlType;
      BOOL v10 = controlType == [v4 controlType];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  unint64_t v3 = [(CAMAbstractOverlayServiceControl *)self controlType];
  if (v3 > 2) {
    id v4 = 0;
  }
  else {
    id v4 = off_265261F10[v3];
  }
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(CAMAbstractOverlayServiceControl *)self title];
  id v9 = [(CAMAbstractOverlayServiceControl *)self identifier];
  BOOL v10 = [v5 stringWithFormat:@"<%@: %p; %@ titled %@ with ID %@>", v7, self, v4, v8, v9];

  return v10;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMAbstractOverlayServiceControl)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [v6 stringWithFormat:@"%@.%@", v8, @"identifier"];
  BOOL v10 = [v4 decodeObjectOfClass:v5 forKey:v9];

  if (v10)
  {
    v29.receiver = self;
    v29.super_class = (Class)CAMAbstractOverlayServiceControl;
    id v11 = [(CAMAbstractOverlayServiceControl *)&v29 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_identifier, v10);
      v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      v14 = NSString;
      uint64_t v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [v14 stringWithFormat:@"%@.%@", v16, @"imageName"];
      uint64_t v18 = [v4 decodeObjectOfClasses:v13 forKey:v17];
      imageName = v12->_imageName;
      v12->_imageName = (NSString *)v18;

      v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
      v21 = NSString;
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      v24 = [v21 stringWithFormat:@"%@.%@", v23, @"title"];
      uint64_t v25 = [v4 decodeObjectOfClasses:v20 forKey:v24];
      title = v12->_title;
      v12->_title = (NSString *)v25;
    }
    self = v12;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMAbstractOverlayServiceControl *)self identifier];
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [v6 stringWithFormat:@"%@.%@", v8, @"identifier"];
  [v4 encodeObject:v5 forKey:v9];

  BOOL v10 = [(CAMAbstractOverlayServiceControl *)self imageName];
  id v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = [v11 stringWithFormat:@"%@.%@", v13, @"imageName"];
  [v4 encodeObject:v10 forKey:v14];

  id v19 = [(CAMAbstractOverlayServiceControl *)self title];
  uint64_t v15 = NSString;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  uint64_t v18 = [v15 stringWithFormat:@"%@.%@", v17, @"title"];
  [v4 encodeObject:v19 forKey:v18];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)controlType
{
  return self->_controlType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)persistentlyVisible
{
  return self->_persistentlyVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)validateUpdate:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 valueType];
  int64_t v6 = [(CAMAbstractOverlayServiceControl *)self controlType];
  v7 = [v4 controlIdentifier];
  v8 = [(CAMAbstractOverlayServiceControl *)self identifier];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F07F80];
    v33[0] = @"InvalidIdentifier";
    v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v21 = v19;
    uint64_t v22 = -100;
    goto LABEL_10;
  }
  if (v6 == 2)
  {
    uint64_t v18 = 0;
    if (v5 > 4 || v5 == 3) {
      goto LABEL_29;
    }
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F07F80];
    v33[0] = @"InvalidValueType";
    v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v21 = v23;
    uint64_t v22 = -12;
LABEL_10:
    uint64_t v18 = [v21 errorWithDomain:@"CAMOverlayErrorDomain" code:v22 userInfo:v20];

    goto LABEL_29;
  }
  if (v6 == 1)
  {
    BOOL v10 = self;
    uint64_t v24 = [(CAMAbstractOverlayServiceControl *)v10 pickerType];
    switch(v5)
    {
      case 0uLL:
      case 3uLL:
      case 4uLL:
LABEL_21:
        objc_super v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F07F80];
        v33[0] = @"InvalidValueType";
        v30 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
        uint64_t v18 = [v29 errorWithDomain:@"CAMOverlayErrorDomain" code:-12 userInfo:v30];

        break;
      case 1uLL:
        if (([v4 indexValue] & 0x8000000000000000) == 0)
        {
          unint64_t v25 = [v4 indexValue];
          v26 = [(CAMAbstractOverlayServiceControl *)v10 valueTitles];
          unint64_t v27 = [v26 count];

          if (v25 < v27) {
            goto LABEL_23;
          }
        }
        uint64_t v28 = -13;
        goto LABEL_25;
      case 2uLL:
        if (v24) {
          goto LABEL_23;
        }
        uint64_t v28 = -12;
LABEL_25:
        uint64_t v18 = CAMOverlayErrorForCode(v28);
        break;
      default:
LABEL_23:
        uint64_t v18 = 0;
        break;
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v18 = 0;
      goto LABEL_29;
    }
    BOOL v10 = self;
    unint64_t v11 = [(CAMAbstractOverlayServiceControl *)v10 sliderType];
    switch(v5)
    {
      case 0uLL:
        [v4 floatValue];
        float v13 = v12;
        v14 = [(CAMAbstractOverlayServiceControl *)v10 valueRange];
        double v15 = v13;
        [v14 minimum];
        if (v16 + -0.0001 <= v15 && ([v14 maximum], v17 + 0.0001 >= v15))
        {
          uint64_t v18 = 0;
        }
        else
        {
          uint64_t v18 = CAMOverlayErrorForCode(-13);
        }

        break;
      case 1uLL:
      case 3uLL:
        goto LABEL_21;
      case 2uLL:
        uint64_t v18 = 0;
        if (v11 <= 7 && ((1 << v11) & 0xE3) != 0) {
          goto LABEL_21;
        }
        break;
      default:
        goto LABEL_23;
    }
  }

LABEL_29:
  return v18;
}

- (id)updateWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [CAMOverlayServiceControlUpdate alloc];
  int64_t v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
  id v7 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 isEnabled:v3];

  return v7;
}

@end