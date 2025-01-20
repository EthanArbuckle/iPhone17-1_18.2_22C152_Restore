@interface _CPBundleIdentifierString
- (BOOL)_isProcessName;
- (id)_initWithExecutablePath:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_loadBundleIdentifierOrProcessName;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _CPBundleIdentifierString

- (id)_initWithExecutablePath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CPBundleIdentifierString;
  v4 = [(_CPBundleIdentifierString *)&v6 init];
  if (v4) {
    v4->_executablePath = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CPBundleIdentifierString;
  [(_CPBundleIdentifierString *)&v3 dealloc];
}

- (void)_loadBundleIdentifierOrProcessName
{
  objc_sync_enter(self);
  if (!self->_bundleIdentifierOrProcessName)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    self->_isProcessName = 0;
    CFURLRef v4 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_executablePath, kCFURLPOSIXPathStyle, 0);
    if (v4)
    {
      CFURLRef v5 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v5)
      {
        objc_super v6 = CFBundleCreate(0, v5);
        v7 = v6;
        if (v6)
        {
          self->_bundleIdentifierOrProcessName = (NSString *)(id)CFBundleGetIdentifier(v6);
          CFRelease(v7);
        }
        CFRelease(v5);
      }
      CFRelease(v4);
    }
    if (!self->_bundleIdentifierOrProcessName)
    {
      self->_bundleIdentifierOrProcessName = [(NSString *)self->_executablePath lastPathComponent];
      self->_isProcessName = 1;
    }
  }
  objc_sync_exit(self);
}

- (BOOL)_isProcessName
{
  return self->_isProcessName;
}

- (unint64_t)length
{
  [(_CPBundleIdentifierString *)self _loadBundleIdentifierOrProcessName];
  bundleIdentifierOrProcessName = self->_bundleIdentifierOrProcessName;
  return [(NSString *)bundleIdentifierOrProcessName length];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  [(_CPBundleIdentifierString *)self _loadBundleIdentifierOrProcessName];
  bundleIdentifierOrProcessName = self->_bundleIdentifierOrProcessName;
  return [(NSString *)bundleIdentifierOrProcessName characterAtIndex:a3];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(_CPBundleIdentifierString *)self _loadBundleIdentifierOrProcessName];
  bundleIdentifierOrProcessName = self->_bundleIdentifierOrProcessName;
  -[NSString getCharacters:range:](bundleIdentifierOrProcessName, "getCharacters:range:", a3, location, length);
}

@end