@interface AVMobileImageConfiguration
- (AVMobileImageConfiguration)initWithImageName:(id)a3 font:(id)a4 imageContainedInBundle:(BOOL)a5;
- (AVMobileImageConfiguration)initWithString:(id)a3 font:(id)a4;
- (BOOL)imageContainedInBundle;
- (BOOL)isEqual:(id)a3;
- (NSString)string;
- (UIFont)font;
- (id)imageName;
- (unint64_t)hash;
@end

@implementation AVMobileImageConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

- (BOOL)imageContainedInBundle
{
  return self->_imageContainedInBundle;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)string
{
  return self->_string;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_string hash];
  return [(UIFont *)self->_font hash] ^ v3 ^ self->_imageContainedInBundle;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVMobileImageConfiguration;
  unsigned __int8 v5 = [(AVMobileImageConfiguration *)&v8 isEqual:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v4;
    unsigned __int8 v5 = [(NSString *)self->_string isEqualToString:v6[2]]
      && [(UIFont *)self->_font isEqual:v6[3]]
      && self->_imageContainedInBundle == *((unsigned __int8 *)v6 + 8);
  }
  return v5;
}

- (id)imageName
{
  return self->_string;
}

- (AVMobileImageConfiguration)initWithImageName:(id)a3 font:(id)a4 imageContainedInBundle:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVMobileImageConfiguration;
  v10 = [(AVMobileImageConfiguration *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    string = v10->_string;
    v10->_string = (NSString *)v11;

    objc_storeStrong((id *)&v10->_font, a4);
    v10->_imageContainedInBundle = a5;
  }

  return v10;
}

- (AVMobileImageConfiguration)initWithString:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVMobileImageConfiguration;
  id v8 = [(AVMobileImageConfiguration *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    objc_storeStrong((id *)&v8->_font, a4);
    v8->_imageContainedInBundle = 0;
  }

  return v8;
}

@end