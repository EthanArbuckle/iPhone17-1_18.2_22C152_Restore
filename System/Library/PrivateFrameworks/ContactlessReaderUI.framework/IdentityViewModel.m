@interface IdentityViewModel
- (void)displayIdentityInformation:(id)a3;
- (void)updateUIState:(int64_t)a3;
@end

@implementation IdentityViewModel

- (void)updateUIState:(int64_t)a3
{
  swift_retain();
  sub_23EE49688(a3);
  swift_release();
}

- (void)displayIdentityInformation:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_23EE49BF4(v3);

  swift_release();
}

@end