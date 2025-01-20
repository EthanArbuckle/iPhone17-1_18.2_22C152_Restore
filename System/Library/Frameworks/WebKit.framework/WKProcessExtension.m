@interface WKProcessExtension
+ (id)sharedInstance;
- (id)grant:(id)a3 name:(id)a4;
- (void)setSharedInstance:(id)a3;
@end

@implementation WKProcessExtension

+ (id)sharedInstance
{
  if (_MergedGlobals_137 == 1) {
    return (id)qword_1EB35A3D8;
  }
  id result = 0;
  qword_1EB35A3D8 = 0;
  _MergedGlobals_137 = 1;
  return result;
}

- (void)setSharedInstance:(id)a3
{
  if (_MergedGlobals_137)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  qword_1EB35A3D8 = 0;
  _MergedGlobals_137 = 1;
  if (a3) {
LABEL_3:
  }
    CFRetain(a3);
LABEL_4:
  v4 = (const void *)qword_1EB35A3D8;
  qword_1EB35A3D8 = (uint64_t)a3;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id)grant:(id)a3 name:(id)a4
{
  return 0;
}

@end