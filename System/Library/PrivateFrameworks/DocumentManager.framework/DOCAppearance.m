@interface DOCAppearance
+ (BOOL)supportsSecureCoding;
+ (DOCAppearance)documentsPickerAppearance;
+ (DOCAppearance)recentsPopoverAppearance;
- (BOOL)forceClearBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowFileExtensions;
- (BOOL)showsCreateButton;
- (DOCAppearance)init;
- (DOCAppearance)initWithCoder:(id)a3;
- (NSString)collectionCreateButtonTitle;
- (UIColor)backgroundColor;
- (double)compactHorizontalTableStackSpacing;
- (double)defaultDocumentAspectRatio;
- (double)fullHorizontalTableStackSpacing;
- (double)regularHorizontalTableStackSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)browserUserInterfaceStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setBrowserUserInterfaceStyle:(unint64_t)a3;
- (void)setCollectionCreateButtonTitle:(id)a3;
- (void)setCompactHorizontalTableStackSpacing:(double)a3;
- (void)setDefaultDocumentAspectRatio:(double)a3;
- (void)setForceClearBackground:(BOOL)a3;
- (void)setFullHorizontalTableStackSpacing:(double)a3;
- (void)setRegularHorizontalTableStackSpacing:(double)a3;
- (void)setShouldShowFileExtensions:(BOOL)a3;
- (void)setShowsCreateButton:(BOOL)a3;
@end

@implementation DOCAppearance

- (void).cxx_destruct
{
}

- (UIColor)backgroundColor
{
  if ([(DOCAppearance *)self forceClearBackground])
  {
    v3 = [MEMORY[0x263F825C8] clearColor];
    goto LABEL_8;
  }
  v3 = [(DOCAppearance *)self browserUserInterfaceStyle];
  if (v3 == (void *)2)
  {
LABEL_6:
    v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
    goto LABEL_8;
  }
  if (v3 != (void *)1)
  {
    if (v3) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v3 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_11];
LABEL_8:
  return (UIColor *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[DOCAppearance allocWithZone:a3] init];
  if (v4)
  {
    [(DOCAppearance *)v4 setShowsCreateButton:[(DOCAppearance *)self showsCreateButton]];
    [(DOCAppearance *)v4 setShouldShowFileExtensions:[(DOCAppearance *)self shouldShowFileExtensions]];
    [(DOCAppearance *)self compactHorizontalTableStackSpacing];
    -[DOCAppearance setCompactHorizontalTableStackSpacing:](v4, "setCompactHorizontalTableStackSpacing:");
    [(DOCAppearance *)self regularHorizontalTableStackSpacing];
    -[DOCAppearance setRegularHorizontalTableStackSpacing:](v4, "setRegularHorizontalTableStackSpacing:");
    [(DOCAppearance *)self fullHorizontalTableStackSpacing];
    -[DOCAppearance setFullHorizontalTableStackSpacing:](v4, "setFullHorizontalTableStackSpacing:");
    [(DOCAppearance *)self defaultDocumentAspectRatio];
    -[DOCAppearance setDefaultDocumentAspectRatio:](v4, "setDefaultDocumentAspectRatio:");
    uint64_t v5 = [(NSString *)self->_collectionCreateButtonTitle copy];
    collectionCreateButtonTitle = v4->_collectionCreateButtonTitle;
    v4->_collectionCreateButtonTitle = (NSString *)v5;

    [(DOCAppearance *)v4 setBrowserUserInterfaceStyle:[(DOCAppearance *)self browserUserInterfaceStyle]];
    [(DOCAppearance *)v4 setForceClearBackground:[(DOCAppearance *)self forceClearBackground]];
  }
  return v4;
}

- (BOOL)shouldShowFileExtensions
{
  return self->_shouldShowFileExtensions;
}

- (void)setShowsCreateButton:(BOOL)a3
{
  self->_showsCreateButton = a3;
}

- (DOCAppearance)init
{
  v8.receiver = self;
  v8.super_class = (Class)DOCAppearance;
  v2 = [(DOCAppearance *)&v8 init];
  v3 = (double *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = xmmword_213653330;
    BOOL v4 = DOCScreenSizePad12_9();
    double v5 = 40.0;
    if (!v4) {
      double v5 = 30.0;
    }
    v3[5] = v5;
    *((unsigned char *)v3 + 18) = 0;
    *((_WORD *)v3 + 8) = 0;
    v3[6] = 0.0;
    v3[7] = 0.75;
    v6 = v3;
  }

  return (DOCAppearance *)v3;
}

