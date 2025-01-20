_HomeKit_SwiftUI::CameraView __swiftcall CameraView.init(source:)(_HomeKit_SwiftUI::CameraView source)
{
  _HomeKit_SwiftUI::CameraView *v1;

  v1->source.super.isa = source.source.super.isa;
  return source;
}

uint64_t CameraView.body.getter@<X0>(void *a1@<X8>)
{
  v3 = *v1;
  sub_22B18AAF0();
  sub_22B18AAE0();
  sub_22B18AAD0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = v3;
  uint64_t result = swift_release();
  *a1 = v4;
  return result;
}

uint64_t sub_22B18A574(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of CameraView.body>>, 1);
}

uint64_t sub_22B18A598()
{
  return sub_22B18AAC0();
}

uint64_t sub_22B18A5B4@<X0>(void *a1@<X8>)
{
  v3 = *v1;
  sub_22B18AAF0();
  sub_22B18AAE0();
  sub_22B18AAD0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = v3;
  uint64_t result = swift_release();
  *a1 = v4;
  return result;
}

ValueMetadata *type metadata accessor for CameraView()
{
  return &type metadata for CameraView;
}

unint64_t sub_22B18A668()
{
  unint64_t result = qword_2683E7B10;
  if (!qword_2683E7B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E7B10);
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraViewUIViewRepresentation()
{
  return &type metadata for CameraViewUIViewRepresentation;
}

id sub_22B18A6D0()
{
  uint64_t v1 = *v0;
  sub_22B18AAF0();
  sub_22B18AAE0();
  sub_22B18AAD0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0E238]), sel_init);
  objc_msgSend(v2, sel_setCameraSource_, v1);
  swift_release();
  return v2;
}

uint64_t sub_22B18A788(void *a1)
{
  uint64_t v3 = *v1;
  sub_22B18AAF0();
  sub_22B18AAE0();
  sub_22B18AAD0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_msgSend(a1, sel_setCameraSource_, v3);

  return swift_release();
}

uint64_t sub_22B18A84C()
{
  return sub_22B18AA00();
}

uint64_t sub_22B18A890()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_22B18A89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22B18A98C();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22B18A900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22B18A98C();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22B18A964()
{
}

unint64_t sub_22B18A98C()
{
  unint64_t result = qword_2683E7B18;
  if (!qword_2683E7B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2683E7B18);
  }
  return result;
}

uint64_t sub_22B18A9E0()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_22B18A9F0()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_22B18AA00()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_22B18AA20()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_22B18AA30()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_22B18AA40()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_22B18AA50()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_22B18AA60()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_22B18AA70()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_22B18AA90()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_22B18AAA0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22B18AAB0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22B18AAC0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22B18AAD0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22B18AAE0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22B18AAF0()
{
  return MEMORY[0x270FA1EA8]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}