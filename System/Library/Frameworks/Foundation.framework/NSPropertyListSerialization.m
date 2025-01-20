@interface NSPropertyListSerialization
+ (BOOL)propertyList:(id)plist isValidForFormat:(NSPropertyListFormat)format;
+ (NSData)dataFromPropertyList:(id)plist format:(NSPropertyListFormat)format errorDescription:(NSString *)errorString;
+ (NSData)dataWithPropertyList:(id)plist format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error;
+ (NSInteger)writePropertyList:(id)plist toStream:(NSOutputStream *)stream format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error;
+ (NSPropertyListSerialization)allocWithZone:(_NSZone *)a3;
+ (id)propertyListFromData:(NSData *)data mutabilityOption:(NSPropertyListMutabilityOptions)opt format:(NSPropertyListFormat *)format errorDescription:(NSString *)errorString;
+ (id)propertyListWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error;
+ (id)propertyListWithStream:(NSInputStream *)stream options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error;
- (NSPropertyListSerialization)init;
@end

@implementation NSPropertyListSerialization

+ (NSData)dataWithPropertyList:(id)plist format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error
{
  CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], plist, (CFPropertyListFormat)format, opt, (CFErrorRef *)error);
  CFDataRef v8 = Data;
  if (error && !Data && *error) {
    v9 = *error;
  }

  return (NSData *)v8;
}

+ (id)propertyListWithData:(NSData *)data options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error
{
  if (!data) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"data parameter is nil", 0, error));
  }
  CFPropertyListRef v7 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], (CFDataRef)data, opt, (CFPropertyListFormat *)format, (CFErrorRef *)error);
  CFDataRef v8 = (void *)v7;
  if (error && !v7 && *error) {
    v9 = *error;
  }

  return v8;
}

+ (BOOL)propertyList:(id)plist isValidForFormat:(NSPropertyListFormat)format
{
  return CFPropertyListIsValid(plist, (CFPropertyListFormat)format) != 0;
}

+ (id)propertyListWithStream:(NSInputStream *)stream options:(NSPropertyListReadOptions)opt format:(NSPropertyListFormat *)format error:(NSError *)error
{
  if (!stream) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"stream parameter is nil", 0, error));
  }
  CFPropertyListRef v7 = CFPropertyListCreateWithStream((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], (CFReadStreamRef)stream, 0, opt, (CFPropertyListFormat *)format, (CFErrorRef *)error);
  CFDataRef v8 = (void *)v7;
  if (error && !v7 && *error) {
    v9 = *error;
  }

  return v8;
}

+ (NSData)dataFromPropertyList:(id)plist format:(NSPropertyListFormat)format errorDescription:(NSString *)errorString
{
  CFDataRef v8 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  CFWriteStreamOpen(v8);
  if (CFPropertyListWriteToStream(plist, v8, (CFPropertyListFormat)format, (CFStringRef *)errorString) < 1) {
    v9 = 0;
  }
  else {
    v9 = (void *)CFWriteStreamCopyProperty(v8, (CFStreamPropertyKey)*MEMORY[0x1E4F1D440]);
  }
  CFWriteStreamClose(v8);
  CFRelease(v8);

  return (NSData *)v9;
}

+ (id)propertyListFromData:(NSData *)data mutabilityOption:(NSPropertyListMutabilityOptions)opt format:(NSPropertyListFormat *)format errorDescription:(NSString *)errorString
{
  if (data)
  {
    v6 = (void *)_CFPropertyListCreateFromXMLData();
    return v6;
  }
  else
  {
    if (errorString) {
      *errorString = (NSString *)@"stream had too few bytes";
    }
    return 0;
  }
}

+ (NSPropertyListSerialization)allocWithZone:(_NSZone *)a3
{
  v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Do not create instances of NSPropertyListSerialization in this release", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (NSPropertyListSerialization)init
{
  v3 = +[NSString stringWithFormat:@"%@: Do not create instances of NSPropertyListSerialization in this release", _NSMethodExceptionProem((objc_class *)self, a2)];

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v3 userInfo:0]);
}

+ (NSInteger)writePropertyList:(id)plist toStream:(NSOutputStream *)stream format:(NSPropertyListFormat)format options:(NSPropertyListWriteOptions)opt error:(NSError *)error
{
  if (!plist)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v14 = @"plist parameter is nil";
    goto LABEL_13;
  }
  if (!stream)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v14 = @"stream parameter is nil";
    goto LABEL_13;
  }
  if (format != NSPropertyListXMLFormat_v1_0 && format != NSPropertyListBinaryFormat_v1_0)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    v14 = @"Invalid property list format";
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0, opt, error));
  }
  CFIndex v8 = CFPropertyListWrite(plist, (CFWriteStreamRef)stream, (CFPropertyListFormat)format, opt, (CFErrorRef *)error);
  NSInteger v9 = v8;
  if (error && !v8 && *error) {
    v10 = *error;
  }
  return v9;
}

@end