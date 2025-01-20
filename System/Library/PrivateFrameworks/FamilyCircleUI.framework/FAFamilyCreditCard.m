@interface FAFamilyCreditCard
- (NSString)details;
- (NSString)footer;
- (NSString)providerDescription;
- (NSString)type;
- (NSString)usageNotice;
- (NSURL)imageURL;
- (UIImage)image;
- (void)setDetails:(id)a3;
- (void)setFooter:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setProviderDescription:(id)a3;
- (void)setType:(id)a3;
- (void)setUsageNotice:(id)a3;
@end

@implementation FAFamilyCreditCard

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)providerDescription
{
  return self->_providerDescription;
}

- (void)setProviderDescription:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)usageNotice
{
  return self->_usageNotice;
}

- (void)setUsageNotice:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_usageNotice, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_providerDescription, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end