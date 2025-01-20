@interface NSExtension(CopyingButWithDifferentName)
- (id)_freshCopy;
@end

@implementation NSExtension(CopyingButWithDifferentName)

- (id)_freshCopy
{
  id v2 = objc_alloc(MEMORY[0x1E4F28C70]);
  v3 = [a1 _plugIn];
  v4 = (void *)[v2 _initWithPKPlugin:v3];

  return v4;
}

@end