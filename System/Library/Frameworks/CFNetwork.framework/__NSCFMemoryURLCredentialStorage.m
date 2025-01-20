@interface __NSCFMemoryURLCredentialStorage
- (__NSCFMemoryURLCredentialStorage)init;
- (id)description;
@end

@implementation __NSCFMemoryURLCredentialStorage

- (__NSCFMemoryURLCredentialStorage)init
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"kCFURLStorageSessionIsPrivate";
  v9[0] = *MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v3 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v4 = _CFURLCredentialStorageCreateWithProperties((const __CFAllocator *)*MEMORY[0x1E4F1CF80], 0, v3);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFMemoryURLCredentialStorage;
  v5 = [(NSURLCredentialStorage *)&v7 _initWithCFURLCredentialStorage:v4];
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)__NSCFMemoryURLCredentialStorage;
  return (id)[NSString stringWithFormat:@"Ephemeral %@", -[__NSCFMemoryURLCredentialStorage description](&v3, sel_description)];
}

@end