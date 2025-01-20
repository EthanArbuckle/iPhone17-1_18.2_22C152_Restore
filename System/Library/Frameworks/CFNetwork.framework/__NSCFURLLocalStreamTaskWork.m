@interface __NSCFURLLocalStreamTaskWork
- (id)description;
@end

@implementation __NSCFURLLocalStreamTaskWork

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<__NSCFURLLocalStreamTaskWork %p <%s>>", self, self->_static_description);
}

@end