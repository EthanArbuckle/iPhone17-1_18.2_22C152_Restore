@interface MFComposeAttachmentInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isBasicImage;
- (BOOL)isDisplayableImage;
- (MFComposeAttachmentInfo)initWithCoder:(id)a3;
- (MFComposeAttachmentInfo)initWithURL:(id)a3 filename:(id)a4 isBasicImage:(BOOL)a5 isDisplayableImage:(BOOL)a6 className:(id)a7;
- (NSString)className;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFComposeAttachmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFComposeAttachmentInfo)initWithURL:(id)a3 filename:(id)a4 isBasicImage:(BOOL)a5 isDisplayableImage:(BOOL)a6 className:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MFComposeAttachmentInfo;
  v15 = [(MSAttachmentInfo *)&v20 initWithURL:v12 filename:v13];
  v16 = v15;
  if (v15)
  {
    v15->_isBasicImage = a5;
    v15->_isDisplayableImage = a6;
    uint64_t v17 = [v14 copy];
    className = v16->_className;
    v16->_className = (NSString *)v17;
  }
  return v16;
}

- (MFComposeAttachmentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeAttachmentInfo;
  v5 = [(MSAttachmentInfo *)&v10 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    goto LABEL_5;
  }
  v5->_isBasicImage = [v4 decodeBoolForKey:@"IsBasicImage"];
  v5->_isDisplayableImage = [v4 decodeBoolForKey:@"IsDisplayableImage"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClassName"];
  className = v5->_className;
  v5->_className = (NSString *)v6;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
LABEL_4:
  }
    v8 = v5;
  else {
LABEL_5:
  }
    v8 = 0;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeAttachmentInfo;
  [(MSAttachmentInfo *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_isBasicImage forKey:@"IsBasicImage"];
  [v4 encodeBool:self->_isDisplayableImage forKey:@"IsDisplayableImage"];
  [v4 encodeObject:self->_className forKey:@"ClassName"];
}

- (BOOL)isBasicImage
{
  return self->_isBasicImage;
}

- (BOOL)isDisplayableImage
{
  return self->_isDisplayableImage;
}

- (NSString)className
{
  return self->_className;
}

- (void).cxx_destruct
{
}

@end