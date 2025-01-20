@interface CDPUIPiggybackingViewModel
- (CDPEscapeOption)sendCodeOption;
- (CDPRemoteValidationEscapeOffer)cantGetToDeviceOption;
- (NSString)footer;
- (NSString)iconName;
- (NSString)message;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCantGetToDeviceOption:(id)a3;
- (void)setFooter:(id)a3;
- (void)setIconName:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSendCodeOption:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CDPUIPiggybackingViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CDPUIPiggybackingViewModel allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_iconName copy];
  iconName = v4->_iconName;
  v4->_iconName = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_message copy];
  message = v4->_message;
  v4->_message = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_footer copy];
  footer = v4->_footer;
  v4->_footer = (NSString *)v11;

  uint64_t v13 = [(CDPEscapeOption *)self->_sendCodeOption copy];
  sendCodeOption = v4->_sendCodeOption;
  v4->_sendCodeOption = (CDPEscapeOption *)v13;

  uint64_t v15 = [(CDPRemoteValidationEscapeOffer *)self->_cantGetToDeviceOption copy];
  cantGetToDeviceOption = v4->_cantGetToDeviceOption;
  v4->_cantGetToDeviceOption = (CDPRemoteValidationEscapeOffer *)v15;

  return v4;
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (CDPEscapeOption)sendCodeOption
{
  return self->_sendCodeOption;
}

- (void)setSendCodeOption:(id)a3
{
}

- (CDPRemoteValidationEscapeOffer)cantGetToDeviceOption
{
  return self->_cantGetToDeviceOption;
}

- (void)setCantGetToDeviceOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cantGetToDeviceOption, 0);
  objc_storeStrong((id *)&self->_sendCodeOption, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_iconName, 0);
}

@end