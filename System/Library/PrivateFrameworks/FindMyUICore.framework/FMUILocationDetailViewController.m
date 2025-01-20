@interface FMUILocationDetailViewController
- (FMUILocationDetailViewController)initWithCoder:(id)a3;
- (FMUILocationDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FMUILocationDetailViewControllerDelegate)delegate;
- (UINavigationItem)navigationItem;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)dealloc;
- (void)pauseSubscriptions;
- (void)resumeSubscriptions;
- (void)setDelegate:(id)a3;
- (void)setRemoteParticipantHandles:(id)a3 localParticipantHandle:(id)a4;
- (void)setViewOptions:(id)a3;
- (void)startObservingContacts:(id)a3;
- (void)startObservingContacts:(id)a3 fromCallerHandle:(id)a4;
- (void)startObservingContacts:(id)a3 fromCallerHandle:(id)a4 groupName:(id)a5;
- (void)startObservingHandles:(id)a3 callerHandle:(id)a4;
- (void)startObservingHandles:(id)a3 callerHandle:(id)a4 groupName:(id)a5;
- (void)stopObserving;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation FMUILocationDetailViewController

- (FMUILocationDetailViewControllerDelegate)delegate
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (void *)MEMORY[0x2533436E0]((char *)v3 + OBJC_IVAR___FMUILocationDetailViewController_delegate);
  swift_release();

  swift_release();

  return (FMUILocationDetailViewControllerDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  v4 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectWeakAssign();
  swift_release();

  swift_release();

  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  LocationDetailViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FMUILocationDetailViewController_hostingViewController));
  sub_24E577458((uint64_t)self + OBJC_IVAR___FMUILocationDetailViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FMUILocationDetailViewController_viewOptions);
}

- (void)setViewOptions:(id)a3
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  LocationDetailViewController.setViewOptions(_:)(v5);
  swift_release();
}

- (void)setRemoteParticipantHandles:(id)a3 localParticipantHandle:(id)a4
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = sub_24E863E38();
  uint64_t v6 = sub_24E863CA8();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  LocationDetailViewController.set(remoteParticipantHandles:localParticipantHandle:)((Swift::OpaquePointer)v5, v10);
  swift_release();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)startObservingHandles:(id)a3 callerHandle:(id)a4
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = sub_24E863E38();
  if (a4)
  {
    uint64_t v7 = sub_24E863CA8();
    a4 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v9 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10.value._countAndFlagsBits = v7;
  v10.value._object = a4;
  LocationDetailViewController.startObserving(handles:from:groupName:)((Swift::OpaquePointer)v6, v10, (Swift::String_optional)0);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)startObservingHandles:(id)a3 callerHandle:(id)a4 groupName:(id)a5
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = sub_24E863E38();
  if (a4)
  {
    uint64_t v9 = sub_24E863CA8();
    a4 = v10;
    if (a5)
    {
LABEL_5:
      uint64_t v11 = sub_24E863CA8();
      a5 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a5) {
      goto LABEL_5;
    }
  }
  uint64_t v11 = 0;
LABEL_8:
  v13 = self;
  v14.value._countAndFlagsBits = v9;
  v14.value._object = a4;
  v15.value._countAndFlagsBits = v11;
  v15.value._object = a5;
  LocationDetailViewController.startObserving(handles:from:groupName:)((Swift::OpaquePointer)v8, v14, v15);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)startObservingContacts:(id)a3
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E56C048();
  uint64_t v4 = sub_24E863E38();
  uint64_t v5 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  LocationDetailViewController.startObserving(contacts:from:groupName:)((Swift::OpaquePointer)v4, (Swift::String_optional)0, (Swift::String_optional)0);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)startObservingContacts:(id)a3 fromCallerHandle:(id)a4
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E56C048();
  uint64_t v6 = sub_24E863E38();
  if (a4)
  {
    uint64_t v7 = sub_24E863CA8();
    a4 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v9 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10.value._countAndFlagsBits = v7;
  v10.value._object = a4;
  LocationDetailViewController.startObserving(contacts:from:groupName:)((Swift::OpaquePointer)v6, v10, (Swift::String_optional)0);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)startObservingContacts:(id)a3 fromCallerHandle:(id)a4 groupName:(id)a5
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E56C048();
  uint64_t v8 = sub_24E863E38();
  if (a4)
  {
    uint64_t v9 = sub_24E863CA8();
    a4 = v10;
    if (a5)
    {
LABEL_5:
      uint64_t v11 = sub_24E863CA8();
      a5 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a5) {
      goto LABEL_5;
    }
  }
  uint64_t v11 = 0;
LABEL_8:
  v13 = self;
  v14.value._countAndFlagsBits = v9;
  v14.value._object = a4;
  v15.value._countAndFlagsBits = v11;
  v15.value._object = a5;
  LocationDetailViewController.startObserving(contacts:from:groupName:)((Swift::OpaquePointer)v8, v14, v15);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)stopObserving
{
}

- (void)pauseSubscriptions
{
}

- (void)resumeSubscriptions
{
}

- (void)viewIsAppearing:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (UINavigationItem)navigationItem
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = objc_msgSend(*(id *)((char *)&v3->super.super.super.isa+ OBJC_IVAR___FMUILocationDetailViewController_hostingViewController), sel_navigationItem);
  swift_release();

  swift_release();

  return (UINavigationItem *)v4;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = self;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR___FMUILocationDetailViewController_hostingViewController), sel_contentScrollViewForEdge_, a3);
  swift_release();

  swift_release();

  return v6;
}

- (void)viewDidLoad
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  LocationDetailViewController.viewDidLoad()();

  swift_release();
}

- (FMUILocationDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    uint64_t v6 = sub_24E863CA8();
    a3 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = a4;
  uint64_t v9 = (FMUILocationDetailViewController *)LocationDetailViewController.init(nibName:bundle:)(v6, (uint64_t)a3, a4);
  swift_release();
  return v9;
}

- (FMUILocationDetailViewController)initWithCoder:(id)a3
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = (FMUILocationDetailViewController *)LocationDetailViewController.init(coder:)(a3);
  swift_release();
  return v4;
}

@end