- (BOOL)forceClearBackground
{
  return self->_forceClearBackground;
}

- (unint64_t)browserUserInterfaceStyle
{
  return self->_browserUserInterfaceStyle;
}

- (BOOL)showsCreateButton
{
  return self->_showsCreateButton;
}

- (void)setShouldShowFileExtensions:(BOOL)a3
{
  self->_shouldShowFileExtensions = a3;
}

- (void)setRegularHorizontalTableStackSpacing:(double)a3
{
  self->_regularHorizontalTableStackSpacing = a3;
}

- (void)setFullHorizontalTableStackSpacing:(double)a3
{
  self->_fullHorizontalTableStackSpacing = a3;
}

- (void)setForceClearBackground:(BOOL)a3
{
  self->_forceClearBackground = a3;
}

- (void)setDefaultDocumentAspectRatio:(double)a3
{
  self->_defaultDocumentAspectRatio = a3;
}

- (void)setCompactHorizontalTableStackSpacing:(double)a3
{
  self->_compactHorizontalTableStackSpacing = a3;
}

- (void)setBrowserUserInterfaceStyle:(unint64_t)a3
{
  self->_browserUserInterfaceStyle = a3;
}

- (double)regularHorizontalTableStackSpacing
{
  return self->_regularHorizontalTableStackSpacing;
}

- (double)fullHorizontalTableStackSpacing
{
  return self->_fullHorizontalTableStackSpacing;
}

- (double)defaultDocumentAspectRatio
{
  return self->_defaultDocumentAspectRatio;
}

- (double)compactHorizontalTableStackSpacing
{
  return self->_compactHorizontalTableStackSpacing;
}

- (NSString)collectionCreateButtonTitle
{
  collectionCreateButtonTitle = self->_collectionCreateButtonTitle;
  if (!collectionCreateButtonTitle)
  {
    BOOL v4 = _DocumentManagerBundle();
    double v5 = [v4 localizedStringForKey:@"Create Document" value:@"Create Document" table:@"Localizable"];
    v6 = self->_collectionCreateButtonTitle;
    self->_collectionCreateButtonTitle = v5;

    collectionCreateButtonTitle = self->_collectionCreateButtonTitle;
  }
  return collectionCreateButtonTitle;
}

