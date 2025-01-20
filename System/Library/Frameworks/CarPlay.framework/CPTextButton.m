@interface CPTextButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (CPControlDelegate)delegate;
- (CPTextButton)initWithCoder:(id)a3;
- (CPTextButton)initWithTitle:(NSString *)title textStyle:(CPTextButtonStyle)textStyle handler:(void *)handler;
- (CPTextButtonStyle)textStyle;
- (NSString)description;
- (NSString)title;
- (NSUUID)identifier;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTextStyle:(CPTextButtonStyle)textStyle;
- (void)setTitle:(NSString *)title;
@end

@implementation CPTextButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTextButton)initWithTitle:(NSString *)title textStyle:(CPTextButtonStyle)textStyle handler:(void *)handler
{
  v8 = title;
  v9 = handler;
  v18.receiver = self;
  v18.super_class = (Class)CPTextButton;
  v10 = [(CPTextButton *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    v10->_enabled = 1;
    uint64_t v13 = MEMORY[0x21D4648A0](v9);
    id v14 = v10->_handler;
    v10->_handler = (id)v13;

    uint64_t v15 = [(NSString *)v8 copy];
    v16 = v10->_title;
    v10->_title = (NSString *)v15;

    v10->_textStyle = textStyle;
  }

  return v10;
}

- (CPTextButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPTextButton *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPControlIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"kCPControlEnabledKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPControlTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_textStyle = [v4 decodeIntegerForKey:@"kCPTextButtonStyleKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(CPTextButton *)self identifier];
  [v6 encodeObject:v4 forKey:@"kCPControlIdentifierKey"];

  objc_msgSend(v6, "encodeBool:forKey:", -[CPTextButton isEnabled](self, "isEnabled"), @"kCPControlEnabledKey");
  v5 = [(CPTextButton *)self title];
  [v6 encodeObject:v5 forKey:@"kCPControlTitleKey"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[CPTextButton textStyle](self, "textStyle"), @"kCPTextButtonStyleKey");
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CPTextButton;
  id v4 = [(CPTextButton *)&v10 description];
  v5 = [(CPTextButton *)self identifier];
  id v6 = CPSStringFromBOOL([(CPTextButton *)self isEnabled]);
  v7 = [(CPTextButton *)self title];
  uint64_t v8 = [v3 stringWithFormat:@"%@ {UUID: %@, enabled: %@, title: %@}", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v4 = [(CPTextButton *)self delegate];
    [v4 control:self setEnabled:self->_enabled];
  }
}

- (void)handlePrimaryAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(CPTextButton *)self handler];

  id v4 = CarPlayFrameworkGeneralLogging();
  uint64_t v5 = (uint64_t)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_2181A5000, (os_log_t)v5, OS_LOG_TYPE_INFO, "%@ will call action handler", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [(CPTextButton *)self handler];
    (*(void (**)(uint64_t, CPTextButton *))(v5 + 16))(v5, self);
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

- (void)setTitle:(NSString *)title
{
}

- (CPTextButtonStyle)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(CPTextButtonStyle)textStyle
{
  self->_textStyle = textStyle;
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

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end