@interface HKLinkSetWrapper
- (BOOL)isEqual:(id)a3;
- (HKLinkSetWrapper)init;
- (HKLinkSetWrapper)initWithLinks:(id)a3;
- (HKLinkSetWrapper)initWithSerializedData:(id)a3 error:(id *)a4;
- (NSArray)elements;
- (NSString)description;
- (id)appendingElement:(id)a3;
- (id)appendingElements:(id)a3;
- (id)insertingElement:(id)a3 index:(int64_t)a4;
- (id)mergingLegacyElementsArray:(id)a3;
- (id)mergingLinkSet:(id)a3;
- (id)movingElementFrom:(int64_t)a3 to:(int64_t)a4;
- (id)removingAll;
- (id)removingAtIndex:(int64_t)a3;
- (id)removingLinksWithUUID:(id)a3;
- (id)replacingElementAt:(int64_t)a3 withElement:(id)a4;
- (id)retargetingLinksWithUUID:(id)a3 newUUID:(id)a4;
- (id)serializedDataWithError:(id *)a3;
- (id)swappingElementsAt:(int64_t)a3 andAt:(int64_t)a4;
- (int64_t)count;
- (int64_t)hash;
@end

@implementation HKLinkSetWrapper

- (HKLinkSetWrapper)initWithLinks:(id)a3
{
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  unint64_t v3 = sub_19C2D9FA8();
  return (HKLinkSetWrapper *)LinkSetWrapper.init(_:)(v3);
}

- (HKLinkSetWrapper)initWithSerializedData:(id)a3 error:(id *)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  uint64_t v13 = sub_19C2D9818();
  unint64_t v15 = v14;

  v16 = self;
  sub_19C287374(v13, v15);
  sub_19C292A1C(&qword_1E93FAF50, sub_19C292F38);
  sub_19C2D9CC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v16 + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v11, v8);

  v20.receiver = v16;
  v20.super_class = ObjectType;
  v17 = [(HKLinkSetWrapper *)&v20 init];
  sub_19C287440(v13, v15);
  return v17;
}

- (id)serializedDataWithError:(id *)a3
{
  uint64_t v4 = sub_19C2D9CA8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = qword_1E93FA4F0;
  uint64_t v9 = self;
  if (v8 != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F59CC8], v4);
  sub_19C292F38(0);
  sub_19C292A1C(&qword_1E93FAF50, sub_19C292F38);
  uint64_t v10 = sub_19C2D9CB8();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  uint64_t v13 = (void *)sub_19C2D97F8();
  sub_19C287440(v10, v12);

  return v13;
}

- (NSArray)elements
{
  sub_19C292F38(0);
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  unint64_t v3 = self;
  sub_19C2D9B88();

  uint64_t v4 = (void *)sub_19C2D9F98();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (int64_t)count
{
  sub_19C292F38(0);
  unint64_t v3 = self;
  int64_t v4 = sub_19C2D9B98();

  return v4;
}

- (id)appendingElement:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v21 - v12;
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v14((char *)&v21 - v12, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v7);
  id v15 = a3;
  v16 = self;
  sub_19C2D9BB8();
  v14(v11, v13, v7);
  v17 = (char *)objc_allocWithZone(ObjectType);
  v14(&v17[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v21.receiver = v17;
  v21.super_class = ObjectType;
  v18 = [(HKLinkSetWrapper *)&v21 init];
  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  v19(v13, v7);

  return v18;
}

- (id)appendingElements:(id)a3
{
  return sub_19C296D4C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))LinkSetWrapper.appendingElements(_:));
}

- (id)insertingElement:(id)a3 index:(int64_t)a4
{
  Class ObjectType = (Class)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  unint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v22 - v12;
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v14((char *)&v22 - v12, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v7);
  id v15 = a3;
  v16 = self;
  sub_19C2D9BC8();
  v14(v11, v13, v7);
  v17 = ObjectType;
  v18 = (char *)objc_allocWithZone(ObjectType);
  v14(&v18[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v24.receiver = v18;
  v24.super_class = v17;
  uint64_t v19 = [(HKLinkSetWrapper *)&v24 init];
  objc_super v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v11, v7);
  v20(v13, v7);

  return v19;
}

- (id)movingElementFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v6 = self;
  id v7 = LinkSetWrapper.movingElement(from:to:)(a3, a4);

  return v7;
}

