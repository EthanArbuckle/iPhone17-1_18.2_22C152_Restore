@interface CAAUSettingsView
- (_TtC12CoreAudioKit16CAAUSettingsView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit16CAAUSettingsView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation CAAUSettingsView

- (_TtC12CoreAudioKit16CAAUSettingsView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16CAAUSettingsView *)sub_21E59F2F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16CAAUSettingsView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit16CAAUSettingsView *)sub_21E59F45C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16CAAUSettingsView_bandSelector));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit16CAAUSettingsView_genericView);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21E5B6498();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6438();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_21E59FCD8(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_21E5B6498();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E5B6438();
  id v11 = a3;
  v12 = self;
  sub_21E59FDF4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end