@interface ClinicalSharingFeedItemViewController
- (_TtC13HealthRecords37ClinicalSharingFeedItemViewController)initWithCoder:(id)a3;
- (_TtC13HealthRecords37ClinicalSharingFeedItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)sharingRecipientAuthorizationStore:(id)a3 didAddSharingAuthorizations:(id)a4;
- (void)viewDidLoad;
@end

@implementation ClinicalSharingFeedItemViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2409067BC();
}

- (_TtC13HealthRecords37ClinicalSharingFeedItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2409547C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC13HealthRecords37ClinicalSharingFeedItemViewController *)sub_24090A75C(v5, v7, a4);
}

- (_TtC13HealthRecords37ClinicalSharingFeedItemViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords37ClinicalSharingFeedItemViewController *)sub_24090A9C0(a3);
}

- (void).cxx_destruct
{
  sub_24090C330((uint64_t)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___factory, &qword_268C90810, (unint64_t *)&unk_268C911C0, MEMORY[0x263F46180]);
  swift_bridgeObjectRelease();
  sub_24090C330((uint64_t)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_context, (unint64_t *)&qword_26AFCF770, (unint64_t *)&qword_26AFCF760, MEMORY[0x263F444A0]);
  v3 = (char *)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_preferredIconSize;
  uint64_t v4 = sub_240952518();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_24090BFC8((uint64_t)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_clinicalSharingFeedItemData, (uint64_t)&qword_268C916F0, (uint64_t)type metadata accessor for ClinicalSharingFeedItemData, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_24090BDA4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_authStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___subtitleView));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___disclosureIndicator);
}

- (void)sharingRecipientAuthorizationStore:(id)a3 didAddSharingAuthorizations:(id)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_24090955C();
}

@end