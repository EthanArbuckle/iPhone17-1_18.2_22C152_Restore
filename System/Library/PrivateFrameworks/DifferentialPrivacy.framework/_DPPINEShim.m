@interface _DPPINEShim
+ (BOOL)isValidNumOfProofs:(unint64_t)a3;
+ (BOOL)isValidPINEType:(unint64_t)a3;
+ (BOOL)isValidWraparoundCheckCount:(unint64_t)a3;
+ (id)shard:(id)a3 parameter:(id)a4 error:(id *)a5;
- (_DPPINEShim)init;
@end

@implementation _DPPINEShim

- (_DPPINEShim)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PINEShim();
  return [(_DPPINEShim *)&v3 init];
}

+ (id)shard:(id)a3 parameter:(id)a4 error:(id *)a5
{
  int v6 = *(_DWORD *)((char *)a4 + OBJC_IVAR____DPPINEParameter_pineType);
  switch(v6)
  {
    case -61434:
      id v7 = a3;
      id v8 = a4;
      uint64_t v9 = sub_1DC5B5CCC(v7, (uint64_t)v8);
      break;
    case -61435:
      id v7 = a3;
      id v8 = a4;
      uint64_t v9 = sub_1DC5B58C8(v7, (uint64_t)v8);
      break;
    case -61436:
      id v7 = a3;
      id v8 = a4;
      uint64_t v9 = sub_1DC5B54C4(v7, (uint64_t)v8);
      break;
    default:
      id v12 = a3;
      id v13 = a4;
      id result = (id)sub_1DC5BFD90();
      __break(1u);
      return result;
  }
  v10 = (void *)v9;

  return v10;
}

+ (BOOL)isValidPINEType:(unint64_t)a3
{
  if (HIDWORD(a3)) {
    __break(1u);
  }
  else {
    LOBYTE(a1) = (a3 + 61436) < 3;
  }
  return (char)a1;
}

+ (BOOL)isValidNumOfProofs:(unint64_t)a3
{
  return a3 - 2 < 4;
}

+ (BOOL)isValidWraparoundCheckCount:(unint64_t)a3
{
  return a3 > 0x1D;
}

@end