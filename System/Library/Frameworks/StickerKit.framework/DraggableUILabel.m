@interface DraggableUILabel
- (_TtC10StickerKit16DraggableUILabel)initWithCoder:(id)a3;
- (_TtC10StickerKit16DraggableUILabel)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation DraggableUILabel

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_24523B830();
  sub_24523B870();
  uint64_t v6 = sub_2453FFF98();
  id v7 = a4;
  v8 = self;
  sub_2452390E4(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_24523B830();
  sub_24523B870();
  sub_2453FFF98();
  id v7 = self;
  id v8 = a4;
  v9 = (void *)sub_2453FFF88();
  v12.receiver = v7;
  v12.super_class = ObjectType;
  [(DraggableUILabel *)&v12 touchesMoved:v9 withEvent:v8];

  uint64_t v10 = MEMORY[0x2456A0530]((char *)v7 + OBJC_IVAR____TtC10StickerKit16DraggableUILabel_touchDelegate);
  if (v10)
  {
    v11 = (void *)v10;
    sub_24523BC6C();

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC10StickerKit16DraggableUILabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[UIKeyboardEmojiDraggableView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKit16DraggableUILabel)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(DraggableUILabel *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end