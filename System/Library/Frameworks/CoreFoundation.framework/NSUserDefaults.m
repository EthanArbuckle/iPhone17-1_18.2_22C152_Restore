@interface NSUserDefaults
- (BOOL)_observingCFPreferences;
- (NSArray)volatileDomainNames;
- (__CFString)_container;
- (__CFString)_identifier;
- (id)_kvo;
- (void)_setContainer:(__CFURL *)a3;
- (void)_setIdentifier:(__CFString *)a3;
- (void)_setKVO:(id)a3;
@end

@implementation NSUserDefaults

- (id)_kvo
{
  return self->_kvo_;
}

- (__CFString)_identifier
{
  return self->_identifier_;
}

- (__CFString)_container
{
  return self->_container_;
}

- (void)_setIdentifier:(__CFString *)a3
{
  identifier = self->_identifier_;
  if (identifier) {
    CFRelease(identifier);
  }
  if (a3) {
    v6 = a3;
  }
  else {
    v6 = @"kCFPreferencesCurrentApplication";
  }
  self->_identifier_ = (__CFString *)CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6);
}

- (void)_setContainer:(__CFURL *)a3
{
  container = self->_container_;
  if (a3)
  {
    if (container) {
      CFRelease(container);
    }
    v6 = (__CFString *)CFURLCopyFileSystemPath(a3, kCFURLPOSIXPathStyle);
  }
  else
  {
    if (!container) {
      return;
    }
    CFRelease(container);
    v6 = 0;
  }
  self->_container_ = v6;
}

- (void)_setKVO:(id)a3
{
  self->_kvo_ = a3;
}

- (BOOL)_observingCFPreferences
{
  return self->_kvo_ != 0;
}

- (NSArray)volatileDomainNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

@end