@interface _DPPINEParameter
- (_DPPINEParameter)init;
- (_DPPINEParameter)initWithFractionalBitCount:(int64_t)a3 l2NormBound:(float)a4 numOfProofs:(int64_t)a5 wraparoundCheckCount:(int64_t)a6 pineType:(unsigned int)a7;
- (float)l2NormBound;
- (int64_t)fractionalBitCount;
- (int64_t)numOfProofs;
- (int64_t)wraparoundCheckCount;
- (unsigned)pineType;
@end

@implementation _DPPINEParameter

- (int64_t)fractionalBitCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
}

- (float)l2NormBound
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_l2NormBound);
}

- (int64_t)numOfProofs
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_numOfProofs);
}

- (int64_t)wraparoundCheckCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_wraparoundCheckCount);
}

- (unsigned)pineType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_pineType);
}

- (_DPPINEParameter)initWithFractionalBitCount:(int64_t)a3 l2NormBound:(float)a4 numOfProofs:(int64_t)a5 wraparoundCheckCount:(int64_t)a6 pineType:(unsigned int)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_fractionalBitCount) = (Class)a3;
  *(float *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_l2NormBound) = a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_numOfProofs) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_wraparoundCheckCount) = (Class)a6;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPPINEParameter_pineType) = a7;
  v15.receiver = self;
  v15.super_class = ObjectType;
  return [(_DPPINEParameter *)&v15 init];
}

- (_DPPINEParameter)init
{
  result = (_DPPINEParameter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end