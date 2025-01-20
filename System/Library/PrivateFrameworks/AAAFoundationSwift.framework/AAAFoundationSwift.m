uint64_t sub_1B8F04AF8@<X0>(char *description@<X0>, void *dso@<X2>, void *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  if (dso && description)
  {
    if (qword_1EB9C3688 != -1) {
      swift_once();
    }
    result = (uint64_t)_os_activity_create(dso, description, (os_activity_t)qword_1EB9C3680, OS_ACTIVITY_FLAG_DEFAULT);
    *a3 = result;
  }
  else
  {
    if (qword_1EB9C4148 != -1) {
      swift_once();
    }
    v7 = sub_1B8F572D0();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EB9C4218);
    v8 = sub_1B8F572B0();
    v9 = sub_1B8F57870();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      if (qword_1E9EF3D50 != -1) {
        swift_once();
      }
      v12 = qword_1E9EF7350;
      v13 = *(void *)algn_1E9EF7358;
      swift_bridgeObjectRetain();
      sub_1B8F20904(v12, v13, &v14);
      sub_1B8F579A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B8F03000, v8, v9, "%s Failed to create OS Activity", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D0800](v11, -1, -1);
      MEMORY[0x1BA9D0800](v10, -1, -1);
    }

    result = sub_1B8F57BB0();
    __break(1u);
  }
  return result;
}

uint64_t OSTransaction.__deallocating_deinit()
{
  v1 = v0;
  if (v0[5])
  {
    sub_1B8F57870();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C36B0);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1B8F59040;
    uint64_t v4 = v0[2];
    uint64_t v3 = v0[3];
    *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v2 + 64) = sub_1B8F05154();
    *(void *)(v2 + 32) = v4;
    *(void *)(v2 + 40) = v3;
    sub_1B8F05114();
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1B8F57960();
    sub_1B8F572A0();
    swift_bridgeObjectRelease();
  }
  _s18AAAFoundationSwift13OSTransactionC8completeyyF_0();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186488](v1, 48, 7);
}

uint64_t sub_1B8F04E60@<X0>(unint64_t a1@<X0>, char a2@<W2>, unint64_t a3@<X8>)
{
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 16) = sub_1B8F05850(&dword_1B8F03000, a1, a2, a3);
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectRetain();
  os_activity_scope_enter(v4, (os_activity_scope_state_t)(v3 + 24));
  swift_endAccess();
  swift_unknownObjectRelease();
  return v3;
}

void _s18AAAFoundationSwift13OSTransactionC8completeyyF_0()
{
  v1 = v0;
  if (v0[5])
  {
    sub_1B8F57880();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C36B0);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1B8F59040;
    uint64_t v4 = v0[2];
    uint64_t v3 = v0[3];
    *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v2 + 64) = sub_1B8F05154();
    *(void *)(v2 + 32) = v4;
    *(void *)(v2 + 40) = v3;
    sub_1B8F05114();
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1B8F57960();
    sub_1B8F572A0();
    swift_bridgeObjectRelease();

    uint64_t v6 = v1[5];
    if (v6)
    {
      swift_beginAccess();
      swift_retain();
      os_activity_scope_leave((os_activity_scope_state_t)(v6 + 24));
      swift_endAccess();
      swift_release();
    }
    v1[5] = 0;
    swift_release();
    v1[4] = 0;
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1B8F57870();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C36B0);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_1B8F59040;
    uint64_t v9 = v0[2];
    uint64_t v8 = v1[3];
    *(void *)(v7 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v7 + 64) = sub_1B8F05154();
    *(void *)(v7 + 32) = v9;
    *(void *)(v7 + 40) = v8;
    sub_1B8F05114();
    swift_bridgeObjectRetain();
    id v10 = (id)sub_1B8F57960();
    sub_1B8F572A0();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_1B8F05114()
{
  unint64_t result = qword_1EB9C36A0;
  if (!qword_1EB9C36A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB9C36A0);
  }
  return result;
}

unint64_t sub_1B8F05154()
{
  unint64_t result = qword_1EB9C3698;
  if (!qword_1EB9C3698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C3698);
  }
  return result;
}

uint64_t OSTransaction.init(name:)(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1B8F57230();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x1F4188790](v8, v10);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)&v30 - v13;
  v4[4] = 0;
  v4[5] = 0;
  int v31 = a3;
  uint64_t v30 = a2;
  if ((a3 & 1) == 0)
  {
    if (a1) {
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v13 = HIDWORD(a1);
  if (HIDWORD(a1))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (a1 >> 11 != 27)
  {
    LODWORD(v13) = WORD1(a1);
    if (WORD1(a1) > 0x10u)
    {
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
    if ((a1 & 0xFFFFFF80) != 0)
    {
LABEL_15:
      int v25 = (a1 & 0x3F) << 8;
      unsigned int v26 = (v25 | (a1 >> 6)) + 33217;
      unsigned int v27 = (v25 | (a1 >> 6) & 0x3F) << 8;
      unsigned int v28 = (((v27 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v29 = (v27 | (a1 >> 12)) + 8487393;
      if (v13) {
        unsigned int v15 = v28;
      }
      else {
        unsigned int v15 = v29;
      }
      if (a1 < 0x800) {
        unsigned int v15 = v26;
      }
      goto LABEL_10;
    }
    if (a1 <= 0xFF)
    {
      unsigned int v15 = (a1 + 1);
LABEL_10:
      uint64_t v32 = (v15 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v15) >> 3)) & 7)));
LABEL_11:
      uint64_t v32 = sub_1B8F57520();
      uint64_t v33 = v16;
      swift_bridgeObjectRetain();
      sub_1B8F57560();
      swift_bridgeObjectRelease();
      uint64_t v17 = v32;
      uint64_t v18 = v33;
      sub_1B8F57220();
      sub_1B8F57210();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      uint64_t v32 = v17;
      uint64_t v33 = v18;
      swift_bridgeObjectRetain();
      sub_1B8F57560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = v32;
      uint64_t v19 = v33;
      v4[2] = v32;
      v4[3] = v19;
      swift_bridgeObjectRetain();
      sub_1B8F57880();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C36B0);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1B8F59040;
      *(void *)(v21 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v21 + 64) = sub_1B8F05154();
      *(void *)(v21 + 32) = v20;
      *(void *)(v21 + 40) = v19;
      sub_1B8F05114();
      swift_bridgeObjectRetain();
      v22 = (void *)sub_1B8F57960();
      sub_1B8F572A0();
      swift_bridgeObjectRelease();

      sub_1B8F57510();
      swift_bridgeObjectRelease();
      uint64_t v23 = os_transaction_create();
      swift_release();
      v4[4] = v23;
      swift_unknownObjectRelease();
      type metadata accessor for OSActivity();
      swift_allocObject();
      v4[5] = sub_1B8F04E60(a1, v31, v24);
      swift_release();
      return (uint64_t)v4;
    }
    __break(1u);
  }
  __break(1u);
  return result;
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t type metadata accessor for OSTransaction()
{
  return self;
}

uint64_t static OSTransaction.named(_:block:)(unint64_t a1, uint64_t a2, int a3, void (*a4)(uint64_t))
{
  uint64_t v8 = swift_allocObject();
  OSTransaction.init(name:)(a1, a2, a3);
  a4(v8);
  return swift_release();
}

{
  uint64_t v8;

  swift_initStackObject();
  uint64_t v8 = OSTransaction.init(name:)(a1, a2, a3);
  a4(v8);
  _s18AAAFoundationSwift13OSTransactionC8completeyyF_0();
  return swift_release();
}

uint64_t OSActivity.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t type metadata accessor for OSActivity()
{
  return self;
}

unint64_t sub_1B8F05850@<X0>(void *dso@<X3>, unint64_t result@<X0>, char a3@<W2>, unint64_t a4@<X8>)
{
  if ((a3 & 1) == 0)
  {
    if (result)
    {
      sub_1B8F04AF8((char *)result, dso, description);
      return *(void *)description;
    }
    __break(1u);
    goto LABEL_13;
  }
  a4 = HIDWORD(result);
  if (HIDWORD(result))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (result >> 11 == 27)
  {
LABEL_22:
    __break(1u);
    return result;
  }
  LODWORD(a4) = WORD1(result);
  if (WORD1(result) > 0x10u)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((result & 0xFFFFFF80) != 0)
  {
LABEL_15:
    int v5 = (result & 0x3F) << 8;
    unsigned int v6 = (v5 | (result >> 6)) + 33217;
    unsigned int v7 = (v5 | (result >> 6) & 0x3F) << 8;
    unsigned int v8 = (((v7 | (result >> 12) & 0x3F) << 8) | (result >> 18)) - 2122219023;
    unsigned int v9 = (v7 | (result >> 12)) + 8487393;
    if (a4) {
      unsigned int v4 = v8;
    }
    else {
      unsigned int v4 = v9;
    }
    if (result < 0x800) {
      unsigned int v4 = v6;
    }
    goto LABEL_10;
  }
  if (result > 0xFF)
  {
    __break(1u);
    goto LABEL_22;
  }
  unsigned int v4 = (result + 1);
LABEL_10:
  *(void *)description = (v4 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v4) >> 3)) & 7)));
  sub_1B8F04AF8(description, dso, &v10);
  return v10;
}

void *BroadcastMessageSender.__allocating_init<A, B>(encoder:transport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  unsigned int v8 = sub_1B8F0606C(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v8;
}

void *BroadcastMessageSender.init<A, B>(encoder:transport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8 = sub_1B8F0606C(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v8;
}

uint64_t *sub_1B8F05B14(uint64_t a1)
{
  return sub_1B8F05C68(a1);
}

uint64_t sub_1B8F05B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = v4[5];
  uint64_t v10 = v4[6];
  __swift_project_boxed_opaque_existential_1(v4 + 2, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8))(a1, a2, a3, a4, v9, v10);
}

uint64_t BroadcastMessageSender.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t BroadcastMessageSender.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1B8F05C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F05B60(a1, a2, a3, a4);
}

uint64_t *sub_1B8F05C68(uint64_t a1)
{
  uint64_t v3 = *v1;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v1 + 88) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 112));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 120), a1);
  return v1;
}

uint64_t sub_1B8F05D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = (void *)*v4;
  uint64_t v19 = a4;
  uint64_t v7 = v18[12];
  uint64_t v8 = v18[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness, v10);
  uint64_t v12 = (char *)&v16 - v11;
  uint64_t v13 = v20;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v19, v8, v7);
  if (!v13)
  {
    uint64_t v15 = v17;
    (*(void (**)(char *, void))(v18[13] + 16))(v12, v18[11]);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v12, AssociatedTypeWitness);
  }
  return result;
}

uint64_t *sub_1B8F05F28()
{
  uint64_t v1 = *v0;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v0 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 112));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 120));
  return v0;
}

uint64_t sub_1B8F05FF4()
{
  uint64_t v0 = sub_1B8F05F28();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B8F06048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F05D44(a1, a2, a3, a4);
}

void *sub_1B8F0606C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = v4;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v11, v16);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = v19;
  v26[1] = v20;
  v26[2] = v21;
  v26[3] = v22;
  uint64_t v23 = type metadata accessor for InternalBroadcastMessageSender();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, a4);
  swift_allocObject();
  unint64_t v24 = sub_1B8F05C68((uint64_t)v18);
  v5[5] = v23;
  v5[6] = &off_1F12BE268;
  v5[2] = v24;
  return v5;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for BroadcastMessageSender()
{
  return self;
}

uint64_t method lookup function for BroadcastMessageSender(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BroadcastMessageSender);
}

uint64_t dispatch thunk of BroadcastMessageSender.__allocating_init<A, B>(encoder:transport:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of BroadcastMessageSender.broadcast<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t sub_1B8F062F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for InternalBroadcastMessageSender()
{
  return swift_getGenericMetadata();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1B8F063EC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B8F0640C(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_1B8F06470(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

BOOL sub_1B8F064B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1B8F064D0()
{
  return sub_1B8F581A0();
}

uint64_t sub_1B8F06518()
{
  return sub_1B8F58190();
}

uint64_t sub_1B8F06544()
{
  return sub_1B8F581A0();
}

void *PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v14[21] = 0;
  v14[22] = 0;
  v14[14] = a1;
  v14[15] = a2;
  v14[19] = a5;
  v14[20] = a6;
  v14[16] = a3;
  v14[17] = a4;
  v14[18] = a7;
  return v14;
}

void *PushService.init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_defaultActor_initialize();
  v7[21] = 0;
  v7[22] = 0;
  v7[14] = a1;
  v7[15] = a2;
  v7[19] = a5;
  v7[20] = a6;
  v7[16] = a3;
  v7[17] = a4;
  v7[18] = a7;
  return v7;
}

uint64_t PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a4;
  v7[4] = a7;
  v7[2] = a3;
  uint64_t v12 = (void *)swift_allocObject();
  v7[5] = v12;
  swift_defaultActor_initialize();
  v12[21] = 0;
  v12[22] = 0;
  v12[14] = a1;
  v12[15] = a2;
  v12[16] = a3;
  uint64_t v16 = (uint64_t (*)(void))((char *)a5 + *a5);
  id v13 = a3;
  uint64_t v14 = (void *)swift_task_alloc();
  v7[6] = v14;
  void *v14 = v7;
  v14[1] = sub_1B8F067B4;
  return v16();
}

uint64_t sub_1B8F067B4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 40);
  long long v7 = *(_OWORD *)(*(void *)v2 + 24);
  swift_task_dealloc();
  *(void *)(v5 + 152) = a1;
  *(void *)(v5 + 160) = a2;
  *(_OWORD *)(v5 + 136) = v7;
  return MEMORY[0x1F4188298](sub_1B8F068E8, v5, 0);
}

uint64_t sub_1B8F068E8()
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 40);
  return v1(v2);
}

uint64_t PushService.init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 16) = a3;
  uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9EF3F30
                                                                                              + dword_1E9EF3F30);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1B8F06A44;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B8F06A44(uint64_t a1)
{
  char v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v4(a1);
}

uint64_t sub_1B8F06B58()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x1F4188298](sub_1B8F06B78, v0, 0);
}

uint64_t sub_1B8F06B78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2[3];
  long long v12 = *(_OWORD *)(v3 + 152);
  uint64_t v4 = *(void *)(v3 + 112);
  uint64_t v5 = *(void *)(v3 + 120);
  uint64_t v6 = *(void *)(v3 + 128);
  uint64_t v7 = sub_1B8F098D4(&qword_1E9EF3F40, a2, (void (*)(uint64_t))type metadata accessor for PushService);
  uint64_t v8 = swift_task_alloc();
  v2[4] = v8;
  *(void *)(v8 + 16) = v6;
  *(void *)(v8 + 24) = v3;
  *(_OWORD *)(v8 + 32) = v12;
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = v5;
  uint64_t v9 = (void *)swift_task_alloc();
  v2[5] = v9;
  unint64_t v10 = sub_1B8F089D8();
  *uint64_t v9 = v2;
  v9[1] = sub_1B8F06CE0;
  return MEMORY[0x1F4188160](v2 + 2, v3, v7, 0x6574617669746361, 0xEA00000000002928, sub_1B8F089C8, v8, v10);
}

uint64_t sub_1B8F06CE0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = sub_1B8F06E70;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 24);
    swift_task_dealloc();
    uint64_t v4 = sub_1B8F06E04;
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1B8F06E04()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_1B8F07478(v1);
  uint64_t v2 = *(uint64_t (**)(void *))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1B8F06E70()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F06ED4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v38 = a6;
  uint64_t v39 = a7;
  uint64_t v35 = a4;
  uint64_t v36 = a5;
  v37 = a2;
  uint64_t v41 = sub_1B8F57300();
  uint64_t v44 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41, v8);
  v40 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B8F57350();
  uint64_t v42 = *(void *)(v10 - 8);
  uint64_t v43 = v10;
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4020);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x1F4188790](v14, v17);
  uint64_t v18 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, v14);
  unint64_t v20 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v21 = (v16 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v24 + v20, v18, v14);
  int v25 = (void *)(v24 + v21);
  uint64_t v26 = v36;
  *int v25 = v35;
  v25[1] = v26;
  unsigned int v27 = (void *)(v24 + v22);
  uint64_t v28 = v39;
  *unsigned int v27 = v38;
  v27[1] = v28;
  unsigned int v29 = v37;
  *(void *)(v24 + v23) = v37;
  aBlock[4] = sub_1B8F09820;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F1E254;
  aBlock[3] = &block_descriptor;
  uint64_t v30 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29;
  sub_1B8F57330();
  uint64_t v45 = MEMORY[0x1E4FBC860];
  sub_1B8F098D4((unint64_t *)&qword_1E9EF4028, 255, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4030);
  sub_1B8F0991C();
  uint64_t v32 = v40;
  uint64_t v31 = v41;
  sub_1B8F57A00();
  MEMORY[0x1BA9CF6C0](0, v13, v32, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v31);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v43);
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F072CC()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void **)(Strong + 128);
    id v2 = objc_allocWithZone(MEMORY[0x1E4F4E1E8]);
    id v3 = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_1B8F574C0();
    swift_bridgeObjectRelease();
    uint64_t v5 = (void *)sub_1B8F574C0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v2, sel_initWithEnvironmentName_namedDelegatePort_queue_, v4, v5, v3);

    if (v6)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4020);
      sub_1B8F57700();
    }
    else
    {
      sub_1B8F09978();
      swift_allocError();
      *uint64_t v9 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4020);
      sub_1B8F576F0();
    }
    return swift_release();
  }
  else
  {
    sub_1B8F09978();
    swift_allocError();
    *uint64_t v7 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4020);
    return sub_1B8F576F0();
  }
}

void sub_1B8F07478(void *a1)
{
  id v2 = v1;
  uint64_t v4 = (objc_class *)type metadata accessor for PushService.PushConnectionDelegateWrapper();
  id v5 = objc_allocWithZone(v4);
  swift_weakInit();
  swift_weakAssign();
  v20.receiver = v5;
  v20.super_class = v4;
  id v6 = objc_msgSendSuper2(&v20, sel_init);
  uint64_t v7 = (void *)v2[21];
  v2[21] = v6;

  objc_msgSend(a1, sel_setDelegate_, v2[21]);
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_1B8F0846C(v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_1B8F57620();
  swift_release();
  objc_msgSend(a1, sel__setEnabledTopics_, v9);

  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1B8F572D0();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EB9C4218);
  swift_retain();
  uint64_t v11 = sub_1B8F572B0();
  os_log_type_t v12 = sub_1B8F57880();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v19 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = v2[19];
    unint64_t v16 = v2[20];
    swift_bridgeObjectRetain();
    sub_1B8F20904(v15, v16, &v19);
    sub_1B8F579A0();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_1B8F03000, v11, v12, "Push service started with environment: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9D0800](v14, -1, -1);
    MEMORY[0x1BA9D0800](v13, -1, -1);
  }
  else
  {
    swift_release();
  }

  uint64_t v17 = (void *)v2[22];
  v2[22] = a1;
  id v18 = a1;
}

uint64_t sub_1B8F076E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1B8F58180();
    sub_1B8F57450();
    uint64_t v6 = sub_1B8F581A0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1B8F57EE0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          unint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1B8F57EE0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_1B8F0781C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1B8F572D0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB9C4218);
  id v5 = sub_1B8F572B0();
  os_log_type_t v6 = sub_1B8F57860();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1B8F03000, v5, v6, "Informing delegates of incoming message", v7, 2u);
    MEMORY[0x1BA9D0800](v7, -1, -1);
  }

  uint64_t v8 = *(void *)(v2 + 136);
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = (uint64_t *)(v8 + 40);
    do
    {
      uint64_t v11 = *v10;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v13 = swift_unknownObjectRetain();
      sub_1B8F09384(v13, a1, ObjectType, v11);
      swift_unknownObjectRelease();
      v10 += 2;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease();
  }
}

void sub_1B8F0798C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1B8F572D0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB9C4218);
  uint64_t v7 = sub_1B8F572B0();
  os_log_type_t v8 = sub_1B8F57860();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1B8F03000, v7, v8, "Informing delegates of incoming message", v9, 2u);
    MEMORY[0x1BA9D0800](v9, -1, -1);
  }

  uint64_t v10 = *(void *)(v3 + 136);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    BOOL v12 = (uint64_t *)(v10 + 40);
    do
    {
      uint64_t v13 = *v12;
      uint64_t ObjectType = swift_getObjectType();
      unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 40);
      swift_unknownObjectRetain();
      v15(a1, a2, ObjectType, v13);
      swift_unknownObjectRelease();
      v12 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
}

id *PushService.deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t PushService.__deallocating_deinit()
{
  PushService.deinit();
  return MEMORY[0x1F4188210](v0);
}

uint64_t PushService.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1B8F07BB0()
{
  return v0;
}

uint64_t sub_1B8F07BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x1F4188298](sub_1B8F07BE0, a4, 0);
}

uint64_t sub_1B8F07BE0()
{
  sub_1B8F0798C(v0[3], v0[4]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1B8F07C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B8F57740();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B8F57730();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B8F09070(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B8F576E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B8F07FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x1F4188298](sub_1B8F07FEC, a4, 0);
}

id sub_1B8F07FEC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 144);
  id result = objc_msgSend(*(id *)(v0 + 24), sel_topic);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = sub_1B8F574D0();
    uint64_t v6 = v5;

    char v7 = sub_1B8F076E4(v4, v6, v1);
    swift_bridgeObjectRelease();
    if (v7) {
      sub_1B8F0781C(*(void **)(v0 + 24));
    }
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B8F08254()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PushService.PushConnectionDelegateWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8F08298(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B8F08374;
  return v6(a1);
}

uint64_t sub_1B8F08374()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_1B8F0846C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C32F8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1B8F08554((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1B8F096C0();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1B8F08554(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    objc_super v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    id result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B8F08754(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  v8[3] = a7;
  v8[4] = v7;
  v8[2] = a4;
  swift_defaultActor_initialize();
  v7[21] = 0;
  v7[22] = 0;
  v7[14] = a1;
  v7[15] = a2;
  v7[16] = a3;
  unint64_t v16 = (uint64_t (*)(void))((char *)a5 + *a5);
  id v13 = a3;
  int64_t v14 = (void *)swift_task_alloc();
  v8[5] = v14;
  void *v14 = v8;
  v14[1] = sub_1B8F0886C;
  return v16();
}

uint64_t sub_1B8F0886C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(*v2 + 32);
  long long v9 = *(_OWORD *)(*v2 + 16);
  uint64_t v10 = *v2;
  swift_task_dealloc();
  *(void *)(v5 + 152) = a1;
  *(void *)(v5 + 160) = a2;
  *(_OWORD *)(v5 + 136) = v9;
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v10 + 8);
  uint64_t v7 = *(void *)(v10 + 32);
  return v6(v7);
}

uint64_t type metadata accessor for PushService()
{
  return self;
}

uint64_t sub_1B8F089C8(uint64_t a1)
{
  return sub_1B8F06ED4(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

unint64_t sub_1B8F089D8()
{
  unint64_t result = qword_1E9EF3F48;
  if (!qword_1E9EF3F48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9EF3F48);
  }
  return result;
}

uint64_t method lookup function for PushService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PushService);
}

uint64_t dispatch thunk of PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of PushService.__allocating_init(machPortName:connectionQueue:delegates:apsEnvironment:pushTopics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 200)
                                                                                              + **(int **)(v7 + 200));
  unint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v16;
  *unint64_t v16 = v8;
  v16[1] = sub_1B8F08B78;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1B8F08B78(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of PushService.activate()()
{
  int64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 208) + **(int **)(*(void *)v0 + 208));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1B8F08D68;
  return v4();
}

uint64_t sub_1B8F08D68(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for PushService.PushConnectionDelegateWrapper()
{
  return self;
}

uint64_t sub_1B8F08E88()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B8F08ED0()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1B8F08F7C;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x1F4188298](sub_1B8F07FEC, v3, 0);
}

uint64_t sub_1B8F08F7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B8F09070(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B8F090D0()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F09108(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1B8F08F7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9EF3FF8 + dword_1E9EF3FF8);
  return v6(a1, v4);
}

uint64_t sub_1B8F091C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B8F091D4(a1, a2);
  }
  return a1;
}

uint64_t sub_1B8F091D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1B8F0922C()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_1B8F091D4(*(void *)(v0 + 40), *(void *)(v0 + 48));
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B8F09274()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[3] = v3;
  v5[4] = v4;
  v5[1] = sub_1B8F09BDC;
  v5[2] = v2;
  return MEMORY[0x1F4188298](sub_1B8F07BE0, v2, 0);
}

uint64_t sub_1B8F0932C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1B8F09384(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  MEMORY[0x1F4188790](v9, v10);
  unsigned int v27 = (char *)&v27 - v11;
  uint64_t v12 = sub_1B8F57980();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v12, v14);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v18 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](v15, v19);
  uint64_t v21 = (char *)&v27 - v20;
  (*(void (**)(void *, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(a2, AssociatedTypeWitness, AssociatedConformanceWitness);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, AssociatedTypeWitness) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v17, AssociatedTypeWitness);
  unint64_t v23 = v27;
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v25 = v31;
  uint64_t v24 = v32;
  char v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 32))(v23, v31, v32);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v29);
  if (v26) {
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 24))(v21, v25, v24);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, AssociatedTypeWitness);
}

uint64_t sub_1B8F096C0()
{
  return swift_release();
}

uint64_t sub_1B8F096CC()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F09704()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4020);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

uint64_t sub_1B8F09820()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4020);
  return sub_1B8F072CC();
}

uint64_t sub_1B8F098D4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B8F0991C()
{
  unint64_t result = qword_1E9EF4038;
  if (!qword_1E9EF4038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9EF4030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4038);
  }
  return result;
}

unint64_t sub_1B8F09978()
{
  unint64_t result = qword_1E9EF4040;
  if (!qword_1E9EF4040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4040);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PushService.PushServiceError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PushService.PushServiceError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B8F09B34);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1B8F09B5C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B8F09B68(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PushService.PushServiceError()
{
  return &type metadata for PushService.PushServiceError;
}

unint64_t sub_1B8F09B88()
{
  unint64_t result = qword_1E9EF4048;
  if (!qword_1E9EF4048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4048);
  }
  return result;
}

uint64_t OSTransaction.__allocating_init(name:)(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = swift_allocObject();
  OSTransaction.init(name:)(a1, a2, a3);
  return v6;
}

void *OSTransaction.deinit()
{
  uint64_t v1 = v0;
  if (v0[5])
  {
    sub_1B8F57870();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C36B0);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1B8F59040;
    uint64_t v4 = v0[2];
    uint64_t v3 = v0[3];
    *(void *)(v2 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v2 + 64) = sub_1B8F05154();
    *(void *)(v2 + 32) = v4;
    *(void *)(v2 + 40) = v3;
    sub_1B8F05114();
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_1B8F57960();
    sub_1B8F572A0();
    swift_bridgeObjectRelease();
  }
  _s18AAAFoundationSwift13OSTransactionC8completeyyF_0();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v1;
}

uint64_t static OSTransaction.named(_:block:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 88) = a5;
  *(void *)(v6 + 96) = v5;
  *(void *)(v6 + 72) = a2;
  *(void *)(v6 + 80) = a4;
  *(unsigned char *)(v6 + 128) = a3;
  *(void *)(v6 + 64) = a1;
  return MEMORY[0x1F4188298](sub_1B8F09DF0, 0, 0);
}

{
  uint64_t v5;
  uint64_t v6;

  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = v5;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a4;
  *(unsigned char *)(v6 + 80) = a3;
  *(void *)(v6 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1B8F0A114, 0, 0);
}

uint64_t sub_1B8F09DF0()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(int **)(v0 + 80);
  unint64_t v3 = *(void *)(v0 + 64);
  int v4 = *(unsigned __int8 *)(v0 + 128);
  *(void *)(v0 + 104) = swift_initStackObject();
  OSTransaction.init(name:)(v3, v2, v4);
  BOOL v7 = (uint64_t (*)(void))((char *)v1 + *v1);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v5;
  void *v5 = v0;
  v5[1] = sub_1B8F09EFC;
  return v7();
}

uint64_t sub_1B8F09EFC()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F0A07C;
  }
  else {
    uint64_t v2 = sub_1B8F0A010;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F0A010()
{
  _s18AAAFoundationSwift13OSTransactionC8completeyyF_0();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0A07C()
{
  _s18AAAFoundationSwift13OSTransactionC8completeyyF_0();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0A114()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(int **)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 16);
  int v4 = *(unsigned __int8 *)(v0 + 80);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 56) = v5;
  OSTransaction.init(name:)(v3, v2, v4);
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1B8F0A22C;
  return v8(v5);
}

uint64_t sub_1B8F0A22C()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F0A3A4;
  }
  else {
    uint64_t v2 = sub_1B8F0A340;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F0A340()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0A3A4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t OSTransaction.description.getter()
{
  return 0x61736E617254534FLL;
}

uint64_t sub_1B8F0A4A0()
{
  return OSTransaction.description.getter();
}

uint64_t method lookup function for OSTransaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for OSTransaction);
}

uint64_t dispatch thunk of OSTransaction.__allocating_init(name:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1B8F0A4F0(uint64_t a1, uint64_t a2, char a3)
{
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = a2;
  *(unsigned char *)(v3 + 128) = a3 & 1;
  return sub_1B8F0B058();
}

uint64_t sub_1B8F0A514@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_1E9EF4068;
  swift_beginAccess();
  return sub_1B8F0B1B0(v3, a1);
}

uint64_t sub_1B8F0A568(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  v2[7] = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  v2[8] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B8F0A624, v1, 0);
}

uint64_t sub_1B8F0A624()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = *(void *)(v1 + 112);
  v0[9] = v2;
  uint64_t v3 = *(void *)(v1 + 120);
  v0[10] = v3;
  if (*(unsigned char *)(v1 + 128))
  {
    uint64_t v4 = v0[7];
    sub_1B8F0B798();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[14] = v5;
    uint64_t v6 = *(void *)(v4 + 80);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
    void *v5 = v0;
    v5[1] = sub_1B8F0A99C;
    uint64_t v8 = v0[5];
    uint64_t v9 = MEMORY[0x1E4FBC0F0];
    uint64_t v10 = v2;
    uint64_t v11 = v6;
  }
  else
  {
    uint64_t v13 = (void *)v0[7];
    uint64_t v12 = v0[8];
    uint64_t v14 = v1 + qword_1E9EF4068;
    swift_beginAccess();
    sub_1B8F0B1B0(v14, v12);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    uint64_t v16 = v13[10];
    v15[4] = v16;
    v15[5] = v13[11];
    v15[6] = v13[12];
    v15[7] = v2;
    v15[8] = v3;
    sub_1B8F0B798();
    swift_retain();
    uint64_t v17 = sub_1B8F0AD84(v12, (uint64_t)&unk_1E9EF41A8, (uint64_t)v15);
    v0[11] = v17;
    *(void *)(v1 + 112) = v17;
    *(void *)(v1 + 120) = 0;
    *(unsigned char *)(v1 + 128) = 1;
    swift_retain();
    sub_1B8F0B058();
    uint64_t v18 = (void *)swift_task_alloc();
    v0[12] = v18;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
    *uint64_t v18 = v0;
    v18[1] = sub_1B8F0A870;
    uint64_t v8 = v0[5];
    uint64_t v9 = MEMORY[0x1E4FBC0F0];
    uint64_t v10 = v17;
    uint64_t v11 = v16;
  }
  return MEMORY[0x1F4187D90](v8, v10, v11, v7, v9);
}

uint64_t sub_1B8F0A870()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_1B8F0ABB8;
  }
  else {
    uint64_t v4 = sub_1B8F0AAC8;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1B8F0A99C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_1B8F0AC38;
  }
  else {
    uint64_t v4 = sub_1B8F0AB48;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_1B8F0AAC8()
{
  swift_release();
  sub_1B8F0B058();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0AB48()
{
  sub_1B8F0B058();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0ABB8()
{
  swift_release();
  sub_1B8F0B058();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0AC38()
{
  sub_1B8F0B058();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F0ACA8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_1B8F09BDC;
  return v8(a1);
}

uint64_t sub_1B8F0AD84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B8F57740();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1B8F57730();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1B8F09070(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B8F576E0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1B8F0AF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F0AF54(a1, a2, a3);
}

uint64_t sub_1B8F0AF54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_defaultActor_initialize();
  uint64_t v7 = v3 + qword_1E9EF4068;
  uint64_t v8 = sub_1B8F57740();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  swift_beginAccess();
  sub_1B8F0BA9C(a1, v7);
  swift_endAccess();
  *(void *)(v3 + 112) = a2;
  *(void *)(v3 + 120) = a3;
  *(unsigned char *)(v3 + 128) = 0;
  return v3;
}

uint64_t LazyTask.deinit()
{
  sub_1B8F0B058();
  sub_1B8F09070(v0 + qword_1E9EF4068);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B8F0B058()
{
  return swift_release();
}

uint64_t LazyTask.__deallocating_deinit()
{
  LazyTask.deinit();
  return MEMORY[0x1F4188210](v0);
}

uint64_t LazyTask.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1B8F0B09C()
{
  return LazyTask.unownedExecutor.getter();
}

uint64_t LazyTask<>.init(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F0B1B0(a1, (uint64_t)v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = *(void *)(v3 + 80);
  v11[3] = a2;
  v11[4] = a3;
  swift_allocObject();
  uint64_t v12 = sub_1B8F0AF54((uint64_t)v10, (uint64_t)&unk_1E9EF4078, (uint64_t)v11);
  sub_1B8F09070(a1);
  return v12;
}

{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F0B1B0(a1, (uint64_t)v9);
  swift_allocObject();
  uint64_t v10 = sub_1B8F0AF54((uint64_t)v9, a2, a3);
  sub_1B8F09070(a1);
  return v10;
}

uint64_t sub_1B8F0B1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F0B218()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F0B250(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1B8F08F7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9EF4070 + dword_1E9EF4070);
  return v6(a1, v4);
}

uint64_t LazyTask<>.value.getter(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B8F0B3B4;
  return sub_1B8F0A568(a1);
}

{
  uint64_t v1;
  void *v3;
  uint64_t v5;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B8F08F7C;
  return sub_1B8F0A568(a1);
}

uint64_t sub_1B8F0B3B4()
{
  uint64_t v2 = (void *)*v1;
  v2[4] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[2];
    return MEMORY[0x1F4188298](sub_1B8F0B4E8, v3, 0);
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_1B8F0B4E8()
{
  return MEMORY[0x1F41867D8](*(void *)(v0 + 32), "AAAFoundationSwift/LazyTask.swift", 33, 1, 53);
}

void sub_1B8F0B660()
{
  sub_1B8F0B734();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t type metadata accessor for LazyTask()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for LazyTask(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LazyTask);
}

void sub_1B8F0B734()
{
  if (!qword_1E9EF4118[0])
  {
    sub_1B8F57740();
    unint64_t v0 = sub_1B8F57980();
    if (!v1) {
      atomic_store(v0, qword_1E9EF4118);
    }
  }
}

uint64_t sub_1B8F0B78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t sub_1B8F0B798()
{
  return swift_retain();
}

uint64_t sub_1B8F0B7A4()
{
  return sub_1B8F0B058();
}

uint64_t sub_1B8F0B7B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1B8F0B798();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1B8F0B800(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1B8F0B798();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1B8F0B058();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_1B8F0B86C(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1B8F0B058();
  return a1;
}

uint64_t sub_1B8F0B8B4(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_1B8F0B8FC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B8F0B940(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1B8F0B948(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for LazyTask.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F0B96C()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1B8F0B9AC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[7];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B8F09BDC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9EF41A0 + dword_1E9EF41A0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B8F0BA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t static Promise.race(_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  type metadata accessor for Promise();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  swift_bridgeObjectRetain();
  return Promise.__allocating_init(startBlock:)((uint64_t)sub_1B8F0BC58, v4);
}

uint64_t sub_1B8F0BB84()
{
  return sub_1B8F575E0();
}

uint64_t sub_1B8F0BC20()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F0BC58()
{
  return sub_1B8F0BB84();
}

void sub_1B8F0BC60()
{
  sub_1B8F0F5F0(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t WeakWrapper.deinit()
{
  sub_1B8F0BCBC(v0 + 16);
  sub_1B8F0BCE4(v0 + 24);
  return v0;
}

uint64_t sub_1B8F0BCBC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B8F0BCE4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t WeakWrapper.__deallocating_deinit()
{
  sub_1B8F0BCBC(v0 + 16);
  sub_1B8F0BCE4(v0 + 24);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t type metadata accessor for WeakWrapper()
{
  return self;
}

uint64_t method lookup function for WeakWrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for WeakWrapper);
}

uint64_t Promise.__allocating_init(startBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  Promise.init(startBlock:)(a1, a2);
  return v4;
}

id sub_1B8F0BE10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char *)v3 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v3) + 0x58);
  id v11 = v10;
  v12(v9);
  if (!v4)
  {
    type metadata accessor for Promise.Box();
    id v11 = sub_1B8F1141C((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a3);
  }
  return v11;
}

void sub_1B8F0BF34()
{
}

id sub_1B8F0BF5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Promise.Box();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8F0BFB8(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)a1) + 0x58)]);
}

uint64_t *Promise.__allocating_init<A>(with:)(void *a1)
{
  uint64_t v3 = objc_msgSend(a1, sel_then);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = *(void *)(v1 + 80);
  v10[4] = sub_1B8F0CAB4;
  v10[5] = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1B8F0C16C;
  v10[3] = &block_descriptor_0;
  uint64_t v5 = _Block_copy(v10);
  uint64_t v6 = (uint64_t (*)(void *, void *))v3[2];
  swift_retain();
  id v7 = (id)v6(v3, v5);
  _Block_release(v3);
  swift_release();
  _Block_release(v5);
  swift_release();
  swift_allocObject();
  uint64_t v8 = sub_1B8F0C3C4(v7);

  return v8;
}

uint64_t sub_1B8F0C170@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    uint64_t v4 = type metadata accessor for Promise.Box();
    uint64_t v6 = a1;
    uint64_t result = (uint64_t)sub_1B8F1141C((uint64_t)&v6);
    *a2 = result;
  }
  else
  {
    uint64_t result = type metadata accessor for Promise.UnderlyingValueMissing();
    uint64_t v4 = result;
  }
  a2[3] = v4;
  return result;
}

uint64_t *sub_1B8F0C1D4(void *a1)
{
  return sub_1B8F0C3C4(a1);
}

uint64_t sub_1B8F0C210(void *a1)
{
  uint64_t v3 = (uint64_t (**)(id, void *))objc_msgSend(a1, sel_then);
  uint64_t v14 = sub_1B8F0C770;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 1107296256;
  uint64_t v12 = (id (*)(uint64_t, void *))sub_1B8F0C16C;
  uint64_t v13 = &block_descriptor_141;
  uint64_t v4 = _Block_copy(&v10);
  id v5 = (id)v3[2](v3, v4);
  _Block_release(v3);
  _Block_release(v4);
  swift_release();
  uint64_t v6 = (uint64_t (**)(id, void *))objc_msgSend(v5, sel_catch);

  uint64_t v14 = sub_1B8F0C8BC;
  uint64_t v15 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 1107296256;
  uint64_t v12 = sub_1B8F0C8B4;
  uint64_t v13 = &block_descriptor_144;
  id v7 = _Block_copy(&v10);
  id v8 = (id)v6[2](v6, v7);

  _Block_release(v6);
  _Block_release(v7);
  swift_release();
  *(void *)(v1 + 16) = v8;
  return v1;
}

uint64_t *sub_1B8F0C3C4(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = objc_msgSend(a1, sel_then);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = *(void *)(v3 + 80);
  *(void *)(v5 + 16) = v6;
  uint64_t v20 = sub_1B8F12550;
  uint64_t v21 = v5;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 1107296256;
  uint64_t v18 = (id (*)(uint64_t, void *))sub_1B8F0C16C;
  uint64_t v19 = &block_descriptor_177;
  id v7 = _Block_copy(&v16);
  id v8 = (uint64_t (*)(void *, void *))v4[2];
  swift_retain();
  id v9 = (id)v8(v4, v7);
  _Block_release(v4);
  swift_release();
  _Block_release(v7);
  swift_release();
  uint64_t v10 = objc_msgSend(v9, sel_catch);

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  uint64_t v20 = sub_1B8F12568;
  uint64_t v21 = v11;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_1B8F0C8B4;
  uint64_t v19 = &block_descriptor_183;
  uint64_t v12 = _Block_copy(&v16);
  uint64_t v13 = (uint64_t (*)(void *, void *))v10[2];
  swift_retain();
  id v14 = (id)v13(v10, v12);

  _Block_release(v10);
  swift_release();
  _Block_release(v12);
  swift_release();
  self;
  v1[2] = swift_dynamicCastObjCClassUnconditional();
  return v1;
}

id sub_1B8F0C614(uint64_t a1)
{
  void (*v1)(void *__return_ptr, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void v10[3];
  uint64_t v11;
  uint64_t vars8;

  uint64_t v1 = *(void (**)(void *__return_ptr, uint64_t))(a1 + 32);
  swift_retain();
  objc_super v2 = swift_unknownObjectRetain();
  v1(v10, v2);
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v3 = v11;
  if (v11)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_1(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4, v4);
    id v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    id v8 = (void *)sub_1B8F57ED0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

uint64_t sub_1B8F0C770@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    swift_unknownObjectRetain();
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4390);
    uint64_t result = swift_dynamicCastClass();
    if (result)
    {
      a2[3] = v3;
      *a2 = result;
      return result;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4390);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4398);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF43A0);
  a2[3] = result;
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_1B8F0C80C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    uint64_t v3 = type metadata accessor for Promise.Box();
    swift_unknownObjectRetain();
    uint64_t result = swift_dynamicCastClass();
    if (result)
    {
      a2[3] = v3;
      *a2 = result;
      return result;
    }
    swift_unknownObjectRelease();
  }
  uint64_t v5 = type metadata accessor for Promise.Box();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4398);
  uint64_t result = type metadata accessor for Promise.UnexpectedType();
  a2[3] = result;
  *a2 = v5;
  a2[1] = v6;
  return result;
}

uint64_t sub_1B8F0C8AC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

id sub_1B8F0C8B4(uint64_t a1, void *a2)
{
  return sub_1B8F0EE64(a1, a2);
}

uint64_t sub_1B8F0C8BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    swift_getErrorValue();
    a2[3] = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
    return (*(uint64_t (**)(uint64_t *))(*(void *)(v5 - 8) + 16))(boxed_opaque_existential_0);
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4388);
    a2[3] = result;
  }
  return result;
}

uint64_t sub_1B8F0C950@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  if (a1)
  {
    swift_getErrorValue();
    a2[3] = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
    return (*(uint64_t (**)(uint64_t *))(*(void *)(v5 - 8) + 16))(boxed_opaque_existential_0);
  }
  else
  {
    uint64_t result = type metadata accessor for Promise.UnderlyingErrorMissing();
    a2[3] = result;
  }
  return result;
}

uint64_t *Promise.init(startBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C33F8);
  id v7 = (void *)swift_allocObject();
  v7[2] = *(void *)(v6 + 80);
  v7[3] = a1;
  v7[4] = a2;
  type metadata accessor for Promise.Box();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3[2] = (uint64_t)sub_1B8F10F8C((uint64_t)sub_1B8F0CBEC, (uint64_t)v7);
  return v3;
}

uint64_t sub_1B8F0CAA4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F0CAB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B8F0C170(a1, a2);
}

uint64_t sub_1B8F0CABC(uint64_t a1, uint64_t a2, void (*a3)(void (*)(uint64_t a1), uint64_t))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  a3(sub_1B8F12440, v6);
  return swift_release();
}

uint64_t sub_1B8F0CB50(uint64_t a1, uint64_t a2, void (*a3)(void (*)(uint64_t a1), void *), uint64_t a4, uint64_t a5)
{
  id v9 = (void *)swift_allocObject();
  v9[2] = a5;
  v9[3] = a1;
  v9[4] = a2;
  swift_retain();
  a3(sub_1B8F12534, v9);
  return swift_release();
}

uint64_t sub_1B8F0CBEC(uint64_t a1, uint64_t a2)
{
  return sub_1B8F0CB50(a1, a2, *(void (**)(void (*)(uint64_t), void *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 16));
}

void sub_1B8F0CBF8(void *a1, char a2, void (*a3)(id, void *))
{
  if (a2)
  {
    id v7 = a1;
    a3(0, a1);
    sub_1B8F1154C(a1, 1);
  }
  else
  {
    uint64_t v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF43C0);
    v8.receiver = objc_allocWithZone(v4);
    v8.super_class = v4;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    a3(v5, 0);
  }
}

void sub_1B8F0CCB0(uint64_t a1, void (*a2)(id, id), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](a1, a2);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v10 = sub_1B8F581B0();
  MEMORY[0x1F4188790](v10, v11);
  uint64_t v13 = (id *)((char *)&v18 - v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v18 - v12, a1, v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v15 = *v13;
    id v16 = *v13;
    a2(0, v15);
  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v7 + 32))(v9, v13, a4);
    type metadata accessor for Promise.Box();
    id v17 = sub_1B8F1141C((uint64_t)v9);
    a2(v17, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a4);
  }
}

uint64_t type metadata accessor for Promise.Box()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Promise.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v4 = sub_1B8F581B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v13 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - v7, a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v8, v4);
  uint64_t v11 = swift_allocObject();
  Promise.init(startBlock:)((uint64_t)sub_1B8F0D174, v10);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v11;
}

uint64_t sub_1B8F0D060()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v2 = *(void *)(sub_1B8F581B0() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  if (swift_getEnumCaseMultiPayload() == 1) {

  }
  else {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);
  }
  return MEMORY[0x1F4186498](v0, v4 + v5, v3 | 7);
}

uint64_t sub_1B8F0D174(uint64_t (*a1)(unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v3 = *(void *)(sub_1B8F581B0() - 8);
  return a1(v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

void sub_1B8F0D208(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, void *a5@<X8>)
{
  if (a1)
  {
    id v9 = a1;
    id v10 = sub_1B8F0BE10(a2, a3, a4);
    a5[3] = type metadata accessor for Promise.Box();

    *a5 = v10;
  }
  else
  {
    a5[3] = type metadata accessor for Promise.UnderlyingValueMissing();
  }
}

void sub_1B8F0D2FC(void *a1@<X0>, uint64_t (*a2)(char *)@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    uint64_t v5 = (char *)a1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *a1) + 0x58);
    uint64_t v6 = a1;
    id v7 = *(id *)(a2(v5) + 16);
    swift_release();
    a3[3] = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C33F8);

    *a3 = v7;
  }
  else
  {
    a3[3] = type metadata accessor for Promise.UnderlyingValueMissing();
  }
}

void sub_1B8F0D424(void *a1@<X0>, void (*a2)(void *)@<X1>, uint64_t a3@<X4>, void *a4@<X8>)
{
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v9)
  {
    id v12 = a1;
    a2(a1);
    uint64_t v13 = type metadata accessor for Promise.Box();
    id v14 = sub_1B8F1141C((uint64_t)v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, a3);
    a4[3] = v13;

    *a4 = v14;
  }
  else
  {
    a4[3] = type metadata accessor for Promise.UnderlyingErrorMissing();
  }
}

void sub_1B8F0D5BC(void *a1@<X0>, uint64_t (*a2)(void *)@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    id v6 = a1;
    id v7 = *(id *)(a2(a1) + 16);
    swift_release();
    a3[3] = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C33F8);

    *a3 = v7;
  }
  else
  {
    a3[3] = type metadata accessor for Promise.UnderlyingErrorMissing();
  }
}

uint64_t sub_1B8F0D6C4(char *a1, void *a2, void (*a3)(void *), uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v9 = sub_1B8F581B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = MEMORY[0x1F4188790](v9, v11);
  id v14 = (uint64_t *)((char *)&v17 - v13);
  if (a2)
  {
    void *v14 = a2;
    swift_storeEnumTagMultiPayload();
    id v15 = a2;
    a3(v14);
  }
  else
  {
    if (!a1) {
      return result;
    }
    (*(void (**)(void *, char *, uint64_t))(*(void *)(a5 - 8) + 16))(v14, &a1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)a1) + 0x58)], a5);
    swift_storeEnumTagMultiPayload();
    id v16 = a1;
    a3(v14);
  }
  return (*(uint64_t (**)(void *, uint64_t))(v10 + 8))(v14, v9);
}

uint64_t *sub_1B8F0D86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  type metadata accessor for Promise();
  uint64_t v8 = objc_msgSend((id)v3[2], sel_then);
  uint64_t v9 = *(void *)(v7 + 80);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a3;
  v10[4] = a1;
  v10[5] = a2;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = a3;
  v11[4] = sub_1B8F12528;
  v11[5] = v10;
  swift_retain();
  v16[4] = sub_1B8F11488;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B8F0DA30;
  v16[3] = &block_descriptor_12;
  id v12 = _Block_copy(v16);
  uint64_t v13 = (uint64_t (*)(void *, void *))v8[2];
  swift_retain();
  id v14 = (id)v13(v8, v12);
  _Block_release(v8);
  swift_release();
  _Block_release(v12);
  swift_release();
  swift_allocObject();
  return sub_1B8F0C3C4(v14);
}

uint64_t type metadata accessor for Promise()
{
  return __swift_instantiateGenericMetadata();
}

id sub_1B8F0DA30(uint64_t a1, void *a2)
{
  return sub_1B8F0EE64(a1, a2);
}

uint64_t *sub_1B8F0DA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for Promise();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = *(void *)(v9 + 80);
  id v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v11;
  v13[3] = a4;
  v13[4] = sub_1B8F12528;
  v13[5] = v12;
  swift_retain();
  v17[4] = sub_1B8F12758;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1B8F0DA30;
  v17[3] = &block_descriptor_19;
  id v14 = _Block_copy(v17);
  swift_release();
  id v15 = objc_msgSend(v10, sel_then_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B8F0C3C4(v15);
}

uint64_t *sub_1B8F0DBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  type metadata accessor for Promise();
  uint64_t v8 = objc_msgSend((id)v3[2], sel_then);
  uint64_t v9 = *(void *)(v7 + 80);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a3;
  v10[4] = a1;
  v10[5] = a2;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = a3;
  v11[4] = sub_1B8F1251C;
  v11[5] = v10;
  swift_retain();
  v16[4] = sub_1B8F12758;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B8F0DA30;
  v16[3] = &block_descriptor_26;
  id v12 = _Block_copy(v16);
  uint64_t v13 = (uint64_t (*)(void *, void *))v8[2];
  swift_retain();
  id v14 = (id)v13(v8, v12);
  _Block_release(v8);
  swift_release();
  _Block_release(v12);
  swift_release();
  swift_allocObject();
  return sub_1B8F0C3C4(v14);
}

uint64_t *sub_1B8F0DD68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for Promise();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = *(void *)(v9 + 80);
  id v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v11;
  v13[3] = a4;
  v13[4] = sub_1B8F1251C;
  v13[5] = v12;
  swift_retain();
  v17[4] = sub_1B8F12758;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1B8F0DA30;
  v17[3] = &block_descriptor_33;
  id v14 = _Block_copy(v17);
  swift_release();
  id v15 = objc_msgSend(v10, sel_then_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B8F0C3C4(v15);
}

uint64_t *sub_1B8F0DEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  type metadata accessor for Promise();
  uint64_t v8 = objc_msgSend((id)v3[2], sel_catch);
  uint64_t v9 = *(void *)(v7 + 80);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a3;
  v10[4] = a1;
  v10[5] = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1B8F12510;
  *(void *)(v11 + 24) = v10;
  swift_retain();
  v16[4] = sub_1B8F114B0;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B8F0C8B4;
  v16[3] = &block_descriptor_39;
  id v12 = _Block_copy(v16);
  uint64_t v13 = (uint64_t (*)(void *, void *))v8[2];
  swift_retain();
  id v14 = (id)v13(v8, v12);
  _Block_release(v8);
  swift_release();
  _Block_release(v12);
  swift_release();
  swift_allocObject();
  return sub_1B8F0C3C4(v14);
}

uint64_t *sub_1B8F0E094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for Promise();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = *(void *)(v9 + 80);
  id v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1B8F12510;
  *(void *)(v13 + 24) = v12;
  swift_retain();
  v17[4] = sub_1B8F1275C;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1B8F0C8B4;
  v17[3] = &block_descriptor_46;
  id v14 = _Block_copy(v17);
  swift_release();
  id v15 = objc_msgSend(v10, sel_catch_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B8F0C3C4(v15);
}

uint64_t *sub_1B8F0E214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  type metadata accessor for Promise();
  uint64_t v8 = objc_msgSend((id)v3[2], sel_catch);
  uint64_t v9 = *(void *)(v7 + 80);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = a3;
  v10[4] = a1;
  v10[5] = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1B8F12504;
  *(void *)(v11 + 24) = v10;
  swift_retain();
  v16[4] = sub_1B8F1275C;
  v16[5] = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B8F0C8B4;
  v16[3] = &block_descriptor_53;
  id v12 = _Block_copy(v16);
  uint64_t v13 = (uint64_t (*)(void *, void *))v8[2];
  swift_retain();
  id v14 = (id)v13(v8, v12);
  _Block_release(v8);
  swift_release();
  _Block_release(v12);
  swift_release();
  swift_allocObject();
  return sub_1B8F0C3C4(v14);
}

uint64_t *sub_1B8F0E3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  type metadata accessor for Promise();
  uint64_t v10 = (void *)v4[2];
  uint64_t v11 = *(void *)(v9 + 80);
  id v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = a3;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_1B8F12504;
  *(void *)(v13 + 24) = v12;
  swift_retain();
  v17[4] = sub_1B8F1275C;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1B8F0C8B4;
  v17[3] = &block_descriptor_60;
  id v14 = _Block_copy(v17);
  swift_release();
  id v15 = objc_msgSend(v10, sel_catch_onQueue_, v14, a1);
  _Block_release(v14);
  swift_allocObject();
  return sub_1B8F0C3C4(v15);
}

uint64_t sub_1B8F0E53C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B8F57BC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2) {
    goto LABEL_11;
  }
  v16[0] = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1B8F57AF0();
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = v4 + 1;
        id v6 = *(id *)(MEMORY[0x1BA9CF830](v4) + 16);
        swift_unknownObjectRelease();
        sub_1B8F57AC0();
        sub_1B8F57B00();
        sub_1B8F57B10();
        sub_1B8F57AD0();
        uint64_t v4 = v5;
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v7 = (uint64_t *)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        id v9 = *(id *)(v8 + 16);
        sub_1B8F57AC0();
        sub_1B8F57B00();
        sub_1B8F57B10();
        sub_1B8F57AD0();
        --v2;
      }
      while (v2);
    }
LABEL_11:
    uint64_t v10 = self;
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C33F8);
    uint64_t v11 = (void *)sub_1B8F57620();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v10, sel_all_, v11);

    uint64_t v13 = (uint64_t (**)(id, void *))objc_msgSend(v12, sel_then);
    v16[4] = sub_1B8F0EFC4;
    v16[5] = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 1107296256;
    v16[2] = sub_1B8F0DA30;
    v16[3] = &block_descriptor_138;
    id v14 = _Block_copy(v16);
    id v15 = (id)v13[2](v13, v14);
    _Block_release(v13);
    _Block_release(v14);
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4380);
    swift_allocObject();
    return sub_1B8F0C210(v15);
  }
  __break(1u);
  return result;
}

uint64_t *static Promise.all(_:)(uint64_t a1)
{
  uint64_t v17 = *(void *)(v1 + 80);
  uint64_t v2 = v17;
  aBlock[0] = a1;
  type metadata accessor for Promise();
  uint64_t v3 = sub_1B8F576C0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C33F8);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_1B8F0EA64((void (*)(char *, char *))sub_1B8F114D8, (uint64_t)&v16, v3, v4, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v6);
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_1B8F57620();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_all_, v8);

  uint64_t v10 = objc_msgSend(v9, sel_then);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  aBlock[4] = sub_1B8F11508;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F0DA30;
  aBlock[3] = &block_descriptor_66;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = (uint64_t (*)(void *, void *))v10[2];
  swift_retain();
  id v14 = (id)v13(v10, v12);
  _Block_release(v10);
  swift_release();
  _Block_release(v12);
  swift_release();
  sub_1B8F576C0();
  type metadata accessor for Promise();
  swift_allocObject();
  return sub_1B8F0C3C4(v14);
}

id sub_1B8F0EA00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(void **)(*(void *)a1 + 16);
  self;
  *a2 = swift_dynamicCastObjCClassUnconditional();
  return v3;
}

uint64_t sub_1B8F0EA64(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v31 = a5;
  uint64_t v32 = a8;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v30 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v43 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1F4188790](AssociatedTypeWitness, v10);
  uint64_t v13 = (char *)&v29 - v12;
  MEMORY[0x1F4188790](v11, v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(v17 - 8);
  uint64_t v34 = v17;
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)&v29 - v19;
  uint64_t v21 = sub_1B8F57830();
  if (!v21) {
    return sub_1B8F57680();
  }
  uint64_t v22 = v21;
  uint64_t v46 = sub_1B8F573C0();
  uint64_t v35 = sub_1B8F57B40();
  sub_1B8F57AE0();
  uint64_t v39 = v8;
  uint64_t result = sub_1B8F57820();
  if (v22 < 0)
  {
    __break(1u);
  }
  else
  {
    v37 = (void (**)(char *))(v36 + 2);
    uint64_t v38 = v16;
    ++v36;
    while (1)
    {
      uint64_t v24 = (void (*)(char *, void))sub_1B8F57850();
      uint64_t v25 = v13;
      char v26 = v13;
      uint64_t v27 = AssociatedTypeWitness;
      (*v37)(v25);
      v24(v45, 0);
      uint64_t v28 = v44;
      v41(v26, v43);
      if (v28) {
        break;
      }
      uint64_t v44 = 0;
      (*v36)(v26, v27);
      sub_1B8F57B20();
      sub_1B8F57840();
      --v22;
      uint64_t v13 = v26;
      if (!v22)
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
        return v46;
      }
    }
    (*v36)(v26, v27);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v34);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(v32, v43, v31);
  }
  return result;
}

id sub_1B8F0EE64(uint64_t a1, void *a2)
{
  void (*v3)(void *__return_ptr, void *);
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void v12[3];
  uint64_t v13;
  uint64_t vars8;

  uint64_t v3 = *(void (**)(void *__return_ptr, void *))(a1 + 32);
  swift_retain();
  uint64_t v4 = a2;
  v3(v12, a2);
  swift_release();

  uint64_t v5 = v13;
  if (v13)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6, v6);
    uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = (void *)sub_1B8F57ED0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

id sub_1B8F0EFC4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_1B8F57080();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)MEMORY[0x1E4FBC8C8];
  if (a1)
  {
    uint64_t v19 = a2;
    id v18 = a1;
    sub_1B8F57920();
    sub_1B8F124BC(&qword_1E9EF43A8, MEMORY[0x1E4F27660]);
    sub_1B8F57990();
    if (v26)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      do
      {
        sub_1B8F122C0(&v25, v24);
        sub_1B8F12200((uint64_t)v24, (uint64_t)v23);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF43B0);
        if (swift_dynamicCast())
        {
          uint64_t v11 = v20;
          sub_1B8F12200((uint64_t)v20 + *(void *)((*v9 & *v20) + 0x58), (uint64_t)&v21);
        }
        else
        {
          long long v21 = 0u;
          long long v22 = 0u;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
        if (*((void *)&v22 + 1))
        {
          sub_1B8F122C0(&v21, v23);
          sub_1B8F122C0(v23, &v21);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_1B8F11134(0, v10[2] + 1, 1, v10);
          }
          unint64_t v13 = v10[2];
          unint64_t v12 = v10[3];
          if (v13 >= v12 >> 1) {
            uint64_t v10 = sub_1B8F11134((void *)(v12 > 1), v13 + 1, 1, v10);
          }
          v10[2] = v13 + 1;
          sub_1B8F122C0(&v21, &v10[4 * v13 + 4]);
        }
        else
        {
          sub_1B8F0BCE4((uint64_t)&v21);
        }
        sub_1B8F57990();
      }
      while (v26);
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

    a2 = v19;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4390);
  uint64_t v15 = (char *)objc_allocWithZone(v14);
  *(void *)&v15[*(void *)((*v9 & *(void *)v15) + 0x58)] = v10;
  v27.receiver = v15;
  v27.super_class = v14;
  id result = objc_msgSendSuper2(&v27, sel_init);
  a2[3] = v14;
  *a2 = result;
  return result;
}

uint64_t sub_1B8F0F2E8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    id v10 = a1;
    MEMORY[0x1F4188790](a1, a2);
    sub_1B8F1247C();
    sub_1B8F124BC(&qword_1E9EF43C8, (void (*)(uint64_t))sub_1B8F1247C);
    id v5 = a1;
    uint64_t v6 = (void *)sub_1B8F575C0();
  }
  else
  {
    uint64_t v6 = (void *)sub_1B8F57680();
  }
  sub_1B8F576C0();
  uint64_t v7 = type metadata accessor for Promise.Box();
  id v10 = v6;
  id v8 = sub_1B8F1141C((uint64_t)&v10);
  uint64_t result = swift_bridgeObjectRelease();
  a3[3] = v7;
  *a3 = v8;
  return result;
}

uint64_t sub_1B8F0F434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1B8F12200(a1, (uint64_t)&v8);
  type metadata accessor for Promise.Box();
  if ((swift_dynamicCast() & 1) == 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 1, 1, a2);
  }
  id v5 = v9;
  uint64_t v6 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(a3, (char *)v9 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v9) + 0x58), a2);

  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(a3, 0, 1, a2);
}

void sub_1B8F0F598()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = (id)sub_1B8F57030();
  objc_msgSend(v1, sel_abortWithError_, v2);
}

void sub_1B8F0F5F0(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)v2[2];
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  swift_retain();
  v9[4] = sub_1B8F12454;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_1B8F0F6F4;
  v9[3] = &block_descriptor_69;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(v5, sel_onComplete_, v8);
  _Block_release(v8);
}

void sub_1B8F0F6F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1B8F0F780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)v3[2];
  uint64_t v8 = *(void *)(*v3 + 80);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = a2;
  v9[4] = a3;
  swift_retain();
  v11[4] = sub_1B8F12454;
  v11[5] = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B8F0F6F4;
  v11[3] = &block_descriptor_72;
  id v10 = _Block_copy(v11);
  swift_release();
  objc_msgSend(v7, sel_onComplete_onQueue_, v10, a1);
  _Block_release(v10);
}

uint64_t *static Promise.join<A, B>(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  uint64_t v21 = 0;
  char v22 = 0;
  uint64_t v8 = swift_allocObject();
  sub_1B8F11558((uint64_t)&v21, v8 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF41B8);
  uint64_t inited = swift_initStackObject();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1B8F115C0;
  *(void *)(v10 + 24) = v8;
  id v11 = objc_allocWithZone(MEMORY[0x1E4F46FF8]);
  aBlock[4] = sub_1B8F11608;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F11030;
  aBlock[3] = &block_descriptor_81;
  unint64_t v12 = _Block_copy(aBlock);
  id v13 = objc_msgSend(v11, sel_initWithBlock_, v12);
  _Block_release(v12);
  swift_release();
  *(void *)(inited + 16) = v13;
  uint64_t v14 = *(void *)(v6 + 80);
  uint64_t v15 = *(void *)(v7 + 80);
  swift_getTupleTypeMetadata3();
  type metadata accessor for Promise();
  static Promise.join<A, B, C>(_:_:_:)(a1, a2, (uint64_t *)inited);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v14;
  v17[3] = v15;
  v17[4] = sub_1B8F11620;
  v17[5] = v16;
  id v18 = sub_1B8F0D86C((uint64_t)sub_1B8F116C0, (uint64_t)v17, *(void *)(v3 + 80));
  swift_release();
  swift_release();
  swift_setDeallocating();

  return v18;
}

uint64_t *static Promise.join<A, B, C>(_:_:_:)(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9EF4DB0);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F591F0;
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = *(void *)(v3 + 80);
  v7[2] = v8;
  uint64_t v9 = *(void *)(v4 + 80);
  v7[3] = v9;
  uint64_t v10 = *(void *)(v5 + 80);
  v7[4] = v10;
  uint64_t v11 = MEMORY[0x1E4FBC840] + 8;
  unint64_t v12 = sub_1B8F0D86C((uint64_t)sub_1B8F116F0, (uint64_t)v7, MEMORY[0x1E4FBC840] + 8);
  swift_release();
  *(void *)(inited + 32) = v12;
  id v13 = (void *)swift_allocObject();
  v13[2] = v8;
  v13[3] = v9;
  v13[4] = v10;
  uint64_t v14 = sub_1B8F0D86C((uint64_t)sub_1B8F11770, (uint64_t)v13, v11);
  swift_release();
  *(void *)(inited + 40) = v14;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v8;
  v15[3] = v9;
  v15[4] = v10;
  uint64_t v16 = sub_1B8F0D86C((uint64_t)sub_1B8F117F0, (uint64_t)v15, v11);
  swift_release();
  *(void *)(inited + 48) = v16;
  sub_1B8F57650();
  sub_1B8F0E53C(inited);
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v8;
  v17[3] = v9;
  v17[4] = v10;
  id v18 = sub_1B8F0D86C((uint64_t)sub_1B8F11870, (uint64_t)v17, *(void *)(v20 + 80));
  swift_release();
  swift_release();
  return v18;
}

uint64_t sub_1B8F0FD40@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1 + *(int *)(swift_getTupleTypeMetadata3() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1, v6);
}

uint64_t sub_1B8F0FDF8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_getTupleTypeMetadata3();
  if (!*(void *)(v1 + 16))
  {
    __break(1u);
    goto LABEL_6;
  }
  sub_1B8F12200(v1 + 32, (uint64_t)v5);
  uint64_t result = swift_dynamicCast();
  if (*(void *)(v1 + 16) < 2uLL)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_1B8F12200(v1 + 64, (uint64_t)v4);
  uint64_t result = swift_dynamicCast();
  if (*(void *)(v1 + 16) >= 3uLL)
  {
    sub_1B8F12200(v1 + 96, (uint64_t)&v3);
    return swift_dynamicCast();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Promise.deinit()
{
  return v0;
}

uint64_t Promise.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t Promise.UnexpectedType.expectedType.getter()
{
  return *(void *)v0;
}

uint64_t Promise.UnexpectedType.actualType.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t Promise.get()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return MEMORY[0x1F4188298](sub_1B8F0FFD4, 0, 0);
}

uint64_t sub_1B8F0FFD4()
{
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9EF41C8 + dword_1E9EF41C8);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_1B8F100A0;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  return v5(v2, 0, 0, (uint64_t)sub_1B8F11890, v3);
}

uint64_t sub_1B8F100A0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8F101D4, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B8F101D4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B8F101EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 80);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  sub_1B8F0F5F0((uint64_t)sub_1B8F121A0, v4);
  return swift_release();
}

uint64_t sub_1B8F10278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    uint64_t v6 = sub_1B8F576E0();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  return MEMORY[0x1F4188298](sub_1B8F1030C, v6, v8);
}

uint64_t sub_1B8F1030C()
{
  uint64_t v1 = (void (*)(uint64_t))v0[11];
  uint64_t v2 = v0[10];
  v0[2] = v0;
  v0[7] = v2;
  v0[3] = sub_1B8F103B4;
  uint64_t v3 = swift_continuation_init();
  v1(v3);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1B8F103B4()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48)) {
    swift_willThrow();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

uint64_t Promise.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = *(void *)(v2 + 80);
  v5[3] = a1;
  v5[4] = a2;
  uint64_t v6 = swift_allocObject();
  Promise.init(startBlock:)((uint64_t)sub_1B8F118D0, (uint64_t)v5);
  return v6;
}

uint64_t sub_1B8F10540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v10 - 8, v11);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B8F57740();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = a5;
  v15[5] = a1;
  v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_retain();
  swift_retain();
  sub_1B8F07C44((uint64_t)v13, (uint64_t)&unk_1E9EF4378, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_1B8F10670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6)
{
  v6[2] = a4;
  v6[3] = a5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v8 = sub_1B8F581B0();
  v6[4] = v8;
  v6[5] = *(void *)(v8 - 8);
  v6[6] = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  v6[7] = v9;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)a6 + *a6);
  uint64_t v10 = (void *)swift_task_alloc();
  v6[8] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_1B8F107E4;
  return v12(v9);
}

uint64_t sub_1B8F107E4()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F109B0;
  }
  else {
    uint64_t v2 = sub_1B8F108F8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F108F8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = (void (*)(uint64_t))v0[2];
  swift_storeEnumTagMultiPayload();
  v4(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_1B8F109B0()
{
  uint64_t v1 = (void *)v0[9];
  uint64_t v3 = v0[5];
  uint64_t v2 = (void *)v0[6];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void (*)(void *))v0[2];
  *uint64_t v2 = v1;
  swift_storeEnumTagMultiPayload();
  id v6 = v1;
  v5(v2);

  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t Promise.then<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F10D44(a1, a2, a3, (uint64_t)&unk_1F12BF5E0, (uint64_t)sub_1B8F11914, (uint64_t (*)(uint64_t, void *, uint64_t))sub_1B8F0DBBC);
}

uint64_t sub_1B8F10AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a2;
  uint64_t v9 = *(void *)(a4 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](a1, a2);
  type metadata accessor for Promise();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a4);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (char *)swift_allocObject();
  *((void *)v12 + 2) = a4;
  *((void *)v12 + 3) = a5;
  *((void *)v12 + 4) = v15;
  *((void *)v12 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v12[v11], (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  swift_retain();
  return Promise.__allocating_init(_:)((uint64_t)&unk_1E9EF4368, (uint64_t)v12);
}

uint64_t sub_1B8F10C24(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_1B8F08F7C;
  return v9(a1, a4);
}

uint64_t Promise.catch<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F10D44(a1, a2, a3, (uint64_t)&unk_1F12BF608, (uint64_t)sub_1B8F11934, (uint64_t (*)(uint64_t, void *, uint64_t))sub_1B8F0E214);
}

uint64_t sub_1B8F10D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, void *, uint64_t))
{
  uint64_t v12 = *v6;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v12 + 80);
  v13[3] = a3;
  v13[4] = a1;
  v13[5] = a2;
  swift_retain();
  uint64_t v14 = a6(a5, v13, a3);
  swift_release();
  return v14;
}

uint64_t sub_1B8F10DEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for Promise();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  void v10[6] = a1;
  swift_retain();
  id v11 = a1;
  return Promise.__allocating_init(_:)((uint64_t)&unk_1E9EF4358, (uint64_t)v10);
}

uint64_t sub_1B8F10EA0(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_1B8F09BDC;
  return v9(a1, a4);
}

id sub_1B8F10F8C(uint64_t a1, uint64_t a2)
{
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_1B8F11030;
  v6[3] = &block_descriptor_168;
  uint64_t v3 = _Block_copy(v6);
  id v4 = objc_msgSend(v2, sel_initWithBlock_, v3);
  _Block_release(v3);
  swift_release();
  return v4;
}

uint64_t sub_1B8F11030(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(void, uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1B8F12400, v4);
  swift_release();
  return swift_release();
}

void sub_1B8F110C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1B8F57030();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void *sub_1B8F11134(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF43B8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B8F122D0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1B8F11244(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BF0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1B8F12570(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id sub_1B8F11368(uint64_t a1)
{
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1)
                                                                          + 0x50)
                                                              - 8)
                                                  + 16))(&v1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1) + 0x58)], a1, *(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1) + 0x50));
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for Promise.Box();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_1B8F1141C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for Promise.Box());
  return sub_1B8F11368(a1);
}

void sub_1B8F11458()
{
}

uint64_t sub_1B8F11488()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_1B8F114B0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_1B8F114D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B8F0EA00(a1, a2);
}

uint64_t sub_1B8F114F8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F11508@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1B8F0F2E8(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_1B8F11510()
{
  sub_1B8F1154C(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));
  return MEMORY[0x1F4186498](v0, 25, 7);
}

void sub_1B8F1154C(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_1B8F11558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF41B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F115C0(uint64_t (*a1)(uint64_t *))
{
  char v2 = *(unsigned char *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = v2;
  return a1(&v4);
}

uint64_t sub_1B8F11608(uint64_t a1, uint64_t a2)
{
  return sub_1B8F0CABC(a1, a2, *(void (**)(void (*)(uint64_t), uint64_t))(v2 + 16));
}

uint64_t sub_1B8F11610()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F11620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(v4 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a3);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  return v10(a2, a4, v9);
}

uint64_t sub_1B8F116C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B8F0FD40(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 32), a2);
}

uint64_t sub_1B8F116E0()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F116F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_1B8F11760()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F11770@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 24);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_1B8F117E0()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F117F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 32);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_1B8F11860()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F11870(uint64_t *a1)
{
  return sub_1B8F0FDF8(a1);
}

uint64_t sub_1B8F11890(uint64_t a1)
{
  return sub_1B8F101EC(a1, v1);
}

uint64_t sub_1B8F11898()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F118D0(uint64_t a1, uint64_t a2)
{
  return sub_1B8F10540(a1, a2, v2[3], v2[4], v2[2]);
}

uint64_t sub_1B8F118DC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B8F11914(uint64_t a1)
{
  return sub_1B8F10AB4(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1B8F11934(void *a1)
{
  return sub_1B8F10DEC(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1B8F11954()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Promise(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Promise);
}

uint64_t dispatch thunk of Promise.__allocating_init(startBlock:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of Promise.then<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Promise.then<A>(on:transform:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of Promise.catch<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of Promise.catch<A>(on:transform:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of Promise.abort(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of Promise.onComplete(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of Promise.onComplete(queue:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t sub_1B8F11B54()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B8F11BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 16);
}

uint64_t sub_1B8F11BF0(uint64_t *a1, int a2)
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

uint64_t sub_1B8F11C38(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for Promise.UnexpectedType()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F11C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 8);
}

uint64_t type metadata accessor for Promise.UnderlyingValueMissing()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Promise.UnderlyingErrorMissing()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F11CC4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B8F11D04(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 48);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_1B8F09BDC;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  uint64_t v7 = (void *)swift_task_alloc();
  v6[2] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1B8F09BDC;
  return v9(a1, v5);
}

uint64_t sub_1B8F11E38()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B8F11EFC(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(int **)(v1 + 32);
  uint64_t v6 = v1
     + ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1B8F08F7C;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[2] = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_1B8F08F7C;
  return v10(a1, v6);
}

uint64_t sub_1B8F1206C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_1B8F120B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = (int *)v1[7];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1B8F08F7C;
  return sub_1B8F10670(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1B8F12190()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F121A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
  return sub_1B8F3C1B8(a1, v3, v4, v5);
}

uint64_t sub_1B8F12200(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_1B8F122C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B8F122D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

uint64_t sub_1B8F123C8()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B8F12400(uint64_t a1, uint64_t a2)
{
  sub_1B8F110C4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1B8F12408()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1B8F12440(uint64_t a1)
{
  sub_1B8F0CBF8(*(void **)a1, *(unsigned char *)(a1 + 8), *(void (**)(id, void *))(v1 + 16));
}

uint64_t sub_1B8F12454(char *a1, void *a2)
{
  return sub_1B8F0D6C4(a1, a2, *(void (**)(void *))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 16));
}

uint64_t sub_1B8F12460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1B8F0F434(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_1B8F1247C()
{
  unint64_t result = qword_1E9EF4D60;
  if (!qword_1E9EF4D60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9EF4D60);
  }
  return result;
}

uint64_t sub_1B8F124BC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1B8F12504(void *a1@<X0>, void *a2@<X8>)
{
  sub_1B8F0D5BC(a1, *(uint64_t (**)(void *))(v2 + 32), a2);
}

void sub_1B8F12510(void *a1@<X0>, void *a2@<X8>)
{
  sub_1B8F0D424(a1, *(void (**)(void *))(v2 + 32), *(void *)(v2 + 24), a2);
}

void sub_1B8F1251C(void *a1@<X0>, void *a2@<X8>)
{
  sub_1B8F0D2FC(a1, *(uint64_t (**)(char *))(v2 + 32), a2);
}

void sub_1B8F12528(void *a1@<X0>, void *a2@<X8>)
{
  sub_1B8F0D208(a1, v2[4], v2[5], v2[3], a2);
}

void sub_1B8F12534(uint64_t a1)
{
  sub_1B8F0CCB0(a1, *(void (**)(id, id))(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 16));
}

uint64_t sub_1B8F12540()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F12550@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B8F0C80C(a1, a2);
}

uint64_t sub_1B8F12558()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F12568@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B8F0C950(a1, a2);
}

uint64_t sub_1B8F12570(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF3BF8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

uint64_t ThrowingOrderedTaskGroup.addTask(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v5 = v4;
  uint64_t v10 = *v5;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  uint64_t v12 = a4[3];
  v11[4] = a4[2];
  v11[5] = v12;
  void v11[6] = a4[4];
  v11[7] = v10;
  v11[8] = a2;
  v11[9] = a3;
  swift_retain();
  swift_getTupleTypeMetadata2();
  sub_1B8F57790();
  uint64_t result = sub_1B8F12B98(a1, (uint64_t)&unk_1E9EF43D8, (uint64_t)v11);
  if (__OFADD__(*v5, 1)) {
    __break(1u);
  }
  else {
    ++*v5;
  }
  return result;
}

uint64_t sub_1B8F1285C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return MEMORY[0x1F4188298](sub_1B8F12888, 0, 0);
}

uint64_t sub_1B8F12888()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = (int *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v4 = (char *)v3 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  *uint64_t v3 = v2;
  uint64_t v7 = (uint64_t (*)(char *))((char *)v1 + *v1);
  unint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  void *v5 = v0;
  v5[1] = sub_1B8F1299C;
  return v7(v4);
}

uint64_t sub_1B8F1299C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B8F12A90()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1B8F12AD0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 64);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_1B8F08F7C;
  *(void *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 32) = v7;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v5;
  return MEMORY[0x1F4188298](sub_1B8F12888, 0, 0);
}

uint64_t sub_1B8F12B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F0B1B0(a1, (uint64_t)v10);
  uint64_t v11 = sub_1B8F57740();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1B8F09070((uint64_t)v10);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_1B8F576E0();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8F57730();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    uint64_t v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t ThrowingOrderedTaskGroup.results.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = v3;
  return MEMORY[0x1F4188298](sub_1B8F12D90, 0, 0);
}

uint64_t sub_1B8F12D90()
{
  uint64_t v1 = (void *)v0[7];
  v0[3] = v0[8];
  uint64_t v2 = v1[2];
  v0[9] = v2;
  swift_getTupleTypeMetadata2();
  v0[4] = sub_1B8F573C0();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  v3[2] = v2;
  uint64_t v4 = v1[3];
  v0[11] = v4;
  v3[3] = v4;
  uint64_t v5 = v1[4];
  v0[12] = v5;
  v3[4] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[13] = v6;
  uint64_t v7 = sub_1B8F57790();
  uint64_t v8 = sub_1B8F576C0();
  v0[14] = v8;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v6 = v0;
  v6[1] = sub_1B8F12F28;
  return MEMORY[0x1F4187E88](v0 + 2, v0 + 4, &unk_1E9EF43F0, v3, v7, v8, WitnessTable);
}

uint64_t sub_1B8F12F28()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1B8F13200;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1B8F13044;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F13044()
{
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v4 = v0[9];
  v0[5] = v0[2];
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v4;
  v5[3] = v3;
  v5[4] = v2;
  swift_getWitnessTable();
  uint64_t v6 = sub_1B8F575D0();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v0[6] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *uint64_t v7 = v4;
  v7[1] = v3;
  v7[2] = v2;
  uint64_t KeyPath = swift_getKeyPath();
  swift_task_dealloc();
  uint64_t v9 = (void *)swift_task_alloc();
  v9[2] = v3;
  v9[3] = v2;
  v9[4] = KeyPath;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v12 = sub_1B8F0EA64((void (*)(char *, char *))sub_1B8F136EC, (uint64_t)v9, v1, v4, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v11);
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v12);
}

uint64_t sub_1B8F13200()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F13264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = swift_getTupleTypeMetadata2();
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B8F13320, 0, 0);
}

uint64_t sub_1B8F13320()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = (char *)v0[3];
  uint64_t v5 = *(int *)(v3 + 48);
  uint64_t v6 = v0[7] + v5;
  uint64_t v7 = *(void *)v4;
  uint64_t v8 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v6, &v4[v5], v2);
  uint64_t v9 = (char *)v1 + *(int *)(v3 + 48);
  void *v1 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v9, v6, v2);
  sub_1B8F576C0();
  sub_1B8F576A0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1B8F13458(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1B8F09BDC;
  return sub_1B8F13264(a1, a2, v6);
}

BOOL sub_1B8F13518(void *a1, void *a2)
{
  return *a1 < *a2;
}

uint64_t sub_1B8F1352C(uint64_t a1, void *a2)
{
  uint64_t v2 = (uint64_t *)(*a2 + *MEMORY[0x1E4FBC5F0]);
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = (char *)MEMORY[0x1F4188790](v5, v8);
  uint64_t v11 = *(int *)(v3 + 48);
  uint64_t v12 = (char *)&v19 + v11 - v10;
  uint64_t v13 = *(void *)v9;
  *(uint64_t *)((char *)&v19 - v10) = *(void *)v9;
  uint64_t v15 = *(void *)(v14 + 8);
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v12, &v9[v11], v15);
  uint64_t v17 = (char *)v7 + *(int *)(v3 + 48);
  *uint64_t v7 = v13;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v17, v12, v15);
  swift_getAtKeyPath();
  return (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_1B8F136EC(uint64_t a1)
{
  return sub_1B8F1352C(a1, *(void **)(v1 + 32));
}

uint64_t withThrowingOrderedTaskGroup<A, B>(of:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  void v6[6] = a6;
  v6[3] = a3;
  v6[4] = a4;
  v6[2] = a1;
  return MEMORY[0x1F4188298](sub_1B8F13738, 0, 0);
}

uint64_t sub_1B8F13738()
{
  long long v7 = *(_OWORD *)(v0 + 40);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = v7;
  *(_OWORD *)(v2 + 32) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1B8F13854;
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x1F4188080](v5, TupleTypeMetadata2);
}

uint64_t sub_1B8F13854()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8F13990, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B8F13990()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F139F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a3;
  v4[7] = a4;
  v4[4] = a1;
  v4[5] = a2;
  return MEMORY[0x1F4188298](sub_1B8F13A18, 0, 0);
}

uint64_t sub_1B8F13A18()
{
  uint64_t v1 = *(int **)(v0 + 48);
  uint64_t v2 = **(void **)(v0 + 40);
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)v1 + *v1);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1B8F13B04;
  uint64_t v4 = *(void *)(v0 + 32);
  return v6(v4, v0 + 16);
}

uint64_t sub_1B8F13B04()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F13C30;
  }
  else {
    uint64_t v2 = sub_1B8F13C18;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F13C18()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B8F13C30()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B8F13C48(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v2 + 32);
  *(void *)(v3 + 16) = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_1B8F09BDC;
  *(_OWORD *)(v6 + 48) = v7;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  return MEMORY[0x1F4188298](sub_1B8F13A18, 0, 0);
}

uint64_t sub_1B8F13D08(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B8F13D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

uint64_t sub_1B8F13D18(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_1B8F13D5C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ThrowingOrderedTaskGroup()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Reference.wrappedValue.getter()
{
  return (*v0)();
}

uint64_t sub_1B8F13DD8()
{
  return Reference.wrappedValue.getter();
}

uint64_t sub_1B8F13E0C()
{
  return sub_1B8F14ED8();
}

uint64_t Reference.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  sub_1B8F14ED8();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8);
  return v4(a1);
}

void (*Reference.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  void *v5 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[1] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[2] = malloc(v8);
  v5[3] = malloc(v8);
  uint64_t v9 = *(void (**)(void))v2;
  *((_OWORD *)v5 + 2) = *(_OWORD *)(v2 + 16);
  v9();
  return sub_1B8F13FA4;
}

void sub_1B8F13FA4(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  int v3 = (void (*)(void *))(*a1)[4];
  uint64_t v4 = (void *)(*a1)[2];
  uint64_t v5 = (void *)(*a1)[3];
  uint64_t v6 = **a1;
  uint64_t v7 = (*a1)[1];
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))((*a1)[2], v5, v6);
    v3(v4);
    size_t v8 = *(void (**)(void *, uint64_t))(v7 + 8);
    v8(v4, v6);
    v8(v5, v6);
  }
  else
  {
    v3((void *)(*a1)[3]);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v5, v6);
  }
  free(v5);
  free(v4);
  free(v2);
}

uint64_t Reference.init(getValue:setValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t Reference.projectedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *(void *)a1 = *(void *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(void *)(a1 + 24) = v2;
  swift_retain();
  return swift_retain();
}

uint64_t ReferenceBox.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t ReferenceBox.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t)v1 + *(void *)(*v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 40))(v4, a1);
  return swift_endAccess();
}

uint64_t (*ReferenceBox.wrappedValue.modify())()
{
  return j__swift_endAccess;
}

uint64_t ReferenceBox.__allocating_init(wrappedValue:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 88), a1);
  return v2;
}

uint64_t ReferenceBox.init(wrappedValue:)(uint64_t a1)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 32))(v1 + *(void *)(*(void *)v1 + 88), a1);
  return v1;
}

uint64_t ReferenceBox.projectedValue.getter@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_1B8F14F00;
  a1[1] = v1;
  a1[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_1B8F14F08;
  a1[3] = v1;
  return swift_retain_n();
}

uint64_t sub_1B8F143F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t)a1 + *(void *)(*a1 + 88);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 16))(a2, v4);
}

uint64_t sub_1B8F144A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (uint64_t)a2 + *(void *)(*a2 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 24))(v4, a1);
  return swift_endAccess();
}

uint64_t ReferenceBox.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return v0;
}

uint64_t ReferenceBox.__deallocating_deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t static ReferenceBox<A>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F14B30(a1, a2, a3, MEMORY[0x1E4FBB098]);
}

uint64_t sub_1B8F14684(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return static ReferenceBox<A>.== infix(_:_:)(*a1, *a2, *(void *)(a4 - 8));
}

uint64_t ReferenceBox<A>.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)v2 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v8 = v2 + *(void *)(v7 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  sub_1B8F57420();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1B8F147E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ReferenceBox<A>.encode(to:)(a1, *(void *)(a3 - 8));
}

uint64_t ReferenceBox<A>.init(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_1B8F14F10(v4, (uint64_t)v9);
  sub_1B8F57800();
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(a1);
  if (!v2) {
    return ReferenceBox.__allocating_init(wrappedValue:)((uint64_t)v6);
  }
  return result;
}

uint64_t sub_1B8F148D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result = ReferenceBox<A>.init(from:)(a1, *(void *)(a2 - 8));
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t ReferenceBox<A>.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)v2 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v6 = (char *)&v10 - v5;
  uint64_t v8 = v2 + *(void *)(v7 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  sub_1B8F57440();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ReferenceBox<A>.hashValue.getter(uint64_t a1)
{
  sub_1B8F58180();
  ReferenceBox<A>.hash(into:)((uint64_t)v3, a1);
  return sub_1B8F581A0();
}

uint64_t sub_1B8F14A80(uint64_t a1, uint64_t a2)
{
  return ReferenceBox<A>.hashValue.getter(*(void *)(a2 - 8));
}

uint64_t sub_1B8F14AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ReferenceBox<A>.hash(into:)(a1, *(void *)(a3 - 8));
}

uint64_t sub_1B8F14AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 - 8);
  sub_1B8F58180();
  ReferenceBox<A>.hash(into:)((uint64_t)v5, v3);
  return sub_1B8F581A0();
}

uint64_t static ReferenceBox<A>.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F14B30(a1, a2, a3, MEMORY[0x1E4FBAFC8]);
}

uint64_t sub_1B8F14B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(unsigned char *, unsigned char *, uint64_t, uint64_t))
{
  uint64_t v8 = *(void *)(v4 + 80);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x1F4188790](v10, v13);
  uint64_t v16 = &v22[-v15];
  uint64_t v17 = v14 + *(void *)(*(void *)v14 + 88);
  swift_beginAccess();
  id v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16);
  v18(v16, v17, v8);
  uint64_t v19 = a2 + *(void *)(*(void *)a2 + 88);
  swift_beginAccess();
  v18(v12, v19, v8);
  LOBYTE(a4) = a4(v16, v12, v8, a3);
  uint64_t v20 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
  v20(v12, v8);
  v20(v16, v8);
  return a4 & 1;
}

uint64_t sub_1B8F14CEC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return static ReferenceBox<A>.< infix(_:_:)(*a1, *a2, *(void *)(a4 - 8));
}

uint64_t sub_1B8F14CFC()
{
  return sub_1B8F574A0();
}

uint64_t sub_1B8F14D04()
{
  return sub_1B8F57490();
}

uint64_t sub_1B8F14D0C()
{
  return sub_1B8F57480();
}

uint64_t ReferenceBox<A>.description.getter(uint64_t a1)
{
  return sub_1B8F14D6C(a1, MEMORY[0x1E4FBBDF8]);
}

uint64_t sub_1B8F14D2C(uint64_t a1, uint64_t a2)
{
  return ReferenceBox<A>.description.getter(*(void *)(a2 - 8));
}

uint64_t ReferenceBox<A>.debugDescription.getter(uint64_t a1)
{
  return sub_1B8F14D6C(a1, MEMORY[0x1E4FBBF30]);
}

uint64_t sub_1B8F14D6C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(*(void *)v2 + 80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v10 = v2 + *(void *)(v9 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v10, v5);
  uint64_t v11 = a2(v5, a1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

uint64_t sub_1B8F14EB0(uint64_t a1, uint64_t a2)
{
  return ReferenceBox<A>.debugDescription.getter(*(void *)(a2 - 8));
}

uint64_t sub_1B8F14ED8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B8F14F00@<X0>(uint64_t a1@<X8>)
{
  return sub_1B8F143F8(v1, a1);
}

uint64_t sub_1B8F14F08(uint64_t a1)
{
  return sub_1B8F144A0(a1, v1);
}

uint64_t sub_1B8F14F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B8F14F74()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F14FC4()
{
  return 8;
}

void *sub_1B8F14FD0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DependencyRegistry.Entry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1B8F15010()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F1504C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1B8F15098(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *sub_1B8F15104(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_1B8F1514C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1B8F15194(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Reference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for ReferenceBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ReferenceBox(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ReferenceBox);
}

uint64_t dispatch thunk of ReferenceBox.__allocating_init(wrappedValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t Result<>.ContainBothSuccessAndFailure.success.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

void *Result<>.ContainBothSuccessAndFailure.failure.getter(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + *(int *)(a1 + 28));
  id v3 = v2;
  return v2;
}

uint64_t sub_1B8F15298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t result = type metadata accessor for Result<>.ContainBothSuccessAndFailure();
  *(void *)(a4 + *(int *)(result + 28)) = a2;
  return result;
}

uint64_t Result<>.foundation_tryMap<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v6[2] = *(void *)(a3 + 16);
  v6[3] = a4;
  v6[4] = a1;
  v6[5] = a2;
  return sub_1B8F15588((void (*)(char *))sub_1B8F15350, (uint64_t)v6, a3, a5);
}

uint64_t sub_1B8F15350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v7 = *(void *)(v2 + 16);
  long long v8 = *(_OWORD *)(v2 + 24);
  uint64_t v9 = v4;
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
  return sub_1B8F153D4((void (*)(unsigned char *))sub_1B8F16238, (uint64_t)v6, a2);
}

uint64_t sub_1B8F153D4@<X0>(void (*a1)(unsigned char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_1B8F581B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = &v13[-v10];
  a1(v6);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v8 + 32))(a3, v11, v7);
}

uint64_t sub_1B8F15588@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v12);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v15 + 16))(v14, v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(uint64_t, char *, void))(*(void *)(*(void *)(a3 + 24) - 8) + 32))(a4, v14, *(void *)(a3 + 24));
    sub_1B8F581B0();
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v14, v7);
    a1(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
}

id static Result<>.foundation_from(_:_:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B8F57980();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1E9EF4510);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v14 = MEMORY[0x1F4188790](TupleTypeMetadata2 - 8, v13);
  uint64_t v16 = (char *)&v24 - v15;
  uint64_t v17 = *(int *)(v14 + 56);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))((char *)&v24 - v15, a1, v11);
  *(void *)&v16[v17] = a2;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v16, 1, a3) == 1)
  {
    if (a2)
    {
      *a4 = (uint64_t)a2;
    }
    else
    {
      type metadata accessor for Result<>.ShouldHaveEitherSuccessOrFailure();
      swift_getWitnessTable();
      *a4 = swift_allocError();
    }
  }
  else
  {
    if (!a2)
    {
      (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 32))(a4, v16, a3);
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
      sub_1B8F581B0();
      goto LABEL_9;
    }
    uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v10, v16, a3);
    uint64_t v19 = type metadata accessor for Result<>.ContainBothSuccessAndFailure();
    swift_getWitnessTable();
    uint64_t v20 = swift_allocError();
    char v22 = v21;
    v18(v21, v10, a3);
    *(void *)&v22[*(int *)(v19 + 28)] = a2;
    *a4 = v20;
  }
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  sub_1B8F581B0();
LABEL_9:
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t type metadata accessor for Result<>.ShouldHaveEitherSuccessOrFailure()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Result<>.ContainBothSuccessAndFailure()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F15ABC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B8F15B54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = *(void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    id v11 = v10;
    *(void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = v10;
  }
  return v4;
}

void sub_1B8F15C54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = *(void **)((a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t sub_1B8F15CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  id v9 = v8;
  *int v7 = v8;
  return a1;
}

uint64_t sub_1B8F15D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  id v9 = v8;
  uint64_t v10 = *v7;
  *int v7 = v8;

  return a1;
}

uint64_t sub_1B8F15DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1B8F15E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = *v7;
  *int v7 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_1B8F15ED4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1B8F16020);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1B8F16034(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x1B8F16210);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v19 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t sub_1B8F16238(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 32))(*(void *)(v1 + 48));
  if (v2) {
    *a1 = v2;
  }
  return result;
}

uint64_t static Promise<A>.delay(interval:queue:)(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1B8F572E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4, v7);
  unsigned int v8 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, v8, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF41B8);
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1B8F167FC;
  *(void *)(v12 + 24) = v10;
  id v13 = objc_allocWithZone(MEMORY[0x1E4F46FF8]);
  aBlock[4] = sub_1B8F11608;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F11030;
  aBlock[3] = &block_descriptor_1;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = a2;
  id v16 = objc_msgSend(v13, sel_initWithBlock_, v14);
  _Block_release(v14);
  swift_release();
  *(void *)(v11 + 16) = v16;
  return v11;
}

uint64_t sub_1B8F16480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4;
  uint64_t v32 = a3;
  uint64_t v6 = sub_1B8F57300();
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v7);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B8F57350();
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v30 = v10;
  MEMORY[0x1F4188790](v10, v11);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1B8F57380();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v14, v16);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v20);
  char v22 = (char *)&v28 - v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a1;
  *(void *)(v23 + 24) = a2;
  swift_retain();
  sub_1B8F57370();
  MEMORY[0x1BA9CF170](v19, v28);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v15 + 8);
  v24(v19, v14);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_1B8F173BC;
  *(void *)(v25 + 24) = v23;
  aBlock[4] = sub_1B8F173FC;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F1E254;
  aBlock[3] = &block_descriptor_43;
  uint64_t v26 = _Block_copy(aBlock);
  sub_1B8F57330();
  uint64_t v33 = MEMORY[0x1E4FBC860];
  sub_1B8F1742C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4030);
  sub_1B8F0991C();
  sub_1B8F57A00();
  MEMORY[0x1BA9CF6A0](v22, v13, v9, v26);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
  v24(v22, v14);
  return swift_release();
}

uint64_t sub_1B8F16800()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t static Promise<A>.delay(interval:)(uint64_t a1)
{
  uint64_t v2 = sub_1B8F572E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x1F4188790](v2, v5);
  uint64_t v6 = sub_1B8F57310();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F17144();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E4FBCB48], v6);
  uint64_t v11 = (void *)sub_1B8F57910();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v13 + v12, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF41B8);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1B8F167FC;
  *(void *)(v15 + 24) = v13;
  id v16 = objc_allocWithZone(MEMORY[0x1E4F46FF8]);
  aBlock[4] = sub_1B8F174B0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F11030;
  aBlock[3] = &block_descriptor_14;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = v11;
  id v19 = objc_msgSend(v16, sel_initWithBlock_, v17);
  _Block_release(v17);

  swift_release();
  *(void *)(v14 + 16) = v19;
  return v14;
}

uint64_t *Promise.timeout(after:queue:)(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t)v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_1B8F572E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7, v10);
  uint64_t v11 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v12, v11, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF41B8);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1B8F167FC;
  *(void *)(v15 + 24) = v13;
  id v16 = objc_allocWithZone(MEMORY[0x1E4F46FF8]);
  aBlock[4] = sub_1B8F174B0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F11030;
  aBlock[3] = &block_descriptor_25;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = a2;
  id v19 = objc_msgSend(v16, sel_initWithBlock_, v17);
  _Block_release(v17);
  swift_release();
  *(void *)(v14 + 16) = v19;
  uint64_t v20 = *(void *)(v6 + 80);
  type metadata accessor for Promise();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9EF4DB0);
  swift_allocObject();
  uint64_t v21 = sub_1B8F57660();
  uint64_t v23 = v22;
  uint64_t *v22 = v3;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v20;
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = v20;
  v25[3] = sub_1B8F172EC;
  v25[4] = v24;
  swift_retain();
  uint64_t v26 = sub_1B8F0DBBC((uint64_t)sub_1B8F17340, (uint64_t)v25, v20);
  swift_release();
  v23[1] = (uint64_t)v26;
  sub_1B8F576C0();
  static Promise.race(_:)(v21);
  swift_bridgeObjectRelease();
  swift_retain();
  objc_super v27 = sub_1B8F0E214((uint64_t)sub_1B8F17368, v3, v20);
  swift_release();
  swift_release();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v20;
  *(void *)(v28 + 24) = v14;
  swift_retain();
  sub_1B8F0F5F0((uint64_t)sub_1B8F17384, v28);
  swift_release();
  swift_release();
  return v27;
}

uint64_t sub_1B8F16ECC()
{
  return swift_willThrow();
}

id sub_1B8F16F38(void *a1)
{
  return a1;
}

void sub_1B8F16F74(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Promise.Aborted();
  swift_getWitnessTable();
  uint64_t v3 = (void *)swift_allocError();
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = (void *)sub_1B8F57030();
  objc_msgSend(v4, sel_abortWithError_, v5);
}

uint64_t *Promise.timeout(after:)(uint64_t a1)
{
  uint64_t v2 = sub_1B8F57310();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F17144();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4FBCB48], v2);
  uint64_t v7 = (void *)sub_1B8F57910();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v8 = Promise.timeout(after:queue:)(a1, v7);

  return v8;
}

unint64_t sub_1B8F17144()
{
  unint64_t result = qword_1EB9C32D8;
  if (!qword_1EB9C32D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB9C32D8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_1B8F572E0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B8F17258(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_1B8F572E0() - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_1B8F16480(a1, a2, v6, v7);
}

uint64_t sub_1B8F172DC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F172EC()
{
  return sub_1B8F16ECC();
}

uint64_t sub_1B8F17308()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F17340()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

id sub_1B8F17368(void *a1)
{
  return sub_1B8F16F38(a1);
}

void sub_1B8F17384(uint64_t a1)
{
  sub_1B8F16F74(a1, *(void *)(v1 + 24));
}

uint64_t type metadata accessor for Promise.TimedOut()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Promise.Aborted()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F173BC(uint64_t a1, char a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_1B8F173FC()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(0, 0);
}

unint64_t sub_1B8F1742C()
{
  unint64_t result = qword_1E9EF4028;
  if (!qword_1E9EF4028)
  {
    sub_1B8F57300();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4028);
  }
  return result;
}

uint64_t sub_1B8F174B4()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t type metadata accessor for UnfairLock()
{
  return self;
}

uint64_t dispatch thunk of BroadcastTransport.broadcast(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t OrderedTaskGroup.addTask(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = *(void *)(a4 + 16);
  v8[3] = a2;
  v8[4] = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v9 = (void *)type metadata accessor for ThrowingOrderedTaskGroup();
  ThrowingOrderedTaskGroup.addTask(priority:operation:)(a1, (uint64_t)&unk_1E9EF4720, (uint64_t)v8, v9);
  return swift_release();
}

uint64_t sub_1B8F175D4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F1760C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1B8F09BDC;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9EF4718 + dword_1E9EF4718);
  return v6(a1, v4);
}

uint64_t OrderedTaskGroup.results.getter()
{
  uint64_t v2 = v0[1];
  v1[2] = *v0;
  v1[3] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[4] = v3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v4 = type metadata accessor for ThrowingOrderedTaskGroup();
  *uint64_t v3 = v1;
  v3[1] = sub_1B8F177AC;
  return ThrowingOrderedTaskGroup.results.getter(v4);
}

uint64_t sub_1B8F177AC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x1F4188298](sub_1B8F178E8, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_1B8F178E8()
{
  return MEMORY[0x1F41867D8](*(void *)(v0 + 40), "AAAFoundationSwift/OrderedTaskGroup.swift", 41, 1, 33);
}

uint64_t withOrderedTaskGroup<A, B>(of:body:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x1F4188298](sub_1B8F1792C, 0, 0);
}

uint64_t sub_1B8F1792C()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  long long v2 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1B8F179F8;
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v7 = *(void *)(v0 + 24);
  return withThrowingOrderedTaskGroup<A, B>(of:body:)(v6, v7, (uint64_t)&unk_1E9EF4740, v1, v4, v5);
}

uint64_t sub_1B8F179F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B8F17B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a3;
  v4[7] = a4;
  v4[4] = a1;
  v4[5] = a2;
  return MEMORY[0x1F4188298](sub_1B8F17B2C, 0, 0);
}

uint64_t sub_1B8F17B2C()
{
  uint64_t v1 = (uint64_t *)v0[5];
  long long v2 = (int *)v0[6];
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  v0[2] = v4;
  v0[3] = v3;
  uint64_t v8 = (int *)((char *)v2 + *v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  void *v5 = v0;
  v5[1] = sub_1B8F17C18;
  uint64_t v6 = v0[4];
  return ((uint64_t (*)(uint64_t, void *))v8)(v6, v0 + 2);
}

uint64_t sub_1B8F17C18()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_1B8F13C18, 0, 0);
}

uint64_t sub_1B8F17D14(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v2 + 32);
  *(void *)(v3 + 16) = v6;
  *(void *)uint64_t v6 = v3;
  *(void *)(v6 + 8) = sub_1B8F08F7C;
  *(_OWORD *)(v6 + 48) = v7;
  *(void *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = a2;
  return MEMORY[0x1F4188298](sub_1B8F17B2C, 0, 0);
}

uint64_t type metadata accessor for OrderedTaskGroup()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F17DEC()
{
  uint64_t v0 = sub_1B8F57C10();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B8F17E40(char a1)
{
  if (a1) {
    return 0x6572756C696166;
  }
  else {
    return 0x73736563637573;
  }
}

uint64_t sub_1B8F17E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1C8];
  return MEMORY[0x1F4185BB0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B8F17EE4(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DE0](a1, a2, WitnessTable, v5);
}

uint64_t sub_1B8F17F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B8F17FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DE8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B8F18030@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B8F17DEC();
  *a1 = result;
  return result;
}

uint64_t sub_1B8F1806C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B8F17E40(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B8F180A4()
{
  return sub_1B8F17E40(*v0);
}

uint64_t sub_1B8F180B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B8F17DEC();
  *a1 = result;
  return result;
}

uint64_t sub_1B8F180EC()
{
  return 0;
}

uint64_t sub_1B8F180F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B8F19D78();
  *a1 = result;
  return result;
}

uint64_t sub_1B8F1812C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1B8F18180(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t CodableResult.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B8F581B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t CodableResult.init(result:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1B8F581B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t CodableResult<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a4;
  uint64_t v31 = a3;
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v34 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v30 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v29 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B8F581B0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  uint64_t v15 = (char *)&v29 - v14;
  uint64_t v32 = v9;
  uint64_t v36 = v5;
  type metadata accessor for CodableResult.CodingKeys();
  swift_getWitnessTable();
  uint64_t v16 = sub_1B8F57CB0();
  uint64_t v38 = *(void *)(v16 - 8);
  uint64_t v39 = v16;
  MEMORY[0x1F4188790](v16, v17);
  id v19 = (char *)&v29 - v18;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F58210();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v37, v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = v34;
    uint64_t v20 = v35;
    uint64_t v22 = v36;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v34, v15, v36);
    char v41 = 1;
    uint64_t v23 = v39;
    sub_1B8F57CA0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v19, v23);
  }
  else
  {
    uint64_t v26 = v29;
    uint64_t v25 = v30;
    uint64_t v27 = v32;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v29, v15, v32);
    char v40 = 0;
    uint64_t v28 = v39;
    sub_1B8F57CA0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v19, v28);
  }
}

uint64_t type metadata accessor for CodableResult.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F186AC(void *a1, uint64_t a2, uint64_t a3)
{
  return CodableResult<>.encode(to:)(a1, a2, *(void *)(a3 - 8), *(void *)(a3 - 16));
}

uint64_t CodableResult<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v48 = a5;
  uint64_t v49 = a7;
  uint64_t v57 = a4;
  uint64_t v44 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  v47 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_1B8F57980();
  uint64_t v55 = *(void *)(v46 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v46, v12);
  v58 = (char *)&v42 - v14;
  uint64_t v54 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v13, v15);
  uint64_t v45 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CodableResult.CodingKeys();
  swift_getWitnessTable();
  uint64_t v17 = sub_1B8F57C70();
  uint64_t v52 = *(void *)(v17 - 8);
  uint64_t v53 = v17;
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)&v42 - v19;
  uint64_t v56 = a3;
  uint64_t v51 = a6;
  uint64_t v21 = type metadata accessor for CodableResult();
  uint64_t v50 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21, v22);
  uint64_t v24 = (char *)&v42 - v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v25 = v59;
  sub_1B8F581F0();
  if (v25)
  {
    uint64_t v31 = (uint64_t)a1;
  }
  else
  {
    uint64_t v27 = v54;
    uint64_t v26 = v55;
    uint64_t v42 = v24;
    uint64_t v43 = v21;
    v59 = a1;
    uint64_t v28 = v56;
    char v61 = 0;
    uint64_t v29 = v58;
    uint64_t v30 = v53;
    sub_1B8F57C40();
    int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48))(v29, 1, a2);
    if (v33 == 1)
    {
      (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v46);
      char v60 = 1;
      uint64_t v34 = v47;
      sub_1B8F57C60();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v30);
      uint64_t v35 = v42;
      (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v42, v34, v28);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v30);
      uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
      uint64_t v38 = v45;
      v37(v45, v29, a2);
      uint64_t v35 = v42;
      v37(v42, v38, a2);
    }
    uint64_t v36 = v49;
    uint64_t v39 = (uint64_t)v59;
    uint64_t v40 = v43;
    uint64_t v41 = v50;
    sub_1B8F581B0();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v36, v35, v40);
    uint64_t v31 = v39;
  }
  return __swift_destroy_boxed_opaque_existential_1(v31);
}

uint64_t type metadata accessor for CodableResult()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F18C10@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return CodableResult<>.init(from:)(a1, a2[2], a2[3], *(void *)(a3 - 8), *(void *)(a3 - 16), a2[4], a4);
}

uint64_t sub_1B8F18C3C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return static CodableResult<>.== infix(_:_:)(a1, a2, a3[2], a3[3], *(void *)(a4 - 8), *(void *)(a4 - 16), a3[4]);
}

uint64_t CodableResult<>.hash(into:)()
{
  sub_1B8F581B0();
  return sub_1B8F581C0();
}

uint64_t CodableResult<>.hashValue.getter()
{
  return sub_1B8F581A0();
}

uint64_t sub_1B8F18D24()
{
  return CodableResult<>.hashValue.getter();
}

uint64_t sub_1B8F18D30()
{
  return CodableResult<>.hash(into:)();
}

uint64_t sub_1B8F18D3C()
{
  return sub_1B8F581A0();
}

uint64_t sub_1B8F18D94()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F18DE0()
{
  uint64_t result = sub_1B8F581B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1B8F18E74(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(void *)(*(void *)(a3 + 24) - 8);
  if (*(void *)(v5 + 64) <= *(void *)(v4 + 64)) {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v6 = *(void *)(v5 + 64);
  }
  uint64_t v7 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v4 + 80));
  if (v7 <= 7
    && (unint64_t)(v6 + 1) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    unsigned int v11 = a2[v6];
    unsigned int v12 = v11 - 2;
    if (v11 >= 2)
    {
      if (v6 <= 3) {
        uint64_t v13 = v6;
      }
      else {
        uint64_t v13 = 4;
      }
      switch(v13)
      {
        case 1:
          int v14 = *a2;
          goto LABEL_21;
        case 2:
          int v14 = *(unsigned __int16 *)a2;
          goto LABEL_21;
        case 3:
          int v14 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_21;
        case 4:
          int v14 = *(_DWORD *)a2;
LABEL_21:
          int v15 = (v14 | (v12 << (8 * v6))) + 2;
          unsigned int v11 = v14 + 2;
          if (v6 < 4) {
            unsigned int v11 = v15;
          }
          break;
        default:
          break;
      }
    }
    if (v11 == 1)
    {
      (*(void (**)(void *))(v5 + 16))(a1);
      *((unsigned char *)v3 + v6) = 1;
    }
    else
    {
      (*(void (**)(void *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v6) = 0;
    }
  }
  else
  {
    uint64_t v10 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1B8F19048(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24) - 8;
  uint64_t v3 = *(void *)v2;
  unint64_t v4 = *(void *)(*(void *)v2 + 64);
  if (v4 <= *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64)) {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  }
  unsigned int v5 = a1[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a1;
        goto LABEL_12;
      case 2:
        int v8 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v8 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v8 = *(_DWORD *)a1;
LABEL_12:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1) {
    uint64_t v10 = v3;
  }
  else {
    uint64_t v10 = *(void *)(*(void *)(a2 + 16) - 8);
  }
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_1B8F19184(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(*(void *)(v4 - 8) + 64) <= *(void *)(v5 + 64)) {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  }
  unsigned int v7 = a2[v6];
  unsigned int v8 = v7 - 2;
  if (v7 >= 2)
  {
    if (v6 <= 3) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a2;
        goto LABEL_13;
      case 2:
        int v10 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v10 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v10 = *(_DWORD *)a2;
LABEL_13:
        int v11 = (v10 | (v8 << (8 * v6))) + 2;
        unsigned int v7 = v10 + 2;
        if (v6 < 4) {
          unsigned int v7 = v11;
        }
        break;
      default:
        break;
    }
  }
  BOOL v12 = v7 == 1;
  if (v7 == 1) {
    uint64_t v5 = *(void *)(v4 - 8);
  }
  (*(void (**)(uint64_t))(v5 + 16))(a1);
  *(unsigned char *)(a1 + v6) = v12;
  return a1;
}

unsigned __int8 *sub_1B8F192F8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t v8 = *(void *)(v6 - 8);
    if (*(void *)(v8 + 64) <= *(void *)(v7 + 64)) {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    else {
      uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
    }
    unsigned int v10 = a1[v9];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v12 = v9;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a1;
          goto LABEL_14;
        case 2:
          int v13 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v13 = *(_DWORD *)a1;
LABEL_14:
          int v14 = (v13 | (v11 << (8 * v9))) + 2;
          unsigned int v10 = v13 + 2;
          if (v9 < 4) {
            unsigned int v10 = v14;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1) {
      uint64_t v15 = *(void *)(v6 - 8);
    }
    else {
      uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
    }
    if (v10 == 1) {
      uint64_t v16 = *(void *)(a3 + 24);
    }
    else {
      uint64_t v16 = *(void *)(a3 + 16);
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v15 + 8))(a1, v16);
    unsigned int v17 = a2[v9];
    unsigned int v18 = v17 - 2;
    if (v17 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v19 = v9;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *a2;
          goto LABEL_31;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_31;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_31;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_31:
          int v21 = (v20 | (v18 << (8 * v9))) + 2;
          unsigned int v17 = v20 + 2;
          if (v9 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    BOOL v22 = v17 == 1;
    if (v17 == 1) {
      uint64_t v23 = v8;
    }
    else {
      uint64_t v23 = v7;
    }
    if (v17 == 1) {
      uint64_t v24 = v6;
    }
    else {
      uint64_t v24 = v5;
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v23 + 16))(a1, a2, v24);
    a1[v9] = v22;
  }
  return a1;
}

uint64_t sub_1B8F19538(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(*(void *)(v4 - 8) + 64) <= *(void *)(v5 + 64)) {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v6 = *(void *)(*(void *)(v4 - 8) + 64);
  }
  unsigned int v7 = a2[v6];
  unsigned int v8 = v7 - 2;
  if (v7 >= 2)
  {
    if (v6 <= 3) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 4;
    }
    switch(v9)
    {
      case 1:
        int v10 = *a2;
        goto LABEL_13;
      case 2:
        int v10 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v10 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v10 = *(_DWORD *)a2;
LABEL_13:
        int v11 = (v10 | (v8 << (8 * v6))) + 2;
        unsigned int v7 = v10 + 2;
        if (v6 < 4) {
          unsigned int v7 = v11;
        }
        break;
      default:
        break;
    }
  }
  BOOL v12 = v7 == 1;
  if (v7 == 1) {
    uint64_t v5 = *(void *)(v4 - 8);
  }
  (*(void (**)(uint64_t))(v5 + 32))(a1);
  *(unsigned char *)(a1 + v6) = v12;
  return a1;
}

unsigned __int8 *sub_1B8F196AC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(a3 + 24);
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t v8 = *(void *)(v6 - 8);
    if (*(void *)(v8 + 64) <= *(void *)(v7 + 64)) {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    else {
      uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
    }
    unsigned int v10 = a1[v9];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v12 = v9;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a1;
          goto LABEL_14;
        case 2:
          int v13 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v13 = *(_DWORD *)a1;
LABEL_14:
          int v14 = (v13 | (v11 << (8 * v9))) + 2;
          unsigned int v10 = v13 + 2;
          if (v9 < 4) {
            unsigned int v10 = v14;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1) {
      uint64_t v15 = *(void *)(v6 - 8);
    }
    else {
      uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
    }
    if (v10 == 1) {
      uint64_t v16 = *(void *)(a3 + 24);
    }
    else {
      uint64_t v16 = *(void *)(a3 + 16);
    }
    (*(void (**)(unsigned __int8 *, uint64_t))(v15 + 8))(a1, v16);
    unsigned int v17 = a2[v9];
    unsigned int v18 = v17 - 2;
    if (v17 >= 2)
    {
      if (v9 <= 3) {
        uint64_t v19 = v9;
      }
      else {
        uint64_t v19 = 4;
      }
      switch(v19)
      {
        case 1:
          int v20 = *a2;
          goto LABEL_31;
        case 2:
          int v20 = *(unsigned __int16 *)a2;
          goto LABEL_31;
        case 3:
          int v20 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_31;
        case 4:
          int v20 = *(_DWORD *)a2;
LABEL_31:
          int v21 = (v20 | (v18 << (8 * v9))) + 2;
          unsigned int v17 = v20 + 2;
          if (v9 < 4) {
            unsigned int v17 = v21;
          }
          break;
        default:
          break;
      }
    }
    BOOL v22 = v17 == 1;
    if (v17 == 1) {
      uint64_t v23 = v8;
    }
    else {
      uint64_t v23 = v7;
    }
    if (v17 == 1) {
      uint64_t v24 = v6;
    }
    else {
      uint64_t v24 = v5;
    }
    (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v23 + 32))(a1, a2, v24);
    a1[v9] = v22;
  }
  return a1;
}

uint64_t sub_1B8F198EC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  if (v3 <= *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64)) {
    unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  unint64_t v4 = v3 + 1;
  char v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    unsigned int v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      int v6 = *(_DWORD *)((char *)a1 + v4);
      if (!v6) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      int v6 = *(unsigned __int16 *)((char *)a1 + v4);
      if (!*(unsigned __int16 *)((char *)a1 + v4)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_22:
      unsigned int v10 = *((unsigned __int8 *)a1 + v3);
      if (v10 >= 2) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v6 = *((unsigned __int8 *)a1 + v4);
  if (!*((unsigned char *)a1 + v4)) {
    goto LABEL_22;
  }
LABEL_14:
  int v9 = (v6 - 1) << v5;
  if (v4 > 3) {
    int v9 = 0;
  }
  if (v4)
  {
    if (v4 > 3) {
      LODWORD(v4) = 4;
    }
    switch((int)v4)
    {
      case 2:
        LODWORD(v4) = *a1;
        break;
      case 3:
        LODWORD(v4) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v4) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v4) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v4 | v9) + 255;
}

void sub_1B8F19A30(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (*(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64) > v5) {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x1B8F19C08);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

unsigned char *sub_1B8F19C30(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B8F19CFCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1B8F19D24()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F19D40()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F19D5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F19D78()
{
  return 2;
}

uint64_t sub_1B8F19D80(uint64_t a1, unint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2 >> 62;
  uint64_t v4 = MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_45;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v5) {
        return v4;
      }
      uint64_t v38 = MEMORY[0x1E4FBC860];
      int64_t v8 = v5 & ~(v5 >> 63);
      sub_1B8F37B6C(0, v8, 0);
      uint64_t v9 = a1;
      uint64_t v4 = v38;
      if (!v3)
      {
        if ((v5 & 0x8000000000000000) == 0)
        {
          uint64_t v10 = 0;
          goto LABEL_14;
        }
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
      }
      if (v3 == 1) {
        uint64_t v10 = (int)a1;
      }
      else {
        uint64_t v10 = *(void *)(a1 + 16);
      }
      if (v5 < 0) {
        goto LABEL_44;
      }
      while (1)
      {
LABEL_14:
        if (!v8)
        {
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          goto LABEL_47;
        }
        int64_t v30 = v8;
        if (v3)
        {
          if (v3 == 1)
          {
            if (v10 < (int)a1 || v10 >= a1 >> 32) {
              goto LABEL_38;
            }
            uint64_t v11 = v4;
            uint64_t v12 = v2;
            uint64_t v13 = sub_1B8F56F80();
            if (!v13) {
              goto LABEL_48;
            }
            uint64_t v14 = v13;
            uint64_t v15 = sub_1B8F56F90();
            uint64_t v16 = v10 - v15;
            if (__OFSUB__(v10, v15)) {
              goto LABEL_41;
            }
          }
          else
          {
            if (v10 < *(void *)(v9 + 16)) {
              goto LABEL_40;
            }
            if (v10 >= *(void *)(v9 + 24)) {
              goto LABEL_42;
            }
            uint64_t v11 = v4;
            uint64_t v12 = v2;
            uint64_t v18 = sub_1B8F56F80();
            if (!v18) {
              goto LABEL_49;
            }
            uint64_t v14 = v18;
            uint64_t v19 = sub_1B8F56F90();
            uint64_t v16 = v10 - v19;
            if (__OFSUB__(v10, v19)) {
              goto LABEL_43;
            }
          }
          char v17 = *(unsigned char *)(v14 + v16);
          uint64_t v2 = v12;
          uint64_t v9 = a1;
        }
        else
        {
          if (v10 >= BYTE6(a2)) {
            goto LABEL_39;
          }
          uint64_t v11 = v4;
          char v31 = v9;
          int v32 = *(_DWORD *)((char *)&a1 + 1);
          __int16 v33 = *(_WORD *)((char *)&a1 + 5);
          char v34 = HIBYTE(a1);
          int v35 = a2;
          __int16 v36 = WORD2(a2);
          char v17 = *(&v31 + v10);
        }
        char v31 = v17;
        sub_1B8F1A1FC(&v31, v37);
        if (v2) {
          break;
        }
        uint64_t v20 = v9;
        unint64_t v21 = v3;
        uint64_t v23 = v37[0];
        uint64_t v22 = v37[1];
        uint64_t v4 = v11;
        uint64_t v38 = v11;
        unint64_t v25 = *(void *)(v11 + 16);
        unint64_t v24 = *(void *)(v11 + 24);
        if (v25 >= v24 >> 1)
        {
          sub_1B8F37B6C(v24 > 1, v25 + 1, 1);
          uint64_t v20 = a1;
          uint64_t v4 = v38;
        }
        *(void *)(v4 + 16) = v25 + 1;
        uint64_t v26 = v4 + 16 * v25;
        *(void *)(v26 + 32) = v23;
        *(void *)(v26 + 40) = v22;
        ++v10;
        int64_t v8 = v30 - 1;
        --v5;
        unint64_t v3 = v21;
        uint64_t v9 = v20;
        if (!v5) {
          return v4;
        }
      }
      swift_release();
      return v4;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_46;
    case 3uLL:
      return v4;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t Data.hexString.getter(uint64_t a1, unint64_t a2)
{
  sub_1B8F19D80(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C3300);
  sub_1B8F1A1A0();
  uint64_t v2 = sub_1B8F57460();
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_1B8F1A1A0()
{
  unint64_t result = qword_1EB9C3308;
  if (!qword_1EB9C3308)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB9C3300);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C3308);
  }
  return result;
}

uint64_t sub_1B8F1A1FC@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C36B0);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x1E4FBC358];
  *(_OWORD *)(v4 + 16) = xmmword_1B8F59040;
  uint64_t v6 = MEMORY[0x1E4FBC3B0];
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  *(unsigned char *)(v4 + 32) = v3;
  uint64_t result = sub_1B8F574E0();
  *a2 = result;
  a2[1] = v8;
  return result;
}

uint64_t dispatch thunk of InitializedInjectableService.init(config:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of InitializedInjectableServiceFactory.produce()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1B8F1A2B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B8F57740();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1B8F57730();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1B8F1DBD4(a1, &qword_1EB9C36C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B8F576E0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t withTimeout<A>(after:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x1F4188298](sub_1B8F1A460, 0, 0);
}

uint64_t sub_1B8F1A460()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  long long v5 = *(_OWORD *)(v0 + 40);
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v3;
  *(void *)(v4 + 32) = v2;
  *(_OWORD *)(v4 + 40) = v5;
  sub_1B8F13D08(v1, v1);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1B8F1A56C;
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 16);
  return MEMORY[0x1F4188080](v8, v7);
}

uint64_t sub_1B8F1A56C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8F1A6A8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B8F1A6A8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1A70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  sub_1B8F57980();
  v7[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  v7[10] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B8F1A7DC, 0, 0);
}

uint64_t sub_1B8F1A7DC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v13 = v0[6];
  uint64_t v14 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v5 = sub_1B8F57740();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v1, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v2;
  v7[5] = v4;
  v7[6] = v3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v8 = sub_1B8F57790();
  sub_1B8F12B98(v1, (uint64_t)&unk_1E9EF4888, (uint64_t)v7);
  sub_1B8F1DBD4(v1, &qword_1EB9C36C0);
  v6(v1, 1, 1, v5);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = v13;
  void v9[6] = v14;
  swift_retain();
  sub_1B8F12B98(v1, (uint64_t)&unk_1E9EF4898, (uint64_t)v9);
  sub_1B8F1DBD4(v1, &qword_1EB9C36C0);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[11] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1B8F1A9FC;
  uint64_t v11 = v0[9];
  return MEMORY[0x1F4187E30](v11, 0, 0, v8);
}

uint64_t sub_1B8F1A9FC()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F1AC44;
  }
  else {
    uint64_t v2 = sub_1B8F1AB10;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F1AB10()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v2, 1, v1);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[2], v2, v1);
    __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
    sub_1B8F57780();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  return result;
}

uint64_t sub_1B8F1AC44()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
  sub_1B8F57780();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1ACEC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_1B8F08F7C;
  return sub_1B8F1A70C(a1, a2, v7, v8, v9, v10, v6);
}

ValueMetadata *type metadata accessor for TimeoutError()
{
  return &type metadata for TimeoutError;
}

uint64_t sub_1B8F1ADD4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  sub_1B8F57710();
  uint64_t result = sub_1B8F57980();
  if (v1 <= 0x3F)
  {
    sub_1B8F581B0();
    uint64_t result = sub_1B8F57980();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_1B8F1AF04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = sub_1B8F57B70();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B8F1AFC4, 0, 0);
}

uint64_t sub_1B8F1AFC4()
{
  sub_1B8F57B60();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1E9EF48C0 + dword_1E9EF48C0);
  unint64_t v1 = (void *)swift_task_alloc();
  v0[7] = v1;
  void *v1 = v0;
  v1[1] = sub_1B8F1B084;
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  return v5(v3, v2, 0, 0, 1);
}

uint64_t sub_1B8F1B084()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_1B8F1B284;
  }
  else {
    uint64_t v5 = sub_1B8F1B1F4;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1B8F1B1F4()
{
  sub_1B8F1E1B8();
  swift_allocError();
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1B284()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1B2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x1F4188298](sub_1B8F1B30C, 0, 0);
}

uint64_t sub_1B8F1B30C()
{
  type metadata accessor for SafeContinuation();
  swift_allocObject();
  long long v7 = *(_OWORD *)(v0 + 24);
  uint64_t v1 = sub_1B8F1D394();
  *(void *)(v0 + 48) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1B8F1B434;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x1F4188148](v5, &unk_1E9EF48A8, v2, sub_1B8F1DF24, v1, 0, 0, v4);
}

uint64_t sub_1B8F1B434()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1B8F1B5B4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1B8F1B550;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F1B550()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1B5B4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1B620()
{
  return sub_1B8F1D394();
}

uint64_t sub_1B8F1B654(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *a2;
  return MEMORY[0x1F4188298](sub_1B8F1B6A0, 0, 0);
}

uint64_t sub_1B8F1B6A0()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 32) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  uint64_t v5 = *(void *)(v1 + 80);
  *uint64_t v4 = v0;
  v4[1] = sub_1B8F13854;
  uint64_t v6 = *(void *)(v0 + 16);
  return MEMORY[0x1F4188160](v6, 0, 0, 0xD000000000000015, 0x80000001B8F5BF90, sub_1B8F1DF28, v3, v5);
}

uint64_t sub_1B8F1B79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)a2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v9 = sub_1B8F57710();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9, v12);
  uint64_t v14 = &v19[-v13];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(&v19[-v13], a1, v9);
  unint64_t v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v8;
  *(void *)(v16 + 24) = a2;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v10 + 32))(v16 + v15, v14, v9);
  char v17 = (void *)(v16 + ((v11 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *char v17 = a3;
  v17[1] = a4;
  uint64_t v20 = &unk_1E9EF48B8;
  uint64_t v21 = v16;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33A8);
  sub_1B8F57C30();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F1B978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v7 = sub_1B8F581B0();
  v5[6] = v7;
  v5[7] = *(void *)(v7 - 8);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B8F1BA80, a2, 0);
}

uint64_t sub_1B8F1BA80()
{
  uint64_t v1 = (int *)v0[4];
  sub_1B8F1C228(v0[3]);
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1B8F1BB64;
  uint64_t v3 = v0[9];
  return v5(v3);
}

uint64_t sub_1B8F1BB64()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F1BD8C;
  }
  else {
    uint64_t v2 = sub_1B8F1BC78;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F1BC78()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_storeEnumTagMultiPayload();
  return MEMORY[0x1F4188298](sub_1B8F1BCEC, v1, 0);
}

uint64_t sub_1B8F1BCEC()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  sub_1B8F1C600(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1B8F1BD8C()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 16);
  **(void **)(v0 + 64) = v1;
  swift_storeEnumTagMultiPayload();
  id v3 = v1;
  return MEMORY[0x1F4188298](sub_1B8F1BE10, v2, 0);
}

uint64_t sub_1B8F1BE10()
{
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  sub_1B8F1C600(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x1F4188298](sub_1B8F1BEA4, 0, 0);
}

uint64_t sub_1B8F1BEA4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1BF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33B0);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v10 - 8, v11);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F1DA60(a1, (uint64_t)v9);
  uint64_t v14 = sub_1B8F577C0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) == 1)
  {
    sub_1B8F1DBD4((uint64_t)v9, &qword_1EB9C33B0);
    uint64_t v16 = sub_1B8F57740();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  }
  else
  {
    sub_1B8F577B0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
    uint64_t v17 = sub_1B8F57740();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 0, 1, v17);
  }
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = a2;
  v18[5] = a3;
  swift_retain();
  return sub_1B8F1A2B0((uint64_t)v13, (uint64_t)&unk_1E9EF4878, (uint64_t)v18);
}

uint64_t sub_1B8F1C14C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_1B8F08F7C;
  return v8(a1);
}

uint64_t sub_1B8F1C228(uint64_t a1)
{
  uint64_t v31 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v2 = sub_1B8F581B0();
  uint64_t v3 = sub_1B8F57980();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  uint64_t v5 = MEMORY[0x1F4188790](v3, v4);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v5, v9);
  int64_t v30 = (char *)&v29 - v10;
  uint64_t v11 = sub_1B8F57710();
  uint64_t v12 = sub_1B8F57980();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v12, v14);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v29 - v19;
  uint64_t v21 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)&v29 - v19, v31, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v20, 0, 1, v11);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v20, v12);
  uint64_t v22 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t v23 = v12;
  uint64_t v24 = v32;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 40))(v22, v17, v23);
  uint64_t v25 = v33;
  swift_endAccess();
  uint64_t v26 = v1 + *(void *)(*(void *)v1 + 104);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v7, v26, v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v2) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v7, v25);
  }
  uint64_t v28 = (uint64_t)v30;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v30, v7, v2);
  sub_1B8F1C600(v28);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v28, v2);
}

uint64_t sub_1B8F1C600(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v34 = *v1;
  uint64_t v3 = v34;
  uint64_t v35 = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v4 = sub_1B8F581B0();
  uint64_t v5 = sub_1B8F57980();
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  uint64_t v7 = MEMORY[0x1F4188790](v5, v6);
  uint64_t v31 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = sub_1B8F57710();
  uint64_t v13 = sub_1B8F57980();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v13, v15);
  uint64_t v18 = (char *)&v30 - v17;
  uint64_t v19 = *(void *)(v12 - 8);
  uint64_t result = MEMORY[0x1F4188790](v16, v20);
  uint64_t v23 = (char *)&v30 - v22;
  if ((*((unsigned char *)v2 + *(void *)(v3 + 112)) & 1) == 0)
  {
    uint64_t v24 = (char *)v2 + *(void *)(v34 + 96);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v18, v24, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v12) == 1)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
      uint64_t v25 = *(void *)(v4 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v11, v35, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v11, 0, 1, v4);
      uint64_t v27 = v31;
      uint64_t v26 = v32;
      uint64_t v28 = v33;
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v31, v11, v33);
      uint64_t v29 = (char *)v2 + *(void *)(*v2 + 104);
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v29, v27, v28);
      return swift_endAccess();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v23, v18, v12);
      sub_1B8F1CCF4(v35, v12);
      sub_1B8F1CA30(v2);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v23, v12);
    }
  }
  return result;
}

uint64_t sub_1B8F1CA30(uint64_t *a1)
{
  uint64_t v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v3 = sub_1B8F581B0();
  uint64_t v4 = sub_1B8F57980();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_1B8F57710();
  uint64_t v10 = sub_1B8F57980();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  uint64_t v14 = (char *)&v18 - v13;
  *((unsigned char *)a1 + *(void *)(v2 + 112)) = 1;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))((char *)&v18 - v13, 1, 1, v9);
  uint64_t v15 = (uint64_t)a1 + *(void *)(*a1 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v15, v14, v10);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v8, 1, 1, v3);
  uint64_t v16 = (uint64_t)a1 + *(void *)(*a1 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v16, v8, v4);
  return swift_endAccess();
}

uint64_t sub_1B8F1CCF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v8 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v5, v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1B8F581B0();
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v19 - v15, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v16, v9);
    return sub_1B8F576F0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v16, v3);
    return sub_1B8F57700();
  }
}

uint64_t sub_1B8F1CF30()
{
  return swift_release();
}

uint64_t sub_1B8F1CFB4(uint64_t a1, uint64_t a2)
{
  v2[2] = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v3 = sub_1B8F581B0();
  v2[3] = v3;
  v2[4] = *(void *)(v3 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1B8F1D0A4, 0, 0);
}

uint64_t sub_1B8F1D0A4()
{
  uint64_t v1 = *(uint64_t **)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 16);
  sub_1B8F57720();
  sub_1B8F1E20C(&qword_1EB9C33A0, MEMORY[0x1E4FBCF50]);
  uint64_t v3 = swift_allocError();
  sub_1B8F573D0();
  uint64_t *v1 = v3;
  swift_storeEnumTagMultiPayload();
  return MEMORY[0x1F4188298](sub_1B8F1D188, v2, 0);
}

uint64_t sub_1B8F1D188()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_1B8F1C600(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1B8F1D21C()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  sub_1B8F57710();
  uint64_t v2 = sub_1B8F57980();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 104);
  sub_1B8F581B0();
  uint64_t v4 = sub_1B8F57980();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1B8F1D354()
{
  uint64_t v0 = sub_1B8F1D21C();
  return MEMORY[0x1F4188210](v0);
}

uint64_t type metadata accessor for SafeContinuation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F1D394()
{
  swift_defaultActor_initialize();
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v2 = sub_1B8F57710();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = v0 + *(void *)(*(void *)v0 + 104);
  uint64_t v4 = sub_1B8F581B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(unsigned char *)(v0 + *(void *)(*(void *)v0 + 112)) = 0;
  return v0;
}

uint64_t sub_1B8F1D4E0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1B8F09BDC;
  return sub_1B8F1CFB4(a1, v1);
}

uint64_t sub_1B8F1D57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_1B8F57B50();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x1F4188298](sub_1B8F1D680, 0, 0);
}

uint64_t sub_1B8F1D680()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_1B8F57B70();
  uint64_t v5 = sub_1B8F1E20C(&qword_1EB9C33E8, MEMORY[0x1E4FBD1A8]);
  sub_1B8F58110();
  sub_1B8F1E20C(&qword_1EB9C33E0, MEMORY[0x1E4FBD178]);
  sub_1B8F57B80();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1B8F1D820;
  uint64_t v8 = v0[11];
  return MEMORY[0x1F4188178](v8, v0 + 2, v4, v5);
}

uint64_t sub_1B8F1D820()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8F1D9DC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_1B8F1D9DC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F1DA48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B8F1E188(a1, a2);
}

uint64_t sub_1B8F1DA60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F1DAC8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B8F1DB08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B8F09BDC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9EF4870 + dword_1E9EF4870);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B8F1DBD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1B8F1DC30()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B8F1DC68(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_1B8F09BDC;
  return sub_1B8F1AF04(a1, v4, v5, v6, v7);
}

uint64_t sub_1B8F1DD30()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B8F1DD70(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 40);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_1B8F09BDC;
  *(void *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x1F4188298](sub_1B8F1B30C, 0, 0);
}

uint64_t sub_1B8F1DE34(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_1B8F09BDC;
  *(void *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 48) = *(void *)v6;
  return MEMORY[0x1F4188298](sub_1B8F1B6A0, 0, 0);
}

uint64_t sub_1B8F1DF28(uint64_t a1)
{
  return sub_1B8F1B79C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1B8F1DF34()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v1 = sub_1B8F57710();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1B8F1E040(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v4 = *(void *)(sub_1B8F57710() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + v5;
  uint64_t v8 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_1B8F09BDC;
  return sub_1B8F1B978(a1, v6, v7, v9, v10);
}

uint64_t sub_1B8F1E188@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1B8F1BF18(a1, *(void *)(v2 + 16), *(void *)(v2 + 24));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

unint64_t sub_1B8F1E1B8()
{
  unint64_t result = qword_1EB9C3318[0];
  if (!qword_1EB9C3318[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB9C3318);
  }
  return result;
}

uint64_t sub_1B8F1E20C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B8F1E254(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1B8F1E298()
{
  uint64_t v0 = sub_1B8F578C0();
  MEMORY[0x1F4188790](v0, v1);
  uint64_t v2 = sub_1B8F578E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B8F57350();
  MEMORY[0x1F4188790](v7 - 8, v8);
  sub_1B8F1ECD8(0, (unint64_t *)&qword_1EB9C32D8);
  sub_1B8F57320();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4FBCC68], v2);
  v10[1] = MEMORY[0x1E4FBC860];
  sub_1B8F1ED14(&qword_1E9EF48D0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF48D8);
  sub_1B8F1ED5C(&qword_1E9EF48E0, &qword_1E9EF48D8);
  sub_1B8F57A00();
  uint64_t result = sub_1B8F57900();
  qword_1E9EF48C8 = result;
  return result;
}

id static AAFAnalytics.sharedAnalytics.getter@<X0>(void *a1@<X8>)
{
  if (qword_1E9EF3D20 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_1E9EF48C8;
  *a1 = qword_1E9EF48C8;
  return v2;
}

void static AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(uint64_t a1, void *a2, Swift::OpaquePointer a3)
{
  if (qword_1E9EF3D20 != -1) {
    swift_once();
  }
  id v7 = (id)qword_1E9EF48C8;
  v6._countAndFlagsBits = a1;
  v6._object = a2;
  AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(v6, a3);
}

Swift::Void __swiftcall AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(Swift::String eventName, Swift::OpaquePointer eventData)
{
  object = eventName._object;
  uint64_t countAndFlagsBits = eventName._countAndFlagsBits;
  uint64_t v6 = sub_1B8F57300();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = sub_1B8F57350();
  uint64_t v11 = *(void *)(v18[0] - 8);
  MEMORY[0x1F4188790](v18[0], v12);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *v2;
  uint64_t v16 = (Swift::OpaquePointer *)swift_allocObject();
  v16[2]._rawValue = v15;
  v16[3]._rawValue = (void *)countAndFlagsBits;
  v16[4]._rawValue = object;
  v16[5]._rawValue = eventData._rawValue;
  aBlock[4] = sub_1B8F1E8FC;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F1E254;
  aBlock[3] = &block_descriptor_2;
  uint64_t v17 = _Block_copy(aBlock);
  v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F57330();
  v18[1] = MEMORY[0x1E4FBC860];
  sub_1B8F1ED14((unint64_t *)&qword_1E9EF4028, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4030);
  sub_1B8F1ED5C((unint64_t *)&qword_1E9EF4038, &qword_1E9EF4030);
  sub_1B8F57A00();
  MEMORY[0x1BA9CF6C0](0, v14, v10, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, void))(v11 + 8))(v14, v18[0]);
  swift_release();
}

uint64_t sub_1B8F1E8B4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_1B8F1E8FC()
{
  sub_1B8F1E944(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

ValueMetadata *type metadata accessor for AAFAnalytics()
{
  return &type metadata for AAFAnalytics;
}

void sub_1B8F1E944(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_1B8F57390();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (void *)((char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *v2;
  *uint64_t v9 = v10;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E4FBCBF0], v5);
  id v11 = v10;
  LOBYTE(v10) = sub_1B8F573B0();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v9, v5);
  if (v10)
  {
    if (qword_1EB9C4148 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v12 = sub_1B8F572D0();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EB9C4218);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_1B8F572B0();
  os_log_type_t v14 = sub_1B8F57860();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_1B8F20904(a1, a2, &v25);
    v23[1] = a1;
    uint64_t v24 = v17;
    sub_1B8F579A0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    sub_1B8F1ECD8(0, qword_1E9EF4C40);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_1B8F57410();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_1B8F20904(v18, v20, &v25);
    sub_1B8F579A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B8F03000, v13, v14, "Publishing Analytics: %s %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1BA9D0800](v16, -1, -1);
    MEMORY[0x1BA9D0800](v15, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v21 = (void *)sub_1B8F574C0();
  sub_1B8F1ECD8(0, qword_1E9EF4C40);
  uint64_t v22 = (void *)sub_1B8F57400();
  AnalyticsSendEvent();
}

uint64_t sub_1B8F1ECD8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1B8F1ED14(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B8F1ED5C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B8F1EDAC()
{
  uint64_t v0 = sub_1B8F578E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1B8F578C0();
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v7 = sub_1B8F57350();
  MEMORY[0x1F4188790](v7 - 8, v8);
  type metadata accessor for DependencyRegistry();
  uint64_t v9 = (void *)swift_allocObject();
  sub_1B8F17144();
  sub_1B8F57340();
  sub_1B8F578B0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E4FBCC68], v0);
  uint64_t result = sub_1B8F57900();
  uint64_t v11 = MEMORY[0x1E4FBC868];
  v9[2] = result;
  v9[3] = v11;
  v9[4] = v11;
  qword_1EB9C32C0 = (uint64_t)v9;
  return result;
}

uint64_t static DependencyRegistry.register<A>(_:entry:dependencyId:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    if (qword_1EB9C32D0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_1B8F572D0();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EB9C4200);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_1B8F572B0();
    os_log_type_t v9 = sub_1B8F57860();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v21 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B8F20904(a3, a4, &v21);
      sub_1B8F579A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B8F03000, v8, v9, "Registering dependency by id - %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D0800](v11, -1, -1);
      MEMORY[0x1BA9D0800](v10, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_1EB9C32C8 != -1) {
      swift_once();
    }
    return sub_1B8F1F358(a2, a3, a4);
  }
  else
  {
    uint64_t v21 = a1;
    swift_getMetatypeMetadata();
    uint64_t v12 = sub_1B8F574F0();
    unint64_t v14 = v13;
    if (qword_1EB9C32D0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1B8F572D0();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EB9C4200);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_1B8F572B0();
    os_log_type_t v17 = sub_1B8F57860();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B8F20904(v12, v14, &v21);
      sub_1B8F579A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B8F03000, v16, v17, "Registering dependency by id - %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D0800](v19, -1, -1);
      MEMORY[0x1BA9D0800](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_1EB9C32C8 != -1) {
      swift_once();
    }
    sub_1B8F1F358(a2, v12, v14);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B8F1F358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = sub_1B8F57350();
  uint64_t v7 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1B8F57300();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F572F0();
  sub_1B8F215D4(a1, (uint64_t)v22);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v3;
  *(void *)(v16 + 24) = a2;
  *(void *)(v16 + 32) = a3;
  sub_1B8F2158C(v22, (_OWORD *)(v16 + 40));
  aBlock[4] = sub_1B8F21944;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F1E254;
  aBlock[3] = &block_descriptor_15;
  os_log_type_t v17 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1B8F57330();
  MEMORY[0x1BA9CF6C0](0, v10, v15, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  return swift_release();
}

uint64_t static DependencyRegistry.locateService<A>(by:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (!a2)
  {
    swift_getMetatypeMetadata();
    a1 = sub_1B8F574F0();
  }
  uint64_t v9 = a2;
  uint64_t v10 = qword_1EB9C32C8;
  swift_bridgeObjectRetain();
  if (v10 != -1) {
    swift_once();
  }
  sub_1B8F1F68C(a1, v9, a3, a4, a5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8F1F68C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v22 = a5;
  uint64_t v21 = sub_1B8F57980();
  uint64_t v11 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21, v12);
  uint64_t v14 = (char *)&v21 - v13;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))((char *)&v21 - v13, 1, 1, a4);
  uint64_t v15 = *(NSObject **)(v6 + 16);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = a4;
  v16[3] = v6;
  v16[4] = a1;
  v16[5] = a2;
  void v16[6] = v14;
  v16[7] = a3;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_1B8F213F0;
  *(void *)(v17 + 24) = v16;
  aBlock[4] = sub_1B8F21410;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F1FFD0;
  aBlock[3] = &block_descriptor_9;
  uint64_t v18 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  dispatch_sync(v15, v18);
  _Block_release(v18);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v22, v14, v21);
    return swift_release();
  }
  return result;
}

void static DependencyRegistry.reset()()
{
  if (qword_1EB9C32C8 != -1) {
    swift_once();
  }
  DependencyRegistry.reset()();
}

Swift::Void __swiftcall DependencyRegistry.reset()()
{
  uint64_t v1 = sub_1B8F57350();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57300();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F572F0();
  aBlock[4] = sub_1B8F20F6C;
  uint64_t v13 = v0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B8F1E254;
  aBlock[3] = &block_descriptor_3;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1B8F57330();
  MEMORY[0x1BA9CF6C0](0, v5, v10, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_release();
}

uint64_t sub_1B8F1FB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B8F215D4(a4, (uint64_t)v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B8F1FBC8((uint64_t)v7, a2, a3);
  return swift_endAccess();
}

uint64_t sub_1B8F1FBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned __int8 *)(a1 + 40) == 255)
  {
    sub_1B8F2152C(a1);
    sub_1B8F21438(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_1B8F2152C((uint64_t)v9);
  }
  else
  {
    sub_1B8F2158C((long long *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1B8F2347C(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1B8F1FC8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_1B8F57980();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  uint64_t v16 = (char *)&v21 - v15;
  swift_beginAccess();
  uint64_t v17 = *(void *)(a1 + 24);
  if (*(void *)(v17 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_1B8F22A50(a2, a3);
    if (v19)
    {
      sub_1B8F215D4(*(void *)(v17 + 56) + 48 * v18, (uint64_t)&v21);
    }
    else
    {
      uint64_t v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
      unsigned __int8 v24 = -1;
    }
    swift_bridgeObjectRelease();
    if (v24 != 255)
    {
      sub_1B8F2158C(&v21, v25);
      swift_endAccess();
      sub_1B8F1FE54((uint64_t)v25, a5, a6, v16);
      sub_1B8F215A4((uint64_t)v25);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(a4, v16, v12);
    }
  }
  else
  {
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    unsigned __int8 v24 = -1;
  }
  sub_1B8F2152C((uint64_t)&v21);
  return swift_endAccess();
}

uint64_t sub_1B8F1FE54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  sub_1B8F215D4(a1, (uint64_t)v16);
  if (v17)
  {
    if (v17 == 1)
    {
      return sub_1B8F1FFF8(*(uint64_t *)&v16[0], *((uint64_t *)&v16[0] + 1), a2, a3, a4);
    }
    else
    {
      sub_1B8F2160C(v16, (uint64_t)&v13);
      uint64_t v9 = v14;
      uint64_t v10 = v15;
      __swift_project_boxed_opaque_existential_1(&v13, v14);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v12, v9, v10);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
      int v11 = swift_dynamicCast();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, v11 ^ 1u, 1, a3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    }
  }
  else
  {
    sub_1B8F122C0(v16, &v13);
    int v8 = swift_dynamicCast();
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, v8 ^ 1u, 1, a3);
  }
}

uint64_t sub_1B8F1FFD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1B8F1FFF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v61 = a3;
  v62 = a5;
  uint64_t v9 = sub_1B8F57980();
  uint64_t v59 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9, v10);
  long long v13 = (char *)&v57 - v12;
  uint64_t v14 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](v11, v15);
  char v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v67 = a4;
  swift_getMetatypeMetadata();
  uint64_t v63 = sub_1B8F574F0();
  unint64_t v19 = v18;
  uint64_t v20 = (void *)(v5 + 32);
  swift_beginAccess();
  uint64_t v21 = *(void *)(v5 + 32);
  if (!*(void *)(v21 + 16)) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_1B8F22A50(v63, v19);
  if ((v23 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_endAccess();
    goto LABEL_7;
  }
  uint64_t v58 = a2;
  uint64_t v24 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v25 = MEMORY[0x1BA9D08C0](v24 + 16);
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t ObjectType = swift_getObjectType();
    *(void *)&long long v64 = v26;
    sub_1B8F122C0(&v64, &v67);
  }
  else
  {
    swift_beginAccess();
    sub_1B8F21884(v24 + 24, (uint64_t)&v67);
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  char v53 = swift_dynamicCast();
  uint64_t v54 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
  if (v53)
  {
    v54(v13, 0, 1, a4);
    swift_bridgeObjectRelease();
    uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v55(v17, v13, a4);
    uint64_t v56 = v62;
    v55(v62, v17, a4);
    return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v54)(v56, 0, 1, a4);
  }
  v54(v13, 1, 1, a4);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v13, v9);
  a2 = v58;
LABEL_7:
  if (qword_1EB9C32D0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_1B8F572D0();
  __swift_project_value_buffer(v27, (uint64_t)qword_1EB9C4200);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_1B8F572B0();
  os_log_type_t v29 = sub_1B8F57860();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v60 = v14;
  if (v30)
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v59 = a1;
    uint64_t v33 = a2;
    uint64_t v34 = v32;
    *(void *)&long long v67 = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v64 = sub_1B8F20904(v63, v19, (uint64_t *)&v67);
    sub_1B8F579A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B8F03000, v28, v29, "Creating a new object for shared dependency id - %s", v31, 0xCu);
    swift_arrayDestroy();
    uint64_t v35 = v34;
    a2 = v33;
    a1 = v59;
    MEMORY[0x1BA9D0800](v35, -1, -1);
    MEMORY[0x1BA9D0800](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  __int16 v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 16);
  uint64_t v68 = a1;
  uint64_t v69 = a2;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v67);
  uint64_t v37 = swift_bridgeObjectRetain();
  v36(v37, a1, a2);
  uint64_t v38 = v68;
  uint64_t v39 = __swift_project_boxed_opaque_existential_1(&v67, v68);
  uint64_t ObjectType = v38;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v64);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v38 - 8) + 16))(boxed_opaque_existential_0, v39, v38);
  type metadata accessor for WeakWrapper();
  uint64_t v41 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v41 + 24) = 0u;
  *(_OWORD *)(v41 + 40) = 0u;
  __swift_project_boxed_opaque_existential_1(&v64, ObjectType);
  uint64_t DynamicType = swift_getDynamicType();
  if (swift_isClassType()) {
    uint64_t v43 = DynamicType;
  }
  else {
    uint64_t v43 = 0;
  }
  if (v43)
  {
    uint64_t v44 = ObjectType;
    uint64_t v45 = __swift_project_boxed_opaque_existential_1(&v64, ObjectType);
    uint64_t v46 = *(void *)(v44 - 8);
    MEMORY[0x1F4188790](v45, v45);
    uint64_t v48 = (char *)&v57 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v46 + 16))(v48);
    sub_1B8F57ED0();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v44);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v64);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1B8F122C0(&v64, v66);
    swift_beginAccess();
    sub_1B8F21624((uint64_t)v66, v41 + 24);
    swift_endAccess();
  }
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v66[0] = *v20;
  *uint64_t v20 = 0x8000000000000000;
  sub_1B8F235C8(v41, v63, v19, isUniquelyReferenced_nonNull_native);
  *uint64_t v20 = *(void *)&v66[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  sub_1B8F14F10((uint64_t)&v67, (uint64_t)&v64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF48F0);
  uint64_t v50 = v62;
  int v51 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v50, v51 ^ 1u, 1, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v67);
}

uint64_t DependencyRegistry.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DependencyRegistry.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 40, 7);
}

uint64_t sub_1B8F20818(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1B8F20828(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1B8F20864(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1B8F2088C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1B8F20904(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1B8F579A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1B8F20904(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B8F209D8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B8F12200((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1B8F12200((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1B8F209D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B8F579B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1B8F20B94(a5, a6);
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
  uint64_t v8 = sub_1B8F57AB0();
  if (!v8)
  {
    sub_1B8F57BA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1B8F57C00();
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

uint64_t sub_1B8F20B94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B8F20C2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B8F20E0C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B8F20E0C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B8F20C2C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1B8F20DA4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1B8F57A40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1B8F57BA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1B8F57590();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1B8F57C00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1B8F57BA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1B8F20DA4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C32E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B8F20E0C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C32E8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = a4 + 32;
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
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

unsigned char **sub_1B8F20F5C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1B8F20F6C()
{
  swift_beginAccess();
  *(void *)(v0 + 24) = MEMORY[0x1E4FBC868];
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for DependencyRegistry()
{
  return self;
}

uint64_t method lookup function for DependencyRegistry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DependencyRegistry);
}

uint64_t destroy for DependencyRegistry.Entry(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)(result + 40);
  if (v1 < 3)
  {
    if (v1 == 1) {
      return result;
    }
    return __swift_destroy_boxed_opaque_existential_1(result);
  }
  if (*(_DWORD *)result != -2) {
    return __swift_destroy_boxed_opaque_existential_1(result);
  }
  return result;
}

uint64_t initializeWithCopy for DependencyRegistry.Entry(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 3) {
    unsigned int v3 = *(_DWORD *)a2 + 3;
  }
  if (v3 == 2)
  {
    long long v4 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t))(v4 - 8))(a1);
    LOBYTE(v3) = 2;
  }
  else if (v3 == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 24) = v5;
    (**(void (***)(uint64_t))(v5 - 8))(a1);
    LOBYTE(v3) = 0;
  }
  *(unsigned char *)(a1 + 40) = v3;
  return a1;
}

uint64_t assignWithCopy for DependencyRegistry.Entry(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 != 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      uint64_t v6 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
      LOBYTE(v5) = 2;
    }
    else if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 24) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
      LOBYTE(v5) = 0;
    }
    *(unsigned char *)(a1 + 40) = v5;
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DependencyRegistry.Entry(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 3) {
      unsigned int v4 = *(_DWORD *)a1 + 3;
    }
    if (v4 != 1) {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 3) {
      unsigned int v5 = *(_DWORD *)a2 + 3;
    }
    if (v5 == 2)
    {
      long long v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      LOBYTE(v5) = 2;
    }
    else if (v5 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      LOBYTE(v5) = 0;
      long long v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
    }
    *(unsigned char *)(a1 + 40) = v5;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DependencyRegistry.Entry(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DependencyRegistry.Entry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B8F21354(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 3) {
    return (*(_DWORD *)a1 + 3);
  }
  return result;
}

uint64_t sub_1B8F21370(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DependencyRegistry.Entry()
{
  return &type metadata for DependencyRegistry.Entry;
}

uint64_t sub_1B8F213A8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B8F213F0()
{
  return sub_1B8F1FC8C(v0[3], v0[4], v0[5], v0[6], v0[7], v0[2]);
}

uint64_t sub_1B8F21400()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F21410()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

double sub_1B8F21438@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1B8F22A50(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *unsigned int v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B8F23ECC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1B8F2158C((long long *)(*(void *)(v11 + 56) + 48 * v8), (_OWORD *)a3);
    sub_1B8F2168C(v8, v11);
    *unsigned int v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(unsigned char *)(a3 + 40) = -1;
  }
  return result;
}

uint64_t sub_1B8F2152C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF48E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_1B8F2158C(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(long long *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_1B8F215A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B8F215D4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B8F2160C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1B8F21624(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B8F2168C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_1B8F57A10();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1B8F58180();
        swift_bridgeObjectRetain();
        sub_1B8F57450();
        uint64_t v11 = sub_1B8F581A0();
        double result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          char v17 = (long long *)(v16 + 48 * v3);
          unint64_t v18 = (long long *)(v16 + 48 * v6);
          if (48 * v3 < (uint64_t)(48 * v6) || v17 >= v18 + 3 || (v19 = v3 == v6, int64_t v3 = v6, !v19))
          {
            long long v9 = *v18;
            long long v10 = v18[2];
            v17[1] = v18[1];
            v17[2] = v10;
            *char v17 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1B8F21884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F218EC()
{
  swift_release();
  swift_bridgeObjectRelease();
  if ((*(unsigned __int8 *)(v0 + 80) | 2) == 2) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  }
  return MEMORY[0x1F4186498](v0, 81, 7);
}

uint64_t sub_1B8F21944()
{
  return sub_1B8F1FB48(v0[2], v0[3], v0[4], (uint64_t)(v0 + 5));
}

unint64_t sub_1B8F21964(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4918);
  long long v2 = (void *)sub_1B8F57BF0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1B8F22A50(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1B8F21A80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C3310);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    id v8 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4910);
  uint64_t v7 = sub_1B8F57BF0();
  id v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  char v10 = &v6[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_1B8F23B7C(v13, (uint64_t)v6, &qword_1EB9C3310);
    unint64_t result = sub_1B8F22AC8((uint64_t)v6);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = sub_1B8F57B90();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v6, v19);
    unint64_t result = (unint64_t)sub_1B8F122C0(v10, (_OWORD *)(v8[7] + 32 * v17));
    uint64_t v20 = v8[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id AAFTimedAnalyticsEvent.__allocating_init(eventName:initialData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1B8F57380();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (char *)objc_allocWithZone(v3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(&v12[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime], 1, 1, v7);
  uint64_t v13 = &v12[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
  *(void *)uint64_t v13 = a1;
  *((void *)v13 + 1) = a2;
  *(void *)&v12[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData] = a3;
  uint64_t v14 = v12;
  sub_1B8F57370();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v14[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_startTime], v11, v7);

  v16.receiver = v14;
  v16.super_class = v3;
  return objc_msgSendSuper2(&v16, sel_init);
}

id AAFTimedAnalyticsEvent.init(eventName:initialData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1B8F57380();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(&v3[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime], 1, 1, v7);
  unint64_t v12 = &v3[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
  *(void *)unint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  *(void *)&v3[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData] = a3;
  uint64_t v13 = v3;
  sub_1B8F57370();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v13[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_startTime], v11, v7);

  uint64_t v14 = (objc_class *)type metadata accessor for AAFTimedAnalyticsEvent();
  v16.receiver = v13;
  v16.super_class = v14;
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t type metadata accessor for AAFTimedAnalyticsEvent()
{
  uint64_t result = qword_1E9EF3AB0;
  if (!qword_1E9EF3AB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B8F21F88()
{
  unsigned int v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t *v1 = sub_1B8F22008(v3, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8F22008(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_1B8F24424(a1, (uint64_t)sub_1B8F2470C, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

id sub_1B8F22094(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a3 + 16))
  {
    uint64_t v6 = (uint64_t *)(v4 + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData);
    swift_beginAccess();
    uint64_t v7 = *v6;
    swift_bridgeObjectRetain();
    uint64_t v8 = swift_bridgeObjectRetain();
    *uint64_t v6 = sub_1B8F22008(v8, v7);
    swift_bridgeObjectRelease();
  }
  if (a2)
  {
    uint64_t v9 = qword_1E9EF3D38;
    id v10 = a2;
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v12 = qword_1E9EF7330;
    uint64_t v11 = *(void *)algn_1E9EF7338;
    swift_bridgeObjectRetain();
    id result = objc_msgSend(v10, sel_domain);
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v14 = (uint64_t)result;
    uint64_t v15 = (uint64_t *)(v4 + OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = *v15;
    *uint64_t v15 = 0x8000000000000000;
    sub_1B8F23738(v14, v12, v11, isUniquelyReferenced_nonNull_native);
    *uint64_t v15 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (qword_1E9EF3D40 != -1) {
      swift_once();
    }
    uint64_t v17 = qword_1E9EF7340;
    uint64_t v18 = *(void *)algn_1E9EF7348;
    swift_bridgeObjectRetain();
    objc_msgSend(v10, sel_code);
    uint64_t v19 = sub_1B8F57810();
    swift_beginAccess();
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = *v15;
    *uint64_t v15 = 0x8000000000000000;
    sub_1B8F23738(v19, v17, v18, v20);
    *uint64_t v15 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4908);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F59040;
  if (qword_1E9EF3D30 != -1) {
    swift_once();
  }
  uint64_t v22 = *(void *)algn_1E9EF7328;
  *(void *)(inited + 32) = qword_1E9EF7320;
  *(void *)(inited + 40) = v22;
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = sub_1B8F576D0();
  unint64_t v23 = sub_1B8F21964(inited);
  sub_1B8F22378(v23);
  return (id)swift_bridgeObjectRelease();
}

void sub_1B8F22378(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B8F57380();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3AC0);
  uint64_t v11 = MEMORY[0x1F4188790](v9 - 8, v10);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v14);
  objc_super v16 = (char *)&v42 - v15;
  uint64_t v17 = (uint64_t)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_endTime];
  swift_beginAccess();
  sub_1B8F23B7C(v17, (uint64_t)v16, &qword_1E9EF3AC0);
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v16, 1, v4);
  sub_1B8F238A8((uint64_t)v16);
  if (v18 == 1)
  {
    if (*(void *)(a1 + 16))
    {
      uint64_t v19 = (uint64_t *)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData];
      swift_beginAccess();
      uint64_t v20 = *v19;
      swift_bridgeObjectRetain();
      uint64_t v21 = swift_bridgeObjectRetain();
      *uint64_t v19 = sub_1B8F22008(v21, v20);
      swift_bridgeObjectRelease();
    }
    sub_1B8F57370();
    unint64_t v22 = sub_1B8F57360();
    if (v22 < sub_1B8F57360())
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v13, v8, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
      swift_beginAccess();
      sub_1B8F23908((uint64_t)v13, v17);
      swift_endAccess();
      if (qword_1E9EF3D28 == -1)
      {
LABEL_6:
        uint64_t v23 = qword_1E9EF7310;
        uint64_t v24 = *(void *)algn_1E9EF7318;
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_1B8F577D0();
        uint64_t v26 = (void **)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventData];
        swift_beginAccess();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v43 = *v26;
        *uint64_t v26 = (void *)0x8000000000000000;
        sub_1B8F23738(v25, v23, v24, isUniquelyReferenced_nonNull_native);
        *uint64_t v26 = v43;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        uint64_t v28 = *(void *)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
        os_log_type_t v29 = *(void **)&v2[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName + 8];
        v30._rawValue = *v26;
        uint64_t v31 = qword_1E9EF3D20;
        swift_bridgeObjectRetain();
        if (v31 != -1) {
          swift_once();
        }
        uint64_t v44 = qword_1E9EF48C8;
        id v32 = (id)qword_1E9EF48C8;
        v33._uint64_t countAndFlagsBits = v28;
        v33._object = v29;
        AAFAnalytics.sendAnalyticsEvent(eventName:eventData:)(v33, v30);
        swift_bridgeObjectRelease();

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        return;
      }
    }
    swift_once();
    goto LABEL_6;
  }
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_1B8F572D0();
  __swift_project_value_buffer(v34, (uint64_t)qword_1EB9C4218);
  uint64_t v35 = v2;
  __int16 v36 = sub_1B8F572B0();
  os_log_type_t v37 = sub_1B8F57870();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v45[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v40 = *(void *)&v35[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName];
    unint64_t v41 = *(void *)&v35[OBJC_IVAR____TtC18AAAFoundationSwift22AAFTimedAnalyticsEvent_eventName + 8];
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_1B8F20904(v40, v41, v45);
    sub_1B8F579A0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B8F03000, v36, v37, "Analytics Event (%s) called complete after already completing", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9D0800](v39, -1, -1);
    MEMORY[0x1BA9D0800](v38, -1, -1);
  }
  else
  {
  }
}

id AAFTimedAnalyticsEvent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AAFTimedAnalyticsEvent.init()()
{
}

id AAFTimedAnalyticsEvent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAFTimedAnalyticsEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B8F22A50(uint64_t a1, uint64_t a2)
{
  sub_1B8F58180();
  sub_1B8F57450();
  uint64_t v4 = sub_1B8F581A0();
  return sub_1B8F23C50(a1, a2, v4);
}

unint64_t sub_1B8F22AC8(uint64_t a1)
{
  sub_1B8F57B90();
  uint64_t v2 = sub_1B8F57430();
  return sub_1B8F23D34(a1, v2);
}

uint64_t sub_1B8F22B2C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C32E0);
  char v37 = a2;
  uint64_t v6 = sub_1B8F57BE0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    unint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 48 * v17);
    if (v37)
    {
      sub_1B8F2158C(v25, v38);
    }
    else
    {
      sub_1B8F215D4((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1B8F58180();
    sub_1B8F57450();
    uint64_t result = sub_1B8F581A0();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = (uint64_t)sub_1B8F2158C(v38, (_OWORD *)(*(void *)(v7 + 56) + 48 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B8F22E54(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9EF4920);
  char v36 = a2;
  uint64_t v6 = sub_1B8F57BE0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1B8F58180();
    sub_1B8F57450();
    uint64_t result = sub_1B8F581A0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B8F2316C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4918);
  char v38 = a2;
  uint64_t v6 = sub_1B8F57BE0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1B8F58180();
    sub_1B8F57450();
    uint64_t result = sub_1B8F581A0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1B8F2347C(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1B8F22A50(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1B8F23ECC();
      goto LABEL_7;
    }
    sub_1B8F22B2C(v15, a4 & 1);
    unint64_t v21 = sub_1B8F22A50(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1B8F58100();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 48 * v12;
    return sub_1B8F248EC((uint64_t)a1, v19);
  }
LABEL_13:
  sub_1B8F23BE0(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F235C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1B8F22A50(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B8F240B8();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1B8F22E54(v15, a4 & 1);
  unint64_t v21 = sub_1B8F22A50(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1B8F58100();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v26;
  return swift_bridgeObjectRetain();
}

void sub_1B8F23738(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1B8F22A50(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1B8F24270();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1B8F2316C(v15, a4 & 1);
  unint64_t v20 = sub_1B8F22A50(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1B8F58100();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t sub_1B8F238A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3AC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B8F23908(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F23970()
{
  return type metadata accessor for AAFTimedAnalyticsEvent();
}

void sub_1B8F23978()
{
  sub_1B8F57380();
  if (v0 <= 0x3F)
  {
    sub_1B8F23B24();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AAFTimedAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AAFTimedAnalyticsEvent);
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.__allocating_init(eventName:initialData:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.appendEvent(data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.completeEvent(withSuccess:error:additionalData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AAFTimedAnalyticsEvent.completeEvent(data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

void sub_1B8F23B24()
{
  if (!qword_1E9EF3AC8)
  {
    sub_1B8F57380();
    unint64_t v0 = sub_1B8F57980();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9EF3AC8);
    }
  }
}

uint64_t sub_1B8F23B7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1B8F23BE0(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1B8F2158C(a4, (_OWORD *)(a5[7] + 48 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_1B8F23C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B8F57EE0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B8F57EE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1B8F23D34(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = a1;
  uint64_t v4 = sub_1B8F57B90();
  MEMORY[0x1F4188790](v4, v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v2;
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  uint64_t v21 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    BOOL v14 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v12 = v6 + 16;
    uint64_t v13 = v14;
    uint64_t v15 = *(void *)(v12 + 56);
    char v16 = (void (**)(char *, uint64_t))(v12 - 8);
    do
    {
      uint64_t v17 = v12;
      v13(v8, *(void *)(v23 + 48) + v15 * v10, v4);
      char v18 = sub_1B8F574B0();
      (*v16)(v8, v4);
      if (v18) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      uint64_t v12 = v17;
    }
    while (((*(void *)(v21 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_1B8F23ECC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C32E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B8F57BD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 48 * v15;
    sub_1B8F215D4(*(void *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_1B8F2158C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1B8F240B8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9EF4920);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B8F57BD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1B8F24270()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4918);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B8F57BD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B8F24424(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B8F24758();
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  int64_t v13 = (void *)*a5;
  unint64_t v15 = sub_1B8F22A50(v7, v8);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      int64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_1B8F24270();
      int64_t v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v25 = (uint64_t *)(v22[6] + 16 * v15);
    *uint64_t v25 = v10;
    v25[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v28;
LABEL_13:
    sub_1B8F24758();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = v31;
      do
      {
        uint64_t v40 = (void *)*a5;
        unint64_t v42 = sub_1B8F22A50(v32, v33);
        uint64_t v43 = v40[2];
        BOOL v44 = (v41 & 1) == 0;
        uint64_t v45 = v43 + v44;
        if (__OFADD__(v43, v44)) {
          goto LABEL_25;
        }
        char v46 = v41;
        if (v40[3] < v45)
        {
          sub_1B8F2316C(v45, 1);
          unint64_t v47 = sub_1B8F22A50(v32, v33);
          if ((v46 & 1) != (v48 & 1)) {
            goto LABEL_27;
          }
          unint64_t v42 = v47;
        }
        uint64_t v49 = (void *)*a5;
        if (v46)
        {
          swift_bridgeObjectRelease();
          uint64_t v35 = v49[7];
          uint64_t v36 = 8 * v42;

          *(void *)(v35 + v36) = v34;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          uint64_t v50 = (uint64_t *)(v49[6] + 16 * v42);
          *uint64_t v50 = v32;
          v50[1] = v33;
          *(void *)(v49[7] + 8 * v42) = v34;
          uint64_t v51 = v49[2];
          BOOL v27 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v27) {
            goto LABEL_26;
          }
          v49[2] = v52;
        }
        sub_1B8F24758();
        uint64_t v32 = v37;
        uint64_t v33 = v38;
        uint64_t v34 = v39;
      }
      while (v38);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1B8F096C0();
    return swift_release();
  }
  sub_1B8F2316C(v18, a4 & 1);
  unint64_t v20 = sub_1B8F22A50(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    int64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v23 = v22[7];
    uint64_t v24 = 8 * v15;

    *(void *)(v23 + v24) = v12;
    goto LABEL_13;
  }
LABEL_27:
  uint64_t result = sub_1B8F58100();
  __break(1u);
  return result;
}

id sub_1B8F2470C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  id v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_1B8F24758()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    void v20[2] = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    char v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          int64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            int64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            int64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  int64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_1B8F248EC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *MessageDispatcher.__allocating_init<A, B>(encoder:decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  uint64_t v8 = sub_1B8F27FB8(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v8;
}

void *MessageDispatcher.init<A, B>(encoder:decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B8F27FB8(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  return v8;
}

uint64_t *sub_1B8F24AD4(uint64_t a1, uint64_t a2)
{
  return sub_1B8F25E1C(a1, a2);
}

uint64_t sub_1B8F24B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = v3[5];
  uint64_t v9 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, *(void *)(v7 + 80), *(void *)(v7 + 88), v8, v9);
}

uint64_t sub_1B8F24BCC(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = *v2;
  return MEMORY[0x1F4188298](sub_1B8F24C18, 0, 0);
}

uint64_t sub_1B8F24C18()
{
  uint64_t v1 = *(void *)(v0 + 40);
  unint64_t v2 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v7 = (char *)&dword_1E9EF41C8 + dword_1E9EF41C8;
  int64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = *(void *)(v1 + 88);
  *int64_t v3 = v0;
  v3[1] = sub_1B8F24D08;
  uint64_t v5 = *(void *)(v0 + 16);
  return ((uint64_t (*)(uint64_t, void, void, uint64_t (*)(uint64_t), int8x16_t *, uint64_t))v7)(v5, 0, 0, sub_1B8F2816C, v2, v4);
}

uint64_t sub_1B8F24D08()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8F24E44, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    int64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B8F24E44()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F24EA8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(v5 + 80);
  *(void *)(v6 + 32) = a1;
  sub_1B8F24B20(a3, (uint64_t)sub_1B8F2904C, v6);
  return swift_release();
}

uint64_t sub_1B8F24F60(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v4);
  return (*(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t))(v5 + 16))(a1, *(void *)(v3 + 80), *(void *)(v3 + 88), v4, v5);
}

uint64_t sub_1B8F2500C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = v5[5];
  uint64_t v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24))(a1, a2, a3, a4, a5, v11, v12);
}

uint64_t sub_1B8F25098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *v7;
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = (void *)swift_allocObject();
  long long v16[2] = *(void *)(v14 + 80);
  v16[3] = *(void *)(v14 + 88);
  v16[4] = a5;
  v16[5] = a6;
  void v16[6] = a7;
  v16[7] = v15;
  v16[8] = a2;
  v16[9] = a3;
  uint64_t v17 = v7[5];
  uint64_t v18 = v7[6];
  swift_retain();
  swift_retain();
  __swift_project_boxed_opaque_existential_1(v7 + 2, v17);
  (*(void (**)(uint64_t, uint64_t (*)(uint64_t, void (*)(uint64_t *), uint64_t), void *, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 24))(a1, sub_1B8F281B0, v16, a5, a7, v17, v18);
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F251F0(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v10 = sub_1B8F581B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  uint64_t v14 = (uint64_t *)((char *)&v17 - v13);
  swift_beginAccess();
  if (MEMORY[0x1BA9D08C0](a4 + 16))
  {
    uint64_t v15 = (void (*)(uint64_t, void (*)(void), uint64_t))a5();
    v15(a1, (void (*)(void))a2, a3);
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    sub_1B8F28FE8();
    uint64_t *v14 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    a2(v14);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v11 + 8))(v14, v10);
  }
}

uint64_t sub_1B8F253B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *v7;
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v16 = (void *)swift_allocObject();
  long long v16[2] = *(void *)(v14 + 80);
  v16[3] = *(void *)(v14 + 88);
  v16[4] = a5;
  v16[5] = a6;
  void v16[6] = a7;
  v16[7] = v15;
  v16[8] = a2;
  v16[9] = a3;
  swift_retain();
  swift_retain();
  sub_1B8F2586C(a1, (uint64_t)&unk_1E9EF4938, (uint64_t)v16, a5, a7);
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F254E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  return MEMORY[0x1F4188298](sub_1B8F2550C, 0, 0);
}

uint64_t sub_1B8F2550C()
{
  uint64_t v1 = *(void *)(v0 + 56) + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1BA9D08C0](v1);
  *(void *)(v0 + 80) = v2;
  if (v2)
  {
    uint64_t v3 = (int *)(*(uint64_t (**)(void))(v0 + 64))();
    *(void *)(v0 + 88) = v4;
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v3 + *v3);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v5;
    void *v5 = v0;
    v5[1] = sub_1B8F25680;
    uint64_t v6 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 48);
    return v10(v6, v7);
  }
  else
  {
    sub_1B8F28FE8();
    swift_allocError();
    swift_willThrow();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_1B8F25680()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F25800;
  }
  else {
    uint64_t v2 = sub_1B8F25794;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F25794()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F25800()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F2586C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *v5;
  uint64_t v11 = v5[5];
  uint64_t v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v10 + 80);
  v13[3] = *(void *)(v10 + 88);
  v13[4] = a4;
  v13[5] = a5;
  v13[6] = a2;
  v13[7] = a3;
  uint64_t v14 = *(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t), void *, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 24);
  swift_retain();
  v14(a1, sub_1B8F2832C, v13, a4, a5, v11, v12);
  return swift_release();
}

uint64_t sub_1B8F2598C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v28 = a7;
  uint64_t v29 = a4;
  uint64_t v27 = a2;
  uint64_t v14 = *(void *)(a8 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C36C0);
  MEMORY[0x1F4188790](v17 - 8, v18);
  unint64_t v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1B8F57740();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, a8);
  unint64_t v22 = (*(unsigned __int8 *)(v14 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  uint64_t v24 = v28;
  *((void *)v23 + 4) = a6;
  *((void *)v23 + 5) = v24;
  *((void *)v23 + 6) = a8;
  *((void *)v23 + 7) = a9;
  *((void *)v23 + 8) = v27;
  *((void *)v23 + 9) = a3;
  *((void *)v23 + 10) = v29;
  *((void *)v23 + 11) = a5;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v23[v22], v16, a8);
  swift_retain();
  swift_retain();
  sub_1B8F07C44((uint64_t)v20, (uint64_t)&unk_1E9EF4A50, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_1B8F25B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a4;
  v8[3] = a5;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v11 = sub_1B8F581B0();
  v8[4] = v11;
  v8[5] = *(void *)(v11 - 8);
  v8[6] = swift_task_alloc();
  uint64_t v12 = swift_task_alloc();
  v8[7] = v12;
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)a6 + *a6);
  uint64_t v13 = (void *)swift_task_alloc();
  v8[8] = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_1B8F107E4;
  return v15(v12, a8);
}

uint64_t sub_1B8F25D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = v5[5];
  uint64_t v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 32))(a1, a2, a3, a4, a5, v11, v12);
}

uint64_t MessageDispatcher.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t MessageDispatcher.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t *sub_1B8F25E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 128);
  uint64_t v7 = *(void *)(*v2 + 88);
  swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v5 + 80);
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  sub_1B8F581B0();
  swift_getFunctionTypeMetadata1();
  swift_getFunctionTypeMetadata2();
  *(uint64_t *)((char *)v2 + v6) = sub_1B8F57680();
  uint64_t v9 = *(void *)(*v2 + 136);
  swift_getFunctionTypeMetadata1();
  *(uint64_t *)((char *)v2 + v9) = sub_1B8F57680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))((uint64_t)v2 + *(void *)(*v2 + 112), a1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))((uint64_t)v2 + *(void *)(*v2 + 120), a2, v7);
  return v2;
}

uint64_t sub_1B8F26044(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v74 = a3;
  v75 = a2;
  uint64_t v72 = a1;
  uint64_t v8 = (void *)*v5;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v70 = a5;
  uint64_t v9 = sub_1B8F581B0();
  uint64_t v58 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v10);
  uint64_t v12 = (uint64_t *)((char *)&v54 - v11);
  uint64_t v13 = v8[13];
  uint64_t v68 = v8[11];
  uint64_t v69 = v13;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v80 = *(char **)(AssociatedTypeWitness - 8);
  uint64_t v16 = MEMORY[0x1F4188790](AssociatedTypeWitness, v15);
  v71 = (char *)&v54 - v17;
  uint64_t v73 = a4;
  uint64_t v18 = *(void *)(a4 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v16, v19);
  unint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20, v23);
  long long v67 = (char *)&v54 - v24;
  uint64_t v25 = (void *)((char *)v5 + v8[16]);
  swift_beginAccess();
  uint64_t v26 = *v25;
  uint64_t v27 = AssociatedTypeWitness;
  uint64_t v28 = v8[10];
  uint64_t v66 = v8[12];
  uint64_t v65 = v28;
  swift_getAssociatedTypeWitness();
  sub_1B8F581B0();
  swift_getFunctionTypeMetadata1();
  FunctionTypeMetadata2 = swift_getFunctionTypeMetadata2();
  uint64_t v30 = swift_bridgeObjectRetain();
  uint64_t v31 = (void (**)(void, void, void))(v18 + 16);
  if (MEMORY[0x1BA9CF480](v30, FunctionTypeMetadata2))
  {
    uint64_t v55 = v22;
    uint64_t v56 = v12;
    uint64_t v57 = v9;
    uint64_t v32 = 0;
    uint64_t v63 = (uint64_t (**)(char *, uint64_t))(v80 + 8);
    uint64_t v33 = v26 + 40;
    uint64_t v64 = v26;
    uint64_t v61 = v31;
    uint64_t v60 = FunctionTypeMetadata2;
    uint64_t v62 = v27;
    while (1)
    {
      char v34 = sub_1B8F57690();
      sub_1B8F57670();
      if ((v34 & 1) == 0) {
        break;
      }
      v80 = *(char **)(v33 - 8);
      BOOL v35 = __OFADD__(v32, 1);
      uint64_t result = swift_retain();
      if (v35) {
        goto LABEL_15;
      }
      uint64_t v76 = v32 + 1;
      uint64_t v77 = v33;
      uint64_t v78 = v32;
      uint64_t v37 = v73;
      uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))*v31;
      v59(v67, v72, v73);
      swift_dynamicCast();
      uint64_t v38 = (void *)swift_allocObject();
      uint64_t v39 = v65;
      uint64_t v41 = v68;
      uint64_t v40 = v69;
      v38[2] = v65;
      long long v38[3] = v41;
      uint64_t v42 = v70;
      v38[4] = v37;
      v38[5] = v42;
      v79 = 0;
      uint64_t v43 = v66;
      v38[6] = v66;
      v38[7] = v40;
      uint64_t v44 = v74;
      v38[8] = v75;
      v38[9] = v44;
      uint64_t v45 = (void *)swift_allocObject();
      v45[2] = v39;
      uint64_t v45[3] = v41;
      v45[4] = v37;
      v45[5] = v42;
      char v46 = v71;
      v45[6] = v43;
      v45[7] = v40;
      v45[8] = sub_1B8F28D78;
      v45[9] = v38;
      v81[0] = sub_1B8F28DAC;
      v81[1] = v45;
      swift_retain();
      swift_retain();
      unint64_t v47 = v79;
      ((void (*)(char *, void *))v80)(v46, v81);
      if (!v47)
      {
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        return (*v63)(v46, v62);
      }
      swift_release();
      swift_release();
      swift_release();
      (*v63)(v46, v62);

      uint64_t v48 = MEMORY[0x1BA9CF480](v64, v60);
      uint64_t v32 = v78 + 1;
      uint64_t v33 = v77 + 16;
      uint64_t v31 = v61;
      if (v76 == v48)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = v57;
        uint64_t v49 = v58;
        uint64_t v12 = v56;
        unint64_t v22 = v55;
        uint64_t v50 = v59;
        goto LABEL_12;
      }
    }
    uint64_t result = sub_1B8F57A50();
    __break(1u);
LABEL_15:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v50 = (void (*)(char *, uint64_t, uint64_t))*v31;
    uint64_t v49 = v58;
LABEL_12:
    uint64_t v51 = v73;
    v50(v22, v72, v73);
    type metadata accessor for MessagingError.NoAvailableHandler();
    swift_getWitnessTable();
    uint64_t v52 = swift_allocError();
    sub_1B8F49538((uint64_t)v22, v51, v53);
    *uint64_t v12 = v52;
    swift_storeEnumTagMultiPayload();
    v75(v12);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v49 + 8))(v12, v9);
  }
  return result;
}

uint64_t sub_1B8F266E8(uint64_t a1, void (*a2)(char *))
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v4 = sub_1B8F581B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v14 - v7;
  swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_1B8F581B0();
  MEMORY[0x1F4188790](v9, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v14 - v11, a1, v9);
  swift_dynamicCast();
  a2(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

void sub_1B8F268D0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v50 = a1;
  uint64_t v10 = *v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v14 = MEMORY[0x1F4188790](AssociatedTypeWitness, v13);
  uint64_t v53 = (char *)v42 - v15;
  uint64_t v51 = a2;
  uint64_t v16 = *(void *)(a2 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v14, v17);
  uint64_t v43 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v20);
  uint64_t v48 = (char *)v42 - v21;
  uint64_t v22 = swift_getAssociatedTypeWitness();
  MEMORY[0x1F4188790](v22, v23);
  uint64_t v49 = (char *)v42 - v24;
  uint64_t v25 = (uint64_t *)((char *)v4 + *(void *)(v10 + 136));
  swift_beginAccess();
  uint64_t v26 = *v25;
  v42[2] = v22;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  uint64_t v28 = swift_bridgeObjectRetain();
  uint64_t v29 = (void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  if (MEMORY[0x1BA9CF480](v28, FunctionTypeMetadata1))
  {
    v42[0] = a4;
    v42[1] = a3;
    uint64_t v30 = 0;
    char v46 = (void (**)(char *, uint64_t))(v12 + 8);
    unint64_t v47 = v29;
    uint64_t v31 = v26 + 40;
    uint64_t v45 = v26;
    while (1)
    {
      char v32 = sub_1B8F57690();
      sub_1B8F57670();
      if ((v32 & 1) == 0) {
        break;
      }
      uint64_t v33 = *(void (**)(char *))(v31 - 8);
      BOOL v34 = __OFADD__(v30, 1);
      swift_retain();
      if (v34) {
        goto LABEL_17;
      }
      uint64_t v52 = v30 + 1;
      uint64_t v44 = *v47;
      v44(v48, v50, v51);
      BOOL v35 = v53;
      swift_dynamicCast();
      v33(v35);
      if (!v6)
      {
        swift_release();
        swift_bridgeObjectRelease();
        (*v46)(v35, AssociatedTypeWitness);
        swift_dynamicCast();
        return;
      }
      swift_release();
      (*v46)(v35, AssociatedTypeWitness);
      id v54 = v6;
      id v36 = v6;
      __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
      if ((swift_dynamicCast() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        return;
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      uint64_t v37 = MEMORY[0x1BA9CF480](v45, FunctionTypeMetadata1);
      uint64_t v6 = 0;
      ++v30;
      v31 += 16;
      if (v52 == v37)
      {
        swift_bridgeObjectRelease();
        uint64_t v39 = (uint64_t)v43;
        uint64_t v38 = (void (*)(uint64_t, uint64_t, uint64_t))v44;
        goto LABEL_13;
      }
    }
    sub_1B8F57A50();
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v38 = (void (*)(uint64_t, uint64_t, uint64_t))*v29;
    uint64_t v39 = (uint64_t)v43;
LABEL_13:
    uint64_t v40 = v51;
    v38(v39, v50, v51);
    type metadata accessor for MessagingError.NoAvailableHandler();
    swift_getWitnessTable();
    swift_allocError();
    sub_1B8F49538(v39, v40, v41);
    swift_willThrow();
  }
}

uint64_t sub_1B8F26DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a4;
  uint64_t v31 = a5;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v6 = *(void **)v5;
  uint64_t v7 = *(void *)(*(void *)v5 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v11 = (char *)&v27 - v10;
  uint64_t v29 = (char *)&v27 - v10;
  uint64_t v27 = v6[11];
  uint64_t v12 = *(void *)(v27 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v9, v14);
  uint64_t v28 = (char *)&v27 - v15;
  uint64_t v16 = v5 + v6[14];
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)&v27 - v15, v5 + v6[15]);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v16, v7);
  unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v18 = (v13 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (*(unsigned __int8 *)(v8 + 80) + v18 + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  uint64_t v22 = v27;
  uint64_t v21 = v28;
  *((void *)v20 + 2) = v7;
  *((void *)v20 + 3) = v22;
  *((void *)v20 + 4) = v30;
  uint64_t v30 = v6[12];
  *((void *)v20 + 5) = v30;
  uint64_t v23 = v31;
  *((void *)v20 + 6) = v6[13];
  *((void *)v20 + 7) = v23;
  (*(void (**)(char *, char *))(v12 + 32))(&v20[v17], v21);
  uint64_t v24 = &v20[v18];
  uint64_t v25 = v33;
  *(void *)uint64_t v24 = v32;
  *((void *)v24 + 1) = v25;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v20[v19], v29, v7);
  BOOL v34 = sub_1B8F28A30;
  BOOL v35 = v20;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  sub_1B8F581B0();
  swift_getFunctionTypeMetadata1();
  swift_getFunctionTypeMetadata2();
  sub_1B8F576C0();
  sub_1B8F576A0();
  return swift_endAccess();
}

uint64_t sub_1B8F27170(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t (*)(uint64_t a1), char *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v37 = a6;
  uint64_t v43 = a5;
  uint64_t v44 = a4;
  uint64_t v47 = a1;
  uint64_t v48 = a3;
  uint64_t v46 = a11;
  uint64_t v41 = *(void *)(a7 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](a1, a2);
  v36[1] = v15;
  uint64_t v45 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = *(void *)(a9 - 8);
  MEMORY[0x1F4188790](v14, v16);
  unint64_t v18 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *v19;
  uint64_t v21 = v19[1];
  uint64_t v22 = (void *)swift_allocObject();
  uint64_t v39 = a12;
  uint64_t v40 = a7;
  v22[2] = a7;
  long long v22[3] = a8;
  v22[4] = a9;
  v22[5] = a10;
  uint64_t v38 = a10;
  uint64_t v23 = v46;
  v22[6] = v46;
  v22[7] = a12;
  v22[8] = v20;
  v22[9] = v21;
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 16);
  uint64_t v25 = *(void *)(a12 + 8);
  swift_retain();
  uint64_t v26 = v25;
  uint64_t v27 = v49;
  uint64_t v49 = a8;
  v24(a9, v47, a9, v26, a8, v23);
  if (v27) {
    return swift_release();
  }
  uint64_t v29 = v40;
  uint64_t v30 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v45, v37, v40);
  unint64_t v31 = (*(unsigned __int8 *)(v30 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v32 = (char *)swift_allocObject();
  uint64_t v33 = v49;
  *((void *)v32 + 2) = v29;
  *((void *)v32 + 3) = v33;
  uint64_t v34 = v38;
  *((void *)v32 + 4) = a9;
  *((void *)v32 + 5) = v34;
  uint64_t v35 = v39;
  *((void *)v32 + 6) = v23;
  *((void *)v32 + 7) = v35;
  *((void *)v32 + 8) = sub_1B8F28B3C;
  *((void *)v32 + 9) = v22;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v32[v31], v45, v29);
  v44(v18, sub_1B8F28C28, v32);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v18, a9);
}

uint64_t sub_1B8F2742C(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v25 = a6;
  uint64_t v26 = a7;
  uint64_t v28 = a3;
  uint64_t v29 = a2;
  uint64_t v27 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v14 = sub_1B8F581B0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14, v16);
  unint64_t v18 = (char *)&v24 - v17;
  unint64_t v19 = sub_1B8F275F0(a4, a5, v25, v26, a8, a9, a10);
  uint64_t v21 = v20;
  swift_getAssociatedTypeWitness();
  uint64_t v22 = sub_1B8F581B0();
  Result<>.foundation_tryMap<A>(_:)((uint64_t)v19, v21, v22, AssociatedTypeWitness, (uint64_t)v18);
  swift_release();
  v29(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

uint64_t (*sub_1B8F275F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t a1)
{
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](a1, a1);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v15);
  unint64_t v16 = (*(unsigned __int8 *)(v13 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = a2;
  *((void *)v17 + 3) = a3;
  *((void *)v17 + 4) = a4;
  *((void *)v17 + 5) = a5;
  *((void *)v17 + 6) = a6;
  *((void *)v17 + 7) = a7;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v17[v16], v15, a2);
  return sub_1B8F28D1C;
}

uint64_t sub_1B8F27738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a6 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return v11(a1, AssociatedTypeWitness, AssociatedConformanceWitness, a3, a6);
}

uint64_t sub_1B8F27810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v32 = a4;
  uint64_t v33 = a5;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v6 = *(void **)v5;
  uint64_t v7 = *(void *)(*(void *)v5 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v12 = (char *)&v29 - v11;
  unint64_t v31 = (char *)&v29 - v11;
  uint64_t v30 = v6[11];
  uint64_t v13 = *(void *)(v30 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x1F4188790](v10, v15);
  uint64_t v17 = (char *)&v29 - v16;
  uint64_t v18 = v5 + v6[14];
  (*(void (**)(char *, uint64_t))(v13 + 16))((char *)&v29 - v16, v5 + v6[15]);
  uint64_t v19 = v18;
  uint64_t v20 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, v19, v7);
  unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v22 = (v14 + *(unsigned __int8 *)(v8 + 80) + v21) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = (char *)swift_allocObject();
  uint64_t v24 = v30;
  *((void *)v23 + 2) = v20;
  *((void *)v23 + 3) = v24;
  *((void *)v23 + 4) = v32;
  uint64_t v32 = v6[12];
  *((void *)v23 + 5) = v32;
  uint64_t v25 = v33;
  *((void *)v23 + 6) = v6[13];
  *((void *)v23 + 7) = v25;
  (*(void (**)(char *, char *))(v13 + 32))(&v23[v21], v17);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v23[v22], v31, v20);
  uint64_t v26 = &v23[(v9 + v22 + 7) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v27 = v35;
  *(void *)uint64_t v26 = v34;
  *((void *)v26 + 1) = v27;
  id v36 = sub_1B8F28820;
  uint64_t v37 = v23;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  sub_1B8F576C0();
  swift_retain();
  sub_1B8F576A0();
  return swift_endAccess();
}

uint64_t sub_1B8F27B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void (*a3)(char *)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v27 = a5;
  uint64_t v28 = a8;
  uint64_t v29 = a4;
  uint64_t v30 = a3;
  v25[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = MEMORY[0x1F4188790](AssociatedTypeWitness, v15);
  unint64_t v31 = (char *)v25 - v17;
  uint64_t v18 = *(void *)(a7 - 8);
  MEMORY[0x1F4188790](v16, v19);
  unint64_t v21 = (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v32;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(a10 + 16))(a7, a1, a7, *(void *)(a11 + 8), a6, a10);
  if (!v22)
  {
    uint64_t v32 = v18;
    v30(v21);
    uint64_t v30 = *(void (**)(char *))(a9 + 16);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    ((void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))v30)(v31, AssociatedTypeWitness, AssociatedConformanceWitness, v27, a9);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, AssociatedTypeWitness);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v21, a7);
  }
  return result;
}

uint64_t *sub_1B8F27DD0()
{
  uint64_t v1 = *v0;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v0 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 112));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 120));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B8F27ED4()
{
  uint64_t v0 = sub_1B8F27DD0();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B8F27F28(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F26044(a1, a2, a3, a4, a5);
}

void sub_1B8F27F4C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
}

uint64_t sub_1B8F27F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F26DD0(a1, a2, a3, a4, a5);
}

uint64_t sub_1B8F27F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F27810(a1, a2, a3, a4, a5);
}

void *sub_1B8F27FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v11, v16);
  uint64_t v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = v19;
  v26[1] = v20;
  v26[2] = v21;
  long long v26[3] = v22;
  uint64_t v23 = type metadata accessor for InternalMessageDispatcher();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, a4);
  swift_allocObject();
  uint64_t v24 = sub_1B8F25E1C((uint64_t)v18, (uint64_t)v13);
  v5[5] = v23;
  v5[6] = &off_1F12BE208;
  v5[2] = v24;
  return v5;
}

uint64_t sub_1B8F2816C(uint64_t a1)
{
  return sub_1B8F24EA8(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1B8F28174()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F281B0(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3)
{
  return sub_1B8F251F0(a1, a2, a3, *(void *)(v3 + 56), *(uint64_t (**)(void))(v3 + 64));
}

uint64_t objectdestroy_4Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1B8F2822C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 72);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v2 + 56);
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_1B8F09BDC;
  *(void *)(v7 + 72) = v6;
  *(_OWORD *)(v7 + 56) = v8;
  *(void *)(v7 + 40) = a1;
  *(void *)(v7 + 48) = a2;
  return MEMORY[0x1F4188298](sub_1B8F2550C, 0, 0);
}

uint64_t sub_1B8F282F4()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B8F2832C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F2598C(a1, a2, a3, v3[6], v3[7], v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_1B8F2835C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MessageDispatcher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for MessageDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessageDispatcher);
}

uint64_t dispatch thunk of MessageDispatcher.__allocating_init<A, B>(encoder:decoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MessageDispatcher.handleMessage(with:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MessageDispatcher.handleMessage(with:)(uint64_t a1, uint64_t a2)
{
  long long v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 120) + **(int **)(*(void *)v2 + 120));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1B8F08F7C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of MessageDispatcher.handleSyncMessage(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MessageDispatcher.registerHandler<A>(for:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MessageDispatcher.registerHandler<A, B>(for:handler:in:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MessageDispatcher.registerSyncHandler<A>(for:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t sub_1B8F28604()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for InternalMessageDispatcher()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8F28700()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v4 + *(void *)(v2 + 64) + v6) & ~v6;
  uint64_t v8 = v3 | v6 | 7;
  unint64_t v9 = ((*(void *)(v5 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t))(v2 + 8))(v0 + v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v7, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v9, v8);
}

uint64_t sub_1B8F28820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2[2];
  unint64_t v4 = (((*(unsigned __int8 *)(*(void *)(v2[3] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[3] - 8) + 80))
      + *(void *)(*(void *)(v2[3] - 8) + 64)
      + *(unsigned __int8 *)(*(void *)(v3 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8)
                                                                                                  + 80);
  uint64_t v5 = (char *)v2 + ((*(void *)(*(void *)(v3 - 8) + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1B8F27B70(a1, (uint64_t)v2 + v4, *(void (**)(char *))v5, *((void *)v5 + 1), v3, v2[3], v2[4], a2, v2[5], v2[6], v2[7]);
}

uint64_t sub_1B8F28910()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(*(void *)(v0 + 24) - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = *(void *)(v1 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6;
  unint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v3 | v6 | 7;
  (*(void (**)(uint64_t))(v2 + 8))(v0 + v4);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v7, v1);
  return MEMORY[0x1F4186498](v0, v8, v9);
}

uint64_t sub_1B8F28A30(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[3] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[3] - 8) + 80);
  unint64_t v4 = (*(void *)(*(void *)(v2[3] - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1B8F27170(a1, a2, (uint64_t)v2 + v3, *(void (**)(char *, uint64_t (*)(uint64_t), char *))((char *)v2 + v4), *(uint64_t *)((char *)v2 + v4 + 8), (uint64_t)v2+ ((v4 + *(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80)), v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_1B8F28B04()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1B8F28B3C()
{
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_1B8F28B64()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B8F28C28(uint64_t a1)
{
  return sub_1B8F2742C(a1, *(void (**)(char *))(v1 + 64), *(void *)(v1 + 72), v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80)), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_1B8F28C94()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1B8F28D1C(uint64_t a1)
{
  return sub_1B8F27738(a1, (uint64_t)v1+ ((*(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[2] - 8) + 80)), v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1B8F28D78(uint64_t a1)
{
  return sub_1B8F266E8(a1, *(void (**)(char *))(v1 + 64));
}

uint64_t sub_1B8F28DAC()
{
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t sub_1B8F28DD4()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 96) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B8F28EA8(uint64_t a1)
{
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[8];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[9];
  unint64_t v7 = (int *)v1[10];
  uint64_t v8 = v1[11];
  uint64_t v9 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v1[6] - 8) + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1[6] - 8) + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_1B8F08F7C;
  return sub_1B8F25B98(a1, v5, v3, v4, v6, v7, v8, v9);
}

unint64_t sub_1B8F28FE8()
{
  unint64_t result = qword_1E9EF4A58;
  if (!qword_1E9EF4A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4A58);
  }
  return result;
}

uint64_t sub_1B8F2903C()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F2904C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
  return sub_1B8F3C1B8(a1, v3, v4, v5);
}

uint64_t sub_1B8F290B4()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9C4138);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F59F90;
  *(void *)(inited + 32) = 43;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 48) = 45;
  *(void *)(inited + 56) = 0xE100000000000000;
  *(void *)(inited + 64) = 40;
  *(void *)(inited + 72) = 0xE100000000000000;
  *(void *)(inited + 80) = 41;
  *(void *)(inited + 88) = 0xE100000000000000;
  *(void *)(inited + 96) = 32;
  *(void *)(inited + 104) = 0xE100000000000000;
  uint64_t v1 = (void *)sub_1B8F2A124(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  off_1EB9C4110 = v1;
  return result;
}

id sub_1B8F291B0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_1B8F29268(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

void sub_1B8F292BC(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_1B8F29320())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B8F2940C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C4108);
  MEMORY[0x1F4188790](v4 - 8, v5);
  unint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[0] = sub_1B8F2A2C0();
  v36[1] = v8;
  v35[0] = 0x242A5D392D305B5ELL;
  v35[1] = 0xE800000000000000;
  uint64_t v9 = sub_1B8F57290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  sub_1B8F2A7CC();
  sub_1B8F579C0();
  char v11 = v10;
  sub_1B8F1DBD4((uint64_t)v7, &qword_1EB9C4108);
  swift_bridgeObjectRelease();
  if (v11)
  {
    swift_bridgeObjectRelease();
    if (qword_1EB9C4148 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_1B8F572D0();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EB9C4218);
    swift_bridgeObjectRetain_n();
    uint64_t v23 = sub_1B8F572B0();
    os_log_type_t v24 = sub_1B8F57860();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      v36[0] = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_bridgeObjectRetain();
      v35[0] = sub_1B8F20904(a1, a2, v36);
      sub_1B8F579A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B8F03000, v23, v24, "%s is not a phone number.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9D0800](v26, -1, -1);
      MEMORY[0x1BA9D0800](v25, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (sub_1B8F575A0())
    {
      uint64_t v12 = sub_1B8F2A820();
      if (v13)
      {
        uint64_t v14 = v12;
        unint64_t v15 = v13;
        swift_bridgeObjectRelease();
        if (qword_1EB9C4148 != -1) {
          swift_once();
        }
        uint64_t v16 = sub_1B8F572D0();
        __swift_project_value_buffer(v16, (uint64_t)qword_1EB9C4218);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v17 = sub_1B8F572B0();
        os_log_type_t v18 = sub_1B8F57860();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = swift_slowAlloc();
          uint64_t v20 = swift_slowAlloc();
          v36[0] = v20;
          *(_DWORD *)uint64_t v19 = 136315394;
          swift_bridgeObjectRetain();
          v35[0] = sub_1B8F20904(a1, a2, v36);
          sub_1B8F579A0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v19 + 12) = 2080;
          swift_bridgeObjectRetain();
          v35[0] = sub_1B8F20904(v14, v15, v36);
          sub_1B8F579A0();
          swift_bridgeObjectRelease_n();
          uint64_t v21 = "Formatted an international phone number: %s -> %s.";
LABEL_24:
          _os_log_impl(&dword_1B8F03000, v17, v18, v21, (uint8_t *)v19, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1BA9D0800](v20, -1, -1);
          MEMORY[0x1BA9D0800](v19, -1, -1);

          return v14;
        }
        goto LABEL_25;
      }
    }
    uint64_t v27 = sub_1B8F29BD8();
    if (v28)
    {
      uint64_t v14 = v27;
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      if (qword_1EB9C4148 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_1B8F572D0();
      __swift_project_value_buffer(v30, (uint64_t)qword_1EB9C4218);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v17 = sub_1B8F572B0();
      os_log_type_t v18 = sub_1B8F57860();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        v36[0] = v20;
        *(_DWORD *)uint64_t v19 = 136315394;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B8F20904(a1, a2, v36);
        sub_1B8F579A0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v19 + 12) = 2080;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B8F20904(v14, v29, v36);
        sub_1B8F579A0();
        swift_bridgeObjectRelease_n();
        uint64_t v21 = "Formatted a local phone number: %s -> %s.";
        goto LABEL_24;
      }
LABEL_25:

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      return v14;
    }
    uint64_t v14 = sub_1B8F2A820();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    if (v32)
    {
      if (qword_1EB9C4148 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_1B8F572D0();
      __swift_project_value_buffer(v33, (uint64_t)qword_1EB9C4218);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v17 = sub_1B8F572B0();
      os_log_type_t v18 = sub_1B8F57860();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        v36[0] = v20;
        *(_DWORD *)uint64_t v19 = 136315394;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B8F20904(a1, a2, v36);
        sub_1B8F579A0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v19 + 12) = 2080;
        swift_bridgeObjectRetain();
        v35[0] = sub_1B8F20904(v14, v32, v36);
        sub_1B8F579A0();
        swift_bridgeObjectRelease_n();
        uint64_t v21 = "Formatted a best guest phone number: %s -> %s.";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B8F29BD8()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  CFPhoneNumberGetITUCountryCodeForISOCountryCode();
  sub_1B8F57CD0();
  swift_bridgeObjectRetain();
  sub_1B8F57560();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_1B8F575B0();
  sub_1B8F57540();
  swift_bridgeObjectRelease();
  uint64_t v2 = v8;
  uint64_t v3 = (void *)sub_1B8F574C0();
  if (PNIsValidPhoneNumberForCountry())
  {
    id v4 = *v1;
    uint64_t v5 = (void *)sub_1B8F574C0();
    uint64_t v6 = (void *)PNCreateFormattedStringWithCountry();

    if (v6)
    {
      uint64_t v2 = sub_1B8F574D0();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  return v2;
}

id PhoneNumberFormatter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PhoneNumberFormatter.init()()
{
  uint64_t v1 = sub_1B8F57290();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C4100);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = self;
  char v11 = v0;
  id v12 = objc_msgSend(v10, sel_currentLocale);
  sub_1B8F57250();

  sub_1B8F57280();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  uint64_t v13 = sub_1B8F57270();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) == 1)
  {
    sub_1B8F1DBD4((uint64_t)v9, &qword_1EB9C4100);
  }
  else
  {
    sub_1B8F57260();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  uint64_t v15 = OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode;
  uint64_t v16 = sub_1B8F574C0();
  swift_bridgeObjectRelease();
  *(void *)&v11[v15] = v16;

  uint64_t v17 = (objc_class *)type metadata accessor for PhoneNumberFormatter();
  v19.receiver = v11;
  v19.super_class = v17;
  return objc_msgSendSuper2(&v19, sel_init);
}

id PhoneNumberFormatter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhoneNumberFormatter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8F2A100(uint64_t a1, unint64_t a2)
{
  return sub_1B8F2940C(a1, a2);
}

uint64_t sub_1B8F2A124(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C4130);
    uint64_t v3 = sub_1B8F57A20();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_1B8F58180();
      sub_1B8F57450();
      uint64_t result = sub_1B8F581A0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        if (*v16 == v8 && v16[1] == v7) {
          goto LABEL_3;
        }
        uint64_t result = sub_1B8F57EE0();
        if (result) {
          goto LABEL_3;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          objc_super v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_1B8F57EE0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
      swift_bridgeObjectRetain();
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1B8F2A2C0()
{
  swift_bridgeObjectRetain_n();
  uint64_t v0 = sub_1B8F57580();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      if (qword_1EB9C4120 != -1) {
        swift_once();
      }
      uint64_t v5 = off_1EB9C4110;
      if (*((void *)off_1EB9C4110 + 2))
      {
        sub_1B8F58180();
        sub_1B8F57450();
        uint64_t v6 = sub_1B8F581A0();
        uint64_t v7 = -1 << v5[32];
        unint64_t v8 = v6 & ~v7;
        uint64_t v9 = v5 + 56;
        if ((*(void *)&v5[((v8 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v8))
        {
          uint64_t v10 = *((void *)v5 + 6);
          unint64_t v11 = (void *)(v10 + 16 * v8);
          BOOL v12 = *v11 == v2 && v3 == v11[1];
          if (v12 || (sub_1B8F57EE0() & 1) != 0) {
            goto LABEL_4;
          }
          uint64_t v13 = ~v7;
          unint64_t v14 = (v8 + 1) & v13;
          if ((*(void *)&v9[(v14 >> 3) & 0xFFFFFFFFFFFFFF8] >> v14))
          {
            uint64_t v15 = (void *)(v10 + 16 * v14);
            BOOL v16 = *v15 == v2 && v3 == v15[1];
            if (v16 || (sub_1B8F57EE0() & 1) != 0) {
              goto LABEL_4;
            }
            for (unint64_t i = v14 + 1; ; unint64_t i = v18 + 1)
            {
              unint64_t v18 = i & v13;
              if (((*(void *)&v9[((i & v13) >> 3) & 0xFFFFFFFFFFFFFF8] >> (i & v13)) & 1) == 0) {
                break;
              }
              objc_super v19 = (void *)(v10 + 16 * v18);
              BOOL v20 = *v19 == v2 && v3 == v19[1];
              if (v20 || (sub_1B8F57EE0() & 1) != 0) {
                goto LABEL_4;
              }
            }
          }
        }
      }
      MEMORY[0x1BA9CF320](v2, v3);
LABEL_4:
      swift_bridgeObjectRelease();
      uint64_t v2 = sub_1B8F57580();
      uint64_t v3 = v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1B8F2A4F0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C4108);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1B8F2A2C0();
  v20[0] = v8;
  v20[1] = v9;
  v19[0] = 0x242A5D392D305B5ELL;
  v19[1] = 0xE800000000000000;
  uint64_t v10 = sub_1B8F57290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1B8F2A7CC();
  sub_1B8F579C0();
  char v12 = v11;
  sub_1B8F1DBD4((uint64_t)v7, &qword_1EB9C4108);
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0) {
    return v8;
  }
  swift_bridgeObjectRelease();
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1B8F572D0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EB9C4218);
  swift_bridgeObjectRetain_n();
  unint64_t v14 = sub_1B8F572B0();
  os_log_type_t v15 = sub_1B8F57860();
  if (os_log_type_enabled(v14, v15))
  {
    BOOL v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v20[0] = v17;
    *(_DWORD *)BOOL v16 = 136315138;
    swift_bridgeObjectRetain();
    v19[0] = sub_1B8F20904(a1, a2, v20);
    sub_1B8F579A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1B8F03000, v14, v15, "%s is not a phone number.", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9D0800](v17, -1, -1);
    MEMORY[0x1BA9D0800](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1B8F2A7CC()
{
  unint64_t result = qword_1EB9C4128;
  if (!qword_1EB9C4128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB9C4128);
  }
  return result;
}

uint64_t sub_1B8F2A820()
{
  uint64_t v7 = sub_1B8F575B0();
  sub_1B8F57540();
  uint64_t v0 = v7;
  uint64_t v1 = (void *)sub_1B8F574C0();
  uint64_t v2 = PNCopyBestGuessCountryCodeForNumber();
  if (!v2)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v3 = (void *)v2;
  if (!PNIsValidPhoneNumberForCountry())
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v4 = (void *)sub_1B8F574C0();
  uint64_t v5 = (void *)PNCreateFormattedStringWithCountry();

  if (v5)
  {
    uint64_t v0 = sub_1B8F574D0();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t type metadata accessor for PhoneNumberFormatter()
{
  return self;
}

id sub_1B8F2A994@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t dispatch thunk of PhoneNumberFormatterProtocol.normalizedFormat(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PhoneNumberFormatterProtocol.displayFormat(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for PhoneNumberFormatter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PhoneNumberFormatter);
}

uint64_t dispatch thunk of PhoneNumberFormatter.defaultCountryCode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.defaultCountryCode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.defaultCountryCode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.normalizedFormat(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PhoneNumberFormatter.displayFormat(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t Dependency.init(dependencyId:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v61 = a5;
  uint64_t v8 = sub_1B8F572D0();
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v57 = v8;
  uint64_t v10 = MEMORY[0x1F4188790](v8, v9);
  uint64_t v55 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](v10, v13);
  uint64_t v60 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1B8F57980();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v15, v17);
  BOOL v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x1F4188790](v18, v21);
  uint64_t v24 = (char *)&v54 - v23;
  MEMORY[0x1F4188790](v22, v25);
  uint64_t v27 = (char *)&v54 - v26;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))((char *)&v54 - v26, 1, 1, a4);
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  type metadata accessor for DependencyRegistry();
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = (uint64_t)v24;
    uint64_t v58 = v24;
    uint64_t v29 = v12;
    uint64_t v30 = v15;
    unint64_t v31 = v20;
    uint64_t v32 = v59;
    static DependencyRegistry.locateService<A>(by:config:)(v59, a2, a3, a4, v28);
    swift_bridgeObjectRelease();
    uint64_t v33 = v32;
    BOOL v20 = v31;
    uint64_t v15 = v30;
    uint64_t v12 = v29;
    swift_bridgeObjectRelease();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v16 + 8);
    v34(v27, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v27, v58, v15);
  }
  else
  {
    static DependencyRegistry.locateService<A>(by:config:)(v59, 0, a3, a4, (uint64_t)v24);
    swift_bridgeObjectRelease();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v16 + 8);
    v34(v27, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v27, v24, v15);
    uint64_t v63 = a4;
    swift_getMetatypeMetadata();
    uint64_t v33 = sub_1B8F574F0();
    a2 = v35;
  }
  swift_bridgeObjectRelease();
  uint64_t v67 = v33;
  unint64_t v68 = a2;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v27, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v20, 1, a4) == 1)
  {
    v34(v20, v15);
    if (qword_1EB9C32D0 != -1) {
      swift_once();
    }
    uint64_t v39 = v57;
    uint64_t v40 = __swift_project_value_buffer(v57, (uint64_t)qword_1EB9C4200);
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v55, v40, v39);
    uint64_t v41 = sub_1B8F572B0();
    os_log_type_t v42 = sub_1B8F57870();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v63 = v44;
      *(_DWORD *)uint64_t v43 = 136315650;
      if (qword_1E9EF3D50 != -1) {
        swift_once();
      }
      uint64_t v45 = qword_1E9EF7350;
      unint64_t v46 = *(void *)algn_1E9EF7358;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_1B8F20904(v45, v46, &v63);
      sub_1B8F579A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      swift_beginAccess();
      uint64_t v47 = v67;
      unint64_t v48 = v68;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_1B8F20904(v47, v48, &v63);
      sub_1B8F579A0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v43 + 22) = 2080;
      id v49 = objc_msgSend(self, sel_callStackSymbols);
      uint64_t v50 = sub_1B8F57630();

      uint64_t v65 = v50;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C3300);
      sub_1B8F1A1A0();
      uint64_t v51 = sub_1B8F57460();
      unint64_t v53 = v52;
      swift_bridgeObjectRelease();
      uint64_t v65 = sub_1B8F20904(v51, v53, &v63);
      sub_1B8F579A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B8F03000, v41, v42, "%s The requested service %s has not been registered at \n%s", (uint8_t *)v43, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1BA9D0800](v44, -1, -1);
      MEMORY[0x1BA9D0800](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v57);
    uint64_t v63 = 0;
    unint64_t v64 = 0xE000000000000000;
    sub_1B8F57A30();
    uint64_t v65 = v63;
    unint64_t v66 = v64;
    sub_1B8F57560();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1B8F57560();
    swift_bridgeObjectRelease();
    sub_1B8F57560();
    uint64_t result = sub_1B8F57BB0();
    __break(1u);
  }
  else
  {
    v34(v27, v15);
    id v36 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    uint64_t v37 = v60;
    v36(v60, v20, a4);
    v36(v61, v37, a4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Dependency.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_1B8F2B320(uint64_t a1)
{
  MEMORY[0x1F4188790](a1, a1);
  uint64_t v2 = (char *)&v6 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v6 - v1);
  uint64_t v4 = type metadata accessor for Dependency();
  return Dependency.wrappedValue.setter((uint64_t)v2, v4);
}

uint64_t Dependency.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 40))(v2, a1);
}

void (*Dependency.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  void *v5 = v2;
  v5[1] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v5[2] = v7;
  v5[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v5[4] = malloc(v9);
  v5[5] = malloc(v9);
  (*(void (**)(void))(v8 + 16))();
  return sub_1B8F2B50C;
}

void sub_1B8F2B50C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 32);
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v8 = *v2;
    uint64_t v7 = v2[1];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 32), v4, v7);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v8, v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v7);
  }
  else
  {
    (*(void (**)(void, void *))(v2[2] + 40))(*v2, v4);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t Dependency.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_1B8F2B64C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Dependency();
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v8 - v4, a1, v2);
  return Dependency.projectedValue.setter((uint64_t)v5, v2);
}

uint64_t Dependency.projectedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t))(v7 + 8))(v2);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  return v5(v2, a1, a2);
}

void (*Dependency.projectedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  void *v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = v6;
  v5[2] = v6;
  v5[3] = v6;
  size_t v8 = *(void *)(v6 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  (*(void (**)(void))(v7 + 16))();
  return sub_1B8F2B8B8;
}

void sub_1B8F2B8B8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 32);
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v8 = *v2;
    uint64_t v7 = v2[1];
    (*(void (**)(void, void *, void))(v6 + 16))(*(void *)(*(void *)a1 + 32), v4, *v2);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 32))(v7, v3, v8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v8);
  }
  else
  {
    uint64_t v9 = v2[1];
    uint64_t v10 = *v2;
    uint64_t v11 = v2[2];
    (*(void (**)(uint64_t, void))(v11 + 8))(v9, *v2);
    (*(void (**)(uint64_t, void *, uint64_t))(v11 + 32))(v9, v4, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_1B8F2BA40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(uint64_t))Dependency.wrappedValue.getter);
}

uint64_t sub_1B8F2BA5C()
{
  return 8;
}

void *sub_1B8F2BA68(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B8F2BA74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(uint64_t))Dependency.projectedValue.getter);
}

uint64_t keypath_getTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = type metadata accessor for Dependency();
  return a4(v5);
}

uint64_t sub_1B8F2BADC()
{
  return 8;
}

uint64_t sub_1B8F2BAE8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B8F2BB78(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1B8F2BC30(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1B8F2BC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8F2BCAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8F2BCFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8F2BD4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_1B8F2BD9C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1B8F2BEF8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1B8F2C110);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for Dependency()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of PushMessage.init(incomingMessage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PushMessage.command.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1B8F2C17C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B8F2C1DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F2C214(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B8F2C25C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B8F2C2B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v2;
  *(void *)(v4 + 32) = v3;
  sub_1B8F2C368(v2);
  return sub_1B8F2C3C8(v5);
}

uint64_t sub_1B8F2C320@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  *a1 = v3;
  a1[1] = v4;
  return sub_1B8F2C368(v3);
}

uint64_t sub_1B8F2C368(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1B8F2C378(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v3;
  return sub_1B8F2C3C8(v4);
}

uint64_t sub_1B8F2C3C8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_1B8F2C3D8())()
{
  return j__swift_endAccess;
}

id sub_1B8F2C42C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 40);
  uint64_t v5 = *(void *)(v3 + 48);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  char v6 = *(unsigned char *)(v3 + 56);
  *(unsigned char *)(a2 + 16) = v6;
  return sub_1B8F2C560(v4, v5, v6);
}

void sub_1B8F2C480(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *a2;
  char v5 = *(unsigned char *)(a1 + 16);
  swift_beginAccess();
  char v6 = *(void **)(v4 + 40);
  uint64_t v7 = *(void *)(v4 + 48);
  *(void *)(v4 + 40) = v2;
  *(void *)(v4 + 48) = v3;
  char v8 = *(unsigned char *)(v4 + 56);
  *(unsigned char *)(v4 + 56) = v5;
  sub_1B8F2C560(v2, v3, v5);
  sub_1B8F2C5DC(v6, v7, v8);
}

id sub_1B8F2C510@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 48);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v5 = *(unsigned char *)(v1 + 56);
  *(unsigned char *)(a1 + 16) = v5;
  return sub_1B8F2C560(v3, v4, v5);
}

id sub_1B8F2C560(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return (id)swift_retain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

void sub_1B8F2C580(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  swift_beginAccess();
  char v5 = *(void **)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v3;
  char v7 = *(unsigned char *)(v1 + 56);
  *(unsigned char *)(v1 + 56) = v4;
  sub_1B8F2C5DC(v5, v6, v7);
}

void sub_1B8F2C5DC(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_release();
  }
  else if (!a3)
  {
  }
}

uint64_t (*sub_1B8F2C5FC())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_1B8F2C650(unint64_t *a1, uint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  unint64_t v5 = *(void *)(v4 + 64);
  *(void *)(v4 + 64) = v2;
  *(void *)(v4 + 72) = v3;
  sub_1B8F2C708(v2);
  return sub_1B8F2C76C(v5);
}

unint64_t sub_1B8F2C6C0@<X0>(unint64_t *a1@<X8>)
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 64);
  unint64_t v4 = *(void *)(v1 + 72);
  *a1 = v3;
  a1[1] = v4;
  return sub_1B8F2C708(v3);
}

unint64_t sub_1B8F2C708(unint64_t result)
{
  if (result >= 2) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_1B8F2C71C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  swift_beginAccess();
  unint64_t v4 = *(void *)(v1 + 64);
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v3;
  return sub_1B8F2C76C(v4);
}

unint64_t sub_1B8F2C76C(unint64_t result)
{
  if (result >= 2) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_1B8F2C780())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B8F2C7D4(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 32);
  swift_beginAccess();
  unint64_t v5 = *(void **)(v2 + 40);
  uint64_t v6 = *(void *)(v2 + 48);
  char v7 = *(unsigned char *)(v2 + 56);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 72);
  unint64_t v11 = *(void *)(v2 + 64);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BE0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 88) = a2;
  *(void *)(v9 + 16) = MEMORY[0x1E4FBC860];
  *(void *)(v9 + 24) = v12;
  *(void *)(v9 + 32) = v3;
  *(void *)(v9 + 40) = v4;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(unsigned char *)(v9 + 64) = v7;
  *(void *)(v9 + 72) = v11;
  *(void *)(v9 + 80) = v8;
  sub_1B8F3A178(&qword_1E9EF3BD8, &qword_1E9EF3BE0);
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v5, v6, v7);
  sub_1B8F2C708(v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_1B8F57800();
}

uint64_t DictionaryDecoder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_1B8F21A80(MEMORY[0x1E4FBC860]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(unsigned char *)(v0 + 56) = 2;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryDecoder.init()()
{
  *(void *)(v0 + 16) = sub_1B8F21A80(MEMORY[0x1E4FBC860]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(unsigned char *)(v0 + 56) = 2;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryDecoder.deinit()
{
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(*(void *)(v0 + 24));
  sub_1B8F2C5DC(*(void **)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  sub_1B8F2C76C(*(void *)(v0 + 64));
  return v0;
}

uint64_t DictionaryDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(*(void *)(v0 + 24));
  sub_1B8F2C5DC(*(void **)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  sub_1B8F2C76C(*(void *)(v0 + 64));
  return MEMORY[0x1F4186488](v0, 80, 7);
}

uint64_t sub_1B8F2CA88@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F2CAD8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B8F2C368(v4);
}

unint64_t sub_1B8F2CB30@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  unint64_t v4 = *(void *)(v3 + 64);
  unint64_t v5 = *(void *)(v3 + 72);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B8F2C708(v4);
}

uint64_t type metadata accessor for DictionaryDecoder()
{
  return self;
}

uint64_t method lookup function for DictionaryDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DictionaryDecoder);
}

uint64_t dispatch thunk of DictionaryDecoder.userInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of DictionaryDecoder.userInfo.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DictionaryDecoder.userInfo.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DictionaryDecoder.keyDecodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DictionaryDecoder.keyDecodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DictionaryDecoder.keyDecodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DictionaryDecoder.dateDecodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DictionaryDecoder.dateDecodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DictionaryDecoder.dateDecodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DictionaryDecoder.dataDecodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of DictionaryDecoder.dataDecodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of DictionaryDecoder.dataDecodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of DictionaryDecoder.decode<A>(_:from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of DictionaryDecoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

void *destroy for DictionaryDecoder.KeyDecodingStrategy(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.KeyDecodingStrategy(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.KeyDecodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_1B8F2CE84(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1B8F2CE9C(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.KeyDecodingStrategy()
{
  return &type metadata for DictionaryDecoder.KeyDecodingStrategy;
}

void destroy for DictionaryDecoder.DateDecodingStrategy(uint64_t a1)
{
}

uint64_t _s18AAAFoundationSwift17DictionaryDecoderC20DateDecodingStrategyOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1B8F2C560(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DictionaryDecoder.DateDecodingStrategy(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1B8F2C560(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1B8F2C5DC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DictionaryDecoder.DateDecodingStrategy(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1B8F2C5DC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.DateDecodingStrategy(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.DateDecodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B8F2D058(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1B8F2D070(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.DateDecodingStrategy()
{
  return &type metadata for DictionaryDecoder.DateDecodingStrategy;
}

uint64_t _s18AAAFoundationSwift17DictionaryDecoderC19KeyDecodingStrategyOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *_s18AAAFoundationSwift17DictionaryDecoderC19KeyDecodingStrategyOwca_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

unint64_t *_s18AAAFoundationSwift17DictionaryDecoderC19KeyDecodingStrategyOwta_0(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.DataDecodingStrategy(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.DataDecodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.DataDecodingStrategy()
{
  return &type metadata for DictionaryDecoder.DataDecodingStrategy;
}

uint64_t sub_1B8F2D2B8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B8F2D368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(*(void *)v3 + 80);
  MEMORY[0x1F4188790](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v25 - v10, v3 + *(void *)(v8 + 112), v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BE8);
  if (swift_dynamicCast())
  {
    uint64_t v11 = v26;
    uint64_t v12 = *(void *)(v3 + 16);
    unint64_t v13 = *(void *)(v3 + 24);
    uint64_t v14 = *(void *)(v3 + 32);
    uint64_t v15 = *(void *)(v3 + 40);
    uint64_t v16 = *(void **)(v3 + 48);
    uint64_t v17 = *(void *)(v3 + 56);
    v25[1] = a3;
    uint64_t v26 = v12;
    uint64_t v36 = v5;
    unint64_t v18 = *(void *)(v3 + 72);
    uint64_t v19 = *(void *)(v3 + 80);
    char v20 = *(unsigned char *)(v3 + 64);
    unint64_t v27 = v13;
    uint64_t v28 = v14;
    uint64_t v29 = v15;
    uint64_t v30 = v16;
    uint64_t v31 = v17;
    char v32 = v20;
    unint64_t v33 = v18;
    uint64_t v34 = v19;
    uint64_t v35 = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v14);
    sub_1B8F2C560(v16, v17, v20);
    sub_1B8F2C708(v18);
    type metadata accessor for KeyedContainer();
    swift_getWitnessTable();
    return sub_1B8F57C80();
  }
  else
  {
    uint64_t v22 = sub_1B8F57A80();
    swift_allocError();
    uint64_t v24 = v23;
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1B8F57A30();
    sub_1B8F57560();
    sub_1B8F57EC0();
    sub_1B8F57A70();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x1E4FBBA78], v22);
    return swift_willThrow();
  }
}

uint64_t sub_1B8F2D62C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(*(void *)v3 + 80);
  MEMORY[0x1F4188790](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v25 - v9, v3 + *(void *)(v7 + 112), v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A70);
  if (swift_dynamicCast())
  {
    uint64_t v10 = v29;
    uint64_t v11 = *(void *)(v3 + 16);
    uint64_t v27 = *(void *)(v3 + 24);
    uint64_t v28 = v11;
    uint64_t v31 = v4;
    uint64_t v12 = *(void *)(v3 + 32);
    uint64_t v13 = *(void *)(v3 + 40);
    uint64_t v14 = *(void **)(v3 + 48);
    uint64_t v26 = *(void *)(v3 + 56);
    uint64_t v15 = v26;
    unint64_t v16 = *(void *)(v3 + 72);
    uint64_t v17 = *(void *)(v3 + 80);
    char v18 = *(unsigned char *)(v3 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v12);
    sub_1B8F2C560(v14, v15, v18);
    sub_1B8F2C708(v16);
    uint64_t v25 = sub_1B8F2DA20(v10);
    swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for UnkeyedContainer;
    a3[4] = sub_1B8F2E330();
    uint64_t result = swift_allocObject();
    *a3 = result;
    uint64_t v20 = v27;
    *(void *)(result + 16) = v28;
    *(void *)(result + 24) = v20;
    *(void *)(result + 32) = v12;
    *(void *)(result + 40) = v13;
    uint64_t v21 = v26;
    *(void *)(result + 48) = v14;
    *(void *)(result + 56) = v21;
    *(unsigned char *)(result + 64) = v18;
    *(void *)(result + 72) = v16;
    *(void *)(result + 80) = v17;
    *(void *)(result + 88) = v25;
    *(void *)(result + 96) = 0;
  }
  else
  {
    uint64_t v22 = sub_1B8F57A80();
    swift_allocError();
    uint64_t v24 = v23;
    uint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1B8F57A30();
    sub_1B8F57560();
    sub_1B8F57EC0();
    sub_1B8F57A70();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x1E4FBBA78], v22);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1B8F2D8F0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x1E4FBC860];
    sub_1B8F37B4C(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4DA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A88);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B8F37B4C(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B8F37B4C(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      *(void *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1B8F2DA20(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
    sub_1B8F37B8C(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v10;
    do
    {
      sub_1B8F12200(v4, (uint64_t)v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B8F37B8C(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v10;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B8F37B8C(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v10;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_1B8F37BAC((uint64_t)v9, v2 + 32 * v6 + 32);
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_1B8F2DB50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[7];
  uint64_t v14 = v1[4];
  uint64_t v15 = (void *)v1[6];
  uint64_t v16 = v1[10];
  unint64_t v17 = v1[9];
  a1[3] = (uint64_t)&type metadata for SingleValueContainer;
  char v8 = *((unsigned char *)v1 + 64);
  a1[4] = sub_1B8F2E25C();
  uint64_t v9 = swift_allocObject();
  *a1 = v9;
  uint64_t v10 = (uint64_t)v1 + *(void *)(v3 + 112);
  uint64_t v11 = *(void *)(v3 + 80);
  *(void *)(v9 + 112) = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v9 + 88));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10, v11);
  *(void *)(v9 + 16) = v4;
  *(void *)(v9 + 24) = v5;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + 56) = v7;
  *(unsigned char *)(v9 + 64) = v8;
  *(void *)(v9 + 72) = v17;
  *(void *)(v9 + 80) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v14);
  sub_1B8F2C560(v15, v7, v8);
  return sub_1B8F2C708(v17);
}

uint64_t *sub_1B8F2DCA8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)v0[6];
  uint64_t v3 = v0[7];
  unint64_t v4 = v0[9];
  char v5 = *((unsigned char *)v0 + 64);
  sub_1B8F2C3C8(v0[4]);
  sub_1B8F2C5DC(v2, v3, v5);
  sub_1B8F2C76C(v4);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 112));
  return v0;
}

uint64_t sub_1B8F2DD78()
{
  uint64_t v0 = sub_1B8F2DCA8();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata accessor for DictionaryDecoderImplementation()
{
  return __swift_instantiateGenericMetadata();
}

void destroy for DictionaryDecoder.Descriptor(uint64_t a1)
{
  if (*(void *)a1) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  if (*(void *)(a1 + 40) >= 2uLL)
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for DictionaryDecoder.Descriptor(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  char v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_1B8F2C560(v5, v6, v7);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  unint64_t v8 = *(void *)(a2 + 40);
  if (v8 >= 2)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  return a1;
}

uint64_t assignWithCopy for DictionaryDecoder.Descriptor(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  char v7 = (void *)a2[2];
  uint64_t v8 = a2[3];
  char v9 = *((unsigned char *)a2 + 32);
  sub_1B8F2C560(v7, v8, v9);
  uint64_t v10 = *(void **)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v9;
  sub_1B8F2C5DC(v10, v11, v12);
  unint64_t v13 = a2[5];
  if (*(void *)(a1 + 40) >= 2uLL)
  {
    if (v13 >= 2)
    {
      uint64_t v15 = a2[6];
      *(void *)(a1 + 40) = v13;
      *(void *)(a1 + 48) = v15;
      swift_retain();
      swift_release();
      return a1;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  uint64_t v14 = a2[6];
  *(void *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = v14;
  swift_retain();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DictionaryDecoder.Descriptor(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  char v7 = *((unsigned char *)a2 + 32);
  uint64_t v8 = *(void **)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  char v10 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1B8F2C5DC(v8, v9, v10);
  unint64_t v11 = a2[5];
  if (*(void *)(a1 + 40) >= 2uLL)
  {
    if (v11 >= 2)
    {
      uint64_t v13 = a2[6];
      *(void *)(a1 + 40) = v11;
      *(void *)(a1 + 48) = v13;
      swift_release();
      return a1;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  uint64_t v12 = a2[6];
  *(void *)(a1 + 40) = v11;
  *(void *)(a1 + 48) = v12;
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryDecoder.Descriptor(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DictionaryDecoder.Descriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DictionaryDecoder.Descriptor()
{
  return &type metadata for DictionaryDecoder.Descriptor;
}

uint64_t sub_1B8F2E1D8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F2E1E4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F2E1F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1B8F2D368(a1, a2, a3);
}

uint64_t sub_1B8F2E214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B8F2D62C(a1, a2, a3);
}

unint64_t sub_1B8F2E238@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B8F2DB50(a1);
}

unint64_t sub_1B8F2E25C()
{
  unint64_t result = qword_1E9EF4A68;
  if (!qword_1E9EF4A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4A68);
  }
  return result;
}

uint64_t sub_1B8F2E2B0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_release();
  }
  if (*(void *)(v0 + 112)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  }
  return MEMORY[0x1F4186498](v0, 120, 7);
}

unint64_t sub_1B8F2E330()
{
  unint64_t result = qword_1E9EF4A78;
  if (!qword_1E9EF4A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4A78);
  }
  return result;
}

uint64_t sub_1B8F2E384()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
  if (*(void *)(v0 + 72) >= 2uLL) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t sub_1B8F2E3FC(uint64_t a1, uint64_t a2)
{
  int v4 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  if (!v4) {
    return sub_1B8F58220();
  }
  long long v10 = *(_OWORD *)(a2 + 16);
  uint64_t v8 = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_0, a1);
  swift_retain();
  uint64_t v6 = v4(v9);
  sub_1B8F2C3C8((uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

uint64_t sub_1B8F2E4C8()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4C10);
  sub_1B8F3A178(&qword_1E9EF4C18, &qword_1E9EF4C10);
  uint64_t v0 = sub_1B8F575C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B8F2E58C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 72);
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1B8F2E3FC(a1, a2);
  if (*(void *)(v5 + 16))
  {
    sub_1B8F22A50(v6, v7);
    char v9 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v9 = 0;
  }
  return v9 & 1;
}

BOOL sub_1B8F2E648(uint64_t a1, uint64_t a2)
{
  char v3 = *((unsigned char *)v2 + 48);
  uint64_t v4 = *((void *)v2 + 9);
  long long v5 = v2[1];
  long long v8 = *v2;
  long long v9 = v5;
  long long v10 = v2[2];
  char v11 = v3;
  long long v12 = *(long long *)((char *)v2 + 56);
  uint64_t v13 = v4;
  sub_1B8F2E6E8(a1, a2, (uint64_t)v14);
  sub_1B8F21884((uint64_t)&v15, (uint64_t)&v8);
  BOOL v6 = *((void *)&v9 + 1) == 0;
  sub_1B8F1DBD4((uint64_t)&v8, &qword_1EB9C33F0);
  sub_1B8F395A4((uint64_t)v14);
  return v6;
}

uint64_t sub_1B8F2E6E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *v3;
  uint64_t v8 = v3[2];
  uint64_t v24 = v3[3];
  uint64_t v25 = v3[1];
  uint64_t v22 = v3[5];
  uint64_t v23 = (void *)v3[4];
  char v9 = *((unsigned char *)v3 + 48);
  unint64_t v10 = v3[7];
  uint64_t v21 = v3[8];
  uint64_t v11 = v3[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F59040;
  uint64_t v13 = *(void *)(a2 + 16);
  *(void *)(inited + 56) = v13;
  *(void *)(inited + 64) = *(void *)(a2 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(boxed_opaque_existential_0, a1, v13);
  swift_bridgeObjectRetain();
  sub_1B8F544BC(inited);
  *(void *)&long long v26 = v7;
  *((void *)&v26 + 1) = v25;
  *(void *)&long long v27 = v8;
  *((void *)&v27 + 1) = v24;
  uint64_t v28 = v23;
  uint64_t v29 = v22;
  char v30 = v9;
  unint64_t v31 = v10;
  uint64_t v32 = v21;
  uint64_t v33 = v11;
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v8);
  sub_1B8F2C560(v23, v22, v9);
  sub_1B8F2C708(v10);
  uint64_t v15 = sub_1B8F2E3FC(a1, a2);
  if (*(void *)(v11 + 16) && (unint64_t v17 = sub_1B8F22A50(v15, v16), (v18 & 1) != 0))
  {
    sub_1B8F12200(*(void *)(v11 + 56) + 32 * v17, (uint64_t)&v26);
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  swift_bridgeObjectRelease();
  *(void *)a3 = v7;
  *(void *)(a3 + 8) = v25;
  *(void *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v24;
  *(void *)(a3 + 32) = v23;
  *(void *)(a3 + 40) = v22;
  *(unsigned char *)(a3 + 48) = v9;
  *(void *)(a3 + 56) = v10;
  *(void *)(a3 + 64) = v21;
  return sub_1B8F37BAC((uint64_t)&v26, a3 + 72);
}

BOOL sub_1B8F2E900(uint64_t a1, uint64_t a2)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v4);
  BOOL v2 = sub_1B8F394E8();
  sub_1B8F395A4((uint64_t)v4);
  return v2;
}

unsigned char *sub_1B8F2E980(uint64_t a1, uint64_t a2)
{
  char v3 = *((unsigned char *)v2 + 48);
  uint64_t v4 = *((void *)v2 + 9);
  long long v5 = v2[1];
  long long v9 = *v2;
  long long v10 = v5;
  long long v11 = v2[2];
  char v12 = v3;
  long long v13 = *(long long *)((char *)v2 + 56);
  uint64_t v14 = v4;
  sub_1B8F2E6E8(a1, a2, (uint64_t)v15);
  sub_1B8F21884((uint64_t)v16, (uint64_t)&v9);
  if (!*((void *)&v10 + 1))
  {
    sub_1B8F1DBD4((uint64_t)&v9, &qword_1EB9C33F0);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    BOOL v6 = v15;
    sub_1B8F34704(MEMORY[0x1E4FBB1A0], (uint64_t)v16);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v15);
    return v6;
  }
  BOOL v6 = v8;
  sub_1B8F395A4((uint64_t)v15);
  return v6;
}

double sub_1B8F2EA7C(uint64_t a1, uint64_t a2)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v6);
  uint64_t v3 = sub_1B8F3499C((uint64_t)v7);
  if (v4)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB3D0], (uint64_t)v7);
    swift_willThrow();
  }
  else
  {
    double v2 = *(double *)&v3;
  }
  sub_1B8F395A4((uint64_t)v6);
  return v2;
}

float sub_1B8F2EB40(uint64_t a1, uint64_t a2)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v5);
  unint64_t v3 = sub_1B8F351A0((uint64_t)v6);
  if ((v3 & 0x100000000) != 0)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB470], (uint64_t)v6);
    swift_willThrow();
  }
  else
  {
    float v2 = *(float *)&v3;
  }
  sub_1B8F395A4((uint64_t)v5);
  return v2;
}

unsigned char *sub_1B8F2EC04(uint64_t a1, uint64_t a2, uint64_t (*a3)(unsigned char *), uint64_t a4)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v10);
  uint64_t v6 = a3(v11);
  if (v7)
  {
    uint64_t v8 = v10;
    sub_1B8F34704(a4, (uint64_t)v11);
    swift_willThrow();
  }
  else
  {
    uint64_t v8 = (unsigned char *)v6;
  }
  sub_1B8F395A4((uint64_t)v10);
  return v8;
}

unsigned char *sub_1B8F2ECD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(unsigned char *), uint64_t a4)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v9);
  uint64_t v6 = a3(v10);
  if ((v6 & 0x100) != 0)
  {
    char v7 = v9;
    sub_1B8F34704(a4, (uint64_t)v10);
    swift_willThrow();
  }
  else
  {
    char v7 = (unsigned char *)v6;
  }
  sub_1B8F395A4((uint64_t)v9);
  return v7;
}

unsigned char *sub_1B8F2ED9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(unsigned char *), uint64_t a4)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v9);
  uint64_t v6 = a3(v10);
  if ((v6 & 0x10000) != 0)
  {
    char v7 = v9;
    sub_1B8F34704(a4, (uint64_t)v10);
    swift_willThrow();
  }
  else
  {
    char v7 = (unsigned char *)v6;
  }
  sub_1B8F395A4((uint64_t)v9);
  return v7;
}

unsigned char *sub_1B8F2EE68(uint64_t a1, uint64_t a2, uint64_t (*a3)(unsigned char *), uint64_t a4)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v9);
  uint64_t v6 = a3(v10);
  if ((v6 & 0x100000000) != 0)
  {
    char v7 = v9;
    sub_1B8F34704(a4, (uint64_t)v10);
    swift_willThrow();
  }
  else
  {
    char v7 = (unsigned char *)v6;
  }
  sub_1B8F395A4((uint64_t)v9);
  return v7;
}

uint64_t sub_1B8F2EF34@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  sub_1B8F2E6E8(a1, a2, (uint64_t)v9);
  sub_1B8F2EFE4(a3, a4, a5);
  return sub_1B8F395A4((uint64_t)v9);
}

uint64_t sub_1B8F2EFE4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v51 = a3;
  uint64_t v5 = sub_1B8F57980();
  uint64_t v50 = *(void (***)(char *, uint64_t))(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5, v6);
  long long v9 = (char *)&v44 - v8;
  uint64_t v52 = a1;
  uint64_t v49 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](v7, v10);
  char v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1B8F57200();
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1B8F57120();
  MEMORY[0x1F4188790](v17, v18);
  uint64_t v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_dynamicCastMetatype())
  {
    uint64_t v21 = v54;
    uint64_t result = sub_1B8F359B4((uint64_t)v20);
    if (v21) {
      return result;
    }
    return swift_dynamicCast();
  }
  uint64_t v23 = v12;
  uint64_t v25 = v49;
  uint64_t v24 = v50;
  if (swift_dynamicCastMetatype())
  {
    uint64_t v26 = v54;
    uint64_t result = sub_1B8F35CC8();
    if (v26) {
      return result;
    }
    v53[0] = result;
    v53[1] = v27;
    return swift_dynamicCast();
  }
  if (swift_dynamicCastMetatype())
  {
    uint64_t v28 = v54;
    uint64_t result = sub_1B8F36080((uint64_t)v16);
    if (v28) {
      return result;
    }
    return swift_dynamicCast();
  }
  sub_1B8F21884((uint64_t)(v3 + 9), (uint64_t)v53);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  uint64_t v29 = v52;
  int v30 = swift_dynamicCast();
  unint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  if (v30)
  {
    v31(v9, 0, 1, v29);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v32(v23, v9, v29);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(v51, v23, v29);
  }
  else
  {
    v31(v9, 1, 1, v29);
    v24[1](v9, v5);
    uint64_t v33 = v3[1];
    uint64_t v34 = v3[2];
    uint64_t v45 = *v3;
    uint64_t v46 = v33;
    uint64_t v47 = v3[3];
    uint64_t v35 = (void (**)(char *, uint64_t))v3[4];
    uint64_t v36 = v3[5];
    uint64_t v49 = v34;
    uint64_t v50 = v35;
    unint64_t v37 = v3[7];
    uint64_t v38 = v3[8];
    char v39 = *((unsigned char *)v3 + 48);
    sub_1B8F21884((uint64_t)(v3 + 9), (uint64_t)v53);
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
    uint64_t v41 = swift_allocObject();
    uint64_t v42 = v46;
    *(void *)(v41 + 16) = v45;
    *(void *)(v41 + 24) = v42;
    *(void *)(v41 + 32) = v34;
    uint64_t v43 = v50;
    *(void *)(v41 + 40) = v47;
    *(void *)(v41 + 48) = v43;
    *(void *)(v41 + 56) = v36;
    *(unsigned char *)(v41 + 64) = v39;
    *(void *)(v41 + 72) = v37;
    *(void *)(v41 + 80) = v38;
    sub_1B8F37BAC((uint64_t)v53, v41 + 88);
    v53[3] = v40;
    v53[4] = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
    v53[0] = v41;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v49);
    sub_1B8F2C560(v50, v36, v39);
    sub_1B8F2C708(v37);
    return sub_1B8F57800();
  }
}

uint64_t sub_1B8F2F44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = *(void **)(v3 + 32);
  char v6 = *(unsigned char *)(v3 + 48);
  uint64_t v7 = *(void *)(v3 + 72);
  uint64_t v16 = *(void *)(v3 + 40);
  unint64_t v17 = *(void *)(v3 + 56);
  uint64_t v8 = sub_1B8F2E3FC(a2, a3);
  if (!*(void *)(v7 + 16) || (unint64_t v10 = sub_1B8F22A50(v8, v9), (v11 & 1) == 0))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1B8F12200(*(void *)(v7 + 56) + 32 * v10, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  if (!*((void *)&v19 + 1))
  {
LABEL_7:
    sub_1B8F1DBD4((uint64_t)&v18, &qword_1EB9C33F0);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BE8);
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v4);
    sub_1B8F2C560(v5, v16, v6);
    sub_1B8F2C708(v17);
    type metadata accessor for KeyedContainer();
    swift_getWitnessTable();
    return sub_1B8F57C80();
  }
LABEL_8:
  uint64_t v13 = sub_1B8F57A80();
  swift_allocError();
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  sub_1B8F57A30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B8F57410();
  sub_1B8F57560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F57A70();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x1E4FBBA78], v13);
  return swift_willThrow();
}

unint64_t sub_1B8F2F728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = v3[3];
  char v8 = *((unsigned char *)v3 + 48);
  uint64_t v9 = v3[8];
  uint64_t v10 = v3[9];
  uint64_t v24 = *v3;
  uint64_t v21 = v3[5];
  uint64_t v22 = (void *)v3[4];
  unint64_t v27 = v3[7];
  uint64_t v23 = v9;
  uint64_t v11 = sub_1B8F2E3FC(a1, a2);
  if (!*(void *)(v10 + 16) || (unint64_t v13 = sub_1B8F22A50(v11, v12), (v14 & 1) == 0))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1B8F12200(*(void *)(v10 + 56) + 32 * v13, (uint64_t)&v25);
  swift_bridgeObjectRelease();
  if (!*((void *)&v26 + 1))
  {
LABEL_7:
    sub_1B8F1DBD4((uint64_t)&v25, &qword_1EB9C33F0);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4C08);
  if (swift_dynamicCast())
  {
    a3[3] = (uint64_t)&type metadata for UnkeyedContainer;
    a3[4] = sub_1B8F2E330();
    uint64_t v15 = swift_allocObject();
    *a3 = v15;
    *(void *)(v15 + 16) = v4;
    *(void *)(v15 + 24) = v5;
    *(void *)(v15 + 32) = v6;
    *(void *)(v15 + 40) = v7;
    *(void *)(v15 + 48) = v22;
    *(void *)(v15 + 56) = v21;
    *(unsigned char *)(v15 + 64) = v8;
    *(void *)(v15 + 72) = v27;
    *(void *)(v15 + 80) = v23;
    *(void *)(v15 + 88) = v24;
    *(void *)(v15 + 96) = 0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v6);
    sub_1B8F2C560(v22, v21, v8);
    return sub_1B8F2C708(v27);
  }
LABEL_8:
  uint64_t v17 = sub_1B8F57A80();
  swift_allocError();
  uint64_t v19 = v18;
  swift_bridgeObjectRetain();
  sub_1B8F57A30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1B8F57410();
  sub_1B8F57560();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F57A70();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x1E4FBBA78], v17);
  return swift_willThrow();
}

uint64_t sub_1B8F2F9E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = (void *)v1[4];
  uint64_t v6 = v1[5];
  char v8 = *((unsigned char *)v1 + 48);
  unint64_t v10 = v1[7];
  uint64_t v9 = v1[8];
  uint64_t v11 = v1[9];
  uint64_t v18 = v2;
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v4);
    sub_1B8F2C560(v7, v6, v8);
    sub_1B8F2C708(v10);
    unint64_t v12 = sub_1B8F22A50(0x7265707573, 0xE500000000000000);
    if (v13)
    {
      sub_1B8F12200(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v20);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
    }
    uint64_t v14 = v9;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v4);
    sub_1B8F2C560(v7, v6, v8);
    sub_1B8F2C708(v10);
    uint64_t v14 = v9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v18;
  *(void *)(v16 + 24) = v3;
  *(void *)(v16 + 32) = v4;
  *(void *)(v16 + 40) = v5;
  *(void *)(v16 + 48) = v7;
  *(void *)(v16 + 56) = v6;
  *(unsigned char *)(v16 + 64) = v8;
  *(void *)(v16 + 72) = v10;
  *(void *)(v16 + 80) = v14;
  sub_1B8F37BAC((uint64_t)&v20, v16 + 88);
  a1[3] = v15;
  uint64_t result = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
  a1[4] = result;
  *a1 = v16;
  return result;
}

uint64_t sub_1B8F2FBB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *v3;
  uint64_t v25 = v3[2];
  uint64_t v26 = v3[1];
  uint64_t v7 = (void *)v3[4];
  uint64_t v8 = v3[5];
  char v9 = *((unsigned char *)v3 + 48);
  unint64_t v10 = v3[7];
  uint64_t v23 = v3[8];
  uint64_t v24 = v3[3];
  uint64_t v22 = v3[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F59040;
  uint64_t v12 = *(void *)(a2 + 16);
  *(void *)(inited + 56) = v12;
  *(void *)(inited + 64) = *(void *)(a2 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_0, a1, v12);
  swift_bridgeObjectRetain();
  sub_1B8F544BC(inited);
  *(void *)&long long v30 = v6;
  *((void *)&v30 + 1) = v26;
  *(void *)&long long v31 = v25;
  *((void *)&v31 + 1) = v24;
  uint64_t v32 = v7;
  uint64_t v33 = v8;
  char v34 = v9;
  unint64_t v35 = v10;
  uint64_t v36 = v23;
  uint64_t v37 = v22;
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v25);
  uint64_t v28 = v8;
  char v27 = v9;
  sub_1B8F2C560(v7, v8, v9);
  sub_1B8F2C708(v10);
  uint64_t v14 = sub_1B8F2E3FC(a1, a2);
  if (*(void *)(v22 + 16) && (unint64_t v16 = sub_1B8F22A50(v14, v15), (v17 & 1) != 0))
  {
    sub_1B8F12200(*(void *)(v22 + 56) + 32 * v16, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v6;
  *(void *)(v19 + 24) = v26;
  *(void *)(v19 + 32) = v25;
  *(void *)(v19 + 40) = v24;
  *(void *)(v19 + 48) = v7;
  *(void *)(v19 + 56) = v28;
  *(unsigned char *)(v19 + 64) = v27;
  *(void *)(v19 + 72) = v10;
  *(void *)(v19 + 80) = v23;
  sub_1B8F37BAC((uint64_t)&v30, v19 + 88);
  a3[3] = v18;
  uint64_t result = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
  a3[4] = result;
  *a3 = v19;
  return result;
}

uint64_t sub_1B8F2FE30()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_1B8F2FE40(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2E648(a1, a2);
}

BOOL sub_1B8F2FE5C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2E900(a1, a2);
}

unsigned char *sub_1B8F2FE78(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2E980(a1, a2);
}

double sub_1B8F2FE90(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EA7C(a1, a2);
}

float sub_1B8F2FEA8(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EB40(a1, a2);
}

unsigned char *sub_1B8F2FEC0(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EC04(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F313F0, MEMORY[0x1E4FBB550]);
}

unsigned char *sub_1B8F2FEF4(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2ECD0(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F31904, MEMORY[0x1E4FBC098]);
}

unsigned char *sub_1B8F2FF28(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2ED9C(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F31E1C, MEMORY[0x1E4FBC0F8]);
}

unsigned char *sub_1B8F2FF5C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EE68(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F32338, MEMORY[0x1E4FBC150]);
}

unsigned char *sub_1B8F2FF90(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EC04(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F32860, MEMORY[0x1E4FBC1C8]);
}

uint64_t sub_1B8F2FFC4()
{
  return sub_1B8F57FF0();
}

unsigned char *sub_1B8F2FFDC(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EC04(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F32D78, MEMORY[0x1E4FBB808]);
}

unsigned char *sub_1B8F30010(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2ECD0(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F3328C, MEMORY[0x1E4FBC358]);
}

unsigned char *sub_1B8F30044(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2ED9C(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F337A8, MEMORY[0x1E4FBC450]);
}

unsigned char *sub_1B8F30078(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EE68(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F33CC4, MEMORY[0x1E4FBC4C0]);
}

unsigned char *sub_1B8F300AC(uint64_t a1, uint64_t a2)
{
  return sub_1B8F2EC04(a1, a2, (uint64_t (*)(unsigned char *))sub_1B8F341EC, MEMORY[0x1E4FBC538]);
}

uint64_t sub_1B8F300E0()
{
  return sub_1B8F58000();
}

uint64_t sub_1B8F300F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_1B8F2EF34(a1, a4, a2, a3, a5);
}

uint64_t sub_1B8F30120()
{
  return sub_1B8F57F80();
}

uint64_t sub_1B8F30138()
{
  return sub_1B8F57F70();
}

uint64_t sub_1B8F30150()
{
  uint64_t result = sub_1B8F57F90();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F30174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F303A0(a1, a2, a3, MEMORY[0x1E4FBBF60]);
}

uint64_t sub_1B8F301A0()
{
  uint64_t result = sub_1B8F57FA0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F301C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F302E8(a1, a2, a3, MEMORY[0x1E4FBBF78]);
}

uint64_t sub_1B8F301F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F30344(a1, a2, a3, MEMORY[0x1E4FBBF80]);
}

uint64_t sub_1B8F3021C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F303A0(a1, a2, a3, MEMORY[0x1E4FBBF88]);
}

uint64_t sub_1B8F30248()
{
  uint64_t result = sub_1B8F57FD0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F3026C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F30428(a1, a2, a3, MEMORY[0x1E4FBBFA0]);
}

uint64_t sub_1B8F30298()
{
  uint64_t result = sub_1B8F57FB0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F302BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F302E8(a1, a2, a3, MEMORY[0x1E4FBBF98]);
}

uint64_t sub_1B8F302E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_1B8F30318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F30344(a1, a2, a3, MEMORY[0x1E4FBBFA8]);
}

uint64_t sub_1B8F30344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_1B8F30374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F303A0(a1, a2, a3, MEMORY[0x1E4FBBFB0]);
}

uint64_t sub_1B8F303A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_1B8F303D8()
{
  uint64_t result = sub_1B8F57FE0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F303FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F30428(a1, a2, a3, MEMORY[0x1E4FBBFC0]);
}

uint64_t sub_1B8F30428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_1B8F30454()
{
  return sub_1B8F57FC0();
}

uint64_t sub_1B8F30480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F2F44C(a1, a2, a5);
}

unint64_t sub_1B8F304A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B8F2F728(a1, a2, a3);
}

uint64_t sub_1B8F304C0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B8F2F9E8(a1);
}

uint64_t sub_1B8F304D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_1B8F2FBB4(a1, a2, a3);
}

uint64_t sub_1B8F304F0()
{
  unint64_t v1 = *(void *)(v0 + 80);
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)(v0 + 72);
  if (v1 >= *(void *)(v2 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1B8F21884(v2 + 32 * v1 + 32, (uint64_t)v8);
  uint64_t v3 = v8[3];
  uint64_t result = sub_1B8F1DBD4((uint64_t)v8, &qword_1EB9C33F0);
  if (v3) {
    return v3 == 0;
  }
  uint64_t v5 = *(void *)(v0 + 80);
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (!v6)
  {
    *(void *)(v0 + 80) = v7;
    return v3 == 0;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1B8F30580@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unint64_t v5 = v3[10];
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  BOOL v6 = v3;
  uint64_t v7 = v3[9];
  if (v5 >= *(void *)(v7 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = *v3;
  uint64_t v9 = v6[1];
  uint64_t v11 = v6[2];
  uint64_t v10 = v6[3];
  uint64_t v12 = (void *)v6[4];
  uint64_t v20 = v6[5];
  char v13 = *((unsigned char *)v6 + 48);
  uint64_t v28 = a1;
  unint64_t v15 = v6[7];
  uint64_t v14 = v6[8];
  sub_1B8F21884(v7 + 32 * v5 + 32, (uint64_t)&v27);
  v23[0] = v8;
  v23[1] = v9;
  void v23[2] = v11;
  v23[3] = v10;
  v23[4] = v12;
  v23[5] = v20;
  char v24 = v13;
  unint64_t v25 = v15;
  uint64_t v26 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v11);
  sub_1B8F2C560(v12, v20, v13);
  sub_1B8F2C708(v15);
  sub_1B8F2EFE4(v28, a2, a3);
  uint64_t result = sub_1B8F395A4((uint64_t)v23);
  if (v4) {
    return result;
  }
  uint64_t v17 = v6[10];
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v6[10] = v19;
  return result;
}

void sub_1B8F306B0()
{
  unint64_t v1 = *(void *)(v0 + 80);
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 72);
    if (v1 < *(void *)(v2 + 16))
    {
      sub_1B8F21884(v2 + 32 * v1 + 32, (uint64_t)&v21);
      if (v24)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BE8);
        if (swift_dynamicCast())
        {
          uint64_t v3 = *(void *)(v0 + 80);
          BOOL v4 = __OFADD__(v3, 1);
          uint64_t v5 = v3 + 1;
          if (!v4)
          {
            uint64_t v6 = v31;
            unint64_t v8 = *(void *)(v0 + 56);
            uint64_t v7 = *(void *)(v0 + 64);
            uint64_t v10 = *(void **)(v0 + 32);
            uint64_t v9 = *(void *)(v0 + 40);
            uint64_t v12 = *(void *)(v0 + 16);
            uint64_t v11 = *(void *)(v0 + 24);
            unint64_t v13 = *(void *)v0;
            unint64_t v14 = *(void *)(v0 + 8);
            *(void *)(v0 + 80) = v5;
            char v15 = *(unsigned char *)(v0 + 48);
            unint64_t v21 = v13;
            unint64_t v22 = v14;
            uint64_t v23 = v12;
            uint64_t v24 = v11;
            unint64_t v25 = v10;
            uint64_t v26 = v9;
            char v27 = v15;
            unint64_t v28 = v8;
            uint64_t v29 = v7;
            uint64_t v30 = v6;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1B8F2C368(v12);
            sub_1B8F2C560(v10, v9, v15);
            sub_1B8F2C708(v8);
            type metadata accessor for KeyedContainer();
            swift_getWitnessTable();
            sub_1B8F57C80();
            return;
          }
          goto LABEL_11;
        }
      }
      else
      {
        sub_1B8F1DBD4((uint64_t)&v21, &qword_1EB9C33F0);
      }
      uint64_t v16 = sub_1B8F57A80();
      swift_allocError();
      uint64_t v18 = v17;
      unint64_t v21 = 0;
      unint64_t v22 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_1B8F57A30();
      swift_bridgeObjectRelease();
      unint64_t v21 = 0xD000000000000029;
      unint64_t v22 = 0x80000001B8F5C530;
      uint64_t v19 = *(void *)(v0 + 72);
      swift_bridgeObjectRetain();
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
      MEMORY[0x1BA9CF410](v19, v20);
      sub_1B8F57560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B8F57A70();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x1E4FBBA78], v16);
      swift_willThrow();
      return;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void sub_1B8F30950(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  unint64_t v4 = v2[10];
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v2[9];
    if (v4 < *(void *)(v5 + 16))
    {
      sub_1B8F21884(v5 + 32 * v4 + 32, (uint64_t)&v26);
      if (v28)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4C08);
        if (swift_dynamicCast())
        {
          uint64_t v6 = v2[10];
          BOOL v7 = __OFADD__(v6, 1);
          uint64_t v8 = v6 + 1;
          if (!v7)
          {
            uint64_t v9 = v29;
            v2[10] = v8;
            uint64_t v10 = *v2;
            uint64_t v11 = v2[1];
            uint64_t v13 = v2[2];
            uint64_t v12 = v2[3];
            char v15 = (void *)v2[4];
            uint64_t v14 = v2[5];
            unint64_t v24 = v2[7];
            uint64_t v25 = v9;
            uint64_t v23 = v2[8];
            a1[3] = (uint64_t)&type metadata for UnkeyedContainer;
            char v16 = *((unsigned char *)v2 + 48);
            a1[4] = sub_1B8F2E330();
            uint64_t v17 = swift_allocObject();
            *a1 = v17;
            *(void *)(v17 + 16) = v10;
            *(void *)(v17 + 24) = v11;
            *(void *)(v17 + 32) = v13;
            *(void *)(v17 + 40) = v12;
            *(void *)(v17 + 48) = v15;
            *(void *)(v17 + 56) = v14;
            *(unsigned char *)(v17 + 64) = v16;
            *(void *)(v17 + 72) = v24;
            *(void *)(v17 + 80) = v23;
            *(void *)(v17 + 88) = v25;
            *(void *)(v17 + 96) = 0;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_1B8F2C368(v13);
            sub_1B8F2C560(v15, v14, v16);
            sub_1B8F2C708(v24);
            return;
          }
          goto LABEL_11;
        }
      }
      else
      {
        sub_1B8F1DBD4((uint64_t)&v26, &qword_1EB9C33F0);
      }
      uint64_t v18 = sub_1B8F57A80();
      swift_allocError();
      uint64_t v20 = v19;
      unint64_t v26 = 0;
      unint64_t v27 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_1B8F57A30();
      swift_bridgeObjectRelease();
      unint64_t v26 = 0xD00000000000002BLL;
      unint64_t v27 = 0x80000001B8F5C500;
      uint64_t v21 = v2[9];
      swift_bridgeObjectRetain();
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
      MEMORY[0x1BA9CF410](v21, v22);
      sub_1B8F57560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B8F57A70();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x1E4FBBA78], v18);
      swift_willThrow();
      return;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void sub_1B8F30BE4(uint64_t *a1@<X8>)
{
  unint64_t v2 = v1[10];
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = v1[9];
    if (v2 < *(void *)(v3 + 16))
    {
      v1[10] = v2 + 1;
      uint64_t v5 = *v1;
      uint64_t v4 = v1[1];
      uint64_t v6 = v1[2];
      uint64_t v13 = v1[3];
      BOOL v7 = (void *)v1[4];
      uint64_t v14 = v1[5];
      uint64_t v8 = v1[8];
      unint64_t v16 = v1[7];
      char v9 = *((unsigned char *)v1 + 48);
      sub_1B8F21884(v3 + 32 * v2 + 32, (uint64_t)v15);
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v5;
      *(void *)(v12 + 24) = v4;
      *(void *)(v12 + 32) = v6;
      *(void *)(v12 + 40) = v13;
      *(void *)(v12 + 48) = v7;
      *(void *)(v12 + 56) = v14;
      *(unsigned char *)(v12 + 64) = v9;
      *(void *)(v12 + 72) = v16;
      *(void *)(v12 + 80) = v8;
      sub_1B8F37BAC((uint64_t)v15, v12 + 88);
      a1[3] = v11;
      a1[4] = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
      *a1 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B8F2C368(v6);
      sub_1B8F2C560(v7, v14, v9);
      sub_1B8F2C708(v16);
      return;
    }
  }
  __break(1u);
}

uint64_t sub_1B8F30D4C()
{
  return *(void *)(*(void *)(v0 + 72) + 16);
}

BOOL sub_1B8F30D5C()
{
  return *(void *)(v0 + 80) >= *(void *)(*(void *)(v0 + 72) + 16);
}

uint64_t sub_1B8F30D70()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_1B8F30D78()
{
  return sub_1B8F304F0() & 1;
}

uint64_t sub_1B8F30D94()
{
  sub_1B8F395D4();
  return v0 & 1;
}

void sub_1B8F30DB0()
{
}

void sub_1B8F30DC8()
{
}

void sub_1B8F30DE0()
{
}

uint64_t sub_1B8F30DF8()
{
  return sub_1B8F39B84((uint64_t)sub_1B8F313F0, MEMORY[0x1E4FBB550]);
}

uint64_t sub_1B8F30E2C()
{
  return sub_1B8F39CE8((uint64_t)sub_1B8F31904, MEMORY[0x1E4FBC098]);
}

uint64_t sub_1B8F30E60()
{
  return sub_1B8F39E4C((uint64_t)sub_1B8F31E1C, MEMORY[0x1E4FBC0F8]);
}

uint64_t sub_1B8F30E94()
{
  return sub_1B8F39FB0((uint64_t)sub_1B8F32338, MEMORY[0x1E4FBC150]);
}

uint64_t sub_1B8F30EC8()
{
  return sub_1B8F39B84((uint64_t)sub_1B8F32860, MEMORY[0x1E4FBC1C8]);
}

uint64_t sub_1B8F30EFC()
{
  return sub_1B8F57D60();
}

uint64_t sub_1B8F30F14()
{
  return sub_1B8F39B84((uint64_t)sub_1B8F32D78, MEMORY[0x1E4FBB808]);
}

uint64_t sub_1B8F30F48()
{
  return sub_1B8F39CE8((uint64_t)sub_1B8F3328C, MEMORY[0x1E4FBC358]);
}

uint64_t sub_1B8F30F7C()
{
  return sub_1B8F39E4C((uint64_t)sub_1B8F337A8, MEMORY[0x1E4FBC450]);
}

uint64_t sub_1B8F30FB0()
{
  return sub_1B8F39FB0((uint64_t)sub_1B8F33CC4, MEMORY[0x1E4FBC4C0]);
}

uint64_t sub_1B8F30FE4()
{
  return sub_1B8F39B84((uint64_t)sub_1B8F341EC, MEMORY[0x1E4FBC538]);
}

uint64_t sub_1B8F31018()
{
  return sub_1B8F57D70();
}

uint64_t sub_1B8F31030@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1B8F30580(a1, a2, a3);
}

uint64_t sub_1B8F31048()
{
  return sub_1B8F57CF0();
}

uint64_t sub_1B8F31060()
{
  return sub_1B8F57CE0();
}

uint64_t sub_1B8F31078()
{
  uint64_t result = sub_1B8F57D00();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F3109C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F312C8(a1, a2, MEMORY[0x1E4FBBE18]);
}

uint64_t sub_1B8F310C8()
{
  uint64_t result = sub_1B8F57D10();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F310EC(uint64_t a1, uint64_t a2)
{
  return sub_1B8F31210(a1, a2, MEMORY[0x1E4FBBE20]);
}

uint64_t sub_1B8F31118(uint64_t a1, uint64_t a2)
{
  return sub_1B8F3126C(a1, a2, MEMORY[0x1E4FBBE28]);
}

uint64_t sub_1B8F31144(uint64_t a1, uint64_t a2)
{
  return sub_1B8F312C8(a1, a2, MEMORY[0x1E4FBBE30]);
}

uint64_t sub_1B8F31170()
{
  uint64_t result = sub_1B8F57D40();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F31194(uint64_t a1, uint64_t a2)
{
  return sub_1B8F31350(a1, a2, MEMORY[0x1E4FBBE40]);
}

uint64_t sub_1B8F311C0()
{
  uint64_t result = sub_1B8F57D20();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F311E4(uint64_t a1, uint64_t a2)
{
  return sub_1B8F31210(a1, a2, MEMORY[0x1E4FBBE38]);
}

uint64_t sub_1B8F31210(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_1B8F31240(uint64_t a1, uint64_t a2)
{
  return sub_1B8F3126C(a1, a2, MEMORY[0x1E4FBBE48]);
}

uint64_t sub_1B8F3126C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_1B8F3129C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F312C8(a1, a2, MEMORY[0x1E4FBBE50]);
}

uint64_t sub_1B8F312C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_1B8F31300()
{
  uint64_t result = sub_1B8F57D50();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_1B8F31324(uint64_t a1, uint64_t a2)
{
  return sub_1B8F31350(a1, a2, MEMORY[0x1E4FBBE58]);
}

uint64_t sub_1B8F31350(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t sub_1B8F3137C()
{
  return sub_1B8F57D30();
}

void sub_1B8F313A8()
{
}

void sub_1B8F313C0(uint64_t *a1@<X8>)
{
}

void sub_1B8F313D8(uint64_t *a1@<X8>)
{
}

uint64_t sub_1B8F313F0(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  v26[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4BD8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)v26 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)v26 - v19;
  sub_1B8F21884(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast()) {
    return v29;
  }
  sub_1B8F21884(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v30 + 1))
      {
        sub_1B8F2160C(&v29, (uint64_t)&v32);
        sub_1B8F57240();
        sub_1B8F39440();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v26[0] + 8))(v5, v2);
        uint64_t v22 = v17;
        uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v22, v8);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B8F3A178(&qword_1E9EF4BE8, &qword_1E9EF4BD8);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v23(v20, v8);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      uint64_t v31 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v27, &qword_1EB9C33F0);
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v31 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v29, &qword_1E9EF4AD8);
  uint64_t v24 = sub_1B8F3499C(a1);
  if (v25) {
    return 0;
  }
  sub_1B8F36D30((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0) {
    return v32;
  }
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F31904(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4BC0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)&v28 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v28 - v19;
  sub_1B8F21884(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast())
  {
    int v21 = 0;
    int v22 = v32;
    return v22 | (v21 << 8);
  }
  sub_1B8F21884(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v33 + 1))
      {
        sub_1B8F2160C(&v32, (uint64_t)v35);
        sub_1B8F57240();
        sub_1B8F393EC();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
        uint64_t v23 = v17;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v23, v8);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B8F3A178(&qword_1E9EF4BD0, &qword_1E9EF4BC0);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v24(v20, v8);
        BYTE1(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        int v22 = v32;
        int v21 = BYTE1(v32);
        return v22 | (v21 << 8);
      }
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v30, &qword_1EB9C33F0);
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v32, &qword_1E9EF4AD8);
  uint64_t v25 = sub_1B8F3499C(a1);
  if (v26)
  {
    int v22 = 0;
    int v21 = 1;
    return v22 | (v21 << 8);
  }
  sub_1B8F36F00(v35, *(double *)&v25);
  if ((v35[0] & 0x100) == 0)
  {
    int v21 = 0;
    int v22 = LOBYTE(v35[0]);
    return v22 | (v21 << 8);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F31E1C(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4BA8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)&v28 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v28 - v19;
  sub_1B8F21884(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast())
  {
    int v21 = 0;
    int v22 = (unsigned __int16)v32;
    return v22 | (v21 << 16);
  }
  sub_1B8F21884(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v33 + 1))
      {
        sub_1B8F2160C(&v32, (uint64_t)v35);
        sub_1B8F57240();
        sub_1B8F39398();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
        uint64_t v23 = v17;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v23, v8);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B8F3A178(&qword_1E9EF4BB8, &qword_1E9EF4BA8);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v24(v20, v8);
        BYTE2(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        int v22 = (unsigned __int16)v32;
        int v21 = BYTE2(v32);
        return v22 | (v21 << 16);
      }
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v30, &qword_1EB9C33F0);
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v32, &qword_1E9EF4AD8);
  uint64_t v25 = sub_1B8F3499C(a1);
  if (v26)
  {
    int v22 = 0;
    int v21 = 1;
    return v22 | (v21 << 16);
  }
  sub_1B8F370B8((uint64_t)v35, *(double *)&v25);
  if ((v35[0] & 0x10000) == 0)
  {
    int v21 = 0;
    int v22 = LOWORD(v35[0]);
    return v22 | (v21 << 16);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

unint64_t sub_1B8F32338(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  v28[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4B90);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)v28 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)v28 - v19;
  sub_1B8F21884(a1, (uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast())
  {
    unsigned __int8 v21 = 0;
    unsigned int v22 = v31;
LABEL_13:
    LOBYTE(v34[0]) = v21;
    return v22 | ((unint64_t)v21 << 32);
  }
  sub_1B8F21884(a1, (uint64_t)v29);
  if (v30)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v32 + 1))
      {
        sub_1B8F2160C(&v31, (uint64_t)v34);
        sub_1B8F57240();
        sub_1B8F39344();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v28[0] + 8))(v5, v2);
        uint64_t v23 = v17;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v23, v8);
        __swift_project_boxed_opaque_existential_1(v34, v34[3]);
        sub_1B8F3A178(&qword_1E9EF4BA0, &qword_1E9EF4B90);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v24(v20, v8);
        BYTE4(v31) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        unsigned int v22 = v31;
        unsigned __int8 v21 = BYTE4(v31);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v29, &qword_1EB9C33F0);
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v31, &qword_1E9EF4AD8);
  uint64_t v25 = sub_1B8F3499C(a1);
  if (v26)
  {
    unsigned int v22 = 0;
    unsigned __int8 v21 = 1;
    goto LABEL_13;
  }
  sub_1B8F37270((uint64_t)v34, *(double *)&v25);
  if ((v34[0] & 0x100000000) == 0)
  {
    unsigned __int8 v21 = 0;
    unsigned int v22 = v34[0];
    goto LABEL_13;
  }
  v34[0] = 0;
  v34[1] = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  unint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F32860(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  v26[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4B78);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)v26 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)v26 - v19;
  sub_1B8F21884(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast()) {
    return v29;
  }
  sub_1B8F21884(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v30 + 1))
      {
        sub_1B8F2160C(&v29, (uint64_t)&v32);
        sub_1B8F57240();
        sub_1B8F392F0();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v26[0] + 8))(v5, v2);
        unsigned int v22 = v17;
        uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v22, v8);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B8F3A178(&qword_1E9EF4B88, &qword_1E9EF4B78);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v23(v20, v8);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      uint64_t v31 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v27, &qword_1EB9C33F0);
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v31 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v29, &qword_1E9EF4AD8);
  uint64_t v24 = sub_1B8F3499C(a1);
  if (v25) {
    return 0;
  }
  sub_1B8F3741C((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0) {
    return v32;
  }
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F32D78(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  v26[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4B60);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)v26 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)v26 - v19;
  sub_1B8F21884(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast()) {
    return v29;
  }
  sub_1B8F21884(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v30 + 1))
      {
        sub_1B8F2160C(&v29, (uint64_t)&v32);
        sub_1B8F57240();
        sub_1B8F3929C();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v26[0] + 8))(v5, v2);
        unsigned int v22 = v17;
        uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v22, v8);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B8F3A178(&qword_1E9EF4B70, &qword_1E9EF4B60);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v23(v20, v8);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      uint64_t v31 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v27, &qword_1EB9C33F0);
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v31 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v29, &qword_1E9EF4AD8);
  uint64_t v24 = sub_1B8F3499C(a1);
  if (v25) {
    return 0;
  }
  sub_1B8F37A08((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0) {
    return v32;
  }
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F3328C(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4B48);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)&v28 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v28 - v19;
  sub_1B8F21884(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast())
  {
    int v21 = 0;
    int v22 = v32;
    return v22 | (v21 << 8);
  }
  sub_1B8F21884(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v33 + 1))
      {
        sub_1B8F2160C(&v32, (uint64_t)v35);
        sub_1B8F57240();
        sub_1B8F39248();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
        uint64_t v23 = v17;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v23, v8);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B8F3A178(&qword_1E9EF4B58, &qword_1E9EF4B48);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v24(v20, v8);
        BYTE1(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        int v22 = v32;
        int v21 = BYTE1(v32);
        return v22 | (v21 << 8);
      }
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v30, &qword_1EB9C33F0);
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v32, &qword_1E9EF4AD8);
  uint64_t v25 = sub_1B8F3499C(a1);
  if (v26)
  {
    int v22 = 0;
    int v21 = 1;
    return v22 | (v21 << 8);
  }
  sub_1B8F375A4(v35, *(double *)&v25);
  if ((v35[0] & 0x100) == 0)
  {
    int v21 = 0;
    int v22 = LOBYTE(v35[0]);
    return v22 | (v21 << 8);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F337A8(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4B30);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)&v28 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)&v28 - v19;
  sub_1B8F21884(a1, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast())
  {
    int v21 = 0;
    int v22 = (unsigned __int16)v32;
    return v22 | (v21 << 16);
  }
  sub_1B8F21884(a1, (uint64_t)v30);
  if (v31)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v33 + 1))
      {
        sub_1B8F2160C(&v32, (uint64_t)v35);
        sub_1B8F57240();
        sub_1B8F391F4();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
        uint64_t v23 = v17;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v23, v8);
        __swift_project_boxed_opaque_existential_1(v35, v35[3]);
        sub_1B8F3A178(&qword_1E9EF4B40, &qword_1E9EF4B30);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v24(v20, v8);
        BYTE2(v32) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
        int v22 = (unsigned __int16)v32;
        int v21 = BYTE2(v32);
        return v22 | (v21 << 16);
      }
    }
    else
    {
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v30, &qword_1EB9C33F0);
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v32, &qword_1E9EF4AD8);
  uint64_t v25 = sub_1B8F3499C(a1);
  if (v26)
  {
    int v22 = 0;
    int v21 = 1;
    return v22 | (v21 << 16);
  }
  sub_1B8F3771C((uint64_t)v35, *(double *)&v25);
  if ((v35[0] & 0x10000) == 0)
  {
    int v21 = 0;
    int v22 = LOWORD(v35[0]);
    return v22 | (v21 << 16);
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

unint64_t sub_1B8F33CC4(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  v28[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF3AD0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)v28 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)v28 - v19;
  sub_1B8F21884(a1, (uint64_t)v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast())
  {
    unsigned __int8 v21 = 0;
    unsigned int v22 = v31;
LABEL_13:
    LOBYTE(v34[0]) = v21;
    return v22 | ((unint64_t)v21 << 32);
  }
  sub_1B8F21884(a1, (uint64_t)v29);
  if (v30)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v32 + 1))
      {
        sub_1B8F2160C(&v31, (uint64_t)v34);
        sub_1B8F57240();
        sub_1B8F391A0();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v28[0] + 8))(v5, v2);
        uint64_t v23 = v17;
        uint64_t v24 = *(void (**)(char *, uint64_t))(v9 + 8);
        v24(v23, v8);
        __swift_project_boxed_opaque_existential_1(v34, v34[3]);
        sub_1B8F3A178(&qword_1E9EF4B28, qword_1E9EF3AD0);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v24(v20, v8);
        BYTE4(v31) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
        unsigned int v22 = v31;
        unsigned __int8 v21 = BYTE4(v31);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v29, &qword_1EB9C33F0);
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v31, &qword_1E9EF4AD8);
  uint64_t v25 = sub_1B8F3499C(a1);
  if (v26)
  {
    unsigned int v22 = 0;
    unsigned __int8 v21 = 1;
    goto LABEL_13;
  }
  sub_1B8F37894((uint64_t)v34, *(double *)&v25);
  if ((v34[0] & 0x100000000) == 0)
  {
    unsigned __int8 v21 = 0;
    unsigned int v22 = v34[0];
    goto LABEL_13;
  }
  v34[0] = 0;
  v34[1] = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  unint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F341EC(uint64_t a1)
{
  uint64_t v2 = sub_1B8F570C0();
  v26[0] = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1B8F57290();
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4B08);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v11, v14);
  uint64_t v17 = (char *)v26 - v16;
  MEMORY[0x1F4188790](v15, v18);
  uint64_t v20 = (char *)v26 - v19;
  sub_1B8F21884(a1, (uint64_t)&v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast()) {
    return v29;
  }
  sub_1B8F21884(a1, (uint64_t)v27);
  if (v28)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v30 + 1))
      {
        sub_1B8F2160C(&v29, (uint64_t)&v32);
        sub_1B8F57240();
        sub_1B8F3914C();
        sub_1B8F56FA0();
        sub_1B8F570B0();
        MEMORY[0x1BA9CED80](v5, v8);
        (*(void (**)(char *, uint64_t))(v26[0] + 8))(v5, v2);
        unsigned int v22 = v17;
        uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
        v23(v22, v8);
        __swift_project_boxed_opaque_existential_1(&v32, v34);
        sub_1B8F3A178(&qword_1E9EF4B18, &qword_1E9EF4B08);
        sub_1B8F579D0();
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v20, v8);
        sub_1B8F579E0();
        v23(v20, v8);
        BYTE8(v29) = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
        return v29;
      }
    }
    else
    {
      uint64_t v31 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v27, &qword_1EB9C33F0);
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v31 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v29, &qword_1E9EF4AD8);
  uint64_t v24 = sub_1B8F3499C(a1);
  if (v25) {
    return 0;
  }
  sub_1B8F37A08((uint64_t)&v32, *(double *)&v24);
  if ((v33 & 1) == 0) {
    return v32;
  }
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  sub_1B8F57560();
  uint64_t result = sub_1B8F57BB0();
  __break(1u);
  return result;
}

uint64_t sub_1B8F34704(uint64_t a1, uint64_t a2)
{
  sub_1B8F21884(a2, (uint64_t)&v11);
  if (v12)
  {
    sub_1B8F122C0(&v11, &v13);
    uint64_t v3 = sub_1B8F57A80();
    uint64_t v4 = swift_allocError();
    uint64_t v6 = v5;
    void *v5 = a1;
    *(void *)&long long v11 = 0;
    *((void *)&v11 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1B8F57A30();
    swift_bridgeObjectRelease();
    *(void *)&long long v11 = 0xD000000000000013;
    *((void *)&v11 + 1) = 0x80000001B8F5C5B0;
    sub_1B8F58260();
    sub_1B8F57560();
    swift_bridgeObjectRelease();
    sub_1B8F57560();
    __swift_project_boxed_opaque_existential_1(&v13, v14);
    swift_getDynamicType();
    sub_1B8F58260();
    sub_1B8F57560();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4C30);
    sub_1B8F57560();
    sub_1B8F57A70();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v6, *MEMORY[0x1E4FBBA70], v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)&v11, &qword_1EB9C33F0);
    uint64_t v7 = sub_1B8F57A80();
    uint64_t v4 = swift_allocError();
    uint64_t v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4C30);
    *uint64_t v9 = a1;
    swift_bridgeObjectRetain();
    sub_1B8F57A70();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x1E4FBBA80], v7);
  }
  return v4;
}

uint64_t sub_1B8F3499C(uint64_t a1)
{
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AB8);
  uint64_t v61 = *(void *)(v59 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v59, v2);
  uint64_t v60 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)v53 - v6;
  uint64_t v8 = sub_1B8F570C0();
  unint64_t v64 = *(char **)(v8 - 8);
  uint64_t v65 = v8;
  MEMORY[0x1F4188790](v8, v9);
  long long v11 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = (void (*)(char *, uint64_t))sub_1B8F570A0();
  uint64_t v62 = *((void *)v63 - 1);
  MEMORY[0x1F4188790](v63, v12);
  uint64_t v14 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1B8F57290();
  MEMORY[0x1F4188790](v15 - 8, v16);
  uint64_t v18 = (char *)v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AC0);
  uint64_t v67 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19, v20);
  uint64_t v23 = (char *)v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v21, v24);
  unint64_t v27 = (char *)v53 - v26;
  uint64_t v29 = MEMORY[0x1F4188790](v25, v28);
  uint64_t v31 = (char *)v53 - v30;
  MEMORY[0x1F4188790](v29, v32);
  uint64_t v34 = (char *)v53 - v33;
  unint64_t v66 = (char *)a1;
  sub_1B8F21884(a1, (uint64_t)v73);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (swift_dynamicCast()) {
    return v70;
  }
  uint64_t v56 = v7;
  uint64_t v58 = v23;
  sub_1B8F57240();
  unint64_t v36 = sub_1B8F390A4();
  uint64_t v55 = v18;
  unint64_t v57 = v36;
  sub_1B8F57060();
  sub_1B8F57090();
  MEMORY[0x1BA9CEE20](v14, v19);
  (*(void (**)(char *, void *))(v62 + 8))(v14, v63);
  uint64_t v37 = v67;
  uint64_t v38 = *(void (**)(char *, uint64_t))(v67 + 8);
  v38(v27, v19);
  sub_1B8F570B0();
  MEMORY[0x1BA9CEE40](v11, v19);
  uint64_t v39 = v65;
  uint64_t v63 = (void (*)(char *, uint64_t))*((void *)v64 + 1);
  unint64_t v64 = v11;
  v63(v11, v65);
  uint64_t v40 = v31;
  uint64_t v41 = v38;
  v38(v40, v19);
  uint64_t v42 = (uint64_t)v66;
  sub_1B8F21884((uint64_t)v66, (uint64_t)v68);
  uint64_t v43 = v37;
  uint64_t v44 = v39;
  if (v69)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AF8);
    if (swift_dynamicCast())
    {
      if (*((void *)&v71 + 1))
      {
        sub_1B8F2160C(&v70, (uint64_t)v73);
        __swift_project_boxed_opaque_existential_1(v73, v74);
        sub_1B8F3A178(&qword_1E9EF4B00, &qword_1E9EF4AC0);
        uint64_t v45 = v41;
        sub_1B8F573E0();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
        uint64_t v46 = v58;
LABEL_13:
        (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v46, v34, v19);
        sub_1B8F573F0();
        v45(v34, v19);
        return v73[0];
      }
    }
    else
    {
      uint64_t v72 = 0;
      long long v70 = 0u;
      long long v71 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v68, &qword_1EB9C33F0);
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v72 = 0;
  }
  sub_1B8F1DBD4((uint64_t)&v70, &qword_1E9EF4AD0);
  sub_1B8F21884(v42, (uint64_t)v68);
  if (v69)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v71 + 1))
      {
        sub_1B8F2160C(&v70, (uint64_t)v73);
        uint64_t v62 = v19;
        unint64_t v66 = v34;
        v53[2] = __swift_project_boxed_opaque_existential_1(v73, v74);
        sub_1B8F57240();
        unint64_t v47 = sub_1B8F390F8();
        uint64_t v54 = v41;
        v53[1] = v47;
        uint64_t v48 = v60;
        sub_1B8F56FA0();
        uint64_t v49 = v64;
        sub_1B8F570B0();
        uint64_t v50 = v56;
        uint64_t v51 = v59;
        MEMORY[0x1BA9CED80](v49, v59);
        v63(v49, v44);
        uint64_t v52 = *(void (**)(char *, uint64_t))(v61 + 8);
        v52(v48, v51);
        uint64_t v34 = v66;
        sub_1B8F3A178(&qword_1E9EF4AF0, &qword_1E9EF4AB8);
        uint64_t v19 = v62;
        uint64_t v43 = v67;
        uint64_t v45 = v54;
        sub_1B8F579D0();
        v52(v50, v51);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
        uint64_t v46 = v58;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v72 = 0;
      long long v70 = 0u;
      long long v71 = 0u;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v68, &qword_1EB9C33F0);
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v72 = 0;
  }
  v41(v34, v19);
  sub_1B8F1DBD4((uint64_t)&v70, &qword_1E9EF4AD8);
  return 0;
}

unint64_t sub_1B8F351A0(uint64_t a1)
{
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AB8);
  uint64_t v63 = *(void *)(v61 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v61, v2);
  uint64_t v62 = (char *)v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)v55 - v6;
  uint64_t v8 = sub_1B8F570C0();
  unint64_t v66 = *(char **)(v8 - 8);
  uint64_t v67 = v8;
  MEMORY[0x1F4188790](v8, v9);
  long long v11 = (char *)v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = (void (*)(char *, uint64_t))sub_1B8F570A0();
  uint64_t v64 = *((void *)v65 - 1);
  MEMORY[0x1F4188790](v65, v12);
  uint64_t v14 = (char *)v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1B8F57290();
  MEMORY[0x1F4188790](v15 - 8, v16);
  uint64_t v18 = (char *)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4BF0);
  uint64_t v69 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19, v20);
  uint64_t v23 = (char *)v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v21, v24);
  unint64_t v27 = (char *)v55 - v26;
  uint64_t v29 = MEMORY[0x1F4188790](v25, v28);
  uint64_t v31 = (char *)v55 - v30;
  MEMORY[0x1F4188790](v29, v32);
  uint64_t v34 = (char *)v55 - v33;
  unint64_t v68 = (char *)a1;
  sub_1B8F21884(a1, (uint64_t)v75);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  if (!swift_dynamicCast())
  {
    uint64_t v58 = v7;
    uint64_t v60 = v23;
    sub_1B8F57240();
    unint64_t v37 = sub_1B8F39494();
    unint64_t v57 = v18;
    unint64_t v59 = v37;
    sub_1B8F57060();
    sub_1B8F57090();
    MEMORY[0x1BA9CEE20](v14, v19);
    (*(void (**)(char *, void *))(v64 + 8))(v14, v65);
    uint64_t v38 = v69;
    uint64_t v39 = *(void (**)(char *, uint64_t))(v69 + 8);
    v39(v27, v19);
    sub_1B8F570B0();
    MEMORY[0x1BA9CEE40](v11, v19);
    uint64_t v40 = v67;
    uint64_t v65 = (void (*)(char *, uint64_t))*((void *)v66 + 1);
    unint64_t v66 = v11;
    v65(v11, v67);
    uint64_t v41 = v31;
    uint64_t v42 = v39;
    v39(v41, v19);
    uint64_t v43 = (uint64_t)v68;
    sub_1B8F21884((uint64_t)v68, (uint64_t)v70);
    uint64_t v44 = v38;
    uint64_t v45 = v40;
    if (v71)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AF8);
      if (swift_dynamicCast())
      {
        if (*((void *)&v73 + 1))
        {
          sub_1B8F2160C(&v72, (uint64_t)v75);
          __swift_project_boxed_opaque_existential_1(v75, v76);
          sub_1B8F3A178(&qword_1E9EF4C00, &qword_1E9EF4BF0);
          uint64_t v46 = v42;
          sub_1B8F573E0();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
          unint64_t v47 = v60;
LABEL_13:
          (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v47, v34, v19);
          sub_1B8F573F0();
          v46(v34, v19);
          unsigned __int8 v35 = 0;
          unsigned int v36 = v75[0];
          return v36 | ((unint64_t)v35 << 32);
        }
      }
      else
      {
        uint64_t v74 = 0;
        long long v72 = 0u;
        long long v73 = 0u;
      }
    }
    else
    {
      sub_1B8F1DBD4((uint64_t)v70, &qword_1EB9C33F0);
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v74 = 0;
    }
    sub_1B8F1DBD4((uint64_t)&v72, &qword_1E9EF4AD0);
    sub_1B8F21884(v43, (uint64_t)v70);
    if (v71)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AE0);
      if (swift_dynamicCast())
      {
        if (*((void *)&v73 + 1))
        {
          sub_1B8F2160C(&v72, (uint64_t)v75);
          uint64_t v64 = v19;
          unint64_t v68 = v34;
          v55[2] = __swift_project_boxed_opaque_existential_1(v75, v76);
          sub_1B8F57240();
          unint64_t v48 = sub_1B8F390F8();
          uint64_t v56 = v42;
          v55[1] = v48;
          uint64_t v49 = v62;
          sub_1B8F56FA0();
          uint64_t v50 = v66;
          sub_1B8F570B0();
          uint64_t v51 = v58;
          uint64_t v52 = v61;
          MEMORY[0x1BA9CED80](v50, v61);
          v65(v50, v45);
          unint64_t v53 = *(void (**)(char *, uint64_t))(v63 + 8);
          v53(v49, v52);
          uint64_t v34 = v68;
          sub_1B8F3A178(&qword_1E9EF4AF0, &qword_1E9EF4AB8);
          uint64_t v19 = v64;
          uint64_t v44 = v69;
          uint64_t v46 = v56;
          sub_1B8F579D0();
          v53(v51, v52);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
          unint64_t v47 = v60;
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v74 = 0;
        long long v72 = 0u;
        long long v73 = 0u;
      }
    }
    else
    {
      sub_1B8F1DBD4((uint64_t)v70, &qword_1EB9C33F0);
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v74 = 0;
    }
    v42(v34, v19);
    sub_1B8F1DBD4((uint64_t)&v72, &qword_1E9EF4AD8);
    unsigned int v36 = 0;
    unsigned __int8 v35 = 1;
    return v36 | ((unint64_t)v35 << 32);
  }
  unsigned __int8 v35 = 0;
  unsigned int v36 = v72;
  return v36 | ((unint64_t)v35 << 32);
}

uint64_t sub_1B8F359B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AA8);
  MEMORY[0x1F4188790](v3 - 8, v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B8F57120();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  long long v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B8F21884(v1 + 72, (uint64_t)v19);
  if (v20)
  {
    sub_1B8F21884((uint64_t)v19, (uint64_t)v18);
    if (swift_dynamicCast())
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v11, v7);
LABEL_10:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      return sub_1B8F1DBD4((uint64_t)v19, &qword_1EB9C33F0);
    }
    if (swift_dynamicCast())
    {
      sub_1B8F57110();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        sub_1B8F1DBD4((uint64_t)v6, &qword_1E9EF4AA8);
        uint64_t v12 = sub_1B8F57A80();
        swift_allocError();
        uint64_t v14 = v13;
        unint64_t v16 = 0;
        unint64_t v17 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_1B8F57A30();
        swift_bridgeObjectRelease();
        unint64_t v16 = 0xD000000000000019;
        unint64_t v17 = 0x80000001B8F5C560;
        sub_1B8F57560();
        swift_bridgeObjectRelease();
        sub_1B8F57A70();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x1E4FBBA78], v12);
        swift_willThrow();
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v6, v7);
      }
      goto LABEL_10;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  sub_1B8F34704(v7, v1 + 72);
  swift_willThrow();
  return sub_1B8F1DBD4((uint64_t)v19, &qword_1EB9C33F0);
}

uint64_t sub_1B8F35CC8()
{
  sub_1B8F21884((uint64_t)(v0 + 9), (uint64_t)v32);
  if (v33)
  {
    if (swift_dynamicCast()) {
      return v31;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v32, &qword_1EB9C33F0);
  }
  uint64_t v4 = (uint64_t (*)(void *))v0[7];
  uint64_t v3 = v0[8];
  if (v4)
  {
    if (v4 == (uint64_t (*)(void *))1)
    {
      sub_1B8F21884((uint64_t)(v0 + 9), (uint64_t)v32);
      if (v33)
      {
        if (swift_dynamicCast())
        {
          uint64_t v2 = sub_1B8F57130();
          unint64_t v6 = v5;
          swift_bridgeObjectRelease();
          if (v6 >> 60 != 15) {
            return v2;
          }
        }
      }
      else
      {
        sub_1B8F1DBD4((uint64_t)v32, &qword_1EB9C33F0);
      }
      sub_1B8F34704(MEMORY[0x1E4F277C0], (uint64_t)(v0 + 9));
      swift_willThrow();
      return v2;
    }
    uint64_t v35 = v1;
    uint64_t v17 = *v0;
    uint64_t v18 = v0[1];
    uint64_t v19 = v0[2];
    uint64_t v20 = (void *)v0[4];
    uint64_t v27 = v0[3];
    uint64_t v29 = v0[5];
    char v21 = *((unsigned char *)v0 + 48);
    sub_1B8F21884((uint64_t)(v0 + 9), (uint64_t)v32);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v17;
    *(void *)(v23 + 24) = v18;
    *(void *)(v23 + 32) = v19;
    uint64_t v2 = v19;
    *(void *)(v23 + 40) = v27;
    *(void *)(v23 + 48) = v20;
    *(void *)(v23 + 56) = v29;
    *(unsigned char *)(v23 + 64) = v21;
    *(void *)(v23 + 72) = v4;
    *(void *)(v23 + 80) = v3;
    sub_1B8F37BAC((uint64_t)v32, v23 + 88);
    uint64_t v33 = v22;
    uint64_t v34 = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
    v32[0] = v23;
    sub_1B8F2C708((unint64_t)v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v19);
    sub_1B8F2C560(v20, v29, v21);
    sub_1B8F2C708((unint64_t)v4);
    swift_retain();
    uint64_t v24 = v35;
    uint64_t v25 = v4(v32);
    if (!v24) {
      uint64_t v2 = v25;
    }
    sub_1B8F2C76C((unint64_t)v4);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    uint64_t v8 = *v0;
    uint64_t v7 = v0[1];
    uint64_t v9 = v0[3];
    uint64_t v35 = v0[2];
    uint64_t v10 = v35;
    long long v11 = (void *)v0[4];
    uint64_t v28 = v9;
    uint64_t v30 = v0[5];
    char v12 = *((unsigned char *)v0 + 48);
    sub_1B8F21884((uint64_t)(v0 + 9), (uint64_t)v32);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v8;
    *(void *)(v14 + 24) = v7;
    *(void *)(v14 + 32) = v10;
    *(void *)(v14 + 40) = v28;
    *(void *)(v14 + 48) = v11;
    uint64_t v15 = v11;
    uint64_t v2 = v30;
    *(void *)(v14 + 56) = v30;
    *(unsigned char *)(v14 + 64) = v12;
    *(void *)(v14 + 72) = 0;
    *(void *)(v14 + 80) = v3;
    sub_1B8F37BAC((uint64_t)v32, v14 + 88);
    uint64_t v33 = v13;
    uint64_t v34 = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
    v32[0] = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v35);
    sub_1B8F2C560(v15, v30, v12);
    sub_1B8F2C708(0);
    uint64_t v16 = sub_1B8F57180();
    if (!v1) {
      return v16;
    }
  }
  return v2;
}

uint64_t sub_1B8F36080@<X0>(uint64_t a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4AB0);
  uint64_t v5 = MEMORY[0x1F4188790](v3 - 8, v4);
  unint64_t v59 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v7);
  uint64_t v9 = (char *)&v56 - v8;
  uint64_t v10 = sub_1B8F57200();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v10, v12);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v13, v16);
  uint64_t v58 = (char *)&v56 - v18;
  MEMORY[0x1F4188790](v17, v19);
  char v21 = (char *)&v56 - v20;
  uint64_t v22 = (uint64_t)(v1 + 9);
  sub_1B8F21884((uint64_t)(v1 + 9), (uint64_t)v61);
  if (v62)
  {
    int v23 = swift_dynamicCast();
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v24(v9, v23 ^ 1u, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v25(v21, v9, v10);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v25)(v64, v21, v10);
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v61, &qword_1EB9C33F0);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v24(v9, 1, 1, v10);
  }
  uint64_t v60 = v2;
  sub_1B8F1DBD4((uint64_t)v9, &qword_1E9EF4AB0);
  unint64_t v28 = (unint64_t)v1[4];
  uint64_t v27 = (uint64_t)v1[5];
  if (*((unsigned char *)v1 + 48))
  {
    if (*((unsigned char *)v1 + 48) == 1)
    {
      uint64_t v29 = v1[4];
      uint64_t v31 = (uint64_t)v1[5];
      uint64_t v32 = v1[1];
      uint64_t v33 = (uint64_t)v1[2];
      uint64_t v58 = *v1;
      uint64_t v30 = v58;
      unint64_t v59 = v32;
      unint64_t v57 = v1[3];
      unint64_t v35 = (unint64_t)v1[7];
      uint64_t v34 = v1[8];
      sub_1B8F21884(v22, (uint64_t)v61);
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = v30;
      *(void *)(v37 + 24) = v32;
      *(void *)(v37 + 32) = v33;
      *(void *)(v37 + 40) = v57;
      *(void *)(v37 + 48) = v29;
      *(void *)(v37 + 56) = v31;
      *(unsigned char *)(v37 + 64) = 1;
      *(void *)(v37 + 72) = v35;
      *(void *)(v37 + 80) = v34;
      sub_1B8F37BAC((uint64_t)v61, v37 + 88);
      uint64_t v62 = v36;
      uint64_t v63 = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
      v61[0] = v37;
      sub_1B8F2C560(v29, v31, 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B8F2C368(v33);
      sub_1B8F2C560(v29, v31, 1);
      sub_1B8F2C708(v35);
      swift_retain();
      ((void (*)(void *))v29)(v61);
      sub_1B8F2C5DC(v29, v31, 1);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    }
    if (!(v28 | v27))
    {
      unint64_t v48 = *v1;
      uint64_t v49 = v1[1];
      uint64_t v50 = (uint64_t)v1[2];
      uint64_t v58 = v1[3];
      unint64_t v59 = v48;
      unint64_t v51 = (unint64_t)v1[7];
      uint64_t v52 = v1[8];
      sub_1B8F21884((uint64_t)(v1 + 9), (uint64_t)v61);
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A98);
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = v48;
      *(void *)(v54 + 24) = v49;
      *(void *)(v54 + 32) = v50;
      *(void *)(v54 + 40) = v58;
      *(void *)(v54 + 48) = v28;
      *(void *)(v54 + 56) = v27;
      *(unsigned char *)(v54 + 64) = 2;
      *(void *)(v54 + 72) = v51;
      *(void *)(v54 + 80) = v52;
      sub_1B8F37BAC((uint64_t)v61, v54 + 88);
      uint64_t v62 = v53;
      uint64_t v63 = sub_1B8F3A178(&qword_1E9EF4AA0, &qword_1E9EF4A98);
      v61[0] = v54;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B8F2C368(v50);
      sub_1B8F2C560((id)v28, v27, 2);
      sub_1B8F2C708(v51);
      return sub_1B8F571E0();
    }
    uint64_t v44 = (uint64_t)(v1 + 9);
    if (v28 ^ 1 | v27)
    {
      sub_1B8F3499C(v44);
      if ((v55 & 1) == 0) {
        return sub_1B8F571B0();
      }
    }
    else
    {
      sub_1B8F3499C(v44);
      if ((v45 & 1) == 0) {
        return sub_1B8F571B0();
      }
    }
  }
  else
  {
    sub_1B8F21884((uint64_t)(v1 + 9), (uint64_t)v61);
    if (v62)
    {
      uint64_t v38 = (char *)(id)v28;
      if (swift_dynamicCast())
      {
        unint64_t v57 = v38;
        uint64_t v56 = sub_1B8F574C0();
        swift_bridgeObjectRelease();
        uint64_t v39 = (void *)v56;
        unint64_t v57 = (char *)objc_msgSend(v57, sel_dateFromString_, v56);

        uint64_t v40 = v57;
        if (v57)
        {
          sub_1B8F571D0();

          sub_1B8F2C5DC((void *)v28, v27, 0);
          uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
          uint64_t v42 = (uint64_t)v59;
          v41(v59, v15, v10);
          v24((char *)v42, 0, 1, v10);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v42, 1, v10) != 1)
          {
            uint64_t v43 = v58;
            v41(v58, (char *)v42, v10);
            return ((uint64_t (*)(uint64_t, char *, uint64_t))v41)(v64, v43, v10);
          }
        }
        else
        {
          sub_1B8F2C5DC((void *)v28, v27, 0);
          uint64_t v42 = (uint64_t)v59;
          v24(v59, 1, 1, v10);
        }
        sub_1B8F1DBD4(v42, &qword_1E9EF4AB0);
        goto LABEL_24;
      }
    }
    else
    {
      id v46 = (id)v28;
      sub_1B8F1DBD4((uint64_t)v61, &qword_1EB9C33F0);
    }
    unint64_t v47 = (void *)sub_1B8F34704(MEMORY[0x1E4FBB1A0], (uint64_t)(v1 + 9));
    swift_willThrow();

    sub_1B8F2C5DC((void *)v28, v27, 0);
  }
LABEL_24:
  sub_1B8F34704(v10, (uint64_t)(v1 + 9));
  return swift_willThrow();
}

BOOL sub_1B8F36794()
{
  sub_1B8F21884(v0 + 72, (uint64_t)v3);
  BOOL v1 = v3[3] == 0;
  sub_1B8F1DBD4((uint64_t)v3, &qword_1EB9C33F0);
  return v1;
}

BOOL sub_1B8F367E4()
{
  return sub_1B8F394E8();
}

uint64_t sub_1B8F36800()
{
  sub_1B8F21884(v0 + 72, (uint64_t)v3);
  if (v4)
  {
    if (swift_dynamicCast()) {
      return v2;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v3, &qword_1EB9C33F0);
  }
  sub_1B8F34704(MEMORY[0x1E4FBB1A0], v0 + 72);
  return swift_willThrow();
}

uint64_t sub_1B8F368A0()
{
  uint64_t result = sub_1B8F3499C(v0 + 72);
  if (v2)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB3D0], v0 + 72);
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_1B8F368F8()
{
  unint64_t result = sub_1B8F351A0(v0 + 72);
  if ((result & 0x100000000) != 0)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB470], v0 + 72);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_1B8F36950(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36A54(a1, a2, sub_1B8F313F0, MEMORY[0x1E4FBB550]);
}

uint64_t sub_1B8F36984(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36B38(a1, a2, sub_1B8F31904, MEMORY[0x1E4FBC098]);
}

uint64_t sub_1B8F369B8(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36BD0(a1, a2, sub_1B8F31E1C, MEMORY[0x1E4FBC0F8]);
}

uint64_t sub_1B8F369EC(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36C68(a1, a2, (uint64_t (*)(uint64_t))sub_1B8F32338, MEMORY[0x1E4FBC150]);
}

uint64_t sub_1B8F36A20(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36A54(a1, a2, sub_1B8F32860, MEMORY[0x1E4FBC1C8]);
}

uint64_t sub_1B8F36A54(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6 = a3(v4 + 72);
  if (v7)
  {
    sub_1B8F34704(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B8F36AB8()
{
  return sub_1B8F57F10();
}

uint64_t sub_1B8F36AD0(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36A54(a1, a2, sub_1B8F32D78, MEMORY[0x1E4FBB808]);
}

uint64_t sub_1B8F36B04(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36B38(a1, a2, sub_1B8F3328C, MEMORY[0x1E4FBC358]);
}

uint64_t sub_1B8F36B38(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6 = a3(v4 + 72);
  if ((v6 & 0x100) != 0)
  {
    sub_1B8F34704(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B8F36B9C(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36BD0(a1, a2, sub_1B8F337A8, MEMORY[0x1E4FBC450]);
}

uint64_t sub_1B8F36BD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6 = a3(v4 + 72);
  if ((v6 & 0x10000) != 0)
  {
    sub_1B8F34704(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B8F36C34(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36C68(a1, a2, (uint64_t (*)(uint64_t))sub_1B8F33CC4, MEMORY[0x1E4FBC4C0]);
}

uint64_t sub_1B8F36C68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6 = a3(v4 + 72);
  if ((v6 & 0x100000000) != 0)
  {
    sub_1B8F34704(a4, v4 + 72);
    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1B8F36CCC(uint64_t a1, uint64_t a2)
{
  return sub_1B8F36A54(a1, a2, sub_1B8F341EC, MEMORY[0x1E4FBC538]);
}

uint64_t sub_1B8F36D00()
{
  return sub_1B8F57F20();
}

uint64_t sub_1B8F36D18@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1B8F2EFE4(a1, a2, a3);
}

uint64_t sub_1B8F36D30(uint64_t a1, double a2)
{
  uint64_t v4 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v6 = v4 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    unint64_t v15 = 0;
    uint64_t result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047) {
    goto LABEL_28;
  }
  uint64_t v7 = sub_1B8F577F0();
  if (v7 > 63) {
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_1B8F577E0();
  uint64_t result = v8 >= v9;
  uint64_t v11 = v9 + __clz(__rbit64(v5));
  uint64_t v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64) {
      goto LABEL_11;
    }
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if ((v12 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)v12 < 0x40)
    {
      unint64_t v14 = v5 << v12;
      if (v8 != 63) {
        goto LABEL_17;
      }
LABEL_32:
      if (a2 < 0.0 && !v14) {
        goto LABEL_34;
      }
      goto LABEL_28;
    }
    goto LABEL_11;
  }
  if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
  {
LABEL_11:
    if (v8 != 63)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      if (v8 < 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
LABEL_27:
    if (a2 < 0.0)
    {
LABEL_34:
      LOBYTE(v6) = 0;
      unint64_t v15 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    unint64_t v15 = 0;
    uint64_t result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  unint64_t v14 = v5 >> (v11 - v8);
  if (v8 == 63) {
    goto LABEL_32;
  }
LABEL_17:
  if (v8 < 0)
  {
    uint64_t v13 = 0;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 1 << v8;
LABEL_20:
  unint64_t v15 = v14 | v13;
  if (a2 >= 0.0)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      goto LABEL_25;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    LOBYTE(v6) = 0;
    unint64_t v15 = -(uint64_t)v15;
LABEL_25:
    *(void *)a1 = v15;
    *(unsigned char *)(a1 + 8) = v6;
    return result;
  }
  uint64_t result = sub_1B8F57BA0();
  __break(1u);
  return result;
}

BOOL sub_1B8F36F00(unsigned char *a1, double a2)
{
  int v4 = LODWORD(a2);
  uint64_t v5 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v6 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v7 = v5 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    LOBYTE(v15) = 0;
    BOOL result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (uint64_t v8 = sub_1B8F577F0(), v8 > 7))
  {
LABEL_38:
    LOBYTE(v15) = 0;
    BOOL result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B8F577E0();
  BOOL result = v9 >= v10;
  uint64_t v12 = v10 + __clz(__rbit64(v6));
  uint64_t v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 7)
  {
    if ((unint64_t)(v13 - 65) >= 0xFFFFFFFFFFFFFF7FLL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0) {
          LOBYTE(v13) = 0;
        }
        else {
          uint64_t v13 = v6 >> (v12 - v9);
        }
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LOBYTE(v13) = 0;
      }
      else
      {
        uint64_t v13 = v6 << v13;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
LABEL_20:
    if (v9 != 7)
    {
      if (v9 < 0)
      {
        LOBYTE(v14) = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_BYTE)v13) {
      goto LABEL_38;
    }
    goto LABEL_33;
  }
  if (v13 >= -8 && v13 <= 8)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFF8) {
        goto LABEL_8;
      }
      LODWORD(v13) = v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 8) {
        goto LABEL_8;
      }
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 7) {
    goto LABEL_37;
  }
  LOBYTE(v14) = 0;
  LOBYTE(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0) {
LABEL_23:
  }
    int v14 = 1 << v9;
LABEL_24:
  int v15 = (char)(v13 | v14);
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0) {
      goto LABEL_38;
    }
LABEL_33:
    LOBYTE(v7) = 0;
    LOBYTE(v15) = 0x80;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  int v15 = -v15;
LABEL_29:
  *a1 = v15;
  a1[1] = v7;
  return result;
}

BOOL sub_1B8F370B8(uint64_t a1, double a2)
{
  int v4 = LODWORD(a2);
  uint64_t v5 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v6 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v7 = v5 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    LOWORD(v15) = 0;
    BOOL result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (uint64_t v8 = sub_1B8F577F0(), v8 > 15))
  {
LABEL_38:
    LOWORD(v15) = 0;
    BOOL result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B8F577E0();
  BOOL result = v9 >= v10;
  uint64_t v12 = v10 + __clz(__rbit64(v6));
  uint64_t v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 15)
  {
    if ((unint64_t)(v13 - 65) >= 0xFFFFFFFFFFFFFF7FLL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0) {
          LOWORD(v13) = 0;
        }
        else {
          uint64_t v13 = v6 >> (v12 - v9);
        }
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LOWORD(v13) = 0;
      }
      else
      {
        uint64_t v13 = v6 << v13;
      }
    }
    else
    {
      LOWORD(v13) = 0;
    }
LABEL_20:
    if (v9 != 15)
    {
      if (v9 < 0)
      {
        LOWORD(v14) = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || (_WORD)v13) {
      goto LABEL_38;
    }
    goto LABEL_33;
  }
  if (v13 >= -16 && v13 <= 16)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFF0) {
        goto LABEL_8;
      }
      LODWORD(v13) = (unsigned __int16)v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 0x10) {
        goto LABEL_8;
      }
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 15) {
    goto LABEL_37;
  }
  LOWORD(v14) = 0;
  LOWORD(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0) {
LABEL_23:
  }
    int v14 = 1 << v9;
LABEL_24:
  int v15 = (__int16)(v13 | v14);
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0) {
      goto LABEL_38;
    }
LABEL_33:
    LOBYTE(v7) = 0;
    LOWORD(v15) = 0x8000;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  int v15 = -v15;
LABEL_29:
  *(_WORD *)a1 = v15;
  *(unsigned char *)(a1 + 2) = v7;
  return result;
}

BOOL sub_1B8F37270(uint64_t a1, double a2)
{
  unsigned int v4 = LODWORD(a2);
  uint64_t v5 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v6 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v7 = v5 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v7)
  {
    int v15 = 0;
    BOOL result = 1;
    goto LABEL_29;
  }
  if (v5 == 2047 || (uint64_t v8 = sub_1B8F577F0(), v8 > 31))
  {
LABEL_38:
    int v15 = 0;
    BOOL result = 0;
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B8F577E0();
  BOOL result = v9 >= v10;
  uint64_t v12 = v10 + __clz(__rbit64(v6));
  uint64_t v13 = v9 - v12;
  if (__OFSUB__(v9, v12))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 > 31)
  {
    if ((unint64_t)(v13 - 65) >= 0xFFFFFFFFFFFFFF7FLL)
    {
      if (v13 < 0)
      {
        if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFC0) {
          LODWORD(v13) = 0;
        }
        else {
          uint64_t v13 = v6 >> (v12 - v9);
        }
      }
      else if ((unint64_t)v13 >= 0x40)
      {
        LODWORD(v13) = 0;
      }
      else
      {
        uint64_t v13 = v6 << v13;
      }
    }
    else
    {
      LODWORD(v13) = 0;
    }
LABEL_20:
    if (v9 != 31)
    {
      if (v9 < 0)
      {
        int v14 = 0;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_31:
    if (a2 >= 0.0 || v13) {
      goto LABEL_38;
    }
    goto LABEL_33;
  }
  if (v13 >= -32 && v13 <= 32)
  {
    if (v13 < 0)
    {
      if ((unint64_t)v13 <= 0xFFFFFFFFFFFFFFE0) {
        goto LABEL_8;
      }
      LODWORD(v13) = v4 >> (v12 - v9);
    }
    else
    {
      if ((unint64_t)v13 >= 0x20) {
        goto LABEL_8;
      }
      LODWORD(v13) = v4 << v13;
    }
    goto LABEL_20;
  }
LABEL_8:
  if (v9 == 31) {
    goto LABEL_37;
  }
  int v14 = 0;
  LODWORD(v13) = 0;
  if ((v9 & 0x8000000000000000) == 0) {
LABEL_23:
  }
    int v14 = 1 << v9;
LABEL_24:
  int v15 = v13 | v14;
  if (a2 >= 0.0)
  {
    if ((v15 & 0x80000000) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_29;
    }
    goto LABEL_36;
  }
  if (v15 < 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (a2 >= 0.0) {
      goto LABEL_38;
    }
LABEL_33:
    LOBYTE(v7) = 0;
    int v15 = 0x80000000;
    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  int v15 = -v15;
LABEL_29:
  *(_DWORD *)a1 = v15;
  *(unsigned char *)(a1 + 4) = v7;
  return result;
}

BOOL sub_1B8F3741C(uint64_t a1, double a2)
{
  uint64_t v4 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v6 = v4 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    uint64_t v12 = 0;
    BOOL result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047) {
    goto LABEL_28;
  }
  uint64_t v7 = sub_1B8F577F0();
  if (v7 > 63) {
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_1B8F577E0();
  BOOL result = v8 >= v9;
  uint64_t v11 = v9 + __clz(__rbit64(v5));
  uint64_t v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
LABEL_27:
    if (a2 < 0.0)
    {
LABEL_36:
      LOBYTE(v6) = 0;
      uint64_t v12 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v12 = 0;
    BOOL result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64) {
      goto LABEL_11;
    }
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if (v12 < 0) {
    goto LABEL_32;
  }
  if ((unint64_t)v12 < 0x40)
  {
    unint64_t v14 = v5 << v12;
    if (v8 != 63) {
      goto LABEL_17;
    }
LABEL_34:
    if (a2 < 0.0 && !v14) {
      goto LABEL_36;
    }
    goto LABEL_28;
  }
LABEL_11:
  if (v8 == 63) {
    goto LABEL_27;
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  if (v8 < 0) {
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 1 << v8;
LABEL_20:
  while (1)
  {
    uint64_t v12 = v14 | v13;
    if (a2 >= 0.0) {
      break;
    }
    if ((v12 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      uint64_t v12 = -v12;
      goto LABEL_25;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0) {
      goto LABEL_11;
    }
    unint64_t v14 = v5 >> -(char)v12;
    if (v8 == 63) {
      goto LABEL_34;
    }
LABEL_17:
    if ((v8 & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    uint64_t v13 = 0;
  }
  if (v12 < 0) {
    goto LABEL_31;
  }
  LOBYTE(v6) = 0;
LABEL_25:
  *(void *)a1 = v12;
  *(unsigned char *)(a1 + 8) = v6;
  return result;
}

BOOL sub_1B8F375A4(unsigned char *a1, double a2)
{
  int v3 = LODWORD(a2);
  uint64_t v4 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v6 = v4 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    char v7 = 0;
    BOOL result = 1;
    goto LABEL_25;
  }
  LOBYTE(v6) = 0;
  char v7 = 1;
  if (v4 == 2047)
  {
    BOOL result = 0;
  }
  else
  {
    BOOL result = 0;
    if (a2 > -1.0)
    {
      uint64_t v9 = sub_1B8F577F0();
      if (v9 > 7)
      {
        LOBYTE(v6) = 0;
        BOOL result = 0;
        char v7 = 1;
        goto LABEL_25;
      }
      uint64_t v10 = v9;
      uint64_t v11 = sub_1B8F577E0();
      uint64_t v12 = v11 + __clz(__rbit64(v5));
      uint64_t v6 = v10 - v12;
      if (__OFSUB__(v10, v12))
      {
        __break(1u);
      }
      else
      {
        if (v12 <= 7)
        {
          if (v6 < -8 || v6 > 8)
          {
LABEL_9:
            LOBYTE(v6) = 0;
            LOBYTE(v13) = 0;
            if ((v10 & 0x8000000000000000) == 0) {
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          if (v6 < 0)
          {
            if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFF8) {
              goto LABEL_9;
            }
            LODWORD(v6) = v3 >> (v12 - v10);
          }
          else
          {
            if ((unint64_t)v6 >= 8) {
              goto LABEL_9;
            }
            LODWORD(v6) = v3 << v6;
          }
LABEL_21:
          if ((v10 & 0x8000000000000000) == 0)
          {
LABEL_23:
            int v13 = 1 << v10;
            goto LABEL_24;
          }
          LOBYTE(v13) = 0;
LABEL_24:
          char v7 = 0;
          LOBYTE(v6) = v6 | v13;
          BOOL result = v10 >= v11;
          goto LABEL_25;
        }
        if ((unint64_t)(v6 - 65) < 0xFFFFFFFFFFFFFF7FLL)
        {
          LOBYTE(v6) = 0;
          goto LABEL_21;
        }
        if ((v6 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v6 >= 0x40) {
            LOBYTE(v6) = 0;
          }
          else {
            uint64_t v6 = v5 << v6;
          }
          goto LABEL_21;
        }
      }
      if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFC0) {
        LOBYTE(v6) = 0;
      }
      else {
        uint64_t v6 = v5 >> (v12 - v10);
      }
      goto LABEL_21;
    }
  }
LABEL_25:
  *a1 = v6;
  a1[1] = v7;
  return result;
}

BOOL sub_1B8F3771C(uint64_t a1, double a2)
{
  int v3 = LODWORD(a2);
  uint64_t v4 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v6 = v4 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    char v7 = 0;
    BOOL result = 1;
    goto LABEL_25;
  }
  LOWORD(v6) = 0;
  char v7 = 1;
  if (v4 == 2047)
  {
    BOOL result = 0;
  }
  else
  {
    BOOL result = 0;
    if (a2 > -1.0)
    {
      uint64_t v9 = sub_1B8F577F0();
      if (v9 > 15)
      {
        LOWORD(v6) = 0;
        BOOL result = 0;
        char v7 = 1;
        goto LABEL_25;
      }
      uint64_t v10 = v9;
      uint64_t v11 = sub_1B8F577E0();
      uint64_t v12 = v11 + __clz(__rbit64(v5));
      uint64_t v6 = v10 - v12;
      if (__OFSUB__(v10, v12))
      {
        __break(1u);
      }
      else
      {
        if (v12 <= 15)
        {
          if (v6 < -16 || v6 > 16)
          {
LABEL_9:
            LOWORD(v6) = 0;
            LOWORD(v13) = 0;
            if ((v10 & 0x8000000000000000) == 0) {
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          if (v6 < 0)
          {
            if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFF0) {
              goto LABEL_9;
            }
            LODWORD(v6) = (unsigned __int16)v3 >> (v12 - v10);
          }
          else
          {
            if ((unint64_t)v6 >= 0x10) {
              goto LABEL_9;
            }
            LODWORD(v6) = v3 << v6;
          }
LABEL_21:
          if ((v10 & 0x8000000000000000) == 0)
          {
LABEL_23:
            int v13 = 1 << v10;
            goto LABEL_24;
          }
          LOWORD(v13) = 0;
LABEL_24:
          char v7 = 0;
          LOWORD(v6) = v6 | v13;
          BOOL result = v10 >= v11;
          goto LABEL_25;
        }
        if ((unint64_t)(v6 - 65) < 0xFFFFFFFFFFFFFF7FLL)
        {
          LOWORD(v6) = 0;
          goto LABEL_21;
        }
        if ((v6 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v6 >= 0x40) {
            LOWORD(v6) = 0;
          }
          else {
            uint64_t v6 = v5 << v6;
          }
          goto LABEL_21;
        }
      }
      if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFC0) {
        LOWORD(v6) = 0;
      }
      else {
        uint64_t v6 = v5 >> (v12 - v10);
      }
      goto LABEL_21;
    }
  }
LABEL_25:
  *(_WORD *)a1 = v6;
  *(unsigned char *)(a1 + 2) = v7;
  return result;
}

BOOL sub_1B8F37894(uint64_t a1, double a2)
{
  unsigned int v3 = LODWORD(a2);
  uint64_t v4 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v6 = v4 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    char v7 = 0;
    BOOL result = 1;
    goto LABEL_25;
  }
  LODWORD(v6) = 0;
  char v7 = 1;
  if (v4 == 2047)
  {
    BOOL result = 0;
  }
  else
  {
    BOOL result = 0;
    if (a2 > -1.0)
    {
      uint64_t v9 = sub_1B8F577F0();
      if (v9 > 31)
      {
        LODWORD(v6) = 0;
        BOOL result = 0;
        char v7 = 1;
        goto LABEL_25;
      }
      uint64_t v10 = v9;
      uint64_t v11 = sub_1B8F577E0();
      uint64_t v12 = v11 + __clz(__rbit64(v5));
      uint64_t v6 = v10 - v12;
      if (__OFSUB__(v10, v12))
      {
        __break(1u);
      }
      else
      {
        if (v12 <= 31)
        {
          if (v6 < -32 || v6 > 32)
          {
LABEL_9:
            LODWORD(v6) = 0;
            int v13 = 0;
            if ((v10 & 0x8000000000000000) == 0) {
              goto LABEL_23;
            }
            goto LABEL_24;
          }
          if (v6 < 0)
          {
            if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFE0) {
              goto LABEL_9;
            }
            LODWORD(v6) = v3 >> (v12 - v10);
          }
          else
          {
            if ((unint64_t)v6 >= 0x20) {
              goto LABEL_9;
            }
            LODWORD(v6) = v3 << v6;
          }
LABEL_21:
          if ((v10 & 0x8000000000000000) == 0)
          {
LABEL_23:
            int v13 = 1 << v10;
            goto LABEL_24;
          }
          int v13 = 0;
LABEL_24:
          char v7 = 0;
          LODWORD(v6) = v6 | v13;
          BOOL result = v10 >= v11;
          goto LABEL_25;
        }
        if ((unint64_t)(v6 - 65) < 0xFFFFFFFFFFFFFF7FLL)
        {
          LODWORD(v6) = 0;
          goto LABEL_21;
        }
        if ((v6 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)v6 >= 0x40) {
            LODWORD(v6) = 0;
          }
          else {
            uint64_t v6 = v5 << v6;
          }
          goto LABEL_21;
        }
      }
      if ((unint64_t)v6 <= 0xFFFFFFFFFFFFFFC0) {
        LODWORD(v6) = 0;
      }
      else {
        uint64_t v6 = v5 >> (v12 - v10);
      }
      goto LABEL_21;
    }
  }
LABEL_25:
  *(_DWORD *)a1 = v6;
  *(unsigned char *)(a1 + 4) = v7;
  return result;
}

BOOL sub_1B8F37A08(uint64_t a1, double a2)
{
  uint64_t v3 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v4 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  uint64_t v5 = v3 | *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (v5)
  {
    BOOL result = 0;
    uint64_t v5 = 0;
    char v7 = 1;
    if (v3 != 2047 && a2 > -1.0)
    {
      uint64_t v8 = sub_1B8F577F0();
      if (v8 <= 63)
      {
        uint64_t v9 = v8;
        uint64_t v10 = sub_1B8F577E0();
        uint64_t v11 = v10 + __clz(__rbit64(v4));
        uint64_t v12 = v9 - v11;
        if (__OFSUB__(v9, v11))
        {
          __break(1u);
        }
        else
        {
          if (v11 > 63)
          {
            if (v12 < -64 || v12 > 64) {
              goto LABEL_12;
            }
          }
          else if (v12 < -64 || v12 > 64)
          {
            goto LABEL_12;
          }
          if ((v12 & 0x8000000000000000) == 0)
          {
            if ((unint64_t)v12 < 0x40)
            {
              unint64_t v13 = v4 << v12;
              if (v9 < 0)
              {
LABEL_17:
                uint64_t v14 = 0;
                goto LABEL_24;
              }
LABEL_23:
              uint64_t v14 = 1 << v9;
              goto LABEL_24;
            }
            goto LABEL_12;
          }
        }
        if ((unint64_t)v12 > 0xFFFFFFFFFFFFFFC0)
        {
          unint64_t v13 = v4 >> (v11 - v9);
          if (v9 < 0) {
            goto LABEL_17;
          }
          goto LABEL_23;
        }
LABEL_12:
        unint64_t v13 = 0;
        uint64_t v14 = 0;
        if (v9 < 0)
        {
LABEL_24:
          char v7 = 0;
          uint64_t v5 = v13 | v14;
          BOOL result = v9 >= v10;
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      uint64_t v5 = 0;
      BOOL result = 0;
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
    BOOL result = 1;
  }
LABEL_25:
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v7;
  return result;
}

uint64_t sub_1B8F37B4C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B8F37C14(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1B8F37B6C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B8F37D74(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1B8F37B8C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B8F37EE0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1B8F37BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B8F37C14(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A90);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

uint64_t sub_1B8F37D74(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C32F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
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
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

uint64_t sub_1B8F37EE0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4A80);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for KeyedContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F38088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  unint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v8 = *(void **)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v8, v9, v10);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >= 2)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B8F38154(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v7, v8, v9);
  char v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v12 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_1B8F2C5DC(v10, v11, v12);
  unint64_t v13 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >= 2uLL)
  {
    if (v13 >= 2)
    {
      uint64_t v15 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      *(void *)(a1 + 64) = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v14 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v14;
  swift_retain();
LABEL_15:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_1B8F382D8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  char v7 = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v7;
  sub_1B8F2C5DC(v8, v9, v10);
  unint64_t v11 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >= 2uLL)
  {
    if (v11 >= 2)
    {
      uint64_t v13 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v11;
      *(void *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v12 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
LABEL_15:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B8F383F0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1B8F38438(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwxx_1(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  if (*(void *)(a1 + 56) >= 2uLL) {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v8 = *(void **)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v8, v9, v10);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >= 2)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v7, v8, v9);
  char v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v12 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_1B8F2C5DC(v10, v11, v12);
  unint64_t v13 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >= 2uLL)
  {
    if (v13 >= 2)
    {
      uint64_t v15 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      *(void *)(a1 + 64) = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v14 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v14;
  swift_retain();
LABEL_15:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  char v7 = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v7;
  sub_1B8F2C5DC(v8, v9, v10);
  unint64_t v11 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >= 2uLL)
  {
    if (v11 >= 2)
    {
      uint64_t v13 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v11;
      *(void *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v12 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
LABEL_15:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for UnkeyedContainer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UnkeyedContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnkeyedContainer()
{
  return &type metadata for UnkeyedContainer;
}

void destroy for SingleValueContainer(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  if (*(void *)(a1 + 56) >= 2uLL) {
    swift_release();
  }
  if (*(void *)(a1 + 96)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  }
}

uint64_t initializeWithCopy for SingleValueContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v8 = *(void **)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v8, v9, v10);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >= 2)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  uint64_t v13 = (_OWORD *)(a1 + 72);
  uint64_t v14 = (_OWORD *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 96);
  if (v15)
  {
    *(void *)(a1 + 96) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 88);
    *uint64_t v13 = *v14;
    *(_OWORD *)(a1 + 88) = v16;
  }
  return a1;
}

uint64_t assignWithCopy for SingleValueContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v7, v8, v9);
  char v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v12 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_1B8F2C5DC(v10, v11, v12);
  unint64_t v13 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) < 2uLL)
  {
    if (v13 >= 2)
    {
      uint64_t v14 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      *(void *)(a1 + 64) = v14;
      swift_retain();
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v13 < 2)
  {
    swift_release();
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v15 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v15;
  swift_retain();
  swift_release();
LABEL_15:
  uint64_t v16 = *(void *)(a2 + 96);
  if (!*(void *)(a1 + 96))
  {
    if (v16)
    {
      *(void *)(a1 + 96) = v16;
      (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 72, a2 + 72);
      return a1;
    }
LABEL_21:
    long long v17 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v17;
    return a1;
  }
  if (!v16)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
    goto LABEL_21;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *__n128 result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for SingleValueContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  char v7 = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v7;
  sub_1B8F2C5DC(v8, v9, v10);
  unint64_t v11 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) < 2uLL)
  {
    if (v11 >= 2)
    {
      uint64_t v12 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v11;
      *(void *)(a1 + 64) = v12;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v11 < 2)
  {
    swift_release();
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v13 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v13;
  swift_release();
LABEL_15:
  if (*(void *)(a1 + 96)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  }
  long long v14 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for SingleValueContainer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SingleValueContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SingleValueContainer()
{
  return &type metadata for SingleValueContainer;
}

uint64_t sub_1B8F3909C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

unint64_t sub_1B8F390A4()
{
  unint64_t result = qword_1E9EF4AC8;
  if (!qword_1E9EF4AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4AC8);
  }
  return result;
}

unint64_t sub_1B8F390F8()
{
  unint64_t result = qword_1E9EF4AE8;
  if (!qword_1E9EF4AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4AE8);
  }
  return result;
}

unint64_t sub_1B8F3914C()
{
  unint64_t result = qword_1E9EF4B10;
  if (!qword_1E9EF4B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B10);
  }
  return result;
}

unint64_t sub_1B8F391A0()
{
  unint64_t result = qword_1E9EF4B20;
  if (!qword_1E9EF4B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B20);
  }
  return result;
}

unint64_t sub_1B8F391F4()
{
  unint64_t result = qword_1E9EF4B38;
  if (!qword_1E9EF4B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B38);
  }
  return result;
}

unint64_t sub_1B8F39248()
{
  unint64_t result = qword_1E9EF4B50;
  if (!qword_1E9EF4B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B50);
  }
  return result;
}

unint64_t sub_1B8F3929C()
{
  unint64_t result = qword_1E9EF4B68;
  if (!qword_1E9EF4B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B68);
  }
  return result;
}

unint64_t sub_1B8F392F0()
{
  unint64_t result = qword_1E9EF4B80;
  if (!qword_1E9EF4B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B80);
  }
  return result;
}

unint64_t sub_1B8F39344()
{
  unint64_t result = qword_1E9EF4B98;
  if (!qword_1E9EF4B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4B98);
  }
  return result;
}

unint64_t sub_1B8F39398()
{
  unint64_t result = qword_1E9EF4BB0;
  if (!qword_1E9EF4BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4BB0);
  }
  return result;
}

unint64_t sub_1B8F393EC()
{
  unint64_t result = qword_1E9EF4BC8;
  if (!qword_1E9EF4BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4BC8);
  }
  return result;
}

unint64_t sub_1B8F39440()
{
  unint64_t result = qword_1E9EF4BE0;
  if (!qword_1E9EF4BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4BE0);
  }
  return result;
}

unint64_t sub_1B8F39494()
{
  unint64_t result = qword_1E9EF4BF8;
  if (!qword_1E9EF4BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4BF8);
  }
  return result;
}

BOOL sub_1B8F394E8()
{
  sub_1B8F21884(v0 + 72, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_1B8F1DBD4((uint64_t)v6, &qword_1EB9C33F0);
  }
  uint64_t v2 = sub_1B8F313F0(v0 + 72);
  if (v3)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB390], v0 + 72);
    swift_willThrow();
  }
  else
  {
    return v2 != 0;
  }
  return v1;
}

uint64_t sub_1B8F395A4(uint64_t a1)
{
  return a1;
}

void sub_1B8F395D4()
{
  unint64_t v2 = v0[10];
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  char v3 = v0;
  uint64_t v4 = v0[9];
  if (v2 >= *(void *)(v4 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = *v0;
  uint64_t v6 = v3[1];
  uint64_t v7 = v3[2];
  uint64_t v8 = v3[3];
  uint64_t v9 = (void *)v3[4];
  uint64_t v16 = v3[5];
  char v10 = *((unsigned char *)v3 + 48);
  unint64_t v11 = v3[7];
  uint64_t v12 = v3[8];
  sub_1B8F21884(v4 + 32 * v2 + 32, (uint64_t)&v21);
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = v7;
  v17[3] = v8;
  v17[4] = v9;
  v17[5] = v16;
  char v18 = v10;
  unint64_t v19 = v11;
  uint64_t v20 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v7);
  sub_1B8F2C560(v9, v16, v10);
  sub_1B8F2C708(v11);
  sub_1B8F394E8();
  sub_1B8F395A4((uint64_t)v17);
  if (v1) {
    return;
  }
  uint64_t v13 = v3[10];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v3[10] = v15;
}

void sub_1B8F396FC()
{
  unint64_t v1 = v0[10];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = v0[9];
    if (v1 < *(void *)(v2 + 16))
    {
      uint64_t v13 = *v0;
      uint64_t v3 = v0[2];
      uint64_t v21 = v0[1];
      uint64_t v5 = v0[3];
      uint64_t v4 = (void *)v0[4];
      uint64_t v6 = v0[5];
      char v7 = *((unsigned char *)v0 + 48);
      unint64_t v9 = v0[7];
      uint64_t v8 = v0[8];
      sub_1B8F21884(v2 + 32 * v1 + 32, (uint64_t)v20);
      v16[0] = v13;
      v16[1] = v21;
      long long v16[2] = v3;
      v16[3] = v5;
      v16[4] = v4;
      v16[5] = v6;
      char v17 = v7;
      unint64_t v18 = v9;
      uint64_t v19 = v8;
      sub_1B8F21884((uint64_t)v20, (uint64_t)v14);
      if (v15)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1B8F2C368(v3);
        sub_1B8F2C560(v4, v6, v7);
        sub_1B8F2C708(v9);
        if (swift_dynamicCast())
        {
          sub_1B8F395A4((uint64_t)v16);
          uint64_t v10 = v0[10];
          BOOL v11 = __OFADD__(v10, 1);
          uint64_t v12 = v10 + 1;
          if (!v11)
          {
            v0[10] = v12;
            return;
          }
          goto LABEL_11;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_1B8F2C368(v3);
        sub_1B8F2C560(v4, v6, v7);
        sub_1B8F2C708(v9);
        sub_1B8F1DBD4((uint64_t)v14, &qword_1EB9C33F0);
      }
      sub_1B8F34704(MEMORY[0x1E4FBB1A0], (uint64_t)v20);
      swift_willThrow();
      sub_1B8F395A4((uint64_t)v16);
      return;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
}

void sub_1B8F398CC()
{
  unint64_t v1 = v0[10];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v0[9];
  if (v1 >= *(void *)(v3 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = *v0;
  uint64_t v5 = v2[1];
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = (void *)v2[4];
  uint64_t v17 = v2[5];
  char v9 = *((unsigned char *)v2 + 48);
  int v23 = v22;
  unint64_t v11 = v2[7];
  uint64_t v10 = v2[8];
  sub_1B8F21884(v3 + 32 * v1 + 32, (uint64_t)v22);
  v18[0] = v4;
  v18[1] = v5;
  void v18[2] = v6;
  v18[3] = v7;
  v18[4] = v8;
  v18[5] = v17;
  char v19 = v9;
  unint64_t v20 = v11;
  uint64_t v21 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v6);
  sub_1B8F2C560(v8, v17, v9);
  uint64_t v12 = (uint64_t)v23;
  sub_1B8F2C708(v11);
  sub_1B8F3499C(v12);
  if (v13)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB3D0], v12);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v18);
    return;
  }
  sub_1B8F395A4((uint64_t)v18);
  uint64_t v14 = v2[10];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (!v15)
  {
    v2[10] = v16;
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_1B8F39A28()
{
  unint64_t v1 = v0[10];
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v0[9];
  if (v1 >= *(void *)(v3 + 16))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = *v0;
  uint64_t v5 = v2[1];
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = (void *)v2[4];
  uint64_t v16 = v2[5];
  char v9 = *((unsigned char *)v2 + 48);
  uint64_t v22 = v21;
  unint64_t v11 = v2[7];
  uint64_t v10 = v2[8];
  sub_1B8F21884(v3 + 32 * v1 + 32, (uint64_t)v21);
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v6;
  v17[3] = v7;
  v17[4] = v8;
  v17[5] = v16;
  char v18 = v9;
  unint64_t v19 = v11;
  uint64_t v20 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v6);
  sub_1B8F2C560(v8, v16, v9);
  uint64_t v12 = (uint64_t)v22;
  sub_1B8F2C708(v11);
  if ((sub_1B8F351A0(v12) & 0x100000000) != 0)
  {
    sub_1B8F34704(MEMORY[0x1E4FBB470], v12);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v17);
    return;
  }
  sub_1B8F395A4((uint64_t)v17);
  uint64_t v13 = v2[10];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (!v14)
  {
    v2[10] = v15;
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1B8F39B84(uint64_t result, uint64_t a2)
{
  unint64_t v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v2[9];
  if (v3 >= *(void *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = *v2;
  uint64_t v7 = v4[1];
  uint64_t v8 = v4[2];
  uint64_t v9 = v4[3];
  uint64_t v10 = (void *)v4[4];
  uint64_t v20 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  uint64_t v26 = (uint64_t (*)(unsigned char *))result;
  unint64_t v13 = v4[7];
  uint64_t v12 = v4[8];
  sub_1B8F21884(v5 + 32 * v3 + 32, (uint64_t)v25);
  v21[0] = v6;
  v21[1] = v7;
  v21[2] = v8;
  v21[3] = v9;
  v21[4] = v10;
  v21[5] = v20;
  char v22 = v11;
  unint64_t v23 = v13;
  uint64_t v24 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v8);
  sub_1B8F2C560(v10, v20, v11);
  sub_1B8F2C708(v13);
  uint64_t v14 = v26(v25);
  if (v15)
  {
    sub_1B8F34704(a2, (uint64_t)v25);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v21);
    return v14;
  }
  unint64_t result = sub_1B8F395A4((uint64_t)v21);
  uint64_t v16 = v4[10];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    v4[10] = v18;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B8F39CE8(uint64_t result, uint64_t a2)
{
  unint64_t v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v2[9];
  if (v3 >= *(void *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = *v2;
  uint64_t v7 = v4[1];
  uint64_t v8 = v4[2];
  uint64_t v9 = v4[3];
  uint64_t v10 = (void *)v4[4];
  uint64_t v19 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  uint64_t v25 = (uint64_t (*)(unsigned char *))result;
  unint64_t v13 = v4[7];
  uint64_t v12 = v4[8];
  sub_1B8F21884(v5 + 32 * v3 + 32, (uint64_t)v24);
  v20[0] = v6;
  v20[1] = v7;
  uint64_t v20[2] = v8;
  v20[3] = v9;
  void v20[4] = v10;
  v20[5] = v19;
  char v21 = v11;
  unint64_t v22 = v13;
  uint64_t v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v8);
  sub_1B8F2C560(v10, v19, v11);
  sub_1B8F2C708(v13);
  uint64_t v14 = v25(v24);
  if ((v14 & 0x100) != 0)
  {
    sub_1B8F34704(a2, (uint64_t)v24);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v20);
    return v14;
  }
  unint64_t result = sub_1B8F395A4((uint64_t)v20);
  uint64_t v15 = v4[10];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (!v16)
  {
    v4[10] = v17;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B8F39E4C(uint64_t result, uint64_t a2)
{
  unint64_t v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v2[9];
  if (v3 >= *(void *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = *v2;
  uint64_t v7 = v4[1];
  uint64_t v8 = v4[2];
  uint64_t v9 = v4[3];
  uint64_t v10 = (void *)v4[4];
  uint64_t v19 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  uint64_t v25 = (uint64_t (*)(unsigned char *))result;
  unint64_t v13 = v4[7];
  uint64_t v12 = v4[8];
  sub_1B8F21884(v5 + 32 * v3 + 32, (uint64_t)v24);
  v20[0] = v6;
  v20[1] = v7;
  uint64_t v20[2] = v8;
  v20[3] = v9;
  void v20[4] = v10;
  v20[5] = v19;
  char v21 = v11;
  unint64_t v22 = v13;
  uint64_t v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v8);
  sub_1B8F2C560(v10, v19, v11);
  sub_1B8F2C708(v13);
  uint64_t v14 = v25(v24);
  if ((v14 & 0x10000) != 0)
  {
    sub_1B8F34704(a2, (uint64_t)v24);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v20);
    return v14;
  }
  unint64_t result = sub_1B8F395A4((uint64_t)v20);
  uint64_t v15 = v4[10];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (!v16)
  {
    v4[10] = v17;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B8F39FB0(uint64_t result, uint64_t a2)
{
  unint64_t v3 = v2[10];
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v2[9];
  if (v3 >= *(void *)(v5 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = *v2;
  uint64_t v7 = v4[1];
  uint64_t v8 = v4[2];
  uint64_t v9 = v4[3];
  uint64_t v10 = (void *)v4[4];
  uint64_t v19 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  uint64_t v25 = (uint64_t (*)(unsigned char *))result;
  unint64_t v13 = v4[7];
  uint64_t v12 = v4[8];
  sub_1B8F21884(v5 + 32 * v3 + 32, (uint64_t)v24);
  v20[0] = v6;
  v20[1] = v7;
  uint64_t v20[2] = v8;
  v20[3] = v9;
  void v20[4] = v10;
  v20[5] = v19;
  char v21 = v11;
  unint64_t v22 = v13;
  uint64_t v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v8);
  sub_1B8F2C560(v10, v19, v11);
  sub_1B8F2C708(v13);
  uint64_t v14 = v25(v24);
  if ((v14 & 0x100000000) != 0)
  {
    sub_1B8F34704(a2, (uint64_t)v24);
    swift_willThrow();
    sub_1B8F395A4((uint64_t)v20);
    return v14;
  }
  unint64_t result = sub_1B8F395A4((uint64_t)v20);
  uint64_t v15 = v4[10];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (!v16)
  {
    v4[10] = v17;
    return v14;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1B8F3A114()
{
  return sub_1B8F58230();
}

uint64_t sub_1B8F3A178(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id CustomCodableBox.secureCodable.getter()
{
  return *v0;
}

uint64_t CustomCodableBox.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static StandardUnarchiver.unarchivedObject(from:)()
{
  return sub_1B8F57890();
}

uint64_t sub_1B8F3A24C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static StandardUnarchiver.unarchivedObject(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t static StandardDictionaryUnarchiver.unarchivedObject(from:)()
{
  return sub_1B8F3A898();
}

uint64_t sub_1B8F3A294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B8F3A898();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t CustomCodableBox.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B8F581E0();
  if (!v5)
  {
    __swift_project_boxed_opaque_existential_1(v20, v20[3]);
    sub_1B8F3AAC0();
    sub_1B8F57F00();
    uint64_t v12 = v18;
    unint64_t v11 = v19;
    (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t, uint64_t, uint64_t))(a4 + 16))(&v18, v18, v19, a3, a4);
    uint64_t v14 = v18;
    if (v18)
    {
      sub_1B8F091D4(v12, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      *a5 = v14;
    }
    else
    {
      uint64_t v15 = sub_1B8F57A80();
      swift_allocError();
      uint64_t v17 = v16;
      *BOOL v16 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4C30);
      sub_1B8F57A70();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x1E4FBBA80], v15);
      swift_willThrow();
      sub_1B8F091D4(v12, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1B8F3A4C4@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return CustomCodableBox.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t CustomCodableBox.encode(to:)(void *a1)
{
  v11[5] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = *v1;
  v11[0] = 0;
  id v4 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v3, 1, v11);
  id v5 = v11[0];
  if (v4)
  {
    uint64_t v6 = sub_1B8F57170();
    unint64_t v8 = v7;

    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1B8F58200();
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v11, (uint64_t)v11[3]);
    sub_1B8F3AB64();
    sub_1B8F57F30();
    sub_1B8F091D4(v6, v8);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    uint64_t v10 = v5;
    sub_1B8F57040();

    return swift_willThrow();
  }
}

uint64_t sub_1B8F3A648(void *a1)
{
  return CustomCodableBox.encode(to:)(a1);
}

uint64_t static CustomCodableBox<>.< infix(_:_:)()
{
  return sub_1B8F57470() & 1;
}

uint64_t sub_1B8F3A6A8()
{
  return static CustomCodableBox<>.< infix(_:_:)();
}

uint64_t CustomCodableBox.description.getter(uint64_t a1)
{
  return sub_1B8F3A6DC(a1, (SEL *)&selRef_description);
}

uint64_t CustomCodableBox.debugDescription.getter(uint64_t a1)
{
  return sub_1B8F3A6DC(a1, (SEL *)&selRef_debugDescription);
}

uint64_t sub_1B8F3A6DC(uint64_t a1, SEL *a2)
{
  id v3 = [*v2 *a2];
  uint64_t v4 = sub_1B8F574D0();

  return v4;
}

uint64_t static CustomCodableBox.== infix(_:_:)()
{
  return sub_1B8F57940() & 1;
}

uint64_t CustomCodableBox.hash(into:)()
{
  return sub_1B8F57950();
}

uint64_t CustomCodableBox.hashValue.getter()
{
  return sub_1B8F581A0();
}

uint64_t sub_1B8F3A7FC()
{
  return sub_1B8F581A0();
}

uint64_t sub_1B8F3A838()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4DA0);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_1E9EF4DB0;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_1E9EF4DA8;
  }
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t sub_1B8F3A898()
{
  sub_1B8F3A838();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F5A650;
  *(void *)(inited + 32) = sub_1B8F1ECD8(0, &qword_1E9EF4D48);
  *(void *)(inited + 40) = sub_1B8F1ECD8(0, &qword_1E9EF4D50);
  *(void *)(inited + 48) = sub_1B8F1ECD8(0, &qword_1E9EF4D58);
  *(void *)(inited + 56) = sub_1B8F1ECD8(0, (unint64_t *)&qword_1E9EF4D60);
  *(void *)(inited + 64) = sub_1B8F1ECD8(0, &qword_1E9EF4D68);
  *(void *)(inited + 72) = sub_1B8F1ECD8(0, (unint64_t *)&qword_1E9EF4D70);
  *(void *)(inited + 80) = sub_1B8F1ECD8(0, &qword_1E9EF4D78);
  *(void *)(inited + 88) = sub_1B8F1ECD8(0, &qword_1E9EF4D80);
  *(void *)(inited + 96) = sub_1B8F1ECD8(0, &qword_1E9EF4D88);
  *(void *)(inited + 104) = sub_1B8F1ECD8(0, (unint64_t *)&unk_1E9EF4D90);
  sub_1B8F1ECD8(0, &qword_1E9EF4C20);
  sub_1B8F2D8F0(inited);
  swift_bridgeObjectRelease();
  sub_1B8F578A0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v0)
  {
    if (v3[3])
    {
      if (swift_dynamicCast()) {
        return v3[19];
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1B8F0BCE4((uint64_t)v3);
      return 0;
    }
  }
  return result;
}

unint64_t sub_1B8F3AAC0()
{
  unint64_t result = qword_1E9EF4C28;
  if (!qword_1E9EF4C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4C28);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

unint64_t sub_1B8F3AB64()
{
  unint64_t result = qword_1E9EF4C38;
  if (!qword_1E9EF4C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF4C38);
  }
  return result;
}

uint64_t sub_1B8F3ABB8()
{
  return swift_getWitnessTable();
}

uint64_t dispatch thunk of static CustomUnarchiver.unarchivedObject(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for CustomCodableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for StandardUnarchiver()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for StandardDictionaryUnarchiver()
{
  return &type metadata for StandardDictionaryUnarchiver;
}

uint64_t sub_1B8F3AC3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = sub_1B8F3B9B8(a1, a2, a3);
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }
  return result;
}

uint64_t sub_1B8F3AC68@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return sub_1B8F3B848(a1, a2, a3);
}

uint64_t TypedCodingEnvelope.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_1B8F3ACC4()
{
  uint64_t v0 = sub_1B8F57C10();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B8F3AD18(char a1)
{
  if (a1) {
    return 0x65756C6176;
  }
  else {
    return 1701869940;
  }
}

uint64_t sub_1B8F3AD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1C8];
  return MEMORY[0x1F4185BB0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B8F3ADB8(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DE0](a1, a2, WitnessTable, v5);
}

uint64_t sub_1B8F3AE24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B8F3AE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4183DE8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_1B8F3AF04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B8F3ACC4();
  *a1 = result;
  return result;
}

uint64_t sub_1B8F3AF34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B8F3AD18(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B8F3AF60()
{
  return sub_1B8F3AD18(*v0);
}

uint64_t sub_1B8F3AF68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B8F3ACC4();
  *a1 = result;
  return result;
}

uint64_t sub_1B8F3AF90@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B8F19D78();
  *a1 = result;
  return result;
}

uint64_t sub_1B8F3AFBC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862A8](a1, WitnessTable);
}

uint64_t sub_1B8F3B010(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x1F41862B0](a1, WitnessTable);
}

uint64_t TypedCodingEnvelope.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t TypedCodingEnvelope<A>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v5 = a1;
  uint64_t v40 = a4;
  uint64_t v45 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v41 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TypedCodingEnvelope.CodingKeys();
  swift_getWitnessTable();
  uint64_t v46 = sub_1B8F57C70();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x1F4188790](v46, v7);
  uint64_t v9 = (char *)&v35 - v8;
  uint64_t v10 = type metadata accessor for TypedCodingEnvelope();
  uint64_t v42 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v11);
  unint64_t v13 = (char *)&v35 - v12;
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  uint64_t v14 = v47;
  sub_1B8F581F0();
  if (v14) {
    goto LABEL_9;
  }
  uint64_t v38 = v13;
  uint64_t v39 = v10;
  unint64_t v47 = v5;
  uint64_t v16 = v44;
  uint64_t v15 = v45;
  char v50 = 0;
  uint64_t v17 = sub_1B8F57C50();
  uint64_t v19 = v18;
  uint64_t v37 = v9;
  uint64_t v48 = a2;
  uint64_t v20 = v17;
  swift_getMetatypeMetadata();
  uint64_t v22 = sub_1B8F57500();
  BOOL v23 = v20 == v22 && v19 == v21;
  uint64_t v24 = v16;
  uint64_t v25 = v42;
  if (!v23)
  {
    uint64_t v26 = v21;
    uint64_t v36 = v22;
    if ((sub_1B8F57EE0() & 1) == 0)
    {
      sub_1B8F3B4BC();
      swift_allocError();
      *uint64_t v31 = v36;
      v31[1] = v26;
      v31[2] = v20;
      v31[3] = v19;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v37, v46);
      uint64_t v5 = v47;
LABEL_9:
      uint64_t v34 = (uint64_t)v5;
      return __swift_destroy_boxed_opaque_existential_1(v34);
    }
  }
  uint64_t v27 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v49 = 1;
  unint64_t v28 = v41;
  uint64_t v29 = v46;
  uint64_t v30 = v37;
  sub_1B8F57C60();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v30, v29);
  uint64_t v33 = v38;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v38, v28, a2);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v40, v33, v39);
  uint64_t v34 = (uint64_t)v47;
  return __swift_destroy_boxed_opaque_existential_1(v34);
}

uint64_t type metadata accessor for TypedCodingEnvelope.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for TypedCodingEnvelope()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_1B8F3B4BC()
{
  unint64_t result = qword_1E9EF4E20[0];
  if (!qword_1E9EF4E20[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9EF4E20);
  }
  return result;
}

uint64_t sub_1B8F3B510@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return TypedCodingEnvelope<A>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), a4);
}

uint64_t TypedCodingEnvelope<A>.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = a3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TypedCodingEnvelope.CodingKeys();
  swift_getWitnessTable();
  uint64_t v18 = sub_1B8F57CB0();
  uint64_t v20 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18, v8);
  uint64_t v10 = (char *)&v17 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = v19;
  sub_1B8F58210();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  uint64_t DynamicType = swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v24 = DynamicType;
  uint64_t v13 = v18;
  swift_getMetatypeMetadata();
  sub_1B8F57500();
  char v23 = 0;
  uint64_t v14 = v21;
  sub_1B8F57C90();
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v13);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = v20;
    swift_bridgeObjectRelease();
    char v22 = 1;
    sub_1B8F57CA0();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v10, v13);
  }
}

uint64_t sub_1B8F3B7DC(void *a1, uint64_t a2, uint64_t a3)
{
  return TypedCodingEnvelope<A>.encode(to:)(a1, a2, *(void *)(a3 - 8));
}

uint64_t XPCEncoder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t XPCEncoder.init()()
{
  return v0;
}

uint64_t sub_1B8F3B810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F3B9B8(a1, a2, a3);
}

uint64_t XPCEncoder.deinit()
{
  return v0;
}

uint64_t XPCDecoder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t XPCDecoder.init()()
{
  return v0;
}

uint64_t sub_1B8F3B848@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v12 = a3;
  uint64_t v6 = type metadata accessor for TypedCodingEnvelope();
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v9 = (char *)&v11 - v8;
  sub_1B8F56FE0();
  swift_allocObject();
  sub_1B8F56FD0();
  uint64_t v13 = a2;
  swift_getWitnessTable();
  sub_1B8F56FC0();
  uint64_t result = swift_release();
  if (!v3) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a1 - 8) + 32))(v12, v9, a1);
  }
  return result;
}

uint64_t XPCDecoder.deinit()
{
  return v0;
}

uint64_t XPCDecoder.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1B8F3B9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TypedCodingEnvelope();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  uint64_t v13 = (char *)v16 - v12;
  sub_1B8F57020();
  swift_allocObject();
  sub_1B8F57010();
  sub_1B8F56FF0();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v13, v8, a2);
  v16[3] = a3;
  swift_getWitnessTable();
  uint64_t v14 = sub_1B8F57000();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  swift_release();
  return v14;
}

uint64_t sub_1B8F3BBC0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1B8F3BD1C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1B8F3BF34);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for XPCEncoder()
{
  return self;
}

uint64_t method lookup function for XPCEncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for XPCEncoder);
}

uint64_t dispatch thunk of XPCEncoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of XPCEncoder.encode<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t type metadata accessor for XPCDecoder()
{
  return self;
}

uint64_t method lookup function for XPCDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for XPCDecoder);
}

uint64_t dispatch thunk of XPCDecoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of XPCDecoder.decode<A>(_:from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

unsigned char *sub_1B8F3C06C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B8F3C138);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1B8F3C160()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F3C17C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F3C198()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B8F3C1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a2;
  uint64_t v7 = *(void *)(a3 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](a1, a2);
  unsigned int v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v8, v13);
  int v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1B8F581B0();
  MEMORY[0x1F4188790](v16, v17);
  uint64_t v19 = (char *)&v23 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v23 - v18, a1, v16);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v19, a4);
    return sub_1B8F3D338((uint64_t)v15, v24, a3, a4);
  }
  else
  {
    char v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v22(v10, v19, a3);
    v22(*(char **)(*(void *)(v24 + 64) + 40), v10, a3);
    return swift_continuation_throwingResume();
  }
}

uint64_t MessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  uint64_t v12 = sub_1B8F3D3CC(a1, a2, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a6 - 8) + 8))(a3, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a2, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  return v12;
}

uint64_t MessageSender.init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_1B8F3D3CC(a1, a2, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a6 - 8) + 8))(a3, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a2, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  return v12;
}

uint64_t *sub_1B8F3C658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F3CA4C(a1, a2, a3);
}

uint64_t sub_1B8F3C6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = v5[5];
  uint64_t v12 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a1, a2, a3, a4, a5, v11, v12);
}

uint64_t sub_1B8F3C738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x1F4188298](sub_1B8F3C760, 0, 0);
}

uint64_t sub_1B8F3C760()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 40);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9EF41C8 + dword_1E9EF41C8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  swift_getAssociatedTypeWitness();
  void *v5 = v0;
  v5[1] = sub_1B8F13854;
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, 0, 0, (uint64_t)sub_1B8F3D618, v3);
}

uint64_t sub_1B8F3C880(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v10 = (void *)swift_allocObject();
  void v10[2] = a4;
  v10[3] = a5;
  v10[4] = a1;
  uint64_t v11 = a2 + 2;
  uint64_t v13 = a2[5];
  uint64_t v12 = a2[6];
  __swift_project_boxed_opaque_existential_1(v11, v13);
  (*(void (**)(uint64_t, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8))(a3, sub_1B8F3D970, v10, a4, a5, v13, v12);
  return swift_release();
}

uint64_t sub_1B8F3C94C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB9C36C8);
  return sub_1B8F3C1B8(a1, a2, AssociatedTypeWitness, v5);
}

uint64_t MessageSender.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t MessageSender.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1B8F3CA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F3C6AC(a1, a2, a3, a4, a5);
}

uint64_t *sub_1B8F3CA4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*v3 + 96) - 8) + 32))((uint64_t)v3 + *(void *)(*v3 + 128), a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 80) - 8) + 32))((uint64_t)v3 + *(void *)(*v3 + 136), a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v6 + 88) - 8) + 32))((uint64_t)v3 + *(void *)(*v3 + 144), a2);
  return v3;
}

uint64_t sub_1B8F3CB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v29 = a1;
  uint64_t v26 = (void *)*v5;
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v8 = sub_1B8F581B0();
  uint64_t v28 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v9);
  uint64_t v10 = v26[13];
  uint64_t v11 = v26[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v24 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v25 = AssociatedTypeWitness;
  MEMORY[0x1F4188790](AssociatedTypeWitness, v13);
  int v15 = (char *)&v23 - v14;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v10 + 16);
  uint64_t v27 = a5;
  v16(v29, a4, *(void *)(a5 + 16), v11, v10);
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = v27;
  v17[2] = a4;
  v17[3] = v18;
  v17[4] = v30;
  v17[5] = v31;
  void v17[6] = v5;
  uint64_t v19 = v26[15];
  uint64_t v20 = *(void (**)(char *, uint64_t (*)(uint64_t), void *, uint64_t, uint64_t))(v19 + 24);
  uint64_t v21 = v26[12];
  swift_retain();
  swift_retain();
  v20(v15, sub_1B8F3D930, v17, v21, v19);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v25);
}

uint64_t sub_1B8F3CEC4(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v17[2] = a3;
  uint64_t v18 = a2;
  v17[1] = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1EB9C36C8);
  uint64_t v10 = sub_1B8F581B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10, v12);
  uint64_t v14 = (char *)v17 - v13;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = a4;
  swift_getAssociatedTypeWitness();
  uint64_t v15 = sub_1B8F581B0();
  Result<>.foundation_tryMap<A>(_:)((uint64_t)sub_1B8F3D940, (uint64_t)v19, v15, AssociatedTypeWitness, (uint64_t)v14);
  v18(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

uint64_t sub_1B8F3D08C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(v2 + 112);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = *(void *)(v2 + 88);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return v5(AssociatedTypeWitness, a1, AssociatedTypeWitness, AssociatedConformanceWitness, v6, v4);
}

uint64_t *sub_1B8F3D1A0()
{
  uint64_t v1 = *v0;
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*v0 + 96) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 128));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 136));
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 144));
  return v0;
}

uint64_t sub_1B8F3D2C0()
{
  uint64_t v0 = sub_1B8F3D1A0();
  uint64_t v1 = *(unsigned int *)(*v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B8F3D314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F3CB8C(a1, a2, a3, a4, a5);
}

uint64_t sub_1B8F3D338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v8, a1, a4);
  return MEMORY[0x1F4188208](a2, v7);
}

uint64_t sub_1B8F3D3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v10, v15);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v16, v21);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v24;
  uint64_t v39 = v25;
  uint64_t v40 = v26;
  uint64_t v41 = v27;
  uint64_t v42 = v28;
  uint64_t v43 = v29;
  uint64_t v30 = type metadata accessor for InternalMessageSender();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v34, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v35, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v36, a6);
  swift_allocObject();
  uint64_t v31 = sub_1B8F3CA4C((uint64_t)v23, (uint64_t)v18, (uint64_t)v12);
  uint64_t v32 = v37;
  *(void *)(v37 + 40) = v30;
  *(void *)(v32 + 48) = &off_1F12BE138;
  *(void *)(v32 + 16) = v31;
  return v32;
}

uint64_t sub_1B8F3D618(uint64_t a1)
{
  return sub_1B8F3C880(a1, *(void **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for MessageSender()
{
  return self;
}

uint64_t method lookup function for MessageSender(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessageSender);
}

uint64_t dispatch thunk of MessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of MessageSender.send<A>(_:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of MessageSender.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 104)
                                                                   + **(int **)(*(void *)v4 + 104));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_1B8F08F7C;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_1B8F3D7C8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for InternalMessageSender()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B8F3D8F0()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_1B8F3D930(uint64_t a1)
{
  return sub_1B8F3CEC4(a1, *(void (**)(char *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1B8F3D940(uint64_t a1)
{
  return sub_1B8F3D08C(a1, *(uint64_t **)(v1 + 32));
}

uint64_t sub_1B8F3D960()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1B8F3D970(uint64_t a1)
{
  return sub_1B8F3C94C(a1, *(void *)(v1 + 32));
}

uint64_t dispatch thunk of PushServiceDelegate.process(message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PushServiceDelegate.respondsTo(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PushServiceDelegate.didReceivePublicToken(publicToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

id ExponentialRetryScheduler.__allocating_init(maxRetries:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return objc_msgSend(v3, sel_initWithMaxRetries_power_, a1, 2.0);
}

id ExponentialRetryScheduler.init(maxRetries:)(uint64_t a1)
{
  return objc_msgSend(v1, sel_initWithMaxRetries_power_, a1, 2.0);
}

id ExponentialRetryScheduler.__allocating_init(maxRetries:power:)(uint64_t a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  id v6 = objc_allocWithZone(v2);
  id v7 = ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a1, (uint64_t)v9, a2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

id ExponentialRetryScheduler.init(maxRetries:power:)(uint64_t a1, double a2)
{
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  id v4 = objc_allocWithZone((Class)swift_getObjectType());
  id v5 = ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a1, (uint64_t)v7, a2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

id ExponentialRetryScheduler.__allocating_init(maxRetries:power:schedulerDelay:)(uint64_t a1, uint64_t a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a1, a2, a3);
}

id ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] = 0;
  *(void *)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries] = a1;
  *(double *)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_power] = a3;
  sub_1B8F23B7C(a2, (uint64_t)&v13, qword_1E9EF3C80);
  if (v14)
  {
    sub_1B8F2160C(&v13, (uint64_t)&v15);
    uint64_t v8 = v3;
  }
  else
  {
    uint64_t v16 = &type metadata for DefaultSchedulerDelay;
    uint64_t v17 = &off_1F12BD2D0;
    uint64_t v9 = v3;
    sub_1B8F1DBD4((uint64_t)&v13, qword_1E9EF3C80);
  }
  sub_1B8F2160C(&v15, (uint64_t)&v3[OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay]);

  v12.receiver = v3;
  v12.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_1B8F1DBD4(a2, qword_1E9EF3C80);
  return v10;
}

uint64_t sub_1B8F3DD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[35] = a7;
  v8[36] = a8;
  v8[33] = a5;
  v8[34] = a6;
  v8[31] = a3;
  unsigned char v8[32] = a4;
  v8[29] = a1;
  v8[30] = a2;
  swift_retain();
  return MEMORY[0x1F4188298](sub_1B8F3DDB0, 0, 0);
}

uint64_t sub_1B8F3DDB0()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 296) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 280);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  *unint64_t v2 = v0;
  v2[1] = sub_1B8F3DEAC;
  uint64_t v4 = *(void *)(v0 + 232);
  return MEMORY[0x1F4188160](v4, 0, 0, 0xD00000000000001CLL, 0x80000001B8F5C800, sub_1B8F44510, v1, v3);
}

uint64_t sub_1B8F3DEAC()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v2 = sub_1B8F3E030;
  }
  else
  {
    swift_task_dealloc();
    unint64_t v2 = sub_1B8F3DFC8;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F3DFC8()
{
  swift_release_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F3E030()
{
  uint64_t v1 = *(void *)(v0 + 240);
  swift_task_dealloc();
  *(void *)(v0 + 16) = 0;
  unint64_t v2 = (unsigned char *)(v0 + 400);
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 1;
  uint64_t v3 = *(void **)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 256);
  if (v1)
  {
    id v5 = *(uint64_t (**)(void *))(v0 + 240);
    id v6 = v3;
    char v7 = v5(v3);
    *(unsigned char *)(v0 + 400) = v7 & 1;
    if ((v7 & 1) != 0 && v4)
    {
LABEL_4:
      uint64_t v41 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 256) + **(int **)(v0 + 256));
      uint64_t v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_1B8F3E670;
      uint64_t v9 = *(void *)(v0 + 312);
      return v41(v9);
    }
  }
  else
  {
    *unint64_t v2 = 1;
    id v11 = v3;
    if (v4) {
      goto LABEL_4;
    }
  }
  uint64_t v12 = v0 + 112;
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  long long v13 = *(void **)(v0 + 272);
  uint64_t v14 = sub_1B8F572D0();
  *(void *)(v0 + 336) = __swift_project_value_buffer(v14, (uint64_t)qword_1EB9C4218);
  id v15 = v13;
  uint64_t v16 = sub_1B8F572B0();
  os_log_type_t v17 = sub_1B8F57880();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = *(char **)(v0 + 272);
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 392) = *v2;
    sub_1B8F579A0();
    *(_WORD *)(v19 + 8) = 1024;
    *(_DWORD *)(v0 + 396) = *(void *)&v18[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(void *)&v18[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B8F579A0();

    _os_log_impl(&dword_1B8F03000, v16, v17, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v19, 0xEu);
    uint64_t v20 = v19;
    uint64_t v12 = v0 + 112;
    MEMORY[0x1BA9D0800](v20, -1, -1);
  }
  else
  {

    uint64_t v16 = *(NSObject **)(v0 + 272);
  }

  uint64_t v21 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(void *)(v0 + 344) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(void *)(v0 + 352) = v21;
  swift_beginAccess();
  sub_1B8F23B7C(v0 + 16, v12, (uint64_t *)&unk_1E9EF3D10);
  uint64_t v22 = *(void **)(v0 + 312);
  if (*(void *)(v0 + 136) == 1)
  {
    *(void *)(v0 + 360) = v22;
    sub_1B8F1DBD4(v12, (uint64_t *)&unk_1E9EF3D10);
    if (*v2)
    {
      uint64_t v23 = *(char **)(v0 + 272);
      uint64_t v24 = *(void *)&v23[*(void *)(v0 + 344)];
      uint64_t v25 = *(void *)&v23[*(void *)(v0 + 352)];
      *(void *)(v0 + 368) = v25;
      if (v24 < v25)
      {
        uint64_t v26 = v23;
        uint64_t v27 = sub_1B8F572B0();
        os_log_type_t v28 = sub_1B8F57880();
        BOOL v29 = os_log_type_enabled(v27, v28);
        uint64_t v30 = *(void **)(v0 + 272);
        if (v29)
        {
          uint64_t v31 = swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 134218240;
          *(void *)(v31 + 4) = v24;
          *(_WORD *)(v31 + 12) = 2048;
          *(void *)(v31 + 14) = v25;

          _os_log_impl(&dword_1B8F03000, v27, v28, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v31, 0x16u);
          MEMORY[0x1BA9D0800](v31, -1, -1);
        }
        else
        {
        }
        swift_retain();
        uint64_t v39 = swift_task_alloc();
        *(void *)(v0 + 376) = v39;
        *(void *)uint64_t v39 = v0;
        *(void *)(v39 + 8) = sub_1B8F3F3B0;
        long long v40 = *(_OWORD *)(v0 + 272);
        *(void *)(v39 + 48) = *(void *)(v0 + 288);
        *(_OWORD *)(v39 + 32) = v40;
        *(void *)(v39 + 24) = v0 + 48;
        return MEMORY[0x1F4188298](sub_1B8F422AC, 0, 0);
      }
    }
    uint64_t v22 = *(void **)(v0 + 360);
  }
  else
  {
    sub_1B8F1DBD4(v12, (uint64_t *)&unk_1E9EF3D10);
  }
  sub_1B8F23B7C(v0 + 16, v0 + 80, (uint64_t *)&unk_1E9EF3D10);
  if (*(void *)(v0 + 104) == 1)
  {
    sub_1B8F1DBD4(v0 + 80, (uint64_t *)&unk_1E9EF3D10);
    os_log_type_t v32 = sub_1B8F57870();
    uint64_t v33 = sub_1B8F572B0();
    if (os_log_type_enabled(v33, v32))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_1B8F03000, v33, v32, "All retry failed", v34, 2u);
      MEMORY[0x1BA9D0800](v34, -1, -1);
    }
    uint64_t v35 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);
    swift_release_n();
    uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v37 = *(void **)(v0 + 312);
    uint64_t v38 = *(void *)(v0 + 232);
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);

    sub_1B8F44518(v0 + 80, v0 + 144, &qword_1EB9C33F0);
    sub_1B8F44518(v0 + 144, v38, &qword_1EB9C33F0);
    swift_release_n();
    uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v36();
}

uint64_t sub_1B8F3E670()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1B8F3ECB4;
  }
  else {
    unint64_t v2 = sub_1B8F3E784;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F3E784()
{
  uint64_t v1 = v0 + 112;
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  unint64_t v2 = (unsigned char *)(v0 + 400);
  uint64_t v3 = *(void **)(v0 + 272);
  uint64_t v4 = sub_1B8F572D0();
  *(void *)(v0 + 336) = __swift_project_value_buffer(v4, (uint64_t)qword_1EB9C4218);
  id v5 = v3;
  id v6 = sub_1B8F572B0();
  os_log_type_t v7 = sub_1B8F57880();
  uint64_t v8 = &unk_1E9EF4000;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = *(char **)(v0 + 272);
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 392) = *v2;
    uint64_t v1 = v0 + 112;
    sub_1B8F579A0();
    *(_WORD *)(v10 + 8) = 1024;
    *(_DWORD *)(v0 + 396) = *(void *)&v9[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(void *)&v9[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B8F579A0();

    uint64_t v8 = (void *)&unk_1E9EF4000;
    _os_log_impl(&dword_1B8F03000, v6, v7, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v10, 0xEu);
    MEMORY[0x1BA9D0800](v10, -1, -1);
  }
  else
  {

    id v6 = *(NSObject **)(v0 + 272);
  }

  uint64_t v11 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(void *)(v0 + 344) = v8[487];
  *(void *)(v0 + 352) = v11;
  swift_beginAccess();
  sub_1B8F23B7C(v0 + 16, v1, (uint64_t *)&unk_1E9EF3D10);
  uint64_t v12 = *(void **)(v0 + 312);
  if (*(void *)(v0 + 136) == 1)
  {
    *(void *)(v0 + 360) = v12;
    sub_1B8F1DBD4(v1, (uint64_t *)&unk_1E9EF3D10);
    if (*v2)
    {
      long long v13 = *(char **)(v0 + 272);
      uint64_t v14 = *(void *)&v13[*(void *)(v0 + 344)];
      uint64_t v15 = *(void *)&v13[*(void *)(v0 + 352)];
      *(void *)(v0 + 368) = v15;
      if (v14 < v15)
      {
        uint64_t v16 = v13;
        os_log_type_t v17 = sub_1B8F572B0();
        os_log_type_t v18 = sub_1B8F57880();
        BOOL v19 = os_log_type_enabled(v17, v18);
        uint64_t v20 = *(void **)(v0 + 272);
        if (v19)
        {
          uint64_t v21 = swift_slowAlloc();
          *(_DWORD *)uint64_t v21 = 134218240;
          *(void *)(v21 + 4) = v14;
          *(_WORD *)(v21 + 12) = 2048;
          *(void *)(v21 + 14) = v15;

          _os_log_impl(&dword_1B8F03000, v17, v18, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v21, 0x16u);
          MEMORY[0x1BA9D0800](v21, -1, -1);
        }
        else
        {
        }
        swift_retain();
        uint64_t v30 = swift_task_alloc();
        *(void *)(v0 + 376) = v30;
        *(void *)uint64_t v30 = v0;
        *(void *)(v30 + 8) = sub_1B8F3F3B0;
        long long v31 = *(_OWORD *)(v0 + 272);
        *(void *)(v30 + 48) = *(void *)(v0 + 288);
        *(_OWORD *)(v30 + 32) = v31;
        *(void *)(v30 + 24) = v0 + 48;
        return MEMORY[0x1F4188298](sub_1B8F422AC, 0, 0);
      }
    }
    uint64_t v12 = *(void **)(v0 + 360);
  }
  else
  {
    sub_1B8F1DBD4(v1, (uint64_t *)&unk_1E9EF3D10);
  }
  sub_1B8F23B7C(v0 + 16, v0 + 80, (uint64_t *)&unk_1E9EF3D10);
  if (*(void *)(v0 + 104) == 1)
  {
    sub_1B8F1DBD4(v0 + 80, (uint64_t *)&unk_1E9EF3D10);
    os_log_type_t v22 = sub_1B8F57870();
    uint64_t v23 = sub_1B8F572B0();
    if (os_log_type_enabled(v23, v22))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_1B8F03000, v23, v22, "All retry failed", v24, 2u);
      MEMORY[0x1BA9D0800](v24, -1, -1);
    }
    uint64_t v25 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);
    swift_release_n();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v27 = *(void **)(v0 + 312);
    uint64_t v28 = *(void *)(v0 + 232);
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);

    sub_1B8F44518(v0 + 80, v0 + 144, &qword_1EB9C33F0);
    sub_1B8F44518(v0 + 144, v28, &qword_1EB9C33F0);
    swift_release_n();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v26();
}

uint64_t sub_1B8F3ECB4()
{
  id v1 = *(id *)(v0 + 328);
  p_cache = &OBJC_METACLASS____TtC18AAAFoundationSwift17DictionaryDecoder.cache;
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v3 = (unsigned char *)(v0 + 400);
  uint64_t v4 = *(void **)(v0 + 328);
  uint64_t v5 = sub_1B8F572D0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB9C4218);
  id v6 = v4;
  id v7 = v4;
  uint64_t v8 = sub_1B8F572B0();
  os_log_type_t v9 = sub_1B8F57880();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 328);
  if (v10)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    long long v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    log = v8;
    uint64_t v15 = v5;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 224) = v16;
    uint64_t v3 = (unsigned char *)(v0 + 400);
    p_cache = (void **)(&OBJC_METACLASS____TtC18AAAFoundationSwift17DictionaryDecoder + 16);
    sub_1B8F579A0();
    *long long v13 = v16;
    uint64_t v5 = v15;

    _os_log_impl(&dword_1B8F03000, log, v9, "errorHandler returned error: %@, retry will NOT continue.", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4F68);
    swift_arrayDestroy();
    MEMORY[0x1BA9D0800](v13, -1, -1);
    MEMORY[0x1BA9D0800](v12, -1, -1);
  }
  else
  {
  }
  uint64_t v17 = v0 + 112;
  *uint64_t v3 = 0;
  if (p_cache[41] != (void *)-1) {
    swift_once();
  }
  os_log_type_t v18 = *(void **)(v0 + 272);
  *(void *)(v0 + 336) = __swift_project_value_buffer(v5, (uint64_t)qword_1EB9C4218);
  id v19 = v18;
  uint64_t v20 = sub_1B8F572B0();
  os_log_type_t v21 = sub_1B8F57880();
  os_log_type_t v22 = &unk_1E9EF4000;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = *(char **)(v0 + 272);
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 392) = *v3;
    uint64_t v17 = v0 + 112;
    sub_1B8F579A0();
    *(_WORD *)(v24 + 8) = 1024;
    *(_DWORD *)(v0 + 396) = *(void *)&v23[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(void *)&v23[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B8F579A0();

    os_log_type_t v22 = (void *)&unk_1E9EF4000;
    _os_log_impl(&dword_1B8F03000, v20, v21, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v24, 0xEu);
    MEMORY[0x1BA9D0800](v24, -1, -1);
    uint64_t v25 = (void *)&unk_1E9EF4000;
  }
  else
  {

    uint64_t v20 = *(NSObject **)(v0 + 272);
    uint64_t v25 = &unk_1E9EF4000;
  }

  uint64_t v26 = v22[488];
  *(void *)(v0 + 344) = v25[487];
  *(void *)(v0 + 352) = v26;
  swift_beginAccess();
  sub_1B8F23B7C(v0 + 16, v17, (uint64_t *)&unk_1E9EF3D10);
  uint64_t v27 = *(void **)(v0 + 312);
  if (*(void *)(v0 + 136) == 1)
  {
    *(void *)(v0 + 360) = v27;
    sub_1B8F1DBD4(v17, (uint64_t *)&unk_1E9EF3D10);
    if (*v3)
    {
      uint64_t v28 = *(char **)(v0 + 272);
      uint64_t v29 = *(void *)&v28[*(void *)(v0 + 344)];
      uint64_t v30 = *(void *)&v28[*(void *)(v0 + 352)];
      *(void *)(v0 + 368) = v30;
      if (v29 < v30)
      {
        long long v31 = v28;
        uint64_t v32 = sub_1B8F572B0();
        os_log_type_t v33 = sub_1B8F57880();
        BOOL v34 = os_log_type_enabled(v32, v33);
        uint64_t v35 = *(void **)(v0 + 272);
        if (v34)
        {
          uint64_t v36 = swift_slowAlloc();
          *(_DWORD *)uint64_t v36 = 134218240;
          *(void *)(v36 + 4) = v29;
          *(_WORD *)(v36 + 12) = 2048;
          *(void *)(v36 + 14) = v30;

          _os_log_impl(&dword_1B8F03000, v32, v33, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v36, 0x16u);
          MEMORY[0x1BA9D0800](v36, -1, -1);
        }
        else
        {
        }
        swift_retain();
        uint64_t v45 = swift_task_alloc();
        *(void *)(v0 + 376) = v45;
        *(void *)uint64_t v45 = v0;
        *(void *)(v45 + 8) = sub_1B8F3F3B0;
        long long v46 = *(_OWORD *)(v0 + 272);
        *(void *)(v45 + 48) = *(void *)(v0 + 288);
        *(_OWORD *)(v45 + 32) = v46;
        *(void *)(v45 + 24) = v0 + 48;
        return MEMORY[0x1F4188298](sub_1B8F422AC, 0, 0);
      }
    }
    uint64_t v27 = *(void **)(v0 + 360);
  }
  else
  {
    sub_1B8F1DBD4(v17, (uint64_t *)&unk_1E9EF3D10);
  }
  sub_1B8F23B7C(v0 + 16, v0 + 80, (uint64_t *)&unk_1E9EF3D10);
  if (*(void *)(v0 + 104) == 1)
  {
    sub_1B8F1DBD4(v0 + 80, (uint64_t *)&unk_1E9EF3D10);
    os_log_type_t v37 = sub_1B8F57870();
    uint64_t v38 = sub_1B8F572B0();
    if (os_log_type_enabled(v38, v37))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_1B8F03000, v38, v37, "All retry failed", v39, 2u);
      MEMORY[0x1BA9D0800](v39, -1, -1);
    }
    long long v40 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);
    swift_release_n();
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v42 = *(void **)(v0 + 312);
    uint64_t v43 = *(void *)(v0 + 232);
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);

    sub_1B8F44518(v0 + 80, v0 + 144, &qword_1EB9C33F0);
    sub_1B8F44518(v0 + 144, v43, &qword_1EB9C33F0);
    swift_release_n();
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v41();
}

uint64_t sub_1B8F3F3B0()
{
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_1B8F3F928;
  }
  else {
    unint64_t v2 = sub_1B8F3F4C4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F3F4C4()
{
  uint64_t v1 = *(void **)(v0 + 272);
  sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);
  sub_1B8F44518(v0 + 48, v0 + 16, (uint64_t *)&unk_1E9EF3D10);
  id v2 = v1;
  uint64_t v3 = sub_1B8F572B0();
  os_log_type_t v4 = sub_1B8F57880();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(v0 + 368);
    uint64_t v6 = *(void *)(v0 + 344);
    id v7 = *(char **)(v0 + 272);
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134218240;
    *(void *)(v8 + 4) = *(void *)&v7[v6];
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = v5;

    _os_log_impl(&dword_1B8F03000, v3, v4, "Retry succeeded at index: %ld, maxRetry: %ld", (uint8_t *)v8, 0x16u);
    MEMORY[0x1BA9D0800](v8, -1, -1);
  }
  else
  {
  }
  sub_1B8F23B7C(v0 + 16, v0 + 112, (uint64_t *)&unk_1E9EF3D10);
  if (*(void *)(v0 + 136) == 1)
  {
    sub_1B8F1DBD4(v0 + 112, (uint64_t *)&unk_1E9EF3D10);
    if (*(unsigned char *)(v0 + 400))
    {
      os_log_type_t v9 = *(char **)(v0 + 272);
      uint64_t v10 = *(void *)&v9[*(void *)(v0 + 344)];
      uint64_t v11 = *(void *)&v9[*(void *)(v0 + 352)];
      *(void *)(v0 + 368) = v11;
      if (v10 < v11)
      {
        uint64_t v12 = v9;
        long long v13 = sub_1B8F572B0();
        os_log_type_t v14 = sub_1B8F57880();
        BOOL v15 = os_log_type_enabled(v13, v14);
        uint64_t v16 = *(void **)(v0 + 272);
        if (v15)
        {
          uint64_t v17 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 134218240;
          *(void *)(v17 + 4) = v10;
          *(_WORD *)(v17 + 12) = 2048;
          *(void *)(v17 + 14) = v11;

          _os_log_impl(&dword_1B8F03000, v13, v14, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v17, 0x16u);
          MEMORY[0x1BA9D0800](v17, -1, -1);
        }
        else
        {
        }
        swift_retain();
        uint64_t v27 = swift_task_alloc();
        *(void *)(v0 + 376) = v27;
        *(void *)uint64_t v27 = v0;
        *(void *)(v27 + 8) = sub_1B8F3F3B0;
        long long v28 = *(_OWORD *)(v0 + 272);
        *(void *)(v27 + 48) = *(void *)(v0 + 288);
        *(_OWORD *)(v27 + 32) = v28;
        *(void *)(v27 + 24) = v0 + 48;
        return MEMORY[0x1F4188298](sub_1B8F422AC, 0, 0);
      }
    }
    os_log_type_t v18 = *(void **)(v0 + 360);
  }
  else
  {
    os_log_type_t v18 = *(void **)(v0 + 360);
    sub_1B8F1DBD4(v0 + 112, (uint64_t *)&unk_1E9EF3D10);
  }
  sub_1B8F23B7C(v0 + 16, v0 + 80, (uint64_t *)&unk_1E9EF3D10);
  if (*(void *)(v0 + 104) == 1)
  {
    sub_1B8F1DBD4(v0 + 80, (uint64_t *)&unk_1E9EF3D10);
    os_log_type_t v19 = sub_1B8F57870();
    uint64_t v20 = sub_1B8F572B0();
    if (os_log_type_enabled(v20, v19))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v21 = 0;
      _os_log_impl(&dword_1B8F03000, v20, v19, "All retry failed", v21, 2u);
      MEMORY[0x1BA9D0800](v21, -1, -1);
    }
    os_log_type_t v22 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);
    swift_release_n();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v24 = *(void **)(v0 + 312);
    uint64_t v25 = *(void *)(v0 + 232);
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);

    sub_1B8F44518(v0 + 80, v0 + 144, &qword_1EB9C33F0);
    sub_1B8F44518(v0 + 144, v25, &qword_1EB9C33F0);
    swift_release_n();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v23();
}

uint64_t sub_1B8F3F928()
{
  uint64_t v1 = *(void **)(v0 + 272);
  os_log_type_t v2 = sub_1B8F57870();
  id v3 = v1;
  os_log_type_t v4 = sub_1B8F572B0();
  if (os_log_type_enabled(v4, v2))
  {
    uint64_t v5 = *(void *)(v0 + 368);
    uint64_t v6 = *(void *)(v0 + 344);
    id v7 = *(char **)(v0 + 272);
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134218240;
    *(void *)(v8 + 4) = *(void *)&v7[v6];
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = v5;

    _os_log_impl(&dword_1B8F03000, v4, v2, "Error occurred during retry at index: %ld, maxRetry: %ld", (uint8_t *)v8, 0x16u);
    MEMORY[0x1BA9D0800](v8, -1, -1);
  }
  else
  {
  }
  os_log_type_t v9 = *(uint64_t (**)(void))(v0 + 240);
  if (v9) {
    char v10 = v9(*(void *)(v0 + 384));
  }
  else {
    char v10 = 1;
  }

  *(unsigned char *)(v0 + 400) = v10 & 1;
  sub_1B8F23B7C(v0 + 16, v0 + 112, (uint64_t *)&unk_1E9EF3D10);
  uint64_t v11 = *(void **)(v0 + 384);
  if (*(void *)(v0 + 136) == 1)
  {
    *(void *)(v0 + 360) = v11;
    sub_1B8F1DBD4(v0 + 112, (uint64_t *)&unk_1E9EF3D10);
    if (*(unsigned char *)(v0 + 400))
    {
      uint64_t v12 = *(char **)(v0 + 272);
      uint64_t v13 = *(void *)&v12[*(void *)(v0 + 344)];
      uint64_t v14 = *(void *)&v12[*(void *)(v0 + 352)];
      *(void *)(v0 + 368) = v14;
      if (v13 < v14)
      {
        BOOL v15 = v12;
        uint64_t v16 = sub_1B8F572B0();
        os_log_type_t v17 = sub_1B8F57880();
        BOOL v18 = os_log_type_enabled(v16, v17);
        os_log_type_t v19 = *(void **)(v0 + 272);
        if (v18)
        {
          uint64_t v20 = swift_slowAlloc();
          *(_DWORD *)uint64_t v20 = 134218240;
          *(void *)(v20 + 4) = v13;
          *(_WORD *)(v20 + 12) = 2048;
          *(void *)(v20 + 14) = v14;

          _os_log_impl(&dword_1B8F03000, v16, v17, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v20, 0x16u);
          MEMORY[0x1BA9D0800](v20, -1, -1);
        }
        else
        {
        }
        swift_retain();
        uint64_t v29 = swift_task_alloc();
        *(void *)(v0 + 376) = v29;
        *(void *)uint64_t v29 = v0;
        *(void *)(v29 + 8) = sub_1B8F3F3B0;
        long long v30 = *(_OWORD *)(v0 + 272);
        *(void *)(v29 + 48) = *(void *)(v0 + 288);
        *(_OWORD *)(v29 + 32) = v30;
        *(void *)(v29 + 24) = v0 + 48;
        return MEMORY[0x1F4188298](sub_1B8F422AC, 0, 0);
      }
    }
    uint64_t v11 = *(void **)(v0 + 360);
  }
  else
  {
    sub_1B8F1DBD4(v0 + 112, (uint64_t *)&unk_1E9EF3D10);
  }
  sub_1B8F23B7C(v0 + 16, v0 + 80, (uint64_t *)&unk_1E9EF3D10);
  if (*(void *)(v0 + 104) == 1)
  {
    sub_1B8F1DBD4(v0 + 80, (uint64_t *)&unk_1E9EF3D10);
    os_log_type_t v21 = sub_1B8F57870();
    os_log_type_t v22 = sub_1B8F572B0();
    if (os_log_type_enabled(v22, v21))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1B8F03000, v22, v21, "All retry failed", v23, 2u);
      MEMORY[0x1BA9D0800](v23, -1, -1);
    }
    uint64_t v24 = *(void **)(v0 + 312);

    swift_willThrow();
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);
    swift_release_n();
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v26 = *(void **)(v0 + 312);
    uint64_t v27 = *(void *)(v0 + 232);
    sub_1B8F1DBD4(v0 + 16, (uint64_t *)&unk_1E9EF3D10);

    sub_1B8F44518(v0 + 80, v0 + 144, &qword_1EB9C33F0);
    sub_1B8F44518(v0 + 144, v27, &qword_1EB9C33F0);
    swift_release_n();
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v25();
}

uint64_t ExponentialRetryScheduler.schedule<A>(_:shouldRetry:willRetry:)(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = v9;
  v11[16] = a8;
  v11[17] = v8;
  v11[14] = a6;
  v11[15] = a7;
  v11[12] = a4;
  v11[13] = a5;
  v11[10] = a2;
  v11[11] = a3;
  v11[9] = a1;
  v11[18] = *(void *)(a8 - 8);
  v11[19] = swift_task_alloc();
  uint64_t v13 = sub_1B8F57980();
  v11[20] = v13;
  v11[21] = *(void *)(v13 - 8);
  v11[22] = swift_task_alloc();
  v11[23] = swift_task_alloc();
  v11[24] = swift_task_alloc();
  v11[25] = swift_task_alloc();
  uint64_t v16 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v14 = (void *)swift_task_alloc();
  v11[26] = v14;
  void *v14 = v11;
  v14[1] = sub_1B8F3FF88;
  return v16(a1);
}

uint64_t sub_1B8F3FF88()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B8F400FC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B8F400FC()
{
  uint64_t v1 = (unsigned char *)(v0 + 368);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  *(void *)(v0 + 224) = v6;
  *(void *)(v0 + 232) = (v3 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v6(v2, 1, 1, v4);
  id v7 = *(void **)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 112);
  if (v5)
  {
    os_log_type_t v9 = *(uint64_t (**)(void *))(v0 + 96);
    id v10 = v7;
    char v11 = v9(v7);
    *(unsigned char *)(v0 + 368) = v11 & 1;
    if ((v11 & 1) != 0 && v8)
    {
LABEL_4:
      long long v70 = (uint64_t (*)(uint64_t))(*(void *)(v0 + 112) + **(int **)(v0 + 112));
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 240) = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_1B8F40834;
      uint64_t v13 = *(void *)(v0 + 216);
      return v70(v13);
    }
  }
  else
  {
    unsigned char *v1 = 1;
    id v15 = v7;
    if (v8) {
      goto LABEL_4;
    }
  }
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v16 = *(void **)(v0 + 136);
  uint64_t v17 = sub_1B8F572D0();
  *(void *)(v0 + 256) = __swift_project_value_buffer(v17, (uint64_t)qword_1EB9C4218);
  id v18 = v16;
  os_log_type_t v19 = sub_1B8F572B0();
  os_log_type_t v20 = sub_1B8F57880();
  if (os_log_type_enabled(v19, v20))
  {
    os_log_type_t v21 = *(char **)(v0 + 136);
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 360) = *v1;
    sub_1B8F579A0();
    *(_WORD *)(v22 + 8) = 1024;
    *(_DWORD *)(v0 + 364) = *(void *)&v21[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(void *)&v21[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B8F579A0();

    _os_log_impl(&dword_1B8F03000, v19, v20, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v22, 0xEu);
    MEMORY[0x1BA9D0800](v22, -1, -1);
  }
  else
  {

    os_log_type_t v19 = *(NSObject **)(v0 + 136);
  }
  uint64_t v24 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 200);
  uint64_t v25 = *(void *)(v0 + 160);
  uint64_t v26 = *(void *)(v0 + 168);
  uint64_t v27 = *(void *)(v0 + 144);
  uint64_t v28 = *(void *)(v0 + 128);

  uint64_t v29 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(void *)(v0 + 264) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(void *)(v0 + 272) = v29;
  swift_beginAccess();
  long long v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  v26 += 16;
  *(void *)(v0 + 280) = v30;
  *(void *)(v0 + 288) = v26 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v30(v24, v23, v25);
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
  *(void *)(v0 + 296) = v31;
  *(void *)(v0 + 304) = (v27 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v32 = v31(v24, 1, v28);
  os_log_type_t v33 = *(void (**)(uint64_t, uint64_t))(v26 - 8);
  *(void *)(v0 + 312) = v33;
  if (v32 == 1)
  {
    uint64_t v34 = *(void *)(v0 + 192);
    uint64_t v35 = *(void *)(v0 + 160);
    uint64_t v36 = (*(void *)(v0 + 168) + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    *(void *)(v0 + 320) = *(void *)(v0 + 216);
    *(void *)(v0 + 328) = v36;
    v33(v34, v35);
    if (*v1)
    {
      os_log_type_t v37 = *(char **)(v0 + 136);
      uint64_t v38 = *(void *)&v37[*(void *)(v0 + 264)];
      uint64_t v39 = *(void *)&v37[*(void *)(v0 + 272)];
      *(void *)(v0 + 336) = v39;
      if (v38 < v39)
      {
        long long v40 = v37;
        uint64_t v41 = sub_1B8F572B0();
        os_log_type_t v42 = sub_1B8F57880();
        BOOL v43 = os_log_type_enabled(v41, v42);
        uint64_t v44 = *(void **)(v0 + 136);
        if (v43)
        {
          uint64_t v45 = swift_slowAlloc();
          *(_DWORD *)uint64_t v45 = 134218240;
          *(void *)(v45 + 4) = v38;
          *(_WORD *)(v45 + 12) = 2048;
          *(void *)(v45 + 14) = v39;

          _os_log_impl(&dword_1B8F03000, v41, v42, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v45, 0x16u);
          MEMORY[0x1BA9D0800](v45, -1, -1);
        }
        else
        {
        }
        uint64_t v67 = swift_task_alloc();
        *(void *)(v0 + 344) = v67;
        *(void *)uint64_t v67 = v0;
        *(void *)(v67 + 8) = sub_1B8F40F44;
        uint64_t v68 = *(void *)(v0 + 184);
        long long v69 = *(_OWORD *)(v0 + 80);
        *(void *)(v67 + 48) = *(void *)(v0 + 136);
        *(_OWORD *)(v67 + 32) = v69;
        *(void *)(v67 + 24) = v68;
        return MEMORY[0x1F4188298](sub_1B8F42964, 0, 0);
      }
    }
    long long v46 = *(void **)(v0 + 320);
  }
  else
  {
    long long v46 = *(void **)(v0 + 216);
    v33(*(void *)(v0 + 192), *(void *)(v0 + 160));
  }
  unint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v48 = *(void *)(v0 + 176);
  uint64_t v49 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, void))(v0 + 280))(v48, *(void *)(v0 + 200), *(void *)(v0 + 160));
  int v50 = v47(v48, 1, v49);
  unint64_t v51 = *(void (**)(void, void))(v0 + 312);
  if (v50 == 1)
  {
    v51(*(void *)(v0 + 176), *(void *)(v0 + 160));
    os_log_type_t v52 = sub_1B8F57870();
    uint64_t v53 = sub_1B8F572B0();
    if (os_log_type_enabled(v53, v52))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl(&dword_1B8F03000, v53, v52, "All retry failed", v54, 2u);
      MEMORY[0x1BA9D0800](v54, -1, -1);
    }
    char v55 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v56 = *(void **)(v0 + 216);
    uint64_t v57 = *(void *)(v0 + 200);
    uint64_t v58 = *(void *)(v0 + 160);

    swift_willThrow();
    v55(v57, v58);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v60 = *(void **)(v0 + 216);
    uint64_t v61 = *(void *)(v0 + 176);
    uint64_t v62 = *(void *)(v0 + 152);
    uint64_t v63 = *(void *)(v0 + 144);
    uint64_t v64 = *(void *)(v0 + 128);
    uint64_t v65 = *(void *)(v0 + 72);
    v51(*(void *)(v0 + 200), *(void *)(v0 + 160));

    unint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 32);
    v66(v62, v61, v64);
    v66(v65, v62, v64);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v59();
}

uint64_t sub_1B8F40834()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F41598;
  }
  else {
    uint64_t v2 = sub_1B8F40948;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F40948()
{
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v1 = (unsigned char *)(v0 + 368);
  uint64_t v2 = *(void **)(v0 + 136);
  uint64_t v3 = sub_1B8F572D0();
  *(void *)(v0 + 256) = __swift_project_value_buffer(v3, (uint64_t)qword_1EB9C4218);
  id v4 = v2;
  uint64_t v5 = sub_1B8F572B0();
  os_log_type_t v6 = sub_1B8F57880();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = *(char **)(v0 + 136);
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 360) = *v1;
    sub_1B8F579A0();
    *(_WORD *)(v8 + 8) = 1024;
    *(_DWORD *)(v0 + 364) = *(void *)&v7[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(void *)&v7[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B8F579A0();

    _os_log_impl(&dword_1B8F03000, v5, v6, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v8, 0xEu);
    MEMORY[0x1BA9D0800](v8, -1, -1);
  }
  else
  {

    uint64_t v5 = *(NSObject **)(v0 + 136);
  }
  uint64_t v10 = *(void *)(v0 + 192);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v11 = *(void *)(v0 + 160);
  uint64_t v12 = *(void *)(v0 + 168);
  uint64_t v13 = *(void *)(v0 + 144);
  uint64_t v14 = *(void *)(v0 + 128);

  uint64_t v15 = OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries;
  *(void *)(v0 + 264) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(void *)(v0 + 272) = v15;
  swift_beginAccess();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v12 += 16;
  *(void *)(v0 + 280) = v16;
  *(void *)(v0 + 288) = v12 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v16(v10, v9, v11);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  *(void *)(v0 + 296) = v17;
  *(void *)(v0 + 304) = (v13 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v18 = v17(v10, 1, v14);
  os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v12 - 8);
  *(void *)(v0 + 312) = v19;
  if (v18 == 1)
  {
    uint64_t v20 = *(void *)(v0 + 192);
    uint64_t v21 = *(void *)(v0 + 160);
    uint64_t v22 = (*(void *)(v0 + 168) + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    *(void *)(v0 + 320) = *(void *)(v0 + 216);
    *(void *)(v0 + 328) = v22;
    v19(v20, v21);
    if (*v1)
    {
      uint64_t v23 = *(char **)(v0 + 136);
      uint64_t v24 = *(void *)&v23[*(void *)(v0 + 264)];
      uint64_t v25 = *(void *)&v23[*(void *)(v0 + 272)];
      *(void *)(v0 + 336) = v25;
      if (v24 < v25)
      {
        uint64_t v26 = v23;
        uint64_t v27 = sub_1B8F572B0();
        os_log_type_t v28 = sub_1B8F57880();
        BOOL v29 = os_log_type_enabled(v27, v28);
        long long v30 = *(void **)(v0 + 136);
        if (v29)
        {
          uint64_t v31 = swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 134218240;
          *(void *)(v31 + 4) = v24;
          *(_WORD *)(v31 + 12) = 2048;
          *(void *)(v31 + 14) = v25;

          _os_log_impl(&dword_1B8F03000, v27, v28, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v31, 0x16u);
          MEMORY[0x1BA9D0800](v31, -1, -1);
        }
        else
        {
        }
        uint64_t v54 = swift_task_alloc();
        *(void *)(v0 + 344) = v54;
        *(void *)uint64_t v54 = v0;
        *(void *)(v54 + 8) = sub_1B8F40F44;
        uint64_t v55 = *(void *)(v0 + 184);
        long long v56 = *(_OWORD *)(v0 + 80);
        *(void *)(v54 + 48) = *(void *)(v0 + 136);
        *(_OWORD *)(v54 + 32) = v56;
        *(void *)(v54 + 24) = v55;
        return MEMORY[0x1F4188298](sub_1B8F42964, 0, 0);
      }
    }
    int v32 = *(void **)(v0 + 320);
  }
  else
  {
    int v32 = *(void **)(v0 + 216);
    v19(*(void *)(v0 + 192), *(void *)(v0 + 160));
  }
  os_log_type_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v34 = *(void *)(v0 + 176);
  uint64_t v35 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, void))(v0 + 280))(v34, *(void *)(v0 + 200), *(void *)(v0 + 160));
  int v36 = v33(v34, 1, v35);
  os_log_type_t v37 = *(void (**)(void, void))(v0 + 312);
  if (v36 == 1)
  {
    v37(*(void *)(v0 + 176), *(void *)(v0 + 160));
    os_log_type_t v38 = sub_1B8F57870();
    uint64_t v39 = sub_1B8F572B0();
    if (os_log_type_enabled(v39, v38))
    {
      long long v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v40 = 0;
      _os_log_impl(&dword_1B8F03000, v39, v38, "All retry failed", v40, 2u);
      MEMORY[0x1BA9D0800](v40, -1, -1);
    }
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    os_log_type_t v42 = *(void **)(v0 + 216);
    uint64_t v43 = *(void *)(v0 + 200);
    uint64_t v44 = *(void *)(v0 + 160);

    swift_willThrow();
    v41(v43, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    long long v46 = *(void **)(v0 + 216);
    uint64_t v47 = *(void *)(v0 + 176);
    uint64_t v48 = *(void *)(v0 + 152);
    uint64_t v49 = *(void *)(v0 + 144);
    uint64_t v50 = *(void *)(v0 + 128);
    uint64_t v51 = *(void *)(v0 + 72);
    v37(*(void *)(v0 + 200), *(void *)(v0 + 160));

    os_log_type_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32);
    v52(v48, v47, v50);
    v52(v51, v48, v50);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v45();
}

uint64_t sub_1B8F40F44()
{
  *(void *)(*(void *)v1 + 352) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F41D5C;
  }
  else {
    uint64_t v2 = sub_1B8F41058;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F41058()
{
  uint64_t v1 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 168);
  uint64_t v6 = *(void *)(v0 + 128);
  id v7 = *(void **)(v0 + 136);
  (*(void (**)(uint64_t, uint64_t))(v0 + 312))(v2, v4);
  v1(v3, 0, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v4);
  id v8 = v7;
  uint64_t v9 = sub_1B8F572B0();
  os_log_type_t v10 = sub_1B8F57880();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void *)(v0 + 336);
    uint64_t v12 = *(void *)(v0 + 264);
    uint64_t v13 = *(char **)(v0 + 136);
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 134218240;
    *(void *)(v14 + 4) = *(void *)&v13[v12];
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v11;

    _os_log_impl(&dword_1B8F03000, v9, v10, "Retry succeeded at index: %ld, maxRetry: %ld", (uint8_t *)v14, 0x16u);
    MEMORY[0x1BA9D0800](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, void))(v0 + 280))(v16, *(void *)(v0 + 200), *(void *)(v0 + 160));
  if (v15(v16, 1, v17) == 1)
  {
    int v18 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v19 = *(void *)(v0 + 192);
    uint64_t v20 = *(void *)(v0 + 160);
    *(void *)(v0 + 328) = (*(void *)(v0 + 168) + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v18(v19, v20);
    if (*(unsigned char *)(v0 + 368))
    {
      uint64_t v21 = *(char **)(v0 + 136);
      uint64_t v22 = *(void *)&v21[*(void *)(v0 + 264)];
      uint64_t v23 = *(void *)&v21[*(void *)(v0 + 272)];
      *(void *)(v0 + 336) = v23;
      if (v22 < v23)
      {
        uint64_t v24 = v21;
        uint64_t v25 = sub_1B8F572B0();
        os_log_type_t v26 = sub_1B8F57880();
        BOOL v27 = os_log_type_enabled(v25, v26);
        os_log_type_t v28 = *(void **)(v0 + 136);
        if (v27)
        {
          uint64_t v29 = swift_slowAlloc();
          *(_DWORD *)uint64_t v29 = 134218240;
          *(void *)(v29 + 4) = v22;
          *(_WORD *)(v29 + 12) = 2048;
          *(void *)(v29 + 14) = v23;

          _os_log_impl(&dword_1B8F03000, v25, v26, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v29, 0x16u);
          MEMORY[0x1BA9D0800](v29, -1, -1);
        }
        else
        {
        }
        uint64_t v52 = swift_task_alloc();
        *(void *)(v0 + 344) = v52;
        *(void *)uint64_t v52 = v0;
        *(void *)(v52 + 8) = sub_1B8F40F44;
        uint64_t v53 = *(void *)(v0 + 184);
        long long v54 = *(_OWORD *)(v0 + 80);
        *(void *)(v52 + 48) = *(void *)(v0 + 136);
        *(_OWORD *)(v52 + 32) = v54;
        *(void *)(v52 + 24) = v53;
        return MEMORY[0x1F4188298](sub_1B8F42964, 0, 0);
      }
    }
    long long v30 = *(void **)(v0 + 320);
  }
  else
  {
    long long v30 = *(void **)(v0 + 320);
    (*(void (**)(void, void))(v0 + 312))(*(void *)(v0 + 192), *(void *)(v0 + 160));
  }
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v32 = *(void *)(v0 + 176);
  uint64_t v33 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, void))(v0 + 280))(v32, *(void *)(v0 + 200), *(void *)(v0 + 160));
  int v34 = v31(v32, 1, v33);
  uint64_t v35 = *(void (**)(void, void))(v0 + 312);
  if (v34 == 1)
  {
    v35(*(void *)(v0 + 176), *(void *)(v0 + 160));
    os_log_type_t v36 = sub_1B8F57870();
    os_log_type_t v37 = sub_1B8F572B0();
    if (os_log_type_enabled(v37, v36))
    {
      os_log_type_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v38 = 0;
      _os_log_impl(&dword_1B8F03000, v37, v36, "All retry failed", v38, 2u);
      MEMORY[0x1BA9D0800](v38, -1, -1);
    }
    uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    long long v40 = *(void **)(v0 + 216);
    uint64_t v41 = *(void *)(v0 + 200);
    uint64_t v42 = *(void *)(v0 + 160);

    swift_willThrow();
    v39(v41, v42);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v44 = *(void **)(v0 + 216);
    uint64_t v45 = *(void *)(v0 + 176);
    uint64_t v46 = *(void *)(v0 + 152);
    uint64_t v47 = *(void *)(v0 + 144);
    uint64_t v48 = *(void *)(v0 + 128);
    uint64_t v49 = *(void *)(v0 + 72);
    v35(*(void *)(v0 + 200), *(void *)(v0 + 160));

    uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32);
    v50(v46, v45, v48);
    v50(v49, v46, v48);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v43();
}

uint64_t sub_1B8F41598()
{
  id v1 = *(id *)(v0 + 248);
  p_cache = &OBJC_METACLASS____TtC18AAAFoundationSwift17DictionaryDecoder.cache;
  if (qword_1EB9C4148 != -1) {
    swift_once();
  }
  uint64_t v3 = (unsigned char *)(v0 + 368);
  uint64_t v4 = *(void **)(v0 + 248);
  uint64_t v5 = sub_1B8F572D0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EB9C4218);
  id v6 = v4;
  id v7 = v4;
  id v8 = sub_1B8F572B0();
  os_log_type_t v9 = sub_1B8F57880();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 248);
  if (v10)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 64) = v15;
    p_cache = (void **)(&OBJC_METACLASS____TtC18AAAFoundationSwift17DictionaryDecoder + 16);
    uint64_t v3 = (unsigned char *)(v0 + 368);
    sub_1B8F579A0();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_1B8F03000, v8, v9, "errorHandler returned error: %@, retry will NOT continue.", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF4F68);
    swift_arrayDestroy();
    MEMORY[0x1BA9D0800](v13, -1, -1);
    MEMORY[0x1BA9D0800](v12, -1, -1);
  }
  else
  {
  }
  *uint64_t v3 = 0;
  if (p_cache[41] != (void *)-1) {
    swift_once();
  }
  uint64_t v16 = *(void **)(v0 + 136);
  *(void *)(v0 + 256) = __swift_project_value_buffer(v5, (uint64_t)qword_1EB9C4218);
  id v17 = v16;
  int v18 = sub_1B8F572B0();
  os_log_type_t v19 = sub_1B8F57880();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = *(char **)(v0 + 136);
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 67109376;
    swift_beginAccess();
    *(_DWORD *)(v0 + 360) = *v3;
    sub_1B8F579A0();
    *(_WORD *)(v21 + 8) = 1024;
    *(_DWORD *)(v0 + 364) = *(void *)&v20[OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry] < *(void *)&v20[OBJC_IVAR___AAFExponentialRetryScheduler_maxRetries];
    sub_1B8F579A0();

    _os_log_impl(&dword_1B8F03000, v18, v19, "Should retry: %{BOOL}d, can retry: %{BOOL}d", (uint8_t *)v21, 0xEu);
    MEMORY[0x1BA9D0800](v21, -1, -1);
    uint64_t v22 = (void *)&unk_1E9EF4000;
  }
  else
  {

    int v18 = *(NSObject **)(v0 + 136);
    uint64_t v22 = &unk_1E9EF4000;
  }
  uint64_t v24 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 200);
  uint64_t v26 = *(void *)(v0 + 160);
  uint64_t v25 = *(void *)(v0 + 168);
  uint64_t v27 = *(void *)(v0 + 144);
  uint64_t v28 = *(void *)(v0 + 128);

  uint64_t v29 = v22[488];
  *(void *)(v0 + 264) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(void *)(v0 + 272) = v29;
  swift_beginAccess();
  long long v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v25 += 16;
  *(void *)(v0 + 280) = v30;
  *(void *)(v0 + 288) = v25 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v30(v24, v23, v26);
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
  *(void *)(v0 + 296) = v31;
  *(void *)(v0 + 304) = (v27 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  int v32 = v31(v24, 1, v28);
  uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v25 - 8);
  *(void *)(v0 + 312) = v33;
  if (v32 == 1)
  {
    uint64_t v34 = *(void *)(v0 + 192);
    uint64_t v35 = *(void *)(v0 + 160);
    uint64_t v36 = (*(void *)(v0 + 168) + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    *(void *)(v0 + 320) = *(void *)(v0 + 216);
    *(void *)(v0 + 328) = v36;
    v33(v34, v35);
    if (*v3)
    {
      os_log_type_t v37 = *(char **)(v0 + 136);
      uint64_t v38 = *(void *)&v37[*(void *)(v0 + 264)];
      uint64_t v39 = *(void *)&v37[*(void *)(v0 + 272)];
      *(void *)(v0 + 336) = v39;
      if (v38 < v39)
      {
        long long v40 = v37;
        uint64_t v41 = sub_1B8F572B0();
        os_log_type_t v42 = sub_1B8F57880();
        BOOL v43 = os_log_type_enabled(v41, v42);
        uint64_t v44 = *(void **)(v0 + 136);
        if (v43)
        {
          uint64_t v45 = swift_slowAlloc();
          *(_DWORD *)uint64_t v45 = 134218240;
          *(void *)(v45 + 4) = v38;
          *(_WORD *)(v45 + 12) = 2048;
          *(void *)(v45 + 14) = v39;

          _os_log_impl(&dword_1B8F03000, v41, v42, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v45, 0x16u);
          MEMORY[0x1BA9D0800](v45, -1, -1);
        }
        else
        {
        }
        uint64_t v68 = swift_task_alloc();
        *(void *)(v0 + 344) = v68;
        *(void *)uint64_t v68 = v0;
        *(void *)(v68 + 8) = sub_1B8F40F44;
        uint64_t v69 = *(void *)(v0 + 184);
        long long v70 = *(_OWORD *)(v0 + 80);
        *(void *)(v68 + 48) = *(void *)(v0 + 136);
        *(_OWORD *)(v68 + 32) = v70;
        *(void *)(v68 + 24) = v69;
        return MEMORY[0x1F4188298](sub_1B8F42964, 0, 0);
      }
    }
    uint64_t v46 = *(void **)(v0 + 320);
  }
  else
  {
    uint64_t v46 = *(void **)(v0 + 216);
    v33(*(void *)(v0 + 192), *(void *)(v0 + 160));
  }
  uint64_t v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v48 = *(void *)(v0 + 176);
  uint64_t v49 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, void))(v0 + 280))(v48, *(void *)(v0 + 200), *(void *)(v0 + 160));
  int v50 = v47(v48, 1, v49);
  uint64_t v51 = *(void (**)(void, void))(v0 + 312);
  if (v50 == 1)
  {
    v51(*(void *)(v0 + 176), *(void *)(v0 + 160));
    os_log_type_t v52 = sub_1B8F57870();
    uint64_t v53 = sub_1B8F572B0();
    if (os_log_type_enabled(v53, v52))
    {
      long long v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v54 = 0;
      _os_log_impl(&dword_1B8F03000, v53, v52, "All retry failed", v54, 2u);
      MEMORY[0x1BA9D0800](v54, -1, -1);
    }
    uint64_t v55 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    long long v56 = *(void **)(v0 + 216);
    uint64_t v57 = *(void *)(v0 + 200);
    uint64_t v58 = *(void *)(v0 + 160);

    swift_willThrow();
    v55(v57, v58);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v60 = *(void **)(v0 + 216);
    uint64_t v61 = *(void *)(v0 + 176);
    uint64_t v62 = *(void *)(v0 + 152);
    uint64_t v63 = *(void *)(v0 + 144);
    uint64_t v64 = *(void *)(v0 + 128);
    uint64_t v65 = *(void *)(v0 + 72);
    v51(*(void *)(v0 + 200), *(void *)(v0 + 160));

    unint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 32);
    v66(v62, v61, v64);
    v66(v65, v62, v64);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v59();
}

uint64_t sub_1B8F41D5C()
{
  id v1 = *(void **)(v0 + 136);
  os_log_type_t v2 = sub_1B8F57870();
  id v3 = v1;
  uint64_t v4 = sub_1B8F572B0();
  if (os_log_type_enabled(v4, v2))
  {
    uint64_t v5 = *(void *)(v0 + 336);
    uint64_t v6 = *(void *)(v0 + 264);
    id v7 = *(char **)(v0 + 136);
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134218240;
    *(void *)(v8 + 4) = *(void *)&v7[v6];
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = v5;

    _os_log_impl(&dword_1B8F03000, v4, v2, "Error occurred during retry at index: %ld, maxRetry: %ld", (uint8_t *)v8, 0x16u);
    MEMORY[0x1BA9D0800](v8, -1, -1);
  }
  else
  {
  }
  os_log_type_t v9 = *(uint64_t (**)(void))(v0 + 96);
  if (v9) {
    char v10 = v9(*(void *)(v0 + 352));
  }
  else {
    char v10 = 1;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  uint64_t v14 = *(void *)(v0 + 192);
  uint64_t v13 = *(void *)(v0 + 200);
  uint64_t v15 = *(void *)(v0 + 160);
  uint64_t v16 = *(void *)(v0 + 128);

  *(unsigned char *)(v0 + 368) = v10 & 1;
  v12(v14, v13, v15);
  int v17 = v11(v14, 1, v16);
  int v18 = *(void **)(v0 + 352);
  if (v17 == 1)
  {
    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v20 = *(void *)(v0 + 192);
    uint64_t v21 = *(void *)(v0 + 160);
    uint64_t v22 = (*(void *)(v0 + 168) + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    *(void *)(v0 + 320) = v18;
    *(void *)(v0 + 328) = v22;
    v19(v20, v21);
    if (*(unsigned char *)(v0 + 368))
    {
      uint64_t v23 = *(char **)(v0 + 136);
      uint64_t v24 = *(void *)&v23[*(void *)(v0 + 264)];
      uint64_t v25 = *(void *)&v23[*(void *)(v0 + 272)];
      *(void *)(v0 + 336) = v25;
      if (v24 < v25)
      {
        uint64_t v26 = v23;
        uint64_t v27 = sub_1B8F572B0();
        os_log_type_t v28 = sub_1B8F57880();
        BOOL v29 = os_log_type_enabled(v27, v28);
        long long v30 = *(void **)(v0 + 136);
        if (v29)
        {
          uint64_t v31 = swift_slowAlloc();
          *(_DWORD *)uint64_t v31 = 134218240;
          *(void *)(v31 + 4) = v24;
          *(_WORD *)(v31 + 12) = 2048;
          *(void *)(v31 + 14) = v25;

          _os_log_impl(&dword_1B8F03000, v27, v28, "Scheduling to retry the task. retryIndex: %ld, maxRetry: %ld", (uint8_t *)v31, 0x16u);
          MEMORY[0x1BA9D0800](v31, -1, -1);
        }
        else
        {
        }
        uint64_t v53 = swift_task_alloc();
        *(void *)(v0 + 344) = v53;
        *(void *)uint64_t v53 = v0;
        *(void *)(v53 + 8) = sub_1B8F40F44;
        uint64_t v54 = *(void *)(v0 + 184);
        long long v55 = *(_OWORD *)(v0 + 80);
        *(void *)(v53 + 48) = *(void *)(v0 + 136);
        *(_OWORD *)(v53 + 32) = v55;
        *(void *)(v53 + 24) = v54;
        return MEMORY[0x1F4188298](sub_1B8F42964, 0, 0);
      }
    }
    int v18 = *(void **)(v0 + 320);
  }
  else
  {
    (*(void (**)(void, void))(v0 + 312))(*(void *)(v0 + 192), *(void *)(v0 + 160));
  }
  int v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  uint64_t v33 = *(void *)(v0 + 176);
  uint64_t v34 = *(void *)(v0 + 128);
  (*(void (**)(uint64_t, void, void))(v0 + 280))(v33, *(void *)(v0 + 200), *(void *)(v0 + 160));
  int v35 = v32(v33, 1, v34);
  uint64_t v36 = *(void (**)(void, void))(v0 + 312);
  if (v35 == 1)
  {
    v36(*(void *)(v0 + 176), *(void *)(v0 + 160));
    os_log_type_t v37 = sub_1B8F57870();
    uint64_t v38 = sub_1B8F572B0();
    if (os_log_type_enabled(v38, v37))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_1B8F03000, v38, v37, "All retry failed", v39, 2u);
      MEMORY[0x1BA9D0800](v39, -1, -1);
    }
    long long v40 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v41 = *(void **)(v0 + 216);
    uint64_t v42 = *(void *)(v0 + 200);
    uint64_t v43 = *(void *)(v0 + 160);

    swift_willThrow();
    v40(v42, v43);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v45 = *(void **)(v0 + 216);
    uint64_t v46 = *(void *)(v0 + 176);
    uint64_t v47 = *(void *)(v0 + 152);
    uint64_t v48 = *(void *)(v0 + 144);
    uint64_t v49 = *(void *)(v0 + 128);
    uint64_t v50 = *(void *)(v0 + 72);
    v36(*(void *)(v0 + 200), *(void *)(v0 + 160));

    uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
    v51(v47, v46, v49);
    v51(v50, v47, v49);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v44();
}

uint64_t sub_1B8F42288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x1F4188298](sub_1B8F422AC, 0, 0);
}

uint64_t sub_1B8F422AC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long double v2 = *(double *)(v1 + OBJC_IVAR___AAFExponentialRetryScheduler_power);
  uint64_t v3 = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(void *)(v0 + 56) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  double v4 = pow(v2, (double)*(uint64_t *)(v1 + v3));
  double v5 = v4 * 1000000000.0;
  if ((~COERCE__INT64(v4 * 1000000000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v5 <= -1.0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v5 < 1.84467441e19)
  {
    if (qword_1EB9C4148 == -1) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  __break(1u);
LABEL_13:
  swift_once();
LABEL_5:
  uint64_t v6 = sub_1B8F572D0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB9C4218);
  id v7 = sub_1B8F572B0();
  os_log_type_t v8 = sub_1B8F57880();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v9 = 134217984;
    *(double *)(v0 + 16) = v4;
    sub_1B8F579A0();
    _os_log_impl(&dword_1B8F03000, v7, v8, "Scheduled after %f second(s)", v9, 0xCu);
    MEMORY[0x1BA9D0800](v9, -1, -1);
  }

  char v10 = (void *)(*(void *)(v0 + 32) + OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay);
  uint64_t v11 = v10[3];
  uint64_t v12 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v15 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(*(void *)(v12 + 8) + **(int **)(v12 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1B8F42524;
  return v15((unint64_t)v5, v11, v12);
}

uint64_t sub_1B8F42524()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    long double v2 = sub_1B8F428DC;
  }
  else {
    long double v2 = sub_1B8F42638;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F42638(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, uint64_t (*a6)(), uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(v8 + 56);
  uint64_t v10 = *(void *)(v8 + 32);
  uint64_t v11 = *(void *)(v10 + v9);
  uint64_t v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = swift_task_alloc();
    long long v14 = *(_OWORD *)(v8 + 40);
    *(void *)(v10 + v9) = v12;
    *(void *)(v8 + 80) = v13;
    *(_OWORD *)(v13 + 16) = v14;
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v8 + 88) = v15;
    a8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
    *uint64_t v15 = v8;
    v15[1] = sub_1B8F42754;
    a1 = *(void *)(v8 + 24);
    a5 = 0x80000001B8F5C800;
    a6 = sub_1B8F44698;
    a2 = 0;
    a3 = 0;
    a4 = 0xD00000000000001CLL;
    a7 = v13;
  }
  return MEMORY[0x1F4188160](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1B8F42754()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    long double v2 = sub_1B8F42870;
  }
  else
  {
    swift_task_dealloc();
    long double v2 = sub_1B8F1B550;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F42870()
{
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F428DC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B8F42940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x1F4188298](sub_1B8F42964, 0, 0);
}

uint64_t sub_1B8F42964()
{
  uint64_t v1 = *(void *)(v0 + 48);
  long double v2 = *(double *)(v1 + OBJC_IVAR___AAFExponentialRetryScheduler_power);
  uint64_t v3 = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  *(void *)(v0 + 56) = OBJC_IVAR___AAFExponentialRetryScheduler_currentRetry;
  double v4 = pow(v2, (double)*(uint64_t *)(v1 + v3));
  double v5 = v4 * 1000000000.0;
  if ((~COERCE__INT64(v4 * 1000000000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v5 <= -1.0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v5 < 1.84467441e19)
  {
    if (qword_1EB9C4148 == -1) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  __break(1u);
LABEL_13:
  swift_once();
LABEL_5:
  uint64_t v6 = sub_1B8F572D0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB9C4218);
  id v7 = sub_1B8F572B0();
  os_log_type_t v8 = sub_1B8F57880();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    *(double *)(v0 + 16) = v4;
    sub_1B8F579A0();
    _os_log_impl(&dword_1B8F03000, v7, v8, "Scheduled after %f second(s)", v9, 0xCu);
    MEMORY[0x1BA9D0800](v9, -1, -1);
  }

  uint64_t v10 = (void *)(*(void *)(v0 + 48) + OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay);
  uint64_t v11 = v10[3];
  uint64_t v12 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t v15 = (uint64_t (*)(unint64_t, uint64_t, uint64_t))(*(void *)(v12 + 8) + **(int **)(v12 + 8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1B8F42BDC;
  return v15((unint64_t)v5, v11, v12);
}

uint64_t sub_1B8F42BDC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_1B8F42D0C, 0, 0);
  }
}

void sub_1B8F42D0C()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = *(void *)(v2 + v1);
  BOOL v4 = __OFADD__(v3, 1);
  uint64_t v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = (int *)v0[4];
    *(void *)(v2 + v1) = v5;
    uint64_t v9 = (void (*)(uint64_t))((char *)v6 + *v6);
    id v7 = (void *)swift_task_alloc();
    v0[9] = v7;
    *id v7 = v0;
    v7[1] = sub_1B8F42DF8;
    uint64_t v8 = v0[3];
    v9(v8);
  }
}

uint64_t sub_1B8F42DF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ExponentialRetryScheduler.schedule(task:shouldRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x1F4188298](sub_1B8F42F14, 0, 0);
}

uint64_t sub_1B8F42F14()
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1E9EF4F78 + dword_1E9EF4F78);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  void *v1 = v0;
  v1[1] = sub_1B8F42FD8;
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[2];
  uint64_t v7 = v0[3];
  return v9(v6, v4, v2, 0, 0, v3, v7, v5);
}

uint64_t sub_1B8F42FD8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B8F43260(const void *a1, const void *a2, const void *a3, void *a4)
{
  v4[10] = a4;
  uint64_t v8 = _Block_copy(a1);
  uint64_t v9 = _Block_copy(a2);
  v4[11] = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  v4[12] = v10;
  *(void *)(v10 + 16) = v8;
  if (v9)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    uint64_t v12 = sub_1B8F444C8;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  v4[13] = v12;
  v4[14] = v11;
  id v13 = a4;
  return MEMORY[0x1F4188298](sub_1B8F43358, 0, 0);
}

uint64_t sub_1B8F43358()
{
  uint64_t v7 = (char *)&dword_1E9EF4F78 + dword_1E9EF4F78;
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = v1;
  void *v1 = v0;
  v1[1] = sub_1B8F4343C;
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, void, void, uint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))v7)(v0 + 2, v2, v3, 0, 0, v5, sub_1B8F444C0, v4);
}

uint64_t sub_1B8F4343C()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B8F436EC;
  }
  else {
    uint64_t v2 = sub_1B8F43550;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B8F43550()
{
  uint64_t v1 = *(void *)(v0 + 104);

  sub_1B8F2C3C8(v1);
  swift_release();
  sub_1B8F44518(v0 + 16, v0 + 48, &qword_1EB9C33F0);
  uint64_t v2 = *(void *)(v0 + 72);
  if (v2)
  {
    uint64_t v3 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 48), *(void *)(v0 + 72));
    uint64_t v4 = *(void *)(v2 - 8);
    uint64_t v5 = swift_task_alloc();
    (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v5, v3, v2);
    uint64_t v6 = sub_1B8F57ED0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v2);
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void (***)(void, void, void))(v0 + 88);
  v7[2](v7, v6, 0);
  _Block_release(v7);
  swift_unknownObjectRelease();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1B8F436EC()
{
  uint64_t v1 = *(void **)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void (***)(void, void, void))(v0 + 88);

  sub_1B8F2C3C8(v2);
  swift_release();
  uint64_t v4 = (void *)sub_1B8F57030();

  ((void (**)(void, void, void *))v3)[2](v3, 0, v4);
  _Block_release(v3);
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1B8F437B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  _OWORD v7[2] = sub_1B8F43870;
  v7[3] = &block_descriptor_4;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_1B8F43870(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(long long *, void *))(a1 + 32);
  if (a2)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a2;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(&v8, a3);
  swift_release();

  return sub_1B8F1DBD4((uint64_t)&v8, &qword_1EB9C33F0);
}

uint64_t sub_1B8F4390C(uint64_t a1, void (*a2)(uint64_t (*)(uint64_t a1, void *a2), uint64_t))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3D08);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  a2(sub_1B8F44610, v9);
  return swift_release();
}

uint64_t sub_1B8F43A54(uint64_t a1, id a2)
{
  if (a2)
  {
    v4[0] = a2;
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3D08);
    return sub_1B8F576F0();
  }
  else
  {
    sub_1B8F23B7C(a1, (uint64_t)v4, &qword_1EB9C33F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3D08);
    return sub_1B8F57700();
  }
}

id ExponentialRetryScheduler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ExponentialRetryScheduler.init()()
{
}

id ExponentialRetryScheduler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8F43BC0(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_1B8F09BDC;
  return ExponentialRetryScheduler.schedule<A>(_:shouldRetry:willRetry:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1B8F43CB8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1B8F08F7C;
  return MEMORY[0x1F4187DE0](a1);
}

uint64_t sub_1B8F43D50(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_1B8F09BDC;
  return v6();
}

uint64_t sub_1B8F43E1C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_1B8F09BDC;
  return v7();
}

uint64_t sub_1B8F43EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B8F57740();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B8F57730();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B8F1DBD4(a1, &qword_1EB9C36C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B8F576E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t type metadata accessor for ExponentialRetryScheduler()
{
  return self;
}

uint64_t method lookup function for ExponentialRetryScheduler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ExponentialRetryScheduler);
}

uint64_t dispatch thunk of ExponentialRetryScheduler.__allocating_init(maxRetries:power:schedulerDelay:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for DefaultSchedulerDelay()
{
  return &type metadata for DefaultSchedulerDelay;
}

uint64_t sub_1B8F440F4()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B8F44144()
{
  objc_super v2 = (const void *)v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v5 = (const void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1B8F08F7C;
  uint64_t v7 = (uint64_t (*)(const void *, const void *, const void *, void *))((char *)&dword_1E9EF4F90
                                                                                + dword_1E9EF4F90);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_1B8F44208()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1B8F09BDC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1E9EF4FA0 + dword_1E9EF4FA0);
  return v6(v2, v3, v4);
}

uint64_t sub_1B8F442CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1B8F09BDC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E9EF4FB0 + dword_1E9EF4FB0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_1B8F44398()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F443D0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1B8F08F7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9EF4FC0 + dword_1E9EF4FC0);
  return v6(a1, v4);
}

uint64_t sub_1B8F44488()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F444C0(uint64_t a1, uint64_t a2)
{
  return sub_1B8F437B4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1B8F444C8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (void *)sub_1B8F57030();
  uint64_t v3 = (*(uint64_t (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return v3;
}

uint64_t sub_1B8F44510(uint64_t a1)
{
  return sub_1B8F4390C(a1, *(void (**)(uint64_t (*)(uint64_t, void *), uint64_t))(v1 + 16));
}

uint64_t sub_1B8F44518(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B8F4457C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3D08);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1B8F44610(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3D08);
  return sub_1B8F43A54(a1, a2);
}

uint64_t OptionalDependency.init(dependencyId:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v9 = sub_1B8F57980();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v9, v11);
  long long v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v15);
  uint64_t v17 = (char *)&v20 - v16;
  int v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56);
  v18(a5, 1, 1, a4);
  v18((uint64_t)v17, 1, 1, a4);
  type metadata accessor for DependencyRegistry();
  if (a2)
  {
    static DependencyRegistry.locateService<A>(by:config:)(v21, a2, a3, a4, (uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    static DependencyRegistry.locateService<A>(by:config:)(v21, 0, a3, a4, (uint64_t)v14);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v17, v14, v9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(a5, v17, v9);
}

uint64_t OptionalDependency.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B8F57980();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_1B8F44904(uint64_t a1)
{
  uint64_t v2 = sub_1B8F57980();
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v8 - v4, a1);
  type metadata accessor for OptionalDependency();
  return OptionalDependency.wrappedValue.setter((uint64_t)v5);
}

uint64_t OptionalDependency.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = sub_1B8F57980();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

void (*OptionalDependency.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  void *v5 = v2;
  v5[1] = v6;
  uint64_t v7 = sub_1B8F57980();
  v5[2] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  v5[3] = v8;
  size_t v10 = *(void *)(v8 + 64);
  v5[4] = malloc(v10);
  v5[5] = malloc(v10);
  (*(void (**)(void))(v9 + 16))();
  return sub_1B8F44B44;
}

void sub_1B8F44B44(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[4];
  uint64_t v4 = (void *)(*a1)[5];
  if (a2)
  {
    uint64_t v5 = v2[2];
    uint64_t v6 = v2[3];
    uint64_t v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    uint64_t v8 = sub_1B8F57980();
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v8 - 8) + 40))(v7, v3, v8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    uint64_t v9 = *v2;
    uint64_t v10 = sub_1B8F57980();
    (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v10 - 8) + 40))(v9, v4, v10);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t OptionalDependency.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_1B8F44CA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OptionalDependency();
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v8 - v4, a1, v2);
  return OptionalDependency.projectedValue.setter((uint64_t)v5, v2);
}

uint64_t OptionalDependency.projectedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t))(v7 + 8))(v2);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  return v5(v2, a1, a2);
}

void (*OptionalDependency.projectedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  void *v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = v6;
  v5[2] = v6;
  v5[3] = v6;
  size_t v8 = *(void *)(v6 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  (*(void (**)(void))(v7 + 16))();
  return sub_1B8F2B8B8;
}

uint64_t sub_1B8F44F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm_0(a1, a2, a3, (uint64_t (*)(uint64_t))OptionalDependency.wrappedValue.getter);
}

uint64_t sub_1B8F44F28()
{
  return 8;
}

void *sub_1B8F44F34(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B8F44F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_getTm_0(a1, a2, a3, (uint64_t (*)(uint64_t))OptionalDependency.projectedValue.getter);
}

uint64_t keypath_getTm_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = type metadata accessor for OptionalDependency();
  return a4(v5);
}

uint64_t sub_1B8F44FA8()
{
  return 8;
}

uint64_t sub_1B8F44FB4()
{
  uint64_t result = sub_1B8F57980();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B8F45044(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1B8F45180(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_1B8F45244(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1B8F4533C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *sub_1B8F454A8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1B8F455A0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    uint64_t v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t sub_1B8F4570C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void sub_1B8F458AC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x1B8F45AE8);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          uint64_t v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for OptionalDependency()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t SyncMessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  uint64_t v12 = sub_1B8F46220(a1, a2, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a6 - 8) + 8))(a3, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a2, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  return v12;
}

uint64_t SyncMessageSender.init<A, B, C>(encoder:decoder:transport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_1B8F46220(a1, a2, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a6 - 8) + 8))(a3, a6);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a5 - 8) + 8))(a2, a5);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  return v12;
}

uint64_t sub_1B8F45D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3[5];
  uint64_t v8 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, a2, a3, v7, v8);
}

uint64_t SyncMessageSender.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t SyncMessageSender.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1B8F45E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F45D60(a1, a2, a3);
}

uint64_t sub_1B8F45E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unsigned int v5 = v4;
  uint64_t v32 = a1;
  v24[1] = a4;
  BOOL v29 = (void *)*v5;
  uint64_t v8 = v29[11];
  uint64_t v28 = v29[14];
  uint64_t v25 = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v27 = AssociatedTypeWitness;
  MEMORY[0x1F4188790](AssociatedTypeWitness, v10);
  uint64_t v31 = (char *)v24 - v11;
  uint64_t v12 = v29[13];
  uint64_t v13 = v29[10];
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14, v15);
  uint64_t v17 = (char *)v24 - v16;
  uint64_t v18 = v33;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v12 + 16))(v32, a2, *(void *)(a3 + 16), v13, v12);
  if (!v18)
  {
    uint64_t v33 = v14;
    uint64_t v20 = v28;
    (*(void (**)(char *, void))(v29[15] + 16))(v17, v29[12]);
    uint64_t v21 = swift_getAssociatedTypeWitness();
    uint64_t v22 = *(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 16);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v22(v21, v31, v21, AssociatedConformanceWitness, v25, v20);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v17, v33);
  }
  return result;
}

uint64_t sub_1B8F461FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_1B8F45E68(a1, a2, a3, a4);
}

uint64_t sub_1B8F46220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = a3;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v10, v15);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v16, v21);
  uint64_t v23 = (char *)&v34 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = v24;
  uint64_t v39 = v25;
  uint64_t v40 = v26;
  uint64_t v41 = v27;
  uint64_t v42 = v28;
  uint64_t v43 = v29;
  uint64_t v30 = type metadata accessor for InternalSyncMessageSender();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v34, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v35, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v36, a6);
  swift_allocObject();
  uint64_t v31 = sub_1B8F3CA4C((uint64_t)v23, (uint64_t)v18, (uint64_t)v12);
  uint64_t v32 = v37;
  *(void *)(v37 + 40) = v30;
  *(void *)(v32 + 48) = &off_1F12BE230;
  *(void *)(v32 + 16) = v31;
  return v32;
}

uint64_t type metadata accessor for SyncMessageSender()
{
  return self;
}

uint64_t method lookup function for SyncMessageSender(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SyncMessageSender);
}

uint64_t dispatch thunk of SyncMessageSender.__allocating_init<A, B, C>(encoder:decoder:transport:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SyncMessageSender.send<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t type metadata accessor for InternalSyncMessageSender()
{
  return swift_getGenericMetadata();
}

void *BroadcastDispatcher.__allocating_init<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v4 = sub_1B8F47B54(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

void *BroadcastDispatcher.init<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B8F47B54(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_1B8F46608(uint64_t a1)
{
  return sub_1B8F468E4(a1);
}

uint64_t sub_1B8F46644(uint64_t a1)
{
  uint64_t v3 = v1[5];
  uint64_t v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v3);
  unsigned int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF50D8);
  return v5(a1, v6, v3, v4);
}

uint64_t sub_1B8F466B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = v6[5];
  uint64_t v14 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v13);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(a1, a2, a3, a4, a5, a6, v13, v14);
}

uint64_t sub_1B8F46754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = v3[5];
  uint64_t v8 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v7);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF50D8);
  return v9(a1, a2, v10, a3, v7, v8);
}

uint64_t sub_1B8F467E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = v7[5];
  uint64_t v16 = v7[6];
  __swift_project_boxed_opaque_existential_1(v7 + 2, v15);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 32))(a1, a2, a3, a4, a5, a6, a7, v15, v16);
}

uint64_t BroadcastDispatcher.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t BroadcastDispatcher.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x1F4186488](v0, 56, 7);
}

uint64_t sub_1B8F468E4(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 104);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  *(void *)(v1 + v3) = sub_1B8F57680();
  uint64_t v5 = *(void *)(*(void *)v1 + 112);
  swift_getFunctionTypeMetadata2();
  *(void *)(v1 + v5) = sub_1B8F57680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v1 + *(void *)(*(void *)v1 + 96), a1, v4);
  return v1;
}

uint64_t sub_1B8F46A40(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v4 = *v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x1F4188790](AssociatedTypeWitness, v7);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v27 = a2;
  uint64_t v11 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](v8, v12);
  uint64_t v25 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t *)((char *)v2 + *(void *)(v4 + 104));
  swift_beginAccess();
  uint64_t v15 = *v14;
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  uint64_t v17 = swift_bridgeObjectRetain();
  if (!MEMORY[0x1BA9CF480](v17, FunctionTypeMetadata1)) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v22 = (void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v23 = (uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v24 = v15;
  char v18 = sub_1B8F57690();
  sub_1B8F57670();
  if (v18)
  {
    uint64_t v19 = *(void (**)(char *))(v15 + 32);
    uint64_t v28 = 1;
    swift_retain();
    (*v22)(v25, v26, v27);
    swift_dynamicCast();
    v19(v10);
    swift_release();
    swift_bridgeObjectRelease();
    return (*v23)(v10, AssociatedTypeWitness);
  }
  else
  {
    uint64_t result = sub_1B8F57A50();
    __break(1u);
    __break(1u);
  }
  return result;
}

uint64_t sub_1B8F46D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = a6;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v9 = *v6;
  uint64_t v10 = *(void *)(*v6 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v14 = (char *)&v21 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v21 - v13, (uint64_t)v6 + *(void *)(v9 + 96), v10);
  unint64_t v15 = (*(unsigned __int8 *)(v11 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v16 = (v12 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = v10;
  *((void *)v17 + 3) = a4;
  *((void *)v17 + 4) = *(void *)(v9 + 88);
  *((void *)v17 + 5) = a5;
  *((void *)v17 + 6) = v21;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v17[v15], v14, v10);
  char v18 = &v17[v16];
  uint64_t v19 = v23;
  *(void *)char v18 = v22;
  *((void *)v18 + 1) = v19;
  uint64_t v24 = sub_1B8F48058;
  uint64_t v25 = v17;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata1();
  sub_1B8F576C0();
  swift_retain();
  sub_1B8F576A0();
  return swift_endAccess();
}

uint64_t sub_1B8F46F90(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(a6 - 8);
  MEMORY[0x1F4188790](a1, a1);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(v12 + 16))(v13);
  if (!v6)
  {
    a3(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, a6);
  }
  return result;
}

uint64_t sub_1B8F470A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v7 = *v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1F4188790](AssociatedTypeWitness, v10);
  uint64_t v13 = (char *)v25 - v12;
  uint64_t v32 = a3;
  uint64_t v14 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](v11, v15);
  uint64_t v29 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t *)((char *)v4 + *(void *)(v7 + 112));
  swift_beginAccess();
  uint64_t v18 = *v17;
  FunctionTypeMetadata2 = swift_getFunctionTypeMetadata2();
  uint64_t v20 = swift_bridgeObjectRetain();
  if (!MEMORY[0x1BA9CF480](v20, FunctionTypeMetadata2)) {
    return swift_bridgeObjectRelease();
  }
  v25[1] = a4 - 8;
  uint64_t v26 = (void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v27 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v28 = v18;
  v25[0] = FunctionTypeMetadata2;
  char v21 = sub_1B8F57690();
  sub_1B8F57670();
  if (v21)
  {
    uint64_t v22 = *(void (**)(char *, uint64_t *))(v18 + 32);
    uint64_t v33 = 1;
    swift_retain();
    (*v26)(v29, v30, v32);
    swift_dynamicCast();
    v34[3] = a4;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v34);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_0, v31, a4);
    v22(v13, v34);
    swift_release();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return (*v27)(v13, AssociatedTypeWitness);
  }
  else
  {
    uint64_t result = sub_1B8F57A50();
    __break(1u);
    __break(1u);
  }
  return result;
}

uint64_t sub_1B8F47434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v10 = *v7;
  uint64_t v11 = *(void *)(*v7 + 80);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v15 = (char *)&v23 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v23 - v14, (uint64_t)v7 + *(void *)(v10 + 96), v11);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v17 = (v13 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = v11;
  *((void *)v18 + 3) = a4;
  *((void *)v18 + 4) = a5;
  uint64_t v19 = v24;
  *((void *)v18 + 5) = *(void *)(v10 + 88);
  *((void *)v18 + 6) = v19;
  *((void *)v18 + 7) = v25;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v18[v16], v15, v11);
  uint64_t v20 = &v18[v17];
  uint64_t v21 = v27;
  *(void *)uint64_t v20 = v26;
  *((void *)v20 + 1) = v21;
  uint64_t v28 = sub_1B8F47EC8;
  uint64_t v29 = v18;
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  swift_getFunctionTypeMetadata2();
  sub_1B8F576C0();
  swift_retain();
  sub_1B8F576A0();
  return swift_endAccess();
}

uint64_t sub_1B8F47678(uint64_t a1, uint64_t a2, char *a3, void (*a4)(char *, char *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v42 = a3;
  uint64_t v43 = a6;
  uint64_t v38 = a5;
  uint64_t v36 = a4;
  uint64_t v40 = a2;
  uint64_t v13 = sub_1B8F57980();
  uint64_t v37 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13, v14);
  uint64_t v39 = (char *)&v36 - v16;
  uint64_t v41 = *(void *)(a8 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v15, v17);
  uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(a7 - 8);
  MEMORY[0x1F4188790](v18, v22);
  uint64_t v24 = (char *)&v36 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v45;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 16))(a7, a1, a7, a10, v43, a9);
  if (!v25)
  {
    uint64_t v42 = v20;
    uint64_t v43 = a7;
    uint64_t v45 = v24;
    uint64_t v27 = v37;
    uint64_t v28 = v40;
    sub_1B8F12200(v40, (uint64_t)v44);
    uint64_t v29 = v39;
    char v30 = swift_dynamicCast();
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
    if (v30)
    {
      v31(v29, 0, 1, a8);
      uint64_t v33 = v41;
      uint64_t v32 = v42;
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v42, v29, a8);
      uint64_t v34 = v45;
      v36(v45, v32);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v32, a8);
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v34, v43);
    }
    else
    {
      v31(v29, 1, 1, a8);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v13);
      sub_1B8F12200(v28, (uint64_t)v44);
      sub_1B8F47F64();
      swift_allocError();
      sub_1B8F122C0(v44, v35);
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v45, v43);
    }
  }
  return result;
}

uint64_t sub_1B8F479C8()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B8F47A70()
{
  uint64_t v0 = sub_1B8F479C8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1B8F47AC4(uint64_t a1, uint64_t a2)
{
  return sub_1B8F46A40(a1, a2);
}

uint64_t sub_1B8F47AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1B8F46D60(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1B8F47B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F470A4(a1, a2, a3, a4);
}

uint64_t sub_1B8F47B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1B8F47434(a1, a2, a3, a4, a5, a6, a7);
}

void *sub_1B8F47B54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for InternalBroadcastDispatcher();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  swift_allocObject();
  uint64_t v10 = sub_1B8F468E4((uint64_t)v8);
  v3[5] = v9;
  v3[6] = &off_1F12BE240;
  v3[2] = v10;
  return v3;
}

uint64_t sub_1B8F47C54()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BroadcastDispatcher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for BroadcastDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BroadcastDispatcher);
}

uint64_t dispatch thunk of BroadcastDispatcher.__allocating_init<A>(decoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of BroadcastDispatcher.handleBroadcastMessage(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of BroadcastDispatcher.registerHandler<A>(for:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of BroadcastDispatcher.handleBroadcastMessage<A>(_:with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of BroadcastDispatcher.registerHandler<A, B>(for:_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1B8F47D6C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for InternalBroadcastDispatcher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F47E28()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1B8F47EC8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2[2] - 8) + 80);
  uint64_t v4 = (char *)v2 + ((*(void *)(*(void *)(v2[2] - 8) + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1B8F47678(a1, a2, (char *)v2 + v3, *(void (**)(char *, char *))v4, *((void *)v4 + 1), v2[2], v2[3], v2[4], v2[5], v2[6]);
}

unint64_t sub_1B8F47F64()
{
  unint64_t result = qword_1E9EF50E0;
  if (!qword_1E9EF50E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF50E0);
  }
  return result;
}

uint64_t sub_1B8F47FB8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return MEMORY[0x1F4186498](v0, v5 + 16, v4);
}

uint64_t sub_1B8F48058(uint64_t a1)
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80);
  uint64_t v3 = v1 + ((*(void *)(*(void *)(*(void *)(v1 + 16) - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_1B8F46F90(a1, v1 + v2, *(void (**)(char *))v3, *(void *)(v3 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t destroy for InvalidContext(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for InvalidContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for InvalidContext(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

_OWORD *assignWithTake for InvalidContext(_OWORD *a1, _OWORD *a2)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for InvalidContext(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InvalidContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InvalidContext()
{
  return &type metadata for InvalidContext;
}

void static NSBundle.current(dsoHandle:)()
{
  uint64_t v0 = sub_1B8F57120();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v0, v2);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3, v6);
  uint64_t v8 = (char *)&v13 - v7;
  if (dyld_image_path_containing_address())
  {
    sub_1B8F57570();
    sub_1B8F570E0();
    swift_bridgeObjectRelease();
    sub_1B8F57100();
    uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    v9(v5, v0);
    id v10 = objc_allocWithZone(MEMORY[0x1E4F28B50]);
    uint64_t v11 = (void *)sub_1B8F570F0();
    id v12 = objc_msgSend(v10, sel_initWithURL_, v11);

    if (v12)
    {
      v9(v8, v0);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t dispatch thunk of MessageTransport.send(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of AsyncMessageTransport.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_1B8F08F7C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SyncMessageTransport.send(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t NSSecureCodingEnvelope.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, char *))(*(void *)(*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1)
                                                                            + 0x50)
                                                                - 8)
                                                    + 16))(a1, &v1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1) + 0x68)]);
}

id NSSecureCodingEnvelope.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  id v5 = sub_1B8F492C4(a1);
  (*(void (**)(uint64_t))(*(void *)(*((void *)v2 + 10) - 8) + 8))(a1);
  return v5;
}

id NSSecureCodingEnvelope.init(_:)(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *v1;
  id v4 = sub_1B8F492C4(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t sub_1B8F48678()
{
  return 1;
}

uint64_t static NSSecureCodingEnvelope.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_1B8F48688(void *a1, uint64_t a2)
{
  id v21 = a1;
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v4 = *MEMORY[0x1E4FBC8C8] & *(void *)v2;
  uint64_t v5 = *(void *)(v4 + 0x50);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t v9 = type metadata accessor for TypedCodingEnvelope();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  uint64_t v13 = (char *)&v20 - v12;
  sub_1B8F56F70();
  swift_allocObject();
  sub_1B8F56F60();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v2[*(void *)((*v3 & *(void *)v2) + 0x68)], v5);
  TypedCodingEnvelope.init(value:)((uint64_t)v8, v5, (uint64_t)v13);
  uint64_t v22 = *(void *)(v4 + 96);
  swift_getWitnessTable();
  uint64_t v14 = sub_1B8F56F50();
  unint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  swift_release();
  uint64_t v17 = (void *)sub_1B8F57140();
  uint64_t v18 = (void *)sub_1B8F574C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_encodeObject_forKey_, v17, v18);

  return sub_1B8F091D4(v14, v16);
}

void sub_1B8F48964(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_1B8F48688(v4, (uint64_t)v5);
}

id NSSecureCodingEnvelope.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return NSSecureCodingEnvelope.init(coder:)(a1);
}

id NSSecureCodingEnvelope.init(coder:)(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *v1;
  uint64_t v4 = *(void *)(v3 + 0x50);
  uint64_t v5 = type metadata accessor for TypedCodingEnvelope();
  MEMORY[0x1F4188790](v5, v6);
  uint64_t v8 = (char *)&v16 - v7;
  sub_1B8F493A8();
  uint64_t v9 = v1;
  uint64_t v10 = (void *)sub_1B8F57930();
  swift_bridgeObjectRelease();
  if (v10
    && (long long v20 = xmmword_1B8F5B030,
        sub_1B8F57160(),
        v10,
        unint64_t v11 = *((void *)&v20 + 1),
        *((void *)&v20 + 1) >> 60 != 15))
  {
    uint64_t v12 = v20;
    sub_1B8F56F40();
    swift_allocObject();
    sub_1B8F56F30();
    uint64_t v16 = *(void *)(v3 + 88);
    uint64_t v19 = v16;
    swift_getWitnessTable();
    uint64_t v17 = v12;
    sub_1B8F56F20();
    sub_1B8F091C0(v17, v11);
    swift_release();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32))(&v9[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v9) + 0x68)], v8, v4);

    unint64_t v15 = (objc_class *)type metadata accessor for NSSecureCodingEnvelope();
    v18.receiver = v9;
    v18.super_class = v15;
    id v13 = objc_msgSendSuper2(&v18, sel_init);
  }
  else
  {

    type metadata accessor for NSSecureCodingEnvelope();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v13;
}

id sub_1B8F48D24(uint64_t a1, uint64_t a2, void *a3)
{
  return NSSecureCodingEnvelope.init(coder:)(a3);
}

uint64_t sub_1B8F48D4C(uint64_t a1)
{
  type metadata accessor for NSSecureCodingEnvelope();
  id v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF50F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_1B8F1DBD4((uint64_t)v12, (uint64_t *)&unk_1E9EF5100);
LABEL_10:
    char v6 = 0;
    return v6 & 1;
  }
  sub_1B8F2160C(v12, (uint64_t)v14);
  sub_1B8F21884(a1, (uint64_t)v8);
  if (!v8[3])
  {
    sub_1B8F1DBD4((uint64_t)v8, &qword_1EB9C33F0);
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
    goto LABEL_9;
  }
  if (!*((void *)&v10 + 1))
  {
LABEL_9:
    sub_1B8F1DBD4((uint64_t)&v9, (uint64_t *)&unk_1E9EF5100);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    goto LABEL_10;
  }
  sub_1B8F2160C(&v9, (uint64_t)v12);
  uint64_t v4 = v15;
  uint64_t v5 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  char v6 = (*(uint64_t (**)(long long *, uint64_t, uint64_t))(v5 + 8))(v12, v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v6 & 1;
}

uint64_t sub_1B8F48F1C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_1B8F579F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  char v6 = sub_1B8F48D4C((uint64_t)v8);

  sub_1B8F1DBD4((uint64_t)v8, &qword_1EB9C33F0);
  return v6 & 1;
}

id NSSecureCodingEnvelope.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void NSSecureCodingEnvelope.init()()
{
}

void sub_1B8F49024()
{
}

id NSSecureCodingEnvelope.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NSSecureCodingEnvelope();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B8F49104(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)a1) + 0x68)]);
}

uint64_t sub_1B8F4916C(uint64_t a1)
{
  sub_1B8F14F10(a1, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF50F8);
  type metadata accessor for NSSecureCodingEnvelope();
  if (swift_dynamicCast())
  {
    char v1 = sub_1B8F574B0();
  }
  else
  {
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_1B8F49298(uint64_t a1)
{
  return sub_1B8F4916C(a1) & 1;
}

id sub_1B8F492C4(uint64_t a1)
{
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1)
                                                                          + 0x50)
                                                              - 8)
                                                  + 16))(&v1[*(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1) + 0x68)], a1, *(void *)((*MEMORY[0x1E4FBC8C8] & *(void *)v1) + 0x50));
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for NSSecureCodingEnvelope();
  return objc_msgSendSuper2(&v3, sel_init);
}

unint64_t sub_1B8F493A8()
{
  unint64_t result = qword_1E9EF4D70;
  if (!qword_1E9EF4D70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9EF4D70);
  }
  return result;
}

uint64_t type metadata accessor for NSSecureCodingEnvelope()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1B8F49400()
{
}

uint64_t sub_1B8F49430()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for NSSecureCodingEnvelope(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for NSSecureCodingEnvelope);
}

uint64_t dispatch thunk of NSSecureCodingEnvelope.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of NSSecureCodingEnvelope.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of NSSecureCodingEnvelope.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1B8F49538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t MessagingError.NoAvailableHandler.message.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

ValueMetadata *type metadata accessor for MessagingError()
{
  return &type metadata for MessagingError;
}

uint64_t sub_1B8F495B4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_1B8F49710(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1B8F49928);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for MessagingError.NoAvailableHandler()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for MessagingError.HandlerInstanceWasDeallocated()
{
  return &type metadata for MessagingError.HandlerInstanceWasDeallocated;
}

unint64_t sub_1B8F49978(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = 0;
  uint64_t v17 = (id *)(v24 + 16);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 32);
  uint64_t v25 = *(void *)(v2 + 24);
  swift_beginAccess();
  uint64_t v22 = *(void **)(v2 + 40);
  uint64_t v23 = *(void *)(v2 + 48);
  unint64_t v5 = *(unsigned __int8 *)(v2 + 56);
  swift_beginAccess();
  unint64_t v7 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(v2 + 72);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = type metadata accessor for DictionaryEncoderImplementation();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x1E4FBC860];
  *(void *)(v10 + 24) = v8;
  *(void *)(v10 + 32) = v25;
  *(void *)(v10 + 40) = v4;
  *(void *)(v10 + 48) = v22;
  *(void *)(v10 + 56) = v23;
  *(unsigned char *)(v10 + 64) = v5;
  *(void *)(v10 + 72) = v7;
  *(void *)(v10 + 80) = v6;
  *(void *)(v10 + 88) = sub_1B8F49E9C;
  *(void *)(v10 + 96) = v3;
  *(void *)(v10 + 104) = sub_1B8F49EE8;
  *(void *)(v10 + 112) = v3;
  *(void *)(v10 + 120) = sub_1B8F49F98;
  *(void *)(v10 + 128) = v24;
  uint64_t v27 = v9;
  unint64_t v28 = sub_1B8F49FC4();
  v26[0] = v10;
  swift_retain_n();
  sub_1B8F2C368(v25);
  sub_1B8F2C560(v22, v23, v5);
  sub_1B8F2C708(v7);
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v25);
  char v18 = v5;
  sub_1B8F2C560(v22, v23, v5);
  sub_1B8F2C708(v7);
  swift_retain();
  swift_retain();
  sub_1B8F57420();
  if (v19)
  {
    sub_1B8F2C3C8(v25);
    sub_1B8F2C5DC(v22, v23, v5);
    sub_1B8F2C76C(v7);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_release();
  }
  else
  {
    unint64_t v5 = (unint64_t)v22;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_beginAccess();
    if (*v17)
    {
      id v11 = *v17;
      swift_willThrow();
      swift_release();
      sub_1B8F2C3C8(v25);
      sub_1B8F2C5DC(v22, v23, v18);
      sub_1B8F2C76C(v7);
      swift_release();
      swift_release();
      return v5;
    }
    swift_beginAccess();
    sub_1B8F21884(v3 + 16, (uint64_t)v26);
    if (v27)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BE8);
      if (swift_dynamicCast())
      {
        swift_release();
        sub_1B8F2C3C8(v25);
        sub_1B8F2C5DC(v22, v23, v18);
        sub_1B8F2C76C(v7);
        unint64_t v5 = v29;
        swift_release();
        swift_release();
        return v5;
      }
    }
    else
    {
      sub_1B8F0BCE4((uint64_t)v26);
    }
    uint64_t v13 = sub_1B8F57AA0();
    swift_allocError();
    int v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF5278);
    v15[3] = a2;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v15);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_0, a1, a2);
    sub_1B8F57A70();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x1E4FBBAA0], v13);
    swift_willThrow();
    swift_release();
    sub_1B8F2C3C8(v25);
    sub_1B8F2C5DC(v22, v23, v18);
    sub_1B8F2C76C(v7);
    swift_release();
  }
  swift_release();
  return v5;
}

uint64_t sub_1B8F49E64()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B8F49E9C@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_1B8F21884(v1 + 16, a1);
}

uint64_t sub_1B8F49EE8(uint64_t a1)
{
  swift_beginAccess();
  return sub_1B8F4BAB8(a1, v1 + 16);
}

id sub_1B8F49F44(void *a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;

  return a1;
}

id sub_1B8F49F98(void *a1)
{
  return sub_1B8F49F44(a1, v1);
}

uint64_t type metadata accessor for DictionaryEncoderImplementation()
{
  return self;
}

unint64_t sub_1B8F49FC4()
{
  unint64_t result = qword_1E9EF5270;
  if (!qword_1E9EF5270)
  {
    type metadata accessor for DictionaryEncoderImplementation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF5270);
  }
  return result;
}

uint64_t DictionaryEncoder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_1B8F21A80(MEMORY[0x1E4FBC860]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(unsigned char *)(v0 + 56) = 2;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryEncoder.init()()
{
  *(void *)(v0 + 16) = sub_1B8F21A80(MEMORY[0x1E4FBC860]);
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(unsigned char *)(v0 + 56) = 2;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  return v0;
}

uint64_t DictionaryEncoder.deinit()
{
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(*(void *)(v0 + 24));
  sub_1B8F2C5DC(*(void **)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  sub_1B8F2C76C(*(void *)(v0 + 64));
  return v0;
}

uint64_t DictionaryEncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(*(void *)(v0 + 24));
  sub_1B8F2C5DC(*(void **)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));
  sub_1B8F2C76C(*(void *)(v0 + 64));
  return MEMORY[0x1F4186488](v0, 80, 7);
}

uint64_t sub_1B8F4A148@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B8F4A198@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = *(void *)(v3 + 32);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B8F2C368(v4);
}

unint64_t sub_1B8F4A1F0@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  unint64_t v4 = *(void *)(v3 + 64);
  unint64_t v5 = *(void *)(v3 + 72);
  *a2 = v4;
  a2[1] = v5;
  return sub_1B8F2C708(v4);
}

uint64_t type metadata accessor for DictionaryEncoder()
{
  return self;
}

uint64_t method lookup function for DictionaryEncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DictionaryEncoder);
}

uint64_t dispatch thunk of DictionaryEncoder.userInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of DictionaryEncoder.userInfo.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DictionaryEncoder.userInfo.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DictionaryEncoder.keyEncodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DictionaryEncoder.keyEncodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DictionaryEncoder.keyEncodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DictionaryEncoder.dateEncodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DictionaryEncoder.dateEncodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DictionaryEncoder.dateEncodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DictionaryEncoder.dataEncodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of DictionaryEncoder.dataEncodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of DictionaryEncoder.dataEncodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of DictionaryEncoder.encode<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of DictionaryEncoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

ValueMetadata *type metadata accessor for DictionaryEncoder.KeyEncodingStrategy()
{
  return &type metadata for DictionaryEncoder.KeyEncodingStrategy;
}

ValueMetadata *type metadata accessor for DictionaryEncoder.DateEncodingStrategy()
{
  return &type metadata for DictionaryEncoder.DateEncodingStrategy;
}

ValueMetadata *type metadata accessor for DictionaryEncoder.DataEncodingStrategy()
{
  return &type metadata for DictionaryEncoder.DataEncodingStrategy;
}

uint64_t sub_1B8F4A4A8()
{
  uint64_t v1 = v0;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA60]), sel_init);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v19 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  unint64_t v5 = *(void **)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);
  unint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  char v9 = *(unsigned char *)(v0 + 64);
  v23[0] = v3;
  v23[1] = v4;
  void v23[2] = (uint64_t)v5;
  v23[3] = v6;
  char v24 = v9;
  unint64_t v25 = v7;
  uint64_t v26 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  *(void *)(v10 + 24) = v21;
  uint64_t v11 = *(void *)(v1 + 120);
  uint64_t v12 = *(void *)(v1 + 128);
  v33[0] = sub_1B8F4BA58;
  v33[1] = v10;
  v33[2] = sub_1B8F4BA84;
  v33[3] = v1;
  v33[4] = v11;
  v33[5] = v12;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v5, v6, v9);
  sub_1B8F2C708(v7);
  id v22 = v21;
  swift_retain();
  sub_1B8F4A9E4(v19, v2, v23, (uint64_t)v33, (uint64_t)&v27);
  uint64_t v13 = v28;
  unsigned int v14 = v29;
  uint64_t v15 = v30;
  unint64_t v16 = v32;
  LOBYTE(v2) = v31;
  uint64_t v18 = v28;
  long long v20 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v13);
  sub_1B8F2C560(v14, v15, v2);
  sub_1B8F2C708(v16);
  _s18AAAFoundationSwift14KeyedContainerVMa_0();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_getWitnessTable();
  sub_1B8F57CC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v18);
  sub_1B8F2C5DC(v20, v15, v2);
  sub_1B8F2C76C(v16);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F4A768(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  (*(void (**)(void *__return_ptr))(a2 + 88))(v17);
  uint64_t v4 = v17[3];
  sub_1B8F21884((uint64_t)v17, (uint64_t)v16);
  if (v4)
  {
    sub_1B8F21884((uint64_t)v16, (uint64_t)v14);
    if (v15)
    {
      sub_1B8F1ECD8(0, qword_1E9EF5318);
      if (swift_dynamicCast())
      {

        sub_1B8F0BCE4((uint64_t)v16);
        if (v13 == v3) {
          goto LABEL_7;
        }
LABEL_10:
        uint64_t v8 = sub_1B8F57AA0();
        swift_allocError();
        uint64_t v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF5278);
        v10[3] = sub_1B8F1ECD8(0, qword_1E9EF5318);
        *uint64_t v10 = v3;
        v14[0] = 0;
        v14[1] = 0xE000000000000000;
        id v11 = v3;
        swift_bridgeObjectRetain();
        sub_1B8F57A30();
        sub_1B8F57560();
        sub_1B8F21884((uint64_t)v17, (uint64_t)v14);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
        sub_1B8F574F0();
        sub_1B8F57560();
        swift_bridgeObjectRelease();
        sub_1B8F57A70();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x1E4FBBAA0], v8);
        swift_willThrow();
        unint64_t v7 = v17;
        return sub_1B8F0BCE4((uint64_t)v7);
      }
    }
    else
    {
      sub_1B8F0BCE4((uint64_t)v14);
    }
    sub_1B8F0BCE4((uint64_t)v16);
    goto LABEL_10;
  }
  sub_1B8F0BCE4((uint64_t)v16);
LABEL_7:
  unint64_t v5 = *(void (**)(void *))(a2 + 104);
  uint64_t v15 = sub_1B8F1ECD8(0, qword_1E9EF5318);
  v14[0] = v3;
  id v6 = v3;
  v5(v14);
  sub_1B8F0BCE4((uint64_t)v17);
  unint64_t v7 = v14;
  return sub_1B8F0BCE4((uint64_t)v7);
}

uint64_t sub_1B8F4A9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  void (*v7)(void **__return_ptr, uint64_t);
  uint64_t v8;
  void (*v9)(void **);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v24;
  void *v25;

  unint64_t v7 = *(void (**)(void **__return_ptr, uint64_t))a4;
  uint64_t v6 = *(void *)(a4 + 8);
  char v9 = *(void (**)(void **))(a4 + 16);
  uint64_t v8 = *(void *)(a4 + 24);
  uint64_t v10 = *(void *)(a4 + 32);
  id v11 = *(void *)(a4 + 40);
  long long v20 = a3[1];
  id v21 = *a3;
  uint64_t v18 = a3[3];
  uint64_t v19 = a3[2];
  uint64_t v17 = *((unsigned char *)a3 + 32);
  uint64_t v15 = a3[6];
  unint64_t v16 = a3[5];
  swift_retain();
  swift_retain();
  uint64_t v12 = swift_retain();
  v7(&v25, v12);
  uint64_t v13 = v25;
  char v24 = v25;
  v9(&v24);
  swift_release();
  swift_release();

  unint64_t result = swift_release();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = v21;
  *(void *)(a5 + 24) = v20;
  *(void *)(a5 + 32) = v19;
  *(void *)(a5 + 40) = v18;
  *(unsigned char *)(a5 + 48) = v17;
  *(void *)(a5 + 56) = v16;
  *(void *)(a5 + 64) = v15;
  *(void *)(a5 + 72) = v7;
  *(void *)(a5 + 80) = v6;
  *(void *)(a5 + 88) = v9;
  *(void *)(a5 + 96) = v8;
  *(void *)(a5 + 104) = v10;
  *(void *)(a5 + 112) = v11;
  return result;
}

void sub_1B8F4AB28(uint64_t *a1@<X8>)
{
  void (*v22)(void **__return_ptr, uint64_t);
  uint64_t v23;
  uint64_t v24;
  id v26;
  void *v27;
  void *v28[5];

  uint64_t v2 = v1;
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), sel_init);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v19 = *(void *)(v1 + 24);
  uint64_t v20 = *(void *)(v1 + 32);
  unint64_t v7 = *(void **)(v1 + 48);
  uint64_t v6 = *(void *)(v1 + 56);
  char v8 = *(unsigned char *)(v1 + 64);
  uint64_t v9 = *(void *)(v1 + 80);
  unint64_t v21 = *(void *)(v1 + 72);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  *(void *)(v10 + 24) = v3;
  uint64_t v11 = *(void *)(v1 + 120);
  uint64_t v12 = *(void *)(v1 + 128);
  uint64_t v23 = v11;
  id v22 = *(void (**)(void **__return_ptr, uint64_t))(v2 + 88);
  swift_retain_n();
  id v13 = v3;
  swift_retain_n();
  uint64_t v26 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v20);
  sub_1B8F2C560(v7, v6, v8);
  char v24 = v9;
  sub_1B8F2C708(v21);
  uint64_t v14 = v10;
  swift_retain();
  uint64_t v15 = swift_retain();
  v22(v28, v15);
  if (!v28[3])
  {
    sub_1B8F0BCE4((uint64_t)v28);
    goto LABEL_5;
  }
  sub_1B8F1ECD8(0, &qword_1E9EF5310);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    id v16 = v26;
    goto LABEL_6;
  }
  id v16 = v27;
LABEL_6:
  v28[0] = v16;
  sub_1B8F4AEA0(v28, v2);
  swift_release();

  swift_release();
  swift_release_n();

  a1[3] = (uint64_t)&_s18AAAFoundationSwift16UnkeyedContainerVN_0;
  a1[4] = sub_1B8F4B9B8();
  uint64_t v17 = v12;
  uint64_t v18 = swift_allocObject();
  *a1 = v18;

  *(void *)(v18 + 16) = v4;
  *(void *)(v18 + 24) = v19;
  *(void *)(v18 + 32) = v20;
  *(void *)(v18 + 40) = v5;
  *(void *)(v18 + 48) = v7;
  *(void *)(v18 + 56) = v6;
  *(unsigned char *)(v18 + 64) = v8;
  *(void *)(v18 + 72) = v21;
  *(void *)(v18 + 80) = v24;
  *(void *)(v18 + 88) = sub_1B8F4B970;
  *(void *)(v18 + 96) = v14;
  *(void *)(v18 + 104) = sub_1B8F4B99C;
  *(void *)(v18 + 112) = v2;
  *(void *)(v18 + 120) = v23;
  *(void *)(v18 + 128) = v17;
}

id sub_1B8F4ADDC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unint64_t *a3@<X2>, void *a4@<X8>)
{
  (*(void (**)(void *__return_ptr))(a1 + 88))(v9);
  if (v9[3])
  {
    sub_1B8F1ECD8(0, a3);
    id result = (id)swift_dynamicCast();
    if (result)
    {
      *a4 = v8;
      return result;
    }
  }
  else
  {
    sub_1B8F0BCE4((uint64_t)v9);
  }
  *a4 = a2;
  return a2;
}

uint64_t sub_1B8F4AEA0(void **a1, uint64_t a2)
{
  id v3 = *a1;
  (*(void (**)(void *__return_ptr))(a2 + 88))(v17);
  uint64_t v4 = v17[3];
  sub_1B8F21884((uint64_t)v17, (uint64_t)v16);
  if (v4)
  {
    sub_1B8F21884((uint64_t)v16, (uint64_t)v14);
    if (v15)
    {
      sub_1B8F1ECD8(0, &qword_1E9EF5310);
      if (swift_dynamicCast())
      {

        sub_1B8F0BCE4((uint64_t)v16);
        if (v13 == v3) {
          goto LABEL_7;
        }
LABEL_10:
        uint64_t v8 = sub_1B8F57AA0();
        swift_allocError();
        uint64_t v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF5278);
        v10[3] = sub_1B8F1ECD8(0, &qword_1E9EF5310);
        *uint64_t v10 = v3;
        v14[0] = 0;
        v14[1] = 0xE000000000000000;
        id v11 = v3;
        swift_bridgeObjectRetain();
        sub_1B8F57A30();
        sub_1B8F57560();
        sub_1B8F21884((uint64_t)v17, (uint64_t)v14);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
        sub_1B8F574F0();
        sub_1B8F57560();
        swift_bridgeObjectRelease();
        sub_1B8F57A70();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x1E4FBBAA0], v8);
        swift_willThrow();
        unint64_t v7 = v17;
        return sub_1B8F0BCE4((uint64_t)v7);
      }
    }
    else
    {
      sub_1B8F0BCE4((uint64_t)v14);
    }
    sub_1B8F0BCE4((uint64_t)v16);
    goto LABEL_10;
  }
  sub_1B8F0BCE4((uint64_t)v16);
LABEL_7:
  uint64_t v5 = *(void (**)(void *))(a2 + 104);
  uint64_t v15 = sub_1B8F1ECD8(0, &qword_1E9EF5310);
  v14[0] = v3;
  id v6 = v3;
  v5(v14);
  sub_1B8F0BCE4((uint64_t)v17);
  unint64_t v7 = v14;
  return sub_1B8F0BCE4((uint64_t)v7);
}

uint64_t sub_1B8F4B11C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = (void *)v1[6];
  uint64_t v8 = v1[7];
  unint64_t v10 = v2[9];
  uint64_t v15 = v2[15];
  uint64_t v16 = v2[10];
  uint64_t v14 = v2[16];
  a1[3] = (uint64_t)&_s18AAAFoundationSwift20SingleValueContainerVN_0;
  char v11 = *((unsigned char *)v2 + 64);
  a1[4] = sub_1B8F4B8CC();
  uint64_t v12 = swift_allocObject();
  *a1 = v12;
  *(void *)(v12 + 16) = v4;
  *(void *)(v12 + 24) = v5;
  *(void *)(v12 + 32) = v6;
  *(void *)(v12 + 40) = v7;
  *(void *)(v12 + 48) = v9;
  *(void *)(v12 + 56) = v8;
  *(unsigned char *)(v12 + 64) = v11;
  *(void *)(v12 + 72) = v10;
  *(void *)(v12 + 80) = v16;
  *(void *)(v12 + 88) = sub_1B8F4B888;
  *(void *)(v12 + 96) = v2;
  *(void *)(v12 + 104) = sub_1B8F4B8B0;
  *(void *)(v12 + 112) = v2;
  *(void *)(v12 + 120) = v15;
  *(void *)(v12 + 128) = v14;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v6);
  sub_1B8F2C560(v9, v8, v11);
  sub_1B8F2C708(v10);
  return swift_retain();
}

uint64_t sub_1B8F4B258(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void *__return_ptr))(a2 + 88))(v15);
  sub_1B8F21884((uint64_t)v15, (uint64_t)v13);
  if (v14)
  {
    sub_1B8F1ECD8(0, qword_1E9EF4C40);
    if (swift_dynamicCast())
    {
      uint64_t v4 = v12;
      goto LABEL_6;
    }
  }
  else
  {
    sub_1B8F0BCE4((uint64_t)v13);
  }
  uint64_t v4 = 0;
LABEL_6:
  sub_1B8F21884(a1, (uint64_t)v13);
  if (!v14)
  {
    sub_1B8F0BCE4((uint64_t)v13);
LABEL_12:
    uint64_t v5 = 0;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  sub_1B8F1ECD8(0, qword_1E9EF4C40);
  if (!swift_dynamicCast()) {
    goto LABEL_12;
  }
  uint64_t v5 = v12;
  if (!v4)
  {
LABEL_9:
    if (!v5) {
      goto LABEL_19;
    }
    swift_unknownObjectRelease();
LABEL_16:
    BOOL v6 = 0;
    if (v16) {
      goto LABEL_17;
    }
LABEL_19:
    (*(void (**)(uint64_t))(a2 + 104))(a1);
    return sub_1B8F0BCE4((uint64_t)v15);
  }
LABEL_13:
  swift_unknownObjectRelease();
  if (!v5) {
    goto LABEL_16;
  }
  swift_unknownObjectRelease();
  BOOL v6 = v4 == v5;
  if (!v16) {
    goto LABEL_19;
  }
LABEL_17:
  if (v6) {
    goto LABEL_19;
  }
  uint64_t v7 = sub_1B8F57AA0();
  swift_allocError();
  uint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF5278);
  uint64_t v9[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  uint64_t v10 = swift_allocObject();
  *uint64_t v9 = v10;
  sub_1B8F21884(a1, v10 + 16);
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_1B8F57A30();
  sub_1B8F57560();
  sub_1B8F21884((uint64_t)v15, (uint64_t)v13);
  sub_1B8F574F0();
  sub_1B8F57560();
  swift_bridgeObjectRelease();
  sub_1B8F57A70();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x1E4FBBAA0], v7);
  swift_willThrow();
  return sub_1B8F0BCE4((uint64_t)v15);
}

uint64_t sub_1B8F4B524()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  unint64_t v3 = *(void *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 64);
  sub_1B8F2C3C8(*(void *)(v0 + 32));
  sub_1B8F2C5DC(v1, v2, v4);
  sub_1B8F2C76C(v3);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186488](v0, 136, 7);
}

uint64_t sub_1B8F4B5CC()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F4B610(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1B8F4B67C(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *sub_1B8F4B708(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_1B8F4B760(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1B8F4B7A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for Binding()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for DictionaryEncoder.Descriptor()
{
  return &type metadata for DictionaryEncoder.Descriptor;
}

uint64_t sub_1B8F4B81C()
{
  return sub_1B8F4A4A8();
}

void sub_1B8F4B840(uint64_t *a1@<X8>)
{
}

uint64_t sub_1B8F4B864@<X0>(uint64_t *a1@<X8>)
{
  return sub_1B8F4B11C(a1);
}

uint64_t sub_1B8F4B888()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1B8F4B8B0(uint64_t a1)
{
  return sub_1B8F4B258(a1, v1);
}

unint64_t sub_1B8F4B8CC()
{
  unint64_t result = qword_1E9EF5300;
  if (!qword_1E9EF5300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF5300);
  }
  return result;
}

uint64_t sub_1B8F4B920()
{
  return objectdestroy_22Tm(136);
}

uint64_t objectdestroyTm_0()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  return MEMORY[0x1F4186498](v0, 48, 7);
}

id sub_1B8F4B970@<X0>(void *a1@<X8>)
{
  return sub_1B8F4ADDC(*(void *)(v1 + 16), *(void **)(v1 + 24), &qword_1E9EF5310, a1);
}

uint64_t sub_1B8F4B99C(void **a1)
{
  return sub_1B8F4AEA0(a1, v1);
}

unint64_t sub_1B8F4B9B8()
{
  unint64_t result = qword_1E9EF5308;
  if (!qword_1E9EF5308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9EF5308);
  }
  return result;
}

uint64_t sub_1B8F4BA0C()
{
  return objectdestroy_22Tm(136);
}

uint64_t objectdestroy_28Tm()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1B8F4BA58@<X0>(void *a1@<X8>)
{
  return sub_1B8F4ADDC(*(void *)(v1 + 16), *(void **)(v1 + 24), qword_1E9EF5318, a1);
}

uint64_t sub_1B8F4BA84(void **a1)
{
  return sub_1B8F4A768(a1, v1);
}

uint64_t _s18AAAFoundationSwift14KeyedContainerVMa_0()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1B8F4BAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

ValueMetadata *_s18AAAFoundationSwift16UnkeyedContainerVMa_0()
{
  return &_s18AAAFoundationSwift16UnkeyedContainerVN_0;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwxx_0_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(a1 + 32), *(void *)(a1 + 40), *(unsigned char *)(a1 + 48));
  if (*(void *)(a1 + 56) >= 2uLL) {
    swift_release();
  }
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwcp_0_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  long long v6 = (_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  uint64_t v8 = *(void **)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v8, v9, v10);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  unint64_t v11 = *(void *)(a2 + 56);
  if (v11 >= 2)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 112);
  long long v14 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v14;
  *(void *)(a1 + 112) = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwca_0_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(unsigned char *)(a2 + 48);
  sub_1B8F2C560(v7, v8, v9);
  char v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v12 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v9;
  sub_1B8F2C5DC(v10, v11, v12);
  unint64_t v13 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >= 2uLL)
  {
    if (v13 >= 2)
    {
      uint64_t v15 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      *(void *)(a1 + 64) = v15;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v13 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v14 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v14;
  swift_retain();
LABEL_15:
  uint64_t v16 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v16;
  swift_retain();
  swift_release();
  uint64_t v17 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v18;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwta_0_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(a1 + 16))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  char v7 = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  *(unsigned char *)(a1 + 48) = v7;
  sub_1B8F2C5DC(v8, v9, v10);
  unint64_t v11 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56) >= 2uLL)
  {
    if (v11 >= 2)
    {
      uint64_t v13 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v11;
      *(void *)(a1 + 64) = v13;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    goto LABEL_13;
  }
  if (v11 < 2)
  {
LABEL_13:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  uint64_t v12 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
LABEL_15:
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_release();
  return a1;
}

uint64_t _s18AAAFoundationSwift16UnkeyedContainerVwet_0_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1B8F4C010(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s18AAAFoundationSwift20SingleValueContainerVMa_0()
{
  return &_s18AAAFoundationSwift20SingleValueContainerVN_0;
}

void (*sub_1B8F4C07C(uint64_t a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](a1, a1);
  long long v7 = v2[5];
  long long v21 = v2[4];
  long long v22 = v7;
  long long v23 = v2[6];
  uint64_t v24 = *((void *)v2 + 14);
  long long v8 = v2[1];
  long long v17 = *v2;
  long long v18 = v8;
  long long v9 = v2[3];
  long long v19 = v2[2];
  long long v20 = v9;
  (*(void (**)(char *))(v5 + 16))((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = *(void *)(a2 + 24);
  *(void *)(v11 + 16) = v4;
  *(void *)(v11 + 24) = v12;
  long long v13 = v22;
  *(_OWORD *)(v11 + 96) = v21;
  *(_OWORD *)(v11 + 112) = v13;
  *(_OWORD *)(v11 + 128) = v23;
  *(void *)(v11 + 144) = v24;
  long long v14 = v18;
  *(_OWORD *)(v11 + 32) = v17;
  *(_OWORD *)(v11 + 48) = v14;
  long long v15 = v20;
  *(_OWORD *)(v11 + 64) = v19;
  *(_OWORD *)(v11 + 80) = v15;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_1B8F5494C((uint64_t)&v17);
  return sub_1B8F548F4;
}

void sub_1B8F4C204(uint64_t a1, long long *a2, uint64_t a3)
{
  void (*v6)(long long *__return_ptr);
  void (*v7)(long long *);
  void *v8;
  long long v9;
  long long v10;
  long long v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void v22[2];
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  uint64_t v30;
  uint64_t v31;

  uint64_t v6 = (void (*)(long long *__return_ptr))*((void *)a2 + 9);
  long long v7 = (void (*)(long long *))*((void *)a2 + 11);
  char v31 = *((void *)a2 + 12);
  v6(&v23);
  long long v8 = (void *)v23;
  long long v9 = a2[5];
  uint64_t v27 = a2[4];
  uint64_t v28 = v9;
  unint64_t v29 = a2[6];
  uint64_t v30 = *((void *)a2 + 14);
  unint64_t v10 = a2[1];
  long long v23 = *a2;
  uint64_t v24 = v10;
  uint64_t v11 = a2[3];
  unint64_t v25 = a2[2];
  uint64_t v26 = v11;
  uint64_t v12 = _s18AAAFoundationSwift14KeyedContainerVMa_0();
  long long v13 = sub_1B8F2E3FC(a3, v12);
  long long v15 = v14;
  sub_1B8F21884(a1, (uint64_t)&v23);
  uint64_t v16 = *((void *)&v24 + 1);
  if (*((void *)&v24 + 1))
  {
    long long v17 = __swift_project_boxed_opaque_existential_1(&v23, *((uint64_t *)&v24 + 1));
    v22[1] = v22;
    long long v18 = *(void *)(v16 - 8);
    MEMORY[0x1F4188790](v17, v17);
    long long v20 = (char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    long long v21 = sub_1B8F57ED0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  }
  else
  {
    long long v21 = 0;
  }
  *(void *)&long long v23 = v13;
  *((void *)&v23 + 1) = v15;
  swift_bridgeObjectRetain();
  objc_msgSend(v8, sel___swift_setObject_forKeyedSubscript_, v21, sub_1B8F580F0());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  *(void *)&long long v23 = v8;
  v7(&v23);
}

uint64_t sub_1B8F4C444(uint64_t a1, uint64_t a2)
{
  char v3 = *((unsigned char *)v2 + 48);
  long long v4 = v2[1];
  long long v7 = *v2;
  long long v8 = v4;
  long long v9 = v2[2];
  char v10 = v3;
  long long v11 = *(long long *)((char *)v2 + 56);
  long long v12 = *(long long *)((char *)v2 + 72);
  long long v13 = *(long long *)((char *)v2 + 88);
  long long v14 = *(long long *)((char *)v2 + 104);
  uint64_t v5 = sub_1B8F4C07C(a1, a2);
  long long v7 = 0u;
  long long v8 = 0u;
  v5((uint64_t)&v7);
  sub_1B8F0BCE4((uint64_t)&v7);
  return swift_release();
}

uint64_t sub_1B8F4C4E4(char a1, uint64_t a2, uint64_t a3)
{
  char v5 = *((unsigned char *)v3 + 48);
  long long v6 = v3[1];
  long long v9 = *v3;
  long long v10 = v6;
  long long v11 = v3[2];
  char v12 = v5;
  long long v13 = *(long long *)((char *)v3 + 56);
  long long v14 = *(long long *)((char *)v3 + 72);
  long long v15 = *(long long *)((char *)v3 + 88);
  long long v16 = *(long long *)((char *)v3 + 104);
  long long v7 = sub_1B8F4C07C(a2, a3);
  *((void *)&v10 + 1) = MEMORY[0x1E4FBB390];
  LOBYTE(v9) = a1;
  v7((uint64_t)&v9);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v9);
}

uint64_t sub_1B8F4C5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)v4 + 48);
  long long v8 = v4[1];
  long long v11 = *v4;
  long long v12 = v8;
  long long v13 = v4[2];
  char v14 = v7;
  long long v15 = *(long long *)((char *)v4 + 56);
  long long v16 = *(long long *)((char *)v4 + 72);
  long long v17 = *(long long *)((char *)v4 + 88);
  long long v18 = *(long long *)((char *)v4 + 104);
  long long v9 = sub_1B8F4C07C(a3, a4);
  *((void *)&v12 + 1) = MEMORY[0x1E4FBB1A0];
  *(void *)&long long v11 = a1;
  *((void *)&v11 + 1) = a2;
  swift_bridgeObjectRetain();
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v11);
}

uint64_t sub_1B8F4C670(uint64_t a1, uint64_t a2, double a3)
{
  char v5 = *((unsigned char *)v3 + 48);
  long long v6 = v3[1];
  long long v9 = *v3;
  long long v10 = v6;
  long long v11 = v3[2];
  char v12 = v5;
  long long v13 = *(long long *)((char *)v3 + 56);
  long long v14 = *(long long *)((char *)v3 + 72);
  long long v15 = *(long long *)((char *)v3 + 88);
  long long v16 = *(long long *)((char *)v3 + 104);
  char v7 = sub_1B8F4C07C(a1, a2);
  *((void *)&v10 + 1) = MEMORY[0x1E4FBB3D0];
  *(double *)&long long v9 = a3;
  v7((uint64_t)&v9);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v9);
}

uint64_t sub_1B8F4C724(uint64_t a1, uint64_t a2, float a3)
{
  char v5 = *((unsigned char *)v3 + 48);
  long long v6 = v3[1];
  long long v9 = *v3;
  long long v10 = v6;
  long long v11 = v3[2];
  char v12 = v5;
  long long v13 = *(long long *)((char *)v3 + 56);
  long long v14 = *(long long *)((char *)v3 + 72);
  long long v15 = *(long long *)((char *)v3 + 88);
  long long v16 = *(long long *)((char *)v3 + 104);
  char v7 = sub_1B8F4C07C(a1, a2);
  *((void *)&v10 + 1) = MEMORY[0x1E4FBB470];
  *(float *)&long long v9 = a3;
  v7((uint64_t)&v9);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v9);
}

uint64_t sub_1B8F4C7D8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)v4 + 48);
  long long v8 = v4[1];
  long long v11 = *v4;
  long long v12 = v8;
  long long v13 = v4[2];
  char v14 = v7;
  long long v15 = *(long long *)((char *)v4 + 56);
  long long v16 = *(long long *)((char *)v4 + 72);
  long long v17 = *(long long *)((char *)v4 + 88);
  long long v18 = *(long long *)((char *)v4 + 104);
  long long v9 = sub_1B8F4C07C(a2, a3);
  *((void *)&v12 + 1) = a4;
  LOBYTE(v11) = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v11);
}

uint64_t sub_1B8F4C890(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)v4 + 48);
  long long v8 = v4[1];
  long long v11 = *v4;
  long long v12 = v8;
  long long v13 = v4[2];
  char v14 = v7;
  long long v15 = *(long long *)((char *)v4 + 56);
  long long v16 = *(long long *)((char *)v4 + 72);
  long long v17 = *(long long *)((char *)v4 + 88);
  long long v18 = *(long long *)((char *)v4 + 104);
  long long v9 = sub_1B8F4C07C(a2, a3);
  *((void *)&v12 + 1) = a4;
  LOWORD(v11) = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v11);
}

uint64_t sub_1B8F4C948(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)v4 + 48);
  long long v8 = v4[1];
  long long v11 = *v4;
  long long v12 = v8;
  long long v13 = v4[2];
  char v14 = v7;
  long long v15 = *(long long *)((char *)v4 + 56);
  long long v16 = *(long long *)((char *)v4 + 72);
  long long v17 = *(long long *)((char *)v4 + 88);
  long long v18 = *(long long *)((char *)v4 + 104);
  long long v9 = sub_1B8F4C07C(a2, a3);
  *((void *)&v12 + 1) = a4;
  LODWORD(v11) = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v11);
}

uint64_t sub_1B8F4CA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)v4 + 48);
  long long v8 = v4[1];
  long long v11 = *v4;
  long long v12 = v8;
  long long v13 = v4[2];
  char v14 = v7;
  long long v15 = *(long long *)((char *)v4 + 56);
  long long v16 = *(long long *)((char *)v4 + 72);
  long long v17 = *(long long *)((char *)v4 + 88);
  long long v18 = *(long long *)((char *)v4 + 104);
  long long v9 = sub_1B8F4C07C(a2, a3);
  *((void *)&v12 + 1) = a4;
  *(void *)&long long v11 = a1;
  v9((uint64_t)&v11);
  swift_release();
  return sub_1B8F0BCE4((uint64_t)&v11);
}

uint64_t sub_1B8F4CAB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *))
{
  uint64_t v29 = *(void *)(v5 + 16);
  uint64_t v30 = *(void **)(v5 + 32);
  unint64_t v25 = *(void *)(v5 + 56);
  uint64_t v24 = *(void *)(v5 + 40);
  uint64_t v7 = *(void *)(v5 + 72);
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v9 = *(void *)(v5 + 88);
  uint64_t v8 = *(void *)(v5 + 96);
  uint64_t v10 = *(void *)(v5 + 112);
  uint64_t v20 = *(void *)(v5 + 104);
  char v23 = *(unsigned char *)(v5 + 48);
  uint64_t v11 = sub_1B8F2E3FC(a2, a3);
  uint64_t v13 = v12;
  char v14 = (void *)swift_allocObject();
  v14[2] = v7;
  void v14[3] = v6;
  v14[4] = v9;
  v14[5] = v8;
  v14[6] = v20;
  v14[7] = v10;
  v14[8] = v11;
  v14[9] = v13;
  long long v15 = sub_1B8F4C07C(a2, a3);
  uint64_t v17 = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  *(void *)(v18 + 24) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v29);
  sub_1B8F2C560(v30, v24, v23);
  sub_1B8F2C708(v25);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1B8F4CD40(a1, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v29);
  sub_1B8F2C5DC(v30, v24, v23);
  sub_1B8F2C76C(v25);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F4CD40(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  long long v4 = v3;
  uint64_t v76 = a3;
  uint64_t v7 = sub_1B8F57200();
  uint64_t v78 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7, v8);
  uint64_t v11 = (char *)v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9, v12);
  char v14 = (char *)v67 - v13;
  uint64_t v15 = sub_1B8F57120();
  uint64_t v81 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15, v16);
  v80 = (char *)v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v17, v19);
  long long v22 = (char *)v67 - v21;
  MEMORY[0x1F4188790](v20, v23);
  unint64_t v25 = (char *)v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = v26;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  uint64_t v75 = a1;
  v27(v25, a1, a2);
  if (swift_dynamicCast())
  {
    uint64_t v77 = v25;
    uint64_t v78 = a2;
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v81 + 32);
    uint64_t v69 = v15;
    v28(v80, v22, v15);
    uint64_t v29 = sub_1B8F570D0();
    uint64_t v31 = v30;
    uint64_t v32 = *v4;
    uint64_t v33 = v4[1];
    uint64_t v34 = v4[2];
    uint64_t v35 = v4[3];
    uint64_t v36 = (void *)v4[4];
    uint64_t v74 = v4[5];
    char v37 = *((unsigned char *)v4 + 48);
    unint64_t v38 = v4[7];
    uint64_t v75 = v4[8];
    uint64_t v39 = v4[10];
    uint64_t v76 = (void (*)(uint64_t *))v4[11];
    uint64_t v84 = MEMORY[0x1E4FBB1A0];
    uint64_t v82 = v29;
    uint64_t v83 = v30;
    v67[1] = v32;
    swift_bridgeObjectRetain();
    v67[0] = v33;
    swift_bridgeObjectRetain();
    uint64_t v68 = v34;
    v67[2] = v35;
    sub_1B8F2C368(v34);
    long long v70 = v36;
    uint64_t v40 = v36;
    uint64_t v41 = v74;
    sub_1B8F2C560(v40, v74, v37);
    unint64_t v71 = v38;
    sub_1B8F2C708(v38);
    uint64_t v72 = v39;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v73 = v31;
    swift_bridgeObjectRetain();
    v76(&v82);
    sub_1B8F0BCE4((uint64_t)&v82);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B8F2C3C8(v68);
    sub_1B8F2C5DC(v70, v41, v37);
    sub_1B8F2C76C(v71);
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v80, v69);
    swift_bridgeObjectRelease();
    a2 = v78;
    uint64_t v42 = v79;
    unint64_t v25 = v77;
  }
  else
  {
    if (swift_dynamicCast())
    {
      uint64_t v43 = v82;
      unint64_t v44 = v83;
      sub_1B8F525EC(v82, v83);
      sub_1B8F091D4(v43, v44);
    }
    else if (swift_dynamicCast())
    {
      uint64_t v45 = v78;
      (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v11, v14, v7);
      sub_1B8F52CF4((uint64_t)v11);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v7);
    }
    else
    {
      long long v46 = *((_OWORD *)v4 + 5);
      long long v90 = *((_OWORD *)v4 + 4);
      long long v91 = v46;
      long long v92 = *((_OWORD *)v4 + 6);
      uint64_t v93 = v4[14];
      long long v47 = *((_OWORD *)v4 + 1);
      unsigned long long v86 = *(_OWORD *)v4;
      long long v87 = v47;
      long long v48 = *((_OWORD *)v4 + 3);
      long long v88 = *((_OWORD *)v4 + 2);
      long long v89 = v48;
      uint64_t v78 = a2;
      unint64_t v49 = *((void *)&v86 + 1);
      unsigned long long v51 = v86;
      uint64_t v96 = v51 >> 64;
      unint64_t v50 = v51;
      uint64_t v97 = v86;
      uint64_t v95 = v90;
      v94[1] = v88;
      v94[2] = v48;
      v94[0] = v87;
      uint64_t v52 = swift_allocObject();
      long long v53 = *((_OWORD *)v4 + 5);
      *(_OWORD *)(v52 + 80) = *((_OWORD *)v4 + 4);
      *(_OWORD *)(v52 + 96) = v53;
      *(_OWORD *)(v52 + 112) = *((_OWORD *)v4 + 6);
      *(void *)(v52 + 128) = v4[14];
      long long v54 = *((_OWORD *)v4 + 1);
      *(_OWORD *)(v52 + 16) = *(_OWORD *)v4;
      *(_OWORD *)(v52 + 32) = v54;
      long long v55 = *((_OWORD *)v4 + 3);
      *(_OWORD *)(v52 + 48) = *((_OWORD *)v4 + 2);
      *(_OWORD *)(v52 + 64) = v55;
      uint64_t v56 = swift_allocObject();
      uint64_t v77 = v25;
      uint64_t v57 = v56;
      long long v58 = *((_OWORD *)v4 + 5);
      *(_OWORD *)(v56 + 80) = *((_OWORD *)v4 + 4);
      *(_OWORD *)(v56 + 96) = v58;
      *(_OWORD *)(v56 + 112) = *((_OWORD *)v4 + 6);
      *(void *)(v56 + 128) = v4[14];
      long long v59 = *((_OWORD *)v4 + 1);
      *(_OWORD *)(v56 + 16) = *(_OWORD *)v4;
      *(_OWORD *)(v56 + 32) = v59;
      long long v60 = *((_OWORD *)v4 + 3);
      *(_OWORD *)(v56 + 48) = *((_OWORD *)v4 + 2);
      *(_OWORD *)(v56 + 64) = v60;
      uint64_t v62 = *((void *)&v92 + 1);
      uint64_t v61 = v93;
      uint64_t v63 = type metadata accessor for DictionaryEncoderImplementation();
      uint64_t v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = __PAIR128__(v49, v50);
      a2 = v78;
      long long v65 = v88;
      *(_OWORD *)(v64 + 32) = v87;
      *(_OWORD *)(v64 + 48) = v65;
      *(_OWORD *)(v64 + 64) = v89;
      *(void *)(v64 + 80) = v90;
      *(void *)(v64 + 88) = sub_1B8F4B888;
      *(void *)(v64 + 96) = v52;
      *(void *)(v64 + 104) = sub_1B8F541C0;
      *(void *)(v64 + 112) = v57;
      *(void *)(v64 + 120) = v62;
      unint64_t v25 = v77;
      *(void *)(v64 + 128) = v61;
      uint64_t v84 = v63;
      unint64_t v85 = sub_1B8F49FC4();
      uint64_t v82 = v64;
      sub_1B8F5494C((uint64_t)&v86);
      sub_1B8F5494C((uint64_t)&v86);
      sub_1B8F541DC((uint64_t)&v97);
      sub_1B8F541DC((uint64_t)&v96);
      sub_1B8F54208((uint64_t)v94);
      swift_retain();
      sub_1B8F57420();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v82);
    }
    uint64_t v42 = v79;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v25, a2);
}

uint64_t sub_1B8F4D4BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = *(void *)(v3 + 8);
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v30 = *(void *)(v3 + 24);
  uint64_t v9 = *(void *)(v3 + 40);
  unint64_t v10 = *(void *)(v3 + 56);
  uint64_t v40 = *(void **)(v3 + 32);
  uint64_t v42 = *(void *)(v3 + 64);
  uint64_t v44 = *(void *)(v3 + 80);
  uint64_t v34 = *(void *)(v3 + 88);
  uint64_t v35 = *(void *)(v3 + 72);
  long long v33 = *(_OWORD *)(v3 + 96);
  uint64_t v38 = *(void *)(v3 + 112);
  char v11 = *(unsigned char *)(v3 + 48);
  char v39 = v11;
  v51[0] = *(void *)v3;
  uint64_t v7 = v51[0];
  v51[1] = v37;
  uint64_t v52 = v8;
  uint64_t v53 = v30;
  long long v54 = v40;
  uint64_t v55 = v9;
  char v56 = v11;
  unint64_t v57 = v10;
  uint64_t v58 = v42;
  unint64_t v12 = v10;
  unint64_t v29 = v10;
  uint64_t v59 = v35;
  uint64_t v60 = v44;
  uint64_t v61 = v34;
  long long v62 = v33;
  uint64_t v63 = v38;
  uint64_t v31 = sub_1B8F2E3FC(a2, a3);
  uint64_t v32 = v13;
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA60]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F59040;
  uint64_t v15 = *(void *)(a3 + 16);
  *(void *)(inited + 56) = v15;
  *(void *)(inited + 64) = *(void *)(a3 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(boxed_opaque_existential_0, a2, v15);
  v51[0] = v7;
  swift_bridgeObjectRetain();
  sub_1B8F544BC(inited);
  uint64_t v36 = v7;
  v47[0] = v8;
  v47[1] = v30;
  v47[2] = (uint64_t)v40;
  v47[3] = v9;
  char v48 = v39;
  unint64_t v49 = v12;
  uint64_t v50 = v42;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v35;
  *(void *)(v17 + 24) = v44;
  *(void *)(v17 + 32) = v34;
  *(_OWORD *)(v17 + 40) = v33;
  *(void *)(v17 + 56) = v38;
  *(void *)(v17 + 64) = v31;
  *(void *)(v17 + 72) = v32;
  *(void *)(v17 + 80) = v28;
  uint64_t v18 = *(void *)(v4 + 72);
  uint64_t v19 = *(void *)(v4 + 96);
  uint64_t v20 = *(void *)(v4 + 104);
  uint64_t v21 = *(void *)(v4 + 112);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v18;
  *(_OWORD *)(v22 + 24) = *(_OWORD *)(v4 + 80);
  *(void *)(v22 + 40) = v19;
  *(void *)(v22 + 48) = v20;
  *(void *)(v22 + 56) = v21;
  *(void *)(v22 + 64) = v31;
  *(void *)(v22 + 72) = v32;
  v46[0] = sub_1B8F546EC;
  v46[1] = v17;
  v46[2] = sub_1B8F54A24;
  v46[3] = v22;
  v46[4] = v20;
  v46[5] = v21;
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v8);
  sub_1B8F2C560(v40, v9, v39);
  sub_1B8F2C708(v29);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v45 = v28;
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_1B8F4A9E4(v36, v37, v47, (uint64_t)v46, (uint64_t)v51);
  uint64_t v23 = v52;
  uint64_t v24 = v54;
  uint64_t v25 = v55;
  unint64_t v26 = v57;
  LOBYTE(v4) = v56;
  uint64_t v41 = v52;
  uint64_t v43 = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v23);
  sub_1B8F2C560(v24, v25, v4);
  sub_1B8F2C708(v26);
  _s18AAAFoundationSwift14KeyedContainerVMa_0();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_getWitnessTable();
  sub_1B8F57CC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v41);
  sub_1B8F2C5DC(v43, v25, v4);
  sub_1B8F2C76C(v26);
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1B8F4D940(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  void (*v23)(void **__return_ptr, id);
  void (*v24)(void **);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void (*v36)(void **);
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  long long v51;
  long long v52;
  long long v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  uint64_t v4 = (void *)v3;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)v3;
  char v48 = *(void *)(v3 + 16);
  unint64_t v49 = *(void *)(v3 + 8);
  long long v46 = *(void **)(v3 + 32);
  long long v47 = *(void *)(v3 + 24);
  id v45 = *(void *)(v3 + 40);
  char v8 = *(unsigned char *)(v3 + 48);
  uint64_t v44 = v8;
  uint64_t v42 = *(void *)(v3 + 64);
  uint64_t v43 = *(void *)(v3 + 56);
  uint64_t v9 = *(void *)(v3 + 80);
  uint64_t v11 = *(void *)(v3 + 88);
  uint64_t v10 = *(void *)(v3 + 96);
  uint64_t v13 = *(void *)(v3 + 104);
  uint64_t v12 = *(void *)(v3 + 112);
  *(void *)&unsigned long long v51 = *(void *)(v3 + 72);
  *((void *)&v51 + 1) = v9;
  *(void *)&uint64_t v52 = v11;
  *((void *)&v52 + 1) = v10;
  *(void *)&uint64_t v53 = v13;
  *((void *)&v53 + 1) = v12;
  long long v54 = v7;
  uint64_t v55 = v49;
  char v56 = v48;
  unint64_t v57 = v47;
  uint64_t v58 = v46;
  uint64_t v59 = v45;
  uint64_t v60 = v8;
  uint64_t v61 = v43;
  long long v62 = v42;
  uint64_t v63 = v51;
  uint64_t v64 = v9;
  long long v65 = v11;
  unint64_t v66 = v10;
  uint64_t v67 = v13;
  uint64_t v68 = v12;
  uint64_t v14 = sub_1B8F2E3FC(a1, a2);
  uint64_t v16 = v15;
  char v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9EF3BF0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B8F59040;
  uint64_t v18 = *(void *)(a2 + 16);
  *(void *)(inited + 56) = v18;
  *(void *)(inited + 64) = *(void *)(a2 + 24);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(boxed_opaque_existential_0, a1, v18);
  long long v54 = v7;
  swift_bridgeObjectRetain();
  sub_1B8F544BC(inited);
  uint64_t v40 = v7;
  uint64_t v20 = swift_allocObject();
  long long v21 = v52;
  *(_OWORD *)(v20 + 16) = v51;
  *(_OWORD *)(v20 + 32) = v21;
  *(_OWORD *)(v20 + 48) = v53;
  *(void *)(v20 + 64) = v14;
  *(void *)(v20 + 72) = v16;
  *(void *)(v20 + 80) = v39;
  uint64_t v23 = (void (*)(void **__return_ptr, id))v4[9];
  uint64_t v22 = v4[10];
  uint64_t v24 = (void (*)(void **))v4[11];
  uint64_t v25 = v4[12];
  uint64_t v36 = v24;
  unint64_t v26 = v4[13];
  uint64_t v27 = v4[14];
  id v28 = (void *)swift_allocObject();
  void v28[2] = v23;
  v28[3] = v22;
  v28[4] = v24;
  v28[5] = v25;
  uint64_t v38 = v26;
  v28[6] = v26;
  v28[7] = v27;
  unint64_t v29 = v27;
  v28[8] = v14;
  v28[9] = v16;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = v39;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  uint64_t v31 = v30;
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v48);
  sub_1B8F2C560(v46, v45, v44);
  sub_1B8F2C708(v43);
  swift_retain();
  swift_retain();
  uint64_t v37 = v31;
  uint64_t v32 = sub_1B8F4DE08((void (**)(void **__return_ptr))&v51, v14, v16, v31, &qword_1E9EF5310, &v50);
  long long v33 = v50;
  v23(&v54, v32);
  uint64_t v34 = v54;
  long long v54 = (void *)v14;
  uint64_t v55 = v16;
  swift_bridgeObjectRetain_n();
  objc_msgSend(v34, sel___swift_setObject_forKeyedSubscript_, v33, sub_1B8F580F0());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  long long v54 = v34;
  v36(&v54);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release_n();
  swift_release();
  swift_release();
  swift_release();

  a3[3] = (uint64_t)&_s18AAAFoundationSwift16UnkeyedContainerVN_0;
  a3[4] = sub_1B8F4B9B8();
  uint64_t v35 = swift_allocObject();
  *a3 = v35;

  *(void *)(v35 + 16) = v40;
  *(void *)(v35 + 24) = v49;
  *(void *)(v35 + 32) = v48;
  *(void *)(v35 + 40) = v47;
  *(void *)(v35 + 48) = v46;
  *(void *)(v35 + 56) = v45;
  *(unsigned char *)(v35 + 64) = v44;
  *(void *)(v35 + 72) = v43;
  *(void *)(v35 + 80) = v42;
  *(void *)(v35 + 88) = sub_1B8F54638;
  *(void *)(v35 + 96) = v20;
  *(void *)(v35 + 104) = sub_1B8F54670;
  *(void *)(v35 + 112) = v28;
  *(void *)(v35 + 120) = v38;
  *(void *)(v35 + 128) = v29;
}

id sub_1B8F4DE08@<X0>(void (**a1)(void **__return_ptr)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, unint64_t *a5@<X4>, void *a6@<X8>)
{
  (*a1)(&v16);
  uint64_t v10 = v16;
  *(void *)&v15[0] = a2;
  *((void *)&v15[0] + 1) = a3;
  swift_bridgeObjectRetain_n();
  id v11 = objc_msgSend(v10, sel___swift_objectForKeyedSubscript_, sub_1B8F580F0());
  swift_unknownObjectRelease();

  if (v11)
  {
    sub_1B8F579F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_1B8F37BAC((uint64_t)v15, (uint64_t)v17);
  if (v18)
  {
    sub_1B8F1ECD8(0, a5);
    if (swift_dynamicCast())
    {
      id result = (id)swift_bridgeObjectRelease();
      *a6 = v14;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1B8F0BCE4((uint64_t)v17);
  }
  *a6 = a4;
  return a4;
}

void sub_1B8F4DF8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a1;
  (*(void (**)(void *__return_ptr))a2)(v10);
  char v8 = (void *)v10[0];
  v10[0] = a3;
  v10[1] = a4;
  swift_bridgeObjectRetain_n();
  objc_msgSend(v8, sel___swift_setObject_forKeyedSubscript_, v7, sub_1B8F580F0());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v9 = *(void (**)(void *))(a2 + 16);
  v10[0] = v8;
  v9(v10);
}

uint64_t sub_1B8F4E060@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v14 = v1[1];
  uint64_t v15 = v1[2];
  uint64_t v20 = v1[3];
  uint64_t v21 = *v1;
  uint64_t v16 = v1[5];
  uint64_t v17 = (void *)v1[4];
  unint64_t v22 = v1[7];
  uint64_t v2 = v1[9];
  uint64_t v18 = v1[8];
  uint64_t v3 = v1[10];
  uint64_t v4 = v1[11];
  uint64_t v6 = v1[12];
  uint64_t v5 = v1[13];
  uint64_t v7 = v1[14];
  char v13 = *((unsigned char *)v1 + 48);
  char v8 = (void *)swift_allocObject();
  _OWORD v8[2] = v2;
  v8[3] = v3;
  void v8[4] = v4;
  v8[5] = v6;
  v8[6] = v5;
  v8[7] = v7;
  v8[8] = 0x7265707573;
  v8[9] = 0xE500000000000000;
  uint64_t v9 = (void *)swift_allocObject();
  _OWORD v9[2] = v2;
  uint64_t v9[3] = v3;
  void v9[4] = v4;
  v9[5] = v6;
  void v9[6] = v5;
  v9[7] = v7;
  v9[8] = 0x7265707573;
  v9[9] = 0xE500000000000000;
  uint64_t v10 = type metadata accessor for DictionaryEncoderImplementation();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v21;
  *(void *)(v11 + 24) = v14;
  *(void *)(v11 + 32) = v15;
  *(void *)(v11 + 40) = v20;
  *(void *)(v11 + 48) = v17;
  *(void *)(v11 + 56) = v16;
  *(unsigned char *)(v11 + 64) = v13;
  *(void *)(v11 + 72) = v22;
  *(void *)(v11 + 80) = v18;
  *(void *)(v11 + 88) = sub_1B8F54A40;
  *(void *)(v11 + 96) = v8;
  *(void *)(v11 + 104) = sub_1B8F54A0C;
  *(void *)(v11 + 112) = v9;
  *(void *)(v11 + 120) = v5;
  *(void *)(v11 + 128) = v7;
  a1[3] = v10;
  a1[4] = sub_1B8F49FC4();
  *a1 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v15);
  sub_1B8F2C560(v17, v16, v13);
  sub_1B8F2C708(v22);
  swift_retain_n();
  swift_retain_n();
  return swift_retain_n();
}

uint64_t sub_1B8F4E244@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v24 = *v3;
  uint64_t v25 = v3[1];
  uint64_t v26 = v3[3];
  uint64_t v27 = v3[2];
  uint64_t v28 = v3[5];
  unint64_t v33 = v3[7];
  uint64_t v31 = (void *)v3[4];
  uint64_t v32 = v3[8];
  uint64_t v6 = v3[9];
  uint64_t v5 = v3[10];
  uint64_t v8 = v3[11];
  uint64_t v7 = v3[12];
  uint64_t v9 = v3[13];
  char v30 = *((unsigned char *)v3 + 48);
  uint64_t v10 = v3[14];
  uint64_t v11 = sub_1B8F2E3FC(a1, a2);
  uint64_t v13 = v12;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v6;
  void v14[3] = v5;
  v14[4] = v8;
  v14[5] = v7;
  v14[6] = v9;
  v14[7] = v10;
  v14[8] = v11;
  v14[9] = v13;
  uint64_t v15 = v13;
  uint64_t v16 = v4[9];
  uint64_t v17 = v4[12];
  uint64_t v18 = v4[13];
  uint64_t v19 = v4[14];
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v16;
  *(_OWORD *)(v20 + 24) = *((_OWORD *)v4 + 5);
  *(void *)(v20 + 40) = v17;
  *(void *)(v20 + 48) = v18;
  *(void *)(v20 + 56) = v19;
  *(void *)(v20 + 64) = v11;
  *(void *)(v20 + 72) = v15;
  uint64_t v21 = type metadata accessor for DictionaryEncoderImplementation();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v24;
  *(void *)(v22 + 24) = v25;
  *(void *)(v22 + 32) = v27;
  *(void *)(v22 + 40) = v26;
  *(void *)(v22 + 48) = v31;
  *(void *)(v22 + 56) = v28;
  *(unsigned char *)(v22 + 64) = v30;
  *(void *)(v22 + 72) = v33;
  *(void *)(v22 + 80) = v32;
  *(void *)(v22 + 88) = sub_1B8F54470;
  *(void *)(v22 + 96) = v14;
  *(void *)(v22 + 104) = sub_1B8F54494;
  *(void *)(v22 + 112) = v20;
  *(void *)(v22 + 120) = v18;
  *(void *)(v22 + 128) = v19;
  a3[3] = v21;
  a3[4] = sub_1B8F49FC4();
  *a3 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v27);
  sub_1B8F2C560(v31, v28, v30);
  sub_1B8F2C708(v33);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return swift_retain_n();
}

uint64_t sub_1B8F4E488@<X0>(void (**a1)(void **__return_ptr)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*a1)(&v11);
  uint64_t v7 = v11;
  *(void *)&v10[0] = a2;
  *((void *)&v10[0] + 1) = a3;
  swift_bridgeObjectRetain_n();
  id v8 = objc_msgSend(v7, sel___swift_objectForKeyedSubscript_, sub_1B8F580F0(), v10[0]);
  swift_unknownObjectRelease();

  if (v8)
  {
    sub_1B8F579F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_1B8F37BAC((uint64_t)v10, a4);
  return swift_bridgeObjectRelease();
}

void sub_1B8F4E564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void *__return_ptr))a2)(v16);
  id v8 = (void *)v16[0];
  sub_1B8F21884(a1, (uint64_t)v16);
  uint64_t v9 = v17;
  if (v17)
  {
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(v16, v17);
    uint64_t v18 = v16;
    uint64_t v11 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v10, v10);
    uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1B8F57ED0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = 0;
  }
  v16[0] = a3;
  v16[1] = a4;
  swift_bridgeObjectRetain();
  objc_msgSend(v8, sel___swift_setObject_forKeyedSubscript_, v14, sub_1B8F580F0());
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v15 = *(void (**)(void *))(a2 + 16);
  v16[0] = v8;
  v15(v16);
}

uint64_t sub_1B8F4E750(uint64_t a1, uint64_t a2)
{
  return sub_1B8F4C444(a1, a2);
}

uint64_t sub_1B8F4E768(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C4E4(a1, a2, a3);
}

uint64_t sub_1B8F4E780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4C5A0(a1, a2, a3, a4);
}

uint64_t sub_1B8F4E798(uint64_t a1, uint64_t a2, double a3)
{
  return sub_1B8F4C670(a1, a2, a3);
}

uint64_t sub_1B8F4E7B0(uint64_t a1, uint64_t a2, float a3)
{
  return sub_1B8F4C724(a1, a2, a3);
}

uint64_t sub_1B8F4E7C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4CA00(a1, a2, a3, MEMORY[0x1E4FBB550]);
}

uint64_t sub_1B8F4E7E8(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C7D8(a1, a2, a3, MEMORY[0x1E4FBC098]);
}

uint64_t sub_1B8F4E808(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C890(a1, a2, a3, MEMORY[0x1E4FBC0F8]);
}

uint64_t sub_1B8F4E828(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C948(a1, a2, a3, MEMORY[0x1E4FBC150]);
}

uint64_t sub_1B8F4E848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4CA00(a1, a2, a3, MEMORY[0x1E4FBC1C8]);
}

uint64_t sub_1B8F4E868()
{
  return sub_1B8F580C0();
}

uint64_t sub_1B8F4E880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4CA00(a1, a2, a3, MEMORY[0x1E4FBB808]);
}

uint64_t sub_1B8F4E8A0(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C7D8(a1, a2, a3, MEMORY[0x1E4FBC358]);
}

uint64_t sub_1B8F4E8C0(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C890(a1, a2, a3, MEMORY[0x1E4FBC450]);
}

uint64_t sub_1B8F4E8E0(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4C948(a1, a2, a3, MEMORY[0x1E4FBC4C0]);
}

uint64_t sub_1B8F4E900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F4CA00(a1, a2, a3, MEMORY[0x1E4FBC538]);
}

uint64_t sub_1B8F4E920()
{
  return sub_1B8F580D0();
}

uint64_t sub_1B8F4E938(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  return sub_1B8F4CAB8(a1, a2, a5, a3, a4);
}

uint64_t sub_1B8F4E960()
{
  return sub_1B8F580B0();
}

uint64_t sub_1B8F4E98C()
{
  return sub_1B8F58020();
}

uint64_t sub_1B8F4E9A4()
{
  return sub_1B8F58010();
}

uint64_t sub_1B8F4E9BC()
{
  return sub_1B8F58030();
}

uint64_t sub_1B8F4E9D8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EBCC(a1, a2, a3, a4, MEMORY[0x1E4FBBFF0]);
}

uint64_t sub_1B8F4EA04()
{
  return sub_1B8F58040();
}

uint64_t sub_1B8F4EA20(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EB24(a1, a2, a3, a4, MEMORY[0x1E4FBC008]);
}

uint64_t sub_1B8F4EA4C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EB78(a1, a2, a3, a4, MEMORY[0x1E4FBC010]);
}

uint64_t sub_1B8F4EA78(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EBCC(a1, a2, a3, a4, MEMORY[0x1E4FBC018]);
}

uint64_t sub_1B8F4EAA4()
{
  return sub_1B8F58070();
}

uint64_t sub_1B8F4EAC0()
{
  return sub_1B8F58080();
}

uint64_t sub_1B8F4EADC()
{
  return sub_1B8F58050();
}

uint64_t sub_1B8F4EAF8(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EB24(a1, a2, a3, a4, MEMORY[0x1E4FBC028]);
}

uint64_t sub_1B8F4EB24(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_1B8F4EB4C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EB78(a1, a2, a3, a4, MEMORY[0x1E4FBC038]);
}

uint64_t sub_1B8F4EB78(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_1B8F4EBA0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B8F4EBCC(a1, a2, a3, a4, MEMORY[0x1E4FBC040]);
}

uint64_t sub_1B8F4EBCC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_1B8F4EBFC()
{
  return sub_1B8F58090();
}

uint64_t sub_1B8F4EC18()
{
  return sub_1B8F580A0();
}

uint64_t sub_1B8F4EC34()
{
  return sub_1B8F58060();
}

uint64_t sub_1B8F4EC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1B8F4D4BC(a1, a2, a5);
}

void sub_1B8F4EC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void **))(a2 + 88);
  (*(void (**)(void **__return_ptr))(a2 + 72))(&v6);
  uint64_t v5 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v5, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), a3);
  swift_unknownObjectRelease();
  uint64_t v6 = v5;
  v4(&v6);
}

uint64_t sub_1B8F4ED34()
{
  void (*v18)(id *__return_ptr, uint64_t);
  id v19;
  void (*v20)(uint64_t *);
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  long long v33;
  long long v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41[4];
  char v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  long long v55;
  long long v56;
  uint64_t v57;
  void v58[7];

  uint64_t v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA60]), sel_init);
  uint64_t v37 = *(void *)v0;
  char v39 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  unint64_t v6 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  char v7 = *(unsigned char *)(v0 + 48);
  v41[0] = *(void *)(v0 + 16);
  uint64_t v1 = v41[0];
  v41[1] = v2;
  v41[2] = (uint64_t)v3;
  v41[3] = v4;
  uint64_t v42 = v7;
  uint64_t v43 = v6;
  uint64_t v44 = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v35;
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 112);
  v58[0] = sub_1B8F543A4;
  v58[1] = v8;
  v58[2] = nullsub_1;
  v58[3] = 0;
  v58[4] = v9;
  v58[5] = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v1);
  sub_1B8F2C560(v3, v4, v7);
  sub_1B8F2C708(v6);
  uint64_t v21 = v35;
  swift_retain();
  sub_1B8F4A9E4(v37, v39, v41, (uint64_t)v58, (uint64_t)&v45);
  uint64_t v24 = v46;
  uint64_t v25 = v45;
  uint64_t v26 = v48;
  uint64_t v27 = v47;
  uint64_t v28 = v51;
  uint64_t v40 = v52;
  uint64_t v36 = v49;
  uint64_t v38 = v53;
  uint64_t v23 = v54;
  unint64_t v33 = v55;
  uint64_t v34 = v56;
  unint64_t v29 = v50;
  char v30 = v57;
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v13 = *(void **)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 40);
  LOBYTE(v1) = *(unsigned char *)(v0 + 48);
  uint64_t v32 = *(void *)(v0 + 56);
  uint64_t v18 = *(void (**)(id *__return_ptr, uint64_t))(v0 + 72);
  uint64_t v20 = *(void (**)(uint64_t *))(v0 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v31 = v11;
  sub_1B8F2C368(v11);
  sub_1B8F2C560(v13, v12, v1);
  sub_1B8F2C708(v32);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v11);
  sub_1B8F2C560(v13, v12, v1);
  sub_1B8F2C708(v32);
  swift_retain();
  swift_retain();
  uint64_t v14 = swift_retain();
  v18(&v45, v14);
  id v15 = v45;
  uint64_t v19 = objc_msgSend(v45, sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v11);
  sub_1B8F2C5DC(v13, v12, v1);
  sub_1B8F2C76C(v32);
  swift_release();
  swift_release();
  swift_release();
  char v48 = sub_1B8F1ECD8(0, qword_1E9EF5318);
  id v45 = v21;
  uint64_t v22 = v21;
  ((void (*)(uint64_t *__return_ptr))v18)(v41);
  uint64_t v16 = (void *)v41[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v16, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v19);
  swift_unknownObjectRelease();
  v41[0] = (uint64_t)v16;
  v20(v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v31);
  sub_1B8F2C5DC(v13, v12, v1);
  sub_1B8F2C76C(v32);
  swift_release();
  swift_release();
  swift_release();
  sub_1B8F0BCE4((uint64_t)&v45);
  id v45 = v25;
  long long v46 = v24;
  long long v47 = v27;
  char v48 = v26;
  unint64_t v49 = v36;
  uint64_t v50 = v29;
  unsigned long long v51 = v28;
  uint64_t v52 = v40;
  uint64_t v53 = v38;
  long long v54 = v23;
  uint64_t v55 = v33;
  char v56 = v34;
  unint64_t v57 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v27);
  sub_1B8F2C560(v36, v29, v28);
  sub_1B8F2C708(v40);
  _s18AAAFoundationSwift14KeyedContainerVMa_0();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_getWitnessTable();
  sub_1B8F57CC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v27);
  sub_1B8F2C5DC(v36, v29, v28);
  sub_1B8F2C76C(v40);
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1B8F4F5A0(uint64_t *a1@<X8>)
{
  void (*v23)(id *__return_ptr, uint64_t);
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  id v29[5];

  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), sel_init);
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v8 = (void *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v21 = v7;
  uint64_t v26 = *((unsigned char *)v1 + 48);
  uint64_t v24 = v1[8];
  uint64_t v25 = v1[7];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v2;
  uint64_t v18 = v9;
  uint64_t v19 = v1[13];
  uint64_t v22 = v1[14];
  uint64_t v23 = (void (*)(id *__return_ptr, uint64_t))v1[9];
  uint64_t v17 = (void (*)(void **))v1[11];
  swift_bridgeObjectRetain();
  uint64_t v27 = v4;
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v6);
  sub_1B8F2C560(v8, v7, v26);
  sub_1B8F2C708(v25);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v6);
  sub_1B8F2C560(v8, v7, v26);
  sub_1B8F2C708(v25);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v6);
  sub_1B8F2C560(v8, v7, v26);
  sub_1B8F2C708(v25);
  id v10 = v2;
  uint64_t v11 = swift_retain();
  v23(v29, v11);
  id v12 = v29[0];
  id v15 = objc_msgSend(v29[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v6);
  sub_1B8F2C5DC(v8, v21, v26);
  sub_1B8F2C76C(v25);
  swift_release();
  swift_release();
  swift_release();
  v29[3] = (id)sub_1B8F1ECD8(0, &qword_1E9EF5310);
  v29[0] = v10;
  id v16 = v10;
  ((void (*)(void **__return_ptr))v23)(&v28);
  uint64_t v13 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v13, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v15);
  swift_unknownObjectRelease();
  uint64_t v28 = v13;
  v17(&v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v6);
  sub_1B8F2C5DC(v8, v21, v26);
  sub_1B8F2C76C(v25);
  swift_release();
  swift_release();
  swift_release();
  sub_1B8F0BCE4((uint64_t)v29);
  a1[3] = (uint64_t)&_s18AAAFoundationSwift16UnkeyedContainerVN_0;
  a1[4] = sub_1B8F4B9B8();
  uint64_t v14 = swift_allocObject();
  *a1 = v14;

  *(void *)(v14 + 16) = v3;
  *(void *)(v14 + 24) = v27;
  *(void *)(v14 + 32) = v6;
  *(void *)(v14 + 40) = v5;
  *(void *)(v14 + 48) = v8;
  *(void *)(v14 + 56) = v21;
  *(unsigned char *)(v14 + 64) = v26;
  *(void *)(v14 + 72) = v25;
  *(void *)(v14 + 80) = v24;
  *(void *)(v14 + 88) = sub_1B8F54A44;
  *(void *)(v14 + 96) = v18;
  *(void *)(v14 + 104) = nullsub_1;
  *(void *)(v14 + 112) = 0;
  *(void *)(v14 + 120) = v19;
  *(void *)(v14 + 128) = v22;
}

uint64_t sub_1B8F4FCB0@<X0>(uint64_t *a1@<X8>)
{
  void (*v32)(id *__return_ptr, unint64_t);
  long long v33;
  uint64_t v34;
  uint64_t v35;
  id v36[2];
  uint64_t vars8;

  id v2 = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v34 = v3;
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v28 = v5;
  uint64_t v8 = (void *)v2[4];
  uint64_t v7 = v2[5];
  unint64_t v9 = v2[7];
  uint64_t v35 = v2[8];
  uint64_t v32 = (void (*)(id *__return_ptr, unint64_t))v2[9];
  uint64_t v31 = v2[14];
  char v10 = *((unsigned char *)v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v26 = *((_OWORD *)v2 + 5);
  unint64_t v33 = *((_OWORD *)v2 + 6);
  sub_1B8F2C368(v5);
  uint64_t v11 = v8;
  char v30 = v8;
  id v12 = v8;
  uint64_t v13 = v7;
  sub_1B8F2C560(v12, v7, v10);
  sub_1B8F2C708(v9);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v29 = v4;
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v28);
  sub_1B8F2C560(v11, v7, v10);
  sub_1B8F2C708(v9);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = v6;
  sub_1B8F2C368(v28);
  sub_1B8F2C560(v30, v7, v10);
  unint64_t v14 = sub_1B8F2C708(v9);
  v32(v36, v14);
  id v15 = v36[0];
  id v25 = objc_msgSend(v36[0], sel_count);
  uint64_t v16 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v28);
  sub_1B8F2C5DC(v30, v7, v10);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v34;
  *(void *)(v17 + 24) = v16;
  *(void *)(v17 + 32) = v28;
  *(void *)(v17 + 40) = v24;
  *(void *)(v17 + 48) = v30;
  *(void *)(v17 + 56) = v7;
  *(unsigned char *)(v17 + 64) = v10;
  *(void *)(v17 + 72) = v9;
  *(void *)(v17 + 80) = v35;
  *(void *)(v17 + 88) = v32;
  *(_OWORD *)(v17 + 96) = v26;
  *(_OWORD *)(v17 + 112) = v33;
  *(void *)(v17 + 128) = v31;
  *(void *)(v17 + 136) = v25;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_1B8F5434C;
  *(void *)(v18 + 24) = v17;
  uint64_t v20 = v2[13];
  uint64_t v19 = v2[14];
  uint64_t v21 = type metadata accessor for DictionaryEncoderImplementation();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v34;
  *(void *)(v22 + 24) = v29;
  *(void *)(v22 + 32) = v28;
  *(void *)(v22 + 40) = v24;
  *(void *)(v22 + 48) = v30;
  *(void *)(v22 + 56) = v13;
  *(unsigned char *)(v22 + 64) = v10;
  *(void *)(v22 + 72) = v9;
  *(void *)(v22 + 80) = v35;
  *(void *)(v22 + 88) = sub_1B8F4FFFC;
  *(void *)(v22 + 96) = 0;
  *(void *)(v22 + 104) = sub_1B8F54A54;
  *(void *)(v22 + 112) = v18;
  *(void *)(v22 + 120) = v20;
  *(void *)(v22 + 128) = v19;
  a1[3] = v21;
  a1[4] = sub_1B8F49FC4();
  *a1 = v22;
  return swift_retain();
}

double sub_1B8F4FFFC@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_1B8F50008()
{
  void (*v15)(id *__return_ptr, uint64_t);
  id v16[2];
  long long v17;
  void *v18;

  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = *(void **)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  unint64_t v14 = v2;
  unint64_t v4 = *(void *)(v0 + 56);
  id v15 = *(void (**)(id *__return_ptr, uint64_t))(v0 + 72);
  id v12 = *(void (**)(void **))(v0 + 88);
  char v13 = *(unsigned char *)(v0 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v1);
  sub_1B8F2C560(v2, v3, v13);
  sub_1B8F2C708(v4);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v1);
  sub_1B8F2C560(v2, v3, v13);
  sub_1B8F2C708(v4);
  swift_retain();
  swift_retain();
  uint64_t v5 = swift_retain();
  v15(v16, v5);
  id v6 = v16[0];
  id v11 = objc_msgSend(v16[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v1);
  sub_1B8F2C5DC(v2, v3, v13);
  unint64_t v7 = v4;
  sub_1B8F2C76C(v4);
  swift_release();
  swift_release();
  uint64_t v8 = swift_release();
  *(_OWORD *)uint64_t v16 = 0u;
  uint64_t v17 = 0u;
  v15(&v18, v8);
  unint64_t v9 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v9, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v11);
  swift_unknownObjectRelease();
  uint64_t v18 = v9;
  v12(&v18);

  sub_1B8F0BCE4((uint64_t)v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v1);
  sub_1B8F2C5DC(v14, v3, v13);
  sub_1B8F2C76C(v7);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F502C8(void *a1, void *a2)
{
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void **)(v2 + 32);
  uint64_t v5 = *(void *)(v2 + 40);
  char v13 = v4;
  unint64_t v6 = *(void *)(v2 + 56);
  uint64_t v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  uint64_t v17 = *(void (**)(void **))(v2 + 88);
  char v18 = *(unsigned char *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v19(v20, v7);
  id v8 = v20[0];
  id v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v18);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  swift_release();
  v20[3] = (id)MEMORY[0x1E4FBB1A0];
  v20[0] = a1;
  v20[1] = a2;
  uint64_t v10 = swift_bridgeObjectRetain();
  v19(&v21, v10);
  id v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  uint64_t v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v18);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v20);
}

uint64_t sub_1B8F505A4(double a1)
{
  void (*v17)(id *__return_ptr, uint64_t);
  void *v18;
  id v19[5];

  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v4 = *(void **)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  unint64_t v6 = *(void *)(v1 + 56);
  uint64_t v17 = *(void (**)(id *__return_ptr, uint64_t))(v1 + 72);
  id v15 = *(void (**)(void **))(v1 + 88);
  char v13 = v4;
  char v16 = *(unsigned char *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v16);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v16);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v17(v19, v7);
  id v8 = v19[0];
  id v14 = objc_msgSend(v19[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v16);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  uint64_t v10 = swift_release();
  v19[3] = (id)MEMORY[0x1E4FBB3D0];
  v19[0] = *(id *)&a1;
  v17(&v18, v10);
  id v11 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  char v18 = v11;
  v15(&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v16);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v19);
}

uint64_t sub_1B8F50878(float a1)
{
  void (*v17)(id *__return_ptr, uint64_t);
  void *v18;
  id v19[5];

  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v4 = *(void **)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  unint64_t v6 = *(void *)(v1 + 56);
  uint64_t v17 = *(void (**)(id *__return_ptr, uint64_t))(v1 + 72);
  id v15 = *(void (**)(void **))(v1 + 88);
  char v13 = v4;
  char v16 = *(unsigned char *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v16);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v16);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v17(v19, v7);
  id v8 = v19[0];
  id v14 = objc_msgSend(v19[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v16);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  uint64_t v10 = swift_release();
  v19[3] = (id)MEMORY[0x1E4FBB470];
  *(float *)uint64_t v19 = a1;
  v17(&v18, v10);
  id v11 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  char v18 = v11;
  v15(&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v16);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v19);
}

uint64_t sub_1B8F50B4C(char a1, void *a2)
{
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void **)(v2 + 32);
  uint64_t v5 = *(void *)(v2 + 40);
  char v13 = v4;
  unint64_t v6 = *(void *)(v2 + 56);
  uint64_t v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  uint64_t v17 = *(void (**)(void **))(v2 + 88);
  char v18 = *(unsigned char *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v19(v20, v7);
  id v8 = v20[0];
  id v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v18);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  uint64_t v10 = swift_release();
  v20[3] = a2;
  LOBYTE(v20[0]) = a1;
  v19(&v21, v10);
  id v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  uint64_t v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v18);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v20);
}

uint64_t sub_1B8F50E24(__int16 a1, void *a2)
{
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void **)(v2 + 32);
  uint64_t v5 = *(void *)(v2 + 40);
  char v13 = v4;
  unint64_t v6 = *(void *)(v2 + 56);
  uint64_t v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  uint64_t v17 = *(void (**)(void **))(v2 + 88);
  char v18 = *(unsigned char *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v19(v20, v7);
  id v8 = v20[0];
  id v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v18);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  uint64_t v10 = swift_release();
  v20[3] = a2;
  LOWORD(v20[0]) = a1;
  v19(&v21, v10);
  id v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  uint64_t v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v18);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v20);
}

uint64_t sub_1B8F510FC(int a1, void *a2)
{
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void **)(v2 + 32);
  uint64_t v5 = *(void *)(v2 + 40);
  char v13 = v4;
  unint64_t v6 = *(void *)(v2 + 56);
  uint64_t v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  uint64_t v17 = *(void (**)(void **))(v2 + 88);
  char v18 = *(unsigned char *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v19(v20, v7);
  id v8 = v20[0];
  id v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v18);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  uint64_t v10 = swift_release();
  v20[3] = a2;
  LODWORD(v20[0]) = a1;
  v19(&v21, v10);
  id v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  uint64_t v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v18);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v20);
}

uint64_t sub_1B8F513D4(void *a1, void *a2)
{
  void (*v19)(id *__return_ptr, uint64_t);
  id v20[5];
  void *v21;

  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v4 = *(void **)(v2 + 32);
  uint64_t v5 = *(void *)(v2 + 40);
  char v13 = v4;
  unint64_t v6 = *(void *)(v2 + 56);
  uint64_t v19 = *(void (**)(id *__return_ptr, uint64_t))(v2 + 72);
  uint64_t v17 = *(void (**)(void **))(v2 + 88);
  char v18 = *(unsigned char *)(v2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v4, v5, v18);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  uint64_t v7 = swift_retain();
  v19(v20, v7);
  id v8 = v20[0];
  id v14 = objc_msgSend(v20[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v4, v5, v18);
  unint64_t v9 = v6;
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  uint64_t v10 = swift_release();
  v20[3] = a2;
  v20[0] = a1;
  v19(&v21, v10);
  id v11 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v11, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v14);
  swift_unknownObjectRelease();
  uint64_t v21 = v11;
  v17(&v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v13, v5, v18);
  sub_1B8F2C76C(v9);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v20);
}

uint64_t sub_1B8F516A8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  void (*v29)(id *__return_ptr, uint64_t);
  long long v30;
  void *v31;
  id v32[6];
  char v33;
  unint64_t v34;
  uint64_t v35;
  double (*v36)@<D0>(_OWORD *@<X8>);
  uint64_t v37;
  void (*v38)(uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;

  uint64_t v31 = *(void **)v3;
  uint64_t v42 = *(void **)(v3 + 8);
  unint64_t v4 = *(void **)(v3 + 16);
  uint64_t v20 = *(void **)(v3 + 24);
  uint64_t v5 = *(void **)(v3 + 32);
  uint64_t v6 = *(void *)(v3 + 40);
  long long v26 = v5;
  unint64_t v8 = *(void *)(v3 + 56);
  uint64_t v7 = *(void *)(v3 + 64);
  uint64_t v28 = *(void *)(v3 + 112);
  uint64_t v29 = *(void (**)(id *__return_ptr, uint64_t))(v3 + 72);
  char v9 = *(unsigned char *)(v3 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v22 = *(_OWORD *)(v3 + 80);
  char v30 = *(_OWORD *)(v3 + 96);
  sub_1B8F2C368((uint64_t)v4);
  uint64_t v27 = (void *)v6;
  sub_1B8F2C560(v5, v6, v9);
  uint64_t v21 = v7;
  sub_1B8F2C708(v8);
  swift_retain();
  swift_retain();
  uint64_t v10 = swift_retain();
  v29(v32, v10);
  id v11 = v32[0];
  id v19 = objc_msgSend(v32[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8((uint64_t)v4);
  sub_1B8F2C5DC(v5, v6, v9);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v19;
  *(void *)(v12 + 24) = v29;
  *(_OWORD *)(v12 + 32) = v22;
  *(_OWORD *)(v12 + 48) = v30;
  *(void *)(v12 + 64) = v28;
  uint64_t v13 = *(void *)(v3 + 72);
  uint64_t v14 = *(void *)(v3 + 96);
  uint64_t v15 = *(void *)(v3 + 104);
  uint64_t v16 = *(void *)(v3 + 112);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  *(_OWORD *)(v17 + 24) = *(_OWORD *)(v3 + 80);
  *(void *)(v17 + 40) = v14;
  *(void *)(v17 + 48) = v15;
  *(void *)(v17 + 56) = v16;
  *(void *)(v17 + 64) = v19;
  v32[0] = v31;
  v32[1] = v42;
  v32[2] = v4;
  void v32[3] = v20;
  v32[4] = v26;
  v32[5] = v27;
  unint64_t v33 = v9;
  uint64_t v34 = v8;
  uint64_t v35 = v21;
  uint64_t v36 = sub_1B8F543F8;
  uint64_t v37 = v12;
  uint64_t v38 = sub_1B8F5444C;
  char v39 = v17;
  uint64_t v40 = v15;
  uint64_t v41 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368((uint64_t)v4);
  sub_1B8F2C560(v26, (uint64_t)v27, v9);
  sub_1B8F2C708(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_1B8F4CD40(a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8((uint64_t)v4);
  sub_1B8F2C5DC(v26, (uint64_t)v27, v9);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  return swift_release();
}

double sub_1B8F519E4@<D0>(uint64_t a1@<X0>, void (**a2)(id *__return_ptr)@<X1>, _OWORD *a3@<X8>)
{
  void (*v5)(id *__return_ptr);
  id v6;
  id v7;
  id v8;
  double result;
  id v10;
  uint64_t vars8;

  uint64_t v5 = *a2;
  (*a2)(&v10);
  uint64_t v6 = v10;
  uint64_t v7 = objc_msgSend(v10, sel_count);

  if ((uint64_t)v7 <= a1)
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  else
  {
    v5(&v10);
    unint64_t v8 = v10;
    objc_msgSend(v10, sel_objectAtIndexedSubscript_, a1);

    sub_1B8F579F0();
    swift_unknownObjectRelease();
  }
  return result;
}

void sub_1B8F51AC8(uint64_t a1, void (**a2)(void **__return_ptr), uint64_t a3)
{
  (*a2)(&v7);
  uint64_t v5 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v5, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), a3);
  swift_unknownObjectRelease();
  uint64_t v6 = a2[2];
  uint64_t v7 = v5;
  v6(&v7);
}

uint64_t sub_1B8F51B7C(char a1)
{
  void (*v17)(id *__return_ptr, uint64_t);
  id v18[5];
  void *v19;

  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  unint64_t v5 = *(void *)(v1 + 56);
  uint64_t v17 = *(void (**)(id *__return_ptr, uint64_t))(v1 + 72);
  uint64_t v15 = *(void (**)(void **))(v1 + 88);
  uint64_t v12 = v3;
  char v16 = *(unsigned char *)(v1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v2);
  sub_1B8F2C560(v3, v4, v16);
  sub_1B8F2C708(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v2);
  sub_1B8F2C560(v3, v4, v16);
  sub_1B8F2C708(v5);
  swift_retain();
  swift_retain();
  uint64_t v6 = swift_retain();
  v17(v18, v6);
  id v7 = v18[0];
  id v13 = objc_msgSend(v18[0], sel_count);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v2);
  sub_1B8F2C5DC(v3, v4, v16);
  unint64_t v8 = v5;
  sub_1B8F2C76C(v5);
  swift_release();
  swift_release();
  uint64_t v9 = swift_release();
  v18[3] = (id)MEMORY[0x1E4FBB390];
  LOBYTE(v18[0]) = a1;
  v17(&v19, v9);
  uint64_t v10 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  objc_msgSend(v10, sel_setObject_atIndexedSubscript_, sub_1B8F57970(), v13);
  swift_unknownObjectRelease();
  id v19 = v10;
  v15(&v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1B8F2C3C8(v2);
  sub_1B8F2C5DC(v12, v4, v16);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  swift_release();
  return sub_1B8F0BCE4((uint64_t)v18);
}

id sub_1B8F51E4C()
{
  (*(void (**)(id *__return_ptr))(v0 + 72))(&v4);
  id v1 = v4;
  id v2 = objc_msgSend(v4, sel_count);

  return v2;
}

uint64_t sub_1B8F51EA0()
{
  return sub_1B8F50008();
}

uint64_t sub_1B8F51EB8(char a1)
{
  return sub_1B8F51B7C(a1);
}

uint64_t sub_1B8F51ED0(void *a1, void *a2)
{
  return sub_1B8F502C8(a1, a2);
}

uint64_t sub_1B8F51EE8(double a1)
{
  return sub_1B8F505A4(a1);
}

uint64_t sub_1B8F51F00(float a1)
{
  return sub_1B8F50878(a1);
}

uint64_t sub_1B8F51F18(void *a1)
{
  return sub_1B8F513D4(a1, MEMORY[0x1E4FBB550]);
}

uint64_t sub_1B8F51F38(char a1)
{
  return sub_1B8F50B4C(a1, MEMORY[0x1E4FBC098]);
}

uint64_t sub_1B8F51F58(__int16 a1)
{
  return sub_1B8F50E24(a1, MEMORY[0x1E4FBC0F8]);
}

uint64_t sub_1B8F51F78(int a1)
{
  return sub_1B8F510FC(a1, MEMORY[0x1E4FBC150]);
}

uint64_t sub_1B8F51F98(void *a1)
{
  return sub_1B8F513D4(a1, MEMORY[0x1E4FBC1C8]);
}

uint64_t sub_1B8F51FB8()
{
  return sub_1B8F57EA0();
}

uint64_t sub_1B8F51FD0(void *a1)
{
  return sub_1B8F513D4(a1, MEMORY[0x1E4FBB808]);
}

uint64_t sub_1B8F51FF0(char a1)
{
  return sub_1B8F50B4C(a1, MEMORY[0x1E4FBC358]);
}

uint64_t sub_1B8F52010(__int16 a1)
{
  return sub_1B8F50E24(a1, MEMORY[0x1E4FBC450]);
}

uint64_t sub_1B8F52030(int a1)
{
  return sub_1B8F510FC(a1, MEMORY[0x1E4FBC4C0]);
}

uint64_t sub_1B8F52050(void *a1)
{
  return sub_1B8F513D4(a1, MEMORY[0x1E4FBC538]);
}

uint64_t sub_1B8F52070()
{
  return sub_1B8F57EB0();
}

uint64_t sub_1B8F52088(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  return sub_1B8F516A8(a1, a2, a3);
}

uint64_t sub_1B8F520A0()
{
  return sub_1B8F57D80();
}

uint64_t sub_1B8F520CC()
{
  return sub_1B8F57DB0();
}

uint64_t sub_1B8F520F8()
{
  return sub_1B8F57DA0();
}

uint64_t sub_1B8F52124()
{
  return sub_1B8F57DC0();
}

uint64_t sub_1B8F52150()
{
  return sub_1B8F57DD0();
}

uint64_t sub_1B8F5217C()
{
  return sub_1B8F57DE0();
}

uint64_t sub_1B8F521A8()
{
  return sub_1B8F57E00();
}

uint64_t sub_1B8F521D4()
{
  return sub_1B8F57E10();
}

uint64_t sub_1B8F52200()
{
  return sub_1B8F57E20();
}

uint64_t sub_1B8F5222C()
{
  return sub_1B8F57E30();
}

uint64_t sub_1B8F52258()
{
  return sub_1B8F57E50();
}

uint64_t sub_1B8F52284()
{
  return sub_1B8F57DF0();
}

uint64_t sub_1B8F522B0()
{
  return sub_1B8F57E40();
}

uint64_t sub_1B8F522DC()
{
  return sub_1B8F57E60();
}

uint64_t sub_1B8F52308()
{
  return sub_1B8F57E70();
}

uint64_t sub_1B8F52334()
{
  return sub_1B8F57E80();
}

uint64_t sub_1B8F52360()
{
  return sub_1B8F57E90();
}

uint64_t sub_1B8F5238C()
{
  return sub_1B8F57D90();
}

uint64_t sub_1B8F523CC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  unint64_t v4 = *(void *)(v0 + 56);
  id v7 = *(void (**)(void *))(v0 + 88);
  char v6 = *(unsigned char *)(v0 + 48);
  memset(v9, 0, sizeof(v9));
  v8[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  v8[0] = swift_allocObject();
  sub_1B8F21884((uint64_t)v9, v8[0] + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v1);
  sub_1B8F2C560(v3, v2, v6);
  sub_1B8F2C708(v4);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v8);
  sub_1B8F0BCE4((uint64_t)v8);
  sub_1B8F0BCE4((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v1);
  sub_1B8F2C5DC(v3, v2, v6);
  sub_1B8F2C76C(v4);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F52560(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(void *))(a2 + 88);
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9C33F0);
  v5[0] = swift_allocObject();
  sub_1B8F21884(a1, v5[0] + 16);
  v3(v5);
  return sub_1B8F0BCE4((uint64_t)v5);
}

uint64_t sub_1B8F525EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void (*)(uint64_t, uint64_t, void *))v2[7];
  uint64_t v3 = v2[8];
  uint64_t v66 = v3;
  if (v4)
  {
    if (v4 == (void (*)(uint64_t, uint64_t, void *))1)
    {
      uint64_t v5 = sub_1B8F57150();
      uint64_t v6 = v2[2];
      id v7 = (void *)v2[4];
      char v48 = *((unsigned char *)v2 + 48);
      uint64_t v50 = v2[5];
      uint64_t v52 = (void (*)(void *))v2[11];
      uint64_t v64 = MEMORY[0x1E4FBB1A0];
      v63[0] = v5;
      v63[1] = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B8F2C368(v6);
      sub_1B8F2C560(v7, v50, v48);
      sub_1B8F2C708(1uLL);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      v52(v63);
      sub_1B8F0BCE4((uint64_t)v63);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1B8F2C3C8(v6);
      sub_1B8F2C5DC(v7, v50, v48);
      sub_1B8F2C76C(1uLL);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      return swift_release();
    }
    uint64_t v24 = *v2;
    uint64_t v23 = v2[1];
    uint64_t v58 = *v2;
    uint64_t v60 = v23;
    uint64_t v25 = v2[2];
    long long v26 = (void *)v2[4];
    uint64_t v27 = v2[5];
    char v56 = v26;
    uint64_t v45 = v2[9];
    uint64_t v62 = v2[10];
    uint64_t v43 = v2[11];
    uint64_t v51 = v2[12];
    uint64_t v40 = v2[13];
    uint64_t v37 = v2[3];
    uint64_t v39 = v2[14];
    char v28 = *((unsigned char *)v2 + 48);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v24;
    *(void *)(v29 + 24) = v23;
    *(void *)(v29 + 32) = v25;
    *(void *)(v29 + 40) = v37;
    *(void *)(v29 + 48) = v26;
    *(void *)(v29 + 56) = v27;
    uint64_t v47 = v27;
    *(unsigned char *)(v29 + 64) = v28;
    *(void *)(v29 + 72) = v4;
    *(void *)(v29 + 80) = v3;
    *(void *)(v29 + 88) = v45;
    *(void *)(v29 + 96) = v62;
    *(void *)(v29 + 104) = v43;
    *(void *)(v29 + 112) = v51;
    *(void *)(v29 + 120) = v40;
    *(void *)(v29 + 128) = v39;
    uint64_t v30 = swift_allocObject();
    uint64_t v31 = v3;
    uint64_t v32 = v30;
    *(void *)(v30 + 16) = v58;
    *(void *)(v30 + 24) = v23;
    *(void *)(v30 + 32) = v25;
    *(void *)(v30 + 40) = v37;
    *(void *)(v30 + 48) = v26;
    *(void *)(v30 + 56) = v27;
    *(unsigned char *)(v30 + 64) = v28;
    *(void *)(v30 + 72) = v4;
    *(void *)(v30 + 80) = v31;
    uint64_t v33 = v31;
    *(void *)(v30 + 88) = v45;
    *(void *)(v30 + 96) = v62;
    *(void *)(v30 + 104) = v43;
    *(void *)(v30 + 112) = v51;
    *(void *)(v30 + 120) = v40;
    *(void *)(v30 + 128) = v39;
    uint64_t v34 = type metadata accessor for DictionaryEncoderImplementation();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v58;
    *(void *)(v35 + 24) = v60;
    *(void *)(v35 + 32) = v25;
    *(void *)(v35 + 40) = v37;
    *(void *)(v35 + 48) = v56;
    *(void *)(v35 + 56) = v47;
    *(unsigned char *)(v35 + 64) = v28;
    *(void *)(v35 + 72) = v4;
    *(void *)(v35 + 80) = v33;
    *(void *)(v35 + 88) = sub_1B8F54A50;
    *(void *)(v35 + 96) = v29;
    *(void *)(v35 + 104) = sub_1B8F54A6C;
    *(void *)(v35 + 112) = v32;
    *(void *)(v35 + 120) = v40;
    *(void *)(v35 + 128) = v39;
    uint64_t v64 = v34;
    unint64_t v65 = sub_1B8F49FC4();
    v63[0] = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v25);
    sub_1B8F2C560(v56, v47, v28);
    sub_1B8F2C708((unint64_t)v4);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v25);
    sub_1B8F2C560(v56, v47, v28);
    sub_1B8F2C708((unint64_t)v4);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1B8F2C708((unint64_t)v4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v25);
    sub_1B8F2C560(v56, v47, v28);
    sub_1B8F2C708((unint64_t)v4);
    swift_retain();
    swift_retain();
    v4(a1, a2, v63);
    sub_1B8F2C76C((unint64_t)v4);
    swift_release();
  }
  else
  {
    uint64_t v10 = *v2;
    uint64_t v61 = *v2;
    uint64_t v11 = v2[2];
    uint64_t v12 = v2[3];
    uint64_t v14 = (void *)v2[4];
    uint64_t v13 = v2[5];
    uint64_t v36 = v11;
    uint64_t v38 = v13;
    uint64_t v41 = v2[11];
    uint64_t v15 = v2[13];
    uint64_t v46 = v2[10];
    uint64_t v49 = v2[12];
    uint64_t v42 = v2[9];
    uint64_t v44 = v15;
    uint64_t v55 = v2[14];
    uint64_t v57 = v2[1];
    char v16 = *((unsigned char *)v2 + 48);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v10;
    *(void *)(v17 + 24) = v57;
    *(void *)(v17 + 32) = v11;
    *(void *)(v17 + 40) = v12;
    *(void *)(v17 + 48) = v14;
    *(void *)(v17 + 56) = v13;
    uint64_t v59 = v14;
    *(unsigned char *)(v17 + 64) = v16;
    uint64_t v18 = v66;
    *(void *)(v17 + 72) = 0;
    *(void *)(v17 + 80) = v18;
    *(void *)(v17 + 88) = v42;
    *(void *)(v17 + 96) = v46;
    *(void *)(v17 + 104) = v41;
    *(void *)(v17 + 112) = v49;
    *(void *)(v17 + 120) = v15;
    *(void *)(v17 + 128) = v55;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v61;
    *(void *)(v19 + 24) = v57;
    *(void *)(v19 + 32) = v11;
    *(void *)(v19 + 40) = v12;
    *(void *)(v19 + 48) = v14;
    *(void *)(v19 + 56) = v38;
    *(unsigned char *)(v19 + 64) = v16;
    *(void *)(v19 + 72) = 0;
    *(void *)(v19 + 80) = v18;
    *(void *)(v19 + 88) = v42;
    *(void *)(v19 + 96) = v46;
    *(void *)(v19 + 104) = v41;
    *(void *)(v19 + 112) = v49;
    *(void *)(v19 + 120) = v44;
    *(void *)(v19 + 128) = v55;
    uint64_t v20 = type metadata accessor for DictionaryEncoderImplementation();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v61;
    *(void *)(v21 + 24) = v57;
    *(void *)(v21 + 32) = v36;
    *(void *)(v21 + 40) = v12;
    *(void *)(v21 + 48) = v14;
    *(void *)(v21 + 56) = v38;
    *(unsigned char *)(v21 + 64) = v16;
    uint64_t v22 = v66;
    *(void *)(v21 + 72) = 0;
    *(void *)(v21 + 80) = v22;
    *(void *)(v21 + 88) = sub_1B8F54A50;
    *(void *)(v21 + 96) = v17;
    *(void *)(v21 + 104) = sub_1B8F54A6C;
    *(void *)(v21 + 112) = v19;
    *(void *)(v21 + 120) = v44;
    *(void *)(v21 + 128) = v55;
    uint64_t v64 = v20;
    unint64_t v65 = sub_1B8F49FC4();
    v63[0] = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v36);
    sub_1B8F2C560(v59, v38, v16);
    sub_1B8F2C708(0);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v36);
    sub_1B8F2C560(v59, v38, v16);
    sub_1B8F2C708(0);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v36);
    sub_1B8F2C560(v59, v38, v16);
    sub_1B8F2C708(0);
    swift_retain();
    sub_1B8F57190();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
}

void sub_1B8F52CF4(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = v1[4];
  uint64_t v3 = v1[5];
  int v5 = *((unsigned __int8 *)v1 + 48);
  uint64_t v65 = v3;
  if (!v5)
  {
    id v18 = (id)v4;
    uint64_t v19 = (void *)sub_1B8F571A0();
    id v20 = objc_msgSend(v18, sel_stringFromDate_, v19);

    uint64_t v61 = sub_1B8F574D0();
    uint64_t v22 = v21;

    uint64_t v23 = v2[2];
    unint64_t v47 = v2[7];
    uint64_t v50 = (void (*)(void *))v2[11];
    uint64_t v63 = MEMORY[0x1E4FBB1A0];
    v62[0] = v61;
    v62[1] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v23);
    sub_1B8F2C560((id)v4, v3, 0);
    sub_1B8F2C708(v47);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v50(v62);
    sub_1B8F0BCE4((uint64_t)v62);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B8F2C3C8(v23);
    uint64_t v24 = v65;
    sub_1B8F2C5DC((void *)v4, v65, 0);
    sub_1B8F2C76C(v47);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    sub_1B8F2C5DC((void *)v4, v24, 0);
    return;
  }
  if (v5 == 1)
  {
    uint64_t v6 = *v1;
    uint64_t v7 = v1[1];
    uint64_t v8 = v1[2];
    uint64_t v9 = v2[3];
    uint64_t v49 = v2[2];
    unint64_t v52 = v2[7];
    uint64_t v10 = v2[9];
    uint64_t v39 = v2[8];
    uint64_t v46 = v2[10];
    uint64_t v44 = v2[11];
    uint64_t v54 = v2[12];
    uint64_t v56 = v6;
    uint64_t v41 = v2[13];
    uint64_t v58 = v2[14];
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v6;
    *(void *)(v11 + 24) = v7;
    *(void *)(v11 + 32) = v8;
    *(void *)(v11 + 40) = v9;
    *(void *)(v11 + 48) = v4;
    *(void *)(v11 + 56) = v3;
    *(unsigned char *)(v11 + 64) = 1;
    *(void *)(v11 + 72) = v52;
    *(void *)(v11 + 80) = v39;
    *(void *)(v11 + 88) = v10;
    *(void *)(v11 + 96) = v46;
    *(void *)(v11 + 104) = v44;
    *(void *)(v11 + 112) = v54;
    *(void *)(v11 + 120) = v41;
    *(void *)(v11 + 128) = v58;
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v3;
    uint64_t v14 = v12;
    *(void *)(v12 + 16) = v6;
    *(void *)(v12 + 24) = v7;
    *(void *)(v12 + 32) = v49;
    *(void *)(v12 + 40) = v9;
    *(void *)(v12 + 48) = v4;
    *(void *)(v12 + 56) = v13;
    *(unsigned char *)(v12 + 64) = 1;
    *(void *)(v12 + 72) = v52;
    *(void *)(v12 + 80) = v39;
    *(void *)(v12 + 88) = v10;
    *(void *)(v12 + 96) = v46;
    *(void *)(v12 + 104) = v44;
    *(void *)(v12 + 112) = v54;
    *(void *)(v12 + 120) = v41;
    *(void *)(v12 + 128) = v58;
    uint64_t v15 = type metadata accessor for DictionaryEncoderImplementation();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v56;
    *(void *)(v16 + 24) = v7;
    *(void *)(v16 + 32) = v49;
    *(void *)(v16 + 40) = v9;
    uint64_t v17 = v65;
    *(void *)(v16 + 48) = v4;
    *(void *)(v16 + 56) = v17;
    *(unsigned char *)(v16 + 64) = 1;
    *(void *)(v16 + 72) = v52;
    *(void *)(v16 + 80) = v39;
    *(void *)(v16 + 88) = sub_1B8F54A50;
    *(void *)(v16 + 96) = v11;
    *(void *)(v16 + 104) = sub_1B8F54A6C;
    *(void *)(v16 + 112) = v14;
    *(void *)(v16 + 120) = v41;
    *(void *)(v16 + 128) = v58;
    uint64_t v63 = v15;
    unint64_t v64 = sub_1B8F49FC4();
    v62[0] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v49);
    sub_1B8F2C560((id)v4, v17, 1);
    sub_1B8F2C708(v52);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1B8F2C560((id)v4, v17, 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v49);
    sub_1B8F2C560((id)v4, v17, 1);
    sub_1B8F2C708(v52);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v49);
    sub_1B8F2C560((id)v4, v17, 1);
    sub_1B8F2C708(v52);
    swift_retain();
    swift_retain();
    ((void (*)(uint64_t, void *))v4)(a1, v62);
    sub_1B8F2C5DC((void *)v4, v17, 1);
    swift_release();
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
    return;
  }
  if (!(v4 | v3))
  {
    uint64_t v26 = *v1;
    uint64_t v27 = v1[1];
    uint64_t v29 = v1[2];
    uint64_t v28 = v1[3];
    uint64_t v53 = v2[2];
    unint64_t v55 = v2[7];
    uint64_t v30 = v2[9];
    uint64_t v45 = v2[10];
    uint64_t v48 = v2[12];
    uint64_t v51 = v2[8];
    uint64_t v42 = v2[13];
    uint64_t v43 = v2[11];
    uint64_t v57 = v2[14];
    uint64_t v59 = v26;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v26;
    *(void *)(v31 + 24) = v27;
    uint64_t v40 = v27;
    *(void *)(v31 + 32) = v29;
    *(void *)(v31 + 40) = v28;
    *(void *)(v31 + 48) = v4;
    *(void *)(v31 + 56) = v3;
    *(unsigned char *)(v31 + 64) = 2;
    *(void *)(v31 + 72) = v55;
    *(void *)(v31 + 80) = v51;
    *(void *)(v31 + 88) = v30;
    *(void *)(v31 + 96) = v45;
    *(void *)(v31 + 104) = v43;
    *(void *)(v31 + 112) = v48;
    *(void *)(v31 + 120) = v42;
    *(void *)(v31 + 128) = v57;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v59;
    *(void *)(v32 + 24) = v27;
    *(void *)(v32 + 32) = v53;
    *(void *)(v32 + 40) = v28;
    *(void *)(v32 + 48) = v4;
    *(void *)(v32 + 56) = v3;
    *(unsigned char *)(v32 + 64) = 2;
    *(void *)(v32 + 72) = v55;
    *(void *)(v32 + 80) = v51;
    *(void *)(v32 + 88) = v30;
    *(void *)(v32 + 96) = v45;
    *(void *)(v32 + 104) = v43;
    *(void *)(v32 + 112) = v48;
    *(void *)(v32 + 120) = v42;
    *(void *)(v32 + 128) = v57;
    uint64_t v33 = type metadata accessor for DictionaryEncoderImplementation();
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v59;
    *(void *)(v34 + 24) = v40;
    *(void *)(v34 + 32) = v53;
    *(void *)(v34 + 40) = v28;
    uint64_t v35 = v65;
    *(void *)(v34 + 48) = v4;
    *(void *)(v34 + 56) = v35;
    *(unsigned char *)(v34 + 64) = 2;
    *(void *)(v34 + 72) = v55;
    *(void *)(v34 + 80) = v51;
    *(void *)(v34 + 88) = sub_1B8F54A50;
    *(void *)(v34 + 96) = v31;
    *(void *)(v34 + 104) = sub_1B8F54A6C;
    *(void *)(v34 + 112) = v32;
    *(void *)(v34 + 120) = v42;
    *(void *)(v34 + 128) = v57;
    uint64_t v63 = v33;
    unint64_t v64 = sub_1B8F49FC4();
    v62[0] = v34;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v53);
    sub_1B8F2C560((id)v4, v65, 2);
    sub_1B8F2C708(v55);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v53);
    sub_1B8F2C560((id)v4, v65, 2);
    sub_1B8F2C708(v55);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B8F2C368(v53);
    sub_1B8F2C560((id)v4, v65, 2);
    sub_1B8F2C708(v55);
    swift_retain();
    sub_1B8F571F0();
    goto LABEL_9;
  }
  sub_1B8F571C0();
  if (v4 ^ 1 | v3) {
    double v25 = v25 * 1000.0;
  }
  uint64_t v36 = v1[2];
  unint64_t v37 = v1[7];
  uint64_t v38 = (void (*)(void *))v1[11];
  uint64_t v63 = MEMORY[0x1E4FBB3D0];
  *(double *)uint64_t v62 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v36);
  sub_1B8F2C560((id)v4, v65, 2);
  sub_1B8F2C708(v37);
  swift_retain();
  swift_retain();
  swift_retain();
  v38(v62);
  sub_1B8F0BCE4((uint64_t)v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v36);
  sub_1B8F2C5DC((void *)v4, v65, 2);
  sub_1B8F2C76C(v37);
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_1B8F5358C()
{
  return sub_1B8F523CC();
}

uint64_t sub_1B8F535A4(char a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  unint64_t v5 = *(void *)(v1 + 56);
  uint64_t v7 = *(void (**)(unsigned char *))(v1 + 88);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v10 = MEMORY[0x1E4FBB390];
  v9[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v2);
  sub_1B8F2C560(v3, v4, v8);
  sub_1B8F2C708(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v9);
  sub_1B8F0BCE4((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v2);
  sub_1B8F2C5DC(v3, v4, v8);
  sub_1B8F2C76C(v5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F536F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  unint64_t v5 = *(void **)(v2 + 32);
  uint64_t v4 = *(void *)(v2 + 40);
  unint64_t v6 = *(void *)(v2 + 56);
  uint64_t v9 = *(void (**)(void *))(v2 + 88);
  char v8 = *(unsigned char *)(v2 + 48);
  v10[3] = MEMORY[0x1E4FBB1A0];
  v10[0] = a1;
  v10[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v3);
  sub_1B8F2C560(v5, v4, v8);
  sub_1B8F2C708(v6);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v9(v10);
  sub_1B8F0BCE4((uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v3);
  sub_1B8F2C5DC(v5, v4, v8);
  sub_1B8F2C76C(v6);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F5385C(double a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  unint64_t v5 = *(void *)(v1 + 56);
  uint64_t v7 = *(void (**)(void *))(v1 + 88);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9[3] = MEMORY[0x1E4FBB3D0];
  *(double *)uint64_t v9 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v2);
  sub_1B8F2C560(v3, v4, v8);
  sub_1B8F2C708(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v9);
  sub_1B8F0BCE4((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v2);
  sub_1B8F2C5DC(v3, v4, v8);
  sub_1B8F2C76C(v5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F539AC(float a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void **)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  unint64_t v5 = *(void *)(v1 + 56);
  uint64_t v7 = *(void (**)(_DWORD *))(v1 + 88);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v10 = MEMORY[0x1E4FBB470];
  *(float *)uint64_t v9 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v2);
  sub_1B8F2C560(v3, v4, v8);
  sub_1B8F2C708(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  v7(v9);
  sub_1B8F0BCE4((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v2);
  sub_1B8F2C5DC(v3, v4, v8);
  sub_1B8F2C76C(v5);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F53AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F54038(a1, a2, a3, MEMORY[0x1E4FBB550]);
}

uint64_t sub_1B8F53B1C(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F53BF4(a1, a2, a3, MEMORY[0x1E4FBC098]);
}

uint64_t sub_1B8F53B3C(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F53D60(a1, a2, a3, MEMORY[0x1E4FBC0F8]);
}

uint64_t sub_1B8F53B5C(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F53ECC(a1, a2, a3, MEMORY[0x1E4FBC150]);
}

uint64_t sub_1B8F53B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F54038(a1, a2, a3, MEMORY[0x1E4FBC1C8]);
}

uint64_t sub_1B8F53B9C()
{
  return sub_1B8F57F40();
}

uint64_t sub_1B8F53BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F54038(a1, a2, a3, MEMORY[0x1E4FBB808]);
}

uint64_t sub_1B8F53BD4(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F53BF4(a1, a2, a3, MEMORY[0x1E4FBC358]);
}

uint64_t sub_1B8F53BF4(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void **)(v4 + 32);
  uint64_t v7 = *(void *)(v4 + 40);
  unint64_t v8 = *(void *)(v4 + 56);
  uint64_t v10 = *(void (**)(unsigned char *))(v4 + 88);
  char v11 = *(unsigned char *)(v4 + 48);
  uint64_t v13 = a4;
  v12[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v5);
  sub_1B8F2C560(v6, v7, v11);
  sub_1B8F2C708(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v12);
  sub_1B8F0BCE4((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v5);
  sub_1B8F2C5DC(v6, v7, v11);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F53D40(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F53D60(a1, a2, a3, MEMORY[0x1E4FBC450]);
}

uint64_t sub_1B8F53D60(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void **)(v4 + 32);
  uint64_t v7 = *(void *)(v4 + 40);
  unint64_t v8 = *(void *)(v4 + 56);
  uint64_t v10 = *(void (**)(_WORD *))(v4 + 88);
  char v11 = *(unsigned char *)(v4 + 48);
  uint64_t v13 = a4;
  v12[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v5);
  sub_1B8F2C560(v6, v7, v11);
  sub_1B8F2C708(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v12);
  sub_1B8F0BCE4((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v5);
  sub_1B8F2C5DC(v6, v7, v11);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F53EAC(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F53ECC(a1, a2, a3, MEMORY[0x1E4FBC4C0]);
}

uint64_t sub_1B8F53ECC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void **)(v4 + 32);
  uint64_t v7 = *(void *)(v4 + 40);
  unint64_t v8 = *(void *)(v4 + 56);
  uint64_t v10 = *(void (**)(_DWORD *))(v4 + 88);
  char v11 = *(unsigned char *)(v4 + 48);
  uint64_t v13 = a4;
  v12[0] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v5);
  sub_1B8F2C560(v6, v7, v11);
  sub_1B8F2C708(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v12);
  sub_1B8F0BCE4((uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v5);
  sub_1B8F2C5DC(v6, v7, v11);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F54018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B8F54038(a1, a2, a3, MEMORY[0x1E4FBC538]);
}

uint64_t sub_1B8F54038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void **)(v4 + 32);
  uint64_t v7 = *(void *)(v4 + 40);
  unint64_t v8 = *(void *)(v4 + 56);
  uint64_t v9 = *(void (**)(void *))(v4 + 88);
  v13[0] = a1;
  char v11 = v9;
  char v12 = *(unsigned char *)(v4 + 48);
  void v13[3] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v5);
  sub_1B8F2C560(v6, v7, v12);
  sub_1B8F2C708(v8);
  swift_retain();
  swift_retain();
  swift_retain();
  v11(v13);
  sub_1B8F0BCE4((uint64_t)v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8F2C3C8(v5);
  sub_1B8F2C5DC(v6, v7, v12);
  sub_1B8F2C76C(v8);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_1B8F54180()
{
  return sub_1B8F57F50();
}

uint64_t sub_1B8F54198(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  return sub_1B8F4CD40(a1, a2, a3);
}

uint64_t sub_1B8F541B0()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F541B8()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F541C0(uint64_t a1)
{
  return sub_1B8F52560(a1, v1 + 16);
}

uint64_t sub_1B8F541DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B8F54208(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 32);
  sub_1B8F2C368(*(void *)a1);
  sub_1B8F2C560(v2, v3, v5);
  sub_1B8F2C708(v4);
  return a1;
}

uint64_t sub_1B8F54270()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F54278()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F54280()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F54288()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F54290()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F54298()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F542A0()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F542A8()
{
  return objectdestroy_22Tm(136);
}

uint64_t sub_1B8F542B0()
{
  return objectdestroy_22Tm(144);
}

uint64_t objectdestroy_22Tm(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 32)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(v1 + 48), *(void *)(v1 + 56), *(unsigned char *)(v1 + 64));
  if (*(void *)(v1 + 72) >= 2uLL) {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v1, a1, 7);
}

void sub_1B8F5434C(uint64_t a1)
{
  sub_1B8F4EC80(a1, v1 + 16, *(void *)(v1 + 136));
}

uint64_t sub_1B8F5436C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

id sub_1B8F543A4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t sub_1B8F543B0()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

double sub_1B8F543F8@<D0>(_OWORD *a1@<X8>)
{
  return sub_1B8F519E4(*(void *)(v1 + 16), (void (**)(id *__return_ptr))(v1 + 24), a1);
}

uint64_t sub_1B8F54404()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

void sub_1B8F5444C(uint64_t a1)
{
  sub_1B8F51AC8(a1, (void (**)(void **__return_ptr))(v1 + 16), *(void *)(v1 + 64));
}

uint64_t sub_1B8F54470@<X0>(uint64_t a1@<X8>)
{
  return sub_1B8F4E488((void (**)(void **__return_ptr))(v1 + 16), *(void *)(v1 + 64), *(void *)(v1 + 72), a1);
}

void sub_1B8F54494(uint64_t a1)
{
  sub_1B8F4E564(a1, v1 + 16, *(void *)(v1 + 64), *(void *)(v1 + 72));
}

uint64_t sub_1B8F544BC(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_1B8F11244(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[5 * v9 + 4];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1E9EF3BF8);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1B8F57C00();
  __break(1u);
  return result;
}

id sub_1B8F54638@<X0>(void *a1@<X8>)
{
  return sub_1B8F4DE08((void (**)(void **__return_ptr))(v1 + 16), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void **)(v1 + 80), &qword_1E9EF5310, a1);
}

void sub_1B8F54670(uint64_t *a1)
{
  sub_1B8F4DF8C(a1, v1 + 16, *(void *)(v1 + 64), *(void *)(v1 + 72));
}

uint64_t objectdestroy_110Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 88, 7);
}

id sub_1B8F546EC@<X0>(void *a1@<X8>)
{
  return sub_1B8F4DE08((void (**)(void **__return_ptr))(v1 + 16), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void **)(v1 + 80), qword_1E9EF5318, a1);
}

uint64_t objectdestroy_98Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_1B8F54778()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B8F547B0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B8F547D8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 48)) {
    swift_release();
  }
  sub_1B8F2C5DC(*(void **)(v0 + 64), *(void *)(v0 + 72), *(unsigned char *)(v0 + 80));
  if (*(void *)(v0 + 88) >= 2uLL) {
    swift_release();
  }
  uint64_t v5 = (v3 + 152) & ~v3;
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v5, v1);
  return MEMORY[0x1F4186498](v0, v5 + v4, v3 | 7);
}

void sub_1B8F548F4(uint64_t a1)
{
  sub_1B8F4C204(a1, (long long *)(v1 + 32), v1+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80)));
}

uint64_t sub_1B8F5494C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void *)(a1 + 56);
  char v6 = *(unsigned char *)(a1 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B8F2C368(v2);
  sub_1B8F2C560(v3, v4, v6);
  sub_1B8F2C708(v5);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void sub_1B8F54A0C(uint64_t a1)
{
}

void sub_1B8F54A24(uint64_t *a1)
{
}

uint64_t sub_1B8F54A54()
{
  return sub_1B8F547B0();
}

uint64_t sub_1B8F54A6C(uint64_t a1)
{
  return sub_1B8F541C0(a1);
}

void RetryScheduler.schedule<A>(_:shouldRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a8 + 24) + **(int **)(a8 + 24);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v9;
  *uint64_t v9 = v8;
  v9[1] = sub_1B8F09BDC;
  __asm { BRAA            X9, X16 }
}

uint64_t sub_1B8F54BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *BOOL v13 = v6;
  v13[1] = sub_1B8F09BDC;
  return RetryScheduler.schedule<A>(_:)(a1, a2, a3, a5, a4, a6);
}

uint64_t RetryScheduler.schedule<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 16) + **(int **)(a6 + 16));
  BOOL v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *BOOL v13 = v6;
  v13[1] = sub_1B8F09BDC;
  return v15(a1, a2, a3, 0, 0, a5, a4, a6);
}

uint64_t dispatch thunk of RetryScheduler.schedule<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 8)
                                                                                     + **(int **)(a6 + 8));
  BOOL v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *BOOL v13 = v6;
  v13[1] = sub_1B8F09BDC;
  return v15(a1, a2, a3, a4, a5, a6);
}

void sub_1B8F54EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_1B8F09BDC;
  RetryScheduler.schedule<A>(_:shouldRetry:)(a1, a2, a3, a4, a5, a7, a6, a8);
}

uint64_t dispatch thunk of RetryScheduler.schedule<A>(_:shouldRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a8 + 16) + **(int **)(a8 + 16));
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_1B8F09BDC;
  return v19(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_1B8F5512C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_1B8F08F7C;
  RetryScheduler.schedule<A>(_:shouldRetry:)(a1, a2, a3, a4, a5, a7, a6, a8);
}

uint64_t dispatch thunk of RetryScheduler.schedule<A>(_:shouldRetry:willRetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a10 + 24) + **(int **)(a10 + 24));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v10 + 16) = v18;
  *uint64_t v18 = v10;
  v18[1] = sub_1B8F08F7C;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t dispatch thunk of SchedulerDelay.delay(nanoseconds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1B8F09BDC;
  return v9(a1, a2, a3);
}

ValueMetadata *type metadata accessor for AAFAnalyticsField()
{
  return &type metadata for AAFAnalyticsField;
}

void sub_1B8F55478()
{
  qword_1E9EF7310 = 0x6E6F697461727564;
  *(void *)algn_1E9EF7318 = 0xE800000000000000;
}

void sub_1B8F5549C()
{
  qword_1E9EF7320 = 0x6563637553646964;
  *(void *)algn_1E9EF7328 = 0xEA00000000006465;
}

void sub_1B8F554C4()
{
  qword_1E9EF7330 = 0x6D6F44726F727265;
  *(void *)algn_1E9EF7338 = 0xEB000000006E6961;
}

void sub_1B8F554F0()
{
  qword_1E9EF7340 = 0x646F43726F727265;
  *(void *)algn_1E9EF7348 = 0xE900000000000065;
}

Swift::Void __swiftcall OSActivity.close()()
{
  swift_beginAccess();
  os_activity_scope_leave((os_activity_scope_state_t)(v0 + 24));
  swift_endAccess();
}

uint64_t sub_1B8F55564()
{
  qword_1EB9C3680 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t OSActivity.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t method lookup function for OSActivity(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for OSActivity);
}

uint64_t sub_1B8F555D8(uint64_t a1)
{
  return sub_1B8F55628(a1, qword_1EB9C4200);
}

uint64_t sub_1B8F555FC(uint64_t a1)
{
  return sub_1B8F55628(a1, qword_1EB9C4218);
}

uint64_t sub_1B8F55628(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1B8F572D0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_1B8F572C0();
}

void sub_1B8F556B0()
{
  qword_1E9EF7350 = 3029639152;
  *(void *)algn_1E9EF7358 = 0xA400000000000000;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

int *LazyOptionalDependency.init(dependencyId:config:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(a5, 1, 1);
  uint64_t result = (int *)type metadata accessor for LazyOptionalDependency();
  *(unsigned char *)(a5 + result[7]) = 0;
  uint64_t v10 = (void *)(a5 + result[8]);
  *uint64_t v10 = a1;
  v10[1] = a2;
  *(void *)(a5 + result[9]) = a3;
  return result;
}

uint64_t type metadata accessor for LazyOptionalDependency()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t LazyOptionalDependency.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = sub_1B8F57980();
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = *(int *)(a1 + 28);
  if (*(unsigned char *)(v3 + v12) == 1)
  {
    BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    return v13(a2, v3, v7);
  }
  else
  {
    uint64_t v15 = (uint64_t *)(v3 + *(int *)(a1 + 32));
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v19 = v9;
    type metadata accessor for DependencyRegistry();
    static DependencyRegistry.locateService<A>(by:config:)(v16, v17, *(void *)(v3 + *(int *)(a1 + 36)), v6, (uint64_t)v11);
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 40))(v3, v11, v7);
    *(unsigned char *)(v3 + v12) = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(a2, v3, v7);
  }
}

uint64_t LazyOptionalDependency.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = sub_1B8F57980();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

void (*LazyOptionalDependency.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  unint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  void *v5 = v2;
  v5[1] = v6;
  uint64_t v7 = sub_1B8F57980();
  v5[2] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[3] = v8;
  size_t v9 = *(void *)(v8 + 64);
  void v5[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v5[5] = v10;
  LazyOptionalDependency.wrappedValue.getter(a2, (uint64_t)v10);
  return sub_1B8F44B44;
}

uint64_t LazyOptionalDependency.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_1B8F55B08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LazyOptionalDependency();
  MEMORY[0x1F4188790](v2, v3);
  unint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v8 - v4, a1, v2);
  return LazyOptionalDependency.projectedValue.setter((uint64_t)v5, v2);
}

uint64_t LazyOptionalDependency.projectedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t))(v7 + 8))(v2);
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  return v5(v2, a1, a2);
}

void (*LazyOptionalDependency.projectedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  unint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  void *v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = v6;
  v5[2] = v6;
  v5[3] = v6;
  size_t v8 = *(void *)(v6 + 64);
  void v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  (*(void (**)(void))(v7 + 16))();
  return sub_1B8F2B8B8;
}

uint64_t sub_1B8F55D74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for LazyOptionalDependency();
  return LazyOptionalDependency.projectedValue.getter(v2, a1);
}

uint64_t sub_1B8F55DB4()
{
  return 8;
}

void *sub_1B8F55DC0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1B8F55DCC()
{
  uint64_t result = sub_1B8F57980();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B8F55E78(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  int v8 = *(_DWORD *)(v6 + 80);
  if ((v8 & 0x1000F8) != 0 || (((v7 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *((unsigned char *)a1 + v7) = *((unsigned char *)a2 + v7);
    unint64_t v11 = ((unint64_t)a1 + v7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v12 = ((unint64_t)a2 + v7) & 0xFFFFFFFFFFFFFFF8;
    *(void *)(v11 + 8) = *(void *)(v12 + 8);
    *(void *)(v11 + 16) = *(void *)(v12 + 16);
    *(void *)((v11 + 31) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v12 + 31) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B8F56014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_1B8F560F8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(a1, a2, v5);
    unint64_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  unint64_t v13 = (unint64_t)&a1[v12];
  unint64_t v14 = (unint64_t)&a2[v12];
  *(unsigned char *)unint64_t v13 = *(unsigned char *)v14;
  v13 &= 0xFFFFFFFFFFFFFFF8;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  *(void *)(v13 + 16) = *(void *)(v14 + 16);
  *(void *)((v13 + 31) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v14 + 31) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_1B8F5624C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  unint64_t v14 = (unint64_t)&a1[v13];
  unint64_t v15 = (unint64_t)&a2[v13];
  *(unsigned char *)unint64_t v14 = *(unsigned char *)v15;
  unint64_t v16 = v14 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = v15 & 0xFFFFFFFFFFFFFFF8;
  *(void *)(v16 + 8) = *(void *)((v15 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(void *)(v16 + 16) = *(void *)((v15 & 0xFFFFFFFFFFFFFFF8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((v16 + 31) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v17 + 31) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1B8F56434(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(a1, a2, v5);
    size_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  unint64_t v13 = (unint64_t)&a1[v12];
  unint64_t v14 = (unint64_t)&a2[v12];
  *(unsigned char *)unint64_t v13 = *(unsigned char *)v14;
  v13 &= 0xFFFFFFFFFFFFFFF8;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)(v13 + 8) = *(_OWORD *)(v14 + 8);
  *(void *)((v13 + 31) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v14 + 31) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

char *sub_1B8F56574(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  unint64_t v14 = (unint64_t)&a1[v13];
  unint64_t v15 = (unint64_t)&a2[v13];
  *(unsigned char *)unint64_t v14 = *(unsigned char *)v15;
  unint64_t v16 = v14 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = v15 & 0xFFFFFFFFFFFFFFF8;
  *(void *)(v16 + 8) = *(void *)((v15 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(void *)(v16 + 16) = *(void *)((v15 & 0xFFFFFFFFFFFFFFF8) + 16);
  swift_bridgeObjectRelease();
  *(void *)((v16 + 31) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v17 + 31) & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B8F5674C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFE) {
    unsigned int v7 = 2147483646;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v8;
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = (((v8 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1B8F568DCLL);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_27:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFE)
  {
    unint64_t v19 = *(void *)((((unint64_t)a1 + v8) & 0xFFFFFFFFFFFFFFF8) + 16);
    if (v19 >= 0xFFFFFFFF) {
      LODWORD(v19) = -1;
    }
    if ((v19 + 1) >= 2) {
      return v19;
    }
    else {
      return 0;
    }
  }
  else
  {
    unsigned int v18 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v18 >= 2) {
      return v18 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_1B8F568F0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFE) {
    unsigned int v10 = 2147483646;
  }
  else {
    unsigned int v10 = v9;
  }
  size_t v11 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v11;
  }
  size_t v12 = (((v11 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v10 < a3)
  {
    unsigned int v13 = a3 - v10;
    if ((((v11 & 0xFFFFFFF8) + 31) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v6 = v15;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if ((((v11 & 0xFFFFFFF8) + 31) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v10;
    }
    else {
      int v16 = 1;
    }
    if ((((v11 & 0xFFFFFFF8) + 31) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v17 = ~v10 + a2;
      bzero(a1, v12);
      *(_DWORD *)a1 = v17;
    }
    switch(v6)
    {
      case 1:
        a1[v12] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v16;
        return;
      case 3:
        goto LABEL_58;
      case 4:
        *(_DWORD *)&a1[v12] = v16;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_58:
      __break(1u);
      JUMPOUT(0x1B8F56B88);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        if (v9 < 0x7FFFFFFE)
        {
          uint64_t v21 = (void *)(((unint64_t)&a1[v11] & 0xFFFFFFFFFFFFFFF8) + 8);
          if (a2 > 0x7FFFFFFE)
          {
            *uint64_t v21 = 0;
            v21[1] = 0;
            *(_DWORD *)uint64_t v21 = a2 - 0x7FFFFFFF;
          }
          else
          {
            v21[1] = a2;
          }
        }
        else if (v9 >= a2)
        {
          uint64_t v22 = *(void (**)(void))(v7 + 56);
          v22();
        }
        else
        {
          if (v11 <= 3) {
            int v18 = ~(-1 << (8 * v11));
          }
          else {
            int v18 = -1;
          }
          if (v11)
          {
            int v19 = v18 & (~v9 + a2);
            if (v11 <= 3) {
              int v20 = v11;
            }
            else {
              int v20 = 4;
            }
            bzero(a1, v11);
            switch(v20)
            {
              case 2:
                *(_WORD *)a1 = v19;
                break;
              case 3:
                *(_WORD *)a1 = v19;
                a1[2] = BYTE2(v19);
                break;
              case 4:
                *(_DWORD *)a1 = v19;
                break;
              default:
                *a1 = v19;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t dispatch thunk of MessageEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of MessageDecoder.decode<A>(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t XPCCodingError.UnexpectedType.expectedType.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t XPCCodingError.UnexpectedType.actualType.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t XPCCodingError.UnexpectedType.debugDescription.getter()
{
  return 0;
}

ValueMetadata *type metadata accessor for XPCCodingError()
{
  return &type metadata for XPCCodingError;
}

uint64_t destroy for XPCCodingError.UnexpectedType()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for XPCCodingError.UnexpectedType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for XPCCodingError.UnexpectedType(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for XPCCodingError.UnexpectedType(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCCodingError.UnexpectedType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCCodingError.UnexpectedType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodingError.UnexpectedType()
{
  return &type metadata for XPCCodingError.UnexpectedType;
}

uint64_t sub_1B8F56F20()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1B8F56F30()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1B8F56F40()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1B8F56F50()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1B8F56F60()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1B8F56F70()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1B8F56F80()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1B8F56F90()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1B8F56FA0()
{
  return MEMORY[0x1F40E40C8]();
}

uint64_t sub_1B8F56FB0()
{
  return MEMORY[0x1F40E40E0]();
}

uint64_t sub_1B8F56FC0()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1B8F56FD0()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1B8F56FE0()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1B8F56FF0()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1B8F57000()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1B8F57010()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1B8F57020()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1B8F57030()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B8F57040()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B8F57050()
{
  return MEMORY[0x1F40E4608]();
}

uint64_t sub_1B8F57060()
{
  return MEMORY[0x1F40E4620]();
}

uint64_t sub_1B8F57070()
{
  return MEMORY[0x1F40E4660]();
}

uint64_t sub_1B8F57080()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1B8F57090()
{
  return MEMORY[0x1F40E47B0]();
}

uint64_t sub_1B8F570A0()
{
  return MEMORY[0x1F40E47B8]();
}

uint64_t sub_1B8F570B0()
{
  return MEMORY[0x1F40E47C0]();
}

uint64_t sub_1B8F570C0()
{
  return MEMORY[0x1F40E47C8]();
}

uint64_t sub_1B8F570D0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1B8F570E0()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1B8F570F0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B8F57100()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1B8F57110()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B8F57120()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B8F57130()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1B8F57140()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B8F57150()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1B8F57160()
{
  return MEMORY[0x1F40E4D90]();
}

uint64_t sub_1B8F57170()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B8F57180()
{
  return MEMORY[0x1F40E4DB0]();
}

uint64_t sub_1B8F57190()
{
  return MEMORY[0x1F40E4E38]();
}

uint64_t sub_1B8F571A0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B8F571B0()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1B8F571C0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1B8F571D0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B8F571E0()
{
  return MEMORY[0x1F40E5300]();
}

uint64_t sub_1B8F571F0()
{
  return MEMORY[0x1F40E5310]();
}

uint64_t sub_1B8F57200()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B8F57210()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1B8F57220()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B8F57230()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B8F57240()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1B8F57250()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1B8F57260()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1B8F57270()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1B8F57280()
{
  return MEMORY[0x1F40E5718]();
}

uint64_t sub_1B8F57290()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1B8F572A0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B8F572B0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B8F572C0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B8F572D0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B8F572E0()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1B8F572F0()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1B8F57300()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B8F57310()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1B8F57320()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1B8F57330()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B8F57340()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1B8F57350()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B8F57360()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1B8F57370()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1B8F57380()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1B8F57390()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1B8F573A0()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1B8F573B0()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1B8F573C0()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1B8F573D0()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1B8F573E0()
{
  return MEMORY[0x1F40E5FE8]();
}

uint64_t sub_1B8F573F0()
{
  return MEMORY[0x1F40E5FF0]();
}

uint64_t sub_1B8F57400()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B8F57410()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1B8F57420()
{
  return MEMORY[0x1F4183510]();
}

uint64_t sub_1B8F57430()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B8F57440()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B8F57450()
{
  return MEMORY[0x1F4183678]();
}

uint64_t sub_1B8F57460()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B8F57470()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1B8F57480()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1B8F57490()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1B8F574A0()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1B8F574B0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B8F574C0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B8F574D0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B8F574E0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1B8F574F0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B8F57500()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1B8F57510()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1B8F57520()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1B8F57530()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B8F57540()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1B8F57550()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1B8F57560()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B8F57570()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1B8F57580()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B8F57590()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B8F575A0()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1B8F575B0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1B8F575C0()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1B8F575D0()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1B8F575E0()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1B8F57620()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B8F57630()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B8F57640()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1B8F57650()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B8F57660()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1B8F57670()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1B8F57680()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B8F57690()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1B8F576A0()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1B8F576B0()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1B8F576C0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B8F576D0()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1B8F576E0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B8F576F0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1B8F57700()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1B8F57710()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1B8F57720()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1B8F57730()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B8F57740()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B8F57780()
{
  return MEMORY[0x1F4187E58]();
}

uint64_t sub_1B8F57790()
{
  return MEMORY[0x1F4187E60]();
}

uint64_t sub_1B8F577B0()
{
  return MEMORY[0x1F4187F08]();
}

uint64_t sub_1B8F577C0()
{
  return MEMORY[0x1F4187F10]();
}

uint64_t sub_1B8F577D0()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1B8F577E0()
{
  return MEMORY[0x1F4184028]();
}

uint64_t sub_1B8F577F0()
{
  return MEMORY[0x1F4184058]();
}

uint64_t sub_1B8F57800()
{
  return MEMORY[0x1F4184090]();
}

uint64_t sub_1B8F57810()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1B8F57820()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1B8F57830()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1B8F57840()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1B8F57850()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1B8F57860()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B8F57870()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B8F57880()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B8F57890()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1B8F578A0()
{
  return MEMORY[0x1F40E66D8]();
}

uint64_t sub_1B8F578B0()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1B8F578C0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B8F578D0()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1B8F578E0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B8F578F0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1B8F57900()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B8F57910()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1B8F57920()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1B8F57930()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1B8F57940()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B8F57950()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1B8F57960()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1B8F57970()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1B8F57980()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B8F57990()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1B8F579A0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B8F579B0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B8F579C0()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1B8F579D0()
{
  return MEMORY[0x1F40E6DA0]();
}

uint64_t sub_1B8F579E0()
{
  return MEMORY[0x1F40E6DA8]();
}

uint64_t sub_1B8F579F0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B8F57A00()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1B8F57A10()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1B8F57A20()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B8F57A30()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B8F57A40()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B8F57A50()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1B8F57A60()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B8F57A70()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1B8F57A80()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1B8F57A90()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1B8F57AA0()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1B8F57AB0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B8F57AC0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B8F57AD0()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B8F57AE0()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1B8F57AF0()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1B8F57B00()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B8F57B10()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B8F57B20()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1B8F57B30()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1B8F57B40()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1B8F57B50()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1B8F57B60()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1B8F57B70()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1B8F57B80()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t sub_1B8F57B90()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1B8F57BA0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B8F57BB0()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B8F57BC0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B8F57BD0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B8F57BE0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B8F57BF0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B8F57C00()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B8F57C10()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1B8F57C30()
{
  return MEMORY[0x1F4188088]();
}

uint64_t sub_1B8F57C40()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B8F57C50()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B8F57C60()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B8F57C70()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1B8F57C80()
{
  return MEMORY[0x1F41855F8]();
}

uint64_t sub_1B8F57C90()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B8F57CA0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B8F57CB0()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1B8F57CC0()
{
  return MEMORY[0x1F4185718]();
}

uint64_t sub_1B8F57CD0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B8F57CE0()
{
  return MEMORY[0x1F4185828]();
}

uint64_t sub_1B8F57CF0()
{
  return MEMORY[0x1F4185830]();
}

uint64_t sub_1B8F57D00()
{
  return MEMORY[0x1F4185838]();
}

uint64_t sub_1B8F57D10()
{
  return MEMORY[0x1F4185840]();
}

uint64_t sub_1B8F57D20()
{
  return MEMORY[0x1F4185848]();
}

uint64_t sub_1B8F57D30()
{
  return MEMORY[0x1F4185850]();
}

uint64_t sub_1B8F57D40()
{
  return MEMORY[0x1F4185858]();
}

uint64_t sub_1B8F57D50()
{
  return MEMORY[0x1F4185860]();
}

uint64_t sub_1B8F57D60()
{
  return MEMORY[0x1F4185868]();
}

uint64_t sub_1B8F57D70()
{
  return MEMORY[0x1F4185870]();
}

uint64_t sub_1B8F57D80()
{
  return MEMORY[0x1F4185908]();
}

uint64_t sub_1B8F57D90()
{
  return MEMORY[0x1F4185910]();
}

uint64_t sub_1B8F57DA0()
{
  return MEMORY[0x1F4185918]();
}

uint64_t sub_1B8F57DB0()
{
  return MEMORY[0x1F4185920]();
}

uint64_t sub_1B8F57DC0()
{
  return MEMORY[0x1F4185928]();
}

uint64_t sub_1B8F57DD0()
{
  return MEMORY[0x1F4185930]();
}

uint64_t sub_1B8F57DE0()
{
  return MEMORY[0x1F4185938]();
}

uint64_t sub_1B8F57DF0()
{
  return MEMORY[0x1F4185940]();
}

uint64_t sub_1B8F57E00()
{
  return MEMORY[0x1F4185948]();
}

uint64_t sub_1B8F57E10()
{
  return MEMORY[0x1F4185950]();
}

uint64_t sub_1B8F57E20()
{
  return MEMORY[0x1F4185958]();
}

uint64_t sub_1B8F57E30()
{
  return MEMORY[0x1F4185960]();
}

uint64_t sub_1B8F57E40()
{
  return MEMORY[0x1F4185968]();
}

uint64_t sub_1B8F57E50()
{
  return MEMORY[0x1F4185970]();
}

uint64_t sub_1B8F57E60()
{
  return MEMORY[0x1F4185978]();
}

uint64_t sub_1B8F57E70()
{
  return MEMORY[0x1F4185980]();
}

uint64_t sub_1B8F57E80()
{
  return MEMORY[0x1F4185988]();
}

uint64_t sub_1B8F57E90()
{
  return MEMORY[0x1F4185990]();
}

uint64_t sub_1B8F57EA0()
{
  return MEMORY[0x1F4185998]();
}

uint64_t sub_1B8F57EB0()
{
  return MEMORY[0x1F41859A0]();
}

uint64_t sub_1B8F57EC0()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1B8F57ED0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B8F57EE0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B8F57F00()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1B8F57F10()
{
  return MEMORY[0x1F4185AC8]();
}

uint64_t sub_1B8F57F20()
{
  return MEMORY[0x1F4185AD0]();
}

uint64_t sub_1B8F57F30()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1B8F57F40()
{
  return MEMORY[0x1F4185B70]();
}

uint64_t sub_1B8F57F50()
{
  return MEMORY[0x1F4185B78]();
}

uint64_t sub_1B8F57F70()
{
  return MEMORY[0x1F4185BE8]();
}

uint64_t sub_1B8F57F80()
{
  return MEMORY[0x1F4185BF0]();
}

uint64_t sub_1B8F57F90()
{
  return MEMORY[0x1F4185BF8]();
}

uint64_t sub_1B8F57FA0()
{
  return MEMORY[0x1F4185C00]();
}

uint64_t sub_1B8F57FB0()
{
  return MEMORY[0x1F4185C08]();
}

uint64_t sub_1B8F57FC0()
{
  return MEMORY[0x1F4185C10]();
}

uint64_t sub_1B8F57FD0()
{
  return MEMORY[0x1F4185C18]();
}

uint64_t sub_1B8F57FE0()
{
  return MEMORY[0x1F4185C20]();
}

uint64_t sub_1B8F57FF0()
{
  return MEMORY[0x1F4185C28]();
}

uint64_t sub_1B8F58000()
{
  return MEMORY[0x1F4185C30]();
}

uint64_t sub_1B8F58010()
{
  return MEMORY[0x1F4185C88]();
}

uint64_t sub_1B8F58020()
{
  return MEMORY[0x1F4185C90]();
}

uint64_t sub_1B8F58030()
{
  return MEMORY[0x1F4185C98]();
}

uint64_t sub_1B8F58040()
{
  return MEMORY[0x1F4185CA0]();
}

uint64_t sub_1B8F58050()
{
  return MEMORY[0x1F4185CA8]();
}

uint64_t sub_1B8F58060()
{
  return MEMORY[0x1F4185CB0]();
}

uint64_t sub_1B8F58070()
{
  return MEMORY[0x1F4185CB8]();
}

uint64_t sub_1B8F58080()
{
  return MEMORY[0x1F4185CC0]();
}

uint64_t sub_1B8F58090()
{
  return MEMORY[0x1F4185CC8]();
}

uint64_t sub_1B8F580A0()
{
  return MEMORY[0x1F4185CD0]();
}

uint64_t sub_1B8F580B0()
{
  return MEMORY[0x1F4185CD8]();
}

uint64_t sub_1B8F580C0()
{
  return MEMORY[0x1F4185CE0]();
}

uint64_t sub_1B8F580D0()
{
  return MEMORY[0x1F4185CE8]();
}

uint64_t sub_1B8F580F0()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1B8F58100()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B8F58110()
{
  return MEMORY[0x1F4188170]();
}

uint64_t sub_1B8F58130()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1B8F58140()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B8F58150()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B8F58160()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B8F58170()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B8F58180()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B8F58190()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B8F581A0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B8F581B0()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1B8F581C0()
{
  return MEMORY[0x1F4185F70]();
}

uint64_t _s18AAAFoundationSwift13CodableResultVAASQRzSQR_rlE2eeoiySbACyxq_G_AEtFZ_0()
{
  return MEMORY[0x1F4185F78]();
}

uint64_t sub_1B8F581E0()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1B8F581F0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B8F58200()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1B8F58210()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1B8F58220()
{
  return MEMORY[0x1F4186288]();
}

uint64_t sub_1B8F58230()
{
  return MEMORY[0x1F4186290]();
}

uint64_t sub_1B8F58260()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t CFPhoneNumberGetITUCountryCodeForISOCountryCode()
{
  return MEMORY[0x1F4114230]();
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1F4114238]();
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return MEMORY[0x1F4114250]();
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x1F4114268]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x1F41865D0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}