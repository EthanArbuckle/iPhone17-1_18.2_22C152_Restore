@interface IMDSMSTextPart
- (IMDSMSTextPart)initWithContentLocation:(id)a3;
- (NSString)contentLocation;
- (NSString)text;
- (void)appendText:(id)a3;
@end

@implementation IMDSMSTextPart

- (IMDSMSTextPart)initWithContentLocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDSMSTextPart;
  v5 = [(IMDSMSTextPart *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = (NSString *)v6;
  }
  return v5;
}

- (void)appendText:(id)a3
{
  text = self->_text;
  if (text)
  {
    [(NSMutableString *)text appendString:a3];
  }
  else
  {
    self->_text = (NSMutableString *)[a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (NSString)text
{
  return &self->_text->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_contentLocation, 0);
}

@end