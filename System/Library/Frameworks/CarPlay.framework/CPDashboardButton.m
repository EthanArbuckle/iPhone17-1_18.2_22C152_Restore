@interface CPDashboardButton
+ (BOOL)supportsSecureCoding;
- (CPControlDelegate)delegate;
- (CPDashboardButton)initWithCoder:(id)a3;
- (CPDashboardButton)initWithTitleVariants:(NSArray *)titleVariants subtitleVariants:(NSArray *)subtitleVariants image:(UIImage *)image handler:(void *)handler;
- (CPImageSet)imageSet;
- (NSArray)subtitleVariants;
- (NSArray)titleVariants;
- (NSString)description;
- (NSUUID)identifier;
- (UIImage)image;
- (id)_init;
- (id)handler;
- (void)encodeWithCoder:(id)a3;
- (void)handlePrimaryAction;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageSet:(id)a3;
@end

@implementation CPDashboardButton

- (CPDashboardButton)initWithTitleVariants:(NSArray *)titleVariants subtitleVariants:(NSArray *)subtitleVariants image:(UIImage *)image handler:(void *)handler
{
  v10 = titleVariants;
  v11 = subtitleVariants;
  v12 = image;
  v13 = handler;
  v27.receiver = self;
  v27.super_class = (Class)CPDashboardButton;
  v14 = [(CPDashboardButton *)&v27 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    uint64_t v17 = [(NSArray *)v10 copy];
    v18 = v14->_titleVariants;
    v14->_titleVariants = (NSArray *)v17;

    v19 = [(NSArray *)v11 bs_compactMap:&__block_literal_global_22];
    uint64_t v20 = [v19 copy];
    v21 = v14->_subtitleVariants;
    v14->_subtitleVariants = (NSArray *)v20;

    v22 = [[CPImageSet alloc] initWithImage:v12];
    imageSet = v14->_imageSet;
    v14->_imageSet = v22;

    uint64_t v24 = MEMORY[0x21D4648A0](v13);
    id v25 = v14->_handler;
    v14->_handler = (id)v24;
  }
  return v14;
}

id __74__CPDashboardButton_initWithTitleVariants_subtitleVariants_image_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CPDashboardButton;
  return [(CPDashboardButton *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPDashboardButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPDashboardButton *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPDashboardButtonIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kCPDashboardButtonTitlesKey"];
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"kCPDashboardButtonSubtitlesKey"];
    subtitleVariants = v5->_subtitleVariants;
    v5->_subtitleVariants = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPDashboardButtonImageSetKey"];
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPDashboardButton *)self identifier];
  [v4 encodeObject:v5 forKey:@"kCPDashboardButtonIdentifierKey"];

  uint64_t v6 = [(CPDashboardButton *)self titleVariants];
  [v4 encodeObject:v6 forKey:@"kCPDashboardButtonTitlesKey"];

  v7 = [(CPDashboardButton *)self subtitleVariants];
  [v4 encodeObject:v7 forKey:@"kCPDashboardButtonSubtitlesKey"];

  id v8 = [(CPDashboardButton *)self imageSet];
  [v4 encodeObject:v8 forKey:@"kCPDashboardButtonImageSetKey"];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPDashboardButton;
  id v4 = [(CPDashboardButton *)&v8 description];
  v5 = [(CPDashboardButton *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@ {UUID: %@}", v4, v5];

  return (NSString *)v6;
}

- (void)handlePrimaryAction
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = [(CPDashboardButton *)self handler];

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

    uint64_t v5 = [(CPDashboardButton *)self handler];
    (*(void (**)(uint64_t, CPDashboardButton *))(v5 + 16))(v5, self);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    [(CPMapButton *)(uint64_t)self handlePrimaryAction];
  }
}

- (UIImage)image
{
  id v2 = [(CPDashboardButton *)self imageSet];
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

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (NSArray)subtitleVariants
{
  return self->_subtitleVariants;
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
  objc_storeStrong((id *)&self->_subtitleVariants, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end