@interface CenteredLabelWithSpinnerCell
- (_TtC5Heart28CenteredLabelWithSpinnerCell)initWithCoder:(id)a3;
- (_TtC5Heart28CenteredLabelWithSpinnerCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
@end

@implementation CenteredLabelWithSpinnerCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  sub_240A47A44(0, &qword_268C9ECF0, MEMORY[0x263F81EE0]);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v19 - v5;
  uint64_t v7 = sub_240BB5AA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_240BB5A60();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240BB5A50();
  v15 = self;
  v16 = (void *)sub_240BB5A40();
  v17 = (objc_class *)type metadata accessor for CenteredLabelWithSpinnerCell();
  v19.receiver = v15;
  v19.super_class = v17;
  [(CenteredLabelWithSpinnerCell *)&v19 _bridgedUpdateConfigurationUsingState:v16];

  sub_240BB5A90();
  id v18 = objc_msgSend(self, sel_systemBackgroundColor);
  sub_240BB5A70();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  MEMORY[0x24560A6A0](v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CenteredLabelWithSpinnerCell();
  id v2 = v6.receiver;
  [(CenteredLabelWithSpinnerCell *)&v6 prepareForReuse];
  id v3 = objc_msgSend(v2, sel_contentView, v6.receiver, v6.super_class);
  type metadata accessor for CenteredLabelWithSpinnerContentView();
  uint64_t v4 = swift_dynamicCastClass();
  if (v4)
  {
    id v5 = *(id *)(v4 + OBJC_IVAR____TtC5Heart35CenteredLabelWithSpinnerContentView_spinner);

    objc_msgSend(v5, sel_startAnimating);
    id v3 = v5;
  }
}

- (_TtC5Heart28CenteredLabelWithSpinnerCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC5Heart28CenteredLabelWithSpinnerCell_item;
  uint64_t v9 = (objc_class *)type metadata accessor for CenteredLabelWithSpinnerCell();
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CenteredLabelWithSpinnerCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5Heart28CenteredLabelWithSpinnerCell)initWithCoder:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC5Heart28CenteredLabelWithSpinnerCell_item;
  objc_super v6 = (objc_class *)type metadata accessor for CenteredLabelWithSpinnerCell();
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(CenteredLabelWithSpinnerCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end