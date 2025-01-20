@interface AXInstructionalCellContentViewBridge
- (AXInstructionalCellContentViewBridge)init;
- (id)makeContentCellViewWithTitle:(id)a3 image:(id)a4 imageIgnoresInvertColors:(BOOL)a5 description:(id)a6 linkTitle:(id)a7 linkCallback:(id)a8 closeCallback:(id)a9;
@end

@implementation AXInstructionalCellContentViewBridge

- (id)makeContentCellViewWithTitle:(id)a3 image:(id)a4 imageIgnoresInvertColors:(BOOL)a5 description:(id)a6 linkTitle:(id)a7 linkCallback:(id)a8 closeCallback:(id)a9
{
  BOOL v28 = a5;
  v10 = _Block_copy(a8);
  v11 = _Block_copy(a9);
  uint64_t v12 = sub_38FE0();
  uint64_t v14 = v13;
  uint64_t v15 = sub_38FE0();
  uint64_t v17 = v16;
  uint64_t v18 = sub_38FE0();
  uint64_t v20 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v10;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v11;
  id v23 = a4;
  v24 = self;
  v25 = (void *)sub_30DF4(v12, v14, v23, v28, v15, v17, v18, v20, (uint64_t)sub_30FDC, v21, (uint64_t)sub_3246C, v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v25;
}

- (AXInstructionalCellContentViewBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXInstructionalCellContentViewBridge();
  return [(AXInstructionalCellContentViewBridge *)&v3 init];
}

@end