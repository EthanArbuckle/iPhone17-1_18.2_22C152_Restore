@interface IMDSMSAttachmentPart
- (IMDSMSAttachmentPart)initWithContentLocation:(id)a3;
- (NSString)contentLocation;
@end

@implementation IMDSMSAttachmentPart

- (IMDSMSAttachmentPart)initWithContentLocation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDSMSAttachmentPart;
  v5 = [(IMDSMSAttachmentPart *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contentLocation = v5->_contentLocation;
    v5->_contentLocation = (NSString *)v6;
  }
  return v5;
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (void).cxx_destruct
{
}

@end