@interface CloudSharingViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (CloudSharingViewController)initWithCoder:(id)a3;
- (CloudSharingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_prepareForDisplayWithCompletion:(id)a3;
- (void)_setAppName:(id)a3;
- (void)_setAvailablePermissions:(unint64_t)a3;
- (void)_setCloudKitContainerSetupInfo:(id)a3;
- (void)_setCloudKitShare:(id)a3 containerID:(id)a4;
- (void)_setCloudKitThumbnail:(id)a3 title:(id)a4 type:(id)a5;
- (void)_setFolderSubitemName:(id)a3;
- (void)_setParticipantDetails:(id)a3;
- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3;
- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3;
- (void)_setRootFolderTitle:(id)a3;
- (void)_setSandboxingURLWrapper:(id)a3;
- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3;
- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3;
- (void)_setSectionTitleForAuxiliarySwitches:(id)a3;
- (void)_setShowAddPeople:(BOOL)a3;
- (void)_setThumbnail:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CloudSharingViewController

- (CloudSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (CloudSharingViewController *)sub_10000A0D8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100009F2C);
}

- (CloudSharingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100012B4C();
}

+ (id)_exportedInterface
{
  v2 = (void *)sub_100012C14();

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  id v2 = [self interfaceWithProtocol:&OBJC_PROTOCOL____UIShareInvitationViewControllerHost];

  return v2;
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  id v5 = a3;
  [(CloudSharingViewController *)&v7 didMoveToParentViewController:v5];
  v6 = (void *)sub_10000A1F4();
  if (v6)
  {
    objc_msgSend(v6, "_requestContentSize:", 375.0, 636.0, v7.receiver, v7.super_class);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_10000A370();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10000A9D0(a3);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  sub_10000AB98();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(CloudSharingViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v4 = v7.receiver;
  [(CloudSharingViewController *)&v7 preferredContentSizeDidChangeForChildContentContainer:a3];
  uint64_t v5 = sub_10000A1F4();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(a3, "preferredContentSize", v7.receiver, v7.super_class);
    objc_msgSend(v6, "_requestContentSize:");
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void)_setRootFolderTitle:(id)a3
{
}

- (void)_setFolderSubitemName:(id)a3
{
}

- (void)_setAppName:(id)a3
{
  uint64_t v4 = sub_1000C7440();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___CloudSharingViewController_appName);
  *uint64_t v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (void)_setSandboxingURLWrapper:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10000C580(v4);
}

- (void)_prepareForDisplayWithCompletion:(id)a3
{
  id v4 = (void (**)(void))_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = self;
    _Block_copy(v5);
    [(CloudSharingViewController *)v6 preferredContentSize];
    v5[2](v5);
    _Block_release(v5);
    _Block_release(v5);
  }
}

- (void)_setCloudKitShare:(id)a3 containerID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10000CFB4(a3, a4);
}

- (void)_setAvailablePermissions:(unint64_t)a3
{
  id v4 = self;
  sub_10000D374(a3);
}

- (void)_setCloudKitThumbnail:(id)a3 title:(id)a4 type:(id)a5
{
  id v7 = a3;
  if (a3)
  {
    id v8 = a4;
    id v9 = a5;
    v10 = self;
    id v11 = v7;
    id v7 = (void *)sub_1000C6550();
    unint64_t v13 = v12;

    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v20 = a4;
  id v21 = a5;
  v22 = self;
  unint64_t v13 = 0xF000000000000000;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v14 = sub_1000C7440();
  uint64_t v16 = v15;

  if (a5)
  {
LABEL_4:
    uint64_t v17 = sub_1000C7440();
    uint64_t v19 = v18;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v17 = 0;
  uint64_t v19 = 0;
LABEL_8:
  sub_10000D734((uint64_t)v7, v13, v14, v16, v17, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100012A88((uint64_t)v7, v13);
}

- (void)_setCloudKitContainerSetupInfo:(id)a3
{
  if (a3)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v4 = a3;
    swift_retain();
    sub_1000C67F0();
  }
}

- (void)_setThumbnail:(id)a3
{
  if (a3)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v4 = a3;
    swift_retain();
    sub_1000C67F0();
  }
}

- (void)_setShowAddPeople:(BOOL)a3
{
  if (a3)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1000C67F0();
  }
}

- (void)_setParticipantDetails:(id)a3
{
  if (a3)
  {
    sub_1000132C8(0, &qword_10010AFE8);
    sub_1000C73B0();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1000C67F0();
  }
}

- (void)_setSectionTitleForAuxiliarySwitches:(id)a3
{
}

- (void)_setPrimaryAuxiliarySwitchTitle:(id)a3
{
}

- (void)_setPrimaryAuxiliarySwitchState:(BOOL)a3
{
}

- (void)_setSecondaryAuxiliarySwitchTitle:(id)a3
{
}

- (void)_setSecondaryAuxiliarySwitchState:(BOOL)a3
{
}

@end