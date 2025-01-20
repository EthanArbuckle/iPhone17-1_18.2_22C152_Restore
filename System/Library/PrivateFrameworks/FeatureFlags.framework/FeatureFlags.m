unint64_t isFeatureEnabled(_:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  uint64_t v5;
  char v6;
  char v7;
  void v8[8];
  unsigned char v9[9];

  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v8[2] = a1;
  v8[6] = sub_237774BC0;
  v8[7] = v8;
  if ((v6 & 1) == 0)
  {
    if (result)
    {
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        sub_237774BC0(v9);
        v7 = v9[0];
        return v7 & 1;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(result)) {
    goto LABEL_11;
  }
  if (result >> 11 != 27)
  {
    if (WORD1(result) <= 0x10u)
    {
      v7 = sub_237774D44(result, (void (*)(unsigned __int8 *__return_ptr, uint64_t *))sub_237774D40);
      return v7 & 1;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

unint64_t sub_237774BC0@<X0>(unsigned char *a1@<X8>)
{
  v3 = *(void **)(v1 + 16);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  unint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if ((v8 & 1) == 0)
  {
    if (result)
    {
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t result = _swift_os_feature_enabled_impl();
LABEL_9:
        *a1 = result & 1;
        return result;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(result)) {
    goto LABEL_11;
  }
  if (result >> 11 != 27)
  {
    if (WORD1(result) <= 0x10u)
    {
      unint64_t result = sub_237774D44(result, (void (*)(unsigned __int8 *__return_ptr, uint64_t *))sub_237774D40);
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t _swift_os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

uint64_t dispatch thunk of FeatureFlagsKey.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FeatureFlagsKey.feature.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_237774D44(unsigned int a1, void (*a2)(unsigned __int8 *__return_ptr, uint64_t *))
{
  if (a1 > 0x7F)
  {
    int v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      int v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      int v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v2 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1)) {
        unsigned int v2 = v6;
      }
    }
    else
    {
      unsigned int v2 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    unsigned int v2 = a1 + 1;
  }
  uint64_t v8 = (v2 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v2) >> 3))));
  a2(&v7, &v8);
  return v7;
}

uint64_t sub_237774E30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _swift_os_feature_enabled_impl();
  *a1 = result;
  return result;
}

void *sub_237774E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (!a1)
  {
LABEL_5:
    __break(1u);
    JUMPOUT(0x237774EB8);
  }
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v3 + 16))(&v6);
  *a3 = v6;
  return result;
}