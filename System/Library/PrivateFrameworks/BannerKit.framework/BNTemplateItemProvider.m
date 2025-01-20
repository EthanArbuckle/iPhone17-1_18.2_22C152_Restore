@interface BNTemplateItemProvider
+ (BOOL)supportsSecureCoding;
- (BNCAPackageProviding)templateItemCAPackageProvider;
- (BNImageProviding)templateItemImageProvider;
- (BNTemplateItemProvider)initWithCoder:(id)a3;
- (BNTemplateItemProvider)initWithItem:(id)a3;
- (BOOL)isHidden;
- (NSAttributedString)templateItemAttributedText;
- (NSString)accessibilityIdentifier;
- (NSString)templateItemText;
- (UIButtonConfiguration)templateItemButtonConfiguration;
- (int64_t)visualStyle;
- (int64_t)visualStyleCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setVisualStyle:(int64_t)a3;
- (void)setVisualStyleCategory:(int64_t)a3;
@end

@implementation BNTemplateItemProvider

- (BNTemplateItemProvider)initWithItem:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 1;
LABEL_13:
    v8 = v6;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 2;
    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 isImageProvider])
  {
    uint64_t v7 = 3;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 4;
    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v6 isCAPackageProvider])
  {
    uint64_t v7 = 5;
    goto LABEL_13;
  }

  v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2, self, @"BNTemplateItemProvider.m", 62, @"Invalid item: %@", v6 object file lineNumber description];
  uint64_t v7 = 0;
LABEL_14:

  v12.receiver = self;
  v12.super_class = (Class)BNTemplateItemProvider;
  v9 = [(BNTemplateItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_templateItem, a3);
    v10->_templateItemType = v7;
  }

  return v10;
}

- (NSString)templateItemText
{
  if (self->_templateItemType == 1) {
    return (NSString *)self->_templateItem;
  }
  else {
    return (NSString *)0;
  }
}

- (NSAttributedString)templateItemAttributedText
{
  if (self->_templateItemType == 2) {
    return (NSAttributedString *)self->_templateItem;
  }
  else {
    return (NSAttributedString *)0;
  }
}

- (BNImageProviding)templateItemImageProvider
{
  if (self->_templateItemType == 3) {
    return (BNImageProviding *)self->_templateItem;
  }
  else {
    return (BNImageProviding *)0;
  }
}

- (UIButtonConfiguration)templateItemButtonConfiguration
{
  if (self->_templateItemType == 4) {
    return (UIButtonConfiguration *)self->_templateItem;
  }
  else {
    return (UIButtonConfiguration *)0;
  }
}

- (BNCAPackageProviding)templateItemCAPackageProvider
{
  if (self->_templateItemType == 5) {
    return (BNCAPackageProviding *)self->_templateItem;
  }
  else {
    return (BNCAPackageProviding *)0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_templateItemType forKey:@"itemType"];
  unint64_t v4 = self->_templateItemType - 1;
  if (v4 <= 3) {
    [v7 encodeObject:self->_templateItem forKey:off_1E63B9880[v4]];
  }
  if (self->_visualStyleCategory >= 1 && self->_visualStyle >= 1)
  {
    objc_msgSend(v7, "encodeInteger:forKey:");
    [v7 encodeInteger:self->_visualStyle forKey:@"visualStyle"];
  }
  if (self->_hidden) {
    [v7 encodeBool:1 forKey:@"hidden"];
  }
  uint64_t v5 = [(NSString *)self->_accessibilityIdentifier length];
  id v6 = v7;
  if (v5)
  {
    uint64_t v5 = [v7 encodeObject:self->_accessibilityIdentifier forKey:@"accessibilityIdentifier"];
    id v6 = v7;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (BNTemplateItemProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"itemType"] - 1;
  if (v5 > 3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:off_1E63B98C0[v5]];
  }
  id v7 = [(BNTemplateItemProvider *)self initWithItem:v6];
  if (v7)
  {
    v7->_visualStyleCategory = [v4 decodeIntegerForKey:@"visualStyleCategory"];
    v7->_visualStyle = [v4 decodeIntegerForKey:@"visualStyle"];
    v7->_hidden = [v4 decodeBoolForKey:@"hidden"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityIdentifier"];
    accessibilityIdentifier = v7->_accessibilityIdentifier;
    v7->_accessibilityIdentifier = (NSString *)v8;
  }
  return v7;
}

- (int64_t)visualStyleCategory
{
  return self->_visualStyleCategory;
}

- (void)setVisualStyleCategory:(int64_t)a3
{
  self->_visualStyleCategory = a3;
}

- (int64_t)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(int64_t)a3
{
  self->_visualStyle = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_templateItem, 0);
}

@end