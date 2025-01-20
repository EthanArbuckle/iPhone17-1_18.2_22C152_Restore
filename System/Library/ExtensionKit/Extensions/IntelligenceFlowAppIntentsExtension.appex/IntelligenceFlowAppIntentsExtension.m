uint64_t sub_10000408C()
{
  sub_100005EB0();
  return sub_100006CD0();
}

uint64_t sub_1000040D0(uint64_t a1)
{
  return sub_100005340(a1, qword_10000C760);
}

uint64_t sub_1000040F0(uint64_t a1)
{
  return sub_100005414(a1, qword_10000C778);
}

uint64_t sub_100004110()
{
  sub_100006B84();
  v0[2] = v1;
  v0[3] = v2;
  sub_100006EA0();
  v0[4] = sub_100006E90();
  uint64_t v4 = sub_100006E70();
  return _swift_task_switch(sub_1000041A4, v4, v3);
}

id sub_1000041A4()
{
  swift_release();
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_100006E00();
    sub_100006AC8();
    uint64_t v4 = v3;
    uint64_t v5 = sub_100006C10();
    sub_100006D20();
    uint64_t v6 = (void *)sub_100006DD0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v2);
    swift_task_dealloc();
    uint64_t v7 = sub_100006E50();
    sub_10000660C((uint64_t)v6, v7, v1);

    sub_100006D10();
    sub_100006BE0();
    return (id)v8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000042EC()
{
  sub_1000063C8(&qword_10000C118);
  sub_100006C28();
  sub_100006B68();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006B34();
  sub_100006DB0();
  uint64_t v0 = sub_1000063C8(&qword_10000C0B8);
  uint64_t v1 = sub_100006B78(v0);
  __chkstk_darwin(v1);
  sub_100006AE4(v2, v13);
  uint64_t v3 = sub_1000063C8(&qword_10000C100);
  uint64_t v4 = sub_100006B78(v3);
  __chkstk_darwin(v4);
  sub_100006B18();
  uint64_t v5 = sub_100006E00();
  sub_100006B90(v5);
  uint64_t v6 = sub_1000063C8(&qword_10000C0C0);
  uint64_t v7 = sub_100006B78(v6);
  __chkstk_darwin(v7);
  uint64_t v8 = sub_100006BB0();
  sub_100006C60(v8);
  sub_100006DA0();
  sub_100006AC8();
  __chkstk_darwin(v9);
  (*(void (**)(char *, void))(v11 + 104))((char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InputConnectionBehavior.default(_:));
  sub_100006C4C();
  return sub_100006D50();
}

uint64_t sub_10000448C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005174(&qword_10000C130, (uint64_t)qword_10000C760, a1);
}

uint64_t sub_1000044B0()
{
  return sub_100006C80() & 1;
}

uint64_t sub_1000044CC()
{
  return sub_100006CB0();
}

uint64_t sub_1000044E4()
{
  return sub_100006C90() & 1;
}

uint64_t sub_100004500()
{
  return sub_100006CA0();
}

uint64_t sub_100004518@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000054A0(&qword_10000C138, (uint64_t)qword_10000C778);

  return sub_100006434(v2, a1);
}

uint64_t sub_100004570()
{
  sub_100006B84();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100006C00(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100006AC4;
  sub_100006BF0();
  return sub_100004110();
}

uint64_t sub_1000045FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000042EC();
  *a1 = result;
  return result;
}

uint64_t sub_100004624()
{
  return sub_100006CC0();
}

uint64_t sub_100004654(uint64_t a1)
{
  return sub_100005340(a1, qword_10000C790);
}

uint64_t sub_100004678(uint64_t a1)
{
  return sub_100005414(a1, qword_10000C7A8);
}

uint64_t sub_1000046AC()
{
  sub_100006B84();
  v0[2] = v1;
  v0[3] = v2;
  v0[4] = sub_100006EA0();
  v0[5] = sub_100006E90();
  uint64_t v4 = sub_100006E70();
  v0[6] = v4;
  v0[7] = v3;
  return _swift_task_switch(sub_100004744, v4, v3);
}

