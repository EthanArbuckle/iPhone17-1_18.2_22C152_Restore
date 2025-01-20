@interface CPSLearnMoreRequest
+ (BOOL)supportsSecureCoding;
- (CPSLearnMoreRequest)initWithCoder:(id)a3;
- (NSString)subtitleText;
- (NSString)titleText;
- (NSURL)URL;
- (UIImage)image;
- (int64_t)authType;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CPSLearnMoreRequest

- (int64_t)authType
{
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSLearnMoreRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, @"URL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_image forKey:@"image"];
  [v4 encodeObject:self->_titleText forKey:@"titleText"];
  [v4 encodeObject:self->_subtitleText forKey:@"subtitleText"];
}

- (CPSLearnMoreRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CPSLearnMoreRequest;
  objc_super v5 = [(CPSAuthenticationRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v7;

    getUIImageClass();
    v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"image"];
    image = v5->_image;
    v5->_image = (UIImage *)v10;

    v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"titleText"];
    titleText = v5->_titleText;
    v5->_titleText = (NSString *)v13;

    v15 = self;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"subtitleText"];
    subtitleText = v5->_subtitleText;
    v5->_subtitleText = (NSString *)v16;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end