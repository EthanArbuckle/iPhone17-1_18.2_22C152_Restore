@interface LinkTapOverlayView
- (_TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView)initWithCoder:(id)a3;
- (_TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkTapOverlayView

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LinkTapOverlayView();
  v2 = (char *)v7.receiver;
  [(LinkTapOverlayView *)&v7 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView_textContainer];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
    objc_msgSend(v4, sel_setSize_, v5, v6);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView_textContainer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LinkTapOverlayView();
  return -[LinkTapOverlayView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView_textContainer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LinkTapOverlayView();
  return [(LinkTapOverlayView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUIP33_84B88BC285F07FBED29E105A4C9FE90018LinkTapOverlayView_textContainer));
}

@end