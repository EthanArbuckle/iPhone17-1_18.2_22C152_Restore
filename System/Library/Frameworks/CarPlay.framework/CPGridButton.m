@interface CPGridButton
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGridButton:(id)a3;
- (CPControlDelegate)delegate;
- (CPGridButton)initWithCoder:(id)a3;
- (CPGridButton)initWithTitleVariants:(NSArray *)titleVariants image:(UIImage *)image handler:(void *)handler;
- (CPImageSet)imageSet;
- (NSArray)titleVariants;
- (NSString)description;
- (NSUUID)identifier;
- (UIImage)image;
- (id)_init;
- (id)handler;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageSet:(id)a3;
@end

@implementation CPGridButton

- (CPGridButton)initWithTitleVariants:(NSArray *)titleVariants image:(UIImage *)image handler:(void *)handler
{
  v9 = titleVariants;
  v10 = image;
  v11 = handler;
  v20.receiver = self;
  v20.super_class = (Class)CPGridButton;
  v12 = [(CPGridButton *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    v12->_enabled = 1;
    objc_storeStrong((id *)&v12->_titleVariants, titleVariants);
    v15 = [[CPImageSet alloc] initWithImage:v10 treatmentBlock:&__block_literal_global_18];
    imageSet = v12->_imageSet;
    v12->_imageSet = v15;

    uint64_t v17 = MEMORY[0x21D4648A0](v11);
    id v18 = v12->_handler;
    v12->_handler = (id)v17;
  }
  return v12;
}

id __52__CPGridButton_initWithTitleVariants_image_handler___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 40.0, 40.0);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CPGridButton;
  return [(CPGridButton *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CPGridButton *)self isEqualToGridButton:v4];

  return v5;
}

- (BOOL)isEqualToGridButton:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPGridButton *)self identifier];
  v6 = [v4 identifier];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_5;
  }
  int v8 = [(CPGridButton *)self isEnabled];
  if (v8 != [v4 isEnabled]) {
    goto LABEL_5;
  }
  v9 = [(CPGridButton *)self titleVariants];
  v10 = [v4 titleVariants];
  int v11 = [v9 isEqualToArray:v10];

  if (v11)
  {
    v12 = [(CPGridButton *)self imageSet];
    uint64_t v13 = [v4 imageSet];
    char v14 = [v12 isEqual:v13];
  }
  else
  {
LABEL_5:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  objc_super v3 = [(CPGridButton *)self identifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CPGridButton *)self titleVariants];
  uint64_t v6 = [v5 hash] ^ v4;
  int v7 = [(CPGridButton *)self imageSet];
  uint64_t v8 = v6 ^ [v7 hash];
  unint64_t v9 = v8 ^ [(CPGridButton *)self isEnabled];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPGridButton)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPGridButton *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPGridButtonIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v5->_enabled = [v4 decodeBoolForKey:@"CPGridButtonEnabled"];
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"CPGridButtonTitleVariants"];
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPGridButtonImageSet"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPGridButton *)self identifier];
  [v4 encodeObject:v5 forKey:@"CPGridButtonIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CPGridButton isEnabled](self, "isEnabled"), @"CPGridButtonEnabled");
  uint64_t v6 = [(CPGridButton *)self titleVariants];
  [v4 encodeObject:v6 forKey:@"CPGridButtonTitleVariants"];

  id v7 = [(CPGridButton *)self imageSet];
  [v4 encodeObject:v7 forKey:@"CPGridButtonImageSet"];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CPGridButton;
  id v4 = [(CPGridButton *)&v9 description];
  BOOL v5 = [(CPGridButton *)self identifier];
  uint64_t v6 = CPSStringFromBOOL([(CPGridButton *)self isEnabled]);
  id v7 = [v3 stringWithFormat:@"%@ {UUID: %@, enabled: %@}", v4, v5, v6];

  return (NSString *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    id v4 = [(CPGridButton *)self delegate];
    [v4 control:self setEnabled:self->_enabled];
  }
}

- (void)handlePrimaryAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = [(CPGridButton *)self handler];

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

    uint64_t v5 = [(CPGridButton *)self handler];
    (*(void (**)(uint64_t, CPGridButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [(CPMapButton *)(uint64_t)self handlePrimaryAction];
  }
}

- (UIImage)image
{
  v2 = [(CPGridButton *)self imageSet];
  objc_super v3 = [v2 image];

  return (UIImage *)v3;
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

- (NSArray)titleVariants
{
  return self->_titleVariants;
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
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end