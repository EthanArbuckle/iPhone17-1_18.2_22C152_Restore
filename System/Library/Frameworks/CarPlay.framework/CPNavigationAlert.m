@interface CPNavigationAlert
+ (BOOL)supportsSecureCoding;
- (CPAlertAction)primaryAction;
- (CPAlertAction)secondaryAction;
- (CPImageSet)imageSet;
- (CPNavigationAlert)initWithCoder:(id)a3;
- (CPNavigationAlert)initWithTitleVariants:(NSArray *)titleVariants subtitleVariants:(NSArray *)subtitleVariants image:(UIImage *)image primaryAction:(CPAlertAction *)primaryAction secondaryAction:(CPAlertAction *)secondaryAction duration:(NSTimeInterval)duration;
- (CPNavigationAlertUpdating)navigationAlertUpdateTarget;
- (NSArray)subtitleVariants;
- (NSArray)titleVariants;
- (NSTimeInterval)duration;
- (NSUUID)identifier;
- (UIImage)image;
- (id)_initWithTitleVariants:(id)a3 subtitleVariants:(id)a4 imageSet:(id)a5 primaryAction:(id)a6 secondaryAction:(id)a7 duration:(double)a8;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNavigationAlertUpdateTarget:(id)a3;
- (void)updateTitleVariants:(NSArray *)newTitleVariants subtitleVariants:(NSArray *)newSubtitleVariants;
@end

@implementation CPNavigationAlert

- (id)_initWithTitleVariants:(id)a3 subtitleVariants:(id)a4 imageSet:(id)a5 primaryAction:(id)a6 secondaryAction:(id)a7 duration:(double)a8
{
  id v36 = a3;
  id v34 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17)
  {
    uint64_t v19 = objc_opt_class();
    CPAssertAllowedClass(v17, v19, a2);
  }
  if (v18)
  {
    uint64_t v20 = objc_opt_class();
    CPAssertAllowedClass(v18, v20, a2);
  }
  v37.receiver = self;
  v37.super_class = (Class)CPNavigationAlert;
  v21 = [(CPNavigationAlert *)&v37 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_titleVariants, a3);
    objc_storeStrong((id *)&v22->_subtitleVariants, a4);
    v23 = (objc_class *)objc_opt_class();
    v24 = (CPImageSet *)v16;
    v25 = [(CPImageSet *)v24 lightContentImage];
    v26 = CPSanitizeImage(v25, v23);
    [(CPImageSet *)v24 setLightContentImage:v26];

    v27 = [(CPImageSet *)v24 darkContentImage];
    v28 = CPSanitizeImage(v27, v23);
    [(CPImageSet *)v24 setDarkContentImage:v28];

    imageSet = v22->_imageSet;
    v22->_imageSet = v24;

    objc_storeStrong((id *)&v22->_primaryAction, a6);
    objc_storeStrong((id *)&v22->_secondaryAction, a7);
    double v30 = fmax(a8, 5.0);
    if (a8 <= 0.0) {
      double v30 = 0.0;
    }
    v22->_duration = v30;
    uint64_t v31 = [MEMORY[0x263F08C38] UUID];
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v31;
  }
  return v22;
}

- (CPNavigationAlert)initWithTitleVariants:(NSArray *)titleVariants subtitleVariants:(NSArray *)subtitleVariants image:(UIImage *)image primaryAction:(CPAlertAction *)primaryAction secondaryAction:(CPAlertAction *)secondaryAction duration:(NSTimeInterval)duration
{
  v14 = titleVariants;
  v15 = subtitleVariants;
  id v16 = primaryAction;
  id v17 = secondaryAction;
  if (image)
  {
    id v18 = image;
    uint64_t v19 = [CPImageSet alloc];
    uint64_t v20 = CPImageByScalingImageToSize(v18, 24.0, 24.0);

    image = [(CPImageSet *)v19 initWithImage:v20];
  }
  v21 = [(CPNavigationAlert *)self _initWithTitleVariants:v14 subtitleVariants:v15 imageSet:image primaryAction:v16 secondaryAction:v17 duration:duration];

  return v21;
}

