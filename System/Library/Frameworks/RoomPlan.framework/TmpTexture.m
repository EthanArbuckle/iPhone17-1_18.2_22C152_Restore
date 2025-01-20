@interface TmpTexture
- (_TtC8RoomPlan10TmpTexture)init;
@end

@implementation TmpTexture

- (_TtC8RoomPlan10TmpTexture)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan10TmpTexture_texture) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan10TmpTexture_wasUpdated) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TmpTexture();
  return [(TmpTexture *)&v3 init];
}

- (void).cxx_destruct
{
}

@end