@interface AXUIInstructionalCellContentViewBridge
- (AXUIInstructionalCellContentViewBridge)init;
- (id)makeContentViewControllerWithTitle:(id)a3 image:(id)a4 imageIgnoresInvertColors:(BOOL)a5 description:(id)a6 linkTitle:(id)a7 tipType:(int64_t)a8 linkCallback:(id)a9 closeCallback:(id)a10;
@end

@implementation AXUIInstructionalCellContentViewBridge

- (id)makeContentViewControllerWithTitle:(id)a3 image:(id)a4 imageIgnoresInvertColors:(BOOL)a5 description:(id)a6 linkTitle:(id)a7 tipType:(int64_t)a8 linkCallback:(id)a9 closeCallback:(id)a10
{
  v34 = self;
  uint64_t v35 = a8;
  BOOL v36 = a5;
  id v33 = a4;
  uint64_t v11 = sub_247340AB0();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = type metadata accessor for AXTipCellContentView(0);
  MEMORY[0x270FA5388](v12 - 8);
  v14 = (uint64_t *)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = _Block_copy(a9);
  v16 = _Block_copy(a10);
  uint64_t v32 = sub_247341590();
  uint64_t v18 = v17;
  uint64_t v31 = sub_247341590();
  uint64_t v20 = v19;
  if (a7)
  {
    uint64_t v21 = sub_247341590();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
  }
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v15;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v26 = v33;
  v27 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2473007B4(v32, v18, v31, v20, v26, v36, v21, v23, v14, v35, (uint64_t)sub_2473060E0, v24, (uint64_t)sub_2473067B8, v25);
  id v28 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269244D08));
  v29 = (void *)sub_247340920();
  sub_247340AA0();
  sub_247340910();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v29;
}

- (AXUIInstructionalCellContentViewBridge)init
{
  v3 = (uint64_t *)((char *)self + OBJC_IVAR___AXUIInstructionalCellContentViewBridge__colorScheme);
  uint64_t *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692431D0);
  swift_storeEnumTagMultiPayload();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AXUIInstructionalCellContentViewBridge(0);
  return [(AXUIInstructionalCellContentViewBridge *)&v5 init];
}

- (void).cxx_destruct
{
}

@end