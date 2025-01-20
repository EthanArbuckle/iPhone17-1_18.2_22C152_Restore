@interface _DPPrio3SumVectorShim
+ (BOOL)isValidNumOfProofs:(int64_t)a3;
+ (BOOL)isValidVDAFType:(unsigned int)a3;
+ (id)shard:(id)a3 parameter:(id)a4 error:(id *)a5;
- (_DPPrio3SumVectorShim)init;
@end

@implementation _DPPrio3SumVectorShim

+ (BOOL)isValidVDAFType:(unsigned int)a3
{
  return a3 == -61437;
}

- (_DPPrio3SumVectorShim)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Prio3SumVectorShim();
  return [(_DPPrio3SumVectorShim *)&v3 init];
}

+ (id)shard:(id)a3 parameter:(id)a4 error:(id *)a5
{
  if (*(_DWORD *)((char *)a4 + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType) == -61437)
  {
    id v6 = a3;
    id v7 = a4;
    sub_1DC5B8E10(v6);
    v9 = v8;

    return v9;
  }
  else
  {
    id v11 = a3;
    id v12 = a4;
    id result = (id)sub_1DC5BFD90();
    __break(1u);
  }
  return result;
}

+ (BOOL)isValidNumOfProofs:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 3;
}

@end