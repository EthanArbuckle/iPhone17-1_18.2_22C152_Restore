@interface ActivityPickerServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (ActivityPickerServiceViewController)init;
- (ActivityPickerServiceViewController)initWithCoder:(id)a3;
- (ActivityPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithIsEmbedded:(BOOL)a3 headerText:(id)a4 footerText:(id)a5 includeEntireCategory:(BOOL)a6 selectedApplications:(id)a7 selectedCategories:(id)a8 selectedWebDomains:(id)a9 selectedUntokenizedApplications:(id)a10 selectedUntokenizedCategories:(id)a11 selectedUntokenizedWebDomains:(id)a12;
@end

@implementation ActivityPickerServiceViewController

- (ActivityPickerServiceViewController)init
{
  return (ActivityPickerServiceViewController *)sub_100011FFC();
}

- (ActivityPickerServiceViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100015794();
}

+ (id)_exportedInterface
{
  return sub_1000121F8((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP14FamilyControls30ActivityPickerServiceInterface_);
}

+ (id)_remoteViewControllerInterface
{
  return sub_1000121F8((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP14FamilyControls29ActivityPickerClientInterface_);
}

- (void)configureWithIsEmbedded:(BOOL)a3 headerText:(id)a4 footerText:(id)a5 includeEntireCategory:(BOOL)a6 selectedApplications:(id)a7 selectedCategories:(id)a8 selectedWebDomains:(id)a9 selectedUntokenizedApplications:(id)a10 selectedUntokenizedCategories:(id)a11 selectedUntokenizedWebDomains:(id)a12
{
  BOOL v23 = a3;
  BOOL v24 = a6;
  uint64_t v12 = (uint64_t)a5;
  if (a4)
  {
    uint64_t v21 = sub_100032638();
    uint64_t v14 = v13;
    if (v12)
    {
LABEL_3:
      uint64_t v12 = sub_100032638();
      uint64_t v16 = v15;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v14 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = 0;
LABEL_6:
  uint64_t v17 = sub_100032708();
  uint64_t v18 = sub_100032708();
  uint64_t v19 = sub_100032708();
  sub_100032708();
  sub_100032708();
  sub_100032708();
  v20 = self;
  sub_100012760(v23, v21, v14, v12, v16, v24, v17, v18, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (ActivityPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ActivityPickerServiceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_1000162EC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client), *(void *)&self->viewConfiguration[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client], *(void *)&self->tokenDecoder[OBJC_IVAR___ActivityPickerServiceViewController____lazy_storage___client]);

  swift_unknownObjectRelease();
}

@end