@interface ATXPosterConfiguration
+ (BOOL)supportsSecureCoding;
- (ATXComplication)inlineComplication;
- (ATXFaceGalleryItem)galleryItem;
- (ATXPosterConfiguration)initWithCoder:(id)a3;
- (ATXPosterConfiguration)initWithExtensionBundleIdentifier:(id)a3 active:(BOOL)a4 selected:(BOOL)a5 inlineComplication:(id)a6 complications:(id)a7 landscapeComplications:(id)a8 modeUUID:(id)a9 font:(id)a10 color:(id)a11 numberingSystem:(id)a12 posterUUID:(id)a13 galleryItem:(id)a14;
- (ATXPosterConfiguration)initWithExtensionBundleIdentifier:(id)a3 active:(BOOL)a4 selected:(BOOL)a5 inlineComplication:(id)a6 complications:(id)a7 modeUUID:(id)a8 font:(id)a9 color:(id)a10 numberingSystem:(id)a11 posterUUID:(id)a12 galleryItem:(id)a13;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPosterConfiguration:(id)a3;
- (BOOL)isSelected;
- (NSArray)complications;
- (NSArray)landscapeComplications;
- (NSString)color;
- (NSString)extensionBundleIdentifier;
- (NSString)font;
- (NSString)numberingSystem;
- (NSString)posterUUID;
- (NSUUID)modeUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXPosterConfiguration

- (ATXPosterConfiguration)initWithExtensionBundleIdentifier:(id)a3 active:(BOOL)a4 selected:(BOOL)a5 inlineComplication:(id)a6 complications:(id)a7 modeUUID:(id)a8 font:(id)a9 color:(id)a10 numberingSystem:(id)a11 posterUUID:(id)a12 galleryItem:(id)a13
{
  BOOL v30 = a4;
  BOOL v31 = a5;
  v17 = (void *)MEMORY[0x1E4F29128];
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a3;
  v25 = [v17 UUID];
  v26 = [v25 UUIDString];
  v27 = [(ATXPosterConfiguration *)self initWithExtensionBundleIdentifier:v24 active:v30 selected:v31 inlineComplication:v23 complications:v22 landscapeComplications:MEMORY[0x1E4F1CBF0] modeUUID:v21 font:v20 color:v19 numberingSystem:v18 posterUUID:v26 galleryItem:0];

  return v27;
}

