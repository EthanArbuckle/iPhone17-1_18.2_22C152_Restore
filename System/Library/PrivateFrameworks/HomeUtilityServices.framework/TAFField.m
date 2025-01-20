@interface TAFField
- (BOOL)isSecure;
- (BOOL)required;
- (NSString)formKey;
- (NSString)hintText;
- (NSString)label;
- (NSString)regex;
- (NSString)textContextType;
- (NSString)type;
- (_TtC19HomeUtilityServices8TAFField)init;
- (_TtC19HomeUtilityServices8TAFField)initWithType:(id)a3 label:(id)a4 formKey:(id)a5 textContextType:(id)a6 isSecure:(BOOL)a7 maxCharacterCount:(int64_t)a8 minCharacterCount:(int64_t)a9 regex:(id)a10 required:(BOOL)a11;
- (int64_t)maxCharacterCount;
- (int64_t)minCharacterCount;
@end

@implementation TAFField

- (NSString)type
{
  return (NSString *)sub_25278CACC();
}

- (NSString)label
{
  return (NSString *)sub_25278CACC();
}

- (NSString)formKey
{
  return (NSString *)sub_25278CACC();
}

- (NSString)hintText
{
  return (NSString *)sub_25278CACC();
}

- (NSString)textContextType
{
  return (NSString *)sub_25278CACC();
}

- (BOOL)isSecure
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_isSecure);
}

- (int64_t)maxCharacterCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_maxCharacterCount);
}

- (int64_t)minCharacterCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_minCharacterCount);
}

- (NSString)regex
{
  return (NSString *)sub_25278CACC();
}

- (BOOL)required
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices8TAFField_required);
}

- (_TtC19HomeUtilityServices8TAFField)initWithType:(id)a3 label:(id)a4 formKey:(id)a5 textContextType:(id)a6 isSecure:(BOOL)a7 maxCharacterCount:(int64_t)a8 minCharacterCount:(int64_t)a9 regex:(id)a10 required:(BOOL)a11
{
  uint64_t v11 = sub_2528312A8();
  uint64_t v13 = v12;
  uint64_t v14 = sub_2528312A8();
  uint64_t v16 = v15;
  uint64_t v17 = sub_2528312A8();
  uint64_t v19 = v18;
  uint64_t v20 = sub_2528312A8();
  uint64_t v22 = v21;
  uint64_t v23 = sub_2528312A8();
  return (_TtC19HomeUtilityServices8TAFField *)sub_25278CB84(v11, v13, v14, v16, v17, v19, v20, v22, a7, a8, a9, v23, v24, a11);
}

- (_TtC19HomeUtilityServices8TAFField)init
{
  result = (_TtC19HomeUtilityServices8TAFField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end