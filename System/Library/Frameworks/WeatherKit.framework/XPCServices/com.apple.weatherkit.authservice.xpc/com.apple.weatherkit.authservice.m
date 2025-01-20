int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v3 = sub_100003BF0();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000033C8(&qword_1000080C8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100003D70;
  v8 = type metadata accessor for AuthServiceAssembly();
  v9 = swift_allocObject();
  *(void *)(v7 + 56) = v8;
  *(void *)(v7 + 64) = sub_10000340C();
  *(void *)(v7 + 32) = v9;
  sub_100003B80();
  swift_allocObject();
  sub_100003B70();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Container.Environment.normal(_:), v3);
  sub_100003C20();
  swift_allocObject();
  qword_100008188 = sub_100003C00();
  [self setSuppressEngagement:1];
  sub_100003C10();
  qword_1000081B8 = (uint64_t)[self serviceListener];
  sub_10000345C(qword_100008190, qword_1000081A8);
  sub_100003CB0();
  v10 = sub_100003B50();
  if (v10)
  {
    qword_1000081C0 = v10;
    v11 = (void *)qword_1000081B8;
    [(id)qword_1000081B8 setDelegate:v10];
    [v11 activate];
    LODWORD(v10) = 0;
  }
  else
  {
    __break(1u);
  }
  return v10;
}

uint64_t sub_1000033C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000340C()
{
  unint64_t result = qword_1000080D0;
  if (!qword_1000080D0)
  {
    type metadata accessor for AuthServiceAssembly();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080D0);
  }
  return result;
}

void *sub_10000345C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000034A0()
{
  sub_100003B90();
  sub_100003CB0();
  sub_100003BC0();
  swift_release();
  swift_release();
  sub_100003BA0();
  sub_100003BB0();

  return swift_release();
}

uint64_t sub_100003544(void *a1)
{
  uint64_t v2 = sub_100003C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000033C8(&qword_100008180);
  __chkstk_darwin();
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000345C(a1, a1[3]);
  unint64_t v8 = sub_100003AA8();
  uint64_t result = sub_100003B40();
  if (result)
  {
    v14[8] = v8;
    v14[9] = &protocol witness table for NSURLSession;
    v14[5] = result;
    uint64_t v10 = sub_100003C70();
    swift_allocObject();
    uint64_t v11 = sub_100003C60();
    v14[3] = v10;
    v14[4] = &protocol witness table for WDSJWTMescalSigner;
    v14[0] = v11;
    sub_10000345C(a1, a1[3]);
    uint64_t v12 = sub_100003C50();
    sub_100003B60();
    uint64_t result = sub_100003AE8((uint64_t)v7, 1, v12);
    if (result != 1)
    {
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for WDSVersion.tokenServiceVersion(_:), v2);
      sub_100003C90();
      swift_allocObject();
      sub_100003C80();
      id v13 = objc_allocWithZone((Class)sub_100003CB0());
      return sub_100003CA0();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000037AC()
{
  uint64_t v0 = sub_100003BE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003AA8();
  sub_100003BC0();
  swift_release();
  sub_100003C50();
  sub_100003BD0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  sub_100003B30();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id sub_100003920()
{
  id v0 = [self defaultSessionConfiguration];
  [v0 setRequestCachePolicy:4];
  id v1 = [self sessionWithConfiguration:v0];

  return v1;
}

uint64_t sub_1000039A0()
{
  sub_1000033C8(&qword_100008178);
  __chkstk_darwin();
  id v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003B10();
  uint64_t v2 = sub_100003B20();
  uint64_t result = sub_100003AE8((uint64_t)v1, 1, v2);
  if (result != 1) {
    return sub_100003C40();
  }
  __break(1u);
  return result;
}

uint64_t sub_100003A5C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for AuthServiceAssembly()
{
  return self;
}

uint64_t sub_100003A90()
{
  return sub_1000034A0();
}

unint64_t sub_100003AA8()
{
  unint64_t result = qword_100008170;
  if (!qword_100008170)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008170);
  }
  return result;
}

uint64_t sub_100003AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100003B10()
{
  return URL.init(string:)();
}

uint64_t sub_100003B20()
{
  return type metadata accessor for URL();
}

uint64_t sub_100003B30()
{
  return Definition.inScope(_:)();
}

uint64_t sub_100003B40()
{
  return dispatch thunk of ResolverType.resolve<A>(_:name:)();
}

uint64_t sub_100003B50()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_100003B60()
{
  return dispatch thunk of ResolverType.resolve<A>(_:)();
}

uint64_t sub_100003B70()
{
  return SingletonPool.init()();
}

uint64_t sub_100003B80()
{
  return type metadata accessor for SingletonPool();
}

uint64_t sub_100003B90()
{
  return ProxyContainer.public.getter();
}

uint64_t sub_100003BA0()
{
  return ProxyContainer.private.getter();
}

uint64_t sub_100003BB0()
{
  return RegistrationContainer.lazy(block:)();
}

uint64_t sub_100003BC0()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_100003BD0()
{
  return RegistrationContainer.register<A>(_:name:factory:)();
}

uint64_t sub_100003BE0()
{
  return type metadata accessor for Scope();
}

uint64_t sub_100003BF0()
{
  return type metadata accessor for Container.Environment();
}

uint64_t sub_100003C00()
{
  return Container.init(bundleAssemblies:assemblies:singletonPool:environment:)();
}

uint64_t sub_100003C10()
{
  return Container.resolver.getter();
}

uint64_t sub_100003C20()
{
  return type metadata accessor for Container();
}

uint64_t sub_100003C30()
{
  return type metadata accessor for WDSVersion();
}

uint64_t sub_100003C40()
{
  return WDSEndpoint.init(url:)();
}

uint64_t sub_100003C50()
{
  return type metadata accessor for WDSEndpoint();
}

uint64_t sub_100003C60()
{
  return WDSJWTMescalSigner.init()();
}

uint64_t sub_100003C70()
{
  return type metadata accessor for WDSJWTMescalSigner();
}

uint64_t sub_100003C80()
{
  return WDSJWTAuthenticatorService.init(session:signer:endpoint:version:timeout:)();
}

uint64_t sub_100003C90()
{
  return type metadata accessor for WDSJWTAuthenticatorService();
}

uint64_t sub_100003CA0()
{
  return WDSJWTAuthenticatorServiceListener.init(delegate:)();
}

uint64_t sub_100003CB0()
{
  return type metadata accessor for WDSJWTAuthenticatorServiceListener();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}