- (void)updateTitleVariants:(NSArray *)newTitleVariants subtitleVariants:(NSArray *)newSubtitleVariants
{
  v11 = newTitleVariants;
  v7 = newSubtitleVariants;
  objc_storeStrong((id *)&self->_titleVariants, newTitleVariants);
  subtitleVariants = self->_subtitleVariants;
  self->_subtitleVariants = v7;

  v9 = [(CPNavigationAlert *)self navigationAlertUpdateTarget];

  if (v9)
  {
    v10 = [(CPNavigationAlert *)self navigationAlertUpdateTarget];
    [v10 _updateNavigationAlert:self];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPNavigationAlert *)self titleVariants];
  [v4 encodeObject:v5 forKey:@"kCPNavigationAlertTitlesKey"];

  v6 = [(CPNavigationAlert *)self subtitleVariants];
  [v4 encodeObject:v6 forKey:@"kCPNavigationAlertSubtitlesKey"];

  v7 = [(CPNavigationAlert *)self imageSet];
  [v4 encodeObject:v7 forKey:@"kCPNavigationAlertImageKey"];

  v8 = [(CPNavigationAlert *)self primaryAction];
  [v4 encodeObject:v8 forKey:@"kCPNavitationAlertPrimaryKey"];

  v9 = [(CPNavigationAlert *)self secondaryAction];
  [v4 encodeObject:v9 forKey:@"kCPNavigationAlertSecondaryKey"];

  [(CPNavigationAlert *)self duration];
  *(float *)&double v10 = v10;
  [v4 encodeFloat:@"kCPNavigationAlertDurationKey" forKey:v10];
  id v11 = [(CPNavigationAlert *)self identifier];
  [v4 encodeObject:v11 forKey:@"kCPNavigationAlertIdentifierKey"];
}

- (CPNavigationAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CPNavigationAlert;
  v5 = [(CPNavigationAlert *)&v32 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPNavigationAlertTitlesKey"];
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kCPNavigationAlertSubtitlesKey"];
    subtitleVariants = v5->_subtitleVariants;
    v5->_subtitleVariants = (NSArray *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPNavigationAlertImageKey"];
    id v17 = (objc_class *)objc_opt_class();
    id v18 = v16;
    uint64_t v19 = [(CPImageSet *)v18 lightContentImage];
    uint64_t v20 = CPSanitizeImage(v19, v17);
    [(CPImageSet *)v18 setLightContentImage:v20];

    v21 = [(CPImageSet *)v18 darkContentImage];
    v22 = CPSanitizeImage(v21, v17);
    [(CPImageSet *)v18 setDarkContentImage:v22];

    imageSet = v5->_imageSet;
    v5->_imageSet = v18;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPNavitationAlertPrimaryKey"];
    primaryAction = v5->_primaryAction;
    v5->_primaryAction = (CPAlertAction *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPNavigationAlertSecondaryKey"];
    secondaryAction = v5->_secondaryAction;
    v5->_secondaryAction = (CPAlertAction *)v26;

    [v4 decodeFloatForKey:@"kCPNavigationAlertDurationKey"];
    v5->_duration = v28;
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPNavigationAlertIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v29;
  }
  return v5;
}

- (UIImage)image
{
  v2 = [(CPNavigationAlert *)self imageSet];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)CPNavigationAlert;
  id v4 = [(CPNavigationAlert *)&v12 description];
  v5 = [(CPNavigationAlert *)self identifier];
  [(CPNavigationAlert *)self duration];
  uint64_t v7 = v6;
  v8 = [(CPNavigationAlert *)self titleVariants];
  uint64_t v9 = [(CPNavigationAlert *)self subtitleVariants];
  double v10 = [v3 stringWithFormat:@"%@ {UUID: %@, duration: %f, title variants: %@, subtitle variants, %@}", v4, v5, v7, v8, v9];

  return v10;
}

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (NSArray)subtitleVariants
{
  return self->_subtitleVariants;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (CPAlertAction)primaryAction
{
  return self->_primaryAction;
}

- (CPAlertAction)secondaryAction
{
  return self->_secondaryAction;
}

- (NSTimeInterval)duration
{
  return self->_duration;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CPNavigationAlertUpdating)navigationAlertUpdateTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationAlertUpdateTarget);

  return (CPNavigationAlertUpdating *)WeakRetained;
}

- (void)setNavigationAlertUpdateTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationAlertUpdateTarget);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_imageSet, 0);
  objc_storeStrong((id *)&self->_subtitleVariants, 0);

  objc_storeStrong((id *)&self->_titleVariants, 0);
}

@end