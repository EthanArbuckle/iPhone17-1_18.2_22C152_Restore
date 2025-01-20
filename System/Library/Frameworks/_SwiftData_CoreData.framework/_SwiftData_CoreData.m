uint64_t NSManagedObjectModel.makeManagedObjectModel(for:mergedWith:)(uint64_t a1, void *a2)
{
  id v3;
  void v5[4];
  long long v6;
  uint64_t v7;
  _OWORD v8[2];

  if (a2)
  {
    v5[3] = sub_2466FDCE4();
    v5[0] = a2;
    v3 = a2;
    sub_2466FDE88();
    __swift_destroy_boxed_opaque_existential_0(v5);
    if (v7)
    {
      sub_2466FDCD4(&v6, v8);
LABEL_6:
      swift_dynamicCast();
      return v5[0];
    }
  }
  else
  {
    sub_2466FDEA8();
    if (v7)
    {
      sub_2466FDCD4(&v6, v8);
      sub_2466FDCE4();
      goto LABEL_6;
    }
  }
  sub_2466FDC30((uint64_t)&v6);
  return 0;
}

uint64_t sub_2466FDC30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

_OWORD *sub_2466FDCD4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2466FDCE4()
{
  unint64_t result = qword_268F9C378;
  if (!qword_268F9C378)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F9C378);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t static NSManagedObjectModel.makeManagedObjectModel(for:mergedWith:)(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2466FDEC8();
    v5[3] = sub_2466FDCE4();
    v5[0] = a2;
    id v3 = a2;
    sub_2466FDE98();
    __swift_destroy_boxed_opaque_existential_0(v5);
    if (v7)
    {
      sub_2466FDCD4(&v6, v8);
LABEL_6:
      swift_dynamicCast();
      return v5[0];
    }
  }
  else
  {
    sub_2466FDEC8();
    sub_2466FDEB8();
    if (v7)
    {
      sub_2466FDCD4(&v6, v8);
      sub_2466FDCE4();
      goto LABEL_6;
    }
  }
  sub_2466FDC30((uint64_t)&v6);
  return 0;
}

uint64_t sub_2466FDE88()
{
  return MEMORY[0x270EFEA00]();
}

uint64_t sub_2466FDE98()
{
  return MEMORY[0x270EFEA08]();
}

uint64_t sub_2466FDEA8()
{
  return MEMORY[0x270EFEA10]();
}

uint64_t sub_2466FDEB8()
{
  return MEMORY[0x270EFEA18]();
}

uint64_t sub_2466FDEC8()
{
  return MEMORY[0x270EFEAB8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}