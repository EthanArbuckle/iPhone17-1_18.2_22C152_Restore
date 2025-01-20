@interface CPVoiceControlState
+ (BOOL)supportsSecureCoding;
- (BOOL)repeats;
- (CPVoiceControlState)initWithCoder:(id)a3;
- (CPVoiceControlState)initWithIdentifier:(NSString *)identifier titleVariants:(NSArray *)titleVariants image:(UIImage *)image repeats:(BOOL)repeats;
- (NSArray)titleVariants;
- (NSString)identifier;
- (UIImage)image;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPVoiceControlState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPVoiceControlState)initWithIdentifier:(NSString *)identifier titleVariants:(NSArray *)titleVariants image:(UIImage *)image repeats:(BOOL)repeats
{
  v11 = identifier;
  v12 = titleVariants;
  v13 = image;
  v27.receiver = self;
  v27.super_class = (Class)CPVoiceControlState;
  v14 = [(CPVoiceControlState *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, identifier);
    objc_storeStrong((id *)&v15->_titleVariants, titleVariants);
    v16 = [(UIImage *)v13 images];

    if (v16)
    {
      [(UIImage *)v13 duration];
      if (v17 < 0.3)
      {
        v18 = (void *)MEMORY[0x263F1C6B0];
        v19 = [(UIImage *)v13 images];
        v20 = v18;
        v21 = v19;
        double v22 = 0.3;
LABEL_7:
        uint64_t v25 = [v20 animatedImageWithImages:v21 duration:v22];

        v13 = (UIImage *)v25;
        goto LABEL_8;
      }
      [(UIImage *)v13 duration];
      if (v23 > 5.0)
      {
        v24 = (void *)MEMORY[0x263F1C6B0];
        v19 = [(UIImage *)v13 images];
        double v22 = 5.0;
        v20 = v24;
        v21 = v19;
        goto LABEL_7;
      }
    }
LABEL_8:
    objc_storeStrong((id *)&v15->_image, v13);
    v15->_repeats = repeats;
  }

  return v15;
}

- (CPVoiceControlState)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPVoiceControlState;
  v5 = [(CPVoiceControlState *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPVoiceControlIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kCPVoiceControlTitlesKey"];
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPVoiceControlAnimatedImageKey"];
    image = v5->_image;
    v5->_image = (UIImage *)v13;

    v5->_repeats = [v4 decodeBoolForKey:@"kCPVoiceControlStateImageRepeatsKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CPVoiceControlState *)self identifier];
  [v7 encodeObject:v4 forKey:@"kCPVoiceControlIdentifierKey"];

  v5 = [(CPVoiceControlState *)self titleVariants];
  [v7 encodeObject:v5 forKey:@"kCPVoiceControlTitlesKey"];

  uint64_t v6 = [(CPVoiceControlState *)self image];
  [v7 encodeObject:v6 forKey:@"kCPVoiceControlAnimatedImageKey"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CPVoiceControlState repeats](self, "repeats"), @"kCPVoiceControlStateImageRepeatsKey");
}

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_titleVariants, 0);
}

@end