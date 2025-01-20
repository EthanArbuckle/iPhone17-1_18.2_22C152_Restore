@interface SearchHintsViewController
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SearchHintsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_5E82F8();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_5E8928(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5E8AD4((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25SearchHintsViewController_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25SearchHintsViewController_searchHintsCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25SearchHintsViewController_searchHintsCollectionViewDelegate));

  swift_release();
}

@end