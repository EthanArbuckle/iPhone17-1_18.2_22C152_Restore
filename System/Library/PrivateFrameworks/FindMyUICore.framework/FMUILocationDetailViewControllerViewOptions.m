@interface FMUILocationDetailViewControllerViewOptions
+ (FMUILocationDetailViewControllerViewOptions)default;
+ (FMUILocationDetailViewControllerViewOptions)messagesChatDetails;
+ (FMUILocationDetailViewControllerViewOptions)presentFullScreenWhenTapped;
+ (FMUILocationDetailViewControllerViewOptions)punchOutToFindMyWhenTapped;
+ (FMUILocationDetailViewControllerViewOptions)showLocateButtons;
+ (FMUILocationDetailViewControllerViewOptions)showLocationDetails;
+ (FMUILocationDetailViewControllerViewOptions)showRequestLocationButton;
+ (FMUILocationDetailViewControllerViewOptions)showShareLocationButton;
+ (FMUILocationDetailViewControllerViewOptions)spotlightWidget;
+ (FMUILocationDetailViewControllerViewOptions)useCompactInterface;
- (BOOL)isEqual:(id)a3;
- (FMUILocationDetailViewControllerViewOptions)init;
- (FMUILocationDetailViewControllerViewOptions)initWithRawValue:(int64_t)a3;
- (int64_t)hash;
@end

@implementation FMUILocationDetailViewControllerViewOptions

- (FMUILocationDetailViewControllerViewOptions)initWithRawValue:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FMUILocationDetailViewControllerViewOptions_rawValue) = (Class)a3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(FMUILocationDetailViewControllerViewOptions *)&v7 init];
}

+ (FMUILocationDetailViewControllerViewOptions)showLocationDetails
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E00, (void **)&qword_2698F1670);
}

+ (FMUILocationDetailViewControllerViewOptions)showShareLocationButton
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E08, (void **)&qword_2698F1678);
}

+ (FMUILocationDetailViewControllerViewOptions)showRequestLocationButton
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E10, (void **)&qword_2698F1680);
}

+ (FMUILocationDetailViewControllerViewOptions)showLocateButtons
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E18, (void **)&qword_2698F1688);
}

+ (FMUILocationDetailViewControllerViewOptions)presentFullScreenWhenTapped
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E20, (void **)&qword_2698F1690);
}

+ (FMUILocationDetailViewControllerViewOptions)punchOutToFindMyWhenTapped
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E28, (void **)&qword_2698F1698);
}

+ (FMUILocationDetailViewControllerViewOptions)useCompactInterface
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E30, (void **)&qword_2698F16A0);
}

+ (FMUILocationDetailViewControllerViewOptions)spotlightWidget
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E38, (void **)&qword_2698F16A8);
}

+ (FMUILocationDetailViewControllerViewOptions)messagesChatDetails
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E40, (void **)&qword_2698F16B0);
}

+ (FMUILocationDetailViewControllerViewOptions)default
{
  return (FMUILocationDetailViewControllerViewOptions *)sub_24E56D9C8((uint64_t)a1, (uint64_t)a2, &qword_2698F0E48, (void **)&qword_2698F16B8);
}

- (int64_t)hash
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___FMUILocationDetailViewControllerViewOptions_rawValue);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24E864418();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = LocationDetailViewController.ViewOptions.isEqual(_:)((uint64_t)v8);

  sub_24E563530((uint64_t)v8, &qword_2698F30C0);
  return v6;
}

- (FMUILocationDetailViewControllerViewOptions)init
{
  result = (FMUILocationDetailViewControllerViewOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end