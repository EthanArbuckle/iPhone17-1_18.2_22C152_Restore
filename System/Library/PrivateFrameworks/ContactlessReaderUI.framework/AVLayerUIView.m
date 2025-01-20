@interface AVLayerUIView
+ (Class)layerClass;
- (_TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView)initWithCoder:(id)a3;
- (_TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView)initWithFrame:(CGRect)a3;
@end

@implementation AVLayerUIView

+ (Class)layerClass
{
  sub_23EE0C4B0();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_looper) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_url;
  uint64_t v9 = sub_23EF03088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AVLayerUIView(0);
  return -[AVLayerUIView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_looper) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_url;
  uint64_t v6 = sub_23EF03088();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AVLayerUIView(0);
  return [(AVLayerUIView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_looper));
  sub_23EDB8D1C((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUIP33_E63B02286265C8C01E0EDA7D0DF4AC0413AVLayerUIView_url, &qword_268C22970);
}

@end