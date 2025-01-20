@interface VOTButtonInterceptor
- (BOOL)listensPassively;
- (void)setListensPassively:(BOOL)a3;
@end

@implementation VOTButtonInterceptor

- (BOOL)listensPassively
{
  return self->_listensPassively;
}

- (void)setListensPassively:(BOOL)a3
{
  self->_listensPassively = a3;
}

@end