@interface JavaNetURI_$1
+ (const)__metadata;
- (BOOL)isRetainedWithChar:(unsigned __int16)a3;
- (JavaNetURI_$1)init;
@end

@implementation JavaNetURI_$1

- (BOOL)isRetainedWithChar:(unsigned __int16)a3
{
  return a3 < 0x80u;
}

- (JavaNetURI_$1)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046A1D8;
}

@end