- (id)removingAtIndex:(int64_t)a3
{
  Class ObjectType = (objc_class *)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v19 - v11;
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v13((char *)&v19 - v11, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v6);
  unint64_t v14 = self;
  sub_19C2D9BD8();
  v13(v10, v12, v6);
  id v15 = (char *)objc_allocWithZone(ObjectType);
  v13(&v15[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v10, v6);
  v19.receiver = v15;
  v19.super_class = ObjectType;
  v16 = [(HKLinkSetWrapper *)&v19 init];
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  v17(v12, v6);

  return v16;
}

- (id)removingLinksWithUUID:(id)a3
{
  Class ObjectType = (Class)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v24 = sub_19C2D9948();
  uint64_t v12 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  unint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C2D9928();
  id v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v15(v11, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v5);
  v25 = v14;
  uint64_t v22 = self;
  sub_19C2D9C28();
  v15(v9, v11, v5);
  v16 = ObjectType;
  v17 = (char *)objc_allocWithZone(ObjectType);
  v15(&v17[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v9, v5);
  v26.receiver = v17;
  v26.super_class = v16;
  v18 = [(HKLinkSetWrapper *)&v26 init];
  objc_super v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v9, v5);
  v19(v11, v5);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v24);

  return v18;
}

- (id)removingAll
{
  Class ObjectType = (objc_class *)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v12((char *)&v18 - v10, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v5);
  uint64_t v13 = self;
  sub_19C2D9C38();
  v12(v9, v11, v5);
  unint64_t v14 = (char *)objc_allocWithZone(ObjectType);
  v12(&v14[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v9, v5);
  v18.receiver = v14;
  v18.super_class = ObjectType;
  id v15 = [(HKLinkSetWrapper *)&v18 init];
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);

  return v15;
}

- (id)replacingElementAt:(int64_t)a3 withElement:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = LinkSetWrapper.replacingElementAt(_:withElement:)(a3, (uint64_t)v6);

  return v8;
}

- (id)retargetingLinksWithUUID:(id)a3 newUUID:(id)a4
{
  uint64_t v5 = sub_19C2D9948();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v16 - v10;
  sub_19C2D9928();
  sub_19C2D9928();
  uint64_t v12 = self;
  id v13 = LinkSetWrapper.retargetingLinksWithUUID(_:newUUID:)((uint64_t)v11, (uint64_t)v9);

  unint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);

  return v13;
}

- (id)swappingElementsAt:(int64_t)a3 andAt:(int64_t)a4
{
  Class ObjectType = (objc_class *)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v13 = (char *)&v20 - v12;
  unint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v14((char *)&v20 - v12, (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet, v7);
  id v15 = self;
  sub_19C2D9BF8();
  v14(v11, v13, v7);
  uint64_t v16 = (char *)objc_allocWithZone(ObjectType);
  v14(&v16[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v20.receiver = v16;
  v20.super_class = ObjectType;
  v17 = [(HKLinkSetWrapper *)&v20 init];
  objc_super v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  v18(v13, v7);

  return v17;
}

- (id)mergingLinkSet:(id)a3
{
  Class ObjectType = (objc_class *)swift_getObjectType();
  sub_19C292F38(0);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v13 = (char *)&v21 - v12;
  sub_19C292A1C(&qword_1E93FAF50, sub_19C292F38);
  id v14 = a3;
  id v15 = self;
  sub_19C2D9CD8();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v16(v11, v13, v7);
  v17 = (char *)objc_allocWithZone(ObjectType);
  v16(&v17[OBJC_IVAR___HKLinkSetWrapper_orderedSet], v11, v7);
  v21.receiver = v17;
  v21.super_class = ObjectType;
  objc_super v18 = [(HKLinkSetWrapper *)&v21 init];
  objc_super v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  v19(v13, v7);

  return v18;
}

- (id)mergingLegacyElementsArray:(id)a3
{
  return sub_19C296D4C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))LinkSetWrapper.mergingLegacyElementsArray(_:));
}

- (NSString)description
{
  sub_19C292F38(0);
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  unint64_t v3 = self;
  sub_19C2D9B88();
  MEMORY[0x19F393FE0]();

  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_19C2D9E98();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  return sub_19C2970BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))LinkSetWrapper.isEqual(_:));
}

- (int64_t)hash
{
  sub_19C292F38(0);
  type metadata accessor for UserDomainConceptLinkStructWrapper(0);
  unint64_t v3 = self;
  sub_19C2D9B88();
  sub_19C292A1C(&qword_1E93FAF70, (void (*)(uint64_t))type metadata accessor for UserDomainConceptLinkStructWrapper);
  int64_t v4 = sub_19C2DA008();

  swift_bridgeObjectRelease();
  return v4;
}

- (HKLinkSetWrapper)init
{
  result = (HKLinkSetWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___HKLinkSetWrapper_orderedSet;
  sub_19C292F38(0);
  int64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end