@interface CDPUIInfoViewModel
- (CDPEscapeOption)option1;
- (CDPEscapeOption)option2;
- (NSString)message;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMessage:(id)a3;
- (void)setOption1:(id)a3;
- (void)setOption2:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CDPUIInfoViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CDPUIInfoViewModel allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_message copy];
  message = v4->_message;
  v4->_message = (NSString *)v7;

  uint64_t v9 = [(CDPEscapeOption *)self->_option1 copy];
  option1 = v4->_option1;
  v4->_option1 = (CDPEscapeOption *)v9;

  uint64_t v11 = [(CDPEscapeOption *)self->_option2 copy];
  option2 = v4->_option2;
  v4->_option2 = (CDPEscapeOption *)v11;

  return v4;
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

- (CDPEscapeOption)option1
{
  return self->_option1;
}

- (void)setOption1:(id)a3
{
}

- (CDPEscapeOption)option2
{
  return self->_option2;
}

- (void)setOption2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_option2, 0);
  objc_storeStrong((id *)&self->_option1, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end