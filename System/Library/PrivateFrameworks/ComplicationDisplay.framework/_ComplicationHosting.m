@interface _ComplicationHosting
+ (id)async;
+ (id)sync;
- (BOOL)paused;
- (BOOL)rendersAsynchronously;
- (BOOL)shouldAccentDesaturatedView;
- (BOOL)shouldCallRenderStatsHandlerOnMainQueue;
- (BOOL)supportsComplicationForeground;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSData)viewData;
- (UIView)view;
- (_TtC19ComplicationDisplay20_ComplicationHosting)init;
- (_TtC19ComplicationDisplay20_ComplicationHosting)initWithCoder:(id)a3;
- (_TtC19ComplicationDisplay20_ComplicationHosting)initWithFrame:(CGRect)a3 async:(BOOL)a4;
- (id)renderStatsHandler;
- (void)dealloc;
- (void)setFilterProvider:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRenderStatsHandler:(id)a3;
- (void)setShouldAccentDesaturatedView:(BOOL)a3;
- (void)setShouldCallRenderStatsHandlerOnMainQueue:(BOOL)a3;
- (void)setSupportsComplicationForeground:(BOOL)a3;
- (void)setViewData:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)waitForAsyncRendering;
@end

@implementation _ComplicationHosting

- (CLKMonochromeFilterProvider)filterProvider
{
  v2 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x223C270B0](v2);
  return (CLKMonochromeFilterProvider *)v3;
}

- (void)setFilterProvider:(id)a3
{
}

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view));
}

- (BOOL)rendersAsynchronously
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously);
}

- (id)renderStatsHandler
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21E4100BC;
    aBlock[3] = &block_descriptor_48;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setRenderStatsHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_21E412C7C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_21E4101DC(v7);
}

- (BOOL)shouldCallRenderStatsHandlerOnMainQueue
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldCallRenderStatsHandlerOnMainQueue:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldAccentDesaturatedView
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldAccentDesaturatedView:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)supportsComplicationForeground
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground);
}

- (void)setSupportsComplicationForeground:(BOOL)a3
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground) = a3;
}

+ (id)async
{
  return sub_21E41072C((uint64_t)a1, (uint64_t)a2, 1);
}

+ (id)sync
{
  return sub_21E41072C((uint64_t)a1, (uint64_t)a2, 0);
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)initWithFrame:(CGRect)a3 async:(BOOL)a4
{
  return (_TtC19ComplicationDisplay20_ComplicationHosting *)_s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a4);
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21E412B54();
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController);
  swift_getObjectType();
  v4 = self;
  id v5 = v3;
  sub_21E41F6E0();
  sub_21E41F1A0();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for _ComplicationHosting();
  [(_ComplicationHosting *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_21E412C8C((uint64_t)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController));

  sub_21E4101DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  unint64_t v4 = *(void *)&self->filterProvider[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData];
  sub_21E412374(v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  swift_getObjectType();
  unint64_t v4 = self;
  sub_21E41F160();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSData)viewData
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  uint64_t v3 = 0;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_21E41231C(v5, v4);
    uint64_t v3 = (void *)sub_21E41EE00();
    sub_21E412374(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setViewData:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    uint64_t v3 = (void *)sub_21E41EE10();
    unint64_t v8 = v7;
  }
  else
  {
    double v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  double v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  *double v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_21E412374(v11, v12);
}

- (BOOL)paused
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused;
  swift_beginAccess();
  return *v2;
}

- (void)setPaused:(BOOL)a3
{
  unint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)waitForAsyncRendering
{
  v2 = self;
  sub_21E411268();
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)init
{
  CGSize result = (_TtC19ComplicationDisplay20_ComplicationHosting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateMonochromeColor
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  uint64_t v3 = self;
  _ComplicationHosting.transitionToMonochrome(withFraction:)();
}

@end