uint64_t sub_100004744()
{
  uint64_t v1 = sub_100006E00();
  v0[8] = v1;
  sub_100006AC8();
  uint64_t v3 = v2;
  v0[9] = v2;
  uint64_t v4 = sub_100006C10();
  v0[10] = v4;
  uint64_t v5 = sub_100006CF0();
  sub_100006AC8();
  uint64_t v7 = v6;
  uint64_t v8 = sub_100006C10();
  sub_100006D20();
  uint64_t v9 = sub_1000063C8(&qword_10000C100);
  sub_100006B78(v9);
  uint64_t v10 = sub_100006C10();
  sub_100006CE0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v5);
  if (sub_100006538(v10, 1, v1) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v4, v10, v1);
    swift_task_dealloc();
    swift_task_dealloc();
    if (sub_100006DF0())
    {
      id v12 = [self defaultWorkspace];
      if (!v12)
      {
        __break(1u);
        return withCheckedContinuation<A>(isolation:function:_:)();
      }
      uint64_t v13 = v12;
      v14 = (void *)sub_100006DD0();
      uint64_t v15 = sub_100006E50();
      id v16 = sub_100006690((uint64_t)v14, 0, v15, v13);
      v0[11] = v16;

      if (v16)
      {
        v0[12] = sub_100006E90();
        uint64_t v17 = swift_task_alloc();
        v0[13] = v17;
        *(void *)(v17 + 16) = v16;
        v18 = (void *)swift_task_alloc();
        v0[14] = v18;
        void *v18 = v0;
        v18[1] = sub_100004B34;
        return withCheckedContinuation<A>(isolation:function:_:)();
      }
      swift_release();
      sub_1000065C0();
      swift_allocError();
      void *v20 = 2;
      swift_willThrow();
      sub_100006DE0();
    }
    else
    {
      swift_release();
      sub_1000065C0();
      swift_allocError();
      void *v19 = 1;
      swift_willThrow();
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v1);
    swift_task_dealloc();
    goto LABEL_12;
  }
  swift_release();
  sub_100006560(v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000065C0();
  swift_allocError();
  *uint64_t v11 = 0;
  swift_willThrow();
LABEL_12:
  v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_100004B34()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return _swift_task_switch(sub_100004C94, v3, v2);
}

uint64_t sub_100004C94()
{
  uint64_t v1 = *(void **)(v0 + 88);
  swift_release();
  sub_100006D10();

  sub_100006DE0();
  uint64_t v2 = sub_100006C40();
  v3(v2);
  swift_task_dealloc();
  sub_100006BE0();
  return v4();
}

id sub_100004D38(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1000063C8(&qword_10000C110);
  sub_100006AC8();
  uint64_t v6 = v5;
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_1000067BC;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004EC8;
  aBlock[3] = &unk_1000085D8;
  id v12 = _Block_copy(aBlock);
  swift_release();
  [a2 setCompletionBlock:v12];
  _Block_release(v12);
  return [a2 start];
}

uint64_t sub_100004EC8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100004F0C()
{
  sub_1000063C8(&qword_10000C0E0);
  sub_100006C28();
  sub_100006B68();
  __chkstk_darwin(v0);
  sub_100006B34();
  sub_100006DB0();
  uint64_t v1 = sub_1000063C8(&qword_10000C0B8);
  uint64_t v2 = sub_100006B78(v1);
  __chkstk_darwin(v2);
  sub_100006AE4(v3, v14);
  uint64_t v4 = sub_1000063C8(&qword_10000C0E8);
  uint64_t v5 = sub_100006B78(v4);
  __chkstk_darwin(v5);
  sub_100006B18();
  uint64_t v6 = sub_100006CF0();
  sub_100006B90(v6);
  uint64_t v7 = sub_1000063C8(&qword_10000C0C0);
  uint64_t v8 = sub_100006B78(v7);
  __chkstk_darwin(v8);
  uint64_t v9 = sub_100006BB0();
  sub_100006C60(v9);
  sub_1000063C8(&qword_10000C0F0);
  sub_100006E30();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100007170;
  sub_100006E20();
  sub_100006DA0();
  sub_100006AC8();
  __chkstk_darwin(v10);
  (*(void (**)(char *, void))(v12 + 104))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InputConnectionBehavior.default(_:));
  return sub_100006D40();
}

uint64_t sub_100005150@<X0>(uint64_t a1@<X8>)
{
  return sub_100005174(&qword_10000C140, (uint64_t)qword_10000C790, a1);
}

uint64_t sub_100005174@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  sub_10000539C(a1, a2);
  sub_100006C28();
  sub_100006B68();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);

  return v7(a3, v3, v5);
}

uint64_t sub_1000051E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000054A0(&qword_10000C148, (uint64_t)qword_10000C7A8);

  return sub_100006434(v2, a1);
}

uint64_t sub_100005238()
{
  sub_100006B84();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100006C00(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100006AC4;
  sub_100006BF0();
  return sub_1000046AC();
}

uint64_t sub_1000052C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004F0C();
  *a1 = result;
  return result;
}

uint64_t sub_1000052EC()
{
  return sub_100006CC0();
}

uint64_t sub_10000531C(uint64_t a1)
{
  return sub_100005340(a1, qword_10000C7C0);
}

uint64_t sub_100005340(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006DC0();
  sub_1000064D4(v3, a2);
  sub_10000649C(v3, (uint64_t)a2);
  sub_100006C40();
  return sub_100006DB0();
}

