@interface InstallationNSProgress
- (_TtC15AppDistribution22InstallationNSProgress)initWithParent:(id)a3 userInfo:(id)a4;
- (void)cancel;
- (void)pause;
- (void)resume;
@end

@implementation InstallationNSProgress

- (void)pause
{
  v2 = self;
  sub_2479E5B58(1, 1);
}

- (void)resume
{
  v2 = self;
  sub_2479E5B58(0, 1);
}

- (void)cancel
{
  v2 = self;
  sub_2479E5B58(2, 1);
}

- (_TtC15AppDistribution22InstallationNSProgress)initWithParent:(id)a3 userInfo:(id)a4
{
  id v4 = a3;
  result = (_TtC15AppDistribution22InstallationNSProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end