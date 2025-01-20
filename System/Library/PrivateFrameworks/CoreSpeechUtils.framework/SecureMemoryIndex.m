@interface SecureMemoryIndex
- (NSString)description;
- (SecureMemoryIndex)init;
- (id)memoryIndexes;
- (int64_t)indexCount;
- (void)dealloc;
- (void)insertWithLabel:(id)a3 resource:(id)a4;
@end

@implementation SecureMemoryIndex

- (SecureMemoryIndex)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SecureMemoryIndex_indexData) = (Class)MEMORY[0x263F8EE80];
  v3.receiver = self;
  v3.super_class = (Class)SecureMemoryIndex;
  return [(SecureMemoryIndex *)&v3 init];
}

- (void)dealloc
{
  uint64_t v2 = qword_2697ED9C8;
  objc_super v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24C78B7A0();
  __swift_project_value_buffer(v4, (uint64_t)qword_2697EDA08);
  os_log_type_t v5 = sub_24C78B9E0();
  sub_24C772D54(v5, 0, 0xD000000000000027, 0x800000024C78F640, 20, 0xD000000000000018, 0x800000024C78F670);
  v6.receiver = v3;
  v6.super_class = (Class)SecureMemoryIndex;
  [(SecureMemoryIndex *)&v6 dealloc];
}

- (void).cxx_destruct
{
}

- (id)memoryIndexes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_24C78B7B0();
  swift_bridgeObjectRelease();
  return v2;
}

- (NSString)description
{
  uint64_t v2 = self;
  SecureMemoryIndex.description.getter();

  objc_super v3 = (void *)sub_24C78B7F0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)insertWithLabel:(id)a3 resource:(id)a4
{
  uint64_t v6 = sub_24C78B800();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  uint64_t v11 = sub_24C78B6E0();
  unint64_t v13 = v12;

  v14 = (uint64_t *)((char *)v10 + OBJC_IVAR___SecureMemoryIndex_indexData);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24C775B88(v11, v13);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v14;
  uint64_t *v14 = 0x8000000000000000;
  sub_24C783D14(v11, v13, v6, v8, isUniquelyReferenced_nonNull_native);
  uint64_t *v14 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_24C775B30(v11, v13);

  swift_bridgeObjectRelease();
}

- (int64_t)indexCount
{
  uint64_t v2 = (char *)self + OBJC_IVAR___SecureMemoryIndex_indexData;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16);
}

@end