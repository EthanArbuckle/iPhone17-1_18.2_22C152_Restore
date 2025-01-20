@interface NSString
+ (id)rc_stringWithPersistentID:(int64_t)a3;
- (NSString)rc_reversedString;
- (NSString)rc_stringFromRealPath;
- (id)rc_stringByReplacingBreakingWithNonBreakingSpaces;
- (int64_t)rc_persistentIDValue;
@end

@implementation NSString

- (id)rc_stringByReplacingBreakingWithNonBreakingSpaces
{
  return [(NSString *)self stringByReplacingOccurrencesOfString:@" " withString:@" "];
}

+ (id)rc_stringWithPersistentID:(int64_t)a3
{
  return +[NSString stringWithFormat:@"%lli", a3];
}

- (int64_t)rc_persistentIDValue
{
  return [(NSString *)self longLongValue];
}

- (NSString)rc_reversedString
{
  v3 = objc_opt_new();
  NSUInteger v4 = [(NSString *)self length];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C3C4;
  v7[3] = &unk_6D620;
  id v5 = v3;
  id v8 = v5;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 258, v7);

  return (NSString *)v5;
}

- (NSString)rc_stringFromRealPath
{
  v2 = realpath_DARWIN_EXTSN([(NSString *)self fileSystemRepresentation], 0);
  if (v2)
  {
    v3 = v2;
    NSUInteger v4 = +[NSString stringWithUTF8String:v2];
    free(v3);
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return (NSString *)v4;
}

@end