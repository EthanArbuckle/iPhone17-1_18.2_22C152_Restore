@interface AUGenericViewInternal
- (AUAudioUnit)auAudioUnit;
- (UIViewController)owningController;
- (_TtC12CoreAudioKit21AUGenericViewInternal)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit21AUGenericViewInternal)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)paramObserverToken;
- (void)removeFromSuperview;
- (void)removeScheduledUpdatesTimer;
- (void)setAuAudioUnit:(id)a3;
- (void)setOwningController:(id)a3;
- (void)setParamObserverToken:(void *)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AUGenericViewInternal

- (AUAudioUnit)auAudioUnit
{
  return (AUAudioUnit *)sub_21E539C1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_auAudioUnit);
}

- (void)setAuAudioUnit:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_auAudioUnit);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_21E538D58();
  sub_21E538F10();
}

- (UIViewController)owningController
{
  return (UIViewController *)sub_21E539C1C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_owningController);
}

- (void)setOwningController:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_owningController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)paramObserverToken
{
  v2 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_paramObserverToken);
  swift_beginAccess();
  return *v2;
}

- (void)setParamObserverToken:(void *)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_paramObserverToken);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC12CoreAudioKit21AUGenericViewInternal)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit21AUGenericViewInternal *)sub_21E53A3F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit21AUGenericViewInternal)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit21AUGenericViewInternal *)sub_21E53A63C(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_21E53AB24((uint64_t)a3);
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_21E53ACC8();
}

- (void)removeScheduledUpdatesTimer
{
  uint64_t v2 = OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_scheduledUpdatesTimer;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_scheduledUpdatesTimer);
  if (v3)
  {
    id v5 = self;
    objc_msgSend(v3, sel_invalidate);
    id v6 = *(Class *)((char *)&self->super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.isa + v2) = 0;
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_auAudioUnit));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_owningController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_collectionView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit21AUGenericViewInternal_scheduledUpdatesTimer));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_21E5B6498();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_21E5B65F8();
  uint64_t v16 = v15;
  sub_21E5B6438();
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_21E53EC78(v18, v14, v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_21E5B6498();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6438();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_21E53EDB4(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

@end