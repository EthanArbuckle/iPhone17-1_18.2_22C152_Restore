@interface CAMOverlayServiceToggle
+ (BOOL)supportsSecureCoding;
- (BOOL)isContentEqual:(id)a3;
- (BOOL)persistentlyVisible;
- (CAMOverlayServiceToggle)initWithCoder:(id)a3;
- (CAMOverlayServiceToggle)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 onImageName:(id)a6 offImageName:(id)a7;
- (CAMOverlayServiceToggle)initWithIdentifier:(id)a3 toggleType:(int64_t)a4;
- (NSString)offImageName;
- (NSString)offTitle;
- (NSString)onImageName;
- (NSString)onTitle;
- (id)updateWithBooleanValue:(BOOL)a3;
- (int64_t)controlType;
- (int64_t)toggleType;
- (void)encodeWithCoder:(id)a3;
- (void)setOffImageName:(id)a3;
- (void)setOnImageName:(id)a3;
@end

@implementation CAMOverlayServiceToggle

- (CAMOverlayServiceToggle)initWithIdentifier:(id)a3 title:(id)a4 imageName:(id)a5 onImageName:(id)a6 offImageName:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CAMOverlayServiceToggle;
  v15 = [(CAMAbstractOverlayServiceControl *)&v24 _initWithIdentifier:a3 title:a4 imageName:a5];
  v16 = (CAMOverlayServiceToggle *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 7, a6);
    objc_storeStrong((id *)&v16->_offImageName, a7);
    v17 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
    uint64_t v18 = [v17 localizedStringForKey:@"TOGGLE_ON" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
    onTitle = v16->_onTitle;
    v16->_onTitle = (NSString *)v18;

    v20 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Camoverlayserv.isa)];
    uint64_t v21 = [v20 localizedStringForKey:@"TOGGLE_OFF" value:&stru_26FD435D8 table:@"CameraOverlayServices"];
    offTitle = v16->_offTitle;
    v16->_offTitle = (NSString *)v21;

    v16->_toggleType = 0;
  }

  return v16;
}

- (CAMOverlayServiceToggle)initWithIdentifier:(id)a3 toggleType:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      v10.receiver = self;
      v10.super_class = (Class)CAMOverlayServiceToggle;
      self = [(CAMAbstractOverlayServiceControl *)&v10 _initWithIdentifier:v6 title:&stru_26FD435D8 imageName:&stru_26FD435D8];
      offImageName = self->_offImageName;
      self->_offImageName = (NSString *)@"lock.open.fill";

      onImageName = self->_onImageName;
      self->_onImageName = (NSString *)@"lock.fill";

      self->_toggleType = 1;
    }
  }
  else
  {

    self = 0;
  }

  return self;
}

- (BOOL)persistentlyVisible
{
  return [(CAMOverlayServiceToggle *)self toggleType] == 1;
}

- (int64_t)controlType
{
  return 2;
}

- (BOOL)isContentEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMOverlayServiceToggle;
  if ([(CAMAbstractOverlayServiceControl *)&v16 isContentEqual:v4]
    && (int64_t toggleType = self->_toggleType, toggleType == [v4 toggleType]))
  {
    onTitle = self->_onTitle;
    v7 = [v4 onTitle];
    if ([(NSString *)onTitle isEqualToString:v7])
    {
      offTitle = self->_offTitle;
      v9 = [v4 offTitle];
      if ([(NSString *)offTitle isEqualToString:v9])
      {
        offImageName = self->_offImageName;
        v11 = [v4 offImageName];
        if ([(NSString *)offImageName isEqualToString:v11])
        {
          onImageName = self->_onImageName;
          id v13 = [v4 onImageName];
          BOOL v14 = [(NSString *)onImageName isEqualToString:v13];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)CAMOverlayServiceToggle;
  id v4 = a3;
  [(CAMAbstractOverlayServiceControl *)&v30 encodeWithCoder:v4];
  v5 = [(CAMOverlayServiceToggle *)self onImageName];
  id v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"%@.%@", v8, @"onImageName", v30.receiver, v30.super_class];
  [v4 encodeObject:v5 forKey:v9];

  objc_super v10 = [(CAMOverlayServiceToggle *)self offImageName];
  v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  BOOL v14 = [v11 stringWithFormat:@"%@.%@", v13, @"offImageName"];
  [v4 encodeObject:v10 forKey:v14];

  v15 = [(CAMOverlayServiceToggle *)self onTitle];
  objc_super v16 = NSString;
  v17 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v17);
  v19 = [v16 stringWithFormat:@"%@.%@", v18, @"onTitle"];
  [v4 encodeObject:v15 forKey:v19];

  v20 = [(CAMOverlayServiceToggle *)self offTitle];
  uint64_t v21 = NSString;
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  objc_super v24 = [v21 stringWithFormat:@"%@.%@", v23, @"offTitle"];
  [v4 encodeObject:v20 forKey:v24];

  int64_t v25 = [(CAMOverlayServiceToggle *)self toggleType];
  v26 = NSString;
  v27 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v27);
  v29 = [v26 stringWithFormat:@"%@.%@", v28, @"toggleType"];
  [v4 encodeInteger:v25 forKey:v29];
}

