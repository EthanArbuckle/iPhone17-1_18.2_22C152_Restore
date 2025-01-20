id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F7C4C98 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AXIsPluginAllowedInClarity()
{
  uint64_t v0 = sub_2425367F0();
  uint64_t v2 = v1;
  v3 = (void *)sub_242536800();
  LOBYTE(v0) = sub_24253629C(v0, v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_24253629C(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B09C4A0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2425367E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v21 - v11;
  sub_2425367C0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_242536698((uint64_t)v5);
LABEL_20:
    char v18 = 1;
    return v18 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
  uint64_t v13 = sub_2425367D0();
  if (!v14)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    goto LABEL_20;
  }
  uint64_t v15 = v13;
  uint64_t v16 = v14;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v6);
  if (v17 == *MEMORY[0x263F6FE60]
    || v17 == *MEMORY[0x263F6FE78]
    || v17 == *MEMORY[0x263F6FE80]
    || v17 == *MEMORY[0x263F6FE68]
    || v17 == *MEMORY[0x263F6FE50]
    || v17 == *MEMORY[0x263F6FE70]
    || v17 == *MEMORY[0x263F6FE40]
    || v17 == *MEMORY[0x263F6FE48]
    || v17 == *MEMORY[0x263F6FE58]
    || v17 == *MEMORY[0x263F6FE88]
    || v17 == *MEMORY[0x263F6FE90]
    || v17 == *MEMORY[0x263F6FE98]
    || v17 == *MEMORY[0x263F6FEB0])
  {
LABEL_22:
    char v18 = sub_2425366F8(v15, v16, a3);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    swift_bridgeObjectRelease();
    return v18 & 1;
  }
  if (v17 != *MEMORY[0x263F6FEA0])
  {
    if (v17 != *MEMORY[0x263F6FEA8])
    {
      v20 = *(void (**)(char *, uint64_t))(v7 + 8);
      v20(v12, v6);
      swift_bridgeObjectRelease();
      v20(v10, v6);
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  swift_bridgeObjectRelease();
  char v18 = 0;
  return v18 & 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_242536698(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B09C4A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2425366F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_242536810() & 1) != 0) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_242536810() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return sub_2425367C0();
}

uint64_t sub_2425367C0()
{
  return MEMORY[0x270F68118]();
}

uint64_t sub_2425367D0()
{
  return MEMORY[0x270F68120]();
}

uint64_t sub_2425367E0()
{
  return MEMORY[0x270F68128]();
}

uint64_t sub_2425367F0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_242536800()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_242536810()
{
  return MEMORY[0x270F9F7D0]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}