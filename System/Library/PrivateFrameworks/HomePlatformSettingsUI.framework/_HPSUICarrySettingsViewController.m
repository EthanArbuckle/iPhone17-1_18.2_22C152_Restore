@interface _HPSUICarrySettingsViewController
+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5;
+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 withCompletion:(id)a4;
- (_HPSUICarrySettingsViewController)init;
- (_HPSUICarrySettingsViewController)initWithHomeID:(id)a3;
- (_HPSUICarrySettingsViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _HPSUICarrySettingsViewController

- (_HPSUICarrySettingsViewController)initWithHomeID:(id)a3
{
  uint64_t v3 = sub_232E5ACC8();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E5ACB8();
  return (_HPSUICarrySettingsViewController *)CarrySettingsViewController.init(withHomeID:)((uint64_t)v5);
}

- (_HPSUICarrySettingsViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4
{
  uint64_t v4 = sub_232E5ACC8();
  MEMORY[0x270FA5388](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E5ACB8();
  sub_232E506A0((unint64_t *)&qword_268754A40, MEMORY[0x263F07508]);
  uint64_t v7 = sub_232E5AFF8();
  return (_HPSUICarrySettingsViewController *)CarrySettingsViewController.init(withHomeID:homeKitIdentifiers:)((uint64_t)v6, v7);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(_HPSUICarrySettingsViewController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    id v8 = objc_msgSend(v7, sel_standardAppearance);
    objc_msgSend(v7, sel_setScrollEdgeAppearance_, v8);

    id v4 = v8;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(_HPSUICarrySettingsViewController *)&v8 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel_setScrollEdgeAppearance_, 0);
    id v4 = v7;
  }
}

- (_HPSUICarrySettingsViewController)init
{
  result = (_HPSUICarrySettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____HPSUICarrySettingsViewController_homeID;
  uint64_t v3 = sub_232E5ACC8();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 withCompletion:(id)a4
{
  uint64_t v5 = sub_232E5ACC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  objc_super v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v9 = _Block_copy(a4);
  sub_232E5ACB8();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  swift_getObjCClassMetadata();
  _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0((uint64_t)v8, (uint64_t)sub_232E507FC, v10);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5
{
  uint64_t v6 = sub_232E5ACC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a5);
  sub_232E5ACB8();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  swift_getObjCClassMetadata();
  _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0((uint64_t)v9, (uint64_t)sub_232E504E4, v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end