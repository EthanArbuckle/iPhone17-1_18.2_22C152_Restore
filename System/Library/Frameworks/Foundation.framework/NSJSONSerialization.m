@interface NSJSONSerialization
+ (BOOL)isValidJSONObject:(id)obj;
+ (NSData)dataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *)error;
+ (NSInteger)writeJSONObject:(id)obj toStream:(NSOutputStream *)stream options:(NSJSONWritingOptions)opt error:(NSError *)error;
+ (NSJSONSerialization)allocWithZone:(_NSZone *)a3;
+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *)error;
+ (id)JSONObjectWithStream:(NSInputStream *)stream options:(NSJSONReadingOptions)opt error:(NSError *)error;
- (NSJSONSerialization)init;
@end

@implementation NSJSONSerialization

+ (BOOL)isValidJSONObject:(id)obj
{
  return +[_NSJSONReader validForJSON:obj depth:0 allowFragments:0];
}

+ (NSInteger)writeJSONObject:(id)obj toStream:(NSOutputStream *)stream options:(NSJSONWritingOptions)opt error:(NSError *)error
{
  if (!obj)
  {
    v16 = +[NSString stringWithFormat:@"%@: value parameter is nil", _NSMethodExceptionProem((objc_class *)a1, a2)];
    goto LABEL_14;
  }
  if (!stream || ![(NSOutputStream *)stream streamStatus])
  {
    v16 = +[NSString stringWithFormat:@"%@: stream is not open for writing", _NSMethodExceptionProem((objc_class *)a1, a2)];
    goto LABEL_14;
  }
  if ((opt & 4) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0)
  {
    v16 = +[NSString stringWithFormat:@"%@: Invalid top-level type in JSON write", _NSMethodExceptionProem((objc_class *)a1, a2)];
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0]);
  }
  v12 = objc_alloc_init(_NSJSONWriter);
  uint64_t v13 = [(_NSJSONWriter *)v12 writeRootObject:obj toStream:stream options:opt];
  NSInteger v14 = v13;
  if (error && v13 == -1) {
    *error = [(_NSJSONWriter *)v12 failure];
  }
  return v14;
}

+ (NSData)dataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *)error
{
  if (!obj)
  {
    NSInteger v14 = +[NSString stringWithFormat:@"%@: value parameter is nil", _NSMethodExceptionProem((objc_class *)a1, a2)];
    goto LABEL_11;
  }
  if ((opt & 4) == 0 && (_NSIsNSArray() & 1) == 0 && (_NSIsNSDictionary() & 1) == 0)
  {
    NSInteger v14 = +[NSString stringWithFormat:@"%@: Invalid top-level type in JSON write", _NSMethodExceptionProem((objc_class *)a1, a2)];
LABEL_11:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  v10 = objc_alloc_init(_NSJSONWriter);
  uint64_t v11 = [(_NSJSONWriter *)v10 dataWithRootObject:obj options:opt];
  v12 = (NSData *)v11;
  if (error && !v11) {
    *error = [(_NSJSONWriter *)v10 failure];
  }
  return v12;
}

+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *)error
{
  if (!data)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"data parameter is nil";
    goto LABEL_8;
  }
  if ((~(_BYTE)opt & 0x14) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time";
LABEL_8:
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v12 userInfo:0]);
  }
  v8 = objc_alloc_init(_NSJSONReader);

  return [(_NSJSONReader *)v8 parseData:data options:opt error:error];
}

+ (id)JSONObjectWithStream:(NSInputStream *)stream options:(NSJSONReadingOptions)opt error:(NSError *)error
{
  if (!stream)
  {
    v12 = +[NSString stringWithFormat:@"%@: stream parameter is nil", _NSMethodExceptionProem((objc_class *)a1, a2)];
LABEL_9:
    uint64_t v13 = (__CFString *)v12;
    NSInteger v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_11;
  }
  if (![(NSInputStream *)stream streamStatus])
  {
    v12 = +[NSString stringWithFormat:@"%@: stream is not open for reading", _NSMethodExceptionProem((objc_class *)a1, a2)];
    goto LABEL_9;
  }
  if ((~(_BYTE)opt & 0x14) == 0)
  {
    NSInteger v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = @"NSJSONReadingAssumeTopLevelDictionary and NSJSONReadingAllowFragments cannot be set at the same time";
LABEL_11:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v13 userInfo:0]);
  }
  v10 = objc_alloc_init(_NSJSONReader);

  return [(_NSJSONReader *)v10 parseStream:stream options:opt error:error];
}

+ (NSJSONSerialization)allocWithZone:(_NSZone *)a3
{
  v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Do not create instances of NSJSONSerialization in this release", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (NSJSONSerialization)init
{
  v3 = +[NSString stringWithFormat:@"%@: Do not create instances of NSJSONSerialization in this release", _NSMethodExceptionProem((objc_class *)self, a2)];

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v3 userInfo:0]);
}

@end