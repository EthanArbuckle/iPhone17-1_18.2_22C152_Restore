@interface FMPFARSCNView
- (BOOL)drawsCameraImage;
- (NSString)description;
- (_TtC11FMFindingUI13FMPFARSCNView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI13FMPFARSCNView)initWithFrame:(CGRect)a3;
- (_TtC11FMFindingUI13FMPFARSCNView)initWithFrame:(CGRect)a3 options:(id)a4;
- (void)_drawAtTime:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation FMPFARSCNView

- (BOOL)drawsCameraImage
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_24D2BC100(0, (unint64_t *)&qword_2698616A0);
  sub_24D2F9C38();
  sub_24D39CD20();
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_24D39CD10();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for FMPFARSCNView();
  [(FMPFARSCNView *)&v9 touchesBegan:v8 withEvent:v6];

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  v2 = self;
  sub_24D2F9468();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)_drawAtTime:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFARSCNView();
  [(FMPFARSCNView *)&v4 _drawAtTime:a3];
}

- (_TtC11FMFindingUI13FMPFARSCNView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4) {
    uint64_t v8 = sub_24D39CA80();
  }
  else {
    uint64_t v8 = 0;
  }
  return (_TtC11FMFindingUI13FMPFARSCNView *)sub_24D2F960C(v8, x, y, width, height);
}

- (_TtC11FMFindingUI13FMPFARSCNView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = sub_24D39C9A0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_innerIsolationQueue;
  sub_24D2BC100(0, (unint64_t *)&qword_269860F20);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F080], v8);
  v13 = self;
  v14 = (objc_class *)sub_24D39CED0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v12) = v14;
  *(Class *)((char *)&v13->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_internalIsolationQueue) = 0;

  v15 = (objc_class *)type metadata accessor for FMPFARSCNView();
  v17.receiver = v13;
  v17.super_class = v15;
  return -[ARSCNView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11FMFindingUI13FMPFARSCNView)initWithCoder:(id)a3
{
  return (_TtC11FMFindingUI13FMPFARSCNView *)sub_24D2F99FC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_innerIsolationQueue));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI13FMPFARSCNView_internalIsolationQueue);
}

@end