@interface CollapsedViewController
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CollapsedViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(CollapsedViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = sub_255C4D0B4();
    objc_msgSend(v4, sel_addSubview_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_255C53704();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_0349A88C813783B152676260F9284CCC23CollapsedViewController____lazy_storage___miniPlayerContainer));
}

@end