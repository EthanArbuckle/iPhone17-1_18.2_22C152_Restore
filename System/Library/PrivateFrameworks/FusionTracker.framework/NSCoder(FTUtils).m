@interface NSCoder(FTUtils)
- (CGFloat)fusionTracker_decodeCGRectForKey:()FTUtils;
- (void)fusionTracker_decodeCMTimeForKey:()FTUtils;
- (void)fusionTracker_encodeCGRect:()FTUtils forKey:;
- (void)fusionTracker_encodeCMTime:()FTUtils forKey:;
@end

@implementation NSCoder(FTUtils)

- (void)fusionTracker_encodeCMTime:()FTUtils forKey:
{
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMTime v8 = *a3;
  id v6 = a4;
  CFDictionaryRef v7 = CMTimeCopyAsDictionary(&v8, v5);
  objc_msgSend(a1, "encodeObject:forKey:", v7, v6, *(_OWORD *)&v8.value, v8.epoch);

  CFRelease(v7);
}

- (void)fusionTracker_decodeCMTimeForKey:()FTUtils
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFAllocatorRef v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a2;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  CFDictionaryRef v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:3];
  CMTime v8 = objc_msgSend(v5, "setWithArray:", v7, v10, v11);
  CFDictionaryRef v9 = [a1 decodeObjectOfClasses:v8 forKey:v6];

  CMTimeMakeFromDictionary(a3, v9);
}

- (void)fusionTracker_encodeCGRect:()FTUtils forKey:
{
  id v12 = a7;
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v15);
  [a1 encodeObject:DictionaryRepresentation forKey:v12];

  CFRelease(DictionaryRepresentation);
}

- (CGFloat)fusionTracker_decodeCGRectForKey:()FTUtils
{
  v11[3] = *MEMORY[0x263EF8340];
  memset(&v10, 0, sizeof(v10));
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  CFDictionaryRef v7 = [v4 setWithArray:v6];
  CFDictionaryRef v8 = (const __CFDictionary *)[a1 decodeObjectOfClasses:v7 forKey:v5];

  CGRectMakeWithDictionaryRepresentation(v8, &v10);
  return v10.origin.x;
}

@end