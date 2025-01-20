@interface DraggableLabel.Coordinator
- (_TtCV10StickerKit14DraggableLabel11Coordinator)init;
- (void)dragDidEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)longPressGestureRecognized:(id)a3;
@end

@implementation DraggableLabel.Coordinator

- (void)longPressGestureRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_245239C08(v4);
}

- (void)dragDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  uint64_t v6 = type metadata accessor for DraggableLabel(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24523B174((uint64_t)self + OBJC_IVAR____TtCV10StickerKit14DraggableLabel11Coordinator_control, (uint64_t)v9);
  v10 = &v9[*(int *)(v7 + 36)];
  uint64_t v11 = *((void *)v10 + 1);
  char v12 = v10[32];
  uint64_t v17 = *(void *)v10;
  uint64_t v18 = v11;
  long long v19 = *((_OWORD *)v10 + 1);
  char v20 = v12;
  v15[0] = 0;
  v15[1] = 0;
  char v16 = 2;
  id v13 = a3;
  v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED0CA0);
  sub_2453FF0F8();
  sub_24523B1D8((uint64_t)v9);
}

- (_TtCV10StickerKit14DraggableLabel11Coordinator)init
{
  result = (_TtCV10StickerKit14DraggableLabel11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24523B1D8((uint64_t)self + OBJC_IVAR____TtCV10StickerKit14DraggableLabel11Coordinator_control);

  swift_unknownObjectWeakDestroy();
}

@end