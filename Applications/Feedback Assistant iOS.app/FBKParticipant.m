@interface FBKParticipant
- (UIImage)contactImage;
@end

@implementation FBKParticipant

- (UIImage)contactImage
{
  v3 = [(FBKParticipant *)self emailAddress];
  v4 = +[FBAAvatarHelper contactImageForEmailAddress:v3];

  if (!v4)
  {
    v5 = [(FBKParticipant *)self givenName];
    v6 = [(FBKParticipant *)self familyName];
    v4 = +[FBAAvatarHelper monogramAvatarImageForPreferredName:v5 familyName:v6];
  }

  return (UIImage *)v4;
}

@end