@interface TipCell
- (_TtC11SOSSettings7TipCell)initWithCoder:(id)a3;
- (_TtC11SOSSettings7TipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC11SOSSettings7TipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation TipCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_D174();
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipCell();
  v2 = (char *)v6.receiver;
  [(TipCell *)&v6 prepareForReuse];
  uint64_t v3 = OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView;
  id v4 = *(void **)&v2[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView];
  if (v4)
  {
    objc_msgSend(v4, "removeFromSuperview", v6.receiver, v6.super_class);
    v5 = *(void **)&v2[v3];
  }
  else
  {
    v5 = 0;
  }
  *(void *)&v2[v3] = 0;
}

- (_TtC11SOSSettings7TipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_F760();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC11SOSSettings7TipCell *)sub_CD40(a3, v7, v9, a5);
}

- (_TtC11SOSSettings7TipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_F760();
    *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView] = 0;
    NSString v6 = sub_F750();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView] = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TipCell();
  uint64_t v7 = [(TipCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC11SOSSettings7TipCell)initWithCoder:(id)a3
{
  *(void *)&self->PSTableCell_opaque[OBJC_IVAR____TtC11SOSSettings7TipCell_tipContentView] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TipCell();
  return [(TipCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end