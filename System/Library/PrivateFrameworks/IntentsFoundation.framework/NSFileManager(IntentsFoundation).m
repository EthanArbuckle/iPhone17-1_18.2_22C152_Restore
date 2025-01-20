@interface NSFileManager(IntentsFoundation)
- (BOOL)if_removeExtendedAttributeName:()IntentsFoundation ofItemAtURL:;
- (BOOL)if_setAuditToken:()IntentsFoundation forExtendedAttributeNamed:ofItemAtURL:;
- (BOOL)if_setBool:()IntentsFoundation forExtendedAttributeNamed:ofItemAtURL:;
- (ssize_t)if_auditTokenForExtendedAttributeNamed:()IntentsFoundation ofItemAtURL:;
- (uint64_t)if_BOOLForExtendedAttributeName:()IntentsFoundation ofItemAtURL:;
@end

@implementation NSFileManager(IntentsFoundation)

- (BOOL)if_removeExtendedAttributeName:()IntentsFoundation ofItemAtURL:
{
  id v5 = a4;
  id v6 = a3;
  v7 = (const char *)[v5 fileSystemRepresentation];
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];

  return removexattr(v7, v9, 0) != -1;
}

- (uint64_t)if_BOOLForExtendedAttributeName:()IntentsFoundation ofItemAtURL:
{
  id v5 = a4;
  id v6 = a3;
  v7 = (const char *)[v5 fileSystemRepresentation];
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];

  unsigned __int8 value = 0;
  getxattr(v7, v9, &value, 1uLL, 0, 0);
  return value;
}

- (BOOL)if_setBool:()IntentsFoundation forExtendedAttributeNamed:ofItemAtURL:
{
  char value = a3;
  id v6 = a5;
  id v7 = a4;
  id v8 = (const char *)[v6 fileSystemRepresentation];
  id v9 = v7;
  v10 = (const char *)[v9 UTF8String];

  return setxattr(v8, v10, &value, 1uLL, 0, 0) != -1;
}

- (ssize_t)if_auditTokenForExtendedAttributeNamed:()IntentsFoundation ofItemAtURL:
{
  id v5 = a1;
  id v6 = a2;
  id v7 = (const char *)[v5 fileSystemRepresentation];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  *a3 = 0u;
  a3[1] = 0u;
  return getxattr(v7, v9, a3, 0x20uLL, 0, 0);
}

- (BOOL)if_setAuditToken:()IntentsFoundation forExtendedAttributeNamed:ofItemAtURL:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (const char *)[v7 fileSystemRepresentation];
  id v10 = v8;
  v11 = (const char *)[v10 UTF8String];

  return setxattr(v9, v11, a3, 0x20uLL, 0, 0) != -1;
}

@end