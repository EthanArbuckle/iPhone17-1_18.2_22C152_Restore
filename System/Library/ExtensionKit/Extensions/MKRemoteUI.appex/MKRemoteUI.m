uint64_t sub_1000038E8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100003948()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  v5 = (void *)swift_allocObject();
  uint64_t v6 = *(void *)(v1 + 80);
  v5[2] = v6;
  uint64_t v7 = *(void *)(v1 + 88);
  v5[3] = v7;
  v5[4] = v4;
  swift_bridgeObjectRetain();
  swift_retain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v2, v3, sub_100005A28, v0, sub_100005A68, v5, v6, v7);
}

uint64_t sub_100003A58(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  v9 = (char *)&v13 - v8;
  (*(void (**)(void))(v7 + 32))();
  uint64_t v10 = *(void *)(v1 + 88);
  sub_100010244(v6, v2, v10);
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  sub_100010244(v9, v2, v10);
  return ((uint64_t (*)(char *, uint64_t))v11)(v9, v2);
}

BOOL sub_100003BB4(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v3 = [self interfaceWithProtocol:&OBJC_PROTOCOL___MKRemoteUIAccessoryPlaceCardExtensionInterface];
    [a1 setExportedInterface:v3];

    [a1 setExportedObject:Strong];
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100012BD0();
    sub_1000057F4(v4, (uint64_t)qword_10001E068);
    uint64_t v5 = sub_100012BB0();
    os_log_type_t v6 = sub_100013060();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "extn full-accessory scene connection resume", v7, 2u);
      swift_slowDealloc();
    }

    [a1 resume];
    id v8 = objc_allocWithZone((Class)GEOApplicationAuditToken);
    swift_retain();
    id v9 = [v8 initWithNSXPCConnection:a1];
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100012BD0();
    sub_1000057F4(v11, (uint64_t)qword_10001E068);
    v12 = sub_100012BB0();
    os_log_type_t v13 = sub_100013060();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "extn full-accessory scene connection: self unavailable", v14, 2u);
      swift_slowDealloc();
    }
  }
  return Strong != 0;
}

