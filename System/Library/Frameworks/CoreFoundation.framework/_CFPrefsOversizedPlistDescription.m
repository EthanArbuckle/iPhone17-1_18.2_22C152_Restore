@interface _CFPrefsOversizedPlistDescription
- (id)_descriptionOfDictionary:(__CFDictionary *)a3 withKeyRedaction:(BOOL)a4;
- (id)_descriptionWithKeyRedaction:(BOOL)a3;
- (id)description;
- (id)redactedDescription;
- (void)dealloc;
- (void)initWithDict:(const void *)a3 setKeys:(const void *)a4 andValues:(CFIndex)a5 count:;
@end

@implementation _CFPrefsOversizedPlistDescription

- (void)initWithDict:(const void *)a3 setKeys:(const void *)a4 andValues:(CFIndex)a5 count:
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)_CFPrefsOversizedPlistDescription;
  v9 = objc_msgSendSuper2(&v12, sel_init);
  if (v9)
  {
    if (a2) {
      CFTypeRef v10 = CFRetain(a2);
    }
    else {
      CFTypeRef v10 = 0;
    }
    v9[1] = v10;
    v9[2] = CFDictionaryCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, a3, a4, a5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v9;
}

- (id)_descriptionOfDictionary:(__CFDictionary *)a3 withKeyRedaction:(BOOL)a4
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  unint64_t Count = CFDictionaryGetCount(a3);
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, 0);
  CFArrayRef v8 = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, Count, &kCFTypeArrayCallBacks);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke;
  v14[3] = &unk_1ECE01318;
  v14[4] = &v16;
  v14[5] = Mutable;
  BOOL v15 = a4;
  v14[6] = v8;
  CFDictionaryApply(a3, (uint64_t)v14);
  CFRelease(Mutable);
  v9 = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  if (CFArrayGetCount(v8) > 9) {
    CFIndex v10 = 10;
  }
  else {
    CFIndex v10 = CFArrayGetCount(v8);
  }
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  v13[2] = __79___CFPrefsOversizedPlistDescription__descriptionOfDictionary_withKeyRedaction___block_invoke_2;
  v13[3] = &__block_descriptor_40_e13_v24__0r_v8_16l;
  v13[4] = v9;
  CFArrayApply((uint64_t)v8, 0, v10, (uint64_t)v13);
  if (CFArrayGetCount(v8) >= 11) {
    CFStringAppendFormat(v9, 0, @"...\nTotal keys: %ld - Average approximate value size: %ld bytes", Count, v17[3] / Count);
  }
  CFRelease(v8);
  CFTypeRef v11 = CFAutorelease(v9);
  _Block_object_dispose(&v16, 8);
  return (id)v11;
}

- (id)_descriptionWithKeyRedaction:(BOOL)a3
{
  BOOL v3 = a3;
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  if (CFDictionaryGetCount(self->newValues) >= 1) {
    CFStringAppendFormat(Mutable, 0, @"Description of keys being set:\n%@\n", [(_CFPrefsOversizedPlistDescription *)self _descriptionOfDictionary:self->newValues withKeyRedaction:v3]);
  }
  existingValues = self->existingValues;
  if (existingValues && CFDictionaryGetCount(existingValues) >= 1) {
    CFStringAppendFormat(Mutable, 0, @"Description of keys already present:\n%@\n", [(_CFPrefsOversizedPlistDescription *)self _descriptionOfDictionary:self->existingValues withKeyRedaction:v3]);
  }

  return (id)CFAutorelease(Mutable);
}

- (id)redactedDescription
{
  return [(_CFPrefsOversizedPlistDescription *)self _descriptionWithKeyRedaction:1];
}

- (id)description
{
  return [(_CFPrefsOversizedPlistDescription *)self _descriptionWithKeyRedaction:0];
}

- (void)dealloc
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  existingValues = self->existingValues;
  if (existingValues) {
    CFRelease(existingValues);
  }
  newValues = self->newValues;
  if (newValues) {
    CFRelease(newValues);
  }
  v5.receiver = self;
  v5.super_class = (Class)_CFPrefsOversizedPlistDescription;
  [(_CFPrefsOversizedPlistDescription *)&v5 dealloc];
}

@end