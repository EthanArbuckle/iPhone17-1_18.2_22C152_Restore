@interface KeyValueDomainPinnedContentUpdateNotifier
- (void)didUpdateKeyValueDomain:(id)a3;
@end

@implementation KeyValueDomainPinnedContentUpdateNotifier

- (void)didUpdateKeyValueDomain:(id)a3
{
  sub_1C2624FC4();
  sub_1C26252D0((unint64_t *)&unk_1EBB84A50, (void (*)(uint64_t))sub_1C2624FC4);
  id v4 = a3;
  swift_retain();
  sub_1C277B490();

  swift_release();
}

@end