@interface BPSExpressSetupDetailItem
- (BPSExpressSetupDetailItem)init;
- (NSString)detail;
- (NSString)identifier;
- (NSString)status;
- (NSString)title;
- (UIImage)image;
- (void)setDetail:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BPSExpressSetupDetailItem

- (BPSExpressSetupDetailItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)BPSExpressSetupDetailItem;
  v2 = [(BPSExpressSetupDetailItem *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
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
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end