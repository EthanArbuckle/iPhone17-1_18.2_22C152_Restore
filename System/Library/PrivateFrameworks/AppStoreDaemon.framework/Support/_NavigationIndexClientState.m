@interface _NavigationIndexClientState
- (NSString)language;
- (unsigned)version;
@end

@implementation _NavigationIndexClientState

- (unsigned)version
{
  return self->_version;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
}

@end