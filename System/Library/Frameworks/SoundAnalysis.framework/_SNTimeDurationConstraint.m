@interface _SNTimeDurationConstraint
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)durationRange;
- (BOOL)isEqual:(id)a3;
- (NSArray)enumeratedDurations;
- (_SNTimeDurationConstraint)init;
- (_SNTimeDurationConstraint)initWithCoder:(id)a3;
- (_SNTimeDurationConstraint)initWithDurationRange:(id *)a3;
- (_SNTimeDurationConstraint)initWithEnumeratedDurations:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SNTimeDurationConstraint

- (_SNTimeDurationConstraint)initWithEnumeratedDurations:(id)a3
{
  if (a3)
  {
    sub_1DC8A8794();
    unint64_t v3 = sub_1DCB87C38();
  }
  else
  {
    unint64_t v3 = 0;
  }
  return (_SNTimeDurationConstraint *)sub_1DC8A59A4(v3);
}

- (_SNTimeDurationConstraint)initWithDurationRange:(id *)a3
{
  int64_t var3 = a3->var1.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = *(_OWORD *)&a3->var0.var3;
  uint64_t v6 = *(void *)&a3->var1.var1;
  int64_t v7 = var3;
  return (_SNTimeDurationConstraint *)sub_1DC8A5D18(v5);
}

- (id)copyWithZone:(void *)a3
{
  unint64_t v3 = self;
  _SNTimeDurationConstraint.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = _SNTimeDurationConstraint.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = _SNTimeDurationConstraint.isEqual(_:)((uint64_t)v8);

  sub_1DC8A8F50((uint64_t)v8, &qword_1EAA9CAB0);
  return v6;
}

- (_SNTimeDurationConstraint)initWithCoder:(id)a3
{
  return (_SNTimeDurationConstraint *)_SNTimeDurationConstraint.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _SNTimeDurationConstraint.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return sub_1DC8A64AC();
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)durationRange
{
  sub_1DC8A6528((uint64_t)v9);
  int64_t v5 = v12;
  uint64_t v6 = v9[1];
  uint64_t v7 = v11;
  long long v8 = v10;
  retstr->var0.var0 = v9[0];
  *(void *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.int64_t var3 = v8;
  *(void *)&retstr->var1.var1 = v7;
  retstr->var1.int64_t var3 = v5;
  return result;
}

- (NSArray)enumeratedDurations
{
  v2 = self;
  sub_1DC8A65E0();

  sub_1DC8A8794();
  int64_t v3 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_SNTimeDurationConstraint)init
{
}

- (void).cxx_destruct
{
}

@end