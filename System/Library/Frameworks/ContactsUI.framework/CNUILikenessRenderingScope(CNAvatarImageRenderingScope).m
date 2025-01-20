@interface CNUILikenessRenderingScope(CNAvatarImageRenderingScope)
- (BOOL)avatarViewStyle;
- (uint64_t)avatarViewBackgroundStyle;
@end

@implementation CNUILikenessRenderingScope(CNAvatarImageRenderingScope)

- (uint64_t)avatarViewBackgroundStyle
{
  uint64_t result = [a1 backgroundStyle];
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (BOOL)avatarViewStyle
{
  return [a1 style] == 1;
}

@end