uint64_t sub_10000539C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100006DC0();

  return sub_10000649C(v3, a2);
}

uint64_t sub_1000053F0(uint64_t a1)
{
  return sub_100005414(a1, qword_10000C7D8);
}

uint64_t sub_100005414(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000063C8(&qword_10000C0D8);
  sub_1000064D4(v3, a2);
  uint64_t v4 = sub_10000649C(v3, (uint64_t)a2);
  sub_100006C40();
  sub_100006D80();
  uint64_t v5 = sub_100006D90();

  return sub_10000640C(v4, 0, 1, v5);
}

uint64_t sub_1000054A0(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000063C8(&qword_10000C0D8);

  return sub_10000649C(v3, a2);
}

uint64_t sub_1000054F8()
{
  sub_100006B84();
  v0[15] = v1;
  v0[16] = v2;
  sub_100006EA0();
  v0[17] = sub_100006E90();
  uint64_t v4 = sub_100006E70();
  v0[18] = v4;
  v0[19] = v3;
  return _swift_task_switch(sub_10000558C, v4, v3);
}

uint64_t sub_10000558C()
{
  id v1 = [self defaultWorkspace];
  v0[20] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_100006D70();
    sub_100006AC8();
    uint64_t v5 = v4;
    uint64_t v6 = sub_100006C10();
    sub_100006D20();
    sub_100006D60();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v3);
    uint64_t v7 = sub_100006E60();
    v0[21] = v7;
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v0[2] = v0;
    v0[7] = v0 + 23;
    v0[3] = sub_10000575C;
    uint64_t v8 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100005960;
    v0[13] = &unk_100008598;
    v0[14] = v8;
    [v2 openApplicationWithBundleIdentifier:v7 usingConfiguration:0 completionHandler:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_10000575C()
{
  sub_100006B84();
  sub_100006B50();
  uint64_t v1 = v0[6];
  *(void *)(v2 + 176) = v1;
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[18];
  if (v1) {
    uint64_t v5 = sub_1000058E0;
  }
  else {
    uint64_t v5 = sub_100005864;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100005864()
{
  uint64_t v2 = *(void **)(v0 + 160);
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release();

  sub_100006D10();
  sub_100006BE0();
  return v3();
}

uint64_t sub_1000058E0()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[20];
  swift_release();
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100005960(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_1000059C0(v3, (uint64_t)v4);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    return sub_100005A24(v6, a2);
  }
}

uint64_t sub_1000059C0(uint64_t a1, uint64_t a2)
{
  sub_1000063C8(&qword_10000C0D0);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;

  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_100005A24(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return _swift_continuation_throwingResume();
}

uint64_t sub_100005A44()
{
  sub_1000063C8(&qword_10000C0B0);
  sub_100006C28();
  sub_100006B68();
  __chkstk_darwin(v0);
  sub_100006B34();
  sub_100006DB0();
  uint64_t v1 = sub_1000063C8(&qword_10000C0B8);
  uint64_t v2 = sub_100006B78(v1);
  __chkstk_darwin(v2);
  sub_100006AE4(v3, v11);
  uint64_t v4 = sub_1000063C8(&qword_10000C0C0);
  uint64_t v5 = sub_100006B78(v4);
  __chkstk_darwin(v5);
  sub_100006B18();
  uint64_t v6 = sub_100006D00();
  sub_100006B90(v6);
  sub_100006DA0();
  sub_100006AC8();
  __chkstk_darwin(v7);
  (*(void (**)(char *, void))(v9 + 104))((char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InputConnectionBehavior.default(_:));
  sub_100006C4C();
  return sub_100006D30();
}

uint64_t sub_100005BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_100005174(&qword_10000C150, (uint64_t)qword_10000C7C0, a1);
}

uint64_t sub_100005BDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000054A0(qword_10000C158, (uint64_t)qword_10000C7D8);

  return sub_100006434(v2, a1);
}

uint64_t sub_100005C34()
{
  sub_100006B84();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_100006C00(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_100005CC0;
  sub_100006BF0();
  return sub_1000054F8();
}

uint64_t sub_100005CC0()
{
  sub_100006B84();
  sub_100006B50();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005D8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005A44();
  *a1 = result;
  return result;
}

uint64_t sub_100005DB4()
{
  return sub_100006CC0();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005E40()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

uint64_t sub_100005E90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006270(a1, a2, a3, (void (*)(void))sub_100005EB0);
}

unint64_t sub_100005EB0()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

unint64_t sub_100005F00()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100005F50()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100005F9C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100005FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006270(a1, a2, a3, (void (*)(void))sub_100005FF0);
}

unint64_t sub_100005FF0()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

unint64_t sub_100006040()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100006090()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_1000060DC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006270(a1, a2, a3, (void (*)(void))sub_100006130);
}

unint64_t sub_100006130()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }
  return result;
}

