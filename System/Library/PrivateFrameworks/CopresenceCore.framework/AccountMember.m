@interface AccountMember
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_TtC14CopresenceCore13AccountMember)init;
- (_TtC14CopresenceCore13AccountMember)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AccountMember

- (_TtC14CopresenceCore13AccountMember)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountMember();
  return [(AccountMember *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  return @objc AddressableMember.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))AccountMember.isEqual(_:));
}

- (int64_t)hash
{
  return Hasher.finalize()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14CopresenceCore13AccountMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)MEMORY[0x1B3EA1B00](0x416C61636F4C7369, 0xEE00746E756F6363);
  unsigned __int8 v7 = objc_msgSend(v4, sel_decodeBoolForKey_, v6);

  *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount) = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for AccountMember();
  v8 = [(AccountMember *)&v10 init];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount);
  id v5 = a3;
  v6 = self;
  id v7 = (id)MEMORY[0x1B3EA1B00](0x416C61636F4C7369, 0xEE00746E756F6363);
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);
}

@end