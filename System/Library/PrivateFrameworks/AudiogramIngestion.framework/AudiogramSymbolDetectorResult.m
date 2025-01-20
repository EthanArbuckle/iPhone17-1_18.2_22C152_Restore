@interface AudiogramSymbolDetectorResult
+ (CGRect)boundingBoxForSymbols:(id)a3;
- (CGRect)box;
- (CGRect)scaledBoxWithSize:(CGSize)a3 offset:(CGPoint)a4;
- (NSString)description;
- (NSString)labelName;
- (_TtC18AudiogramIngestion29AudiogramSymbolDetectorResult)init;
- (double)confidence;
@end

@implementation AudiogramSymbolDetectorResult

- (CGRect)box
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  double v3 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
  double v4 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
  double v5 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)labelName
{
  swift_bridgeObjectRetain();
  double v2 = (void *)sub_23F120D90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)confidence
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_confidence);
}

- (NSString)description
{
  return (NSString *)sub_23F10F3BC(self, (uint64_t)a2, (void (*)(void))sub_23F10E5F8);
}

- (CGRect)scaledBoxWithSize:(CGSize)a3 offset:(CGPoint)a4
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v7 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box);
  CGFloat v8 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box];
  CGFloat v9 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 8];
  CGFloat v10 = *(double *)&self->box[OBJC_IVAR____TtC18AudiogramIngestion29AudiogramSymbolDetectorResult_box + 16];
  CGAffineTransformMakeTranslation(&v32, -0.5, -0.5);
  v33.origin.CGFloat x = v7;
  v33.origin.CGFloat y = v8;
  v33.size.double width = v9;
  v33.size.double height = v10;
  CGRect v34 = CGRectApplyAffineTransform(v33, &v32);
  v32.a = 1.0;
  v32.b = 0.0;
  v32.c = 0.0;
  v32.d = 1.0;
  v32.tCGFloat x = 0.0;
  v32.tCGFloat y = 0.0;
  CGRect v35 = CGRectApplyAffineTransform(v34, &v32);
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat v13 = v35.size.width;
  CGFloat v14 = v35.size.height;
  CGAffineTransformMakeTranslation(&v32, 0.5, 0.5);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.double width = v13;
  v36.size.double height = v14;
  CGRect v37 = CGRectApplyAffineTransform(v36, &v32);
  CGFloat v15 = v37.origin.x;
  CGFloat v16 = v37.origin.y;
  CGFloat v17 = v37.size.width;
  CGFloat v18 = v37.size.height;
  v19 = self;
  v38.origin.CGFloat x = v15;
  v38.origin.CGFloat y = v16;
  v38.size.double width = v17;
  v38.size.double height = v18;
  CGFloat v20 = width * CGRectGetMinX(v38);
  v39.origin.CGFloat x = v15;
  v39.origin.CGFloat y = v16;
  v39.size.double width = v17;
  v39.size.double height = v18;
  CGFloat v21 = height * CGRectGetMinY(v39);
  v40.origin.CGFloat x = v15;
  v40.origin.CGFloat y = v16;
  v40.size.double width = v17;
  v40.size.double height = v18;
  CGFloat v22 = width * CGRectGetWidth(v40);
  v41.origin.CGFloat x = v15;
  v41.origin.CGFloat y = v16;
  v41.size.double width = v17;
  v41.size.double height = v18;
  v42.size.double height = height * CGRectGetHeight(v41);
  v42.origin.CGFloat x = v20;
  v42.origin.CGFloat y = v21;
  v42.size.double width = v22;
  CGRect v43 = CGRectOffset(v42, a4.x, a4.y);
  CGFloat v23 = v43.origin.x;
  CGFloat v24 = v43.origin.y;
  CGFloat v25 = v43.size.width;
  CGFloat v26 = v43.size.height;

  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

+ (CGRect)boundingBoxForSymbols:(id)a3
{
  type metadata accessor for AudiogramSymbolDetectorResult();
  unint64_t v3 = sub_23F120E60();
  _s18AudiogramIngestion0A20SymbolDetectorResultC21boundingBoxForSymbolsySo6CGRectVSayACGFZ_0(v3);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  swift_bridgeObjectRelease();
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (_TtC18AudiogramIngestion29AudiogramSymbolDetectorResult)init
{
  CGRect result = (_TtC18AudiogramIngestion29AudiogramSymbolDetectorResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end