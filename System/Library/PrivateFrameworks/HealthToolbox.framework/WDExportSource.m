@interface WDExportSource
- (NSString)subject;
- (NSURL)url;
- (void)setSubject:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation WDExportSource

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end