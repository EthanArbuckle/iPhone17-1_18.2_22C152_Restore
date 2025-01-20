@interface XPCConnection
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
@end

@implementation XPCConnection

- (id)remoteObjectProxy
{
  v2 = *(void **)self->nsXPCConnection;
  swift_retain();
  id v3 = objc_msgSend(v2, sel_remoteObjectProxy);
  sub_1BCA48AC8();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1BCA48C98();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);

  return v4;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return sub_1BC9DBEA4((int)self, (int)a2, a3, (uint64_t)&unk_1F16F1A18, (uint64_t)sub_1BC9DC870, (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_1BC9DBD2C);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return sub_1BC9DBEA4((int)self, (int)a2, a3, (uint64_t)&unk_1F16F19F0, (uint64_t)sub_1BC9DC870, (void (*)(void *__return_ptr, uint64_t, uint64_t))sub_1BC9DBD74);
}

@end