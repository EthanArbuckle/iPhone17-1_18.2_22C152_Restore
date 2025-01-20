@interface IDSHKDFWrapper
+ (id)deriveKeyMaterialFrom:(id)a3 info:(id)a4;
+ (id)deriveRandomDataFrom:(id)a3 info:(id)a4;
- (_TtC17identityservicesd14IDSHKDFWrapper)init;
@end

@implementation IDSHKDFWrapper

+ (id)deriveKeyMaterialFrom:(id)a3 info:(id)a4
{
  return sub_1004863B8((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_100486B48);
}

+ (id)deriveRandomDataFrom:(id)a3 info:(id)a4
{
  return sub_1004863B8((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))sub_100486D94);
}

- (_TtC17identityservicesd14IDSHKDFWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSHKDFWrapper();
  return [(IDSHKDFWrapper *)&v3 init];
}

@end