@interface CDLabelProvider
+ (BOOL)supportsSecureCoding;
- (CDLabelProvider)initWithCoder:(id)a3;
- (CDLabelProvider)initWithTextProvider:(id)a3 imageProvider:(id)a4;
- (CLKImageProvider)imageProvider;
- (CLKTextProvider)textProvider;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDLabelProvider

- (CDLabelProvider)initWithTextProvider:(id)a3 imageProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDLabelProvider;
  v9 = [(CDLabelProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textProvider, a3);
    objc_storeStrong((id *)&v10->_imageProvider, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  textProvider = self->_textProvider;
  id v5 = a3;
  [v5 encodeObject:textProvider forKey:@"textProvider"];
  [v5 encodeObject:self->_imageProvider forKey:@"imageProvider"];
}

- (CDLabelProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDLabelProvider;
  id v5 = [(CDLabelProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textProvider"];
    textProvider = v5->_textProvider;
    v5->_textProvider = (CLKTextProvider *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageProvider"];
    imageProvider = v5->_imageProvider;
    v5->_imageProvider = (CLKImageProvider *)v8;
  }
  return v5;
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end