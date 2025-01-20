@interface IMNicknameAvatar
+ (BOOL)supportsSecureCoding;
- (IMNicknameAvatar)initWithCoder:(id)a3;
@end

@implementation IMNicknameAvatar

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMNicknameAvatar)initWithCoder:(id)a3
{
  return 0;
}

@end