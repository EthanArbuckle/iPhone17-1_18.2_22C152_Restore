@interface GCNotificationOptions
- (NSString)body;
- (NSString)categoryID;
- (NSString)threadID;
- (NSString)title;
- (NSURL)defaultActionURL;
- (void)setBody:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setDefaultActionURL:(id)a3;
- (void)setThreadID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GCNotificationOptions

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end