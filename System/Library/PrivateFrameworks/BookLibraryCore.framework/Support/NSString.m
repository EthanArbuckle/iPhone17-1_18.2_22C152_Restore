@interface NSString
- (BOOL)bl_isInVolume:(id)a3;
- (id)numberFromDecimalDigits;
- (id)numberFromHexDigits;
@end

@implementation NSString

- (BOOL)bl_isInVolume:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length]
    && (memset(&v8, 0, 512),
        !statfs(-[NSString fileSystemRepresentation](self, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0,
             0),
           &v8)))
  {
    v6 = +[NSString stringWithUTF8String:v8.f_mntonname];
    unsigned __int8 v5 = [v6 isEqualToString:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)numberFromHexDigits
{
  v3 = [(NSString *)self length];
  if (v3)
  {
    uint64_t v7 = 0;
    id v4 = +[NSScanner scannerWithString:self];
    unsigned int v5 = [v4 scanHexLongLong:&v7];

    v3 = 0;
    if (v5)
    {
      v3 = +[NSNumber numberWithUnsignedLongLong:v7];
    }
  }

  return v3;
}

- (id)numberFromDecimalDigits
{
  if ([(NSString *)self length])
  {
    v3 = objc_opt_new();
    [v3 setNumberStyle:1];
    id v4 = [v3 numberFromString:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end