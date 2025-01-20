@interface CDComplicationHostingView
+ (id)async;
+ (id)sync;
- (BOOL)paused;
- (BOOL)rendersAsynchronously;
- (BOOL)shouldAccentDesaturatedView;
- (BOOL)shouldCallRenderStatsHandlerOnMainQueue;
- (CDComplicationHostingView)initWithFrame:(CGRect)a3;
- (CDComplicationHostingView)initWithFrame:(CGRect)a3 async:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSData)viewData;
- (_TtC19ComplicationDisplay20_ComplicationHosting)hosting;
- (id)renderStatsHandler;
- (void)setBounds:(CGRect)a3;
- (void)setFilterProvider:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRenderStatsHandler:(id)a3;
- (void)setShouldAccentDesaturatedView:(BOOL)a3;
- (void)setShouldCallRenderStatsHandlerOnMainQueue:(BOOL)a3;
- (void)setViewData:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)waitForAsyncRendering;
@end

@implementation CDComplicationHostingView

- (CDComplicationHostingView)initWithFrame:(CGRect)a3
{
  return -[CDComplicationHostingView initWithFrame:async:](self, "initWithFrame:async:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CDComplicationHostingView)initWithFrame:(CGRect)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)CDComplicationHostingView;
  v9 = -[CDComplicationHostingView initWithFrame:](&v14, sel_initWithFrame_);
  if (v9)
  {
    v10 = -[_ComplicationHosting initWithFrame:async:]([_TtC19ComplicationDisplay20_ComplicationHosting alloc], "initWithFrame:async:", v4, x, y, width, height);
    hosting = v9->_hosting;
    v9->_hosting = v10;

    v12 = [(_ComplicationHosting *)v9->_hosting view];
    [(CDComplicationHostingView *)v9 addSubview:v12];
  }
  return v9;
}

+ (id)async
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(v2, "initWithFrame:async:", 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v3;
}

+ (id)sync
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(v2, "initWithFrame:async:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v3;
}

- (BOOL)rendersAsynchronously
{
  return [(_ComplicationHosting *)self->_hosting rendersAsynchronously];
}

- (id)renderStatsHandler
{
  return [(_ComplicationHosting *)self->_hosting renderStatsHandler];
}

- (void)setRenderStatsHandler:(id)a3
{
}

- (BOOL)shouldCallRenderStatsHandlerOnMainQueue
{
  return [(_ComplicationHosting *)self->_hosting shouldCallRenderStatsHandlerOnMainQueue];
}

- (void)setShouldCallRenderStatsHandlerOnMainQueue:(BOOL)a3
{
}

- (BOOL)shouldAccentDesaturatedView
{
  return [(_ComplicationHosting *)self->_hosting shouldAccentDesaturatedView];
}

- (void)setShouldAccentDesaturatedView:(BOOL)a3
{
}

- (NSData)viewData
{
  return [(_ComplicationHosting *)self->_hosting viewData];
}

- (void)setViewData:(id)a3
{
}

- (BOOL)paused
{
  return [(_ComplicationHosting *)self->_hosting paused];
}

- (void)setPaused:(BOOL)a3
{
}

- (void)waitForAsyncRendering
{
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CDComplicationHostingView;
  -[CDComplicationHostingView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CDComplicationHostingView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_ComplicationHosting *)self->_hosting view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)setBounds:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CDComplicationHostingView;
  -[CDComplicationHostingView setBounds:](&v13, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CDComplicationHostingView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_ComplicationHosting *)self->_hosting view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_ComplicationHosting sizeThatFits:](self->_hosting, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  return [(_ComplicationHosting *)self->_hosting filterProvider];
}

- (void)setFilterProvider:(id)a3
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)hosting
{
  return self->_hosting;
}

- (void).cxx_destruct
{
}

@end