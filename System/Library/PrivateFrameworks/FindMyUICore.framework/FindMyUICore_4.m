uint64_t sub_24E81B03C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_24E863D98();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x253341D80](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_24E81B0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24E863DA8();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_24E81B474();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_24E864578();
  }
LABEL_7:
  v11 = sub_24E81B1F8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_24E81B1A0()
{
  unint64_t result = qword_2698F3810;
  if (!qword_2698F3810)
  {
    sub_24E8616F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2698F3810);
  }
  return result;
}

unsigned __int8 *sub_24E81B1F8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_24E81B474()
{
  unint64_t v0 = sub_24E863DB8();
  uint64_t v4 = sub_24E81B4F4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24E81B4F4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_24E81B64C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_24E81AFD4(v9, 0);
      unint64_t v12 = sub_24E81B74C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24E864578();
LABEL_4:
        JUMPOUT(0x253341D10);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x253341D10](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x253341D10]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_24E81B64C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_24E81B03C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_24E81B03C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_24E81B74C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_24E81B03C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_24E863D88();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_24E864578();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    unint64_t result = sub_24E81B03C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24E863D58();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24E81B960(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t PeopleRelationshipsProvider.Subscription.Identifier.init(rawValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24E861248();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t PeopleRelationshipsProvider.RelationshipState.loadedState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState(0);
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E81BCD0(v2, (uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24E81C368((uint64_t)v6, a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
    uint64_t v7 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
  }
  else
  {
    uint64_t v9 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.RelationshipState(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F86D0);
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F86E0);
}

uint64_t PeopleRelationshipsProvider.RelationshipState.FollowingState.isActive.getter()
{
  uint64_t v1 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E81BCD0(v0, (uint64_t)v3, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    if (EnumCaseMultiPayload != 1) {
      return v6;
    }
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70);
    sub_24E563530((uint64_t)&v3[*(int *)(v7 + 48)], (uint64_t *)&unk_2698F0F90);
    uint64_t v5 = 1;
  }
  sub_24E563530((uint64_t)v3, (uint64_t *)&unk_2698F0F90);
  return v5;
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F8720);
}

uint64_t sub_24E81BCD0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t PeopleRelationshipsProvider.RelationshipState.FollowerState.isActive.getter()
{
  uint64_t v1 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E81BCD0(v0, (uint64_t)v3, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = 0;
  if ((EnumCaseMultiPayload - 1) < 2) {
    goto LABEL_4;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70);
    sub_24E563530((uint64_t)&v3[*(int *)(v6 + 48)], (uint64_t *)&unk_2698F0F90);
    uint64_t v5 = 1;
LABEL_4:
    sub_24E563530((uint64_t)v3, (uint64_t *)&unk_2698F0F90);
  }
  return v5;
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F8710);
}

uint64_t PeopleRelationshipsProvider.Subscription.Identifier.rawValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24E861248();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t PeopleRelationshipsProvider.Subscription.Identifier.hash(into:)()
{
  sub_24E861248();
  sub_24E81EF24((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);

  return sub_24E863BB8();
}

uint64_t PeopleRelationshipsProvider.Subscription.Identifier.hashValue.getter()
{
  return sub_24E864A98();
}

uint64_t sub_24E81BFBC()
{
  return sub_24E864A98();
}

uint64_t sub_24E81C044()
{
  sub_24E861248();
  sub_24E81EF24((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);

  return sub_24E863BB8();
}

uint64_t sub_24E81C0C8()
{
  return sub_24E864A98();
}

uint64_t PeopleRelationshipsProvider.Subscription.hash(into:)()
{
  uint64_t v1 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E81BCD0(v0, (uint64_t)v7, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1) {
    return sub_24E864A68();
  }
  sub_24E81C368((uint64_t)v7, (uint64_t)v4, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  sub_24E864A68();
  sub_24E861248();
  sub_24E81EF24((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  sub_24E863BB8();
  return sub_24E81D19C((uint64_t)v4, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F86C0);
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.Subscription(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F86B0);
}

uint64_t sub_24E81C368(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t PeopleRelationshipsProvider.Subscription.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E864A58();
  sub_24E81BCD0(v1, (uint64_t)v8, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_24E864A68();
  }
  else
  {
    sub_24E81C368((uint64_t)v8, (uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    sub_24E864A68();
    sub_24E861248();
    sub_24E81EF24((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    sub_24E81D19C((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  }
  return sub_24E864A98();
}

uint64_t sub_24E81C5D0()
{
  uint64_t v1 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E81BCD0(v0, (uint64_t)v7, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1) {
    return sub_24E864A68();
  }
  sub_24E81C368((uint64_t)v7, (uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  sub_24E864A68();
  sub_24E861248();
  sub_24E81EF24((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  sub_24E863BB8();
  return sub_24E81D19C((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
}

uint64_t sub_24E81C7A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E864A58();
  sub_24E81BCD0(v1, (uint64_t)v8, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_24E864A68();
  }
  else
  {
    sub_24E81C368((uint64_t)v8, (uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    sub_24E864A68();
    sub_24E861248();
    sub_24E81EF24((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    sub_24E81D19C((uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  }
  return sub_24E864A98();
}

uint64_t PeopleRelationshipsProvider.RelationshipState.isLoading.getter()
{
  uint64_t v1 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (unsigned __int8 *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E81BCD0(v0, (uint64_t)v3, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return *v3;
  }
  sub_24E81D19C((uint64_t)v3, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  return 0;
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24E81BCD0(v1, a1, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.followerState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  return sub_24E81BCD0(v1 + *(int *)(v3 + 20), a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.followerState.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  return sub_24E81D1FC(a1, v1 + *(int *)(v3 + 20), type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
}

uint64_t (*PeopleRelationshipsProvider.RelationshipState.LoadedState.followerState.modify())(void)
{
  return nullsub_1;
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.followingState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  return sub_24E81BCD0(v1 + *(int *)(v3 + 24), a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.followingState.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  return sub_24E81D1FC(a1, v1 + *(int *)(v3 + 24), type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
}

uint64_t (*PeopleRelationshipsProvider.RelationshipState.LoadedState.followingState.modify())(void)
{
  return nullsub_1;
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.favoriteOrder.getter()
{
  return *(void *)(v0
                   + *(int *)(type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0)
                            + 28));
}

uint64_t PeopleRelationshipsProvider.RelationshipState.LoadedState.favoriteOrder.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  uint64_t v6 = v2 + *(int *)(result + 28);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*PeopleRelationshipsProvider.RelationshipState.LoadedState.favoriteOrder.modify())(void)
{
  return nullsub_1;
}

uint64_t PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.friendshipType.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.favoriteOrder.getter()
{
  return *(void *)(v0
                   + *(int *)(type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0)
                            + 24));
}

uint64_t PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.expiryDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1
     + *(int *)(type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0) + 28);

  return sub_24E55A1F0(v3, a1);
}

uint64_t PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.createdDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1
     + *(int *)(type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0) + 32);

  return sub_24E55A1F0(v3, a1);
}

BOOL static PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.FriendshipType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.FriendshipType.hash(into:)()
{
  return sub_24E864A68();
}

uint64_t PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.FriendshipType.hashValue.getter()
{
  return sub_24E864A98();
}

uint64_t _s12FindMyUICore27PeopleRelationshipsProviderC12SubscriptionO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70D8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_24E81BCD0(a1, (uint64_t)v14, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  sub_24E81BCD0(a2, v15, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) != 1)
  {
    sub_24E81BCD0((uint64_t)v14, (uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    if (v16(v15, 1, v4) != 1)
    {
      sub_24E81C368(v15, (uint64_t)v7, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
      sub_24E81D19C((uint64_t)v7, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      sub_24E81D19C((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      sub_24E81D19C((uint64_t)v14, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      return MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 & 1;
    }
    sub_24E81D19C((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_24E563530((uint64_t)v14, &qword_2698F70D8);
    char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = 0;
    return MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 & 1;
  }
  sub_24E81D19C((uint64_t)v14, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = 1;
  return MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 & 1;
}

uint64_t sub_24E81D19C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E81D1FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t _s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v26 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8730);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = &v16[*(int *)(v14 + 56)];
  sub_24E81BCD0(a1, (uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  sub_24E81BCD0(a2, (uint64_t)v17, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24E81BCD0((uint64_t)v16, (uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_24E81C368((uint64_t)v17, (uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
      if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) == 0
        || (_s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO08FollowerH0O2eeoiySbAG_AGtFZ_0((uint64_t)&v10[v4[5]], (uint64_t)&v6[v4[5]]) & 1) == 0|| (_s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO09FollowingH0O2eeoiySbAG_AGtFZ_0((uint64_t)&v10[v4[6]], (uint64_t)&v6[v4[6]]) & 1) == 0)
      {
        goto LABEL_8;
      }
      uint64_t v18 = v4[7];
      uint64_t v19 = &v10[v18];
      char v20 = v10[v18 + 8];
      uint64_t v21 = &v6[v18];
      int v22 = v6[v18 + 8];
      if (v20)
      {
        if (!v22)
        {
LABEL_8:
          sub_24E81D19C((uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
          sub_24E81D19C((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
          sub_24E81D19C((uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
LABEL_13:
          char v24 = 0;
          return v24 & 1;
        }
      }
      else
      {
        if (*(void *)v19 != *(void *)v21) {
          LOBYTE(v22) = 1;
        }
        if (v22) {
          goto LABEL_8;
        }
      }
      sub_24E81D19C((uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
      sub_24E81D19C((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
      sub_24E81D19C((uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
      char v24 = 1;
      return v24 & 1;
    }
    sub_24E81D19C((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState);
LABEL_12:
    sub_24E563530((uint64_t)v16, &qword_2698F8730);
    goto LABEL_13;
  }
  sub_24E81BCD0((uint64_t)v16, (uint64_t)v12, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  if (swift_getEnumCaseMultiPayload() == 1) {
    goto LABEL_12;
  }
  char v23 = *v12 ^ *v17;
  sub_24E81D19C((uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
  char v24 = v23 ^ 1;
  return v24 & 1;
}

uint64_t _s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO09FollowingH0O2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  v81 = (char *)a1;
  v82 = (char *)a2;
  uint64_t v78 = sub_24E8616F8();
  uint64_t v80 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  v74 = (char *)&v71 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3800);
  uint64_t v3 = MEMORY[0x270FA5388](v79);
  v76 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v72 = (uint64_t)&v71 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v77 = (uint64_t)&v71 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v73 = (uint64_t)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v75 = (char *)&v71 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v71 = (uint64_t)&v71 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v71 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  char v20 = (char *)&v71 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  char v23 = (char *)&v71 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v71 - v24;
  uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  v29 = (char *)&v71 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v31 = (char *)&v71 - v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8738);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  v35 = (char *)&v71 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = (uint64_t)&v35[*(int *)(v33 + 56)];
  sub_24E81BCD0((uint64_t)v81, (uint64_t)v35, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
  sub_24E81BCD0((uint64_t)v82, v36, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v81 = v17;
    v82 = v23;
    sub_24E81BCD0((uint64_t)v35, (uint64_t)v31, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
    uint64_t v44 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    if (swift_getEnumCaseMultiPayload())
    {
      sub_24E563530((uint64_t)&v31[v44], (uint64_t *)&unk_2698F0F90);
      goto LABEL_13;
    }
    v76 = v35;
    uint64_t v47 = (uint64_t)v25;
    sub_24E55A3F4(v36, (uint64_t)v25);
    uint64_t v48 = (uint64_t)v82;
    sub_24E55A3F4((uint64_t)&v31[v44], (uint64_t)v82);
    uint64_t v49 = v36 + v44;
    uint64_t v50 = (uint64_t)v20;
    sub_24E55A3F4(v49, (uint64_t)v20);
    uint64_t v51 = v77;
    uint64_t v52 = v77 + *(int *)(v79 + 48);
    sub_24E55A3F4((uint64_t)v31, v77);
    sub_24E55A1F0((uint64_t)v25, v52);
    v53 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
    uint64_t v54 = v78;
    if (v53(v51, 1, v78) == 1)
    {
      if (v53(v52, 1, v54) == 1)
      {
        sub_24E563530(v77, (uint64_t *)&unk_2698F0F90);
        goto LABEL_29;
      }
    }
    else
    {
      v75 = v25;
      uint64_t v56 = (uint64_t)v81;
      sub_24E55A1F0(v51, (uint64_t)v81);
      if (v53(v52, 1, v54) != 1)
      {
        uint64_t v60 = v80;
        (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v74, v52, v54);
        sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
        char v61 = sub_24E863C18();
        v62 = *(void (**)(char *, uint64_t))(v60 + 8);
        v62(v74, v54);
        v62((char *)v56, v54);
        uint64_t v50 = (uint64_t)v20;
        uint64_t v48 = (uint64_t)v82;
        uint64_t v47 = (uint64_t)v25;
        sub_24E563530(v51, (uint64_t *)&unk_2698F0F90);
        if (v61)
        {
LABEL_29:
          uint64_t v63 = v72;
          uint64_t v64 = v72 + *(int *)(v79 + 48);
          sub_24E55A1F0(v48, v72);
          sub_24E55A1F0(v50, v64);
          if (v53(v63, 1, v54) == 1)
          {
            sub_24E563530(v50, (uint64_t *)&unk_2698F0F90);
            sub_24E563530(v48, (uint64_t *)&unk_2698F0F90);
            sub_24E563530(v47, (uint64_t *)&unk_2698F0F90);
            if (v53(v64, 1, v54) == 1)
            {
              sub_24E563530(v63, (uint64_t *)&unk_2698F0F90);
              uint64_t v45 = (uint64_t)v76;
              goto LABEL_11;
            }
          }
          else
          {
            uint64_t v65 = v71;
            sub_24E55A1F0(v63, v71);
            if (v53(v64, 1, v54) != 1)
            {
              uint64_t v66 = v80;
              uint64_t v67 = v50;
              v68 = v74;
              (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v74, v64, v54);
              sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
              char v69 = sub_24E863C18();
              v70 = *(void (**)(char *, uint64_t))(v66 + 8);
              v70(v68, v54);
              sub_24E563530(v67, (uint64_t *)&unk_2698F0F90);
              sub_24E563530((uint64_t)v82, (uint64_t *)&unk_2698F0F90);
              sub_24E563530(v47, (uint64_t *)&unk_2698F0F90);
              v70((char *)v65, v54);
              sub_24E563530(v63, (uint64_t *)&unk_2698F0F90);
              uint64_t v45 = (uint64_t)v76;
              if (v69) {
                goto LABEL_11;
              }
              goto LABEL_36;
            }
            sub_24E563530(v50, (uint64_t *)&unk_2698F0F90);
            sub_24E563530((uint64_t)v82, (uint64_t *)&unk_2698F0F90);
            sub_24E563530(v47, (uint64_t *)&unk_2698F0F90);
            (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v65, v54);
          }
          sub_24E563530(v63, &qword_2698F3800);
          uint64_t v45 = (uint64_t)v76;
LABEL_36:
          sub_24E81D19C(v45, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
          return 0;
        }
LABEL_25:
        sub_24E563530(v50, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v48, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v47, (uint64_t *)&unk_2698F0F90);
        sub_24E81D19C((uint64_t)v76, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
        return 0;
      }
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v56, v54);
      uint64_t v47 = (uint64_t)v75;
    }
    sub_24E563530(v77, &qword_2698F3800);
    goto LABEL_25;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (swift_getEnumCaseMultiPayload() == 2) {
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  sub_24E81BCD0((uint64_t)v35, (uint64_t)v29, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = (uint64_t)v75;
    sub_24E55A3F4(v36, (uint64_t)v75);
    uint64_t v39 = (uint64_t)v76;
    uint64_t v40 = (uint64_t)&v76[*(int *)(v79 + 48)];
    sub_24E55A3F4((uint64_t)v29, (uint64_t)v76);
    sub_24E55A1F0(v38, v40);
    uint64_t v41 = v80;
    v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
    uint64_t v43 = v78;
    if (v42(v39, 1, v78) == 1)
    {
      sub_24E563530(v38, (uint64_t *)&unk_2698F0F90);
      if (v42(v40, 1, v43) == 1)
      {
        sub_24E563530(v39, (uint64_t *)&unk_2698F0F90);
LABEL_10:
        uint64_t v45 = (uint64_t)v35;
LABEL_11:
        sub_24E81D19C(v45, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
        return 1;
      }
    }
    else
    {
      uint64_t v55 = v73;
      sub_24E55A1F0(v39, v73);
      if (v42(v40, 1, v43) != 1)
      {
        v57 = v74;
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v74, v40, v43);
        sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
        char v58 = sub_24E863C18();
        v59 = *(void (**)(char *, uint64_t))(v41 + 8);
        v59(v57, v43);
        sub_24E563530(v38, (uint64_t *)&unk_2698F0F90);
        v59((char *)v55, v43);
        sub_24E563530(v39, (uint64_t *)&unk_2698F0F90);
        if (v58) {
          goto LABEL_10;
        }
        goto LABEL_27;
      }
      sub_24E563530(v38, (uint64_t *)&unk_2698F0F90);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v55, v43);
    }
    sub_24E563530(v39, &qword_2698F3800);
LABEL_27:
    sub_24E81D19C((uint64_t)v35, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
    return 0;
  }
  v31 = v29;
LABEL_13:
  sub_24E563530((uint64_t)v31, (uint64_t *)&unk_2698F0F90);
LABEL_14:
  sub_24E563530((uint64_t)v35, &qword_2698F8738);
  return 0;
}

uint64_t _s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO08FollowerH0O2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v110 = a2;
  uint64_t v3 = sub_24E8616F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v108 = v3;
  uint64_t v109 = v4;
  MEMORY[0x270FA5388](v3);
  v100 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3800);
  uint64_t v6 = MEMORY[0x270FA5388](v107);
  uint64_t v102 = (uint64_t)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v101 = (uint64_t)&v95 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v96 = (uint64_t)&v95 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v105 = (uint64_t)&v95 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v99 = (uint64_t)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v95 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v98 = (uint64_t)&v95 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  char v23 = (char *)&v95 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v95 = (uint64_t)&v95 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v97 = (uint64_t)&v95 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v106 = (uint64_t)&v95 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v103 = (uint64_t)&v95 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v104 = (uint64_t)&v95 - v32;
  uint64_t v33 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  uint64_t v36 = (char *)&v95 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (char *)&v95 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v95 - v40;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8740);
  uint64_t v43 = MEMORY[0x270FA5388](v42 - 8);
  uint64_t v45 = (char *)&v95 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = (uint64_t)&v45[*(int *)(v43 + 56)];
  sub_24E81BCD0(a1, (uint64_t)v45, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  sub_24E81BCD0(v110, v46, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24E81BCD0((uint64_t)v45, (uint64_t)v39, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        uint64_t v41 = v39;
        goto LABEL_16;
      }
      sub_24E55A3F4(v46, (uint64_t)v23);
      uint64_t v48 = v101;
      uint64_t v49 = v101 + *(int *)(v107 + 48);
      sub_24E55A3F4((uint64_t)v39, v101);
      sub_24E55A1F0((uint64_t)v23, v49);
      uint64_t v50 = v108;
      uint64_t v51 = v109;
      uint64_t v52 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
      if (v52(v48, 1, v108) == 1)
      {
        sub_24E563530((uint64_t)v23, (uint64_t *)&unk_2698F0F90);
        if (v52(v49, 1, v50) == 1)
        {
          uint64_t v53 = v48;
          goto LABEL_37;
        }
        goto LABEL_23;
      }
      uint64_t v70 = v98;
      sub_24E55A1F0(v48, v98);
      if (v52(v49, 1, v50) == 1)
      {
        sub_24E563530((uint64_t)v23, (uint64_t *)&unk_2698F0F90);
        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v70, v50);
LABEL_23:
        sub_24E563530(v48, &qword_2698F3800);
        goto LABEL_44;
      }
      uint64_t v73 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v100, v49, v50);
      sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
      char v74 = sub_24E863C18();
      v75 = *(void (**)(char *, uint64_t))(v51 + 8);
      v75(v73, v50);
      sub_24E563530((uint64_t)v23, (uint64_t *)&unk_2698F0F90);
      v75((char *)v70, v50);
      uint64_t v76 = v48;
      goto LABEL_42;
    case 2u:
      sub_24E81BCD0((uint64_t)v45, (uint64_t)v36, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        uint64_t v41 = v36;
        goto LABEL_16;
      }
      sub_24E55A3F4(v46, (uint64_t)v18);
      uint64_t v54 = v102;
      uint64_t v55 = v102 + *(int *)(v107 + 48);
      sub_24E55A3F4((uint64_t)v36, v102);
      sub_24E55A1F0((uint64_t)v18, v55);
      uint64_t v56 = v108;
      uint64_t v57 = v109;
      char v58 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
      if (v58(v54, 1, v108) == 1)
      {
        sub_24E563530((uint64_t)v18, (uint64_t *)&unk_2698F0F90);
        if (v58(v55, 1, v56) == 1)
        {
          uint64_t v53 = v54;
          goto LABEL_37;
        }
        goto LABEL_26;
      }
      uint64_t v71 = v99;
      sub_24E55A1F0(v54, v99);
      if (v58(v55, 1, v56) == 1)
      {
        sub_24E563530((uint64_t)v18, (uint64_t *)&unk_2698F0F90);
        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v71, v56);
LABEL_26:
        sub_24E563530(v54, &qword_2698F3800);
        goto LABEL_44;
      }
      uint64_t v77 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v100, v55, v56);
      sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
      char v74 = sub_24E863C18();
      uint64_t v78 = *(void (**)(char *, uint64_t))(v57 + 8);
      v78(v77, v56);
      sub_24E563530((uint64_t)v18, (uint64_t *)&unk_2698F0F90);
      v78((char *)v71, v56);
      uint64_t v76 = v54;
      goto LABEL_42;
    case 3u:
      if (swift_getEnumCaseMultiPayload() == 3) {
        goto LABEL_43;
      }
      goto LABEL_17;
    default:
      sub_24E81BCD0((uint64_t)v45, (uint64_t)v41, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
      uint64_t v47 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_24E563530((uint64_t)&v41[v47], (uint64_t *)&unk_2698F0F90);
LABEL_16:
        sub_24E563530((uint64_t)v41, (uint64_t *)&unk_2698F0F90);
LABEL_17:
        sub_24E563530((uint64_t)v45, &qword_2698F8740);
        return 0;
      }
      uint64_t v59 = v46 + v47;
      uint64_t v60 = v104;
      sub_24E55A3F4(v46, v104);
      uint64_t v61 = v103;
      sub_24E55A3F4((uint64_t)&v41[v47], v103);
      sub_24E55A3F4(v59, v106);
      uint64_t v62 = v107;
      uint64_t v63 = v105 + *(int *)(v107 + 48);
      uint64_t v64 = (uint64_t)v41;
      uint64_t v65 = v105;
      sub_24E55A3F4(v64, v105);
      sub_24E55A1F0(v60, v63);
      uint64_t v66 = v108;
      uint64_t v67 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
      if (v67(v65, 1, v108) == 1)
      {
        int v68 = v67(v63, 1, v66);
        uint64_t v69 = v106;
        if (v68 == 1)
        {
          sub_24E563530(v105, (uint64_t *)&unk_2698F0F90);
          goto LABEL_34;
        }
        goto LABEL_29;
      }
      uint64_t v72 = v97;
      sub_24E55A1F0(v65, v97);
      if (v67(v63, 1, v66) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v72, v66);
        uint64_t v69 = v106;
LABEL_29:
        sub_24E563530(v105, &qword_2698F3800);
LABEL_30:
        sub_24E563530(v69, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v61, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v60, (uint64_t *)&unk_2698F0F90);
        goto LABEL_44;
      }
      uint64_t v79 = v109;
      uint64_t v80 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v109 + 32))(v100, v63, v66);
      sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
      char v81 = sub_24E863C18();
      v82 = *(void (**)(char *, uint64_t))(v79 + 8);
      v83 = v80;
      uint64_t v60 = v104;
      v82(v83, v66);
      v82((char *)v72, v66);
      uint64_t v61 = v103;
      sub_24E563530(v105, (uint64_t *)&unk_2698F0F90);
      uint64_t v69 = v106;
      if ((v81 & 1) == 0) {
        goto LABEL_30;
      }
LABEL_34:
      uint64_t v84 = *(int *)(v62 + 48);
      uint64_t v85 = v61;
      uint64_t v86 = v96;
      uint64_t v87 = v96 + v84;
      sub_24E55A1F0(v85, v96);
      sub_24E55A1F0(v69, v87);
      if (v67(v86, 1, v66) == 1)
      {
        sub_24E563530(v69, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v85, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v60, (uint64_t *)&unk_2698F0F90);
        if (v67(v87, 1, v66) == 1)
        {
          uint64_t v53 = v86;
LABEL_37:
          sub_24E563530(v53, (uint64_t *)&unk_2698F0F90);
LABEL_43:
          sub_24E81D19C((uint64_t)v45, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
          return 1;
        }
        goto LABEL_40;
      }
      uint64_t v88 = v95;
      sub_24E55A1F0(v86, v95);
      int v89 = v67(v87, 1, v66);
      uint64_t v90 = v109;
      if (v89 == 1)
      {
        sub_24E563530(v69, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v103, (uint64_t *)&unk_2698F0F90);
        sub_24E563530(v104, (uint64_t *)&unk_2698F0F90);
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v88, v66);
LABEL_40:
        sub_24E563530(v86, &qword_2698F3800);
        goto LABEL_44;
      }
      uint64_t v91 = v69;
      v92 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v109 + 32))(v100, v87, v66);
      sub_24E81EF24(&qword_2698F3810, MEMORY[0x263F07490]);
      char v74 = sub_24E863C18();
      v93 = *(void (**)(char *, uint64_t))(v90 + 8);
      v93(v92, v66);
      sub_24E563530(v91, (uint64_t *)&unk_2698F0F90);
      sub_24E563530(v103, (uint64_t *)&unk_2698F0F90);
      sub_24E563530(v104, (uint64_t *)&unk_2698F0F90);
      v93((char *)v88, v66);
      uint64_t v76 = v86;
LABEL_42:
      sub_24E563530(v76, (uint64_t *)&unk_2698F0F90);
      if (v74) {
        goto LABEL_43;
      }
LABEL_44:
      sub_24E81D19C((uint64_t)v45, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
      return 0;
  }
}

uint64_t _s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO06LoadedH0V2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  if ((_s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO08FollowerH0O2eeoiySbAG_AGtFZ_0(a1 + v4[5], a2 + v4[5]) & 1) == 0|| (_s12FindMyUICore27PeopleRelationshipsProviderC17RelationshipStateO09FollowingH0O2eeoiySbAG_AGtFZ_0(a1 + v4[6], a2 + v4[6]) & 1) == 0)
  {
    return 0;
  }
  uint64_t v5 = v4[7];
  uint64_t v6 = (void *)(a1 + v5);
  char v7 = *(unsigned char *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  char v9 = *(unsigned char *)(a2 + v5 + 8);
  if (v7)
  {
    if ((v9 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*v6 != *v8) {
      char v9 = 1;
    }
    if (v9) {
      return 0;
    }
  }
  return 1;
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F8700);
}

uint64_t sub_24E81EEDC()
{
  return sub_24E81EF24(&qword_2698F8698, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
}

uint64_t sub_24E81EF24(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E81EF6C()
{
  return sub_24E81EF24(&qword_2698F86A0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider.Subscription);
}

unint64_t sub_24E81EFB8()
{
  unint64_t result = qword_2698F86A8;
  if (!qword_2698F86A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F86A8);
  }
  return result;
}

uint64_t *_s12SubscriptionOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_24E861248();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t _s12SubscriptionOwxx(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_24E861248();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *_s12SubscriptionOwcp(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_24E861248();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *_s12SubscriptionOwca(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_24E861248();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_24E861248();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *_s12SubscriptionOwtk(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_24E861248();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *_s12SubscriptionOwta(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_24E861248();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_24E861248();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t _s12SubscriptionOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E81F7F8);
}

uint64_t sub_24E81F7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t _s12SubscriptionOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E81F878);
}

uint64_t sub_24E81F878(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_24E81F8F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_24E81F960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

uint64_t sub_24E81F9D0()
{
  uint64_t result = sub_24E861248();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t _s12SubscriptionO10IdentifierVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E81FA5C);
}

uint64_t sub_24E81FA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E861248();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t _s12SubscriptionO10IdentifierVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E81FADC);
}

uint64_t sub_24E81FADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E861248();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t *_s17RelationshipStateOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24E861248();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
      uint64_t v9 = v8[5];
      int v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v18 = sub_24E8616F8();
        uint64_t v19 = *(void *)(v18 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, v18))
        {
LABEL_11:
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
LABEL_19:
          swift_storeEnumTagMultiPayload();
          goto LABEL_23;
        }
      }
      else
      {
        if (EnumCaseMultiPayload != 1)
        {
          if (EnumCaseMultiPayload)
          {
            memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
          }
          else
          {
            uint64_t v14 = sub_24E8616F8();
            uint64_t v15 = *(void *)(v14 - 8);
            uint64_t v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
            uint64_t v46 = v8;
            if (v44(v11, 1, v14))
            {
              uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v10, v11, v14);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
            }
            uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
            uint64_t v22 = &v10[v21];
            char v23 = &v11[v21];
            if (v44(v23, 1, v14))
            {
              uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v22, v23, v14);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v22, 0, 1, v14);
            }
            swift_storeEnumTagMultiPayload();
            uint64_t v8 = v46;
          }
LABEL_23:
          uint64_t v25 = v8[6];
          uint64_t v26 = (char *)a1 + v25;
          uint64_t v27 = (char *)a2 + v25;
          uint64_t v28 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
          int v29 = swift_getEnumCaseMultiPayload();
          if (v29 == 1)
          {
            uint64_t v33 = sub_24E8616F8();
            uint64_t v34 = *(void *)(v33 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v27, 1, v33))
            {
              uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v26, v27, *(void *)(*(void *)(v35 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v26, v27, v33);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v26, 0, 1, v33);
            }
          }
          else
          {
            if (v29)
            {
              memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
LABEL_37:
              uint64_t v40 = v8[7];
              uint64_t v41 = (char *)a1 + v40;
              uint64_t v42 = (char *)a2 + v40;
              *(void *)uint64_t v41 = *(void *)v42;
              v41[8] = v42[8];
              swift_storeEnumTagMultiPayload();
              return a1;
            }
            uint64_t v30 = sub_24E8616F8();
            uint64_t v31 = *(void *)(v30 - 8);
            uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
            uint64_t v47 = v8;
            if (v45(v27, 1, v30))
            {
              uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v26, v27, *(void *)(*(void *)(v32 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v26, v27, v30);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v26, 0, 1, v30);
            }
            uint64_t v36 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
            uint64_t v37 = &v26[v36];
            uint64_t v38 = &v27[v36];
            if (v45(v38, 1, v30))
            {
              uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v37, v38, v30);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v37, 0, 1, v30);
            }
            uint64_t v8 = v47;
          }
          swift_storeEnumTagMultiPayload();
          goto LABEL_37;
        }
        uint64_t v18 = sub_24E8616F8();
        uint64_t v19 = *(void *)(v18 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, v18)) {
          goto LABEL_11;
        }
      }
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v10, v11, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
      goto LABEL_19;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t _s17RelationshipStateOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 1) {
    return result;
  }
  uint64_t v3 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
  uint64_t v5 = a1 + *(int *)(v4 + 20);
  type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_24E8616F8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_24E8616F8();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    if (!v9(v5, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    }
    v5 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    if (!v9(v5, 1, v7)) {
LABEL_10:
    }
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  }
LABEL_11:
  uint64_t v10 = a1 + *(int *)(v4 + 24);
  type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v11 = sub_24E8616F8();
    uint64_t v14 = *(void *)(v11 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v10, 1, v11);
    if (result) {
      return result;
    }
    goto LABEL_16;
  }
  if (!result)
  {
    uint64_t v11 = sub_24E8616F8();
    uint64_t v14 = *(void *)(v11 - 8);
    uint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    if (!v12(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v10, v11);
    }
    v10 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v12)(v10, 1, v11);
    if (!result)
    {
LABEL_16:
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
      return v13(v10, v11);
    }
  }
  return result;
}

char *_s17RelationshipStateOwcp(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24E861248();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    uint64_t v7 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
    uint64_t v8 = v7[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
      {
LABEL_9:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_17:
        swift_storeEnumTagMultiPayload();
        goto LABEL_21;
      }
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload)
        {
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          uint64_t v13 = sub_24E8616F8();
          uint64_t v14 = *(void *)(v13 - 8);
          uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
          uint64_t v44 = v7;
          if (v42(v10, 1, v13))
          {
            uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v9, v10, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
          }
          uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v20 = &v9[v19];
          uint64_t v21 = &v10[v19];
          if (v42(v21, 1, v13))
          {
            uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v21, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
          }
          swift_storeEnumTagMultiPayload();
          uint64_t v7 = v44;
        }
LABEL_21:
        uint64_t v23 = v7[6];
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
        int v27 = swift_getEnumCaseMultiPayload();
        if (v27 == 1)
        {
          uint64_t v31 = sub_24E8616F8();
          uint64_t v32 = *(void *)(v31 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v25, 1, v31))
          {
            uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v24, v25, *(void *)(*(void *)(v33 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v24, v25, v31);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v24, 0, 1, v31);
          }
        }
        else
        {
          if (v27)
          {
            memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_35:
            uint64_t v38 = v7[7];
            uint64_t v39 = &a1[v38];
            uint64_t v40 = &a2[v38];
            *(void *)uint64_t v39 = *(void *)v40;
            v39[8] = v40[8];
            swift_storeEnumTagMultiPayload();
            return a1;
          }
          uint64_t v28 = sub_24E8616F8();
          uint64_t v29 = *(void *)(v28 - 8);
          uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
          uint64_t v45 = v7;
          if (v43(v25, 1, v28))
          {
            uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v24, v25, v28);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
          }
          uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v35 = &v24[v34];
          uint64_t v36 = &v25[v34];
          if (v43(v36, 1, v28))
          {
            uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v35, v36, v28);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v35, 0, 1, v28);
          }
          uint64_t v7 = v45;
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_35;
      }
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16)) {
        goto LABEL_9;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v9, v10, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
    goto LABEL_17;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *_s17RelationshipStateOwca(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24E861248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
      uint64_t v8 = v7[5];
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v16 = sub_24E8616F8();
        uint64_t v17 = *(void *)(v16 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16)) {
          goto LABEL_10;
        }
      }
      else
      {
        if (EnumCaseMultiPayload != 1)
        {
          if (EnumCaseMultiPayload)
          {
            memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
            goto LABEL_22;
          }
          uint64_t v13 = sub_24E8616F8();
          uint64_t v14 = *(void *)(v13 - 8);
          uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
          uint64_t v45 = v7;
          if (v43(v10, 1, v13))
          {
            uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v9, v10, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
          }
          uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v20 = &v9[v19];
          uint64_t v21 = &v10[v19];
          if (v43(v21, 1, v13))
          {
            uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v21, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
          }
          uint64_t v7 = v45;
LABEL_21:
          swift_storeEnumTagMultiPayload();
LABEL_22:
          uint64_t v23 = v7[6];
          uint64_t v24 = &a1[v23];
          uint64_t v25 = &a2[v23];
          uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
          int v27 = swift_getEnumCaseMultiPayload();
          if (v27 == 1)
          {
            uint64_t v31 = sub_24E8616F8();
            uint64_t v32 = *(void *)(v31 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v25, 1, v31))
            {
              uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v24, v25, *(void *)(*(void *)(v33 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v24, v25, v31);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v24, 0, 1, v31);
            }
          }
          else
          {
            if (v27)
            {
              memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_36:
              uint64_t v38 = v7[7];
              uint64_t v39 = &a1[v38];
              uint64_t v40 = &a2[v38];
              uint64_t v41 = *(void *)v40;
              v39[8] = v40[8];
              *(void *)uint64_t v39 = v41;
              swift_storeEnumTagMultiPayload();
              return a1;
            }
            uint64_t v28 = sub_24E8616F8();
            uint64_t v29 = *(void *)(v28 - 8);
            uint64_t v44 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
            uint64_t v46 = v7;
            if (v44(v25, 1, v28))
            {
              uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v24, v25, v28);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
            }
            uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
            uint64_t v35 = &v24[v34];
            uint64_t v36 = &v25[v34];
            if (v44(v36, 1, v28))
            {
              uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v35, v36, v28);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v35, 0, 1, v28);
            }
            uint64_t v7 = v46;
          }
          swift_storeEnumTagMultiPayload();
          goto LABEL_36;
        }
        uint64_t v16 = sub_24E8616F8();
        uint64_t v17 = *(void *)(v16 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
        {
LABEL_10:
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
          goto LABEL_21;
        }
      }
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v9, v10, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      goto LABEL_21;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *_s17RelationshipStateOwtk(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24E861248();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
    uint64_t v8 = v7[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
      {
LABEL_9:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_17:
        swift_storeEnumTagMultiPayload();
        goto LABEL_21;
      }
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload)
        {
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          uint64_t v13 = sub_24E8616F8();
          uint64_t v14 = *(void *)(v13 - 8);
          uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
          uint64_t v44 = v7;
          if (v42(v10, 1, v13))
          {
            uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v9, v10, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
          }
          uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v20 = &v9[v19];
          uint64_t v21 = &v10[v19];
          if (v42(v21, 1, v13))
          {
            uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v20, v21, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
          }
          swift_storeEnumTagMultiPayload();
          uint64_t v7 = v44;
        }
LABEL_21:
        uint64_t v23 = v7[6];
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
        int v27 = swift_getEnumCaseMultiPayload();
        if (v27 == 1)
        {
          uint64_t v31 = sub_24E8616F8();
          uint64_t v32 = *(void *)(v31 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v25, 1, v31))
          {
            uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v24, v25, *(void *)(*(void *)(v33 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v24, v25, v31);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v24, 0, 1, v31);
          }
        }
        else
        {
          if (v27)
          {
            memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_35:
            uint64_t v38 = v7[7];
            uint64_t v39 = &a1[v38];
            uint64_t v40 = &a2[v38];
            *(void *)uint64_t v39 = *(void *)v40;
            v39[8] = v40[8];
            swift_storeEnumTagMultiPayload();
            return a1;
          }
          uint64_t v28 = sub_24E8616F8();
          uint64_t v29 = *(void *)(v28 - 8);
          uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
          uint64_t v45 = v7;
          if (v43(v25, 1, v28))
          {
            uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v24, v25, v28);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
          }
          uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v35 = &v24[v34];
          uint64_t v36 = &v25[v34];
          if (v43(v36, 1, v28))
          {
            uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v35, v36, v28);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v35, 0, 1, v28);
          }
          uint64_t v7 = v45;
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_35;
      }
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16)) {
        goto LABEL_9;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v9, v10, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
    goto LABEL_17;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *_s17RelationshipStateOwta(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24E861248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(0);
      uint64_t v8 = v7[5];
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v16 = sub_24E8616F8();
        uint64_t v17 = *(void *)(v16 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16)) {
          goto LABEL_10;
        }
      }
      else
      {
        if (EnumCaseMultiPayload != 1)
        {
          if (EnumCaseMultiPayload)
          {
            memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
            goto LABEL_22;
          }
          uint64_t v13 = sub_24E8616F8();
          uint64_t v14 = *(void *)(v13 - 8);
          uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
          uint64_t v44 = v7;
          if (v42(v10, 1, v13))
          {
            uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v9, v10, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
          }
          uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v20 = &v9[v19];
          uint64_t v21 = &v10[v19];
          if (v42(v21, 1, v13))
          {
            uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v20, v21, v13);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
          }
          uint64_t v7 = v44;
LABEL_21:
          swift_storeEnumTagMultiPayload();
LABEL_22:
          uint64_t v23 = v7[6];
          uint64_t v24 = &a1[v23];
          uint64_t v25 = &a2[v23];
          uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
          int v27 = swift_getEnumCaseMultiPayload();
          if (v27 == 1)
          {
            uint64_t v31 = sub_24E8616F8();
            uint64_t v32 = *(void *)(v31 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v25, 1, v31))
            {
              uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v24, v25, *(void *)(*(void *)(v33 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v24, v25, v31);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v24, 0, 1, v31);
            }
          }
          else
          {
            if (v27)
            {
              memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_36:
              uint64_t v38 = v7[7];
              uint64_t v39 = &a1[v38];
              uint64_t v40 = &a2[v38];
              *(void *)uint64_t v39 = *(void *)v40;
              v39[8] = v40[8];
              swift_storeEnumTagMultiPayload();
              return a1;
            }
            uint64_t v28 = sub_24E8616F8();
            uint64_t v29 = *(void *)(v28 - 8);
            uint64_t v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
            uint64_t v45 = v7;
            if (v43(v25, 1, v28))
            {
              uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v24, v25, v28);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
            }
            uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
            uint64_t v35 = &v24[v34];
            uint64_t v36 = &v25[v34];
            if (v43(v36, 1, v28))
            {
              uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
              memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v35, v36, v28);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v35, 0, 1, v28);
            }
            uint64_t v7 = v45;
          }
          swift_storeEnumTagMultiPayload();
          goto LABEL_36;
        }
        uint64_t v16 = sub_24E8616F8();
        uint64_t v17 = *(void *)(v16 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16))
        {
LABEL_10:
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
          goto LABEL_21;
        }
      }
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v9, v10, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v9, 0, 1, v16);
      goto LABEL_21;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_24E8226C8()
{
  uint64_t result = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.LoadedState(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *_s17RelationshipStateO11LoadedStateVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = sub_24E861248();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v18 = sub_24E8616F8();
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v10, 1, v18)) {
        goto LABEL_9;
      }
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload)
        {
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
          goto LABEL_20;
        }
        uint64_t v13 = sub_24E8616F8();
        uint64_t v14 = *(void *)(v13 - 8);
        uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
        uint64_t v45 = v14;
        if (v15(v10, 1, v13))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v9, v10, v13);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
        }
        uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
        uint64_t v22 = &v9[v21];
        uint64_t v23 = &v10[v21];
        if (v15(v23, 1, v13))
        {
          uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v22, v23, v13);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v22, 0, 1, v13);
        }
LABEL_19:
        swift_storeEnumTagMultiPayload();
LABEL_20:
        uint64_t v25 = a3[6];
        uint64_t v26 = (char *)a1 + v25;
        int v27 = (char *)a2 + v25;
        uint64_t v28 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
        int v29 = swift_getEnumCaseMultiPayload();
        if (v29 == 1)
        {
          uint64_t v34 = sub_24E8616F8();
          uint64_t v35 = *(void *)(v34 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v27, 1, v34))
          {
            uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v26, v27, *(void *)(*(void *)(v36 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v26, v27, v34);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v26, 0, 1, v34);
          }
        }
        else
        {
          if (v29)
          {
            memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
LABEL_33:
            uint64_t v41 = a3[7];
            uint64_t v42 = (char *)a1 + v41;
            uint64_t v43 = (char *)a2 + v41;
            *(void *)uint64_t v42 = *(void *)v43;
            v42[8] = v43[8];
            return a1;
          }
          uint64_t v30 = sub_24E8616F8();
          uint64_t v31 = *(void *)(v30 - 8);
          uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
          uint64_t v46 = v31;
          if (v32(v27, 1, v30))
          {
            uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v26, v27, *(void *)(*(void *)(v33 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v26, v27, v30);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v26, 0, 1, v30);
          }
          uint64_t v37 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
          uint64_t v38 = &v26[v37];
          uint64_t v39 = &v27[v37];
          if (v32(v39, 1, v30))
          {
            uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
            memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v38, v39, v30);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v38, 0, 1, v30);
          }
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_33;
      }
      uint64_t v18 = sub_24E8616F8();
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v10, 1, v18))
      {
LABEL_9:
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v9, v10, *(void *)(*(void *)(v20 - 8) + 64));
        goto LABEL_19;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v9, v10, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v9, 0, 1, v18);
    goto LABEL_19;
  }
  uint64_t v17 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t _s17RelationshipStateO11LoadedStateVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_24E8616F8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_24E8616F8();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    if (!v9(v5, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
    }
    v5 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    if (!v9(v5, 1, v7)) {
LABEL_9:
    }
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  }
LABEL_10:
  uint64_t v10 = a1 + *(int *)(a2 + 24);
  type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v12 = sub_24E8616F8();
    uint64_t v15 = *(void *)(v12 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v10, 1, v12);
    if (result) {
      return result;
    }
    goto LABEL_15;
  }
  if (!result)
  {
    uint64_t v12 = sub_24E8616F8();
    uint64_t v15 = *(void *)(v12 - 8);
    uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
    if (!v13(v10, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v10, v12);
    }
    v10 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(v10, 1, v12);
    if (!result)
    {
LABEL_15:
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
      return v14(v10, v12);
    }
  }
  return result;
}

uint64_t _s17RelationshipStateO11LoadedStateVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v16 = sub_24E8616F8();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16))
    {
LABEL_7:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v8, v9, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_15:
      swift_storeEnumTagMultiPayload();
      goto LABEL_19;
    }
LABEL_14:
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v8, v9, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
    goto LABEL_15;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v16 = sub_24E8616F8();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16)) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if (EnumCaseMultiPayload)
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_24E8616F8();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v43 = a3;
    if (v14(v9, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v9, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
    }
    uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t v20 = &v8[v19];
    uint64_t v21 = &v9[v19];
    if (v14(v21, 1, v12))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v20, v21, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
    a3 = v43;
  }
LABEL_19:
  uint64_t v23 = a3[6];
  uint64_t v24 = (char *)(a1 + v23);
  uint64_t v25 = (char *)(a2 + v23);
  uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  int v27 = swift_getEnumCaseMultiPayload();
  if (v27 == 1)
  {
    uint64_t v32 = sub_24E8616F8();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v25, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v24, v25, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v24, 0, 1, v32);
    }
LABEL_32:
    swift_storeEnumTagMultiPayload();
    goto LABEL_33;
  }
  if (!v27)
  {
    uint64_t v28 = sub_24E8616F8();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    uint64_t v44 = a3;
    if (v30(v25, 1, v28))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v24, v25, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
    }
    uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t v36 = &v24[v35];
    uint64_t v37 = &v25[v35];
    if (v30(v37, 1, v28))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v36, v37, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v36, 0, 1, v28);
    }
    a3 = v44;
    goto LABEL_32;
  }
  memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_33:
  uint64_t v39 = a3[7];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  *(void *)uint64_t v40 = *(void *)v41;
  *(unsigned char *)(v40 + 8) = *(unsigned char *)(v41 + 8);
  return a1;
}

uint64_t _s17RelationshipStateO11LoadedStateVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 == a2) {
    goto LABEL_34;
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  sub_24E81D19C(a1 + v7, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  uint64_t v10 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16))
      {
LABEL_8:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v8, v9, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_19:
        swift_storeEnumTagMultiPayload();
        goto LABEL_20;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v8, v9, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
      goto LABEL_19;
    case 1:
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16)) {
        goto LABEL_8;
      }
      goto LABEL_12;
    case 0:
      uint64_t v12 = sub_24E8616F8();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
      uint64_t v44 = a3;
      if (v14(v9, 1, v12))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v9, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
      }
      uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v20 = &v8[v19];
      uint64_t v21 = &v9[v19];
      if (v14(v21, 1, v12))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v20, v21, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
      }
      a3 = v44;
      goto LABEL_19;
  }
  memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
LABEL_20:
  uint64_t v23 = a3[6];
  uint64_t v24 = (char *)(a1 + v23);
  uint64_t v25 = (char *)(a2 + v23);
  sub_24E81D19C(a1 + v23, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
  uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  int v27 = swift_getEnumCaseMultiPayload();
  if (v27 == 1)
  {
    uint64_t v32 = sub_24E8616F8();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v25, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v24, v25, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v24, 0, 1, v32);
    }
LABEL_33:
    swift_storeEnumTagMultiPayload();
    goto LABEL_34;
  }
  if (!v27)
  {
    uint64_t v28 = sub_24E8616F8();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    uint64_t v45 = a3;
    if (v30(v25, 1, v28))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v24, v25, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
    }
    uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t v36 = &v24[v35];
    uint64_t v37 = &v25[v35];
    if (v30(v37, 1, v28))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v36, v37, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v36, 0, 1, v28);
    }
    a3 = v45;
    goto LABEL_33;
  }
  memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_34:
  uint64_t v39 = a3[7];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = (uint64_t *)(a2 + v39);
  uint64_t v42 = *v41;
  *(unsigned char *)(v40 + 8) = *((unsigned char *)v41 + 8);
  *(void *)uint64_t v40 = v42;
  return a1;
}

uint64_t _s17RelationshipStateO11LoadedStateVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v16 = sub_24E8616F8();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16))
    {
LABEL_7:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v8, v9, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_15:
      swift_storeEnumTagMultiPayload();
      goto LABEL_19;
    }
LABEL_14:
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v8, v9, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
    goto LABEL_15;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v16 = sub_24E8616F8();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16)) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if (EnumCaseMultiPayload)
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v12 = sub_24E8616F8();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    uint64_t v43 = a3;
    if (v14(v9, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v8, v9, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
    }
    uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t v20 = &v8[v19];
    uint64_t v21 = &v9[v19];
    if (v14(v21, 1, v12))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v21, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
    a3 = v43;
  }
LABEL_19:
  uint64_t v23 = a3[6];
  uint64_t v24 = (char *)(a1 + v23);
  uint64_t v25 = (char *)(a2 + v23);
  uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  int v27 = swift_getEnumCaseMultiPayload();
  if (v27 == 1)
  {
    uint64_t v32 = sub_24E8616F8();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v25, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v24, v25, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v24, 0, 1, v32);
    }
LABEL_32:
    swift_storeEnumTagMultiPayload();
    goto LABEL_33;
  }
  if (!v27)
  {
    uint64_t v28 = sub_24E8616F8();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    uint64_t v44 = a3;
    if (v30(v25, 1, v28))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v24, v25, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
    }
    uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t v36 = &v24[v35];
    uint64_t v37 = &v25[v35];
    if (v30(v37, 1, v28))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v36, v37, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v36, 0, 1, v28);
    }
    a3 = v44;
    goto LABEL_32;
  }
  memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_33:
  uint64_t v39 = a3[7];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  *(void *)uint64_t v40 = *(void *)v41;
  *(unsigned char *)(v40 + 8) = *(unsigned char *)(v41 + 8);
  return a1;
}

uint64_t _s17RelationshipStateO11LoadedStateVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 == a2) {
    goto LABEL_34;
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  sub_24E81D19C(a1 + v7, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  uint64_t v10 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16))
      {
LABEL_8:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v8, v9, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_19:
        swift_storeEnumTagMultiPayload();
        goto LABEL_20;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v8, v9, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
      goto LABEL_19;
    case 1:
      uint64_t v16 = sub_24E8616F8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v9, 1, v16)) {
        goto LABEL_8;
      }
      goto LABEL_12;
    case 0:
      uint64_t v12 = sub_24E8616F8();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
      uint64_t v43 = a3;
      if (v14(v9, 1, v12))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v8, v9, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
      }
      uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v20 = &v8[v19];
      uint64_t v21 = &v9[v19];
      if (v14(v21, 1, v12))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v21, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v20, 0, 1, v12);
      }
      a3 = v43;
      goto LABEL_19;
  }
  memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
LABEL_20:
  uint64_t v23 = a3[6];
  uint64_t v24 = (char *)(a1 + v23);
  uint64_t v25 = (char *)(a2 + v23);
  sub_24E81D19C(a1 + v23, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
  uint64_t v26 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  int v27 = swift_getEnumCaseMultiPayload();
  if (v27 == 1)
  {
    uint64_t v32 = sub_24E8616F8();
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v25, 1, v32))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v24, v25, v32);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v24, 0, 1, v32);
    }
LABEL_33:
    swift_storeEnumTagMultiPayload();
    goto LABEL_34;
  }
  if (!v27)
  {
    uint64_t v28 = sub_24E8616F8();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
    uint64_t v44 = a3;
    if (v30(v25, 1, v28))
    {
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v24, v25, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v24, 0, 1, v28);
    }
    uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t v36 = &v24[v35];
    uint64_t v37 = &v25[v35];
    if (v30(v37, 1, v28))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v36, v37, v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v36, 0, 1, v28);
    }
    a3 = v44;
    goto LABEL_33;
  }
  memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
LABEL_34:
  uint64_t v39 = a3[7];
  uint64_t v40 = a1 + v39;
  uint64_t v41 = a2 + v39;
  *(void *)uint64_t v40 = *(void *)v41;
  *(unsigned char *)(v40 + 8) = *(unsigned char *)(v41 + 8);
  return a1;
}

uint64_t _s17RelationshipStateO11LoadedStateVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E8250F8);
}

uint64_t sub_24E8250F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t _s17RelationshipStateO11LoadedStateVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E825258);
}

uint64_t sub_24E825258(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t sub_24E8253B0()
{
  uint64_t result = sub_24E861248();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void *_s24RelationshipStreamChangeOwCP(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v20 = sub_24E861248();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v20 - 8) + 16))(a1, a2, v20);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v7 = sub_24E861248();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
        *((unsigned char *)a1 + v8[5]) = *((unsigned char *)a2 + v8[5]);
        uint64_t v9 = v8[6];
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        v10[8] = v11[8];
        *(void *)uint64_t v10 = *(void *)v11;
        uint64_t v12 = v8[7];
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = sub_24E8616F8();
        uint64_t v16 = *(void *)(v15 - 8);
        uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
        if (v17(v14, 1, v15))
        {
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
        }
        uint64_t v31 = v8[8];
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)a2 + v31;
        if (!v17(v33, 1, v15))
        {
LABEL_16:
          (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v32, v33, v15);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v32, 0, 1, v15);
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v21 = sub_24E861248();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(a1, a2, v21);
        uint64_t v22 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
        *((unsigned char *)a1 + v22[5]) = *((unsigned char *)a2 + v22[5]);
        uint64_t v23 = v22[6];
        uint64_t v24 = (char *)a1 + v23;
        uint64_t v25 = (char *)a2 + v23;
        v24[8] = v25[8];
        *(void *)uint64_t v24 = *(void *)v25;
        uint64_t v26 = v22[7];
        int v27 = (char *)a1 + v26;
        uint64_t v28 = (char *)a2 + v26;
        uint64_t v15 = sub_24E8616F8();
        uint64_t v16 = *(void *)(v15 - 8);
        uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
        if (v29(v28, 1, v15))
        {
          uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
          memcpy(v27, v28, *(void *)(*(void *)(v30 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v27, v28, v15);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v27, 0, 1, v15);
        }
        uint64_t v34 = v22[8];
        uint64_t v32 = (char *)a1 + v34;
        uint64_t v33 = (char *)a2 + v34;
        if (!v29(v33, 1, v15)) {
          goto LABEL_16;
        }
      }
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
LABEL_17:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  uint64_t v19 = *a2;
  *a1 = *a2;
  a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t _s24RelationshipStreamChangeOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v9 = sub_24E861248();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    uint64_t v11 = v9;
    uint64_t v12 = a1;
LABEL_9:
    return v10(v12, v11);
  }
  if (result <= 1)
  {
    uint64_t v3 = sub_24E861248();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
    uint64_t v5 = a1 + *(int *)(v4 + 28);
    uint64_t v6 = sub_24E8616F8();
    uint64_t v13 = *(void *)(v6 - 8);
    uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    if (!v7(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v5, v6);
    }
    uint64_t v8 = a1 + *(int *)(v4 + 32);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v6);
    if (!result)
    {
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
      uint64_t v12 = v8;
      uint64_t v11 = v6;
      goto LABEL_9;
    }
  }
  return result;
}

uint64_t _s24RelationshipStreamChangeOwcp(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v17 = sub_24E861248();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v6[5]) = *(unsigned char *)(a2 + v6[5]);
      uint64_t v7 = v6[6];
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
      *(void *)uint64_t v8 = *(void *)v9;
      uint64_t v10 = v6[7];
      uint64_t v11 = (void *)(a1 + v10);
      uint64_t v12 = (const void *)(a2 + v10);
      uint64_t v13 = sub_24E8616F8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
      if (v15(v12, 1, v13))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      uint64_t v28 = v6[8];
      uint64_t v29 = (void *)(a1 + v28);
      uint64_t v30 = (const void *)(a2 + v28);
      if (!v15(v30, 1, v13))
      {
LABEL_14:
        (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v29, v30, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v29, 0, 1, v13);
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v18 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(a1, a2, v18);
      uint64_t v19 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v19[5]) = *(unsigned char *)(a2 + v19[5]);
      uint64_t v20 = v19[6];
      uint64_t v21 = a1 + v20;
      uint64_t v22 = a2 + v20;
      *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
      *(void *)uint64_t v21 = *(void *)v22;
      uint64_t v23 = v19[7];
      uint64_t v24 = (void *)(a1 + v23);
      uint64_t v25 = (const void *)(a2 + v23);
      uint64_t v13 = sub_24E8616F8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
      if (v26(v25, 1, v13))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v24, v25, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v24, 0, 1, v13);
      }
      uint64_t v31 = v19[8];
      uint64_t v29 = (void *)(a1 + v31);
      uint64_t v30 = (const void *)(a2 + v31);
      if (!v26(v30, 1, v13)) {
        goto LABEL_14;
      }
    }
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
  }
LABEL_15:
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t _s24RelationshipStreamChangeOwca(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24E81D19C(a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v18 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(a1, a2, v18);
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      uint64_t v6 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v6[5]) = *(unsigned char *)(a2 + v6[5]);
      uint64_t v7 = v6[6];
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      char v10 = *(unsigned char *)(v9 + 8);
      *(void *)uint64_t v8 = *(void *)v9;
      *(unsigned char *)(v8 + 8) = v10;
      uint64_t v11 = v6[7];
      uint64_t v12 = (void *)(a1 + v11);
      uint64_t v13 = (const void *)(a2 + v11);
      uint64_t v14 = sub_24E8616F8();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
      if (v16(v13, 1, v14))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
      uint64_t v30 = v6[8];
      uint64_t v31 = (void *)(a1 + v30);
      uint64_t v32 = (const void *)(a2 + v30);
      if (v16(v32, 1, v14))
      {
LABEL_14:
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v19 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
      uint64_t v20 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v20[5]) = *(unsigned char *)(a2 + v20[5]);
      uint64_t v21 = v20[6];
      uint64_t v22 = a1 + v21;
      uint64_t v23 = a2 + v21;
      char v24 = *(unsigned char *)(v23 + 8);
      *(void *)uint64_t v22 = *(void *)v23;
      *(unsigned char *)(v22 + 8) = v24;
      uint64_t v25 = v20[7];
      uint64_t v26 = (void *)(a1 + v25);
      uint64_t v27 = (const void *)(a2 + v25);
      uint64_t v14 = sub_24E8616F8();
      uint64_t v15 = *(void *)(v14 - 8);
      uint64_t v28 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
      if (v28(v27, 1, v14))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v26, v27, v14);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v26, 0, 1, v14);
      }
      uint64_t v33 = v20[8];
      uint64_t v31 = (void *)(a1 + v33);
      uint64_t v32 = (const void *)(a2 + v33);
      if (v28(v32, 1, v14)) {
        goto LABEL_14;
      }
    }
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v31, v32, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v31, 0, 1, v14);
    goto LABEL_16;
  }
  return a1;
}

uint64_t type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange(uint64_t a1)
{
  return sub_24E55C278(a1, (uint64_t *)&unk_2698F86F0);
}

uint64_t _s24RelationshipStreamChangeOwtk(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v17 = sub_24E861248();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(a1, a2, v17);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v6[5]) = *(unsigned char *)(a2 + v6[5]);
      uint64_t v7 = v6[6];
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
      *(void *)uint64_t v8 = *(void *)v9;
      uint64_t v10 = v6[7];
      uint64_t v11 = (void *)(a1 + v10);
      uint64_t v12 = (const void *)(a2 + v10);
      uint64_t v13 = sub_24E8616F8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
      if (v15(v12, 1, v13))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v11, v12, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      uint64_t v28 = v6[8];
      uint64_t v29 = (void *)(a1 + v28);
      uint64_t v30 = (const void *)(a2 + v28);
      if (!v15(v30, 1, v13))
      {
LABEL_14:
        (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v29, v30, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v29, 0, 1, v13);
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v18 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(a1, a2, v18);
      uint64_t v19 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v19[5]) = *(unsigned char *)(a2 + v19[5]);
      uint64_t v20 = v19[6];
      uint64_t v21 = a1 + v20;
      uint64_t v22 = a2 + v20;
      *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
      *(void *)uint64_t v21 = *(void *)v22;
      uint64_t v23 = v19[7];
      char v24 = (void *)(a1 + v23);
      uint64_t v25 = (const void *)(a2 + v23);
      uint64_t v13 = sub_24E8616F8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
      if (v26(v25, 1, v13))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v24, v25, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v24, 0, 1, v13);
      }
      uint64_t v31 = v19[8];
      uint64_t v29 = (void *)(a1 + v31);
      uint64_t v30 = (const void *)(a2 + v31);
      if (!v26(v30, 1, v13)) {
        goto LABEL_14;
      }
    }
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
  }
LABEL_15:
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t _s24RelationshipStreamChangeOwta(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24E81D19C(a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v17 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(a1, a2, v17);
LABEL_16:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      uint64_t v6 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v6[5]) = *(unsigned char *)(a2 + v6[5]);
      uint64_t v7 = v6[6];
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
      *(void *)uint64_t v8 = *(void *)v9;
      uint64_t v10 = v6[7];
      uint64_t v11 = (void *)(a1 + v10);
      uint64_t v12 = (const void *)(a2 + v10);
      uint64_t v13 = sub_24E8616F8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
      if (v15(v12, 1, v13))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v11, v12, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      uint64_t v28 = v6[8];
      uint64_t v29 = (void *)(a1 + v28);
      uint64_t v30 = (const void *)(a2 + v28);
      if (v15(v30, 1, v13))
      {
LABEL_14:
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v18 = sub_24E861248();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(a1, a2, v18);
      uint64_t v19 = (int *)type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(0);
      *(unsigned char *)(a1 + v19[5]) = *(unsigned char *)(a2 + v19[5]);
      uint64_t v20 = v19[6];
      uint64_t v21 = a1 + v20;
      uint64_t v22 = a2 + v20;
      *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
      *(void *)uint64_t v21 = *(void *)v22;
      uint64_t v23 = v19[7];
      char v24 = (void *)(a1 + v23);
      uint64_t v25 = (const void *)(a2 + v23);
      uint64_t v13 = sub_24E8616F8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
      if (v26(v25, 1, v13))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v24, v25, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v24, 0, 1, v13);
      }
      uint64_t v31 = v19[8];
      uint64_t v29 = (void *)(a1 + v31);
      uint64_t v30 = (const void *)(a2 + v31);
      if (v26(v30, 1, v13)) {
        goto LABEL_14;
      }
    }
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v29, v30, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v29, 0, 1, v13);
    goto LABEL_16;
  }
  return a1;
}

uint64_t sub_24E826E28()
{
  uint64_t result = type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24E861248();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *_s24RelationshipStreamChangeO10FriendshipVwCP(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24E861248();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(void *)uint64_t v9 = *(void *)v10;
    v9[8] = v10[8];
    uint64_t v11 = a3[7];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_24E8616F8();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    if (v16(v13, 1, v14))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    if (v16(v21, 1, v14))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v20, v21, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v20, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = sub_24E8616F8();
  uint64_t v11 = *(void *)(v6 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v7(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 32);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v6);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v6);
  }
  return result;
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_24E8616F8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  if (v15(v19, 1, v13))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v18, v19, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  }
  return a1;
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = sub_24E8616F8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  int v23 = v16((void *)(a1 + v20), 1, v14);
  int v24 = v16(v22, 1, v14);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v21, v22, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v21, v14);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v21, v22, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
  return a1;
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_24E8616F8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v17 = a3[8];
  int v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  if (v15(v19, 1, v13))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v18, v19, v13);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  }
  return a1;
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwta(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E861248();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_24E8616F8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  int v22 = v15((void *)(a1 + v19), 1, v13);
  int v23 = v15(v21, 1, v13);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v20, v21, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v20, v13);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v20, v21, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
  return a1;
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E827CC4);
}

uint64_t sub_24E827CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 251)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 5) {
      return v10 - 4;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t _s24RelationshipStreamChangeO10FriendshipVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E827E00);
}

uint64_t sub_24E827E00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 251)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 4;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_24E827F2C()
{
  sub_24E861248();
  if (v0 <= 0x3F)
  {
    sub_24E55D9C0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *_s24RelationshipStreamChangeO10FriendshipV14FriendshipTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x24E8280D4);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.FriendshipType()
{
  return &type metadata for PeopleRelationshipsProvider.RelationshipStreamChange.Friendship.FriendshipType;
}

uint64_t *_s17RelationshipStateO13FollowerStateOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
    return a1;
  }
  uint64_t v6 = *(void *)(a3 - 8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v14 = sub_24E8616F8();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v15 + 48))(a2, 1, v14))
      {
LABEL_10:
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
LABEL_20:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_17:
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v15 + 16))(a1, a2, v14);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
      goto LABEL_20;
    case 1:
      uint64_t v14 = sub_24E8616F8();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v15 + 48))(a2, 1, v14)) {
        goto LABEL_10;
      }
      goto LABEL_17;
    case 0:
      uint64_t v8 = sub_24E8616F8();
      uint64_t v9 = *(void *)(v8 - 8);
      unsigned int v10 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48);
      if (v10(a2, 1, v8))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 16))(a1, a2, v8);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
      uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      if (v10((uint64_t *)v19, 1, v8))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v18, v19, v8);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v18, 0, 1, v8);
      }
      goto LABEL_20;
  }
  memcpy(a1, a2, *(void *)(v6 + 64));
  return a1;
}

uint64_t _s17RelationshipStateO13FollowerStateOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v3 = sub_24E8616F8();
    uint64_t v6 = *(void *)(v3 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
    if (result) {
      return result;
    }
    goto LABEL_7;
  }
  if (!result)
  {
    uint64_t v3 = sub_24E8616F8();
    uint64_t v6 = *(void *)(v3 - 8);
    unsigned int v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    if (!v4(a1, 1, v3)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v3);
    }
    a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v4)(a1, 1, v3);
    if (!result)
    {
LABEL_7:
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
      return v5(a1, v3);
    }
  }
  return result;
}

char *_s17RelationshipStateO13FollowerStateOwcp(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
LABEL_7:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
LABEL_17:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_14:
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(a1, a2, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      goto LABEL_17;
    case 1:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11)) {
        goto LABEL_7;
      }
      goto LABEL_14;
    case 0:
      uint64_t v7 = sub_24E8616F8();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      if (v9(a2, 1, v7))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      if (v9(v16, 1, v7))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v15, v16, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      }
      goto LABEL_17;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *_s17RelationshipStateO13FollowerStateOwca(char *a1, char *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a1;
  }
  sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
LABEL_8:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
LABEL_18:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(a1, a2, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      goto LABEL_18;
    case 1:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11)) {
        goto LABEL_8;
      }
      goto LABEL_12;
    case 0:
      uint64_t v7 = sub_24E8616F8();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      if (v9(a2, 1, v7))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      if (v9(v16, 1, v7))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v15, v16, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      }
      goto LABEL_18;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *_s17RelationshipStateO13FollowerStateOwtk(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
LABEL_7:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
LABEL_17:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_14:
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a1, a2, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      goto LABEL_17;
    case 1:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11)) {
        goto LABEL_7;
      }
      goto LABEL_14;
    case 0:
      uint64_t v7 = sub_24E8616F8();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      if (v9(a2, 1, v7))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      if (v9(v16, 1, v7))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v15, v16, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      }
      goto LABEL_17;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *_s17RelationshipStateO13FollowerStateOwta(char *a1, char *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a1;
  }
  sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowerState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
LABEL_8:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
LABEL_18:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_12:
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a1, a2, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      goto LABEL_18;
    case 1:
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11)) {
        goto LABEL_8;
      }
      goto LABEL_12;
    case 0:
      uint64_t v7 = sub_24E8616F8();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      if (v9(a2, 1, v7))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      if (v9(v16, 1, v7))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v15, v16, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      }
      goto LABEL_18;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void sub_24E829750()
{
  sub_24E55D9C0();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(v0 - 8) + 64;
    swift_getTupleTypeLayout2();
    unsigned int v4 = &v3;
    uint64_t v5 = v2;
    uint64_t v6 = v2;
    swift_initEnumMetadataMultiPayload();
  }
}

char *_s17RelationshipStateO14FollowingStateOwca(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(a1, a2, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
LABEL_15:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_24E8616F8();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      if (v9(a2, 1, v7))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      if (v9(v16, 1, v7))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v15, v16, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      }
      goto LABEL_15;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *_s17RelationshipStateO14FollowingStateOwta(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E81D19C((uint64_t)a1, type metadata accessor for PeopleRelationshipsProvider.RelationshipState.FollowingState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v11 = sub_24E8616F8();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(a1, a2, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
LABEL_15:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_24E8616F8();
      uint64_t v8 = *(void *)(v7 - 8);
      uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
      if (v9(a2, 1, v7))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F2F70) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      if (v9(v16, 1, v7))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F0F90);
        memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v15, v16, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      }
      goto LABEL_15;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t UserLocationProvider.data.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24E829E8C(&OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data, (uint64_t *)&unk_2698F8830, a1);
}

uint64_t UserLocationProvider.storage.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24E829E8C(&OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage, &qword_2698F7108, a1);
}

uint64_t sub_24E829E8C@<X0>(void *a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  uint64_t v7 = v3 + *a1;
  swift_beginAccess();
  sub_24E576EA0(v7, a3, a2);
  return swift_release();
}

uint64_t sub_24E829FA4@<X0>(uint64_t a1@<X8>)
{
  return UserLocationProvider.storage.getter(a1);
}

uint64_t sub_24E829FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24E82A9AC(a1, a2, a3, a4, &qword_2698F7108, (uint64_t (*)(char *))UserLocationProvider.storage.setter);
}

uint64_t UserLocationProvider.storage.setter(uint64_t a1)
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24E82AA54();
  sub_24E8617B8();
  swift_release();
  sub_24E563530(a1, &qword_2698F7108);
  return swift_release();
}

uint64_t sub_24E82A130(uint64_t a1, uint64_t a2)
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = a1 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage;
  swift_beginAccess();
  sub_24E7EEFB8(a2, v4, &qword_2698F7108);
  swift_endAccess();
  return swift_release();
}

void (*UserLocationProvider.storage.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  sub_24E863FB8();
  v3[4] = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  swift_beginAccess();
  return sub_24E82A36C;
}

void sub_24E82A36C(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_24E82A3F8()
{
  uint64_t v1 = v0;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8830);
  MEMORY[0x270FA5388](v24);
  uint64_t v23 = (uint64_t)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24E862168();
  uint64_t v26 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7108);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E863FB8();
  uint64_t v25 = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  v29[1] = v0;
  sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  uint64_t v9 = v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage;
  swift_beginAccess();
  sub_24E576EA0(v9, (uint64_t)v8, &qword_2698F7108);
  swift_release();
  uint64_t v10 = v26;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v5, v8, v3);
  sub_24E563530((uint64_t)v8, &qword_2698F7108);
  swift_retain_n();
  uint64_t v11 = sub_24E862148();
  os_log_type_t v12 = sub_24E864268();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v22 = v3;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    v29[0] = v21;
    *(_DWORD *)uint64_t v13 = 136315138;
    v20[1] = sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v20[0] = v13 + 4;
    swift_getKeyPath();
    uint64_t v28 = v1;
    sub_24E8617C8();
    swift_release();
    uint64_t v14 = v1 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data;
    swift_beginAccess();
    sub_24E576EA0(v14, v23, (uint64_t *)&unk_2698F8830);
    swift_release();
    uint64_t v15 = sub_24E863CC8();
    unint64_t v17 = v16;
    swift_release();
    uint64_t v27 = sub_24E55B02C(v15, v17, v29);
    sub_24E8643A8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v11, v12, "UserLocationProvider: data - %s", v13, 0xCu);
    uint64_t v18 = v21;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v18, -1, -1);
    MEMORY[0x2533435F0](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v22);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v3);
  }
  return swift_release();
}

uint64_t sub_24E82A944@<X0>(uint64_t a1@<X8>)
{
  return UserLocationProvider.data.getter(a1);
}

uint64_t sub_24E82A968@<X0>(uint64_t a1@<X8>)
{
  return UserLocationProvider.data.getter(a1);
}

uint64_t sub_24E82A98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24E82A9AC(a1, a2, a3, a4, (uint64_t *)&unk_2698F8830, (uint64_t (*)(char *))sub_24E82AB3C);
}

uint64_t sub_24E82A9AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E576EA0(a1, (uint64_t)v11, a5);
  return a6(v11);
}

unint64_t sub_24E82AA54()
{
  unint64_t result = qword_2698F7110;
  if (!qword_2698F7110)
  {
    type metadata accessor for UserLocationProvider();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F7110);
  }
  return result;
}

uint64_t type metadata accessor for UserLocationProvider()
{
  uint64_t result = qword_2698F8790;
  if (!qword_2698F8790) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E82AAF8@<X0>(uint64_t a1@<X8>)
{
  return UserLocationProvider.storage.getter(a1);
}

uint64_t sub_24E82AB20()
{
  return sub_24E82A130(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24E82AB3C(uint64_t a1)
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24E82AA54();
  sub_24E8617B8();
  swift_release();
  sub_24E563530(a1, (uint64_t *)&unk_2698F8830);
  return swift_release();
}

uint64_t sub_24E82AC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8830);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E576EA0(a2, (uint64_t)v6, (uint64_t *)&unk_2698F8830);
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = a1 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data;
  swift_beginAccess();
  sub_24E7EEFB8((uint64_t)v6, v7, (uint64_t *)&unk_2698F8830);
  swift_endAccess();
  sub_24E82A3F8();
  sub_24E563530((uint64_t)v6, (uint64_t *)&unk_2698F8830);
  swift_release();
  return swift_release();
}

Swift::Bool __swiftcall UserLocationProvider.isLocationManagerUseAuthorized()()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  char v2 = (*(uint64_t (**)(uint64_t))(v0 + 32))(isCurrentExecutor);
  swift_release();
  return v2 & 1;
}

uint64_t sub_24E82AEE0()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__valuePublisher);
  swift_retain();
  swift_release();
  return v1;
}

uint64_t sub_24E82AFC8()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24E82AA54();
  sub_24E8617B8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24E82B0F8(uint64_t a1, uint64_t a2)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(a1 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__valuePublisher) = a2;
  swift_retain();
  swift_release();
  return swift_release();
}

uint64_t UserLocationProvider.__allocating_init(dependencies:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  UserLocationProvider.init(dependencies:)(a1);
  return v2;
}

uint64_t UserLocationProvider.init(dependencies:)(long long *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24E861758();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v31 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E862168();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)&v29 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7108);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v14[11];
  *(void *)&v16[v17] = sub_24E7B028C(MEMORY[0x263F8EE78]);
  *(void *)&v16[v14[12]] = MEMORY[0x263F8EE88];
  v16[v14[13]] = 0;
  sub_24E862158();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  long long v19 = *a1;
  long long v29 = a1[1];
  long long v30 = v19;
  v18(v16, v12, v6);
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v20(v10, v12, v6);
  unint64_t v21 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v22 = swift_allocObject();
  v20((char *)(v22 + v21), v10, v6);
  uint64_t v23 = (void (**)())&v16[v14[14]];
  *uint64_t v23 = sub_24E82D1F8;
  v23[1] = (void (*)())v22;
  sub_24E612440((uint64_t)v16, v2 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage, &qword_2698F7108);
  uint64_t v24 = OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider_taskQueue;
  sub_24E860E98();
  sub_24E861748();
  *(void *)(v2 + v24) = sub_24E860E78();
  uint64_t v25 = v2 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data;
  uint64_t v26 = sub_24E861298();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
  *(void *)(v2 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__valuePublisher) = 0;
  sub_24E8617F8();
  long long v27 = v29;
  *(_OWORD *)(v2 + 16) = v30;
  *(_OWORD *)(v2 + 32) = v27;
  return v2;
}

uint64_t sub_24E82B54C()
{
  v1[5] = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F7FE0);
  v1[6] = swift_task_alloc();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F87C0);
  v1[7] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[8] = v3;
  v1[9] = *(void *)(v3 + 64);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = sub_24E863FB8();
  v1[13] = sub_24E863FA8();
  uint64_t v5 = sub_24E863F18();
  v1[14] = v5;
  v1[15] = v4;
  return MEMORY[0x270FA2498](sub_24E82B690, v5, v4);
}

uint64_t sub_24E82B690()
{
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0[5];
  swift_getKeyPath();
  v0[16] = OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider___observationRegistrar;
  v0[2] = v1;
  v0[17] = sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__valuePublisher);
  swift_retain();
  swift_release();
  if (v2)
  {
    sub_24E864068();
    swift_release();
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = v0[5];
  swift_getKeyPath();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  v0[3] = v3;
  sub_24E8617B8();
  v0[18] = 0;
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[19] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24E82B948;
  uint64_t v6 = v0[11];
  return v8(v6);
}

uint64_t sub_24E82B948()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 120);
  uint64_t v3 = *(void *)(v1 + 112);
  return MEMORY[0x270FA2498](sub_24E82BA68, v3, v2);
}

uint64_t sub_24E82BA68()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v20 = v0[9];
  swift_release();
  uint64_t v6 = sub_24E863FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v5);
  swift_retain();
  uint64_t v8 = sub_24E863FA8();
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v11;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v2, v5);
  *(void *)(v10 + ((v20 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v7;
  swift_release();
  uint64_t v12 = sub_24E5C54D0(v4, (uint64_t)&unk_2698F87D0, v10);
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v13 = v0[11];
  uint64_t v14 = v0[8];
  uint64_t v19 = v0[7];
  uint64_t v15 = v0[5];
  swift_getKeyPath();
  uint64_t v16 = swift_task_alloc();
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v12;
  v0[4] = v15;
  sub_24E8617B8();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_24E82BD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  uint64_t v6 = sub_24E862168();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7108);
  v5[16] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8830);
  v5[17] = v7;
  v5[18] = *(void *)(v7 - 8);
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F87D8);
  v5[23] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F87E0);
  v5[24] = v8;
  v5[25] = *(void *)(v8 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = sub_24E863FB8();
  v5[28] = sub_24E863FA8();
  uint64_t v10 = sub_24E863F18();
  v5[29] = v10;
  v5[30] = v9;
  return MEMORY[0x270FA2498](sub_24E82BF7C, v10, v9);
}

uint64_t sub_24E82BF7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F87C0);
  sub_24E864038();
  swift_beginAccess();
  v0[31] = 0;
  uint64_t v1 = sub_24E863FA8();
  v0[32] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[33] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E82C078;
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[24];
  uint64_t v5 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v3, v1, v5, v4);
}

uint64_t sub_24E82C078()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 240);
  uint64_t v3 = *(void *)(v1 + 232);
  return MEMORY[0x270FA2498](sub_24E82C1BC, v3, v2);
}

uint64_t sub_24E82C1BC()
{
  uint64_t v1 = v0[23];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[18] + 48))(v1, 1, v0[17]) == 1)
  {
    (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
    swift_release();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  sub_24E612440(v1, v0[22], (uint64_t *)&unk_2698F8830);
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    uint64_t v17 = v0[25];
    uint64_t v16 = v0[26];
    uint64_t v18 = v0[24];
    uint64_t v19 = v0[22];
    swift_release();
    sub_24E563530(v19, (uint64_t *)&unk_2698F8830);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    goto LABEL_11;
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v34 = v0[21];
  uint64_t v36 = v0[22];
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[14];
  swift_getKeyPath();
  v0[8] = Strong;
  sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  uint64_t v6 = Strong + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage;
  swift_beginAccess();
  sub_24E576EA0(v6, v2, &qword_2698F7108);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v2, v4);
  sub_24E563530(v2, &qword_2698F7108);
  sub_24E576EA0(v36, v34, (uint64_t *)&unk_2698F8830);
  uint64_t v7 = sub_24E862148();
  os_log_type_t v8 = sub_24E864268();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v0[10] = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v11 = v0[21];
    uint64_t v12 = v0[14];
    uint64_t v35 = v0[13];
    uint64_t v37 = v0[15];
    sub_24E576EA0(v11, v0[20], (uint64_t *)&unk_2698F8830);
    uint64_t v13 = sub_24E863CC8();
    unint64_t v15 = v14;
    swift_release();
    *(void *)(v9 + 4) = sub_24E55B02C(v13, v15, v0 + 10);
    swift_bridgeObjectRelease();
    sub_24E563530(v11, (uint64_t *)&unk_2698F8830);
    _os_log_impl(&dword_24E553000, v7, v8, "UserLocationProvider: change - %s", (uint8_t *)v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v10, -1, -1);
    MEMORY[0x2533435F0](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v37, v35);
  }
  else
  {
    uint64_t v23 = v0[14];
    uint64_t v22 = v0[15];
    uint64_t v24 = v0[13];
    sub_24E563530(v0[21], (uint64_t *)&unk_2698F8830);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  sub_24E576EA0(v0[22], v0[19], (uint64_t *)&unk_2698F8830);
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v25 = v0[31];
  uint64_t v26 = v0[22];
  uint64_t v27 = v0[19];
  swift_getKeyPath();
  uint64_t v28 = swift_task_alloc();
  *(void *)(v28 + 16) = Strong;
  *(void *)(v28 + 24) = v27;
  v0[9] = Strong;
  sub_24E8617B8();
  swift_release();
  swift_task_dealloc();
  sub_24E563530(v27, (uint64_t *)&unk_2698F8830);
  swift_release();
  swift_release();
  sub_24E563530(v26, (uint64_t *)&unk_2698F8830);
  v0[31] = v25;
  uint64_t v29 = sub_24E863FA8();
  v0[32] = v29;
  long long v30 = (void *)swift_task_alloc();
  v0[33] = v30;
  *long long v30 = v0;
  v30[1] = sub_24E82C078;
  uint64_t v31 = v0[23];
  uint64_t v32 = v0[24];
  uint64_t v33 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v31, v29, v33, v32);
}

uint64_t sub_24E82C7F8()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24E82AA54();
  sub_24E8617C8();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__valuePublisher);
  swift_retain();
  swift_release();
  if (v1)
  {
    sub_24E864068();
    swift_release();
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24E8617B8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t UserLocationProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:)(uint64_t a1, char a2)
{
  return sub_24E82CB58(a1, a2);
}

uint64_t sub_24E82CA6C(char a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v1 + 16) = v2;
    *uint64_t v2 = v1;
    v2[1] = sub_24E58BF10;
    return sub_24E82B54C();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(v1 + 8);
    return v4();
  }
}

uint64_t UserLocationProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:)(uint64_t a1, char a2)
{
  return sub_24E82CB58(a1, a2);
}

uint64_t sub_24E82CB58(uint64_t a1, char a2)
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a2 & 1;
  *(void *)(v4 + 24) = v2;
  swift_retain();
  sub_24E860E88();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_24E82CC64(char a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  *(unsigned char *)(v2 + 32) = a1;
  return MEMORY[0x270FA2498](sub_24E82CC88, 0, 0);
}

uint64_t sub_24E82CC88()
{
  if (*(unsigned char *)(v0 + 32) == 1)
  {
    sub_24E863FB8();
    *(void *)(v0 + 24) = sub_24E863FA8();
    uint64_t v2 = sub_24E863F18();
    return MEMORY[0x270FA2498](sub_24E82CD5C, v2, v1);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24E82CD5C()
{
  swift_release();
  sub_24E82C7F8();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t UserLocationProvider.deinit()
{
  swift_release();
  swift_release();
  sub_24E563530(v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage, &qword_2698F7108);
  swift_release();
  sub_24E563530(v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data, (uint64_t *)&unk_2698F8830);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider___observationRegistrar;
  uint64_t v2 = sub_24E861808();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t UserLocationProvider.__deallocating_deinit()
{
  swift_release();
  swift_release();
  sub_24E563530(v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage, &qword_2698F7108);
  swift_release();
  sub_24E563530(v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data, (uint64_t *)&unk_2698F8830);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider___observationRegistrar;
  uint64_t v2 = sub_24E861808();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

void (*sub_24E82CF98(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = UserLocationProvider.storage.modify(v2);
  return sub_24E70F400;
}

uint64_t sub_24E82CFF0(uint64_t a1, char a2)
{
  return sub_24E82D038(a1, a2);
}

uint64_t sub_24E82D014(uint64_t a1, char a2)
{
  return sub_24E82D038(a1, a2);
}

uint64_t sub_24E82D038(uint64_t a1, char a2)
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a2 & 1;
  *(void *)(v4 + 24) = v2;
  swift_retain();
  sub_24E860E88();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_24E82D144@<X0>(uint64_t a1@<X8>)
{
  return UserLocationProvider.data.getter(a1);
}

uint64_t sub_24E82D168()
{
  uint64_t v1 = sub_24E862168();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_24E82D1F8()
{
}

uint64_t sub_24E82D24C()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E56A260;
  return sub_24E82CA6C(v2);
}

uint64_t sub_24E82D2E8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E82D320()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_24E56A260;
  *(void *)(v4 + 16) = v3;
  *(unsigned char *)(v4 + 32) = v2;
  return MEMORY[0x270FA2498](sub_24E82CC88, 0, 0);
}

unint64_t sub_24E82D3D4(uint64_t a1)
{
  unint64_t result = sub_24E82AA54();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24E82D3FC()
{
  return type metadata accessor for UserLocationProvider();
}

void sub_24E82D404()
{
  sub_24E82D554();
  if (v0 <= 0x3F)
  {
    sub_24E82D5B0();
    if (v1 <= 0x3F)
    {
      sub_24E861808();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for UserLocationProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UserLocationProvider);
}

uint64_t dispatch thunk of UserLocationProvider.__allocating_init(dependencies:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_24E82D554()
{
  if (!qword_2698F87A0)
  {
    sub_24E74B08C();
    unint64_t v0 = type metadata accessor for SubscriptionManagerStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2698F87A0);
    }
  }
}

void sub_24E82D5B0()
{
  if (!qword_2698F72C8)
  {
    sub_24E861298();
    unint64_t v0 = sub_24E864388();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2698F72C8);
    }
  }
}

uint64_t sub_24E82D608()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E5699A4;
  return sub_24E82CA6C(v2);
}

uint64_t sub_24E82D6A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24E82AEE0();
  *a1 = result;
  return result;
}

uint64_t sub_24E82D6D0()
{
  return sub_24E82AFC8();
}

uint64_t sub_24E82D6FC()
{
  return sub_24E82B0F8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24E82D718()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E82D750()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F87C0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24E82D83C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F87C0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24E5699A4;
  return sub_24E82BD3C(a1, v6, v7, v8, v9);
}

uint64_t sub_24E82D964()
{
  return sub_24E82AC84(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_24E82D984()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  oslog = sub_24E862148();
  os_log_type_t v0 = sub_24E864238();
  if (os_log_type_enabled(oslog, v0))
  {
    uint64_t v1 = (uint8_t *)swift_slowAlloc();
    uint64_t v2 = swift_slowAlloc();
    uint64_t v4 = v2;
    *(_DWORD *)uint64_t v1 = 136315138;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_24E55B02C(0xD000000000000011, 0x800000024E876FB0, &v4);
    sub_24E8643A8();
    _os_log_impl(&dword_24E553000, oslog, v0, "SubscriptionManagerStorage: empty callback - %s", v1, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v2, -1, -1);
    MEMORY[0x2533435F0](v1, -1, -1);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_24E82DBB8()
{
  return sub_24E82D6FC();
}

uint64_t sub_24E82DBD0()
{
  return sub_24E82D964();
}

uint64_t UserLocationProvider.Dependencies.thisDeviceLocationStream.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t UserLocationProvider.Dependencies.thisDeviceLocationStream.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserLocationProvider.Dependencies.thisDeviceLocationStream.modify())()
{
  return nullsub_1;
}

uint64_t sub_24E82DC70(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 16) = sub_24E82DE7C;
  *(void *)(a2 + 24) = v5;
  return result;
}

uint64_t UserLocationProvider.Dependencies.isLocationUseAuthorized.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t UserLocationProvider.Dependencies.isLocationUseAuthorized.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*UserLocationProvider.Dependencies.isLocationUseAuthorized.modify())()
{
  return nullsub_1;
}

uint64_t UserLocationProvider.Dependencies.init(thisDeviceLocationStream:isLocationUseAuthorized:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t sub_24E82DD74@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_24E82DD80(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v3;
  return result;
}

uint64_t sub_24E82DDC4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = sub_24E82DEB4;
  a2[1] = v5;

  return swift_retain();
}

ValueMetadata *type metadata accessor for UserLocationProvider.Dependencies()
{
  return &type metadata for UserLocationProvider.Dependencies;
}

uint64_t sub_24E82DE44()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E82DE7C()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t sub_24E82DEB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result & 1;
  return result;
}

uint64_t static UserLocationProvider.Dependencies.live(customEffectiveBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_24E862168();
  v3[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[6] = v5;
  v3[7] = *(void *)(v5 + 64);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E82DFC8, 0, 0);
}

id sub_24E82DFC8()
{
  uint64_t v1 = v0[4];
  sub_24E862158();
  if (v1)
  {
    uint64_t v2 = self;
    swift_bridgeObjectRetain();
    id v3 = objc_msgSend(v2, sel_mainBundle);
    id v4 = objc_msgSend(v3, sel_bundleIdentifier);

    if (v4)
    {
      uint64_t v6 = v0[3];
      uint64_t v5 = v0[4];
      uint64_t v7 = sub_24E863CA8();
      uint64_t v9 = v8;

      if (v7 == v6 && v5 == v9)
      {
LABEL_10:
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
      char v11 = sub_24E864988();
      swift_bridgeObjectRelease();
      if (v11)
      {
LABEL_11:
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    id v12 = objc_msgSend(objc_allocWithZone((Class)_s24MockCoreLocationDelegateCMa()), sel_init);
    sub_24E7C46B0();
    uint64_t v13 = (void *)sub_24E8642E8();
    id v14 = objc_allocWithZone(MEMORY[0x263F00A60]);
    unint64_t v15 = (void *)sub_24E863C68();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v14, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v15, v12, v13);

    if (v16) {
      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  id result = objc_msgSend(self, sel_sharedManager);
  id v16 = result;
  if (!result)
  {
    __break(1u);
    return result;
  }
LABEL_13:
  unint64_t v18 = v0[8];
  uint64_t v19 = v0[6];
  uint64_t v20 = v0[5];
  uint64_t v21 = (void *)v0[2];
  uint64_t v22 = *(void (**)(unint64_t, unint64_t, uint64_t))(v19 + 32);
  v22(v18, v0[9], v20);
  unint64_t v23 = (*(unsigned __int8 *)(v19 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v16;
  v22(v24 + v23, v18, v20);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v16;
  *uint64_t v21 = &unk_2698F8800;
  v21[1] = v24;
  v21[2] = sub_24E82FEA4;
  v21[3] = v25;
  id v26 = v16;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(void))v0[1];
  return (id)v27();
}

uint64_t sub_24E82E2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_24E862168();
  v3[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[6] = v5;
  v3[7] = *(void *)(v5 + 64);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F7FE0);
  v3[9] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8810);
  v3[10] = v6;
  v3[11] = *(void *)(v6 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F8818) - 8);
  v3[13] = v7;
  v3[14] = *(void *)(v7 + 64);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  uint64_t v8 = sub_24E861838();
  v3[17] = v8;
  v3[18] = *(void *)(v8 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = sub_24E861858();
  v3[21] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8820);
  v3[22] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v3[23] = v10;
  v3[24] = *(void *)(v10 + 64);
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E82E588, 0, 0);
}

uint64_t sub_24E82E588()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v25 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 184);
  uint64_t v21 = *(void *)(v0 + 176);
  uint64_t v22 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v20 = *(void *)(v0 + 120);
  uint64_t v24 = *(void *)(v0 + 112);
  uint64_t v23 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v26 = *(void *)(v0 + 96);
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v27 = *(void *)(v0 + 64);
  uint64_t v28 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 48);
  uint64_t v18 = *(void *)(v0 + 32);
  uint64_t v19 = *(void *)(v0 + 40);
  objc_msgSend(*(id *)(v0 + 24), sel_requestWhenInUseAuthorization);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F8EF98], v4);
  sub_24E861828();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8830);
  sub_24E830354(&qword_2698F3228, MEMORY[0x263F8EFB0]);
  sub_24E8646D8();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8840);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  *(void *)(swift_task_alloc() + 16) = v5;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v26, *MEMORY[0x263F8F580], v16);
  sub_24E864058();
  swift_task_dealloc();
  uint64_t v9 = sub_24E863FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v28, 1, 1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v22, v1, v21);
  sub_24E576EA0(v5, v20, &qword_2698F8818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v27, v18, v19);
  unint64_t v10 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v11 = (v25 + *(unsigned __int8 *)(v23 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v12 = (v24 + *(unsigned __int8 *)(v7 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v13 + v10, v22, v21);
  sub_24E612440(v20, v13 + v11, &qword_2698F8818);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(v13 + v12, v27, v19);
  sub_24E5C54D0(v28, (uint64_t)&unk_2698F8850, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v1, v21);
  sub_24E563530(v5, &qword_2698F8818);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_24E82EA0C()
{
  uint64_t v1 = sub_24E862168();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E82EAD8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24E862168() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24E5699A4;
  return sub_24E82E2B4(a1, v5, v6);
}

uint64_t sub_24E82EBC0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24E82EBE0, 0, 0);
}

uint64_t sub_24E82EBE0()
{
  uint64_t v1 = (void *)sub_24E861868();
  uint64_t v2 = *(void *)(v0 + 16);
  if (v1)
  {
    id v3 = v1;
    sub_24E861258();
    uint64_t v4 = sub_24E861298();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    uint64_t v5 = sub_24E861298();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24E82ECDC(uint64_t a1, uint64_t a2)
{
  sub_24E563530(a2, &qword_2698F8818);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8840);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_24E82EDAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[7] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8818);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8858);
  v6[12] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8830);
  v6[13] = v7;
  v6[14] = *(void *)(v7 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8860);
  v6[17] = swift_task_alloc();
  uint64_t v8 = sub_24E861878();
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F87D8);
  v6[21] = swift_task_alloc();
  v6[22] = sub_24E861858();
  v6[23] = swift_task_alloc();
  v6[24] = sub_24E861848();
  v6[25] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8870);
  v6[26] = v9;
  v6[27] = *(void *)(v9 - 8);
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E82F080, 0, 0);
}

uint64_t sub_24E82F080()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8820);
  MEMORY[0x253342690]();
  sub_24E830354(&qword_2698F3228, MEMORY[0x263F8EFB0]);
  sub_24E8640E8();
  sub_24E864698();
  sub_24E8646A8();
  return MEMORY[0x270FA2498](sub_24E82F1B0, 0, 0);
}

uint64_t sub_24E82F1B0()
{
  v0[30] = sub_24E864688();
  sub_24E830354(&qword_2698F3230, MEMORY[0x263F8EFA0]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[31] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E82F2B8;
  uint64_t v2 = v0[17];
  return MEMORY[0x270FA1E88](v2, 0, 0);
}

uint64_t sub_24E82F2B8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    id v3 = sub_24E82F5E4;
  }
  else
  {
    (*(void (**)(void))(v2 + 240))();
    id v3 = sub_24E82F3E0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E82F3E0()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24E563530(v3, (uint64_t *)&unk_2698F8860);
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[14] + 56))(v0[21], 1, 1, v0[13]);
    return MEMORY[0x270FA2498](sub_24E82FA98, 0, 0);
  }
  else
  {
    uint64_t v5 = v0[28];
    uint64_t v4 = v0[29];
    uint64_t v6 = v0[26];
    uint64_t v7 = v0[27];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[20], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v4, v6);
    uint64_t v8 = (int *)sub_24E864698();
    v0[33] = v9;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    id v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)v8 + *v8);
    unint64_t v10 = (void *)swift_task_alloc();
    v0[34] = v10;
    *unint64_t v10 = v0;
    v10[1] = sub_24E82F8A4;
    uint64_t v12 = v0[20];
    uint64_t v11 = v0[21];
    return v14(v11, v12);
  }
}

uint64_t sub_24E82F5E4()
{
  uint64_t v1 = (void (*)(void))v0[30];
  v0[32] = v0[6];
  v1();
  return MEMORY[0x270FA2498](sub_24E82F664, 0, 0);
}

uint64_t sub_24E82F664()
{
  (*(void (**)(void, void))(v0[27] + 8))(v0[29], v0[26]);
  uint64_t v1 = sub_24E862148();
  os_log_type_t v2 = sub_24E864248();
  BOOL v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = (void *)v0[32];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24E553000, v1, v2, "UserLocationProvider: live() failed to get element from originalStream", v5, 2u);
    MEMORY[0x2533435F0](v5, -1, -1);
  }

  uint64_t v6 = v0[10];
  sub_24E576EA0(v0[8], v6, &qword_2698F8818);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8840);
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  uint64_t v10 = v0[10];
  if (v9 == 1)
  {
    sub_24E563530(v0[10], &qword_2698F8818);
  }
  else
  {
    sub_24E864028();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24E82F8A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  uint64_t v3 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_24E82FA18, 0, 0);
}

uint64_t sub_24E82FA18()
{
  (*(void (**)(void, void, uint64_t, void))(v0[14] + 56))(v0[21], 0, 1, v0[13]);
  return MEMORY[0x270FA2498](sub_24E82FA98, 0, 0);
}

uint64_t sub_24E82FA98()
{
  uint64_t v1 = v0[21];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[14] + 48))(v1, 1, v0[13]) == 1)
  {
    (*(void (**)(void, void))(v0[27] + 8))(v0[29], v0[26]);
    uint64_t v2 = v0[10];
    sub_24E576EA0(v0[8], v2, &qword_2698F8818);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8840);
    uint64_t v4 = *(void *)(v3 - 8);
    int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
    uint64_t v6 = v0[10];
    if (v5 == 1)
    {
      sub_24E563530(v0[10], &qword_2698F8818);
    }
    else
    {
      sub_24E864028();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v3);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  else
  {
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[8];
    sub_24E612440(v1, v0[16], (uint64_t *)&unk_2698F8830);
    sub_24E576EA0(v8, v7, &qword_2698F8818);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8840);
    uint64_t v10 = *(void *)(v9 - 8);
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9);
    uint64_t v12 = v0[16];
    if (v11 == 1)
    {
      uint64_t v13 = v0[11];
      uint64_t v14 = v0[12];
      sub_24E563530(v0[16], (uint64_t *)&unk_2698F8830);
      sub_24E563530(v13, &qword_2698F8818);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8880);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    }
    else
    {
      uint64_t v19 = v0[11];
      uint64_t v18 = v0[12];
      sub_24E576EA0(v0[16], v0[15], (uint64_t *)&unk_2698F8830);
      sub_24E864018();
      sub_24E563530(v12, (uint64_t *)&unk_2698F8830);
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v19, v9);
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8880);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 0, 1, v20);
    }
    sub_24E563530(v0[12], &qword_2698F8858);
    return MEMORY[0x270FA2498](sub_24E82F1B0, 0, 0);
  }
}

uint64_t sub_24E82FE6C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E82FEA4()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_authorizationStatus);

  return sub_24E64781C((uint64_t)v1, (uint64_t)&unk_27005ADA8);
}

uint64_t _s24MockCoreLocationDelegateCMa()
{
  return self;
}

uint64_t sub_24E82FF44(uint64_t a1)
{
  return sub_24E82ECDC(a1, *(void *)(v1 + 16));
}

uint64_t sub_24E82FF4C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8820);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F8818) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v18 = *(void *)(v6 + 64);
  uint64_t v9 = sub_24E862168();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = *(void *)(v10 + 64);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8840);
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v0 + v8, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0 + v8, v12);
  }
  uint64_t v14 = (v8 + v18 + v11) & ~v11;
  uint64_t v15 = v14 + v17;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v9);

  return MEMORY[0x270FA0238](v0, v15, v3 | v7 | v11 | 7);
}

uint64_t sub_24E830198(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F8820) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F8818) - 8);
  unint64_t v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(sub_24E862168() - 8) + 80);
  unint64_t v11 = v8 + v9 + v10;
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = v1 + v8;
  uint64_t v16 = v1 + (v11 & ~v10);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  *uint64_t v17 = v2;
  v17[1] = sub_24E56A260;
  return sub_24E82EDAC(a1, v12, v13, v14, v15, v16);
}

uint64_t sub_24E830354(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static UserLocationProvider.Subscription.== infix(_:_:)()
{
  return 1;
}

uint64_t UserLocationProvider.Subscription.hash(into:)()
{
  return sub_24E864A68();
}

uint64_t UserLocationProvider.Subscription.hashValue.getter()
{
  return sub_24E864A98();
}

unint64_t sub_24E830414()
{
  unint64_t result = qword_2698F8890;
  if (!qword_2698F8890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F8890);
  }
  return result;
}

unsigned char *_s12SubscriptionOwst(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E830504);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserLocationProvider.Subscription()
{
  return &type metadata for UserLocationProvider.Subscription;
}

uint64_t sub_24E83053C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v16 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_23;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v12 >= v7) {
      goto LABEL_25;
    }
    unint64_t v13 = *(void *)(v16 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_25;
      }
      unint64_t v13 = *(void *)(v16 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_25;
        }
        unint64_t v13 = *(void *)(v16 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v7) {
            goto LABEL_25;
          }
          unint64_t v13 = *(void *)(v16 + 8 * v9);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_23:
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    sub_24E863FB8();
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    uint64_t result = a2(v15);
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_25:
    swift_release();
    return v17;
  }
  unint64_t v13 = *(void *)(v16 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_25;
    }
    unint64_t v13 = *(void *)(v16 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24E830748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v154 = a2;
  uint64_t v7 = sub_24E862168();
  uint64_t v152 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v142 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v138 = (char *)&v135 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v141 = (char *)&v135 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v137 = (char *)&v135 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v135 - v16;
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70F8);
  uint64_t v18 = MEMORY[0x270FA5388](v155);
  v143 = (char *)&v135 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v140 = (uint64_t)&v135 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v136 = (uint64_t)&v135 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v139 = (uint64_t)&v135 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v135 = (uint64_t)&v135 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v151 = (uint64_t)&v135 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v144 = (char *)&v135 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v135 - v32;
  uint64_t v34 = sub_24E863FB8();
  uint64_t v145 = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v157 = a3;
  sub_24E863FA8();
  uint64_t v160 = v34;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v35 = v3 + OBJC_IVAR____TtC12FindMyUICore19DeviceImageProvider___observationRegistrar;
  uint64_t v165 = v4;
  uint64_t v158 = sub_24E85E898(&qword_2698F7100, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider);
  uint64_t v161 = v35;
  sub_24E8617C8();
  swift_release();
  uint64_t v36 = v4 + OBJC_IVAR____TtC12FindMyUICore19DeviceImageProvider__storage;
  swift_beginAccess();
  sub_24E576EA0(v36, (uint64_t)v33, &qword_2698F70F8);
  swift_release();
  uint64_t v37 = v152;
  v149 = *(void (**)(char *, char *, uint64_t))(v152 + 16);
  uint64_t v150 = v152 + 16;
  v149(v17, v33, v7);
  sub_24E563530((uint64_t)v33, &qword_2698F70F8);
  swift_bridgeObjectRetain_n();
  uint64_t v38 = v157;
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_24E862148();
  uint64_t v40 = v7;
  os_log_type_t v41 = sub_24E864268();
  BOOL v42 = os_log_type_enabled(v39, v41);
  uint64_t v156 = a1;
  uint64_t v146 = v4;
  uint64_t v153 = v40;
  uint64_t v159 = v36;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    v148 = (char *)swift_slowAlloc();
    v162 = v148;
    *(_DWORD *)uint64_t v43 = 136315394;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    type metadata accessor for DeviceImageProvider.Subscription();
    sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_24E864118();
    unint64_t v46 = v45;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v163 = sub_24E55B02C(v44, v46, (uint64_t *)&v162);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v38 = v157;
    uint64_t v163 = v154;
    uint64_t v164 = v157;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_24E863CC8();
    unint64_t v49 = v48;
    swift_release();
    uint64_t v163 = sub_24E55B02C(v47, v49, (uint64_t *)&v162);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v39, v41, "Provider: subscriptions\n- subscriptions: %s\n- subscriber: %s", (uint8_t *)v43, 0x16u);
    uint64_t v50 = v148;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v50, -1, -1);
    MEMORY[0x2533435F0](v43, -1, -1);

    v148 = *(char **)(v152 + 8);
    ((void (*)(char *, uint64_t))v148)(v17, v153);
    uint64_t v52 = v155;
    uint64_t v51 = v156;
    uint64_t v4 = v146;
    uint64_t v36 = v159;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v148 = *(char **)(v37 + 8);
    ((void (*)(char *, uint64_t))v148)(v17, v40);
    uint64_t v51 = a1;
    uint64_t v52 = v155;
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v163 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v53 = (uint64_t)v144;
  sub_24E576EA0(v36, (uint64_t)v144, &qword_2698F70F8);
  swift_release();
  uint64_t v147 = *(void *)(v53 + *(int *)(v52 + 40));
  swift_bridgeObjectRetain();
  sub_24E563530(v53, &qword_2698F70F8);
  if (*(void *)(v51 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    uint64_t v54 = v38;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v163 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v163 = v4;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    uint64_t v55 = v159;
    swift_beginAccess();
    uint64_t v56 = *(int *)(v155 + 36);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v162 = *(char **)(v55 + v56);
    *(void *)(v55 + v56) = 0x8000000000000000;
    sub_24E61F02C(v156, v154, v54, isUniquelyReferenced_nonNull_native);
    *(void *)(v55 + v56) = v162;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v163 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v163 = v4;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    sub_24E60AC54(v154, v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24E83AF50(&qword_2698F70F8, &qword_2698F8920);
  swift_endAccess();
  uint64_t v163 = v4;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v163 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v58 = v159;
  uint64_t v59 = v151;
  sub_24E576EA0(v159, v151, &qword_2698F70F8);
  swift_release();
  uint64_t v60 = v155;
  uint64_t v61 = swift_bridgeObjectRetain();
  uint64_t v62 = sub_24E83053C(v61, sub_24E6509FC);
  swift_bridgeObjectRelease();
  sub_24E563530(v59, &qword_2698F70F8);
  uint64_t v63 = sub_24E85CF50(v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v163 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v163 = v4;
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  swift_beginAccess();
  uint64_t v64 = *(int *)(v60 + 40);
  swift_bridgeObjectRelease();
  *(void *)(v58 + v64) = v63;
  sub_24E83B1D0();
  swift_endAccess();
  uint64_t v163 = v4;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  uint64_t v65 = v147;
  uint64_t v66 = v156;
  if (*(void *)(v147 + 16) <= *(void *)(v156 + 16) >> 3)
  {
    uint64_t v163 = v156;
    swift_bridgeObjectRetain();
    sub_24E84E03C(v65);
    uint64_t v67 = v163;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_24E851284(v65, v66);
  }
  uint64_t v68 = v159;
  uint64_t v69 = v153;
  if (*(void *)(v63 + 16) <= *(void *)(v65 + 16) >> 3)
  {
    uint64_t v163 = v65;
    swift_bridgeObjectRetain();
    sub_24E84E03C(v63);
    uint64_t v70 = v163;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_24E851284(v63, v65);
  }
  uint64_t v71 = *(void *)(v70 + 16);
  uint64_t v151 = v67;
  if (v71)
  {
    v144 = (char *)v63;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v163 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v72 = v139;
    sub_24E576EA0(v68, v139, &qword_2698F70F8);
    swift_release();
    uint64_t v73 = v141;
    uint64_t v74 = v69;
    v149(v141, (char *)v72, v69);
    sub_24E563530(v72, &qword_2698F70F8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v75 = sub_24E862148();
    int v76 = sub_24E864268();
    if (os_log_type_enabled(v75, (os_log_type_t)v76))
    {
      LODWORD(v139) = v76;
      uint64_t v77 = swift_slowAlloc();
      v137 = (char *)swift_slowAlloc();
      v162 = v137;
      *(_DWORD *)uint64_t v77 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      type metadata accessor for DeviceImageProvider.Subscription();
      sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_24E864118();
      unint64_t v80 = v79;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v163 = sub_24E55B02C(v78, v80, (uint64_t *)&v162);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v77 + 12) = 2160;
      uint64_t v163 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v77 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v163 = v154;
      uint64_t v164 = v157;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_24E863CC8();
      unint64_t v83 = v82;
      swift_release();
      uint64_t v163 = sub_24E55B02C(v81, v83, (uint64_t *)&v162);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v75, (os_log_type_t)v139, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- SubscriptionsThatDoNotExistAnymore: %s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v77, 0x20u);
      uint64_t v84 = v137;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v84, -1, -1);
      MEMORY[0x2533435F0](v77, -1, -1);

      ((void (*)(char *, uint64_t))v148)(v141, v153);
      swift_bridgeObjectRelease();
      uint64_t v4 = v146;
      uint64_t v68 = v159;
      uint64_t v85 = v151;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v148)(v73, v74);
      swift_bridgeObjectRelease();
      uint64_t v85 = v151;
    }
    _s12FindMyUICore19DeviceImageProviderC28didRemoveUniqueSubscriptions07removedJ07isEmptyyShyAC12SubscriptionVG_SbtF_0(v70);
    if (*(void *)(v85 + 16))
    {
LABEL_50:
      swift_bridgeObjectRelease();
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v163 = v4;
      sub_24E8617C8();
      swift_release();
      uint64_t v98 = v140;
      sub_24E576EA0(v68, v140, &qword_2698F70F8);
      swift_release();
      uint64_t v99 = v142;
      uint64_t v100 = v68;
      uint64_t v101 = v153;
      v149(v142, (char *)v98, v153);
      sub_24E563530(v98, &qword_2698F70F8);
      uint64_t v102 = v157;
      swift_bridgeObjectRetain_n();
      uint64_t v103 = v151;
      swift_bridgeObjectRetain_n();
      uint64_t v104 = sub_24E862148();
      int v105 = sub_24E864268();
      if (os_log_type_enabled(v104, (os_log_type_t)v105))
      {
        LODWORD(v150) = v105;
        uint64_t v106 = swift_slowAlloc();
        v149 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
        v162 = (char *)v149;
        *(_DWORD *)uint64_t v106 = 136315394;
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        type metadata accessor for DeviceImageProvider.Subscription();
        sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
        swift_bridgeObjectRetain();
        uint64_t v107 = sub_24E864118();
        unint64_t v109 = v108;
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v163 = sub_24E55B02C(v107, v109, (uint64_t *)&v162);
        sub_24E8643A8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v106 + 12) = 2080;
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v110 = v157;
        uint64_t v163 = v154;
        uint64_t v164 = v157;
        swift_bridgeObjectRetain();
        uint64_t v111 = sub_24E863CC8();
        unint64_t v113 = v112;
        swift_release();
        uint64_t v163 = sub_24E55B02C(v111, v113, (uint64_t *)&v162);
        sub_24E8643A8();
        uint64_t v114 = v110;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E553000, v104, (os_log_type_t)v150, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- subscriptionsThatDidNotExistBefore: %s\n- subscriber: %s", (uint8_t *)v106, 0x16u);
        v115 = v149;
        swift_arrayDestroy();
        MEMORY[0x2533435F0](v115, -1, -1);
        MEMORY[0x2533435F0](v106, -1, -1);

        ((void (*)(char *, uint64_t))v148)(v142, v153);
        swift_bridgeObjectRelease();
        uint64_t v4 = v146;
        uint64_t v116 = v155;
        uint64_t v117 = (uint64_t)v143;
        uint64_t v100 = v159;
        uint64_t v103 = v151;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        ((void (*)(char *, uint64_t))v148)(v99, v101);
        swift_bridgeObjectRelease();
        uint64_t v117 = (uint64_t)v143;
        uint64_t v114 = v102;
        uint64_t v116 = v155;
      }
      uint64_t v118 = v4;
      _s12FindMyUICore19DeviceImageProviderC28didAddNewUniqueSubscriptions05addedK08wasEmptyyShyAC12SubscriptionVG_SbtF_0(v103);
      swift_bridgeObjectRelease();
      uint64_t v119 = v114;
      goto LABEL_71;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v163 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v86 = v135;
    sub_24E576EA0(v68, v135, &qword_2698F70F8);
    swift_release();
    uint64_t v87 = v137;
    v149(v137, (char *)v86, v69);
    sub_24E563530(v86, &qword_2698F70F8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v88 = sub_24E862148();
    os_log_type_t v89 = sub_24E864268();
    if (os_log_type_enabled(v88, v89))
    {
      uint64_t v90 = swift_slowAlloc();
      v144 = (char *)swift_slowAlloc();
      v162 = v144;
      *(_DWORD *)uint64_t v90 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      type metadata accessor for DeviceImageProvider.Subscription();
      sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
      swift_bridgeObjectRetain();
      uint64_t v91 = sub_24E864118();
      unint64_t v93 = v92;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v163 = sub_24E55B02C(v91, v93, (uint64_t *)&v162);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v90 + 12) = 2160;
      uint64_t v163 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v90 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v163 = v154;
      uint64_t v164 = v157;
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_24E863CC8();
      unint64_t v96 = v95;
      swift_release();
      uint64_t v163 = sub_24E55B02C(v94, v96, (uint64_t *)&v162);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v88, v89, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v90, 0x20u);
      uint64_t v97 = (uint64_t)v144;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v97, -1, -1);
      MEMORY[0x2533435F0](v90, -1, -1);

      ((void (*)(char *, uint64_t))v148)(v137, v153);
      uint64_t v4 = v146;
      uint64_t v68 = v159;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v148)(v87, v69);
      uint64_t v68 = v159;
    }
    if (*(void *)(v151 + 16)) {
      goto LABEL_50;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v163 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v120 = v136;
  sub_24E576EA0(v68, v136, &qword_2698F70F8);
  swift_release();
  v121 = v138;
  uint64_t v100 = v68;
  uint64_t v122 = v153;
  v149(v138, (char *)v120, v153);
  sub_24E563530(v120, &qword_2698F70F8);
  uint64_t v118 = v4;
  uint64_t v119 = v157;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v123 = sub_24E862148();
  os_log_type_t v124 = sub_24E864268();
  if (os_log_type_enabled(v123, v124))
  {
    uint64_t v125 = swift_slowAlloc();
    uint64_t v126 = swift_slowAlloc();
    v162 = (char *)v126;
    *(_DWORD *)uint64_t v125 = 136315651;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    type metadata accessor for DeviceImageProvider.Subscription();
    sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v127 = sub_24E864118();
    unint64_t v129 = v128;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v163 = sub_24E55B02C(v127, v129, (uint64_t *)&v162);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v125 + 12) = 2160;
    uint64_t v163 = 1752392040;
    sub_24E8643A8();
    *(_WORD *)(v125 + 22) = 2081;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v119 = v157;
    uint64_t v163 = v154;
    uint64_t v164 = v157;
    swift_bridgeObjectRetain();
    uint64_t v130 = sub_24E863CC8();
    unint64_t v132 = v131;
    swift_release();
    uint64_t v163 = sub_24E55B02C(v130, v132, (uint64_t *)&v162);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v123, v124, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v125, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v126, -1, -1);
    MEMORY[0x2533435F0](v125, -1, -1);

    ((void (*)(char *, uint64_t))v148)(v138, v153);
    uint64_t v118 = v146;
    uint64_t v116 = v155;
    uint64_t v117 = (uint64_t)v143;
    uint64_t v100 = v159;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    ((void (*)(char *, uint64_t))v148)(v121, v122);
    uint64_t v117 = (uint64_t)v143;
    uint64_t v116 = v155;
  }
LABEL_71:
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v163 = v118;
  sub_24E8617C8();
  swift_release();
  sub_24E576EA0(v100, v117, &qword_2698F70F8);
  swift_release();
  v133 = *(void (**)(uint64_t, uint64_t *))(v117 + *(int *)(v116 + 48));
  swift_retain();
  sub_24E563530(v117, &qword_2698F70F8);
  uint64_t v163 = v154;
  uint64_t v164 = v119;
  v133(v156, &v163);
  swift_release();
  return swift_release();
}

uint64_t sub_24E83281C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v161 = a2;
  uint64_t v7 = sub_24E862168();
  uint64_t v159 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v149 = (char *)&v142 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v145 = (char *)&v142 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v148 = (char *)&v142 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  os_log_t v144 = (os_log_t)((char *)&v142 - v15);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v142 - v16;
  uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70E8);
  uint64_t v18 = MEMORY[0x270FA5388](v162);
  uint64_t v150 = (char *)&v142 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v147 = (uint64_t)&v142 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v143 = (uint64_t)&v142 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v146 = (uint64_t)&v142 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v142 = (uint64_t)&v142 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v158 = (uint64_t)&v142 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v151 = (uint64_t)&v142 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v142 - v32;
  uint64_t v34 = sub_24E863FB8();
  uint64_t v152 = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v164 = a3;
  sub_24E863FA8();
  uint64_t v167 = v34;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v35 = v3 + OBJC_IVAR____TtC12FindMyUICore22MapsDirectionsProvider___observationRegistrar;
  uint64_t v172 = v4;
  uint64_t v165 = sub_24E85E898(&qword_2698F70F0, (void (*)(uint64_t))type metadata accessor for MapsDirectionsProvider);
  uint64_t v168 = v35;
  sub_24E8617C8();
  swift_release();
  uint64_t v36 = v4 + OBJC_IVAR____TtC12FindMyUICore22MapsDirectionsProvider__storage;
  swift_beginAccess();
  sub_24E576EA0(v36, (uint64_t)v33, &qword_2698F70E8);
  swift_release();
  uint64_t v37 = v159;
  uint64_t v156 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
  uint64_t v157 = v159 + 16;
  v156(v17, v33, v7);
  sub_24E563530((uint64_t)v33, &qword_2698F70E8);
  swift_bridgeObjectRetain_n();
  uint64_t v38 = v164;
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_24E862148();
  uint64_t v40 = v7;
  os_log_type_t v41 = sub_24E864268();
  BOOL v42 = os_log_type_enabled(v39, v41);
  uint64_t v163 = a1;
  uint64_t v153 = v4;
  uint64_t v160 = v40;
  uint64_t v166 = v36;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v155 = (void (*)(void, void))swift_slowAlloc();
    v169 = v155;
    *(_DWORD *)uint64_t v43 = 136315394;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24E74B038();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_24E864118();
    unint64_t v46 = v45;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v170 = sub_24E55B02C(v44, v46, (uint64_t *)&v169);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v38 = v164;
    uint64_t v170 = v161;
    uint64_t v171 = v164;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_24E863CC8();
    unint64_t v49 = v48;
    swift_release();
    uint64_t v170 = sub_24E55B02C(v47, v49, (uint64_t *)&v169);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v39, v41, "Provider: subscriptions\n- subscriptions: %s\n- subscriber: %s", (uint8_t *)v43, 0x16u);
    uint64_t v50 = v155;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v50, -1, -1);
    MEMORY[0x2533435F0](v43, -1, -1);

    uint64_t v155 = *(void (**)(void, void))(v159 + 8);
    v155(v17, v160);
    uint64_t v52 = v162;
    uint64_t v51 = v163;
    uint64_t v4 = v153;
    uint64_t v36 = v166;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v155 = *(void (**)(void, void))(v37 + 8);
    v155(v17, v40);
    uint64_t v51 = a1;
    uint64_t v52 = v162;
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v170 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v53 = v151;
  sub_24E576EA0(v36, v151, &qword_2698F70E8);
  swift_release();
  uint64_t v154 = *(void *)(v53 + *(int *)(v52 + 40));
  swift_bridgeObjectRetain();
  sub_24E563530(v53, &qword_2698F70E8);
  if (*(void *)(v51 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    uint64_t v54 = v38;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v170 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v170 = v4;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    uint64_t v55 = v166;
    swift_beginAccess();
    uint64_t v56 = *(int *)(v162 + 36);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v169 = *(void (**)(void, void))(v55 + v56);
    *(void *)(v55 + v56) = 0x8000000000000000;
    sub_24E61F058(v163, v161, v54, isUniquelyReferenced_nonNull_native);
    *(void *)(v55 + v56) = v169;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v170 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v170 = v4;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    sub_24E60AC80(v161, v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_24E83AF50(&qword_2698F70E8, &qword_2698F8928);
  swift_endAccess();
  uint64_t v170 = v4;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v170 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v58 = v166;
  uint64_t v59 = v158;
  sub_24E576EA0(v166, v158, &qword_2698F70E8);
  swift_release();
  uint64_t v60 = v162;
  uint64_t v61 = swift_bridgeObjectRetain();
  uint64_t v62 = sub_24E83053C(v61, sub_24E651340);
  swift_bridgeObjectRelease();
  sub_24E563530(v59, &qword_2698F70E8);
  uint64_t v63 = sub_24E85D540(v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v170 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v170 = v4;
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  swift_beginAccess();
  uint64_t v64 = *(int *)(v60 + 40);
  swift_bridgeObjectRelease();
  *(void *)(v58 + v64) = v63;
  sub_24E83B468(&qword_2698F70E8, (void (*)(void))sub_24E74B038);
  swift_endAccess();
  uint64_t v170 = v4;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  uint64_t v65 = v154;
  uint64_t v66 = v163;
  if (*(void *)(v154 + 16) <= *(void *)(v163 + 16) >> 3)
  {
    uint64_t v170 = v163;
    swift_bridgeObjectRetain();
    sub_24E84E620(v65);
    uint64_t v67 = v170;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_24E851978(v65, v66);
  }
  uint64_t v68 = v166;
  if (*(void *)(v63 + 16) <= *(void *)(v65 + 16) >> 3)
  {
    uint64_t v170 = v65;
    swift_bridgeObjectRetain();
    sub_24E84E620(v63);
    uint64_t v69 = v170;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_24E851978(v63, v65);
  }
  uint64_t v70 = *(void *)(v69 + 16);
  uint64_t v158 = v67;
  if (v70)
  {
    uint64_t v151 = v63;
    uint64_t v71 = v69;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v170 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v72 = v146;
    sub_24E576EA0(v68, v146, &qword_2698F70E8);
    swift_release();
    uint64_t v73 = v148;
    uint64_t v74 = v160;
    v156(v148, (char *)v72, v160);
    sub_24E563530(v72, &qword_2698F70E8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v75 = sub_24E862148();
    os_log_type_t v76 = sub_24E864268();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v146 = v71;
      os_log_type_t v77 = v76;
      os_log_t v144 = v75;
      uint64_t v78 = swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      v169 = (void (*)(void, void))v79;
      *(_DWORD *)uint64_t v78 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24E74B038();
      swift_bridgeObjectRetain();
      uint64_t v80 = sub_24E864118();
      unint64_t v82 = v81;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v170 = sub_24E55B02C(v80, v82, (uint64_t *)&v169);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v78 + 12) = 2160;
      uint64_t v170 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v78 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      char isCurrentExecutor = swift_task_isCurrentExecutor();
      uint64_t v84 = v151;
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v170 = v161;
      uint64_t v171 = v164;
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_24E863CC8();
      unint64_t v87 = v86;
      swift_release();
      uint64_t v170 = sub_24E55B02C(v85, v87, (uint64_t *)&v169);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v88 = v144;
      _os_log_impl(&dword_24E553000, v144, v77, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- SubscriptionsThatDoNotExistAnymore: %s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v78, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v79, -1, -1);
      MEMORY[0x2533435F0](v78, -1, -1);

      v155(v148, v160);
      uint64_t v4 = v153;
      uint64_t v89 = v158;
      uint64_t v90 = v146;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v155(v73, v74);
      uint64_t v89 = v158;
      uint64_t v84 = v151;
      uint64_t v90 = v71;
    }
    uint64_t v104 = *(void *)(v84 + 16);
    swift_bridgeObjectRelease();
    MapsDirectionsProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:)(v90, v104 == 0);
    if (*(void *)(v89 + 16))
    {
LABEL_50:
      swift_bridgeObjectRelease();
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_getKeyPath();
      uint64_t v170 = v4;
      sub_24E8617C8();
      swift_release();
      uint64_t v105 = v166;
      uint64_t v106 = v147;
      sub_24E576EA0(v166, v147, &qword_2698F70E8);
      swift_release();
      uint64_t v107 = v149;
      uint64_t v108 = v160;
      v156(v149, (char *)v106, v160);
      sub_24E563530(v106, &qword_2698F70E8);
      uint64_t v109 = v164;
      swift_bridgeObjectRetain_n();
      uint64_t v110 = v158;
      swift_bridgeObjectRetain_n();
      uint64_t v111 = sub_24E862148();
      int v112 = sub_24E864268();
      if (os_log_type_enabled(v111, (os_log_type_t)v112))
      {
        LODWORD(v157) = v112;
        uint64_t v113 = swift_slowAlloc();
        uint64_t v156 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
        v169 = (void (*)(void, void))v156;
        *(_DWORD *)uint64_t v113 = 136315394;
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_24E74B038();
        swift_bridgeObjectRetain();
        uint64_t v114 = sub_24E864118();
        unint64_t v116 = v115;
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v170 = sub_24E55B02C(v114, v116, (uint64_t *)&v169);
        sub_24E8643A8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v113 + 12) = 2080;
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v117 = v164;
        uint64_t v170 = v161;
        uint64_t v171 = v164;
        swift_bridgeObjectRetain();
        uint64_t v118 = sub_24E863CC8();
        unint64_t v120 = v119;
        swift_release();
        uint64_t v170 = sub_24E55B02C(v118, v120, (uint64_t *)&v169);
        sub_24E8643A8();
        uint64_t v121 = v117;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E553000, v111, (os_log_type_t)v157, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- subscriptionsThatDidNotExistBefore: %s\n- subscriber: %s", (uint8_t *)v113, 0x16u);
        uint64_t v122 = v156;
        swift_arrayDestroy();
        MEMORY[0x2533435F0](v122, -1, -1);
        MEMORY[0x2533435F0](v113, -1, -1);

        v155(v149, v160);
        swift_bridgeObjectRelease();
        uint64_t v4 = v153;
        uint64_t v123 = v162;
        uint64_t v124 = (uint64_t)v150;
        uint64_t v105 = v166;
        uint64_t v110 = v158;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        v155(v107, v108);
        swift_bridgeObjectRelease();
        uint64_t v124 = (uint64_t)v150;
        uint64_t v121 = v109;
        uint64_t v123 = v162;
      }
      uint64_t v125 = v4;
      _s12FindMyUICore22MapsDirectionsProviderC28didAddNewUniqueSubscriptions05addedK08wasEmptyyShyAC10InputValueO11DestinationV10IdentifierVG_SbtF_0(v110);
      swift_bridgeObjectRelease();
      uint64_t v126 = v121;
      goto LABEL_71;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v170 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v91 = v142;
    sub_24E576EA0(v68, v142, &qword_2698F70E8);
    swift_release();
    os_log_t v92 = v144;
    uint64_t v93 = v160;
    v156((char *)v144, (char *)v91, v160);
    sub_24E563530(v91, &qword_2698F70E8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v94 = sub_24E862148();
    int v95 = sub_24E864268();
    if (os_log_type_enabled(v94, (os_log_type_t)v95))
    {
      LODWORD(v151) = v95;
      uint64_t v96 = swift_slowAlloc();
      uint64_t v97 = swift_slowAlloc();
      v169 = (void (*)(void, void))v97;
      *(_DWORD *)uint64_t v96 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24E74B038();
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_24E864118();
      unint64_t v100 = v99;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v170 = sub_24E55B02C(v98, v100, (uint64_t *)&v169);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v96 + 12) = 2160;
      uint64_t v170 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v96 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v170 = v161;
      uint64_t v171 = v164;
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_24E863CC8();
      unint64_t v103 = v102;
      swift_release();
      uint64_t v170 = sub_24E55B02C(v101, v103, (uint64_t *)&v169);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v94, (os_log_type_t)v151, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v96, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v97, -1, -1);
      MEMORY[0x2533435F0](v96, -1, -1);

      v155(v144, v160);
      uint64_t v4 = v153;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v155(v92, v93);
    }
    if (*(void *)(v158 + 16)) {
      goto LABEL_50;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v170 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v105 = v166;
  uint64_t v127 = v143;
  sub_24E576EA0(v166, v143, &qword_2698F70E8);
  swift_release();
  unint64_t v128 = v145;
  uint64_t v129 = v160;
  v156(v145, (char *)v127, v160);
  sub_24E563530(v127, &qword_2698F70E8);
  uint64_t v125 = v4;
  uint64_t v126 = v164;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v130 = sub_24E862148();
  os_log_type_t v131 = sub_24E864268();
  if (os_log_type_enabled(v130, v131))
  {
    uint64_t v132 = swift_slowAlloc();
    uint64_t v133 = swift_slowAlloc();
    v169 = (void (*)(void, void))v133;
    *(_DWORD *)uint64_t v132 = 136315651;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24E74B038();
    swift_bridgeObjectRetain();
    uint64_t v134 = sub_24E864118();
    unint64_t v136 = v135;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v170 = sub_24E55B02C(v134, v136, (uint64_t *)&v169);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v132 + 12) = 2160;
    uint64_t v170 = 1752392040;
    sub_24E8643A8();
    *(_WORD *)(v132 + 22) = 2081;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v126 = v164;
    uint64_t v170 = v161;
    uint64_t v171 = v164;
    swift_bridgeObjectRetain();
    uint64_t v137 = sub_24E863CC8();
    unint64_t v139 = v138;
    swift_release();
    uint64_t v170 = sub_24E55B02C(v137, v139, (uint64_t *)&v169);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v130, v131, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v132, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v133, -1, -1);
    MEMORY[0x2533435F0](v132, -1, -1);

    v155(v145, v160);
    uint64_t v125 = v153;
    uint64_t v123 = v162;
    uint64_t v124 = (uint64_t)v150;
    uint64_t v105 = v166;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v155(v128, v129);
    uint64_t v124 = (uint64_t)v150;
    uint64_t v123 = v162;
  }
LABEL_71:
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v170 = v125;
  sub_24E8617C8();
  swift_release();
  sub_24E576EA0(v105, v124, &qword_2698F70E8);
  swift_release();
  uint64_t v140 = *(void (**)(uint64_t, uint64_t *))(v124 + *(int *)(v123 + 48));
  swift_retain();
  sub_24E563530(v124, &qword_2698F70E8);
  uint64_t v170 = v161;
  uint64_t v171 = v126;
  v140(v163, &v170);
  swift_release();
  return swift_release();
}

uint64_t sub_24E8347FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v168 = a3;
  uint64_t v164 = a2;
  uint64_t v166 = a1;
  uint64_t v5 = sub_24E862168();
  uint64_t v162 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v143 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v143 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v149 = (char *)&v143 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v145 = (char *)&v143 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v159 = (char *)&v143 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7108);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v151 = (char *)&v143 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v148 = (uint64_t)&v143 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v144 = (uint64_t)&v143 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v147 = (uint64_t)&v143 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v143 = (char *)&v143 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v158 = (char *)&v143 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v155 = (char *)&v143 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v143 - v32;
  uint64_t v34 = sub_24E863FB8();
  uint64_t v152 = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v150 = v8;
  uint64_t v146 = v11;
  sub_24E863FA8();
  uint64_t v167 = v34;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v35 = v3 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider___observationRegistrar;
  uint64_t v173 = v4;
  uint64_t v36 = sub_24E85E898((unint64_t *)&qword_2698F7110, (void (*)(uint64_t))type metadata accessor for UserLocationProvider);
  uint64_t v160 = v35;
  uint64_t v161 = v36;
  sub_24E8617C8();
  swift_release();
  uint64_t v37 = v4 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__storage;
  swift_beginAccess();
  sub_24E576EA0(v37, (uint64_t)v33, &qword_2698F7108);
  swift_release();
  uint64_t v38 = v162;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v162 + 16);
  uint64_t v40 = v159;
  uint64_t v157 = v162 + 16;
  uint64_t v156 = v39;
  v39(v159, (uint64_t)v33, v5);
  sub_24E563530((uint64_t)v33, &qword_2698F7108);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v41 = sub_24E862148();
  os_log_type_t v42 = sub_24E864268();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v169 = v17;
  uint64_t v163 = v5;
  uint64_t v165 = v37;
  uint64_t v153 = v4;
  if (v43)
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v154 = (char *)swift_slowAlloc();
    uint64_t v170 = v154;
    *(_DWORD *)uint64_t v44 = 136315394;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24E74B08C();
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_24E864118();
    unint64_t v47 = v46;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v171 = sub_24E55B02C(v45, v47, (uint64_t *)&v170);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v171 = v164;
    uint64_t v172 = v168;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_24E863CC8();
    unint64_t v50 = v49;
    swift_release();
    uint64_t v171 = sub_24E55B02C(v48, v50, (uint64_t *)&v170);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v41, v42, "Provider: subscriptions\n- subscriptions: %s\n- subscriber: %s", (uint8_t *)v44, 0x16u);
    uint64_t v51 = v154;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v51, -1, -1);
    MEMORY[0x2533435F0](v44, -1, -1);

    uint64_t v154 = *(char **)(v162 + 8);
    ((void (*)(char *, uint64_t))v154)(v159, v163);
    uint64_t v4 = v153;
    uint64_t v52 = v169;
    uint64_t v37 = v165;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v154 = *(char **)(v38 + 8);
    ((void (*)(char *, uint64_t))v154)(v40, v5);
    uint64_t v52 = v17;
  }
  uint64_t v53 = (uint64_t)v155;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v171 = v4;
  sub_24E8617C8();
  swift_release();
  sub_24E576EA0(v37, v53, &qword_2698F7108);
  swift_release();
  uint64_t v155 = *(char **)(v53 + *(int *)(v52 + 40));
  swift_bridgeObjectRetain();
  sub_24E563530(v53, &qword_2698F7108);
  uint64_t v54 = v166;
  if (*(void *)(v166 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v55 = v168;
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v171 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v171 = v4;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    uint64_t v56 = *(int *)(v169 + 36);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v170 = *(char **)(v37 + v56);
    *(void *)(v37 + v56) = 0x8000000000000000;
    sub_24E61F084(v54, v164, v55, isUniquelyReferenced_nonNull_native);
    *(void *)(v37 + v56) = v170;
  }
  else
  {
    uint64_t v58 = v168;
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v171 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v171 = v4;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    sub_24E60ACAC(v164, v58);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E83AF50(&qword_2698F7108, &qword_2698F88B0);
  swift_endAccess();
  uint64_t v171 = v4;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  uint64_t v59 = (uint64_t)v158;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v171 = v4;
  sub_24E8617C8();
  swift_release();
  sub_24E576EA0(v37, v59, &qword_2698F7108);
  swift_release();
  uint64_t v60 = swift_bridgeObjectRetain();
  uint64_t v61 = sub_24E83053C(v60, (uint64_t (*)(uint64_t))sub_24E651748);
  swift_bridgeObjectRelease();
  sub_24E563530(v59, &qword_2698F7108);
  uint64_t v62 = sub_24E85D5D8(v61);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v171 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v171 = v4;
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  swift_beginAccess();
  uint64_t v63 = *(int *)(v169 + 40);
  swift_bridgeObjectRelease();
  *(void *)(v37 + v63) = v62;
  sub_24E83B468(&qword_2698F7108, (void (*)(void))sub_24E74B08C);
  swift_endAccess();
  uint64_t v171 = v4;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  uint64_t v64 = (uint64_t)v155;
  uint64_t v65 = v166;
  if (*((void *)v155 + 2) <= *(void *)(v166 + 16) >> 3)
  {
    uint64_t v171 = v166;
    swift_bridgeObjectRetain();
    sub_24E84E7D8(v64);
    uint64_t v159 = (char *)v171;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v159 = (char *)sub_24E851DF4(v64, v65);
  }
  uint64_t v66 = v165;
  if (*(void *)(v62 + 16) <= *(void *)(v64 + 16) >> 3)
  {
    uint64_t v171 = v64;
    swift_bridgeObjectRetain();
    sub_24E84E7D8(v62);
    uint64_t v67 = v171;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_24E851DF4(v62, v64);
  }
  uint64_t v158 = (char *)v67;
  if (*(void *)(v67 + 16))
  {
    uint64_t v145 = (char *)v62;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v171 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v68 = v66;
    uint64_t v69 = v147;
    sub_24E576EA0(v68, v147, &qword_2698F7108);
    swift_release();
    uint64_t v70 = v149;
    uint64_t v71 = v163;
    v156(v149, v69, v163);
    sub_24E563530(v69, &qword_2698F7108);
    uint64_t v72 = v168;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v73 = sub_24E862148();
    int v74 = sub_24E864268();
    if (os_log_type_enabled(v73, (os_log_type_t)v74))
    {
      LODWORD(v147) = v74;
      uint64_t v75 = swift_slowAlloc();
      uint64_t v143 = (char *)swift_slowAlloc();
      uint64_t v170 = v143;
      *(_DWORD *)uint64_t v75 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24E74B08C();
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_24E864118();
      unint64_t v78 = v77;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v171 = sub_24E55B02C(v76, v78, (uint64_t *)&v170);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v75 + 12) = 2160;
      uint64_t v171 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v75 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      char isCurrentExecutor = swift_task_isCurrentExecutor();
      uint64_t v80 = v159;
      unint64_t v81 = v145;
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v171 = v164;
      uint64_t v172 = v168;
      swift_bridgeObjectRetain();
      uint64_t v82 = sub_24E863CC8();
      unint64_t v84 = v83;
      swift_release();
      uint64_t v171 = sub_24E55B02C(v82, v84, (uint64_t *)&v170);
      uint64_t v85 = v168;
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v73, (os_log_type_t)v147, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- SubscriptionsThatDoNotExistAnymore: %s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v75, 0x20u);
      uint64_t v86 = (uint64_t)v143;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v86, -1, -1);
      uint64_t v87 = v75;
      uint64_t v72 = v85;
      MEMORY[0x2533435F0](v87, -1, -1);

      ((void (*)(char *, uint64_t))v154)(v149, v163);
      uint64_t v4 = v153;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v154)(v70, v71);
      uint64_t v80 = v159;
      unint64_t v81 = v145;
    }
    uint64_t v104 = *((void *)v81 + 2);
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v105 = swift_allocObject();
    *(unsigned char *)(v105 + 16) = v104 == 0;
    *(void *)(v105 + 24) = v4;
    swift_retain();
    sub_24E860E88();
    swift_release();
    swift_release();
    swift_release();
    if (*((void *)v80 + 2)) {
      goto LABEL_53;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v171 = v4;
    sub_24E8617C8();
    swift_release();
    uint64_t v88 = v66;
    uint64_t v89 = (uint64_t)v143;
    sub_24E576EA0(v88, (uint64_t)v143, &qword_2698F7108);
    swift_release();
    uint64_t v90 = v145;
    uint64_t v91 = v163;
    v156(v145, v89, v163);
    sub_24E563530(v89, &qword_2698F7108);
    uint64_t v92 = v168;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v93 = sub_24E862148();
    os_log_type_t v94 = sub_24E864268();
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v95 = swift_slowAlloc();
      v149 = (char *)swift_slowAlloc();
      uint64_t v170 = v149;
      *(_DWORD *)uint64_t v95 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      sub_24E74B08C();
      swift_bridgeObjectRetain();
      uint64_t v96 = sub_24E864118();
      unint64_t v98 = v97;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v171 = sub_24E55B02C(v96, v98, (uint64_t *)&v170);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v95 + 12) = 2160;
      uint64_t v171 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v95 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v99 = v168;
      uint64_t v171 = v164;
      uint64_t v172 = v168;
      swift_bridgeObjectRetain();
      uint64_t v100 = sub_24E863CC8();
      unint64_t v102 = v101;
      swift_release();
      uint64_t v171 = sub_24E55B02C(v100, v102, (uint64_t *)&v170);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v72 = v99;
      _os_log_impl(&dword_24E553000, v93, v94, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v95, 0x20u);
      unint64_t v103 = v149;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v103, -1, -1);
      MEMORY[0x2533435F0](v95, -1, -1);

      ((void (*)(char *, uint64_t))v154)(v145, v163);
      uint64_t v4 = v153;
      if (*((void *)v159 + 2)) {
        goto LABEL_53;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v154)(v90, v91);
      uint64_t v72 = v92;
      if (*((void *)v159 + 2))
      {
LABEL_53:
        uint64_t v106 = v169;
        swift_bridgeObjectRelease();
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        swift_getKeyPath();
        uint64_t v171 = v4;
        sub_24E8617C8();
        swift_release();
        uint64_t v107 = v148;
        sub_24E576EA0(v165, v148, &qword_2698F7108);
        swift_release();
        uint64_t v108 = v150;
        uint64_t v109 = v163;
        v156(v150, v107, v163);
        sub_24E563530(v107, &qword_2698F7108);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v110 = sub_24E862148();
        os_log_type_t v111 = sub_24E864268();
        if (os_log_type_enabled(v110, v111))
        {
          uint64_t v112 = swift_slowAlloc();
          uint64_t v158 = (char *)swift_slowAlloc();
          uint64_t v170 = v158;
          *(_DWORD *)uint64_t v112 = 136315394;
          sub_24E863FA8();
          sub_24E863F18();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          sub_24E74B08C();
          swift_bridgeObjectRetain();
          uint64_t v113 = sub_24E864118();
          unint64_t v115 = v114;
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v171 = sub_24E55B02C(v113, v115, (uint64_t *)&v170);
          sub_24E8643A8();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v112 + 12) = 2080;
          sub_24E863FA8();
          sub_24E863F18();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          uint64_t v116 = v168;
          uint64_t v171 = v164;
          uint64_t v172 = v168;
          swift_bridgeObjectRetain();
          uint64_t v117 = sub_24E863CC8();
          unint64_t v119 = v118;
          swift_release();
          uint64_t v171 = sub_24E55B02C(v117, v119, (uint64_t *)&v170);
          sub_24E8643A8();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24E553000, v110, v111, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- subscriptionsThatDidNotExistBefore: %s\n- subscriber: %s", (uint8_t *)v112, 0x16u);
          unint64_t v120 = v158;
          swift_arrayDestroy();
          MEMORY[0x2533435F0](v120, -1, -1);
          MEMORY[0x2533435F0](v112, -1, -1);

          ((void (*)(char *, uint64_t))v154)(v150, v163);
          uint64_t v121 = v166;
          uint64_t v4 = v153;
          uint64_t v122 = v169;
          uint64_t v123 = v155;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          ((void (*)(char *, uint64_t))v154)(v108, v109);
          uint64_t v116 = v72;
          uint64_t v123 = v155;
          uint64_t v122 = v106;
          uint64_t v121 = v166;
        }
        uint64_t v124 = *((void *)v123 + 2);
        swift_bridgeObjectRelease();
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v125 = swift_allocObject();
        *(unsigned char *)(v125 + 16) = v124 == 0;
        *(void *)(v125 + 24) = v4;
        swift_retain();
        sub_24E860E88();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v126 = (uint64_t)v151;
        goto LABEL_75;
      }
    }
  }
  uint64_t v127 = v72;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v171 = v4;
  sub_24E8617C8();
  swift_release();
  uint64_t v128 = v144;
  sub_24E576EA0(v165, v144, &qword_2698F7108);
  swift_release();
  uint64_t v129 = v146;
  uint64_t v130 = v163;
  v156(v146, v128, v163);
  sub_24E563530(v128, &qword_2698F7108);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  os_log_type_t v131 = sub_24E862148();
  os_log_type_t v132 = sub_24E864268();
  if (os_log_type_enabled(v131, v132))
  {
    uint64_t v133 = swift_slowAlloc();
    uint64_t v159 = (char *)swift_slowAlloc();
    uint64_t v170 = v159;
    *(_DWORD *)uint64_t v133 = 136315651;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_24E74B08C();
    swift_bridgeObjectRetain();
    uint64_t v134 = sub_24E864118();
    unint64_t v136 = v135;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v171 = sub_24E55B02C(v134, v136, (uint64_t *)&v170);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v133 + 12) = 2160;
    uint64_t v171 = 1752392040;
    sub_24E8643A8();
    *(_WORD *)(v133 + 22) = 2081;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v116 = v168;
    uint64_t v171 = v164;
    uint64_t v172 = v168;
    swift_bridgeObjectRetain();
    uint64_t v137 = sub_24E863CC8();
    unint64_t v139 = v138;
    swift_release();
    uint64_t v171 = sub_24E55B02C(v137, v139, (uint64_t *)&v170);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v131, v132, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v133, 0x20u);
    uint64_t v140 = v159;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v140, -1, -1);
    MEMORY[0x2533435F0](v133, -1, -1);

    ((void (*)(char *, uint64_t))v154)(v146, v163);
    uint64_t v121 = v166;
    uint64_t v4 = v153;
    uint64_t v122 = v169;
    uint64_t v126 = (uint64_t)v151;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    ((void (*)(char *, uint64_t))v154)(v129, v130);
    uint64_t v116 = v127;
    uint64_t v122 = v169;
    uint64_t v126 = (uint64_t)v151;
    uint64_t v121 = v166;
  }
LABEL_75:
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v171 = v4;
  sub_24E8617C8();
  swift_release();
  sub_24E576EA0(v165, v126, &qword_2698F7108);
  swift_release();
  v141 = *(void (**)(uint64_t, uint64_t *))(v126 + *(int *)(v122 + 48));
  swift_retain();
  sub_24E563530(v126, &qword_2698F7108);
  uint64_t v171 = v164;
  uint64_t v172 = v116;
  v141(v121, &v171);
  swift_release();
  return swift_release();
}

uint64_t sub_24E836918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E838E48(a1, a2, a3, &qword_2698F7118, (uint64_t)"FindMyUICore/BeaconsInfoProvider.swift", 38, (uint64_t)&unk_24E871F30, &OBJC_IVAR____TtC12FindMyUICore19BeaconsInfoProvider___observationRegistrar, &qword_2698F7120, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider, (uint64_t)&protocol conformance descriptor for BeaconsInfoProvider, &OBJC_IVAR____TtC12FindMyUICore19BeaconsInfoProvider__storage, (void (*)(void))type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, &qword_2698F7148, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, (uint64_t)&protocol conformance descriptor for BeaconsInfoProvider.BeaconsSubscription, (void (*)(uint64_t, uint64_t))sub_24E60ACD8, &qword_2698F88A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E61F0B0,
           sub_24E651AB4,
           (uint64_t)sub_24E85D6B4,
           (uint64_t *)sub_24E83B6E0,
           (uint64_t (*)(char *, uint64_t))sub_24E852140,
           (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E84E9D0,
           (char *)BeaconsInfoProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:),
           (char *)BeaconsInfoProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:));
}

uint64_t sub_24E836A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v154 = a2;
  uint64_t v155 = sub_24E862168();
  uint64_t v153 = *(NSObject **)(v155 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v155);
  v141 = (char *)&v134 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v137 = (char *)&v134 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v140 = (char *)&v134 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v136 = (char *)&v134 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v134 - v15;
  uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7078);
  uint64_t v17 = MEMORY[0x270FA5388](v156);
  uint64_t v142 = (char *)&v134 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v139 = (uint64_t)&v134 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v135 = (uint64_t)&v134 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v138 = (uint64_t)&v134 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v134 = (uint64_t)&v134 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v150 = (uint64_t)&v134 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v144 = (uint64_t)&v134 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v134 - v31;
  uint64_t v33 = sub_24E863FB8();
  uint64_t v34 = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E863FA8();
  uint64_t v160 = v33;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v35 = v3 + OBJC_IVAR____TtC12FindMyUICore16ContactsProvider___observationRegistrar;
  uint64_t v164 = v4;
  uint64_t v157 = sub_24E85E898(&qword_2698F7080, (void (*)(uint64_t))type metadata accessor for ContactsProvider);
  uint64_t v159 = v35;
  sub_24E8617C8();
  swift_release();
  uint64_t v146 = v4;
  uint64_t v36 = v4 + OBJC_IVAR____TtC12FindMyUICore16ContactsProvider__storage;
  swift_beginAccess();
  uint64_t v151 = v36;
  sub_24E576EA0(v36, (uint64_t)v32, &qword_2698F7078);
  swift_release();
  uint64_t v37 = v153;
  isa = (void (*)(char *, uint64_t, uint64_t))v153[2].isa;
  uint64_t v39 = v155;
  os_log_t v148 = v153 + 2;
  uint64_t v147 = isa;
  isa(v16, (uint64_t)v32, v155);
  sub_24E563530((uint64_t)v32, &qword_2698F7078);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v40 = sub_24E862148();
  os_log_type_t v41 = sub_24E864268();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v152 = a1;
  uint64_t v158 = a3;
  uint64_t v143 = v34;
  if (v42)
  {
    uint64_t v43 = swift_slowAlloc();
    uint64_t v149 = swift_slowAlloc();
    uint64_t v161 = (char *)v149;
    *(_DWORD *)uint64_t v43 = 136315394;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    type metadata accessor for ContactsProvider.Subscription();
    sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_24E864118();
    unint64_t v46 = v45;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v162 = sub_24E55B02C(v44, v46, (uint64_t *)&v161);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v47 = v158;
    uint64_t v162 = v154;
    uint64_t v163 = v158;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_24E863CC8();
    unint64_t v50 = v49;
    swift_release();
    uint64_t v162 = sub_24E55B02C(v48, v50, (uint64_t *)&v161);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v40, v41, "Provider: subscriptions\n- subscriptions: %s\n- subscriber: %s", (uint8_t *)v43, 0x16u);
    uint64_t v51 = v149;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v51, -1, -1);
    MEMORY[0x2533435F0](v43, -1, -1);

    uint64_t v145 = (void (*)(char *, uint64_t))v153[1].isa;
    v145(v16, v155);
    a1 = v152;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v145 = (void (*)(char *, uint64_t))v37[1].isa;
    v145(v16, v39);
    uint64_t v47 = a3;
  }
  uint64_t v52 = v146;
  uint64_t v53 = v156;
  uint64_t v54 = v151;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v162 = v52;
  sub_24E8617C8();
  swift_release();
  uint64_t v55 = v144;
  sub_24E576EA0(v54, v144, &qword_2698F7078);
  swift_release();
  uint64_t v149 = *(void *)(v55 + *(int *)(v53 + 40));
  swift_bridgeObjectRetain();
  sub_24E563530(v55, &qword_2698F7078);
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v162 = v52;
    sub_24E8617C8();
    swift_release();
    uint64_t v162 = v52;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    uint64_t v56 = *(int *)(v156 + 36);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v161 = *(char **)(v54 + v56);
    *(void *)(v54 + v56) = 0x8000000000000000;
    sub_24E61F0DC(a1, v154, v47, isUniquelyReferenced_nonNull_native);
    *(void *)(v54 + v56) = v161;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v162 = v52;
    sub_24E8617C8();
    swift_release();
    uint64_t v162 = v52;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    sub_24E60AD04(v154, v47);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E83AF50(&qword_2698F7078, &qword_2698F8918);
  swift_endAccess();
  uint64_t v162 = v52;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v162 = v52;
  sub_24E8617C8();
  swift_release();
  uint64_t v58 = v52;
  uint64_t v59 = v150;
  sub_24E576EA0(v54, v150, &qword_2698F7078);
  swift_release();
  uint64_t v60 = v156;
  uint64_t v61 = swift_bridgeObjectRetain();
  uint64_t v62 = sub_24E83053C(v61, sub_24E6523F8);
  swift_bridgeObjectRelease();
  sub_24E563530(v59, &qword_2698F7078);
  uint64_t v63 = sub_24E85D844(v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v162 = v58;
  sub_24E8617C8();
  swift_release();
  uint64_t v162 = v58;
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  swift_beginAccess();
  uint64_t v64 = *(int *)(v60 + 40);
  swift_bridgeObjectRelease();
  *(void *)(v54 + v64) = v63;
  sub_24E83B978();
  swift_endAccess();
  uint64_t v162 = v58;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  uint64_t v65 = v149;
  uint64_t v66 = v152;
  uint64_t v67 = v58;
  if (*(void *)(v149 + 16) <= *(void *)(v152 + 16) >> 3)
  {
    uint64_t v162 = v152;
    swift_bridgeObjectRetain();
    sub_24E84EC88(v65);
    uint64_t v150 = v162;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v150 = sub_24E852C08(v65, v66);
  }
  uint64_t v68 = v151;
  uint64_t v69 = v155;
  if (*(void *)(v63 + 16) <= *(void *)(v65 + 16) >> 3)
  {
    uint64_t v162 = v65;
    swift_bridgeObjectRetain();
    sub_24E84EC88(v63);
    uint64_t v70 = v162;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_24E852C08(v63, v65);
  }
  uint64_t v144 = v70;
  if (*(void *)(v70 + 16))
  {
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v162 = v67;
    sub_24E8617C8();
    swift_release();
    uint64_t v71 = v138;
    sub_24E576EA0(v68, v138, &qword_2698F7078);
    swift_release();
    uint64_t v72 = v140;
    v147(v140, v71, v69);
    sub_24E563530(v71, &qword_2698F7078);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v73 = sub_24E862148();
    int v74 = sub_24E864268();
    if (os_log_type_enabled(v73, (os_log_type_t)v74))
    {
      LODWORD(v138) = v74;
      uint64_t v75 = swift_slowAlloc();
      unint64_t v136 = (char *)swift_slowAlloc();
      uint64_t v161 = v136;
      *(_DWORD *)uint64_t v75 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      type metadata accessor for ContactsProvider.Subscription();
      sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_24E864118();
      unint64_t v78 = v77;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v162 = sub_24E55B02C(v76, v78, (uint64_t *)&v161);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v75 + 12) = 2160;
      uint64_t v162 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v75 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v162 = v154;
      uint64_t v163 = v158;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_24E863CC8();
      unint64_t v81 = v80;
      swift_release();
      uint64_t v162 = sub_24E55B02C(v79, v81, (uint64_t *)&v161);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v73, (os_log_type_t)v138, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- SubscriptionsThatDoNotExistAnymore: %s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v75, 0x20u);
      uint64_t v82 = v136;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v82, -1, -1);
      MEMORY[0x2533435F0](v75, -1, -1);

      uint64_t v69 = v155;
      v145(v140, v155);
      uint64_t v67 = v146;
      uint64_t v68 = v151;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v145(v72, v69);
    }
    uint64_t v112 = *(void *)(v63 + 16);
    swift_bridgeObjectRelease();
    sub_24E7D2DDC(v112 == 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v162 = v67;
    sub_24E8617C8();
    swift_release();
    uint64_t v83 = v134;
    sub_24E576EA0(v68, v134, &qword_2698F7078);
    swift_release();
    unint64_t v84 = v136;
    v147(v136, v83, v69);
    sub_24E563530(v83, &qword_2698F7078);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v85 = sub_24E862148();
    int v86 = sub_24E864268();
    if (os_log_type_enabled(v85, (os_log_type_t)v86))
    {
      LODWORD(v140) = v86;
      uint64_t v87 = swift_slowAlloc();
      uint64_t v88 = swift_slowAlloc();
      uint64_t v161 = (char *)v88;
      *(_DWORD *)uint64_t v87 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      type metadata accessor for ContactsProvider.Subscription();
      sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
      swift_bridgeObjectRetain();
      uint64_t v89 = sub_24E864118();
      unint64_t v91 = v90;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v162 = sub_24E55B02C(v89, v91, (uint64_t *)&v161);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v87 + 12) = 2160;
      uint64_t v162 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v87 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v162 = v154;
      uint64_t v163 = v158;
      swift_bridgeObjectRetain();
      uint64_t v92 = sub_24E863CC8();
      unint64_t v94 = v93;
      swift_release();
      uint64_t v162 = sub_24E55B02C(v92, v94, (uint64_t *)&v161);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v85, (os_log_type_t)v140, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v87, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v88, -1, -1);
      MEMORY[0x2533435F0](v87, -1, -1);

      uint64_t v69 = v155;
      v145(v136, v155);
      uint64_t v67 = v146;
      uint64_t v68 = v151;
      if (*(void *)(v150 + 16)) {
        goto LABEL_60;
      }
      goto LABEL_48;
    }

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v145(v84, v69);
  }
  if (*(void *)(v150 + 16))
  {
LABEL_60:
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v162 = v67;
    sub_24E8617C8();
    swift_release();
    uint64_t v113 = v139;
    sub_24E576EA0(v68, v139, &qword_2698F7078);
    swift_release();
    unint64_t v114 = v141;
    v147(v141, v113, v69);
    sub_24E563530(v113, &qword_2698F7078);
    uint64_t v115 = v67;
    uint64_t v116 = v68;
    swift_bridgeObjectRetain_n();
    uint64_t v117 = v69;
    uint64_t v118 = v150;
    swift_bridgeObjectRetain_n();
    unint64_t v119 = sub_24E862148();
    os_log_type_t v120 = sub_24E864268();
    if (os_log_type_enabled(v119, v120))
    {
      os_log_type_t v121 = v120;
      os_log_t v148 = v119;
      uint64_t v122 = swift_slowAlloc();
      uint64_t v123 = swift_slowAlloc();
      uint64_t v161 = (char *)v123;
      *(_DWORD *)uint64_t v122 = 136315394;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      type metadata accessor for ContactsProvider.Subscription();
      sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
      swift_bridgeObjectRetain();
      uint64_t v124 = sub_24E864118();
      unint64_t v126 = v125;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v162 = sub_24E55B02C(v124, v126, (uint64_t *)&v161);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v122 + 12) = 2080;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v162 = v154;
      uint64_t v163 = v158;
      swift_bridgeObjectRetain();
      uint64_t v127 = sub_24E863CC8();
      unint64_t v129 = v128;
      swift_release();
      uint64_t v162 = sub_24E55B02C(v127, v129, (uint64_t *)&v161);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v130 = v148;
      _os_log_impl(&dword_24E553000, v148, v121, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- subscriptionsThatDidNotExistBefore: %s\n- subscriber: %s", (uint8_t *)v122, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v123, -1, -1);
      MEMORY[0x2533435F0](v122, -1, -1);

      v145(v141, v155);
      uint64_t v115 = v146;
      uint64_t v111 = (uint64_t)v142;
      uint64_t v118 = v150;
      uint64_t v98 = v151;
    }
    else
    {
      uint64_t v98 = v116;

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v145(v114, v117);
      uint64_t v111 = (uint64_t)v142;
    }
    uint64_t v131 = *(void *)(v149 + 16);
    swift_bridgeObjectRelease();
    uint64_t v97 = v115;
    ContactsProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:)(v118, v131 == 0);
    swift_bridgeObjectRelease();
    uint64_t v110 = v152;
    goto LABEL_71;
  }
LABEL_48:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v162 = v67;
  sub_24E8617C8();
  swift_release();
  uint64_t v95 = v135;
  sub_24E576EA0(v68, v135, &qword_2698F7078);
  swift_release();
  uint64_t v96 = v137;
  v147(v137, v95, v69);
  sub_24E563530(v95, &qword_2698F7078);
  uint64_t v97 = v67;
  uint64_t v98 = v68;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v99 = sub_24E862148();
  os_log_type_t v100 = sub_24E864268();
  if (os_log_type_enabled(v99, v100))
  {
    os_log_type_t v101 = v100;
    uint64_t v102 = swift_slowAlloc();
    uint64_t v103 = swift_slowAlloc();
    uint64_t v161 = (char *)v103;
    *(_DWORD *)uint64_t v102 = 136315651;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    type metadata accessor for ContactsProvider.Subscription();
    sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v104 = sub_24E864118();
    unint64_t v106 = v105;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v162 = sub_24E55B02C(v104, v106, (uint64_t *)&v161);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v102 + 12) = 2160;
    uint64_t v162 = 1752392040;
    sub_24E8643A8();
    *(_WORD *)(v102 + 22) = 2081;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v162 = v154;
    uint64_t v163 = v158;
    swift_bridgeObjectRetain();
    uint64_t v107 = sub_24E863CC8();
    unint64_t v109 = v108;
    swift_release();
    uint64_t v162 = sub_24E55B02C(v107, v109, (uint64_t *)&v161);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v99, v101, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v102, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v103, -1, -1);
    MEMORY[0x2533435F0](v102, -1, -1);

    v145(v137, v155);
    uint64_t v98 = v151;
    uint64_t v110 = v152;
    uint64_t v97 = v146;
    uint64_t v111 = (uint64_t)v142;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v145(v96, v69);
    uint64_t v110 = v152;
    uint64_t v111 = (uint64_t)v142;
  }
LABEL_71:
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v162 = v97;
  sub_24E8617C8();
  swift_release();
  sub_24E576EA0(v98, v111, &qword_2698F7078);
  swift_release();
  os_log_type_t v132 = *(void (**)(uint64_t, uint64_t *))(v111 + *(int *)(v156 + 48));
  swift_retain();
  sub_24E563530(v111, &qword_2698F7078);
  uint64_t v162 = v154;
  uint64_t v163 = v158;
  v132(v110, &v162);
  swift_release();
  return swift_release();
}

uint64_t sub_24E838B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E838E48(a1, a2, a3, &qword_2698F7088, (uint64_t)"FindMyUICore/PeopleLocationsProvider.swift", 42, (uint64_t)&unk_24E871F58, &OBJC_IVAR____TtC12FindMyUICore23PeopleLocationsProvider___observationRegistrar, &qword_2698F7090, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider, (uint64_t)&protocol conformance descriptor for PeopleLocationsProvider, &OBJC_IVAR____TtC12FindMyUICore23PeopleLocationsProvider__storage, (void (*)(void))type metadata accessor for PeopleLocationsProvider.Subscription, &qword_2698F70C0, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider.Subscription, (uint64_t)&protocol conformance descriptor for PeopleLocationsProvider.Subscription, (void (*)(uint64_t, uint64_t))sub_24E60AD30, &qword_2698F88A8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E61F108,
           sub_24E652D3C,
           (uint64_t)sub_24E85D9D4,
           (uint64_t *)sub_24E83BC10,
           (uint64_t (*)(char *, uint64_t))sub_24E853774,
           (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E84EF40,
           (char *)PeopleLocationsProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:),
           (char *)PeopleLocationsProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:));
}

uint64_t sub_24E838CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E838E48(a1, a2, a3, &qword_2698F7098, (uint64_t)"FindMyUICore/PeopleRelationshipsProvider.swift", 46, (uint64_t)"8M\t\x1B", &OBJC_IVAR____TtC12FindMyUICore27PeopleRelationshipsProvider___observationRegistrar, &qword_2698F70A0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider, (uint64_t)&protocol conformance descriptor for PeopleRelationshipsProvider, &OBJC_IVAR____TtC12FindMyUICore27PeopleRelationshipsProvider__storage, (void (*)(void))type metadata accessor for PeopleRelationshipsProvider.Subscription, &qword_2698F70D0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider.Subscription, (uint64_t)&protocol conformance descriptor for PeopleRelationshipsProvider.Subscription, (void (*)(uint64_t, uint64_t))sub_24E60AD5C, &qword_2698F8910, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E61F134,
           sub_24E653680,
           (uint64_t)sub_24E85DF58,
           (uint64_t *)sub_24E83BEA8,
           (uint64_t (*)(char *, uint64_t))sub_24E853E24,
           (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E84F4E8,
           (char *)PeopleRelationshipsProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:),
           (char *)PeopleRelationshipsProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:));
}

uint64_t sub_24E838E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, unint64_t *a9, void (*a10)(uint64_t), uint64_t a11, void *a12, void (*a13)(void), unint64_t *a14, void (*a15)(uint64_t), uint64_t a16, void (*a17)(uint64_t, uint64_t), uint64_t *a18, void (*a19)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a20)(uint64_t),uint64_t a21,uint64_t *a22,uint64_t (*a23)(char *, uint64_t),void (*a24)(uint64_t, uint64_t, uint64_t, uint64_t),char *a25,char *a26)
{
  v207 = a8;
  uint64_t v205 = a7;
  uint64_t v199 = a5;
  uint64_t v200 = a6;
  uint64_t v198 = a3;
  uint64_t v196 = a2;
  v201 = a12;
  uint64_t v202 = a1;
  uint64_t v197 = sub_24E862168();
  uint64_t v27 = *(void *)(v197 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v197);
  v177 = (char *)&v171 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v171 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  v176 = (char *)&v171 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v185 = (char *)&v171 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v171 - v37;
  v208 = a4;
  uint64_t v204 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v39 = MEMORY[0x270FA5388](v204);
  uint64_t v184 = (uint64_t)&v171 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  uint64_t v175 = (uint64_t)&v171 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  uint64_t v172 = (uint64_t)&v171 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  uint64_t v174 = (uint64_t)&v171 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  uint64_t v171 = (uint64_t)&v171 - v48;
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  uint64_t v194 = (uint64_t)&v171 - v50;
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  v191 = (char *)&v171 - v52;
  MEMORY[0x270FA5388](v51);
  uint64_t v54 = (char *)&v171 - v53;
  uint64_t v55 = sub_24E863FB8();
  uint64_t v183 = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v173 = v32;
  uint64_t v195 = v27;
  uint64_t v189 = a16;
  v188 = a15;
  v187 = a14;
  v186 = a13;
  sub_24E863FA8();
  uint64_t v209 = v55;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v56 = v206;
  uint64_t v57 = (void *)(v206 + *v207);
  uint64_t v213 = v206;
  uint64_t v203 = sub_24E85E898(a9, a10);
  v207 = v57;
  sub_24E8617C8();
  swift_release();
  uint64_t v58 = (void *)(v56 + *v201);
  swift_beginAccess();
  uint64_t v59 = v208;
  sub_24E576EA0((uint64_t)v58, (uint64_t)v54, v208);
  swift_release();
  uint64_t v60 = v195;
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v195 + 16);
  uint64_t v62 = v197;
  uint64_t v193 = v195 + 16;
  v192 = v61;
  v61(v38, (uint64_t)v54, v197);
  sub_24E563530((uint64_t)v54, v59);
  swift_bridgeObjectRetain_n();
  uint64_t v63 = v198;
  swift_bridgeObjectRetain_n();
  uint64_t v64 = sub_24E862148();
  os_log_type_t v65 = sub_24E864268();
  BOOL v66 = os_log_type_enabled(v64, v65);
  v201 = v58;
  if (v66)
  {
    uint64_t v67 = swift_slowAlloc();
    v190 = (uint64_t *)swift_slowAlloc();
    v210 = v190;
    *(_DWORD *)uint64_t v67 = 136315394;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v186(0);
    sub_24E85E898(v187, v188);
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_24E864118();
    unint64_t v70 = v69;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v211 = sub_24E55B02C(v68, v70, (uint64_t *)&v210);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v67 + 12) = 2080;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v63 = v198;
    uint64_t v211 = v196;
    uint64_t v212 = v198;
    swift_bridgeObjectRetain();
    uint64_t v71 = sub_24E863CC8();
    unint64_t v73 = v72;
    swift_release();
    uint64_t v211 = sub_24E55B02C(v71, v73, (uint64_t *)&v210);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v64, v65, "Provider: subscriptions\n- subscriptions: %s\n- subscriber: %s", (uint8_t *)v67, 0x16u);
    int v74 = v190;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v74, -1, -1);
    MEMORY[0x2533435F0](v67, -1, -1);

    v190 = *(uint64_t **)(v195 + 8);
    ((void (*)(char *, uint64_t))v190)(v38, v197);
    uint64_t v75 = v206;
    uint64_t v58 = v201;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v190 = *(uint64_t **)(v60 + 8);
    ((void (*)(char *, uint64_t))v190)(v38, v62);
    uint64_t v75 = v206;
  }
  uint64_t v76 = (uint64_t)v191;
  v180 = a18;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v182 = a21;
  v181 = a20;
  swift_getKeyPath();
  uint64_t v211 = v75;
  sub_24E8617C8();
  swift_release();
  unint64_t v77 = v208;
  sub_24E576EA0((uint64_t)v58, v76, v208);
  swift_release();
  v191 = *(char **)(v76 + *(int *)(v204 + 40));
  swift_bridgeObjectRetain();
  sub_24E563530(v76, v77);
  uint64_t v78 = v202;
  if (*(void *)(v202 + 16))
  {
    v179 = a19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v211 = v75;
    sub_24E8617C8();
    swift_release();
    uint64_t v211 = v75;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    uint64_t v79 = v201;
    swift_beginAccess();
    uint64_t v80 = *(int *)(v204 + 36);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v210 = *(uint64_t **)((char *)v79 + v80);
    *(void *)((char *)v79 + v80) = 0x8000000000000000;
    v179(v78, v196, v63, isUniquelyReferenced_nonNull_native);
    *(void *)((char *)v79 + v80) = v210;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E83AF50(v208, v180);
    swift_endAccess();
    uint64_t v211 = v206;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v211 = v75;
    sub_24E8617C8();
    swift_release();
    uint64_t v211 = v75;
    swift_getKeyPath();
    sub_24E8617E8();
    swift_release();
    swift_beginAccess();
    a17(v196, v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E83AF50(v208, v180);
    swift_endAccess();
    uint64_t v211 = v75;
  }
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  v180 = a22;
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v179 = a24;
  v178 = a23;
  swift_getKeyPath();
  uint64_t v82 = v206;
  uint64_t v211 = v206;
  sub_24E8617C8();
  swift_release();
  uint64_t v83 = v201;
  uint64_t v84 = v194;
  uint64_t v85 = v208;
  sub_24E576EA0((uint64_t)v201, v194, v208);
  swift_release();
  uint64_t v86 = swift_bridgeObjectRetain();
  uint64_t v87 = sub_24E83053C(v86, v181);
  swift_bridgeObjectRelease();
  sub_24E563530(v84, v85);
  uint64_t v88 = ((uint64_t (*)(uint64_t))v182)(v87);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v211 = v82;
  sub_24E8617C8();
  swift_release();
  uint64_t v211 = v82;
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  swift_beginAccess();
  uint64_t v89 = *(int *)(v204 + 40);
  uint64_t v90 = swift_bridgeObjectRelease();
  *(void *)((char *)v83 + v89) = v88;
  ((void (*)(uint64_t))v180)(v90);
  swift_endAccess();
  uint64_t v211 = v82;
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  unint64_t v91 = v191;
  uint64_t v92 = v202;
  if (*((void *)v191 + 2) <= *(void *)(v202 + 16) >> 3)
  {
    uint64_t v211 = v202;
    swift_bridgeObjectRetain();
    ((void (*)(char *))v179)(v91);
    uint64_t v93 = v211;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v93 = v178(v91, v92);
  }
  uint64_t v94 = v197;
  uint64_t v95 = v201;
  uint64_t v96 = v185;
  unint64_t v97 = *(void *)(v88 + 16);
  unint64_t v98 = *((void *)v91 + 2);
  uint64_t v182 = v88;
  if (v97 > v98 >> 3)
  {
    swift_bridgeObjectRetain();
    uint64_t v99 = v178((char *)v88, (uint64_t)v91);
  }
  else
  {
    uint64_t v211 = (uint64_t)v91;
    swift_bridgeObjectRetain();
    ((void (*)(uint64_t))v179)(v88);
    uint64_t v99 = v211;
  }
  uint64_t v100 = v198;
  uint64_t v101 = v206;
  uint64_t v102 = *(void *)(v99 + 16);
  uint64_t v194 = v93;
  if (v102)
  {
    v185 = a26;
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v211 = v101;
    sub_24E8617C8();
    swift_release();
    uint64_t v103 = v174;
    uint64_t v104 = v208;
    sub_24E576EA0((uint64_t)v95, v174, v208);
    swift_release();
    unint64_t v105 = v176;
    v192(v176, v103, v94);
    sub_24E563530(v103, v104);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v106 = v94;
    uint64_t v107 = sub_24E862148();
    int v108 = sub_24E864268();
    if (os_log_type_enabled(v107, (os_log_type_t)v108))
    {
      LODWORD(v181) = v108;
      uint64_t v109 = swift_slowAlloc();
      v180 = (uint64_t *)swift_slowAlloc();
      v210 = v180;
      *(_DWORD *)uint64_t v109 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v186(0);
      sub_24E85E898(v187, v188);
      swift_bridgeObjectRetain();
      uint64_t v110 = sub_24E864118();
      unint64_t v112 = v111;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v211 = sub_24E55B02C(v110, v112, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v109 + 12) = 2160;
      uint64_t v211 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v109 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v113 = v198;
      uint64_t v211 = v196;
      uint64_t v212 = v198;
      swift_bridgeObjectRetain();
      uint64_t v114 = sub_24E863CC8();
      unint64_t v116 = v115;
      swift_release();
      uint64_t v211 = sub_24E55B02C(v114, v116, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      uint64_t v100 = v113;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v107, (os_log_type_t)v181, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- SubscriptionsThatDoNotExistAnymore: %s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v109, 0x20u);
      uint64_t v117 = v180;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v117, -1, -1);
      MEMORY[0x2533435F0](v109, -1, -1);

      uint64_t v106 = v197;
      ((void (*)(char *, uint64_t))v190)(v176, v197);
      uint64_t v101 = v206;
      uint64_t v95 = v201;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v190)(v105, v106);
    }
    os_log_type_t v132 = (void (*)(uint64_t, BOOL))v185;
    uint64_t v133 = *(void *)(v182 + 16);
    swift_bridgeObjectRelease();
    v132(v99, v133 == 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v211 = v101;
    sub_24E8617C8();
    swift_release();
    uint64_t v118 = v171;
    unint64_t v119 = v208;
    sub_24E576EA0((uint64_t)v95, v171, v208);
    swift_release();
    v192(v96, v118, v94);
    sub_24E563530(v118, v119);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    os_log_type_t v120 = sub_24E862148();
    uint64_t v121 = v94;
    os_log_type_t v122 = sub_24E864268();
    if (os_log_type_enabled(v120, v122))
    {
      uint64_t v123 = swift_slowAlloc();
      uint64_t v182 = swift_slowAlloc();
      v210 = (uint64_t *)v182;
      *(_DWORD *)uint64_t v123 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v186(0);
      sub_24E85E898(v187, v188);
      swift_bridgeObjectRetain();
      uint64_t v124 = sub_24E864118();
      unint64_t v126 = v125;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v211 = sub_24E55B02C(v124, v126, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v123 + 12) = 2160;
      uint64_t v211 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v123 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v127 = v198;
      uint64_t v211 = v196;
      uint64_t v212 = v198;
      swift_bridgeObjectRetain();
      uint64_t v128 = sub_24E863CC8();
      unint64_t v130 = v129;
      swift_release();
      uint64_t v211 = sub_24E55B02C(v128, v130, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      uint64_t v100 = v127;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v120, v122, "Provider: setSubscriptions-didRemoveUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v123, 0x20u);
      uint64_t v131 = v182;
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v131, -1, -1);
      MEMORY[0x2533435F0](v123, -1, -1);

      uint64_t v106 = v197;
      ((void (*)(char *, uint64_t))v190)(v185, v197);
      uint64_t v101 = v206;
      uint64_t v95 = v201;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v190)(v96, v121);
      uint64_t v106 = v121;
    }
  }
  if (*(void *)(v194 + 16))
  {
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v211 = v101;
    sub_24E8617C8();
    swift_release();
    uint64_t v134 = v175;
    uint64_t v135 = v208;
    sub_24E576EA0((uint64_t)v95, v175, v208);
    swift_release();
    unint64_t v136 = v177;
    v192(v177, v134, v106);
    sub_24E563530(v134, v135);
    swift_bridgeObjectRetain_n();
    uint64_t v137 = v194;
    swift_bridgeObjectRetain_n();
    uint64_t v138 = sub_24E862148();
    os_log_type_t v139 = sub_24E864268();
    BOOL v140 = os_log_type_enabled(v138, v139);
    v185 = a25;
    if (v140)
    {
      uint64_t v141 = swift_slowAlloc();
      uint64_t v142 = swift_slowAlloc();
      v210 = (uint64_t *)v142;
      *(_DWORD *)uint64_t v141 = 136315394;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v186(0);
      sub_24E85E898(v187, v188);
      swift_bridgeObjectRetain();
      uint64_t v143 = sub_24E864118();
      unint64_t v145 = v144;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v211 = sub_24E55B02C(v143, v145, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v141 + 12) = 2080;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v146 = v198;
      uint64_t v211 = v196;
      uint64_t v212 = v198;
      swift_bridgeObjectRetain();
      uint64_t v147 = sub_24E863CC8();
      unint64_t v149 = v148;
      swift_release();
      uint64_t v150 = v147;
      uint64_t v100 = v146;
      uint64_t v211 = sub_24E55B02C(v150, v149, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v138, v139, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- subscriptionsThatDidNotExistBefore: %s\n- subscriber: %s", (uint8_t *)v141, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v142, -1, -1);
      MEMORY[0x2533435F0](v141, -1, -1);

      ((void (*)(char *, uint64_t))v190)(v177, v197);
      uint64_t v135 = v208;
      uint64_t v101 = v206;
      uint64_t v151 = v204;
      uint64_t v95 = v201;
      uint64_t v152 = v194;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v190)(v136, v106);
      uint64_t v151 = v204;
      uint64_t v152 = v137;
    }
    uint64_t v167 = *((void *)v191 + 2);
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, BOOL))v185)(v152, v167 == 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E863FA8();
    sub_24E863F18();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_getKeyPath();
    uint64_t v211 = v101;
    sub_24E8617C8();
    swift_release();
    uint64_t v153 = v172;
    uint64_t v135 = v208;
    sub_24E576EA0((uint64_t)v95, v172, v208);
    swift_release();
    uint64_t v154 = v173;
    v192(v173, v153, v106);
    sub_24E563530(v153, v135);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v155 = sub_24E862148();
    uint64_t v156 = v106;
    os_log_type_t v157 = sub_24E864268();
    if (os_log_type_enabled(v155, v157))
    {
      uint64_t v158 = swift_slowAlloc();
      uint64_t v159 = swift_slowAlloc();
      v210 = (uint64_t *)v159;
      *(_DWORD *)uint64_t v158 = 136315651;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v186(0);
      sub_24E85E898(v187, v188);
      swift_bridgeObjectRetain();
      uint64_t v160 = sub_24E864118();
      unint64_t v162 = v161;
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v211 = sub_24E55B02C(v160, v162, (uint64_t *)&v210);
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v158 + 12) = 2160;
      uint64_t v211 = 1752392040;
      sub_24E8643A8();
      *(_WORD *)(v158 + 22) = 2081;
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v163 = v198;
      uint64_t v211 = v196;
      uint64_t v212 = v198;
      swift_bridgeObjectRetain();
      uint64_t v164 = sub_24E863CC8();
      unint64_t v166 = v165;
      swift_release();
      uint64_t v211 = sub_24E55B02C(v164, v166, (uint64_t *)&v210);
      uint64_t v100 = v163;
      sub_24E8643A8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E553000, v155, v157, "Provider: setSubscriptions-didAddNewUniqueSubscriptions\n- Skipping notification due to%s\n- Subscriber: %{private,mask.hash}s", (uint8_t *)v158, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533435F0](v159, -1, -1);
      MEMORY[0x2533435F0](v158, -1, -1);

      ((void (*)(char *, uint64_t))v190)(v173, v197);
      uint64_t v135 = v208;
      uint64_t v101 = v206;
      uint64_t v151 = v204;
      uint64_t v95 = v201;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v190)(v154, v156);
      uint64_t v151 = v204;
    }
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v211 = v101;
  sub_24E8617C8();
  swift_release();
  uint64_t v168 = v184;
  sub_24E576EA0((uint64_t)v95, v184, v135);
  swift_release();
  uint64_t v169 = *(void (**)(uint64_t, uint64_t *))(v168 + *(int *)(v151 + 48));
  swift_retain();
  sub_24E563530(v168, v135);
  uint64_t v211 = v196;
  uint64_t v212 = v100;
  v169(v202, &v211);
  swift_release();
  return swift_release();
}

uint64_t sub_24E83AF50(uint64_t *a1, uint64_t *a2)
{
  uint64_t v5 = v2;
  uint64_t v6 = sub_24E862168();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v5, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_24E862148();
  os_log_type_t v11 = sub_24E864238();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v6;
    uint64_t v14 = v13;
    uint64_t v22 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v19 = v12 + 4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(a2);
    sub_24E7E00C0();
    uint64_t v15 = sub_24E863B48();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_24E55B02C(v15, v17, &v22);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v10, v11, "SubscriptionManagerStorage: subscriptionsBySubscriber - %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v14, -1, -1);
    MEMORY[0x2533435F0](v12, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_24E83B1D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E862168();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24E862148();
  os_log_type_t v7 = sub_24E864238();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v14 = v8 + 4;
    type metadata accessor for DeviceImageProvider.Subscription();
    sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24E864118();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24E55B02C(v9, v11, &v17);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v6, v7, "SubscriptionManagerStorage: uniqueSubscriptions - %s", v8, 0xCu);
    uint64_t v12 = v15;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v12, -1, -1);
    MEMORY[0x2533435F0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24E83B468(uint64_t *a1, void (*a2)(void))
{
  uint64_t v5 = v2;
  uint64_t v6 = sub_24E862168();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v5, v6);
  swift_bridgeObjectRetain_n();
  unint64_t v10 = sub_24E862148();
  os_log_type_t v11 = sub_24E864238();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v6;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v22 = v19;
    *(_DWORD *)uint64_t v12 = 136315138;
    v18[1] = v12 + 4;
    a2();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_24E864118();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_24E55B02C(v13, v15, &v22);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v10, v11, "SubscriptionManagerStorage: uniqueSubscriptions - %s", v12, 0xCu);
    uint64_t v16 = v19;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v16, -1, -1);
    MEMORY[0x2533435F0](v12, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_24E83B6E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E862168();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7118);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24E862148();
  os_log_type_t v7 = sub_24E864238();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v8 = 136315138;
    unint64_t v14 = v8 + 4;
    type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
    sub_24E85E898(&qword_2698F7148, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24E864118();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24E55B02C(v9, v11, &v17);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v6, v7, "SubscriptionManagerStorage: uniqueSubscriptions - %s", v8, 0xCu);
    uint64_t v12 = v15;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v12, -1, -1);
    MEMORY[0x2533435F0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24E83B978()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E862168();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7078);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24E862148();
  os_log_type_t v7 = sub_24E864238();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v8 = 136315138;
    unint64_t v14 = v8 + 4;
    type metadata accessor for ContactsProvider.Subscription();
    sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24E864118();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24E55B02C(v9, v11, &v17);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v6, v7, "SubscriptionManagerStorage: uniqueSubscriptions - %s", v8, 0xCu);
    uint64_t v12 = v15;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v12, -1, -1);
    MEMORY[0x2533435F0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24E83BC10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E862168();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7088);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24E862148();
  os_log_type_t v7 = sub_24E864238();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v8 = 136315138;
    unint64_t v14 = v8 + 4;
    type metadata accessor for PeopleLocationsProvider.Subscription(0);
    sub_24E85E898(&qword_2698F70C0, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24E864118();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24E55B02C(v9, v11, &v17);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v6, v7, "SubscriptionManagerStorage: uniqueSubscriptions - %s", v8, 0xCu);
    uint64_t v12 = v15;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v12, -1, -1);
    MEMORY[0x2533435F0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24E83BEA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E862168();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7098);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24E862148();
  os_log_type_t v7 = sub_24E864238();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v8 = 136315138;
    unint64_t v14 = v8 + 4;
    type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
    sub_24E85E898(&qword_2698F70D0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider.Subscription);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24E864118();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24E55B02C(v9, v11, &v17);
    sub_24E8643A8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E553000, v6, v7, "SubscriptionManagerStorage: uniqueSubscriptions - %s", v8, 0xCu);
    uint64_t v12 = v15;
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v12, -1, -1);
    MEMORY[0x2533435F0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t static ProvidersMediator.shared.getter()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v0 = qword_2698F8898;
  swift_retain();
  swift_release();
  return v0;
}

uint64_t static ProvidersMediator.shared.setter(uint64_t a1)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  qword_2698F8898 = a1;
  swift_release();
  return swift_release();
}

uint64_t (*static ProvidersMediator.shared.modify(uint64_t a1))()
{
  *(void *)(a1 + 24) = sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return sub_24E83C370;
}

uint64_t sub_24E83C370()
{
  swift_endAccess();

  return swift_release();
}

void *ProvidersMediator.__allocating_init(peopleRelationshipsProvider:peopleLocationsProvider:beaconsInfoProvider:userLocationProvider:contactsProvider:mapsDirectionsProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  uint64_t v12 = sub_24E85E0E8(a1, a2, a3, a4, a5, a6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v12;
}

void *ProvidersMediator.init(peopleRelationshipsProvider:peopleLocationsProvider:beaconsInfoProvider:userLocationProvider:contactsProvider:mapsDirectionsProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = sub_24E85E0E8(a1, a2, a3, a4, a5, a6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v6;
}

uint64_t sub_24E83C4E4()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E83C654();
  sub_24E83C85C();
  sub_24E83CB6C();
  sub_24E83CB6C();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  sub_24E83CCA0();

  return swift_release();
}

uint64_t sub_24E83C654()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  sub_24E85E898(&qword_2698F70A0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider);
  sub_24E8617B8();
  swift_release();
  swift_release();
  swift_release();
  return swift_release_n();
}

uint64_t sub_24E83C85C()
{
  uint64_t v1 = v0;
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
  *((void *)v6 + 2) = v3;
  *((void *)v6 + 3) = v2;
  *((void *)v6 + 4) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24E85E898(&qword_2698F7090, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider);
  sub_24E8617C8();
  swift_release();
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  uint64_t v7 = v4 + OBJC_IVAR____TtC12FindMyUICore23PeopleLocationsProvider__storage;
  swift_beginAccess();
  uint64_t v8 = (uint64_t (**)(uint64_t, uint64_t))(v7
                                                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F7088)
                                                          + 48));
  *uint64_t v8 = sub_24E85E61C;
  v8[1] = v6;
  swift_release();
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E8617A8();
  swift_release();
  return swift_release();
}

uint64_t sub_24E83CB6C()
{
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E8617A8();
  swift_release();

  return swift_release();
}

uint64_t sub_24E83CCA0()
{
  uint64_t v1 = v0;
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))swift_allocObject();
  *((void *)v7 + 2) = v3;
  *((void *)v7 + 3) = v2;
  *((void *)v7 + 4) = v4;
  *((void *)v7 + 5) = v5;
  *((void *)v7 + 6) = v6;
  uint64_t v8 = *(void *)(v1 + 88);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  sub_24E85E898(&qword_2698F70F0, (void (*)(uint64_t))type metadata accessor for MapsDirectionsProvider);
  sub_24E8617C8();
  swift_release();
  swift_getKeyPath();
  sub_24E8617E8();
  swift_release();
  uint64_t v9 = v8 + OBJC_IVAR____TtC12FindMyUICore22MapsDirectionsProvider__storage;
  swift_beginAccess();
  unint64_t v10 = (uint64_t (**)(uint64_t, uint64_t))(v9
                                                  + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698F70E8)
                                                           + 48));
  *unint64_t v10 = sub_24E85E344;
  v10[1] = v7;
  swift_release();
  swift_getKeyPath();
  sub_24E8617D8();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24E83CF6C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleLocationsProvider.InputValue(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v5 = sub_24E861248();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v4, a1, v5);
    sub_24E800950((uint64_t)v4);
    swift_release();
    sub_24E85E7D0((uint64_t)v4, type metadata accessor for PeopleLocationsProvider.InputValue);
  }
  return swift_release();
}

uint64_t sub_24E83D0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = a5;
  uint64_t v8 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v42 = (uint64_t)&v35 - v12;
  uint64_t v13 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v41 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24E863FB8();
  uint64_t v37 = sub_24E863FA8();
  uint64_t v40 = v16;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  swift_bridgeObjectRetain();
  sub_24E863D38();
  swift_bridgeObjectRetain();
  sub_24E863D38();
  swift_bridgeObjectRelease();
  uint64_t v18 = v44;
  uint64_t v17 = v45;
  int64_t v19 = *(void *)(a1 + 16);
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (v19)
  {
    uint64_t v35 = v44;
    uint64_t v36 = v45;
    uint64_t v44 = MEMORY[0x263F8EE78];
    sub_24E576190(0, v19, 0);
    uint64_t result = sub_24E85CC38(a1);
    int64_t v22 = result;
    int v24 = v23;
    char v26 = v25 & 1;
    uint64_t v39 = a1 + 56;
    while ((v22 & 0x8000000000000000) == 0 && v22 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(v39 + (((unint64_t)v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v24) {
        goto LABEL_23;
      }
      uint64_t v27 = v42;
      sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v43 + 72) * v22, v42, type metadata accessor for PeopleLocationsProvider.Subscription);
      sub_24E85E768(v27, (uint64_t)v11, type metadata accessor for PeopleLocationsProvider.Subscription);
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v28 = sub_24E861248();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v15, v11, v28);
      uint64_t v29 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v15, 0, 1, v29);
      swift_release();
      sub_24E85E7D0((uint64_t)v11, type metadata accessor for PeopleLocationsProvider.Subscription);
      uint64_t v20 = v44;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24E576190(0, *(void *)(v20 + 16) + 1, 1);
        uint64_t v20 = v44;
      }
      unint64_t v31 = *(void *)(v20 + 16);
      unint64_t v30 = *(void *)(v20 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_24E576190(v30 > 1, v31 + 1, 1);
        uint64_t v20 = v44;
      }
      *(void *)(v20 + 16) = v31 + 1;
      sub_24E85E768((uint64_t)v15, v20+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(void *)(v41 + 72) * v31, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      uint64_t result = sub_24E85CCDC(v22, v24, v26 & 1, a1);
      int64_t v22 = result;
      int v24 = v32;
      char v26 = v33 & 1;
      if (!--v19)
      {
        sub_24E61B850(result, v32, v33 & 1);
        uint64_t v18 = v35;
        uint64_t v17 = v36;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  else
  {
LABEL_17:
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      uint64_t v34 = sub_24E85DF58(v20);
      swift_bridgeObjectRelease();
      sub_24E838E48(v34, v18, v17, &qword_2698F7098, (uint64_t)"FindMyUICore/PeopleRelationshipsProvider.swift", 46, (uint64_t)"8M\t\x1B", &OBJC_IVAR____TtC12FindMyUICore27PeopleRelationshipsProvider___observationRegistrar, &qword_2698F70A0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider, (uint64_t)&protocol conformance descriptor for PeopleRelationshipsProvider, &OBJC_IVAR____TtC12FindMyUICore27PeopleRelationshipsProvider__storage, (void (*)(void))type metadata accessor for PeopleRelationshipsProvider.Subscription, &qword_2698F70D0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider.Subscription, (uint64_t)&protocol conformance descriptor for PeopleRelationshipsProvider.Subscription, (void (*)(uint64_t, uint64_t))sub_24E60AD5C, &qword_2698F8910, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E61F134,
        sub_24E653680,
        (uint64_t)sub_24E85DF58,
        (uint64_t *)sub_24E83BEA8,
        (uint64_t (*)(char *, uint64_t))sub_24E853E24,
        (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E84F4E8,
        (char *)PeopleRelationshipsProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:),
        (char *)PeopleRelationshipsProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:));
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24E83D778(uint64_t a1)
{
  uint64_t v76 = a1;
  uint64_t v74 = type metadata accessor for MapsDirectionsProvider.InputValue.Destination(0);
  MEMORY[0x270FA5388](v74);
  BOOL v66 = (void *)((char *)v63 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = type metadata accessor for MapsDirectionsProvider.InputValue.Origin(0);
  MEMORY[0x270FA5388](v2 - 8);
  os_log_type_t v65 = (void *)((char *)v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v81 = type metadata accessor for MapsDirectionsProvider.InputValue(0);
  uint64_t v4 = MEMORY[0x270FA5388](v81);
  uint64_t v73 = (uint64_t)v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v83 = (void *)((char *)v63 - v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F71B8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_24E861298();
  uint64_t v10 = *(void *)(v80 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v80);
  unint64_t v72 = (char *)v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v79 = (char *)v63 - v13;
  uint64_t v14 = type metadata accessor for PeopleLocationsProvider.Subscription.Identifier(0);
  uint64_t v77 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8900);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  int64_t v22 = (char *)v63 - v21;
  uint64_t v23 = sub_24E863FB8();
  v63[1] = sub_24E863FA8();
  uint64_t v75 = v23;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v24 = *(void *)(v76 + 40);
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v84 = v24;
  sub_24E85E898(&qword_2698F7090, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider);
  sub_24E8617C8();
  swift_release();
  char v25 = (uint64_t *)(v24 + OBJC_IVAR____TtC12FindMyUICore23PeopleLocationsProvider__data);
  swift_beginAccess();
  uint64_t v26 = *v25;
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  int64_t v82 = 0;
  uint64_t v28 = *(void *)(v26 + 64);
  uint64_t v64 = v26 + 64;
  uint64_t v78 = v26;
  uint64_t v29 = 1 << *(unsigned char *)(v26 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  unint64_t v70 = (void (**)(uint64_t, char *, uint64_t))(v10 + 16);
  uint64_t v71 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  unint64_t v69 = (void (**)(char *, uint64_t))(v10 + 8);
  int64_t v67 = (unint64_t)(v29 + 63) >> 6;
  v63[0] = v67 - 1;
  uint64_t v32 = &qword_2698F71B8;
  uint64_t v68 = v22;
  while (1)
  {
    if (v31)
    {
      unint64_t v33 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      unint64_t v34 = v33 | (v82 << 6);
LABEL_12:
      uint64_t v35 = v78;
      sub_24E85E830(*(void *)(v78 + 48) + *(void *)(v77 + 72) * v34, (uint64_t)v20, type metadata accessor for PeopleLocationsProvider.Subscription.Identifier);
      uint64_t v36 = *(void *)(v35 + 56);
      uint64_t v37 = v36
          + *(void *)(*(void *)(type metadata accessor for PeopleLocationsProvider.LocationState(0) - 8) + 72)
          * v34;
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8908);
      sub_24E85E830(v37, (uint64_t)&v20[*(int *)(v38 + 48)], type metadata accessor for PeopleLocationsProvider.LocationState);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v20, 0, 1, v38);
      goto LABEL_31;
    }
    int64_t v39 = v82 + 1;
    if (__OFADD__(v82, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v39 < v67)
    {
      unint64_t v40 = *(void *)(v64 + 8 * v39);
      if (v40) {
        goto LABEL_16;
      }
      int64_t v41 = v82 + 2;
      ++v82;
      if (v39 + 1 < v67)
      {
        unint64_t v40 = *(void *)(v64 + 8 * v41);
        if (v40) {
          goto LABEL_19;
        }
        int64_t v82 = v39 + 1;
        if (v39 + 2 < v67)
        {
          unint64_t v40 = *(void *)(v64 + 8 * (v39 + 2));
          if (v40)
          {
            v39 += 2;
            goto LABEL_16;
          }
          int64_t v41 = v39 + 3;
          int64_t v82 = v39 + 2;
          if (v39 + 3 < v67) {
            break;
          }
        }
      }
    }
LABEL_30:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8908);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v20, 1, 1, v42);
    unint64_t v31 = 0;
LABEL_31:
    sub_24E612440((uint64_t)v20, (uint64_t)v22, &qword_2698F8900);
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8908);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v22, 1, v43) == 1)
    {
      swift_release();
      return swift_release();
    }
    uint64_t v44 = (uint64_t)&v22[*(int *)(v43 + 48)];
    sub_24E85E768((uint64_t)v22, (uint64_t)v16, type metadata accessor for PeopleLocationsProvider.Subscription.Identifier);
    uint64_t v45 = type metadata accessor for PeopleLocationsProvider.LocationState(0);
    sub_24E576EA0(v44 + *(int *)(v45 + 20), (uint64_t)v9, v32);
    sub_24E85E7D0(v44, type metadata accessor for PeopleLocationsProvider.LocationState);
    uint64_t v46 = v32;
    uint64_t v47 = sub_24E861048();
    uint64_t v48 = *(void *)(v47 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v9, 1, v47) == 1)
    {
      sub_24E563530((uint64_t)v9, v46);
      uint64_t v32 = v46;
    }
    else
    {
      uint64_t v49 = v20;
      uint64_t v50 = v72;
      sub_24E860FF8();
      uint64_t v51 = v9;
      (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v47);
      uint64_t v52 = v16;
      uint64_t v53 = v79;
      uint64_t v54 = v80;
      (*v71)(v79, v50, v80);
      uint64_t v55 = v52;
      uint64_t v56 = sub_24E861218();
      uint64_t v58 = v57;
      uint64_t v59 = v83;
      (*v70)((uint64_t)v83 + *(int *)(v74 + 20), v53, v54);
      *uint64_t v59 = v56;
      v59[1] = v58;
      swift_storeEnumTagMultiPayload();
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v60 = v73;
      sub_24E85E830((uint64_t)v83, v73, type metadata accessor for MapsDirectionsProvider.InputValue);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v61 = v66;
        sub_24E85E768(v60, (uint64_t)v66, type metadata accessor for MapsDirectionsProvider.InputValue.Destination);
        sub_24E7E4FC0(v61);
        uint64_t v62 = type metadata accessor for MapsDirectionsProvider.InputValue.Destination;
      }
      else
      {
        uint64_t v61 = v65;
        sub_24E85E768(v60, (uint64_t)v65, type metadata accessor for MapsDirectionsProvider.InputValue.Origin);
        sub_24E7E3FF4((uint64_t)v61);
        uint64_t v62 = type metadata accessor for MapsDirectionsProvider.InputValue.Origin;
      }
      sub_24E85E7D0((uint64_t)v61, v62);
      uint64_t v16 = v55;
      uint64_t v9 = v51;
      uint64_t v20 = v49;
      int64_t v22 = v68;
      swift_release();
      sub_24E85E7D0((uint64_t)v83, type metadata accessor for MapsDirectionsProvider.InputValue);
      (*v69)(v79, v80);
      uint64_t v32 = &qword_2698F71B8;
    }
    uint64_t result = sub_24E85E7D0((uint64_t)v16, type metadata accessor for PeopleLocationsProvider.Subscription.Identifier);
  }
  unint64_t v40 = *(void *)(v64 + 8 * v41);
  if (v40)
  {
LABEL_19:
    int64_t v39 = v41;
LABEL_16:
    unint64_t v31 = (v40 - 1) & v40;
    unint64_t v34 = __clz(__rbit64(v40)) + (v39 << 6);
    int64_t v82 = v39;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v39 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v39 >= v67)
    {
      int64_t v82 = v63[0];
      goto LABEL_30;
    }
    unint64_t v40 = *(void *)(v64 + 8 * v39);
    ++v41;
    if (v40) {
      goto LABEL_16;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t (*sub_24E83E224())()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  swift_release();
  return sub_24E85E638;
}

uint64_t sub_24E83E2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24E83E2EC, 0, 0);
}

uint64_t sub_24E83E2EC()
{
  *(void *)(v0 + 24) = sub_24E863FB8();
  *(void *)(v0 + 32) = sub_24E863FA8();
  uint64_t v2 = sub_24E863F18();
  return MEMORY[0x270FA2498](sub_24E83E384, v2, v1);
}

uint64_t sub_24E83E384()
{
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E8617A8();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E83E480(uint64_t a1)
{
  uint64_t v88 = a1;
  uint64_t v86 = type metadata accessor for MapsDirectionsProvider.InputValue.Destination(0);
  MEMORY[0x270FA5388](v86);
  uint64_t v74 = (uint64_t *)((char *)&v70 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = type metadata accessor for MapsDirectionsProvider.InputValue.Origin(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v73 = (uint64_t *)((char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v85 = sub_24E861758();
  uint64_t v100 = *(uint64_t (***)(char *, uint64_t))(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v84 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = type metadata accessor for MapsDirectionsProvider.InputValue(0);
  uint64_t v5 = MEMORY[0x270FA5388](v92);
  uint64_t v83 = (uint64_t)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v95 = (uint64_t *)((char *)&v70 - v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7170);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v70 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F71B8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_24E861298();
  uint64_t v17 = *(void *)(v91 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v91);
  uint64_t v81 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v90 = (char *)&v70 - v20;
  uint64_t v21 = type metadata accessor for BeaconsInfoProvider.BeaconState(0);
  uint64_t v97 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v94 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v103 = (uint64_t)&v70 - v24;
  uint64_t v105 = sub_24E861138();
  uint64_t v99 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  uint64_t v104 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F88E0);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v29 = (char *)&v70 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  unint64_t v31 = (char *)&v70 - v30;
  uint64_t v32 = sub_24E863FB8();
  uint64_t v72 = sub_24E863FA8();
  uint64_t v87 = v32;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v93 = v16;
  uint64_t v33 = *(void *)(v88 + 48);
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v106 = v33;
  sub_24E85E898(&qword_2698F7120, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider);
  sub_24E8617C8();
  swift_release();
  unint64_t v34 = (uint64_t *)(v33 + OBJC_IVAR____TtC12FindMyUICore19BeaconsInfoProvider__data);
  swift_beginAccess();
  uint64_t v35 = *v34;
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  int64_t v102 = 0;
  uint64_t v37 = *(void *)(v35 + 64);
  uint64_t v75 = v35 + 64;
  uint64_t v98 = v35;
  uint64_t v38 = 1 << *(unsigned char *)(v35 + 32);
  uint64_t v39 = -1;
  if (v38 < 64) {
    uint64_t v39 = ~(-1 << v38);
  }
  unint64_t v40 = v39 & v37;
  uint64_t v96 = v99 + 16;
  uint64_t v101 = (void (**)(char *, char *, uint64_t))(v99 + 32);
  uint64_t v80 = (void (**)(char *, char *, uint64_t))(v17 + 32);
  uint64_t v79 = (void (**)(char *, uint64_t))(v100 + 1);
  uint64_t v78 = (void (**)(uint64_t, char *, uint64_t))(v17 + 16);
  uint64_t v77 = (void (**)(char *, uint64_t))(v17 + 8);
  uint64_t v100 = (uint64_t (**)(char *, uint64_t))(v99 + 8);
  int64_t v89 = (unint64_t)(v38 + 63) >> 6;
  int64_t v71 = v89 - 1;
  uint64_t v41 = (uint64_t)v94;
  int64_t v82 = v11;
  uint64_t v76 = v21;
  while (1)
  {
    if (v40)
    {
      unint64_t v42 = __clz(__rbit64(v40));
      v40 &= v40 - 1;
      unint64_t v43 = v42 | (v102 << 6);
LABEL_12:
      uint64_t v44 = v98;
      (*(void (**)(char *, unint64_t, uint64_t))(v99 + 16))(v29, *(void *)(v98 + 48) + *(void *)(v99 + 72) * v43, v105);
      uint64_t v45 = *(void *)(v44 + 56) + *(void *)(v97 + 72) * v43;
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7258);
      sub_24E85E830(v45, (uint64_t)&v29[*(int *)(v46 + 48)], type metadata accessor for BeaconsInfoProvider.BeaconState);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v29, 0, 1, v46);
      goto LABEL_31;
    }
    int64_t v47 = v102 + 1;
    if (__OFADD__(v102, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v47 < v89)
    {
      unint64_t v48 = *(void *)(v75 + 8 * v47);
      if (v48) {
        goto LABEL_16;
      }
      int64_t v49 = v102 + 2;
      ++v102;
      if (v47 + 1 < v89)
      {
        unint64_t v48 = *(void *)(v75 + 8 * v49);
        if (v48) {
          goto LABEL_19;
        }
        int64_t v102 = v47 + 1;
        if (v47 + 2 < v89)
        {
          unint64_t v48 = *(void *)(v75 + 8 * (v47 + 2));
          if (v48)
          {
            v47 += 2;
            goto LABEL_16;
          }
          int64_t v49 = v47 + 3;
          int64_t v102 = v47 + 2;
          if (v47 + 3 < v89) {
            break;
          }
        }
      }
    }
LABEL_30:
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7258);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v29, 1, 1, v50);
    unint64_t v40 = 0;
LABEL_31:
    sub_24E612440((uint64_t)v29, (uint64_t)v31, &qword_2698F88E0);
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7258);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v31, 1, v51) == 1)
    {
      swift_release();
      return swift_release();
    }
    uint64_t v52 = &v31[*(int *)(v51 + 48)];
    (*v101)(v104, v31, v105);
    uint64_t v53 = (uint64_t)v52;
    uint64_t v54 = v103;
    sub_24E85E768(v53, v103, type metadata accessor for BeaconsInfoProvider.BeaconState);
    sub_24E85E830(v54, v41, type metadata accessor for BeaconsInfoProvider.BeaconState);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_24E85E768(v41, (uint64_t)v11, type metadata accessor for BeaconsInfoProvider.BeaconState.LoadedState);
      uint64_t v55 = type metadata accessor for BeaconsInfoProvider.BeaconState.LoadedState(0);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v11, 0, 1, v55);
    }
    else
    {
      uint64_t v55 = type metadata accessor for BeaconsInfoProvider.BeaconState.LoadedState(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v11, 1, 1, v55);
    }
    sub_24E612440((uint64_t)v11, (uint64_t)v13, &qword_2698F7170);
    type metadata accessor for BeaconsInfoProvider.BeaconState.LoadedState(0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v55 - 8) + 48))(v13, 1, v55) == 1)
    {
      sub_24E563530((uint64_t)v13, &qword_2698F7170);
    }
    else
    {
      uint64_t v56 = (uint64_t)v93;
      sub_24E576EA0((uint64_t)&v13[*(int *)(v55 + 24)], (uint64_t)v93, &qword_2698F71B8);
      sub_24E85E7D0((uint64_t)v13, type metadata accessor for BeaconsInfoProvider.BeaconState.LoadedState);
      uint64_t v57 = sub_24E861048();
      uint64_t v58 = *(void *)(v57 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v56, 1, v57) == 1)
      {
        sub_24E563530(v56, &qword_2698F71B8);
      }
      else
      {
        uint64_t v59 = v81;
        sub_24E860FF8();
        (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v56, v57);
        uint64_t v60 = v90;
        uint64_t v61 = v91;
        (*v80)(v90, v59, v91);
        uint64_t v62 = v84;
        sub_24E861118();
        uint64_t v63 = sub_24E861708();
        uint64_t v65 = v64;
        (*v79)(v62, v85);
        BOOL v66 = v95;
        (*v78)((uint64_t)v95 + *(int *)(v86 + 20), v60, v61);
        *BOOL v66 = v63;
        v66[1] = v65;
        swift_storeEnumTagMultiPayload();
        sub_24E863FA8();
        sub_24E863F18();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v67 = v83;
        sub_24E85E830((uint64_t)v95, v83, type metadata accessor for MapsDirectionsProvider.InputValue);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v68 = v74;
          sub_24E85E768(v67, (uint64_t)v74, type metadata accessor for MapsDirectionsProvider.InputValue.Destination);
          sub_24E7E4FC0(v68);
          unint64_t v69 = type metadata accessor for MapsDirectionsProvider.InputValue.Destination;
        }
        else
        {
          uint64_t v68 = v73;
          sub_24E85E768(v67, (uint64_t)v73, type metadata accessor for MapsDirectionsProvider.InputValue.Origin);
          sub_24E7E3FF4((uint64_t)v68);
          unint64_t v69 = type metadata accessor for MapsDirectionsProvider.InputValue.Origin;
        }
        sub_24E85E7D0((uint64_t)v68, v69);
        swift_release();
        sub_24E85E7D0((uint64_t)v95, type metadata accessor for MapsDirectionsProvider.InputValue);
        (*v77)(v90, v91);
        uint64_t v11 = v82;
      }
      uint64_t v41 = (uint64_t)v94;
    }
    sub_24E85E7D0(v103, type metadata accessor for BeaconsInfoProvider.BeaconState);
    uint64_t result = (*v100)(v104, v105);
  }
  unint64_t v48 = *(void *)(v75 + 8 * v49);
  if (v48)
  {
LABEL_19:
    int64_t v47 = v49;
LABEL_16:
    unint64_t v40 = (v48 - 1) & v48;
    unint64_t v43 = __clz(__rbit64(v48)) + (v47 << 6);
    int64_t v102 = v47;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v47 = v49 + 1;
    if (__OFADD__(v49, 1)) {
      break;
    }
    if (v47 >= v89)
    {
      int64_t v102 = v71;
      goto LABEL_30;
    }
    unint64_t v48 = *(void *)(v75 + 8 * v47);
    ++v49;
    if (v48) {
      goto LABEL_16;
    }
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t (*sub_24E83F2B4())()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  swift_release();
  return sub_24E85E4D4;
}

uint64_t sub_24E83F35C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F7FE0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24E863FE8();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  int v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_retain();
  if (v12 == 1)
  {
    sub_24E563530((uint64_t)v8, (uint64_t *)&unk_2698F7FE0);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    sub_24E863FD8();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_24E863F18();
      uint64_t v14 = v15;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a4;
  *(void *)(v16 + 24) = v11;
  if (v14 | v13)
  {
    v18[0] = 0;
    v18[1] = 0;
    void v18[2] = v13;
    v18[3] = v14;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24E83F590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24E83F5B0, 0, 0);
}

uint64_t sub_24E83F5B0()
{
  *(void *)(v0 + 24) = sub_24E863FB8();
  *(void *)(v0 + 32) = sub_24E863FA8();
  uint64_t v2 = sub_24E863F18();
  return MEMORY[0x270FA2498](sub_24E83F648, v2, v1);
}

uint64_t sub_24E83F648()
{
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E8617A8();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E83F744(uint64_t a1)
{
  uint64_t v15 = type metadata accessor for MapsDirectionsProvider.InputValue(0);
  MEMORY[0x270FA5388](v15);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F8830);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E861298();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E863FB8();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v14[1] = a1;
  uint64_t v11 = *(void *)(a1 + 56);
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getKeyPath();
  uint64_t v16 = v11;
  sub_24E85E898((unint64_t *)&qword_2698F7110, (void (*)(uint64_t))type metadata accessor for UserLocationProvider);
  sub_24E8617C8();
  swift_release();
  uint64_t v12 = v11 + OBJC_IVAR____TtC12FindMyUICore20UserLocationProvider__data;
  swift_beginAccess();
  sub_24E576EA0(v12, (uint64_t)v6, (uint64_t *)&unk_2698F8830);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_24E563530((uint64_t)v6, (uint64_t *)&unk_2698F8830);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v3, v10, v7);
    swift_storeEnumTagMultiPayload();
    MapsDirectionsProvider.inputValueDidChange(_:)((uint64_t)v3);
    sub_24E85E7D0((uint64_t)v3, type metadata accessor for MapsDirectionsProvider.InputValue);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return swift_release();
}

uint64_t (*sub_24E83FAD0())()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_retain();
  swift_release();
  return sub_24E85E3BC;
}

uint64_t sub_24E83FB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24E83FB98, 0, 0);
}

uint64_t sub_24E83FB98()
{
  *(void *)(v0 + 24) = sub_24E863FB8();
  *(void *)(v0 + 32) = sub_24E863FA8();
  uint64_t v2 = sub_24E863F18();
  return MEMORY[0x270FA2498](sub_24E83FC30, v2, v1);
}

uint64_t sub_24E83FC30()
{
  swift_release();
  sub_24E863FA8();
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24E8617A8();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E83FD2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v52 = a6;
  uint64_t v53 = a7;
  uint64_t v51 = a5;
  uint64_t v61 = a1;
  uint64_t v9 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v55 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v58 = (uint64_t)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v56 = *(void *)(v11 - 8);
  uint64_t v57 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v62 = (uint64_t)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E863FB8();
  uint64_t v54 = sub_24E863FA8();
  uint64_t v60 = v13;
  sub_24E863F18();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v63 = a3;
  uint64_t v64 = a4;
  swift_bridgeObjectRetain();
  sub_24E863D38();
  swift_bridgeObjectRetain();
  sub_24E863D38();
  swift_bridgeObjectRelease();
  uint64_t v15 = v63;
  uint64_t v14 = v64;
  uint64_t v16 = v61;
  int64_t v17 = *(void *)(v61 + 16);
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (v17)
  {
    uint64_t v49 = v63;
    uint64_t v50 = v64;
    uint64_t v63 = MEMORY[0x263F8EE78];
    sub_24E5760F8(0, v17, 0);
    uint64_t v18 = v63;
    uint64_t result = sub_24E85CC38(v16);
    int64_t v20 = result;
    int v22 = v21;
    char v24 = v23 & 1;
    uint64_t v59 = v16 + 56;
    uint64_t v25 = v16;
    do
    {
      if (v20 < 0 || v20 >= 1 << *(unsigned char *)(v25 + 32))
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      if (((*(void *)(v59 + (((unint64_t)v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
        goto LABEL_44;
      }
      if (*(_DWORD *)(v25 + 36) != v22) {
        goto LABEL_45;
      }
      swift_bridgeObjectRetain();
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_bridgeObjectRetain();
      uint64_t v26 = v62;
      sub_24E861228();
      swift_bridgeObjectRelease();
      swift_release();
      *(unsigned char *)(v26 + *(int *)(v57 + 20)) = 1;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v63 = v18;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24E5760F8(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v18 = v63;
      }
      uint64_t v25 = v61;
      unint64_t v29 = *(void *)(v18 + 16);
      unint64_t v28 = *(void *)(v18 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_24E5760F8(v28 > 1, v29 + 1, 1);
        uint64_t v18 = v63;
      }
      *(void *)(v18 + 16) = v29 + 1;
      sub_24E85E768(v62, v18+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v29, type metadata accessor for PeopleLocationsProvider.Subscription);
      uint64_t result = sub_24E85CCDC(v20, v22, v24 & 1, v25);
      int64_t v20 = result;
      int v22 = v30;
      char v24 = v31 & 1;
      --v17;
    }
    while (v17);
    sub_24E61B850(result, v30, v31 & 1);
    int64_t v32 = *(void *)(v25 + 16);
    uint64_t v33 = MEMORY[0x263F8EE78];
    if (!v32)
    {
LABEL_31:
      uint64_t v14 = v50;
      uint64_t v15 = v49;
      goto LABEL_32;
    }
    uint64_t v63 = MEMORY[0x263F8EE78];
    sub_24E5761CC(0, v32, 0);
    uint64_t v33 = v63;
    uint64_t result = sub_24E85CC38(v25);
    int64_t v34 = result;
    int v36 = v35;
    int v38 = v37 & 1;
    while ((v34 & 0x8000000000000000) == 0 && v34 < 1 << *(unsigned char *)(v25 + 32))
    {
      if (((*(void *)(v59 + (((unint64_t)v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
        goto LABEL_47;
      }
      if (*(_DWORD *)(v25 + 36) != v36) {
        goto LABEL_48;
      }
      LODWORD(v62) = v38;
      swift_bridgeObjectRetain();
      sub_24E863FA8();
      sub_24E863F18();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_bridgeObjectRetain();
      uint64_t v39 = v58;
      sub_24E861128();
      uint64_t v40 = sub_24E861138();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
      swift_bridgeObjectRelease();
      swift_release();
      char v41 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v63 = v33;
      if ((v41 & 1) == 0)
      {
        sub_24E5761CC(0, *(void *)(v33 + 16) + 1, 1);
        uint64_t v33 = v63;
      }
      unint64_t v43 = *(void *)(v33 + 16);
      unint64_t v42 = *(void *)(v33 + 24);
      if (v43 >= v42 >> 1)
      {
        sub_24E5761CC(v42 > 1, v43 + 1, 1);
        uint64_t v33 = v63;
      }
      *(void *)(v33 + 16) = v43 + 1;
      sub_24E85E768(v58, v33+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v43, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      uint64_t v25 = v61;
      uint64_t result = sub_24E85CCDC(v34, v36, v62 & 1, v61);
      int64_t v34 = result;
      int v36 = v44;
      int v38 = v45 & 1;
      if (!--v32)
      {
        sub_24E61B850(result, v44, v38);
        goto LABEL_31;
      }
    }
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
  }
  else
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
LABEL_32:
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      if (*(void *)(v61 + 16)) {
        uint64_t v46 = sub_24E74980C((uint64_t)&unk_27005ADD0);
      }
      else {
        uint64_t v46 = MEMORY[0x263F8EE88];
      }
      sub_24E8347FC(v46, v15, v14);
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      uint64_t v47 = sub_24E85D9D4(v18);
      swift_bridgeObjectRelease();
      sub_24E838E48(v47, v15, v14, &qword_2698F7088, (uint64_t)"FindMyUICore/PeopleLocationsProvider.swift", 42, (uint64_t)&unk_24E871F58, &OBJC_IVAR____TtC12FindMyUICore23PeopleLocationsProvider___observationRegistrar, &qword_2698F7090, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider, (uint64_t)&protocol conformance descriptor for PeopleLocationsProvider, &OBJC_IVAR____TtC12FindMyUICore23PeopleLocationsProvider__storage, (void (*)(void))type metadata accessor for PeopleLocationsProvider.Subscription, &qword_2698F70C0, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider.Subscription, (uint64_t)&protocol conformance descriptor for PeopleLocationsProvider.Subscription, (void (*)(uint64_t, uint64_t))sub_24E60AD30, &qword_2698F88A8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E61F108,
        sub_24E652D3C,
        (uint64_t)sub_24E85D9D4,
        (uint64_t *)sub_24E83BC10,
        (uint64_t (*)(char *, uint64_t))sub_24E853774,
        (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E84EF40,
        (char *)PeopleLocationsProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:),
        (char *)PeopleLocationsProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:));
      swift_release();
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      uint64_t v48 = sub_24E85D6B4(v33);
      swift_bridgeObjectRelease();
      sub_24E838E48(v48, v15, v14, &qword_2698F7118, (uint64_t)"FindMyUICore/BeaconsInfoProvider.swift", 38, (uint64_t)&unk_24E871F30, &OBJC_IVAR____TtC12FindMyUICore19BeaconsInfoProvider___observationRegistrar, &qword_2698F7120, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider, (uint64_t)&protocol conformance descriptor for BeaconsInfoProvider, &OBJC_IVAR____TtC12FindMyUICore19BeaconsInfoProvider__storage, (void (*)(void))type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, &qword_2698F7148, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, (uint64_t)&protocol conformance descriptor for BeaconsInfoProvider.BeaconsSubscription, (void (*)(uint64_t, uint64_t))sub_24E60ACD8, &qword_2698F88A0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E61F0B0,
        sub_24E651AB4,
        (uint64_t)sub_24E85D6B4,
        (uint64_t *)sub_24E83B6E0,
        (uint64_t (*)(char *, uint64_t))sub_24E852140,
        (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24E84E9D0,
        (char *)BeaconsInfoProvider.didAddNewUniqueSubscriptions(addedSubscriptions:wasEmpty:),
        (char *)BeaconsInfoProvider.didRemoveUniqueSubscriptions(removedSubscriptions:isEmpty:));
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ProvidersMediator.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t ProvidersMediator.__deallocating_deinit()
{
  ProvidersMediator.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_24E840834(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = _s16SubscriptionDataOMa(0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24E864A58();
  swift_bridgeObjectRetain();
  sub_24E6165EC();
  uint64_t v11 = sub_24E864A98();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v19 = a1;
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v7 + 72);
    while (1)
    {
      sub_24E85E830(*(void *)(v10 + 48) + v15 * v13, (uint64_t)v9, _s16SubscriptionDataOMa);
      char v16 = sub_24E61B004((uint64_t)v9, a2);
      sub_24E85E7D0((uint64_t)v9, _s16SubscriptionDataOMa);
      if (v16) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
      if (((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a1 = v19;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    sub_24E85E7D0(a2, _s16SubscriptionDataOMa);
    sub_24E85E830(*(void *)(*v3 + 48) + v15 * v13, v19, _s16SubscriptionDataOMa);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24E85E830(a2, (uint64_t)v9, _s16SubscriptionDataOMa);
    uint64_t v20 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24E845CFC((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v20;
    swift_bridgeObjectRelease();
    sub_24E85E768(a2, a1, _s16SubscriptionDataOMa);
    return 1;
  }
}

uint64_t sub_24E840AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = _s16SubscriptionDataO10DirectionsVMa(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v13 = *v2;
  sub_24E864A58();
  sub_24E861248();
  sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  swift_bridgeObjectRetain();
  sub_24E863BB8();
  uint64_t v14 = sub_24E864A98();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  unint64_t v16 = v14 & ~v15;
  if ((*(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
  {
    char v23 = v12;
    uint64_t v24 = a1;
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v7 + 72);
    while (1)
    {
      sub_24E85E830(*(void *)(v13 + 48) + v18 * v16, (uint64_t)v10, _s16SubscriptionDataO10DirectionsVMa);
      char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
      sub_24E85E7D0((uint64_t)v10, _s16SubscriptionDataO10DirectionsVMa);
      if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
        break;
      }
      unint64_t v16 = (v16 + 1) & v17;
      if (((*(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = v23;
        a1 = v24;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    sub_24E85E7D0(a2, _s16SubscriptionDataO10DirectionsVMa);
    sub_24E85E830(*(void *)(*v3 + 48) + v18 * v16, v24, _s16SubscriptionDataO10DirectionsVMa);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24E85E830(a2, (uint64_t)v12, _s16SubscriptionDataO10DirectionsVMa);
    uint64_t v25 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24E845F90((uint64_t)v12, v16, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v25;
    swift_bridgeObjectRelease();
    sub_24E85E768(a2, a1, _s16SubscriptionDataO10DirectionsVMa);
    return 1;
  }
}

uint64_t sub_24E840DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = _s16SubscriptionDataO10FriendshipVMa(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v13 = *v2;
  sub_24E864A58();
  sub_24E861248();
  sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  swift_bridgeObjectRetain();
  sub_24E863BB8();
  uint64_t v14 = sub_24E864A98();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  unint64_t v16 = v14 & ~v15;
  if ((*(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
  {
    char v23 = v12;
    uint64_t v24 = a1;
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v7 + 72);
    while (1)
    {
      sub_24E85E830(*(void *)(v13 + 48) + v18 * v16, (uint64_t)v10, _s16SubscriptionDataO10FriendshipVMa);
      char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
      sub_24E85E7D0((uint64_t)v10, _s16SubscriptionDataO10FriendshipVMa);
      if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
        break;
      }
      unint64_t v16 = (v16 + 1) & v17;
      if (((*(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = v23;
        a1 = v24;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    sub_24E85E7D0(a2, _s16SubscriptionDataO10FriendshipVMa);
    sub_24E85E830(*(void *)(*v3 + 48) + v18 * v16, v24, _s16SubscriptionDataO10FriendshipVMa);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24E85E830(a2, (uint64_t)v12, _s16SubscriptionDataO10FriendshipVMa);
    uint64_t v25 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24E8462E0((uint64_t)v12, v16, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v25;
    swift_bridgeObjectRelease();
    sub_24E85E768(a2, a1, _s16SubscriptionDataO10FriendshipVMa);
    return 1;
  }
}

uint64_t sub_24E841098(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24E861248();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_24E863BA8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_24E85E898(&qword_2698F1648, MEMORY[0x263F3CBB0]);
      char v21 = sub_24E863C18();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24E846630((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_24E8413BC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24E864A58();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24E863D08();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_24E864A98();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24E864988() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24E864988() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24E8468D0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24E84157C(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7150);
  MEMORY[0x270FA5388](v54);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E861138();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v42 - v11;
  uint64_t v13 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v51 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v49 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v42 = (uint64_t)&v42 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v42 - v21;
  uint64_t v23 = *v2;
  sub_24E864A58();
  uint64_t v55 = a2;
  sub_24E85E830(a2, (uint64_t)v22, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  int v24 = v53(v22, 1, v7);
  uint64_t v44 = a1;
  unint64_t v43 = v2;
  if (v24 == 1)
  {
    sub_24E864A68();
    swift_bridgeObjectRetain();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v22, v7);
    sub_24E864A68();
    sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }
  uint64_t v25 = (uint64_t)v49;
  uint64_t v26 = sub_24E864A98();
  uint64_t v27 = -1 << *(unsigned char *)(v23 + 32);
  unint64_t v28 = v26 & ~v27;
  uint64_t v52 = v23 + 56;
  if (((*(void *)(v23 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    char v37 = v43;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = v55;
    uint64_t v40 = v42;
    sub_24E85E830(v55, v42, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v56 = *v37;
    *char v37 = 0x8000000000000000;
    sub_24E846B7C(v40, v28, isUniquelyReferenced_nonNull_native);
    *char v37 = v56;
    swift_bridgeObjectRelease();
    sub_24E85E768(v39, v44, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    return 1;
  }
  uint64_t v50 = ~v27;
  uint64_t v51 = *(void *)(v51 + 72);
  char v45 = (void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v48 = (void (**)(uint64_t, uint64_t))(v8 + 8);
  while (1)
  {
    uint64_t v30 = v23;
    unint64_t v31 = v51 * v28;
    sub_24E85E830(*(void *)(v23 + 48) + v51 * v28, (uint64_t)v18, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v32 = (uint64_t)&v6[*(int *)(v54 + 48)];
    sub_24E85E830((uint64_t)v18, (uint64_t)v6, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E85E830(v55, v32, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v53;
    if (v53(v6, 1, v7) == 1)
    {
      int v29 = v33(v32, 1, v7);
      uint64_t v23 = v30;
      if (v29 == 1) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
    sub_24E85E830((uint64_t)v6, v25, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    if (v33(v32, 1, v7) != 1) {
      break;
    }
    (*v48)(v25, v7);
    uint64_t v23 = v30;
LABEL_7:
    sub_24E563530((uint64_t)v6, &qword_2698F7150);
LABEL_8:
    sub_24E85E7D0((uint64_t)v18, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    unint64_t v28 = (v28 + 1) & v50;
    if (((*(void *)(v52 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
      goto LABEL_14;
    }
  }
  uint64_t v34 = v46;
  (*v45)(v46, v32, v7);
  int v47 = sub_24E861108();
  int v35 = *v48;
  int v36 = v34;
  uint64_t v25 = (uint64_t)v49;
  (*v48)((uint64_t)v36, v7);
  v35(v25, v7);
  uint64_t v23 = v30;
  if ((v47 & 1) == 0)
  {
    sub_24E85E7D0((uint64_t)v6, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    goto LABEL_8;
  }
LABEL_15:
  sub_24E85E7D0((uint64_t)v6, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  sub_24E85E7D0((uint64_t)v18, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  swift_bridgeObjectRelease();
  sub_24E85E7D0(v55, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  sub_24E85E830(*(void *)(*v43 + 48) + v31, v44, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  return 0;
}

uint64_t sub_24E841C30(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = a1;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B0);
  MEMORY[0x270FA5388](v65);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E861248();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v56 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v51 - v10;
  uint64_t v12 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v63 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v59 = (uint64_t *)((char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v60 = (char *)&v51 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v51 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v52 = (uint64_t)&v51 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v51 - v22;
  uint64_t v53 = v2;
  uint64_t v24 = *v2;
  sub_24E864A58();
  uint64_t v66 = a2;
  sub_24E85E830(a2, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v58 = v6;
  if (EnumCaseMultiPayload == 1)
  {
    sub_24E864A68();
    swift_bridgeObjectRetain();
    sub_24E863D08();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v23, v6);
    sub_24E864A68();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  uint64_t v26 = v7;
  uint64_t v27 = v24;
  uint64_t v28 = sub_24E864A98();
  uint64_t v29 = -1 << *(unsigned char *)(v24 + 32);
  unint64_t v30 = v28 & ~v29;
  uint64_t v64 = v24 + 56;
  uint64_t v31 = (uint64_t)v60;
  if (((*(void *)(v24 + 56 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v46 = v53;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v48 = v66;
    uint64_t v49 = v52;
    sub_24E85E830(v66, v52, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t v67 = *v46;
    *uint64_t v46 = 0x8000000000000000;
    sub_24E8471D4(v49, v30, isUniquelyReferenced_nonNull_native);
    *uint64_t v46 = v67;
    swift_bridgeObjectRelease();
    sub_24E85E768(v48, v54, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    return 1;
  }
  uint64_t v62 = ~v29;
  uint64_t v63 = *(void *)(v63 + 72);
  uint64_t v55 = (void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v57 = (void (**)(uint64_t, uint64_t))(v26 + 8);
  while (1)
  {
    unint64_t v32 = v63 * v30;
    sub_24E85E830(*(void *)(v27 + 48) + v63 * v30, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t v33 = &v5[*(int *)(v65 + 48)];
    sub_24E85E830((uint64_t)v19, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    sub_24E85E830(v66, (uint64_t)v33, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() == 1) {
      break;
    }
    sub_24E85E830((uint64_t)v5, v31, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      unint64_t v61 = v32;
      char v41 = v56;
      uint64_t v42 = v58;
      (*v55)(v56, v33, v58);
      char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
      uint64_t v44 = *v57;
      char v45 = v41;
      uint64_t v31 = (uint64_t)v60;
      (*v57)((uint64_t)v45, v42);
      v44(v31, v42);
      if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    (*v57)(v31, v58);
LABEL_7:
    sub_24E563530((uint64_t)v5, &qword_2698F70B0);
LABEL_8:
    sub_24E85E7D0((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    unint64_t v30 = (v30 + 1) & v62;
    if (((*(void *)(v64 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
      goto LABEL_21;
    }
  }
  unint64_t v61 = v32;
  uint64_t v34 = v59;
  sub_24E85E830((uint64_t)v5, (uint64_t)v59, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v37 = *(void *)v33;
  uint64_t v38 = *((void *)v33 + 1);
  if (v36 != v37 || v35 != v38)
  {
    char v40 = sub_24E864988();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_23;
    }
LABEL_19:
    sub_24E85E7D0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    goto LABEL_8;
  }
  swift_bridgeObjectRelease_n();
LABEL_23:
  sub_24E85E7D0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  sub_24E85E7D0((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  swift_bridgeObjectRelease();
  sub_24E85E7D0(v66, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  sub_24E85E830(*(void *)(*v53 + 48) + v61, v54, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  return 0;
}

uint64_t sub_24E842364(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = a1;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70D8);
  MEMORY[0x270FA5388](v54);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v49 = (uint64_t)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v51 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v44 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v45 = (uint64_t)&v44 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v44 - v21;
  uint64_t v46 = v2;
  uint64_t v23 = *v2;
  sub_24E864A58();
  uint64_t v55 = a2;
  sub_24E85E830(a2, (uint64_t)v22, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v24 = v7 + 48;
  uint64_t v53 = v25;
  if (v25((uint64_t)v22, 1, v6) == 1)
  {
    sub_24E864A68();
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_24E85E768((uint64_t)v22, (uint64_t)v11, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    sub_24E864A68();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    sub_24E85E7D0((uint64_t)v11, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  }
  uint64_t v26 = sub_24E864A98();
  uint64_t v27 = -1 << *(unsigned char *)(v23 + 32);
  unint64_t v28 = v26 & ~v27;
  uint64_t v52 = v23 + 56;
  if (((*(void *)(v23 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v39 = v46;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v41 = v55;
    uint64_t v42 = v45;
    sub_24E85E830(v55, v45, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v56 = *v39;
    *uint64_t v39 = 0x8000000000000000;
    sub_24E847934(v42, v28, isUniquelyReferenced_nonNull_native);
    *uint64_t v39 = v56;
    swift_bridgeObjectRelease();
    sub_24E85E768(v41, v47, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    return 1;
  }
  uint64_t v50 = ~v27;
  uint64_t v51 = *(void *)(v51 + 72);
  uint64_t v48 = v18;
  while (1)
  {
    unint64_t v29 = v51 * v28;
    sub_24E85E830(*(void *)(v23 + 48) + v51 * v28, (uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v30 = (uint64_t)&v5[*(int *)(v54 + 48)];
    sub_24E85E830((uint64_t)v18, (uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E85E830(v55, v30, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v31 = v53;
    if (v53((uint64_t)v5, 1, v6) == 1)
    {
      if (v31(v30, 1, v6) == 1) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
    sub_24E85E830((uint64_t)v5, (uint64_t)v15, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    if (v31(v30, 1, v6) != 1) {
      break;
    }
    sub_24E85E7D0((uint64_t)v15, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
LABEL_7:
    sub_24E563530((uint64_t)v5, &qword_2698F70D8);
LABEL_8:
    sub_24E85E7D0((uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    unint64_t v28 = (v28 + 1) & v50;
    if (((*(void *)(v52 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
      goto LABEL_14;
    }
  }
  uint64_t v32 = v23;
  uint64_t v33 = v24;
  uint64_t v34 = v6;
  uint64_t v35 = v15;
  uint64_t v36 = v49;
  sub_24E85E768(v30, v49, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
  uint64_t v38 = v36;
  uint64_t v15 = v35;
  uint64_t v6 = v34;
  uint64_t v24 = v33;
  uint64_t v23 = v32;
  uint64_t v18 = v48;
  sub_24E85E7D0(v38, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  sub_24E85E7D0((uint64_t)v15, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  if ((MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 & 1) == 0)
  {
    sub_24E85E7D0((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    goto LABEL_8;
  }
LABEL_15:
  sub_24E85E7D0((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  sub_24E85E7D0((uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  swift_bridgeObjectRelease();
  sub_24E85E7D0(v55, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  sub_24E85E830(*(void *)(*v46 + 48) + v29, v47, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  return 0;
}

uint64_t sub_24E8429E4()
{
  uint64_t v1 = v0;
  uint64_t v52 = _s16SubscriptionDataO9LocationsVMa(0);
  MEMORY[0x270FA5388](v52);
  uint64_t v51 = (uint64_t)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = _s16SubscriptionDataO10DirectionsVMa(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v50 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s16SubscriptionDataO10FriendshipVMa(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v49 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s16SubscriptionDataOMa(0);
  uint64_t v56 = *(void *)(v7 - 8);
  uint64_t v57 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v48 - v11;
  uint64_t v13 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F71B0);
  uint64_t v14 = sub_24E8644B8();
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_44;
  }
  uint64_t v48 = v0;
  uint64_t v16 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v17 = *(void *)(v13 + 56);
  uint64_t v55 = (void *)(v13 + 56);
  if (v16 < 64) {
    uint64_t v18 = ~(-1 << v16);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v17;
  int64_t v54 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v20 = v14 + 56;
  swift_retain();
  int64_t v21 = 0;
  uint64_t v53 = v10;
  while (1)
  {
    if (v19)
    {
      unint64_t v23 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_45;
    }
    if (v25 >= v54) {
      break;
    }
    unint64_t v26 = v55[v25];
    ++v21;
    if (!v26)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v54) {
        break;
      }
      unint64_t v26 = v55[v21];
      if (!v26)
      {
        int64_t v21 = v25 + 2;
        if (v25 + 2 >= v54) {
          break;
        }
        unint64_t v26 = v55[v21];
        if (!v26)
        {
          int64_t v27 = v25 + 3;
          if (v27 >= v54) {
            break;
          }
          unint64_t v26 = v55[v27];
          if (!v26)
          {
            while (1)
            {
              int64_t v21 = v27 + 1;
              if (__OFADD__(v27, 1)) {
                goto LABEL_46;
              }
              if (v21 >= v54) {
                goto LABEL_40;
              }
              unint64_t v26 = v55[v21];
              ++v27;
              if (v26) {
                goto LABEL_23;
              }
            }
          }
          int64_t v21 = v27;
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    uint64_t v28 = *(void *)(v56 + 72);
    sub_24E85E768(*(void *)(v13 + 48) + v28 * v24, (uint64_t)v12, _s16SubscriptionDataOMa);
    sub_24E864A58();
    sub_24E85E830((uint64_t)v12, (uint64_t)v10, _s16SubscriptionDataOMa);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v32 = (uint64_t)v10;
        uint64_t v30 = v50;
        sub_24E85E768(v32, v50, _s16SubscriptionDataO10DirectionsVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        uint64_t v31 = _s16SubscriptionDataO10DirectionsVMa;
        goto LABEL_27;
      case 2u:
        uint64_t v35 = (uint64_t)v10;
        uint64_t v36 = v13;
        uint64_t v37 = v51;
        sub_24E85E768(v35, v51, _s16SubscriptionDataO9LocationsVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        sub_24E864A78();
        uint64_t v33 = _s16SubscriptionDataO9LocationsVMa;
        uint64_t v34 = v37;
        uint64_t v13 = v36;
        goto LABEL_29;
      case 3u:
      case 4u:
        sub_24E864A68();
        goto LABEL_31;
      default:
        uint64_t v29 = (uint64_t)v10;
        uint64_t v30 = v49;
        sub_24E85E768(v29, v49, _s16SubscriptionDataO10FriendshipVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        uint64_t v31 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_27:
        uint64_t v33 = v31;
        uint64_t v34 = v30;
LABEL_29:
        uint64_t v10 = v53;
        sub_24E85E7D0(v34, v33);
LABEL_31:
        uint64_t v38 = sub_24E864A98();
        uint64_t v39 = -1 << *(unsigned char *)(v15 + 32);
        unint64_t v40 = v38 & ~v39;
        unint64_t v41 = v40 >> 6;
        if (((-1 << v40) & ~*(void *)(v20 + 8 * (v40 >> 6))) != 0)
        {
          unint64_t v22 = __clz(__rbit64((-1 << v40) & ~*(void *)(v20 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
          goto LABEL_7;
        }
        char v42 = 0;
        unint64_t v43 = (unint64_t)(63 - v39) >> 6;
        break;
    }
    do
    {
      if (++v41 == v43 && (v42 & 1) != 0)
      {
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        JUMPOUT(0x24E8430ECLL);
      }
      BOOL v44 = v41 == v43;
      if (v41 == v43) {
        unint64_t v41 = 0;
      }
      v42 |= v44;
      uint64_t v45 = *(void *)(v20 + 8 * v41);
    }
    while (v45 == -1);
    unint64_t v22 = __clz(__rbit64(~v45)) + (v41 << 6);
LABEL_7:
    *(void *)(v20 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    sub_24E85E768((uint64_t)v12, *(void *)(v15 + 48) + v22 * v28, _s16SubscriptionDataOMa);
    ++*(void *)(v15 + 16);
  }
LABEL_40:
  swift_release();
  uint64_t v1 = v48;
  uint64_t v46 = 1 << *(unsigned char *)(v13 + 32);
  if (v46 > 63) {
    bzero(v55, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v55 = -1 << v46;
  }
  *(void *)(v13 + 16) = 0;
LABEL_44:
  uint64_t result = swift_release();
  *uint64_t v1 = v15;
  return result;
}

uint64_t sub_24E843100()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_24E861248();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  unint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8940);
  uint64_t v5 = sub_24E8644B8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      uint64_t result = sub_24E863BA8();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_24E8434FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8948);
  uint64_t v6 = sub_24E8644B8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    char v30 = v0;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    BOOL v32 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v31 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = v32[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v19 = v32[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v19 = v32[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v31)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 > 63) {
                  bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *BOOL v32 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v32[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v32[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v33 + 72);
      sub_24E85E768(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, _s16SubscriptionDataO9LocationsVMa);
      sub_24E864A58();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E864A78();
      uint64_t result = sub_24E864A98();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_24E85E768((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, _s16SubscriptionDataO9LocationsVMa);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24E8438FC(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v7 = v4;
  uint64_t v8 = a2(0);
  uint64_t v42 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v12 = sub_24E8644B8();
  uint64_t v13 = v12;
  if (*(void *)(v11 + 16))
  {
    uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 56);
    unint64_t v41 = (void *)(v11 + 56);
    if (v14 < 64) {
      uint64_t v16 = ~(-1 << v14);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v17 = v16 & v15;
    uint64_t v39 = v4;
    int64_t v40 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v18 = v12 + 56;
    uint64_t result = swift_retain();
    int64_t v20 = 0;
    while (1)
    {
      if (v17)
      {
        unint64_t v22 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        unint64_t v23 = v22 | (v20 << 6);
      }
      else
      {
        int64_t v24 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v24 >= v40) {
          goto LABEL_33;
        }
        unint64_t v25 = v41[v24];
        ++v20;
        if (!v25)
        {
          int64_t v20 = v24 + 1;
          if (v24 + 1 >= v40) {
            goto LABEL_33;
          }
          unint64_t v25 = v41[v20];
          if (!v25)
          {
            int64_t v20 = v24 + 2;
            if (v24 + 2 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = v41[v20];
            if (!v25)
            {
              int64_t v26 = v24 + 3;
              if (v26 >= v40)
              {
LABEL_33:
                swift_release();
                uint64_t v7 = v39;
                uint64_t v37 = 1 << *(unsigned char *)(v11 + 32);
                if (v37 > 63) {
                  bzero(v41, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v41 = -1 << v37;
                }
                *(void *)(v11 + 16) = 0;
                break;
              }
              unint64_t v25 = v41[v26];
              if (!v25)
              {
                while (1)
                {
                  int64_t v20 = v26 + 1;
                  if (__OFADD__(v26, 1)) {
                    goto LABEL_39;
                  }
                  if (v20 >= v40) {
                    goto LABEL_33;
                  }
                  unint64_t v25 = v41[v20];
                  ++v26;
                  if (v25) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v20 = v26;
            }
          }
        }
LABEL_23:
        unint64_t v17 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v20 << 6);
      }
      uint64_t v27 = v11;
      uint64_t v28 = *(void *)(v11 + 48);
      uint64_t v29 = *(void *)(v42 + 72);
      sub_24E85E768(v28 + v29 * v23, (uint64_t)v10, a4);
      sub_24E864A58();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      uint64_t result = sub_24E864A98();
      uint64_t v30 = -1 << *(unsigned char *)(v13 + 32);
      unint64_t v31 = result & ~v30;
      unint64_t v32 = v31 >> 6;
      if (((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6))) != 0)
      {
        unint64_t v21 = __clz(__rbit64((-1 << v31) & ~*(void *)(v18 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v33 = 0;
        unint64_t v34 = (unint64_t)(63 - v30) >> 6;
        do
        {
          if (++v32 == v34 && (v33 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v35 = v32 == v34;
          if (v32 == v34) {
            unint64_t v32 = 0;
          }
          v33 |= v35;
          uint64_t v36 = *(void *)(v18 + 8 * v32);
        }
        while (v36 == -1);
        unint64_t v21 = __clz(__rbit64(~v36)) + (v32 << 6);
      }
      *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      uint64_t result = sub_24E85E768((uint64_t)v10, *(void *)(v13 + 48) + v21 * v29, a4);
      ++*(void *)(v13 + 16);
      uint64_t v11 = v27;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v7 = v13;
  return result;
}

uint64_t sub_24E843CD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8930);
  uint64_t v3 = sub_24E8644B8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_24E864338();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24E843F74()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v36 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7178);
  uint64_t v6 = sub_24E8644B8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    BOOL v35 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    char v33 = v0;
    int64_t v34 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34) {
          goto LABEL_33;
        }
        unint64_t v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v19 = v35[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v34) {
              goto LABEL_33;
            }
            unint64_t v19 = v35[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v33;
                uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
                if (v31 > 63) {
                  bzero(v35, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v35 = -1 << v31;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v34) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v35[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = v5;
      uint64_t v22 = *(void *)(v5 + 48);
      uint64_t v23 = *(void *)(v36 + 72);
      sub_24E85E768(v22 + v23 * v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      sub_24E864A58();
      sub_24E8610C8();
      sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
      sub_24E863BB8();
      sub_24E864A88();
      sub_24E864A68();
      uint64_t result = sub_24E864A98();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v12 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v15 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_24E85E768((uint64_t)v4, *(void *)(v7 + 48) + v15 * v23, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      ++*(void *)(v7 + 16);
      uint64_t v5 = v21;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24E844390()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7130);
  uint64_t v3 = sub_24E8644B8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24E864A58();
      swift_bridgeObjectRetain();
      sub_24E863D08();
      swift_bridgeObjectRelease();
      uint64_t result = sub_24E864A98();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24E844680()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7140);
  uint64_t result = sub_24E8644B8();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    uint64_t v23 = v2;
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (!v9)
      {
        int64_t v13 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v13 >= v10) {
          goto LABEL_31;
        }
        uint64_t v9 = v6[v13];
        ++v5;
        if (!v9)
        {
          int64_t v5 = v13 + 1;
          if (v13 + 1 >= v10) {
            goto LABEL_31;
          }
          uint64_t v9 = v6[v5];
          if (!v9)
          {
            int64_t v5 = v13 + 2;
            if (v13 + 2 >= v10) {
              goto LABEL_31;
            }
            uint64_t v9 = v6[v5];
            if (!v9)
            {
              int64_t v14 = v13 + 3;
              if (v14 >= v10)
              {
LABEL_31:
                uint64_t v22 = 1 << *(unsigned char *)(v23 + 32);
                if (v22 > 63) {
                  bzero(v6, ((unint64_t)(v22 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v22;
                }
                uint64_t v1 = v0;
                *(void *)(v23 + 16) = 0;
                break;
              }
              uint64_t v9 = v6[v14];
              if (!v9)
              {
                while (1)
                {
                  int64_t v5 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_37;
                  }
                  if (v5 >= v10) {
                    goto LABEL_31;
                  }
                  uint64_t v9 = v6[v5];
                  ++v14;
                  if (v9) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v5 = v14;
            }
          }
        }
      }
LABEL_22:
      sub_24E864A58();
      sub_24E864A68();
      uint64_t result = sub_24E864A98();
      uint64_t v15 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v18 = 0;
        unint64_t v19 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v19 && (v18 & 1) != 0)
          {
            __break(1u);
            goto LABEL_36;
          }
          BOOL v20 = v17 == v19;
          if (v17 == v19) {
            unint64_t v17 = 0;
          }
          v18 |= v20;
          uint64_t v21 = *(void *)(v11 + 8 * v17);
        }
        while (v21 == -1);
        unint64_t v12 = __clz(__rbit64(~v21)) + (v17 << 6);
      }
      v9 &= v9 - 1;
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24E8448F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E861138();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v48 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7158);
  uint64_t v13 = sub_24E8644B8();
  uint64_t v14 = v13;
  if (*(void *)(v12 + 16))
  {
    uint64_t v45 = v0;
    char v15 = *(unsigned char *)(v12 + 32);
    uint64_t v16 = *(void *)(v12 + 56);
    uint64_t v50 = (void *)(v12 + 56);
    uint64_t v17 = 1 << v15;
    if (v17 < 64) {
      uint64_t v18 = ~(-1 << v17);
    }
    else {
      uint64_t v18 = -1;
    }
    unint64_t v19 = v18 & v16;
    int64_t v49 = (unint64_t)(v17 + 63) >> 6;
    uint64_t v52 = (unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
    uint64_t v46 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v47 = (void (**)(char *, char *, uint64_t))(v3 + 32);
    uint64_t v20 = v13 + 56;
    uint64_t result = swift_retain();
    int64_t v22 = 0;
    uint64_t v51 = v12;
    while (1)
    {
      if (v19)
      {
        unint64_t v24 = __clz(__rbit64(v19));
        v19 &= v19 - 1;
        int64_t v53 = v22;
        unint64_t v25 = v24 | (v22 << 6);
      }
      else
      {
        int64_t v26 = v22 + 1;
        if (__OFADD__(v22, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v26 >= v49) {
          goto LABEL_36;
        }
        unint64_t v27 = v50[v26];
        int64_t v28 = v22 + 1;
        if (!v27)
        {
          int64_t v28 = v22 + 2;
          if (v22 + 2 >= v49) {
            goto LABEL_36;
          }
          unint64_t v27 = v50[v28];
          if (!v27)
          {
            int64_t v28 = v22 + 3;
            if (v22 + 3 >= v49) {
              goto LABEL_36;
            }
            unint64_t v27 = v50[v28];
            if (!v27)
            {
              uint64_t v29 = v22 + 4;
              if (v22 + 4 >= v49)
              {
LABEL_36:
                swift_release();
                uint64_t v1 = v45;
                uint64_t v44 = 1 << *(unsigned char *)(v12 + 32);
                if (v44 > 63) {
                  bzero(v50, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v50 = -1 << v44;
                }
                *(void *)(v12 + 16) = 0;
                break;
              }
              unint64_t v27 = v50[v29];
              if (!v27)
              {
                while (1)
                {
                  int64_t v28 = v29 + 1;
                  if (__OFADD__(v29, 1)) {
                    goto LABEL_42;
                  }
                  if (v28 >= v49) {
                    goto LABEL_36;
                  }
                  unint64_t v27 = v50[v28];
                  ++v29;
                  if (v27) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v28 = v22 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v19 = (v27 - 1) & v27;
        int64_t v53 = v28;
        unint64_t v25 = __clz(__rbit64(v27)) + (v28 << 6);
      }
      uint64_t v30 = *(void *)(v12 + 48);
      uint64_t v31 = *(void *)(v6 + 72);
      sub_24E85E768(v30 + v31 * v25, (uint64_t)v11, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      sub_24E864A58();
      sub_24E85E830((uint64_t)v11, (uint64_t)v9, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      if ((*v52)(v9, 1, v2) == 1)
      {
        sub_24E864A68();
      }
      else
      {
        uint64_t v32 = v11;
        uint64_t v33 = v6;
        uint64_t v34 = v2;
        BOOL v35 = v48;
        (*v47)(v48, v9, v34);
        sub_24E864A68();
        sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
        sub_24E863BB8();
        uint64_t v36 = v35;
        uint64_t v2 = v34;
        uint64_t v6 = v33;
        uint64_t v11 = v32;
        (*v46)(v36, v2);
      }
      uint64_t result = sub_24E864A98();
      uint64_t v37 = -1 << *(unsigned char *)(v14 + 32);
      unint64_t v38 = result & ~v37;
      unint64_t v39 = v38 >> 6;
      if (((-1 << v38) & ~*(void *)(v20 + 8 * (v38 >> 6))) != 0)
      {
        unint64_t v23 = __clz(__rbit64((-1 << v38) & ~*(void *)(v20 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v40 = 0;
        unint64_t v41 = (unint64_t)(63 - v37) >> 6;
        do
        {
          if (++v39 == v41 && (v40 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v42 = v39 == v41;
          if (v39 == v41) {
            unint64_t v39 = 0;
          }
          v40 |= v42;
          uint64_t v43 = *(void *)(v20 + 8 * v39);
        }
        while (v43 == -1);
        unint64_t v23 = __clz(__rbit64(~v43)) + (v39 << 6);
      }
      *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t result = sub_24E85E768((uint64_t)v11, *(void *)(v14 + 48) + v23 * v31, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      ++*(void *)(v14 + 16);
      uint64_t v12 = v51;
      int64_t v22 = v53;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v14;
  return result;
}

uint64_t sub_24E844E58()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B8);
  uint64_t v7 = sub_24E8644B8();
  if (*(void *)(v6 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v9 = (void *)(v6 + 56);
    uint64_t v10 = -1;
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    unint64_t v11 = v10 & *(void *)(v6 + 56);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v14 << 6);
      }
      else
      {
        int64_t v17 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v17 >= v12) {
          goto LABEL_22;
        }
        unint64_t v18 = v9[v17];
        ++v14;
        if (!v18)
        {
          int64_t v14 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_22;
          }
          unint64_t v18 = v9[v14];
          if (!v18)
          {
            int64_t v14 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_22;
            }
            unint64_t v18 = v9[v14];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_22:
                swift_release();
                uint64_t v20 = 1 << *(unsigned char *)(v6 + 32);
                if (v20 > 63) {
                  bzero((void *)(v6 + 56), ((unint64_t)(v20 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v9 = -1 << v20;
                }
                *(void *)(v6 + 16) = 0;
                break;
              }
              unint64_t v18 = v9[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v14 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_28;
                  }
                  if (v14 >= v12) {
                    goto LABEL_22;
                  }
                  unint64_t v18 = v9[v14];
                  ++v19;
                  if (v18) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v14 = v19;
            }
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }
      sub_24E85E768(*(void *)(v6 + 48) + *(void *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      uint64_t result = sub_24E845A58((uint64_t)v5, v7);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24E8450C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70C8);
  uint64_t v6 = sub_24E8644B8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v30 = v0;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v32 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v31 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = v32[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v19 = v32[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v19 = v32[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v31)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 > 63) {
                  bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v32[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v32[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v33 + 72);
      sub_24E85E768(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, type metadata accessor for PeopleLocationsProvider.Subscription);
      sub_24E864A58();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E864A68();
      uint64_t result = sub_24E864A98();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_24E85E768((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, type metadata accessor for PeopleLocationsProvider.Subscription);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24E8454C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v45 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70E0);
  uint64_t v13 = sub_24E8644B8();
  uint64_t v14 = v13;
  if (*(void *)(v12 + 16))
  {
    uint64_t v44 = v0;
    uint64_t v15 = 1 << *(unsigned char *)(v12 + 32);
    uint64_t v16 = *(void *)(v12 + 56);
    uint64_t v47 = (void *)(v12 + 56);
    if (v15 < 64) {
      uint64_t v17 = ~(-1 << v15);
    }
    else {
      uint64_t v17 = -1;
    }
    unint64_t v18 = v17 & v16;
    int64_t v46 = (unint64_t)(v15 + 63) >> 6;
    int64_t v49 = (unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
    uint64_t v19 = v13 + 56;
    uint64_t result = swift_retain();
    int64_t v21 = 0;
    uint64_t v22 = v12;
    unint64_t v23 = v18;
    while (1)
    {
      if (v23)
      {
        unint64_t v25 = __clz(__rbit64(v23));
        v23 &= v23 - 1;
        int64_t v51 = v21;
        unint64_t v26 = v25 | (v21 << 6);
      }
      else
      {
        int64_t v27 = v21 + 1;
        if (__OFADD__(v21, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v27 >= v46) {
          goto LABEL_36;
        }
        unint64_t v28 = v47[v27];
        int64_t v29 = v21 + 1;
        if (!v28)
        {
          int64_t v29 = v21 + 2;
          if (v21 + 2 >= v46) {
            goto LABEL_36;
          }
          unint64_t v28 = v47[v29];
          if (!v28)
          {
            int64_t v29 = v21 + 3;
            if (v21 + 3 >= v46) {
              goto LABEL_36;
            }
            unint64_t v28 = v47[v29];
            if (!v28)
            {
              uint64_t v30 = v21 + 4;
              if (v21 + 4 >= v46)
              {
LABEL_36:
                swift_release();
                uint64_t v1 = v44;
                uint64_t v42 = 1 << *(unsigned char *)(v22 + 32);
                if (v42 > 63) {
                  bzero(v47, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v47 = -1 << v42;
                }
                *(void *)(v22 + 16) = 0;
                break;
              }
              unint64_t v28 = v47[v30];
              if (!v28)
              {
                while (1)
                {
                  int64_t v29 = v30 + 1;
                  if (__OFADD__(v30, 1)) {
                    goto LABEL_43;
                  }
                  if (v29 >= v46) {
                    goto LABEL_36;
                  }
                  unint64_t v28 = v47[v29];
                  ++v30;
                  if (v28) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v29 = v21 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v23 = (v28 - 1) & v28;
        int64_t v51 = v29;
        unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
      }
      uint64_t v31 = *(void *)(v22 + 48);
      uint64_t v50 = *(void *)(v6 + 72);
      sub_24E85E768(v31 + v50 * v26, (uint64_t)v11, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      sub_24E864A58();
      sub_24E85E830((uint64_t)v11, (uint64_t)v9, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      if ((*v49)(v9, 1, v2) == 1)
      {
        sub_24E864A68();
      }
      else
      {
        unint64_t v48 = v23;
        uint64_t v32 = v11;
        uint64_t v33 = v45;
        sub_24E85E768((uint64_t)v9, v45, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        uint64_t v34 = v33;
        unint64_t v11 = v32;
        unint64_t v23 = v48;
        sub_24E85E7D0(v34, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      }
      uint64_t result = sub_24E864A98();
      uint64_t v35 = -1 << *(unsigned char *)(v14 + 32);
      unint64_t v36 = result & ~v35;
      unint64_t v37 = v36 >> 6;
      if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
      {
        unint64_t v24 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v38 = 0;
        unint64_t v39 = (unint64_t)(63 - v35) >> 6;
        do
        {
          if (++v37 == v39 && (v38 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v40 = v37 == v39;
          if (v37 == v39) {
            unint64_t v37 = 0;
          }
          v38 |= v40;
          uint64_t v41 = *(void *)(v19 + 8 * v37);
        }
        while (v41 == -1);
        unint64_t v24 = __clz(__rbit64(~v41)) + (v37 << 6);
      }
      *(void *)(v19 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      uint64_t result = sub_24E85E768((uint64_t)v11, *(void *)(v14 + 48) + v24 * v50, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      ++*(void *)(v14 + 16);
      int64_t v21 = v51;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v14;
  return result;
}

uint64_t sub_24E845A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E861248();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E864A58();
  sub_24E85E830(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24E864A68();
    sub_24E863D08();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
    sub_24E864A68();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_24E864A98();
  unint64_t v12 = sub_24E864458();
  *(void *)(a2 + 56 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
  uint64_t result = sub_24E85E768(a1, *(void *)(a2 + 48) + *(void *)(v9 + 72) * v12, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24E845CFC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = _s16SubscriptionDataOMa(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0)
  {
LABEL_13:
    uint64_t v14 = v9;
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24E8429E4();
    goto LABEL_8;
  }
  if (v13 <= v12)
  {
    sub_24E848848();
LABEL_8:
    uint64_t v15 = *v4;
    sub_24E864A58();
    sub_24E6165EC();
    uint64_t v16 = sub_24E864A98();
    uint64_t v17 = -1 << *(unsigned char *)(v15 + 32);
    a2 = v16 & ~v17;
    if ((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v26 = v8;
      uint64_t v18 = ~v17;
      uint64_t v14 = v9;
      uint64_t v19 = *(void *)(v9 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(v15 + 48) + v19 * a2, (uint64_t)v11, _s16SubscriptionDataOMa);
        char v20 = sub_24E61B004((uint64_t)v11, a1);
        sub_24E85E7D0((uint64_t)v11, _s16SubscriptionDataOMa);
        if (v20) {
          goto LABEL_17;
        }
        a2 = (a2 + 1) & v18;
        if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t v14 = v9;
  sub_24E848274(_s16SubscriptionDataOMa, &qword_2698F71B0, _s16SubscriptionDataOMa, _s16SubscriptionDataOMa);
LABEL_14:
  uint64_t v21 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E85E768(a1, *(void *)(v21 + 48) + *(void *)(v14 + 72) * a2, _s16SubscriptionDataOMa);
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (!v24)
  {
    *(void *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E845F90(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = _s16SubscriptionDataO10DirectionsVMa(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0)
  {
LABEL_13:
    uint64_t v15 = v9;
    goto LABEL_14;
  }
  uint64_t v14 = v12 + 1;
  if (a3)
  {
    sub_24E8438FC(v14, _s16SubscriptionDataO10DirectionsVMa, &qword_2698F8960, _s16SubscriptionDataO10DirectionsVMa);
    goto LABEL_8;
  }
  if (v13 <= v12)
  {
    sub_24E84968C(v14, _s16SubscriptionDataO10DirectionsVMa, &qword_2698F8960, _s16SubscriptionDataO10DirectionsVMa, _s16SubscriptionDataO10DirectionsVMa);
LABEL_8:
    uint64_t v16 = *v4;
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    uint64_t v17 = sub_24E864A98();
    uint64_t v18 = -1 << *(unsigned char *)(v16 + 32);
    a2 = v17 & ~v18;
    if ((*(void *)(v16 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v27 = v8;
      uint64_t v19 = ~v18;
      uint64_t v15 = v9;
      uint64_t v20 = *(void *)(v9 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(v16 + 48) + v20 * a2, (uint64_t)v11, _s16SubscriptionDataO10DirectionsVMa);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        sub_24E85E7D0((uint64_t)v11, _s16SubscriptionDataO10DirectionsVMa);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_17;
        }
        a2 = (a2 + 1) & v19;
        if (((*(void *)(v16 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t v15 = v9;
  sub_24E848274(_s16SubscriptionDataO10DirectionsVMa, &qword_2698F8960, _s16SubscriptionDataO10DirectionsVMa, _s16SubscriptionDataO10DirectionsVMa);
LABEL_14:
  uint64_t v22 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E85E768(a1, *(void *)(v22 + 48) + *(void *)(v15 + 72) * a2, _s16SubscriptionDataO10DirectionsVMa);
  uint64_t v24 = *(void *)(v22 + 16);
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (!v25)
  {
    *(void *)(v22 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E8462E0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = _s16SubscriptionDataO10FriendshipVMa(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0)
  {
LABEL_13:
    uint64_t v15 = v9;
    goto LABEL_14;
  }
  uint64_t v14 = v12 + 1;
  if (a3)
  {
    sub_24E8438FC(v14, _s16SubscriptionDataO10FriendshipVMa, &qword_2698F8958, _s16SubscriptionDataO10FriendshipVMa);
    goto LABEL_8;
  }
  if (v13 <= v12)
  {
    sub_24E84968C(v14, _s16SubscriptionDataO10FriendshipVMa, &qword_2698F8958, _s16SubscriptionDataO10FriendshipVMa, _s16SubscriptionDataO10FriendshipVMa);
LABEL_8:
    uint64_t v16 = *v4;
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    uint64_t v17 = sub_24E864A98();
    uint64_t v18 = -1 << *(unsigned char *)(v16 + 32);
    a2 = v17 & ~v18;
    if ((*(void *)(v16 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v27 = v8;
      uint64_t v19 = ~v18;
      uint64_t v15 = v9;
      uint64_t v20 = *(void *)(v9 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(v16 + 48) + v20 * a2, (uint64_t)v11, _s16SubscriptionDataO10FriendshipVMa);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        sub_24E85E7D0((uint64_t)v11, _s16SubscriptionDataO10FriendshipVMa);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_17;
        }
        a2 = (a2 + 1) & v19;
        if (((*(void *)(v16 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t v15 = v9;
  sub_24E848274(_s16SubscriptionDataO10FriendshipVMa, &qword_2698F8958, _s16SubscriptionDataO10FriendshipVMa, _s16SubscriptionDataO10FriendshipVMa);
LABEL_14:
  uint64_t v22 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E85E768(a1, *(void *)(v22 + 48) + *(void *)(v15 + 72) * a2, _s16SubscriptionDataO10FriendshipVMa);
  uint64_t v24 = *(void *)(v22 + 16);
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (!v25)
  {
    *(void *)(v22 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E846630(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_24E861248();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24E843100();
  }
  else
  {
    if (v11 > v10)
    {
      sub_24E847F88();
      goto LABEL_12;
    }
    sub_24E848F18();
  }
  uint64_t v12 = *v3;
  sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  uint64_t v13 = sub_24E863BA8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_24E85E898(&qword_2698F1648, MEMORY[0x263F3CBB0]);
      char v21 = sub_24E863C18();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E8468D0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24E844390();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24E8484EC();
      goto LABEL_22;
    }
    sub_24E849DFC();
  }
  uint64_t v11 = *v4;
  sub_24E864A58();
  swift_bridgeObjectRetain();
  sub_24E863D08();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24E864A98();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24E864988(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24E8649C8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24E864988();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  char v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_24E846A7C(uint64_t result, char a2)
{
  unint64_t v3 = result;
  unint64_t v4 = *(void *)(*v2 + 16);
  unint64_t v5 = *(void *)(*v2 + 24);
  if (v5 <= v4 || (a2 & 1) == 0)
  {
    if (a2)
    {
      sub_24E844680();
      goto LABEL_8;
    }
    if (v5 <= v4)
    {
      sub_24E84A0B8();
LABEL_8:
      uint64_t v6 = *v2;
      sub_24E864A58();
      sub_24E864A68();
      uint64_t result = sub_24E864A98();
      unint64_t v3 = result & ~(-1 << *(unsigned char *)(v6 + 32));
      if ((*(void *)(v6 + ((v3 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v3)) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    uint64_t result = (uint64_t)sub_24E8486A0();
  }
LABEL_9:
  uint64_t v7 = *v2;
  *(void *)(*v2 + 8 * (v3 >> 6) + 56) |= 1 << v3;
  uint64_t v8 = *(void *)(v7 + 16);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (!v9)
  {
    *(void *)(v7 + 16) = v10;
    return result;
  }
  __break(1u);
LABEL_12:
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E846B7C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v53 = a1;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7150);
  MEMORY[0x270FA5388](v52);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24E861138();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int64_t v46 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v42 - v12;
  uint64_t v14 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v47 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - v18;
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v42 - v20;
  unint64_t v22 = *(void *)(*v3 + 16);
  unint64_t v23 = *(void *)(*v3 + 24);
  uint64_t v43 = v3;
  uint64_t v45 = v24;
  if (v23 <= v22 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_24E8448F8();
    }
    else
    {
      if (v23 > v22)
      {
        sub_24E848274(type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, &qword_2698F7158, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        goto LABEL_21;
      }
      sub_24E84A2FC();
    }
    uint64_t v51 = *v3;
    sub_24E864A58();
    sub_24E85E830(v53, (uint64_t)v21, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v25 = v9;
    BOOL v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    if (v26(v21, 1, v8) == 1)
    {
      uint64_t v27 = v25;
      sub_24E864A68();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v13, v21, v8);
      sub_24E864A68();
      sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
      sub_24E863BB8();
      uint64_t v27 = v25;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v8);
    }
    uint64_t v28 = sub_24E864A98();
    uint64_t v29 = -1 << *(unsigned char *)(v51 + 32);
    a2 = v28 & ~v29;
    uint64_t v50 = v51 + 56;
    if ((*(void *)(v51 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v42 = v14;
      uint64_t v49 = ~v29;
      uint64_t v48 = *(void *)(v45 + 72);
      uint64_t v44 = (void (**)(char *, uint64_t, uint64_t))(v27 + 32);
      uint64_t v30 = (void (**)(uint64_t, uint64_t))(v27 + 8);
      uint64_t v31 = (uint64_t)v47;
      while (1)
      {
        sub_24E85E830(*(void *)(v51 + 48) + v48 * a2, (uint64_t)v19, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        uint64_t v32 = (uint64_t)&v7[*(int *)(v52 + 48)];
        sub_24E85E830((uint64_t)v19, (uint64_t)v7, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        sub_24E85E830(v53, v32, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        if (v26(v7, 1, v8) == 1) {
          break;
        }
        sub_24E85E830((uint64_t)v7, v31, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        if (v26((char *)v32, 1, v8) == 1)
        {
          (*v30)(v31, v8);
LABEL_14:
          sub_24E563530((uint64_t)v7, &qword_2698F7150);
          goto LABEL_15;
        }
        uint64_t v33 = v46;
        (*v44)(v46, v32, v8);
        char v34 = sub_24E861108();
        uint64_t v35 = *v30;
        unint64_t v36 = v33;
        uint64_t v31 = (uint64_t)v47;
        (*v30)((uint64_t)v36, v8);
        v35(v31, v8);
        if (v34) {
          goto LABEL_24;
        }
        sub_24E85E7D0((uint64_t)v7, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
LABEL_15:
        sub_24E85E7D0((uint64_t)v19, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        a2 = (a2 + 1) & v49;
        if (((*(void *)(v50 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v26((char *)v32, 1, v8) == 1) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
  }
LABEL_21:
  uint64_t v37 = *v43;
  *(void *)(*v43 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E85E768(v53, *(void *)(v37 + 48) + *(void *)(v45 + 72) * a2, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  uint64_t v39 = *(void *)(v37 + 16);
  BOOL v40 = __OFADD__(v39, 1);
  uint64_t v41 = v39 + 1;
  if (v40)
  {
    __break(1u);
LABEL_24:
    sub_24E85E7D0((uint64_t)v7, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E85E7D0((uint64_t)v19, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t result = sub_24E8649C8();
    __break(1u);
  }
  else
  {
    *(void *)(v37 + 16) = v41;
  }
  return result;
}

uint64_t sub_24E8471D4(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B0);
  MEMORY[0x270FA5388](v68);
  uint64_t v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_24E861248();
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v63);
  uint64_t v59 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v67 = (char *)&v55 - v12;
  uint64_t v13 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (uint64_t *)((char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v64 = (char *)&v55 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v55 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v55 - v23;
  unint64_t v25 = *(void *)(*v4 + 16);
  unint64_t v26 = *(void *)(*v4 + 24);
  uint64_t v56 = v4;
  uint64_t v55 = v14;
  if (v26 <= v25 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_24E844E58();
    }
    else
    {
      if (v26 > v25)
      {
        sub_24E848274((uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription, &qword_2698F70B8, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        goto LABEL_27;
      }
      sub_24E84A810();
    }
    uint64_t v58 = *v4;
    sub_24E864A58();
    sub_24E85E830(a1, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v62 = a1;
    if (EnumCaseMultiPayload == 1)
    {
      sub_24E864A68();
      a1 = v62;
      sub_24E863D08();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v28 = v67;
      uint64_t v29 = v24;
      uint64_t v30 = v63;
      (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v67, v29, v63);
      sub_24E864A68();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v28, v30);
    }
    uint64_t v31 = sub_24E864A98();
    uint64_t v32 = v58;
    uint64_t v33 = -1 << *(unsigned char *)(v58 + 32);
    a2 = v31 & ~v33;
    uint64_t v67 = (char *)(v58 + 56);
    if ((*(void *)(v58 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v66 = ~v33;
      uint64_t v65 = *(void *)(v14 + 72);
      uint64_t v57 = (void (**)(char *, char *, uint64_t))(v61 + 32);
      v61 += 8;
      uint64_t v34 = (uint64_t)v64;
      while (1)
      {
        sub_24E85E830(*(void *)(v32 + 48) + v65 * a2, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        uint64_t v43 = &v9[*(int *)(v68 + 48)];
        sub_24E85E830((uint64_t)v22, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        sub_24E85E830(a1, (uint64_t)v43, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        if (swift_getEnumCaseMultiPayload() != 1) {
          break;
        }
        sub_24E85E830((uint64_t)v9, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        uint64_t v45 = *v17;
        uint64_t v44 = v17[1];
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          swift_bridgeObjectRelease();
          a1 = v62;
LABEL_26:
          sub_24E563530((uint64_t)v9, &qword_2698F70B0);
          goto LABEL_14;
        }
        uint64_t v46 = *(void *)v43;
        uint64_t v47 = *((void *)v43 + 1);
        if (v45 == v46 && v44 == v47) {
          goto LABEL_30;
        }
        char v49 = sub_24E864988();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v49) {
          goto LABEL_31;
        }
        sub_24E85E7D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        a1 = v62;
LABEL_14:
        sub_24E85E7D0((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        a2 = (a2 + 1) & v66;
        if (((*(void *)&v67[(a2 >> 3) & 0xFFFFFFFFFFFFFF8] >> a2) & 1) == 0) {
          goto LABEL_27;
        }
      }
      sub_24E85E830((uint64_t)v9, v34, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        uint64_t v35 = v59;
        uint64_t v36 = v13;
        uint64_t v37 = v17;
        uint64_t v38 = a1;
        uint64_t v39 = v63;
        (*v57)(v59, v43, v63);
        int MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        BOOL v40 = *(void (**)(uint64_t, uint64_t))v61;
        uint64_t v41 = v35;
        uint64_t v34 = (uint64_t)v64;
        (*(void (**)(char *, uint64_t))v61)(v41, v39);
        uint64_t v42 = v39;
        a1 = v38;
        uint64_t v17 = v37;
        uint64_t v13 = v36;
        uint64_t v32 = v58;
        v40(v34, v42);
        sub_24E85E7D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_32;
        }
        goto LABEL_14;
      }
      (*(void (**)(uint64_t, uint64_t))v61)(v34, v63);
      goto LABEL_26;
    }
  }
LABEL_27:
  uint64_t v50 = *v56;
  *(void *)(*v56 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E85E768(a1, *(void *)(v50 + 48) + *(void *)(v55 + 72) * a2, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  uint64_t v52 = *(void *)(v50 + 16);
  BOOL v53 = __OFADD__(v52, 1);
  uint64_t v54 = v52 + 1;
  if (v53)
  {
    __break(1u);
LABEL_30:
    swift_bridgeObjectRelease_n();
LABEL_31:
    sub_24E85E7D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
LABEL_32:
    sub_24E85E7D0((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t result = sub_24E8649C8();
    __break(1u);
  }
  else
  {
    *(void *)(v50 + 16) = v54;
  }
  return result;
}

uint64_t sub_24E847934(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v49 = a1;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70D8);
  MEMORY[0x270FA5388](v48);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v43 = (uint64_t)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v42 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v44 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v40 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v40 - v21;
  unint64_t v23 = *(void *)(*v4 + 16);
  unint64_t v24 = *(void *)(*v4 + 24);
  uint64_t v41 = v4;
  if (v24 <= v23 || (a3 & 1) == 0)
  {
    if (a3)
    {
      uint64_t v25 = (uint64_t)v14;
      sub_24E8454C8();
    }
    else
    {
      if (v24 > v23)
      {
        sub_24E848274(type metadata accessor for PeopleRelationshipsProvider.Subscription, &qword_2698F70E0, type metadata accessor for PeopleRelationshipsProvider.Subscription, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        goto LABEL_21;
      }
      uint64_t v25 = (uint64_t)v14;
      sub_24E84AE10();
    }
    uint64_t v47 = *v4;
    sub_24E864A58();
    sub_24E85E830(v49, (uint64_t)v22, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    unint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    if (v26(v22, 1, v9) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      sub_24E85E768((uint64_t)v22, v25, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E85E7D0(v25, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    }
    uint64_t v27 = sub_24E864A98();
    uint64_t v28 = -1 << *(unsigned char *)(v47 + 32);
    a2 = v27 & ~v28;
    uint64_t v46 = v47 + 56;
    if ((*(void *)(v47 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v40 = v15;
      uint64_t v45 = ~v28;
      uint64_t v29 = *(void *)(v42 + 72);
      uint64_t v30 = (uint64_t)v44;
      while (1)
      {
        sub_24E85E830(*(void *)(v47 + 48) + v29 * a2, (uint64_t)v20, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        uint64_t v31 = (uint64_t)&v8[*(int *)(v48 + 48)];
        sub_24E85E830((uint64_t)v20, (uint64_t)v8, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        sub_24E85E830(v49, v31, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        if (v26(v8, 1, v9) == 1) {
          break;
        }
        sub_24E85E830((uint64_t)v8, v30, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        if (v26((char *)v31, 1, v9) == 1)
        {
          sub_24E85E7D0(v30, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
LABEL_14:
          sub_24E563530((uint64_t)v8, &qword_2698F70D8);
          goto LABEL_15;
        }
        uint64_t v32 = v43;
        sub_24E85E768(v31, v43, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        uint64_t v34 = v32;
        uint64_t v30 = (uint64_t)v44;
        sub_24E85E7D0(v34, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        sub_24E85E7D0(v30, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_24;
        }
        sub_24E85E7D0((uint64_t)v8, type metadata accessor for PeopleRelationshipsProvider.Subscription);
LABEL_15:
        sub_24E85E7D0((uint64_t)v20, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        a2 = (a2 + 1) & v45;
        if (((*(void *)(v46 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v26((char *)v31, 1, v9) == 1) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
  }
LABEL_21:
  uint64_t v35 = *v41;
  *(void *)(*v41 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E85E768(v49, *(void *)(v35 + 48) + *(void *)(v42 + 72) * a2, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t v37 = *(void *)(v35 + 16);
  BOOL v38 = __OFADD__(v37, 1);
  uint64_t v39 = v37 + 1;
  if (v38)
  {
    __break(1u);
LABEL_24:
    sub_24E85E7D0((uint64_t)v8, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E85E7D0((uint64_t)v20, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t result = sub_24E8649C8();
    __break(1u);
  }
  else
  {
    *(void *)(v35 + 16) = v39;
  }
  return result;
}

void *sub_24E847F88()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E861248();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8940);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24E8644A8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  unint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_24E84822C()
{
  return sub_24E848274(_s16SubscriptionDataO9LocationsVMa, &qword_2698F8948, _s16SubscriptionDataO9LocationsVMa, _s16SubscriptionDataO9LocationsVMa);
}

void *sub_24E848274(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v8 = v4;
  uint64_t v9 = a1(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v30 - v11;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v13 = *v4;
  uint64_t v14 = sub_24E8644A8();
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v8 = v15;
    return result;
  }
  uint64_t result = (void *)(v14 + 56);
  unint64_t v17 = (unint64_t)((1 << *(unsigned char *)(v15 + 32)) + 63) >> 6;
  uint64_t v30 = v8;
  uint64_t v31 = (const void *)(v13 + 56);
  if (v15 != v13 || (unint64_t)result >= v13 + 56 + 8 * v17) {
    uint64_t result = memmove(result, v31, 8 * v17);
  }
  int64_t v19 = 0;
  *(void *)(v15 + 16) = *(void *)(v13 + 16);
  uint64_t v20 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & *(void *)(v13 + 56);
  int64_t v23 = (unint64_t)(v20 + 63) >> 6;
  while (1)
  {
    if (v22)
    {
      unint64_t v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v25 = v24 | (v19 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v27 >= v23) {
      goto LABEL_28;
    }
    unint64_t v28 = *((void *)v31 + v27);
    ++v19;
    if (!v28)
    {
      int64_t v19 = v27 + 1;
      if (v27 + 1 >= v23) {
        goto LABEL_28;
      }
      unint64_t v28 = *((void *)v31 + v19);
      if (!v28)
      {
        int64_t v19 = v27 + 2;
        if (v27 + 2 >= v23) {
          goto LABEL_28;
        }
        unint64_t v28 = *((void *)v31 + v19);
        if (!v28) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v22 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v19 << 6);
LABEL_12:
    unint64_t v26 = *(void *)(v10 + 72) * v25;
    sub_24E85E830(*(void *)(v13 + 48) + v26, (uint64_t)v12, a3);
    uint64_t result = (void *)sub_24E85E768((uint64_t)v12, *(void *)(v15 + 48) + v26, a4);
  }
  int64_t v29 = v27 + 3;
  if (v29 >= v23)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v8 = v30;
    goto LABEL_30;
  }
  unint64_t v28 = *((void *)v31 + v29);
  if (v28)
  {
    int64_t v19 = v29;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v19 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v19 >= v23) {
      goto LABEL_28;
    }
    unint64_t v28 = *((void *)v31 + v19);
    ++v29;
    if (v28) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_24E8484EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7130);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E8644A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24E8486A0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7140);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E8644A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_27:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  uint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (!v12)
    {
      int64_t v14 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v14 >= v13) {
        goto LABEL_27;
      }
      uint64_t v12 = *(void *)(v6 + 8 * v14);
      ++v9;
      if (!v12)
      {
        int64_t v9 = v14 + 1;
        if (v14 + 1 >= v13) {
          goto LABEL_27;
        }
        uint64_t v12 = *(void *)(v6 + 8 * v9);
        if (!v12)
        {
          int64_t v9 = v14 + 2;
          if (v14 + 2 >= v13) {
            goto LABEL_27;
          }
          uint64_t v12 = *(void *)(v6 + 8 * v9);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_12:
    v12 &= v12 - 1;
  }
  int64_t v15 = v14 + 3;
  if (v15 >= v13) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)(v6 + 8 * v15);
  if (v12)
  {
    int64_t v9 = v15;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_27;
    }
    uint64_t v12 = *(void *)(v6 + 8 * v9);
    ++v15;
    if (v12) {
      goto LABEL_12;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_24E848800()
{
  return sub_24E848274(type metadata accessor for PeopleLocationsProvider.Subscription, &qword_2698F70C8, type metadata accessor for PeopleLocationsProvider.Subscription, type metadata accessor for PeopleLocationsProvider.Subscription);
}

uint64_t sub_24E848848()
{
  uint64_t v1 = v0;
  uint64_t v44 = _s16SubscriptionDataO9LocationsVMa(0);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (uint64_t)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = _s16SubscriptionDataO10DirectionsVMa(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v42 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s16SubscriptionDataO10FriendshipVMa(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v41 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s16SubscriptionDataOMa(0);
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v49 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v13 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F71B0);
  uint64_t v14 = sub_24E8644B8();
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_41;
  }
  uint64_t v40 = v0;
  uint64_t v16 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v17 = *(void *)(v13 + 56);
  uint64_t v46 = v13 + 56;
  if (v16 < 64) {
    uint64_t v18 = ~(-1 << v16);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v17;
  int64_t v47 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v20 = v14 + 56;
  swift_retain();
  int64_t v21 = 0;
  uint64_t v45 = v13;
  while (1)
  {
    if (v19)
    {
      unint64_t v23 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_42;
    }
    if (v25 >= v47) {
      break;
    }
    unint64_t v26 = *(void *)(v46 + 8 * v25);
    ++v21;
    if (!v26)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v47) {
        break;
      }
      unint64_t v26 = *(void *)(v46 + 8 * v21);
      if (!v26)
      {
        int64_t v21 = v25 + 2;
        if (v25 + 2 >= v47) {
          break;
        }
        unint64_t v26 = *(void *)(v46 + 8 * v21);
        if (!v26)
        {
          int64_t v27 = v25 + 3;
          if (v27 >= v47) {
            break;
          }
          unint64_t v26 = *(void *)(v46 + 8 * v27);
          if (!v26)
          {
            while (1)
            {
              int64_t v21 = v27 + 1;
              if (__OFADD__(v27, 1)) {
                goto LABEL_43;
              }
              if (v21 >= v47) {
                goto LABEL_39;
              }
              unint64_t v26 = *(void *)(v46 + 8 * v21);
              ++v27;
              if (v26) {
                goto LABEL_23;
              }
            }
          }
          int64_t v21 = v27;
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    uint64_t v28 = *(void *)(v48 + 72);
    sub_24E85E830(*(void *)(v13 + 48) + v28 * v24, (uint64_t)v12, _s16SubscriptionDataOMa);
    sub_24E864A58();
    sub_24E85E830((uint64_t)v12, (uint64_t)v10, _s16SubscriptionDataOMa);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v29 = v42;
        sub_24E85E768((uint64_t)v10, v42, _s16SubscriptionDataO10DirectionsVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        uint64_t v13 = v45;
        sub_24E863BB8();
        uint64_t v30 = _s16SubscriptionDataO10DirectionsVMa;
        goto LABEL_28;
      case 2u:
        uint64_t v29 = v43;
        sub_24E85E768((uint64_t)v10, v43, _s16SubscriptionDataO9LocationsVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        uint64_t v13 = v45;
        sub_24E863BB8();
        sub_24E864A78();
        uint64_t v30 = _s16SubscriptionDataO9LocationsVMa;
        goto LABEL_28;
      case 3u:
      case 4u:
        sub_24E864A68();
        goto LABEL_30;
      default:
        uint64_t v29 = v41;
        sub_24E85E768((uint64_t)v10, v41, _s16SubscriptionDataO10FriendshipVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        uint64_t v13 = v45;
        sub_24E863BB8();
        uint64_t v30 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_28:
        sub_24E85E7D0(v29, v30);
LABEL_30:
        uint64_t v31 = sub_24E864A98();
        uint64_t v32 = -1 << *(unsigned char *)(v15 + 32);
        unint64_t v33 = v31 & ~v32;
        unint64_t v34 = v33 >> 6;
        if (((-1 << v33) & ~*(void *)(v20 + 8 * (v33 >> 6))) != 0)
        {
          unint64_t v22 = __clz(__rbit64((-1 << v33) & ~*(void *)(v20 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
          goto LABEL_7;
        }
        char v35 = 0;
        unint64_t v36 = (unint64_t)(63 - v32) >> 6;
        break;
    }
    do
    {
      if (++v34 == v36 && (v35 & 1) != 0)
      {
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        JUMPOUT(0x24E848F04);
      }
      BOOL v37 = v34 == v36;
      if (v34 == v36) {
        unint64_t v34 = 0;
      }
      v35 |= v37;
      uint64_t v38 = *(void *)(v20 + 8 * v34);
    }
    while (v38 == -1);
    unint64_t v22 = __clz(__rbit64(~v38)) + (v34 << 6);
LABEL_7:
    *(void *)(v20 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    sub_24E85E768((uint64_t)v12, *(void *)(v15 + 48) + v22 * v28, _s16SubscriptionDataOMa);
    ++*(void *)(v15 + 16);
  }
LABEL_39:
  uint64_t result = swift_release_n();
  uint64_t v1 = v40;
LABEL_41:
  *uint64_t v1 = v15;
  return result;
}

uint64_t sub_24E848F18()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E861248();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8940);
  uint64_t v7 = sub_24E8644B8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  unint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    uint64_t result = sub_24E863BA8();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E8492C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8948);
  uint64_t v6 = sub_24E8644B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  char v29 = v0;
  uint64_t v30 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v30 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v30 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v32 + 72);
    sub_24E85E830(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, _s16SubscriptionDataO9LocationsVMa);
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    sub_24E864A78();
    uint64_t result = sub_24E864A98();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_24E85E768((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, _s16SubscriptionDataO9LocationsVMa);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v30 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E84968C(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v39 = a5;
  uint64_t v41 = a4;
  uint64_t v7 = v5;
  uint64_t v8 = a2(0);
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v12 = sub_24E8644B8();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v7 = v13;
    return result;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 56);
  int64_t v36 = v5;
  uint64_t v37 = v11 + 56;
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  int64_t v38 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v18 = v12 + 56;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_24;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v24 >= v38) {
      goto LABEL_33;
    }
    unint64_t v25 = *(void *)(v37 + 8 * v24);
    ++v20;
    if (!v25)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v38) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v20);
      if (!v25)
      {
        int64_t v20 = v24 + 2;
        if (v24 + 2 >= v38) {
          goto LABEL_33;
        }
        unint64_t v25 = *(void *)(v37 + 8 * v20);
        if (!v25) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_24:
    uint64_t v27 = *(void *)(v40 + 72);
    sub_24E85E830(*(void *)(v11 + 48) + v27 * v23, (uint64_t)v10, v41);
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    uint64_t result = sub_24E864A98();
    uint64_t v28 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v18 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v29) & ~*(void *)(v18 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v18 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v21 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = sub_24E85E768((uint64_t)v10, *(void *)(v13 + 48) + v21 * v27, v39);
    ++*(void *)(v13 + 16);
  }
  int64_t v26 = v24 + 3;
  if (v26 >= v38)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v7 = v36;
    goto LABEL_35;
  }
  unint64_t v25 = *(void *)(v37 + 8 * v26);
  if (v25)
  {
    int64_t v20 = v26;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v20 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v20 >= v38) {
      goto LABEL_33;
    }
    unint64_t v25 = *(void *)(v37 + 8 * v20);
    ++v26;
    if (v25) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E849A20()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v33 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7178);
  uint64_t v6 = sub_24E8644B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  unint64_t v30 = v0;
  uint64_t v31 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v32) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v31 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v31 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v31 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v33 + 72);
    sub_24E85E830(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    sub_24E864A58();
    sub_24E8610C8();
    sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
    sub_24E863BB8();
    sub_24E864A88();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_24E85E768((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v30;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v31 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v32) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v31 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E849DFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7130);
  uint64_t v3 = sub_24E8644B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24E864A58();
    swift_bridgeObjectRetain_n();
    sub_24E863D08();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24E864A98();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E84A0B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7140);
  uint64_t result = sub_24E8644B8();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_33:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  uint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (!v9)
    {
      int64_t v13 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v13 >= v10) {
        goto LABEL_31;
      }
      uint64_t v9 = *(void *)(v6 + 8 * v13);
      ++v5;
      if (!v9)
      {
        int64_t v5 = v13 + 1;
        if (v13 + 1 >= v10) {
          goto LABEL_31;
        }
        uint64_t v9 = *(void *)(v6 + 8 * v5);
        if (!v9)
        {
          int64_t v5 = v13 + 2;
          if (v13 + 2 >= v10) {
            goto LABEL_31;
          }
          uint64_t v9 = *(void *)(v6 + 8 * v5);
          if (!v9) {
            break;
          }
        }
      }
    }
LABEL_22:
    sub_24E864A58();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    uint64_t v15 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v18 = 0;
      unint64_t v19 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v19 && (v18 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        BOOL v20 = v17 == v19;
        if (v17 == v19) {
          unint64_t v17 = 0;
        }
        v18 |= v20;
        uint64_t v21 = *(void *)(v11 + 8 * v17);
      }
      while (v21 == -1);
      unint64_t v12 = __clz(__rbit64(~v21)) + (v17 << 6);
    }
    v9 &= v9 - 1;
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    ++*(void *)(v4 + 16);
  }
  int64_t v14 = v13 + 3;
  if (v14 >= v10)
  {
LABEL_31:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_33;
  }
  uint64_t v9 = *(void *)(v6 + 8 * v14);
  if (v9)
  {
    int64_t v5 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v5 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_31;
    }
    uint64_t v9 = *(void *)(v6 + 8 * v5);
    ++v14;
    if (v9) {
      goto LABEL_22;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_24E84A2FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E861138();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v45 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (char *)&v42 - v10;
  uint64_t v11 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7158);
  uint64_t v12 = sub_24E8644B8();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    *uint64_t v1 = v13;
    return result;
  }
  char v14 = *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 56);
  uint64_t v47 = v11 + 56;
  uint64_t v16 = 1 << v14;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  int64_t v48 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v49 = (unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  uint64_t v44 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v42 = v0;
  uint64_t v43 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v19 = v12 + 56;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  uint64_t v22 = (uint64_t)v46;
  while (1)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      int64_t v50 = v21;
      unint64_t v25 = v24 | (v21 << 6);
      goto LABEL_24;
    }
    int64_t v26 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v48) {
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v47 + 8 * v26);
    int64_t v28 = v21 + 1;
    if (!v27)
    {
      int64_t v28 = v21 + 2;
      if (v21 + 2 >= v48) {
        goto LABEL_36;
      }
      unint64_t v27 = *(void *)(v47 + 8 * v28);
      if (!v27)
      {
        int64_t v28 = v21 + 3;
        if (v21 + 3 >= v48) {
          goto LABEL_36;
        }
        unint64_t v27 = *(void *)(v47 + 8 * v28);
        if (!v27) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v18 = (v27 - 1) & v27;
    int64_t v50 = v28;
    unint64_t v25 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_24:
    uint64_t v30 = *(void *)(v6 + 72);
    sub_24E85E830(*(void *)(v11 + 48) + v30 * v25, v22, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E864A58();
    sub_24E85E830(v22, (uint64_t)v9, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    if ((*v49)(v9, 1, v2) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      uint64_t v31 = v11;
      uint64_t v32 = v6;
      uint64_t v33 = v45;
      (*v44)(v45, v9, v2);
      sub_24E864A68();
      sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
      sub_24E863BB8();
      uint64_t v34 = v33;
      uint64_t v6 = v32;
      uint64_t v11 = v31;
      uint64_t v22 = (uint64_t)v46;
      (*v43)(v34, v2);
    }
    uint64_t result = sub_24E864A98();
    uint64_t v35 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v36 = result & ~v35;
    unint64_t v37 = v36 >> 6;
    if (((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v36) & ~*(void *)(v19 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v40 = v37 == v39;
        if (v37 == v39) {
          unint64_t v37 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v19 + 8 * v37);
      }
      while (v41 == -1);
      unint64_t v23 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(void *)(v19 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = sub_24E85E768(v22, *(void *)(v13 + 48) + v23 * v30, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    ++*(void *)(v13 + 16);
    int64_t v21 = v50;
  }
  uint64_t v29 = v21 + 4;
  if (v21 + 4 >= v48)
  {
LABEL_36:
    uint64_t result = swift_release_n();
    uint64_t v1 = v42;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v47 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v21 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v48) {
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v47 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24E84A810()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B8);
  uint64_t v7 = sub_24E8644B8();
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_24:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v9 = v6 + 56;
  uint64_t v10 = -1;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  unint64_t v11 = v10 & *(void *)(v6 + 56);
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v12) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_22;
      }
      unint64_t v18 = *(void *)(v9 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_22;
        }
        unint64_t v18 = *(void *)(v9 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_6:
    sub_24E85E830(*(void *)(v6 + 48) + *(void *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t result = sub_24E845A58((uint64_t)v5, v7);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_22:
    uint64_t result = swift_release_n();
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v12) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_21;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24E84AA4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70C8);
  uint64_t v6 = sub_24E8644B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v29 = v0;
  uint64_t v30 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v30 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v30 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v32 + 72);
    sub_24E85E830(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, type metadata accessor for PeopleLocationsProvider.Subscription);
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_24E85E768((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, type metadata accessor for PeopleLocationsProvider.Subscription);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v30 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E84AE10()
{
  uint64_t v1 = v0;
  uint64_t v44 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v2 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v39 = (uint64_t)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70E0);
  uint64_t v11 = sub_24E8644B8();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    *uint64_t v1 = v12;
    return result;
  }
  char v38 = v0;
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 56);
  uint64_t v40 = v10 + 56;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v42 = (unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48);
  uint64_t v17 = v11 + 56;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  uint64_t v20 = v10;
  while (1)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      int64_t v45 = v19;
      unint64_t v23 = v22 | (v19 << 6);
      goto LABEL_24;
    }
    int64_t v24 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v24 >= v41) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v40 + 8 * v24);
    int64_t v26 = v19 + 1;
    if (!v25)
    {
      int64_t v26 = v19 + 2;
      if (v19 + 2 >= v41) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v40 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v19 + 3;
        if (v19 + 3 >= v41) {
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v40 + 8 * v26);
        if (!v25) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v16 = (v25 - 1) & v25;
    int64_t v45 = v26;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_24:
    uint64_t v28 = *(void *)(v43 + 72);
    sub_24E85E830(*(void *)(v20 + 48) + v28 * v23, (uint64_t)v9, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E864A58();
    sub_24E85E830((uint64_t)v9, (uint64_t)v7, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    if ((*v42)(v7, 1, v44) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      uint64_t v29 = v39;
      sub_24E85E768((uint64_t)v7, v39, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E85E7D0(v29, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    }
    uint64_t result = sub_24E864A98();
    uint64_t v30 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v21 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = sub_24E85E768((uint64_t)v9, *(void *)(v12 + 48) + v21 * v28, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    ++*(void *)(v12 + 16);
    int64_t v19 = v45;
  }
  uint64_t v27 = v19 + 4;
  if (v19 + 4 >= v41)
  {
LABEL_36:
    uint64_t result = swift_release_n();
    uint64_t v1 = v38;
    goto LABEL_38;
  }
  unint64_t v25 = *(void *)(v40 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v19 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v41) {
      goto LABEL_36;
    }
    unint64_t v25 = *(void *)(v40 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24E84B328(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v53 = a1;
  uint64_t v49 = _s16SubscriptionDataO9LocationsVMa(0);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (uint64_t)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s16SubscriptionDataO10DirectionsVMa(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v47 = (uint64_t)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _s16SubscriptionDataO10FriendshipVMa(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v46 = (uint64_t)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _s16SubscriptionDataOMa(0);
  uint64_t v54 = *(void *)(v12 - 8);
  uint64_t v55 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v46 - v16;
  if (a3)
  {
    if (*(void *)(a4 + 16) != a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698F71B0);
      uint64_t v19 = sub_24E8644C8();
      uint64_t v18 = v19;
      uint64_t v50 = a2;
      if (a2 < 1) {
        unint64_t v20 = 0;
      }
      else {
        unint64_t v20 = *v53;
      }
      uint64_t v21 = 0;
      uint64_t v22 = v19 + 56;
      uint64_t v51 = v15;
      uint64_t v52 = a4;
      while (1)
      {
        if (v20)
        {
          unint64_t v23 = __clz(__rbit64(v20));
          v20 &= v20 - 1;
          unint64_t v24 = v23 | (v21 << 6);
        }
        else
        {
          uint64_t v25 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            goto LABEL_46;
          }
          if (v25 >= v50) {
            goto LABEL_43;
          }
          unint64_t v26 = v53[v25];
          ++v21;
          if (!v26)
          {
            uint64_t v21 = v25 + 1;
            if (v25 + 1 >= v50) {
              goto LABEL_43;
            }
            unint64_t v26 = v53[v21];
            if (!v26)
            {
              uint64_t v21 = v25 + 2;
              if (v25 + 2 >= v50) {
                goto LABEL_43;
              }
              unint64_t v26 = v53[v21];
              if (!v26)
              {
                uint64_t v27 = v25 + 3;
                if (v27 >= v50) {
                  goto LABEL_43;
                }
                unint64_t v26 = v53[v27];
                if (!v26)
                {
                  while (1)
                  {
                    uint64_t v21 = v27 + 1;
                    if (__OFADD__(v27, 1)) {
                      goto LABEL_47;
                    }
                    if (v21 >= v50) {
                      goto LABEL_43;
                    }
                    unint64_t v26 = v53[v21];
                    ++v27;
                    if (v26) {
                      goto LABEL_24;
                    }
                  }
                }
                uint64_t v21 = v27;
              }
            }
          }
LABEL_24:
          unint64_t v20 = (v26 - 1) & v26;
          unint64_t v24 = __clz(__rbit64(v26)) + (v21 << 6);
        }
        uint64_t v28 = *(void *)(v54 + 72);
        sub_24E85E830(*(void *)(a4 + 48) + v28 * v24, (uint64_t)v17, _s16SubscriptionDataOMa);
        sub_24E864A58();
        sub_24E85E830((uint64_t)v17, (uint64_t)v15, _s16SubscriptionDataOMa);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v32 = (uint64_t)v15;
            uint64_t v30 = v47;
            sub_24E85E768(v32, v47, _s16SubscriptionDataO10DirectionsVMa);
            sub_24E864A68();
            sub_24E861248();
            sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
            a4 = v52;
            sub_24E863BB8();
            unint64_t v31 = _s16SubscriptionDataO10DirectionsVMa;
            goto LABEL_29;
          case 2u:
            uint64_t v33 = (uint64_t)v15;
            uint64_t v30 = v48;
            sub_24E85E768(v33, v48, _s16SubscriptionDataO9LocationsVMa);
            sub_24E864A68();
            sub_24E861248();
            sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
            a4 = v52;
            sub_24E863BB8();
            sub_24E864A78();
            unint64_t v31 = _s16SubscriptionDataO9LocationsVMa;
            goto LABEL_29;
          case 3u:
          case 4u:
            sub_24E864A68();
            goto LABEL_31;
          default:
            uint64_t v29 = (uint64_t)v15;
            uint64_t v30 = v46;
            sub_24E85E768(v29, v46, _s16SubscriptionDataO10FriendshipVMa);
            sub_24E864A68();
            sub_24E861248();
            sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
            a4 = v52;
            sub_24E863BB8();
            unint64_t v31 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_29:
            uint64_t v34 = v30;
            uint64_t v15 = v51;
            sub_24E85E7D0(v34, v31);
LABEL_31:
            uint64_t v35 = sub_24E864A98();
            uint64_t v36 = -1 << *(unsigned char *)(v18 + 32);
            unint64_t v37 = v35 & ~v36;
            unint64_t v38 = v37 >> 6;
            if (((-1 << v37) & ~*(void *)(v22 + 8 * (v37 >> 6))) != 0)
            {
              unint64_t v39 = __clz(__rbit64((-1 << v37) & ~*(void *)(v22 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
              goto LABEL_41;
            }
            char v40 = 0;
            unint64_t v41 = (unint64_t)(63 - v36) >> 6;
            break;
        }
        do
        {
          if (++v38 == v41 && (v40 & 1) != 0)
          {
            __break(1u);
LABEL_45:
            __break(1u);
LABEL_46:
            __break(1u);
LABEL_47:
            __break(1u);
            JUMPOUT(0x24E84B9B8);
          }
          BOOL v42 = v38 == v41;
          if (v38 == v41) {
            unint64_t v38 = 0;
          }
          v40 |= v42;
          uint64_t v43 = *(void *)(v22 + 8 * v38);
        }
        while (v43 == -1);
        unint64_t v39 = __clz(__rbit64(~v43)) + (v38 << 6);
LABEL_41:
        *(void *)(v22 + ((v39 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v39;
        sub_24E85E768((uint64_t)v17, *(void *)(v18 + 48) + v39 * v28, _s16SubscriptionDataOMa);
        ++*(void *)(v18 + 16);
        if (__OFSUB__(a3--, 1)) {
          goto LABEL_45;
        }
        if (!a3)
        {
LABEL_43:
          swift_release();
          return v18;
        }
      }
    }
    return a4;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_24E84B9CC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = a1;
  uint64_t v7 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8948);
  uint64_t result = sub_24E8644C8();
  uint64_t v10 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v32;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v31)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v32[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v31) {
          goto LABEL_37;
        }
        unint64_t v18 = v32[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v31) {
            goto LABEL_37;
          }
          unint64_t v18 = v32[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v31) {
              goto LABEL_37;
            }
            unint64_t v18 = v32[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v31) {
                  goto LABEL_37;
                }
                unint64_t v18 = v32[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = *(void *)(v33 + 72);
    sub_24E85E830(*(void *)(a4 + 48) + v20 * v16, (uint64_t)v9, _s16SubscriptionDataO9LocationsVMa);
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    sub_24E864A78();
    uint64_t result = sub_24E864A98();
    uint64_t v21 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v14 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v14 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v14 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v14 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t result = sub_24E85E768((uint64_t)v9, *(void *)(v10 + 48) + v24 * v20, _s16SubscriptionDataO9LocationsVMa);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24E84BD68(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8930);
  uint64_t result = sub_24E8644C8();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_24E864338();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24E84BFC8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v36 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7178);
  uint64_t result = sub_24E8644C8();
  uint64_t v10 = result;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v34;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v33)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v34[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v33) {
          goto LABEL_37;
        }
        unint64_t v18 = v34[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v33) {
            goto LABEL_37;
          }
          unint64_t v18 = v34[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v33) {
              goto LABEL_37;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_37;
                }
                unint64_t v18 = v34[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = a4;
    uint64_t v21 = *(void *)(a4 + 48);
    uint64_t v22 = *(void *)(v35 + 72);
    sub_24E85E830(v21 + v22 * v16, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    sub_24E864A58();
    sub_24E8610C8();
    sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
    sub_24E863BB8();
    sub_24E864A88();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    uint64_t v23 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v14 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v14 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    uint64_t result = sub_24E85E768((uint64_t)v9, *(void *)(v10 + 48) + v26 * v22, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v20;
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24E84C380(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7130);
  uint64_t result = sub_24E8644C8();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_24E864A58();
    swift_bridgeObjectRetain_n();
    sub_24E863D08();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24E864A98();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    unint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *unint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24E84C624(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_34:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7140);
  uint64_t result = sub_24E8644C8();
  uint64_t v9 = result;
  if (a2 < 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (!v10)
    {
      uint64_t v13 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_37;
      }
      if (v13 >= a2) {
        goto LABEL_34;
      }
      uint64_t v10 = a1[v13];
      ++v11;
      if (!v10)
      {
        uint64_t v11 = v13 + 1;
        if (v13 + 1 >= a2) {
          goto LABEL_34;
        }
        uint64_t v10 = a1[v11];
        if (!v10)
        {
          uint64_t v11 = v13 + 2;
          if (v13 + 2 >= a2) {
            goto LABEL_34;
          }
          uint64_t v10 = a1[v11];
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_22:
    sub_24E864A58();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    uint64_t v15 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v19 = 0;
      unint64_t v20 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v20 && (v19 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v21 = v17 == v20;
        if (v17 == v20) {
          unint64_t v17 = 0;
        }
        v19 |= v21;
        uint64_t v22 = *(void *)(v12 + 8 * v17);
      }
      while (v22 == -1);
      unint64_t v18 = __clz(__rbit64(~v22)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    v10 &= v10 - 1;
    if (!v5) {
      goto LABEL_34;
    }
  }
  uint64_t v14 = v13 + 3;
  if (v14 >= a2) {
    goto LABEL_34;
  }
  uint64_t v10 = a1[v14];
  if (v10)
  {
    uint64_t v11 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v11 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_34;
    }
    uint64_t v10 = a1[v11];
    ++v14;
    if (v10) {
      goto LABEL_22;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_24E84C854(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24E861138();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v50 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v51 = (char *)&v46 - v16;
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  uint64_t v53 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7158);
  uint64_t result = sub_24E8644C8();
  uint64_t v17 = result;
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  if (a2 < 1) {
    unint64_t v19 = 0;
  }
  else {
    unint64_t v19 = *a1;
  }
  uint64_t v20 = (uint64_t)v51;
  uint64_t v21 = 0;
  uint64_t v22 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  uint64_t v48 = (void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v49 = (void (**)(char *, char *, uint64_t))(v9 + 32);
  uint64_t v23 = result + 56;
  uint64_t v52 = a4;
  while (1)
  {
    if (v19)
    {
      uint64_t v54 = (v19 - 1) & v19;
      uint64_t v55 = v21;
      unint64_t v24 = __clz(__rbit64(v19)) | (v21 << 6);
    }
    else
    {
      uint64_t v25 = v21 + 1;
      if (__OFADD__(v21, 1)) {
        goto LABEL_43;
      }
      if (v25 >= v47)
      {
LABEL_40:
        swift_release();
        return v17;
      }
      unint64_t v26 = v46[v25];
      uint64_t v27 = v21 + 1;
      if (!v26)
      {
        uint64_t v27 = v21 + 2;
        if (v21 + 2 >= v47) {
          goto LABEL_40;
        }
        unint64_t v26 = v46[v27];
        if (!v26)
        {
          uint64_t v27 = v21 + 3;
          if (v21 + 3 >= v47) {
            goto LABEL_40;
          }
          unint64_t v26 = v46[v27];
          if (!v26)
          {
            uint64_t v28 = v21 + 4;
            if (v21 + 4 >= v47) {
              goto LABEL_40;
            }
            unint64_t v26 = v46[v28];
            if (!v26)
            {
              while (1)
              {
                uint64_t v27 = v28 + 1;
                if (__OFADD__(v28, 1)) {
                  goto LABEL_44;
                }
                if (v27 >= v47) {
                  goto LABEL_40;
                }
                unint64_t v26 = v46[v27];
                ++v28;
                if (v26) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v27 = v21 + 4;
          }
        }
      }
LABEL_24:
      uint64_t v54 = (v26 - 1) & v26;
      uint64_t v55 = v27;
      unint64_t v24 = __clz(__rbit64(v26)) + (v27 << 6);
    }
    uint64_t v29 = *(void *)(a4 + 48);
    uint64_t v30 = *(void *)(v12 + 72);
    sub_24E85E830(v29 + v30 * v24, v20, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E864A58();
    sub_24E85E830(v20, (uint64_t)v15, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v31 = v53;
    if ((*v22)(v15, 1, v53) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      uint64_t v32 = v17;
      uint64_t v33 = v22;
      uint64_t v34 = v12;
      uint64_t v35 = v50;
      (*v49)(v50, v15, v31);
      sub_24E864A68();
      sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
      sub_24E863BB8();
      uint64_t v36 = v35;
      uint64_t v12 = v34;
      uint64_t v22 = v33;
      uint64_t v17 = v32;
      uint64_t v20 = (uint64_t)v51;
      (*v48)(v36, v31);
    }
    uint64_t result = sub_24E864A98();
    uint64_t v37 = -1 << *(unsigned char *)(v17 + 32);
    unint64_t v38 = result & ~v37;
    unint64_t v39 = v38 >> 6;
    if (((-1 << v38) & ~*(void *)(v23 + 8 * (v38 >> 6))) != 0)
    {
      unint64_t v40 = __clz(__rbit64((-1 << v38) & ~*(void *)(v23 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v41 = 0;
      unint64_t v42 = (unint64_t)(63 - v37) >> 6;
      do
      {
        if (++v39 == v42 && (v41 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v43 = v39 == v42;
        if (v39 == v42) {
          unint64_t v39 = 0;
        }
        v41 |= v43;
        uint64_t v44 = *(void *)(v23 + 8 * v39);
      }
      while (v44 == -1);
      unint64_t v40 = __clz(__rbit64(~v44)) + (v39 << 6);
    }
    *(void *)(v23 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
    uint64_t result = sub_24E85E768(v20, *(void *)(v17 + 48) + v40 * v30, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    ++*(void *)(v17 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v52;
    unint64_t v19 = v54;
    uint64_t v21 = v55;
    if (!a3) {
      goto LABEL_40;
    }
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_24E84CD48(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B8);
  uint64_t result = sub_24E8644C8();
  uint64_t v12 = result;
  if (a2 < 1) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = *a1;
  }
  uint64_t v15 = 0;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v15 << 6);
    }
    else
    {
      uint64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_30;
      }
      if (v18 >= a2)
      {
LABEL_27:
        swift_release();
        return v12;
      }
      unint64_t v19 = a1[v18];
      ++v15;
      if (!v19)
      {
        uint64_t v15 = v18 + 1;
        if (v18 + 1 >= a2) {
          goto LABEL_27;
        }
        unint64_t v19 = a1[v15];
        if (!v19)
        {
          uint64_t v15 = v18 + 2;
          if (v18 + 2 >= a2) {
            goto LABEL_27;
          }
          unint64_t v19 = a1[v15];
          if (!v19)
          {
            uint64_t v20 = v18 + 3;
            if (v20 >= a2) {
              goto LABEL_27;
            }
            unint64_t v19 = a1[v20];
            if (!v19)
            {
              while (1)
              {
                uint64_t v15 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_31;
                }
                if (v15 >= a2) {
                  goto LABEL_27;
                }
                unint64_t v19 = a1[v15];
                ++v20;
                if (v19) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v15 = v20;
          }
        }
      }
LABEL_24:
      unint64_t v14 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v15 << 6);
    }
    sub_24E85E830(*(void *)(a4 + 48) + *(void *)(v9 + 72) * v17, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t result = sub_24E845A58((uint64_t)v11, v12);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    if (!a3) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24E84CF6C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = a1;
  uint64_t v7 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v33 = *(void *)(v7 - 8);
  uint64_t v34 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70C8);
  uint64_t result = sub_24E8644C8();
  uint64_t v10 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v32;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v31)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v32[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v31) {
          goto LABEL_37;
        }
        unint64_t v18 = v32[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v31) {
            goto LABEL_37;
          }
          unint64_t v18 = v32[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v31) {
              goto LABEL_37;
            }
            unint64_t v18 = v32[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v31) {
                  goto LABEL_37;
                }
                unint64_t v18 = v32[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = *(void *)(v33 + 72);
    sub_24E85E830(*(void *)(a4 + 48) + v20 * v16, (uint64_t)v9, type metadata accessor for PeopleLocationsProvider.Subscription);
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    uint64_t v21 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v14 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v14 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v14 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v14 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t result = sub_24E85E768((uint64_t)v9, *(void *)(v10 + 48) + v24 * v20, type metadata accessor for PeopleLocationsProvider.Subscription);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    if (!a3) {
      goto LABEL_37;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24E84D308(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v50 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v8 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v47 = (uint64_t)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v48 = (char *)&v43 - v15;
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  uint64_t v46 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70E0);
  uint64_t result = sub_24E8644C8();
  a4 = result;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  if (a2 < 1) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = *a1;
  }
  uint64_t v18 = (uint64_t)v48;
  uint64_t v19 = 0;
  uint64_t v49 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v20 = result + 56;
  uint64_t v21 = v46;
  while (1)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      uint64_t v51 = v19;
      unint64_t v23 = v22 | (v19 << 6);
    }
    else
    {
      uint64_t v24 = v19 + 1;
      if (__OFADD__(v19, 1)) {
        goto LABEL_42;
      }
      if (v24 >= v45)
      {
LABEL_39:
        swift_release();
        return a4;
      }
      unint64_t v25 = v44[v24];
      uint64_t v26 = v19 + 1;
      if (!v25)
      {
        uint64_t v26 = v19 + 2;
        if (v19 + 2 >= v45) {
          goto LABEL_39;
        }
        unint64_t v25 = v44[v26];
        if (!v25)
        {
          uint64_t v26 = v19 + 3;
          if (v19 + 3 >= v45) {
            goto LABEL_39;
          }
          unint64_t v25 = v44[v26];
          if (!v25)
          {
            uint64_t v27 = v19 + 4;
            if (v19 + 4 >= v45) {
              goto LABEL_39;
            }
            unint64_t v25 = v44[v27];
            if (!v25)
            {
              while (1)
              {
                uint64_t v26 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_43;
                }
                if (v26 >= v45) {
                  goto LABEL_39;
                }
                unint64_t v25 = v44[v26];
                ++v27;
                if (v25) {
                  goto LABEL_23;
                }
              }
            }
            uint64_t v26 = v19 + 4;
          }
        }
      }
LABEL_23:
      unint64_t v17 = (v25 - 1) & v25;
      uint64_t v51 = v26;
      unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
    }
    uint64_t v28 = *(void *)(v11 + 72);
    sub_24E85E830(*(void *)(v21 + 48) + v28 * v23, v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E864A58();
    sub_24E85E830(v18, (uint64_t)v14, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    if ((*v49)(v14, 1, v50) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      uint64_t v29 = (uint64_t)v14;
      uint64_t v30 = v14;
      uint64_t v31 = v11;
      uint64_t v32 = v47;
      sub_24E85E768(v29, v47, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      uint64_t v21 = v46;
      sub_24E863BB8();
      uint64_t v33 = v32;
      uint64_t v11 = v31;
      uint64_t v14 = v30;
      uint64_t v18 = (uint64_t)v48;
      sub_24E85E7D0(v33, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    }
    uint64_t result = sub_24E864A98();
    uint64_t v34 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v20 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v37 = __clz(__rbit64((-1 << v35) & ~*(void *)(v20 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v38 = 0;
      unint64_t v39 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v40 = v36 == v39;
        if (v36 == v39) {
          unint64_t v36 = 0;
        }
        v38 |= v40;
        uint64_t v41 = *(void *)(v20 + 8 * v36);
      }
      while (v41 == -1);
      unint64_t v37 = __clz(__rbit64(~v41)) + (v36 << 6);
    }
    *(void *)(v20 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
    uint64_t result = sub_24E85E768(v18, *(void *)(a4 + 48) + v37 * v28, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    ++*(void *)(a4 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    uint64_t v19 = v51;
    if (!a3) {
      goto LABEL_39;
    }
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_24E84D7DC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8950);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v47 = (uint64_t)&v40 - v16;
  if (!*(void *)(*v2 + 16)) {
    return result;
  }
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v40 = a1 + 56;
  uint64_t v18 = 1 << *(unsigned char *)(a1 + 32);
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v17;
  int64_t v41 = (unint64_t)(v18 + 63) >> 6;
  unint64_t v42 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v21 = 0;
  uint64_t v43 = v6;
  uint64_t v44 = v2;
  uint64_t v45 = v8;
  uint64_t v46 = a1;
  while (1)
  {
    if (v20)
    {
      uint64_t v48 = (v20 - 1) & v20;
      int64_t v49 = v21;
      unint64_t v23 = __clz(__rbit64(v20)) | (v21 << 6);
      goto LABEL_26;
    }
    int64_t v24 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v24 >= v41) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v40 + 8 * v24);
    int64_t v26 = v21 + 1;
    if (!v25)
    {
      int64_t v26 = v21 + 2;
      if (v21 + 2 >= v41) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v40 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v21 + 3;
        if (v21 + 3 >= v41) {
          return swift_release();
        }
        unint64_t v25 = *(void *)(v40 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v21 + 4;
          if (v21 + 4 >= v41) {
            return swift_release();
          }
          unint64_t v25 = *(void *)(v40 + 8 * v26);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_25:
    uint64_t v48 = (v25 - 1) & v25;
    int64_t v49 = v26;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_26:
    uint64_t v28 = *(void *)(v8 + 72);
    uint64_t v29 = *(void *)(a1 + 48) + v28 * v23;
    uint64_t v30 = v47;
    sub_24E85E830(v29, v47, _s16SubscriptionDataO9LocationsVMa);
    sub_24E85E768(v30, (uint64_t)v14, _s16SubscriptionDataO9LocationsVMa);
    uint64_t v31 = *v2;
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    uint64_t v32 = *(int *)(v7 + 20);
    sub_24E864A78();
    uint64_t v33 = sub_24E864A98();
    uint64_t v34 = -1 << *(unsigned char *)(v31 + 32);
    unint64_t v35 = v33 & ~v34;
    if ((*(void *)(v31 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35))
    {
      uint64_t v36 = ~v34;
      while (1)
      {
        sub_24E85E830(*(void *)(v31 + 48) + v35 * v28, (uint64_t)v11, _s16SubscriptionDataO9LocationsVMa);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) != 0
          && v11[*(int *)(v7 + 20)] == v14[v32])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v11, _s16SubscriptionDataO9LocationsVMa);
        unint64_t v35 = (v35 + 1) & v36;
        if (((*(void *)(v31 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
          goto LABEL_6;
        }
      }
      sub_24E85E7D0((uint64_t)v11, _s16SubscriptionDataO9LocationsVMa);
      swift_bridgeObjectRelease();
      uint64_t v2 = v44;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v38 = *v2;
      uint64_t v50 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24E848274(_s16SubscriptionDataO9LocationsVMa, &qword_2698F8948, _s16SubscriptionDataO9LocationsVMa, _s16SubscriptionDataO9LocationsVMa);
        uint64_t v38 = v50;
      }
      uint64_t v39 = *(void *)(v38 + 48) + v35 * v28;
      uint64_t v22 = (uint64_t)v43;
      sub_24E85E768(v39, (uint64_t)v43, _s16SubscriptionDataO9LocationsVMa);
      sub_24E85AC48(v35);
      *uint64_t v2 = v50;
      swift_bridgeObjectRelease();
      (*v42)(v22, 0, 1, v7);
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v22 = (uint64_t)v43;
      (*v42)((uint64_t)v43, 1, 1, v7);
      uint64_t v2 = v44;
    }
    unint64_t v20 = v48;
    sub_24E563530(v22, &qword_2698F8950);
    uint64_t result = sub_24E85E7D0((uint64_t)v14, _s16SubscriptionDataO9LocationsVMa);
    uint64_t v8 = v45;
    a1 = v46;
    int64_t v21 = v49;
  }
  uint64_t v27 = v21 + 5;
  if (v21 + 5 >= v41) {
    return swift_release();
  }
  unint64_t v25 = *(void *)(v40 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v21 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v41) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v40 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E84DD84(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8938);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = _s16SubscriptionDataOMa(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v25 - v12;
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v14 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(a1 + 56);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v21 = v20 | (v19 << 6);
      goto LABEL_6;
    }
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v22);
    ++v19;
    if (!v23)
    {
      int64_t v19 = v22 + 1;
      if (v22 + 1 >= v18) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v14 + 8 * v19);
      if (!v23)
      {
        int64_t v19 = v22 + 2;
        if (v22 + 2 >= v18) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v14 + 8 * v19);
        if (!v23)
        {
          int64_t v19 = v22 + 3;
          if (v22 + 3 >= v18) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v14 + 8 * v19);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
LABEL_6:
    sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v7 + 72) * v21, (uint64_t)v13, _s16SubscriptionDataOMa);
    sub_24E85E768((uint64_t)v13, (uint64_t)v10, _s16SubscriptionDataOMa);
    sub_24E85903C((uint64_t)v10, (uint64_t)v5);
    sub_24E563530((uint64_t)v5, &qword_2698F8938);
    uint64_t result = sub_24E85E7D0((uint64_t)v10, _s16SubscriptionDataOMa);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v18) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23)
  {
    int64_t v19 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v19 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v19 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v19);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24E84E03C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v7 = *(void *)(v52 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v52);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v49 = (uint64_t)&v41 - v15;
  if (!*(void *)(*v2 + 16)) {
    return result;
  }
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v42 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  int64_t v43 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v44 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  uint64_t v46 = v6;
  uint64_t v47 = v2;
  uint64_t v48 = a1;
  uint64_t v45 = v7;
  while (1)
  {
    if (v19)
    {
      uint64_t v50 = (v19 - 1) & v19;
      int64_t v51 = v20;
      unint64_t v22 = __clz(__rbit64(v19)) | (v20 << 6);
      goto LABEL_26;
    }
    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v23 >= v43) {
      return swift_release();
    }
    unint64_t v24 = *(void *)(v42 + 8 * v23);
    int64_t v25 = v20 + 1;
    if (!v24)
    {
      int64_t v25 = v20 + 2;
      if (v20 + 2 >= v43) {
        return swift_release();
      }
      unint64_t v24 = *(void *)(v42 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v20 + 3;
        if (v20 + 3 >= v43) {
          return swift_release();
        }
        unint64_t v24 = *(void *)(v42 + 8 * v25);
        if (!v24)
        {
          int64_t v25 = v20 + 4;
          if (v20 + 4 >= v43) {
            return swift_release();
          }
          unint64_t v24 = *(void *)(v42 + 8 * v25);
          if (!v24) {
            break;
          }
        }
      }
    }
LABEL_25:
    uint64_t v50 = (v24 - 1) & v24;
    int64_t v51 = v25;
    unint64_t v22 = __clz(__rbit64(v24)) + (v25 << 6);
LABEL_26:
    uint64_t v27 = *(void *)(v7 + 72);
    uint64_t v28 = *(void *)(a1 + 48) + v27 * v22;
    uint64_t v29 = v49;
    sub_24E85E830(v28, v49, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    sub_24E85E768(v29, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    uint64_t v30 = *v2;
    sub_24E864A58();
    sub_24E8610C8();
    sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    uint64_t v31 = v52;
    uint64_t v32 = *(int *)(v52 + 20);
    sub_24E864A88();
    uint64_t v33 = *(int *)(v31 + 24);
    sub_24E864A68();
    uint64_t v34 = sub_24E864A98();
    uint64_t v35 = -1 << *(unsigned char *)(v30 + 32);
    unint64_t v36 = v34 & ~v35;
    if ((*(void *)(v30 + 56 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36))
    {
      uint64_t v37 = ~v35;
      while (1)
      {
        sub_24E85E830(*(void *)(v30 + 48) + v36 * v27, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        if ((MEMORY[0x25333F0D0](v10, v13) & 1) != 0
          && *(double *)&v10[*(int *)(v52 + 20)] == *(double *)&v13[v32]
          && v10[*(int *)(v52 + 24)] == v13[v33])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        unint64_t v36 = (v36 + 1) & v37;
        if (((*(void *)(v30 + 56 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0) {
          goto LABEL_6;
        }
      }
      sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      swift_bridgeObjectRelease();
      uint64_t v2 = v47;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v39 = *v2;
      uint64_t v53 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24E848274((uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription, &qword_2698F7178, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        uint64_t v39 = v53;
      }
      uint64_t v40 = *(void *)(v39 + 48) + v36 * v27;
      uint64_t v21 = (uint64_t)v46;
      sub_24E85E768(v40, (uint64_t)v46, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      sub_24E85B560(v36);
      *uint64_t v2 = v53;
      swift_bridgeObjectRelease();
      (*v44)(v21, 0, 1, v52);
      a1 = v48;
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v21 = (uint64_t)v46;
      (*v44)((uint64_t)v46, 1, 1, v52);
      uint64_t v2 = v47;
      a1 = v48;
    }
    uint64_t v7 = v45;
    unint64_t v19 = v50;
    int64_t v20 = v51;
    sub_24E563530(v21, &qword_2698F3B40);
    uint64_t result = sub_24E85E7D0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
  }
  uint64_t v26 = v20 + 5;
  if (v20 + 5 >= v43) {
    return swift_release();
  }
  unint64_t v24 = *(void *)(v42 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v20 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v43) {
      return swift_release();
    }
    unint64_t v24 = *(void *)(v42 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_24E84E620(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_24E8592E0(v12, v13, &v17);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

uint64_t sub_24E84E7D8(uint64_t result)
{
  if (!*(void *)(*v1 + 16)) {
    return result;
  }
  uint64_t v2 = result + 56;
  uint64_t v3 = 1 << *(unsigned char *)(result + 32);
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  uint64_t v5 = v4 & *(void *)(result + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (!v5)
    {
      int64_t v8 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_31:
        __break(1u);
        return result;
      }
      if (v8 >= v6) {
        goto LABEL_26;
      }
      uint64_t v5 = *(void *)(v2 + 8 * v8);
      ++v7;
      if (!v5)
      {
        int64_t v7 = v8 + 1;
        if (v8 + 1 >= v6) {
          goto LABEL_26;
        }
        uint64_t v5 = *(void *)(v2 + 8 * v7);
        if (!v5)
        {
          int64_t v7 = v8 + 2;
          if (v8 + 2 >= v6) {
            goto LABEL_26;
          }
          uint64_t v5 = *(void *)(v2 + 8 * v7);
          if (!v5)
          {
            int64_t v7 = v8 + 3;
            if (v8 + 3 >= v6) {
              goto LABEL_26;
            }
            uint64_t v5 = *(void *)(v2 + 8 * v7);
            if (!v5) {
              break;
            }
          }
        }
      }
    }
LABEL_22:
    v5 &= v5 - 1;
    uint64_t v10 = *v1;
    sub_24E864A58();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    unint64_t v11 = result & ~(-1 << *(unsigned char *)(v10 + 32));
    if ((*(void *)(v10 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v11))
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v13 = *v1;
      *uint64_t v1 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24E8486A0();
      }
      sub_24E85BA54(v11);
      *uint64_t v1 = v13;
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v9 = v8 + 4;
  if (v9 < v6)
  {
    uint64_t v5 = *(void *)(v2 + 8 * v9);
    if (!v5)
    {
      while (1)
      {
        int64_t v7 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_31;
        }
        if (v7 >= v6) {
          goto LABEL_26;
        }
        uint64_t v5 = *(void *)(v2 + 8 * v7);
        ++v9;
        if (v5) {
          goto LABEL_22;
        }
      }
    }
    int64_t v7 = v9;
    goto LABEL_22;
  }
LABEL_26:

  return swift_release();
}

uint64_t sub_24E84E9D0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B20);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v25 - v12;
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v14 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(a1 + 56);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v21 = v20 | (v19 << 6);
      goto LABEL_6;
    }
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v22);
    ++v19;
    if (!v23)
    {
      int64_t v19 = v22 + 1;
      if (v22 + 1 >= v18) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v14 + 8 * v19);
      if (!v23)
      {
        int64_t v19 = v22 + 2;
        if (v22 + 2 >= v18) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v14 + 8 * v19);
        if (!v23)
        {
          int64_t v19 = v22 + 3;
          if (v22 + 3 >= v18) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v14 + 8 * v19);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
LABEL_6:
    sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v7 + 72) * v21, (uint64_t)v13, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E85E768((uint64_t)v13, (uint64_t)v10, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E8594AC((uint64_t)v10, (uint64_t)v5);
    sub_24E563530((uint64_t)v5, &qword_2698F3B20);
    uint64_t result = sub_24E85E7D0((uint64_t)v10, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v18) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23)
  {
    int64_t v19 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v19 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v19 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v19);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24E84EC88(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B38);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v25 - v12;
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v14 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(a1 + 56);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v21 = v20 | (v19 << 6);
      goto LABEL_6;
    }
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v22);
    ++v19;
    if (!v23)
    {
      int64_t v19 = v22 + 1;
      if (v22 + 1 >= v18) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v14 + 8 * v19);
      if (!v23)
      {
        int64_t v19 = v22 + 2;
        if (v22 + 2 >= v18) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v14 + 8 * v19);
        if (!v23)
        {
          int64_t v19 = v22 + 3;
          if (v22 + 3 >= v18) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v14 + 8 * v19);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
LABEL_6:
    sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v7 + 72) * v21, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    sub_24E85E768((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    sub_24E859B68((uint64_t)v10, (uint64_t)v5);
    sub_24E563530((uint64_t)v5, &qword_2698F3B38);
    uint64_t result = sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v18) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23)
  {
    int64_t v19 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v19 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v19 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v19);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24E84EF40(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B28);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v47 = (uint64_t)&v40 - v16;
  if (!*(void *)(*v2 + 16)) {
    return result;
  }
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v40 = a1 + 56;
  uint64_t v18 = 1 << *(unsigned char *)(a1 + 32);
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v17;
  int64_t v41 = (unint64_t)(v18 + 63) >> 6;
  uint64_t v42 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v21 = 0;
  int64_t v43 = v6;
  uint64_t v44 = v2;
  uint64_t v45 = v8;
  uint64_t v46 = a1;
  while (1)
  {
    if (v20)
    {
      uint64_t v48 = (v20 - 1) & v20;
      int64_t v49 = v21;
      unint64_t v23 = __clz(__rbit64(v20)) | (v21 << 6);
      goto LABEL_26;
    }
    int64_t v24 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v24 >= v41) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v40 + 8 * v24);
    int64_t v26 = v21 + 1;
    if (!v25)
    {
      int64_t v26 = v21 + 2;
      if (v21 + 2 >= v41) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v40 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v21 + 3;
        if (v21 + 3 >= v41) {
          return swift_release();
        }
        unint64_t v25 = *(void *)(v40 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v21 + 4;
          if (v21 + 4 >= v41) {
            return swift_release();
          }
          unint64_t v25 = *(void *)(v40 + 8 * v26);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_25:
    uint64_t v48 = (v25 - 1) & v25;
    int64_t v49 = v26;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_26:
    uint64_t v28 = *(void *)(v8 + 72);
    uint64_t v29 = *(void *)(a1 + 48) + v28 * v23;
    uint64_t v30 = v47;
    sub_24E85E830(v29, v47, type metadata accessor for PeopleLocationsProvider.Subscription);
    sub_24E85E768(v30, (uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
    uint64_t v31 = *v2;
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    uint64_t v32 = *(int *)(v7 + 20);
    sub_24E864A68();
    uint64_t v33 = sub_24E864A98();
    uint64_t v34 = -1 << *(unsigned char *)(v31 + 32);
    unint64_t v35 = v33 & ~v34;
    if ((*(void *)(v31 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35))
    {
      uint64_t v36 = ~v34;
      while (1)
      {
        sub_24E85E830(*(void *)(v31 + 48) + v35 * v28, (uint64_t)v11, type metadata accessor for PeopleLocationsProvider.Subscription);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) != 0
          && v11[*(int *)(v7 + 20)] == v14[v32])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v11, type metadata accessor for PeopleLocationsProvider.Subscription);
        unint64_t v35 = (v35 + 1) & v36;
        if (((*(void *)(v31 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
          goto LABEL_6;
        }
      }
      sub_24E85E7D0((uint64_t)v11, type metadata accessor for PeopleLocationsProvider.Subscription);
      swift_bridgeObjectRelease();
      uint64_t v2 = v44;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v38 = *v2;
      uint64_t v50 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24E848274(type metadata accessor for PeopleLocationsProvider.Subscription, &qword_2698F70C8, type metadata accessor for PeopleLocationsProvider.Subscription, type metadata accessor for PeopleLocationsProvider.Subscription);
        uint64_t v38 = v50;
      }
      uint64_t v39 = *(void *)(v38 + 48) + v35 * v28;
      uint64_t v22 = (uint64_t)v43;
      sub_24E85E768(v39, (uint64_t)v43, type metadata accessor for PeopleLocationsProvider.Subscription);
      sub_24E85C4C4(v35);
      *uint64_t v2 = v50;
      swift_bridgeObjectRelease();
      (*v42)(v22, 0, 1, v7);
    }
    else
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v22 = (uint64_t)v43;
      (*v42)((uint64_t)v43, 1, 1, v7);
      uint64_t v2 = v44;
    }
    unint64_t v20 = v48;
    sub_24E563530(v22, &qword_2698F3B28);
    uint64_t result = sub_24E85E7D0((uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
    uint64_t v8 = v45;
    a1 = v46;
    int64_t v21 = v49;
  }
  uint64_t v27 = v21 + 5;
  if (v21 + 5 >= v41) {
    return swift_release();
  }
  unint64_t v25 = *(void *)(v40 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v21 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v41) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v40 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E84F4E8(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B30);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v25 - v12;
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v14 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(a1 + 56);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v21 = v20 | (v19 << 6);
      goto LABEL_6;
    }
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v22);
    ++v19;
    if (!v23)
    {
      int64_t v19 = v22 + 1;
      if (v22 + 1 >= v18) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v14 + 8 * v19);
      if (!v23)
      {
        int64_t v19 = v22 + 2;
        if (v22 + 2 >= v18) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v14 + 8 * v19);
        if (!v23)
        {
          int64_t v19 = v22 + 3;
          if (v22 + 3 >= v18) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v14 + 8 * v19);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
LABEL_6:
    sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v7 + 72) * v21, (uint64_t)v13, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E85E768((uint64_t)v13, (uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E85A2B8((uint64_t)v10, (uint64_t)v5);
    sub_24E563530((uint64_t)v5, &qword_2698F3B30);
    uint64_t result = sub_24E85E7D0((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v18) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v14 + 8 * v24);
  if (v23)
  {
    int64_t v19 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v19 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v19 >= v18) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v14 + 8 * v19);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24E84F7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F32A8);
  MEMORY[0x270FA5388](v80);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v6 = MEMORY[0x270FA5388](v70);
  uint64_t v74 = (uint64_t)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v67 - v8;
  uint64_t v10 = _s16SubscriptionDataO10DirectionsVMa(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v73 = (uint64_t)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v67 - v13;
  uint64_t v15 = _s16SubscriptionDataO10FriendshipVMa(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v71 = (uint64_t)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v69 = (uint64_t)&v67 - v18;
  uint64_t v19 = _s16SubscriptionDataOMa(0);
  uint64_t v72 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  int64_t v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v79 = (uint64_t)&v67 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v75 = (char *)&v67 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v67 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v76 = (uint64_t)&v67 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v67 - v32;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v68 = v14;
  uint64_t v83 = a1;
  unint64_t v34 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v34)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    return a2;
  }
  uint64_t v78 = v22;
  uint64_t v67 = v9;
  unint64_t v35 = 0;
  uint64_t v36 = (char *)(a2 + 56);
  uint64_t v81 = a2;
  uint64_t v77 = (char *)(a2 + 56);
  uint64_t v37 = (uint64_t)v75;
LABEL_5:
  if (v35 >= v34) {
    __break(1u);
  }
  uint64_t v38 = a1 + ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80));
  uint64_t v82 = *(void *)(v72 + 72);
  unint64_t v84 = v35 + 1;
  sub_24E85E830(v38 + v82 * v35, (uint64_t)v33, _s16SubscriptionDataOMa);
  sub_24E864A58();
  sub_24E85E830((uint64_t)v33, v76, _s16SubscriptionDataOMa);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v39 = (uint64_t)v68;
      sub_24E85E768(v76, (uint64_t)v68, _s16SubscriptionDataO10DirectionsVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      a2 = v81;
      sub_24E863BB8();
      uint64_t v40 = _s16SubscriptionDataO10DirectionsVMa;
      goto LABEL_11;
    case 2u:
      uint64_t v39 = (uint64_t)v67;
      sub_24E85E768(v76, (uint64_t)v67, _s16SubscriptionDataO9LocationsVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      a2 = v81;
      sub_24E863BB8();
      sub_24E864A78();
      uint64_t v40 = _s16SubscriptionDataO9LocationsVMa;
      goto LABEL_11;
    case 3u:
    case 4u:
      sub_24E864A68();
      goto LABEL_12;
    default:
      uint64_t v39 = v69;
      sub_24E85E768(v76, v69, _s16SubscriptionDataO10FriendshipVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      a2 = v81;
      sub_24E863BB8();
      uint64_t v40 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_11:
      sub_24E85E7D0(v39, v40);
LABEL_12:
      uint64_t v41 = sub_24E864A98();
      uint64_t v42 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v43 = v41 & ~v42;
      if (((*(void *)&v36[(v43 >> 3) & 0xFFFFFFFFFFFFFF8] >> v43) & 1) == 0) {
        goto LABEL_4;
      }
      uint64_t v44 = ~v42;
      break;
  }
  while (2)
  {
    sub_24E85E830(*(void *)(a2 + 48) + v43 * v82, (uint64_t)v29, _s16SubscriptionDataOMa);
    uint64_t v45 = (uint64_t)&v5[*(int *)(v80 + 48)];
    sub_24E85E830((uint64_t)v29, (uint64_t)v5, _s16SubscriptionDataOMa);
    sub_24E85E830((uint64_t)v33, v45, _s16SubscriptionDataOMa);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v46 = v79;
        sub_24E85E830((uint64_t)v5, v79, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v49 = v73;
          sub_24E85E768(v45, v73, _s16SubscriptionDataO10DirectionsVMa);
          char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
          int64_t v51 = v33;
          uint64_t v52 = v46;
          uint64_t v53 = _s16SubscriptionDataO10DirectionsVMa;
          uint64_t v54 = v49;
          uint64_t v36 = v77;
          sub_24E85E7D0(v54, _s16SubscriptionDataO10DirectionsVMa);
          uint64_t v55 = v52;
          uint64_t v33 = v51;
          uint64_t v37 = (uint64_t)v75;
          goto LABEL_32;
        }
        uint64_t v56 = _s16SubscriptionDataO10DirectionsVMa;
        goto LABEL_30;
      case 2u:
        uint64_t v46 = (uint64_t)v78;
        sub_24E85E830((uint64_t)v5, (uint64_t)v78, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload() != 2)
        {
          uint64_t v56 = _s16SubscriptionDataO9LocationsVMa;
LABEL_30:
          sub_24E85E7D0(v46, v56);
LABEL_15:
          sub_24E563530((uint64_t)v5, &qword_2698F32A8);
          goto LABEL_16;
        }
        uint64_t v47 = v45;
        uint64_t v48 = v74;
        sub_24E85E768(v47, v74, _s16SubscriptionDataO9LocationsVMa);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) == 0
          || *(unsigned __int8 *)(v46 + *(int *)(v70 + 20)) != *(unsigned __int8 *)(v48 + *(int *)(v70 + 20)))
        {
          sub_24E85E7D0(v48, _s16SubscriptionDataO9LocationsVMa);
          sub_24E85E7D0(v46, _s16SubscriptionDataO9LocationsVMa);
LABEL_33:
          sub_24E85E7D0((uint64_t)v5, _s16SubscriptionDataOMa);
LABEL_16:
          sub_24E85E7D0((uint64_t)v29, _s16SubscriptionDataOMa);
          unint64_t v43 = (v43 + 1) & v44;
          a2 = v81;
          if ((*(void *)&v36[(v43 >> 3) & 0xFFFFFFFFFFFFFF8] >> v43)) {
            continue;
          }
LABEL_4:
          sub_24E85E7D0((uint64_t)v33, _s16SubscriptionDataOMa);
          a1 = v83;
          unint64_t v35 = v84;
          unint64_t v34 = *(void *)(v83 + 16);
          if (v84 == v34) {
            goto LABEL_35;
          }
          goto LABEL_5;
        }
        sub_24E85E7D0(v48, _s16SubscriptionDataO9LocationsVMa);
        sub_24E85E7D0(v46, _s16SubscriptionDataO9LocationsVMa);
LABEL_37:
        sub_24E85E7D0((uint64_t)v5, _s16SubscriptionDataOMa);
        sub_24E85E7D0((uint64_t)v29, _s16SubscriptionDataOMa);
        uint64_t isStackAllocationSafe = sub_24E85E7D0((uint64_t)v33, _s16SubscriptionDataOMa);
        uint64_t v60 = v81;
        char v61 = *(unsigned char *)(v81 + 32);
        unint64_t v62 = (unint64_t)((1 << v61) + 63) >> 6;
        size_t v63 = 8 * v62;
        if ((v61 & 0x3Fu) <= 0xD
          || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
        {
          MEMORY[0x270FA5388](isStackAllocationSafe);
          memcpy((char *)&v67 - ((v63 + 15) & 0x3FFFFFFFFFFFFFF0), v36, v63);
          uint64_t v64 = sub_24E8548C8((unint64_t *)((char *)&v67 - ((v63 + 15) & 0x3FFFFFFFFFFFFFF0)), v62, v60, v43, &v83);
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v65 = (void *)swift_slowAlloc();
          memcpy(v65, v36, v63);
          uint64_t v64 = sub_24E8548C8((unint64_t *)v65, v62, v60, v43, &v83);
          swift_release();
          swift_bridgeObjectRelease();
          MEMORY[0x2533435F0](v65, -1, -1);
        }
        return v64;
      case 3u:
        if (swift_getEnumCaseMultiPayload() == 3) {
          goto LABEL_37;
        }
        goto LABEL_15;
      case 4u:
        if (swift_getEnumCaseMultiPayload() != 4) {
          goto LABEL_15;
        }
        goto LABEL_37;
      default:
        sub_24E85E830((uint64_t)v5, v37, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload())
        {
          sub_24E85E7D0(v37, _s16SubscriptionDataO10FriendshipVMa);
          goto LABEL_15;
        }
        uint64_t v57 = v71;
        sub_24E85E768(v45, v71, _s16SubscriptionDataO10FriendshipVMa);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        uint64_t v53 = _s16SubscriptionDataO10FriendshipVMa;
        uint64_t v58 = v57;
        uint64_t v36 = v77;
        sub_24E85E7D0(v58, _s16SubscriptionDataO10FriendshipVMa);
        uint64_t v55 = v37;
LABEL_32:
        sub_24E85E7D0(v55, v53);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_37;
        }
        goto LABEL_33;
    }
  }
}

uint64_t sub_24E8503CC(uint64_t a1, uint64_t a2)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F32A8);
  MEMORY[0x270FA5388](v101);
  uint64_t v5 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v6 = MEMORY[0x270FA5388](v88);
  uint64_t v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v86 = (uint64_t)&v83 - v9;
  uint64_t v10 = _s16SubscriptionDataO10DirectionsVMa(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v93 = (uint64_t)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v85 = (uint64_t)&v83 - v13;
  uint64_t v14 = _s16SubscriptionDataO10FriendshipVMa(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v91 = (uint64_t)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v84 = (uint64_t)&v83 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8938);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v99 = (uint64_t)&v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = _s16SubscriptionDataOMa(0);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v83 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v83 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v95 = (uint64_t)&v83 - v30;
  MEMORY[0x270FA5388](v29);
  unint64_t v35 = (char *)&v83 - v34;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v97 = v33;
  uint64_t v98 = v32;
  uint64_t v92 = v8;
  uint64_t v36 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v37 = ~v36;
  uint64_t v39 = a1 + 56;
  uint64_t v38 = *(void *)(a1 + 56);
  uint64_t v40 = -v36;
  if (v40 < 64) {
    uint64_t v41 = ~(-1 << v40);
  }
  else {
    uint64_t v41 = -1;
  }
  unint64_t v42 = v41 & v38;
  uint64_t v104 = a1;
  uint64_t v105 = a1 + 56;
  uint64_t v106 = v37;
  int64_t v107 = 0;
  unint64_t v108 = v41 & v38;
  uint64_t v90 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v94 = v31;
  int64_t v89 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  int64_t v102 = (char *)(a2 + 56);
  uint64_t v103 = a2;
  swift_bridgeObjectRetain();
  uint64_t v43 = v37;
  uint64_t v44 = 0;
  uint64_t v96 = v25;
  uint64_t v45 = a1;
LABEL_7:
  unint64_t v87 = v42;
  uint64_t v100 = v44;
  if (v42)
  {
    uint64_t v46 = (v42 - 1) & v42;
    unint64_t v47 = __clz(__rbit64(v42)) | (v44 << 6);
    int64_t v48 = v44;
LABEL_9:
    sub_24E85E830(*(void *)(v45 + 48) + *(void *)(v94 + 72) * v47, v99, _s16SubscriptionDataOMa);
    uint64_t v49 = 0;
    goto LABEL_29;
  }
  int64_t v48 = v44 + 1;
  if (__OFADD__(v44, 1)) {
    __break(1u);
  }
  int64_t v50 = (unint64_t)(v43 + 64) >> 6;
  if (v48 >= v50)
  {
LABEL_28:
    uint64_t v46 = 0;
    uint64_t v49 = 1;
    int64_t v48 = v44;
    goto LABEL_29;
  }
  unint64_t v51 = *(void *)(v39 + 8 * v48);
  if (v51) {
    goto LABEL_13;
  }
  v44 += 2;
  if (v48 + 1 >= v50) {
    goto LABEL_58;
  }
  unint64_t v51 = *(void *)(v39 + 8 * v44);
  if (v51) {
    goto LABEL_16;
  }
  if (v48 + 2 >= v50) {
    goto LABEL_28;
  }
  unint64_t v51 = *(void *)(v39 + 8 * (v48 + 2));
  if (v51)
  {
    v48 += 2;
    goto LABEL_13;
  }
  uint64_t v44 = v48 + 3;
  if (v48 + 3 < v50)
  {
    unint64_t v51 = *(void *)(v39 + 8 * v44);
    if (v51)
    {
LABEL_16:
      int64_t v48 = v44;
LABEL_13:
      uint64_t v46 = (v51 - 1) & v51;
      unint64_t v47 = __clz(__rbit64(v51)) + (v48 << 6);
      goto LABEL_9;
    }
    v48 += 4;
    if (v48 >= v50) {
      goto LABEL_28;
    }
    unint64_t v51 = *(void *)(v39 + 8 * v48);
    if (v51) {
      goto LABEL_13;
    }
    int64_t v48 = v50 - 1;
    uint64_t v52 = v100 + 6;
    while (v50 != v52)
    {
      unint64_t v51 = *(void *)(v39 + 8 * v52++);
      if (v51)
      {
        int64_t v48 = v52 - 1;
        goto LABEL_13;
      }
    }
LABEL_58:
    uint64_t v46 = 0;
    uint64_t v49 = 1;
    goto LABEL_29;
  }
  uint64_t v46 = 0;
  uint64_t v49 = 1;
  v48 += 2;
LABEL_29:
  uint64_t v53 = v99;
  (*v90)(v99, v49, 1, v20);
  uint64_t v104 = v45;
  uint64_t v105 = v39;
  uint64_t v106 = v43;
  int64_t v107 = v48;
  unint64_t v108 = v46;
  if ((*v89)(v53, 1, v20) == 1)
  {
    sub_24E63F3CC();
    sub_24E563530(v99, &qword_2698F8938);
    return v103;
  }
  sub_24E85E768(v99, (uint64_t)v35, _s16SubscriptionDataOMa);
  uint64_t v54 = v103;
  sub_24E864A58();
  sub_24E85E830((uint64_t)v35, v95, _s16SubscriptionDataOMa);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v55 = v85;
      sub_24E85E768(v95, v85, _s16SubscriptionDataO10DirectionsVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      uint64_t v56 = _s16SubscriptionDataO10DirectionsVMa;
      goto LABEL_35;
    case 2u:
      uint64_t v55 = v86;
      sub_24E85E768(v95, v86, _s16SubscriptionDataO9LocationsVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E864A78();
      uint64_t v56 = _s16SubscriptionDataO9LocationsVMa;
      goto LABEL_35;
    case 3u:
    case 4u:
      sub_24E864A68();
      goto LABEL_36;
    default:
      uint64_t v55 = v84;
      sub_24E85E768(v95, v84, _s16SubscriptionDataO10FriendshipVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      uint64_t v56 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_35:
      sub_24E85E7D0(v55, v56);
LABEL_36:
      uint64_t v57 = (uint64_t)v96;
      uint64_t v58 = sub_24E864A98();
      uint64_t v59 = -1 << *(unsigned char *)(v54 + 32);
      unint64_t v60 = v58 & ~v59;
      if (((*(void *)&v102[(v60 >> 3) & 0xFFFFFFFFFFFFFF8] >> v60) & 1) == 0) {
        goto LABEL_6;
      }
      uint64_t v100 = ~v59;
      uint64_t v61 = *(void *)(v94 + 72);
      break;
  }
  while (2)
  {
    sub_24E85E830(*(void *)(v103 + 48) + v61 * v60, (uint64_t)v28, _s16SubscriptionDataOMa);
    uint64_t v62 = (uint64_t)&v5[*(int *)(v101 + 48)];
    sub_24E85E830((uint64_t)v28, (uint64_t)v5, _s16SubscriptionDataOMa);
    sub_24E85E830((uint64_t)v35, v62, _s16SubscriptionDataOMa);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v63 = v97;
        sub_24E85E830((uint64_t)v5, v97, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v66 = v93;
          sub_24E85E768(v62, v93, _s16SubscriptionDataO10DirectionsVMa);
          char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
          uint64_t v68 = v20;
          uint64_t v69 = v35;
          uint64_t v70 = v63;
          uint64_t v71 = _s16SubscriptionDataO10DirectionsVMa;
          sub_24E85E7D0(v66, _s16SubscriptionDataO10DirectionsVMa);
          uint64_t v72 = v70;
          unint64_t v35 = v69;
          uint64_t v20 = v68;
          uint64_t v57 = (uint64_t)v96;
          goto LABEL_56;
        }
        uint64_t v73 = _s16SubscriptionDataO10DirectionsVMa;
        goto LABEL_54;
      case 2u:
        uint64_t v63 = v98;
        sub_24E85E830((uint64_t)v5, v98, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload() != 2)
        {
          uint64_t v73 = _s16SubscriptionDataO9LocationsVMa;
LABEL_54:
          sub_24E85E7D0(v63, v73);
LABEL_39:
          sub_24E563530((uint64_t)v5, &qword_2698F32A8);
          goto LABEL_40;
        }
        uint64_t v64 = v62;
        uint64_t v65 = (uint64_t)v92;
        sub_24E85E768(v64, (uint64_t)v92, _s16SubscriptionDataO9LocationsVMa);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) == 0
          || *(unsigned __int8 *)(v63 + *(int *)(v88 + 20)) != *(unsigned __int8 *)(v65 + *(int *)(v88 + 20)))
        {
          sub_24E85E7D0(v65, _s16SubscriptionDataO9LocationsVMa);
          sub_24E85E7D0(v63, _s16SubscriptionDataO9LocationsVMa);
LABEL_57:
          sub_24E85E7D0((uint64_t)v5, _s16SubscriptionDataOMa);
LABEL_40:
          sub_24E85E7D0((uint64_t)v28, _s16SubscriptionDataOMa);
          unint64_t v60 = (v60 + 1) & v100;
          if ((*(void *)&v102[(v60 >> 3) & 0xFFFFFFFFFFFFFF8] >> v60)) {
            continue;
          }
LABEL_6:
          sub_24E85E7D0((uint64_t)v35, _s16SubscriptionDataOMa);
          uint64_t v44 = v107;
          unint64_t v42 = v108;
          uint64_t v45 = v104;
          uint64_t v39 = v105;
          uint64_t v43 = v106;
          goto LABEL_7;
        }
        sub_24E85E7D0(v65, _s16SubscriptionDataO9LocationsVMa);
        sub_24E85E7D0(v63, _s16SubscriptionDataO9LocationsVMa);
LABEL_63:
        sub_24E85E7D0((uint64_t)v5, _s16SubscriptionDataOMa);
        sub_24E85E7D0((uint64_t)v28, _s16SubscriptionDataOMa);
        uint64_t isStackAllocationSafe = sub_24E85E7D0((uint64_t)v35, _s16SubscriptionDataOMa);
        uint64_t v77 = v103;
        char v78 = *(unsigned char *)(v103 + 32);
        unint64_t v79 = (unint64_t)((1 << v78) + 63) >> 6;
        size_t v80 = 8 * v79;
        if ((v78 & 0x3Fu) <= 0xD
          || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
        {
          MEMORY[0x270FA5388](isStackAllocationSafe);
          memcpy((char *)&v83 - ((v80 + 15) & 0x3FFFFFFFFFFFFFF0), v102, v80);
          uint64_t v81 = sub_24E855488((unint64_t *)((char *)&v83 - ((v80 + 15) & 0x3FFFFFFFFFFFFFF0)), v79, v77, v60, &v104);
          swift_release();
          sub_24E63F3CC();
        }
        else
        {
          uint64_t v82 = (void *)swift_slowAlloc();
          memcpy(v82, v102, v80);
          uint64_t v81 = sub_24E855488((unint64_t *)v82, v79, v77, v60, &v104);
          swift_release();
          sub_24E63F3CC();
          MEMORY[0x2533435F0](v82, -1, -1);
        }
        return v81;
      case 3u:
        if (swift_getEnumCaseMultiPayload() == 3) {
          goto LABEL_63;
        }
        goto LABEL_39;
      case 4u:
        if (swift_getEnumCaseMultiPayload() != 4) {
          goto LABEL_39;
        }
        goto LABEL_63;
      default:
        sub_24E85E830((uint64_t)v5, v57, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload())
        {
          sub_24E85E7D0(v57, _s16SubscriptionDataO10FriendshipVMa);
          goto LABEL_39;
        }
        uint64_t v74 = v91;
        sub_24E85E768(v62, v91, _s16SubscriptionDataO10FriendshipVMa);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        uint64_t v71 = _s16SubscriptionDataO10FriendshipVMa;
        sub_24E85E7D0(v74, _s16SubscriptionDataO10FriendshipVMa);
        uint64_t v72 = v57;
LABEL_56:
        sub_24E85E7D0(v72, v71);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_63;
        }
        goto LABEL_57;
    }
  }
}

uint64_t sub_24E851284(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v46 - v12;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  int64_t v50 = v6;
  uint64_t v51 = v11;
  uint64_t v14 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v15 = ~v14;
  uint64_t v17 = a1 + 56;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v18 = -v14;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v16;
  uint64_t v53 = a1;
  uint64_t v54 = a1 + 56;
  uint64_t v55 = v15;
  int64_t v56 = 0;
  unint64_t v57 = v19 & v16;
  int64_t v48 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  uint64_t v49 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v21 = a2 + 56;
  swift_bridgeObjectRetain();
  int64_t v22 = 0;
  while (1)
  {
    unint64_t v46 = v20;
    int64_t v47 = v22;
    if (v20)
    {
      uint64_t v23 = v15;
      uint64_t v52 = (v20 - 1) & v20;
      unint64_t v24 = __clz(__rbit64(v20)) | (v22 << 6);
      int64_t v25 = v22;
LABEL_9:
      uint64_t v26 = (uint64_t)v50;
      sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v51 + 72) * v24, (uint64_t)v50, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      uint64_t v27 = 0;
      goto LABEL_30;
    }
    int64_t v25 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      __break(1u);
    }
    int64_t v28 = (unint64_t)(v15 + 64) >> 6;
    if (v25 < v28)
    {
      unint64_t v29 = *(void *)(v17 + 8 * v25);
      if (v29) {
        goto LABEL_13;
      }
      v22 += 2;
      if (v25 + 1 >= v28) {
        goto LABEL_38;
      }
      unint64_t v29 = *(void *)(v17 + 8 * v22);
      if (v29) {
        goto LABEL_16;
      }
      if (v25 + 2 < v28)
      {
        unint64_t v29 = *(void *)(v17 + 8 * (v25 + 2));
        if (v29)
        {
          v25 += 2;
          goto LABEL_13;
        }
        int64_t v22 = v25 + 3;
        if (v25 + 3 >= v28)
        {
          uint64_t v23 = v15;
          uint64_t v52 = 0;
          uint64_t v27 = 1;
          v25 += 2;
          goto LABEL_29;
        }
        unint64_t v29 = *(void *)(v17 + 8 * v22);
        if (v29)
        {
LABEL_16:
          int64_t v25 = v22;
LABEL_13:
          uint64_t v23 = v15;
          uint64_t v52 = (v29 - 1) & v29;
          unint64_t v24 = __clz(__rbit64(v29)) + (v25 << 6);
          goto LABEL_9;
        }
        v25 += 4;
        if (v25 < v28)
        {
          unint64_t v29 = *(void *)(v17 + 8 * v25);
          if (v29) {
            goto LABEL_13;
          }
          int64_t v25 = v28 - 1;
          uint64_t v30 = v47 + 6;
          while (v28 != v30)
          {
            unint64_t v29 = *(void *)(v17 + 8 * v30++);
            if (v29)
            {
              int64_t v25 = v30 - 1;
              goto LABEL_13;
            }
          }
LABEL_38:
          uint64_t v23 = v15;
          uint64_t v52 = 0;
          uint64_t v27 = 1;
          goto LABEL_29;
        }
      }
    }
    uint64_t v23 = v15;
    uint64_t v52 = 0;
    uint64_t v27 = 1;
    int64_t v25 = v22;
LABEL_29:
    uint64_t v26 = (uint64_t)v50;
LABEL_30:
    (*v49)(v26, v27, 1, v7);
    uint64_t v53 = a1;
    uint64_t v54 = v17;
    uint64_t v55 = v23;
    int64_t v56 = v25;
    unint64_t v57 = v52;
    if ((*v48)(v26, 1, v7) == 1)
    {
      sub_24E63F3CC();
      sub_24E563530(v26, &qword_2698F3B40);
      return a2;
    }
    sub_24E85E768(v26, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    sub_24E864A58();
    sub_24E8610C8();
    sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
    sub_24E863BB8();
    uint64_t v31 = *(int *)(v7 + 20);
    sub_24E864A88();
    uint64_t v32 = *(int *)(v7 + 24);
    sub_24E864A68();
    uint64_t v33 = sub_24E864A98();
    uint64_t v34 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v35 = v33 & ~v34;
    if ((*(void *)(v21 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35)) {
      break;
    }
LABEL_6:
    sub_24E85E7D0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    int64_t v22 = v56;
    unint64_t v20 = v57;
    a1 = v53;
    uint64_t v17 = v54;
    uint64_t v15 = v55;
  }
  uint64_t v36 = ~v34;
  uint64_t v37 = *(void *)(v51 + 72);
  while (1)
  {
    sub_24E85E830(*(void *)(a2 + 48) + v37 * v35, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    if ((MEMORY[0x25333F0D0](v10, v13) & 1) != 0
      && *(double *)&v10[*(int *)(v7 + 20)] == *(double *)&v13[v31]
      && v10[*(int *)(v7 + 24)] == v13[v32])
    {
      break;
    }
    sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    unint64_t v35 = (v35 + 1) & v36;
    if (((*(void *)(v21 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
      goto LABEL_6;
    }
  }
  sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
  uint64_t isStackAllocationSafe = sub_24E85E7D0((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
  char v39 = *(unsigned char *)(a2 + 32);
  unint64_t v40 = (unint64_t)((1 << v39) + 63) >> 6;
  size_t v41 = 8 * v40;
  if ((v39 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v46 - ((v41 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(a2 + 56), v41);
    uint64_t v42 = sub_24E8561E8((unint64_t *)((char *)&v46 - ((v41 + 15) & 0x3FFFFFFFFFFFFFF0)), v40, a2, v35, &v53);
    swift_release();
    sub_24E63F3CC();
    return v42;
  }
  else
  {
    uint64_t v43 = (void *)swift_slowAlloc();
    memcpy(v43, (const void *)(a2 + 56), v41);
    uint64_t v44 = sub_24E8561E8((unint64_t *)v43, v40, a2, v35, &v53);
    swift_release();
    sub_24E63F3CC();
    MEMORY[0x2533435F0](v43, -1, -1);
    return v44;
  }
}

uint64_t sub_24E851978(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_24E63F3CC();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_24E864A58();
      swift_bridgeObjectRetain_n();
      sub_24E863D08();
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_24E864A98();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    uint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_24E864988() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_24E864988() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_24E856764((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_24E63F3CC();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_24E856764((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_24E63F3CC();
      MEMORY[0x2533435F0](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_24E851DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v26[5] = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v5 = a1 + 56;
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v7 = ~v6;
    if (-v6 < 64) {
      uint64_t v8 = ~(-1 << -(char)v6);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v9 = v8 & *(void *)(a1 + 56);
    int64_t v10 = (unint64_t)(63 - v6) >> 6;
    do
    {
      int64_t v14 = v4;
      if (!v9)
      {
        int64_t v15 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_33;
        }
        if (v15 >= v10) {
          goto LABEL_28;
        }
        uint64_t v9 = *(void *)(v5 + 8 * v15);
        ++v4;
        if (!v9)
        {
          int64_t v4 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_28;
          }
          uint64_t v9 = *(void *)(v5 + 8 * v4);
          if (!v9)
          {
            int64_t v4 = v14 + 3;
            if (v14 + 3 >= v10) {
              goto LABEL_28;
            }
            uint64_t v9 = *(void *)(v5 + 8 * v4);
            if (!v9)
            {
              int64_t v4 = v14 + 4;
              if (v14 + 4 >= v10) {
                goto LABEL_28;
              }
              uint64_t v9 = *(void *)(v5 + 8 * v4);
              if (!v9)
              {
                int64_t v16 = v14 + 5;
                if (v14 + 5 >= v10)
                {
LABEL_28:
                  swift_bridgeObjectRetain();
                  sub_24E63F3CC();
                  return v2;
                }
                uint64_t v9 = *(void *)(v5 + 8 * v16);
                if (!v9)
                {
                  while (1)
                  {
                    int64_t v4 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      break;
                    }
                    if (v4 >= v10) {
                      goto LABEL_28;
                    }
                    uint64_t v9 = *(void *)(v5 + 8 * v4);
                    ++v16;
                    if (v9) {
                      goto LABEL_6;
                    }
                  }
LABEL_33:
                  __break(1u);
                }
                int64_t v4 = v14 + 5;
              }
            }
          }
        }
      }
LABEL_6:
      v9 &= v9 - 1;
      sub_24E864A58();
      sub_24E864A68();
      uint64_t v11 = sub_24E864A98();
      uint64_t v12 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v13 = v11 & ~v12;
    }
    while (((*(void *)(v2 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0);
    v26[0] = a1;
    v26[1] = v5;
    void v26[2] = v7;
    v26[3] = v4;
    v26[4] = v9;
    unint64_t v17 = (unint64_t)(63 - v12) >> 6;
    size_t v18 = 8 * v17;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v17 < 0x81 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      unint64_t v21 = (char *)v26 - v20 + 64;
      memcpy((char *)v26 - v20 + 64, (const void *)(v2 + 56), v18);
      uint64_t v22 = sub_24E856A44((uint64_t)v21, v17, v2, v13, v26);
      swift_release();
      sub_24E63F3CC();
    }
    else
    {
      uint64_t v23 = (void *)swift_slowAlloc();
      memcpy(v23, (const void *)(v2 + 56), v18);
      uint64_t v22 = sub_24E856A44((uint64_t)v23, v17, v2, v13, v26);
      swift_release();
      sub_24E63F3CC();
      MEMORY[0x2533435F0](v23, -1, -1);
    }
    return v22;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_24E852140(uint64_t a1, uint64_t a2)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7150);
  MEMORY[0x270FA5388](v85);
  uint64_t v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E861138();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v79 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v71 = (char *)&v71 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B20);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v14 = MEMORY[0x270FA5388](v77);
  uint64_t v82 = (uint64_t)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  size_t v18 = (char *)&v71 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v19);
  uint64_t v89 = (uint64_t)&v71 - v22;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v74 = v20;
  uint64_t v23 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v24 = ~v23;
  uint64_t v25 = a2;
  uint64_t v27 = a1 + 56;
  uint64_t v26 = *(void *)(a1 + 56);
  uint64_t v28 = -v23;
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  else {
    uint64_t v29 = -1;
  }
  unint64_t v30 = v29 & v26;
  uint64_t v90 = a1;
  uint64_t v91 = a1 + 56;
  uint64_t v76 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  uint64_t v92 = v24;
  int64_t v93 = 0;
  unint64_t v94 = v29 & v26;
  unint64_t v87 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  size_t v80 = (void (**)(char *, uint64_t, uint64_t))(v7 + 32);
  uint64_t v83 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v88 = v25;
  uint64_t v86 = (char *)(v25 + 56);
  uint64_t v31 = v21;
  swift_bridgeObjectRetain();
  unint64_t v32 = v30;
  uint64_t v33 = v31;
  uint64_t v34 = 0;
  uint64_t v72 = v13;
  uint64_t v81 = v18;
  uint64_t v35 = a1;
  for (i = v31; ; uint64_t v33 = i)
  {
    uint64_t v84 = v34;
    unint64_t v73 = v32;
    if (v32)
    {
      uint64_t v36 = (v32 - 1) & v32;
      unint64_t v37 = __clz(__rbit64(v32)) | (v34 << 6);
      int64_t v38 = v34;
LABEL_9:
      sub_24E85E830(*(void *)(v35 + 48) + *(void *)(v33 + 72) * v37, (uint64_t)v13, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      uint64_t v39 = 0;
      goto LABEL_29;
    }
    int64_t v38 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      __break(1u);
    }
    int64_t v40 = (unint64_t)(v24 + 64) >> 6;
    if (v38 >= v40)
    {
LABEL_28:
      uint64_t v36 = 0;
      uint64_t v39 = 1;
      int64_t v38 = v34;
      goto LABEL_29;
    }
    unint64_t v41 = *(void *)(v27 + 8 * v38);
    if (v41) {
      goto LABEL_13;
    }
    v34 += 2;
    if (v38 + 1 >= v40) {
      goto LABEL_43;
    }
    unint64_t v41 = *(void *)(v27 + 8 * v34);
    if (v41) {
      goto LABEL_16;
    }
    if (v38 + 2 >= v40) {
      goto LABEL_28;
    }
    unint64_t v41 = *(void *)(v27 + 8 * (v38 + 2));
    if (v41)
    {
      v38 += 2;
      goto LABEL_13;
    }
    uint64_t v34 = v38 + 3;
    if (v38 + 3 < v40)
    {
      unint64_t v41 = *(void *)(v27 + 8 * v34);
      if (v41)
      {
LABEL_16:
        int64_t v38 = v34;
LABEL_13:
        uint64_t v36 = (v41 - 1) & v41;
        unint64_t v37 = __clz(__rbit64(v41)) + (v38 << 6);
        goto LABEL_9;
      }
      v38 += 4;
      if (v38 >= v40) {
        goto LABEL_28;
      }
      unint64_t v41 = *(void *)(v27 + 8 * v38);
      if (v41) {
        goto LABEL_13;
      }
      int64_t v38 = v40 - 1;
      uint64_t v42 = v84 + 6;
      while (v40 != v42)
      {
        unint64_t v41 = *(void *)(v27 + 8 * v42++);
        if (v41)
        {
          int64_t v38 = v42 - 1;
          goto LABEL_13;
        }
      }
LABEL_43:
      uint64_t v36 = 0;
      uint64_t v39 = 1;
      goto LABEL_29;
    }
    uint64_t v36 = 0;
    uint64_t v39 = 1;
    v38 += 2;
LABEL_29:
    uint64_t v43 = v77;
    (*v76)(v13, v39, 1, v77);
    uint64_t v90 = v35;
    uint64_t v91 = v27;
    uint64_t v92 = v24;
    int64_t v93 = v38;
    unint64_t v94 = v36;
    if ((*v75)(v13, 1, v43) == 1)
    {
      sub_24E63F3CC();
      sub_24E563530((uint64_t)v13, &qword_2698F3B20);
      return v88;
    }
    uint64_t v44 = (uint64_t)v13;
    uint64_t v45 = v89;
    sub_24E85E768(v44, v89, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v46 = v88;
    sub_24E864A58();
    uint64_t v47 = v74;
    sub_24E85E830(v45, v74, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    int64_t v48 = *v87;
    if ((*v87)(v47, 1, v6) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      uint64_t v49 = v71;
      (*v80)(v71, v47, v6);
      sub_24E864A68();
      sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
      sub_24E863BB8();
      (*v83)(v49, v6);
    }
    uint64_t v50 = (uint64_t)v81;
    uint64_t v51 = sub_24E864A98();
    uint64_t v52 = -1 << *(unsigned char *)(v46 + 32);
    unint64_t v53 = v51 & ~v52;
    if ((*(void *)&v86[(v53 >> 3) & 0xFFFFFFFFFFFFFF8] >> v53)) {
      break;
    }
LABEL_6:
    sub_24E85E7D0(v89, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v34 = v93;
    unint64_t v32 = v94;
    uint64_t v35 = v90;
    uint64_t v27 = v91;
    uint64_t v24 = v92;
    unint64_t v13 = v72;
  }
  uint64_t v84 = ~v52;
  uint64_t v54 = *(void *)(i + 72);
  while (1)
  {
    sub_24E85E830(*(void *)(v88 + 48) + v54 * v53, v50, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v55 = (uint64_t)&v5[*(int *)(v85 + 48)];
    sub_24E85E830(v50, (uint64_t)v5, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E85E830(v89, v55, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    if (v48((uint64_t)v5, 1, v6) == 1)
    {
      if (v48(v55, 1, v6) == 1) {
        goto LABEL_45;
      }
      goto LABEL_36;
    }
    uint64_t v56 = v82;
    sub_24E85E830((uint64_t)v5, v82, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    if (v48(v55, 1, v6) != 1) {
      break;
    }
    (*v83)((char *)v56, v6);
LABEL_36:
    sub_24E563530((uint64_t)v5, &qword_2698F7150);
LABEL_37:
    sub_24E85E7D0(v50, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    unint64_t v53 = (v53 + 1) & v84;
    if (((*(void *)&v86[(v53 >> 3) & 0xFFFFFFFFFFFFFF8] >> v53) & 1) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t v57 = v6;
  uint64_t v58 = v79;
  (*v80)(v79, v55, v57);
  char v59 = sub_24E861108();
  unint64_t v60 = *v83;
  uint64_t v61 = v58;
  uint64_t v6 = v57;
  uint64_t v50 = (uint64_t)v81;
  (*v83)(v61, v6);
  v60((char *)v56, v6);
  if ((v59 & 1) == 0)
  {
    sub_24E85E7D0((uint64_t)v5, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    goto LABEL_37;
  }
LABEL_45:
  sub_24E85E7D0((uint64_t)v5, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  sub_24E85E7D0(v50, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  uint64_t isStackAllocationSafe = sub_24E85E7D0(v89, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  uint64_t v63 = v88;
  char v64 = *(unsigned char *)(v88 + 32);
  unint64_t v65 = (unint64_t)((1 << v64) + 63) >> 6;
  size_t v66 = 8 * v65;
  if ((v64 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v71 - ((v66 + 15) & 0x3FFFFFFFFFFFFFF0), v86, v66);
    uint64_t v67 = sub_24E856C34((unint64_t *)((char *)&v71 - ((v66 + 15) & 0x3FFFFFFFFFFFFFF0)), v65, v63, v53, &v90);
    swift_release();
    sub_24E63F3CC();
    return v67;
  }
  else
  {
    uint64_t v69 = (void *)swift_slowAlloc();
    memcpy(v69, v86, v66);
    uint64_t v70 = sub_24E856C34((unint64_t *)v69, v65, v63, v53, &v90);
    swift_release();
    sub_24E63F3CC();
    MEMORY[0x2533435F0](v69, -1, -1);
    return v70;
  }
}

uint64_t sub_24E852C08(uint64_t a1, uint64_t a2)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_24E861248();
  uint64_t v7 = *(void *)(v95 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v95);
  uint64_t v90 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v81 = (char *)&v80 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B38);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  int64_t v93 = (uint64_t *)((char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v92 = (uint64_t)&v80 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v80 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  MEMORY[0x270FA5388](v22);
  uint64_t v99 = (uint64_t)&v80 - v25;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v85 = v23;
  uint64_t v26 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v27 = v7;
  uint64_t v28 = ~v26;
  uint64_t v30 = a1 + 56;
  uint64_t v29 = *(void *)(a1 + 56);
  uint64_t v31 = -v26;
  if (v31 < 64) {
    uint64_t v32 = ~(-1 << v31);
  }
  else {
    uint64_t v32 = -1;
  }
  unint64_t v33 = v32 & v29;
  uint64_t v101 = a1;
  uint64_t v102 = a1 + 56;
  unint64_t v87 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56);
  uint64_t v103 = v28;
  int64_t v104 = 0;
  unint64_t v105 = v32 & v29;
  uint64_t v86 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
  uint64_t v91 = (void (**)(char *, uint64_t, uint64_t))(v27 + 32);
  unint64_t v94 = (void (**)(uint64_t, uint64_t))(v27 + 8);
  uint64_t v97 = a1;
  uint64_t v98 = (char *)(a2 + 56);
  uint64_t v34 = v24;
  swift_bridgeObjectRetain();
  uint64_t v35 = v34;
  int64_t v36 = 0;
  uint64_t v100 = a2;
  uint64_t v82 = v13;
  uint64_t v96 = v14;
  uint64_t v88 = v34;
  uint64_t v37 = (uint64_t)v13;
  uint64_t v89 = v4;
  while (1)
  {
    unint64_t v83 = v33;
    int64_t v84 = v36;
    if (v33)
    {
      unint64_t v38 = __clz(__rbit64(v33));
      uint64_t v39 = (v33 - 1) & v33;
      unint64_t v40 = v38 | (v36 << 6);
      int64_t v41 = v36;
LABEL_9:
      uint64_t v42 = v97;
      sub_24E85E830(*(void *)(v97 + 48) + *(void *)(v35 + 72) * v40, v37, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      uint64_t v43 = 0;
      goto LABEL_30;
    }
    int64_t v41 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      __break(1u);
    }
    int64_t v44 = (unint64_t)(v28 + 64) >> 6;
    if (v41 < v44)
    {
      unint64_t v45 = *(void *)(v30 + 8 * v41);
      if (v45) {
        goto LABEL_13;
      }
      v36 += 2;
      if (v41 + 1 >= v44) {
        goto LABEL_51;
      }
      unint64_t v45 = *(void *)(v30 + 8 * v36);
      if (v45) {
        goto LABEL_16;
      }
      if (v41 + 2 < v44)
      {
        unint64_t v45 = *(void *)(v30 + 8 * (v41 + 2));
        if (v45)
        {
          v41 += 2;
          goto LABEL_13;
        }
        int64_t v36 = v41 + 3;
        if (v41 + 3 >= v44)
        {
          uint64_t v39 = 0;
          uint64_t v43 = 1;
          v41 += 2;
          goto LABEL_29;
        }
        unint64_t v45 = *(void *)(v30 + 8 * v36);
        if (v45)
        {
LABEL_16:
          int64_t v41 = v36;
LABEL_13:
          uint64_t v39 = (v45 - 1) & v45;
          unint64_t v40 = __clz(__rbit64(v45)) + (v41 << 6);
          goto LABEL_9;
        }
        v41 += 4;
        if (v41 < v44)
        {
          unint64_t v45 = *(void *)(v30 + 8 * v41);
          if (v45) {
            goto LABEL_13;
          }
          int64_t v41 = v44 - 1;
          uint64_t v46 = v84 + 6;
          while (v44 != v46)
          {
            unint64_t v45 = *(void *)(v30 + 8 * v46++);
            if (v45)
            {
              int64_t v41 = v46 - 1;
              goto LABEL_13;
            }
          }
LABEL_51:
          uint64_t v39 = 0;
          uint64_t v43 = 1;
          goto LABEL_29;
        }
      }
    }
    uint64_t v39 = 0;
    uint64_t v43 = 1;
    int64_t v41 = v36;
LABEL_29:
    uint64_t v42 = v97;
LABEL_30:
    (*v87)(v37, v43, 1, v14);
    uint64_t v101 = v42;
    uint64_t v102 = v30;
    uint64_t v103 = v28;
    int64_t v104 = v41;
    unint64_t v105 = v39;
    if ((*v86)(v37, 1, v14) == 1)
    {
      sub_24E63F3CC();
      sub_24E563530(v37, &qword_2698F3B38);
      return v100;
    }
    uint64_t v47 = v99;
    sub_24E85E768(v37, v99, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    sub_24E864A58();
    uint64_t v48 = v85;
    sub_24E85E830(v47, v85, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_24E864A68();
      sub_24E863D08();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v49 = v81;
      uint64_t v50 = v95;
      (*v91)(v81, v48, v95);
      sub_24E864A68();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      (*v94)((uint64_t)v49, v50);
    }
    uint64_t v51 = sub_24E864A98();
    uint64_t v52 = -1 << *(unsigned char *)(v100 + 32);
    unint64_t v53 = v51 & ~v52;
    if ((*(void *)&v98[(v53 >> 3) & 0xFFFFFFFFFFFFFF8] >> v53)) {
      break;
    }
LABEL_6:
    sub_24E85E7D0(v99, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    int64_t v36 = v104;
    unint64_t v33 = v105;
    uint64_t v30 = v102;
    uint64_t v97 = v101;
    uint64_t v28 = v103;
    uint64_t v37 = (uint64_t)v82;
    uint64_t v35 = v88;
  }
  uint64_t v54 = ~v52;
  uint64_t v97 = *(void *)(v88 + 72);
  while (1)
  {
    sub_24E85E830(*(void *)(v100 + 48) + v97 * v53, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t v55 = &v6[*(int *)(v4 + 48)];
    sub_24E85E830((uint64_t)v21, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    sub_24E85E830(v99, (uint64_t)v55, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() == 1) {
      break;
    }
    uint64_t v63 = v92;
    sub_24E85E830((uint64_t)v6, v92, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v64 = v90;
      uint64_t v65 = v95;
      (*v91)(v90, (uint64_t)v55, v95);
      char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
      uint64_t v67 = v54;
      uint64_t v68 = v63;
      uint64_t v69 = *v94;
      uint64_t v70 = v64;
      uint64_t v4 = v89;
      (*v94)((uint64_t)v70, v65);
      uint64_t v71 = v68;
      uint64_t v54 = v67;
      v69(v71, v65);
      if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
        goto LABEL_55;
      }
      goto LABEL_49;
    }
    (*v94)(v63, v95);
LABEL_37:
    sub_24E563530((uint64_t)v6, &qword_2698F70B0);
LABEL_38:
    sub_24E85E7D0((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    unint64_t v53 = (v53 + 1) & v54;
    if (((*(void *)&v98[(v53 >> 3) & 0xFFFFFFFFFFFFFF8] >> v53) & 1) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t v56 = v93;
  sub_24E85E830((uint64_t)v6, (uint64_t)v93, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  uint64_t v57 = *v56;
  uint64_t v58 = v56[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = v96;
    goto LABEL_37;
  }
  uint64_t v59 = *(void *)v55;
  uint64_t v60 = *((void *)v55 + 1);
  if (v57 != v59 || v58 != v60)
  {
    char v62 = sub_24E864988();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v62) {
      goto LABEL_55;
    }
LABEL_49:
    sub_24E85E7D0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t v14 = v96;
    goto LABEL_38;
  }
  swift_bridgeObjectRelease_n();
LABEL_55:
  sub_24E85E7D0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  sub_24E85E7D0((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  uint64_t isStackAllocationSafe = sub_24E85E7D0(v99, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  char v73 = *(unsigned char *)(v100 + 32);
  unint64_t v74 = (unint64_t)((1 << v73) + 63) >> 6;
  size_t v75 = 8 * v74;
  if ((v73 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v80 - ((v75 + 15) & 0x3FFFFFFFFFFFFFF0), v98, v75);
    uint64_t v76 = sub_24E85755C((unint64_t *)((char *)&v80 - ((v75 + 15) & 0x3FFFFFFFFFFFFFF0)), v74, v100, v53, &v101);
    swift_release();
    sub_24E63F3CC();
    return v76;
  }
  else
  {
    uint64_t v77 = (void *)swift_slowAlloc();
    memcpy(v77, v98, v75);
    uint64_t v78 = sub_24E85755C((unint64_t *)v77, v74, v100, v53, &v101);
    swift_release();
    sub_24E63F3CC();
    MEMORY[0x2533435F0](v77, -1, -1);
    return v78;
  }
}

uint64_t sub_24E853774(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B28);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)v45 - v12;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v14 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v15 = ~v14;
  uint64_t v17 = a1 + 56;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v18 = -v14;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v16;
  uint64_t v51 = a1;
  uint64_t v52 = a1 + 56;
  uint64_t v53 = v15;
  int64_t v54 = 0;
  unint64_t v55 = v19 & v16;
  uint64_t v48 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v49 = v11;
  uint64_t v47 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v21 = a2 + 56;
  swift_bridgeObjectRetain();
  unint64_t v22 = v20;
  int64_t v23 = 0;
  uint64_t v24 = a1;
  while (1)
  {
    v45[1] = v22;
    int64_t v46 = v23;
    if (v22)
    {
      uint64_t v50 = (v22 - 1) & v22;
      unint64_t v25 = __clz(__rbit64(v22)) | (v23 << 6);
      int64_t v26 = v23;
LABEL_9:
      sub_24E85E830(*(void *)(v24 + 48) + *(void *)(v49 + 72) * v25, (uint64_t)v6, type metadata accessor for PeopleLocationsProvider.Subscription);
      uint64_t v27 = 0;
      goto LABEL_29;
    }
    int64_t v26 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      __break(1u);
    }
    int64_t v28 = (unint64_t)(v15 + 64) >> 6;
    if (v26 >= v28)
    {
LABEL_28:
      uint64_t v50 = 0;
      uint64_t v27 = 1;
      int64_t v26 = v23;
      goto LABEL_29;
    }
    unint64_t v29 = *(void *)(v17 + 8 * v26);
    if (v29) {
      goto LABEL_13;
    }
    v23 += 2;
    if (v26 + 1 >= v28) {
      goto LABEL_36;
    }
    unint64_t v29 = *(void *)(v17 + 8 * v23);
    if (v29) {
      goto LABEL_16;
    }
    if (v26 + 2 >= v28) {
      goto LABEL_28;
    }
    unint64_t v29 = *(void *)(v17 + 8 * (v26 + 2));
    if (v29)
    {
      v26 += 2;
      goto LABEL_13;
    }
    int64_t v23 = v26 + 3;
    if (v26 + 3 < v28)
    {
      unint64_t v29 = *(void *)(v17 + 8 * v23);
      if (v29)
      {
LABEL_16:
        int64_t v26 = v23;
LABEL_13:
        uint64_t v50 = (v29 - 1) & v29;
        unint64_t v25 = __clz(__rbit64(v29)) + (v26 << 6);
        goto LABEL_9;
      }
      v26 += 4;
      if (v26 >= v28) {
        goto LABEL_28;
      }
      unint64_t v29 = *(void *)(v17 + 8 * v26);
      if (v29) {
        goto LABEL_13;
      }
      int64_t v26 = v28 - 1;
      uint64_t v30 = v46 + 6;
      while (v28 != v30)
      {
        unint64_t v29 = *(void *)(v17 + 8 * v30++);
        if (v29)
        {
          int64_t v26 = v30 - 1;
          goto LABEL_13;
        }
      }
LABEL_36:
      uint64_t v50 = 0;
      uint64_t v27 = 1;
      goto LABEL_29;
    }
    uint64_t v50 = 0;
    uint64_t v27 = 1;
    v26 += 2;
LABEL_29:
    (*v48)(v6, v27, 1, v7);
    uint64_t v51 = v24;
    uint64_t v52 = v17;
    uint64_t v53 = v15;
    int64_t v54 = v26;
    unint64_t v55 = v50;
    if ((*v47)(v6, 1, v7) == 1)
    {
      sub_24E63F3CC();
      sub_24E563530((uint64_t)v6, &qword_2698F3B28);
      return a2;
    }
    sub_24E85E768((uint64_t)v6, (uint64_t)v13, type metadata accessor for PeopleLocationsProvider.Subscription);
    sub_24E864A58();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    sub_24E863BB8();
    uint64_t v31 = *(int *)(v7 + 20);
    sub_24E864A68();
    uint64_t v32 = sub_24E864A98();
    uint64_t v33 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v34 = v32 & ~v33;
    if ((*(void *)(v21 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34)) {
      break;
    }
LABEL_6:
    sub_24E85E7D0((uint64_t)v13, type metadata accessor for PeopleLocationsProvider.Subscription);
    int64_t v23 = v54;
    unint64_t v22 = v55;
    uint64_t v24 = v51;
    uint64_t v17 = v52;
    uint64_t v15 = v53;
  }
  uint64_t v35 = ~v33;
  uint64_t v36 = *(void *)(v49 + 72);
  while (1)
  {
    sub_24E85E830(*(void *)(a2 + 48) + v36 * v34, (uint64_t)v10, type metadata accessor for PeopleLocationsProvider.Subscription);
    if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) != 0
      && v10[*(int *)(v7 + 20)] == v13[v31])
    {
      break;
    }
    sub_24E85E7D0((uint64_t)v10, type metadata accessor for PeopleLocationsProvider.Subscription);
    unint64_t v34 = (v34 + 1) & v35;
    if (((*(void *)(v21 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
      goto LABEL_6;
    }
  }
  sub_24E85E7D0((uint64_t)v10, type metadata accessor for PeopleLocationsProvider.Subscription);
  uint64_t isStackAllocationSafe = sub_24E85E7D0((uint64_t)v13, type metadata accessor for PeopleLocationsProvider.Subscription);
  char v38 = *(unsigned char *)(a2 + 32);
  unint64_t v39 = (unint64_t)((1 << v38) + 63) >> 6;
  size_t v40 = 8 * v39;
  if ((v38 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)v45 - ((v40 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(a2 + 56), v40);
    uint64_t v41 = sub_24E857F04((void *)((char *)v45 - ((v40 + 15) & 0x3FFFFFFFFFFFFFF0)), v39, a2, v34, &v51);
    swift_release();
    sub_24E63F3CC();
    return v41;
  }
  else
  {
    uint64_t v42 = (void *)swift_slowAlloc();
    memcpy(v42, (const void *)(a2 + 56), v40);
    uint64_t v43 = sub_24E857F04((unint64_t *)v42, v39, a2, v34, &v51);
    swift_release();
    sub_24E63F3CC();
    MEMORY[0x2533435F0](v42, -1, -1);
    return v43;
  }
}

uint64_t sub_24E853E24(uint64_t a1, uint64_t a2)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70D8);
  MEMORY[0x270FA5388](v82);
  uint64_t v5 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v77 = (uint64_t)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v69 = (uint64_t)&v69 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B30);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v14 = *(void *)(v75 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v75);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v69 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v19);
  uint64_t v80 = (uint64_t)&v69 - v22;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v72 = v21;
  uint64_t v79 = v20;
  uint64_t v84 = v6;
  uint64_t v23 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v24 = ~v23;
  uint64_t v26 = a1 + 56;
  uint64_t v25 = *(void *)(a1 + 56);
  uint64_t v27 = -v23;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  else {
    uint64_t v28 = -1;
  }
  unint64_t v29 = v28 & v25;
  uint64_t v86 = a1;
  uint64_t v87 = a1 + 56;
  uint64_t v81 = v24;
  uint64_t v88 = v24;
  int64_t v89 = 0;
  unint64_t v90 = v28 & v25;
  unint64_t v74 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  char v73 = (unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  unint64_t v83 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v85 = a2;
  uint64_t v78 = (char *)(a2 + 56);
  swift_bridgeObjectRetain();
  int64_t v30 = 0;
  uint64_t v70 = v13;
  for (i = v14; ; uint64_t v14 = i)
  {
    int64_t v71 = v30;
    if (v29)
    {
      uint64_t v31 = v26;
      uint64_t v32 = (v29 - 1) & v29;
      unint64_t v33 = __clz(__rbit64(v29)) | (v30 << 6);
      int64_t v34 = v30;
LABEL_9:
      sub_24E85E830(*(void *)(a1 + 48) + *(void *)(v14 + 72) * v33, (uint64_t)v13, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      uint64_t v35 = 0;
      goto LABEL_29;
    }
    int64_t v34 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      __break(1u);
    }
    int64_t v36 = (unint64_t)(v81 + 64) >> 6;
    if (v34 >= v36)
    {
LABEL_28:
      uint64_t v31 = v26;
      uint64_t v32 = 0;
      uint64_t v35 = 1;
      int64_t v34 = v30;
      goto LABEL_29;
    }
    unint64_t v37 = *(void *)(v26 + 8 * v34);
    if (v37) {
      goto LABEL_13;
    }
    v30 += 2;
    if (v34 + 1 >= v36) {
      goto LABEL_43;
    }
    unint64_t v37 = *(void *)(v26 + 8 * v30);
    if (v37) {
      goto LABEL_16;
    }
    if (v34 + 2 >= v36) {
      goto LABEL_28;
    }
    unint64_t v37 = *(void *)(v26 + 8 * (v34 + 2));
    if (v37)
    {
      v34 += 2;
      goto LABEL_13;
    }
    int64_t v30 = v34 + 3;
    if (v34 + 3 < v36)
    {
      unint64_t v37 = *(void *)(v26 + 8 * v30);
      if (v37)
      {
LABEL_16:
        int64_t v34 = v30;
LABEL_13:
        uint64_t v31 = v26;
        uint64_t v32 = (v37 - 1) & v37;
        unint64_t v33 = __clz(__rbit64(v37)) + (v34 << 6);
        goto LABEL_9;
      }
      v34 += 4;
      if (v34 >= v36) {
        goto LABEL_28;
      }
      unint64_t v37 = *(void *)(v26 + 8 * v34);
      if (v37) {
        goto LABEL_13;
      }
      int64_t v34 = v36 - 1;
      uint64_t v38 = v71 + 6;
      while (v36 != v38)
      {
        unint64_t v37 = *(void *)(v26 + 8 * v38++);
        if (v37)
        {
          int64_t v34 = v38 - 1;
          goto LABEL_13;
        }
      }
LABEL_43:
      uint64_t v31 = v26;
      uint64_t v32 = 0;
      uint64_t v35 = 1;
      goto LABEL_29;
    }
    uint64_t v31 = v26;
    uint64_t v32 = 0;
    uint64_t v35 = 1;
    v34 += 2;
LABEL_29:
    uint64_t v39 = v75;
    (*v74)(v13, v35, 1, v75);
    uint64_t v86 = a1;
    uint64_t v87 = v31;
    uint64_t v88 = v81;
    int64_t v89 = v34;
    unint64_t v90 = v32;
    if ((*v73)(v13, 1, v39) == 1)
    {
      sub_24E63F3CC();
      sub_24E563530((uint64_t)v13, &qword_2698F3B30);
      return v85;
    }
    uint64_t v40 = (uint64_t)v13;
    uint64_t v41 = v80;
    sub_24E85E768(v40, v80, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v42 = v85;
    sub_24E864A58();
    uint64_t v43 = v72;
    sub_24E85E830(v41, v72, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    int64_t v44 = *v83;
    if ((*v83)(v43, 1, v84) == 1)
    {
      sub_24E864A68();
    }
    else
    {
      uint64_t v45 = v43;
      uint64_t v46 = v69;
      sub_24E85E768(v45, v69, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E85E7D0(v46, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    }
    uint64_t v47 = v78;
    uint64_t v48 = sub_24E864A98();
    uint64_t v49 = -1 << *(unsigned char *)(v42 + 32);
    unint64_t v50 = v48 & ~v49;
    if ((*(void *)&v47[(v50 >> 3) & 0xFFFFFFFFFFFFFF8] >> v50)) {
      break;
    }
LABEL_6:
    sub_24E85E7D0(v41, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    int64_t v30 = v89;
    unint64_t v29 = v90;
    a1 = v86;
    uint64_t v26 = v87;
    uint64_t v81 = v88;
    unint64_t v13 = v70;
  }
  uint64_t v81 = ~v49;
  uint64_t v51 = *(void *)(i + 72);
  while (1)
  {
    sub_24E85E830(*(void *)(v85 + 48) + v51 * v50, (uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v52 = (uint64_t)&v5[*(int *)(v82 + 48)];
    sub_24E85E830((uint64_t)v18, (uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E85E830(v41, v52, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v53 = v84;
    if (v44((uint64_t)v5, 1, v84) == 1)
    {
      if (v44(v52, 1, v53) == 1) {
        goto LABEL_45;
      }
      goto LABEL_36;
    }
    int64_t v54 = v18;
    uint64_t v55 = v79;
    sub_24E85E830((uint64_t)v5, v79, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    if (v44(v52, 1, v53) != 1) {
      break;
    }
    sub_24E85E7D0(v55, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    uint64_t v18 = v54;
    uint64_t v41 = v80;
LABEL_36:
    sub_24E563530((uint64_t)v5, &qword_2698F70D8);
LABEL_37:
    sub_24E85E7D0((uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    unint64_t v50 = (v50 + 1) & v81;
    if (((*(void *)&v47[(v50 >> 3) & 0xFFFFFFFFFFFFFF8] >> v50) & 1) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t v56 = v77;
  sub_24E85E768(v52, v77, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
  uint64_t v58 = v56;
  uint64_t v47 = v78;
  sub_24E85E7D0(v58, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  sub_24E85E7D0(v55, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  uint64_t v18 = v54;
  uint64_t v41 = v80;
  if ((MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 & 1) == 0)
  {
    sub_24E85E7D0((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    goto LABEL_37;
  }
LABEL_45:
  sub_24E85E7D0((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  sub_24E85E7D0((uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t isStackAllocationSafe = sub_24E85E7D0(v41, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t v60 = v85;
  char v61 = *(unsigned char *)(v85 + 32);
  unint64_t v62 = (unint64_t)((1 << v61) + 63) >> 6;
  size_t v63 = 8 * v62;
  if ((v61 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v69 - ((v63 + 15) & 0x3FFFFFFFFFFFFFF0), v64, v63);
    uint64_t v65 = sub_24E858458((unint64_t *)((char *)&v69 - ((v63 + 15) & 0x3FFFFFFFFFFFFFF0)), v62, v60, v50, &v86);
    swift_release();
    sub_24E63F3CC();
    return v65;
  }
  else
  {
    uint64_t v67 = (void *)swift_slowAlloc();
    memcpy(v67, v47, v63);
    uint64_t v68 = sub_24E858458((unint64_t *)v67, v62, v60, v50, &v86);
    swift_release();
    sub_24E63F3CC();
    MEMORY[0x2533435F0](v67, -1, -1);
    return v68;
  }
}

uint64_t sub_24E8548C8(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  v73[0] = a2;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F32A8);
  MEMORY[0x270FA5388](v91);
  uint64_t v10 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v11 = MEMORY[0x270FA5388](v79);
  uint64_t v85 = (uint64_t)v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v76 = (uint64_t)v73 - v13;
  uint64_t v14 = _s16SubscriptionDataO10DirectionsVMa(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v84 = (uint64_t)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v75 = (uint64_t)v73 - v17;
  uint64_t v18 = _s16SubscriptionDataO10FriendshipVMa(0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v80 = (uint64_t)v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v74 = (uint64_t)v73 - v21;
  uint64_t v22 = _s16SubscriptionDataOMa(0);
  uint64_t v83 = *(void *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)v73 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v89 = (uint64_t)v73 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)v73 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v86 = (uint64_t)v73 - v33;
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v82 = (uint64_t)v73 - v35;
  MEMORY[0x270FA5388](v34);
  uint64_t v90 = (uint64_t)v73 - v37;
  uint64_t v38 = *(void *)(a3 + 16);
  uint64_t v39 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v40 = *(unint64_t *)((char *)a1 + v39) & ((-1 << a4) - 1);
  uint64_t v77 = a1;
  *(unint64_t *)((char *)a1 + v39) = v40;
  uint64_t v78 = v38 - 1;
  uint64_t v41 = *a5;
  unint64_t v42 = a5[1];
  unint64_t v43 = *(void *)(*a5 + 16);
  if (v42 == v43)
  {
LABEL_2:
    swift_retain();
    return sub_24E84B328(v77, v73[0], v78, a3);
  }
  uint64_t v92 = a3 + 56;
  uint64_t v81 = a5;
  uint64_t v87 = v25;
  uint64_t v88 = v36;
  uint64_t v94 = a3;
LABEL_7:
  if (v42 >= v43)
  {
    __break(1u);
LABEL_41:
    __break(1u);
    JUMPOUT(0x24E855460);
  }
  uint64_t v45 = v82;
  uint64_t v46 = v41 + ((*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80));
  uint64_t v93 = *(void *)(v83 + 72);
  sub_24E85E830(v46 + v93 * v42, v82, _s16SubscriptionDataOMa);
  a5[1] = v42 + 1;
  uint64_t v47 = v90;
  sub_24E85E768(v45, v90, _s16SubscriptionDataOMa);
  sub_24E864A58();
  sub_24E85E830(v47, v86, _s16SubscriptionDataOMa);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v48 = v75;
      sub_24E85E768(v86, v75, _s16SubscriptionDataO10DirectionsVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      uint64_t v49 = _s16SubscriptionDataO10DirectionsVMa;
      goto LABEL_12;
    case 2u:
      uint64_t v48 = v76;
      sub_24E85E768(v86, v76, _s16SubscriptionDataO9LocationsVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      sub_24E864A78();
      uint64_t v49 = _s16SubscriptionDataO9LocationsVMa;
      goto LABEL_12;
    case 3u:
    case 4u:
      sub_24E864A68();
      goto LABEL_14;
    default:
      uint64_t v48 = v74;
      sub_24E85E768(v86, v74, _s16SubscriptionDataO10FriendshipVMa);
      sub_24E864A68();
      sub_24E861248();
      sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
      sub_24E863BB8();
      uint64_t v49 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_12:
      uint64_t v50 = v48;
      uint64_t v47 = v90;
      sub_24E85E7D0(v50, v49);
LABEL_14:
      uint64_t v51 = sub_24E864A98();
      uint64_t v52 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v53 = v51 & ~v52;
      if (((*(void *)(v92 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0) {
        goto LABEL_4;
      }
      uint64_t v54 = ~v52;
      break;
  }
  while (2)
  {
    sub_24E85E830(*(void *)(v94 + 48) + v53 * v93, (uint64_t)v31, _s16SubscriptionDataOMa);
    uint64_t v55 = (uint64_t)&v10[*(int *)(v91 + 48)];
    sub_24E85E830((uint64_t)v31, (uint64_t)v10, _s16SubscriptionDataOMa);
    sub_24E85E830(v47, v55, _s16SubscriptionDataOMa);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v57 = v22;
        uint64_t v58 = v88;
        sub_24E85E830((uint64_t)v10, v88, _s16SubscriptionDataOMa);
        uint64_t v59 = v57;
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          sub_24E85E7D0(v58, _s16SubscriptionDataO10DirectionsVMa);
          uint64_t v22 = v57;
          uint64_t v47 = v90;
          goto LABEL_17;
        }
        uint64_t v60 = v84;
        sub_24E85E768(v55, v84, _s16SubscriptionDataO10DirectionsVMa);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        uint64_t v62 = v60;
        uint64_t v25 = v87;
        sub_24E85E7D0(v62, _s16SubscriptionDataO10DirectionsVMa);
        sub_24E85E7D0(v58, _s16SubscriptionDataO10DirectionsVMa);
        uint64_t v22 = v59;
        uint64_t v47 = v90;
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
          goto LABEL_36;
        }
        goto LABEL_34;
      case 2u:
        sub_24E85E830((uint64_t)v10, (uint64_t)v25, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload() != 2)
        {
          sub_24E85E7D0((uint64_t)v25, _s16SubscriptionDataO9LocationsVMa);
LABEL_17:
          sub_24E563530((uint64_t)v10, &qword_2698F32A8);
LABEL_18:
          sub_24E85E7D0((uint64_t)v31, _s16SubscriptionDataOMa);
          unint64_t v53 = (v53 + 1) & v54;
          if (((*(void *)(v92 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0)
          {
LABEL_4:
            sub_24E85E7D0(v47, _s16SubscriptionDataOMa);
LABEL_5:
            a3 = v94;
            goto LABEL_6;
          }
          continue;
        }
        uint64_t v63 = v55;
        uint64_t v64 = v85;
        sub_24E85E768(v63, v85, _s16SubscriptionDataO9LocationsVMa);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) == 0
          || v25[*(int *)(v79 + 20)] != *(unsigned char *)(v64 + *(int *)(v79 + 20)))
        {
          sub_24E85E7D0(v64, _s16SubscriptionDataO9LocationsVMa);
          sub_24E85E7D0((uint64_t)v25, _s16SubscriptionDataO9LocationsVMa);
LABEL_34:
          sub_24E85E7D0((uint64_t)v10, _s16SubscriptionDataOMa);
          goto LABEL_18;
        }
        sub_24E85E7D0(v64, _s16SubscriptionDataO9LocationsVMa);
        sub_24E85E7D0((uint64_t)v25, _s16SubscriptionDataO9LocationsVMa);
LABEL_36:
        sub_24E85E7D0((uint64_t)v10, _s16SubscriptionDataOMa);
        sub_24E85E7D0((uint64_t)v31, _s16SubscriptionDataOMa);
        sub_24E85E7D0(v47, _s16SubscriptionDataOMa);
        uint64_t v70 = (v53 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v71 = *(unint64_t *)((char *)v77 + v70);
        *(unint64_t *)((char *)v77 + v70) = v71 & ~(1 << v53);
        if ((v71 & (1 << v53)) == 0) {
          goto LABEL_5;
        }
        uint64_t v72 = v78 - 1;
        a3 = v94;
        if (__OFSUB__(v78, 1)) {
          goto LABEL_41;
        }
        --v78;
        if (v72)
        {
LABEL_6:
          a5 = v81;
          uint64_t v41 = *v81;
          unint64_t v42 = v81[1];
          unint64_t v43 = *(void *)(*v81 + 16);
          if (v42 == v43) {
            goto LABEL_2;
          }
          goto LABEL_7;
        }
        return MEMORY[0x263F8EE88];
      case 3u:
        if (swift_getEnumCaseMultiPayload() != 3) {
          goto LABEL_17;
        }
        goto LABEL_36;
      case 4u:
        if (swift_getEnumCaseMultiPayload() == 4) {
          goto LABEL_36;
        }
        goto LABEL_17;
      default:
        uint64_t v56 = v89;
        sub_24E85E830((uint64_t)v10, v89, _s16SubscriptionDataOMa);
        if (swift_getEnumCaseMultiPayload())
        {
          sub_24E85E7D0(v56, _s16SubscriptionDataO10FriendshipVMa);
          goto LABEL_17;
        }
        uint64_t v65 = v80;
        sub_24E85E768(v55, v80, _s16SubscriptionDataO10FriendshipVMa);
        uint64_t v66 = v56;
        char v67 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        uint64_t v68 = v65;
        uint64_t v25 = v87;
        sub_24E85E7D0(v68, _s16SubscriptionDataO10FriendshipVMa);
        uint64_t v69 = v66;
        uint64_t v47 = v90;
        sub_24E85E7D0(v69, _s16SubscriptionDataO10FriendshipVMa);
        if (v67) {
          goto LABEL_36;
        }
        goto LABEL_34;
    }
  }
}

uint64_t sub_24E855488(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v96 = a5;
  v82[0] = a2;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F32A8);
  MEMORY[0x270FA5388](v102);
  uint64_t v9 = (char *)v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v10 = MEMORY[0x270FA5388](v88);
  uint64_t v93 = (uint64_t)v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v86 = (uint64_t)v82 - v12;
  uint64_t v13 = _s16SubscriptionDataO10DirectionsVMa(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v92 = (uint64_t)v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v85 = (uint64_t)v82 - v16;
  uint64_t v17 = _s16SubscriptionDataO10FriendshipVMa(0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v89 = (uint64_t)v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v84 = (uint64_t)v82 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F8938);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = _s16SubscriptionDataOMa(0);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v100 = (uint64_t)v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v99 = (uint64_t)v82 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v98 = (uint64_t)v82 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v82 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v95 = (uint64_t)v82 - v35;
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v104 = (uint64_t)v82 - v37;
  uint64_t v38 = *(void *)(a3 + 16);
  uint64_t v39 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v40 = *(unint64_t *)((char *)a1 + v39) & ((-1 << a4) - 1);
  uint64_t v87 = a1;
  *(unint64_t *)((char *)a1 + v39) = v40;
  uint64_t v41 = v38 - 1;
  uint64_t v91 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
  uint64_t v94 = v42;
  uint64_t v90 = (unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
  uint64_t v105 = a3;
  uint64_t v103 = a3 + 56;
  uint64_t v97 = v23;
  uint64_t v101 = v36;
LABEL_2:
  uint64_t v83 = v41;
  while (1)
  {
    uint64_t v43 = *v96;
    uint64_t v44 = v96[1];
    uint64_t v45 = v96[2];
    int64_t v46 = v96[3];
    unint64_t v47 = v96[4];
    if (v47)
    {
      uint64_t v48 = (v47 - 1) & v47;
      unint64_t v49 = __clz(__rbit64(v47)) | (v46 << 6);
      goto LABEL_6;
    }
    int64_t v55 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
LABEL_69:
      __break(1u);
      JUMPOUT(0x24E8561C0);
    }
    int64_t v56 = (unint64_t)(v45 + 64) >> 6;
    if (v55 >= v56)
    {
      uint64_t v48 = 0;
      uint64_t v50 = 1;
      goto LABEL_7;
    }
    unint64_t v57 = *(void *)(v44 + 8 * v55);
    if (v57) {
      goto LABEL_13;
    }
    int64_t v76 = v46 + 2;
    if (v46 + 2 >= v56) {
      goto LABEL_61;
    }
    unint64_t v57 = *(void *)(v44 + 8 * v76);
    if (v57) {
      goto LABEL_46;
    }
    if (v46 + 3 >= v56) {
      goto LABEL_62;
    }
    unint64_t v57 = *(void *)(v44 + 8 * (v46 + 3));
    if (v57)
    {
      int64_t v55 = v46 + 3;
LABEL_13:
      uint64_t v48 = (v57 - 1) & v57;
      unint64_t v49 = __clz(__rbit64(v57)) + (v55 << 6);
      int64_t v46 = v55;
LABEL_6:
      sub_24E85E830(*(void *)(v43 + 48) + *(void *)(v94 + 72) * v49, (uint64_t)v23, _s16SubscriptionDataOMa);
      uint64_t v50 = 0;
      goto LABEL_7;
    }
    int64_t v76 = v46 + 4;
    if (v46 + 4 < v56)
    {
      unint64_t v57 = *(void *)(v44 + 8 * v76);
      if (v57)
      {
LABEL_46:
        int64_t v55 = v76;
        goto LABEL_13;
      }
      int64_t v55 = v46 + 5;
      if (v46 + 5 < v56)
      {
        unint64_t v57 = *(void *)(v44 + 8 * v55);
        if (v57) {
          goto LABEL_13;
        }
        int64_t v55 = v56 - 1;
        int64_t v79 = v46 + 6;
        while (v56 != v79)
        {
          unint64_t v57 = *(void *)(v44 + 8 * v79++);
          if (v57)
          {
            int64_t v55 = v79 - 1;
            goto LABEL_13;
          }
        }
LABEL_61:
        uint64_t v48 = 0;
        uint64_t v50 = 1;
        int64_t v46 = v55;
        goto LABEL_7;
      }
LABEL_62:
      uint64_t v48 = 0;
      uint64_t v50 = 1;
      int64_t v46 = v76;
      goto LABEL_7;
    }
    uint64_t v48 = 0;
    uint64_t v50 = 1;
    v46 += 3;
LABEL_7:
    (*v91)(v23, v50, 1, v24);
    uint64_t v51 = v96;
    *uint64_t v96 = v43;
    v51[1] = v44;
    v51[2] = v45;
    v51[3] = v46;
    v51[4] = v48;
    if ((*v90)(v23, 1, v24) == 1) {
      break;
    }
    uint64_t v52 = v104;
    sub_24E85E768((uint64_t)v23, v104, _s16SubscriptionDataOMa);
    sub_24E864A58();
    sub_24E85E830(v52, v95, _s16SubscriptionDataOMa);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v53 = v85;
        sub_24E85E768(v95, v85, _s16SubscriptionDataO10DirectionsVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        uint64_t v54 = _s16SubscriptionDataO10DirectionsVMa;
        goto LABEL_16;
      case 2u:
        uint64_t v53 = v86;
        sub_24E85E768(v95, v86, _s16SubscriptionDataO9LocationsVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        sub_24E864A78();
        uint64_t v54 = _s16SubscriptionDataO9LocationsVMa;
        goto LABEL_16;
      case 3u:
      case 4u:
        sub_24E864A68();
        goto LABEL_18;
      default:
        uint64_t v53 = v84;
        sub_24E85E768(v95, v84, _s16SubscriptionDataO10FriendshipVMa);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        uint64_t v54 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_16:
        sub_24E85E7D0(v53, v54);
LABEL_18:
        uint64_t v58 = sub_24E864A98();
        uint64_t v59 = -1 << *(unsigned char *)(v105 + 32);
        unint64_t v60 = v58 & ~v59;
        if (((*(void *)(v103 + ((v60 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v60) & 1) == 0) {
          goto LABEL_3;
        }
        uint64_t v61 = ~v59;
        uint64_t v62 = *(void *)(v94 + 72);
        break;
    }
    while (2)
    {
      sub_24E85E830(*(void *)(v105 + 48) + v62 * v60, (uint64_t)v33, _s16SubscriptionDataOMa);
      uint64_t v63 = (uint64_t)&v9[*(int *)(v102 + 48)];
      sub_24E85E830((uint64_t)v33, (uint64_t)v9, _s16SubscriptionDataOMa);
      sub_24E85E830(v104, v63, _s16SubscriptionDataOMa);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v64 = v99;
          sub_24E85E830((uint64_t)v9, v99, _s16SubscriptionDataOMa);
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            uint64_t v65 = _s16SubscriptionDataO10DirectionsVMa;
            goto LABEL_36;
          }
          uint64_t v66 = v92;
          sub_24E85E768(v63, v92, _s16SubscriptionDataO10DirectionsVMa);
          char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
          uint64_t v68 = v66;
          uint64_t v23 = v97;
          sub_24E85E7D0(v68, _s16SubscriptionDataO10DirectionsVMa);
          sub_24E85E7D0(v64, _s16SubscriptionDataO10DirectionsVMa);
          if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
            goto LABEL_48;
          }
          goto LABEL_42;
        case 2u:
          uint64_t v64 = v100;
          sub_24E85E830((uint64_t)v9, v100, _s16SubscriptionDataOMa);
          if (swift_getEnumCaseMultiPayload() == 2)
          {
            uint64_t v69 = v63;
            uint64_t v70 = v64;
            uint64_t v71 = v93;
            sub_24E85E768(v69, v93, _s16SubscriptionDataO9LocationsVMa);
            if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) == 0
              || *(unsigned __int8 *)(v70 + *(int *)(v88 + 20)) != *(unsigned __int8 *)(v71 + *(int *)(v88 + 20)))
            {
              sub_24E85E7D0(v71, _s16SubscriptionDataO9LocationsVMa);
              sub_24E85E7D0(v70, _s16SubscriptionDataO9LocationsVMa);
              sub_24E85E7D0((uint64_t)v9, _s16SubscriptionDataOMa);
              goto LABEL_39;
            }
            sub_24E85E7D0(v71, _s16SubscriptionDataO9LocationsVMa);
            sub_24E85E7D0(v70, _s16SubscriptionDataO9LocationsVMa);
LABEL_48:
            sub_24E85E7D0((uint64_t)v9, _s16SubscriptionDataOMa);
            sub_24E85E7D0((uint64_t)v33, _s16SubscriptionDataOMa);
            sub_24E85E7D0(v104, _s16SubscriptionDataOMa);
            uint64_t v77 = (v60 >> 3) & 0x1FFFFFFFFFFFFFF8;
            uint64_t v78 = *(unint64_t *)((char *)v87 + v77);
            *(unint64_t *)((char *)v87 + v77) = v78 & ~(1 << v60);
            uint64_t v24 = v101;
            if ((v78 & (1 << v60)) != 0)
            {
              uint64_t v41 = v83 - 1;
              if (__OFSUB__(v83, 1)) {
                goto LABEL_69;
              }
              if (v83 == 1) {
                return MEMORY[0x263F8EE88];
              }
              goto LABEL_2;
            }
          }
          else
          {
            uint64_t v65 = _s16SubscriptionDataO9LocationsVMa;
LABEL_36:
            sub_24E85E7D0(v64, v65);
LABEL_37:
            sub_24E563530((uint64_t)v9, &qword_2698F32A8);
LABEL_38:
            uint64_t v24 = v101;
LABEL_39:
            sub_24E85E7D0((uint64_t)v33, _s16SubscriptionDataOMa);
            unint64_t v60 = (v60 + 1) & v61;
            if ((*(void *)(v103 + ((v60 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v60)) {
              continue;
            }
LABEL_3:
            sub_24E85E7D0(v104, _s16SubscriptionDataOMa);
          }
          break;
        case 3u:
          if (swift_getEnumCaseMultiPayload() == 3) {
            goto LABEL_48;
          }
          goto LABEL_37;
        case 4u:
          if (swift_getEnumCaseMultiPayload() == 4) {
            goto LABEL_48;
          }
          goto LABEL_37;
        default:
          uint64_t v64 = v98;
          sub_24E85E830((uint64_t)v9, v98, _s16SubscriptionDataOMa);
          if (swift_getEnumCaseMultiPayload())
          {
            uint64_t v65 = _s16SubscriptionDataO10FriendshipVMa;
            goto LABEL_36;
          }
          uint64_t v72 = v89;
          sub_24E85E768(v63, v89, _s16SubscriptionDataO10FriendshipVMa);
          uint64_t v73 = v64;
          char v74 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
          uint64_t v75 = v72;
          uint64_t v23 = v97;
          sub_24E85E7D0(v75, _s16SubscriptionDataO10FriendshipVMa);
          sub_24E85E7D0(v73, _s16SubscriptionDataO10FriendshipVMa);
          if (v74) {
            goto LABEL_48;
          }
LABEL_42:
          sub_24E85E7D0((uint64_t)v9, _s16SubscriptionDataOMa);
          goto LABEL_38;
      }
      break;
    }
  }
  sub_24E563530((uint64_t)v23, &qword_2698F8938);
  uint64_t v81 = v105;
  swift_retain();
  return sub_24E84B328(v87, v82[0], v83, v81);
}

uint64_t sub_24E8561E8(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v48 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B40);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v12 = MEMORY[0x270FA5388](v59);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v48 - v16;
  uint64_t v18 = *(void *)(a3 + 16);
  uint64_t v19 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v20 = *(unint64_t *)((char *)a1 + v19) & ((-1 << a4) - 1);
  uint64_t v50 = a1;
  uint64_t v51 = v11;
  *(unint64_t *)((char *)a1 + v19) = v20;
  uint64_t v21 = v18 - 1;
  uint64_t v54 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v55 = v22;
  uint64_t v52 = a5;
  uint64_t v53 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  uint64_t v23 = a3;
  uint64_t v24 = a3 + 56;
  uint64_t v25 = (uint64_t)v11;
  while (2)
  {
    uint64_t v49 = v21;
    do
    {
      while (1)
      {
        uint64_t v27 = *a5;
        uint64_t v26 = a5[1];
        uint64_t v28 = a5[2];
        int64_t v29 = a5[3];
        unint64_t v30 = a5[4];
        uint64_t v57 = v28;
        uint64_t v58 = v26;
        if (v30)
        {
          uint64_t v56 = (v30 - 1) & v30;
          unint64_t v31 = __clz(__rbit64(v30)) | (v29 << 6);
LABEL_6:
          sub_24E85E830(*(void *)(v27 + 48) + *(void *)(v55 + 72) * v31, v25, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
          uint64_t v32 = 0;
          goto LABEL_7;
        }
        int64_t v44 = v29 + 1;
        if (__OFADD__(v29, 1))
        {
          __break(1u);
          goto LABEL_42;
        }
        int64_t v45 = (unint64_t)(v28 + 64) >> 6;
        if (v44 >= v45)
        {
          uint64_t v56 = 0;
          uint64_t v32 = 1;
          goto LABEL_7;
        }
        unint64_t v46 = *(void *)(v26 + 8 * v44);
        if (v46) {
          goto LABEL_19;
        }
        if (v29 + 2 >= v45) {
          goto LABEL_34;
        }
        unint64_t v46 = *(void *)(v26 + 8 * (v29 + 2));
        if (v46)
        {
          int64_t v44 = v29 + 2;
LABEL_19:
          uint64_t v56 = (v46 - 1) & v46;
          unint64_t v31 = __clz(__rbit64(v46)) + (v44 << 6);
          int64_t v29 = v44;
          goto LABEL_6;
        }
        if (v29 + 3 >= v45)
        {
          uint64_t v56 = 0;
          uint64_t v32 = 1;
          v29 += 2;
          goto LABEL_7;
        }
        unint64_t v46 = *(void *)(v26 + 8 * (v29 + 3));
        if (v46)
        {
          int64_t v44 = v29 + 3;
          goto LABEL_19;
        }
        int64_t v44 = v29 + 4;
        if (v29 + 4 < v45)
        {
          unint64_t v46 = *(void *)(v26 + 8 * v44);
          if (v46) {
            goto LABEL_19;
          }
          int64_t v44 = v45 - 1;
          int64_t v47 = v29 + 5;
          while (v45 != v47)
          {
            unint64_t v46 = *(void *)(v26 + 8 * v47++);
            if (v46)
            {
              int64_t v44 = v47 - 1;
              goto LABEL_19;
            }
          }
LABEL_34:
          uint64_t v56 = 0;
          uint64_t v32 = 1;
          int64_t v29 = v44;
          goto LABEL_7;
        }
        uint64_t v56 = 0;
        uint64_t v32 = 1;
        v29 += 3;
LABEL_7:
        uint64_t v33 = v59;
        (*v54)(v25, v32, 1, v59);
        uint64_t v34 = v58;
        *a5 = v27;
        a5[1] = v34;
        a5[2] = v57;
        a5[3] = v29;
        a5[4] = v56;
        if ((*v53)(v25, 1, v33) == 1)
        {
          sub_24E563530(v25, &qword_2698F3B40);
          swift_retain();
          return sub_24E84BFC8(v50, v48, v49, v23);
        }
        sub_24E85E768(v25, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        sub_24E864A58();
        sub_24E8610C8();
        sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
        sub_24E863BB8();
        uint64_t v35 = *(int *)(v33 + 20);
        sub_24E864A88();
        uint64_t v36 = *(int *)(v33 + 24);
        sub_24E864A68();
        uint64_t v37 = sub_24E864A98();
        uint64_t v38 = -1 << *(unsigned char *)(v23 + 32);
        unint64_t v39 = v37 & ~v38;
        if ((*(void *)(v24 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39)) {
          break;
        }
LABEL_3:
        uint64_t result = sub_24E85E7D0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        uint64_t v25 = (uint64_t)v51;
        a5 = v52;
      }
      uint64_t v40 = ~v38;
      uint64_t v41 = *(void *)(v55 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(v23 + 48) + v41 * v39, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        if ((MEMORY[0x25333F0D0](v14, v17) & 1) != 0
          && *(double *)&v14[*(int *)(v59 + 20)] == *(double *)&v17[v35]
          && v14[*(int *)(v59 + 24)] == v17[v36])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        unint64_t v39 = (v39 + 1) & v40;
        if (((*(void *)(v24 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39) & 1) == 0) {
          goto LABEL_3;
        }
      }
      sub_24E85E7D0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      uint64_t result = sub_24E85E7D0((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      uint64_t v42 = (v39 >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v25 = (uint64_t)v51;
      uint64_t v43 = *(unint64_t *)((char *)v50 + v42);
      *(unint64_t *)((char *)v50 + v42) = v43 & ~(1 << v39);
      a5 = v52;
    }
    while ((v43 & (1 << v39)) == 0);
    uint64_t v21 = v49 - 1;
    if (__OFSUB__(v49, 1))
    {
LABEL_42:
      __break(1u);
      return result;
    }
    if (v49 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_24E856764(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_43;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_43;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_43;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_43;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v15 = v14 - 1;
                  int64_t v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return sub_24E84C380(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_24E864A58();
        swift_bridgeObjectRetain();
        sub_24E863D08();
        uint64_t v22 = sub_24E864A98();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_24E864988() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_24E864988() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_29:
      unint64_t v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_24E856A44(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = (uint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    int64_t v11 = a5[3];
    uint64_t v12 = a5[4];
    if (v12) {
      goto LABEL_13;
    }
    int64_t v13 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
    if (v13 >= v14)
    {
      int64_t v13 = a5[3];
LABEL_25:
      a5[3] = v13;
      a5[4] = 0;
      swift_retain();
      return sub_24E84C624(v7, a2, v9, a3);
    }
    uint64_t v15 = a5[1];
    uint64_t v12 = *(void *)(v15 + 8 * v13);
    if (v12) {
      goto LABEL_6;
    }
    if (v11 + 2 >= v14) {
      goto LABEL_25;
    }
    uint64_t v12 = *(void *)(v15 + 8 * (v11 + 2));
    if (v12)
    {
      v11 += 2;
    }
    else
    {
      if (v11 + 3 >= v14)
      {
        int64_t v13 = v11 + 2;
        goto LABEL_25;
      }
      uint64_t v12 = *(void *)(v15 + 8 * (v11 + 3));
      if (!v12)
      {
        int64_t v13 = v11 + 4;
        if (v11 + 4 >= v14)
        {
          int64_t v13 = v11 + 3;
          goto LABEL_25;
        }
        uint64_t v12 = *(void *)(v15 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v14 - 1;
          int64_t v23 = v11 + 5;
          while (v14 != v23)
          {
            uint64_t v12 = *(void *)(v15 + 8 * v23++);
            if (v12)
            {
              int64_t v11 = v23 - 1;
              goto LABEL_13;
            }
          }
          goto LABEL_25;
        }
LABEL_6:
        int64_t v11 = v13;
        goto LABEL_13;
      }
      v11 += 3;
    }
LABEL_13:
    a5[3] = v11;
    a5[4] = (v12 - 1) & v12;
    sub_24E864A58();
    sub_24E864A68();
    uint64_t result = sub_24E864A98();
    unint64_t v16 = result & ~(-1 << *(unsigned char *)(a3 + 32));
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = *(void *)(v10 + 8 * (v16 >> 6));
    uint64_t v19 = 1 << v16;
    if ((v19 & v18) != 0)
    {
      uint64_t v20 = v17;
      uint64_t v21 = v7[v20];
      v7[v20] = v21 & ~v19;
      if ((v21 & v19) != 0)
      {
        if (__OFSUB__(v9--, 1)) {
          goto LABEL_29;
        }
        if (!v9) {
          return MEMORY[0x263F8EE88];
        }
      }
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_24E856C34(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  v67[0] = a2;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7150);
  MEMORY[0x270FA5388](v83);
  uint64_t v10 = (char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24E861138();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v78 = (char *)v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v70 = (char *)v67 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B20);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v73 = (uint64_t)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v18 = MEMORY[0x270FA5388](v76);
  uint64_t v82 = (char *)v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v85 = (uint64_t)v67 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v72 = (uint64_t)v67 - v23;
  uint64_t result = MEMORY[0x270FA5388](v22);
  uint64_t v87 = (uint64_t)v67 - v25;
  uint64_t v26 = *(void *)(a3 + 16);
  uint64_t v27 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v28 = *(unint64_t *)((char *)a1 + v27) & ((-1 << a4) - 1);
  uint64_t v69 = a1;
  *(unint64_t *)((char *)a1 + v27) = v28;
  uint64_t v29 = v26 - 1;
  uint64_t v75 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
  uint64_t v77 = v30;
  char v74 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
  uint64_t v86 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  int64_t v79 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
  uint64_t v81 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v88 = a3;
  uint64_t v71 = a5;
  uint64_t v80 = a3 + 56;
LABEL_2:
  uint64_t v68 = v29;
LABEL_4:
  while (2)
  {
    uint64_t v31 = *a5;
    uint64_t v32 = a5[1];
    uint64_t v33 = a5[2];
    int64_t v34 = a5[3];
    unint64_t v35 = a5[4];
    uint64_t v84 = v33;
    if (v35)
    {
      uint64_t v36 = (v35 - 1) & v35;
      unint64_t v37 = __clz(__rbit64(v35)) | (v34 << 6);
LABEL_6:
      uint64_t v38 = v73;
      sub_24E85E830(*(void *)(v31 + 48) + *(void *)(v77 + 72) * v37, v73, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      uint64_t v39 = 0;
LABEL_13:
      uint64_t v43 = v76;
      (*v75)(v38, v39, 1, v76);
      *a5 = v31;
      a5[1] = v32;
      a5[2] = v84;
      a5[3] = v34;
      a5[4] = v36;
      if ((*v74)(v38, 1, v43) == 1)
      {
        sub_24E563530(v38, &qword_2698F3B20);
        uint64_t v66 = v88;
        swift_retain();
        return sub_24E84C854(v69, v67[0], v68, v66);
      }
      uint64_t v44 = v87;
      sub_24E85E768(v38, v87, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      sub_24E864A58();
      uint64_t v45 = v44;
      uint64_t v46 = v72;
      sub_24E85E830(v45, v72, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      int64_t v47 = *v86;
      if ((*v86)(v46, 1, v11) == 1)
      {
        sub_24E864A68();
      }
      else
      {
        uint64_t v48 = v70;
        (*v79)(v70, v46, v11);
        sub_24E864A68();
        sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
        sub_24E863BB8();
        (*v81)(v48, v11);
      }
      uint64_t v49 = (uint64_t)v82;
      uint64_t v50 = v80;
      uint64_t v51 = sub_24E864A98();
      uint64_t v52 = -1 << *(unsigned char *)(v88 + 32);
      unint64_t v53 = v51 & ~v52;
      if (((*(void *)(v50 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0)
      {
LABEL_3:
        uint64_t result = sub_24E85E7D0(v87, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        a5 = v71;
        continue;
      }
      uint64_t v84 = ~v52;
      uint64_t v54 = *(void *)(v77 + 72);
      uint64_t v55 = v85;
      while (1)
      {
        sub_24E85E830(*(void *)(v88 + 48) + v54 * v53, v55, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        uint64_t v56 = v55;
        uint64_t v57 = (uint64_t)&v10[*(int *)(v83 + 48)];
        sub_24E85E830(v56, (uint64_t)v10, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        sub_24E85E830(v87, v57, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        if (v47((uint64_t)v10, 1, v11) == 1) {
          break;
        }
        sub_24E85E830((uint64_t)v10, v49, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        if (v47(v57, 1, v11) == 1)
        {
          (*v81)((char *)v49, v11);
LABEL_20:
          sub_24E563530((uint64_t)v10, &qword_2698F7150);
          goto LABEL_21;
        }
        uint64_t v58 = v11;
        uint64_t v59 = v78;
        (*v79)(v78, v57, v58);
        char v60 = sub_24E861108();
        uint64_t v61 = *v81;
        uint64_t v62 = v59;
        uint64_t v11 = v58;
        uint64_t v49 = (uint64_t)v82;
        (*v81)(v62, v11);
        v61((char *)v49, v11);
        uint64_t v50 = v80;
        if (v60)
        {
LABEL_27:
          sub_24E85E7D0((uint64_t)v10, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
          sub_24E85E7D0(v85, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
          uint64_t result = sub_24E85E7D0(v87, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
          uint64_t v63 = (v53 >> 3) & 0x1FFFFFFFFFFFFFF8;
          uint64_t v64 = *(unint64_t *)((char *)v69 + v63);
          *(unint64_t *)((char *)v69 + v63) = v64 & ~(1 << v53);
          a5 = v71;
          if ((v64 & (1 << v53)) != 0)
          {
            uint64_t v29 = v68 - 1;
            if (__OFSUB__(v68, 1)) {
              goto LABEL_50;
            }
            if (v68 == 1) {
              return MEMORY[0x263F8EE88];
            }
            goto LABEL_2;
          }
          goto LABEL_4;
        }
        sub_24E85E7D0((uint64_t)v10, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
LABEL_21:
        uint64_t v55 = v85;
        sub_24E85E7D0(v85, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        unint64_t v53 = (v53 + 1) & v84;
        if (((*(void *)(v50 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0) {
          goto LABEL_3;
        }
      }
      if (v47(v57, 1, v11) == 1) {
        goto LABEL_27;
      }
      goto LABEL_20;
    }
    break;
  }
  int64_t v40 = v34 + 1;
  if (!__OFADD__(v34, 1))
  {
    int64_t v41 = (unint64_t)(v33 + 64) >> 6;
    if (v40 >= v41)
    {
      uint64_t v36 = 0;
      uint64_t v39 = 1;
    }
    else
    {
      unint64_t v42 = *(void *)(v32 + 8 * v40);
      if (v42)
      {
LABEL_10:
        uint64_t v36 = (v42 - 1) & v42;
        unint64_t v37 = __clz(__rbit64(v42)) + (v40 << 6);
        int64_t v34 = v40;
        goto LABEL_6;
      }
      if (v34 + 2 >= v41)
      {
LABEL_42:
        uint64_t v36 = 0;
        uint64_t v39 = 1;
        int64_t v34 = v40;
        goto LABEL_12;
      }
      unint64_t v42 = *(void *)(v32 + 8 * (v34 + 2));
      if (v42)
      {
        int64_t v40 = v34 + 2;
        goto LABEL_10;
      }
      if (v34 + 3 < v41)
      {
        unint64_t v42 = *(void *)(v32 + 8 * (v34 + 3));
        if (v42)
        {
          int64_t v40 = v34 + 3;
          goto LABEL_10;
        }
        int64_t v40 = v34 + 4;
        if (v34 + 4 >= v41)
        {
          uint64_t v36 = 0;
          uint64_t v39 = 1;
          v34 += 3;
          goto LABEL_12;
        }
        unint64_t v42 = *(void *)(v32 + 8 * v40);
        if (v42) {
          goto LABEL_10;
        }
        int64_t v40 = v41 - 1;
        int64_t v65 = v34 + 5;
        while (v41 != v65)
        {
          unint64_t v42 = *(void *)(v32 + 8 * v65++);
          if (v42)
          {
            int64_t v40 = v65 - 1;
            goto LABEL_10;
          }
        }
        goto LABEL_42;
      }
      uint64_t v36 = 0;
      uint64_t v39 = 1;
      v34 += 2;
    }
LABEL_12:
    uint64_t v38 = v73;
    goto LABEL_13;
  }
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_24E85755C(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v73 = a2;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B0);
  MEMORY[0x270FA5388](v92);
  uint64_t v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_24E861248();
  uint64_t v11 = *(void *)(v91 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v91);
  uint64_t v83 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v76 = (char *)&v72 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B38);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v79 = (uint64_t)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v17 = MEMORY[0x270FA5388](v86);
  uint64_t v89 = (uint64_t *)((char *)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v88 = (uint64_t)&v72 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v72 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v77 = (uint64_t)&v72 - v25;
  uint64_t result = MEMORY[0x270FA5388](v24);
  uint64_t v94 = (uint64_t)&v72 - v27;
  uint64_t v28 = *(void *)(a3 + 16);
  uint64_t v29 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v30 = *(unint64_t *)((char *)a1 + v29) & ((-1 << a4) - 1);
  uint64_t v75 = a1;
  *(unint64_t *)((char *)a1 + v29) = v30;
  uint64_t v31 = v28 - 1;
  uint64_t v81 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
  uint64_t v82 = v32;
  uint64_t v80 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48);
  uint64_t v84 = (void (**)(char *, uint64_t, uint64_t))(v11 + 32);
  uint64_t v90 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  uint64_t v95 = a3;
  uint64_t v78 = a5;
  uint64_t v87 = v23;
  uint64_t v85 = a3 + 56;
LABEL_2:
  uint64_t v74 = v31;
LABEL_4:
  while (2)
  {
    uint64_t v34 = *a5;
    uint64_t v33 = a5[1];
    uint64_t v35 = a5[2];
    int64_t v36 = a5[3];
    unint64_t v37 = a5[4];
    uint64_t v93 = v35;
    if (v37)
    {
      uint64_t v38 = (v37 - 1) & v37;
      unint64_t v39 = __clz(__rbit64(v37)) | (v36 << 6);
LABEL_6:
      uint64_t v40 = v79;
      sub_24E85E830(*(void *)(v34 + 48) + *(void *)(v82 + 72) * v39, v79, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      uint64_t v41 = 0;
LABEL_13:
      uint64_t v45 = v86;
      (*v81)(v40, v41, 1, v86);
      *a5 = v34;
      a5[1] = v33;
      a5[2] = v93;
      a5[3] = v36;
      a5[4] = v38;
      if ((*v80)(v40, 1, v45) == 1)
      {
        sub_24E563530(v40, &qword_2698F3B38);
        uint64_t v71 = v95;
        swift_retain();
        return sub_24E84CD48(v75, v73, v74, v71);
      }
      uint64_t v46 = v94;
      sub_24E85E768(v40, v94, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      sub_24E864A58();
      uint64_t v47 = v77;
      sub_24E85E830(v46, v77, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_24E864A68();
        sub_24E863D08();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v48 = v76;
        uint64_t v49 = v91;
        (*v84)(v76, v47, v91);
        sub_24E864A68();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        (*v90)((uint64_t)v48, v49);
      }
      uint64_t v50 = v85;
      uint64_t v51 = sub_24E864A98();
      uint64_t v52 = -1 << *(unsigned char *)(v95 + 32);
      unint64_t v53 = v51 & ~v52;
      if (((*(void *)(v50 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0)
      {
LABEL_3:
        uint64_t result = sub_24E85E7D0(v94, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        a5 = v78;
        continue;
      }
      uint64_t v93 = ~v52;
      uint64_t v54 = *(void *)(v82 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(v95 + 48) + v54 * v53, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        uint64_t v55 = &v10[*(int *)(v92 + 48)];
        sub_24E85E830((uint64_t)v23, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        sub_24E85E830(v94, (uint64_t)v55, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v56 = v89;
          sub_24E85E830((uint64_t)v10, (uint64_t)v89, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
          uint64_t v57 = *v56;
          uint64_t v58 = v56[1];
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v59 = *(void *)v55;
            uint64_t v60 = *((void *)v55 + 1);
            BOOL v61 = v57 == v59 && v58 == v60;
            if (v61)
            {
              swift_bridgeObjectRelease_n();
LABEL_35:
              sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
              uint64_t v23 = v87;
              sub_24E85E7D0((uint64_t)v87, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
              uint64_t result = sub_24E85E7D0(v94, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
              uint64_t v68 = (v53 >> 3) & 0x1FFFFFFFFFFFFFF8;
              uint64_t v69 = *(unint64_t *)((char *)v75 + v68);
              *(unint64_t *)((char *)v75 + v68) = v69 & ~(1 << v53);
              BOOL v61 = (v69 & (1 << v53)) == 0;
              a5 = v78;
              if (!v61)
              {
                uint64_t v31 = v74 - 1;
                if (__OFSUB__(v74, 1)) {
                  goto LABEL_58;
                }
                if (v74 == 1) {
                  return MEMORY[0x263F8EE88];
                }
                goto LABEL_2;
              }
              goto LABEL_4;
            }
            char v62 = sub_24E864988();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v62) {
              goto LABEL_35;
            }
            goto LABEL_32;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v63 = v88;
          sub_24E85E830((uint64_t)v10, v88, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            uint64_t v64 = v83;
            uint64_t v65 = v91;
            (*v84)(v83, (uint64_t)v55, v91);
            char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
            char v67 = *v90;
            (*v90)((uint64_t)v64, v65);
            v67(v63, v65);
            uint64_t v50 = v85;
            if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
              goto LABEL_35;
            }
LABEL_32:
            sub_24E85E7D0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
            uint64_t v23 = v87;
            goto LABEL_21;
          }
          (*v90)(v63, v91);
        }
        sub_24E563530((uint64_t)v10, &qword_2698F70B0);
LABEL_21:
        sub_24E85E7D0((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        unint64_t v53 = (v53 + 1) & v93;
        if (((*(void *)(v50 + ((v53 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v53) & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    break;
  }
  int64_t v42 = v36 + 1;
  if (!__OFADD__(v36, 1))
  {
    int64_t v43 = (unint64_t)(v35 + 64) >> 6;
    if (v42 >= v43)
    {
      uint64_t v38 = 0;
      uint64_t v41 = 1;
    }
    else
    {
      unint64_t v44 = *(void *)(v33 + 8 * v42);
      if (v44)
      {
LABEL_10:
        uint64_t v38 = (v44 - 1) & v44;
        unint64_t v39 = __clz(__rbit64(v44)) + (v42 << 6);
        int64_t v36 = v42;
        goto LABEL_6;
      }
      if (v36 + 2 >= v43)
      {
LABEL_50:
        uint64_t v38 = 0;
        uint64_t v41 = 1;
        int64_t v36 = v42;
        goto LABEL_12;
      }
      unint64_t v44 = *(void *)(v33 + 8 * (v36 + 2));
      if (v44)
      {
        int64_t v42 = v36 + 2;
        goto LABEL_10;
      }
      if (v36 + 3 < v43)
      {
        unint64_t v44 = *(void *)(v33 + 8 * (v36 + 3));
        if (v44)
        {
          int64_t v42 = v36 + 3;
          goto LABEL_10;
        }
        int64_t v42 = v36 + 4;
        if (v36 + 4 >= v43)
        {
          uint64_t v38 = 0;
          uint64_t v41 = 1;
          v36 += 3;
          goto LABEL_12;
        }
        unint64_t v44 = *(void *)(v33 + 8 * v42);
        if (v44) {
          goto LABEL_10;
        }
        int64_t v42 = v43 - 1;
        int64_t v70 = v36 + 5;
        while (v43 != v70)
        {
          unint64_t v44 = *(void *)(v33 + 8 * v70++);
          if (v44)
          {
            int64_t v42 = v70 - 1;
            goto LABEL_10;
          }
        }
        goto LABEL_50;
      }
      uint64_t v38 = 0;
      uint64_t v41 = 1;
      v36 += 2;
    }
LABEL_12:
    uint64_t v40 = v79;
    goto LABEL_13;
  }
  __break(1u);
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_24E857F04(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v46 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B28);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v45 - v16;
  uint64_t v18 = *(void *)(a3 + 16);
  uint64_t v19 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v20 = *(unint64_t *)((char *)a1 + v19) & ((-1 << a4) - 1);
  uint64_t v48 = a1;
  uint64_t v49 = a5;
  *(unint64_t *)((char *)a1 + v19) = v20;
  uint64_t v21 = v18 - 1;
  uint64_t v52 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
  uint64_t v53 = v22;
  uint64_t v51 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  uint64_t v23 = a3 + 56;
  while (2)
  {
    uint64_t v47 = v21;
    do
    {
      while (1)
      {
        uint64_t v25 = *a5;
        uint64_t v24 = a5[1];
        uint64_t v26 = a5[2];
        int64_t v27 = a5[3];
        unint64_t v28 = a5[4];
        uint64_t v56 = v24;
        uint64_t v55 = v26;
        if (v28)
        {
          uint64_t v54 = (v28 - 1) & v28;
          unint64_t v29 = __clz(__rbit64(v28)) | (v27 << 6);
LABEL_6:
          uint64_t v30 = v50;
          sub_24E85E830(*(void *)(v25 + 48) + *(void *)(v53 + 72) * v29, v50, type metadata accessor for PeopleLocationsProvider.Subscription);
          uint64_t v31 = 0;
          goto LABEL_7;
        }
        int64_t v41 = v27 + 1;
        if (__OFADD__(v27, 1))
        {
          __break(1u);
          goto LABEL_41;
        }
        int64_t v42 = (unint64_t)(v26 + 64) >> 6;
        if (v41 >= v42)
        {
          uint64_t v54 = 0;
          uint64_t v31 = 1;
          uint64_t v30 = v50;
          goto LABEL_7;
        }
        unint64_t v43 = *(void *)(v24 + 8 * v41);
        if (v43) {
          goto LABEL_18;
        }
        if (v27 + 2 >= v42) {
          goto LABEL_33;
        }
        unint64_t v43 = *(void *)(v24 + 8 * (v27 + 2));
        if (v43)
        {
          int64_t v41 = v27 + 2;
LABEL_18:
          uint64_t v54 = (v43 - 1) & v43;
          unint64_t v29 = __clz(__rbit64(v43)) + (v41 << 6);
          int64_t v27 = v41;
          goto LABEL_6;
        }
        if (v27 + 3 >= v42)
        {
          uint64_t v54 = 0;
          uint64_t v31 = 1;
          v27 += 2;
          uint64_t v30 = v50;
          goto LABEL_7;
        }
        unint64_t v43 = *(void *)(v24 + 8 * (v27 + 3));
        if (v43)
        {
          int64_t v41 = v27 + 3;
          goto LABEL_18;
        }
        int64_t v41 = v27 + 4;
        if (v27 + 4 < v42)
        {
          unint64_t v43 = *(void *)(v24 + 8 * v41);
          if (v43) {
            goto LABEL_18;
          }
          int64_t v41 = v42 - 1;
          int64_t v44 = v27 + 5;
          while (v42 != v44)
          {
            unint64_t v43 = *(void *)(v24 + 8 * v44++);
            if (v43)
            {
              int64_t v41 = v44 - 1;
              goto LABEL_18;
            }
          }
LABEL_33:
          uint64_t v54 = 0;
          uint64_t v31 = 1;
          int64_t v27 = v41;
          uint64_t v30 = v50;
          goto LABEL_7;
        }
        uint64_t v54 = 0;
        uint64_t v31 = 1;
        v27 += 3;
        uint64_t v30 = v50;
LABEL_7:
        (*v52)(v30, v31, 1, v11);
        uint64_t v32 = v56;
        *a5 = v25;
        a5[1] = v32;
        a5[2] = v55;
        a5[3] = v27;
        a5[4] = v54;
        if ((*v51)(v30, 1, v11) == 1)
        {
          sub_24E563530(v30, &qword_2698F3B28);
          swift_retain();
          return sub_24E84CF6C(v48, v46, v47, a3);
        }
        sub_24E85E768(v30, (uint64_t)v17, type metadata accessor for PeopleLocationsProvider.Subscription);
        sub_24E864A58();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        uint64_t v33 = *(int *)(v11 + 20);
        sub_24E864A68();
        uint64_t v34 = sub_24E864A98();
        uint64_t v35 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v36 = v34 & ~v35;
        if ((*(void *)(v23 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36)) {
          break;
        }
LABEL_3:
        uint64_t result = sub_24E85E7D0((uint64_t)v17, type metadata accessor for PeopleLocationsProvider.Subscription);
        a5 = v49;
      }
      uint64_t v37 = ~v35;
      uint64_t v38 = *(void *)(v53 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(a3 + 48) + v38 * v36, (uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) != 0
          && v14[*(int *)(v11 + 20)] == v17[v33])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
        unint64_t v36 = (v36 + 1) & v37;
        if (((*(void *)(v23 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0) {
          goto LABEL_3;
        }
      }
      sub_24E85E7D0((uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
      uint64_t result = sub_24E85E7D0((uint64_t)v17, type metadata accessor for PeopleLocationsProvider.Subscription);
      uint64_t v39 = (v36 >> 3) & 0x1FFFFFFFFFFFFFF8;
      a5 = v49;
      uint64_t v40 = *(unint64_t *)((char *)v48 + v39);
      *(unint64_t *)((char *)v48 + v39) = v40 & ~(1 << v36);
    }
    while ((v40 & (1 << v36)) == 0);
    uint64_t v21 = v47 - 1;
    if (__OFSUB__(v47, 1))
    {
LABEL_41:
      __break(1u);
      return result;
    }
    if (v47 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_24E858458(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  v66[0] = a2;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70D8);
  MEMORY[0x270FA5388](v79);
  uint64_t v10 = (char *)v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v77 = (uint64_t)v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v69 = (uint64_t)v66 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F3B30);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v72 = (uint64_t)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v18 = MEMORY[0x270FA5388](v75);
  uint64_t v78 = (char *)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v66 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v71 = (uint64_t)v66 - v24;
  uint64_t result = MEMORY[0x270FA5388](v23);
  uint64_t v84 = (uint64_t)v66 - v26;
  uint64_t v27 = *(void *)(a3 + 16);
  uint64_t v28 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v29 = *(unint64_t *)((char *)a1 + v28) & ((-1 << a4) - 1);
  uint64_t v68 = a1;
  *(unint64_t *)((char *)a1 + v28) = v29;
  uint64_t v30 = v27 - 1;
  uint64_t v76 = v31;
  uint64_t v73 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  uint64_t v74 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v85 = a3;
  uint64_t v81 = a3 + 56;
  uint64_t v82 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  int64_t v70 = a5;
  uint64_t v83 = v11;
LABEL_2:
  uint64_t v67 = v30;
LABEL_4:
  while (2)
  {
    uint64_t v32 = *a5;
    uint64_t v33 = a5[1];
    uint64_t v35 = a5[2];
    int64_t v34 = a5[3];
    unint64_t v36 = a5[4];
    uint64_t v80 = v35;
    if (v36)
    {
      uint64_t v37 = (v36 - 1) & v36;
      unint64_t v38 = __clz(__rbit64(v36)) | (v34 << 6);
LABEL_6:
      uint64_t v39 = v72;
      sub_24E85E830(*(void *)(v32 + 48) + *(void *)(v76 + 72) * v38, v72, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      uint64_t v40 = 0;
LABEL_13:
      uint64_t v44 = v75;
      (*v74)(v39, v40, 1, v75);
      *a5 = v32;
      a5[1] = v33;
      a5[2] = v80;
      a5[3] = v34;
      a5[4] = v37;
      if ((*v73)(v39, 1, v44) == 1)
      {
        sub_24E563530(v39, &qword_2698F3B30);
        uint64_t v65 = v85;
        swift_retain();
        return sub_24E84D308(v68, v66[0], v67, v65);
      }
      uint64_t v45 = v84;
      sub_24E85E768(v39, v84, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      sub_24E864A58();
      uint64_t v46 = v45;
      uint64_t v47 = v71;
      sub_24E85E830(v46, v71, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      uint64_t v48 = *v82;
      if ((*v82)(v47, 1, v83) == 1)
      {
        sub_24E864A68();
      }
      else
      {
        uint64_t v49 = v47;
        uint64_t v50 = v69;
        sub_24E85E768(v49, v69, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        sub_24E864A68();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        sub_24E85E7D0(v50, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
      }
      uint64_t v51 = (uint64_t)v78;
      uint64_t v52 = sub_24E864A98();
      uint64_t v53 = -1 << *(unsigned char *)(v85 + 32);
      unint64_t v54 = v52 & ~v53;
      if (((*(void *)(v81 + ((v54 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
      {
LABEL_3:
        uint64_t result = sub_24E85E7D0(v84, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        a5 = v70;
        continue;
      }
      uint64_t v80 = ~v53;
      uint64_t v55 = *(void *)(v76 + 72);
      while (1)
      {
        sub_24E85E830(*(void *)(v85 + 48) + v55 * v54, (uint64_t)v22, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        uint64_t v56 = (uint64_t)&v10[*(int *)(v79 + 48)];
        sub_24E85E830((uint64_t)v22, (uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        uint64_t v57 = v83;
        sub_24E85E830(v84, v56, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        if (v48((uint64_t)v10, 1, v57) == 1) {
          break;
        }
        sub_24E85E830((uint64_t)v10, v51, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        if (v48(v56, 1, v57) == 1)
        {
          sub_24E85E7D0(v51, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
LABEL_20:
          sub_24E563530((uint64_t)v10, &qword_2698F70D8);
          goto LABEL_21;
        }
        uint64_t v58 = v77;
        sub_24E85E768(v56, v77, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
        uint64_t v60 = v58;
        uint64_t v51 = (uint64_t)v78;
        sub_24E85E7D0(v60, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        sub_24E85E7D0(v51, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0)
        {
LABEL_27:
          sub_24E85E7D0((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
          sub_24E85E7D0((uint64_t)v22, type metadata accessor for PeopleRelationshipsProvider.Subscription);
          uint64_t result = sub_24E85E7D0(v84, type metadata accessor for PeopleRelationshipsProvider.Subscription);
          uint64_t v61 = (v54 >> 3) & 0x1FFFFFFFFFFFFFF8;
          uint64_t v62 = *(unint64_t *)((char *)v68 + v61);
          *(unint64_t *)((char *)v68 + v61) = v62 & ~(1 << v54);
          BOOL v63 = (v62 & (1 << v54)) == 0;
          a5 = v70;
          if (!v63)
          {
            uint64_t v30 = v67 - 1;
            if (__OFSUB__(v67, 1)) {
              goto LABEL_50;
            }
            if (v67 == 1) {
              return MEMORY[0x263F8EE88];
            }
            goto LABEL_2;
          }
          goto LABEL_4;
        }
        sub_24E85E7D0((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
LABEL_21:
        sub_24E85E7D0((uint64_t)v22, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        unint64_t v54 = (v54 + 1) & v80;
        if (((*(void *)(v81 + ((v54 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v54) & 1) == 0) {
          goto LABEL_3;
        }
      }
      if (v48(v56, 1, v57) == 1) {
        goto LABEL_27;
      }
      goto LABEL_20;
    }
    break;
  }
  int64_t v41 = v34 + 1;
  if (!__OFADD__(v34, 1))
  {
    int64_t v42 = (unint64_t)(v35 + 64) >> 6;
    if (v41 >= v42)
    {
      uint64_t v37 = 0;
      uint64_t v40 = 1;
    }
    else
    {
      unint64_t v43 = *(void *)(v33 + 8 * v41);
      if (v43)
      {
LABEL_10:
        uint64_t v37 = (v43 - 1) & v43;
        unint64_t v38 = __clz(__rbit64(v43)) + (v41 << 6);
        int64_t v34 = v41;
        goto LABEL_6;
      }
      if (v34 + 2 >= v42)
      {
LABEL_42:
        uint64_t v37 = 0;
        uint64_t v40 = 1;
        int64_t v34 = v41;
        goto LABEL_12;
      }
      unint64_t v43 = *(void *)(v33 + 8 * (v34 + 2));
      if (v43)
      {
        int64_t v41 = v34 + 2;
        goto LABEL_10;
      }
      if (v34 + 3 < v42)
      {
        unint64_t v43 = *(void *)(v33 + 8 * (v34 + 3));
        if (v43)
        {
          int64_t v41 = v34 + 3;
          goto LABEL_10;
        }
        int64_t v41 = v34 + 4;
        if (v34 + 4 >= v42)
        {
          uint64_t v37 = 0;
          uint64_t v40 = 1;
          v34 += 3;
          goto LABEL_12;
        }
        unint64_t v43 = *(void *)(v33 + 8 * v41);
        if (v43) {
          goto LABEL_10;
        }
        int64_t v41 = v42 - 1;
        int64_t v64 = v34 + 5;
        while (v42 != v64)
        {
          unint64_t v43 = *(void *)(v33 + 8 * v64++);
          if (v43)
          {
            int64_t v41 = v64 - 1;
            goto LABEL_10;
          }
        }
        goto LABEL_42;
      }
      uint64_t v37 = 0;
      uint64_t v40 = 1;
      v34 += 2;
    }
LABEL_12:
    uint64_t v39 = v72;
    goto LABEL_13;
  }
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_24E858D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_24E861248();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
  swift_bridgeObjectRetain();
  uint64_t v31 = a1;
  uint64_t v10 = sub_24E863BA8();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v13 = v9;
  uint64_t v30 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v26 = v2;
    uint64_t v27 = v6;
    uint64_t v28 = a2;
    uint64_t v29 = ~v11;
    uint64_t v16 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v15 = v6 + 16;
    uint64_t v14 = v16;
    uint64_t v17 = *(void *)(v15 + 56);
    while (1)
    {
      uint64_t v18 = v13;
      v14(v8, *(void *)(v13 + 48) + v17 * v12, v5);
      sub_24E85E898(&qword_2698F1648, MEMORY[0x263F3CBB0]);
      char v19 = sub_24E863C18();
      (*(void (**)(char *, uint64_t))(v15 - 8))(v8, v5);
      if (v19) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v29;
      uint64_t v13 = v18;
      if (((*(void *)(v30 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v20 = 1;
        uint64_t v6 = v27;
        a2 = v28;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v20, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v21 = v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v23 = *v21;
    uint64_t v32 = *v21;
    *uint64_t v21 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24E847F88();
      uint64_t v23 = v32;
    }
    uint64_t v6 = v27;
    a2 = v28;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v27 + 32))(v28, *(void *)(v23 + 48) + v17 * v12, v5);
    sub_24E85A92C(v12);
    *uint64_t v21 = v32;
    swift_bridgeObjectRelease();
    uint64_t v20 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v20, 1, v5);
}

uint64_t sub_24E85903C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = _s16SubscriptionDataOMa(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v2;
  uint64_t v9 = *v2;
  sub_24E864A58();
  swift_bridgeObjectRetain();
  sub_24E6165EC();
  uint64_t v10 = sub_24E864A98();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v21 = v5;
    uint64_t v22 = a2;
    uint64_t v13 = ~v11;
    uint64_t v14 = *(void *)(v6 + 72);
    while (1)
    {
      sub_24E85E830(*(void *)(v9 + 48) + v14 * v12, (uint64_t)v8, _s16SubscriptionDataOMa);
      char v15 = sub_24E61B004((uint64_t)v8, a1);
      sub_24E85E7D0((uint64_t)v8, _s16SubscriptionDataOMa);
      if (v15) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v13;
      if (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v16 = 1;
        uint64_t v5 = v21;
        a2 = v22;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v16, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = v23;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v17;
    uint64_t v24 = *v17;
    *uint64_t v17 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24E848274(_s16SubscriptionDataOMa, &qword_2698F71B0, _s16SubscriptionDataOMa, _s16SubscriptionDataOMa);
      uint64_t v19 = v24;
    }
    a2 = v22;
    sub_24E85E768(*(void *)(v19 + 48) + v14 * v12, v22, _s16SubscriptionDataOMa);
    sub_24E85AF48(v12);
    *uint64_t v17 = v24;
    swift_bridgeObjectRelease();
    uint64_t v16 = 0;
    uint64_t v5 = v21;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v16, 1, v5);
}

uint64_t sub_24E8592E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *v3;
  sub_24E864A58();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24E863D08();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_24E864A98();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_20:
    uint64_t result = swift_bridgeObjectRelease();
    *a3 = 0;
    a3[1] = 0;
    return result;
  }
  uint64_t v11 = *(void *)(v7 + 48);
  unint64_t v12 = (void *)(v11 + 16 * v10);
  BOOL v13 = *v12 == a1 && v12[1] == a2;
  if (!v13 && (sub_24E864988() & 1) == 0)
  {
    uint64_t v20 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v20;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_20;
      }
      uint64_t v21 = (void *)(v11 + 16 * v10);
      BOOL v22 = *v21 == a1 && v21[1] == a2;
    }
    while (!v22 && (sub_24E864988() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v15 = *v3;
  uint64_t v23 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24E8484EC();
    uint64_t v15 = v23;
  }
  uint64_t v16 = (uint64_t *)(*(void *)(v15 + 48) + 16 * v10);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *a3 = v18;
  a3[1] = v17;
  sub_24E85B88C(v10);
  *uint64_t v3 = v23;

  return swift_bridgeObjectRelease();
}

uint64_t sub_24E8594AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F7150);
  MEMORY[0x270FA5388](v52);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E861138();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v44 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v40 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v42 = *(void *)(v40 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v40);
  uint64_t v47 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v38 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v38 - v17;
  uint64_t v39 = v2;
  uint64_t v19 = *v2;
  sub_24E864A58();
  uint64_t v53 = a1;
  sub_24E85E830(a1, (uint64_t)v18, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  uint64_t v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v51(v18, 1, v6) == 1)
  {
    sub_24E864A68();
    swift_bridgeObjectRetain();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v18, v6);
    sub_24E864A68();
    sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  uint64_t v20 = sub_24E864A98();
  uint64_t v21 = -1 << *(unsigned char *)(v19 + 32);
  unint64_t v22 = v20 & ~v21;
  uint64_t v50 = v19 + 56;
  uint64_t v23 = (uint64_t)v47;
  if (((*(void *)(v19 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v32 = 1;
    uint64_t v33 = v41;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v33, v32, 1, v40);
  }
  uint64_t v48 = ~v21;
  uint64_t v49 = *(void *)(v42 + 72);
  unint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v7 + 32);
  uint64_t v46 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  while (1)
  {
    uint64_t v25 = v19;
    unint64_t v26 = v49 * v22;
    sub_24E85E830(*(void *)(v19 + 48) + v49 * v22, (uint64_t)v16, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v27 = (uint64_t)&v5[*(int *)(v52 + 48)];
    sub_24E85E830((uint64_t)v16, (uint64_t)v5, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    sub_24E85E830(v53, v27, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v51;
    if (v51(v5, 1, v6) == 1)
    {
      int v24 = v28(v27, 1, v6);
      uint64_t v19 = v25;
      if (v24 == 1) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
    sub_24E85E830((uint64_t)v5, v23, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    if (v28(v27, 1, v6) != 1) {
      break;
    }
    (*v46)(v23, v6);
    uint64_t v19 = v25;
LABEL_7:
    sub_24E563530((uint64_t)v5, &qword_2698F7150);
LABEL_8:
    sub_24E85E7D0((uint64_t)v16, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    unint64_t v22 = (v22 + 1) & v48;
    if (((*(void *)(v50 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_14;
    }
  }
  uint64_t v29 = v44;
  (*v43)(v44, v27, v6);
  int v45 = sub_24E861108();
  uint64_t v30 = *v46;
  uint64_t v31 = v29;
  uint64_t v23 = (uint64_t)v47;
  (*v46)((uint64_t)v31, v6);
  v30(v23, v6);
  uint64_t v19 = v25;
  if ((v45 & 1) == 0)
  {
    sub_24E85E7D0((uint64_t)v5, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    goto LABEL_8;
  }
LABEL_15:
  sub_24E85E7D0((uint64_t)v5, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  sub_24E85E7D0((uint64_t)v16, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  swift_bridgeObjectRelease();
  int64_t v34 = v39;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v36 = *v34;
  uint64_t v54 = *v34;
  *int64_t v34 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_24E848274(type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, &qword_2698F7158, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
    uint64_t v36 = v54;
  }
  uint64_t v33 = v41;
  sub_24E85E768(*(void *)(v36 + 48) + v26, v41, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  sub_24E85BBFC(v22);
  *int64_t v34 = v54;
  swift_bridgeObjectRelease();
  uint64_t v32 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v33, v32, 1, v40);
}

uint64_t sub_24E859B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70B0);
  MEMORY[0x270FA5388](v69);
  uint64_t v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E861248();
  uint64_t v68 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v60 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v55 - v9;
  uint64_t v11 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v58 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v62 = (uint64_t *)((char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  int64_t v64 = (char *)&v55 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v55 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v55 - v19;
  uint64_t v21 = *v2;
  sub_24E864A58();
  uint64_t v70 = a1;
  sub_24E85E830(a1, (uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  uint64_t v22 = v11;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v63 = v6;
  uint64_t v56 = v2;
  if (EnumCaseMultiPayload == 1)
  {
    sub_24E864A68();
    swift_bridgeObjectRetain();
    sub_24E863D08();
    swift_bridgeObjectRelease();
    uint64_t v24 = v21;
    uint64_t v25 = v68;
  }
  else
  {
    uint64_t v26 = v68;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v10, v20, v6);
    sub_24E864A68();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v6);
    uint64_t v24 = v21;
    uint64_t v25 = v26;
  }
  uint64_t v27 = sub_24E864A98();
  uint64_t v28 = -1 << *(unsigned char *)(v24 + 32);
  unint64_t v29 = v27 & ~v28;
  uint64_t v68 = v24 + 56;
  uint64_t v30 = (uint64_t)v64;
  if (((*(void *)(v24 + 56 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v49 = 1;
    uint64_t v50 = v57;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v50, v49, 1, v22);
  }
  uint64_t v66 = ~v28;
  uint64_t v67 = *(void *)(v58 + 72);
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v25 + 32);
  uint64_t v61 = (void (**)(uint64_t, uint64_t))(v25 + 8);
  while (1)
  {
    unint64_t v31 = v67 * v29;
    sub_24E85E830(*(void *)(v24 + 48) + v67 * v29, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t v32 = &v5[*(int *)(v69 + 48)];
    sub_24E85E830((uint64_t)v18, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    sub_24E85E830(v70, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() == 1) {
      break;
    }
    sub_24E85E830((uint64_t)v5, v30, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      unint64_t v65 = v31;
      uint64_t v40 = v60;
      uint64_t v41 = v24;
      uint64_t v42 = v18;
      uint64_t v43 = v41;
      uint64_t v44 = v63;
      (*v59)(v60, v32, v63);
      char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
      uint64_t v46 = *v61;
      uint64_t v47 = v40;
      uint64_t v48 = v43;
      uint64_t v18 = v42;
      uint64_t v24 = v48;
      uint64_t v30 = (uint64_t)v64;
      (*v61)((uint64_t)v47, v44);
      v46(v30, v44);
      if (MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    (*v61)(v30, v63);
LABEL_7:
    sub_24E563530((uint64_t)v5, &qword_2698F70B0);
LABEL_8:
    sub_24E85E7D0((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    unint64_t v29 = (v29 + 1) & v66;
    if (((*(void *)(v68 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0) {
      goto LABEL_21;
    }
  }
  unint64_t v65 = v31;
  uint64_t v33 = v62;
  sub_24E85E830((uint64_t)v5, (uint64_t)v62, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v36 = *(void *)v32;
  uint64_t v37 = *((void *)v32 + 1);
  if (v35 != v36 || v34 != v37)
  {
    char v39 = sub_24E864988();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_23;
    }
LABEL_19:
    sub_24E85E7D0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    goto LABEL_8;
  }
  swift_bridgeObjectRelease_n();
LABEL_23:
  sub_24E85E7D0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  sub_24E85E7D0((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  swift_bridgeObjectRelease();
  uint64_t v51 = v56;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v53 = *v51;
  uint64_t v71 = *v51;
  *uint64_t v51 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_24E848274((uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription, &qword_2698F70B8, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
    uint64_t v53 = v71;
  }
  uint64_t v50 = v57;
  sub_24E85E768(*(void *)(v53 + 48) + v65, v57, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
  sub_24E85C064(v29);
  *uint64_t v51 = v71;
  swift_bridgeObjectRelease();
  uint64_t v49 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v50, v49, 1, v22);
}

uint64_t sub_24E85A2B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F70D8);
  MEMORY[0x270FA5388](v49);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v43 = (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v40 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v42 = *(void *)(v40 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v40);
  uint64_t v44 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v39 - v17;
  char v39 = v2;
  uint64_t v19 = *v2;
  sub_24E864A58();
  uint64_t v50 = a1;
  sub_24E85E830(a1, (uint64_t)v18, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  uint64_t v48 = v6;
  if (v20(v18, 1, v6) == 1)
  {
    sub_24E864A68();
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_24E85E768((uint64_t)v18, (uint64_t)v11, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    sub_24E864A68();
    sub_24E861248();
    sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    sub_24E863BB8();
    sub_24E85E7D0((uint64_t)v11, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  }
  uint64_t v21 = sub_24E864A98();
  uint64_t v22 = -1 << *(unsigned char *)(v19 + 32);
  unint64_t v23 = v21 & ~v22;
  uint64_t v47 = v19 + 56;
  uint64_t v24 = (uint64_t)v44;
  if (((*(void *)(v19 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v33 = 1;
    uint64_t v34 = v41;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v34, v33, 1, v40);
  }
  uint64_t v45 = ~v22;
  uint64_t v46 = *(void *)(v42 + 72);
  while (1)
  {
    uint64_t v26 = v19;
    unint64_t v27 = v46 * v23;
    sub_24E85E830(*(void *)(v19 + 48) + v46 * v23, (uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v28 = (uint64_t)&v5[*(int *)(v49 + 48)];
    sub_24E85E830((uint64_t)v16, (uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    sub_24E85E830(v50, v28, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v29 = v48;
    if (v20(v5, 1, v48) == 1)
    {
      unsigned int v25 = v20((char *)v28, 1, v29);
      uint64_t v19 = v26;
      if (v25 == 1) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
    sub_24E85E830((uint64_t)v5, v24, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    if (v20((char *)v28, 1, v29) != 1) {
      break;
    }
    sub_24E85E7D0(v24, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
    uint64_t v19 = v26;
LABEL_7:
    sub_24E563530((uint64_t)v5, &qword_2698F70D8);
LABEL_8:
    sub_24E85E7D0((uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    unint64_t v23 = (v23 + 1) & v45;
    if (((*(void *)(v47 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_14;
    }
  }
  uint64_t v30 = v43;
  sub_24E85E768(v28, v43, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  char MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 = _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0();
  uint64_t v32 = v30;
  uint64_t v24 = (uint64_t)v44;
  sub_24E85E7D0(v32, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  sub_24E85E7D0(v24, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
  uint64_t v19 = v26;
  if ((MyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0 & 1) == 0)
  {
    sub_24E85E7D0((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    goto LABEL_8;
  }
LABEL_15:
  sub_24E85E7D0((uint64_t)v5, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  sub_24E85E7D0((uint64_t)v16, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  swift_bridgeObjectRelease();
  uint64_t v35 = v39;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v37 = *v35;
  uint64_t v51 = *v35;
  uint64_t *v35 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_24E848274(type metadata accessor for PeopleRelationshipsProvider.Subscription, &qword_2698F70E0, type metadata accessor for PeopleRelationshipsProvider.Subscription, type metadata accessor for PeopleRelationshipsProvider.Subscription);
    uint64_t v37 = v51;
  }
  uint64_t v34 = v41;
  sub_24E85E768(*(void *)(v37 + 48) + v27, v41, type metadata accessor for PeopleRelationshipsProvider.Subscription);
  sub_24E85C7C4(v23);
  uint64_t *v35 = v51;
  swift_bridgeObjectRelease();
  uint64_t v33 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v34, v33, 1, v40);
}

uint64_t sub_24E85A92C(int64_t a1)
{
  uint64_t v3 = sub_24E861248();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    unint64_t v31 = v1;
    uint64_t v11 = ~v9;
    uint64_t v35 = result;
    swift_retain();
    uint64_t v12 = sub_24E864448();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v33 = (v12 + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v13 = v4 + 16;
      uint64_t v32 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v34 = v13;
      uint64_t v16 = (void (**)(char *, uint64_t))(v13 - 8);
      uint64_t v17 = v35;
      do
      {
        uint64_t v18 = v8;
        uint64_t v19 = v15;
        int64_t v20 = v15 * v10;
        v32(v6, *(void *)(v17 + 48) + v15 * v10, v3);
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        uint64_t v21 = sub_24E863BA8();
        (*v16)(v6, v3);
        unint64_t v22 = v21 & v11;
        if (a1 >= (uint64_t)v33)
        {
          if (v22 < v33 || a1 < (uint64_t)v22)
          {
LABEL_4:
            uint64_t v8 = v18;
            uint64_t v15 = v19;
            uint64_t v17 = v35;
            goto LABEL_5;
          }
        }
        else if (v22 < v33 && a1 < (uint64_t)v22)
        {
          goto LABEL_4;
        }
        uint64_t v17 = v35;
        int64_t v25 = v19 * a1;
        uint64_t v8 = v18;
        if (v19 * a1 < v20
          || (uint64_t v15 = v19, *(void *)(v35 + 48) + v19 * a1 >= (unint64_t)(*(void *)(v35 + 48) + v20 + v19)))
        {
          swift_arrayInitWithTakeFrontToBack();
          goto LABEL_21;
        }
        a1 = v10;
        if (v25 != v20)
        {
          swift_arrayInitWithTakeBackToFront();
LABEL_21:
          uint64_t v17 = v35;
          uint64_t v15 = v19;
          a1 = v10;
        }
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v31;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v26 = *v1;
  uint64_t v27 = *(void *)(*v1 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v26 + 16) = v29;
    ++*(_DWORD *)(v26 + 36);
  }
  return result;
}

uint64_t sub_24E85AC48(unint64_t a1)
{
  uint64_t v25 = _s16SubscriptionDataO9LocationsVMa(0);
  uint64_t v3 = *(void *)(v25 - 8);
  uint64_t result = MEMORY[0x270FA5388](v25);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    unint64_t v23 = v1;
    uint64_t v11 = ~v9;
    swift_retain();
    uint64_t v12 = sub_24E864448();
    uint64_t v24 = v8;
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v13 = (v12 + 1) & v11;
      uint64_t v14 = *(void *)(v3 + 72);
      while (1)
      {
        int64_t v15 = v14 * v10;
        sub_24E85E830(*(void *)(v7 + 48) + v14 * v10, (uint64_t)v6, _s16SubscriptionDataO9LocationsVMa);
        sub_24E864A58();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        sub_24E864A78();
        uint64_t v16 = sub_24E864A98();
        sub_24E85E7D0((uint64_t)v6, _s16SubscriptionDataO9LocationsVMa);
        unint64_t v17 = v16 & v11;
        if ((uint64_t)a1 >= (uint64_t)v13) {
          break;
        }
        if (v17 < v13) {
          goto LABEL_11;
        }
LABEL_12:
        unint64_t v18 = v14 * a1;
        if ((uint64_t)(v14 * a1) < v15 || *(void *)(v7 + 48) + v14 * a1 >= *(void *)(v7 + 48) + v15 + v14)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v18 == v15) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        if (((*(void *)(v24 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
          goto LABEL_16;
        }
      }
      if (v17 < v13) {
        goto LABEL_6;
      }
LABEL_11:
      if ((uint64_t)a1 < (uint64_t)v17) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_16:
    *(void *)(v24 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v23;
  }
  else
  {
    *(void *)(v8 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v19 = *v1;
  uint64_t v20 = *(void *)(*v1 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v19 + 16) = v22;
    ++*(_DWORD *)(v19 + 36);
  }
  return result;
}

uint64_t sub_24E85AF48(unint64_t a1)
{
  uint64_t v39 = _s16SubscriptionDataO9LocationsVMa(0);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (uint64_t)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = _s16SubscriptionDataO10DirectionsVMa(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v37 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = _s16SubscriptionDataO10FriendshipVMa(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v36 = (uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = _s16SubscriptionDataOMa(0);
  uint64_t v8 = *(void *)(v43 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v43);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v15 = *v1;
  uint64_t v16 = *v1 + 56;
  uint64_t v17 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v18 = (a1 + 1) & ~v17;
  if (((1 << v18) & *(void *)(v16 + 8 * (v18 >> 6))) != 0)
  {
    uint64_t v35 = v1;
    uint64_t v19 = ~v17;
    swift_retain();
    uint64_t v20 = sub_24E864448();
    if ((*(void *)(v16 + 8 * (v18 >> 6)) & (1 << v18)) != 0)
    {
      uint64_t v41 = v16;
      unint64_t v42 = (v20 + 1) & v19;
      uint64_t v21 = v19;
      uint64_t v22 = *(void *)(v8 + 72);
      uint64_t v40 = v21;
      while (1)
      {
        uint64_t v23 = v22;
        int64_t v24 = v22 * v18;
        sub_24E85E830(*(void *)(v15 + 48) + v22 * v18, (uint64_t)v14, _s16SubscriptionDataOMa);
        sub_24E864A58();
        sub_24E85E830((uint64_t)v14, (uint64_t)v11, _s16SubscriptionDataOMa);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v25 = v37;
            sub_24E85E768((uint64_t)v11, v37, _s16SubscriptionDataO10DirectionsVMa);
            sub_24E864A68();
            sub_24E861248();
            sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
            uint64_t v21 = v40;
            sub_24E863BB8();
            uint64_t v26 = _s16SubscriptionDataO10DirectionsVMa;
            goto LABEL_11;
          case 2u:
            uint64_t v25 = v38;
            sub_24E85E768((uint64_t)v11, v38, _s16SubscriptionDataO9LocationsVMa);
            sub_24E864A68();
            sub_24E861248();
            sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
            uint64_t v21 = v40;
            sub_24E863BB8();
            sub_24E864A78();
            uint64_t v26 = _s16SubscriptionDataO9LocationsVMa;
            goto LABEL_11;
          case 3u:
          case 4u:
            sub_24E864A68();
            goto LABEL_13;
          default:
            uint64_t v25 = v36;
            sub_24E85E768((uint64_t)v11, v36, _s16SubscriptionDataO10FriendshipVMa);
            sub_24E864A68();
            sub_24E861248();
            sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
            uint64_t v21 = v40;
            sub_24E863BB8();
            uint64_t v26 = _s16SubscriptionDataO10FriendshipVMa;
LABEL_11:
            uint64_t v27 = v25;
            uint64_t v16 = v41;
            sub_24E85E7D0(v27, v26);
LABEL_13:
            uint64_t v28 = sub_24E864A98();
            sub_24E85E7D0((uint64_t)v14, _s16SubscriptionDataOMa);
            unint64_t v29 = v28 & v21;
            if ((uint64_t)a1 >= (uint64_t)v42)
            {
              uint64_t v22 = v23;
              if (v29 < v42) {
                goto LABEL_6;
              }
LABEL_17:
              if ((uint64_t)a1 < (uint64_t)v29) {
                goto LABEL_6;
              }
              goto LABEL_18;
            }
            uint64_t v22 = v23;
            if (v29 < v42) {
              goto LABEL_17;
            }
LABEL_18:
            unint64_t v30 = v22 * a1;
            if ((uint64_t)(v22 * a1) < v24 || *(void *)(v15 + 48) + v22 * a1 >= *(void *)(v15 + 48) + v24 + v22)
            {
              swift_arrayInitWithTakeFrontToBack();
LABEL_5:
              a1 = v18;
              goto LABEL_6;
            }
            a1 = v18;
            if (v30 != v24)
            {
              swift_arrayInitWithTakeBackToFront();
              goto LABEL_5;
            }
LABEL_6:
            unint64_t v18 = (v18 + 1) & v21;
            if (((*(void *)(v16 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
              goto LABEL_22;
            }
            break;
        }
      }
    }
LABEL_22:
    *(void *)(v16 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v35;
  }
  else
  {
    *(void *)(v16 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v31 = *v1;
  uint64_t v32 = *(void *)(*v1 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
    JUMPOUT(0x24E85B54CLL);
  }
  *(void *)(v31 + 16) = v34;
  ++*(_DWORD *)(v31 + 36);
  return result;
}

uint64_t sub_24E85B560(int64_t a1)
{
  uint64_t v27 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v3 = *(void *)(v27 - 8);
  uint64_t result = MEMORY[0x270FA5388](v27);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v25 = v1;
    uint64_t v26 = v8;
    uint64_t v11 = ~v9;
    swift_retain();
    uint64_t v12 = sub_24E864448();
    uint64_t v13 = v26;
    if ((*(void *)(v26 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v14 = (v12 + 1) & v11;
      uint64_t v15 = *(void *)(v3 + 72);
      do
      {
        uint64_t v16 = v15;
        int64_t v17 = v15 * v10;
        sub_24E85E830(*(void *)(v7 + 48) + v15 * v10, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        sub_24E864A58();
        sub_24E8610C8();
        sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
        sub_24E863BB8();
        sub_24E864A88();
        sub_24E864A68();
        uint64_t v18 = sub_24E864A98();
        sub_24E85E7D0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v14)
        {
          if (v19 < v14)
          {
            uint64_t v15 = v16;
            goto LABEL_6;
          }
          uint64_t v15 = v16;
          if (a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v15 = v16;
          if (v19 < v14 && a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        int64_t v20 = v15 * a1;
        if (v15 * a1 < v17 || *(void *)(v7 + 48) + v15 * a1 >= (unint64_t)(*(void *)(v7 + 48) + v17 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v20 == v17) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v13 = v26;
      }
      while (((*(void *)(v26 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v13 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v25;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v21 = *v1;
  uint64_t v22 = *(void *)(*v1 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v21 + 16) = v24;
    ++*(_DWORD *)(v21 + 36);
  }
  return result;
}

unint64_t sub_24E85B88C(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_24E864448();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_24E864A58();
        swift_bridgeObjectRetain();
        sub_24E863D08();
        uint64_t v10 = sub_24E864A98();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_24E85BA54(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_24E864448();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_24E864A58();
        sub_24E864A68();
        unint64_t v10 = sub_24E864A98() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          uint64_t v12 = (unsigned char *)(v11 + v2);
          uint64_t v13 = (unsigned char *)(v11 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *uint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_24E85BBFC(unint64_t a1)
{
  uint64_t v3 = sub_24E861138();
  uint64_t v4 = *(void (***)(char *, uint64_t))(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v45 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v6 = *(void *)(v42 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v42);
  unint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v51 = (uint64_t)&v40 - v10;
  uint64_t result = *v1;
  uint64_t v12 = *v1 + 56;
  uint64_t v13 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v14 = (a1 + 1) & ~v13;
  if (((1 << v14) & *(void *)(v12 + 8 * (v14 >> 6))) != 0)
  {
    uint64_t v43 = v4;
    uint64_t v41 = v1;
    uint64_t v15 = ~v13;
    uint64_t v50 = result;
    swift_retain();
    int64_t v16 = a1;
    uint64_t v17 = sub_24E864448();
    uint64_t v46 = v12;
    if ((*(void *)(v12 + 8 * (v14 >> 6)) & (1 << v14)) != 0)
    {
      uint64_t v48 = v9;
      uint64_t v49 = v3;
      unint64_t v18 = (v17 + 1) & v15;
      uint64_t v19 = *(void *)(v6 + 72);
      int64_t v20 = v43;
      uint64_t v47 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 6);
      ++v43;
      uint64_t v44 = (void (**)(char *, uint64_t, uint64_t))(v20 + 4);
      uint64_t v21 = v46;
      uint64_t v22 = v50;
      while (1)
      {
        uint64_t v23 = v15;
        uint64_t v24 = v19;
        int64_t v25 = v19 * v14;
        uint64_t v26 = *(void *)(v22 + 48) + v19 * v14;
        uint64_t v27 = v51;
        sub_24E85E830(v26, v51, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        sub_24E864A58();
        uint64_t v28 = v27;
        uint64_t v29 = (uint64_t)v48;
        sub_24E85E830(v28, (uint64_t)v48, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        uint64_t v30 = v49;
        if ((*v47)(v29, 1, v49) == 1)
        {
          sub_24E864A68();
        }
        else
        {
          uint64_t v31 = v45;
          (*v44)(v45, v29, v30);
          sub_24E864A68();
          sub_24E85E898(&qword_2698F7160, MEMORY[0x263F3CB78]);
          sub_24E863BB8();
          uint64_t v32 = v31;
          uint64_t v21 = v46;
          (*v43)(v32, v30);
        }
        uint64_t v33 = sub_24E864A98();
        sub_24E85E7D0(v51, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
        unint64_t v34 = v33 & v23;
        uint64_t v15 = v23;
        uint64_t v22 = v50;
        uint64_t v19 = v24;
        if (v16 >= (uint64_t)v18) {
          break;
        }
        if (v34 < v18) {
          goto LABEL_14;
        }
LABEL_15:
        int64_t v35 = v24 * v16;
        if (v24 * v16 < v25
          || *(void *)(v50 + 48) + v24 * v16 >= (unint64_t)(*(void *)(v50 + 48) + v25 + v24))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v16 = v14;
          if (v35 == v25) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        int64_t v16 = v14;
LABEL_6:
        unint64_t v14 = (v14 + 1) & v23;
        if (((*(void *)(v21 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v34 < v18) {
        goto LABEL_6;
      }
LABEL_14:
      if (v16 < (uint64_t)v34) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
    uint64_t v21 = v46;
LABEL_21:
    *(void *)(v21 + (((unint64_t)v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v16) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v41;
  }
  else
  {
    *(void *)(v12 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v36 = *v1;
  uint64_t v37 = *(void *)(*v1 + 16);
  BOOL v38 = __OFSUB__(v37, 1);
  uint64_t v39 = v37 - 1;
  if (v38)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v36 + 16) = v39;
    ++*(_DWORD *)(v36 + 36);
  }
  return result;
}

uint64_t sub_24E85C064(unint64_t a1)
{
  uint64_t v38 = sub_24E861248();
  uint64_t v3 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v5 = *(void *)(v41 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v41);
  uint64_t v39 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v42 = (uint64_t)&v34 - v8;
  unint64_t v34 = v1;
  uint64_t result = *v1;
  uint64_t v10 = *v1 + 56;
  uint64_t v11 = -1 << *(unsigned char *)(result + 32);
  unint64_t v12 = (a1 + 1) & ~v11;
  if (((1 << v12) & *(void *)(v10 + 8 * (v12 >> 6))) != 0)
  {
    uint64_t v13 = ~v11;
    uint64_t v40 = result;
    swift_retain();
    uint64_t v14 = sub_24E864448();
    if ((*(void *)(v10 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
    {
      unint64_t v15 = (v14 + 1) & v13;
      uint64_t v16 = *(void *)(v5 + 72);
      int64_t v35 = (void (**)(char *, uint64_t))(v3 + 8);
      uint64_t v36 = (void (**)(char *, uint64_t, uint64_t))(v3 + 32);
      uint64_t v17 = v40;
      while (1)
      {
        uint64_t v18 = v13;
        uint64_t v19 = v10;
        uint64_t v20 = v16;
        int64_t v21 = v16 * v12;
        uint64_t v22 = v42;
        sub_24E85E830(*(void *)(v17 + 48) + v16 * v12, v42, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        sub_24E864A58();
        uint64_t v23 = v39;
        sub_24E85E830(v22, v39, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_24E864A68();
          sub_24E863D08();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v24 = v37;
          uint64_t v25 = v23;
          uint64_t v26 = v38;
          (*v36)(v37, v25, v38);
          sub_24E864A68();
          sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
          sub_24E863BB8();
          (*v35)(v24, v26);
        }
        uint64_t v27 = sub_24E864A98();
        sub_24E85E7D0(v42, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
        uint64_t v13 = v18;
        unint64_t v28 = v27 & v18;
        uint64_t v17 = v40;
        if ((uint64_t)a1 >= (uint64_t)v15) {
          break;
        }
        uint64_t v10 = v19;
        uint64_t v16 = v20;
        if (v28 < v15) {
          goto LABEL_14;
        }
LABEL_15:
        unint64_t v29 = v16 * a1;
        if ((uint64_t)(v16 * a1) < v21 || *(void *)(v40 + 48) + v16 * a1 >= *(void *)(v40 + 48) + v21 + v16)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v12;
          if (v29 == v21) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v16 = v20;
        a1 = v12;
LABEL_6:
        unint64_t v12 = (v12 + 1) & v18;
        if (((*(void *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
          goto LABEL_20;
        }
      }
      uint64_t v10 = v19;
      uint64_t v16 = v20;
      if (v28 < v15) {
        goto LABEL_6;
      }
LABEL_14:
      if ((uint64_t)a1 < (uint64_t)v28) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
LABEL_20:
    *(void *)(v10 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v10 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v30 = *v34;
  uint64_t v31 = *(void *)(*v34 + 16);
  BOOL v32 = __OFSUB__(v31, 1);
  uint64_t v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v30 + 16) = v33;
    ++*(_DWORD *)(v30 + 36);
  }
  return result;
}

uint64_t sub_24E85C4C4(unint64_t a1)
{
  uint64_t v25 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v3 = *(void *)(v25 - 8);
  uint64_t result = MEMORY[0x270FA5388](v25);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v23 = v1;
    uint64_t v11 = ~v9;
    swift_retain();
    uint64_t v12 = sub_24E864448();
    uint64_t v24 = v8;
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v13 = (v12 + 1) & v11;
      uint64_t v14 = *(void *)(v3 + 72);
      while (1)
      {
        int64_t v15 = v14 * v10;
        sub_24E85E830(*(void *)(v7 + 48) + v14 * v10, (uint64_t)v6, type metadata accessor for PeopleLocationsProvider.Subscription);
        sub_24E864A58();
        sub_24E861248();
        sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
        sub_24E863BB8();
        sub_24E864A68();
        uint64_t v16 = sub_24E864A98();
        sub_24E85E7D0((uint64_t)v6, type metadata accessor for PeopleLocationsProvider.Subscription);
        unint64_t v17 = v16 & v11;
        if ((uint64_t)a1 >= (uint64_t)v13) {
          break;
        }
        if (v17 < v13) {
          goto LABEL_11;
        }
LABEL_12:
        unint64_t v18 = v14 * a1;
        if ((uint64_t)(v14 * a1) < v15 || *(void *)(v7 + 48) + v14 * a1 >= *(void *)(v7 + 48) + v15 + v14)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v18 == v15) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        if (((*(void *)(v24 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
          goto LABEL_16;
        }
      }
      if (v17 < v13) {
        goto LABEL_6;
      }
LABEL_11:
      if ((uint64_t)a1 < (uint64_t)v17) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_16:
    *(void *)(v24 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v23;
  }
  else
  {
    *(void *)(v8 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v19 = *v1;
  uint64_t v20 = *(void *)(*v1 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v19 + 16) = v22;
    ++*(_DWORD *)(v19 + 36);
  }
  return result;
}

uint64_t sub_24E85C7C4(unint64_t a1)
{
  uint64_t v44 = type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier(0);
  uint64_t v42 = *(unsigned int (***)(char *, uint64_t, uint64_t))(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v40 = (uint64_t)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v4 = *(void *)(v38 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v38);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = *v1;
  uint64_t v12 = *v1 + 56;
  uint64_t v13 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v14 = (a1 + 1) & ~v13;
  if (((1 << v14) & *(void *)(v12 + 8 * (v14 >> 6))) != 0)
  {
    uint64_t v37 = v1;
    uint64_t v15 = ~v13;
    swift_retain();
    uint64_t v16 = sub_24E864448();
    if ((*(void *)(v12 + 8 * (v14 >> 6)) & (1 << v14)) != 0)
    {
      uint64_t v17 = *(void *)(v4 + 72);
      unint64_t v18 = (v16 + 1) & v15;
      v42 += 6;
      uint64_t v43 = v17;
      uint64_t v19 = v15;
      uint64_t v20 = v17;
      uint64_t v39 = v10;
      while (1)
      {
        int64_t v21 = v20 * v14;
        sub_24E85E830(*(void *)(v11 + 48) + v20 * v14, (uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        sub_24E864A58();
        sub_24E85E830((uint64_t)v10, (uint64_t)v7, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        if ((*v42)(v7, 1, v44) == 1)
        {
          sub_24E864A68();
        }
        else
        {
          uint64_t v22 = (uint64_t)v7;
          unint64_t v41 = a1;
          uint64_t v23 = v11;
          uint64_t v24 = v7;
          uint64_t v25 = v19;
          uint64_t v26 = v12;
          uint64_t v27 = v40;
          sub_24E85E768(v22, v40, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
          sub_24E864A68();
          sub_24E861248();
          sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
          sub_24E863BB8();
          uint64_t v28 = v27;
          uint64_t v12 = v26;
          uint64_t v19 = v25;
          uint64_t v7 = v24;
          uint64_t v11 = v23;
          a1 = v41;
          unint64_t v10 = v39;
          sub_24E85E7D0(v28, type metadata accessor for PeopleRelationshipsProvider.Subscription.Identifier);
        }
        uint64_t v29 = sub_24E864A98();
        sub_24E85E7D0((uint64_t)v10, type metadata accessor for PeopleRelationshipsProvider.Subscription);
        unint64_t v30 = v29 & v19;
        if ((uint64_t)a1 >= (uint64_t)v18) {
          break;
        }
        uint64_t v20 = v43;
        if (v30 < v18) {
          goto LABEL_14;
        }
LABEL_15:
        unint64_t v31 = v20 * a1;
        if ((uint64_t)(v20 * a1) < v21 || *(void *)(v11 + 48) + v20 * a1 >= *(void *)(v11 + 48) + v21 + v20)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v14;
          if (v31 == v21) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v14;
LABEL_6:
        unint64_t v14 = (v14 + 1) & v19;
        if (((*(void *)(v12 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          goto LABEL_19;
        }
      }
      uint64_t v20 = v43;
      if (v30 < v18) {
        goto LABEL_6;
      }
LABEL_14:
      if ((uint64_t)a1 < (uint64_t)v30) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
LABEL_19:
    *(void *)(v12 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v37;
  }
  else
  {
    *(void *)(v12 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v32 = *v1;
  uint64_t v33 = *(void *)(*v1 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v32 + 16) = v35;
    ++*(_DWORD *)(v32 + 36);
  }
  return result;
}

uint64_t sub_24E85CC38(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_24E85CCDC(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_24E85CDC0(uint64_t a1)
{
  uint64_t v2 = _s16SubscriptionDataOMa(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24E85E898(&qword_2698F3090, (void (*)(uint64_t))_s16SubscriptionDataOMa);
  uint64_t result = sub_24E864138();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_24E85E830(v11, (uint64_t)v6, _s16SubscriptionDataOMa);
      sub_24E840834((uint64_t)v8, (uint64_t)v6);
      sub_24E85E7D0((uint64_t)v8, _s16SubscriptionDataOMa);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

uint64_t sub_24E85CF50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DeviceImageProvider.Subscription();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v41 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v41 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  sub_24E85E898(&qword_2698F8070, (void (*)(uint64_t))type metadata accessor for DeviceImageProvider.Subscription);
  uint64_t v48 = v2;
  uint64_t v16 = sub_24E864138();
  uint64_t v44 = v15;
  if (!v15) {
    return v16;
  }
  uint64_t v17 = 0;
  uint64_t v18 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v42 = v12;
  uint64_t v43 = a1 + ((v18 + 32) & ~v18);
  uint64_t v19 = *(void *)(v3 + 72);
  while (1)
  {
    uint64_t v46 = v17;
    sub_24E85E830(v43 + v19 * v17, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    sub_24E864A58();
    uint64_t v20 = sub_24E8610C8();
    uint64_t v21 = sub_24E85E898(&qword_2698F7180, MEMORY[0x263F3CB50]);
    swift_bridgeObjectRetain();
    uint64_t v47 = v20;
    uint64_t v45 = v21;
    sub_24E863BB8();
    uint64_t v22 = v48;
    uint64_t v23 = *(int *)(v48 + 20);
    sub_24E864A88();
    uint64_t v24 = *(int *)(v22 + 24);
    sub_24E864A68();
    uint64_t v25 = sub_24E864A98();
    uint64_t v26 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v27 = v25 & ~v26;
    if ((*(void *)(v16 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27))
    {
      uint64_t v28 = ~v26;
      while (1)
      {
        sub_24E85E830(*(void *)(v16 + 48) + v27 * v19, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        if ((MEMORY[0x25333F0D0](v6, v14) & 1) != 0
          && *(double *)&v6[*(int *)(v48 + 20)] == *(double *)&v14[v23]
          && v6[*(int *)(v48 + 24)] == v14[v24])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
        unint64_t v27 = (v27 + 1) & v28;
        if (((*(void *)(v16 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
          goto LABEL_11;
        }
      }
      sub_24E85E7D0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = (uint64_t)v42;
    sub_24E85E830((uint64_t)v14, (uint64_t)v42, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    uint64_t v49 = v16;
    if (*(void *)(v16 + 24) <= *(void *)(v16 + 16)) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_24E848274((uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription, &qword_2698F7178, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    }
LABEL_24:
    uint64_t v16 = v49;
    *(void *)(v49 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v27;
    sub_24E85E768(v30, *(void *)(v16 + 48) + v27 * v19, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    uint64_t v37 = *(void *)(v16 + 16);
    BOOL v38 = __OFADD__(v37, 1);
    uint64_t v39 = v37 + 1;
    if (v38)
    {
      __break(1u);
      goto LABEL_28;
    }
    *(void *)(v16 + 16) = v39;
LABEL_3:
    swift_bridgeObjectRelease();
    uint64_t v17 = v46 + 1;
    sub_24E85E7D0((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    if (v17 == v44) {
      return v16;
    }
  }
  if (isUniquelyReferenced_nonNull_native) {
    sub_24E843F74();
  }
  else {
    sub_24E849A20();
  }
  uint64_t v31 = v49;
  sub_24E864A58();
  sub_24E863BB8();
  uint64_t v32 = v48;
  uint64_t v33 = *(int *)(v48 + 20);
  sub_24E864A88();
  uint64_t v47 = *(int *)(v32 + 24);
  sub_24E864A68();
  uint64_t v34 = sub_24E864A98();
  uint64_t v35 = -1 << *(unsigned char *)(v31 + 32);
  unint64_t v27 = v34 & ~v35;
  if (((*(void *)(v31 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v36 = ~v35;
  while (1)
  {
    sub_24E85E830(*(void *)(v31 + 48) + v27 * v19, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    if ((MEMORY[0x25333F0D0](v9, v30) & 1) != 0
      && *(double *)&v9[*(int *)(v48 + 20)] == *(double *)(v30 + v33)
      && v9[*(int *)(v48 + 24)] == *(unsigned char *)(v30 + v47))
    {
      break;
    }
    sub_24E85E7D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
    unint64_t v27 = (v27 + 1) & v36;
    if (((*(void *)(v31 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_28:
  sub_24E85E7D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for DeviceImageProvider.Subscription);
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E85D540(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24E74B038();
  uint64_t result = sub_24E864138();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24E8413BC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24E85D5D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  sub_24E74B08C();
  for (uint64_t i = sub_24E864138(); v1; --v1)
  {
    sub_24E864A58();
    sub_24E864A68();
    unint64_t v3 = sub_24E864A98() & ~(-1 << *(unsigned char *)(i + 32));
    if (((*(void *)(i + ((v3 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v3) & 1) == 0)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_24E846A7C(v3, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
    }
  }
  return i;
}

uint64_t sub_24E85D6B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BeaconsInfoProvider.BeaconsSubscription(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24E85E898(&qword_2698F7148, (void (*)(uint64_t))type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
  uint64_t result = sub_24E864138();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_24E85E830(v11, (uint64_t)v6, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      sub_24E84157C((uint64_t)v8, (uint64_t)v6);
      sub_24E85E7D0((uint64_t)v8, type metadata accessor for BeaconsInfoProvider.BeaconsSubscription);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

uint64_t sub_24E85D844(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ContactsProvider.Subscription();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24E85E898(&qword_2698F70A8, (void (*)(uint64_t))type metadata accessor for ContactsProvider.Subscription);
  uint64_t result = sub_24E864138();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_24E85E830(v11, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      sub_24E841C30((uint64_t)v8, (uint64_t)v6);
      sub_24E85E7D0((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ContactsProvider.Subscription);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

uint64_t sub_24E85D9D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleLocationsProvider.Subscription(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v36 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  sub_24E85E898(&qword_2698F70C0, (void (*)(uint64_t))type metadata accessor for PeopleLocationsProvider.Subscription);
  uint64_t v41 = v2;
  uint64_t v16 = sub_24E864138();
  uint64_t v37 = v15;
  if (!v15) {
    return v16;
  }
  uint64_t v17 = 0;
  uint64_t v36 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v18 = *(void *)(v3 + 72);
  while (1)
  {
    uint64_t v40 = v17;
    sub_24E85E830(v36 + v18 * v17, (uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
    sub_24E864A58();
    uint64_t v22 = sub_24E861248();
    uint64_t v23 = sub_24E85E898((unint64_t *)&unk_2698F2F90, MEMORY[0x263F3CBB0]);
    swift_bridgeObjectRetain();
    uint64_t v38 = v23;
    uint64_t v39 = v22;
    sub_24E863BB8();
    uint64_t v24 = *(int *)(v41 + 20);
    sub_24E864A68();
    uint64_t v25 = sub_24E864A98();
    uint64_t v26 = -1 << *(unsigned char *)(v16 + 32);
    unint64_t v27 = v25 & ~v26;
    if ((*(void *)(v16 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27))
    {
      uint64_t v28 = ~v26;
      while (1)
      {
        sub_24E85E830(*(void *)(v16 + 48) + v27 * v18, (uint64_t)v6, type metadata accessor for PeopleLocationsProvider.Subscription);
        if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) != 0
          && v6[*(int *)(v41 + 20)] == v14[v24])
        {
          break;
        }
        sub_24E85E7D0((uint64_t)v6, type metadata accessor for PeopleLocationsProvider.Subscription);
        unint64_t v27 = (v27 + 1) & v28;
        if (((*(void *)(v16 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
          goto LABEL_14;
        }
      }
      sub_24E85E7D0((uint64_t)v6, type metadata accessor for PeopleLocationsProvider.Subscription);
      goto LABEL_7;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24E85E830((uint64_t)v14, (uint64_t)v12, type metadata accessor for PeopleLocationsProvider.Subscription);
    uint64_t v42 = v16;
    if (*(void *)(v16 + 24) > *(void *)(v16 + 16))
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24E848274(type metadata accessor for PeopleLocationsProvider.Subscription, &qword_2698F70C8, type metadata accessor for PeopleLocationsProvider.Subscription, type metadata accessor for PeopleLocationsProvider.Subscription);
      }
      goto LABEL_5;
    }
    if (isUniquelyReferenced_nonNull_native) {
      sub_24E8450C8();
    }
    else {
      sub_24E84AA4C();
    }
    uint64_t v30 = v42;
    sub_24E864A58();
    sub_24E863BB8();
    uint64_t v31 = *(int *)(v41 + 20);
    sub_24E864A68();
    uint64_t v32 = sub_24E864A98();
    uint64_t v33 = -1 << *(unsigned char *)(v30 + 32);
    unint64_t v27 = v32 & ~v33;
    if ((*(void *)(v30 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27)) {
      break;
    }
LABEL_5:
    uint64_t v16 = v42;
    *(void *)(v42 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v27;
    sub_24E85E768((uint64_t)v12, *(void *)(v16 + 48) + v27 * v18, type metadata accessor for PeopleLocationsProvider.Subscription);
    uint64_t v19 = *(void *)(v16 + 16);
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
      goto LABEL_26;
    }
    *(void *)(v16 + 16) = v21;
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t v17 = v40 + 1;
    sub_24E85E7D0((uint64_t)v14, type metadata accessor for PeopleLocationsProvider.Subscription);
    if (v17 == v37) {
      return v16;
    }
  }
  uint64_t v34 = ~v33;
  while (1)
  {
    sub_24E85E830(*(void *)(v30 + 48) + v27 * v18, (uint64_t)v9, type metadata accessor for PeopleLocationsProvider.Subscription);
    if ((_s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0() & 1) != 0
      && v9[*(int *)(v41 + 20)] == v12[v31])
    {
      break;
    }
    sub_24E85E7D0((uint64_t)v9, type metadata accessor for PeopleLocationsProvider.Subscription);
    unint64_t v27 = (v27 + 1) & v34;
    if (((*(void *)(v30 + 56 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
      goto LABEL_5;
    }
  }
LABEL_26:
  sub_24E85E7D0((uint64_t)v9, type metadata accessor for PeopleLocationsProvider.Subscription);
  uint64_t result = sub_24E8649C8();
  __break(1u);
  return result;
}

uint64_t sub_24E85DF58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PeopleRelationshipsProvider.Subscription(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24E85E898(&qword_2698F70D0, (void (*)(uint64_t))type metadata accessor for PeopleRelationshipsProvider.Subscription);
  uint64_t result = sub_24E864138();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_24E85E830(v11, (uint64_t)v6, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      sub_24E842364((uint64_t)v8, (uint64_t)v6);
      sub_24E85E7D0((uint64_t)v8, type metadata accessor for PeopleRelationshipsProvider.Subscription);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

void *sub_24E85E0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v25 = a4;
  uint64_t v11 = sub_24E861758();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E861748();
  uint64_t v15 = sub_24E861708();
  uint64_t v17 = v16;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v14, v11);
  v7[3] = v15;
  v7[4] = v17;
  sub_24E861748();
  uint64_t v19 = sub_24E861708();
  uint64_t v21 = v20;
  v18(v14, v11);
  v7[9] = v19;
  v7[10] = v21;
  v7[2] = a1;
  v7[5] = a2;
  v7[6] = a3;
  uint64_t v22 = v26;
  v7[7] = v25;
  v7[8] = v22;
  v7[11] = v27;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24E83C4E4();
  return v7;
}

uint64_t type metadata accessor for ProvidersMediator()
{
  return self;
}

uint64_t method lookup function for ProvidersMediator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ProvidersMediator);
}

uint64_t dispatch thunk of ProvidersMediator.__allocating_init(peopleRelationshipsProvider:peopleLocationsProvider:beaconsInfoProvider:userLocationProvider:contactsProvider:mapsDirectionsProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_24E85E2BC()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E85E2F4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E85E344(uint64_t a1, uint64_t a2)
{
  return sub_24E83FD2C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_24E85E374()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E85E3AC()
{
  return sub_24E83F744(v0);
}

uint64_t (*sub_24E85E3B4())()
{
  return sub_24E83FAD0();
}

uint64_t sub_24E85E3BC()
{
  return sub_24E83F35C(v0, (uint64_t)&unk_270065298, (uint64_t)&unk_2700652C0, (uint64_t)&unk_2698F88C0);
}

uint64_t sub_24E85E414()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E56A260;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24E83FB98, 0, 0);
}

uint64_t sub_24E85E4C4()
{
  return sub_24E83E480(v0);
}

uint64_t (*sub_24E85E4CC())()
{
  return sub_24E83F2B4();
}

uint64_t sub_24E85E4D4()
{
  return sub_24E83F35C(v0, (uint64_t)&unk_2700652E8, (uint64_t)&unk_270065310, (uint64_t)&unk_2698F88D0);
}

uint64_t sub_24E85E52C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E5699A4;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24E83F5B0, 0, 0);
}

uint64_t sub_24E85E5DC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24E85E61C(uint64_t a1, uint64_t a2)
{
  return sub_24E83D0E0(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_24E85E628()
{
  return sub_24E83D778(v0);
}

uint64_t (*sub_24E85E630())()
{
  return sub_24E83E224();
}

uint64_t sub_24E85E638()
{
  return sub_24E83F35C(v0, (uint64_t)&unk_270065388, (uint64_t)&unk_2700653B0, (uint64_t)&unk_2698F88F0);
}

uint64_t sub_24E85E690()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E56A260;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24E83E2EC, 0, 0);
}

uint64_t sub_24E85E748(uint64_t a1)
{
  return sub_24E83CF6C(a1);
}

uint64_t sub_24E85E768(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E85E7D0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E85E830(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E85E898(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E85E8FC()
{
  uint64_t v0 = sub_24E862168();
  __swift_allocate_value_buffer(v0, qword_2698F8968);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698F8968);
  return sub_24E862158();
}

uint64_t static StaticMapGenerator.generateImage(focusedAnnotation:centerOffset:size:allowPitch:)(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  *(unsigned char *)(v6 + 89) = a2;
  *(double *)(v6 + 304) = a5;
  *(double *)(v6 + 312) = a6;
  *(double *)(v6 + 288) = a3;
  *(double *)(v6 + 296) = a4;
  uint64_t v8 = sub_24E8616F8();
  *(void *)(v6 + 320) = v8;
  *(void *)(v6 + 328) = *(void *)(v8 - 8);
  *(void *)(v6 + 336) = swift_task_alloc();
  *(_OWORD *)(v6 + 344) = *(_OWORD *)a1;
  *(void *)(v6 + 360) = *(void *)(a1 + 16);
  *(_OWORD *)(v6 + 368) = *(_OWORD *)(a1 + 24);
  return MEMORY[0x270FA2498](sub_24E85EA54, 0, 0);
}

uint64_t sub_24E85EA54()
{
  uint64_t v88 = v0;
  uint64_t v1 = (void *)(v0 + 272);
  double v3 = *(double *)(v0 + 352);
  double v2 = *(double *)(v0 + 360);
  uint64_t v4 = (_OWORD *)(v0 + 344);
  double v5 = *(double *)(v0 + 344);
  uint64_t v7 = *(void *)(v0 + 328);
  uint64_t v6 = *(void *)(v0 + 336);
  uint64_t v8 = *(void *)(v0 + 320);
  if (v2 < 10.0) {
    double v9 = 20.0;
  }
  else {
    double v9 = v2 + v2;
  }
  sub_24E8616E8();
  id v10 = objc_allocWithZone(MEMORY[0x263F00A50]);
  uint64_t v11 = (void *)sub_24E861608();
  id v12 = objc_msgSend(v10, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, v11, v5, v3, 0.0, v9, 0.0);
  *(void *)(v0 + 384) = v12;

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  MKMapRectMakeWithRadialDistance();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10960]), sel_initWithCLLocation_, v12);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(unsigned __int8 *)(v0 + 89);
    double v25 = *(double *)(v0 + 304);
    double v24 = *(double *)(v0 + 312);
    uint64_t v26 = self;
    id v27 = objc_msgSend(v26, sel_cameraLookingAtMapItem_forViewSize_allowPitch_, v22, v23, v25, v24);
    id v28 = objc_msgSend(v26, sel__cameraLookingAtMapRect_forViewSize_, v14, v16, v18, v20, v25, v24);
    if (v28)
    {
      uint64_t v29 = v28;
      objc_msgSend(v27, sel_centerCoordinateDistance);
      double v31 = v30;
      objc_msgSend(v29, sel_centerCoordinateDistance);
      if (v32 <= v31)
      {
        if (qword_2698F0F40 != -1) {
          swift_once();
        }
        uint64_t v61 = sub_24E862168();
        __swift_project_value_buffer(v61, (uint64_t)qword_2698F8968);
        uint64_t v62 = sub_24E862148();
        os_log_type_t v63 = sub_24E864238();
        if (os_log_type_enabled(v62, v63))
        {
          int64_t v64 = (uint8_t *)swift_slowAlloc();
          uint64_t v65 = swift_slowAlloc();
          uint64_t v87 = v65;
          *(_DWORD *)int64_t v64 = 136315138;
          *(void *)(v0 + 280) = sub_24E55B02C(0xD00000000000003ELL, 0x800000024E877580, &v87);
          sub_24E8643A8();
          _os_log_impl(&dword_24E553000, v62, v63, "%s - Using MKMapItem default camera", v64, 0xCu);
          swift_arrayDestroy();
          uint64_t v66 = v65;
          uint64_t v4 = (_OWORD *)(v0 + 344);
          MEMORY[0x2533435F0](v66, -1, -1);
          uint64_t v67 = v64;
          uint64_t v1 = (void *)(v0 + 272);
          MEMORY[0x2533435F0](v67, -1, -1);
        }

        uint64_t v51 = (uint64_t *)(v0 + 136);
        if ((*(unsigned char *)(v0 + 89) & 1) == 0) {
          objc_msgSend(v27, sel_setPitch_, 0.0);
        }
        *uint64_t v1 = v27;
        sub_24E60F6EC(0, &qword_2698F8988);
        type metadata accessor for MKCoordinateRegion(0);
        id v68 = v27;
        sub_24E8611B8();

        uint64_t v52 = 168;
        uint64_t v53 = 160;
        uint64_t v54 = 152;
        uint64_t v55 = 144;
      }
      else
      {
        if (qword_2698F0F40 != -1) {
          swift_once();
        }
        uint64_t v33 = sub_24E862168();
        __swift_project_value_buffer(v33, (uint64_t)qword_2698F8968);
        uint64_t v34 = sub_24E862148();
        os_log_type_t v35 = sub_24E864238();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          uint64_t v85 = v29;
          uint64_t v37 = swift_slowAlloc();
          uint64_t v87 = v37;
          *(_DWORD *)uint64_t v36 = 136315138;
          *(void *)(v0 + 256) = sub_24E55B02C(0xD00000000000003ELL, 0x800000024E877580, &v87);
          sub_24E8643A8();
          _os_log_impl(&dword_24E553000, v34, v35, "%s - Creating new camera based on defaultFramingCamera with minimumFramingCamera distance", v36, 0xCu);
          swift_arrayDestroy();
          uint64_t v38 = v37;
          uint64_t v29 = v85;
          MEMORY[0x2533435F0](v38, -1, -1);
          MEMORY[0x2533435F0](v36, -1, -1);
        }

        uint64_t v4 = (_OWORD *)(v0 + 344);
        int v39 = *(unsigned __int8 *)(v0 + 89);
        objc_msgSend(v27, sel_centerCoordinate);
        double v41 = v40;
        double v43 = v42;
        objc_msgSend(v29, sel_centerCoordinateDistance);
        double v45 = v44;
        double v46 = 0.0;
        if (v39 == 1)
        {
          objc_msgSend(v27, sel_pitch);
          double v46 = v47;
        }
        objc_msgSend(v27, sel_heading);
        id v49 = objc_msgSend(v26, sel_cameraLookingAtCenterCoordinate_fromDistance_pitch_heading_, v41, v43, v45, v46, v48);
        *(void *)(v0 + 248) = v49;
        sub_24E60F6EC(0, &qword_2698F8988);
        type metadata accessor for MKCoordinateRegion(0);
        id v50 = v49;
        uint64_t v51 = (uint64_t *)(v0 + 176);
        sub_24E8611B8();

        uint64_t v52 = 208;
        uint64_t v53 = 200;
        uint64_t v54 = 192;
        uint64_t v55 = 184;
      }
      goto LABEL_27;
    }
  }
  uint64_t v51 = (uint64_t *)(v0 + 56);
  if (qword_2698F0F40 != -1) {
    swift_once();
  }
  uint64_t v56 = sub_24E862168();
  __swift_project_value_buffer(v56, (uint64_t)qword_2698F8968);
  uint64_t v57 = sub_24E862148();
  os_log_type_t v58 = sub_24E864248();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    uint64_t v87 = v60;
    *(_DWORD *)uint64_t v59 = 136315138;
    *(void *)(v0 + 264) = sub_24E55B02C(0xD00000000000003ELL, 0x800000024E877580, &v87);
    uint64_t v4 = (_OWORD *)(v0 + 344);
    sub_24E8643A8();
    _os_log_impl(&dword_24E553000, v57, v58, "%s - Couldn't create MKMapItem/MKMapCamera", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v60, -1, -1);
    MEMORY[0x2533435F0](v59, -1, -1);
  }

  v90.origin.x = v14;
  v90.origin.y = v16;
  v90.size.width = v18;
  v90.size.height = v20;
  *(MKCoordinateRegion *)(v0 + 216) = MKCoordinateRegionForMapRect(v90);
  sub_24E60F6EC(0, &qword_2698F8988);
  type metadata accessor for MKCoordinateRegion(0);
  sub_24E8611A8();
  uint64_t v52 = 88;
  uint64_t v53 = 80;
  uint64_t v54 = 72;
  uint64_t v55 = 64;
LABEL_27:
  uint64_t v69 = *(void *)(v0 + v55);
  uint64_t v70 = *(void *)(v0 + v54);
  uint64_t v71 = *(void *)(v0 + v53);
  uint64_t v72 = *v51;
  char v73 = *(unsigned char *)(v0 + v52);
  *(unsigned char *)(v0 + 90) = v73;
  *(void *)(v0 + 408) = v70;
  *(void *)(v0 + 416) = v71;
  *(void *)(v0 + 392) = v72;
  *(void *)(v0 + 400) = v69;
  uint64_t v74 = *(void **)(v0 + 368);
  uint64_t v75 = *(void **)(v0 + 376);
  uint64_t v76 = *(void *)(v0 + 360);
  *(void *)(v0 + 96) = v72;
  *(void *)(v0 + 104) = v69;
  *(void *)(v0 + 112) = v70;
  *(void *)(v0 + 120) = v71;
  *(unsigned char *)(v0 + 128) = v73;
  *(_OWORD *)(v0 + 16) = *v4;
  *(void *)(v0 + 32) = v76;
  uint64_t v86 = (uint64_t (*)(uint64_t, uint64_t, double, double, double, double))((char *)&dword_2698F8990
                                                                                 + dword_2698F8990);
  *(void *)(v0 + 40) = v74;
  *(void *)(v0 + 48) = v75;
  id v77 = v74;
  id v78 = v75;
  uint64_t v79 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v79;
  *uint64_t v79 = v0;
  v79[1] = sub_24E85F338;
  double v80 = *(double *)(v0 + 304);
  double v81 = *(double *)(v0 + 312);
  double v82 = *(double *)(v0 + 288);
  double v83 = *(double *)(v0 + 296);
  return v86(v0 + 96, v0 + 16, v82, v83, v80, v81);
}

uint64_t sub_24E85F338(uint64_t a1)
{
  uint64_t v4 = *v2;
  double v5 = *(void **)(*v2 + 376);
  uint64_t v6 = *(void **)(*v2 + 368);
  *(void *)(*v2 + 432) = v1;
  swift_task_dealloc();

  if (v1)
  {
    uint64_t v7 = sub_24E85F51C;
  }
  else
  {
    *(void *)(v4 + 440) = a1;
    uint64_t v7 = sub_24E85F498;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24E85F498()
{
  uint64_t v1 = *(void **)(v0 + 384);
  sub_24E860950(*(id *)(v0 + 392), *(void *)(v0 + 400), *(void *)(v0 + 408), *(void *)(v0 + 416), *(unsigned char *)(v0 + 90));

  swift_task_dealloc();
  double v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 440);
  return v2(v3);
}

uint64_t sub_24E85F51C()
{
  uint64_t v1 = *(void **)(v0 + 384);
  sub_24E860950(*(id *)(v0 + 392), *(void *)(v0 + 400), *(void *)(v0 + 408), *(void *)(v0 + 416), *(unsigned char *)(v0 + 90));

  swift_task_dealloc();
  double v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t static StaticMapGenerator.mapSnapshotter(framing:centerOffset:annotation:size:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double v15 = (uint64_t (*)(uint64_t, uint64_t, double, double, double, double))((char *)&dword_2698F8990
                                                                                 + dword_2698F8990);
  double v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *double v13 = v6;
  v13[1] = sub_24E6FD11C;
  return v15(a1, a2, a3, a4, a5, a6);
}

void sub_24E85F684(uint64_t a1, void *a2, void *a3)
{
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F89A0);
    sub_24E863F38();
  }
  else if (a2)
  {
    id v6 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F89A0);
    sub_24E863F48();
  }
  else
  {
    __break(1u);
  }
}

double StaticMapGenerator.Annotation.coordinate.getter()
{
  return *(double *)v0;
}

double StaticMapGenerator.Annotation.accuracyRadius.getter()
{
  return *(double *)(v0 + 16);
}

id StaticMapGenerator.Annotation.accuracyFillColor.getter()
{
  return *(id *)(v0 + 24);
}

id StaticMapGenerator.Annotation.accuracyStrokeColor.getter()
{
  return *(id *)(v0 + 32);
}

void __swiftcall StaticMapGenerator.Annotation.init(coordinate:accuracyRadius:accuracyFillColor:accuracyStrokeColor:)(FindMyUICore::StaticMapGenerator::Annotation *__return_ptr retstr, __C::CLLocationCoordinate2D coordinate, Swift::Double accuracyRadius, UIColor accuracyFillColor, UIColor accuracyStrokeColor)
{
  retstr->coordinate.latitude = coordinate.latitude;
  retstr->coordinate.longitude = coordinate.longitude;
  retstr->accuracyRadius = accuracyRadius;
  retstr->accuracyFillColor = accuracyFillColor;
  retstr->accuracyStrokeColor = accuracyStrokeColor;
}

id sub_24E85F758(uint64_t a1, double *a2, char a3, double a4, double a5, double a6, double a7)
{
  double v13 = *a2;
  uint64_t v14 = *((void *)a2 + 1);
  uint64_t v15 = *((void *)a2 + 2);
  uint64_t v16 = (void *)*((void *)a2 + 3);
  double v17 = (void *)*((void *)a2 + 4);
  if (a3) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 1;
  }
  id v19 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, v18);
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10998]), sel_init);
  objc_msgSend(v20, sel_setSize_, a6, a7);
  sub_24E860B64(a1, (uint64_t)v40);
  if (v41) {
    objc_msgSend(v20, sel_setRegion_, v40[0], v40[1], v40[2], v40[3]);
  }
  else {
    objc_msgSend(v20, sel_setCamera_, *(void *)&v40[0]);
  }
  objc_msgSend(v20, sel__setEdgeInsets_, 0.0, a4 + a4, a5 + a5, 0.0);
  objc_msgSend(v20, sel_setTraitCollection_, v19);
  if (v16)
  {
    double v21 = v13;
    uint64_t v22 = self;
    uint64_t v38 = v17;
    uint64_t v39 = *(void *)&v13;
    id v23 = v16;
    id v36 = v17;
    id v24 = objc_msgSend(v22, sel_circleWithCenterCoordinate_radius_, v21, *(double *)&v14, *(double *)&v15);
    uint64_t v37 = v16;
    id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F108A0]), sel_initWithCircle_, v24);
    id v26 = objc_msgSend(v23, sel_resolvedColorWithTraitCollection_, v19);
    objc_msgSend(v25, sel_setFillColor_, v26);

    if (a3) {
      uint64_t v27 = 3;
    }
    else {
      uint64_t v27 = 26;
    }
    objc_msgSend(v25, sel_setBlendMode_, v27);
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F108A0]), sel_initWithCircle_, v24);
    id v29 = objc_msgSend(v36, sel_resolvedColorWithTraitCollection_, v19);
    objc_msgSend(v28, sel_setStrokeColor_, v29);

    objc_msgSend(v28, sel_setLineWidth_, 1.0);
    objc_msgSend(v28, sel_setBlendMode_, 27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F1650);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_24E8720C0;
    *(void *)(v30 + 32) = v28;
    *(void *)(v30 + 40) = v25;
    sub_24E863E58();
    sub_24E60F6EC(0, &qword_2698F89B8);
    id v31 = v25;
    id v32 = v28;
    uint64_t v33 = (void *)sub_24E863E28();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel__setOverlayRenderers_forOverlayLevel_, v33, 0);

    sub_24E860BCC(v39, v14, v15, v37, v38);
  }
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F109A0]), sel_initWithOptions_, v20);

  return v34;
}

uint64_t sub_24E85FAF8(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  *(double *)(v6 + 360) = a5;
  *(double *)(v6 + 368) = a6;
  *(double *)(v6 + 344) = a3;
  *(double *)(v6 + 352) = a4;
  *(void *)(v6 + 336) = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F89A0);
  *(void *)(v6 + 376) = v8;
  *(void *)(v6 + 384) = *(void *)(v8 - 8);
  *(void *)(v6 + 392) = swift_task_alloc();
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 400) = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 416) = v9;
  *(void *)(v6 + 432) = *(void *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_24E85FBD8, 0, 0);
}

uint64_t sub_24E85FBD8()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void *)(v0 + 432);
  double v2 = *(double *)(v0 + 360);
  double v3 = *(double *)(v0 + 368);
  double v4 = *(double *)(v0 + 344);
  double v5 = *(double *)(v0 + 352);
  uint64_t v6 = *(void *)(v0 + 336);
  long long v7 = *(_OWORD *)(v0 + 416);
  v20[0] = *(_OWORD *)(v0 + 400);
  v20[1] = v7;
  uint64_t v21 = v1;
  id v8 = sub_24E85F758(v6, (double *)v20, 0, v4, v5, v2, v3);
  *(void *)(v0 + 440) = v8;
  if (qword_2698F0F40 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24E862168();
  *(void *)(v0 + 448) = __swift_project_value_buffer(v9, (uint64_t)qword_2698F8968);
  id v10 = sub_24E862148();
  os_log_type_t v11 = sub_24E864238();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(void *)&v20[0] = v13;
    *(_DWORD *)id v12 = 136315138;
    *(void *)(v0 + 328) = sub_24E55B02C(0xD000000000000035, 0x800000024E8775F0, (uint64_t *)v20);
    sub_24E8643A8();
    _os_log_impl(&dword_24E553000, v10, v11, "%s - Will Generate lightSnapshot", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v13, -1, -1);
    MEMORY[0x2533435F0](v12, -1, -1);
  }

  uint64_t v15 = *(void *)(v0 + 384);
  uint64_t v14 = *(void *)(v0 + 392);
  uint64_t v16 = *(void *)(v0 + 376);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 280;
  *(void *)(v0 + 24) = sub_24E85FF08;
  swift_continuation_init();
  *(void *)(v0 + 264) = v16;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 240));
  *(void *)(v0 + 456) = sub_24E60F6EC(0, &qword_2698F89A8);
  *(void *)(v0 + 464) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698F30B0);
  sub_24E863F28();
  uint64_t v18 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32);
  *(void *)(v0 + 472) = v18;
  *(void *)(v0 + 480) = (v15 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v18(boxed_opaque_existential_0, v14, v16);
  *(void *)(v0 + 208) = MEMORY[0x263EF8330];
  *(void *)(v0 + 216) = 1107296256;
  *(void *)(v0 + 224) = sub_24E85F684;
  *(void *)(v0 + 232) = &block_descriptor_8;
  objc_msgSend(v8, sel_startWithCompletionHandler_, v0 + 208);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24E85FF08()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 488) = v1;
  if (v1) {
    double v2 = sub_24E860844;
  }
  else {
    double v2 = sub_24E860018;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E860018()
{
  uint64_t v28 = v0;
  uint64_t v1 = *(void **)(v0 + 280);
  *(void *)(v0 + 496) = v1;
  id v2 = v1;
  double v3 = sub_24E862148();
  os_log_type_t v4 = sub_24E864238();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    id v24 = (id)swift_slowAlloc();
    *(void *)&v26[0] = v24;
    *(_DWORD *)uint64_t v5 = 136315394;
    *(void *)(v0 + 312) = sub_24E55B02C(0xD000000000000035, 0x800000024E8775F0, (uint64_t *)v26);
    sub_24E8643A8();
    *(_WORD *)(v5 + 12) = 2112;
    *(void *)(v0 + 320) = v2;
    id v6 = v2;
    sub_24E8643A8();
    *uint64_t v23 = v2;

    _os_log_impl(&dword_24E553000, v3, v4, "%s - Did Finish - lightSnapshot %@", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F1378);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v23, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v24, -1, -1);
    MEMORY[0x2533435F0](v5, -1, -1);
  }
  else
  {
  }
  uint64_t v7 = *(void *)(v0 + 432);
  double v8 = *(double *)(v0 + 360);
  double v9 = *(double *)(v0 + 368);
  double v10 = *(double *)(v0 + 344);
  double v11 = *(double *)(v0 + 352);
  uint64_t v12 = *(void *)(v0 + 336);
  long long v13 = *(_OWORD *)(v0 + 416);
  v26[0] = *(_OWORD *)(v0 + 400);
  v26[1] = v13;
  uint64_t v27 = v7;
  id v25 = sub_24E85F758(v12, (double *)v26, 1, v10, v11, v8, v9);
  *(void *)(v0 + 504) = v25;
  uint64_t v14 = sub_24E862148();
  os_log_type_t v15 = sub_24E864238();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(void *)&v26[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v0 + 304) = sub_24E55B02C(0xD000000000000035, 0x800000024E8775F0, (uint64_t *)v26);
    sub_24E8643A8();
    _os_log_impl(&dword_24E553000, v14, v15, "%s - Will Generate darkSnapshot", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v17, -1, -1);
    MEMORY[0x2533435F0](v16, -1, -1);
  }

  uint64_t v18 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v0 + 472);
  uint64_t v19 = *(void *)(v0 + 392);
  uint64_t v20 = *(void *)(v0 + 376);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 120) = v0 + 272;
  *(void *)(v0 + 88) = sub_24E860460;
  swift_continuation_init();
  *(void *)(v0 + 200) = v20;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 176));
  sub_24E863F28();
  v18(boxed_opaque_existential_0, v19, v20);
  *(void *)(v0 + 144) = MEMORY[0x263EF8330];
  *(void *)(v0 + 152) = 1107296256;
  *(void *)(v0 + 160) = sub_24E85F684;
  *(void *)(v0 + 168) = &block_descriptor_7;
  objc_msgSend(v25, sel_startWithCompletionHandler_, v0 + 144);
  return MEMORY[0x270FA23F0](v0 + 80);
}

uint64_t sub_24E860460()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 512) = v1;
  if (v1) {
    id v2 = sub_24E8608C0;
  }
  else {
    id v2 = sub_24E860570;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E860570()
{
  uint64_t v18 = v0;
  id v1 = *(id *)(v0 + 272);
  id v2 = sub_24E862148();
  os_log_type_t v3 = sub_24E864238();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    os_log_type_t v15 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = v16;
    *(_DWORD *)uint64_t v4 = 136315394;
    *(void *)(v0 + 288) = sub_24E55B02C(0xD000000000000035, 0x800000024E8775F0, &v17);
    sub_24E8643A8();
    *(_WORD *)(v4 + 12) = 2112;
    *(void *)(v0 + 296) = v1;
    id v5 = v1;
    sub_24E8643A8();
    *os_log_type_t v15 = v1;

    _os_log_impl(&dword_24E553000, v2, v3, "%s - Did Finish - darkSnapshot %@", (uint8_t *)v4, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F1378);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533435F0](v16, -1, -1);
    MEMORY[0x2533435F0](v4, -1, -1);
  }
  else
  {
  }
  id v6 = objc_msgSend(*(id *)(v0 + 496), sel_image);
  id v7 = objc_msgSend(v6, sel_imageAsset);
  if (v7)
  {
    double v8 = v7;
    id v9 = objc_msgSend(v1, sel_image);
    id v10 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 2);
    objc_msgSend(v8, sel_registerImage_withTraitCollection_, v9, v10);
  }
  double v11 = *(void **)(v0 + 504);
  uint64_t v12 = *(void **)(v0 + 440);

  swift_task_dealloc();
  long long v13 = *(uint64_t (**)(id))(v0 + 8);
  return v13(v6);
}

uint64_t sub_24E860844()
{
  id v1 = *(void **)(v0 + 440);
  swift_willThrow();

  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24E8608C0()
{
  id v1 = (void *)v0[63];
  id v2 = (void *)v0[62];
  os_log_type_t v3 = (void *)v0[55];
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void sub_24E860950(id a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if ((a5 & 1) == 0) {
}
  }

ValueMetadata *type metadata accessor for StaticMapGenerator()
{
  return &type metadata for StaticMapGenerator;
}

void destroy for StaticMapGenerator.Annotation(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for StaticMapGenerator.Annotation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  os_log_type_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void *assignWithCopy for StaticMapGenerator.Annotation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v4 = (void *)a2[3];
  id v5 = (void *)a1[3];
  a1[3] = v4;
  id v6 = v4;

  id v7 = (void *)a2[4];
  double v8 = (void *)a1[4];
  a1[4] = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for StaticMapGenerator.Annotation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for StaticMapGenerator.Annotation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StaticMapGenerator.Annotation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StaticMapGenerator.Annotation()
{
  return &type metadata for StaticMapGenerator.Annotation;
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  return sub_24E55DD88(a2 + 32, a1 + 32);
}

uint64_t block_destroy_helper_8(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
}

uint64_t sub_24E860B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698F89B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24E860BCC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  if (a4)
  {
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_24E860C38()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2698F89C0 = (uint64_t)result;
  return result;
}

uint64_t sub_24E860C90(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906EF8);
}

uint64_t sub_24E860CBC(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906F10);
}

uint64_t sub_24E860CE0(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906F28);
}

uint64_t sub_24E860D04(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906F40);
}

uint64_t sub_24E860D28(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906F58);
}

uint64_t sub_24E860D4C(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906F70);
}

uint64_t sub_24E860D70(uint64_t a1)
{
  return sub_24E860D94(a1, qword_269906F88);
}

uint64_t sub_24E860D94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24E862128();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_2698F0F48 != -1) {
    swift_once();
  }
  id v4 = (id)qword_2698F89C0;
  return sub_24E862118();
}

uint64_t sub_24E860E38()
{
  return MEMORY[0x270F28BB8]();
}

uint64_t sub_24E860E48()
{
  return MEMORY[0x270F28C18]();
}

uint64_t sub_24E860E58()
{
  return MEMORY[0x270F28C20]();
}

uint64_t sub_24E860E78()
{
  return MEMORY[0x270F28CB0]();
}

uint64_t sub_24E860E88()
{
  return MEMORY[0x270F28CB8]();
}

uint64_t sub_24E860E98()
{
  return MEMORY[0x270F28CC8]();
}

uint64_t sub_24E860EA8()
{
  return MEMORY[0x270F28D68]();
}

uint64_t sub_24E860EB8()
{
  return MEMORY[0x270F28F48]();
}

uint64_t sub_24E860EC8()
{
  return MEMORY[0x270F28F50]();
}

uint64_t sub_24E860ED8()
{
  return MEMORY[0x270F28F58]();
}

uint64_t sub_24E860EE8()
{
  return MEMORY[0x270F28F60]();
}

uint64_t sub_24E860EF8()
{
  return MEMORY[0x270F28F68]();
}

uint64_t sub_24E860F08()
{
  return MEMORY[0x270F28F70]();
}

uint64_t sub_24E860F18()
{
  return MEMORY[0x270F28F78]();
}

uint64_t sub_24E860F28()
{
  return MEMORY[0x270F28F80]();
}

uint64_t sub_24E860F38()
{
  return MEMORY[0x270F28F88]();
}

uint64_t sub_24E860F48()
{
  return MEMORY[0x270F28F90]();
}

uint64_t sub_24E860F58()
{
  return MEMORY[0x270F28F98]();
}

uint64_t sub_24E860F68()
{
  return MEMORY[0x270F28FA0]();
}

uint64_t sub_24E860F78()
{
  return MEMORY[0x270F28FA8]();
}

uint64_t sub_24E860F88()
{
  return MEMORY[0x270F28FB0]();
}

uint64_t sub_24E860F98()
{
  return MEMORY[0x270F28FB8]();
}

uint64_t sub_24E860FA8()
{
  return MEMORY[0x270F28FC0]();
}

uint64_t sub_24E860FB8()
{
  return MEMORY[0x270F28FC8]();
}

uint64_t sub_24E860FC8()
{
  return MEMORY[0x270F28FD0]();
}

uint64_t sub_24E860FD8()
{
  return MEMORY[0x270F28FD8]();
}

uint64_t sub_24E860FE8()
{
  return MEMORY[0x270F28FE0]();
}

uint64_t sub_24E860FF8()
{
  return MEMORY[0x270F28FE8]();
}

uint64_t sub_24E861008()
{
  return MEMORY[0x270F28FF0]();
}

uint64_t sub_24E861018()
{
  return MEMORY[0x270F28FF8]();
}

uint64_t sub_24E861028()
{
  return MEMORY[0x270F29000]();
}

uint64_t sub_24E861038()
{
  return MEMORY[0x270F29008]();
}

uint64_t sub_24E861048()
{
  return MEMORY[0x270F29010]();
}

uint64_t sub_24E861058()
{
  return MEMORY[0x270F29018]();
}

uint64_t sub_24E861068()
{
  return MEMORY[0x270F29020]();
}

uint64_t sub_24E861078()
{
  return MEMORY[0x270F29028]();
}

uint64_t sub_24E861088()
{
  return MEMORY[0x270F29030]();
}

uint64_t sub_24E861098()
{
  return MEMORY[0x270F29038]();
}

uint64_t sub_24E8610A8()
{
  return MEMORY[0x270F29040]();
}

uint64_t sub_24E8610B8()
{
  return MEMORY[0x270F29048]();
}

uint64_t sub_24E8610C8()
{
  return MEMORY[0x270F29050]();
}

uint64_t sub_24E8610D8()
{
  return MEMORY[0x270F29058]();
}

uint64_t sub_24E8610E8()
{
  return MEMORY[0x270F29060]();
}

uint64_t sub_24E8610F8()
{
  return MEMORY[0x270F29068]();
}

uint64_t sub_24E861108()
{
  return MEMORY[0x270F29070]();
}

uint64_t sub_24E861118()
{
  return MEMORY[0x270F29078]();
}

uint64_t sub_24E861128()
{
  return MEMORY[0x270F29080]();
}

uint64_t sub_24E861138()
{
  return MEMORY[0x270F29088]();
}

uint64_t sub_24E861148()
{
  return MEMORY[0x270F29090]();
}

uint64_t sub_24E861158()
{
  return MEMORY[0x270F29098]();
}

uint64_t sub_24E861168()
{
  return MEMORY[0x270F290A0]();
}

uint64_t sub_24E861178()
{
  return MEMORY[0x270F290A8]();
}

uint64_t sub_24E861188()
{
  return MEMORY[0x270F290B0]();
}

uint64_t sub_24E861198()
{
  return MEMORY[0x270F290B8]();
}

uint64_t sub_24E8611A8()
{
  return MEMORY[0x270F290C0]();
}

uint64_t sub_24E8611B8()
{
  return MEMORY[0x270F290C8]();
}

uint64_t sub_24E8611C8()
{
  return MEMORY[0x270F290D0]();
}

uint64_t sub_24E8611D8()
{
  return MEMORY[0x270F290D8]();
}

uint64_t _s12FindMyUICore23PeopleLocationsProviderC12SubscriptionV10IdentifierV2eeoiySbAG_AGtFZ_0()
{
  return MEMORY[0x270F290E0]();
}

uint64_t sub_24E8611F8()
{
  return MEMORY[0x270F290E8]();
}

uint64_t sub_24E861208()
{
  return MEMORY[0x270F290F0]();
}

uint64_t sub_24E861218()
{
  return MEMORY[0x270F290F8]();
}

uint64_t sub_24E861228()
{
  return MEMORY[0x270F29100]();
}

uint64_t sub_24E861238()
{
  return MEMORY[0x270F29108]();
}

uint64_t sub_24E861248()
{
  return MEMORY[0x270F29110]();
}

uint64_t sub_24E861258()
{
  return MEMORY[0x270F29118]();
}

uint64_t sub_24E861268()
{
  return MEMORY[0x270F29120]();
}

uint64_t _s12FindMyUICore22MapsDirectionsProviderC10InputValueO6OriginV2eeoiySbAG_AGtFZ_0()
{
  return MEMORY[0x270F29128]();
}

uint64_t sub_24E861288()
{
  return MEMORY[0x270F29130]();
}

uint64_t sub_24E861298()
{
  return MEMORY[0x270F29138]();
}

uint64_t sub_24E8612A8()
{
  return MEMORY[0x270EEDD40]();
}

uint64_t sub_24E8612B8()
{
  return MEMORY[0x270EEDD58]();
}

uint64_t sub_24E8612C8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24E8612D8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24E8612E8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24E8612F8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24E861308()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24E861318()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24E861328()
{
  return MEMORY[0x270EEDF60]();
}

uint64_t sub_24E861338()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_24E861348()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_24E861358()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_24E861368()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_24E861378()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24E861388()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24E861398()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_24E8613A8()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_24E8613B8()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_24E8613C8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_24E8613D8()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_24E8613E8()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_24E8613F8()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_24E861408()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_24E861418()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_24E861428()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_24E861438()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_24E861448()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_24E861458()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_24E861468()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_24E861478()
{
  return MEMORY[0x270EEE988]();
}

uint64_t sub_24E861488()
{
  return MEMORY[0x270EEE9C0]();
}

uint64_t sub_24E861498()
{
  return MEMORY[0x270EEF1F0]();
}

uint64_t sub_24E8614A8()
{
  return MEMORY[0x270EEF1F8]();
}

uint64_t sub_24E8614B8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24E8614C8()
{
  return MEMORY[0x270EEFB68]();
}

uint64_t sub_24E8614D8()
{
  return MEMORY[0x270EEFB70]();
}

uint64_t sub_24E8614E8()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_24E8614F8()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24E861508()
{
  return MEMORY[0x270EEFC90]();
}

uint64_t sub_24E861518()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24E861528()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24E861538()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24E861548()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_24E861558()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E861568()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24E861578()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24E861588()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_24E861598()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24E8615A8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24E8615B8()
{
  return MEMORY[0x270EF08E8]();
}

uint64_t sub_24E8615C8()
{
  return MEMORY[0x270EF08F0]();
}

uint64_t sub_24E8615D8()
{
  return MEMORY[0x270EF0908]();
}

uint64_t sub_24E8615E8()
{
  return MEMORY[0x270EF0910]();
}

uint64_t sub_24E8615F8()
{
  return MEMORY[0x270EF0920]();
}

uint64_t sub_24E861608()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24E861618()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24E861628()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24E861638()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_24E861648()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_24E861658()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24E861668()
{
  return MEMORY[0x270EF0B28]();
}

uint64_t sub_24E861678()
{
  return MEMORY[0x270EF0B30]();
}

uint64_t sub_24E861688()
{
  return MEMORY[0x270EF0B38]();
}

uint64_t sub_24E861698()
{
  return MEMORY[0x270EF0B50]();
}

uint64_t sub_24E8616A8()
{
  return MEMORY[0x270EF0B68]();
}

uint64_t sub_24E8616B8()
{
  return MEMORY[0x270EF0B80]();
}

uint64_t sub_24E8616C8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24E8616D8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24E8616E8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24E8616F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E861708()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24E861718()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24E861728()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24E861738()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24E861748()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24E861758()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24E861768()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_24E861778()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24E861788()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_24E861798()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24E8617A8()
{
  return MEMORY[0x270FA11C0]();
}

uint64_t sub_24E8617B8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24E8617C8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24E8617D8()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_24E8617E8()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_24E8617F8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24E861808()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24E861818()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_24E861828()
{
  return MEMORY[0x270FA06E0]();
}

uint64_t sub_24E861838()
{
  return MEMORY[0x270FA06E8]();
}

uint64_t sub_24E861848()
{
  return MEMORY[0x270FA0700]();
}

uint64_t sub_24E861858()
{
  return MEMORY[0x270FA0708]();
}

uint64_t sub_24E861868()
{
  return MEMORY[0x270FA0710]();
}

uint64_t sub_24E861878()
{
  return MEMORY[0x270FA0718]();
}

uint64_t sub_24E861888()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_24E861898()
{
  return MEMORY[0x270F29208]();
}

uint64_t sub_24E8618A8()
{
  return MEMORY[0x270F29218]();
}

uint64_t sub_24E8618B8()
{
  return MEMORY[0x270F29228]();
}

uint64_t sub_24E8618C8()
{
  return MEMORY[0x270F29238]();
}

uint64_t sub_24E8618D8()
{
  return MEMORY[0x270F29270]();
}

uint64_t sub_24E8618E8()
{
  return MEMORY[0x270F29280]();
}

uint64_t sub_24E8618F8()
{
  return MEMORY[0x270F292A0]();
}

uint64_t sub_24E861908()
{
  return MEMORY[0x270F292A8]();
}

uint64_t sub_24E861918()
{
  return MEMORY[0x270F292C0]();
}

uint64_t sub_24E861928()
{
  return MEMORY[0x270F292C8]();
}

uint64_t sub_24E861938()
{
  return MEMORY[0x270F292D0]();
}

uint64_t sub_24E861948()
{
  return MEMORY[0x270F292D8]();
}

uint64_t sub_24E861958()
{
  return MEMORY[0x270F29300]();
}

uint64_t sub_24E861968()
{
  return MEMORY[0x270F29318]();
}

uint64_t sub_24E861978()
{
  return MEMORY[0x270F29320]();
}

uint64_t sub_24E861988()
{
  return MEMORY[0x270F29328]();
}

uint64_t sub_24E861998()
{
  return MEMORY[0x270F29330]();
}

uint64_t sub_24E8619A8()
{
  return MEMORY[0x270F29348]();
}

uint64_t sub_24E8619B8()
{
  return MEMORY[0x270F29350]();
}

uint64_t sub_24E8619C8()
{
  return MEMORY[0x270F29368]();
}

uint64_t sub_24E8619D8()
{
  return MEMORY[0x270F29370]();
}

uint64_t sub_24E8619E8()
{
  return MEMORY[0x270F29510]();
}

uint64_t sub_24E8619F8()
{
  return MEMORY[0x270F29528]();
}

uint64_t sub_24E861A08()
{
  return MEMORY[0x270F29548]();
}

uint64_t sub_24E861A18()
{
  return MEMORY[0x270F29568]();
}

uint64_t sub_24E861A28()
{
  return MEMORY[0x270F29588]();
}

uint64_t sub_24E861A38()
{
  return MEMORY[0x270F29590]();
}

uint64_t sub_24E861A48()
{
  return MEMORY[0x270F295A0]();
}

uint64_t sub_24E861A58()
{
  return MEMORY[0x270F295A8]();
}

uint64_t sub_24E861A68()
{
  return MEMORY[0x270F295B0]();
}

uint64_t sub_24E861A78()
{
  return MEMORY[0x270F29140]();
}

uint64_t sub_24E861A88()
{
  return MEMORY[0x270F295B8]();
}

uint64_t sub_24E861A98()
{
  return MEMORY[0x270F295C8]();
}

uint64_t sub_24E861AA8()
{
  return MEMORY[0x270F295F8]();
}

uint64_t sub_24E861AB8()
{
  return MEMORY[0x270F29600]();
}

uint64_t sub_24E861B18()
{
  return MEMORY[0x270F296A8]();
}

uint64_t sub_24E861BB8()
{
  return MEMORY[0x270F29708]();
}

uint64_t sub_24E861C08()
{
  return MEMORY[0x270F29740]();
}

uint64_t sub_24E861C18()
{
  return MEMORY[0x270F29768]();
}

uint64_t sub_24E861C38()
{
  return MEMORY[0x270F29148]();
}

uint64_t sub_24E861C48()
{
  return MEMORY[0x270F29790]();
}

uint64_t sub_24E861C58()
{
  return MEMORY[0x270F29798]();
}

uint64_t sub_24E861C68()
{
  return MEMORY[0x270F297A0]();
}

uint64_t sub_24E861C78()
{
  return MEMORY[0x270F297B0]();
}

uint64_t sub_24E861C88()
{
  return MEMORY[0x270F297C0]();
}

uint64_t sub_24E861C98()
{
  return MEMORY[0x270F297C8]();
}

uint64_t sub_24E861CA8()
{
  return MEMORY[0x270F297E0]();
}

uint64_t sub_24E861CB8()
{
  return MEMORY[0x270F297E8]();
}

uint64_t sub_24E861CC8()
{
  return MEMORY[0x270F297F0]();
}

uint64_t sub_24E861CD8()
{
  return MEMORY[0x270F297F8]();
}

uint64_t sub_24E861CE8()
{
  return MEMORY[0x270F29800]();
}

uint64_t sub_24E861CF8()
{
  return MEMORY[0x270F29808]();
}

uint64_t sub_24E861D08()
{
  return MEMORY[0x270F29858]();
}

uint64_t sub_24E861D18()
{
  return MEMORY[0x270F29888]();
}

uint64_t sub_24E861D28()
{
  return MEMORY[0x270F26E60]();
}

uint64_t sub_24E861D38()
{
  return MEMORY[0x270F29890]();
}

uint64_t sub_24E861D48()
{
  return MEMORY[0x270F29898]();
}

uint64_t sub_24E861D58()
{
  return MEMORY[0x270F298A0]();
}

uint64_t sub_24E861D68()
{
  return MEMORY[0x270F298A8]();
}

uint64_t sub_24E861D78()
{
  return MEMORY[0x270F07F20]();
}

uint64_t sub_24E861D88()
{
  return MEMORY[0x270F07F30]();
}

uint64_t sub_24E861D98()
{
  return MEMORY[0x270F07F38]();
}

uint64_t sub_24E861DA8()
{
  return MEMORY[0x270F07F48]();
}

uint64_t sub_24E861DB8()
{
  return MEMORY[0x270F07F58]();
}

uint64_t sub_24E861DC8()
{
  return MEMORY[0x270F07F60]();
}

uint64_t sub_24E861DD8()
{
  return MEMORY[0x270F07F70]();
}

uint64_t sub_24E861DE8()
{
  return MEMORY[0x270F07F78]();
}

uint64_t sub_24E861DF8()
{
  return MEMORY[0x270F07F80]();
}

uint64_t sub_24E861E08()
{
  return MEMORY[0x270F07F88]();
}

uint64_t sub_24E861E18()
{
  return MEMORY[0x270F07F90]();
}

uint64_t sub_24E861E28()
{
  return MEMORY[0x270F07FA0]();
}

uint64_t sub_24E861E38()
{
  return MEMORY[0x270F07FA8]();
}

uint64_t sub_24E861E48()
{
  return MEMORY[0x270F07FB8]();
}

uint64_t sub_24E861E58()
{
  return MEMORY[0x270F07FC0]();
}

uint64_t sub_24E861E68()
{
  return MEMORY[0x270F07FC8]();
}

uint64_t sub_24E861E78()
{
  return MEMORY[0x270F07FD0]();
}

uint64_t sub_24E861E88()
{
  return MEMORY[0x270F07FD8]();
}

uint64_t sub_24E861E98()
{
  return MEMORY[0x270F07FE0]();
}

uint64_t sub_24E861EA8()
{
  return MEMORY[0x270F07FE8]();
}

uint64_t sub_24E861EB8()
{
  return MEMORY[0x270F07FF0]();
}

uint64_t sub_24E861EC8()
{
  return MEMORY[0x270F07FF8]();
}

uint64_t sub_24E861ED8()
{
  return MEMORY[0x270F08000]();
}

uint64_t sub_24E861EE8()
{
  return MEMORY[0x270F08008]();
}

uint64_t sub_24E861EF8()
{
  return MEMORY[0x270F08018]();
}

uint64_t sub_24E861F08()
{
  return MEMORY[0x270F08020]();
}

uint64_t sub_24E861F18()
{
  return MEMORY[0x270F08028]();
}

uint64_t sub_24E861F28()
{
  return MEMORY[0x270F08030]();
}

uint64_t sub_24E861F38()
{
  return MEMORY[0x270F08038]();
}

uint64_t sub_24E861F48()
{
  return MEMORY[0x270F08040]();
}

uint64_t sub_24E861F58()
{
  return MEMORY[0x270F08050]();
}

uint64_t sub_24E861F68()
{
  return MEMORY[0x270F08058]();
}

uint64_t sub_24E861F78()
{
  return MEMORY[0x270F08060]();
}

uint64_t sub_24E861F88()
{
  return MEMORY[0x270F08068]();
}

uint64_t sub_24E861F98()
{
  return MEMORY[0x270F08070]();
}

uint64_t sub_24E861FA8()
{
  return MEMORY[0x270F08078]();
}

uint64_t sub_24E861FB8()
{
  return MEMORY[0x270F08080]();
}

uint64_t sub_24E861FC8()
{
  return MEMORY[0x270F08098]();
}

uint64_t sub_24E861FD8()
{
  return MEMORY[0x270F080A0]();
}

uint64_t sub_24E861FE8()
{
  return MEMORY[0x270F080A8]();
}

uint64_t sub_24E861FF8()
{
  return MEMORY[0x270F080B0]();
}

uint64_t sub_24E862008()
{
  return MEMORY[0x270F080B8]();
}

uint64_t sub_24E862018()
{
  return MEMORY[0x270F080C0]();
}

uint64_t sub_24E862028()
{
  return MEMORY[0x270F080C8]();
}

uint64_t sub_24E862038()
{
  return MEMORY[0x270F080D0]();
}

uint64_t sub_24E862048()
{
  return MEMORY[0x270F08108]();
}

uint64_t sub_24E862058()
{
  return MEMORY[0x270F08110]();
}

uint64_t sub_24E862068()
{
  return MEMORY[0x270F08118]();
}

uint64_t sub_24E862078()
{
  return MEMORY[0x270F08128]();
}

uint64_t sub_24E862088()
{
  return MEMORY[0x270F08140]();
}

uint64_t sub_24E862098()
{
  return MEMORY[0x270F08148]();
}

uint64_t sub_24E8620A8()
{
  return MEMORY[0x270F08150]();
}

uint64_t sub_24E8620B8()
{
  return MEMORY[0x270F18248]();
}

uint64_t sub_24E8620C8()
{
  return MEMORY[0x270F18288]();
}

uint64_t sub_24E8620D8()
{
  return MEMORY[0x270F18290]();
}

uint64_t sub_24E8620E8()
{
  return MEMORY[0x270F18298]();
}

uint64_t sub_24E8620F8()
{
  return MEMORY[0x270F182A8]();
}

uint64_t sub_24E862108()
{
  return MEMORY[0x270F182B0]();
}

uint64_t sub_24E862118()
{
  return MEMORY[0x270EEB1B0]();
}

uint64_t sub_24E862128()
{
  return MEMORY[0x270EEB1C0]();
}

uint64_t sub_24E862138()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24E862148()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E862158()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E862168()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E862178()
{
  return MEMORY[0x270EE38A8]();
}

uint64_t sub_24E862188()
{
  return MEMORY[0x270EE39B0]();
}

uint64_t sub_24E862198()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24E8621A8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_24E8621B8()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_24E8621C8()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_24E8621D8()
{
  return MEMORY[0x270EE3D90]();
}

uint64_t sub_24E8621E8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24E8621F8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24E862208()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24E862218()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24E862228()
{
  return MEMORY[0x270EE3EB8]();
}

uint64_t sub_24E862238()
{
  return MEMORY[0x270EE3FA0]();
}

uint64_t sub_24E862248()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_24E862258()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24E862268()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_24E862278()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24E862288()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24E862298()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24E8622A8()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_24E8622B8()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24E8622C8()
{
  return MEMORY[0x270EFEEB8]();
}

uint64_t sub_24E8622D8()
{
  return MEMORY[0x270EFEEC0]();
}

uint64_t sub_24E8622E8()
{
  return MEMORY[0x270EFEED0]();
}

uint64_t sub_24E8622F8()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_24E862308()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24E862318()
{
  return MEMORY[0x270EFF0E8]();
}

uint64_t sub_24E862328()
{
  return MEMORY[0x270EFF0F8]();
}

uint64_t sub_24E862338()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24E862348()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_24E862358()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24E862368()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_24E862378()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_24E862388()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_24E862398()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_24E8623A8()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_24E8623B8()
{
  return MEMORY[0x270EFF4F0]();
}

uint64_t sub_24E8623C8()
{
  return MEMORY[0x270EFF550]();
}

uint64_t sub_24E8623D8()
{
  return MEMORY[0x270EFF558]();
}

uint64_t sub_24E8623E8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24E8623F8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_24E862408()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_24E862418()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_24E862428()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_24E862438()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24E862448()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_24E862458()
{
  return MEMORY[0x270EFF710]();
}

uint64_t sub_24E862468()
{
  return MEMORY[0x270EFF728]();
}

uint64_t sub_24E862478()
{
  return MEMORY[0x270EFF738]();
}

uint64_t sub_24E862488()
{
  return MEMORY[0x270EFF748]();
}

uint64_t sub_24E862498()
{
  return MEMORY[0x270EFF758]();
}

uint64_t sub_24E8624A8()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_24E8624B8()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_24E8624C8()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_24E8624E8()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_24E8624F8()
{
  return MEMORY[0x270EFFCB0]();
}

uint64_t sub_24E862508()
{
  return MEMORY[0x270EFFCB8]();
}

uint64_t sub_24E862518()
{
  return MEMORY[0x270EFFCD0]();
}

uint64_t sub_24E862528()
{
  return MEMORY[0x270EFFCD8]();
}

uint64_t sub_24E862538()
{
  return MEMORY[0x270EFFCF8]();
}

uint64_t sub_24E862548()
{
  return MEMORY[0x270EFFD00]();
}

uint64_t sub_24E862558()
{
  return MEMORY[0x270EFFD08]();
}

uint64_t sub_24E862568()
{
  return MEMORY[0x270EFFD48]();
}

uint64_t sub_24E862578()
{
  return MEMORY[0x270EFFD60]();
}

uint64_t sub_24E862588()
{
  return MEMORY[0x270EFFDC0]();
}

uint64_t sub_24E862598()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_24E8625A8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24E8625B8()
{
  return MEMORY[0x270EFFF48]();
}

uint64_t sub_24E8625C8()
{
  return MEMORY[0x270F00040]();
}

uint64_t sub_24E8625D8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_24E8625E8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24E8625F8()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_24E862608()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24E862618()
{
  return MEMORY[0x270F00228]();
}

uint64_t sub_24E862628()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_24E862638()
{
  return MEMORY[0x270F003B8]();
}

uint64_t sub_24E862648()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_24E862658()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_24E862668()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_24E862678()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_24E862688()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24E862698()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_24E8626A8()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24E8626B8()
{
  return MEMORY[0x270F00698]();
}

uint64_t sub_24E8626C8()
{
  return MEMORY[0x270F006C0]();
}

uint64_t sub_24E8626D8()
{
  return MEMORY[0x270F006C8]();
}

uint64_t sub_24E8626E8()
{
  return MEMORY[0x270F006D8]();
}

uint64_t sub_24E8626F8()
{
  return MEMORY[0x270F006E0]();
}

uint64_t sub_24E862708()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_24E862718()
{
  return MEMORY[0x270F006F8]();
}

uint64_t sub_24E862728()
{
  return MEMORY[0x270F00700]();
}

uint64_t sub_24E862738()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_24E862748()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_24E862758()
{
  return MEMORY[0x270F00918]();
}

uint64_t sub_24E862768()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_24E862778()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_24E862788()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_24E862798()
{
  return MEMORY[0x270F009D8]();
}

uint64_t sub_24E8627A8()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_24E8627B8()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_24E8627C8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24E8627D8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24E8627E8()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_24E8627F8()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_24E862808()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_24E862818()
{
  return MEMORY[0x270F00B30]();
}

uint64_t sub_24E862828()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_24E862838()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_24E862848()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_24E862858()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_24E862868()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_24E862878()
{
  return MEMORY[0x270F00BD0]();
}

uint64_t sub_24E862888()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24E862898()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24E8628A8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24E8628B8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24E8628C8()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_24E8628D8()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_24E8628E8()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_24E8628F8()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_24E862908()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_24E862918()
{
  return MEMORY[0x270F073D8]();
}

uint64_t sub_24E862928()
{
  return MEMORY[0x270F073E0]();
}

uint64_t sub_24E862938()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_24E862948()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_24E862958()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24E862968()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24E862978()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_24E862988()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_24E862998()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24E8629A8()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24E8629B8()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_24E8629C8()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_24E8629D8()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_24E8629E8()
{
  return MEMORY[0x270F01028]();
}

uint64_t sub_24E8629F8()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_24E862A08()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24E862A18()
{
  return MEMORY[0x270F01078]();
}

uint64_t sub_24E862A28()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_24E862A38()
{
  return MEMORY[0x270F01210]();
}

uint64_t sub_24E862A48()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24E862A58()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24E862A68()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24E862A78()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24E862A88()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24E862A98()
{
  return MEMORY[0x270F012F0]();
}

uint64_t sub_24E862AA8()
{
  return MEMORY[0x270F01300]();
}

uint64_t sub_24E862AB8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24E862AC8()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_24E862AD8()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_24E862AE8()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_24E862AF8()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_24E862B08()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24E862B18()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24E862B28()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_24E862B38()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_24E862B48()
{
  return MEMORY[0x270F01618]();
}

uint64_t sub_24E862B58()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_24E862B68()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_24E862B78()
{
  return MEMORY[0x270F01668]();
}

uint64_t sub_24E862B88()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_24E862B98()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24E862BA8()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24E862BB8()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24E862BD8()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24E862BE8()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24E862BF8()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24E862C08()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24E862C18()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24E862C28()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24E862C48()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_24E862C58()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24E862C68()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24E862C78()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24E862C88()
{
  return MEMORY[0x270F01868]();
}

uint64_t sub_24E862C98()
{
  return MEMORY[0x270F01870]();
}

uint64_t sub_24E862CA8()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_24E862CB8()
{
  return MEMORY[0x270F01A60]();
}

uint64_t sub_24E862CC8()
{
  return MEMORY[0x270F01A70]();
}

uint64_t sub_24E862CD8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_24E862CE8()
{
  return MEMORY[0x270F01AE0]();
}

uint64_t sub_24E862CF8()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_24E862D08()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_24E862D18()
{
  return MEMORY[0x270F01C38]();
}

uint64_t sub_24E862D28()
{
  return MEMORY[0x270F01C40]();
}

uint64_t sub_24E862D38()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24E862D48()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24E862D58()
{
  return MEMORY[0x270F01D48]();
}

uint64_t sub_24E862D68()
{
  return MEMORY[0x270F01D58]();
}

uint64_t sub_24E862D78()
{
  return MEMORY[0x270F01D60]();
}

uint64_t sub_24E862D88()
{
  return MEMORY[0x270F01D68]();
}

uint64_t sub_24E862D98()
{
  return MEMORY[0x270F01D70]();
}

uint64_t sub_24E862DA8()
{
  return MEMORY[0x270F01D78]();
}

uint64_t sub_24E862DB8()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_24E862DC8()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_24E862DD8()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_24E862DE8()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_24E862DF8()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_24E862E08()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_24E862E18()
{
  return MEMORY[0x270F02088]();
}

uint64_t sub_24E862E28()
{
  return MEMORY[0x270F02098]();
}

uint64_t sub_24E862E38()
{
  return MEMORY[0x270F020A0]();
}

uint64_t sub_24E862E48()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_24E862E58()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_24E862E68()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_24E862E78()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_24E862E88()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_24E862E98()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24E862EA8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24E862EB8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24E862ED8()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24E862EE8()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24E862EF8()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24E862F18()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_24E862F28()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_24E862F38()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_24E862F48()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_24E862F58()
{
  return MEMORY[0x270F02900]();
}

uint64_t sub_24E862F68()
{
  return MEMORY[0x270F02908]();
}

uint64_t sub_24E862F78()
{
  return MEMORY[0x270F02910]();
}

uint64_t sub_24E862F88()
{
  return MEMORY[0x270F02918]();
}

uint64_t sub_24E862F98()
{
  return MEMORY[0x270F02920]();
}

uint64_t sub_24E862FA8()
{
  return MEMORY[0x270F02938]();
}

uint64_t sub_24E862FB8()
{
  return MEMORY[0x270F02940]();
}

uint64_t sub_24E862FC8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24E862FD8()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_24E862FE8()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_24E862FF8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_24E863008()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24E863018()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24E863028()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24E863038()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24E863048()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_24E863058()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_24E863068()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24E863078()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_24E863088()
{
  return MEMORY[0x270F02AA8]();
}

uint64_t sub_24E863098()
{
  return MEMORY[0x270F02AD8]();
}

uint64_t sub_24E8630A8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24E8630B8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24E8630C8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_24E8630D8()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_24E8630E8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24E8630F8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24E863108()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24E863118()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24E863128()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_24E863138()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24E863148()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_24E863158()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_24E863168()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_24E863178()
{
  return MEMORY[0x270F02DF0]();
}

uint64_t sub_24E863188()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_24E863198()
{
  return MEMORY[0x270F02E08]();
}

uint64_t sub_24E8631A8()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_24E8631B8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24E8631C8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24E8631D8()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_24E8631E8()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_24E8631F8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24E863208()
{
  return MEMORY[0x270F03210]();
}

uint64_t sub_24E863218()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24E863228()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24E863238()
{
  return MEMORY[0x270F08188]();
}

uint64_t sub_24E863248()
{
  return MEMORY[0x270F08198]();
}

uint64_t sub_24E863258()
{
  return MEMORY[0x270F081A0]();
}

uint64_t sub_24E863268()
{
  return MEMORY[0x270F081B0]();
}

uint64_t sub_24E863278()
{
  return MEMORY[0x270F081C0]();
}

uint64_t sub_24E863288()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24E863298()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24E8632A8()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_24E8632B8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24E8632C8()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_24E8632D8()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_24E8632E8()
{
  return MEMORY[0x270F03650]();
}

uint64_t sub_24E8632F8()
{
  return MEMORY[0x270F036A8]();
}

uint64_t sub_24E863308()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24E863318()
{
  return MEMORY[0x270F03708]();
}

uint64_t sub_24E863328()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_24E863338()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_24E863348()
{
  return MEMORY[0x270F037D8]();
}

uint64_t sub_24E863358()
{
  return MEMORY[0x270F037E0]();
}

uint64_t sub_24E863368()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_24E863378()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_24E863388()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_24E863398()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_24E8633A8()
{
  return MEMORY[0x270F03B70]();
}

uint64_t sub_24E8633B8()
{
  return MEMORY[0x270F03BF0]();
}

uint64_t sub_24E8633C8()
{
  return MEMORY[0x270F03D18]();
}

uint64_t sub_24E8633D8()
{
  return MEMORY[0x270F03D60]();
}

uint64_t sub_24E8633E8()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_24E8633F8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_24E863408()
{
  return MEMORY[0x270F03F18]();
}

uint64_t sub_24E863418()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_24E863428()
{
  return MEMORY[0x270F03FA8]();
}

uint64_t sub_24E863438()
{
  return MEMORY[0x270F03FC0]();
}

uint64_t sub_24E863448()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24E863458()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_24E863468()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_24E863478()
{
  return MEMORY[0x270F04010]();
}

uint64_t sub_24E863488()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_24E863498()
{
  return MEMORY[0x270F040E0]();
}

uint64_t sub_24E8634A8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_24E8634B8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_24E8634C8()
{
  return MEMORY[0x270F04150]();
}

uint64_t sub_24E8634D8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24E8634E8()
{
  return MEMORY[0x270F041F0]();
}

uint64_t sub_24E8634F8()
{
  return MEMORY[0x270F04210]();
}

uint64_t sub_24E863508()
{
  return MEMORY[0x270F04240]();
}

uint64_t sub_24E863518()
{
  return MEMORY[0x270F04258]();
}

uint64_t sub_24E863528()
{
  return MEMORY[0x270F04260]();
}

uint64_t sub_24E863538()
{
  return MEMORY[0x270F04288]();
}

uint64_t sub_24E863548()
{
  return MEMORY[0x270F04290]();
}

uint64_t sub_24E863558()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24E863568()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_24E863578()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24E863588()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_24E863598()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_24E8635A8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_24E8635B8()
{
  return MEMORY[0x270F04428]();
}

uint64_t sub_24E8635C8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24E8635D8()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24E8635E8()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_24E8635F8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24E863608()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_24E863618()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_24E863628()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24E863648()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24E863658()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24E863668()
{
  return MEMORY[0x270F04598]();
}

uint64_t sub_24E863678()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24E863688()
{
  return MEMORY[0x270F081C8]();
}

uint64_t sub_24E863698()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_24E8636A8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24E8636B8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24E8636C8()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24E8636D8()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_24E8636E8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24E8636F8()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_24E863708()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_24E863718()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_24E863728()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24E863738()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24E863748()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24E863758()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_24E863768()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_24E863778()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_24E863788()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24E863798()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_24E8637A8()
{
  return MEMORY[0x270F04930]();
}

uint64_t sub_24E8637B8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_24E8637C8()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_24E8637D8()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_24E8637E8()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_24E8637F8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24E863808()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24E863818()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_24E863828()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_24E863838()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24E863848()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_24E863858()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_24E863868()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_24E863878()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_24E863888()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_24E863898()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_24E8638A8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_24E8638B8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_24E8638C8()
{
  return MEMORY[0x270F081D8]();
}

uint64_t sub_24E8638D8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24E8638E8()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24E8638F8()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_24E863908()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_24E863918()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_24E863928()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_24E863938()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_24E863948()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_24E863958()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_24E863968()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_24E863978()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_24E863988()
{
  return MEMORY[0x270F04F60]();
}

uint64_t sub_24E863998()
{
  return MEMORY[0x270F04F70]();
}

uint64_t sub_24E8639A8()
{
  return MEMORY[0x270F04F90]();
}

uint64_t sub_24E8639B8()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_24E8639C8()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_24E8639D8()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_24E8639E8()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_24E8639F8()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_24E863A08()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_24E863A18()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_24E863A28()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24E863A38()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24E863A48()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_24E863A58()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_24E863A68()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_24E863A78()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_24E863A88()
{
  return MEMORY[0x270F05218]();
}

uint64_t sub_24E863A98()
{
  return MEMORY[0x270F05220]();
}

uint64_t sub_24E863AA8()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_24E863AB8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24E863AC8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24E863AD8()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24E863AE8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24E863AF8()
{
  return MEMORY[0x270F07550]();
}

uint64_t sub_24E863B08()
{
  return MEMORY[0x270F07560]();
}

uint64_t sub_24E863B18()
{
  return MEMORY[0x270F07570]();
}

uint64_t sub_24E863B28()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_24E863B38()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24E863B48()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24E863B58()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24E863B68()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_24E863B78()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24E863B88()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24E863B98()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24E863BA8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24E863BB8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24E863BD8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24E863BE8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24E863BF8()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_24E863C08()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_24E863C18()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24E863C28()
{
  return MEMORY[0x270F29150]();
}

uint64_t sub_24E863C38()
{
  return MEMORY[0x270F29158]();
}

uint64_t sub_24E863C48()
{
  return MEMORY[0x270EF1978]();
}

uint64_t sub_24E863C58()
{
  return MEMORY[0x270EF19A0]();
}

uint64_t sub_24E863C68()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E863C78()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_24E863C88()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24E863C98()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24E863CA8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24E863CB8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24E863CC8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24E863CD8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_24E863CE8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24E863CF8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24E863D08()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E863D18()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24E863D28()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_24E863D38()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E863D48()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E863D58()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24E863D68()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24E863D88()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24E863D98()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24E863DA8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24E863DB8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24E863DC8()
{
  return MEMORY[0x270EF1B58]();
}

uint64_t sub_24E863DD8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24E863DE8()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_24E863DF8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24E863E08()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24E863E18()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24E863E28()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24E863E38()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24E863E48()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24E863E58()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24E863E68()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24E863E78()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_24E863E88()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24E863E98()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24E863EA8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24E863EB8()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_24E863EC8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24E863ED8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24E863EE8()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_24E863EF8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24E863F08()
{
  return MEMORY[0x270F29160]();
}

uint64_t sub_24E863F18()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E863F28()
{
  return MEMORY[0x270FA1E10]();
}

uint64_t sub_24E863F38()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24E863F48()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24E863F58()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24E863F68()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24E863FA8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24E863FB8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24E863FC8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24E863FD8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E863FE8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E863FF8()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_24E864008()
{
  return MEMORY[0x270FA1F40]();
}

uint64_t sub_24E864018()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24E864028()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_24E864038()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24E864058()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24E864068()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24E864088()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24E864098()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24E8640A8()
{
  return MEMORY[0x270FA2008]();
}

uint64_t sub_24E8640C8()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_24E8640D8()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_24E8640E8()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24E8640F8()
{
  return MEMORY[0x270FA2090]();
}

uint64_t sub_24E864108()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24E864118()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24E864128()
{
  return MEMORY[0x270F9DEC0]();
}

uint64_t sub_24E864138()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24E864148()
{
  return MEMORY[0x270F9DF48]();
}

uint64_t sub_24E864158()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_24E864168()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24E864178()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24E864188()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_24E864198()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24E8641A8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24E8641B8()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24E8641C8()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24E8641D8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24E8641E8()
{
  return MEMORY[0x270F9E218]();
}

uint64_t sub_24E8641F8()
{
  return MEMORY[0x270F9E2F8]();
}

uint64_t sub_24E864208()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_24E864218()
{
  return MEMORY[0x270EE5888]();
}

uint64_t sub_24E864228()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24E864238()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24E864248()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E864258()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24E864268()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E864278()
{
  return MEMORY[0x270F29168]();
}

uint64_t sub_24E864288()
{
  return MEMORY[0x270F29170]();
}

uint64_t sub_24E864298()
{
  return MEMORY[0x270FA0720]();
}

uint64_t sub_24E8642A8()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_24E8642B8()
{
  return MEMORY[0x270FA0CF0]();
}

uint64_t sub_24E8642C8()
{
  return MEMORY[0x270FA0D10]();
}

uint64_t sub_24E8642D8()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_24E8642E8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24E8642F8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24E864308()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_24E864318()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_24E864328()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_24E864338()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24E864348()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24E864358()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_24E864368()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_24E864378()
{
  return MEMORY[0x270F82B90]();
}

uint64_t sub_24E864388()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24E864398()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24E8643A8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E8643B8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E8643C8()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_24E8643D8()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_24E8643E8()
{
  return MEMORY[0x270EF2518]();
}

uint64_t sub_24E8643F8()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_24E864408()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24E864418()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24E864438()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24E864448()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24E864458()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24E864468()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24E864478()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24E864488()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24E8644A8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24E8644B8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24E8644C8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24E8644D8()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_24E8644E8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E8644F8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E864508()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_24E864518()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_24E864528()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24E864538()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24E864548()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24E864558()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_24E864568()
{
  return MEMORY[0x270F9EAE8]();
}

uint64_t sub_24E864578()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E864588()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24E864598()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24E8645A8()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24E8645B8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24E8645C8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24E8645D8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24E8645E8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24E8645F8()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24E864608()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24E864618()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24E864628()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24E864638()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24E864648()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24E864658()
{
  return MEMORY[0x270F9ECE0]();
}

uint64_t sub_24E864668()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24E864678()
{
  return MEMORY[0x270FA2210]();
}

uint64_t sub_24E864688()
{
  return MEMORY[0x270FA2218]();
}

uint64_t sub_24E864698()
{
  return MEMORY[0x270FA2220]();
}

uint64_t sub_24E8646A8()
{
  return MEMORY[0x270FA2228]();
}

uint64_t sub_24E8646B8()
{
  return MEMORY[0x270FA2230]();
}

uint64_t sub_24E8646C8()
{
  return MEMORY[0x270FA2238]();
}

uint64_t sub_24E8646D8()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_24E8646E8()
{
  return MEMORY[0x270F9ED78]();
}

uint64_t sub_24E8646F8()
{
  return MEMORY[0x270F9ED80]();
}

uint64_t sub_24E864708()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E864718()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E864728()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24E864738()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_24E864748()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24E864758()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24E864768()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24E864778()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E864798()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24E8647B8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24E8647C8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24E8647D8()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_24E8647E8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24E8647F8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24E864808()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24E864818()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24E864828()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24E864838()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24E864848()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24E864858()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_24E864868()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24E864878()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24E864888()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24E864898()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24E8648A8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24E8648B8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24E8648C8()
{
  return MEMORY[0x270FA22D0]();
}

uint64_t sub_24E8648D8()
{
  return MEMORY[0x270FA22D8]();
}

uint64_t sub_24E8648E8()
{
  return MEMORY[0x270FA22E8]();
}

uint64_t sub_24E8648F8()
{
  return MEMORY[0x270FA22F8]();
}

uint64_t sub_24E864908()
{
  return MEMORY[0x270FA2300]();
}

uint64_t sub_24E864918()
{
  return MEMORY[0x270FA2310]();
}

uint64_t sub_24E864928()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E864938()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24E864958()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_24E864968()
{
  return MEMORY[0x270F9F750]();
}

uint64_t sub_24E864978()
{
  return MEMORY[0x270F29178]();
}

uint64_t sub_24E864988()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E8649B8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_24E8649C8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24E8649D8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24E8649E8()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24E864A08()
{
  return MEMORY[0x270FA2398]();
}

uint64_t sub_24E864A18()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E864A28()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E864A38()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E864A48()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E864A58()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E864A68()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E864A78()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24E864A88()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24E864A98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24E864AA8()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24E864AB8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24E864AC8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24E864AD8()
{
  return MEMORY[0x270F28EE0]();
}

uint64_t sub_24E864AE8()
{
  return MEMORY[0x270EF2860]();
}

uint64_t sub_24E864AF8()
{
  return MEMORY[0x270EF2870]();
}

uint64_t sub_24E864B08()
{
  return MEMORY[0x270EF2918]();
}

uint64_t sub_24E864B18()
{
  return MEMORY[0x270EF2928]();
}

uint64_t sub_24E864B28()
{
  return MEMORY[0x270EF2930]();
}

uint64_t sub_24E864B38()
{
  return MEMORY[0x270EF2960]();
}

uint64_t sub_24E864B48()
{
  return MEMORY[0x270EF2970]();
}

uint64_t sub_24E864B58()
{
  return MEMORY[0x270EF2980]();
}

uint64_t sub_24E864B68()
{
  return MEMORY[0x270EF2988]();
}

uint64_t sub_24E864B78()
{
  return MEMORY[0x270EF29A0]();
}

uint64_t sub_24E864B88()
{
  return MEMORY[0x270EF29A8]();
}

uint64_t sub_24E864B98()
{
  return MEMORY[0x270EF29C8]();
}

uint64_t sub_24E864BA8()
{
  return MEMORY[0x270EF29D0]();
}

uint64_t sub_24E864BB8()
{
  return MEMORY[0x270EF29F0]();
}

uint64_t sub_24E864BC8()
{
  return MEMORY[0x270EF2A10]();
}

uint64_t sub_24E864BD8()
{
  return MEMORY[0x270F9FFA8]();
}

uint64_t sub_24E864BE8()
{
  return MEMORY[0x270F9FFC8]();
}

uint64_t sub_24E864BF8()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_24E864C28()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  MEMORY[0x270EF58B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDelta = v4;
  result.span.latitudeDelta = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

uint64_t MKMapRectBoundingMapPoints()
{
  return MEMORY[0x270EF58D8]();
}

uint64_t MKMapRectMakeWithRadialDistance()
{
  return MEMORY[0x270EF5918]();
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  MEMORY[0x270EF5928]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceSupportsFindApplePencil()
{
  return MEMORY[0x270F96118]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _MKMapRectThatFits()
{
  return MEMORY[0x270EF5950]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}