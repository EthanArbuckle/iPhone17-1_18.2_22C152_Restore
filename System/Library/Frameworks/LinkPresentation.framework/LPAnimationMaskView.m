@interface LPAnimationMaskView
- (UIImage)image;
- (UIView)imageView;
- (_TtC16LinkPresentation19LPAnimationMaskView)init;
- (_TtC16LinkPresentation19LPAnimationMaskView)initWithCoder:(id)a3;
- (_TtC16LinkPresentation19LPAnimationMaskView)initWithFrame:(CGRect)a3;
- (int64_t)animationOrigin;
- (void)layoutSubviews;
- (void)setAnimationOrigin:(int64_t)a3;
- (void)setImage:(id)a3;
@end

@implementation LPAnimationMaskView

- (UIView)imageView
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = objc_retain(*(id *)((char *)&v3->super.super.super.isa
                         + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView));
  swift_release();

  swift_release();

  return (UIView *)v4;
}

- (int64_t)animationOrigin
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = (int64_t *)((char *)v3 + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_animationOrigin);
  swift_beginAccess();
  int64_t v5 = *v4;
  swift_release();

  swift_release();
  return v5;
}

- (void)setAnimationOrigin:(int64_t)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int64_t v5 = self;
  sub_1A36CA408(a3);
  swift_release();
}

- (UIImage)image
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = (id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image);
  swift_beginAccess();
  id v5 = *v4;
  swift_release();

  swift_release();

  return (UIImage *)v5;
}

- (void)setImage:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_1A36CA998(a3);
  swift_release();
}

- (_TtC16LinkPresentation19LPAnimationMaskView)init
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2 = LPAnimationMaskView.init()();
  swift_release();
  return (_TtC16LinkPresentation19LPAnimationMaskView *)v2;
}

- (_TtC16LinkPresentation19LPAnimationMaskView)initWithCoder:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  id v5 = (_TtC16LinkPresentation19LPAnimationMaskView *)sub_1A36CB4D4();
  swift_release();
  return v5;
}

- (void)layoutSubviews
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_1A36CB008();
  swift_release();
}

- (_TtC16LinkPresentation19LPAnimationMaskView)initWithFrame:(CGRect)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC16LinkPresentation19LPAnimationMaskView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_imageView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16LinkPresentation19LPAnimationMaskView_image);
}

@end