- (void)setCollectionCreateButtonTitle:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  collectionCreateButtonTitle = self->_collectionCreateButtonTitle;
  self->_collectionCreateButtonTitle = v4;
  MEMORY[0x270F9A758](v4, collectionCreateButtonTitle);
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (DOCAppearance *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class()) {
      goto LABEL_3;
    }
    [(DOCAppearance *)self defaultDocumentAspectRatio];
    double v9 = v8;
    [(DOCAppearance *)v4 defaultDocumentAspectRatio];
    if (v9 != v10) {
      goto LABEL_3;
    }
    [(DOCAppearance *)self compactHorizontalTableStackSpacing];
    double v12 = v11;
    [(DOCAppearance *)v4 compactHorizontalTableStackSpacing];
    if (v12 != v13) {
      goto LABEL_3;
    }
    [(DOCAppearance *)self regularHorizontalTableStackSpacing];
    double v15 = v14;
    [(DOCAppearance *)v4 regularHorizontalTableStackSpacing];
    if (v15 != v16) {
      goto LABEL_3;
    }
    [(DOCAppearance *)self fullHorizontalTableStackSpacing];
    double v18 = v17;
    [(DOCAppearance *)v4 fullHorizontalTableStackSpacing];
    if (v18 == v19
      && (BOOL v20 = [(DOCAppearance *)self showsCreateButton],
          v20 == [(DOCAppearance *)v4 showsCreateButton])
      && (BOOL v21 = [(DOCAppearance *)self shouldShowFileExtensions],
          v21 == [(DOCAppearance *)v4 shouldShowFileExtensions])
      && (BOOL v22 = [(DOCAppearance *)self forceClearBackground],
          v22 == [(DOCAppearance *)v4 forceClearBackground])
      && (unint64_t v23 = [(DOCAppearance *)self browserUserInterfaceStyle],
          v23 == [(DOCAppearance *)v4 browserUserInterfaceStyle]))
    {
      v24 = [(DOCAppearance *)self collectionCreateButtonTitle];
      v25 = [(DOCAppearance *)v4 collectionCreateButtonTitle];
      if (v24 == v25)
      {
        char v6 = 1;
      }
      else
      {
        v26 = [(DOCAppearance *)self collectionCreateButtonTitle];
        v27 = [(DOCAppearance *)v4 collectionCreateButtonTitle];
        char v6 = [v26 isEqual:v27];
      }
    }
    else
    {
LABEL_3:
      char v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DOCAppearance;
  uint64_t v5 = [(DOCAppearance *)&v13 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"defaultDocumentAspectRatio"];
    [(DOCAppearance *)v5 setDefaultDocumentAspectRatio:v6];
    [v4 decodeFloatForKey:@"regularHorizontalTableStackSpacing"];
    [(DOCAppearance *)v5 setRegularHorizontalTableStackSpacing:v7];
    [v4 decodeFloatForKey:@"fullHorizontalTableStackSpacing"];
    [(DOCAppearance *)v5 setFullHorizontalTableStackSpacing:v8];
    [v4 decodeFloatForKey:@"compactHorizontalTableStackSpacing"];
    [(DOCAppearance *)v5 setCompactHorizontalTableStackSpacing:v9];
    -[DOCAppearance setShowsCreateButton:](v5, "setShowsCreateButton:", [v4 decodeBoolForKey:@"showsCreateButton"]);
    -[DOCAppearance setShouldShowFileExtensions:](v5, "setShouldShowFileExtensions:", [v4 decodeBoolForKey:@"shouldShowFileExtensions"]);
    -[DOCAppearance setForceClearBackground:](v5, "setForceClearBackground:", [v4 decodeBoolForKey:@"forceClearBackground"]);
    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionCreateButtonTitle"];
    [(DOCAppearance *)v5 setCollectionCreateButtonTitle:v10];

    -[DOCAppearance setBrowserUserInterfaceStyle:](v5, "setBrowserUserInterfaceStyle:", [v4 decodeIntegerForKey:@"browserUserInterfaceStyle"]);
    double v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(DOCAppearance *)self defaultDocumentAspectRatio];
  *(float *)&double v5 = v5;
  [v4 encodeFloat:@"defaultDocumentAspectRatio" forKey:v5];
  [(DOCAppearance *)self compactHorizontalTableStackSpacing];
  *(float *)&double v6 = v6;
  [v4 encodeFloat:@"compactHorizontalTableStackSpacing" forKey:v6];
  [(DOCAppearance *)self regularHorizontalTableStackSpacing];
  *(float *)&double v7 = v7;
  [v4 encodeFloat:@"regularHorizontalTableStackSpacing" forKey:v7];
  [(DOCAppearance *)self fullHorizontalTableStackSpacing];
  *(float *)&double v8 = v8;
  [v4 encodeFloat:@"fullHorizontalTableStackSpacing" forKey:v8];
  objc_msgSend(v4, "encodeInteger:forKey:", -[DOCAppearance browserUserInterfaceStyle](self, "browserUserInterfaceStyle"), @"browserUserInterfaceStyle");
  objc_msgSend(v4, "encodeBool:forKey:", -[DOCAppearance showsCreateButton](self, "showsCreateButton"), @"showsCreateButton");
  objc_msgSend(v4, "encodeBool:forKey:", -[DOCAppearance shouldShowFileExtensions](self, "shouldShowFileExtensions"), @"shouldShowFileExtensions");
  objc_msgSend(v4, "encodeBool:forKey:", -[DOCAppearance forceClearBackground](self, "forceClearBackground"), @"forceClearBackground");
  id v9 = [(DOCAppearance *)self collectionCreateButtonTitle];
  [v4 encodeObject:v9 forKey:@"collectionCreateButtonTitle"];
}

+ (DOCAppearance)documentsPickerAppearance
{
  v2 = objc_opt_new();
  return (DOCAppearance *)v2;
}

+ (DOCAppearance)recentsPopoverAppearance
{
  v2 = objc_opt_new();
  [v2 setForceClearBackground:1];
  [v2 setShowsCreateButton:0];
  return (DOCAppearance *)v2;
}

id __52__DOCAppearance_UserInterfaceStyle__backgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  return v2;
}

@end