- (ATXPosterConfiguration)initWithExtensionBundleIdentifier:(id)a3 active:(BOOL)a4 selected:(BOOL)a5 inlineComplication:(id)a6 complications:(id)a7 landscapeComplications:(id)a8 modeUUID:(id)a9 font:(id)a10 color:(id)a11 numberingSystem:(id)a12 posterUUID:(id)a13 galleryItem:(id)a14
{
  id v17 = a3;
  id obj = a6;
  id v50 = a6;
  id v18 = a7;
  id v19 = a8;
  id v49 = a9;
  id v20 = v18;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v25 = v19;
  id v26 = a14;
  v51.receiver = self;
  v51.super_class = (Class)ATXPosterConfiguration;
  v27 = [(ATXPosterConfiguration *)&v51 init];
  if (v27)
  {
    uint64_t v28 = [v17 copy];
    extensionBundleIdentifier = v27->_extensionBundleIdentifier;
    v27->_extensionBundleIdentifier = (NSString *)v28;

    v27->_active = a4;
    v27->_selected = a5;
    objc_storeStrong((id *)&v27->_inlineComplication, obj);
    uint64_t v30 = [v20 copy];
    complications = v27->_complications;
    v27->_complications = (NSArray *)v30;

    uint64_t v32 = [v25 copy];
    landscapeComplications = v27->_landscapeComplications;
    v27->_landscapeComplications = (NSArray *)v32;

    objc_storeStrong((id *)&v27->_modeUUID, a9);
    uint64_t v34 = [v21 copy];
    font = v27->_font;
    v27->_font = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    color = v27->_color;
    v27->_color = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    numberingSystem = v27->_numberingSystem;
    v27->_numberingSystem = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    posterUUID = v27->_posterUUID;
    v27->_posterUUID = (NSString *)v40;

    uint64_t v42 = [v26 copy];
    galleryItem = v27->_galleryItem;
    v27->_galleryItem = (ATXFaceGalleryItem *)v42;
  }
  return v27;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@; ", v5];

  v6 = [(ATXPosterConfiguration *)self extensionBundleIdentifier];
  [v3 appendFormat:@"extensionBundleIdentifier: %@; ", v6];

  if ([(ATXPosterConfiguration *)self isActive]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"active: %@; ", v7];
  if ([(ATXPosterConfiguration *)self isSelected]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@"selected: %@; ", v8];
  v9 = [(ATXPosterConfiguration *)self inlineComplication];
  [v3 appendFormat:@"inlineComplication: %@; ", v9];

  v10 = [(ATXPosterConfiguration *)self complications];
  [v3 appendFormat:@"complications: %@; ", v10];

  v11 = [(ATXPosterConfiguration *)self landscapeComplications];
  [v3 appendFormat:@"landscapeComplications: %@; ", v11];

  v12 = [(ATXPosterConfiguration *)self modeUUID];
  v13 = [v12 UUIDString];
  [v3 appendFormat:@"modeUUID: %@; ", v13];

  v14 = [(ATXPosterConfiguration *)self font];
  [v3 appendFormat:@"font: %@; ", v14];

  v15 = [(ATXPosterConfiguration *)self color];
  [v3 appendFormat:@"color: %@; ", v15];

  v16 = [(ATXPosterConfiguration *)self numberingSystem];
  [v3 appendFormat:@"numberingSystem: %@; ", v16];

  id v17 = [(ATXPosterConfiguration *)self posterUUID];
  [v3 appendFormat:@"posterUUID: %@; ", v17];

  id v18 = [(ATXPosterConfiguration *)self galleryItem];
  [v3 appendFormat:@"galleryItem: %@; ", v18];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  if (v5)
  {
    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeUUID"];
    unsigned int v39 = [v4 decodeBoolForKey:@"selected"];
    unsigned int v38 = [v4 decodeBoolForKey:@"active"];
    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inlineComplication"];
    v6 = (void *)MEMORY[0x1AD0D3C30]();
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"complications"];
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E4F1CBF0];
    if (v10) {
      v13 = (void *)v10;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v37 = v13;

    v14 = (void *)MEMORY[0x1AD0D3C30]();
    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"landscapeComplications"];
    id v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = v12;
    }
    id v36 = v20;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
    if (!v21)
    {
      int v22 = [v4 decodeBoolForKey:@"isCustomFont"];
      id v23 = @"isDefault";
      if (v22) {
        id v23 = @"isCustom";
      }
      id v21 = v23;
    }
    id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    if (!v24)
    {
      int v25 = [v4 decodeBoolForKey:@"isCustomColor"];
      id v26 = @"isDefault";
      if (v25) {
        id v26 = @"isCustom";
      }
      id v24 = v26;
    }
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberingSystem"];
    if (!v27)
    {
      int v28 = [v4 decodeBoolForKey:@"isCustomNumberingSystem"];
      v29 = @"isDefault";
      if (v28) {
        v29 = @"isCustom";
      }
      v27 = v29;
    }
    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterUUID"];
    BOOL v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"galleryItem"];
    uint64_t v32 = [(ATXPosterConfiguration *)self initWithExtensionBundleIdentifier:v5 active:v38 selected:v39 inlineComplication:v40 complications:v37 landscapeComplications:v36 modeUUID:v41 font:v21 color:v24 numberingSystem:v27 posterUUID:v30 galleryItem:v31];

    self = v32;
    v33 = self;
  }
  else
  {
    uint64_t v34 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ATXPosterConfiguration initWithCoder:](v34);
    }

    v33 = 0;
  }

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPosterConfiguration *)self extensionBundleIdentifier];
  [v4 encodeObject:v5 forKey:@"extensionBundleIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ATXPosterConfiguration isSelected](self, "isSelected"), @"selected");
  v6 = [(ATXPosterConfiguration *)self inlineComplication];
  [v4 encodeObject:v6 forKey:@"inlineComplication"];

  id v7 = [(ATXPosterConfiguration *)self complications];
  [v4 encodeObject:v7 forKey:@"complications"];

  uint64_t v8 = [(ATXPosterConfiguration *)self landscapeComplications];
  [v4 encodeObject:v8 forKey:@"landscapeComplications"];

  v9 = [(ATXPosterConfiguration *)self modeUUID];
  [v4 encodeObject:v9 forKey:@"modeUUID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[ATXPosterConfiguration isActive](self, "isActive"), @"active");
  uint64_t v10 = [(ATXPosterConfiguration *)self font];
  [v4 encodeObject:v10 forKey:@"font"];

  v11 = [(ATXPosterConfiguration *)self color];
  [v4 encodeObject:v11 forKey:@"color"];

  v12 = [(ATXPosterConfiguration *)self numberingSystem];
  [v4 encodeObject:v12 forKey:@"numberingSystem"];

  v13 = [(ATXPosterConfiguration *)self posterUUID];
  [v4 encodeObject:v13 forKey:@"posterUUID"];

  id v14 = [(ATXPosterConfiguration *)self galleryItem];
  [v4 encodeObject:v14 forKey:@"galleryItem"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  id v4 = [(ATXPosterConfiguration *)v3 extensionBundleIdentifier];
  BOOL v16 = [(ATXPosterConfiguration *)v3 isActive];
  BOOL v15 = [(ATXPosterConfiguration *)v3 isSelected];
  v5 = [(ATXPosterConfiguration *)v3 inlineComplication];
  v6 = [(ATXPosterConfiguration *)v3 complications];
  id v14 = [(ATXPosterConfiguration *)v3 landscapeComplications];
  id v7 = [(ATXPosterConfiguration *)v3 modeUUID];
  uint64_t v8 = [(ATXPosterConfiguration *)v3 font];
  v9 = [(ATXPosterConfiguration *)v3 color];
  uint64_t v10 = [(ATXPosterConfiguration *)v3 numberingSystem];
  v11 = [(ATXPosterConfiguration *)v3 posterUUID];
  v12 = [(ATXPosterConfiguration *)v3 galleryItem];
  id v17 = [(ATXPosterConfiguration *)v3 initWithExtensionBundleIdentifier:v4 active:v16 selected:v15 inlineComplication:v5 complications:v6 landscapeComplications:v14 modeUUID:v7 font:v8 color:v9 numberingSystem:v10 posterUUID:v11 galleryItem:v12];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPosterConfiguration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPosterConfiguration *)self isEqualToATXPosterConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToATXPosterConfiguration:(id)a3
{
  id v4 = (id *)a3;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  BOOL v6 = (NSString *)v4[2];
  if (extensionBundleIdentifier == v6)
  {
  }
  else
  {
    id v7 = v6;
    uint64_t v8 = extensionBundleIdentifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_37;
    }
  }
  int selected = self->_selected;
  if (selected != [v4 isSelected]) {
    goto LABEL_37;
  }
  inlineComplication = self->_inlineComplication;
  v12 = (ATXComplication *)v4[3];
  if (inlineComplication == v12)
  {
  }
  else
  {
    v13 = v12;
    id v14 = inlineComplication;
    BOOL v15 = [(ATXComplication *)v14 isEqual:v13];

    if (!v15) {
      goto LABEL_37;
    }
  }
  complications = self->_complications;
  id v17 = (NSArray *)v4[4];
  if (complications == v17)
  {
  }
  else
  {
    uint64_t v18 = v17;
    id v19 = complications;
    char v20 = [(NSArray *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_37;
    }
  }
  landscapeComplications = self->_landscapeComplications;
  int v22 = (NSArray *)v4[5];
  if (landscapeComplications == v22)
  {
  }
  else
  {
    id v23 = v22;
    id v24 = landscapeComplications;
    char v25 = [(NSArray *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_37;
    }
  }
  modeUUID = self->_modeUUID;
  v27 = (NSUUID *)v4[6];
  if (modeUUID == v27)
  {
  }
  else
  {
    int v28 = v27;
    v29 = modeUUID;
    char v30 = [(NSUUID *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_37;
    }
  }
  int active = self->_active;
  if (active != [v4 isActive])
  {
LABEL_37:
    char v52 = 0;
    goto LABEL_38;
  }
  font = self->_font;
  v33 = (NSString *)v4[7];
  if (font == v33)
  {
  }
  else
  {
    uint64_t v34 = v33;
    v35 = font;
    char v36 = [(NSString *)v35 isEqual:v34];

    if ((v36 & 1) == 0) {
      goto LABEL_37;
    }
  }
  color = self->_color;
  unsigned int v38 = (NSString *)v4[8];
  if (color == v38)
  {
  }
  else
  {
    unsigned int v39 = v38;
    uint64_t v40 = color;
    char v41 = [(NSString *)v40 isEqual:v39];

    if ((v41 & 1) == 0) {
      goto LABEL_37;
    }
  }
  numberingSystem = self->_numberingSystem;
  v43 = (NSString *)v4[9];
  if (numberingSystem == v43)
  {
  }
  else
  {
    v44 = v43;
    v45 = numberingSystem;
    char v46 = [(NSString *)v45 isEqual:v44];

    if ((v46 & 1) == 0) {
      goto LABEL_37;
    }
  }
  posterUUID = self->_posterUUID;
  v48 = (NSString *)v4[10];
  if (posterUUID == v48)
  {
  }
  else
  {
    id v49 = v48;
    id v50 = posterUUID;
    char v51 = [(NSString *)v50 isEqual:v49];

    if ((v51 & 1) == 0) {
      goto LABEL_37;
    }
  }
  v54 = self->_galleryItem;
  v55 = v54;
  if (v54 == v4[11]) {
    char v52 = 1;
  }
  else {
    char v52 = -[ATXFaceGalleryItem isEqual:](v54, "isEqual:");
  }

LABEL_38:
  return v52;
}

- (unint64_t)hash
{
  v3 = [(ATXPosterConfiguration *)self extensionBundleIdentifier];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = 31 * v4 + [(ATXPosterConfiguration *)self isSelected];
  BOOL v6 = [(ATXPosterConfiguration *)self inlineComplication];
  uint64_t v7 = [v6 hash] - v5 + 32 * v5;

  uint64_t v8 = [(ATXPosterConfiguration *)self complications];
  uint64_t v9 = [v8 hash] - v7 + 32 * v7;

  uint64_t v10 = [(ATXPosterConfiguration *)self landscapeComplications];
  uint64_t v11 = [v10 hash] - v9 + 32 * v9;

  v12 = [(ATXPosterConfiguration *)self modeUUID];
  uint64_t v13 = [v12 hash] - v11 + 32 * v11;

  uint64_t v14 = 31 * v13 + [(ATXPosterConfiguration *)self isActive];
  BOOL v15 = [(ATXPosterConfiguration *)self font];
  uint64_t v16 = [v15 hash] - v14 + 32 * v14;

  id v17 = [(ATXPosterConfiguration *)self color];
  uint64_t v18 = [v17 hash] - v16 + 32 * v16;

  id v19 = [(ATXPosterConfiguration *)self numberingSystem];
  uint64_t v20 = [v19 hash] - v18 + 32 * v18;

  id v21 = [(ATXPosterConfiguration *)self posterUUID];
  uint64_t v22 = [v21 hash] - v20 + 32 * v20;

  id v23 = [(ATXPosterConfiguration *)self galleryItem];
  unint64_t v24 = [v23 hash] - v22 + 32 * v22;

  return v24;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (ATXComplication)inlineComplication
{
  return self->_inlineComplication;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSArray)landscapeComplications
{
  return self->_landscapeComplications;
}

- (NSUUID)modeUUID
{
  return self->_modeUUID;
}

- (NSString)font
{
  return self->_font;
}

- (NSString)color
{
  return self->_color;
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (NSString)posterUUID
{
  return self->_posterUUID;
}

- (ATXFaceGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryItem, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_landscapeComplications, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);

  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXPosterConfiguration initWithCoder:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: error decoding extensionBundleIdentifier", (uint8_t *)&v1, 0xCu);
}

@end