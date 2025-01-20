@interface CPNowPlayingButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (CPControlDelegate)delegate;
- (CPNowPlayingButton)initWithCoder:(id)a3;
- (CPNowPlayingButton)initWithHandler:(void *)handler;
- (NSString)description;
- (NSUUID)identifier;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSelected:(BOOL)selected;
@end

@implementation CPNowPlayingButton

- (CPNowPlayingButton)initWithHandler:(void *)handler
{
  v4 = handler;
  v11.receiver = self;
  v11.super_class = (Class)CPNowPlayingButton;
  v5 = [(CPNowPlayingButton *)&v11 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x21D4648A0](v4);
    id v7 = v5->_handler;
    v5->_handler = (id)v6;

    v5->_enabled = 1;
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v8;

    v5->_selected = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPNowPlayingButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPNowPlayingButton *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPNowPlayingButtonIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"CPNowPlayingButtonEnabled"];
    v5->_selected = [v4 decodeBoolForKey:@"kCPNowPlayingButtonSelectedKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CPNowPlayingButton *)self identifier];
  [v5 encodeObject:v4 forKey:@"CPNowPlayingButtonIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CPNowPlayingButton isEnabled](self, "isEnabled"), @"CPNowPlayingButtonEnabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[CPNowPlayingButton isSelected](self, "isSelected"), @"kCPNowPlayingButtonSelectedKey");
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CPNowPlayingButton;
  id v4 = [(CPNowPlayingButton *)&v10 description];
  id v5 = [(CPNowPlayingButton *)self identifier];
  uint64_t v6 = CPSStringFromBOOL([(CPNowPlayingButton *)self isEnabled]);
  id v7 = CPSStringFromBOOL([(CPNowPlayingButton *)self isSelected]);
  uint64_t v8 = [v3 stringWithFormat:@"%@ {UUID: %@, enabled: %@, selected: %@}", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    id v4 = [(CPNowPlayingButton *)self delegate];
    [v4 control:self setEnabled:self->_enabled];
  }
}

- (void)setSelected:(BOOL)selected
{
  if (self->_selected != selected)
  {
    BOOL v3 = selected;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_selected = v3;
      id v5 = [(CPNowPlayingButton *)self delegate];
      [v5 control:self setSelected:v3];
    }
  }
}

- (void)handlePrimaryAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CPNowPlayingButton *)self handler];

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

    uint64_t v5 = [(CPNowPlayingButton *)self handler];
    (*(void (**)(uint64_t, CPNowPlayingButton *))(v5 + 16))(v5, self);
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

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isSelected
{
  return self->_selected;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end