uint64_t sub_100003F04(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v21 = a3;
  uint64_t v7 = *v4;
  uint64_t v8 = sub_100012FB0();
  uint64_t v23 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100012FD0();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  os_log_type_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  if (a1) {
    *(void *)(v14 + 16) = [objc_allocWithZone((Class)MKMapItem) initWithGeoMapItem:a1 isPlaceHolderPlace:0];
  }
  sub_100005638();
  v15 = (void *)sub_100013080();
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = *(void *)(v7 + 80);
  *(void *)(v17 + 24) = *(void *)(v7 + 88);
  *(void *)(v17 + 32) = v16;
  *(void *)(v17 + 40) = v14;
  *(_DWORD *)(v17 + 48) = a2;
  *(void *)(v17 + 56) = v21;
  aBlock[4] = sub_1000059B0;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_100018F38;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005874(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  return swift_release();
}

void sub_100004278(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100012BD0();
    sub_1000057F4(v5, (uint64_t)qword_10001E068);
    swift_retain_n();
    os_log_type_t v6 = sub_100012BB0();
    os_log_type_t v7 = sub_100013050();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      v24[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136380675;
      swift_beginAccess();
      uint64_t v9 = *(void **)(a2 + 16);
      id v10 = v9;
      uint64_t v11 = sub_10000B5AC(v9);
      sub_100012000(v11, v12, v24);
      sub_1000130A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "extn full-accessory scene configure with item: %{private}s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v17 = *(void *)(v4 + 48);
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    v24[0] = v17;
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    uint64_t v19 = *(void *)(v4 + 48);
    uint64_t v20 = swift_getKeyPath();
    __chkstk_darwin(v20);
    v24[0] = v19;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_beginAccess();
    uint64_t v21 = *(void **)(a2 + 16);
    uint64_t v22 = swift_getKeyPath();
    __chkstk_darwin(v22);
    id v23 = v21;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100012BD0();
    sub_1000057F4(v13, (uint64_t)qword_10001E068);
    uint64_t v14 = sub_100012BB0();
    os_log_type_t v15 = sub_100013070();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "extn full-accessory scene configure without self", v16, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100004778(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5)
{
  id v8 = a3;
  swift_retain();
  sub_100003F04((uint64_t)a3, a4, a5);

  return swift_release();
}

uint64_t sub_1000047F0(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = sub_100012FB0();
  uint64_t v20 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100012FD0();
  uint64_t v11 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005638();
  uint64_t v14 = (void *)sub_100013080();
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = *(void *)(v7 + 80);
  *(void *)(v16 + 24) = *(void *)(v7 + 88);
  *(void *)(v16 + 32) = v15;
  *(double *)(v16 + 40) = a3;
  *(void *)(v16 + 48) = a1;
  *(void *)(v16 + 56) = a2;
  aBlock[4] = sub_1000058FC;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_100018EC0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005874(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v19);
}

void sub_100004B14()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_100012BD0();
    sub_1000057F4(v0, (uint64_t)qword_10001E068);
    uint64_t v1 = sub_100012BB0();
    os_log_type_t v2 = sub_100013060();
    if (os_log_type_enabled(v1, v2))
    {
      id v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v3 = 134217984;
      sub_1000130A0();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "extn full-accessory fetchPreferredContentSize for %f", v3, 0xCu);
      swift_slowDealloc();
    }

    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    swift_retain();
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100012BD0();
    sub_1000057F4(v5, (uint64_t)qword_10001E068);
    os_log_type_t v6 = sub_100012BB0();
    os_log_type_t v7 = sub_100013070();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "extn full-accessory fetchPreferredContentSize without self", v8, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100004E10(int a1, int a2, void *aBlock, double a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_1000047F0((uint64_t)sub_100005AD0, v6, a4);
  swift_release();

  return swift_release();
}

uint64_t sub_100004EB0(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_100012FB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100012FD0();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005638();
  uint64_t v11 = (void *)sub_100013080();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v3 + 80);
  v13[3] = *(void *)(v3 + 88);
  v13[4] = v12;
  v13[5] = a1;
  aBlock[4] = sub_1000056E8;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_100018E70;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005874(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

void sub_1000051B0()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100012BD0();
    sub_1000057F4(v1, (uint64_t)qword_10001E068);
    os_log_type_t v2 = sub_100012BB0();
    os_log_type_t v3 = sub_100013070();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "extn full-accessory scene update interface style without self", v4, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000053B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  sub_100004EB0(a3);

  return swift_release();
}

uint64_t sub_1000053F8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_100005428()
{
  sub_1000053F8();

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for FullAccessoryPlaceCardScene()
{
  return sub_100005AD8();
}

__n128 sub_100005474(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005484(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000054A4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for _MKUserInterfaceStyle(uint64_t a1)
{
}

void type metadata accessor for MKUserInterfaceIdiom(uint64_t a1)
{
}

void sub_100005508(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005550()
{
  return sub_100003948();
}

_DWORD *sub_100005578@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100005588(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100005594(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void *sub_1000055A8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1000055B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000055FC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100005638()
{
  unint64_t result = qword_10001C8E0;
  if (!qword_10001C8E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001C8E0);
  }
  return result;
}

uint64_t sub_100005678()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000056B0()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000056E8()
{
}

uint64_t sub_1000056F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005704()
{
  return swift_release();
}

uint64_t sub_10000570C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005750()
{
  unint64_t result = qword_10001C8F8;
  if (!qword_10001C8F8)
  {
    sub_1000057AC(&qword_10001C8F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C8F8);
  }
  return result;
}

uint64_t sub_1000057AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000057F4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_10000582C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_100005840(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005854()
{
  return sub_100005E18(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_100005874(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000058BC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000058FC()
{
}

uint64_t sub_100005918()
{
  return sub_100006004(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_100005938()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005970()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_1000059B0()
{
  sub_100004278(*(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1000059CC()
{
  return sub_100005D94(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32));
}

void sub_100005A0C()
{
  sub_100005BBC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100005A28()
{
  return sub_100003A58(v0);
}

uint64_t sub_100005A30()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

BOOL sub_100005A68(void *a1)
{
  return sub_100003BB4(a1);
}

void sub_100005A7C()
{
  sub_100005C68(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100005A98()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005AD0()
{
  return sub_1000102C4(*(void *)(v0 + 16));
}

uint64_t sub_100005AD8()
{
  return swift_getGenericMetadata();
}

void *sub_100005B08()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_100005B18()
{
  return sub_100005854();
}

void *sub_100005B44()
{
  swift_getKeyPath();
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

void sub_100005BBC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2;
  id v3 = a2;
}

void *sub_100005BF0()
{
  swift_getKeyPath();
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void sub_100005C68(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = a2;
  id v3 = a2;
}

uint64_t sub_100005C9C()
{
  swift_getKeyPath();
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_100005D0C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

unint64_t sub_100005D14()
{
  swift_getKeyPath();
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  return *(unsigned int *)(v0 + 36) | ((unint64_t)*(unsigned __int8 *)(v0 + 40) << 32);
}

uint64_t sub_100005D94(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 36) = a2;
  *(unsigned char *)(result + 40) = BYTE4(a2) & 1;
  return result;
}

uint64_t sub_100005DA4()
{
  swift_getKeyPath();
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  return *(void *)(v0 + 48);
}

uint64_t sub_100005E18(uint64_t result, uint64_t a2, char a3)
{
  *(void *)(result + 48) = a2;
  *(unsigned char *)(result + 56) = a3 & 1;
  return result;
}

id sub_100005E28()
{
  uint64_t v1 = v0;
  id result = [self sharedInstance];
  if (result)
  {
    id v3 = result;
    unsigned int v4 = [result userInterfaceIdiom];

    if (v4 == 3
      && ((swift_getKeyPath(), sub_1000068B4(), sub_100012B10(), swift_release(), (*(unsigned char *)(v1 + 40) & 1) != 0)
       || *(_DWORD *)(v1 + 36) != 3)
      && ((swift_getKeyPath(), sub_100012B10(), swift_release(), (*(unsigned char *)(v1 + 56) & 1) != 0)
       || *(void *)(v1 + 48) != 2))
    {
      swift_getKeyPath();
      sub_100012B10();
      swift_release();
      return *(id *)(v1 + 48);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005F74()
{
  swift_getKeyPath();
  uint64_t v3 = v0;
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  sub_10000688C(v1, *(void *)(v3 + 72));
  return v1;
}

uint64_t sub_100006004(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1[8];
  uint64_t v5 = a1[9];
  a1[8] = a2;
  a1[9] = a3;
  a1[10] = a4;
  sub_10000688C(a2, a3);
  return sub_10000689C(v4, v5);
}

uint64_t sub_100006060()
{
  sub_10000689C(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC10MKRemoteUI22FullPlaceCardViewModel___observationRegistrar;
  uint64_t v2 = sub_100012B30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10000611C()
{
  return type metadata accessor for FullPlaceCardViewModel();
}

uint64_t type metadata accessor for FullPlaceCardViewModel()
{
  uint64_t result = qword_10001C9A0;
  if (!qword_10001C9A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006170()
{
  uint64_t result = sub_100012B30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

double sub_100006234@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  *(void *)&long long v13 = a1;
  sub_1000068B4();
  sub_100012B10();
  swift_release();
  uint64_t v4 = (void *)a1[2];
  if (!v4) {
    goto LABEL_5;
  }
  swift_getKeyPath();
  *(void *)&long long v13 = a1;
  id v5 = v4;
  sub_100012B10();
  swift_release();
  uint64_t v6 = (void *)a1[3];
  if (!v6)
  {

LABEL_5:
    sub_100007988();
    sub_1000079DC();
    sub_100012DB0();
    goto LABEL_6;
  }
  swift_getKeyPath();
  id v7 = v6;
  id v12 = v5;
  id v8 = v7;
  sub_100012B10();
  swift_release();
  swift_getKeyPath();
  *(void *)&long long v13 = a1;
  sub_100012B10();
  swift_release();
  uint64_t v9 = a1[8];
  uint64_t v10 = a1[9];
  sub_10000688C(v9, v10);
  sub_100005E28();
  sub_10000688C(v9, v10);
  sub_100007988();
  sub_1000079DC();
  sub_100012DB0();

  sub_10000689C(v9, v10);
LABEL_6:
  double result = *(double *)&v13;
  *(_OWORD *)a2 = v13;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v15;
  *(void *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 56) = v17;
  *(unsigned char *)(a2 + 57) = v18;
  return result;
}

uint64_t sub_100006490()
{
  return sub_100012F60();
}

__n128 sub_1000064AC@<Q0>(uint64_t a1@<X8>)
{
  sub_100006234(*v1, (uint64_t)v12);
  long long v10 = v12[1];
  long long v11 = v12[0];
  __n128 v9 = (__n128)v12[2];
  uint64_t v3 = v13;
  char v4 = v14;
  char v5 = v15;
  uint64_t v6 = sub_100012C50();
  char v7 = sub_100012E60();
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v10;
  __n128 result = v9;
  *(__n128 *)(a1 + 32) = v9;
  *(void *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 57) = v5;
  *(void *)(a1 + 64) = v6;
  *(unsigned char *)(a1 + 72) = v7;
  return result;
}

id sub_100006544(void *a1, char a2, void *a3)
{
  char v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  id v9 = [objc_allocWithZone((Class)MUPlaceViewControllerConfiguration) init];
  objc_msgSend(v9, "setOptions:", (unint64_t)objc_msgSend(v9, "options") | 0x8000000000);
  [v9 setDeveloperPlaceCardAuditToken:a3];
  v13.receiver = v4;
  v13.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v13, "initWithConfiguration:", v9);
  objc_msgSend(v10, "setOptions:", (unint64_t)objc_msgSend(v10, "options") & 0xFFFFFFFFFFFFFFFELL | a2 & 1);
  id v11 = v10;
  [v11 setMapItem:a1];

  return v11;
}

void sub_100006684(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1000066C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FullPlaceCardViewController()
{
  return self;
}

uint64_t destroy for FullPlaceCardViewModel.ContentSizeQuery()
{
  return swift_release();
}

void *_s10MKRemoteUI22FullPlaceCardViewModelC16ContentSizeQueryVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain();
  return a1;
}

void *assignWithCopy for FullPlaceCardViewModel.ContentSizeQuery(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for FullPlaceCardViewModel.ContentSizeQuery(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FullPlaceCardViewModel.ContentSizeQuery(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FullPlaceCardViewModel.ContentSizeQuery(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FullPlaceCardViewModel.ContentSizeQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FullPlaceCardViewModel.ContentSizeQuery()
{
  return &type metadata for FullPlaceCardViewModel.ContentSizeQuery;
}

uint64_t sub_10000688C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000689C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return swift_release();
  }
  return result;
}

unint64_t sub_1000068B4()
{
  unint64_t result = qword_10001C900;
  if (!qword_10001C900)
  {
    type metadata accessor for FullPlaceCardViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C900);
  }
  return result;
}

id sub_10000690C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100012BD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000057F4(v2, (uint64_t)qword_10001E068);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v8 = *(void **)v1;
  char v7 = *(void **)(v1 + 8);
  sub_100008028(v1 + 24, (uint64_t)v35, (uint64_t *)&unk_10001CC00);
  id v9 = v8;
  id v10 = v7;
  sub_10000808C(v35);
  id v11 = v9;
  id v12 = v10;
  sub_10000808C(v35);
  objc_super v13 = sub_100012BB0();
  int v14 = sub_100013050();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    char v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v36 = v30;
    *(_DWORD *)char v15 = 136380675;
    os_log_t v32 = v13;
    id v33 = v12;
    int v31 = v14;
    if (v8)
    {
      v29 = v8;
      id v16 = v11;
      id v17 = [v16 name];
      if (v17)
      {
        char v18 = v17;
        uint64_t v19 = sub_100012FF0();
        unint64_t v21 = v20;
      }
      else
      {

        uint64_t v19 = 0;
        unint64_t v21 = 0xE000000000000000;
      }
      id v8 = v29;
    }
    else
    {
      unint64_t v21 = 0xE300000000000000;
      uint64_t v19 = 7104878;
    }
    v34[0] = sub_100012000(v19, v21, &v36);
    sub_1000130A0();
    id v12 = v33;

    swift_bridgeObjectRelease();
    sub_1000080BC(v35);

    sub_1000080BC(v35);
    objc_super v13 = v32;
    _os_log_impl((void *)&_mh_execute_header, v32, (os_log_type_t)v31, "extn full representable make (map item: %{private}s)", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_1000080BC(v35);
    sub_1000080BC(v35);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  char v22 = *(unsigned char *)(v1 + 16);
  objc_allocWithZone((Class)type metadata accessor for FullPlaceCardViewController());
  id v23 = v11;
  id v24 = sub_100006544(v8, v22, v12);
  sub_100008028(v1 + 48, (uint64_t)v34, &qword_10001CBF8);
  sub_100008028((uint64_t)v34, (uint64_t)&v36, &qword_10001CBF8);
  if (v37) {
    return v24;
  }
  uint64_t v25 = v36;
  id result = [v24 view];
  if (result)
  {
    v27 = result;
    if (v25 == 1) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 1;
    }
    [result setOverrideUserInterfaceStyle:v28];

    return v24;
  }
  __break(1u);
  return result;
}

void sub_100006CEC(void *a1)
{
  id v62 = a1;
  uint64_t v2 = sub_100012BD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1000057F4(v2, (uint64_t)qword_10001E068);
  char v7 = *(void (**)(char *))(v3 + 16);
  uint64_t v59 = v6;
  v7(v5);
  id v9 = *(void **)v1;
  id v8 = *(void **)(v1 + 8);
  uint64_t v10 = *(void *)(v1 + 24);
  id v11 = *(void (**)(id))(v1 + 32);
  uint64_t v61 = v1;
  id v12 = v5;
  uint64_t v13 = v3;
  id v14 = v9;
  id v15 = v8;
  sub_10000688C(v10, (uint64_t)v11);
  id v16 = v14;
  id v17 = v15;
  sub_10000688C(v10, (uint64_t)v11);
  char v18 = sub_100012BB0();
  int v58 = sub_100013050();
  BOOL v19 = os_log_type_enabled(v18, (os_log_type_t)v58);
  id v60 = v17;
  if (v19)
  {
    v54 = v12;
    uint64_t v55 = v13;
    uint64_t v56 = v2;
    id v57 = v16;
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    aBlock[0] = v53;
    *(_DWORD *)unint64_t v20 = 136380675;
    unint64_t v21 = v18;
    if (v9)
    {
      id v22 = v57;
      id v23 = [v22 name];
      uint64_t v24 = v61;
      if (v23)
      {
        uint64_t v25 = v23;
        uint64_t v26 = sub_100012FF0();
        unint64_t v28 = v27;
      }
      else
      {

        uint64_t v26 = 0;
        unint64_t v28 = 0xE000000000000000;
      }
    }
    else
    {
      unint64_t v28 = 0xE300000000000000;
      uint64_t v26 = 7104878;
      uint64_t v24 = v61;
    }
    uint64_t v65 = sub_100012000(v26, v28, aBlock);
    sub_1000130A0();
    id v29 = v60;

    id v30 = v57;
    swift_bridgeObjectRelease();
    sub_10000689C(v10, (uint64_t)v11);

    sub_10000689C(v10, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v58, "extn full representable update (map item: %{private}s)", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v16 = v30;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  }
  else
  {

    sub_10000689C(v10, (uint64_t)v11);
    sub_10000689C(v10, (uint64_t)v11);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v12, v2);
    uint64_t v24 = v61;
  }
  id v31 = v62;
  [v62 setMapItem:v16];
  objc_msgSend(v31, "setOptions:", (unint64_t)objc_msgSend(v31, "options") & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(v24 + 16));
  if (v11)
  {
    sub_10000688C(v10, (uint64_t)v11);
    swift_retain();
    os_log_t v32 = sub_100012BB0();
    os_log_type_t v33 = sub_100013050();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v34 = 134217984;
      aBlock[0] = v10;
      sub_1000130A0();
      sub_10000689C(v10, (uint64_t)v11);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "extn full representable update contentSizeQuery %f", v34, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      sub_10000689C(v10, (uint64_t)v11);
    }

    swift_retain();
    LODWORD(v35) = 1148846080;
    LODWORD(v36) = 1112014848;
    v11(objc_msgSend(v62, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)&v10, 0.0, v35, v36));
    sub_10000689C(v10, (uint64_t)v11);
    sub_10000689C(v10, (uint64_t)v11);
  }
  sub_100008028(v24 + 48, (uint64_t)v64, &qword_10001CBF8);
  sub_100008028((uint64_t)v64, (uint64_t)&v65, &qword_10001CBF8);
  if ((v66 & 1) == 0)
  {
    uint64_t v37 = v65;
    id v38 = [v62 view];
    if (!v38)
    {
      __break(1u);
      goto LABEL_26;
    }
    v39 = v38;
    if (v37 == 1) {
      uint64_t v40 = 2;
    }
    else {
      uint64_t v40 = 1;
    }
    id v41 = [v38 overrideUserInterfaceStyle];

    if ((id)v40 != v41)
    {
      id v42 = [v62 view];
      if (v42)
      {
        v43 = v42;
        v44 = self;
        uint64_t v45 = swift_allocObject();
        long long v46 = *(_OWORD *)(v24 + 16);
        *(_OWORD *)(v45 + 24) = *(_OWORD *)v24;
        id v47 = v62;
        *(void *)(v45 + 16) = v62;
        *(_OWORD *)(v45 + 40) = v46;
        *(_OWORD *)(v45 + 56) = *(_OWORD *)(v24 + 32);
        *(_OWORD *)(v45 + 65) = *(_OWORD *)(v24 + 41);
        aBlock[4] = (uint64_t)sub_100008004;
        aBlock[5] = v45;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_100010280;
        aBlock[3] = (uint64_t)&unk_100019130;
        v48 = _Block_copy(aBlock);
        id v49 = v16;
        id v50 = v60;
        sub_10000688C(v10, (uint64_t)v11);
        id v51 = v47;
        swift_release();
        [v44 transitionWithView:v43 duration:5242880 options:v48 animations:0 completion:0.2];
        _Block_release(v48);

        return;
      }
LABEL_26:
      __break(1u);
    }
  }
}

void sub_1000073C4(void *a1, uint64_t a2)
{
  id v3 = [a1 view];
  if (v3)
  {
    if ((*(unsigned char *)(a2 + 56) & 1) != 0 || *(void *)(a2 + 48) != 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    id v5 = v3;
    [v3 setOverrideUserInterfaceStyle:v4];
  }
  else
  {
    __break(1u);
  }
}

id sub_10000744C()
{
  return sub_10000690C();
}

void sub_100007490(void *a1)
{
}

uint64_t sub_1000074E0()
{
  return sub_100012DE0();
}

uint64_t sub_10000751C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100007F04();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100007580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100007F04();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000075E4()
{
}

id sub_10000760C()
{
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012BD0();
  sub_1000057F4(v0, (uint64_t)qword_10001E068);
  uint64_t v1 = sub_100012BB0();
  os_log_type_t v2 = sub_100013050();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "extn full representable make loading view", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = objc_allocWithZone((Class)MKFullDeveloperPlaceCardLoadingView);

  return [v4 init];
}

void sub_100007708()
{
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012BD0();
  sub_1000057F4(v0, (uint64_t)qword_10001E068);
  oslog = sub_100012BB0();
  os_log_type_t v1 = sub_100013050();
  if (os_log_type_enabled(oslog, v1))
  {
    os_log_type_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "extn full representable update loading view", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100007800()
{
  return sub_100012D10();
}

uint64_t sub_100007844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100007F58();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000078A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100007F58();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10000790C()
{
}

ValueMetadata *type metadata accessor for FullPlaceCardView()
{
  return &type metadata for FullPlaceCardView;
}

uint64_t sub_10000796C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100007988()
{
  unint64_t result = qword_10001CBB8;
  if (!qword_10001CBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBB8);
  }
  return result;
}

unint64_t sub_1000079DC()
{
  unint64_t result = qword_10001CBC0;
  if (!qword_10001CBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FullPlaceCardLoadingView()
{
  return &type metadata for FullPlaceCardLoadingView;
}

uint64_t initializeBufferWithCopyOfBuffer for FullPlaceCardRepresentable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for FullPlaceCardRepresentable(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for FullPlaceCardRepresentable(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  id v7 = v4;
  id v8 = v5;
  if (v6)
  {
    uint64_t v9 = *(void *)(a2 + 40);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
  }
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for FullPlaceCardRepresentable(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v10 = (_OWORD *)(a1 + 24);
  id v11 = (_OWORD *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v12)
    {
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      uint64_t v13 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v13;
      swift_retain();
      swift_release();
    }
    else
    {
      sub_100007C50(a1 + 24);
      uint64_t v15 = *(void *)(a2 + 40);
      *uint64_t v10 = *v11;
      *(void *)(a1 + 40) = v15;
    }
  }
  else if (v12)
  {
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    uint64_t v14 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v14;
    swift_retain();
  }
  else
  {
    long long v16 = *v11;
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *uint64_t v10 = v16;
  }
  uint64_t v17 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v17;
  return a1;
}

uint64_t sub_100007C50(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for FullPlaceCardRepresentable(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FullPlaceCardRepresentable(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (!*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a2 + 32);
  if (!v6)
  {
    sub_100007C50(a1 + 24);
LABEL_5:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    goto LABEL_6;
  }
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  swift_release();
LABEL_6:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for FullPlaceCardRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FullPlaceCardRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FullPlaceCardRepresentable()
{
  return &type metadata for FullPlaceCardRepresentable;
}

unint64_t sub_100007DF8()
{
  unint64_t result = qword_10001CBC8;
  if (!qword_10001CBC8)
  {
    sub_1000057AC(&qword_10001CBD0);
    sub_100007E74();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBC8);
  }
  return result;
}

unint64_t sub_100007E74()
{
  unint64_t result = qword_10001CBD8;
  if (!qword_10001CBD8)
  {
    sub_1000057AC(&qword_10001CBE0);
    sub_100007988();
    sub_1000079DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBD8);
  }
  return result;
}

void *sub_100007EF8()
{
  return &protocol witness table for Never;
}

unint64_t sub_100007F04()
{
  unint64_t result = qword_10001CBE8;
  if (!qword_10001CBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBE8);
  }
  return result;
}

unint64_t sub_100007F58()
{
  unint64_t result = qword_10001CBF0;
  if (!qword_10001CBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBF0);
  }
  return result;
}

uint64_t sub_100007FAC()
{
  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 81, 7);
}

void sub_100008004()
{
  sub_1000073C4(*(void **)(v0 + 16), v0 + 24);
}

uint64_t sub_100008010(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008020()
{
  return swift_release();
}

uint64_t sub_100008028(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000570C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_10000808C(uint64_t *a1)
{
  return a1;
}

uint64_t *sub_1000080BC(uint64_t *a1)
{
  return a1;
}

uint64_t sub_1000080F0()
{
  return swift_initClassMetadata2();
}

id sub_100008150@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  long long v4 = *(void **)(v3 + 16);
  *a2 = v4;

  return v4;
}

void sub_100008208(void **a1)
{
  os_log_type_t v1 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  id v2 = v1;
  sub_100012B00();
  swift_release();
}

id sub_1000082E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  long long v4 = *(void **)(v3 + 24);
  *a2 = v4;

  return v4;
}

void sub_10000839C(void **a1)
{
  os_log_type_t v1 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  id v2 = v1;
  sub_100012B00();
  swift_release();
}

uint64_t sub_100008478@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B10();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 32);
  return result;
}

uint64_t sub_100008520()
{
  return swift_release();
}

uint64_t sub_1000085F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B10();
  uint64_t result = swift_release();
  char v5 = *(unsigned char *)(v3 + 40);
  *(_DWORD *)a2 = *(_DWORD *)(v3 + 36);
  *(unsigned char *)(a2 + 4) = v5;
  return result;
}

uint64_t sub_1000086A0()
{
  return swift_release();
}

uint64_t sub_100008778@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B10();
  uint64_t result = swift_release();
  char v5 = *(unsigned char *)(v3 + 56);
  *(void *)a2 = *(void *)(v3 + 48);
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_100008828()
{
  return swift_release();
}

uint64_t sub_1000088FC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_getKeyPath();
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  uint64_t v4 = v3[8];
  uint64_t v5 = v3[9];
  uint64_t v6 = v3[10];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return sub_10000688C(v4, v5);
}

uint64_t sub_1000089B0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_getKeyPath();
  sub_10000688C(v1, v2);
  sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
  sub_100012B00();
  sub_10000689C(v1, v2);
  return swift_release();
}

uint64_t sub_100008AAC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = (void *)swift_allocObject();
  uint64_t v6 = *(void *)(v1 + 80);
  v5[2] = v6;
  uint64_t v7 = *(void *)(v1 + 88);
  v5[3] = v7;
  v5[4] = v4;
  swift_bridgeObjectRetain();
  swift_retain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v2, v3, sub_10000A9B8, v0, sub_10000A9F8, v5, v6, v7);
}

uint64_t sub_100008BBC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *(void *)(*a1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v13 - v8;
  (*(void (**)(void))(v7 + 32))();
  uint64_t v10 = *(void *)(v1 + 88);
  sub_100010244(v6, v2, v10);
  id v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  sub_100010244(v9, v2, v10);
  return ((uint64_t (*)(char *, uint64_t))v11)(v9, v2);
}

BOOL sub_100008D18(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v3 = [self interfaceWithProtocol:&OBJC_PROTOCOL___MKRemoteUIStandAlonePlaceCardExtensionInterface];
    [a1 setExportedInterface:v3];

    [a1 setExportedObject:Strong];
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100012BD0();
    sub_1000057F4(v4, (uint64_t)qword_10001E068);
    uint64_t v5 = sub_100012BB0();
    os_log_type_t v6 = sub_100013060();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "extn stand-alone scene connection resume", v7, 2u);
      swift_slowDealloc();
    }

    [a1 resume];
    id v8 = objc_allocWithZone((Class)GEOApplicationAuditToken);
    swift_retain();
    id v9 = [v8 initWithNSXPCConnection:a1];
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100012BD0();
    sub_1000057F4(v11, (uint64_t)qword_10001E068);
    uint64_t v12 = sub_100012BB0();
    os_log_type_t v13 = sub_100013060();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "extn stand-alone scene connection: self unavailable", v14, 2u);
      swift_slowDealloc();
    }
  }
  return Strong != 0;
}

uint64_t sub_100009068(uint64_t a1, char a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v23 = a4;
  int v22 = a3;
  uint64_t v8 = *v5;
  uint64_t v9 = sub_100012FB0();
  uint64_t v25 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = sub_100012FD0();
  uint64_t v12 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v14 = &v21[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  if (a1) {
    *(void *)(v15 + 16) = [objc_allocWithZone((Class)MKMapItem) initWithGeoMapItem:a1 isPlaceHolderPlace:0];
  }
  sub_100005638();
  long long v16 = (void *)sub_100013080();
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = *(void *)(v8 + 80);
  *(void *)(v18 + 24) = *(void *)(v8 + 88);
  *(void *)(v18 + 32) = v17;
  *(void *)(v18 + 40) = v15;
  *(unsigned char *)(v18 + 48) = a2 & 1;
  *(_DWORD *)(v18 + 52) = v22;
  *(void *)(v18 + 56) = v23;
  aBlock[4] = sub_10000A950;
  aBlock[5] = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_100019338;
  BOOL v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005874(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v19);

  (*(void (**)(unsigned char *, uint64_t))(v25 + 8))(v11, v9);
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v24);
  return swift_release();
}

void sub_1000093EC(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v9 = sub_100012BD0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v15 = (void **)(a2 + 16);
    uint64_t v16 = sub_1000057F4(v9, (uint64_t)qword_10001E068);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v16, v9);
    swift_retain_n();
    uint64_t v17 = sub_100012BB0();
    int v45 = sub_100013050();
    BOOL v18 = os_log_type_enabled(v17, (os_log_type_t)v45);
    uint64_t v49 = a5;
    int v47 = a3;
    int v48 = a4;
    long long v46 = (void **)(a2 + 16);
    if (v18)
    {
      BOOL v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v51[0] = v44;
      *(_DWORD *)BOOL v19 = 136380675;
      swift_beginAccess();
      unint64_t v20 = *v15;
      if (*v15)
      {
        uint64_t v43 = v14;
        id v21 = v20;
        id v22 = [v21 name];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = sub_100012FF0();
          unint64_t v26 = v25;
        }
        else
        {

          uint64_t v24 = 0;
          unint64_t v26 = 0xE000000000000000;
        }
        uint64_t v14 = v43;
      }
      else
      {
        unint64_t v26 = 0xE300000000000000;
        uint64_t v24 = 7104878;
      }
      uint64_t v50 = sub_100012000(v24, v26, v51);
      sub_1000130A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v45, "extn stand-alone scene configure with item: %{private}s", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v30 = *(void *)(v14 + 48);
    id v31 = v46;
    swift_beginAccess();
    os_log_t v32 = *v31;
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(&v42 - 2) = v30;
    *(&v42 - 1) = (uint64_t)v32;
    uint64_t v50 = v30;
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    swift_retain();
    id v34 = v32;
    sub_100012B00();
    swift_release();
    swift_release();

    uint64_t v35 = *(void *)(v14 + 48);
    uint64_t v36 = swift_getKeyPath();
    __chkstk_darwin(v36);
    *(&v42 - 2) = v35;
    *((unsigned char *)&v42 - 8) = v47 & 1;
    uint64_t v50 = v35;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    uint64_t v37 = *(void *)(v14 + 48);
    uint64_t v38 = swift_getKeyPath();
    __chkstk_darwin(v38);
    *(&v42 - 2) = v37;
    *((_DWORD *)&v42 - 2) = v48;
    *((unsigned char *)&v42 - 4) = 0;
    uint64_t v50 = v37;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    uint64_t v39 = *(void *)(v14 + 48);
    uint64_t v40 = swift_getKeyPath();
    __chkstk_darwin(v40);
    uint64_t v41 = v49;
    *(&v42 - 4) = v39;
    *(&v42 - 3) = v41;
    *((unsigned char *)&v42 - 16) = 0;
    uint64_t v50 = v39;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    sub_1000057F4(v9, (uint64_t)qword_10001E068);
    unint64_t v27 = sub_100012BB0();
    os_log_type_t v28 = sub_100013070();
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "extn stand-alone scene configure without self", v29, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100009A9C(uint64_t a1, uint64_t a2, void *a3, char a4, int a5, uint64_t a6)
{
  id v10 = a3;
  swift_retain();
  sub_100009068((uint64_t)a3, a4, a5, a6);

  return swift_release();
}

uint64_t sub_100009B1C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = sub_100012FB0();
  uint64_t v20 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100012FD0();
  uint64_t v11 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005638();
  uint64_t v14 = (void *)sub_100013080();
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = *(void *)(v7 + 80);
  *(void *)(v16 + 24) = *(void *)(v7 + 88);
  *(void *)(v16 + 32) = v15;
  *(double *)(v16 + 40) = a3;
  *(void *)(v16 + 48) = a1;
  *(void *)(v16 + 56) = a2;
  aBlock[4] = sub_10000A8BC;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_1000192C0;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005874(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v19);
}

void sub_100009E40()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_100012BD0();
    sub_1000057F4(v0, (uint64_t)qword_10001E068);
    uint64_t v1 = sub_100012BB0();
    os_log_type_t v2 = sub_100013060();
    if (os_log_type_enabled(v1, v2))
    {
      id v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v3 = 134217984;
      sub_1000130A0();
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "extn stand-alone fetchPreferredContentSize for %f", v3, 0xCu);
      swift_slowDealloc();
    }

    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    swift_retain();
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_100012BD0();
    sub_1000057F4(v5, (uint64_t)qword_10001E068);
    os_log_type_t v6 = sub_100012BB0();
    os_log_type_t v7 = sub_100013070();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "extn stand-alone fetchPreferredContentSize without self", v8, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10000A13C(int a1, int a2, void *aBlock, double a4)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_100009B1C((uint64_t)sub_100005AD0, v6, a4);
  swift_release();

  return swift_release();
}

uint64_t sub_10000A1DC(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_100012FB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100012FD0();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005638();
  uint64_t v11 = (void *)sub_100013080();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v3 + 80);
  v13[3] = *(void *)(v3 + 88);
  v13[4] = v12;
  v13[5] = a1;
  aBlock[4] = sub_10000A850;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_100019270;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100005874(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

void sub_10000A4DC()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100005874((unint64_t *)&qword_10001C900, (void (*)(uint64_t))type metadata accessor for FullPlaceCardViewModel);
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100012BD0();
    sub_1000057F4(v1, (uint64_t)qword_10001E068);
    os_log_type_t v2 = sub_100012BB0();
    os_log_type_t v3 = sub_100013070();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "extn stand-alone scene update interface style without self", v4, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10000A6E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  sub_10000A1DC(a3);

  return swift_release();
}

uint64_t type metadata accessor for StandAlonePlaceCardScene()
{
  return sub_100005AD8();
}

uint64_t sub_10000A73C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000A780()
{
  return sub_100008AAC();
}

uint64_t sub_10000A7A4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000A7E0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A818()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000A850()
{
}

uint64_t sub_10000A85C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A86C()
{
  return swift_release();
}

uint64_t sub_10000A87C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10000A8BC()
{
}

uint64_t sub_10000A8D8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A910()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10000A950()
{
  sub_1000093EC(*(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned __int8 *)(v0 + 48), *(_DWORD *)(v0 + 52), *(void *)(v0 + 56));
}

uint64_t sub_10000A978()
{
  return sub_100005D0C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_10000A9A0()
{
  return sub_1000059CC();
}

uint64_t sub_10000A9B8()
{
  return sub_100008BBC(v0);
}

uint64_t sub_10000A9C0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

BOOL sub_10000A9F8(void *a1)
{
  return sub_100008D18(a1);
}

uint64_t sub_10000AA0C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void *sub_10000AA44()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_10000AA58()
{
  return sub_100005918();
}

uint64_t sub_10000AA78()
{
  return sub_10000A978();
}

void sub_10000AA90()
{
}

void sub_10000AAA8()
{
}

void *sub_10000AAC0(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v6 = v4;
  v4[2] = sub_100012FF0();
  v4[3] = v9;
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100012BD0();
  sub_1000057F4(v10, (uint64_t)qword_10001E068);
  uint64_t v11 = sub_100012BB0();
  os_log_type_t v12 = sub_100013050();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, a4, v13, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for FullPlaceCardViewModel();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  *(unsigned char *)(v14 + 32) = 1;
  *(_DWORD *)(v14 + 36) = 0;
  *(unsigned char *)(v14 + 40) = 1;
  *(void *)(v14 + 48) = 0;
  *(unsigned char *)(v14 + 56) = 1;
  *(void *)(v14 + 72) = 0;
  *(void *)(v14 + 80) = 0;
  *(void *)(v14 + 64) = 0;
  sub_100012B20();
  v6[5] = a2;
  v6[6] = v14;
  v6[4] = a1;
  return v6;
}

uint64_t sub_10000AC18@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 48);
  return swift_retain();
}

uint64_t sub_10000AC24()
{
  uint64_t v0 = sub_10000570C(&qword_10001CD28);
  uint64_t v1 = sub_10000B344(&qword_10001CD30, &qword_10001CD28);

  return AppExtensionSceneConfiguration.init<A>(_:)(sub_10000B28C, 0, v0, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000AD18()
{
  unint64_t result = qword_10001CCF0;
  if (!qword_10001CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CCF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MKRemoteUI()
{
  return &type metadata for MKRemoteUI;
}

uint64_t sub_10000AD7C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000AD98(uint64_t a1)
{
  unint64_t result = sub_10000AD18();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000ADC4()
{
  unint64_t result = qword_10001CD20;
  if (!qword_10001CD20)
  {
    sub_100012B50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD20);
  }
  return result;
}

uint64_t sub_10000AE1C()
{
  sub_10000570C(&qword_10001CD50);
  sub_100012B90();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100014040;
  swift_retain();
  sub_10000570C(&qword_10001CD38);
  sub_10000B344(&qword_10001CD58, &qword_10001CD38);
  sub_100012B80();
  swift_retain();
  sub_10000570C(&qword_10001CD40);
  sub_10000B344(&qword_10001CD60, &qword_10001CD40);
  sub_100012B80();
  swift_retain();
  sub_10000570C(&qword_10001CD48);
  sub_10000B344(&qword_10001CD68, &qword_10001CD48);
  sub_100012B80();
  return v0;
}

void *sub_10000B008(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = v2;
  v2[2] = sub_100012FF0();
  v2[3] = v6;
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100012BD0();
  sub_1000057F4(v7, (uint64_t)qword_10001E068);
  uint64_t v8 = sub_100012BB0();
  os_log_type_t v9 = sub_100013050();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "extn compact-accessory scene init", v10, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for CompactPlaceCardViewModel();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(_DWORD *)(v11 + 24) = 0;
  *(unsigned char *)(v11 + 28) = 1;
  *(void *)(v11 + 32) = 0;
  *(unsigned char *)(v11 + 40) = 1;
  *(_OWORD *)(v11 + 48) = 0u;
  *(_OWORD *)(v11 + 64) = 0u;
  *(unsigned char *)(v11 + 80) = 1;
  sub_100012B20();
  v3[5] = a2;
  v3[6] = v11;
  v3[4] = a1;
  return v3;
}

uint64_t (*sub_10000B160@<X0>(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>))@<X0>(uint64_t *a1@<X8>)
{
  sub_10000570C(&qword_10001CD38);
  swift_allocObject();
  uint64_t v2 = sub_10000AAC0((uint64_t)sub_10000AC18, 0, (uint64_t)&MKRemoteUIStandAlonePlaceCardSceneID, "extn stand-alone scene init");
  sub_10000570C(&qword_10001CD40);
  swift_allocObject();
  os_log_type_t v3 = sub_10000AAC0((uint64_t)sub_10000B388, 0, (uint64_t)&MKRemoteUIFullAccessoryPlaceCardSceneID, "extn full-accessory scene init");
  sub_10000570C(&qword_10001CD48);
  swift_allocObject();
  uint64_t v4 = sub_10000B008((uint64_t)sub_10000B388, 0);
  unint64_t result = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
  *((void *)result + 2) = v2;
  *((void *)result + 3) = v3;
  *((void *)result + 4) = v4;
  *a1 = sub_10000B2D8;
  a1[1] = result;
  return result;
}

uint64_t sub_10000B290()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B2D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000AE1C();
  *a1 = result;
  return result;
}

uint64_t sub_10000B308()
{
  return sub_10000B344(qword_10001CD70, &qword_10001CD28);
}

uint64_t sub_10000B344(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000057AC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MKRemoteUISceneBuilder()
{
  return &type metadata for MKRemoteUISceneBuilder;
}

uint64_t sub_10000B39C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void *sub_10000B3A4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_10000B3D4()
{
  return swift_release();
}

void *sub_10000B3DC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_10000B418(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_10000B44C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10000B494(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for MKRemoteUISceneBuilder.SceneWrapper()
{
  return sub_100005AD8();
}

uint64_t sub_10000B4E8(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000B524()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000B568(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000B590()
{
  return sub_10000B568(*v0);
}

uint64_t sub_10000B5A0(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_10000B5AC(void *a1)
{
  if (!a1) {
    return 7104878;
  }
  id v1 = a1;
  id v2 = [v1 name];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_100012FF0();
  }
  else
  {

    return 0;
  }
  return v4;
}

uint64_t sub_10000B63C()
{
  uint64_t v0 = sub_100012BD0();
  sub_10000B6B8(v0, qword_10001E068);
  sub_1000057F4(v0, (uint64_t)qword_10001E068);
  return sub_100012BC0();
}

uint64_t *sub_10000B6B8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_10000B71C()
{
  swift_getKeyPath();
  sub_10000F464(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  id v1 = *(void **)(v0 + 16);
  id v2 = v1;
  return v1;
}

unint64_t sub_10000B7C4()
{
  swift_getKeyPath();
  sub_10000F464(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t sub_10000B874(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 24) = a2;
  *(unsigned char *)(result + 28) = BYTE4(a2) & 1;
  return result;
}

uint64_t sub_10000B884()
{
  swift_getKeyPath();
  sub_10000F464(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  return *(void *)(v0 + 32);
}

uint64_t sub_10000B928(uint64_t result, uint64_t a2, char a3)
{
  *(void *)(result + 32) = a2;
  *(unsigned char *)(result + 40) = a3 & 1;
  return result;
}

id sub_10000B938()
{
  uint64_t v1 = v0;
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v4 = [result userInterfaceIdiom];

    if (v4 == 3
      && ((swift_getKeyPath(),
           sub_10000F464(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel), sub_100012B10(), swift_release(), (*(unsigned char *)(v1 + 28) & 1) != 0)|| *(_DWORD *)(v1 + 24) != 3)&& ((swift_getKeyPath(), sub_100012B10(), swift_release(), (*(unsigned char *)(v1 + 40) & 1) != 0)|| *(void *)(v1 + 32) != 2))
    {
      swift_getKeyPath();
      sub_100012B10();
      swift_release();
      return *(id *)(v1 + 32);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BAB4()
{
  sub_10000ECE0(*(void *)(v0 + 48));
  uint64_t v1 = v0 + OBJC_IVAR____TtC10MKRemoteUI25CompactPlaceCardViewModel___observationRegistrar;
  uint64_t v2 = sub_100012B30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10000BB64()
{
  return type metadata accessor for CompactPlaceCardViewModel();
}

uint64_t type metadata accessor for CompactPlaceCardViewModel()
{
  uint64_t result = qword_10001CE28;
  if (!qword_10001CE28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000BBB8()
{
  uint64_t result = sub_100012B30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000BC7C@<X0>(double a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = sub_10000570C(&qword_10001CFB8);
  __chkstk_darwin(v47);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v46 = sub_10000570C(&qword_10001CFC0);
  __chkstk_darwin(v46);
  uint64_t v7 = (uint64_t *)((char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_100012BF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10000570C(&qword_10001CFC8);
  uint64_t v12 = __chkstk_darwin(v48);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v37 - v15;
  id v17 = sub_10000B938();
  if (v18)
  {
    sub_10000C0D0(a1, (uint64_t)&v49);
    long long v45 = v50;
    long long v46 = v49;
    uint64_t v32 = v51;
    char v33 = v52;
    uint64_t v34 = sub_100012C50();
    char v35 = sub_100012E60();
    long long v36 = v45;
    *(_OWORD *)uint64_t v5 = v46;
    *((_OWORD *)v5 + 1) = v36;
    *((void *)v5 + 4) = v32;
    v5[40] = v33;
    *((void *)v5 + 6) = v34;
    v5[56] = v35;
    swift_storeEnumTagMultiPayload();
    sub_10000570C(&qword_10001CFD0);
    sub_10000ED1C();
    sub_10000EDBC();
    return sub_100012DB0();
  }
  else
  {
    id v19 = v17;
    sub_10000C0D0(a1, (uint64_t)&v49);
    uint64_t v44 = a2;
    uint64_t v42 = *((void *)&v49 + 1);
    *(void *)&long long v45 = v49;
    uint64_t v43 = v16;
    long long v20 = v50;
    uint64_t v41 = v51;
    uint64_t v21 = v9;
    int v40 = v52;
    uint64_t v39 = sub_100012C50();
    int v38 = sub_100012E60();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
    uint64_t v24 = (unsigned int *)&enum case for ColorScheme.dark(_:);
    if (v19 != (id)1) {
      uint64_t v24 = (unsigned int *)&enum case for ColorScheme.light(_:);
    }
    uint64_t v25 = *v24;
    uint64_t v37 = v8;
    v23(v11, v25, v8);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))((char *)v7 + *(int *)(v46 + 28), v11, v8);
    *uint64_t v7 = KeyPath;
    sub_10000FF60((uint64_t)v7, (uint64_t)&v14[*(int *)(v48 + 36)], &qword_10001CFC0);
    unint64_t v26 = (void *)v45;
    uint64_t v28 = v41;
    uint64_t v27 = v42;
    *(void *)uint64_t v14 = v45;
    *((void *)v14 + 1) = v27;
    *((_OWORD *)v14 + 1) = v20;
    *((void *)v14 + 4) = v28;
    char v29 = v40;
    v14[40] = v40;
    *((void *)v14 + 6) = v39;
    v14[56] = v38;
    sub_10000F068(v26, v27, v20, *((uint64_t *)&v20 + 1), v28, v29);
    sub_100010128((uint64_t)v7, &qword_10001CFC0);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v37);
    sub_10000F0B4((void *)v45, v27, v20, *((uint64_t *)&v20 + 1), v28, v29);
    uint64_t v30 = (uint64_t)v43;
    sub_100008028((uint64_t)v14, (uint64_t)v43, &qword_10001CFC8);
    sub_10000FF60(v30, (uint64_t)v5, &qword_10001CFC8);
    swift_storeEnumTagMultiPayload();
    sub_10000570C(&qword_10001CFD0);
    sub_10000ED1C();
    sub_10000EDBC();
    sub_100012DB0();
    return sub_100010128(v30, &qword_10001CFC8);
  }
}

double sub_10000C0D0@<D0>(double a1@<X0>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  *(double *)&long long v7 = a1;
  sub_10000F464(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  uint64_t v4 = *(void **)(*(void *)&a1 + 16);
  if (v4)
  {
    id v5 = v4;
    swift_retain();
  }
  sub_10000570C(&qword_10001D000);
  sub_10000EEF8();
  sub_10000EFEC();
  sub_100012DB0();
  double result = a1;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(void *)(a2 + 32) = v9;
  *(unsigned char *)(a2 + 40) = v10;
  return result;
}

uint64_t sub_10000C220(uint64_t a1)
{
  uint64_t v2 = sub_100012BF0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100012C90();
}

uint64_t sub_10000C2E8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100012C40();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

void sub_10000C314(double *a1, uint64_t a2)
{
  double v3 = *a1;
  double v4 = a1[1];
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100012BD0();
  sub_1000057F4(v5, (uint64_t)qword_10001E068);
  uint64_t v6 = sub_100012BB0();
  os_log_type_t v7 = sub_100013050();
  if (os_log_type_enabled(v6, v7))
  {
    long long v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)long long v8 = 136315138;
    type metadata accessor for CGSize(0);
    uint64_t v9 = sub_100013010();
    sub_100012000(v9, v10, &v15);
    sub_1000130A0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "extn compact onGeometryChange %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  *(double *)(a2 + 64) = v3;
  *(double *)(a2 + 72) = v4;
  *(unsigned char *)(a2 + 80) = 0;
  uint64_t v11 = *(void (**)(double, double))(a2 + 48);
  if (v11)
  {
    swift_retain();
    uint64_t v12 = sub_100012BB0();
    os_log_type_t v13 = sub_100013050();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "extn compact contentSizeReply", v14, 2u);
      swift_slowDealloc();
    }

    v11(v3, v4);
    sub_10000ECE0((uint64_t)v11);
  }
}

uint64_t sub_10000C55C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000BC7C(*v1, a1);
}

uint64_t sub_10000C564()
{
  id v1 = [v0 _geoAddress];
  if (v1)
  {
    uint64_t v2 = v1;
    if ([v1 hasStructuredAddress])
    {
      id v3 = [v2 structuredAddress];
      if (v3)
      {
        double v4 = v3;
        if ([v3 hasFullThoroughfare])
        {
          id v5 = [v4 fullThoroughfare];
          if (v5)
          {
            uint64_t v6 = v5;
            uint64_t v7 = sub_100012FF0();

            goto LABEL_13;
          }
          long long v8 = v4;
        }
        else
        {
          long long v8 = v2;
          uint64_t v2 = v4;
        }
      }
    }
  }
  id v9 = [v0 _shortAddress];
  if (!v9) {
    return 0;
  }
  uint64_t v2 = v9;
  uint64_t v7 = sub_100012FF0();
LABEL_13:

  return v7;
}

id sub_10000C684()
{
  id result = [v0 _geoMapItem];
  if (!result) {
    goto LABEL_30;
  }
  id v2 = [result _enclosingPlace];
  swift_unknownObjectRelease();
  if (!v2) {
    goto LABEL_11;
  }
  id v3 = [v2 containmentTextTemplate];
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    id v5 = [objc_allocWithZone((Class)GEOComposedString) initWithGeoFormattedString:v4];
    id v6 = [v5 stringResultWithOptions:0];
    id v7 = [v6 styleReplacementResults];
    sub_10000FCD4();
    unint64_t v8 = sub_100013040();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_100013110();
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_6;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      if ((v8 & 0xC000000000000001) != 0)
      {
        sub_1000130E0();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
LABEL_8:
        id v10 = [v0 _firstLocalizedCategoryName];
        if (!v10)
        {
          __break(1u);
          goto LABEL_10;
        }
LABEL_18:
        uint64_t v21 = v10;
        uint64_t v22 = sub_100012FF0();
        uint64_t v24 = v23;

        uint64_t v16 = sub_10000F108(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
        unint64_t v25 = *((void *)v16 + 2);
        unint64_t v26 = *((void *)v16 + 3);
        unint64_t v27 = v25 + 1;
        if (v25 >= v26 >> 1)
        {
          unint64_t v40 = v25 + 1;
          uint64_t v37 = v16;
          unint64_t v38 = *((void *)v16 + 2);
          uint64_t v39 = sub_10000F108((char *)(v26 > 1), v25 + 1, 1, v37);
          unint64_t v25 = v38;
          unint64_t v27 = v40;
          uint64_t v16 = v39;
        }
        *((void *)v16 + 2) = v27;
        uint64_t v28 = &v16[32 * v25];
        *((void *)v28 + 4) = v22;
        *((void *)v28 + 5) = v24;
        v28[48] = 0;
        *((void *)v28 + 7) = &_swiftEmptyArrayStorage;

        swift_unknownObjectRelease();
        goto LABEL_21;
      }
      uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRelease();
      if (v9) {
        goto LABEL_8;
      }
      __break(1u);
LABEL_30:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRelease();
    id v10 = [v6 string];
    goto LABEL_18;
  }
LABEL_10:

  swift_unknownObjectRelease();
LABEL_11:
  id v11 = [v0 _firstLocalizedCategoryName];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100012FF0();
    uint64_t v15 = v14;

    uint64_t v16 = sub_10000F108(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    unint64_t v18 = *((void *)v16 + 2);
    unint64_t v17 = *((void *)v16 + 3);
    if (v18 >= v17 >> 1) {
      uint64_t v16 = sub_10000F108((char *)(v17 > 1), v18 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v18 + 1;
    id v19 = &v16[32 * v18];
    *((void *)v19 + 4) = v13;
    *((void *)v19 + 5) = v15;
    v19[48] = 0;
    *((void *)v19 + 7) = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v16 = (char *)&_swiftEmptyArrayStorage;
  }
LABEL_21:
  uint64_t v29 = sub_10000C564();
  if (v30)
  {
    uint64_t v31 = v29;
    uint64_t v32 = v30;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v16 = sub_10000F108(0, *((void *)v16 + 2) + 1, 1, v16);
    }
    unint64_t v34 = *((void *)v16 + 2);
    unint64_t v33 = *((void *)v16 + 3);
    if (v34 >= v33 >> 1) {
      uint64_t v16 = sub_10000F108((char *)(v33 > 1), v34 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v34 + 1;
    char v35 = &v16[32 * v34];
    *((void *)v35 + 4) = v31;
    *((void *)v35 + 5) = v32;
    v35[48] = 0;
    *((void *)v35 + 7) = &_swiftEmptyArrayStorage;
  }
  uint64_t v36 = sub_10000FA5C((uint64_t)v16);
  swift_bridgeObjectRelease();
  return (id)v36;
}

id sub_10000CA7C()
{
  id v1 = v0;
  if ([v0 _hasBusinessHours]
    && (id v2 = [v0 searchResultsHoursWithConciseStyle:1 openAt:0]) != 0)
  {
    id v3 = v2;
    id v4 = [v2 localizedOperatingHours];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = sub_100012FF0();
      uint64_t v8 = v7;

      uint64_t v9 = sub_10000F108(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      unint64_t v11 = *((void *)v9 + 2);
      unint64_t v10 = *((void *)v9 + 3);
      if (v11 >= v10 >> 1) {
        uint64_t v9 = sub_10000F108((char *)(v10 > 1), v11 + 1, 1, v9);
      }
      *((void *)v9 + 2) = v11 + 1;
      uint64_t v12 = &v9[32 * v11];
      *((void *)v12 + 4) = v6;
      *((void *)v12 + 5) = v8;
      v12[48] = 0;
      *((void *)v12 + 7) = &_swiftEmptyArrayStorage;
    }
    else
    {
      uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  }
  id result = [v1 _geoMapItem];
  if (result)
  {
    unsigned int v14 = [result _hasAppleRatings];
    swift_unknownObjectRelease();
    if (v14)
    {
      uint64_t v15 = self;
      id v16 = [v15 ratingSymbolName];
      sub_100012FF0();

      sub_100012F80();
      uint64_t v17 = sub_100012F10();
      uint64_t v19 = v18;
      LOBYTE(v16) = v20 & 1;
      uint64_t v21 = sub_100012EE0();
      uint64_t v23 = v22;
      char v25 = v24 & 1;
      sub_10000F5A0(v17, v19, (char)v16);
      swift_bridgeObjectRelease();
      id v26 = [v15 compactUserRecommendedRatingSummaryStringForMapItem:v1];
      sub_100012FF0();

      uint64_t v27 = sub_100012EE0();
      uint64_t v29 = v28;
      char v31 = v30;
      uint64_t v33 = v32;
      swift_bridgeObjectRelease();
      sub_10000F5A0(v21, v23, v25);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_10000F108(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v35 = *((void *)v9 + 2);
      unint64_t v34 = *((void *)v9 + 3);
      if (v35 >= v34 >> 1) {
        uint64_t v9 = sub_10000F108((char *)(v34 > 1), v35 + 1, 1, v9);
      }
      *((void *)v9 + 2) = v35 + 1;
      uint64_t v36 = &v9[32 * v35];
      *((void *)v36 + 4) = v27;
      *((void *)v36 + 5) = v29;
      v36[48] = v31 & 1;
      *((void *)v36 + 7) = v33;
    }
    uint64_t v37 = sub_10000FA5C((uint64_t)v9);
    swift_bridgeObjectRelease();
    return (id)v37;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000CDBC@<X0>(uint64_t a1@<X8>)
{
  id v3 = [v1 _attribution];
  if (!v3)
  {
LABEL_10:
    uint64_t v42 = sub_10000570C(&qword_10001D088);
    uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
    return (id)v43(a1, 1, 1, v42);
  }
  id v4 = v3;
  if (![v3 requiresAttributionInDeveloperPlaceCard]
    || (id v5 = [v4 attributionURLs]) == 0
    || (uint64_t v6 = v5, v7 = sub_100013040(), v6, v8 = sub_10000D3F8(v7), swift_bridgeObjectRelease(), !v8))
  {

    goto LABEL_10;
  }
  uint64_t v53 = v8;
  uint64_t v54 = a1;
  id v9 = [self developerPlaceCardCompactAttributionFormatString];
  sub_100012FF0();

  sub_10000570C(&qword_10001D0F8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000141B0;
  id result = [v4 providerName];
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = sub_100012FF0();
    uint64_t v15 = v14;

    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_10000F648();
    *(void *)(v10 + 32) = v13;
    *(void *)(v10 + 40) = v15;
    sub_100013000();
    swift_bridgeObjectRelease();
    uint64_t v51 = (unsigned char *)sub_100012EE0();
    uint64_t v17 = v16;
    char v19 = v18;
    swift_bridgeObjectRelease();
    sub_100012F80();
    uint64_t v20 = sub_100012F10();
    uint64_t v22 = v21;
    char v24 = v23 & 1;
    uint64_t v25 = v17;
    uint64_t v26 = sub_100012EE0();
    int v50 = v27;
    char v28 = v27 & 1;
    uint64_t v29 = v20;
    uint64_t v31 = v30;
    sub_10000F5A0(v29, v22, v24);
    swift_bridgeObjectRelease();
    sub_10000F5A0((uint64_t)v51, v25, v19 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v32 = v53;
    swift_bridgeObjectRetain();
    id v33 = v4;
    uint64_t v52 = v26;
    sub_10000F4F0(v26, v31, v28);
    Class isa = sub_100013030().super.isa;
    swift_bridgeObjectRelease();
    id v35 = [self punchoutOptionsForURLStrings:isa withAttribution:v33];

    if (v35)
    {
      if ([v35 strategy] == (id)1)
      {
        swift_bridgeObjectRelease();
        uint64_t v36 = swift_allocObject();
        uint64_t v53 = v49;
        *(void *)(v36 + 16) = v35;
        __chkstk_darwin(v36);
        uint64_t v37 = v52;
        char v38 = v50 & 1;
        id v39 = v35;
        sub_10000570C(&qword_10001D0B0);
        sub_10000F394();
        uint64_t v40 = v54;
        sub_100012F90();

        sub_10000F5A0(v37, v31, v38);
        swift_bridgeObjectRelease();
        sub_10000F5A0(v37, v31, v38);
        swift_bridgeObjectRelease();
        uint64_t v41 = sub_10000570C(&qword_10001D088);
        return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
      }
    }
    uint64_t v44 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v45 = swift_allocObject();
    uint64_t v51 = v49;
    *(void *)(v45 + 16) = v44;
    *(void *)(v45 + 24) = v32;
    __chkstk_darwin(v45);
    uint64_t v46 = v52;
    swift_retain();
    sub_10000570C(&qword_10001D0B0);
    sub_10000F394();
    uint64_t v47 = v54;
    sub_100012F90();

    sub_10000F5A0(v46, v31, v28);
    swift_bridgeObjectRelease();
    sub_10000F5A0(v46, v31, v28);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v48 = sub_10000570C(&qword_10001D088);
    return (id)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 0, 1, v48);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_10000D3F8(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_10000F77C(0, v2, 0);
  id v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_10000F79C(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000F77C(0, v3[2] + 1, 1);
        id v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000F77C(v5 > 1, v6 + 1, 1);
        id v3 = v12;
      }
      v3[2] = v6 + 1;
      uint64_t v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void sub_10000D540(void *a1)
{
  uint64_t v2 = sub_100012AF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self sharedInstance];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [a1 urlToOpen];
    sub_100012AE0();

    sub_100012AD0(v9);
    unint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    NSString v12 = [a1 appBundleIdentifier];
    if (!v12)
    {
      sub_100012FF0();
      NSString v12 = sub_100012FE0();
      swift_bridgeObjectRelease();
    }
    [v7 openURL:v11 bundleIdentifier:v12 completionHandler:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D6C4()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    id v2 = [Strong _attribution];

    if (v2)
    {
      uint64_t v3 = self;
      Class isa = sub_100013030().super.isa;
      [v3 launchAttributionURLs:isa withAttribution:v2 completionHandler:0];
    }
  }
}

uint64_t sub_10000D784@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000570C(&qword_10001D040);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000570C(&qword_10001D048);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)id v6 = sub_100012CE0();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v11 = sub_10000570C(&qword_10001D050);
  sub_10000D950(a1, &v6[*(int *)(v11 + 44)]);
  LOBYTE(a1) = sub_100012E70();
  sub_100012BE0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  sub_10000FF60((uint64_t)v6, (uint64_t)v10, &qword_10001D040);
  uint64_t v20 = &v10[*(int *)(v8 + 44)];
  *uint64_t v20 = (char)a1;
  *((void *)v20 + 1) = v13;
  *((void *)v20 + 2) = v15;
  *((void *)v20 + 3) = v17;
  *((void *)v20 + 4) = v19;
  v20[40] = 0;
  sub_100010128((uint64_t)v6, &qword_10001D040);
  char v21 = sub_100012E50();
  sub_100012BE0();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_10000FF60((uint64_t)v10, a2, &qword_10001D048);
  uint64_t v30 = a2 + *(int *)(sub_10000570C(&qword_10001D058) + 36);
  *(unsigned char *)uint64_t v30 = v21;
  *(void *)(v30 + 8) = v23;
  *(void *)(v30 + 16) = v25;
  *(void *)(v30 + 24) = v27;
  *(void *)(v30 + 32) = v29;
  *(unsigned char *)(v30 + 40) = 0;
  return sub_100010128((uint64_t)v10, &qword_10001D048);
}

uint64_t sub_10000D950@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  v122 = a2;
  uint64_t v129 = sub_10000570C(&qword_10001D060);
  uint64_t v128 = *(void *)(v129 - 8);
  __chkstk_darwin(v129);
  v127 = (char *)&v115 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_10000570C(&qword_10001D068);
  uint64_t v130 = *(void *)(v131 - 8);
  uint64_t v4 = __chkstk_darwin(v131);
  v144 = (char *)&v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v143 = (char *)&v115 - v6;
  uint64_t v125 = sub_100012C70();
  uint64_t v132 = *(void *)(v125 - 8);
  __chkstk_darwin(v125);
  v124 = (char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_10000570C(&qword_10001D070);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  v118 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_10000570C(&qword_10001D078);
  uint64_t v121 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  v117 = (char *)&v115 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000570C(&qword_10001D080);
  __chkstk_darwin(v10 - 8);
  uint64_t v126 = (uint64_t)&v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_10000570C(&qword_10001D088);
  uint64_t v133 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  v116 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000570C(&qword_10001D090);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v142 = (uint64_t)&v115 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v134 = (uint64_t)&v115 - v16;
  v152 = a1;
  id v17 = [a1 name];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = sub_100012FF0();
    uint64_t v21 = v20;

    uint64_t v153 = v19;
    uint64_t v154 = v21;
    sub_10000F5F4();
    uint64_t v22 = sub_100012F00();
    uint64_t v24 = v23;
    char v26 = v25 & 1;
    sub_100012E80();
    uint64_t v27 = sub_100012EF0();
    uint64_t v29 = v28;
    char v31 = v30;
    swift_release();
    sub_10000F5A0(v22, v24, v26);
    swift_bridgeObjectRelease();
    sub_100012EA0();
    uint64_t v32 = sub_100012EC0();
    uint64_t v34 = v33;
    char v36 = v35 & 1;
    sub_10000F5A0(v27, v29, v31 & 1);
    swift_bridgeObjectRelease();
    id v37 = [self labelColor];
    uint64_t v153 = sub_100012F70();
    uint64_t v38 = sub_100012ED0();
    uint64_t v150 = v40;
    uint64_t v151 = v39;
    uint64_t v146 = v41 & 1;
    sub_10000F5A0(v32, v34, v36);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v150 = 0;
    uint64_t v151 = 0;
    uint64_t v146 = 0;
  }
  id v42 = sub_10000C684();
  uint64_t v46 = v45;
  if (v45)
  {
    uint64_t v47 = (uint64_t)v42;
    uint64_t v48 = v43;
    uint64_t v49 = v44 & 1;
    int v50 = self;
    sub_10000F4F0(v47, v48, v49);
    swift_bridgeObjectRetain();
    id v51 = [v50 labelColor];
    uint64_t v52 = sub_100012F70();
    uint64_t v148 = v48;
    uint64_t v149 = v47;
    uint64_t v141 = v49;
    sub_10000F5A0(v47, v48, v49);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v148 = 0;
    uint64_t v149 = 0;
    uint64_t v141 = 0;
    uint64_t v52 = 0;
  }
  uint64_t v53 = v140;
  id v54 = sub_10000CA7C();
  uint64_t v58 = v57;
  if (v57)
  {
    uint64_t v59 = (uint64_t)v54;
    uint64_t v60 = v55;
    uint64_t v61 = v56 & 1;
    id v62 = self;
    sub_10000F4F0(v59, v60, v61);
    swift_bridgeObjectRetain();
    id v63 = [v62 labelColor];
    uint64_t v135 = sub_100012F70();
    uint64_t v136 = v61;
    sub_10000F5A0(v59, v60, v61);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v136 = 0;
    uint64_t v135 = 0;
  }
  uint64_t v64 = v126;
  sub_10000CDBC(v126);
  uint64_t v65 = v133;
  int v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v133 + 48))(v64, 1, v53);
  uint64_t v147 = v38;
  uint64_t v145 = v46;
  uint64_t v140 = v52;
  uint64_t v139 = v58;
  uint64_t v138 = v59;
  uint64_t v137 = v60;
  if (v66 == 1)
  {
    sub_100010128(v64, &qword_10001D080);
    uint64_t v67 = 1;
    uint64_t v68 = v134;
    uint64_t v69 = v123;
    uint64_t v70 = v121;
    uint64_t v71 = v132;
    uint64_t v72 = v125;
    v73 = v124;
  }
  else
  {
    v74 = v116;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(v116, v64, v53);
    v75 = v124;
    sub_100012C60();
    sub_10000B344(&qword_10001D0E8, &qword_10001D088);
    sub_10000F464(&qword_10001D0D8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    v76 = v118;
    uint64_t v77 = v125;
    sub_100012F50();
    (*(void (**)(char *, uint64_t))(v132 + 8))(v75, v77);
    id v78 = [self secondaryLabelColor];
    uint64_t v79 = sub_100012F70();
    uint64_t v80 = v119;
    v81 = v117;
    uint64_t v82 = v53;
    uint64_t v83 = v120;
    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v117, v76, v120);
    uint64_t v69 = v123;
    *(void *)&v81[*(int *)(v123 + 36)] = v79;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v76, v83);
    uint64_t v84 = v82;
    v73 = v75;
    (*(void (**)(char *, uint64_t))(v133 + 8))(v74, v84);
    uint64_t v85 = (uint64_t)v81;
    uint64_t v72 = v77;
    uint64_t v71 = v132;
    uint64_t v68 = v134;
    sub_100008028(v85, v134, &qword_10001D078);
    uint64_t v67 = 0;
    uint64_t v70 = v121;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v68, v67, 1, v69);
  sub_100012FA0();
  sub_100012C30();
  uint64_t v133 = v153;
  LODWORD(v132) = v154;
  uint64_t v126 = v155;
  LODWORD(v125) = v156;
  v124 = v157;
  uint64_t v123 = v158;
  uint64_t v86 = swift_allocObject();
  v87 = v152;
  *(void *)(v86 + 16) = v152;
  id v88 = v87;
  sub_10000570C(&qword_10001D098);
  sub_10000F2F4();
  v89 = v127;
  sub_100012F90();
  sub_100012C60();
  sub_10000B344(&qword_10001D0D0, &qword_10001D060);
  sub_10000F464(&qword_10001D0D8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  v90 = v144;
  uint64_t v91 = v129;
  sub_100012F50();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v72);
  (*(void (**)(char *, uint64_t))(v128 + 8))(v89, v91);
  uint64_t v92 = v130;
  v93 = v143;
  uint64_t v94 = v131;
  (*(void (**)(char *, char *, uint64_t))(v130 + 32))(v143, v90, v131);
  uint64_t v95 = v68;
  uint64_t v96 = v142;
  sub_10000FF60(v95, v142, &qword_10001D090);
  v97 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
  v97(v90, v93, v94);
  uint64_t v98 = v146;
  v99 = v122;
  uint64_t v100 = v151;
  *(void *)v122 = v147;
  *((void *)v99 + 1) = v100;
  uint64_t v146 = v98;
  uint64_t v101 = v150;
  *((void *)v99 + 2) = v98;
  *((void *)v99 + 3) = v101;
  uint64_t v102 = v148;
  *((void *)v99 + 4) = v149;
  *((void *)v99 + 5) = v102;
  uint64_t v103 = v145;
  *((void *)v99 + 6) = v141;
  *((void *)v99 + 7) = v103;
  uint64_t v104 = v138;
  *((void *)v99 + 8) = v140;
  *((void *)v99 + 9) = v104;
  uint64_t v105 = v136;
  *((void *)v99 + 10) = v137;
  *((void *)v99 + 11) = v105;
  uint64_t v106 = v135;
  *((void *)v99 + 12) = v139;
  *((void *)v99 + 13) = v106;
  v107 = (int *)sub_10000570C(&qword_10001D0E0);
  sub_10000FF60(v96, (uint64_t)&v99[v107[20]], &qword_10001D090);
  v108 = &v99[v107[24]];
  *(void *)v108 = 0;
  v108[8] = 1;
  *((void *)v108 + 2) = v133;
  v108[24] = v132;
  *((void *)v108 + 4) = v126;
  v108[40] = v125;
  uint64_t v109 = v123;
  *((void *)v108 + 6) = v124;
  *((void *)v108 + 7) = v109;
  v97(&v99[v107[28]], v90, v94);
  sub_10000F4AC(v147, v151, v98, v150);
  LOBYTE(v107) = v141;
  sub_10000F500(v149, v148, v141, v145);
  uint64_t v110 = v138;
  uint64_t v111 = v137;
  LOBYTE(v96) = v136;
  uint64_t v112 = v139;
  sub_10000F500(v138, v137, v136, v139);
  v113 = *(void (**)(char *, uint64_t))(v92 + 8);
  v113(v143, v94);
  sub_100010128(v134, &qword_10001D090);
  v113(v144, v94);
  sub_100010128(v142, &qword_10001D090);
  sub_10000F550(v110, v111, v96, v112);
  sub_10000F550(v149, v148, (char)v107, v145);
  return sub_10000F5B0(v147, v151, v146, v150);
}

uint64_t sub_10000E770@<X0>(uint64_t a1@<X8>)
{
  id v2 = [self developerPlaceCardOpenInMapsText];
  uint64_t v3 = sub_100012FF0();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  uint64_t result = sub_100012F70();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_10000E804@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D784(*v1, a1);
}

uint64_t sub_10000E80C(uint64_t a1)
{
  uint64_t v2 = sub_10000570C(&qword_10001D140);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000570C(&qword_10001D148);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = sub_10000570C(&qword_10001D150);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v5, a1, v10);
  uint64_t v11 = &v5[*(int *)(v3 + 44)];
  *(void *)uint64_t v11 = KeyPath;
  v11[8] = 0;
  uint64_t v12 = sub_100012EB0();
  uint64_t v13 = swift_getKeyPath();
  sub_10000FF60((uint64_t)v5, (uint64_t)v8, &qword_10001D140);
  uint64_t v14 = (uint64_t *)&v8[*(int *)(v6 + 36)];
  uint64_t *v14 = v13;
  v14[1] = v12;
  sub_100010128((uint64_t)v5, &qword_10001D140);
  sub_100012E90();
  sub_10000FFC4();
  sub_100012F40();
  return sub_100010128((uint64_t)v8, &qword_10001D148);
}

uint64_t sub_10000E9D4()
{
  return sub_100012C20();
}

id sub_10000E9F4()
{
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012BD0();
  sub_1000057F4(v0, (uint64_t)qword_10001E068);
  id v1 = sub_100012BB0();
  os_log_type_t v2 = sub_100013050();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "extn compact representable make loading view", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = objc_allocWithZone((Class)MKCompactDeveloperPlaceCardLoadingView);

  return [v4 init];
}

void sub_10000EAF0()
{
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100012BD0();
  sub_1000057F4(v0, (uint64_t)qword_10001E068);
  oslog = sub_100012BB0();
  os_log_type_t v1 = sub_100013050();
  if (os_log_type_enabled(oslog, v1))
  {
    os_log_type_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "extn compact representable update loading view", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10000EBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000FD14();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000EC3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000FD14();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10000ECA0()
{
}

uint64_t sub_10000ECE0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for CompactPlaceCardView()
{
  return &type metadata for CompactPlaceCardView;
}

uint64_t sub_10000ED00()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000ED1C()
{
  unint64_t result = qword_10001CFD8;
  if (!qword_10001CFD8)
  {
    sub_1000057AC(&qword_10001CFC8);
    sub_10000EDBC();
    sub_10000B344(&qword_10001D028, &qword_10001CFC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CFD8);
  }
  return result;
}

unint64_t sub_10000EDBC()
{
  unint64_t result = qword_10001CFE0;
  if (!qword_10001CFE0)
  {
    sub_1000057AC(&qword_10001CFD0);
    sub_10000EE70(&qword_10001CFE8, &qword_10001CFF0, (void (*)(void))sub_10000EEF8, (void (*)(void))sub_10000EFEC);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CFE0);
  }
  return result;
}

uint64_t sub_10000EE70(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000057AC(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000EEF8()
{
  unint64_t result = qword_10001CFF8;
  if (!qword_10001CFF8)
  {
    sub_1000057AC(&qword_10001D000);
    sub_10000EF98();
    sub_10000B344(&qword_10001D010, &qword_10001D018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CFF8);
  }
  return result;
}

unint64_t sub_10000EF98()
{
  unint64_t result = qword_10001D008;
  if (!qword_10001D008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D008);
  }
  return result;
}

unint64_t sub_10000EFEC()
{
  unint64_t result = qword_10001D020;
  if (!qword_10001D020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D020);
  }
  return result;
}

uint64_t sub_10000F040()
{
  return sub_100012C80();
}

void *sub_10000F068(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0)
  {
    id v7 = result;
    swift_retain();
    return (void *)swift_retain();
  }
  return result;
}

void *sub_10000F0B4(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a6 & 1) == 0)
  {

    swift_release();
    return (void *)swift_release();
  }
  return result;
}

void sub_10000F100(double *a1)
{
  sub_10000C314(a1, v1);
}

char *sub_10000F108(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000570C(&qword_10001D110);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000F968(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for CompactPlaceCardLoadingView()
{
  return &type metadata for CompactPlaceCardLoadingView;
}

ValueMetadata *type metadata accessor for CompactPlaceCardContentView()
{
  return &type metadata for CompactPlaceCardContentView;
}

uint64_t sub_10000F238()
{
  return sub_10000EE70(&qword_10001D030, &qword_10001D038, (void (*)(void))sub_10000ED1C, (void (*)(void))sub_10000EDBC);
}

uint64_t sub_10000F28C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F2A8()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000F2E0()
{
  return [*(id *)(v0 + 16) openInMapsWithLaunchOptions:0];
}

unint64_t sub_10000F2F4()
{
  unint64_t result = qword_10001D0A0;
  if (!qword_10001D0A0)
  {
    sub_1000057AC(&qword_10001D098);
    sub_10000F394();
    sub_10000B344(&qword_10001D0C0, &qword_10001D0C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D0A0);
  }
  return result;
}

unint64_t sub_10000F394()
{
  unint64_t result = qword_10001D0A8;
  if (!qword_10001D0A8)
  {
    sub_1000057AC(&qword_10001D0B0);
    sub_10000F410();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D0A8);
  }
  return result;
}

unint64_t sub_10000F410()
{
  unint64_t result = qword_10001D0B8;
  if (!qword_10001D0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D0B8);
  }
  return result;
}

uint64_t sub_10000F464(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000F4AC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000F4F0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000F4F0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000F500(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000F4F0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000F550(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000F5A0(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000F5A0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000F5B0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000F5A0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10000F5F4()
{
  unint64_t result = qword_10001D0F0;
  if (!qword_10001D0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D0F0);
  }
  return result;
}

unint64_t sub_10000F648()
{
  unint64_t result = qword_10001D100;
  if (!qword_10001D100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D100);
  }
  return result;
}

uint64_t sub_10000F69C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000F6D4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000F714()
{
}

void sub_10000F720()
{
  sub_10000D540(*(void **)(v0 + 16));
}

uint64_t sub_10000F728@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  char v4 = *(unsigned char *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  sub_10000F4F0(v2, v3, v4);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000F77C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000F7F8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000F79C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000F7F8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000570C(&qword_10001D108);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100013120();
  __break(1u);
  return result;
}

uint64_t sub_10000F968(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100013120();
  __break(1u);
  return result;
}

uint64_t sub_10000FA5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  uint64_t v6 = v1 - 1;
  if (v1 == 1)
  {
    sub_10000F4F0(*(void *)(a1 + 32), v3, v5);
    swift_bridgeObjectRetain();
  }
  else
  {
    id v25 = self;
    sub_10000F4F0(v4, v3, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000F4F0(v4, v3, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = a1 + 88;
    uint64_t v24 = v3;
    uint64_t v8 = v4;
    char v9 = v5;
    do
    {
      uint64_t v32 = v6;
      uint64_t v30 = v8;
      uint64_t v31 = v3;
      uint64_t v11 = *(void *)(v7 - 24);
      uint64_t v10 = *(void *)(v7 - 16);
      uint64_t v28 = v10;
      char v12 = *(unsigned char *)(v7 - 8);
      char v27 = v12;
      v7 += 32;
      sub_10000F4F0(v11, v10, v12);
      swift_bridgeObjectRetain();
      id v13 = [v25 interpunctDelimeter];
      sub_100012FF0();

      char v29 = v9 & 1;
      uint64_t v14 = sub_100012EE0();
      uint64_t v16 = v15;
      char v18 = v17;
      swift_bridgeObjectRelease();
      uint64_t v26 = sub_100012EE0();
      uint64_t v20 = v19;
      uint64_t v21 = v16;
      uint64_t v3 = v20;
      char v9 = v22 & 1;
      sub_10000F5A0(v14, v21, v18 & 1);
      uint64_t v8 = v26;
      swift_bridgeObjectRelease();
      sub_10000F5A0(v11, v28, v27);
      swift_bridgeObjectRelease();
      sub_10000F5A0(v30, v31, v29);
      swift_bridgeObjectRelease();
      uint64_t v6 = v32 - 1;
    }
    while (v32 != 1);
    swift_bridgeObjectRelease_n();
    sub_10000F5A0(v4, v24, v5);
    swift_bridgeObjectRelease();
    return v26;
  }
  return v4;
}

unint64_t sub_10000FCD4()
{
  unint64_t result = qword_10001D118;
  if (!qword_10001D118)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001D118);
  }
  return result;
}

unint64_t sub_10000FD14()
{
  unint64_t result = qword_10001D120;
  if (!qword_10001D120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D120);
  }
  return result;
}

ValueMetadata *type metadata accessor for CompactPlaceCardStandardLabelStyle()
{
  return &type metadata for CompactPlaceCardStandardLabelStyle;
}

unint64_t sub_10000FD7C()
{
  unint64_t result = qword_10001D128;
  if (!qword_10001D128)
  {
    sub_1000057AC(&qword_10001D058);
    sub_10000FDF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D128);
  }
  return result;
}

unint64_t sub_10000FDF8()
{
  unint64_t result = qword_10001D130;
  if (!qword_10001D130)
  {
    sub_1000057AC(&qword_10001D048);
    sub_10000B344(&qword_10001D138, &qword_10001D040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D130);
  }
  return result;
}

uint64_t sub_10000FE98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000FEB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100012CA0();
  *a1 = result;
  return result;
}

uint64_t sub_10000FEE0()
{
  return sub_100012CB0();
}

uint64_t sub_10000FF08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100012CC0();
  *a1 = result;
  return result;
}

uint64_t sub_10000FF34()
{
  return sub_100012CD0();
}

uint64_t sub_10000FF60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000570C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000FFC4()
{
  unint64_t result = qword_10001D158;
  if (!qword_10001D158)
  {
    sub_1000057AC(&qword_10001D148);
    sub_100010064();
    sub_10000B344(&qword_10001D180, &qword_10001D188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D158);
  }
  return result;
}

unint64_t sub_100010064()
{
  unint64_t result = qword_10001D160;
  if (!qword_10001D160)
  {
    sub_1000057AC(&qword_10001D140);
    sub_10000B344(&qword_10001D168, &qword_10001D150);
    sub_10000B344(&qword_10001D170, &qword_10001D178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D160);
  }
  return result;
}

uint64_t sub_100010128(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000570C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000101E4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100010248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_100010280(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000102C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

id sub_1000102D0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100011F04(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 16);
  *a2 = v4;

  return v4;
}

void sub_100010388(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100011F04(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  id v2 = v1;
  sub_100012B00();
  swift_release();
}

uint64_t sub_100010464@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100011F04(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  uint64_t result = swift_release();
  char v5 = *(unsigned char *)(v3 + 28);
  *(_DWORD *)a2 = *(_DWORD *)(v3 + 24);
  *(unsigned char *)(a2 + 4) = v5;
  return result;
}

uint64_t sub_100010514()
{
  return swift_release();
}

uint64_t sub_1000105EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100011F04(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
  sub_100012B10();
  uint64_t result = swift_release();
  char v5 = *(unsigned char *)(v3 + 40);
  *(void *)a2 = *(void *)(v3 + 32);
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_10001069C()
{
  return swift_release();
}

uint64_t sub_100010770()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 88);
  swift_retain_n();
  swift_bridgeObjectRetain();

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v1, v2, sub_1000126E0, v0, sub_1000126E8, v0, v3, v4);
}

uint64_t sub_100010838@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v14 - v9;
  (*(void (**)(void))(v8 + 32))();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, v3);
  char v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  v11(a2, v10, v3);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, v3);
}

uint64_t sub_100010988(void *a1, uint64_t a2)
{
  id v4 = [self interfaceWithProtocol:&OBJC_PROTOCOL___MKRemoteUIAccessoryPlaceCardExtensionInterface];
  [a1 setExportedInterface:v4];

  [a1 setExportedObject:a2];
  if (qword_10001C840 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100012BD0();
  sub_1000057F4(v5, (uint64_t)qword_10001E068);
  uint64_t v6 = sub_100012BB0();
  os_log_type_t v7 = sub_100013060();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "extn compact-accessory scene connection resume", v8, 2u);
    swift_slowDealloc();
  }

  [a1 resume];
  return 1;
}

uint64_t sub_100010AD8(uint64_t a1, int a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v21 = a3;
  uint64_t v7 = *v4;
  uint64_t v8 = sub_100012FB0();
  uint64_t v23 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100012FD0();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  if (a1) {
    *(void *)(v14 + 16) = [objc_allocWithZone((Class)MKMapItem) initWithGeoMapItem:a1 isPlaceHolderPlace:0];
  }
  sub_100005638();
  uint64_t v15 = (void *)sub_100013080();
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = *(void *)(v7 + 80);
  *(void *)(v17 + 24) = *(void *)(v7 + 88);
  *(void *)(v17 + 32) = v16;
  *(void *)(v17 + 40) = v14;
  *(_DWORD *)(v17 + 48) = a2;
  *(void *)(v17 + 56) = v21;
  aBlock[4] = sub_100011FC4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_100019740;
  char v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100011F04(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  return swift_release();
}

void sub_100010E4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v43 = a4;
  uint64_t v6 = sub_100012BD0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v12 = (void **)(a2 + 16);
    uint64_t v13 = sub_1000057F4(v6, (uint64_t)qword_10001E068);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
    swift_retain_n();
    uint64_t v14 = sub_100012BB0();
    int v15 = sub_100013050();
    BOOL v16 = os_log_type_enabled(v14, (os_log_type_t)v15);
    int v42 = a3;
    if (v16)
    {
      int v40 = v15;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v45[0] = v39;
      *(_DWORD *)uint64_t v17 = 136380675;
      swift_beginAccess();
      char v18 = *v12;
      uint64_t v41 = v11;
      if (v18)
      {
        uint64_t v38 = (void **)(a2 + 16);
        id v19 = v18;
        id v20 = [v19 name];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = sub_100012FF0();
          unint64_t v24 = v23;
        }
        else
        {

          uint64_t v22 = 0;
          unint64_t v24 = 0xE000000000000000;
        }
        uint64_t v12 = v38;
      }
      else
      {
        unint64_t v24 = 0xE300000000000000;
        uint64_t v22 = 7104878;
      }
      uint64_t v44 = sub_100012000(v22, v24, v45);
      sub_1000130A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, (os_log_type_t)v40, "extn compact-accessory scene configure with item: %{private}s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v11 = v41;
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    uint64_t v28 = *(void *)(v11 + 48);
    swift_beginAccess();
    char v29 = *v12;
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(&v37 - 2) = v28;
    *(&v37 - 1) = (uint64_t)v29;
    uint64_t v44 = v28;
    sub_100011F04(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
    swift_retain();
    id v31 = v29;
    sub_100012B00();
    swift_release();
    swift_release();

    uint64_t v32 = *(void *)(v11 + 48);
    uint64_t v33 = swift_getKeyPath();
    __chkstk_darwin(v33);
    *(&v37 - 2) = v32;
    *((_DWORD *)&v37 - 2) = v42;
    *((unsigned char *)&v37 - 4) = 0;
    uint64_t v44 = v32;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    uint64_t v34 = *(void *)(v11 + 48);
    uint64_t v35 = swift_getKeyPath();
    __chkstk_darwin(v35);
    uint64_t v36 = v43;
    *(&v37 - 4) = v34;
    *(&v37 - 3) = v36;
    *((unsigned char *)&v37 - 16) = 0;
    uint64_t v44 = v34;
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    sub_1000057F4(v6, (uint64_t)qword_10001E068);
    id v25 = sub_100012BB0();
    os_log_type_t v26 = sub_100013070();
    if (os_log_type_enabled(v25, v26))
    {
      char v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "extn compact-accessory scene configure without self", v27, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100011474(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5)
{
  id v8 = a3;
  swift_retain();
  sub_100010AD8((uint64_t)a3, a4, a5);

  return swift_release();
}

void sub_1000114EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100012BD0();
    sub_1000057F4(v7, (uint64_t)qword_10001E068);
    id v8 = sub_100012BB0();
    os_log_type_t v9 = sub_100013060();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "extn compact-accessory fetchPreferredContentSize", v10, 2u);
      swift_slowDealloc();
    }

    uint64_t v11 = *(void *)(v6 + 48);
    uint64_t v12 = *(void *)(v11 + 48);
    *(void *)(v11 + 48) = a2;
    *(void *)(v11 + 56) = a3;
    swift_retain_n();
    swift_retain();
    sub_10000ECE0(v12);
    uint64_t v13 = *(void (**)(double, double))(v11 + 48);
    if (v13 && (*(unsigned char *)(v11 + 80) & 1) == 0)
    {
      double v15 = *(double *)(v11 + 64);
      double v14 = *(double *)(v11 + 72);
      swift_retain();
      BOOL v16 = sub_100012BB0();
      os_log_type_t v17 = sub_100013050();
      if (os_log_type_enabled(v16, v17))
      {
        char v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "extn compact contentSizeReply", v18, 2u);
        swift_slowDealloc();
      }

      v13(v15, v14);
      sub_10000ECE0((uint64_t)v13);
    }
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100012BD0();
    sub_1000057F4(v19, (uint64_t)qword_10001E068);
    id v20 = sub_100012BB0();
    os_log_type_t v21 = sub_100013070();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "extn compact-accessory fetchPreferredContentSize without self", v22, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000117B4(int a1, int a2, void *aBlock)
{
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  sub_100012738((uint64_t)sub_100012728, v4);
  swift_release();

  return swift_release();
}

uint64_t sub_100011844(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_100012FB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100012FD0();
  uint64_t v8 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005638();
  uint64_t v11 = (void *)sub_100013080();
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v3 + 80);
  v13[3] = *(void *)(v3 + 88);
  v13[4] = v12;
  v13[5] = a1;
  aBlock[4] = sub_100011EB8;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_1000196C8;
  double v14 = _Block_copy(aBlock);
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100011F04(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v17);
}

void sub_100011B44()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100011F04(&qword_10001D270, (void (*)(uint64_t))type metadata accessor for CompactPlaceCardViewModel);
    swift_retain();
    sub_100012B00();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_10001C840 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100012BD0();
    sub_1000057F4(v1, (uint64_t)qword_10001E068);
    uint64_t v2 = sub_100012BB0();
    os_log_type_t v3 = sub_100013070();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "extn compact-accessory scene update interface style without self", v4, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100011D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  sub_100011844(a3);

  return swift_release();
}

uint64_t type metadata accessor for CompactAccessoryPlaceCardScene()
{
  return sub_100005AD8();
}

uint64_t sub_100011DA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100011DE8()
{
  return sub_100010770();
}

uint64_t sub_100011E0C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_100011E48()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011E80()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100011EB8()
{
}

uint64_t sub_100011EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100011ED4()
{
  return swift_release();
}

uint64_t sub_100011EE4()
{
  return sub_10000B928(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_100011F04(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100011F4C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011F84()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_100011FC4()
{
  sub_100010E4C(*(void *)(v0 + 32), *(void *)(v0 + 40), *(_DWORD *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_100011FE8()
{
  return sub_1000126A8();
}

uint64_t sub_100012000(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000120D4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000F79C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000F79C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100012658((uint64_t)v12);
  return v7;
}

uint64_t sub_1000120D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1000130B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100012290(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1000130F0();
  if (!v8)
  {
    sub_100013100();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100013120();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100012290(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100012328(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100012508(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100012508(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100012328(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1000124A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000130D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100013100();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100013020();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100013120();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100013100();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000124A0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000570C(&qword_10001D278);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100012508(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000570C(&qword_10001D278);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100013120();
  __break(1u);
  return result;
}

uint64_t sub_100012658(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000126A8()
{
  return sub_10000B874(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32));
}

uint64_t sub_1000126E0@<X0>(char *a1@<X8>)
{
  return sub_100010838(v1, a1);
}

uint64_t sub_1000126E8(void *a1)
{
  return sub_100010988(a1, v1);
}

uint64_t sub_1000126F0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012728()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100012738(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = sub_100012FB0();
  uint64_t v18 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100012FD0();
  uint64_t v9 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  size_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005638();
  uint64_t v12 = (void *)sub_100013080();
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  double v14 = (void *)swift_allocObject();
  v14[2] = *(void *)(v5 + 80);
  v14[3] = *(void *)(v5 + 88);
  v14[4] = v13;
  v14[5] = a1;
  v14[6] = a2;
  aBlock[4] = sub_100012A8C;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010280;
  aBlock[3] = &unk_1000197B8;
  double v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_100012FC0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100011F04(&qword_10001C8E8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000570C(&qword_10001C8F0);
  sub_100005750();
  sub_1000130C0();
  sub_100013090();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

uint64_t sub_100012A4C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100012A8C()
{
  sub_1000114EC(v0[4], v0[5], v0[6]);
}

void *sub_100012A9C()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_100012AA8()
{
  return sub_100011EE4();
}

void sub_100012AD0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100012AE0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100012AF0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100012B00()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_100012B10()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_100012B20()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_100012B30()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_100012B50()
{
  return type metadata accessor for AppExtensionSceneConfiguration();
}

uint64_t sub_100012B70()
{
  return AppExtensionScene._makeScene(with:)();
}

uint64_t sub_100012B80()
{
  return _AnyAppExtensionScene.init<A>(erasing:)();
}

uint64_t sub_100012B90()
{
  return type metadata accessor for _AnyAppExtensionScene();
}

uint64_t sub_100012BA0()
{
  return static AppExtension<>.main()();
}

uint64_t sub_100012BB0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100012BC0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100012BD0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100012BE0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100012BF0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100012C00()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_100012C10()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_100012C20()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_100012C30()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100012C40()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100012C50()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t sub_100012C60()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_100012C70()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_100012C80()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100012C90()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100012CA0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100012CB0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100012CC0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100012CD0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100012CE0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100012CF0()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t sub_100012D00()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t sub_100012D10()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100012D30()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t sub_100012D40()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_100012D50()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t sub_100012D60()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t sub_100012D70()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t sub_100012D80()
{
  return UIViewRepresentable.body.getter();
}

uint64_t sub_100012DA0()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t sub_100012DB0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100012DC0()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_100012DD0()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_100012DE0()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_100012E00()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_100012E10()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_100012E20()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_100012E40()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_100012E50()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_100012E60()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100012E70()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_100012E80()
{
  return static Font.subheadline.getter();
}

uint64_t sub_100012E90()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_100012EA0()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_100012EB0()
{
  return static Font.footnote.getter();
}

uint64_t sub_100012EC0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_100012ED0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100012EE0()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_100012EF0()
{
  return Text.font(_:)();
}

uint64_t sub_100012F00()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100012F10()
{
  return Text.init(_:)();
}

uint64_t sub_100012F20()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100012F30()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100012F40()
{
  return View.fontWeight(_:)();
}

uint64_t sub_100012F50()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_100012F60()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100012F70()
{
  return Color.init(_:)();
}

uint64_t sub_100012F80()
{
  return Image.init(systemName:)();
}

uint64_t sub_100012F90()
{
  return Button.init(action:label:)();
}

uint64_t sub_100012FA0()
{
  return static Alignment.center.getter();
}

uint64_t sub_100012FB0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100012FC0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100012FD0()
{
  return type metadata accessor for DispatchQoS();
}

NSString sub_100012FE0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100012FF0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013000()
{
  return String.init(format:_:)();
}

uint64_t sub_100013010()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_100013020()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100013030()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100013040()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100013050()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100013060()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100013070()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100013080()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100013090()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000130A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000130B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000130C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000130D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000130E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000130F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100013100()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100013110()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100013120()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}