- (CAMOverlayServiceToggle)initWithCoder:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@.%@", v7, @"toggleType"];
  uint64_t v57 = [v5 decodeIntegerForKey:v8];

  v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  objc_super v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  id v13 = [v10 stringWithFormat:@"%@.%@", v12, @"identifier"];
  uint64_t v56 = [v5 decodeObjectOfClasses:v9 forKey:v13];

  BOOL v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v15 = NSString;
  objc_super v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  uint64_t v18 = [v15 stringWithFormat:@"%@.%@", v17, @"title"];
  uint64_t v55 = [v5 decodeObjectOfClasses:v14 forKey:v18];

  v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v20 = NSString;
  uint64_t v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v23 = [v20 stringWithFormat:@"%@.%@", v22, @"imageName"];
  uint64_t v54 = [v5 decodeObjectOfClasses:v19 forKey:v23];

  objc_super v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  int64_t v25 = NSString;
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  v28 = [v25 stringWithFormat:@"%@.%@", v27, @"onImageName"];
  uint64_t v53 = [v5 decodeObjectOfClasses:v24 forKey:v28];

  v29 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  objc_super v30 = NSString;
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  v33 = [v30 stringWithFormat:@"%@.%@", v32, @"offImageName"];
  v34 = [v5 decodeObjectOfClasses:v29 forKey:v33];

  v35 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v36 = NSString;
  v37 = (objc_class *)objc_opt_class();
  v38 = NSStringFromClass(v37);
  v39 = [v36 stringWithFormat:@"%@.%@", v38, @"onTitle"];
  v40 = [v5 decodeObjectOfClasses:v35 forKey:v39];

  v41 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v42 = NSString;
  v43 = (objc_class *)objc_opt_class();
  v44 = NSStringFromClass(v43);
  v45 = [v42 stringWithFormat:@"%@.%@", v44, @"offTitle"];
  v46 = [v5 decodeObjectOfClasses:v41 forKey:v45];

  if (v57 == 1)
  {
    v47 = (void *)v56;
    if (v56) {
      self = [(CAMOverlayServiceToggle *)self initWithIdentifier:v56 toggleType:1];
    }
    goto LABEL_12;
  }
  if (v57)
  {
    v47 = (void *)v56;
    goto LABEL_12;
  }
  v47 = (void *)v56;
  if (!v56)
  {
LABEL_12:
    v49 = (void *)v54;
    v48 = (void *)v55;
    v50 = (void *)v53;
    goto LABEL_13;
  }
  v49 = (void *)v54;
  v48 = (void *)v55;
  v50 = (void *)v53;
  if (v55 && v54 && v53 && v34)
  {
    self = [(CAMOverlayServiceToggle *)self initWithIdentifier:v56 title:v55 imageName:v54 onImageName:v53 offImageName:v34];
    objc_storeStrong((id *)&self->_onTitle, v40);
    objc_storeStrong((id *)&self->_offTitle, v46);
  }
LABEL_13:
  v51 = [(CAMAbstractOverlayServiceControl *)self identifier];

  if (!v51)
  {

    self = 0;
  }

  return self;
}

- (int64_t)toggleType
{
  return self->_toggleType;
}

- (NSString)onImageName
{
  return self->_onImageName;
}

- (void)setOnImageName:(id)a3
{
}

- (NSString)offImageName
{
  return self->_offImageName;
}

- (void)setOffImageName:(id)a3
{
}

- (NSString)onTitle
{
  return self->_onTitle;
}

- (NSString)offTitle
{
  return self->_offTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offTitle, 0);
  objc_storeStrong((id *)&self->_onTitle, 0);
  objc_storeStrong((id *)&self->_offImageName, 0);
  objc_storeStrong((id *)&self->_onImageName, 0);
}

- (id)updateWithBooleanValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [CAMOverlayServiceControlUpdate alloc];
  id v6 = [(CAMAbstractOverlayServiceControl *)self identifier];
  id v7 = [(CAMOverlayServiceControlUpdate *)v5 _initWithControlIdentifier:v6 BOOLeanValue:v3];

  return v7;
}

@end