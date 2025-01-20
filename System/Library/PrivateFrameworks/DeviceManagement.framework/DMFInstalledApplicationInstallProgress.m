@interface DMFInstalledApplicationInstallProgress
- (Class)classForCoder;
@end

@implementation DMFInstalledApplicationInstallProgress

- (Class)classForCoder
{
  v4.receiver = self;
  v4.super_class = (Class)DMFInstalledApplicationInstallProgress;
  v2 = [(DMFInstalledApplicationInstallProgress *)&v4 classForCoder];
  return (Class)v2;
}

@end