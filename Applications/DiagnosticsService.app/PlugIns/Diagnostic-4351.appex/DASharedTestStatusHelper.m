@interface DASharedTestStatusHelper
+ (id)statusCodeForArchiveError:(id)a3;
@end

@implementation DASharedTestStatusHelper

+ (id)statusCodeForArchiveError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  uint64_t v5 = -999;
  if (v3)
  {
    v6 = (char *)[v3 code];
    if ((unint64_t)(v6 - 1) < 0xA) {
      uint64_t v5 = (uint64_t)(v6 - 2010);
    }
  }
  v7 = +[NSNumber numberWithInteger:v5];

  return v7;
}

@end