@interface HPRFSeymourSubscriptionProvider
- (HPRFSeymourSubscriptionProvider)init;
- (void)fetchSubscriptionStatusWithCompletion:(id)a3;
@end

@implementation HPRFSeymourSubscriptionProvider

- (HPRFSeymourSubscriptionProvider)init
{
  sub_E1F0();
  sub_C234(0, &qword_1A170);
  v3 = self;
  v4 = (void *)sub_E3D0();
  sub_E1D0();

  sub_C148(&qword_1A178);
  sub_E1E0();
  sub_DFEC(&v8, (uint64_t)v3 + OBJC_IVAR___HPRFSeymourSubscriptionProvider_subscriptionClient);

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for SeymourSubscriptionProvider();
  v5 = [(HPRFSeymourSubscriptionProvider *)&v7 init];
  swift_release();
  return v5;
}

- (void)fetchSubscriptionStatusWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_C6F0((uint64_t)sub_DFE4, v5);

  swift_release();
}

- (void).cxx_destruct
{
}

@end