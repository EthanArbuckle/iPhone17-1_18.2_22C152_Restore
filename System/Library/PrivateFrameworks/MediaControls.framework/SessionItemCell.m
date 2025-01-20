@interface SessionItemCell
- (_TtC13MediaControls15SessionItemCell)initWithCoder:(id)a3;
- (_TtC13MediaControls15SessionItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation SessionItemCell

- (_TtC13MediaControls15SessionItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1AE947158();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC13MediaControls15SessionItemCell *)sub_1AE940BE4(a3, (uint64_t)a4, v6);
}

- (_TtC13MediaControls15SessionItemCell)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC13MediaControls15SessionItemCell_viewModel;
  uint64_t v6 = type metadata accessor for SessionItemViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaControls15SessionItemCell_tapGestureRecognizer) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13MediaControls15SessionItemCell_itemView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaControls15SessionItemCell_stylingProvider) = 0;
  id v7 = a3;

  result = (_TtC13MediaControls15SessionItemCell *)sub_1AE9477B8();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A8A960);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for SessionItemCell();
  v9.receiver = self;
  v9.super_class = v6;
  id v7 = self;
  [(SessionItemCell *)&v9 prepareForReuse];
  uint64_t v8 = type metadata accessor for SessionItemViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  (*(void (**)(char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v7->super.super.super.super.isa) + 0x78))(v5);
}

- (void).cxx_destruct
{
  sub_1AE8D5980((uint64_t)self + OBJC_IVAR____TtC13MediaControls15SessionItemCell_viewModel, &qword_1E9A8A960);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemCell_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemCell_itemView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls15SessionItemCell_stylingProvider);
}

@end