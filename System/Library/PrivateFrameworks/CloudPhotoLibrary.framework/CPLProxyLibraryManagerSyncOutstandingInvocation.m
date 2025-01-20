@interface CPLProxyLibraryManagerSyncOutstandingInvocation
- (BOOL)didFinish;
- (NSDictionary)errors;
- (id)description;
- (void)setDidFinish:(BOOL)a3;
- (void)setErrors:(id)a3;
@end

@implementation CPLProxyLibraryManagerSyncOutstandingInvocation

- (id)description
{
  if (self->_didFinish) {
    v2 = " didFinish";
  }
  else {
    v2 = "";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[outsanding%s]", v2);
}

- (NSDictionary)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (void).cxx_destruct
{
}

@end