@interface EKUIRemoteUIExtension
- (void)preferredContentSizeChanged:(id)a3;
@end

@implementation EKUIRemoteUIExtension

- (void)preferredContentSizeChanged:(id)a3
{
  uint64_t v3 = sub_10001F498();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F478();
  sub_10000B748();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end