@interface CPBarButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (CPBarButton)initWithCoder:(id)a3;
- (CPBarButton)initWithImage:(UIImage *)image handler:(CPBarButtonHandler)handler;
- (CPBarButton)initWithTitle:(NSString *)title handler:(CPBarButtonHandler)handler;
- (CPBarButton)initWithType:(CPBarButtonType)type handler:(CPBarButtonHandler)handler;
- (CPBarButtonDelegate)delegate;
- (CPBarButtonStyle)buttonStyle;
- (CPBarButtonType)buttonType;
- (NSString)description;
- (NSString)title;
- (NSUUID)identifier;
- (UIImage)image;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setButtonStyle:(CPBarButtonStyle)buttonStyle;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(UIImage *)image;
- (void)setTitle:(NSString *)title;
@end

@implementation CPBarButton

- (CPBarButton)initWithImage:(UIImage *)image handler:(CPBarButtonHandler)handler
{
  v7 = image;
  CPBarButtonHandler v8 = handler;
  v15.receiver = self;
  v15.super_class = (Class)CPBarButton;
  v9 = [(CPBarButton *)&v15 init];
  if (v9)
  {
    uint64_t v10 = MEMORY[0x21D4648A0](v8);
    id v11 = v9->_handler;
    v9->_handler = (id)v10;

    objc_storeStrong((id *)&v9->_image, image);
    uint64_t v12 = [MEMORY[0x263F08C38] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v12;

    v9->_enabled = 1;
    v9->_buttonStyle = 0;
  }

  return v9;
}

- (CPBarButton)initWithTitle:(NSString *)title handler:(CPBarButtonHandler)handler
{
  v7 = title;
  CPBarButtonHandler v8 = handler;
  v15.receiver = self;
  v15.super_class = (Class)CPBarButton;
  v9 = [(CPBarButton *)&v15 init];
  if (v9)
  {
    uint64_t v10 = MEMORY[0x21D4648A0](v8);
    id v11 = v9->_handler;
    v9->_handler = (id)v10;

    objc_storeStrong((id *)&v9->_title, title);
    uint64_t v12 = [MEMORY[0x263F08C38] UUID];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v12;

    v9->_enabled = 1;
    v9->_buttonStyle = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPBarButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPBarButton;
  v5 = [(CPBarButton *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPBarButtonIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"CPBarButtonEnabled"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPBarButtonTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPBarButtonImage"];
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = CPSanitizeImage(v10, v11);
    image = v5->_image;
    v5->_image = (UIImage *)v12;

    v5->_buttonStyle = [v4 decodeIntegerForKey:@"CPBarButtonStyle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CPBarButton *)self identifier];
  [v7 encodeObject:v4 forKey:@"CPBarButtonIdentifier"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CPBarButton isEnabled](self, "isEnabled"), @"CPBarButtonEnabled");
  v5 = [(CPBarButton *)self title];
  [v7 encodeObject:v5 forKey:@"CPBarButtonTitle"];

  uint64_t v6 = [(CPBarButton *)self image];
  [v7 encodeObject:v6 forKey:@"CPBarButtonImage"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CPBarButton buttonStyle](self, "buttonStyle"), @"CPBarButtonStyle");
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CPBarButton;
  id v4 = [(CPBarButton *)&v9 description];
  v5 = [(CPBarButton *)self identifier];
  uint64_t v6 = CPSStringFromBOOL([(CPBarButton *)self isEnabled]);
  id v7 = [v3 stringWithFormat:@"%@ {UUID: %@, enabled: %@}", v4, v5, v6];

  return (NSString *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    BOOL v3 = enabled;
    self->_enabled = enabled;
    id v5 = [(CPBarButton *)self delegate];
    [v5 control:self setEnabled:v3];
  }
}

- (void)setImage:(UIImage *)image
{
  if (self->_image != image)
  {
    id v4 = image;
    id v5 = (objc_class *)objc_opt_class();
    CPSanitizeImage(v4, v5);
    uint64_t v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    id v7 = self->_image;
    self->_image = v6;

    id v8 = [(CPBarButton *)self delegate];
    [v8 barButton:self setImage:self->_image];
  }
}

- (void)setTitle:(NSString *)title
{
  id v7 = title;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    id v4 = (NSString *)[(NSString *)v7 copy];
    id v5 = self->_title;
    self->_title = v4;

    uint64_t v6 = [(CPBarButton *)self delegate];
    [v6 barButton:self setTitle:v7];
  }
}

- (void)handlePrimaryAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CPBarButton *)self handler];

  id v4 = CarPlayFrameworkGeneralLogging();
  uint64_t v5 = (uint64_t)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl(&dword_2181A5000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "%@ will call action handler", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [(CPBarButton *)self handler];
    (*(void (**)(uint64_t, CPBarButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [(CPMapButton *)(uint64_t)self handlePrimaryAction];
  }
}

- (CPBarButton)initWithType:(CPBarButtonType)type handler:(CPBarButtonHandler)handler
{
  CPBarButtonHandler v7 = handler;
  if (type == CPBarButtonTypeImage)
  {
    uint64_t v8 = [(CPBarButton *)self initWithImage:0 handler:v7];
  }
  else
  {
    if (type)
    {
      uint64_t v10 = (void *)MEMORY[0x263EFF940];
      uint64_t v11 = *MEMORY[0x263EFF4A0];
      uint64_t v12 = NSStringFromSelector(a2);
      [v10 raise:v11, @"Invalid button type passed to %@", v12 format];

      objc_super v9 = 0;
      goto LABEL_7;
    }
    uint64_t v8 = [(CPBarButton *)self initWithTitle:0 handler:v7];
  }
  self = v8;
  objc_super v9 = self;
LABEL_7:

  return v9;
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

- (CPBarButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(CPBarButtonStyle)buttonStyle
{
  self->_buttonStyle = buttonStyle;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (CPBarButtonType)buttonType
{
  return self->_buttonType;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (CPBarButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPBarButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end