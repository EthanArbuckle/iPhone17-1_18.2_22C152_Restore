@interface NSFileManager(WFFileRepresentation)
- (BOOL)wf_removeExtendedAttributeName:()WFFileRepresentation ofItemAtURL:;
@end

@implementation NSFileManager(WFFileRepresentation)

- (BOOL)wf_removeExtendedAttributeName:()WFFileRepresentation ofItemAtURL:
{
  id v5 = a4;
  id v6 = a3;
  v7 = (const char *)[v5 fileSystemRepresentation];
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];

  return removexattr(v7, v9, 0) != -1;
}

@end