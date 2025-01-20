@interface CPMapButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (CPImageSet)imageSet;
- (CPMapButton)init;
- (CPMapButton)initWithCoder:(id)a3;
- (CPMapButton)initWithHandler:(void *)handler;
- (CPMapButtonDelegate)controlDelegate;
- (NSString)description;
- (NSUUID)identifier;
- (UIImage)focusedImage;
- (UIImage)image;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setControlDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setFocusedImage:(UIImage *)focusedImage;
- (void)setHandler:(id)a3;
- (void)setHidden:(BOOL)hidden;
- (void)setIdentifier:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setImageSet:(id)a3;
@end

@implementation CPMapButton

- (CPMapButton)init
{
  return [(CPMapButton *)self initWithHandler:0];
}

- (CPMapButton)initWithHandler:(void *)handler
{
  v4 = handler;
  v11.receiver = self;
  v11.super_class = (Class)CPMapButton;
  v5 = [(CPMapButton *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08C38] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = 1;
    uint64_t v8 = MEMORY[0x21D4648A0](v4);
    id v9 = v5->_handler;
    v5->_handler = (id)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPMapButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPMapButton *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPMapButtonIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"CPMapButtonEnabled"];
    v5->_hidden = [v4 decodeBoolForKey:@"CPMapButtonHidden"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPMapButtonImage"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPMapButtonFocusedImage"];
    objc_super v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = CPSanitizeImage(v10, v11);
    focusedImage = v5->_focusedImage;
    v5->_focusedImage = (UIImage *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPMapButton *)self identifier];
  [v4 encodeObject:v5 forKey:@"CPMapButtonIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapButton isEnabled](self, "isEnabled"), @"CPMapButtonEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[CPMapButton isHidden](self, "isHidden"), @"CPMapButtonHidden");
  uint64_t v6 = [(CPMapButton *)self imageSet];
  [v4 encodeObject:v6 forKey:@"CPMapButtonImage"];

  id v7 = [(CPMapButton *)self focusedImage];
  [v4 encodeObject:v7 forKey:@"CPMapButtonFocusedImage"];
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CPMapButton;
  id v4 = [(CPMapButton *)&v10 description];
  v5 = [(CPMapButton *)self identifier];
  uint64_t v6 = CPSStringFromBOOL([(CPMapButton *)self isEnabled]);
  id v7 = CPSStringFromBOOL([(CPMapButton *)self isHidden]);
  uint64_t v8 = [v3 stringWithFormat:@"%@ {UUID: %@, enabled: %@, hidden: %@}", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    id v4 = [(CPMapButton *)self controlDelegate];
    [v4 control:self setEnabled:self->_enabled];
  }
}

- (void)setHidden:(BOOL)hidden
{
  BOOL v3 = hidden;
  v5 = [(CPMapButton *)self controlDelegate];
  [v5 mapButton:self setHidden:v3];

  self->_hidden = v3;
}

- (void)setImage:(UIImage *)image
{
  uint64_t v8 = image;
  if (v8)
  {
    id v4 = [[CPImageSet alloc] initWithImage:v8];
    imageSet = self->_imageSet;
    self->_imageSet = v4;
  }
  else
  {
    imageSet = self->_imageSet;
    self->_imageSet = 0;
  }

  uint64_t v6 = [(CPMapButton *)self controlDelegate];
  id v7 = [(CPMapButton *)self imageSet];
  [v6 mapButton:self setImageSet:v7];
}

- (UIImage)image
{
  v2 = [(CPMapButton *)self imageSet];
  BOOL v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setFocusedImage:(UIImage *)focusedImage
{
  if (self->_focusedImage != focusedImage)
  {
    id v4 = focusedImage;
    v5 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v4, v5);
    uint64_t v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    id v7 = self->_focusedImage;
    self->_focusedImage = v6;

    id v8 = [(CPMapButton *)self controlDelegate];
    [v8 mapButton:self setFocusedImage:self->_focusedImage];
  }
}

- (void)handlePrimaryAction
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2181A5000, a2, OS_LOG_TYPE_ERROR, "%@ action handler nil", (uint8_t *)&v2, 0xCu);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UIImage)focusedImage
{
  return self->_focusedImage;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
}

- (CPMapButtonDelegate)controlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlDelegate);

  return (CPMapButtonDelegate *)WeakRetained;
}

- (void)setControlDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlDelegate);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_focusedImage, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end