@interface IdentityProofingConnectionProvider
- (void)didChangeProofingStatus;
- (void)didShowExtendedReviewNotification;
@end

@implementation IdentityProofingConnectionProvider

- (void)didChangeProofingStatus
{
  if (swift_weakLoadStrong())
  {
    swift_retain();
    sub_21F53FF10();
    swift_release();
    swift_release();
  }
}

- (void)didShowExtendedReviewNotification
{
  swift_retain();
  sub_21F47F994();

  swift_release();
}

@end