unint64_t sub_100006180()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

unint64_t sub_1000061D0()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }
  return result;
}

uint64_t sub_10000621C()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006270(a1, a2, a3, (void (*)(void))sub_1000062B8);
}

uint64_t sub_100006270(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000062B8()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

void type metadata accessor for OpenApplication()
{
}

void type metadata accessor for OpenFile()
{
}

void type metadata accessor for OpenURL()
{
}

void type metadata accessor for IntelligenceFlowAppIntentsExtensionExtension()
{
}

unint64_t sub_100006338()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    sub_100006380(&qword_10000C0A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100006380(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000063C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000640C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100006434(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000063C8(&qword_10000C0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000649C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000064D4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100006560(uint64_t a1)
{
  uint64_t v2 = sub_1000063C8(&qword_10000C100);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000065C0()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

id sub_10000660C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)sub_100006E40();
  swift_bridgeObjectRelease();
  id v6 = [a3 openSensitiveURL:a1 withOptions:v5];

  return v6;
}

id sub_100006690(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (void *)sub_100006E40();
  swift_bridgeObjectRelease();
  id v8 = [a4 operationToOpenResource:a1 usingApplication:a2 userInfo:v7];

  return v8;
}

id sub_10000672C(uint64_t a1)
{
  return sub_100004D38(a1, *(void **)(v1 + 16));
}

uint64_t sub_100006734()
{
  sub_1000063C8(&qword_10000C110);
  sub_100006B68();
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  uint64_t v2 = sub_100006C40();

  return _swift_deallocObject(v2);
}

uint64_t sub_1000067BC()
{
  return sub_100006E80();
}

uint64_t sub_100006824(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006834()
{
  return swift_release();
}

void *sub_10000683C(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void sub_100006878(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **sub_100006890(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *sub_100006914(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **sub_100006920(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t sub_100006984(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000069E0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_100006A30(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100006A48(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

void type metadata accessor for OpenFile.Error()
{
}

void type metadata accessor for CFError()
{
  if (!qword_10000C128)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C128);
    }
  }
}

uint64_t sub_100006AE4@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_10000640C((uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
}

uint64_t sub_100006B18()
{
  return 0;
}

uint64_t sub_100006B78(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100006B90(uint64_t a1)
{
  return sub_10000640C(v1, 1, 1, a1);
}

uint64_t sub_100006BB0()
{
  return sub_100006D00();
}

uint64_t sub_100006BE0()
{
  return v0 + 8;
}

uint64_t sub_100006BF0()
{
  return v0;
}

uint64_t sub_100006C00(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_100006C10()
{
  return swift_task_alloc();
}

uint64_t sub_100006C28()
{
  return sub_100006DC0();
}

uint64_t sub_100006C40()
{
  return v0;
}

uint64_t sub_100006C4C()
{
  return v0;
}

uint64_t sub_100006C60(uint64_t a1)
{
  return sub_10000640C(v1, 1, 1, a1);
}

uint64_t sub_100006C80()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100006C90()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100006CA0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100006CB0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100006CC0()
{
  return static AppIntent.persistentIdentifier.getter();
}

uint64_t sub_100006CD0()
{
  return AppIntentsExtension.configuration.getter();
}

uint64_t sub_100006CE0()
{
  return IntentFile.fileURL.getter();
}

uint64_t sub_100006CF0()
{
  return type metadata accessor for IntentFile();
}

uint64_t sub_100006D00()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100006D10()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100006D20()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006D30()
{
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006D40()
{
  return IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006D50()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_100006D60()
{
  return IntentApplication.bundleIdentifier.getter();
}

uint64_t sub_100006D70()
{
  return type metadata accessor for IntentApplication();
}

uint64_t sub_100006D80()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_100006D90()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_100006DA0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006DB0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006DC0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006DD0()
{
  return URL._bridgeToObjectiveC()();
}

uint64_t sub_100006DE0()
{
  return URL.stopAccessingSecurityScopedResource()();
}

uint64_t sub_100006DF0()
{
  return URL.startAccessingSecurityScopedResource()();
}

uint64_t sub_100006E00()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006E10()
{
  return static AppExtension.main()();
}

uint64_t sub_100006E20()
{
  return static UTType.item.getter();
}

uint64_t sub_100006E30()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100006E40()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100006E50()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100006E60()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006E70()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006E80()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100006E90()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006EA0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100006EC0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100006ED0()
{
  return Error._code.getter();
}

uint64_t sub_100006EE0()
{
  return Error._domain.getter();
}

uint64_t sub_100006EF0()
{
  return Error._userInfo.getter();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}