@interface LivePhotoView
- (CGSize)intrinsicContentSize;
- (_TtC10StickerKit13LivePhotoView)initWithCoder:(id)a3;
- (_TtC10StickerKit13LivePhotoView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation LivePhotoView

- (void)dealloc
{
  v2 = self;
  sub_245385CD8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit13LivePhotoView_playerObserver;

  sub_245281718((uint64_t)v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_2453FFB38();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_2454006B8();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_245388934();
  v15 = (void *)sub_2453FFA68();

LABEL_8:
  sub_245386300(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_245281718((uint64_t)v18);
}

- (_TtC10StickerKit13LivePhotoView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC10StickerKit13LivePhotoView_playerObserver);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit13LivePhotoView_playerItemContext) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit13LivePhotoView_startPlaybackWhenReady) = 0;
  id v5 = a3;

  result = (_TtC10StickerKit13LivePhotoView *)sub_2454009B8();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit13LivePhotoView_stillImage), sel_size);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC10StickerKit13LivePhotoView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10StickerKit13LivePhotoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end