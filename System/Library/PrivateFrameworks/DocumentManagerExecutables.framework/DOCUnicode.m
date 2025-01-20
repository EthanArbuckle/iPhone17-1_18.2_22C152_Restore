@interface DOCUnicode
+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginFSI;
+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginLRI;
+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginRLI;
+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateEnd;
+ (_TtC26DocumentManagerExecutables10DOCUnicode)horizontalEllipsis;
+ (_TtC26DocumentManagerExecutables10DOCUnicode)nonBreakingSpace;
+ (_TtC26DocumentManagerExecutables10DOCUnicode)nonBreakingSpace_zeroWidth;
+ (id)nonBreakingSpaceWithZeroWidth:(BOOL)a3;
+ (id)uc:(id)a3;
+ (int64_t)layoutDirectionForUIDirection:(int64_t)a3;
- (_TtC26DocumentManagerExecutables10DOCUnicode)init;
@end

@implementation DOCUnicode

- (_TtC26DocumentManagerExecutables10DOCUnicode)init
{
  result = (_TtC26DocumentManagerExecutables10DOCUnicode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)uc:(id)a3
{
  uint64_t v3 = sub_22BE92CD8();
  uint64_t v5 = v4;
  v6 = (objc_class *)type metadata accessor for DOCUnicode();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = (uint64_t *)&v7[OBJC_IVAR____TtC26DocumentManagerExecutables10DOCUnicode_rawValue];
  uint64_t *v8 = v3;
  v8[1] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)horizontalEllipsis
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_26AEFFC38, (void **)&qword_26AEFFA68);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)nonBreakingSpace
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_268486700, (void **)&qword_268487228);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)nonBreakingSpace_zeroWidth
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_268486708, (void **)&qword_268487230);
}

+ (id)nonBreakingSpaceWithZeroWidth:(BOOL)a3
{
  if (a3)
  {
    if (qword_268486708 != -1) {
      swift_once();
    }
    uint64_t v3 = &qword_268487230;
  }
  else
  {
    if (qword_268486700 != -1) {
      swift_once();
    }
    uint64_t v3 = &qword_268487228;
  }
  uint64_t v4 = (void *)*v3;

  return v4;
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginLRI
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_268486710, (void **)&qword_268487238);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginRLI
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_268486718, (void **)&qword_268487240);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginFSI
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_268486720, (void **)&qword_268487248);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateEnd
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_22BE16A54((uint64_t)a1, (uint64_t)a2, &qword_268486728, (void **)&qword_268487250);
}

+ (int64_t)layoutDirectionForUIDirection:(int64_t)a3
{
  if (a3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

@end