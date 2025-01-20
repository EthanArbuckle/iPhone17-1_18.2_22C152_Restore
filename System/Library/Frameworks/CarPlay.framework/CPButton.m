@interface CPButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (CPButton)initWithCoder:(id)a3;
- (CPButton)initWithImage:(UIImage *)image handler:(void *)handler;
- (CPControlDelegate)delegate;
- (CPImageSet)imageSet;
- (CPTemplate)associatedTemplate;
- (NSString)description;
- (NSString)title;
- (NSUUID)identifier;
- (UIImage)image;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setAssociatedTemplate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSet:(id)a3;
- (void)setTitle:(NSString *)title;
@end

@implementation CPButton

- (CPButton)initWithImage:(UIImage *)image handler:(void *)handler
{
  v6 = image;
  v7 = handler;
  v14.receiver = self;
  v14.super_class = (Class)CPButton;
  v8 = [(CPButton *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08C38] UUID];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    v8->_enabled = 1;
    uint64_t v11 = MEMORY[0x21D4648A0](v7);
    id v12 = v8->_handler;
    v8->_handler = (id)v11;

    if (v6) {
      [(CPButton *)v8 setImage:v6];
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPButton *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPButtonIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"CPButtonEnabled"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPButtonImageSet"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPButtonTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPButton *)self identifier];
  [v4 encodeObject:v5 forKey:@"CPButtonIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CPButton isEnabled](self, "isEnabled"), @"CPButtonEnabled");
  uint64_t v6 = [(CPButton *)self imageSet];
  [v4 encodeObject:v6 forKey:@"CPButtonImageSet"];

  id v7 = [(CPButton *)self title];
  [v4 encodeObject:v7 forKey:@"CPButtonTitleKey"];
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CPButton;
  id v4 = [(CPButton *)&v9 description];
  v5 = [(CPButton *)self identifier];
  uint64_t v6 = CPSStringFromBOOL([(CPButton *)self isEnabled]);
  id v7 = [v3 stringWithFormat:@"%@ {UUID: %@, enabled: %@}", v4, v5, v6];

  return (NSString *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    id v4 = [(CPButton *)self delegate];
    [v4 control:self setEnabled:self->_enabled];
  }
}

- (void)setImage:(id)a3
{
  id v9 = a3;
  id v4 = [(CPButton *)self image];
  char v5 = [v4 isEqual:v9];

  if ((v5 & 1) == 0)
  {
    if (v9)
    {
      uint64_t v6 = [[CPImageSet alloc] initWithImage:v9 treatmentBlock:&__block_literal_global_5];
      imageSet = self->_imageSet;
      self->_imageSet = v6;
    }
    uint64_t v8 = [(CPButton *)self associatedTemplate];
    [v8 setNeedsUpdate];
  }
}

id __21__CPButton_setImage___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 50.0, 50.0);
}

- (UIImage)image
{
  v2 = [(CPButton *)self imageSet];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setTitle:(NSString *)title
{
  id v9 = title;
  id v4 = [(CPButton *)self title];
  char v5 = [v4 isEqualToString:v9];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (NSString *)[(NSString *)v9 copy];
    id v7 = self->_title;
    self->_title = v6;

    uint64_t v8 = [(CPButton *)self associatedTemplate];
    [v8 setNeedsUpdate];
  }
}

- (void)handlePrimaryAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(CPButton *)self handler];

  id v4 = CarPlayFrameworkGeneralLogging();
  uint64_t v5 = (uint64_t)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl(&dword_2181A5000, (os_log_t)v5, OS_LOG_TYPE_INFO, "%@ will call action handler", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [(CPButton *)self handler];
    (*(void (**)(uint64_t, CPButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [(CPMapButton *)(uint64_t)self handlePrimaryAction];
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (CPControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
}

- (CPTemplate)associatedTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedTemplate);

  return (CPTemplate *)WeakRetained;
}

- (void)setAssociatedTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedTemplate);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end