@interface ContactsButtonSlotView
- (CGRect)frame;
- (_TtC10ContactsUI22ContactsButtonSlotView)init;
- (_TtC10ContactsUI22ContactsButtonSlotView)initWithCoder:(id)a3;
- (_TtC10ContactsUI22ContactsButtonSlotView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation ContactsButtonSlotView

- (_TtC10ContactsUI22ContactsButtonSlotView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB22D0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  uint64_t v11 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  if (qword_1E913B730 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_18B984398();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1E914D318);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))((char *)v10 + v11, v13, v12);
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_slotMaker) = 0;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  return -[ContactsButtonSlotView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10ContactsUI22ContactsButtonSlotView)init
{
  uint64_t v3 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView;
  id v4 = objc_allocWithZone(MEMORY[0x1E4FB22D0]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  if (qword_1E913B730 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_18B984398();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1E914D318);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))((char *)v5 + v6, v8, v7);
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_slotMaker) = 0;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  return -[ContactsButtonSlotView initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC10ContactsUI22ContactsButtonSlotView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB22D0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  if (qword_1E913B730 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_18B984398();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1E914D318);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))((char *)self + v8, v10, v9);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_slotMaker) = 0;

  result = (_TtC10ContactsUI22ContactsButtonSlotView *)sub_18B986768();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  [(ContactsButtonSlotView *)&v6 frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContactsButtonSlotView(0);
  id v7 = v8.receiver;
  -[ContactsButtonSlotView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  sub_18B6BC568();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_internalSlotView));
  double v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI22ContactsButtonSlotView_logger;
  uint64_t v4 = sub_18B984398();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
}

@end