@interface WorkoutPreviewViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (WorkoutPreviewViewController)initWithCoder:(id)a3;
- (WorkoutPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissView;
- (void)presentWorkoutDataRepresentation:(id)a3;
@end

@implementation WorkoutPreviewViewController

+ (id)_remoteViewControllerInterface
{
  return sub_10000802C((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceExportedInterface);
}

+ (id)_exportedInterface
{
  return sub_10000802C((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceInterface);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)dismissView
{
  v3 = self;
  id v2 = [(WorkoutPreviewViewController *)v3 _remoteViewControllerProxy];
  swift_unknownObjectRelease();
  if (v2)
  {
    [v2 dismiss];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (WorkoutPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager) = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for WorkoutPreviewViewController();
  v9 = [(WorkoutPreviewViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (WorkoutPreviewViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WorkoutPreviewViewController();
  return [(WorkoutPreviewViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager));
}

- (void)presentWorkoutDataRepresentation:(id)a3
{
  id v4 = a3;
  v10 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  type metadata accessor for WorkoutConfiguration();
  type metadata accessor for Occurrence();
  id v8 = (void *)Occurrence.__allocating_init(count:)();
  type metadata accessor for WorkoutConfigurationValidator();
  static WorkoutConfigurationValidator.shared.getter();
  v9 = (void *)static WorkoutConfiguration.importFromData(_:with:validator:)();

  swift_release();
  sub_100008088(v9);

  sub_100007D3C(v5, v7);
}

@end