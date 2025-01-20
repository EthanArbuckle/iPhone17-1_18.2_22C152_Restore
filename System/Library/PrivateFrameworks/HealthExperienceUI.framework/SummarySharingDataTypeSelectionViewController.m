@interface SummarySharingDataTypeSelectionViewController
- (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController)initWithCollectionViewLayout:(id)a3;
- (void)cancel;
- (void)done;
- (void)viewDidLoad;
@end

@implementation SummarySharingDataTypeSelectionViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SummarySharingDataTypeSelectionViewController(0);
  id v2 = v3.receiver;
  [(CompoundDataSourceCollectionViewController *)&v3 viewDidLoad];
  sub_1AD48AB24();
  sub_1AD48AC2C();
}

- (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_cancellables) = (Class)MEMORY[0x1E4FBC860];
  id v5 = a3;

  result = (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)cancel
{
}

- (void)done
{
  id v2 = self;
  sub_1AD48AE98();
}

- (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_healthExperienceStore);
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD48E220((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_selectionFlow, type metadata accessor for SummarySharingSelectionFlow);
  swift_release();
  sub_1AD24D2E8(*(void **)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_selectedContact));
  swift_release();
  swift_bridgeObjectRelease();
}

@end