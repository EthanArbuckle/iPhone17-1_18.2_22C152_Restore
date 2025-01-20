@interface NSString(Normalization)
- (__CFString)getUnicodeNormalization;
@end

@implementation NSString(Normalization)

- (__CFString)getUnicodeNormalization
{
  id v1 = a1;
  v2 = (const char *)[v1 UTF8String];
  id v3 = [v1 decomposedStringWithCanonicalMapping];
  int v4 = strcmp(v2, (const char *)[v3 UTF8String]);

  if (!v4) {
    return @"D";
  }
  id v5 = [v1 precomposedStringWithCanonicalMapping];
  int v6 = strcmp(v2, (const char *)[v5 UTF8String]);

  if (!v6) {
    return @"C";
  }
  id v7 = [v1 decomposedStringWithCompatibilityMapping];
  int v8 = strcmp(v2, (const char *)[v7 UTF8String]);

  if (!v8) {
    return @"KD";
  }
  id v9 = [v1 precomposedStringWithCompatibilityMapping];
  int v10 = strcmp(v2, (const char *)[v9 UTF8String]);

  if (v10) {
    return @"(undefined)";
  }
  else {
    return @"KC";
  }
}

@end