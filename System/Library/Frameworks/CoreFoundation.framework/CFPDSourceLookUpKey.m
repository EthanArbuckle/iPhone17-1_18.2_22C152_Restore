@interface CFPDSourceLookUpKey
- (BOOL)isEqual:(id)a3;
- (void)dealloc;
@end

@implementation CFPDSourceLookUpKey

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  uncanonicalizedPath = self->uncanonicalizedPath;
  if (uncanonicalizedPath) {
    CFRelease(uncanonicalizedPath);
  }
  cloudPath = self->cloudPath;
  if (cloudPath) {
    CFRelease(cloudPath);
  }
  v5.receiver = self;
  v5.super_class = (Class)CFPDSourceLookUpKey;
  [(CFPDSourceLookUpKey *)&v5 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  return _CFPrefsEqualKeyOrSource(self, a3);
}

@end