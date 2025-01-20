@interface XPCConnection
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
@end

@implementation XPCConnection

- (id)remoteObjectProxy
{
  v2 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 11);
  uint64_t v3 = swift_retain();
  v4 = (void *)v2(v3);
  id v5 = objc_msgSend(v4, sel_remoteObjectProxy);

  sub_20B97A6B8();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_20B97A908();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 11);
  uint64_t v7 = swift_retain();
  v8 = (void *)v6(v7);
  v15 = sub_20B96D484;
  uint64_t v16 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_20B93C390;
  v14 = &block_descriptor_17;
  v9 = _Block_copy(v13);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v8, sel_remoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_20B97A6B8();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v13, (uint64_t)v14);
  v11 = (void *)sub_20B97A908();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);

  return v11;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 11);
  uint64_t v7 = swift_retain();
  v8 = (void *)v6(v7);
  v15 = sub_20B96D484;
  uint64_t v16 = v5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_20B93C390;
  v14 = &block_descriptor_10;
  v9 = _Block_copy(v13);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v8, sel_synchronousRemoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_20B97A6B8();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v13, (uint64_t)v14);
  v11 = (void *)sub_20B97A908();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);

  return v11;
}

@end