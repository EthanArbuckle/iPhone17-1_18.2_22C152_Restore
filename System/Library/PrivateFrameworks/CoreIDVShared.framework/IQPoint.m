@interface IQPoint
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC13CoreIDVShared7IQPoint)init;
- (_TtC13CoreIDVShared7IQPoint)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IQPoint

+ (BOOL)supportsSecureCoding
{
  return byte_1EA843441;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA843441 = a3;
}

- (_TtC13CoreIDVShared7IQPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1D7A9BF98();
  objc_msgSend(v4, sel_decodeFloatForKey_, v6);
  int v8 = v7;

  *(_DWORD *)((char *)&v5->super.isa + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_x) = v8;
  v9 = (void *)sub_1D7A9BF98();
  objc_msgSend(v4, sel_decodeFloatForKey_, v9);
  int v11 = v10;

  *(_DWORD *)((char *)&v5->super.isa + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_y) = v11;
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for IQPoint();
  v12 = [(IQPoint *)&v14 init];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (int *)((char *)self + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_x);
  swift_beginAccess();
  int v6 = *v5;
  id v7 = a3;
  int v8 = self;
  v9 = (void *)sub_1D7A9BF98();
  LODWORD(v10) = v6;
  objc_msgSend(v7, sel_encodeFloat_forKey_, v9, v10);

  int v11 = (int *)((char *)v8 + OBJC_IVAR____TtC13CoreIDVShared7IQPoint_y);
  swift_beginAccess();
  int v12 = *v11;
  v13 = (void *)sub_1D7A9BF98();
  LODWORD(v14) = v12;
  objc_msgSend(v7, sel_encodeFloat_forKey_, v13, v14);
}

- (NSString)debugDescription
{
  return (NSString *)sub_1D78D96A0(self, (uint64_t)a2, (void (*)(void))sub_1D78D8860);
}

- (_TtC13CoreIDVShared7IQPoint)init
{
  result = (_TtC13CoreIDVShared7IQPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end