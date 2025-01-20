@interface SFSafariViewControllerActivityButton
+ (BOOL)supportsSecureCoding;
- (BOOL)_fieldsAreValid;
- (NSString)extensionIdentifier;
- (SFSafariViewControllerActivityButton)initWithCoder:(id)a3;
- (SFSafariViewControllerActivityButton)initWithTemplateImage:(UIImage *)templateImage extensionIdentifier:(NSString *)extensionIdentifier;
- (UIImage)templateImage;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_fieldsAreValid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFSafariViewControllerActivityButton

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(UIImage *)self->_templateImage copy];
  v6 = (void *)[(NSString *)self->_extensionIdentifier copy];
  v7 = (void *)[v4 initWithTemplateImage:v5 extensionIdentifier:v6];

  v8 = [(SFSafariViewControllerActivityButton *)self accessibilityLabel];
  v9 = (void *)[v8 copy];
  [v7 setAccessibilityLabel:v9];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariViewControllerActivityButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateImage"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityLabel"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentifier"];

  v8 = [(SFSafariViewControllerActivityButton *)self initWithTemplateImage:v5 extensionIdentifier:v7];
  [(SFSafariViewControllerActivityButton *)v8 setAccessibilityLabel:v6];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  templateImage = self->_templateImage;
  id v6 = a3;
  [v6 encodeObject:templateImage forKey:@"templateImage"];
  v5 = [(SFSafariViewControllerActivityButton *)self accessibilityLabel];
  [v6 encodeObject:v5 forKey:@"accessibilityLabel"];

  [v6 encodeObject:self->_extensionIdentifier forKey:@"extensionIdentifier"];
}

- (SFSafariViewControllerActivityButton)initWithTemplateImage:(UIImage *)templateImage extensionIdentifier:(NSString *)extensionIdentifier
{
  id v6 = templateImage;
  v7 = extensionIdentifier;
  v15.receiver = self;
  v15.super_class = (Class)SFSafariViewControllerActivityButton;
  v8 = [(SFSafariViewControllerActivityButton *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [(UIImage *)v6 copy];
    v10 = v8->_templateImage;
    v8->_templateImage = (UIImage *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_extensionIdentifier;
    v8->_extensionIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)_fieldsAreValid
{
  if (!self->_extensionIdentifier)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXExtensions();
    BOOL v7 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[SFSafariViewControllerActivityButton _fieldsAreValid](v8);
LABEL_12:
    LOBYTE(v7) = 0;
    return v7;
  }
  templateImage = self->_templateImage;
  if (!templateImage)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXExtensions();
    BOOL v7 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    -[SFSafariViewControllerActivityButton _fieldsAreValid](v9);
    goto LABEL_12;
  }
  [(UIImage *)templateImage size];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  if (v5 == 0.0 || v3 == 0.0)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXExtensions();
    BOOL v7 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    [(SFSafariViewControllerActivityButton *)v10 _fieldsAreValid];
    goto LABEL_12;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (UIImage)templateImage
{
  return self->_templateImage;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);

  objc_storeStrong((id *)&self->_templateImage, 0);
}

- (void)_fieldsAreValid
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v5 = a1;
  v10.width = a2;
  v10.height = a3;
  CGFloat v6 = NSStringFromCGSize(v10);
  int v7 = 138543362;
  v8 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Not showing activity button because templateImage has an invalid size: %{public}@", (uint8_t *)&v7, 0xCu);
}

@end