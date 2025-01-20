@interface MCNearbyServiceUtils
+ (BOOL)isServiceTypeValid:(id)a3;
+ (id)formattedServiceType:(id)a3;
@end

@implementation MCNearbyServiceUtils

+ (BOOL)isServiceTypeValid:(id)a3
{
  v3 = (char *)[a3 UTF8String];
  if (v3)
  {
    v4 = v3;
    size_t v5 = strlen(v3);
    if (v5 - 16 < 0xFFFFFFFFFFFFFFF1) {
      goto LABEL_7;
    }
    size_t v6 = v5;
    if (strspn(v4, "-01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") != v5) {
      goto LABEL_7;
    }
    v3 = strpbrk(v4, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
    if (v3)
    {
      if (*v4 == 45 || v4[v6 - 1] == 45)
      {
LABEL_7:
        LOBYTE(v3) = 0;
        return (char)v3;
      }
      LOBYTE(v3) = strstr(v4, "--") == 0;
    }
  }
  return (char)v3;
}

+ (id)formattedServiceType:(id)a3
{
  return (id)[NSString stringWithFormat:@"_%@._tcp", a3];
}

@end