@interface GenerativeAssistantEnablementNavigationController
- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithCoder:(id)a3;
- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithRootViewController:(id)a3;
- (void)dismissedWithCancel;
- (void)viewDidLoad;
@end

@implementation GenerativeAssistantEnablementNavigationController

- (void)viewDidLoad
{
  v2 = self;
  sub_24FA8B230();
}

- (void)dismissedWithCancel
{
  char v4 = 0;
  unsigned __int8 v3 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType);
  v2 = self;
  sub_24FA8B69C(&v4, &v3);
}

- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
LABEL_6:
  GenerativeAssistantEnablementNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
  return result;
}

- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  sub_24FA8F59C((uint64_t)v3);
  v5 = v4;

  return v5;
}

- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_24FABFFE0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  GenerativeAssistantEnablementNavigationController.init(nibName:bundle:)(v5, v7, a4);
  return result;
}

- (_TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController)initWithCoder:(id)a3
{
  GenerativeAssistantEnablementNavigationController.init(coder:)(a3);
  return result;
}

- (void).cxx_destruct
{
  sub_24FA89838((uint64_t)self+ OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate, &qword_269A4BC70);
  id v3 = (char *)self
     + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_restrictionsManager;
  uint64_t v4 = sub_24FABF3E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_logo);
}

@end