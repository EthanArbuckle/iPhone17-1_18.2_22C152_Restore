@interface RecentCallContactView.Coordinator
- (_TtCV11MobilePhone21RecentCallContactView11Coordinator)init;
- (void)didTapClose;
@end

@implementation RecentCallContactView.Coordinator

- (void)didTapClose
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v6 = self;
  v3 = (_TtCV11MobilePhone21RecentCallContactView11Coordinator *)v2();
  if (v3)
  {
    v4 = v3;
    [(RecentCallContactView.Coordinator *)v3 dismissViewControllerAnimated:1 completion:0];

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }
}

- (_TtCV11MobilePhone21RecentCallContactView11Coordinator)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecentCallContactView.Coordinator();
  return [(RecentCallContactView.Coordinator *)&v4 init];
}

- (void).cxx_destruct
{
}

@end