@interface MonochromeModel
- (_TtC19ComplicationDisplay15MonochromeModel)init;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
@end

@implementation MonochromeModel

- (_TtC19ComplicationDisplay15MonochromeModel)init
{
  return (_TtC19ComplicationDisplay15MonochromeModel *)MonochromeModel.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__fraction;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBD8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__accent;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BBF0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__background, v6);
  v8 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay15MonochromeModel__style;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D2BC10);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_21E4082F0();

  if (v7)
  {
    sub_21E404F98(0, &qword_267D2BCB0);
    v8 = (void *)sub_21E41F7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = sub_21E40844C();

  if (v8)
  {
    sub_21E404F98(0, &qword_267D2BCB0);
    uint64_t v9 = (void *)sub_21E41F7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  return 0;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  return 0;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = (void *)sub_21E4085B4();

  return v7;
}

- (id)backgroundColorForView:(id)a3
{
  return 0;
}

@end