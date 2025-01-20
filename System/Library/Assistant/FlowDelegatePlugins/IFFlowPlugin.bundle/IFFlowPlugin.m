unint64_t sub_2948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  Swift::String v36;
  Swift::String v37;
  Swift::String v38;
  Swift::String v39;
  Swift::String v40;
  Swift::String v41;

  v1 = sub_3FAF0();
  v32 = *(void *)(v1 - 8);
  v33 = v1;
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v28 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v31 = (char *)&v28 - v4;
  v5 = sub_403C0();
  v30 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_40030();
  v29 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_3FB50();
  v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for IFFlowError();
  __chkstk_darwin(v15);
  v17 = (uint64_t *)((char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_3158(v0, (uint64_t)v17);
  v18 = 0xD00000000000001ALL;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v19 = v29;
      (*(void (**)(char *, uint64_t *, uint64_t))(v29 + 32))(v10, v17, v8);
      v34 = 0;
      v35 = 0xE000000000000000;
      sub_408A0(83);
      v37._countAndFlagsBits = 0xD000000000000051;
      v37._object = (void *)0x8000000000042FB0;
      sub_40700(v37);
      sub_408E0();
      v18 = v34;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v8);
      break;
    case 2u:
      v20 = v30;
      (*(void (**)(char *, uint64_t *, uint64_t))(v30 + 32))(v7, v17, v5);
      v34 = 0;
      v35 = 0xE000000000000000;
      sub_408A0(34);
      v38._countAndFlagsBits = 0xD00000000000001FLL;
      v38._object = (void *)0x8000000000042EC0;
      sub_40700(v38);
      sub_408E0();
      v39._countAndFlagsBits = 46;
      v39._object = (void *)0xE100000000000000;
      sub_40700(v39);
      v18 = v34;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
      break;
    case 3u:
      sub_31BC((uint64_t)v17);
      v18 = 0xD00000000000001CLL;
      break;
    case 4u:
      v21 = *v17;
      v22 = (void *)v17[1];
      v34 = 0;
      v35 = 0xE000000000000000;
      sub_408A0(28);
      swift_bridgeObjectRelease();
      v34 = 0xD00000000000001ALL;
      v35 = 0x8000000000042F90;
      v40._countAndFlagsBits = v21;
      v40._object = v22;
      sub_40700(v40);
      swift_bridgeObjectRelease();
      v18 = v34;
      break;
    case 5u:
      v18 = *v17;
      break;
    case 6u:
      if (*(unsigned char *)v17) {
        v18 = 0xD000000000000057;
      }
      else {
        v18 = 0xD000000000000043;
      }
      break;
    case 7u:
      v24 = v31;
      v23 = v32;
      v25 = v17;
      v26 = v33;
      (*(void (**)(char *, uint64_t *, uint64_t))(v32 + 32))(v31, v25, v33);
      v34 = 0;
      v35 = 0xE000000000000000;
      sub_408A0(27);
      swift_bridgeObjectRelease();
      v34 = 0xD000000000000019;
      v35 = 0x8000000000042E60;
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v28, v24, v26);
      v41._countAndFlagsBits = sub_406C0();
      sub_40700(v41);
      swift_bridgeObjectRelease();
      v18 = v34;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v26);
      break;
    case 8u:
      return v18;
    case 9u:
      v18 = 0xD00000000000001DLL;
      break;
    default:
      (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v14, v17, v11);
      v34 = 0;
      v35 = 0xE000000000000000;
      sub_408A0(28);
      v36._object = (void *)0x8000000000043010;
      v36._countAndFlagsBits = 0xD00000000000001ALL;
      sub_40700(v36);
      sub_408E0();
      v18 = v34;
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      break;
  }
  return v18;
}

uint64_t sub_2FB0()
{
  uint64_t v1 = type metadata accessor for IFFlowError();
  __chkstk_darwin(v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3158(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = 3;
  switch(EnumCaseMultiPayload)
  {
    case 1:
      sub_31BC((uint64_t)v3);
      uint64_t result = 1;
      break;
    case 2:
      sub_31BC((uint64_t)v3);
      uint64_t result = 4;
      break;
    case 3:
      sub_31BC((uint64_t)v3);
      uint64_t result = 8;
      break;
    case 4:
      sub_31BC((uint64_t)v3);
      uint64_t result = 2;
      break;
    case 5:
      sub_31BC((uint64_t)v3);
      uint64_t result = 6;
      break;
    case 6:
      return result;
    case 7:
      sub_31BC((uint64_t)v3);
      uint64_t result = 9;
      break;
    case 8:
      uint64_t result = 7;
      break;
    case 9:
      uint64_t result = 11;
      break;
    default:
      sub_31BC((uint64_t)v3);
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t type metadata accessor for IFFlowError()
{
  uint64_t result = qword_4D010;
  if (!qword_4D010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IFFlowError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_31BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IFFlowError();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_3218(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_3FB50();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v10 = sub_40030();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v11 = sub_403C0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v12 = sub_3F4D0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
      case 5u:
        uint64_t v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v14 = sub_3FAF0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_34D8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_3FB50();
      goto LABEL_10;
    case 1:
      uint64_t v3 = sub_40030();
      goto LABEL_10;
    case 2:
      uint64_t v3 = sub_403C0();
      goto LABEL_10;
    case 3:
      uint64_t v3 = sub_3F4D0();
      goto LABEL_10;
    case 4:
    case 5:
      return swift_bridgeObjectRelease();
    case 7:
      uint64_t v3 = sub_3FAF0();
LABEL_10:
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void *sub_35E8(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = sub_3FB50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_9;
    case 1u:
      uint64_t v7 = sub_40030();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_9;
    case 2u:
      uint64_t v8 = sub_403C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      goto LABEL_9;
    case 3u:
      uint64_t v9 = sub_3F4D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      goto LABEL_9;
    case 4u:
    case 5u:
      uint64_t v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      swift_bridgeObjectRetain();
      goto LABEL_9;
    case 7u:
      uint64_t v10 = sub_3FAF0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_384C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_31BC((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_3FB50();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_10;
      case 1u:
        uint64_t v7 = sub_40030();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        goto LABEL_10;
      case 2u:
        uint64_t v8 = sub_403C0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_10;
      case 3u:
        uint64_t v9 = sub_3F4D0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        goto LABEL_10;
      case 4u:
      case 5u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_10;
      case 7u:
        uint64_t v10 = sub_3FAF0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *sub_3AD0(void *a1, const void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = sub_3FB50();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      goto LABEL_8;
    case 1u:
      uint64_t v7 = sub_40030();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      goto LABEL_8;
    case 2u:
      uint64_t v8 = sub_403C0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      goto LABEL_8;
    case 3u:
      uint64_t v9 = sub_3F4D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      goto LABEL_8;
    case 7u:
      uint64_t v10 = sub_3FAF0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_3CFC(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_31BC((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_3FB50();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        goto LABEL_9;
      case 1u:
        uint64_t v7 = sub_40030();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        goto LABEL_9;
      case 2u:
        uint64_t v8 = sub_403C0();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
        goto LABEL_9;
      case 3u:
        uint64_t v9 = sub_3F4D0();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
        goto LABEL_9;
      case 7u:
        uint64_t v10 = sub_3FAF0();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_3F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_3F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_3F90()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_3FA0()
{
  uint64_t result = sub_3FB50();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_40030();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_403C0();
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_3F4D0();
        if (v4 <= 0x3F)
        {
          uint64_t result = sub_3FAF0();
          if (v5 <= 0x3F)
          {
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_4140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_403E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3FAC0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3FE50();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v33 - v15;
  uint64_t v35 = a1;
  sub_30BE4((uint64_t)&v33 - v15);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for ActionFailure.Failure.actionCanceled(_:), v6);
  sub_3FAD0();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for StatementOutcome.failure(_:), v10);
  sub_48C4();
  LOBYTE(a1) = sub_40690();
  v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v17(v14, v10);
  v17(v16, v10);
  if (a1) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 104))(v36, enum case for RequestSummary.ExecutionSource.intelligenceFlow(_:), v3);
  }
  uint64_t v19 = v4;
  uint64_t v20 = v36;
  uint64_t v21 = v3;
  uint64_t v22 = sub_30ECC();
  if (!v23) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 104))(v20, enum case for RequestSummary.ExecutionSource.intelligenceFlow(_:), v3);
  }
  uint64_t v24 = v22;
  uint64_t v25 = v23;
  if (v22 == 0xD000000000000062 && v23 == 0x8000000000043030 || (sub_40970() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v26 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentFromMediaIntentTool(_:);
  }
  else if (v24 == 0xD000000000000059 && v25 == 0x80000000000430A0 {
         || (sub_40970() & 1) != 0
  }
         || v24 == 0xD000000000000053 && v25 == 0x8000000000043100
         || (sub_40970() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v26 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentTool(_:);
  }
  else
  {
    if ((v24 != 0xD00000000000005FLL || v25 != 0x8000000000043160) && (sub_40970() & 1) == 0)
    {
      if (v24 == 0xD000000000000033 && v25 == 0x80000000000431C0)
      {
        swift_bridgeObjectRelease();
        v30 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.searchTool(_:);
      }
      else
      {
        char v32 = sub_40970();
        swift_bridgeObjectRelease();
        v30 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.planner(_:);
        if (v32) {
          v30 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.searchTool(_:);
        }
      }
      uint64_t v31 = v19;
      v29 = v34;
      goto LABEL_17;
    }
    swift_bridgeObjectRelease();
    v26 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateKnowledgeResponseIntentTool(_:);
  }
  uint64_t v27 = *v26;
  uint64_t v28 = sub_403F0();
  v29 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v34, v27, v28);
  v30 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.genAI(_:);
  uint64_t v31 = v19;
LABEL_17:
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v29, *v30, v21);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(v20, v29, v21);
}

uint64_t sub_4688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3FC40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != enum case for MessagePayload.RequestPrescribedPlan.searchTool(_:))
  {
    if (v8 != enum case for MessagePayload.RequestPrescribedPlan.lowConfidenceKnowledgeTool(_:))
    {
      if (v8 == enum case for MessagePayload.RequestPrescribedPlan.textTool(_:)) {
        goto LABEL_9;
      }
      if (v8 == enum case for MessagePayload.RequestPrescribedPlan.convertTool(_:))
      {
        uint64_t v10 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentFromMediaIntentTool(_:);
        goto LABEL_10;
      }
      if (v8 == enum case for MessagePayload.RequestPrescribedPlan.displayTool(_:))
      {
LABEL_9:
        uint64_t v10 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateRichContentTool(_:);
        goto LABEL_10;
      }
      if (v8 != enum case for MessagePayload.RequestPrescribedPlan.knowledgeTool(_:))
      {
        uint64_t v9 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.planner(_:);
        goto LABEL_11;
      }
    }
    uint64_t v10 = (unsigned int *)&enum case for RequestSummary.PrescribedGenAITool.generateKnowledgeResponseIntentTool(_:);
LABEL_10:
    uint64_t v11 = *v10;
    uint64_t v12 = sub_403F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(a2, v11, v12);
    uint64_t v9 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.genAI(_:);
    goto LABEL_11;
  }
  uint64_t v9 = (unsigned int *)&enum case for RequestSummary.ExecutionSource.searchTool(_:);
LABEL_11:
  uint64_t v13 = *v9;
  uint64_t v14 = sub_403E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(a2, v13, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_48C4()
{
  unint64_t result = qword_4D0B0;
  if (!qword_4D0B0)
  {
    sub_3FE50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0B0);
  }
  return result;
}

void sub_491C()
{
  qword_4E360 = 0x776F6C464649;
  *(void *)algn_4E368 = 0xE600000000000000;
}

uint64_t sub_493C()
{
  uint64_t v0 = sub_405B0();
  sub_4A08(v0, qword_4E370);
  sub_4A6C(v0, (uint64_t)qword_4E370);
  sub_4AA4();
  if (qword_4CF30 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_40840();
  return sub_405C0();
}

uint64_t *sub_4A08(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_4A6C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_4AA4()
{
  unint64_t result = qword_4D0B8;
  if (!qword_4D0B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4D0B8);
  }
  return result;
}

uint64_t sub_4AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_4BE8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.TextTool, (void (*)(uint64_t, uint64_t, void))&MessagePayload.RequestPrescribedPlan.TextTool.init(query:isExplicit:), (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.textTool(_:), a4);
}

uint64_t sub_4B18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_4BE8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.ConvertTool, (void (*)(uint64_t, uint64_t, void))&MessagePayload.RequestPrescribedPlan.ConvertTool.init(query:isExplicit:), (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.convertTool(_:), a4);
}

uint64_t sub_4B4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_4BE8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.DisplayTool, (void (*)(uint64_t, uint64_t, void))&MessagePayload.RequestPrescribedPlan.DisplayTool.init(query:isExplicit:), (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.displayTool(_:), a4);
}

uint64_t sub_4B80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_4BE8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.KnowledgeTool, (void (*)(uint64_t, uint64_t, void))&MessagePayload.RequestPrescribedPlan.KnowledgeTool.init(query:isExplicit:), (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.knowledgeTool(_:), a4);
}

uint64_t sub_4BB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  return sub_4BE8(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for MessagePayload.RequestPrescribedPlan.SearchTool, (void (*)(uint64_t, uint64_t, void))&MessagePayload.RequestPrescribedPlan.SearchTool.init(query:isLowConfidenceKnowledge:), (unsigned int *)&enum case for MessagePayload.RequestPrescribedPlan.searchTool(_:), a4);
}

uint64_t sub_4BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t (*a4)(void)@<X3>, void (*a5)(uint64_t, uint64_t, void)@<X4>, unsigned int *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v33 = a5;
  v34 = a6;
  unsigned int v32 = a3;
  uint64_t v31 = a1;
  uint64_t v37 = a7;
  uint64_t v9 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v9 - 8);
  uint64_t v36 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v11 - 8);
  uint64_t v35 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_3FB70();
  uint64_t v16 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_3FC40();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a4(0);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  v26 = (char *)&v30 - v25;
  swift_bridgeObjectRetain();
  v33(v31, a2, v32);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v22, v26, v23);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, *v34, v19);
  sub_3FB60();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for MessagePayload.RequestContent.text(_:), v30);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v15, v22, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v15, 0, 1, v19);
  uint64_t v27 = sub_3EDB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v35, 1, 1, v27);
  uint64_t v28 = sub_3FC50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v36, 1, 1, v28);
  sub_3FC70();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v26, v23);
}

uint64_t sub_5044(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v99 = (void (*)(uint64_t, uint64_t, uint64_t))a2;
  uint64_t v101 = sub_3F4D0();
  uint64_t v98 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  uint64_t v94 = (uint64_t)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v4 - 8);
  v85 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v6 - 8);
  v84 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v8 - 8);
  v83 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_3FB70();
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  v82 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_403C0();
  uint64_t v87 = *(void *)(v11 - 8);
  uint64_t v88 = v11;
  __chkstk_darwin(v11);
  v86 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_40150();
  uint64_t v89 = *(void *)(v13 - 8);
  uint64_t v90 = v13;
  __chkstk_darwin(v13);
  v91 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_3F160();
  uint64_t v92 = *(void *)(v15 - 8);
  uint64_t v93 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (uint64_t *)((char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = sub_3F520();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_3F190();
  uint64_t v23 = *(uint8_t **)(v22 - 8);
  uint64_t v96 = v22;
  v97 = v23;
  __chkstk_darwin(v22);
  v95 = (char *)&v80 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_5044(&qword_4D0D8);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v80 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_3FC80();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v80 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20674((uint64_t)v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
  {
    sub_602C((uint64_t)v27);
    sub_3F4B0();
    uint64_t v32 = a1;
    if ((*(unsigned int (**)(char *, uint64_t))(v19 + 88))(v21, v18) == enum case for Parse.nlRouter(_:))
    {
      (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
      uint64_t v33 = v97;
      v34 = v95;
      uint64_t v35 = v21;
      uint64_t v36 = v96;
      (*((void (**)(char *, char *, uint64_t))v97 + 4))(v95, v35, v96);
      sub_3F180();
      uint64_t v38 = v92;
      uint64_t v37 = v93;
      if ((*(unsigned int (**)(uint64_t *, uint64_t))(v92 + 88))(v17, v93) != enum case for NLRouterParse.InputCandidate.text(_:))
      {
        (*(void (**)(uint64_t *, uint64_t))(v38 + 8))(v17, v37);
        goto LABEL_18;
      }
      (*(void (**)(uint64_t *, uint64_t))(v38 + 96))(v17, v37);
      uint64_t v39 = v17[1];
      uint64_t v94 = *v17;
      v40 = v91;
      sub_3F170();
      uint64_t v41 = v89;
      uint64_t v42 = v90;
      int v43 = (*(uint64_t (**)(char *, uint64_t))(v89 + 88))(v40, v90);
      if (v43 == enum case for NLRoutingDecisionMessage.RoutingDecision.siriXRewrite(_:)
        || v43 == enum case for NLRoutingDecisionMessage.RoutingDecision.queryRewrite(_:))
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v41 + 96))(v40, v42);
LABEL_7:
        swift_bridgeObjectRelease();
LABEL_18:
        type metadata accessor for IFFlowError();
        sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
        swift_allocError();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 16))(v62, v32, v101);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        return (*((uint64_t (**)(char *, uint64_t))v33 + 1))(v34, v36);
      }
      if (v43 == enum case for NLRoutingDecisionMessage.RoutingDecision.ajax(_:))
      {
        (*(void (**)(char *, uint64_t))(v41 + 96))(v40, v42);
        uint64_t v65 = (uint64_t)v86;
        uint64_t v64 = v87;
        uint64_t v66 = v88;
        (*(void (**)(char *, char *, uint64_t))(v87 + 32))(v86, v40, v88);
        sub_608C(v65, v94, v39, (uint64_t)v99);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v65, v66);
        return (*((uint64_t (**)(char *, uint64_t))v33 + 1))(v34, v36);
      }
      if (v43 == enum case for NLRoutingDecisionMessage.RoutingDecision.siriXFallback(_:)) {
        goto LABEL_7;
      }
      if (v43 == enum case for NLRoutingDecisionMessage.RoutingDecision.planner(_:))
      {
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v67 = sub_405B0();
        sub_4A6C(v67, (uint64_t)qword_4E370);
        v68 = sub_405A0();
        os_log_type_t v69 = sub_407F0();
        if (os_log_type_enabled(v68, v69))
        {
          v70 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v70 = 0;
          _os_log_impl(&dword_0, v68, v69, "IFFlow: #PrescribedPlanDecision no prescribed plan, falling back on planner", v70, 2u);
          swift_slowDealloc();
        }

        swift_bridgeObjectRetain();
        v71 = v82;
        sub_3FB60();
        (*(void (**)(char *, void, uint64_t))(v80 + 104))(v71, enum case for MessagePayload.RequestContent.text(_:), v81);
        uint64_t v72 = sub_3FC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v83, 1, 1, v72);
        uint64_t v73 = sub_3EDB0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v84, 1, 1, v73);
        uint64_t v74 = sub_3FC50();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v85, 1, 1, v74);
        sub_3FC70();
LABEL_37:
        swift_bridgeObjectRelease();
        return (*((uint64_t (**)(char *, uint64_t))v33 + 1))(v34, v36);
      }
      if (v43 == enum case for NLRoutingDecisionMessage.RoutingDecision.search(_:))
      {
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v75 = sub_405B0();
        sub_4A6C(v75, (uint64_t)qword_4E370);
        v76 = sub_405A0();
        os_log_type_t v77 = sub_407F0();
        if (os_log_type_enabled(v76, v77))
        {
          v78 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v78 = 0;
          _os_log_impl(&dword_0, v76, v77, "IFFlow: #PrescribedPlanDecision running the searchTool", v78, 2u);
          swift_slowDealloc();
        }

        sub_4BB4(v94, v39, 0, (uint64_t)v99);
        goto LABEL_37;
      }
      swift_bridgeObjectRelease();
      type metadata accessor for IFFlowError();
      sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 16))(v79, v32, v101);
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      (*((void (**)(char *, uint64_t))v33 + 1))(v34, v36);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v91, v42);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      uint64_t v50 = v101;
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_405B0();
      sub_4A6C(v51, (uint64_t)qword_4E370);
      uint64_t v52 = v98;
      v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 16);
      uint64_t v54 = v94;
      v53(v94, v32, v50);
      v55 = sub_405A0();
      os_log_type_t v56 = sub_407F0();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = swift_slowAlloc();
        v99 = v53;
        v58 = (uint8_t *)v57;
        uint64_t v59 = swift_slowAlloc();
        uint64_t v100 = v32;
        uint64_t v103 = v59;
        *(_DWORD *)v58 = 136315138;
        v97 = v58 + 4;
        sub_6B64(&qword_4D0E8, (void (*)(uint64_t))&type metadata accessor for Input);
        uint64_t v60 = sub_40950();
        uint64_t v102 = sub_17898(v60, v61, &v103);
        uint64_t v50 = v101;
        sub_40860();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v54, v50);
        _os_log_impl(&dword_0, v55, v56, "IFFlow not accepting input. Unsupported parse type received: %s", v58, 0xCu);
        swift_arrayDestroy();
        uint64_t v32 = v100;
        swift_slowDealloc();
        v53 = v99;
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v54, v50);
      }

      type metadata accessor for IFFlowError();
      sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      swift_allocError();
      v53(v63, v32, v50);
      swift_storeEnumTagMultiPayload();
      return swift_willThrow();
    }
  }
  else
  {
    v44 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
    v44(v31, v27, v28);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_405B0();
    sub_4A6C(v45, (uint64_t)qword_4E370);
    v46 = sub_405A0();
    os_log_type_t v47 = sub_407F0();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_0, v46, v47, "IFFlow valid directInvocation detected.", v48, 2u);
      swift_slowDealloc();
    }

    return ((uint64_t (*)(void, char *, uint64_t))v44)(v99, v31, v28);
  }
}

uint64_t sub_602C(uint64_t a1)
{
  uint64_t v2 = sub_5044(&qword_4D0D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_608C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v78 = a4;
  uint64_t v80 = a2;
  uint64_t v81 = a3;
  uint64_t v5 = sub_40400();
  uint64_t v83 = *(void *)(v5 - 8);
  uint64_t v84 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v79 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v82 = (char *)v69 - v8;
  uint64_t v9 = sub_403C0();
  uint64_t v75 = *(void *)(v9 - 8);
  uint64_t v76 = v9;
  __chkstk_darwin(v9);
  uint64_t v74 = (char *)v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_40390();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_40370();
  uint64_t v73 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_403A0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v72 = (char *)v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)v69 - v22;
  uint64_t v85 = a1;
  sub_403B0();
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v23, v18);
  LODWORD(v77) = v24 != enum case for AjaxMetadata.AjaxQuery.implicit(_:);
  if (v24 == enum case for AjaxMetadata.AjaxQuery.implicit(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v23, v18);
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v23, v11);
    uint64_t v26 = sub_40380();
    uint64_t v28 = v29;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    if (v24 != enum case for AjaxMetadata.AjaxQuery.explicit(_:))
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_405B0();
      sub_4A6C(v37, (uint64_t)qword_4E370);
      uint64_t v38 = v74;
      uint64_t v39 = v75;
      uint64_t v40 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v85, v76);
      uint64_t v41 = sub_405A0();
      os_log_type_t v42 = sub_40800();
      int v43 = v42;
      BOOL v44 = os_log_type_enabled(v41, v42);
      uint64_t v35 = v79;
      if (v44)
      {
        os_log_t v77 = v41;
        uint64_t v45 = swift_slowAlloc();
        int v71 = v43;
        v46 = (uint8_t *)v45;
        uint64_t v73 = swift_slowAlloc();
        uint64_t v87 = v73;
        *(_DWORD *)v46 = 136315138;
        v69[1] = v46 + 4;
        v70 = v46;
        sub_403B0();
        uint64_t v47 = sub_406C0();
        uint64_t v86 = sub_17898(v47, v48, &v87);
        sub_40860();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v76);
        uint64_t v41 = v77;
        _os_log_impl(&dword_0, v77, (os_log_type_t)v71, "Unhandled genAI query type: %s", v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v40);
      }

      uint64_t v32 = v81;
      v34 = v82;
      uint64_t v33 = v80;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v18);
      unsigned int v36 = 0;
      uint64_t v31 = v83;
      uint64_t v30 = v84;
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v19 + 96))(v23, v18);
    uint64_t v25 = v73;
    (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v17, v23, v15);
    uint64_t v26 = sub_40360();
    uint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v15);
  }
  uint64_t v31 = v83;
  uint64_t v30 = v84;
  uint64_t v33 = v80;
  uint64_t v32 = v81;
  v34 = v82;
  uint64_t v35 = v79;
  unsigned int v36 = v77;
  if (v28)
  {
    uint64_t v33 = v26;
    uint64_t v32 = v28;
    goto LABEL_14;
  }
LABEL_13:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_14:
  sub_40350();
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v35, v34, v30);
  int v49 = (*(uint64_t (**)(char *, uint64_t))(v31 + 88))(v35, v30);
  if (v49 == enum case for PrescribedAjaxTool.generateRichContentTool(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_405B0();
    sub_4A6C(v50, (uint64_t)qword_4E370);
    uint64_t v51 = sub_405A0();
    os_log_type_t v52 = sub_407F0();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_0, v51, v52, "IFFlow: #PrescribedPlanDecision running the generateRichContentTool", v53, 2u);
      swift_slowDealloc();
    }

    sub_4AE4(v33, v32, v36, v78);
LABEL_38:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v34, v30);
  }
  if (v49 == enum case for PrescribedAjaxTool.generateRichContentFromMediaIntentTool(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_405B0();
    sub_4A6C(v54, (uint64_t)qword_4E370);
    v55 = sub_405A0();
    os_log_type_t v56 = sub_407F0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_0, v55, v56, "IFFlow: #PrescribedPlanDecision running the generateRichContentFromMediaIntentTool", v57, 2u);
      swift_slowDealloc();
    }

    sub_4B18(v33, v32, v36, v78);
    goto LABEL_38;
  }
  if (v49 == enum case for PrescribedAjaxTool.generateImageIntentTool(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v58 = sub_405B0();
    sub_4A6C(v58, (uint64_t)qword_4E370);
    uint64_t v59 = sub_405A0();
    os_log_type_t v60 = sub_407F0();
    if (os_log_type_enabled(v59, v60))
    {
      unint64_t v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v61 = 0;
      _os_log_impl(&dword_0, v59, v60, "IFFlow: #PrescribedPlanDecision running the generateImageIntentTool", v61, 2u);
      swift_slowDealloc();
    }

    sub_4B4C(v33, v32, v36, v78);
    goto LABEL_38;
  }
  if (v49 == enum case for PrescribedAjaxTool.generateKnowledgeResponseIntentTool(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_405B0();
    sub_4A6C(v62, (uint64_t)qword_4E370);
    uint64_t v63 = sub_405A0();
    os_log_type_t v64 = sub_407F0();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v65 = 0;
      _os_log_impl(&dword_0, v63, v64, "IFFlow: #PrescribedPlanDecision running the generateKnowledgeResponseIntentTool", v65, 2u);
      swift_slowDealloc();
    }

    sub_4B80(v33, v32, v36, v78);
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  type metadata accessor for IFFlowError();
  sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
  swift_allocError();
  *uint64_t v67 = 0xD00000000000003ALL;
  v67[1] = 0x8000000000043230;
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  v68 = *(void (**)(char *, uint64_t))(v31 + 8);
  v68(v34, v30);
  return ((uint64_t (*)(char *, uint64_t))v68)(v35, v30);
}

uint64_t sub_6B64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_6BAC(uint64_t a1)
{
  uint64_t v2 = sub_3F4D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_141F8())
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_405B0();
    sub_4A6C(v6, (uint64_t)qword_4E370);
    uint64_t v7 = sub_405A0();
    os_log_type_t v8 = sub_407F0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "Input contains cancellation dialog act, returning .cancel() from actionForInput", v9, 2u);
      swift_slowDealloc();
    }

    return sub_3F1A0();
  }
  else
  {
    sub_1470C();
    if (v11)
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_405B0();
      sub_4A6C(v16, (uint64_t)qword_4E370);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
      uint64_t v17 = sub_405A0();
      os_log_type_t v18 = sub_407F0();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315138;
        v22[1] = v19 + 4;
        sub_6B64(&qword_4D0E8, (void (*)(uint64_t))&type metadata accessor for Input);
        uint64_t v20 = sub_40950();
        v22[2] = sub_17898(v20, v21, &v23);
        sub_40860();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        _os_log_impl(&dword_0, v17, v18, "Input does not appear to contain a disambiguation prompt response, returning ignore from actionForInput. Input: %s)", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }

      return sub_3F1C0();
    }
    else
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_405B0();
      sub_4A6C(v12, (uint64_t)qword_4E370);
      uint64_t v13 = sub_405A0();
      os_log_type_t v14 = sub_407F0();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_0, v13, v14, "Input contains interoperable disambiguation response, returning handle", v15, 2u);
        swift_slowDealloc();
      }

      return sub_3F1B0();
    }
  }
}

uint64_t sub_7020(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  return _swift_task_switch(sub_7044, 0, 0);
}

uint64_t sub_7044()
{
  uint64_t result = sub_1470C();
  if (v2)
  {
    type metadata accessor for IFFlowError();
    sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    swift_allocError();
    uint64_t v6 = v5;
    sub_408A0(50);
    swift_bridgeObjectRelease();
    sub_3F4D0();
    sub_6B64(&qword_4D0E8, (void (*)(uint64_t))&type metadata accessor for Input);
    v19._countAndFlagsBits = sub_40950();
    sub_40700(v19);
    swift_bridgeObjectRelease();
    *uint64_t v6 = 0xD000000000000030;
    v6[1] = 0x80000000000432C0;
LABEL_15:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    os_log_type_t v8 = (uint64_t (*)(void))v0[1];
    goto LABEL_16;
  }
  uint64_t v3 = result;
  if (result < 0)
  {
    uint64_t v7 = *(void *)(v0[12] + 56);
    uint64_t v4 = v7 + result;
    if (__OFADD__(v7, result))
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v4 = result - 1;
  }
  v0[9] = v4;
  if (v4 < 0 || v4 >= *(void *)(v0[12] + 56))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v9 = v0 + 8;
    uint64_t v10 = sub_405B0();
    sub_4A6C(v10, (uint64_t)qword_4E370);
    swift_retain();
    char v11 = sub_405A0();
    os_log_type_t v12 = sub_40800();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = v0[12];
    if (v13)
    {
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 134218240;
      swift_beginAccess();
      v0[5] = v0[9];
      uint64_t v9 = v0 + 8;
      sub_40860();
      *(_WORD *)(v15 + 12) = 2048;
      v0[5] = *(void *)(v14 + 56);
      sub_40860();
      swift_release();
      _os_log_impl(&dword_0, v11, v12, "Referenced list index (%ld) outside of choice range (count: %ld", (uint8_t *)v15, 0x16u);
      swift_slowDealloc();
    }
    else
    {
      swift_release();
    }

    type metadata accessor for IFFlowError();
    sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    swift_allocError();
    uint64_t v17 = v16;
    sub_408A0(90);
    v20._countAndFlagsBits = 0xD000000000000037;
    v20._object = (void *)0x8000000000043300;
    sub_40700(v20);
    swift_beginAccess();
    *uint64_t v9 = v0[9];
    v21._countAndFlagsBits = sub_40950();
    sub_40700(v21);
    swift_bridgeObjectRelease();
    v22._object = (void *)0x8000000000043340;
    v22._countAndFlagsBits = 0xD00000000000001FLL;
    sub_40700(v22);
    *uint64_t v9 = v3;
    v23._countAndFlagsBits = sub_40950();
    sub_40700(v23);
    swift_bridgeObjectRelease();
    *uint64_t v17 = 0;
    v17[1] = 0xE000000000000000;
    goto LABEL_15;
  }
  v0[2] = v4;
  sub_3F370();
  os_log_type_t v8 = (uint64_t (*)(void))v0[1];
LABEL_16:
  return v8();
}

uint64_t sub_74F0()
{
  sub_8CD8(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DisambiguationStrategy()
{
  return self;
}

uint64_t sub_7550(uint64_t a1)
{
  return sub_6BAC(a1);
}

uint64_t sub_7568(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_8D28;
  v6[11] = a2;
  v6[12] = v2;
  v6[10] = a1;
  return _swift_task_switch(sub_7044, 0, 0);
}

uint64_t sub_7624(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_7644, 0, 0);
}

uint64_t sub_7644()
{
  sub_7B5C(v0[3] + 16, v0[2]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_76AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_8D28;
  return PromptForDisambiguationFlowStrategyAsync.makeRepromptOnEmptyParse(paginatedItems:)(a1, a2, v9, a4);
}

uint64_t sub_7794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_8D28;
  return PromptForDisambiguationFlowStrategyAsync.makeRepromptOnLowConfidence(paginatedItems:)(a1, a2, v9, a4);
}

uint64_t sub_787C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_7954;
  return PromptForDisambiguationFlowStrategyAsync.makeFlowCancelledResponse()(a1, v7, a3);
}

uint64_t sub_7954()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_7A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_8D28;
  return PromptForDisambiguationFlowStrategyAsync.makeErrorResponse(_:)(a1, a2, v9, a4);
}

uint64_t sub_7B30()
{
  return PromptForDisambiguationFlowStrategyAsync.pervasiveUseCaseDescription.getter(*v0);
}

uint64_t sub_7B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_7BC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v107 = a3;
  v108 = a4;
  uint64_t v93 = a2;
  uint64_t v6 = *v4;
  uint64_t v85 = sub_3FDF0();
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v83 = (char *)v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v8 - 8);
  uint64_t v98 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v10 - 8);
  v97 = (char *)v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_3FB70();
  uint64_t v92 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v96 = (char *)v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_3FCA0();
  uint64_t v99 = *(void *)(v101 - 8);
  uint64_t v13 = __chkstk_darwin(v101);
  uint64_t v100 = (char *)v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v95 = (char *)v82 - v15;
  uint64_t v16 = sub_5044(&qword_4D1D0);
  __chkstk_darwin(v16 - 8);
  v91 = (char *)v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_3FAA0();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v90 = (char *)v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_40060();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  Swift::String v20 = (void *)((char *)v82 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_3EDB0();
  uint64_t v102 = *(void *)(v21 - 8);
  uint64_t v103 = v21;
  __chkstk_darwin(v21);
  Swift::String v23 = (char *)v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_40090();
  uint64_t v105 = *(void *)(v27 - 8);
  uint64_t v106 = v27;
  __chkstk_darwin(v27);
  v104 = (char *)v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_5044(&qword_4D1D8);
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v32 = (char *)v82 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v32, a1, v29);
  int v33 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v32, v29);
  if (v33 == enum case for PromptResult.answered<A>(_:))
  {
    v82[2] = v6;
    (*(void (**)(char *, uint64_t))(v30 + 96))(v32, v29);
    uint64_t v34 = *(void *)v32;
    if (qword_4CF38 != -1) {
      swift_once();
    }
    v82[1] = v4;
    uint64_t v35 = sub_405B0();
    sub_4A6C(v35, (uint64_t)qword_4E370);
    unsigned int v36 = sub_405A0();
    os_log_type_t v37 = sub_407E0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_0, v36, v37, "IFFlow Disambiguation item selected. Forwarding to IF", v38, 2u);
      swift_slowDealloc();
    }

    v82[0] = *(void *)(v102 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v82[0])(v26, 1, 1, v103);
    sub_40000();
    *Swift::String v20 = v34;
    (*(void (**)(uint64_t *, void, uint64_t))(v86 + 104))(v20, enum case for SystemPromptResolution.UserAction.disambiguationIndexSelected(_:), v87);
    (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v90, v93, v89);
    uint64_t v39 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
    uint64_t v40 = sub_40050();
    uint64_t v41 = *(void *)(v40 - 8);
    os_log_type_t v42 = v91;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 104))(v91, v39, v40);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v42, 0, 1, v40);
    int v43 = v104;
    sub_40070();
    uint64_t v44 = sub_5044(&qword_4D1E8);
    uint64_t v93 = (uint64_t)v108 + *(int *)(v44 + 48);
    sub_40020();
    uint64_t v45 = v96;
    (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v96, v43, v106);
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v45, enum case for MessagePayload.RequestContent.promptResolution(_:), v94);
    uint64_t v46 = sub_3FC40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v97, 1, 1, v46);
    uint64_t v47 = v103;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v82[0])(v26, 1, 1, v103);
    uint64_t v48 = sub_3FC50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v98, 1, 1, v48);
    uint64_t v49 = (uint64_t)v95;
    sub_3FC70();
    uint64_t v50 = v99;
    uint64_t v51 = v101;
    (*(void (**)(uint64_t, void, uint64_t))(v99 + 104))(v49, enum case for MessagePayload.request(_:), v101);
    sub_20CAC((uint64_t)v23, v49);
    os_log_type_t v52 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v52(v49, v51);
    (*(void (**)(char *, uint64_t))(v102 + 8))(v23, v47);
    v53 = v100;
    sub_40010();
    if ((*(unsigned int (**)(char *, uint64_t))(v50 + 88))(v53, v51) == enum case for MessagePayload.systemResponse(_:))
    {
      (*(void (**)(char *, uint64_t))(v50 + 96))(v53, v51);
      uint64_t v54 = v84;
      uint64_t v55 = (uint64_t)v83;
      uint64_t v56 = v85;
      (*(void (**)(char *, char *, uint64_t))(v84 + 32))(v83, v53, v85);
      uint64_t v57 = v93;
      sub_4140(v55, v93);
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v56);
      uint64_t v58 = sub_403E0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v57, 0, 1, v58);
    }
    else
    {
      v52((uint64_t)v53, v51);
      uint64_t v61 = sub_403E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v93, 1, 1, v61);
    }
    (*(void (**)(char *, uint64_t))(v105 + 8))(v104, v106);
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  if (v33 == enum case for PromptResult.error<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v30 + 96))(v32, v29);
    char v59 = v32[8];
    os_log_type_t v60 = v108;
    uint64_t *v108 = *(void *)v32;
    *((unsigned char *)v60 + 8) = (v59 & 1) == 0;
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  if (v33 == enum case for PromptResult.cancelled<A>(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_405B0();
    sub_4A6C(v62, (uint64_t)qword_4E370);
    uint64_t v63 = sub_405A0();
    os_log_type_t v64 = sub_407F0();
    BOOL v65 = os_log_type_enabled(v63, v64);
    uint64_t v66 = v108;
    if (v65)
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v67 = 0;
      _os_log_impl(&dword_0, v63, v64, "Exiting IFFlow, received userCancelled", v67, 2u);
      swift_slowDealloc();
    }

    *uint64_t v66 = 0;
    *((unsigned char *)v66 + 8) = 0;
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  if (v33 == enum case for PromptResult.unanswered<A>(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v68 = sub_405B0();
    sub_4A6C(v68, (uint64_t)qword_4E370);
    os_log_type_t v69 = sub_405A0();
    os_log_type_t v70 = sub_407F0();
    BOOL v71 = os_log_type_enabled(v69, v70);
    uint64_t v72 = v108;
    if (v71)
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v73 = 0;
      _os_log_impl(&dword_0, v69, v70, "Exiting IFFlow, received .unaswered from PromptForDisambiguation", v73, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for IFFlowError();
    sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    uint64_t v74 = swift_allocError();
    *uint64_t v75 = 0;
    swift_storeEnumTagMultiPayload();
    *uint64_t v72 = v74;
    *((unsigned char *)v72 + 8) = 1;
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  type metadata accessor for IFFlowError();
  sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
  uint64_t v77 = swift_allocError();
  uint64_t v79 = v78;
  unint64_t v109 = 0;
  unint64_t v110 = 0xE000000000000000;
  sub_408A0(35);
  swift_bridgeObjectRelease();
  unint64_t v109 = 0xD000000000000021;
  unint64_t v110 = 0x80000000000433E0;
  sub_8C34();
  v111._countAndFlagsBits = sub_40950();
  sub_40700(v111);
  swift_bridgeObjectRelease();
  unint64_t v80 = v110;
  *uint64_t v79 = v109;
  v79[1] = v80;
  swift_storeEnumTagMultiPayload();
  uint64_t v81 = v108;
  uint64_t *v108 = v77;
  *((unsigned char *)v81 + 8) = 1;
  type metadata accessor for IFFlow.State();
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v32, v29);
}

uint64_t sub_8B04(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_8B14(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_8B50(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_8B60(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_40930();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_8C04@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_8C34()
{
  unint64_t result = qword_4D1E0;
  if (!qword_4D1E0)
  {
    sub_8C90(&qword_4D1D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1E0);
  }
  return result;
}

uint64_t sub_8C90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_8CD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_8D2C()
{
  uint64_t v1 = sub_5044(&qword_4D200);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v39 - v5;
  id v40 = [objc_allocWithZone((Class)DialogExecutionResult) init];
  id v7 = [objc_allocWithZone((Class)DialogElement) init];
  uint64_t v41 = v0;
  sub_3FCC0();
  uint64_t v8 = sub_3FD80();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v10(v6, 1, v8) == 1)
  {
    sub_ACEC((uint64_t)v6, &qword_4D200);
  }
  else
  {
    sub_9224();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
    if (v12) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
LABEL_5:
  sub_3FCB0();
  if (v10(v4, 1, v8) == 1)
  {
    sub_ACEC((uint64_t)v4, &qword_4D200);
  }
  else
  {
    sub_9224();
    uint64_t v14 = v13;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v4, v8);
    if (v14) {
      goto LABEL_9;
    }
  }
  swift_bridgeObjectRelease();
LABEL_9:
  NSString v15 = sub_406A0();
  [v7 setFullPrint:v15];

  NSString v16 = sub_406A0();
  [v7 setFullSpeak:v16];

  NSString v17 = sub_406A0();
  swift_bridgeObjectRelease();
  [v7 setSupportingPrint:v17];

  NSString v18 = sub_406A0();
  swift_bridgeObjectRelease();
  [v7 setSupportingSpeak:v18];

  sub_5044(&qword_4D208);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_41190;
  *(void *)(v19 + 32) = v7;
  uint64_t v42 = v19;
  sub_40770();
  sub_AC44();
  id v39 = v7;
  Class isa = sub_40740().super.isa;
  swift_bridgeObjectRelease();
  id v21 = v40;
  [v40 setDialog:isa];

  sub_3FDA0();
  NSString v22 = sub_406A0();
  swift_bridgeObjectRelease();
  [v21 setCatId:v22];

  id v23 = [v21 dialog];
  unint64_t v24 = sub_40750();

  if (v24 >> 62) {
    goto LABEL_25;
  }
  uint64_t v25 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v25; uint64_t v25 = sub_40900())
  {
    uint64_t v26 = 4;
    uint64_t v27 = 0;
    if ((v24 & 0xC000000000000001) != 0)
    {
LABEL_12:
      id v28 = (id)sub_408C0();
      goto LABEL_14;
    }
    while (1)
    {
      id v28 = *(id *)(v24 + 8 * v26);
LABEL_14:
      uint64_t v29 = v28;
      uint64_t v30 = v27 + 1;
      if (__OFADD__(v27, 1)) {
        break;
      }
      id v31 = [v28 id];
      uint64_t v32 = sub_406B0();
      unint64_t v34 = v33;

      swift_bridgeObjectRelease();
      uint64_t v35 = HIBYTE(v34) & 0xF;
      if ((v34 & 0x2000000000000000) == 0) {
        uint64_t v35 = v32 & 0xFFFFFFFFFFFFLL;
      }
      if (v35 || (sub_3FDA0(), !v36))
      {

        if (v30 == v25) {
          goto LABEL_26;
        }
      }
      else
      {
        NSString v37 = sub_406A0();
        swift_bridgeObjectRelease();
        [v29 setId:v37];

        if (v30 == v25) {
          goto LABEL_26;
        }
      }
      uint64_t v27 = ++v26 - 4;
      if ((v24 & 0xC000000000000001) != 0) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
  }
LABEL_26:

  swift_bridgeObjectRelease_n();
  return v40;
}

uint64_t sub_9224()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_3FD80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for ResponseOutput.DialogType.staticText(_:)
    || v6 == enum case for ResponseOutput.DialogType.catDialog(_:)
    || v6 == enum case for ResponseOutput.DialogType.sonic(_:)
    || v6 == enum case for ResponseOutput.DialogType.generated(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    return *(void *)v5;
  }
  else
  {
    if (v6 != enum case for ResponseOutput.DialogType.unableToGenerate(_:)
      && v6 != enum case for ResponseOutput.DialogType.suppressed(_:))
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return 0;
  }
}

uint64_t sub_93B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = sub_3FB30();
  uint64_t v48 = *(char **)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3FD10();
  uint64_t v47 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3FD40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v14 = sub_3FD70();
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v44 = v6;
    uint64_t v45 = v4;
    uint64_t v34 = v8;
    uint64_t v35 = a1;
    NSString v18 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    uint64_t v16 = v8 + 16;
    NSString v17 = v18;
    unint64_t v19 = (*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64);
    uint64_t v33 = v14;
    unint64_t v20 = v14 + v19;
    id v21 = (uint64_t (**)(char *, uint64_t))(v16 + 72);
    int v50 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
    uint64_t v49 = (void (**)(char *, uint64_t))(v16 - 8);
    id v39 = (void (**)(char *, char *, uint64_t))(v47 + 32);
    id v40 = (void (**)(char *, uint64_t))(v16 + 80);
    uint64_t v38 = (uint64_t (**)(char *, uint64_t))(v48 + 88);
    int v36 = enum case for RGPluginModel.archivedView(_:);
    uint64_t v41 = (void (**)(char *, uint64_t))(v47 + 8);
    uint64_t v42 = v7;
    NSString v37 = (void (**)(char *, uint64_t))(v48 + 8);
    uint64_t v47 = *(void *)(v16 + 56);
    uint64_t v48 = v3;
    int v43 = v13;
    v18(v13, (char *)(v14 + v19), v7);
    while (1)
    {
      v17(v11, v13, v7);
      int v23 = (*v21)(v11, v7);
      if (v23 == v50)
      {
        uint64_t v24 = v7;
        uint64_t v25 = v17;
        uint64_t v26 = v16;
        (*v40)(v11, v24);
        uint64_t v27 = v44;
        uint64_t v28 = v45;
        (*v39)(v44, v11, v45);
        sub_3FD00();
        uint64_t v29 = v46;
        int v30 = (*v38)(v3, v46);
        if (v30 == v36)
        {
          (*v37)(v3, v29);
          (*v41)(v27, v28);
          uint64_t v8 = v34;
          a1 = v35;
          uint64_t v7 = v42;
          (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v35, v43, v42);
          uint64_t v31 = 0;
          goto LABEL_12;
        }
        (*v41)(v27, v28);
        (*v37)(v3, v29);
        uint64_t v16 = v26;
        NSString v17 = v25;
        uint64_t v7 = v42;
        uint64_t v13 = v43;
        (*v49)(v43, v42);
      }
      else
      {
        NSString v22 = *v49;
        (*v49)(v11, v7);
        v22(v13, v7);
      }
      uint64_t v3 = v48;
      v20 += v47;
      if (!--v15)
      {
        uint64_t v31 = 1;
        uint64_t v8 = v34;
        a1 = v35;
        goto LABEL_12;
      }
      v17(v13, (char *)v20, v7);
    }
  }
  uint64_t v31 = 1;
LABEL_12:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v31, 1, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_9828()
{
  uint64_t v0 = sub_3FCF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3FD40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v41 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v46 = (char *)&v35 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = sub_5044(&qword_4D218);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  NSString v17 = (char *)&v35 - v16;
  uint64_t v18 = sub_3FD70();
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v42 = v17;
  if (v19)
  {
    int v36 = v15;
    NSString v37 = v3;
    uint64_t v38 = v1;
    uint64_t v39 = v0;
    uint64_t v40 = v5;
    id v21 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    uint64_t v20 = v5 + 16;
    uint64_t v45 = v21;
    uint64_t v22 = *(unsigned __int8 *)(v20 + 64);
    uint64_t v35 = v18;
    uint64_t v23 = v18 + ((v22 + 32) & ~v22);
    int v44 = enum case for ResponseOutput.VisualOutput.pluginSnippet(_:);
    uint64_t v24 = (void (**)(char *, uint64_t))(v20 - 8);
    uint64_t v43 = *(void *)(v20 + 56);
    uint64_t v25 = v11;
    uint64_t v26 = v46;
    while (1)
    {
      uint64_t v27 = v45;
      v45(v25, (char *)v23, v4);
      v27(v26, v25, v4);
      uint64_t v28 = v4;
      LODWORD(v27) = (*(uint64_t (**)(char *, uint64_t))(v20 + 72))(v26, v4);
      uint64_t v29 = *v24;
      (*v24)(v26, v28);
      if (v27 == v44) {
        break;
      }
      v29(v25, v28);
      v23 += v43;
      --v19;
      uint64_t v4 = v28;
      if (!v19)
      {
        uint64_t v30 = 1;
        uint64_t v0 = v39;
        uint64_t v5 = v40;
        uint64_t v3 = v37;
        uint64_t v1 = v38;
        uint64_t v15 = v36;
        NSString v17 = v42;
        goto LABEL_8;
      }
    }
    uint64_t v5 = v40;
    uint64_t v31 = (uint64_t)v42;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v42, v25, v28);
    uint64_t v30 = 0;
    uint64_t v4 = v28;
    NSString v17 = (char *)v31;
    uint64_t v1 = v38;
    uint64_t v0 = v39;
    uint64_t v15 = v36;
    uint64_t v3 = v37;
  }
  else
  {
    uint64_t v30 = 1;
  }
LABEL_8:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v17, v30, 1, v4);
  swift_bridgeObjectRelease();
  sub_AC84((uint64_t)v17, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v15, 1, v4) == 1)
  {
    sub_ACEC((uint64_t)v17, &qword_4D218);
    sub_ACEC((uint64_t)v15, &qword_4D218);
    return 0;
  }
  else
  {
    uint64_t v33 = v41;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v41, v15, v4);
    if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v33, v4) == enum case for ResponseOutput.VisualOutput.pluginSnippet(_:))
    {
      (*(void (**)(char *, uint64_t))(v5 + 96))(v33, v4);
      (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v33, v0);
      uint64_t v32 = sub_3FCD0();
      sub_3FCE0();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v33, v4);
      uint64_t v32 = 0;
    }
    sub_ACEC((uint64_t)v42, &qword_4D218);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
  }
  return v32;
}

uint64_t sub_9D30()
{
  uint64_t v0 = sub_3FB30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3FD10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3FD40();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v51 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v48 = (char *)&v32 - v13;
  __chkstk_darwin(v12);
  v53 = (char *)&v32 - v14;
  uint64_t result = sub_3FD70();
  uint64_t v16 = (char *)_swiftEmptyArrayStorage;
  uint64_t v54 = (char *)_swiftEmptyArrayStorage;
  uint64_t v49 = *(void *)(result + 16);
  if (!v49)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (uint64_t)v16;
  }
  uint64_t v39 = v7;
  uint64_t v40 = v4;
  unint64_t v17 = 0;
  uint64_t v46 = v9 + 16;
  uint64_t v45 = v9 + 88;
  int v44 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
  uint64_t v41 = (void (**)(char *, uint64_t))(v9 + 8);
  NSString v37 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v38 = (void (**)(char *, uint64_t))(v9 + 96);
  int v36 = (uint64_t (**)(char *, uint64_t))(v1 + 88);
  int v35 = enum case for RGPluginModel.archivedView(_:);
  uint64_t v34 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v33 = (void (**)(char *, uint64_t))(v1 + 8);
  int v50 = (void (**)(char *, char *, uint64_t))(v9 + 32);
  uint64_t v42 = v3;
  uint64_t v43 = v0;
  uint64_t v47 = result;
  while (v17 < *(void *)(result + 16))
  {
    unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v52 = *(void *)(v9 + 72);
    uint64_t v19 = v9;
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    id v21 = v53;
    v20(v53, result + v18 + v52 * v17, v8);
    uint64_t v22 = v48;
    v20(v48, (unint64_t)v21, v8);
    uint64_t v9 = v19;
    int v23 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v22, v8);
    if (v23 != v44)
    {
      (*v41)(v22, v8);
      goto LABEL_10;
    }
    (*v38)(v22, v8);
    uint64_t v24 = v39;
    uint64_t v25 = v22;
    uint64_t v26 = v40;
    (*v37)(v39, v25, v40);
    sub_3FD00();
    int v27 = (*v36)(v3, v0);
    if (v27 != v35)
    {
      (*v34)(v24, v26);
      (*v33)(v3, v0);
LABEL_10:
      uint64_t v28 = *v50;
      (*v50)(v51, v53, v8);
      uint64_t v29 = v54;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1F534(0, *((void *)v29 + 2) + 1, 1);
        uint64_t v29 = v54;
      }
      unint64_t v31 = *((void *)v29 + 2);
      unint64_t v30 = *((void *)v29 + 3);
      if (v31 >= v30 >> 1)
      {
        sub_1F534(v30 > 1, v31 + 1, 1);
        uint64_t v29 = v54;
      }
      *((void *)v29 + 2) = v31 + 1;
      v28(&v29[v18 + v31 * v52], v51, v8);
      uint64_t v54 = v29;
      uint64_t v3 = v42;
      uint64_t v0 = v43;
      goto LABEL_4;
    }
    (*v33)(v3, v0);
    (*v34)(v24, v26);
    (*v41)(v53, v8);
LABEL_4:
    ++v17;
    uint64_t result = v47;
    if (v49 == v17)
    {
      uint64_t v16 = v54;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_A244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = sub_3FD10();
  uint64_t v2 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v52 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_5044(&qword_4D1F0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3FB30();
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v51 = (char *)&v40 - v11;
  uint64_t v12 = sub_3FD40();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v62 = (char *)&v40 - v17;
  uint64_t v18 = sub_3FD70();
  uint64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v41 = a1;
    id v21 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v20 = v13 + 16;
    char v59 = v21;
    unint64_t v22 = (*(unsigned __int8 *)(v20 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 64);
    uint64_t v40 = v18;
    unint64_t v23 = v18 + v22;
    uint64_t v58 = (uint64_t (**)(char *, uint64_t))(v20 + 72);
    int v57 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
    os_log_type_t v60 = (void (**)(char *, uint64_t))(v20 - 8);
    uint64_t v49 = (void (**)(char *, uint64_t))(v20 + 80);
    uint64_t v48 = (void (**)(char *, char *, uint64_t))(v2 + 32);
    uint64_t v47 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v55 = (unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
    uint64_t v56 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
    uint64_t v46 = (void (**)(char *, char *, uint64_t))(v42 + 32);
    uint64_t v45 = (uint64_t (**)(char *, uint64_t))(v42 + 88);
    int v44 = enum case for RGPluginModel.actionConfirmationModel(_:);
    uint64_t v43 = (void (**)(char *, uint64_t))(v42 + 8);
    uint64_t v54 = *(void *)(v20 + 56);
    int v50 = v16;
    while (1)
    {
      uint64_t v61 = v19;
      uint64_t v24 = v62;
      uint64_t v25 = v59;
      v59(v62, (char *)v23, v12);
      v25(v16, v24, v12);
      int v26 = (*v58)(v16, v12);
      if (v26 == v57)
      {
        (*v49)(v16, v12);
        int v27 = v52;
        uint64_t v28 = v10;
        uint64_t v29 = v53;
        (*v48)(v52, v16, v53);
        sub_3FD00();
        uint64_t v30 = v29;
        uint64_t v10 = v28;
        uint64_t v16 = v50;
        (*v47)(v27, v30);
        (*v56)(v6, 0, 1, v7);
        (*v60)(v62, v12);
      }
      else
      {
        unint64_t v31 = *v60;
        (*v60)(v16, v12);
        (*v56)(v6, 1, 1, v7);
        v31(v62, v12);
      }
      if ((*v55)(v6, 1, v7) == 1)
      {
        sub_ACEC((uint64_t)v6, &qword_4D1F0);
      }
      else
      {
        uint64_t v32 = *v46;
        uint64_t v33 = v51;
        (*v46)(v51, v6, v7);
        v32(v10, v33, v7);
        int v34 = (*v45)(v10, v7);
        if (v34 == v44)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v42 + 96))(v10, v7);
          uint64_t v37 = sub_400E0();
          uint64_t v38 = *(void *)(v37 - 8);
          uint64_t v39 = v41;
          (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v41, v10, v37);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v37);
        }
        (*v43)(v10, v7);
      }
      v23 += v54;
      uint64_t v19 = v61 - 1;
      if (v61 == 1)
      {
        swift_bridgeObjectRelease();
        a1 = v41;
        goto LABEL_13;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t v35 = sub_400E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(a1, 1, 1, v35);
}

uint64_t sub_A87C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_3FD40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_3FD30();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  if ((*(unsigned int (**)(unsigned char *, uint64_t))(v5 + 88))(v7, v4) == enum case for ResponseOutput.VisualOutput.inAppResponse(_:))
  {
    (*(void (**)(unsigned char *, uint64_t))(v5 + 96))(v7, v4);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v12 = sub_40140();
    __chkstk_darwin(v12);
    *(void *)&v15[-16] = v11;
    sub_ABC0();
    sub_3FA60();
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v14 = sub_40140();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
}

uint64_t sub_AB40()
{
  return sub_3FA50();
}

uint64_t sub_ABA4()
{
  return sub_AB40();
}

unint64_t sub_ABC0()
{
  unint64_t result = qword_4D1F8;
  if (!qword_4D1F8)
  {
    sub_40140();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1F8);
  }
  return result;
}

uint64_t sub_AC18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_40130();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_AC44()
{
  unint64_t result = qword_4D210;
  if (!qword_4D210)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4D210);
  }
  return result;
}

uint64_t sub_AC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5044(&qword_4D218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_ACEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5044(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_AD48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = a7;
  uint64_t v24 = a8;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v8 = sub_3EDB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone((Class)SAUIPluginSnippet);
  id v13 = objc_msgSend(v12, "init", v23, v24, v25, v26);
  sub_3EDA0();
  sub_3ED80();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  NSString v14 = sub_406A0();
  swift_bridgeObjectRelease();
  [v13 setAceId:v14];

  id v15 = v13;
  NSString v16 = sub_406A0();
  [v15 setViewId:v16];

  NSString v17 = sub_406A0();
  [v15 setBundleName:v17];

  id v18 = v15;
  NSString v19 = sub_406A0();
  [v18 setItemType:v19];

  Class isa = sub_3ED60().super.isa;
  [v18 setModelData:isa];

  NSString v21 = sub_406A0();
  [v18 setResponseViewId:v21];

  return v18;
}

uint64_t sub_AF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(void *)(v8 + 288) = a6;
  *(void *)(v8 + 296) = v7;
  *(unsigned char *)(v8 + 680) = a7;
  *(void *)(v8 + 272) = a4;
  *(void *)(v8 + 280) = a5;
  *(void *)(v8 + 256) = a2;
  *(void *)(v8 + 264) = a3;
  *(void *)(v8 + 248) = a1;
  sub_5044(&qword_4D228);
  *(void *)(v8 + 304) = swift_task_alloc();
  uint64_t v9 = sub_3FD60();
  *(void *)(v8 + 312) = v9;
  *(void *)(v8 + 320) = *(void *)(v9 - 8);
  *(void *)(v8 + 328) = swift_task_alloc();
  sub_5044(&qword_4D230);
  *(void *)(v8 + 336) = swift_task_alloc();
  sub_5044(&qword_4D218);
  *(void *)(v8 + 344) = swift_task_alloc();
  *(void *)(v8 + 352) = swift_task_alloc();
  uint64_t v10 = sub_3FD40();
  *(void *)(v8 + 360) = v10;
  *(void *)(v8 + 368) = *(void *)(v10 - 8);
  *(void *)(v8 + 376) = swift_task_alloc();
  uint64_t v11 = sub_3FDC0();
  *(void *)(v8 + 384) = v11;
  *(void *)(v8 + 392) = *(void *)(v11 - 8);
  *(void *)(v8 + 400) = swift_task_alloc();
  *(void *)(v8 + 408) = swift_task_alloc();
  uint64_t v12 = sub_3F470();
  *(void *)(v8 + 416) = v12;
  *(void *)(v8 + 424) = *(void *)(v12 - 8);
  *(void *)(v8 + 432) = swift_task_alloc();
  sub_5044(&qword_4D238);
  *(void *)(v8 + 440) = swift_task_alloc();
  *(void *)(v8 + 448) = swift_task_alloc();
  sub_5044(&qword_4D240);
  *(void *)(v8 + 456) = swift_task_alloc();
  sub_5044(&qword_4D248);
  *(void *)(v8 + 464) = swift_task_alloc();
  uint64_t v13 = sub_403E0();
  *(void *)(v8 + 472) = v13;
  *(void *)(v8 + 480) = *(void *)(v13 - 8);
  *(void *)(v8 + 488) = swift_task_alloc();
  uint64_t v14 = sub_3F140();
  *(void *)(v8 + 496) = v14;
  *(void *)(v8 + 504) = *(void *)(v14 - 8);
  *(void *)(v8 + 512) = swift_task_alloc();
  *(void *)(v8 + 520) = swift_task_alloc();
  uint64_t v15 = sub_3FE50();
  *(void *)(v8 + 528) = v15;
  *(void *)(v8 + 536) = *(void *)(v15 - 8);
  *(void *)(v8 + 544) = swift_task_alloc();
  *(void *)(v8 + 552) = swift_task_alloc();
  *(void *)(v8 + 560) = swift_task_alloc();
  *(void *)(v8 + 568) = swift_task_alloc();
  *(void *)(v8 + 576) = swift_task_alloc();
  *(void *)(v8 + 584) = swift_task_alloc();
  uint64_t v16 = sub_3F0E0();
  *(void *)(v8 + 592) = v16;
  *(void *)(v8 + 600) = *(void *)(v16 - 8);
  *(void *)(v8 + 608) = swift_task_alloc();
  *(void *)(v8 + 616) = swift_task_alloc();
  return _swift_task_switch(sub_B47C, 0, 0);
}

uint64_t sub_B47C()
{
  uint64_t v1 = *(void *)(v0 + 584);
  uint64_t v2 = *(void *)(v0 + 576);
  uint64_t v3 = *(void *)(v0 + 568);
  uint64_t v4 = *(void **)(v0 + 536);
  uint64_t v5 = *(void *)(v0 + 528);
  sub_30BE4(v1);
  sub_1C6C4();
  uint64_t v6 = (void (*)(uint64_t, uint64_t))v4[1];
  v6(v1, v5);
  sub_30BE4(v2);
  v129 = (void (*)(uint64_t, uint64_t, uint64_t))v4[2];
  v129(v3, v2, v5);
  v125 = (uint64_t (*)(uint64_t, uint64_t))v4[11];
  int v7 = v125(v3, v5);
  int v8 = enum case for StatementOutcome.valueDisambiguation(_:);
  uint64_t v9 = *(void *)(v0 + 568);
  uint64_t v10 = *(void *)(v0 + 528);
  uint64_t v12 = *(void *)(v0 + 504);
  uint64_t v11 = *(void *)(v0 + 512);
  uint64_t v13 = *(void *)(v0 + 496);
  int v123 = enum case for StatementOutcome.toolDisambiguation(_:);
  int v127 = enum case for StatementOutcome.parameterDisambiguation(_:);
  if (v7 == enum case for StatementOutcome.toolDisambiguation(_:)
    || v7 == enum case for StatementOutcome.parameterDisambiguation(_:)
    || v7 == enum case for StatementOutcome.valueDisambiguation(_:))
  {
    v6(v9, v10);
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for ResponseType.disambiguation(_:), v13);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for ResponseType.standard(_:), v13);
    v6(v9, v10);
  }
  uint64_t v14 = v6;
  uint64_t v15 = *(void *)(v0 + 576);
  uint64_t v16 = *(void *)(v0 + 560);
  uint64_t v17 = *(void *)(v0 + 552);
  uint64_t v18 = *(void *)(v0 + 528);
  uint64_t v116 = *(void *)(v0 + 488);
  uint64_t v118 = *(void *)(v0 + 448);
  uint64_t v120 = *(void *)(v0 + 544);
  uint64_t v19 = *(void *)(v0 + 392);
  uint64_t v122 = *(void *)(v0 + 384);
  uint64_t v20 = *(void *)(v0 + 256);
  (*(void (**)(void, void, void))(*(void *)(v0 + 504) + 32))(*(void *)(v0 + 520), *(void *)(v0 + 512), *(void *)(v0 + 496));
  v14(v15, v18);
  sub_30BE4(v16);
  v129(v17, v16, v18);
  int v21 = v125(v17, v18);
  BOOL v28 = v21 == v123
     || v21 == enum case for StatementOutcome.actionConfirmation(_:)
     || v21 == enum case for StatementOutcome.parameterNeedsValue(_:)
     || v21 == enum case for StatementOutcome.parameterConfirmation(_:)
     || v21 == v127
     || v21 == enum case for StatementOutcome.parameterNotAllowed(_:)
     || v21 == v8;
  BOOL v131 = v28;
  v14(v17, v18);
  v14(v16, v18);
  sub_4140(v20, v116);
  uint64_t v29 = sub_30ECC();
  if (v30) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = 0xD000000000000012;
  }
  unint64_t v32 = 0x8000000000043410;
  if (v30) {
    unint64_t v32 = v30;
  }
  uint64_t v128 = v32;
  sub_30BE4(v120);
  sub_3FDD0();
  v130 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  int v33 = v130(v118, 1, v122);
  uint64_t v35 = *(void *)(v0 + 448);
  uint64_t v34 = *(void *)(v0 + 456);
  v133 = v14;
  if (v33 == 1)
  {
    sub_ACEC(v35, &qword_4D238);
    uint64_t v36 = sub_400E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v34, 1, 1, v36);
  }
  else
  {
    uint64_t v37 = v31;
    uint64_t v39 = *(void *)(v0 + 384);
    uint64_t v38 = *(void *)(v0 + 392);
    sub_A244(v34);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v35, v39);
    uint64_t v31 = v37;
  }
  uint64_t v115 = *(void *)(v0 + 608);
  uint64_t v40 = *(void *)(v0 + 600);
  uint64_t v117 = *(void *)(v0 + 592);
  uint64_t v119 = *(void *)(v0 + 616);
  uint64_t v41 = *(void *)(v0 + 544);
  uint64_t v42 = *(void *)(v0 + 488);
  uint64_t v44 = *(void *)(v0 + 456);
  uint64_t v43 = *(void *)(v0 + 464);
  uint64_t v121 = *(void *)(v0 + 520);
  uint64_t v124 = *(void *)(v0 + 440);
  uint64_t v126 = *(void *)(v0 + 384);
  uint64_t v45 = *(void *)(v0 + 288);
  uint64_t v46 = *(void *)(v0 + 280);
  uint64_t v113 = *(void *)(v0 + 528);
  uint64_t v114 = *(void *)(v0 + 256);
  sub_CC10(*(void *)(v0 + 264), *(void *)(v0 + 272), v31, v128, v41, v44, v43);
  swift_bridgeObjectRelease();
  sub_ACEC(v44, &qword_4D240);
  v133(v41, v113);
  uint64_t v47 = sub_D5D0(v42, v46, v45);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v115, v119, v117);
  uint64_t v48 = swift_task_alloc();
  *(void *)(v48 + 16) = v121;
  *(void *)(v48 + 24) = v114;
  *(unsigned char *)(v48 + 32) = v131;
  *(void *)(v48 + 40) = v42;
  *(void *)(v48 + 48) = v43;
  *(void *)(v48 + 56) = v47;
  sub_3F3A0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  sub_3FDD0();
  if (v130(v124, 1, v126) == 1)
  {
    sub_ACEC(*(void *)(v0 + 440), &qword_4D238);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_405B0();
    sub_4A6C(v49, (uint64_t)qword_4E370);
    int v50 = sub_405A0();
    os_log_type_t v51 = sub_40800();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_0, v50, v51, "IFFlow received SystemResponse with no output, defaulting to minimally empty output", v52, 2u);
      swift_slowDealloc();
    }
    uint64_t v53 = *(void **)(v0 + 296);

    uint64_t v54 = v53[3];
    uint64_t v55 = v53[4];
    sub_DBEC(v53, v54);
    uint64_t v56 = (void *)swift_task_alloc();
    *(void *)(v0 + 672) = v56;
    *uint64_t v56 = v0;
    v56[1] = sub_C8D4;
    uint64_t v57 = *(void *)(v0 + 432);
    uint64_t v58 = *(void *)(v0 + 248);
    char v59 = _swiftEmptyArrayStorage;
    uint64_t v60 = v54;
    uint64_t v61 = v55;
    goto LABEL_71;
  }
  uint64_t v62 = *(void *)(v0 + 408);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 392) + 32))(v62, *(void *)(v0 + 440), *(void *)(v0 + 384));
  uint64_t v63 = sub_30ECC();
  if (v64) {
    uint64_t v65 = v63;
  }
  else {
    uint64_t v65 = 0xD000000000000012;
  }
  if (v64) {
    uint64_t v66 = v64;
  }
  else {
    uint64_t v66 = 0x8000000000043410;
  }
  sub_DC30(v62, v65, v66, v0 + 16);
  swift_bridgeObjectRelease();
  uint64_t v67 = sub_3FD70();
  if (*(void *)(v67 + 16))
  {
    (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 368) + 16))(*(void *)(v0 + 352), v67+ ((*(unsigned __int8 *)(*(void *)(v0 + 368) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 368) + 80)), *(void *)(v0 + 360));
    uint64_t v68 = 0;
  }
  else
  {
    uint64_t v68 = 1;
  }
  uint64_t v70 = *(void *)(v0 + 360);
  uint64_t v69 = *(void *)(v0 + 368);
  uint64_t v71 = *(void *)(v0 + 352);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v71, v68, 1, v70);
  swift_bridgeObjectRelease();
  v132 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48);
  if (v132(v71, 1, v70) == 1)
  {
    sub_ACEC(*(void *)(v0 + 352), &qword_4D218);
  }
  else
  {
    uint64_t v73 = *(void *)(v0 + 368);
    uint64_t v72 = *(void *)(v0 + 376);
    uint64_t v74 = *(void *)(v0 + 360);
    uint64_t v75 = *(void *)(v0 + 336);
    (*(void (**)(uint64_t, void, uint64_t))(v73 + 32))(v72, *(void *)(v0 + 352), v74);
    sub_A87C(v75);
    sub_3F3D0();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
  }
  uint64_t v134 = v0 + 112;
  sub_1375C(v0 + 16, v0 + 64, &qword_4D250);
  if (*(void *)(v0 + 104)) {
    uint64_t v76 = &qword_4D258;
  }
  else {
    uint64_t v76 = &qword_4D250;
  }
  sub_ACEC(v0 + 64, v76);
  uint64_t v78 = *(void *)(v0 + 400);
  uint64_t v77 = *(void *)(v0 + 408);
  uint64_t v80 = *(void *)(v0 + 384);
  uint64_t v79 = *(void *)(v0 + 392);
  uint64_t v81 = *(void *)(v0 + 360);
  uint64_t v82 = *(void *)(v0 + 344);
  sub_3F420();
  sub_93B8(v82);
  unsigned int v83 = v132(v82, 1, v81);
  sub_ACEC(v82, &qword_4D218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16))(v78, v77, v80);
  if (v83 != 1)
  {
    uint64_t v84 = *(void *)(v0 + 320);
    uint64_t v85 = *(void *)(v0 + 328);
    uint64_t v86 = *(void *)(v0 + 312);
    sub_3FDB0();
    sub_3FD50();
    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v85, v86);
  }
  uint64_t v87 = *(void *)(v0 + 400);
  uint64_t v88 = *(void *)(v0 + 384);
  int v89 = *(unsigned __int8 *)(v0 + 680);
  uint64_t v90 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 392) + 8);
  *(void *)(v0 + 624) = v90;
  v90(v87, v88);
  sub_3F460();
  if (v89 == 1)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_405B0();
    sub_4A6C(v91, (uint64_t)qword_4E370);
    uint64_t v92 = sub_405A0();
    os_log_type_t v93 = sub_407F0();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v94 = 134217984;
      *(void *)(v0 + 240) = 25000;
      sub_40860();
      _os_log_impl(&dword_0, v92, v93, "Setting minimumAutoDismissalTimeInMs to %ld", v94, 0xCu);
      swift_slowDealloc();
    }
    uint64_t v95 = *(void *)(v0 + 304);

    sub_3F2F0();
    uint64_t v96 = sub_3F2E0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v95, 0, 1, v96);
    sub_3F410();
  }
  id v97 = sub_8D2C();
  *(void *)(v0 + 632) = v97;
  sub_1375C(v0 + 16, v134, &qword_4D250);
  if (!*(void *)(v0 + 152))
  {
    sub_ACEC(v134, &qword_4D250);
    *(_OWORD *)(v0 + 200) = 0u;
    *(_OWORD *)(v0 + 216) = 0u;
    *(void *)(v0 + 232) = 0;
    goto LABEL_70;
  }
  swift_bridgeObjectRelease();
  sub_1397C(v134, v0 + 200, &qword_4D258);
  if (!*(void *)(v0 + 224))
  {
LABEL_70:
    uint64_t v106 = *(void **)(v0 + 296);
    sub_ACEC(v0 + 200, &qword_4D258);
    uint64_t v107 = v106[3];
    uint64_t v108 = v106[4];
    sub_DBEC(v106, v107);
    sub_5044(&qword_4D208);
    uint64_t v109 = swift_allocObject();
    *(_OWORD *)(v109 + 16) = xmmword_41190;
    *(void *)(v109 + 32) = v97;
    v136 = (void *)v109;
    sub_40770();
    *(void *)(v0 + 656) = v136;
    id v110 = v97;
    Swift::String v111 = (void *)swift_task_alloc();
    *(void *)(v0 + 664) = v111;
    *Swift::String v111 = v0;
    v111[1] = sub_C528;
    uint64_t v57 = *(void *)(v0 + 432);
    uint64_t v58 = *(void *)(v0 + 248);
    char v59 = v136;
    uint64_t v60 = v107;
    uint64_t v61 = v108;
LABEL_71:
    return dispatch thunk of ResponseGenerating.makeResponseOutput(dialog:outputGenerationManifest:)(v58, v59, v57, v60, v61);
  }
  uint64_t v98 = *(void **)(v0 + 296);
  sub_11380((long long *)(v0 + 200), v0 + 160);
  uint64_t v99 = v98[3];
  uint64_t v100 = v98[4];
  sub_DBEC(v98, v99);
  sub_5044(&qword_4D208);
  uint64_t v101 = swift_allocObject();
  *(_OWORD *)(v101 + 16) = xmmword_41190;
  *(void *)(v101 + 32) = v97;
  uint64_t v135 = v101;
  sub_40770();
  *(void *)(v0 + 640) = v135;
  id v102 = v97;
  uint64_t v103 = (void *)swift_task_alloc();
  *(void *)(v0 + 648) = v103;
  *uint64_t v103 = v0;
  v103[1] = sub_C174;
  uint64_t v104 = *(void *)(v0 + 432);
  uint64_t v105 = *(void *)(v0 + 248);
  return dispatch thunk of ResponseGenerating.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)(v105, v0 + 160, v135, v104, v99, v100);
}

uint64_t sub_C174()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_C28C, 0, 0);
}

uint64_t sub_C28C()
{
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v13 = *(void *)(v0 + 592);
  uint64_t v14 = *(void *)(v0 + 616);
  uint64_t v2 = *(void *)(v0 + 504);
  uint64_t v17 = *(void *)(v0 + 496);
  uint64_t v18 = *(void *)(v0 + 520);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v15 = *(void *)(v0 + 472);
  uint64_t v16 = *(void *)(v0 + 488);
  uint64_t v12 = *(void *)(v0 + 464);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 408);
  uint64_t v9 = *(void *)(v0 + 416);
  uint64_t v10 = *(void *)(v0 + 432);
  uint64_t v6 = *(void *)(v0 + 384);

  sub_8CD8(v0 + 160);
  sub_ACEC(v0 + 16, &qword_4D250);
  v11(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v10, v9);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  sub_ACEC(v12, &qword_4D248);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v18, v17);
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
  int v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_C528()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_C640, 0, 0);
}

uint64_t sub_C640()
{
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 624);
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v13 = *(void *)(v0 + 592);
  uint64_t v14 = *(void *)(v0 + 616);
  uint64_t v2 = *(void *)(v0 + 504);
  uint64_t v17 = *(void *)(v0 + 496);
  uint64_t v18 = *(void *)(v0 + 520);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v15 = *(void *)(v0 + 472);
  uint64_t v16 = *(void *)(v0 + 488);
  uint64_t v12 = *(void *)(v0 + 464);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v10 = *(void *)(v0 + 432);
  uint64_t v6 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 416);
  uint64_t v7 = *(void *)(v0 + 384);

  sub_ACEC(v0 + 16, &qword_4D250);
  v11(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v10, v5);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
  sub_ACEC(v12, &qword_4D248);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v18, v17);
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
  int v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_C8D4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_C9D0, 0, 0);
}

uint64_t sub_C9D0()
{
  uint64_t v1 = v0[77];
  uint64_t v2 = v0[75];
  uint64_t v3 = v0[74];
  uint64_t v12 = v0[65];
  uint64_t v4 = v0[62];
  uint64_t v5 = v0[63];
  uint64_t v6 = v0[60];
  uint64_t v7 = v0[61];
  uint64_t v9 = v0[58];
  uint64_t v8 = v0[59];
  (*(void (**)(void, void))(v0[53] + 8))(v0[54], v0[52]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_ACEC(v9, &qword_4D248);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v4);
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_CC10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v95 = a6;
  uint64_t v87 = a4;
  uint64_t v86 = a3;
  uint64_t v85 = a2;
  uint64_t v84 = a1;
  uint64_t v89 = a7;
  uint64_t v99 = sub_3F700();
  uint64_t v8 = *(void *)(v99 - 8);
  uint64_t v9 = __chkstk_darwin(v99);
  os_log_type_t v93 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v92 = (char *)&v83 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v98 = (char *)&v83 - v14;
  __chkstk_darwin(v13);
  uint64_t v94 = (char *)&v83 - v15;
  uint64_t v16 = sub_5044(&qword_4D2C0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16 - 8);
  uint64_t v96 = (char *)&v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v97 = (uint64_t)&v83 - v20;
  uint64_t v21 = sub_400B0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v83 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_3FE50();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  BOOL v28 = (char *)&v83 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  uint64_t v88 = a5;
  v29(v28, a5, v25);
  int v30 = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v28, v25);
  if (v30 == enum case for StatementOutcome.actionConfirmation(_:)
    || v30 == enum case for StatementOutcome.parameterConfirmation(_:))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    unint64_t v32 = (void *)sub_F318(v95);
  }
  else if (v30 == enum case for StatementOutcome.parameterDisambiguation(_:))
  {
    (*(void (**)(char *, uint64_t))(v26 + 96))(v28, v25);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v28, v21);
    uint64_t v33 = *(void *)(sub_400A0() + 16);
    swift_bridgeObjectRelease();
    sub_5044(&qword_4D2D0);
    unint64_t v34 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    unint64_t v32 = (void *)swift_allocObject();
    *((_OWORD *)v32 + 1) = xmmword_411F0;
    uint64_t v35 = (uint64_t)v32 + v34;
    sub_14CE0(v33, v35);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v35, 0, 1, v99);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    unint64_t v32 = _swiftEmptyArrayStorage;
  }
  uint64_t v36 = v32[2];
  uint64_t v37 = (uint64_t)v96;
  if (v36)
  {
    uint64_t v38 = (uint64_t)v32 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    uint64_t v39 = *(void *)(v17 + 72);
    uint64_t v40 = v8;
    uint64_t v41 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    uint64_t v95 = v40;
    uint64_t v42 = (void (**)(char *, uint64_t, uint64_t))(v40 + 32);
    *(void *)&long long v91 = v32;
    swift_bridgeObjectRetain();
    uint64_t v43 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v44 = v97;
      sub_1375C(v38, v97, &qword_4D2C0);
      sub_1397C(v44, v37, &qword_4D2C0);
      if ((*v41)(v37, 1, v99) == 1)
      {
        sub_ACEC(v37, &qword_4D2C0);
      }
      else
      {
        uint64_t v45 = *v42;
        uint64_t v46 = v94;
        uint64_t v47 = v37;
        uint64_t v48 = v99;
        (*v42)(v94, v47, v99);
        v45(v98, (uint64_t)v46, v48);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v43 = (void *)sub_113BC(0, v43[2] + 1, 1, (unint64_t)v43, &qword_4D330, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
        }
        unint64_t v50 = v43[2];
        unint64_t v49 = v43[3];
        uint64_t v51 = (uint64_t)v43;
        uint64_t v37 = (uint64_t)v96;
        if (v50 >= v49 >> 1) {
          uint64_t v51 = sub_113BC(v49 > 1, v50 + 1, 1, (unint64_t)v43, &qword_4D330, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
        }
        *(void *)(v51 + 16) = v50 + 1;
        uint64_t v43 = (void *)v51;
        v45((char *)(v51+ ((*(unsigned __int8 *)(v95 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v95 + 80))+ *(void *)(v95 + 72) * v50), (uint64_t)v98, v99);
      }
      v38 += v39;
      --v36;
    }
    while (v36);
    swift_bridgeObjectRelease_n();
    uint64_t v8 = v95;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = _swiftEmptyArrayStorage;
  }
  uint64_t v52 = v43[2];
  uint64_t v53 = v43;
  uint64_t v55 = v92;
  uint64_t v54 = v93;
  if (v52)
  {
    uint64_t v57 = *(char **)(v8 + 16);
    uint64_t v56 = v8 + 16;
    uint64_t v58 = (char *)v53 + ((*(unsigned __int8 *)(v56 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 64));
    uint64_t v97 = *(void *)(v56 + 56);
    uint64_t v98 = v57;
    uint64_t v96 = (char *)(v56 - 8);
    unsigned int v83 = v53;
    swift_bridgeObjectRetain();
    char v59 = &SiriAnalyticsMessageStream__prots;
    *(void *)&long long v60 = 136315138;
    long long v91 = v60;
    uint64_t v90 = (char *)&type metadata for Any + 8;
    do
    {
      ((void (*)(char *, char *, uint64_t))v98)(v55, v58, v99);
      if (v59[487].count != -1) {
        swift_once();
      }
      uint64_t v65 = sub_405B0();
      sub_4A6C(v65, (uint64_t)qword_4E370);
      ((void (*)(char *, char *, uint64_t))v98)(v54, v55, v99);
      uint64_t v66 = sub_405A0();
      os_log_type_t v67 = sub_407F0();
      int v68 = v67;
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v69 = swift_slowAlloc();
        LODWORD(v94) = v68;
        uint64_t v70 = v69;
        uint64_t v95 = swift_slowAlloc();
        uint64_t v101 = v95;
        *(_DWORD *)uint64_t v70 = v91;
        sub_3F760();
        uint64_t v71 = v99;
        v100[3] = v99;
        v100[4] = sub_13934(&qword_4D2C8, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
        uint64_t v72 = sub_1174C(v100);
        ((void (*)(uint64_t *, char *, uint64_t))v98)(v72, v54, v71);
        uint64_t v73 = sub_3F750();
        uint64_t v74 = v71;
        uint64_t v75 = v56;
        unint64_t v77 = v76;
        sub_8CD8((uint64_t)v100);
        *(void *)(v70 + 4) = sub_17898(v73, v77, &v101);
        uint64_t v78 = v93;
        swift_bridgeObjectRelease();
        uint64_t v79 = *(void (**)(char *, uint64_t))v96;
        uint64_t v62 = v78;
        (*(void (**)(char *, uint64_t))v96)(v78, v74);
        _os_log_impl(&dword_0, v66, (os_log_type_t)v94, "Posting SDA: %s", (uint8_t *)v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v55 = v92;
        swift_slowDealloc();

        v79(v55, v74);
        uint64_t v56 = v75;
        char v59 = &SiriAnalyticsMessageStream__prots;
      }
      else
      {

        uint64_t v61 = *(void (**)(char *, uint64_t))v96;
        uint64_t v62 = v54;
        uint64_t v63 = v54;
        uint64_t v64 = v99;
        (*(void (**)(char *, uint64_t))v96)(v63, v99);
        v61(v55, v64);
      }
      v58 += v97;
      --v52;
      uint64_t v54 = v62;
    }
    while (v52);
    swift_bridgeObjectRelease();
  }
  uint64_t v80 = v89;
  sub_3F270();
  sub_3F260();
  sub_1216C(v84, v85, v86, v87, v88);
  sub_3F250();
  uint64_t v81 = sub_3F280();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v81 - 8) + 56))(v80, 0, 1, v81);
}

void *sub_D5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_403E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t result = _swiftEmptyArrayStorage;
  if (a3)
  {
    unint64_t v22 = (unint64_t)_swiftEmptyArrayStorage;
    (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, enum case for RequestSummary.ExecutionSource.searchTool(_:), v4);
    char v9 = sub_403D0();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    if (v9)
    {
      uint64_t v20 = &type metadata for FeatureEnablementProvider.Key;
      unint64_t v21 = sub_13708();
      char v10 = sub_3F590();
      sub_8CD8((uint64_t)v19);
      if (v10)
      {
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_405B0();
        sub_4A6C(v11, (uint64_t)qword_4E370);
        uint64_t v12 = sub_405A0();
        os_log_type_t v13 = sub_407F0();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_0, v12, v13, "IFFlow SearchTool invoked + ShowASR FF Enabled. Appending Reveal ASR AceCommand", v14, 2u);
          swift_slowDealloc();
        }

        id v15 = [objc_allocWithZone((Class)SAUIRevealRecognizedSpeech) init];
        sub_40410();
        NSString v16 = sub_406A0();
        swift_bridgeObjectRelease();
        [v15 setRefId:v16];

        NSString v17 = sub_406A0();
        [v15 setOverriddenSpeech:v17];

        id v18 = v15;
        sub_40730();
        if (*(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v22 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_40780();
        sub_407A0();
        sub_40770();
      }
    }
    return (void *)v22;
  }
  return result;
}

uint64_t sub_D8BC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  uint64_t v27 = a5;
  v26[3] = a4;
  uint64_t v30 = sub_3FE50();
  uint64_t v9 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_5044(&qword_4D248);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_403E0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_3F140();
  __chkstk_darwin(v19);
  (*(void (**)(char *, uint64_t))(v21 + 16))((char *)v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  sub_3F3C0();
  sub_30ECC();
  sub_3F3E0();
  sub_3F440();
  sub_3F450();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v27, v15);
  sub_3F3F0();
  sub_1375C(v28, (uint64_t)v14, &qword_4D248);
  sub_3F400();
  swift_bridgeObjectRetain();
  sub_3F430();
  sub_30BE4((uint64_t)v11);
  uint64_t v22 = sub_12594((uint64_t)v11);
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v30);
  sub_13084(a3, v22, v24);
  swift_bridgeObjectRelease();
  return sub_3F3B0();
}

uint64_t sub_DBD8(uint64_t a1)
{
  return sub_D8BC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

void *sub_DBEC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_DC30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v180 = a2;
  uint64_t v181 = a3;
  uint64_t v167 = sub_3FCF0();
  uint64_t v166 = *(void *)(v167 - 8);
  __chkstk_darwin(v167);
  v165 = (char *)&v159 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5044(&qword_4D218);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v175 = (char *)&v159 - v12;
  uint64_t v191 = sub_3FD10();
  uint64_t v176 = *(void *)(v191 - 8);
  uint64_t v13 = __chkstk_darwin(v191);
  v168 = (char *)&v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v162 = (char *)&v159 - v16;
  __chkstk_darwin(v15);
  v190 = (char *)&v159 - v17;
  uint64_t v182 = sub_3FD40();
  uint64_t v178 = *(void *)(v182 - 8);
  uint64_t v18 = __chkstk_darwin(v182);
  v170 = (char *)&v159 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  v164 = (char *)&v159 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  v174 = (char *)&v159 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v177 = (char *)&v159 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v194 = (uint64_t)&v159 - v27;
  __chkstk_darwin(v26);
  v193 = (char *)&v159 - v28;
  v197 = (void (**)(uint64_t, uint64_t))sub_3FD60();
  uint64_t v195 = (uint64_t)*(v197 - 1);
  __chkstk_darwin(v197);
  unint64_t v196 = (unint64_t)&v159 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_3FE40();
  uint64_t v187 = *(void *)(v30 - 8);
  uint64_t v188 = v30;
  __chkstk_darwin(v30);
  v186 = (char *)&v159 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_5044(&qword_4D1F0);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  v171 = (char *)&v159 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v36 = (char *)&v159 - v35;
  uint64_t v192 = sub_3FB30();
  uint64_t v37 = *(void *)(v192 - 8);
  uint64_t v38 = __chkstk_darwin(v192);
  v160 = (char *)&v159 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v38);
  v161 = (char *)&v159 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  v189 = (char *)&v159 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  uint64_t v46 = (char *)&v159 - v45;
  __chkstk_darwin(v44);
  uint64_t v48 = (char *)&v159 - v47;
  sub_DBEC((void *)(v4 + 88), *(void *)(v4 + 112));
  uint64_t result = sub_3F080();
  unint64_t v50 = _swiftEmptyArrayStorage;
  if ((result & 1) == 0)
  {
    uint64_t v173 = v37;
    unint64_t v198 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v51 = sub_9828();
    uint64_t v55 = v194;
    v169 = v11;
    if (v54)
    {
      unint64_t v56 = v52;
      v184 = v53;
      v185 = v54;
      uint64_t v57 = v51;
      sub_3ED30();
      swift_allocObject();
      sub_3ED20();
      sub_13934(&qword_4D268, (void (*)(uint64_t))&type metadata accessor for RGPluginModel);
      uint64_t v58 = v192;
      uint64_t v179 = v57;
      unint64_t v183 = v56;
      sub_3ED10();
      swift_release();
      uint64_t v59 = v173;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v173 + 56))(v36, 0, 1, v58);
      long long v60 = v48;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v48, v36, v58);
      (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v46, v48, v58);
      if ((*(unsigned int (**)(char *, uint64_t))(v59 + 88))(v46, v58) == enum case for RGPluginModel.siriSDSView(_:))
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v59 + 96))(v46, v58);
        uint64_t v62 = (uint64_t)v186;
        uint64_t v61 = v187;
        uint64_t v63 = v46;
        uint64_t v64 = v60;
        uint64_t v65 = v188;
        (*(void (**)(char *, char *, uint64_t))(v187 + 32))(v186, v63, v188);
        uint64_t v66 = sub_F0EC(v62, v180, v181);
        sub_1181C(v179, v183, (uint64_t)v184, (uint64_t)v185);
        (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v65);
        (*(void (**)(char *, uint64_t))(v59 + 8))(v64, v58);
        unint64_t v198 = (unint64_t)v66;
        uint64_t v55 = v194;
      }
      else
      {
        os_log_type_t v67 = *(void (**)(char *, uint64_t))(v59 + 8);
        v67(v48, v58);
        v67(v46, v58);
        unint64_t v68 = v196;
        sub_3FDB0();
        sub_3FD50();
        (*(void (**)(unint64_t, void))(v195 + 8))(v68, v197);
        uint64_t v69 = sub_406B0();
        uint64_t v70 = v179;
        unint64_t v72 = v183;
        uint64_t v71 = v184;
        uint64_t v73 = v185;
        id v75 = sub_AD48(v179, v183, (uint64_t)v184, (uint64_t)v185, v180, v181, v69, v74);
        swift_bridgeObjectRelease();
        id v76 = v75;
        sub_40730();
        if (*(void *)((char *)&dword_10 + (v198 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                        + (v198 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_40780();
        sub_407A0();
        sub_40770();

        sub_1181C(v70, v72, (uint64_t)v71, (uint64_t)v73);
        uint64_t v55 = v194;
        uint64_t v11 = v169;
      }
    }
    uint64_t v172 = sub_9D30();
    uint64_t v77 = *(void *)(v172 + 16);
    uint64_t v159 = a4;
    uint64_t v163 = a1;
    if (v77)
    {
      uint64_t v78 = *(void (**)(char *, unint64_t, uint64_t))(v178 + 16);
      unint64_t v79 = v172 + ((*(unsigned __int8 *)(v178 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v178 + 80));
      uint64_t v80 = (unsigned int (**)(uint64_t, uint64_t))(v178 + 88);
      int v81 = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
      unint64_t v196 = *(void *)(v178 + 72);
      v197 = (void (**)(uint64_t, uint64_t))(v178 + 8);
      uint64_t v187 = v178 + 96;
      v185 = (void (**)(char *, uint64_t))(v176 + 8);
      v186 = (char *)(v176 + 32);
      v184 = (void (**)(char *, uint64_t))(v173 + 8);
      uint64_t v179 = SAAceViewUIItemTypeItemTypeResultValue;
      uint64_t v82 = v182;
      unsigned int v83 = v193;
      LODWORD(v188) = enum case for ResponseOutput.VisualOutput.systemSnippet(_:);
      unint64_t v183 = v178 + 88;
      v78(v193, v79, v182);
      while (1)
      {
        v78((char *)v55, (unint64_t)v83, v82);
        if ((*v80)(v55, v82) == v81)
        {
          (*(void (**)(uint64_t, uint64_t))v187)(v55, v82);
          uint64_t v84 = v190;
          uint64_t v85 = v55;
          uint64_t v86 = v191;
          (*(void (**)(char *, uint64_t, uint64_t))v186)(v190, v85, v191);
          uint64_t v87 = v78;
          uint64_t v88 = v189;
          sub_3FD00();
          (*v185)(v84, v86);
          sub_13934(&qword_4D260, (void (*)(uint64_t))&type metadata accessor for RGPluginModel);
          uint64_t v89 = v192;
          uint64_t v195 = sub_3EDC0();
          unint64_t v91 = v90;
          uint64_t v80 = (unsigned int (**)(uint64_t, uint64_t))v183;
          uint64_t v92 = v88;
          uint64_t v78 = v87;
          int v81 = v188;
          uint64_t v93 = v89;
          unsigned int v83 = v193;
          uint64_t v55 = v194;
          (*v184)(v92, v93);
          if (v91 >> 60 != 15)
          {
            uint64_t v94 = sub_3FB20();
            uint64_t v96 = v95;
            uint64_t v97 = sub_406B0();
            id v99 = sub_AD48(v195, v91, v94, v96, v180, v181, v97, v98);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v100 = v99;
            sub_40730();
            if (*(void *)((char *)&dword_10 + (v198 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                            + (v198 & 0xFFFFFFFFFFFFFF8)) >> 1)
              sub_40780();
            sub_407A0();
            sub_40770();
            sub_117B0(v195, v91);

            uint64_t v82 = v182;
            unsigned int v83 = v193;
            uint64_t v55 = v194;
          }
        }
        else
        {
          (*v197)(v55, v82);
        }
        (*v197)((uint64_t)v83, v82);
        v79 += v196;
        if (!--v77) {
          break;
        }
        v78(v83, v79, v82);
      }
      swift_bridgeObjectRelease();
      uint64_t v11 = v169;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v82 = v182;
    }
    uint64_t v101 = (uint64_t)v175;
    sub_3FD90();
    uint64_t v102 = v178;
    unint64_t v104 = v178 + 48;
    uint64_t v103 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v178 + 48);
    int v105 = v103(v101, 1, v82);
    uint64_t v106 = v177;
    uint64_t v107 = v174;
    if (v105 == 1)
    {
      sub_ACEC(v101, &qword_4D218);
      a4 = v159;
    }
    else
    {
      v197 = (void (**)(uint64_t, uint64_t))v103;
      (*(void (**)(char *, uint64_t, uint64_t))(v102 + 32))(v177, v101, v82);
      uint64_t v108 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
      v108(v107, v106, v82);
      uint64_t v109 = v82;
      id v110 = *(unsigned int (**)(char *, uint64_t))(v102 + 88);
      if (v110(v107, v82) == enum case for ResponseOutput.VisualOutput.pluginSnippet(_:))
      {
        (*(void (**)(char *, uint64_t))(v102 + 96))(v107, v82);
        uint64_t v111 = v166;
        v112 = v165;
        uint64_t v113 = v167;
        (*(void (**)(char *, char *, uint64_t))(v166 + 32))(v165, v107, v167);
        uint64_t v114 = sub_3FCD0();
        uint64_t v116 = v115;
        uint64_t v194 = sub_3FCE0();
        uint64_t v118 = v117;
        (*(void (**)(char *, uint64_t))(v111 + 8))(v112, v113);
        uint64_t v119 = sub_406B0();
        uint64_t v195 = v114;
        unint64_t v196 = v116;
        id v121 = sub_AD48(v114, v116, v194, v118, v180, v181, v119, v120);
        swift_bridgeObjectRelease();
        id v122 = v121;
        sub_40730();
        if (*(void *)((char *)&dword_10 + (v198 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                        + (v198 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_40780();
        sub_407A0();
        sub_40770();
        sub_117C4(v195, v196);

        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v102 + 8))(v177, v109);
        uint64_t v82 = v109;
        a4 = v159;
        uint64_t v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v197;
      }
      else
      {
        unint64_t v196 = v104;
        int v123 = *(void (**)(char *, uint64_t))(v102 + 8);
        v123(v107, v82);
        uint64_t v124 = v164;
        v125 = v177;
        v108(v164, v177, v82);
        uint64_t v126 = v124;
        if (v110(v124, v82) == enum case for ResponseOutput.VisualOutput.systemSnippet(_:))
        {
          int v127 = v123;
          (*(void (**)(char *, uint64_t))(v102 + 96))(v126, v82);
          uint64_t v128 = v176;
          v129 = v162;
          v130 = v126;
          uint64_t v131 = v191;
          (*(void (**)(char *, char *, uint64_t))(v176 + 32))(v162, v130, v191);
          v132 = v160;
          sub_3FD00();
          (*(void (**)(char *, uint64_t))(v128 + 8))(v129, v131);
          uint64_t v133 = v173;
          uint64_t v134 = v161;
          uint64_t v135 = v132;
          uint64_t v136 = v192;
          (*(void (**)(char *, char *, uint64_t))(v173 + 32))(v161, v135, v192);
          sub_13934(&qword_4D260, (void (*)(uint64_t))&type metadata accessor for RGPluginModel);
          uint64_t v137 = sub_3EDC0();
          a4 = v159;
          if (v138 >> 60 == 15)
          {
            (*(void (**)(char *, uint64_t))(v133 + 8))(v134, v136);
            v127(v177, v109);
            uint64_t v11 = v169;
            uint64_t v82 = v109;
          }
          else
          {
            uint64_t v139 = v137;
            unint64_t v140 = v138;
            uint64_t v141 = sub_3FB20();
            uint64_t v143 = v142;
            uint64_t v144 = sub_406B0();
            id v146 = sub_AD48(v139, v140, v141, v143, v180, v181, v144, v145);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v147 = v146;
            sub_40730();
            if (*(void *)((char *)&dword_10 + (v198 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                            + (v198 & 0xFFFFFFFFFFFFFF8)) >> 1)
              sub_40780();
            sub_407A0();
            sub_40770();
            sub_117B0(v139, v140);

            (*(void (**)(char *, uint64_t))(v173 + 8))(v134, v192);
            uint64_t v82 = v182;
            v127(v177, v182);
            uint64_t v11 = v169;
          }
          uint64_t v102 = v178;
        }
        else
        {
          v123(v124, v82);
          v123(v125, v82);
          uint64_t v11 = v169;
          a4 = v159;
        }
        uint64_t v103 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v197;
      }
    }
    sub_93B8((uint64_t)v11);
    if (v103((uint64_t)v11, 1, v82) == 1)
    {
      v148 = &qword_4D218;
      uint64_t v149 = (uint64_t)v11;
    }
    else
    {
      v150 = v170;
      (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v170, v11, v82);
      if ((*(unsigned int (**)(char *, uint64_t))(v102 + 88))(v150, v82) == enum case for ResponseOutput.VisualOutput.systemSnippet(_:))
      {
        (*(void (**)(char *, uint64_t))(v102 + 96))(v150, v82);
        uint64_t v151 = v176;
        v152 = v168;
        uint64_t v153 = v191;
        (*(void (**)(char *, char *, uint64_t))(v176 + 32))(v168, v150, v191);
        v154 = v171;
        sub_3FD00();
        (*(void (**)(char *, uint64_t))(v151 + 8))(v152, v153);
        uint64_t v155 = v173;
        uint64_t v156 = v192;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v173 + 56))(v154, 0, 1, v192);
        (*(void (**)(char *, uint64_t))(v102 + 8))(v11, v82);
      }
      else
      {
        v157 = *(void (**)(char *, uint64_t))(v102 + 8);
        v157(v150, v82);
        uint64_t v155 = v173;
        v154 = v171;
        uint64_t v156 = v192;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v173 + 56))(v171, 1, 1, v192);
        v157(v11, v82);
      }
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v155 + 48))(v154, 1, v156) != 1)
      {
        *(void *)(a4 + 24) = v156;
        *(void *)(a4 + 32) = sub_13934(&qword_4D260, (void (*)(uint64_t))&type metadata accessor for RGPluginModel);
        v158 = sub_1174C((uint64_t *)a4);
        uint64_t result = (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v155 + 32))(v158, v154, v156);
        goto LABEL_45;
      }
      v148 = &qword_4D1F0;
      uint64_t v149 = (uint64_t)v154;
    }
    uint64_t result = sub_ACEC(v149, v148);
    *(void *)(a4 + 32) = 0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
LABEL_45:
    unint64_t v50 = (void *)v198;
    goto LABEL_46;
  }
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(void *)(a4 + 32) = 0;
LABEL_46:
  *(void *)(a4 + 40) = v50;
  return result;
}

uint64_t sub_F0C0()
{
  return sub_3F2D0();
}

void *sub_F0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_3FE30();
  unint64_t v7 = v6;
  uint64_t v8 = sub_3FE00();
  uint64_t v10 = v9;
  uint64_t v11 = sub_406B0();
  id v13 = sub_AD48(v5, v7, v8, v10, a2, a3, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_117C4(v5, v7);
  id v14 = v13;
  sub_40730();
  if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_40780();
  }
  sub_407A0();
  sub_40770();
  uint64_t v15 = sub_3FE10();
  if (v16 >> 60 == 15)
  {
  }
  else
  {
    uint64_t v17 = v15;
    unint64_t v18 = v16;
    uint64_t v19 = sub_3FE20();
    if (v20)
    {
      uint64_t v21 = v19;
      uint64_t v22 = v20;
      uint64_t v23 = sub_406B0();
      id v25 = sub_AD48(v17, v18, v21, v22, a2, a3, v23, v24);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v26 = v25;
      sub_40730();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_40780();
      }
      sub_407A0();
      sub_40770();

      sub_117B0(v17, v18);
    }
    else
    {

      sub_117B0(v17, v18);
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_F318(uint64_t a1)
{
  uint64_t v112 = sub_3F700();
  uint64_t v106 = *(void *)(v112 - 8);
  __chkstk_darwin(v112);
  int v105 = (char *)&v91 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3F740();
  uint64_t v100 = *(void *)(v3 - 8);
  uint64_t v101 = v3;
  __chkstk_darwin(v3);
  unint64_t v91 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_5044(&qword_4D2D8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v99 = (uint64_t)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v102 = (char *)&v91 - v8;
  uint64_t v9 = sub_5044(&qword_4D2C0);
  uint64_t v103 = *(void *)(v9 - 8);
  __chkstk_darwin(v9 - 8);
  unint64_t v104 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_3F5A0();
  uint64_t v107 = *(void *)(v97 - 8);
  __chkstk_darwin(v97);
  uint64_t v96 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_5044(&qword_4D2E0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v95 = (uint64_t)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v109 = (char **)((char *)&v91 - v16);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v94 = (uint64_t)&v91 - v18;
  __chkstk_darwin(v17);
  uint64_t v108 = (uint64_t)&v91 - v19;
  uint64_t v20 = sub_5044(&qword_4D2E8);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v98 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v111 = (char *)&v91 - v24;
  __chkstk_darwin(v23);
  uint64_t v110 = (uint64_t)&v91 - v25;
  uint64_t v26 = sub_3ED50();
  uint64_t v93 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v91 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_5044(&qword_4D240);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  uint64_t v32 = (char *)&v91 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v91 - v33;
  uint64_t v35 = a1;
  sub_1375C(a1, (uint64_t)&v91 - v33, &qword_4D240);
  uint64_t v36 = sub_400E0();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
  if (v38(v34, 1, v36) == 1)
  {
    sub_ACEC((uint64_t)v34, &qword_4D240);
    uint64_t v92 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = v93;
  }
  else
  {
    sub_400C0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v36);
    uint64_t v92 = sub_3ED40();
    uint64_t v39 = v41;
    uint64_t v40 = v93;
    (*(void (**)(char *, uint64_t))(v93 + 8))(v28, v26);
  }
  sub_1375C(v35, (uint64_t)v32, &qword_4D240);
  if (v38(v32, 1, v36) == 1)
  {
    sub_ACEC((uint64_t)v32, &qword_4D240);
    uint64_t v42 = 0;
    uint64_t v43 = 0;
  }
  else
  {
    sub_400D0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v36);
    uint64_t v42 = sub_3ED40();
    uint64_t v43 = v44;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v26);
  }
  uint64_t v45 = v110;
  uint64_t v46 = v108;
  sub_100E0(v39, v108);
  swift_bridgeObjectRelease();
  uint64_t v47 = v94;
  sub_1375C(v46, v94, &qword_4D2E0);
  uint64_t v48 = v107;
  unint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v107 + 48);
  uint64_t v50 = v97;
  if (v49(v47, 1, v97) == 1)
  {
    uint64_t v51 = sub_3F690();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v45, 1, 1, v51);
  }
  else
  {
    unint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
    uint64_t v93 = v42;
    uint64_t v53 = v45;
    uint64_t v54 = v96;
    v52(v96, v47, v50);
    uint64_t v55 = sub_3F690();
    __chkstk_darwin(v55);
    *(&v91 - 2) = v54;
    sub_13934(&qword_4D2F0, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    sub_404C0();
    unint64_t v56 = v54;
    uint64_t v45 = v53;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v56, v50);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v53, 0, 1, v55);
  }
  uint64_t v57 = (uint64_t)v98;
  uint64_t v58 = v50;
  sub_ACEC(v108, &qword_4D2E0);
  uint64_t v59 = (void (*)(void, void, void, void))v109;
  sub_100E0(v43, (uint64_t)v109);
  swift_bridgeObjectRelease();
  uint64_t v60 = v95;
  sub_1375C((uint64_t)v59, v95, &qword_4D2E0);
  if (v49(v60, 1, v58) == 1)
  {
    uint64_t v61 = sub_3F690();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v111, 1, 1, v61);
  }
  else
  {
    uint64_t v62 = v107;
    uint64_t v63 = v45;
    uint64_t v64 = v96;
    (*(void (**)(char *, uint64_t, uint64_t))(v107 + 32))(v96, v60, v58);
    uint64_t v61 = sub_3F690();
    __chkstk_darwin(v61);
    *(&v91 - 2) = v64;
    sub_13934(&qword_4D2F0, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    uint64_t v65 = v111;
    sub_404C0();
    uint64_t v66 = v64;
    uint64_t v45 = v63;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v66, v58);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v65, 0, 1, v61);
  }
  uint64_t v67 = v101;
  uint64_t v68 = (uint64_t)v102;
  uint64_t v69 = v100;
  sub_ACEC((uint64_t)v109, &qword_4D2E0);
  sub_1375C(v45, v57, &qword_4D2E8);
  sub_3F690();
  uint64_t v70 = *(void *)(v61 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v57, 1, v61) == 1)
  {
    sub_ACEC(v57, &qword_4D2E8);
    uint64_t v71 = 1;
  }
  else
  {
    sub_3F650();
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v57, v61);
    uint64_t v71 = 0;
  }
  uint64_t v72 = v112;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v68, v71, 1, v67);
  uint64_t v73 = v99;
  sub_1375C(v68, v99, &qword_4D2D8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v73, 1, v67) == 1)
  {
    uint64_t v74 = v106;
    id v75 = *(char ***)(v106 + 56);
    uint64_t v76 = (uint64_t)v104;
    uint64_t v77 = v104;
    uint64_t v78 = 1;
  }
  else
  {
    uint64_t v76 = (uint64_t)v104;
    unint64_t v79 = v91;
    uint64_t v80 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v69 + 32))(v91, v73, v67);
    __chkstk_darwin(v80);
    *(&v91 - 2) = v79;
    sub_13934(&qword_4D2C8, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
    sub_404C0();
    uint64_t v72 = v112;
    (*(void (**)(char *, uint64_t))(v69 + 8))(v79, v67);
    uint64_t v74 = v106;
    id v75 = *(char ***)(v106 + 56);
    uint64_t v77 = (char *)v76;
    uint64_t v78 = 0;
  }
  uint64_t v109 = v75;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v75)(v77, v78, 1, v72);
  uint64_t v81 = sub_ACEC(v68, &qword_4D2D8);
  __chkstk_darwin(v81);
  uint64_t v82 = (uint64_t)v111;
  *(&v91 - 2) = (char *)v45;
  *(&v91 - 1) = (char *)v82;
  sub_13934(&qword_4D2C8, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemDialogAct);
  unsigned int v83 = v105;
  uint64_t v84 = v72;
  sub_404C0();
  sub_5044(&qword_4D2D0);
  uint64_t v85 = *(void *)(v103 + 72);
  unint64_t v86 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
  uint64_t v87 = swift_allocObject();
  *(_OWORD *)(v87 + 16) = xmmword_41200;
  uint64_t v88 = v87 + v86;
  sub_1375C(v76, v88, &qword_4D2C0);
  uint64_t v89 = v88 + v85;
  (*(void (**)(uint64_t, char *, uint64_t))(v74 + 16))(v89, v83, v84);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v109)(v89, 0, 1, v84);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v83, v84);
  sub_ACEC(v76, &qword_4D2C0);
  sub_ACEC(v82, &qword_4D2E8);
  sub_ACEC(v110, &qword_4D2E8);
  return v87;
}

uint64_t sub_100E0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_5044(&qword_4D328);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_3F850();
    swift_allocObject();
    uint64_t v7 = sub_3F840();
    sub_3F800();
    swift_allocObject();
    sub_3F7F0();
    sub_3F7E0();
    sub_3F880();
    sub_5044(&qword_4D208);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_41190;
    *(void *)(v8 + 32) = v7;
    v14[1] = v8;
    sub_40770();
    uint64_t v9 = sub_3F7C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
    swift_retain();
    sub_3F7A0();
    swift_bridgeObjectRelease();
    sub_ACEC((uint64_t)v6, &qword_4D328);
    sub_3F780();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v12 = sub_3F5A0();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 0, 1, v12);
  }
  else
  {
    uint64_t v10 = sub_3F5A0();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    return v11(a2, 1, 1, v10);
  }
}

uint64_t sub_1039C()
{
  uint64_t v0 = sub_3F740();
  __chkstk_darwin(v0);
  sub_13934(&qword_4D2F8, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserWantedToProceed);
  sub_404C0();
  return sub_3F660();
}

uint64_t sub_104A4()
{
  uint64_t v0 = sub_3F5D0();
  __chkstk_darwin(v0);
  sub_13934(&qword_4D300, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserRejected);
  sub_404C0();
  return sub_3F670();
}

uint64_t sub_105AC()
{
  uint64_t v0 = sub_3F5F0();
  __chkstk_darwin(v0);
  sub_13934(&qword_4D308, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemOffered);
  sub_404C0();
  return sub_3F6E0();
}

uint64_t sub_106B4()
{
  uint64_t v0 = sub_3F690();
  __chkstk_darwin(v0);
  sub_13934(&qword_4D2F0, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
  sub_404C0();
  return sub_3F5E0();
}

uint64_t sub_107BC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(char *))
{
  a3(0);
  __chkstk_darwin();
  uint64_t v7 = (char *)v10 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)v10 - v6, a2);
  return a4(v7);
}

uint64_t sub_108A0()
{
  uint64_t v0 = sub_3F730();
  __chkstk_darwin(v0);
  sub_13934(&qword_4D310, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_SystemGaveOptions);
  sub_404C0();
  return sub_3F6D0();
}

uint64_t sub_109AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = a1;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v3 = sub_3F690();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v45 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v43 = sub_5044(&qword_4D2E8);
  uint64_t v9 = *(void *)(v43 - 8);
  uint64_t v10 = __chkstk_darwin(v43);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v36 - v13;
  sub_5044(&qword_4D318);
  uint64_t v15 = *(void *)(v9 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_41200;
  uint64_t v18 = v17 + v16;
  sub_1375C(v41, v18, &qword_4D2E8);
  uint64_t v40 = v18 + v15;
  sub_1375C(v42, v18 + v15, &qword_4D2E8);
  uint64_t v41 = v18;
  sub_1375C(v18, (uint64_t)v14, &qword_4D2E8);
  sub_1397C((uint64_t)v14, (uint64_t)v12, &qword_4D2E8);
  uint64_t v19 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t v42 = v4;
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  int v20 = v39(v12, 1, v3);
  uint64_t v38 = v8;
  if (v20 == 1)
  {
    sub_ACEC((uint64_t)v12, &qword_4D2E8);
    uint64_t v21 = (char *)_swiftEmptyArrayStorage;
    uint64_t v22 = v3;
    uint64_t v23 = v45;
  }
  else
  {
    uint64_t v24 = *v19;
    (*v19)(v8, v12, v3);
    uint64_t v37 = v24;
    v24(v45, v8, v3);
    uint64_t v21 = (char *)_swiftEmptyArrayStorage;
    uint64_t v22 = v3;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v21 = (char *)sub_113BC(0, _swiftEmptyArrayStorage[2] + 1, 1, (unint64_t)_swiftEmptyArrayStorage, &qword_4D320, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    unint64_t v26 = *((void *)v21 + 2);
    unint64_t v25 = *((void *)v21 + 3);
    if (v26 >= v25 >> 1) {
      uint64_t v21 = (char *)sub_113BC(v25 > 1, v26 + 1, 1, (unint64_t)v21, &qword_4D320, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    *((void *)v21 + 2) = v26 + 1;
    unint64_t v27 = (unint64_t)&v21[((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))
                               + *(void *)(v42 + 72) * v26];
    uint64_t v23 = v45;
    v37((char *)v27, v45, v22);
  }
  sub_1375C(v40, (uint64_t)v14, &qword_4D2E8);
  sub_1397C((uint64_t)v14, (uint64_t)v12, &qword_4D2E8);
  if (v39(v12, 1, v22) == 1)
  {
    sub_ACEC((uint64_t)v12, &qword_4D2E8);
  }
  else
  {
    uint64_t v28 = *v19;
    uint64_t v29 = v22;
    uint64_t v30 = v38;
    (*v19)(v38, v12, v29);
    uint64_t v31 = v30;
    uint64_t v32 = v29;
    v28(v23, v31, v29);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v21 = (char *)sub_113BC(0, *((void *)v21 + 2) + 1, 1, (unint64_t)v21, &qword_4D320, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    unint64_t v34 = *((void *)v21 + 2);
    unint64_t v33 = *((void *)v21 + 3);
    if (v34 >= v33 >> 1) {
      uint64_t v21 = (char *)sub_113BC(v33 > 1, v34 + 1, 1, (unint64_t)v21, &qword_4D320, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
    }
    *((void *)v21 + 2) = v34 + 1;
    v28(&v21[((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))+ *(void *)(v42 + 72) * v34], v23, v32);
  }
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return sub_3F710();
}

uint64_t sub_10EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  v21[2] = a4;
  v21[3] = a3;
  v21[0] = a2;
  v21[1] = a1;
  uint64_t v6 = sub_5044(&qword_4D350);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_5044(&qword_4D290);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_3EDB0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3EDA0();
  sub_3ED80();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v16 = sub_40660();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, void, uint64_t))(v17 + 16))(v11, v21[0], v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v11, 0, 1, v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_405D0();
  uint64_t v18 = sub_405E0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 0, 1, v18);
  sub_405F0();
  uint64_t v19 = sub_40600();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a5, 0, 1, v19);
}

uint64_t sub_11380(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_11398(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_113BC(a1, a2, a3, a4, &qword_4D320, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct, (uint64_t (*)(void))&type metadata accessor for Siri_Nlu_External_UserDialogAct);
}

uint64_t sub_113BC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_5044(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_408F0();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_11BD0(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_1163C(void *result, int64_t a2, char a3, void *a4)
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
      sub_5044(&qword_4D2A8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_124A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_1174C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_117B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_117C4(a1, a2);
  }
  return a1;
}

uint64_t sub_117C4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1181C(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    sub_117C4(result, a2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1185C(uint64_t a1)
{
  uint64_t v2 = sub_400B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3FB10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3FE50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v14 == enum case for StatementOutcome.success(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    sub_5044(&qword_4D2B0);
    sub_40660();
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_411F0;
    sub_3FB00();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else if (v14 == enum case for StatementOutcome.parameterDisambiguation(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    uint64_t v15 = sub_400A0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return _swiftEmptyArrayStorage;
  }
  return (void *)v15;
}

uint64_t sub_11BD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

char *sub_11D2C(uint64_t a1, void (*a2)(uint64_t, char *))
{
  uint64_t v4 = sub_5044(&qword_4D338);
  __chkstk_darwin(v4 - 8);
  uint64_t v45 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_40600();
  uint64_t v6 = *(void *)(v50 - 8);
  uint64_t v7 = __chkstk_darwin(v50);
  unint64_t v49 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v37 = (char *)v34 - v9;
  uint64_t v48 = sub_5044(&qword_4D340);
  uint64_t v10 = __chkstk_darwin(v48);
  uint64_t v47 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v13 = (void *)((char *)v34 - v12);
  uint64_t v14 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v46 = v14;
  v34[1] = a1;
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v44 = sub_40660();
    uint64_t v16 = *(void *)(v44 - 8);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    uint64_t v42 = v16 + 16;
    uint64_t v43 = v17;
    uint64_t v18 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    uint64_t v19 = *(void *)(v16 + 72);
    uint64_t v40 = (void (**)(char *, char *, uint64_t))(v16 + 32);
    uint64_t v41 = v19;
    uint64_t v35 = v6;
    uint64_t v38 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    uint64_t v39 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    BOOL v20 = (char *)_swiftEmptyArrayStorage;
    uint64_t v21 = a2;
    uint64_t v36 = a2;
    do
    {
      uint64_t v22 = v48;
      unint64_t v23 = &v47[*(int *)(v48 + 48)];
      uint64_t v24 = v44;
      v43(v23, v18, v44);
      unint64_t v25 = (char *)v13 + *(int *)(v22 + 48);
      *unint64_t v13 = v15;
      (*v40)(v25, v23, v24);
      uint64_t v26 = (uint64_t)v45;
      v21(v15, v25);
      sub_ACEC((uint64_t)v13, &qword_4D340);
      uint64_t v27 = v50;
      if ((*v39)(v26, 1, v50) == 1)
      {
        sub_ACEC(v26, &qword_4D338);
      }
      else
      {
        uint64_t v28 = *v38;
        uint64_t v29 = v26;
        uint64_t v30 = v37;
        (*v38)(v37, v29, v27);
        v28(v49, (uint64_t)v30, v27);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          BOOL v20 = (char *)sub_113BC(0, *((void *)v20 + 2) + 1, 1, (unint64_t)v20, &qword_4D348, (uint64_t (*)(void))&type metadata accessor for RREntity, (uint64_t (*)(void))&type metadata accessor for RREntity);
        }
        unint64_t v32 = *((void *)v20 + 2);
        unint64_t v31 = *((void *)v20 + 3);
        if (v32 >= v31 >> 1) {
          BOOL v20 = (char *)sub_113BC(v31 > 1, v32 + 1, 1, (unint64_t)v20, &qword_4D348, (uint64_t (*)(void))&type metadata accessor for RREntity, (uint64_t (*)(void))&type metadata accessor for RREntity);
        }
        *((void *)v20 + 2) = v32 + 1;
        v28(&v20[((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(void *)(v35 + 72) * v32], (uint64_t)v49, v50);
        uint64_t v21 = v36;
      }
      ++v15;
      v18 += v41;
    }
    while (v46 != v15);
  }
  else
  {
    BOOL v20 = (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  return v20;
}

char *sub_1216C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    uint64_t v5 = sub_1185C(a5);
    uint64_t v6 = __chkstk_darwin(v5);
    uint64_t v7 = sub_11D2C(v6, (void (*)(uint64_t, char *))sub_139E0);
    swift_bridgeObjectRelease();
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_405B0();
    sub_4A6C(v8, (uint64_t)qword_4E370);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_405A0();
    os_log_type_t v10 = sub_407F0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134218242;
      uint64_t v21 = v12;
      sub_40860();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      sub_40600();
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_40760();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      sub_17898(v13, v15, &v21);
      sub_40860();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v9, v10, "IFFlow donating %ld RREntities: %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_405B0();
    sub_4A6C(v16, (uint64_t)qword_4E370);
    uint64_t v17 = sub_405A0();
    os_log_type_t v18 = sub_40800();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "Nil requestId. Not donating entities to SRR", v19, 2u);
      swift_slowDealloc();
    }

    return (char *)_swiftEmptyArrayStorage;
  }
  return v7;
}

uint64_t sub_124A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

uint64_t sub_12594(uint64_t a1)
{
  uint64_t v2 = sub_40650();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5044(&qword_4D290);
  __chkstk_darwin(v6 - 8);
  uint64_t v70 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_40640();
  uint64_t v8 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v72 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_40660();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v53 - v15;
  uint64_t v17 = sub_1185C(a1);
  uint64_t v18 = v17[2];
  if (v18)
  {
    uint64_t v60 = (uint64_t *)v5;
    uint64_t v61 = v2;
    BOOL v20 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v19 = v11 + 16;
    uint64_t v21 = (char *)v17 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
    uint64_t v74 = *(void *)(v19 + 56);
    id v75 = v20;
    uint64_t v76 = (uint64_t (**)(char *, uint64_t))(v19 + 72);
    int v71 = enum case for TypedValue.entity(_:);
    uint64_t v73 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v69 = (void (**)(char *, uint64_t))(v19 + 80);
    uint64_t v66 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v67 = (void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v64 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
    uint64_t v65 = (void (**)(char *, uint64_t))(v8 + 8);
    int v63 = enum case for TypedValue.primitive(_:);
    uint64_t v58 = (uint64_t (**)(uint64_t *, uint64_t))(v3 + 88);
    uint64_t v59 = (void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 16);
    int v57 = enum case for TypedValue.PrimitiveValue.string(_:);
    uint64_t v55 = (void (**)(uint64_t *, uint64_t))(v3 + 8);
    uint64_t v54 = (void (**)(uint64_t *, uint64_t))(v3 + 96);
    uint64_t v53 = v17;
    swift_bridgeObjectRetain();
    uint64_t v62 = _swiftEmptyArrayStorage;
    uint64_t v22 = v56;
    uint64_t v68 = v16;
    while (1)
    {
      uint64_t v24 = v75;
      v75(v16, v21, v10);
      v24(v14, v16, v10);
      unint64_t v25 = *v76;
      int v26 = (*v76)(v14, v10);
      if (v26 == v71) {
        break;
      }
      unint64_t v23 = *v73;
      (*v73)(v14, v10);
      v23(v16, v10);
LABEL_4:
      v21 += v74;
      if (!--v18)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v46 = v62;
        goto LABEL_26;
      }
    }
    uint64_t v27 = v19;
    uint64_t v28 = *v69;
    (*v69)(v14, v10);
    uint64_t v29 = swift_projectBox();
    (*v67)(v72, v29, v22);
    swift_release();
    uint64_t v30 = sub_40630();
    if (*(void *)(v30 + 16) && (unint64_t v31 = sub_17EF0(0x65736E6F70736572, 0xE800000000000000), (v32 & 1) != 0))
    {
      v75(v70, (char *)(*(void *)(v30 + 56) + v31 * v74), v10);
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = 1;
    }
    uint64_t v34 = (uint64_t)v70;
    (*v66)(v70, v33, 1, v10);
    swift_bridgeObjectRelease();
    (*v65)(v72, v22);
    if ((*v64)(v34, 1, v10) == 1)
    {
      sub_ACEC(v34, &qword_4D290);
      uint64_t v19 = v27;
    }
    else
    {
      int v35 = v25((char *)v34, v10);
      uint64_t v19 = v27;
      if (v35 == v63)
      {
        v28((char *)v34, v10);
        uint64_t v36 = swift_projectBox();
        uint64_t v37 = v60;
        uint64_t v38 = v61;
        (*v59)(v60, v36, v61);
        int v39 = (*v58)(v37, v38);
        uint64_t v16 = v68;
        if (v39 == v57)
        {
          (*v54)(v37, v38);
          uint64_t v40 = *v37;
          uint64_t v41 = v37[1];
          uint64_t v56 = v40;
          swift_release();
          (*v73)(v16, v10);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t v42 = v62;
          }
          else {
            uint64_t v42 = sub_1163C(0, v62[2] + 1, 1, v62);
          }
          unint64_t v44 = v42[2];
          unint64_t v43 = v42[3];
          if (v44 >= v43 >> 1) {
            uint64_t v42 = sub_1163C((void *)(v43 > 1), v44 + 1, 1, v42);
          }
          v42[2] = v44 + 1;
          uint64_t v62 = v42;
          uint64_t v45 = &v42[2 * v44];
          v45[4] = v56;
          v45[5] = v41;
          goto LABEL_4;
        }
        (*v55)(v37, v38);
        swift_release();
        goto LABEL_21;
      }
      (*v73)((char *)v34, v10);
    }
    uint64_t v16 = v68;
LABEL_21:
    (*v73)(v16, v10);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  uint64_t v46 = _swiftEmptyArrayStorage;
LABEL_26:
  uint64_t v77 = (uint64_t)v46;
  sub_5044(&qword_4D298);
  sub_136A8();
  uint64_t v47 = sub_40680();
  swift_bridgeObjectRelease();
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v48 = sub_405B0();
  sub_4A6C(v48, (uint64_t)qword_4E370);
  swift_bridgeObjectRetain();
  unint64_t v49 = sub_405A0();
  os_log_type_t v50 = sub_407F0();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 134217984;
    uint64_t v77 = sub_406F0();
    sub_40860();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v49, v50, "IFFlow retrieving string content for feedback form with length: %ld", v51, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return v47;
}

uint64_t sub_12DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  sub_13600();
  uint64_t v2 = sub_40890();
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    goto LABEL_7;
  }
  uint64_t v4 = (uint64_t *)(v2 + 32 * v3);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v8 = v4[2];
  uint64_t v7 = v4[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v5;
  uint64_t v19 = v6;
  uint64_t v20 = v8;
  uint64_t v21 = v7;
  sub_13654();
  if (sub_40880())
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_405B0();
    sub_4A6C(v9, (uint64_t)qword_4E370);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = sub_405A0();
    os_log_type_t v11 = sub_407F0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_406D0();
      unint64_t v15 = v14;
      swift_bridgeObjectRelease();
      sub_17898(v13, v15, &v18);
      sub_40860();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v10, v11, "IFFlow setting subFeature as: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v16 = sub_406D0();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v16;
}

id sub_13084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3FDF0();
  uint64_t v47 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = &v39[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_3FE50();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_30BE4((uint64_t)v12);
  id v13 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t))(v10 + 88))(v12, v9) == enum case for StatementOutcome.success(_:))
  {
    uint64_t v45 = a2;
    uint64_t v46 = a3;
    uint64_t v14 = sub_30ECC();
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = 0xD000000000000012;
    }
    if (v15) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = 0x8000000000043410;
    }
    v50[0] = v16;
    v50[1] = v17;
    uint64_t v48 = 0xD000000000000022;
    unint64_t v49 = 0x8000000000043430;
    sub_13558();
    sub_135AC();
    char v18 = sub_40670();
    swift_bridgeObjectRelease();
    if (v18)
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_405B0();
      sub_4A6C(v19, (uint64_t)qword_4E370);
      uint64_t v20 = v47;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v47 + 16))(v8, a1, v6);
      uint64_t v21 = sub_405A0();
      os_log_type_t v22 = sub_407F0();
      int v23 = v22;
      BOOL v24 = os_log_type_enabled(v21, v22);
      unint64_t v44 = (unint64_t)"omptResult case: ";
      if (v24)
      {
        os_log_t v43 = v21;
        unint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        v50[0] = v42;
        int v40 = v23;
        uint64_t v41 = a1;
        int v26 = v25;
        *(_DWORD *)unint64_t v25 = 136315138;
        unint64_t v27 = sub_30ECC();
        if (v28)
        {
          unint64_t v29 = v28;
        }
        else
        {
          unint64_t v27 = 0xD000000000000012;
          unint64_t v29 = 0x8000000000043410;
        }
        uint64_t v48 = sub_17898(v27, v29, v50);
        sub_40860();
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v20 + 8))(v8, v6);
        uint64_t v21 = v43;
        _os_log_impl(&dword_0, v43, (os_log_type_t)v40, "IFFlow creating feedback form for toolId: %s", v26, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t))(v20 + 8))(v8, v6);
      }

      uint64_t v30 = v46;
      id v13 = [objc_allocWithZone((Class)SAUIFeedbackForm) init];
      if (v30)
      {
        NSString v31 = sub_406A0();
        [v13 setOutput:v31];
      }
      [v13 setDomain:SAUIFeedbackFormDomainSiriWithChatGPTValue];
      unint64_t v32 = sub_30ECC();
      if (v33)
      {
        unint64_t v34 = v33;
      }
      else
      {
        unint64_t v32 = 0xD000000000000012;
        unint64_t v34 = v44 | 0x8000000000000000;
      }
      sub_12DBC(v32, v34);
      uint64_t v36 = v35;
      swift_bridgeObjectRelease();
      if (v36)
      {
        NSString v37 = sub_406A0();
        swift_bridgeObjectRelease();
        [v13 setSubFeature:v37];
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
  return v13;
}

unint64_t sub_13558()
{
  unint64_t result = qword_4D270;
  if (!qword_4D270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D270);
  }
  return result;
}

unint64_t sub_135AC()
{
  unint64_t result = qword_4D278;
  if (!qword_4D278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D278);
  }
  return result;
}

unint64_t sub_13600()
{
  unint64_t result = qword_4D280;
  if (!qword_4D280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D280);
  }
  return result;
}

unint64_t sub_13654()
{
  unint64_t result = qword_4D288;
  if (!qword_4D288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D288);
  }
  return result;
}

unint64_t sub_136A8()
{
  unint64_t result = qword_4D2A0;
  if (!qword_4D2A0)
  {
    sub_8C90(&qword_4D298);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2A0);
  }
  return result;
}

unint64_t sub_13708()
{
  unint64_t result = qword_4D2B8;
  if (!qword_4D2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2B8);
  }
  return result;
}

uint64_t sub_1375C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5044(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_137C0()
{
  return sub_108A0();
}

uint64_t sub_137DC()
{
  return sub_105AC();
}

uint64_t sub_137F8()
{
  return sub_104A4();
}

uint64_t sub_13814()
{
  return sub_1039C();
}

uint64_t sub_13830(uint64_t a1)
{
  return sub_107BC(a1, *(void *)(v1 + 16), (void (*)(void))&type metadata accessor for Siri_Nlu_External_UsoGraph, (uint64_t (*)(char *))&Siri_Nlu_External_UserWantedToProceed.reference.setter);
}

uint64_t sub_13874(uint64_t a1)
{
  return sub_107BC(a1, *(void *)(v1 + 16), (void (*)(void))&type metadata accessor for Siri_Nlu_External_UsoGraph, (uint64_t (*)(char *))&Siri_Nlu_External_UserRejected.reference.setter);
}

uint64_t sub_138B8()
{
  return sub_106B4();
}

uint64_t sub_138D4(uint64_t a1)
{
  return sub_107BC(a1, *(void *)(v1 + 16), (void (*)(void))&type metadata accessor for Siri_Nlu_External_UserWantedToProceed, (uint64_t (*)(char *))&Siri_Nlu_External_UserDialogAct.wantedToProceed.setter);
}

uint64_t sub_13918(uint64_t a1)
{
  return sub_109AC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_13934(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1397C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5044(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_139E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10EEC(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 32), a3);
}

uint64_t initializeBufferWithCopyOfBuffer for IFOutputBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IFOutputBuilder(uint64_t a1)
{
  sub_8CD8(a1);
  sub_8CD8(a1 + 40);
  swift_release();

  return sub_8CD8(a1 + 88);
}

uint64_t initializeWithCopy for IFOutputBuilder(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v6 = a2 + 88;
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain();
  v9(a1 + 88, v6, v8);
  return a1;
}

uint64_t *assignWithCopy for IFOutputBuilder(uint64_t *a1, uint64_t *a2)
{
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  sub_13BF0(a1 + 11, a2 + 11);
  return a1;
}

uint64_t *sub_13BF0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
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
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
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
          uint64_t *v3 = *a2;
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

__n128 initializeWithTake for IFOutputBuilder(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for IFOutputBuilder(uint64_t a1, uint64_t a2)
{
  sub_8CD8(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_8CD8(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_release();
  sub_8CD8(a1 + 88);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for IFOutputBuilder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IFOutputBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IFOutputBuilder()
{
  return &type metadata for IFOutputBuilder;
}

uint64_t getEnumTagSinglePayload for FeatureEnablementProvider.Key(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for FeatureEnablementProvider.Key(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x14074);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1409C()
{
  return 0;
}

ValueMetadata *type metadata accessor for FeatureEnablementProvider.Key()
{
  return &type metadata for FeatureEnablementProvider.Key;
}

ValueMetadata *type metadata accessor for FeatureEnablementProvider()
{
  return &type metadata for FeatureEnablementProvider;
}

unint64_t sub_140C8()
{
  unint64_t result = qword_4D360;
  if (!qword_4D360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D360);
  }
  return result;
}

uint64_t sub_1411C()
{
  return 1;
}

Swift::Int sub_14124()
{
  return sub_409F0();
}

void sub_14168()
{
}

Swift::Int sub_14190()
{
  return sub_409F0();
}

const char *sub_141D0()
{
  return "SiriIFFlow";
}

const char *sub_141E4()
{
  return "showASRForPQA";
}

uint64_t sub_141F8()
{
  uint64_t v0 = sub_3F510();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v35 = v0;
  uint64_t v36 = v1;
  __chkstk_darwin(v0);
  unint64_t v34 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3F550();
  uint64_t v33 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5044(&qword_4D368);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3F190();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_3F520();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F4B0();
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v16, v13);
  if (v17 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    uint64_t v18 = v35;
    uint64_t v19 = v36;
    uint64_t v20 = v34;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v34, v16, v35);
    uint64_t v21 = sub_3F4F0();
    uint64_t v23 = v22;
    BOOL v24 = (void *)sub_3F040();
    id v25 = [v24 identifier];

    uint64_t v26 = sub_406B0();
    uint64_t v28 = v27;

    if (v21 == v26 && v23 == v28) {
      char v29 = 1;
    }
    else {
      char v29 = sub_40970();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v18);
  }
  else
  {
    uint64_t v30 = v9;
    uint64_t v31 = v33;
    if (v17 == enum case for Parse.uso(_:))
    {
      (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v5, v16, v3);
      char v29 = sub_16090();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v3);
    }
    else
    {
      if (v17 == enum case for Parse.nlRouter(_:))
      {
        (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
        (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v16, v30);
        sub_3F150();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v8, 1, v3) != 1)
        {
          char v29 = sub_16090();
          (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v30);
          (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v3);
          return v29 & 1;
        }
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v30);
        sub_ACEC((uint64_t)v8, &qword_4D368);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      }
      char v29 = 0;
    }
  }
  return v29 & 1;
}

uint64_t sub_1470C()
{
  uint64_t v0 = sub_3F510();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v38 = v0;
  uint64_t v39 = v1;
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3F550();
  uint64_t v37 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5044(&qword_4D368);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3F190();
  uint64_t v36 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_3F520();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F4B0();
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v16, v13);
  if (v17 != enum case for Parse.directInvocation(_:))
  {
    uint64_t v24 = v36;
    uint64_t v25 = v37;
    if (v17 == enum case for Parse.uso(_:))
    {
      (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v6, v16, v4);
      uint64_t v26 = sub_16584();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v4);
      return v26;
    }
    if (v17 == enum case for Parse.nlRouter(_:))
    {
      (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v12, v16, v10);
      sub_3F150();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v9, 1, v4) != 1)
      {
        uint64_t v26 = sub_16584();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v4);
        return v26;
      }
      (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v10);
      sub_ACEC((uint64_t)v9, &qword_4D368);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
  uint64_t v19 = v38;
  uint64_t v18 = v39;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v3, v16, v38);
  uint64_t v20 = sub_3F4F0();
  uint64_t v22 = v21;
  if (v20 == sub_3F030() && v22 == v23)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = sub_40970();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v19);
      return 0;
    }
  }
  uint64_t v28 = sub_3F500();
  if (!v28)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v19);
    long long v41 = 0u;
    long long v42 = 0u;
LABEL_21:
    sub_ACEC((uint64_t)&v41, &qword_4D370);
    return 0;
  }
  uint64_t v29 = v28;
  uint64_t v30 = sub_3F020();
  if (*(void *)(v29 + 16) && (unint64_t v32 = sub_17EF0(v30, v31), (v33 & 1) != 0))
  {
    sub_17F68(*(void *)(v29 + 56) + 32 * v32, (uint64_t)&v41);
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v19);
  if (!*((void *)&v42 + 1)) {
    goto LABEL_21;
  }
  if (swift_dynamicCast()) {
    return v40;
  }
  else {
    return 0;
  }
}

uint64_t sub_14CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v51 = a2;
  uint64_t v2 = sub_3F730();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  unint64_t v49 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  os_log_type_t v50 = (char *)v44 - v5;
  uint64_t v57 = sub_3F690();
  uint64_t v6 = *(void *)(v57 - 8);
  uint64_t v7 = __chkstk_darwin(v57);
  uint64_t v56 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v58 = (char *)v44 - v9;
  uint64_t v10 = sub_3F5A0();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_3F6C0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  int v17 = (char *)v44 - v16;
  uint64_t v18 = sub_5044(&qword_4D328);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F870();
  swift_allocObject();
  uint64_t v21 = sub_3F860();
  sub_5044(&qword_4D208);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_41190;
  *(void *)(v22 + 32) = v21;
  uint64_t v59 = v22;
  sub_40770();
  uint64_t v23 = sub_3F7C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v20, 1, 1, v23);
  swift_retain();
  uint64_t v24 = v17;
  uint64_t v25 = sub_3F7A0();
  swift_bridgeObjectRelease();
  sub_ACEC((uint64_t)v20, &qword_4D328);
  sub_3F6B0();
  uint64_t v26 = v55;
  sub_3F780();
  if (v26)
  {
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v24, v11);
  }
  else
  {
    uint64_t v47 = v25;
    uint64_t v48 = v21;
    sub_3F6A0();
    uint64_t v28 = v58;
    sub_3F680();
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    uint64_t v55 = v24;
    v29(v15, v24, v11);
    uint64_t result = sub_3F640();
    uint64_t v30 = v54;
    if (v54 < 1)
    {
LABEL_14:
      __break(1u);
    }
    else
    {
      uint64_t v31 = v28;
      v44[1] = 0;
      uint64_t v45 = v12;
      uint64_t v46 = v11;
      unint64_t v32 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
      char v33 = _swiftEmptyArrayStorage;
      uint64_t v34 = 1;
      uint64_t v35 = v56;
      uint64_t v36 = v57;
      while (1)
      {
        v32(v35, v31, v36);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v33 = (void *)sub_11398(0, v33[2] + 1, 1, (unint64_t)v33);
        }
        unint64_t v38 = v33[2];
        unint64_t v37 = v33[3];
        if (v38 >= v37 >> 1) {
          char v33 = (void *)sub_11398(v37 > 1, v38 + 1, 1, (unint64_t)v33);
        }
        v33[2] = v38 + 1;
        unint64_t v39 = (unint64_t)v33
            + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
            + *(void *)(v6 + 72) * v38;
        uint64_t v35 = v56;
        uint64_t v36 = v57;
        uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v39, v56, v57);
        if (v30 == v34) {
          break;
        }
        BOOL v40 = __OFADD__(v34++, 1);
        uint64_t v31 = v58;
        if (v40)
        {
          __break(1u);
          goto LABEL_14;
        }
      }
      long long v41 = v50;
      sub_3F720();
      sub_3F710();
      sub_3F6F0();
      uint64_t v43 = v52;
      uint64_t v42 = v53;
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v49, v41, v53);
      sub_3F6D0();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v42);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v58, v36);
      return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v55, v46);
    }
  }
  return result;
}

uint64_t sub_152AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v57 = a1;
  uint64_t v1 = sub_3F510();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v55 = v1;
  uint64_t v56 = v2;
  __chkstk_darwin(v1);
  uint64_t v54 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3F550();
  uint64_t v53 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5044(&qword_4D368);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3F190();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3F520();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  int v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F4B0();
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 != enum case for Parse.directInvocation(_:))
  {
    uint64_t v30 = v13;
    uint64_t v31 = (uint64_t)v9;
    uint64_t v32 = v53;
    if (v18 == enum case for Parse.uso(_:))
    {
      (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v6, v17, v4);
      sub_15A2C(v57);
      char v33 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
      uint64_t v34 = v6;
    }
    else
    {
      if (v18 != enum case for Parse.nlRouter(_:))
      {
        uint64_t v48 = sub_3F360();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v57, 1, 1, v48);
        char v33 = *(uint64_t (**)(char *, uint64_t))(v15 + 8);
        uint64_t v34 = v17;
        uint64_t v35 = v14;
        return v33(v34, v35);
      }
      (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v30, v17, v10);
      sub_3F150();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v31, 1, v4) == 1)
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v30, v10);
        sub_ACEC(v31, &qword_4D368);
        uint64_t v42 = sub_3F360();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v57, 1, 1, v42);
      }
      sub_15A2C(v57);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v30, v10);
      char v33 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
      uint64_t v34 = (char *)v31;
    }
    uint64_t v35 = v4;
    return v33(v34, v35);
  }
  (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
  uint64_t v19 = v55;
  uint64_t v20 = v56;
  uint64_t v21 = v54;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v54, v17, v55);
  uint64_t v22 = sub_3F4F0();
  uint64_t v24 = v23;
  uint64_t v25 = (void *)sub_3F050();
  id v26 = [v25 identifier];

  uint64_t v27 = sub_406B0();
  uint64_t v29 = v28;

  if (v27 == v22 && v29 == v24)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);
    swift_bridgeObjectRelease();
    uint64_t v37 = enum case for ConfirmationResponse.rejected(_:);
    uint64_t v38 = sub_3F360();
    uint64_t v39 = *(void *)(v38 - 8);
    uint64_t v40 = v57;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 104))(v57, v37, v38);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v38);
  }
  char v36 = sub_40970();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_9;
  }
  uint64_t v43 = (void *)sub_3F060();
  id v44 = [v43 identifier];

  uint64_t v45 = sub_406B0();
  uint64_t v47 = v46;

  if (v45 == v22 && v47 == v24)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);
    uint64_t v40 = v57;
LABEL_21:
    uint64_t v50 = enum case for ConfirmationResponse.confirmed(_:);
    uint64_t v38 = sub_3F360();
    uint64_t v39 = *(void *)(v38 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 104))(v40, v50, v38);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v38);
  }
  char v49 = sub_40970();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);
  uint64_t v40 = v57;
  if (v49) {
    goto LABEL_21;
  }
  uint64_t v51 = sub_3F360();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v40, 1, 1, v51);
}

uint64_t sub_15A2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v2 = sub_3F550();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  uint64_t v44 = v3;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v42 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v40 - v6;
  uint64_t v8 = sub_5044(&qword_4D2E8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3F5C0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_3F690();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  int v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v1;
  sub_3F540();
  uint64_t v20 = sub_3F5B0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (*(void *)(v20 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v10, v20 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)), v15);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v10, v21, 1, v15);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15) == 1)
  {
    sub_ACEC((uint64_t)v10, &qword_4D2E8);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_405B0();
    sub_4A6C(v22, (uint64_t)qword_4E370);
    uint64_t v23 = v44;
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
    uint64_t v25 = v19;
    uint64_t v26 = v43;
    v24(v7, v25, v43);
    uint64_t v27 = sub_405A0();
    os_log_type_t v28 = sub_40800();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v47 = v41;
      *(_DWORD *)uint64_t v29 = 136315138;
      uint64_t v40 = v29 + 4;
      v24(v42, (uint64_t)v7, v26);
      uint64_t v30 = sub_406C0();
      uint64_t v46 = sub_17898(v30, v31, &v47);
      sub_40860();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v26);
      _os_log_impl(&dword_0, v27, v28, "Invalid USOParse while looking for user confirmation. Parse has no UDAs: %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v26);
    }

    goto LABEL_16;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v10, v15);
  if (sub_3F620())
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    uint64_t v32 = enum case for ConfirmationResponse.rejected(_:);
    uint64_t v33 = sub_3F360();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = v45;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 104))(v45, v32, v33);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v35, 0, 1, v33);
  }
  char v36 = sub_3F610();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  if (v36)
  {
    uint64_t v37 = enum case for ConfirmationResponse.confirmed(_:);
    uint64_t v33 = sub_3F360();
    uint64_t v34 = *(void *)(v33 - 8);
    uint64_t v35 = v45;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 104))(v45, v37, v33);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v35, 0, 1, v33);
  }
LABEL_16:
  uint64_t v39 = sub_3F360();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v45, 1, 1, v39);
}

uint64_t sub_16090()
{
  uint64_t v1 = sub_3F550();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v36 = v1;
  uint64_t v37 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v35 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v33 - v5;
  uint64_t v7 = sub_5044(&qword_4D2E8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3F5C0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3F690();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v0;
  sub_3F540();
  uint64_t v19 = sub_3F5B0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (*(void *)(v19 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v9, v19 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)), v14);
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v9, v20, 1, v14);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v14) == 1)
  {
    sub_ACEC((uint64_t)v9, &qword_4D2E8);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_405B0();
    sub_4A6C(v21, (uint64_t)qword_4E370);
    uint64_t v22 = v37;
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
    uint64_t v24 = v18;
    uint64_t v25 = v36;
    v23(v6, v24, v36);
    uint64_t v26 = sub_405A0();
    os_log_type_t v27 = sub_40800();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v39 = v34;
      *(_DWORD *)os_log_type_t v28 = 136315138;
      v33[1] = v28 + 4;
      v23(v35, (uint64_t)v6, v25);
      uint64_t v29 = sub_406C0();
      uint64_t v38 = sub_17898(v29, v30, &v39);
      sub_40860();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v25);
      _os_log_impl(&dword_0, v26, v27, "Invalid USOParse while looking for user cancellation. Parse has no UDAs: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v25);
    }

    char v31 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v9, v14);
    char v31 = sub_3F630();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  return v31 & 1;
}

uint64_t sub_16584()
{
  if (!sub_169CC()) {
    return 0;
  }
  swift_retain();
  sub_3F7D0();
  swift_release();
  if (!v15[3])
  {
    sub_ACEC((uint64_t)v15, &qword_4D370);
    goto LABEL_8;
  }
  sub_3F810();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_405B0();
    sub_4A6C(v2, (uint64_t)qword_4E370);
    swift_retain_n();
    uint64_t v3 = sub_405A0();
    os_log_type_t v4 = sub_40800();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      v15[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      sub_3F890();
      swift_retain();
      uint64_t v6 = sub_406C0();
      sub_17898(v6, v7, v15);
      sub_40860();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v3, v4, "Could not extract the usoNoEntity from the usoTask=%s", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      return 0;
    }

    swift_release_n();
    return 0;
  }
  swift_retain();
  sub_3F790();
  swift_release();
  if (!v15[0] || (uint64_t v0 = sub_3F7B0(), swift_release(), !v0))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_405B0();
    sub_4A6C(v8, (uint64_t)qword_4E370);
    swift_retain_n();
    uint64_t v9 = sub_405A0();
    os_log_type_t v10 = sub_40800();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      v15[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_retain();
      uint64_t v12 = sub_406C0();
      sub_17898(v12, v13, v15);
      sub_40860();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v9, v10, "Could not extract the listPosition from the usoNoEntity=%s", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
      swift_release();

      return 0;
    }

    swift_release_n();
    swift_release();
    return 0;
  }
  uint64_t v1 = sub_17280();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

unint64_t sub_169CC()
{
  uint64_t v1 = sub_3F550();
  uint64_t v55 = *(char **)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v53 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v54 = (char *)&v51 - v4;
  uint64_t v5 = sub_5044(&qword_4D2E8);
  __chkstk_darwin(v5 - 8);
  unint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3F5C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_3F690();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v51 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v52 = (char *)&v51 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v51 - v18;
  uint64_t v20 = v0;
  sub_3F540();
  uint64_t v21 = sub_3F5B0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (*(void *)(v21 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v7, v21 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v12);
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v7, v22, 1, v12);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_ACEC((uint64_t)v7, &qword_4D2E8);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_405B0();
    sub_4A6C(v23, (uint64_t)qword_4E370);
    uint64_t v25 = v54;
    uint64_t v24 = v55;
    uint64_t v26 = (void (*)(char *, uint64_t, uint64_t))*((void *)v55 + 2);
    v26(v54, v20, v1);
    os_log_type_t v27 = sub_405A0();
    os_log_type_t v28 = sub_40800();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = (char *)swift_slowAlloc();
      uint64_t v57 = v52;
      *(_DWORD *)uint64_t v29 = 136315138;
      uint64_t v51 = (char *)(v29 + 4);
      v26(v53, (uint64_t)v25, v1);
      uint64_t v30 = sub_406C0();
      uint64_t v56 = sub_17898(v30, v31, (uint64_t *)&v57);
      sub_40860();
      swift_bridgeObjectRelease();
      (*((void (**)(char *, uint64_t))v24 + 1))(v25, v1);
      _os_log_impl(&dword_0, v27, v28, "Cannot extract task: USO parse has no UDAs. %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*((void (**)(char *, uint64_t))v24 + 1))(v25, v1);
    }

    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v19, v7, v12);
  if ((sub_3F600() & 1) == 0)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_405B0();
    sub_4A6C(v43, (uint64_t)qword_4E370);
    uint64_t v44 = sub_405A0();
    os_log_type_t v45 = sub_40800();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_0, v44, v45, "User dialog act does not have a user stated task", v46, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);
    return 0;
  }
  unint64_t result = sub_3F770();
  unint64_t v49 = result;
  if (!(result >> 62))
  {
    if (*(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_27;
    }
LABEL_32:
    swift_bridgeObjectRelease();
    uint64_t v33 = v52;
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_405B0();
    sub_4A6C(v34, (uint64_t)qword_4E370);
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v35(v33, v19, v12);
    uint64_t v36 = sub_405A0();
    uint64_t v37 = v19;
    os_log_type_t v38 = sub_40800();
    if (os_log_type_enabled(v36, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = (char *)swift_slowAlloc();
      uint64_t v57 = v54;
      uint64_t v55 = v37;
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v53 = (char *)(v39 + 4);
      v35(v51, v33, v12);
      uint64_t v40 = sub_406C0();
      uint64_t v56 = sub_17898(v40, v41, (uint64_t *)&v57);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v42 = *(void (**)(char *, uint64_t))(v13 + 8);
      v42(v33, v12);
      _os_log_impl(&dword_0, v36, v38, "Cannot extract task: UDA -> Task conversion failed. %s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v42(v55, v12);
    }
    else
    {

      uint64_t v47 = *(void (**)(char *, uint64_t))(v13 + 8);
      v47(v33, v12);
      v47(v37, v12);
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v50 = sub_40900();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v50) {
    goto LABEL_32;
  }
LABEL_27:
  if ((v49 & 0xC000000000000001) != 0)
  {
    uint64_t v48 = sub_408C0();
    goto LABEL_30;
  }
  if (*(void *)((char *)&dword_10 + (v49 & 0xFFFFFFFFFFFFFF8)))
  {
    uint64_t v48 = *(void *)(v49 + 32);
    swift_retain();
LABEL_30:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);
    return v48;
  }
  __break(1u);
  return result;
}

uint64_t sub_17280()
{
  uint64_t v0 = sub_5044(&qword_4D378);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3F830();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_3F820();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_ACEC((uint64_t)v2, &qword_4D378);
    return 0;
  }
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v11(v9, v2, v3);
  v11(v7, v9, v3);
  int v12 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fourth(_:)) {
    return 4;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Second(_:)) {
    return 2;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Beginning(_:)) {
    return 1;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFourth(_:)) {
    return 24;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Seventeenth(_:)) {
    return 17;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eighth(_:)) {
    return 8;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_ThirdToLast(_:)) {
    return -3;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Sixth(_:)) {
    return 6;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Nineteenth(_:)) {
    return 19;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFifth(_:)) {
    return 25;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Ninth(_:)) {
    return 9;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eleventh(_:)) {
    return 11;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_End(_:)) {
    return -1;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fourteenth(_:)) {
    return 14;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_SecondToLast(_:)) {
    return -2;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyFirst(_:)) {
    return 21;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Thirteenth(_:)) {
    return 13;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Last(_:)) {
    return -1;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentySecond(_:)) {
    return 22;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fifteenth(_:)) {
    return 15;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Twentieth(_:)) {
    return 20;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Fifth(_:)) {
    return 5;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Sixteenth(_:)) {
    return 16;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_First(_:)) {
    return 1;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Seventh(_:)) {
    return 7;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Eighteenth(_:)) {
    return 18;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_TwentyThird(_:)) {
    return 23;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Twelfth(_:)) {
    return 12;
  }
  if (v12 == enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Third(_:)) {
    return 3;
  }
  if (v12 != enum case for UsoEntity_common_ListPosition.DefinedValues.common_ListPosition_Tenth(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return 0;
  }
  return 10;
}

uint64_t sub_177F8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_17820(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_17898(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_40860();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_17898(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1796C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_17F68((uint64_t)v12, *a3);
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
      sub_17F68((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_8CD8((uint64_t)v12);
  return v7;
}

uint64_t sub_1796C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_40870();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_17B28(a5, a6);
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
  uint64_t v8 = sub_408D0();
  if (!v8)
  {
    sub_408F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_40930();
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

uint64_t sub_17B28(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_17BC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_17DA0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_17DA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_17BC0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_17D38(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_408B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_408F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_40710();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_40930();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_408F0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_17D38(uint64_t a1, uint64_t a2)
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
  sub_5044(&qword_4D380);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_17DA0(char a1, int64_t a2, char a3, char *a4)
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
    sub_5044(&qword_4D380);
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
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

unint64_t sub_17EF0(uint64_t a1, uint64_t a2)
{
  sub_409D0();
  sub_406E0();
  Swift::Int v4 = sub_409F0();

  return sub_17FC4(a1, a2, v4);
}

uint64_t sub_17F68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_17FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_40970() & 1) == 0)
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
      while (!v14 && (sub_40970() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_180A8(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_5044(&qword_4D488);
  v2[4] = swift_task_alloc();
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_3F360();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return _swift_task_switch(sub_181A8, 0, 0);
}

uint64_t sub_181A8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[5];
  sub_152AC(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_ACEC(v0[5], &qword_4D488);
    type metadata accessor for IFFlowError();
    sub_1A92C(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    swift_allocError();
    uint64_t v5 = v4;
    sub_408A0(48);
    swift_bridgeObjectRelease();
    sub_3F4D0();
    sub_1A92C(&qword_4D0E8, (void (*)(uint64_t))&type metadata accessor for Input);
    v13._countAndFlagsBits = sub_40950();
    sub_40700(v13);
    swift_bridgeObjectRelease();
    *uint64_t v5 = 0xD00000000000002ELL;
    v5[1] = 0x80000000000437B0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    uint64_t v8 = v0[7];
    uint64_t v7 = v0[8];
    uint64_t v9 = v0[6];
    uint64_t v10 = v0[4];
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 32))(v7, v0[5], v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v7, v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v9);
    sub_3F4A0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_18468(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_3F300();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  sub_5044(&qword_4D248);
  v2[12] = swift_task_alloc();
  sub_5044(&qword_4D470);
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_3F580();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  return _swift_task_switch(sub_185E4, 0, 0);
}

uint64_t sub_185E4()
{
  if (*(unsigned char *)(v0[8] + 56) == 1)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_405B0();
    sub_4A6C(v1, (uint64_t)qword_4E370);
    uint64_t v2 = sub_405A0();
    os_log_type_t v3 = sub_407F0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, v3, "IFFlow Confirmation for GenAI Media QnA won't re-prompt on empty parse.", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = v0[15];
    uint64_t v6 = v0[8];

    sub_7B5C(v6 + 16, (uint64_t)(v0 + 2));
    sub_5044(&qword_4D478);
    int v7 = swift_dynamicCast();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    if (v7)
    {
      uint64_t v10 = v0[15];
      uint64_t v9 = v0[16];
      uint64_t v12 = v0[13];
      uint64_t v11 = v0[14];
      uint64_t v13 = v0[11];
      uint64_t v14 = v0[10];
      uint64_t v25 = v0[9];
      uint64_t v15 = (uint64_t *)v0[7];
      v8(v12, 0, 1, v11);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v9, v12, v11);
      sub_3F560();
      (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for DialogEngineOutput.none(_:), v25);
      v15[3] = v11;
      uint64_t v15[4] = (uint64_t)&protocol witness table for AceOutput;
      sub_1174C(v15);
      sub_3F570();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
    else
    {
      uint64_t v22 = v0[13];
      v8(v22, 1, 1, v0[14]);
      sub_ACEC(v22, &qword_4D470);
      sub_3F100();
      sub_3F0F0();
    }
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_405B0();
    sub_4A6C(v16, (uint64_t)qword_4E370);
    uint64_t v17 = sub_405A0();
    os_log_type_t v18 = sub_407F0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "IFFlow Confirmation re-prompting on empty parse.", v19, 2u);
      swift_slowDealloc();
    }
    uint64_t v20 = v0[7];
    uint64_t v21 = v0[8];

    sub_7B5C(v21 + 16, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_18964()
{
  sub_8CD8(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ExternalServiceConfirmationStrategy()
{
  return self;
}

void *sub_189C0()
{
  return &protocol witness table for SimpleConfirmationResponseProvider;
}

uint64_t sub_189CC()
{
  uint64_t v0 = sub_5044(&qword_4D488);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_141F8())
  {
    return sub_3F1A0();
  }
  else
  {
    sub_152AC((uint64_t)v2);
    uint64_t v4 = sub_3F360();
    int v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4);
    sub_ACEC((uint64_t)v2, &qword_4D488);
    if (v5 == 1) {
      return sub_3F1C0();
    }
    else {
      return sub_3F1B0();
    }
  }
}

uint64_t sub_18AE4(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *int v5 = v2;
  v5[1] = sub_8D28;
  return sub_180A8(a1, a2);
}

uint64_t sub_18B84(uint64_t a1)
{
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_8D28;
  return sub_18468(a1);
}

uint64_t sub_18C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_8D28;
  return PromptForConfirmationFlowStrategyAsync.makeRepromptOnLowConfidence(itemToConfirm:)(a1, a2, v9, a4);
}

uint64_t sub_18D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_7954;
  return PromptForConfirmationFlowStrategyAsync.makeConfirmationRejectedResponse()(a1, v7, a3);
}

uint64_t sub_18DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_8D28;
  return PromptForConfirmationFlowStrategyAsync.makeFlowCancelledResponse()(a1, v7, a3);
}

uint64_t sub_18EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_8D28;
  return PromptForConfirmationFlowStrategyAsync.makeErrorResponse(_:)(a1, a2, v9, a4);
}

uint64_t sub_18F9C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v182 = a5;
  uint64_t v183 = a3;
  uint64_t v164 = a2;
  v185 = a1;
  v186 = a6;
  uint64_t v184 = *v6;
  uint64_t v154 = sub_3FDF0();
  uint64_t v153 = *(void *)(v154 - 8);
  uint64_t v8 = __chkstk_darwin(v154);
  v150 = (char *)&v147 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v152 = (char *)&v147 - v10;
  uint64_t v11 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v11 - 8);
  uint64_t v173 = (char *)&v147 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v13 - 8);
  uint64_t v172 = (char *)&v147 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_3FB70();
  uint64_t v166 = *(void *)(v167 - 8);
  __chkstk_darwin(v167);
  v170 = (char *)&v147 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_3FCA0();
  uint64_t v174 = *(void *)(v16 - 8);
  uint64_t v175 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v151 = (char *)&v147 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v156 = (char *)&v147 - v20;
  __chkstk_darwin(v19);
  v171 = (char *)&v147 - v21;
  uint64_t v22 = sub_5044(&qword_4D1D0);
  __chkstk_darwin(v22 - 8);
  uint64_t v163 = (char *)&v147 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_3FAA0();
  uint64_t v159 = *(void *)(v160 - 8);
  __chkstk_darwin(v160);
  v162 = (char *)&v147 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = sub_40060();
  uint64_t v157 = *(void *)(v158 - 8);
  __chkstk_darwin(v158);
  v161 = (char *)&v147 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_3EDB0();
  uint64_t v169 = *(void *)(v178 - 8);
  __chkstk_darwin(v178);
  v168 = (char *)&v147 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v27 - 8);
  v165 = (char *)&v147 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_40090();
  uint64_t v179 = *(void *)(v29 - 8);
  uint64_t v180 = v29;
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v155 = (char *)&v147 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v176 = (uint64_t)&v147 - v32;
  uint64_t v33 = sub_5044(&qword_4D488);
  __chkstk_darwin(v33 - 8);
  uint64_t v35 = (char *)&v147 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_3F360();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = __chkstk_darwin(v36);
  v177 = (char *)&v147 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v181 = (char *)&v147 - v41;
  uint64_t v42 = *((void *)a4 - 1);
  __chkstk_darwin(v40);
  uint64_t v44 = (char *)&v147 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_3F130();
  uint64_t v46 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v147 - v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))((char *)&v147 - v47, v185, v45);
  int v49 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v48, v45);
  if (v49 == enum case for PromptResult.answered<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v46 + 96))(v48, v45);
    (*(void (**)(char *, char *, char *))(v42 + 32))(v44, v48, a4);
    sub_3F480();
    uint64_t v50 = v42;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36) == 1)
    {
      sub_ACEC((uint64_t)v35, &qword_4D488);
      type metadata accessor for IFFlowError();
      sub_1A92C(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      uint64_t v51 = swift_allocError();
      *uint64_t v52 = 0;
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, char *))(v42 + 8))(v44, a4);
      uint64_t v53 = v186;
      uint64_t *v186 = v51;
      *((unsigned char *)v53 + 8) = 1;
    }
    else
    {
      uint64_t v57 = v36;
      uint64_t v58 = v37;
      v185 = v44;
      uint64_t v59 = v181;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v181, v35, v57);
      uint64_t v60 = v177;
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v177, v59, v57);
      int v61 = (*(uint64_t (**)(char *, uint64_t))(v37 + 88))(v60, v57);
      if (v61 == enum case for ConfirmationResponse.confirmed(_:))
      {
        v177 = a4;
        uint64_t v182 = v37;
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v149 = v42;
        uint64_t v148 = v57;
        uint64_t v62 = sub_405B0();
        sub_4A6C(v62, (uint64_t)qword_4E370);
        int v63 = sub_405A0();
        os_log_type_t v64 = sub_407E0();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v65 = 0;
          _os_log_impl(&dword_0, v63, v64, "IFFlow Confirmation confirmed. Forwarding to IF", v65, 2u);
          swift_slowDealloc();
        }

        uint64_t v66 = v169;
        uint64_t v155 = *(char **)(v169 + 56);
        uint64_t v67 = v165;
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v155)(v165, 1, 1, v178);
        uint64_t v68 = (uint64_t)v168;
        sub_40000();
        uint64_t v69 = v161;
        unsigned char *v161 = 1;
        (*(void (**)(unsigned char *, void, uint64_t))(v157 + 104))(v69, enum case for SystemPromptResolution.UserAction.actionConfirmed(_:), v158);
        (*(void (**)(char *, uint64_t, uint64_t))(v159 + 16))(v162, v164, v160);
        uint64_t v70 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
        uint64_t v71 = sub_40050();
        uint64_t v72 = *(void *)(v71 - 8);
        uint64_t v73 = v163;
        (*(void (**)(char *, uint64_t, uint64_t))(v72 + 104))(v163, v70, v71);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v73, 0, 1, v71);
        uint64_t v74 = v176;
        sub_40070();
        uint64_t v75 = sub_5044(&qword_4D1E8);
        uint64_t v164 = (uint64_t)v186 + *(int *)(v75 + 48);
        sub_40020();
        uint64_t v76 = v170;
        (*(void (**)(char *, uint64_t, uint64_t))(v179 + 16))(v170, v74, v180);
        (*(void (**)(char *, void, uint64_t))(v166 + 104))(v76, enum case for MessagePayload.RequestContent.promptResolution(_:), v167);
        uint64_t v77 = sub_3FC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v172, 1, 1, v77);
        uint64_t v78 = v178;
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v155)(v67, 1, 1, v178);
        uint64_t v79 = sub_3FC50();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v173, 1, 1, v79);
        uint64_t v80 = (uint64_t)v171;
        sub_3FC70();
        uint64_t v82 = v174;
        uint64_t v81 = v175;
        (*(void (**)(uint64_t, void, uint64_t))(v174 + 104))(v80, enum case for MessagePayload.request(_:), v175);
        sub_20CAC(v68, v80);
        unsigned int v83 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
        v83(v80, v81);
        (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v68, v78);
        uint64_t v84 = v156;
        sub_40010();
        if ((*(unsigned int (**)(char *, uint64_t))(v82 + 88))(v84, v81) == enum case for MessagePayload.systemResponse(_:))
        {
          (*(void (**)(char *, uint64_t))(v82 + 96))(v84, v81);
          uint64_t v85 = v153;
          uint64_t v86 = (uint64_t)v152;
          uint64_t v87 = v154;
          (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v152, v84, v154);
          uint64_t v88 = v164;
          sub_4140(v86, v164);
          (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v86, v87);
          uint64_t v89 = sub_403E0();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v88, 0, 1, v89);
        }
        else
        {
          v83((uint64_t)v84, v81);
          uint64_t v127 = sub_403E0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 56))(v164, 1, 1, v127);
        }
        uint64_t v128 = v181;
        uint64_t v129 = v182;
        v130 = v185;
        uint64_t v131 = v148;
        uint64_t v132 = v149;
        (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v176, v180);
        (*(void (**)(char *, uint64_t))(v129 + 8))(v128, v131);
        (*(void (**)(char *, char *))(v132 + 8))(v130, v177);
      }
      else
      {
        if (v61 != enum case for ConfirmationResponse.rejected(_:))
        {
          type metadata accessor for IFFlowError();
          sub_1A92C(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
          uint64_t v133 = swift_allocError();
          uint64_t v135 = v134;
          unint64_t v187 = 0;
          unint64_t v188 = 0xE000000000000000;
          sub_408A0(42);
          swift_bridgeObjectRelease();
          unint64_t v187 = 0xD000000000000028;
          unint64_t v188 = 0x80000000000437E0;
          sub_1A92C(&qword_4D490, (void (*)(uint64_t))&type metadata accessor for ConfirmationResponse);
          v189._countAndFlagsBits = sub_40950();
          sub_40700(v189);
          swift_bridgeObjectRelease();
          unint64_t v136 = v188;
          *uint64_t v135 = v187;
          v135[1] = v136;
          swift_storeEnumTagMultiPayload();
          uint64_t v137 = *(void (**)(char *, uint64_t))(v58 + 8);
          v137(v59, v57);
          (*(void (**)(char *, char *))(v50 + 8))(v185, a4);
          unint64_t v138 = v186;
          uint64_t *v186 = v133;
          *((unsigned char *)v138 + 8) = 1;
          type metadata accessor for IFFlow.State();
          swift_storeEnumTagMultiPayload();
          return ((uint64_t (*)(char *, uint64_t))v137)(v177, v57);
        }
        v177 = a4;
        uint64_t v182 = v37;
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v148 = v57;
        uint64_t v149 = v42;
        uint64_t v95 = sub_405B0();
        sub_4A6C(v95, (uint64_t)qword_4E370);
        uint64_t v96 = sub_405A0();
        os_log_type_t v97 = sub_407E0();
        if (os_log_type_enabled(v96, v97))
        {
          uint64_t v98 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v98 = 0;
          _os_log_impl(&dword_0, v96, v97, "IFFlow Confirmation rejected. Forwarding to IF", v98, 2u);
          swift_slowDealloc();
        }

        uint64_t v99 = v169;
        uint64_t v156 = *(char **)(v169 + 56);
        uint64_t v100 = v165;
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v156)(v165, 1, 1, v178);
        uint64_t v101 = (uint64_t)v168;
        sub_40000();
        uint64_t v102 = v161;
        unsigned char *v161 = 0;
        (*(void (**)(unsigned char *, void, uint64_t))(v157 + 104))(v102, enum case for SystemPromptResolution.UserAction.actionConfirmed(_:), v158);
        (*(void (**)(char *, uint64_t, uint64_t))(v159 + 16))(v162, v164, v160);
        uint64_t v103 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
        uint64_t v104 = sub_40050();
        uint64_t v105 = *(void *)(v104 - 8);
        uint64_t v106 = v163;
        (*(void (**)(char *, uint64_t, uint64_t))(v105 + 104))(v163, v103, v104);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v106, 0, 1, v104);
        uint64_t v107 = v155;
        sub_40070();
        uint64_t v108 = sub_5044(&qword_4D1E8);
        uint64_t v176 = (uint64_t)v186 + *(int *)(v108 + 48);
        sub_40020();
        uint64_t v109 = v170;
        (*(void (**)(char *, char *, uint64_t))(v179 + 16))(v170, v107, v180);
        (*(void (**)(char *, void, uint64_t))(v166 + 104))(v109, enum case for MessagePayload.RequestContent.promptResolution(_:), v167);
        uint64_t v110 = sub_3FC40();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v172, 1, 1, v110);
        uint64_t v111 = v178;
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v156)(v100, 1, 1, v178);
        uint64_t v112 = sub_3FC50();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v112 - 8) + 56))(v173, 1, 1, v112);
        uint64_t v113 = (uint64_t)v171;
        sub_3FC70();
        uint64_t v114 = v174;
        uint64_t v115 = v175;
        (*(void (**)(uint64_t, void, uint64_t))(v174 + 104))(v113, enum case for MessagePayload.request(_:), v175);
        sub_20CAC(v101, v113);
        uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
        v116(v113, v115);
        (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v101, v111);
        uint64_t v117 = v151;
        sub_40010();
        if ((*(unsigned int (**)(char *, uint64_t))(v114 + 88))(v117, v115) == enum case for MessagePayload.systemResponse(_:))
        {
          (*(void (**)(char *, uint64_t))(v114 + 96))(v117, v115);
          uint64_t v118 = v153;
          uint64_t v119 = (uint64_t)v150;
          uint64_t v120 = v154;
          (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v150, v117, v154);
          uint64_t v121 = v176;
          sub_4140(v119, v176);
          (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v119, v120);
          uint64_t v122 = sub_403E0();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v122 - 8) + 56))(v121, 0, 1, v122);
        }
        else
        {
          v116((uint64_t)v117, v115);
          uint64_t v141 = sub_403E0();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v141 - 8) + 56))(v176, 1, 1, v141);
        }
        uint64_t v142 = v149;
        uint64_t v143 = v181;
        uint64_t v144 = v182;
        uint64_t v145 = v185;
        uint64_t v146 = v148;
        (*(void (**)(char *, uint64_t))(v179 + 8))(v155, v180);
        (*(void (**)(char *, uint64_t))(v144 + 8))(v143, v146);
        (*(void (**)(char *, char *))(v142 + 8))(v145, v177);
      }
    }
    goto LABEL_34;
  }
  int v54 = v49;
  if (v49 == enum case for PromptResult.error<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v46 + 96))(v48, v45);
    char v55 = v48[8];
    uint64_t v56 = v186;
    uint64_t *v186 = *(void *)v48;
    *((unsigned char *)v56 + 8) = (v55 & 1) == 0;
LABEL_34:
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  unint64_t v90 = v186;
  if (v49 == enum case for PromptResult.cancelled<A>(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v91 = sub_405B0();
    sub_4A6C(v91, (uint64_t)qword_4E370);
    uint64_t v92 = sub_405A0();
    os_log_type_t v93 = sub_407F0();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v94 = 0;
      _os_log_impl(&dword_0, v92, v93, "Exiting IFFlow, received userCancelled", v94, 2u);
      swift_slowDealloc();
    }

    *unint64_t v90 = 0;
    *((unsigned char *)v90 + 8) = 0;
    type metadata accessor for IFFlow.State();
  }
  else
  {
    int v123 = enum case for PromptResult.unanswered<A>(_:);
    type metadata accessor for IFFlowError();
    sub_1A92C(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    uint64_t v125 = swift_allocError();
    uint64_t v126 = v124;
    if (v54 != v123)
    {
      unint64_t v187 = 0;
      unint64_t v188 = 0xE000000000000000;
      sub_408A0(35);
      swift_bridgeObjectRelease();
      unint64_t v187 = 0xD000000000000021;
      unint64_t v188 = 0x80000000000433E0;
      swift_getWitnessTable();
      v190._countAndFlagsBits = sub_304E8();
      sub_40700(v190);
      swift_bridgeObjectRelease();
      unint64_t v140 = v188;
      *uint64_t v126 = v187;
      v126[1] = v140;
      swift_storeEnumTagMultiPayload();
      *unint64_t v90 = v125;
      *((unsigned char *)v90 + 8) = 1;
      type metadata accessor for IFFlow.State();
      swift_storeEnumTagMultiPayload();
      return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v48, v45);
    }
    *(unsigned char *)uint64_t v124 = 0;
    swift_storeEnumTagMultiPayload();
    *unint64_t v90 = v125;
    *((unsigned char *)v90 + 8) = 1;
    type metadata accessor for IFFlow.State();
  }
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A92C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A974()
{
  uint64_t v1 = sub_3F950();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  int v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == enum case for DeviceIdiom.car(_:)) {
    return 1;
  }
  if (v5 == enum case for DeviceIdiom.homepod(_:)) {
    return 3;
  }
  if (v5 == enum case for DeviceIdiom.mac(_:)) {
    return 4;
  }
  if (v5 == enum case for DeviceIdiom.pad(_:)) {
    return 7;
  }
  if (v5 == enum case for DeviceIdiom.pod(_:)) {
    return 5;
  }
  if (v5 == enum case for DeviceIdiom.phone(_:)) {
    return 6;
  }
  if (v5 == enum case for DeviceIdiom.watch(_:)) {
    return 8;
  }
  if (v5 == enum case for DeviceIdiom.tv(_:)) {
    return 9;
  }
  if (v5 == enum case for DeviceIdiom.reality(_:)) {
    return 10;
  }
  if (v5 == enum case for DeviceIdiom.unknown(_:)) {
    return 0;
  }
  uint64_t result = sub_40960();
  __break(1u);
  return result;
}

id sub_1AB70(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v103 = a3;
  uint64_t v89 = a1;
  NSString v90 = a2;
  uint64_t v5 = sub_3F950();
  uint64_t v101 = *(void *)(v5 - 8);
  id v102 = (id)v5;
  __chkstk_darwin(v5);
  uint64_t v100 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3FA20();
  os_log_type_t v97 = *(void (***)(char *, void, Class))(v7 - 8);
  Class isa = (Class)v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v96 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v95 = (char *)&v81 - v10;
  uint64_t v11 = sub_3F990();
  Class v93 = *(Class *)(v11 - 8);
  NSString v94 = (NSString)v11;
  __chkstk_darwin(v11);
  uint64_t v92 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_3F970();
  uint64_t v87 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v86 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_3F940();
  uint64_t v84 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v82 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_5044(&qword_4D498);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_5044(&qword_4D4A0);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v21 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v81 - v22;
  uint64_t v24 = sub_3FA40();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_3F9B0();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v81 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = a4;
  sub_3F9D0();
  sub_3F9A0();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  sub_3FA30();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  uint64_t v32 = swift_bridgeObjectRetain();
  uint64_t v33 = sub_1B630(v32);
  swift_bridgeObjectRelease();
  v107[0] = (uint64_t)v33;
  sub_1B718(v107);
  swift_bridgeObjectRelease();
  uint64_t v91 = v107[0];
  sub_40450();
  uint64_t v34 = sub_3FA10();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v17, 1, v34) == 1)
  {
    sub_ACEC((uint64_t)v17, &qword_4D498);
    uint64_t v36 = 1;
  }
  else
  {
    sub_3FA00();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v17, v34);
    uint64_t v36 = 0;
  }
  uint64_t v38 = v96;
  uint64_t v37 = v97;
  uint64_t v39 = v95;
  uint64_t v40 = v84;
  uint64_t v41 = v85;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v84 + 56))(v23, v36, 1, v85);
  sub_1B784((uint64_t)v23, (uint64_t)v21);
  int v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48))(v21, 1, v41);
  Class v43 = isa;
  if (v42 == 1)
  {
    uint64_t v83 = 0;
    uint64_t v95 = 0;
  }
  else
  {
    uint64_t v44 = v38;
    uint64_t v45 = v39;
    uint64_t v46 = v82;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v82, v21, v41);
    v107[0] = sub_3F930();
    uint64_t v83 = sub_40950();
    uint64_t v95 = v47;
    uint64_t v48 = v46;
    uint64_t v39 = v45;
    uint64_t v38 = v44;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v48, v41);
  }
  sub_ACEC((uint64_t)v23, &qword_4D4A0);
  os_log_type_t v97 = (void (**)(char *, void, Class))sub_406A0();
  swift_bridgeObjectRelease();
  sub_40420();
  if (v49)
  {
    uint64_t v96 = (char *)sub_406A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v96 = 0;
  }
  uint64_t v50 = v86;
  sub_40430();
  sub_3F960();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v50, v88);
  NSString v90 = sub_406A0();
  swift_bridgeObjectRelease();
  uint64_t v51 = v92;
  sub_40440();
  sub_3F980();
  (*((void (**)(char *, NSString))v93 + 1))(v51, v94);
  NSString v94 = sub_406A0();
  swift_bridgeObjectRelease();
  sub_40460();
  v37[13](v38, enum case for InteractionType.dialogDriven(_:), v43);
  sub_1B7EC();
  sub_40720();
  sub_40720();
  if (v107[0] != v105 || v107[1] != v106) {
    sub_40970();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v52 = (void (*)(char *, Class))v37[1];
  v52(v38, v43);
  v52(v39, v43);
  Class isa = sub_407B0().super.super.isa;
  sub_1B844();
  Class v93 = sub_40830(0).super.super.isa;
  sub_3F9F0();
  v53.super.super.Class isa = sub_407B0().super.super.isa;
  sub_3F9E0();
  v54.super.super.Class isa = sub_407B0().super.super.isa;
  if (sub_40480())
  {
    swift_bridgeObjectRelease();
    v55.super.super.Class isa = sub_407B0().super.super.isa;
  }
  else
  {
    v55.super.super.Class isa = 0;
  }
  v56.super.Class isa = sub_40740().super.isa;
  swift_release();
  uint64_t v57 = v95;
  if (v95)
  {
    sub_5044(&qword_4D2A8);
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_411F0;
    *(void *)(v58 + 32) = v83;
    *(void *)(v58 + 40) = v57;
  }
  id v59 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class v60 = sub_40740().super.isa;
  Class v99 = v60;
  swift_bridgeObjectRelease();
  int v61 = v100;
  sub_3F9C0();
  int v62 = sub_1A974();
  (*(void (**)(char *, id))(v101 + 8))(v61, v102);
  LODWORD(v80) = v62;
  Class v78 = v56.super.isa;
  Class v79 = v60;
  Class v76 = v54.super.super.isa;
  Class v77 = v55.super.super.isa;
  Class v75 = v53.super.super.isa;
  int v63 = v59;
  uint64_t v65 = v96;
  os_log_type_t v64 = v97;
  Class v66 = v56.super.isa;
  uint64_t v67 = v90;
  uint64_t v68 = v94;
  Class v69 = isa;
  Class v70 = v55.super.super.isa;
  Class v71 = v54.super.super.isa;
  Class v72 = v53.super.super.isa;
  Class v73 = v93;
  id v102 = objc_msgSend(v63, "initWithSessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:deviceIdiom:didPSCFire:", v97, v96, v90, v94, isa, v93, v75, v76, v77, v78, v79, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           v80,
           0);

  swift_release();
  swift_release();
  return v102;
}

void *sub_1B630(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_5044(&qword_4D2A8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1C4A8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1C6A8();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

Swift::Int sub_1B718(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C6B0(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_1B884(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1B784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5044(&qword_4D4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B7EC()
{
  unint64_t result = qword_4D4A8;
  if (!qword_4D4A8)
  {
    sub_3FA20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D4A8);
  }
  return result;
}

unint64_t sub_1B844()
{
  unint64_t result = qword_4D4B0;
  if (!qword_4D4B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4D4B0);
  }
  return result;
}

Swift::Int sub_1B884(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_40940(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_1BF70(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  id v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_118:
      NSString v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          os_log_type_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_1C040((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            os_log_type_t v97 = sub_1C494((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          NSString v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_40790();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_40970();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_40970()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_1C2DC(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_1C2DC((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    int v42 = v11 + 32;
    Class v43 = &v11[16 * v41 + 32];
    *(void *)Class v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            Class v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        int v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        Class v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        NSString v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_1C040((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        int v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_40970() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  Swift::Int result = sub_408F0();
  __break(1u);
  return result;
}

uint64_t sub_1BF70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = sub_40970(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1C040(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_40970() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_40970() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_1C3D8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

char *sub_1C2DC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_5044(&qword_4D4B8);
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
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1C3D8(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_40930();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_1C494(uint64_t a1)
{
  return sub_1C2DC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1C4A8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
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
  int64_t v11 = a2;
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
    Swift::Int v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_1C6A8()
{
  return swift_release();
}

uint64_t sub_1C6B0(uint64_t a1)
{
  return sub_1F7B4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1C6C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_3FE50();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 != enum case for StatementOutcome.success(_:))
  {
    if (v6 == enum case for StatementOutcome.actionConfirmation(_:))
    {
LABEL_4:
      sub_3F0A0();
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    if (v6 != enum case for StatementOutcome.toolDisambiguation(_:)
      && v6 != enum case for StatementOutcome.parameterNeedsValue(_:))
    {
      if (v6 == enum case for StatementOutcome.parameterConfirmation(_:)) {
        goto LABEL_4;
      }
      if (v6 != enum case for StatementOutcome.parameterDisambiguation(_:)
        && v6 != enum case for StatementOutcome.parameterNotAllowed(_:))
      {
        if (v6 == enum case for StatementOutcome.parameterCandidatesNotFound(_:)
          || v6 == enum case for StatementOutcome.actionRequirement(_:))
        {
          sub_3F0D0();
          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        }
        if (v6 != enum case for StatementOutcome.valueDisambiguation(_:))
        {
          if (v6 == enum case for StatementOutcome.failure(_:))
          {
            sub_3F0C0();
            return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          }
          goto LABEL_2;
        }
      }
    }
    sub_3F0B0();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
LABEL_2:
  sub_3F090();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *sub_1C8DC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    unint64_t v9 = _swiftEmptyArrayStorage;
    sub_1F554(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1F554(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_1F554(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_20664(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1CA04@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, char *a4@<X3>, char *a5@<X4>, char *a6@<X5>, char *a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v118 = a8;
  uint64_t v115 = a7;
  uint64_t v117 = a6;
  uint64_t v120 = a5;
  uint64_t v119 = a4;
  uint64_t v114 = a2;
  uint64_t v136 = a1;
  uint64_t v137 = a9;
  uint64_t v10 = sub_401B0();
  uint64_t v131 = *(void *)(v10 - 8);
  uint64_t v132 = v10;
  __chkstk_darwin(v10);
  v130 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_5044(&qword_4D4D0);
  __chkstk_darwin(v12 - 8);
  uint64_t v110 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_401A0();
  uint64_t v108 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  Swift::Int v107 = (char *)&v107 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_3FF90();
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v111 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_3FFA0();
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v122 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_3FFC0();
  uint64_t v126 = *(void *)(v127 - 8);
  __chkstk_darwin(v127);
  uint64_t v125 = (char *)&v107 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_5044(&qword_4D4D8);
  __chkstk_darwin(v18 - 8);
  Swift::Int v20 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_40200();
  uint64_t v133 = *(void *)(v21 - 8);
  uint64_t v134 = v21;
  __chkstk_darwin(v21);
  uint64_t v121 = (char *)&v107 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_3FC10();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v107 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_3FC30();
  uint64_t v27 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  uint64_t v29 = (char *)&v107 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_3FCA0();
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v107 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_5044(&qword_4D4E0);
  uint64_t v35 = __chkstk_darwin(v34 - 8);
  uint64_t v128 = (uint64_t)&v107 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  uint64_t v129 = (char *)&v107 - v37;
  uint64_t v116 = a3;
  if (a3)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, v136, v30);
    int v38 = (*(uint64_t (**)(char *, uint64_t))(v31 + 88))(v33, v30);
    if (v38 == enum case for MessagePayload.actionSummaryUpdate(_:))
    {
      (*(void (**)(char *, uint64_t))(v31 + 96))(v33, v30);
      uint64_t v39 = v135;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v33, v135);
      id v40 = [objc_allocWithZone((Class)NSListFormatter) init];
      sub_3FC20();
      uint64_t v41 = sub_3FC00();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      id v42 = v40;
      uint64_t v43 = sub_1FE78(v41, v42);
      swift_bridgeObjectRelease();

      __chkstk_darwin(v44);
      *(&v107 - 2) = v29;
      *(&v107 - 1) = (char *)v43;
      sub_401D0();
      swift_bridgeObjectRelease();
      uint64_t v46 = v133;
      uint64_t v45 = v134;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v133 + 48))(v20, 1, v134) == 1)
      {
        sub_ACEC((uint64_t)v20, &qword_4D4D8);
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v47 = sub_405B0();
        sub_4A6C(v47, (uint64_t)qword_4E370);
        char v48 = sub_405A0();
        os_log_type_t v49 = sub_40800();
        if (os_log_type_enabled(v48, v49))
        {
          uint64_t v50 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v50 = 0;
          _os_log_impl(&dword_0, v48, v49, "Could not build IntelligenceFlowStatusUpdateMessage from ActionSummary. Missing fields?", v50, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v39);
LABEL_43:
        uint64_t v106 = sub_3EFC0();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56))(v137, 1, 1, v106);
      }

      (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v39);
      uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      Class v79 = v121;
      v78(v121, v20, v45);
      uint64_t v80 = (uint64_t)v129;
      v78(v129, v79, v45);
      uint64_t v81 = (unsigned int *)&enum case for IntelligenceFlowStatusUpdateMessage.StatusUpdate.actionSummary(_:);
      goto LABEL_32;
    }
    if (v38 != enum case for MessagePayload.statusUpdate(_:))
    {
      uint64_t v82 = sub_3EFC0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v137, 1, 1, v82);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v33, v30);
    }
    (*(void (**)(char *, uint64_t))(v31 + 96))(v33, v30);
    uint64_t v60 = v126;
    uint64_t v61 = v125;
    uint64_t v62 = v127;
    (*(void (**)(char *, char *, uint64_t))(v126 + 32))(v125, v33, v127);
    uint64_t v63 = v122;
    sub_3FFB0();
    uint64_t v64 = v123;
    uint64_t v65 = v124;
    int v66 = (*(uint64_t (**)(char *, uint64_t))(v123 + 88))(v63, v124);
    if (v66 == enum case for SessionStatusUpdate.Payload.executionProgressUpdate(_:))
    {
      (*(void (**)(char *, uint64_t))(v64 + 96))(v63, v65);
      uint64_t v67 = v112;
      uint64_t v68 = v111;
      uint64_t v69 = v113;
      uint64_t v70 = (*(uint64_t (**)(char *, char *, uint64_t))(v112 + 32))(v111, v63, v113);
      __chkstk_darwin(v70);
      *(&v107 - 2) = v68;
      uint64_t v71 = (uint64_t)v110;
      sub_40160();
      uint64_t v72 = v108;
      uint64_t v73 = v109;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v108 + 48))(v71, 1, v109) == 1)
      {
        sub_ACEC(v71, &qword_4D4D0);
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v74 = sub_405B0();
        sub_4A6C(v74, (uint64_t)qword_4E370);
        Class v75 = sub_405A0();
        os_log_type_t v76 = sub_40800();
        if (os_log_type_enabled(v75, v76))
        {
          uint64_t v77 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v77 = 0;
          _os_log_impl(&dword_0, v75, v76, "Could not build IntelligenceFlowStatusUpdateMessage from ProgressUpdate. Missing fields?", v77, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
        (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v69);
        goto LABEL_43;
      }
      (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v68, v69);
      uint64_t v88 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
      unint64_t v89 = v107;
      v88(v107, v71, v73);
      uint64_t v80 = (uint64_t)v129;
      v88(v129, (uint64_t)v89, v73);
      uint64_t v81 = (unsigned int *)&enum case for IntelligenceFlowStatusUpdateMessage.StatusUpdate.progressUpdate(_:);
LABEL_32:
      uint64_t v91 = v131;
      uint64_t v90 = v132;
      (*(void (**)(uint64_t, void, uint64_t))(v131 + 104))(v80, *v81, v132);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v91 + 56))(v80, 0, 1, v90);
      uint64_t v92 = v128;
      sub_1375C(v80, v128, &qword_4D4E0);
      int v93 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v92, 1, v90);
      NSString v94 = v130;
      if (v93 == 1)
      {
        sub_ACEC(v80, &qword_4D4E0);
        sub_ACEC(v92, &qword_4D4E0);
      }
      else
      {
        uint64_t v95 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 32))(v130, v92, v90);
        __chkstk_darwin(v95);
        unint64_t v96 = v118;
        *(&v107 - 8) = v115;
        *(&v107 - 7) = v96;
        os_log_type_t v97 = v114;
        *(&v107 - 6) = v117;
        *(&v107 - 5) = v97;
        uint64_t v98 = v119;
        *(&v107 - 4) = v116;
        *(&v107 - 3) = v98;
        *(&v107 - 2) = v120;
        *(&v107 - 1) = v94;
        uint64_t v99 = (objc_class *)sub_40280();
        id v100 = objc_allocWithZone(v99);
        uint64_t v101 = sub_40210();
        if (v101)
        {
          uint64_t v142 = v99;
          uint64_t v143 = &protocol witness table for IntelligenceFlowStatusUpdateMessage;
          uint64_t v141 = v101;
          uint64_t v140 = 0;
          long long v138 = 0u;
          long long v139 = 0u;
          uint64_t v102 = v137;
          sub_3EFB0();
          sub_ACEC(v80, &qword_4D4E0);
          (*(void (**)(char *, uint64_t))(v91 + 8))(v94, v90);
          uint64_t v103 = sub_3EFC0();
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56))(v102, 0, 1, v103);
        }
        sub_ACEC(v80, &qword_4D4E0);
        (*(void (**)(char *, uint64_t))(v91 + 8))(v94, v90);
      }
      goto LABEL_43;
    }
    if (v66 == enum case for SessionStatusUpdate.Payload.intermediateQueryResult(_:))
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v83 = sub_405B0();
      sub_4A6C(v83, (uint64_t)qword_4E370);
      uint64_t v84 = sub_405A0();
      os_log_type_t v85 = sub_40800();
      if (!os_log_type_enabled(v84, v85)) {
        goto LABEL_41;
      }
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v86 = 0;
      uint64_t v87 = "IntermediateQueryResult is not supported.";
    }
    else
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v104 = sub_405B0();
      sub_4A6C(v104, (uint64_t)qword_4E370);
      uint64_t v84 = sub_405A0();
      os_log_type_t v85 = sub_40800();
      if (!os_log_type_enabled(v84, v85)) {
        goto LABEL_41;
      }
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v86 = 0;
      uint64_t v87 = "Unknown message payload type.";
    }
    _os_log_impl(&dword_0, v84, v85, v87, v86, 2u);
    swift_slowDealloc();
LABEL_41:

    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
    uint64_t v105 = sub_3EFC0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v137, 1, 1, v105);
    return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v63, v65);
  }
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v51 = sub_405B0();
  sub_4A6C(v51, (uint64_t)qword_4E370);
  uint64_t v52 = sub_405A0();
  os_log_type_t v53 = sub_40800();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    _os_log_impl(&dword_0, v52, v53, "RequestId not set, skipping message posting.", v54, 2u);
    swift_slowDealloc();
  }

  uint64_t v55 = sub_3EFC0();
  unint64_t v56 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56);
  uint64_t v57 = v55;
  uint64_t v58 = v137;

  return v56(v58, 1, 1, v57);
}

uint64_t sub_1DB80@<X0>(char *a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  uint64_t v99 = a3;
  id v100 = a2;
  uint64_t v4 = sub_3FBE0();
  unint64_t v5 = *(uint8_t **)(v4 - 8);
  uint64_t v93 = v4;
  NSString v94 = v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v87 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v95 = (char *)&v85 - v8;
  uint64_t v9 = sub_3FBC0();
  uint64_t v96 = *(void *)(v9 - 8);
  uint64_t v97 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_3FBA0();
  uint64_t v90 = *(void *)(v12 - 8);
  uint64_t v91 = (uint8_t *)v12;
  __chkstk_darwin(v12);
  unint64_t v89 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3FB80();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v86 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v92 = (char *)&v85 - v19;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v85 - v20;
  uint64_t v22 = sub_401C0();
  uint64_t v98 = *(void *)(v22 - 8);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v25 = (uint64_t *)((char *)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v85 - v26;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v28(v21, (uint64_t)a1, v14);
  int v29 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v21, v14);
  if (v29 == enum case for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.value(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v21, v14);
    uint64_t v30 = v96;
    uint64_t v31 = v97;
    (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v11, v21, v97);
    uint64_t v95 = (char *)sub_3FBB0();
    uint64_t v33 = v32;

    (*(void (**)(char *, uint64_t))(v15 + 8))(a1, v14);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v31);
    *uint64_t v25 = (uint64_t)v95;
    v25[1] = v33;
    uint64_t v34 = v98;
    (*(void (**)(uint64_t *, void, uint64_t))(v98 + 104))(v25, enum case for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary.value(_:), v22);
    uint64_t v35 = *(void (**)(char *, uint64_t *, uint64_t))(v34 + 32);
    v35(v27, v25, v22);
LABEL_8:
    unint64_t v56 = v99;
    v35(v99, (uint64_t *)v27, v22);
    uint64_t v57 = 0;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v56, v57, 1, v22);
  }
  os_log_type_t v85 = (uint64_t *)v27;
  uint64_t v96 = v22;
  uint64_t v97 = v15;
  uint64_t v36 = (char *)v14;
  uint64_t v88 = a1;
  if (v29 == enum case for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.values(_:))
  {
    uint64_t v37 = v97;
    (*(void (**)(char *, uint64_t))(v97 + 96))(v21, v14);
    uint64_t v39 = v94;
    int v38 = v95;
    id v40 = v21;
    uint64_t v41 = v93;
    (*((void (**)(char *, char *, uint64_t))v94 + 4))(v95, v40, v93);
    uint64_t v42 = sub_3FBD0();
    sub_1C8DC(v42);
    swift_bridgeObjectRelease();
    Class isa = sub_40740().super.isa;
    swift_bridgeObjectRelease();
    id v44 = v100;
    id v45 = [v100 stringFromItems:isa];

    if (v45)
    {
      uint64_t v46 = sub_406B0();
      uint64_t v48 = v47;

      (*(void (**)(char *, char *))(v37 + 8))(v88, v36);
      (*((void (**)(char *, uint64_t))v39 + 1))(v38, v41);
      uint64_t v27 = (char *)v85;
      uint64_t *v85 = v46;
      *((void *)v27 + 1) = v48;
      uint64_t v34 = v98;
      uint64_t v22 = v96;
      (*(void (**)(char *, void, uint64_t))(v98 + 104))(v27, enum case for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary.value(_:), v96);
      uint64_t v35 = *(void (**)(char *, uint64_t *, uint64_t))(v34 + 32);
      goto LABEL_8;
    }
    uint64_t v92 = v36;
    uint64_t v70 = v88;
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_405B0();
    sub_4A6C(v71, (uint64_t)qword_4E370);
    uint64_t v72 = v94;
    uint64_t v73 = v95;
    uint64_t v74 = v87;
    (*((void (**)(char *, char *, uint64_t))v94 + 2))(v87, v95, v41);
    Class v75 = sub_405A0();
    os_log_type_t v76 = sub_40800();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = v72;
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v102 = (char *)swift_slowAlloc();
      *(_DWORD *)uint64_t v78 = 136315138;
      uint64_t v91 = v78 + 4;
      sub_3FBD0();
      uint64_t v79 = sub_40760();
      unint64_t v81 = v80;
      swift_bridgeObjectRelease();
      uint64_t v101 = sub_17898(v79, v81, (uint64_t *)&v102);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v82 = (void (*)(char *, uint64_t))*((void *)v77 + 1);
      uint64_t v83 = v93;
      v82(v74, v93);
      _os_log_impl(&dword_0, v75, v76, "Couldn't concatenate parameter summaries: %s", v78, 0xCu);
      uint64_t v57 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, char *))(v97 + 8))(v88, v92);
      v82(v95, v83);
    }
    else
    {

      uint64_t v84 = (void (*)(char *, uint64_t))*((void *)v72 + 1);
      v84(v74, v41);
      (*(void (**)(char *, char *))(v97 + 8))(v70, v92);
      v84(v73, v41);
      uint64_t v57 = 1;
    }
    uint64_t v34 = v98;
    unint64_t v56 = v99;
    uint64_t v22 = v96;
  }
  else
  {
    if (v29 == enum case for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.placeholder(_:))
    {
      uint64_t v49 = v97;
      (*(void (**)(char *, uint64_t))(v97 + 96))(v21, v14);
      uint64_t v51 = v89;
      uint64_t v50 = v90;
      uint64_t v52 = v91;
      (*(void (**)(char *, char *, uint8_t *))(v90 + 32))(v89, v21, v91);
      uint64_t v53 = sub_3FB90();
      uint64_t v55 = v54;

      (*(void (**)(char *, char *))(v49 + 8))(v88, v36);
      (*(void (**)(char *, uint8_t *))(v50 + 8))(v51, v52);
      *uint64_t v25 = v53;
      v25[1] = v55;
      uint64_t v34 = v98;
      uint64_t v22 = v96;
      (*(void (**)(uint64_t *, void, uint64_t))(v98 + 104))(v25, enum case for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary.placeholder(_:), v96);
      uint64_t v35 = *(void (**)(char *, uint64_t *, uint64_t))(v34 + 32);
      uint64_t v27 = (char *)v85;
      v35((char *)v85, v25, v22);
      goto LABEL_8;
    }
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_405B0();
    sub_4A6C(v59, (uint64_t)qword_4E370);
    uint64_t v60 = v92;
    uint64_t v61 = v88;
    uint64_t v62 = (void (*)(char *, char *, char *))v28;
    v28(v92, (uint64_t)v88, (uint64_t)v36);
    uint64_t v63 = sub_405A0();
    os_log_type_t v64 = sub_40800();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = (char *)swift_slowAlloc();
      uint64_t v102 = v95;
      int v66 = v36;
      NSString v94 = v65;
      *(_DWORD *)uint64_t v65 = 136315138;
      v62(v86, v60, v36);
      uint64_t v67 = sub_406C0();
      uint64_t v101 = sub_17898(v67, v68, (uint64_t *)&v102);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v69 = *(void (**)(char *, char *))(v97 + 8);
      v69(v60, v36);
      _os_log_impl(&dword_0, v63, v64, "Unknown ParameterSummary case: %s", v94, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v69(v88, v36);
      uint64_t v22 = v96;
    }
    else
    {

      uint64_t v69 = *(void (**)(char *, char *))(v97 + 8);
      v69(v60, v36);
      v69(v61, v36);
      uint64_t v22 = v96;
      int v66 = v36;
    }
    uint64_t v34 = v98;
    v69(v21, v66);
    uint64_t v57 = 1;
    unint64_t v56 = v99;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v56, v57, 1, v22);
}

uint64_t sub_1E708()
{
  uint64_t v0 = sub_3FC10();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3FC20();
  sub_3FBF0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_401E0();
  swift_bridgeObjectRetain();
  return sub_401F0();
}

uint64_t sub_1E810()
{
  return sub_40170();
}

uint64_t sub_1E884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v27 = a7;
  uint64_t v28 = a9;
  uint64_t v10 = sub_5044(&qword_4D4E0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5044(&qword_4D4C8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_40230();
  uint64_t v19 = sub_3EDB0();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, a4, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v19);
  sub_40270();
  swift_bridgeObjectRetain();
  sub_40260();
  swift_bridgeObjectRetain();
  sub_40240();
  uint64_t v21 = enum case for MessageSource.ifFlow(_:);
  uint64_t v22 = sub_40340();
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v15, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v15, 0, 1, v22);
  sub_40250();
  uint64_t v24 = sub_401B0();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v12, v28, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v12, 0, 1, v24);
  return sub_40220();
}

uint64_t sub_1EB8C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v48 = a7;
  uint64_t v49 = a8;
  uint64_t v51 = a3;
  uint64_t v52 = a5;
  uint64_t v50 = a1;
  uint64_t v53 = a9;
  uint64_t v13 = sub_405B0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_3EDB0();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && a4 && a6)
  {
    sub_3ED70();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) != 1)
    {
      uint64_t v37 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 32))(v23, v19, v20);
      __chkstk_darwin(v37);
      uint64_t v38 = v49;
      *(&v48 - 8) = v48;
      *(&v48 - 7) = v38;
      uint64_t v39 = v50;
      *(&v48 - 6) = (uint64_t)v23;
      *(&v48 - 5) = v39;
      uint64_t v40 = v51;
      *(&v48 - 4) = a2;
      *(&v48 - 3) = v40;
      *(&v48 - 2) = a4;
      *(&v48 - 1) = a10;
      uint64_t v41 = (objc_class *)sub_40300();
      id v42 = objc_allocWithZone(v41);
      uint64_t v43 = (void *)sub_40290();
      if (v43)
      {
        v57[3] = (uint64_t)v41;
        v57[4] = (uint64_t)&protocol witness table for IntelligenceFlowTraceIdGeneratedMessage;
        uint64_t v56 = 0;
        v57[0] = (uint64_t)v43;
        long long v54 = 0u;
        long long v55 = 0u;
        id v44 = v43;
        uint64_t v45 = v53;
        sub_3EFB0();
        uint64_t v46 = sub_3EFC0();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 0, 1, v46);
      }
      else
      {
        uint64_t v47 = sub_3EFC0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v53, 1, 1, v47);
      }
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    }
    sub_ACEC((uint64_t)v19, &qword_4D0C8);
  }
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_4A6C(v13, (uint64_t)qword_4E370);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v24, v13);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v25 = sub_405A0();
  os_log_type_t v26 = sub_40800();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v49 = v13;
    uint64_t v28 = v27;
    uint64_t v48 = swift_slowAlloc();
    v57[0] = v48;
    *(_DWORD *)uint64_t v28 = 136315650;
    if (a2) {
      uint64_t v29 = v50;
    }
    else {
      uint64_t v29 = 0x3E6C6C756E3CLL;
    }
    if (a2) {
      unint64_t v30 = a2;
    }
    else {
      unint64_t v30 = 0xE600000000000000;
    }
    uint64_t v50 = v14;
    swift_bridgeObjectRetain();
    *(void *)&long long v54 = sub_17898(v29, v30, v57);
    sub_40860();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    if (a4) {
      uint64_t v31 = v51;
    }
    else {
      uint64_t v31 = 0x3E6C6C756E3CLL;
    }
    if (a4) {
      unint64_t v32 = a4;
    }
    else {
      unint64_t v32 = 0xE600000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)&long long v54 = sub_17898(v31, v32, v57);
    sub_40860();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 22) = 2080;
    if (a6) {
      uint64_t v33 = v52;
    }
    else {
      uint64_t v33 = 0x3E6C6C756E3CLL;
    }
    if (a6) {
      unint64_t v34 = a6;
    }
    else {
      unint64_t v34 = 0xE600000000000000;
    }
    swift_bridgeObjectRetain();
    *(void *)&long long v54 = sub_17898(v33, v34, v57);
    sub_40860();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v25, v26, "Can't construct IntelligenceFlowTraceIdGeneratedMessage from executionRequestId: %s, traceId: %s, sessionId: %s", (uint8_t *)v28, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v50 + 8))(v16, v49);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  uint64_t v35 = sub_3EFC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v53, 1, 1, v35);
}

uint64_t sub_1F21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v25[0] = a9;
  v25[1] = a7;
  uint64_t v10 = sub_5044(&qword_4D4C0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5044(&qword_4D4C8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_402D0();
  uint64_t v19 = sub_3EDB0();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, a4, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v19);
  sub_402C0();
  swift_bridgeObjectRetain();
  sub_402B0();
  uint64_t v21 = enum case for MessageSource.ifFlow(_:);
  uint64_t v22 = sub_40340();
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v15, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v15, 0, 1, v22);
  sub_402F0();
  swift_bridgeObjectRetain();
  sub_402A0();
  sub_1375C(v25[0], (uint64_t)v12, &qword_4D4C0);
  return sub_402E0();
}

uint64_t sub_1F4C0(uint64_t a1)
{
  return sub_1F4F8(a1, sub_1F21C);
}

uint64_t sub_1F4D8()
{
  return sub_1E810();
}

uint64_t sub_1F4E0(uint64_t a1)
{
  return sub_1F4F8(a1, sub_1E884);
}

uint64_t sub_1F4F8(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9]);
}

uint64_t sub_1F534(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1F574(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1F554(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1F920(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1F574(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_5044(qword_4D508);
  uint64_t v10 = *(void *)(sub_3FD40() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_3FD40() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

uint64_t sub_1F7B4(char a1, int64_t a2, char a3, char *a4)
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
    sub_5044(&qword_4D2A8);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

uint64_t sub_1F920(char a1, int64_t a2, char a3, char *a4)
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
    sub_5044(&qword_4D500);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_40930();
  __break(1u);
  return result;
}

uint64_t sub_1FA90(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_401C0();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_5044(&qword_4D4F8);
  int v47 = a2;
  uint64_t v8 = sub_40910();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  id v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  id v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  size_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_409D0();
    sub_406E0();
    uint64_t result = sub_409F0();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

uint64_t sub_1FE78(uint64_t a1, void *a2)
{
  uint64_t v83 = sub_3FB80();
  uint64_t v4 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v77 = (char *)v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5044(&qword_4D4E8);
  __chkstk_darwin(v6 - 8);
  os_log_type_t v76 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_401C0();
  uint64_t v8 = *(void *)(v80 - 8);
  uint64_t v9 = __chkstk_darwin(v80 - 8);
  uint64_t v72 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v68 = (char *)v60 - v11;
  uint64_t v12 = sub_5044(&qword_4D4F0);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v67 = (void *)((char *)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __chkstk_darwin(v13);
  int64_t v17 = (void *)((char *)v60 - v16);
  __chkstk_darwin(v15);
  Class v75 = (char *)v60 - v18;
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v70 = a1 + 64;
  uint64_t v20 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v84 = &_swiftEmptyDictionarySingleton;
  if (-v20 < 64) {
    uint64_t v21 = ~(-1 << -(char)v20);
  }
  else {
    uint64_t v21 = -1;
  }
  unint64_t v22 = v21 & v19;
  v60[1] = v20;
  int64_t v69 = (unint64_t)(63 - v20) >> 6;
  uint64_t v73 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v74 = v4 + 16;
  uint64_t v62 = v8;
  uint64_t v71 = (void (**)(char *, char *, uint64_t))(v8 + 32);
  uint64_t v65 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t v78 = v4;
  uint64_t v61 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v24 = 0;
  uint64_t v63 = a1;
  id v79 = a2;
  int v66 = v17;
  uint64_t v64 = v12;
  if (v22) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v26 = v24 + 1;
  if (!__OFADD__(v24, 1))
  {
    if (v26 < v69)
    {
      unint64_t v27 = *(void *)(v70 + 8 * v26);
      int64_t v28 = v24 + 1;
      if (v27) {
        goto LABEL_23;
      }
      int64_t v28 = v24 + 2;
      if (v24 + 2 >= v69) {
        goto LABEL_39;
      }
      unint64_t v27 = *(void *)(v70 + 8 * v28);
      if (v27) {
        goto LABEL_23;
      }
      int64_t v28 = v24 + 3;
      if (v24 + 3 >= v69) {
        goto LABEL_39;
      }
      unint64_t v27 = *(void *)(v70 + 8 * v28);
      if (v27) {
        goto LABEL_23;
      }
      int64_t v28 = v24 + 4;
      if (v24 + 4 >= v69) {
        goto LABEL_39;
      }
      unint64_t v27 = *(void *)(v70 + 8 * v28);
      if (v27)
      {
LABEL_23:
        uint64_t v81 = (v27 - 1) & v27;
        int64_t v82 = v28;
        for (unint64_t i = __clz(__rbit64(v27)) + (v28 << 6); ; unint64_t i = __clz(__rbit64(v22)) | (v24 << 6))
        {
          uint64_t v30 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
          uint64_t v32 = *v30;
          uint64_t v31 = v30[1];
          uint64_t v33 = v75;
          unint64_t v34 = *(void (**)(char *, unint64_t, uint64_t))(v78 + 16);
          uint64_t v35 = v83;
          uint64_t v36 = v12;
          v34(&v75[*(int *)(v12 + 48)], *(void *)(a1 + 56) + *(void *)(v78 + 72) * i, v83);
          *uint64_t v33 = v32;
          v33[1] = v31;
          sub_205FC((uint64_t)v33, (uint64_t)v17);
          unint64_t v37 = (char *)v17 + *(int *)(v12 + 48);
          BOOL v38 = v77;
          v34(v77, (unint64_t)v37, v35);
          swift_bridgeObjectRetain();
          id v39 = v79;
          uint64_t v40 = v76;
          sub_1DB80(v38, v39, v76);
          uint64_t v41 = v80;
          if ((*v73)(v40, 1, v80) == 1)
          {
            sub_ACEC((uint64_t)v17, &qword_4D4F0);
            uint64_t result = sub_ACEC((uint64_t)v40, &qword_4D4E8);
            unint64_t v22 = v81;
            int64_t v24 = v82;
            if (!v81) {
              goto LABEL_8;
            }
          }
          else
          {
            id v42 = *v71;
            int64_t v43 = v68;
            (*v71)(v68, v40, v41);
            id v44 = v67;
            uint64_t v45 = (char *)v67 + *(int *)(v36 + 48);
            uint64_t v47 = *v17;
            uint64_t v46 = v17[1];
            *uint64_t v67 = *v17;
            v44[1] = v46;
            (*v65)(v45, v37, v83);
            v42(v72, v43, v41);
            uint64_t v48 = v84;
            unint64_t v49 = v84[2];
            if (v84[3] <= v49)
            {
              sub_1FA90(v49 + 1, 1);
              uint64_t v48 = v84;
            }
            sub_409D0();
            sub_406E0();
            uint64_t result = sub_409F0();
            uint64_t v50 = v48 + 8;
            uint64_t v51 = -1 << *((unsigned char *)v48 + 32);
            unint64_t v52 = result & ~v51;
            unint64_t v53 = v52 >> 6;
            uint64_t v12 = v64;
            int64_t v24 = v82;
            if (((-1 << v52) & ~v48[(v52 >> 6) + 8]) != 0)
            {
              unint64_t v54 = __clz(__rbit64((-1 << v52) & ~v48[(v52 >> 6) + 8])) | v52 & 0x7FFFFFFFFFFFFFC0;
              int64_t v17 = v66;
            }
            else
            {
              char v55 = 0;
              unint64_t v56 = (unint64_t)(63 - v51) >> 6;
              int64_t v17 = v66;
              do
              {
                if (++v53 == v56 && (v55 & 1) != 0)
                {
                  __break(1u);
                  goto LABEL_40;
                }
                BOOL v57 = v53 == v56;
                if (v53 == v56) {
                  unint64_t v53 = 0;
                }
                v55 |= v57;
                uint64_t v58 = v50[v53];
              }
              while (v58 == -1);
              unint64_t v54 = __clz(__rbit64(~v58)) + (v53 << 6);
            }
            *(void *)((char *)v50 + ((v54 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v54;
            uint64_t v59 = (void *)(v48[6] + 16 * v54);
            *uint64_t v59 = v47;
            v59[1] = v46;
            v42((char *)(v48[7] + *(void *)(v62 + 72) * v54), v72, v80);
            ++v48[2];
            uint64_t result = (*v61)(v45, v83);
            a1 = v63;
            unint64_t v22 = v81;
            if (!v81) {
              goto LABEL_8;
            }
          }
LABEL_7:
          uint64_t v81 = (v22 - 1) & v22;
          int64_t v82 = v24;
        }
      }
      uint64_t v29 = v24 + 5;
      if (v24 + 5 < v69)
      {
        unint64_t v27 = *(void *)(v70 + 8 * v29);
        if (v27)
        {
          int64_t v28 = v24 + 5;
          goto LABEL_23;
        }
        while (1)
        {
          int64_t v28 = v29 + 1;
          if (__OFADD__(v29, 1)) {
            goto LABEL_41;
          }
          if (v28 >= v69) {
            break;
          }
          unint64_t v27 = *(void *)(v70 + 8 * v28);
          ++v29;
          if (v27) {
            goto LABEL_23;
          }
        }
      }
    }
LABEL_39:
    sub_1C6A8();
    return (uint64_t)v84;
  }
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_205F4()
{
  return sub_1E708();
}

uint64_t sub_205FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5044(&qword_4D4F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_20664(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_20674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_3F520();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3F510();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F4B0();
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    if (sub_3F4F0() == 0xD00000000000001FLL && v10 == 0x80000000000438B0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    char v11 = sub_40970();
    swift_bridgeObjectRelease();
    if (v11)
    {
LABEL_7:
      uint64_t v12 = sub_3F500();
      if (v12)
      {
        uint64_t v13 = v12;
        if (*(void *)(v12 + 16) && (unint64_t v14 = sub_17EF0(0x636E617265747475, 0xE900000000000065), (v15 & 1) != 0))
        {
          sub_17F68(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v22);
        }
        else
        {
          long long v22 = 0u;
          long long v23 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v23 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v16 = v21[0];
            uint64_t v17 = v21[1];
LABEL_18:
            sub_4B18(v16, v17, 1u, a1);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
            uint64_t v18 = sub_3FC80();
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a1, 0, 1, v18);
          }
LABEL_17:
          uint64_t v16 = 0;
          uint64_t v17 = 0xE000000000000000;
          goto LABEL_18;
        }
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
      }
      sub_20A10((uint64_t)&v22);
      goto LABEL_17;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v20 = sub_3FC80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a1, 1, 1, v20);
}

uint64_t sub_20A10(uint64_t a1)
{
  uint64_t v2 = sub_5044(&qword_4D370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A74()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    uint64_t v2 = sub_40850();
    if (v3 > 0x3F) {
      return v2;
    }
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    uint64_t v2 = sub_40850();
    if (v4 > 0x3F)
    {
      return v2;
    }
    else
    {
      uint64_t v0 = type metadata accessor for IFFlow.State();
      if (v5 <= 0x3F) {
        return swift_initClassMetadata2();
      }
    }
  }
  return v0;
}

uint64_t sub_20CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3FCA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3EDB0();
  __chkstk_darwin(v8);
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_20F88();
  sub_40410();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  return sub_3FFD0();
}

unint64_t sub_20E50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_5044(&qword_4D728);
  uint64_t v2 = sub_40920();
  unint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1375C(v6, (uint64_t)&v15, &qword_4D730);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_17EF0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_20664(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_20F88()
{
  return sub_20FC0(&qword_4D740);
}

uint64_t sub_20FA4()
{
  return sub_20FC0(&qword_4D750);
}

uint64_t sub_20FC0(uint64_t *a1)
{
  sub_5044(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_3F8E0();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_210A0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for IFFlowError();
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v33 = (uint64_t)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (void *)((char *)v32 - v5);
  uint64_t v7 = type metadata accessor for IFFlow.State();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  char v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  BOOL v13 = (char *)v32 - v12;
  uint64_t v14 = (char *)v0 + *(void *)(v1 + 208);
  swift_beginAccess();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v15(v13, v14, v7);
  if (swift_getEnumCaseMultiPayload() == 3) {
    return *(void *)v13;
  }
  v32[1] = v2;
  long long v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v13, v7);
  uint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  sub_408A0(57);
  v36._object = (void *)0x80000000000439F0;
  v36._countAndFlagsBits = 0xD000000000000037;
  sub_40700(v36);
  v15(v11, v14, v7);
  swift_getWitnessTable();
  uint64_t v18 = sub_40950();
  uint64_t v20 = v19;
  v17(v11, v7);
  v37._countAndFlagsBits = v18;
  v37._object = v20;
  sub_40700(v37);
  swift_bridgeObjectRelease();
  unint64_t v21 = v35;
  *uint64_t v6 = v34;
  v6[1] = v21;
  swift_storeEnumTagMultiPayload();
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_405B0();
  sub_4A6C(v22, (uint64_t)qword_4E370);
  uint64_t v23 = v33;
  sub_3158((uint64_t)v6, v33);
  int64_t v24 = sub_405A0();
  os_log_type_t v25 = sub_40800();
  if (os_log_type_enabled(v24, v25))
  {
    int64_t v26 = (uint8_t *)swift_slowAlloc();
    unint64_t v27 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v26 = 138412290;
    sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    swift_allocError();
    sub_3158(v23, v28);
    uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v34 = v29;
    sub_40860();
    *unint64_t v27 = v29;
    sub_31BC(v23);
    _os_log_impl(&dword_0, v24, v25, "%@", v26, 0xCu);
    sub_5044(&qword_4D358);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_31BC(v23);
  }

  sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
  uint64_t v16 = swift_allocError();
  sub_30514((uint64_t)v6, v30);
  return v16;
}

uint64_t sub_21570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v2 = *v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = sub_40850();
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&AssociatedConformanceWitness - v5;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_40850();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&AssociatedConformanceWitness - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&AssociatedConformanceWitness - v13;
  uint64_t v15 = (uint64_t)v1 + *(void *)(v2 + 200);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v15, v8);
  uint64_t v16 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v7) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v22, v14, v7);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v6, (uint64_t)v1 + *(void *)(*v1 + 192), v21);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48))(v6, 1, AssociatedTypeWitness);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v18 = v22;
    sub_407D0();
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v12, v18, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v7);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v15, v12, v8);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_2193C(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = sub_40850();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - v6;
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))((char *)&v11 - v6, a1, AssociatedTypeWitness);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v7, 0, 1, AssociatedTypeWitness);
  uint64_t v9 = v1 + *(void *)(*(void *)v1 + 200);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v9, v7, v4);
  return swift_endAccess();
}

void sub_21B44()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for IFFlow.State();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v28 - v4;
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_405B0();
  uint64_t v7 = sub_4A6C(v6, (uint64_t)qword_4E370);
  swift_retain_n();
  uint64_t v8 = sub_405A0();
  os_log_type_t v9 = sub_407F0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v28[2] = v7;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    v28[1] = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    v30[0] = v12;
    v28[0] = v11 + 4;
    uint64_t v13 = v0 + *(void *)(*(void *)v0 + 208);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
    swift_getWitnessTable();
    uint64_t v14 = sub_40950();
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v29[0] = sub_17898(v14, v16, v30);
    sub_40860();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v8, v9, "IFFlow state transitioned to %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v17 = v1 + *(void *)(*(void *)v1 + 208);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v17, v2);
  swift_getWitnessTable();
  uint64_t v18 = sub_40950();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v29[0] = v18;
  v29[1] = v20;
  sub_13600();
  uint64_t v21 = sub_40890();
  swift_bridgeObjectRelease();
  if (*(void *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_405A0();
    os_log_type_t v23 = sub_40810();
    if (os_log_type_enabled(v22, v23))
    {
      int64_t v24 = (uint8_t *)swift_slowAlloc();
      v29[0] = swift_slowAlloc();
      *(_DWORD *)int64_t v24 = 136446210;
      if (*(void *)(v21 + 16))
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_406D0();
        unint64_t v27 = v26;
        swift_bridgeObjectRelease();
        v28[6] = sub_17898(v25, v27, v29);
        sub_40860();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v22, v23, "IFFlow state transitioned to %{public}s", v24, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_22078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_5088(a1, a2);
}

uint64_t sub_22090(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v5 - 8);
  uint64_t v117 = (char *)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_3FC40();
  uint64_t v116 = *(void *)(v118 - 8);
  __chkstk_darwin(v118);
  uint64_t v110 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_5044(&qword_4D4C0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_3FCA0();
  uint64_t v114 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  uint64_t v113 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_3FFE0();
  uint64_t v127 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v13 = (char *)&v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_3FC80();
  uint64_t v125 = *(void *)(v126 - 8);
  uint64_t v14 = __chkstk_darwin(v126);
  uint64_t v129 = (char *)&v108 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v124 = (char *)&v108 - v16;
  uint64_t v17 = *(void *)(v4 + 80);
  uint64_t v143 = *(void *)(v4 + 88);
  uint64_t v144 = v17;
  uint64_t v147 = type metadata accessor for IFFlow.State();
  uint64_t v18 = *(void *)(v147 - 8);
  uint64_t v19 = __chkstk_darwin(v147);
  uint64_t v131 = (char *)&v108 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  os_log_type_t v23 = (uint64_t *)((char *)&v108 - v22);
  __chkstk_darwin(v21);
  uint64_t v145 = (char *)&v108 - v24;
  uint64_t v138 = sub_3FAA0();
  uint64_t v134 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v133 = (char *)&v108 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_40030();
  uint64_t v132 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v136 = (char *)&v108 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_3EDB0();
  uint64_t v148 = *(void *)(v139 - 8);
  uint64_t v27 = __chkstk_darwin(v139);
  v130 = (char *)&v108 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v142 = (char *)&v108 - v30;
  __chkstk_darwin(v29);
  uint64_t v146 = (uint64_t)&v108 - v31;
  uint64_t v32 = sub_3F4D0();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v122 = (char *)&v108 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  Swift::String v37 = (char *)&v108 - v36;
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v111 = v10;
  uint64_t v38 = sub_405B0();
  uint64_t v39 = sub_4A6C(v38, (uint64_t)qword_4E370);
  uint64_t v40 = *(void (**)(void, void, void))(v33 + 16);
  uint64_t v135 = a1;
  uint64_t v121 = v33 + 16;
  uint64_t v120 = v40;
  v40(v37, a1, v32);
  uint64_t v140 = v39;
  uint64_t v41 = sub_405A0();
  os_log_type_t v42 = sub_407F0();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v119 = v13;
  uint64_t v141 = v23;
  uint64_t v123 = v32;
  if (v43)
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v112 = v2;
    uint64_t v45 = (uint8_t *)v44;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v109 = v18;
    uint64_t v150 = v46;
    *(_DWORD *)uint64_t v45 = 136315138;
    sub_30AE4(&qword_4D0E8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v47 = sub_40950();
    uint64_t v149 = sub_17898(v47, v48, &v150);
    uint64_t v49 = v148;
    sub_40860();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v37, v32);
    _os_log_impl(&dword_0, v41, v42, "IFFlow received input with %s", v45, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v109;
    swift_slowDealloc();
    uint64_t v2 = v112;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v37, v32);

    uint64_t v49 = v148;
  }
  uint64_t v50 = v142;
  sub_40520();
  uint64_t v51 = v147;
  unint64_t v52 = v145;
  uint64_t v144 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v146, v50, v139);
  unint64_t v53 = (char *)v2 + *(void *)(*v2 + 208);
  swift_beginAccess();
  uint64_t v54 = v18;
  char v55 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v55(v52, v53, v51);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    unint64_t v56 = &v52[*(int *)(sub_5044(qword_4D590) + 48)];
    uint64_t v57 = v132;
    (*(void (**)(void))(v132 + 32))();
    uint64_t v58 = v134;
    uint64_t v59 = (uint64_t)v133;
    (*(void (**)(char *, char *, uint64_t))(v134 + 32))(v133, v56, v138);
    uint64_t v60 = (uint64_t)v130;
    sub_40000();
    uint64_t v61 = sub_23548();
    sub_23810(v146, v60, v59, v61, v62);
    swift_bridgeObjectRelease();
    uint64_t v63 = *(char **)(v49 + 8);
    uint64_t v148 = v49 + 8;
    uint64_t v145 = v63;
    uint64_t v64 = v60;
    uint64_t v65 = v139;
    ((void (*)(uint64_t, uint64_t))v63)(v64, v139);
    type metadata accessor for IFFlowError();
    sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    uint64_t v66 = swift_allocError();
    *uint64_t v67 = 1;
    swift_storeEnumTagMultiPayload();
    uint64_t v68 = (uint64_t)v141;
    *uint64_t v141 = v66;
    *(unsigned char *)(v68 + 8) = 1;
    swift_storeEnumTagMultiPayload();
    sub_30578(v68);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v68, v51);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v59, v138);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v136, v137);
    ((void (*)(uint64_t, uint64_t))v145)(v146, v65);
    return 0;
  }
  int64_t v69 = *(void (**)(char *, uint64_t))(v54 + 8);
  v69(v52, v51);
  uint64_t v70 = v131;
  v55(v131, v53, v51);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v69(v70, v51);
  if (EnumCaseMultiPayload != 4)
  {
    uint64_t v73 = sub_405A0();
    os_log_type_t v74 = sub_407F0();
    if (os_log_type_enabled(v73, v74))
    {
      Class v75 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Class v75 = 0;
      _os_log_impl(&dword_0, v73, v74, "IFFlow can only accept input after it is first initialized. Ignoring.", v75, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v146, v139);
    return 0;
  }
  uint64_t v72 = v129;
  ((void (*)(uint64_t))v2[2])(v135);
  uint64_t v78 = v125;
  id v79 = v124;
  uint64_t v80 = v126;
  (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v124, v72, v126);
  uint64_t v81 = (uint64_t)v113;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v113, v79, v80);
  uint64_t v82 = v114;
  uint64_t v83 = v115;
  (*(void (**)(uint64_t, void, uint64_t))(v114 + 104))(v81, enum case for MessagePayload.request(_:), v115);
  uint64_t v84 = v119;
  sub_20CAC(v146, v81);
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v81, v83);
  uint64_t v85 = (uint64_t)v117;
  sub_3FC60();
  uint64_t v86 = v116;
  uint64_t v87 = v118;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v116 + 48))(v85, 1, v118) == 1)
  {
    sub_ACEC(v85, &qword_4D0D0);
    uint64_t v88 = sub_403E0();
    uint64_t v89 = (uint64_t)v111;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v111, 1, 1, v88);
  }
  else
  {
    uint64_t v90 = (uint64_t)v110;
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 32))(v110, v85, v87);
    uint64_t v89 = (uint64_t)v111;
    sub_4688(v90, (uint64_t)v111);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v90, v87);
    uint64_t v91 = sub_403E0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v89, 0, 1, v91);
  }
  uint64_t v92 = (uint64_t)v141;
  uint64_t v93 = v92 + *(int *)(sub_5044(&qword_4D1E8) + 48);
  (*(void (**)(uint64_t, char *, uint64_t))(v127 + 16))(v92, v84, v128);
  sub_1375C(v89, v93, &qword_4D4C0);
  swift_storeEnumTagMultiPayload();
  sub_30578(v92);
  v69((char *)v92, v51);
  sub_30B2C();
  uint64_t v94 = sub_3ED80();
  uint64_t v96 = v95;
  uint64_t v97 = sub_20F88();
  uint64_t v98 = sub_20FA4();
  uint64_t v99 = sub_1AB70(v94, v96, v97, v98);
  id v100 = sub_405A0();
  os_log_type_t v101 = sub_407F0();
  if (os_log_type_enabled(v100, v101))
  {
    uint64_t v112 = v2;
    uint64_t v102 = (uint8_t *)swift_slowAlloc();
    uint64_t v103 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v102 = 138412290;
    uint64_t v149 = (uint64_t)v99;
    uint64_t v104 = v99;
    uint64_t v2 = v112;
    sub_40860();
    *uint64_t v103 = v99;

    uint64_t v84 = v119;
    _os_log_impl(&dword_0, v100, v101, "BMSiriRequestContext event = %@. Going to send this to the Biome Siri Orchestration stream.", v102, 0xCu);
    sub_5044(&qword_4D358);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    id v100 = v99;
  }

  [(id)v2[19] sendEvent:v99];
  uint64_t v105 = sub_23548();
  uint64_t v107 = v106;

  sub_ACEC(v89, &qword_4D4C0);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v84, v128);
  (*(void (**)(char *, uint64_t))(v125 + 8))(v124, v126);
  (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v146, v139);
  v2[27] = v105;
  v2[28] = v107;
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_23548()
{
  uint64_t v0 = sub_3F160();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3F520();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3F190();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F4B0();
  if ((*(unsigned int (**)(char *, uint64_t))(v5 + 88))(v7, v4) == enum case for Parse.nlRouter(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 96))(v7, v4);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_3F180();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if ((*(unsigned int (**)(char *, uint64_t))(v1 + 88))(v3, v0) == enum case for NLRouterParse.InputCandidate.text(_:))
    {
      (*(void (**)(char *, uint64_t))(v1 + 96))(v3, v0);
      return *(void *)v3;
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return 0;
}

uint64_t sub_23810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v69 = a5;
  uint64_t v70 = a4;
  uint64_t v68 = a3;
  uint64_t v65 = a2;
  uint64_t v6 = *v5;
  uint64_t v76 = a1;
  uint64_t v77 = v6;
  uint64_t v7 = sub_3FCA0();
  uint64_t v74 = *(void *)(v7 - 8);
  uint64_t v75 = v7;
  __chkstk_darwin(v7);
  uint64_t v73 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3FFE0();
  uint64_t v78 = *(void *)(v9 - 8);
  uint64_t v79 = v9;
  __chkstk_darwin(v9);
  uint64_t v72 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v11 - 8);
  uint64_t v71 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v13 - 8);
  uint64_t v67 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_3FB70();
  uint64_t v64 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v63 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_5044(&qword_4D1D0);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_3FAA0();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v58 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_40060();
  uint64_t v20 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_3EDB0();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v51 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v26;
  uint64_t v27 = sub_5044(&qword_4D0C8);
  uint64_t v28 = __chkstk_darwin(v27 - 8);
  uint64_t v62 = (char *)&v51 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v51 - v30;
  uint64_t v57 = sub_40090();
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v33 = (char *)&v51 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_3FC80();
  uint64_t v52 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v59 = (char *)&v51 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
  uint64_t v53 = v23;
  v54(v31, 1, 1, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v65, v23);
  sub_40080();
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, enum case for SystemPromptResolution.UserAction.actionCanceled(_:), v56);
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v58, v68, v61);
  swift_bridgeObjectRetain();
  sub_3FB60();
  uint64_t v35 = enum case for SystemPromptResolution.ResolutionInput.text(_:);
  uint64_t v36 = sub_40050();
  uint64_t v37 = *(void *)(v36 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 104))(v18, v35, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v18, 0, 1, v36);
  uint64_t v38 = v52;
  sub_40070();
  uint64_t v39 = v55;
  uint64_t v40 = v63;
  uint64_t v41 = v57;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v63, v33, v57);
  (*(void (**)(char *, void, uint64_t))(v64 + 104))(v40, enum case for MessagePayload.RequestContent.promptResolution(_:), v66);
  uint64_t v42 = sub_3FC40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v67, 1, 1, v42);
  v54(v62, 1, 1, v53);
  uint64_t v43 = sub_3FC50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v71, 1, 1, v43);
  uint64_t v44 = v59;
  sub_3FC70();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v33, v41);
  uint64_t v45 = v44;
  uint64_t v46 = (uint64_t)v73;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v73, v44, v80);
  uint64_t v48 = v74;
  uint64_t v47 = v75;
  (*(void (**)(uint64_t, void, uint64_t))(v74 + 104))(v46, enum case for MessagePayload.request(_:), v75);
  uint64_t v49 = v72;
  sub_20CAC(v76, v46);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
  sub_40530();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v49, v79);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v45, v80);
}

uint64_t sub_2432C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v4 = type metadata accessor for IFFlow.State();
  v2[4] = v4;
  v2[5] = *(void *)(v4 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[7] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24450;
  return sub_24664(a1);
}

uint64_t sub_24450()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_2458C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2458C()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[4];
  *(void *)uint64_t v1 = v0[8];
  *(unsigned char *)(v1 + 8) = 1;
  swift_storeEnumTagMultiPayload();
  swift_errorRetain();
  sub_30578(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_3F1F0();
  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24664(uint64_t a1)
{
  v2[49] = a1;
  v2[50] = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = sub_3EF90();
  v2[51] = v4;
  v2[52] = *(void *)(v4 - 8);
  v2[53] = swift_task_alloc();
  sub_5044(&qword_4D248);
  v2[54] = swift_task_alloc();
  uint64_t v5 = sub_3F2C0();
  v2[55] = v5;
  v2[56] = *(void *)(v5 - 8);
  v2[57] = swift_task_alloc();
  uint64_t v6 = sub_3F580();
  v2[58] = v6;
  v2[59] = *(void *)(v6 - 8);
  v2[60] = swift_task_alloc();
  sub_5044(&qword_4D648);
  v2[61] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for IFFlowError();
  v2[62] = v7;
  v2[63] = *(void *)(v7 - 8);
  v2[64] = swift_task_alloc();
  v2[65] = sub_3FCA0();
  v2[66] = swift_task_alloc();
  uint64_t v8 = sub_40030();
  v2[67] = v8;
  v2[68] = *(void *)(v8 - 8);
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  v2[71] = swift_task_alloc();
  uint64_t v9 = sub_40320();
  v2[72] = v9;
  v2[73] = *(void *)(v9 - 8);
  v2[74] = swift_task_alloc();
  sub_5044(&qword_4D650);
  v2[75] = swift_task_alloc();
  uint64_t v10 = sub_3EFC0();
  v2[76] = v10;
  v2[77] = *(void *)(v10 - 8);
  v2[78] = swift_task_alloc();
  v2[79] = swift_task_alloc();
  sub_5044(&qword_4D4C0);
  v2[80] = swift_task_alloc();
  uint64_t v11 = sub_3FFE0();
  v2[81] = v11;
  v2[82] = *(void *)(v11 - 8);
  v2[83] = swift_task_alloc();
  v2[84] = *(void *)(v3 + 80);
  v2[85] = *(void *)(v3 + 88);
  uint64_t v12 = type metadata accessor for IFFlow.State();
  v2[86] = v12;
  v2[87] = *(void *)(v12 - 8);
  v2[88] = swift_task_alloc();
  v2[89] = swift_task_alloc();
  uint64_t v13 = sub_405B0();
  v2[90] = v13;
  v2[91] = *(void *)(v13 - 8);
  v2[92] = swift_task_alloc();
  return _swift_task_switch(sub_24BC8, 0, 0);
}

uint64_t sub_24BC8()
{
  uint64_t v131 = v0;
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v119 = (void *)(v0 + 96);
  uint64_t v1 = *(void *)(v0 + 736);
  uint64_t v2 = *(void *)(v0 + 728);
  *(void *)(v0 + 744) = sub_4A6C(*(void *)(v0 + 720), (uint64_t)qword_4E370);
  (*(void (**)(uint64_t))(v2 + 16))(v1);
  swift_retain();
  uint64_t v3 = sub_405A0();
  os_log_type_t v4 = sub_407F0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void *)(v0 + 736);
  uint64_t v7 = *(void *)(v0 + 728);
  uint64_t v8 = *(void *)(v0 + 720);
  if (v5)
  {
    uint64_t v117 = *(void *)(v0 + 720);
    uint64_t v118 = *(void *)(v0 + 736);
    uint64_t v9 = *(void *)(v0 + 712);
    uint64_t v10 = *(void *)(v0 + 696);
    log = v3;
    uint64_t v11 = *(void *)(v0 + 688);
    uint64_t v12 = *(void *)(v0 + 400);
    os_log_type_t type = v4;
    uint64_t v13 = swift_slowAlloc();
    v130[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v0 + 368) = sub_17898(0x657475636578655FLL, 0xEA00000000002928, v130);
    sub_40860();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v14 = v12 + *(void *)(*(void *)v12 + 208);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v14, v11);
    uint64_t v15 = sub_2E290(v11);
    unint64_t v17 = v16;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    *(void *)(v0 + 384) = sub_17898(v15, v17, v130);
    sub_40860();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl(&dword_0, log, type, "%s called for IFFlowPlugin with state - %s ", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v118, v117);
  }
  else
  {
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  uint64_t v18 = *(void *)(v0 + 704);
  uint64_t v19 = *(void *)(v0 + 696);
  uint64_t v20 = *(void *)(v0 + 688);
  uint64_t v21 = *(void *)(v0 + 400) + *(void *)(**(void **)(v0 + 400) + 208);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v28 = *(void *)(v0 + 704);
      uint64_t v29 = *(void *)(v0 + 544);
      uint64_t v30 = *(void *)(v0 + 536);
      uint64_t v31 = v28 + *(int *)(sub_5044(qword_4D590) + 48);
      sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      swift_allocError();
      *uint64_t v32 = 0xD00000000000004ELL;
      v32[1] = 0x8000000000043A30;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      uint64_t v33 = sub_3FAA0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v31, v33);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      goto LABEL_33;
    case 2u:
      uint64_t v34 = *(uint64_t **)(v0 + 704);
      uint64_t v35 = *v34;
      *(void *)(v0 + 816) = *v34;
      int v36 = *((unsigned __int8 *)v34 + 8);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v37 = sub_405A0();
      os_log_type_t v38 = sub_40800();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = 138412290;
        swift_errorRetain();
        uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 328) = v41;
        sub_40860();
        void *v40 = v41;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v37, v38, "IFFlow exiting with error %@", v39, 0xCu);
        sub_5044(&qword_4D358);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      sub_20F88();
      uint64_t v46 = sub_40410();
      uint64_t v48 = v47;
      swift_release();
      if (!v36)
      {
        swift_bridgeObjectRelease();
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v54 = sub_405A0();
        os_log_type_t v55 = sub_407F0();
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = (uint8_t *)swift_slowAlloc();
          uint64_t v57 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v56 = 138412290;
          swift_errorRetain();
          uint64_t v58 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v0 + 376) = v58;
          sub_40860();
          *uint64_t v57 = v58;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v54, v55, "IFFlow non presentable error FallbackToSiriX %@", v56, 0xCu);
          sub_5044(&qword_4D358);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
        }
        uint64_t v85 = v54;
        uint64_t v86 = *(void *)(v0 + 712);
        uint64_t v87 = *(void *)(v0 + 696);
        uint64_t v88 = *(void *)(v0 + 688);
        uint64_t v90 = *(void *)(v0 + 416);
        uint64_t v89 = *(void *)(v0 + 424);
        uint64_t v91 = *(void *)(v0 + 408);

        *(void *)uint64_t v86 = v35;
        *(unsigned char *)(v86 + 8) = 1;
        swift_storeEnumTagMultiPayload();
        swift_errorRetain();
        sub_30578(v86);
        (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
        (*(void (**)(uint64_t, void, uint64_t))(v90 + 104))(v89, enum case for FlowUnhandledReason.needsSiriXFallback(_:), v91);
        sub_3F240();
        swift_errorRelease();
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v89, v91);
        goto LABEL_33;
      }
      uint64_t v49 = *(void *)(v0 + 504);
      *(void *)(v0 + 352) = v35;
      swift_errorRetain();
      sub_5044(&qword_4D658);
      char v50 = swift_dynamicCast();
      uint64_t v51 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v49 + 56);
      if (v50)
      {
        uint64_t v52 = *(void *)(v0 + 512);
        uint64_t v53 = *(void *)(v0 + 488);
        v51(v53, 0, 1, *(void *)(v0 + 496));
        sub_30514(v53, v52);
        sub_346F8(v46, v48);
        swift_bridgeObjectRelease();
        sub_31BC(v52);
      }
      else
      {
        uint64_t v82 = *(void *)(v0 + 488);
        v51(v82, 1, 1, *(void *)(v0 + 496));
        swift_bridgeObjectRelease();
        sub_ACEC(v82, &qword_4D648);
      }
      uint64_t v83 = (void *)swift_task_alloc();
      *(void *)(v0 + 824) = v83;
      void *v83 = v0;
      v83[1] = sub_26A2C;
      uint64_t v84 = *(void *)(v0 + 456);
      uint64_t result = static ErrorTemplates.genericErrorLegacy()(v84);
      break;
    case 3u:
      sub_2F2E8(**(void **)(v0 + 704), *(unsigned char *)(*(void *)(v0 + 704) + 8));
      sub_3F220();
      goto LABEL_33;
    case 4u:
      sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      swift_allocError();
      *uint64_t v42 = 0xD00000000000005CLL;
      v42[1] = 0x8000000000043A80;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      goto LABEL_33;
    case 5u:
      uint64_t v43 = (void *)swift_task_alloc();
      *(void *)(v0 + 776) = v43;
      *uint64_t v43 = v0;
      v43[1] = sub_26268;
      uint64_t v44 = *(void *)(v0 + 568);
      return sub_27FD0(v44);
    default:
      uint64_t v22 = *(void *)(v0 + 704);
      uint64_t v23 = *(void *)(v0 + 664);
      uint64_t v24 = *(void *)(v0 + 656);
      uint64_t v25 = *(void *)(v0 + 648);
      uint64_t v26 = *(void *)(v0 + 640);
      uint64_t v27 = v22 + *(int *)(sub_5044(&qword_4D1E8) + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v23, v22, v25);
      sub_1397C(v27, v26, &qword_4D4C0);
      sub_40530();
      uint64_t v59 = sub_405A0();
      os_log_type_t v60 = sub_40810();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v62 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v62 = 0;
        _os_log_impl(&dword_0, v59, v60, "sent message to IFClient, logging IntelligenceFlowQuerySent message", v62, 2u);
        swift_slowDealloc();
      }
      uint64_t v63 = *(void *)(v0 + 712);
      uint64_t v64 = *(void *)(v0 + 696);
      uint64_t v65 = *(void *)(v0 + 688);
      uint64_t v124 = *(void *)(v0 + 640);
      uint64_t v125 = *(void *)(v0 + 616);
      uint64_t v128 = *(void *)(v0 + 608);
      uint64_t v122 = *(void *)(v0 + 600);

      sub_27E4C();
      swift_storeEnumTagMultiPayload();
      sub_30578(v63);
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
      sub_20F88();
      uint64_t v66 = sub_40420();
      unint64_t v68 = v67;
      swift_release();
      sub_20F88();
      uint64_t v69 = sub_40410();
      unint64_t v71 = v70;
      swift_release();
      sub_20F88();
      uint64_t v72 = sub_404A0();
      unint64_t v74 = v73;
      swift_release();
      sub_20F88();
      uint64_t v75 = sub_40490();
      uint64_t v77 = v76;
      swift_release();
      sub_1EB8C(v66, v68, v69, v71, v72, v74, v75, v77, v122, v124);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v125 + 48))(v122, 1, v128) == 1)
      {
        sub_ACEC(*(void *)(v0 + 600), &qword_4D650);
        uint64_t v78 = *(void *)(v0 + 664);
        uint64_t v79 = *(void *)(v0 + 656);
        uint64_t v80 = *(void *)(v0 + 648);
        uint64_t v81 = *(void *)(v0 + 640);
        sub_3F1F0();
        sub_ACEC(v81, &qword_4D4C0);
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v78, v80);
LABEL_33:
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v92 = *(uint64_t (**)(void))(v0 + 8);
        uint64_t result = v92();
      }
      else
      {
        uint64_t v93 = *(void *)(v0 + 632);
        uint64_t v94 = *(uint64_t **)(v0 + 624);
        uint64_t v95 = *(void *)(v0 + 616);
        uint64_t v96 = *(void *)(v0 + 608);
        (*(void (**)(uint64_t, void, uint64_t))(v95 + 32))(v93, *(void *)(v0 + 600), v96);
        uint64_t v97 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v95 + 16);
        v97(v94, v93, v96);
        uint64_t v98 = sub_405A0();
        os_log_type_t v99 = sub_407F0();
        BOOL v100 = os_log_type_enabled(v98, v99);
        uint64_t v101 = *(void *)(v0 + 624);
        uint64_t v102 = *(void *)(v0 + 616);
        if (v100)
        {
          uint64_t v103 = *(void *)(v0 + 592);
          uint64_t v120 = *(void *)(v0 + 584);
          uint64_t v123 = *(void *)(v0 + 576);
          os_log_type_t v129 = v99;
          uint64_t v127 = *(void *)(v0 + 608);
          uint64_t v104 = (uint8_t *)swift_slowAlloc();
          uint64_t v121 = (void *)swift_slowAlloc();
          uint64_t v126 = v104;
          *(_DWORD *)uint64_t v104 = 138412290;
          sub_3EFA0();
          sub_DBEC(v119, *(void *)(v0 + 120));
          sub_40330();
          uint64_t v105 = sub_40310();
          (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v103, v123);
          sub_8CD8((uint64_t)v119);
          *(void *)(v0 + 360) = v105;
          sub_40860();
          *uint64_t v121 = v105;
          uint64_t v106 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
          v106(v101, v127);
          _os_log_impl(&dword_0, v98, v129, "Posting %@", v126, 0xCu);
          sub_5044(&qword_4D358);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          uint64_t v106 = *(void (**)(uint64_t, uint64_t))(v102 + 8);
          v106(*(void *)(v0 + 624), *(void *)(v0 + 608));
        }
        *(void *)(v0 + 752) = v106;
        uint64_t v107 = *(void *)(v0 + 632);
        uint64_t v108 = *(void *)(v0 + 608);
        uint64_t v109 = *(void **)(v0 + 400);

        uint64_t v110 = v109 + 9;
        uint64_t v111 = v109[12];
        uint64_t v112 = v109[13];
        sub_DBEC(v110, v111);
        *(void *)(v0 + 160) = v108;
        *(void *)(v0 + 168) = &protocol witness table for FlowMessageTransportableOutput;
        uint64_t v113 = sub_1174C((uint64_t *)(v0 + 136));
        v97(v113, v107, v108);
        uint64_t v114 = (void *)swift_task_alloc();
        *(void *)(v0 + 760) = v114;
        *uint64_t v114 = v0;
        v114[1] = sub_25F78;
        uint64_t result = dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 136, v111, v112);
      }
      break;
  }
  return result;
}

uint64_t sub_25F78()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 768) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_27054;
  }
  else
  {
    sub_8CD8(v2 + 136);
    uint64_t v3 = sub_26094;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_26094()
{
  (*(void (**)(void, void))(v0 + 752))(*(void *)(v0 + 632), *(void *)(v0 + 608));
  uint64_t v1 = *(void *)(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 656);
  uint64_t v3 = *(void *)(v0 + 648);
  uint64_t v4 = *(void *)(v0 + 640);
  sub_3F1F0();
  sub_ACEC(v4, &qword_4D4C0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_26268()
{
  *(void *)(*(void *)v1 + 784) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_27230;
  }
  else {
    uint64_t v2 = sub_2637C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2637C()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[68] + 16);
  v1(v0[70], v0[71], v0[67]);
  uint64_t v2 = sub_405A0();
  os_log_type_t v3 = sub_407F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v24 = v2;
    uint64_t v4 = v0[70];
    uint64_t v5 = v0[69];
    uint64_t v6 = v0[68];
    uint64_t v7 = v0[67];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    v1(v5, v4, v7);
    uint64_t v9 = sub_406C0();
    v0[39] = sub_17898(v9, v10, &v25);
    sub_40860();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11(v4, v7);
    uint64_t v2 = v24;
    _os_log_impl(&dword_0, v24, v3, "Event received from IntelligenceFlow: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0[68] + 8);
    v11(v0[70], v0[67]);
  }

  v0[99] = v11;
  sub_40010();
  v0[34] = sub_406C0();
  v0[35] = v12;
  sub_13600();
  uint64_t v13 = sub_40890();
  swift_bridgeObjectRelease();
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_405A0();
    os_log_type_t v15 = sub_40810();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t result = swift_slowAlloc();
      uint64_t v25 = result;
      *(_DWORD *)unint64_t v16 = 136446210;
      if (!*(void *)(v13 + 16))
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_406D0();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      v0[38] = sub_17898(v18, v20, &v25);
      sub_40860();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v14, v15, "Event received from IntelligenceFlow: %{public}s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v21 = (void *)swift_task_alloc();
  v0[100] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_26788;
  uint64_t v22 = v0[71];
  uint64_t v23 = v0[49];
  return sub_285F0(v23, v22);
}

uint64_t sub_26788()
{
  *(void *)(*(void *)v1 + 808) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_27504;
  }
  else {
    uint64_t v2 = sub_2689C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2689C()
{
  (*(void (**)(void, void))(v0 + 792))(*(void *)(v0 + 568), *(void *)(v0 + 536));
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_26A2C()
{
  *(void *)(*(void *)v1 + 832) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_277F8;
  }
  else {
    uint64_t v2 = sub_26B40;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_26B40()
{
  uint64_t v1 = *(void *)(v0 + 472);
  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v14 = *(void *)(v0 + 464);
  uint64_t v3 = *(void *)(v0 + 448);
  uint64_t v12 = *(void *)(v0 + 480);
  uint64_t v13 = *(void *)(v0 + 440);
  uint64_t v4 = *(void *)(v0 + 432);
  uint64_t v5 = *(void **)(v0 + 400);
  sub_DBEC(v5 + 4, v5[7]);
  sub_3F070();
  uint64_t v6 = sub_3F280();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_3F1E0();
  sub_ACEC(v0 + 16, &qword_4D660);
  sub_ACEC(v4, &qword_4D248);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  uint64_t v7 = v5[12];
  uint64_t v8 = v5[13];
  sub_DBEC(v5 + 9, v7);
  *(void *)(v0 + 80) = v14;
  *(void *)(v0 + 88) = &protocol witness table for AceOutput;
  uint64_t v9 = sub_1174C((uint64_t *)(v0 + 56));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 16))(v9, v12, v14);
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 840) = v10;
  *unint64_t v10 = v0;
  v10[1] = sub_26D48;
  return dispatch thunk of OutputPublisherAsync.publish(output:)(v0 + 56, v7, v8);
}

uint64_t sub_26D48()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 848) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_27B10;
  }
  else
  {
    sub_8CD8(v2 + 56);
    uint64_t v3 = sub_26E64;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_26E64()
{
  (*(void (**)(void, void))(v0[59] + 8))(v0[60], v0[58]);
  uint64_t v1 = v0[89];
  uint64_t v2 = v0[87];
  uint64_t v3 = v0[86];
  *(void *)uint64_t v1 = v0[102];
  *(unsigned char *)(v1 + 8) = 1;
  swift_storeEnumTagMultiPayload();
  swift_errorRetain();
  sub_30578(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_3F220();
  swift_errorRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_27054()
{
  uint64_t v1 = *(void *)(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 656);
  uint64_t v3 = *(void *)(v0 + 648);
  uint64_t v4 = *(void *)(v0 + 640);
  (*(void (**)(void, void))(v0 + 752))(*(void *)(v0 + 632), *(void *)(v0 + 608));
  sub_ACEC(v4, &qword_4D4C0);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_8CD8(v0 + 136);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_27230()
{
  uint64_t v9 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_405A0();
  os_log_type_t v2 = sub_40800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_40980();
    *(void *)(v0 + 288) = sub_17898(v4, v5, &v8);
    sub_40860();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "Error while receiving event from Intelligence Flow %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_27504()
{
  uint64_t v9 = v0;
  (*(void (**)(void, void))(v0 + 792))(*(void *)(v0 + 568), *(void *)(v0 + 536));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_405A0();
  os_log_type_t v2 = sub_40800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = sub_40980();
    *(void *)(v0 + 288) = sub_17898(v4, v5, &v8);
    sub_40860();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "Error while receiving event from Intelligence Flow %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  swift_willThrow();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_277F8()
{
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_405A0();
  os_log_type_t v2 = sub_40800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[43] = v5;
    sub_40860();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "Unable to publish error output due to %@.", v3, 0xCu);
    sub_5044(&qword_4D358);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[89];
  uint64_t v7 = v0[87];
  uint64_t v8 = v0[86];
  *(void *)uint64_t v6 = v0[102];
  *(unsigned char *)(v6 + 8) = 1;
  swift_storeEnumTagMultiPayload();
  swift_errorRetain();
  sub_30578(v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_3F220();
  swift_errorRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_27B10()
{
  (*(void (**)(void, void))(v0[59] + 8))(v0[60], v0[58]);
  sub_8CD8((uint64_t)(v0 + 7));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_405A0();
  os_log_type_t v2 = sub_40800();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[43] = v5;
    sub_40860();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "Unable to publish error output due to %@.", v3, 0xCu);
    sub_5044(&qword_4D358);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v6 = v0[89];
  uint64_t v7 = v0[87];
  uint64_t v8 = v0[86];
  *(void *)uint64_t v6 = v0[102];
  *(unsigned char *)(v6 + 8) = 1;
  swift_storeEnumTagMultiPayload();
  swift_errorRetain();
  sub_30578(v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_3F220();
  swift_errorRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_27E4C()
{
  sub_20F88();
  uint64_t v18 = sub_40410();
  uint64_t v1 = v0;
  swift_release();
  sub_20F88();
  uint64_t v2 = sub_40470();
  uint64_t v4 = v3;
  swift_release();
  sub_20F88();
  uint64_t v5 = sub_40410();
  uint64_t v7 = v6;
  swift_release();
  sub_20F88();
  uint64_t v8 = sub_40420();
  uint64_t v10 = v9;
  swift_release();
  sub_3393C(v5, v7, v8, v10, v18, v1, v2, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20F88();
  uint64_t v11 = sub_40420();
  unint64_t v13 = v12;
  swift_release();
  sub_20F88();
  uint64_t v14 = sub_40410();
  unint64_t v16 = v15;
  swift_release();
  sub_34210(v11, v13, v14, v16);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_27FD0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = swift_getAssociatedTypeWitness();
  v2[5] = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[6] = AssociatedTypeWitness;
  v2[7] = *(void *)(AssociatedTypeWitness - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  sub_5044(&qword_4D738);
  v2[10] = swift_task_alloc();
  return _swift_task_switch(sub_28168, 0, 0);
}

uint64_t sub_28168()
{
  sub_21570(v0[9]);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[11] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_28244;
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[6];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, AssociatedConformanceWitness);
}

uint64_t sub_28244()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_28548;
  }
  else
  {
    sub_2193C(*(void *)(v2 + 72));
    uint64_t v3 = sub_28364;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_28364()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = sub_40030();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_ACEC(v1, &qword_4D738);
    type metadata accessor for IFFlowError();
    sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    swift_allocError();
    *uint64_t v4 = 0xD000000000000023;
    v4[1] = 0x8000000000043BD0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[2], v1, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_28548()
{
  uint64_t v1 = v0[8];
  (*(void (**)(uint64_t, void, void))(v0[7] + 32))(v1, v0[9], v0[6]);
  sub_2193C(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_285F0(uint64_t a1, uint64_t a2)
{
  v3[97] = v2;
  v3[96] = a2;
  v3[95] = a1;
  uint64_t v4 = *v2;
  uint64_t v5 = sub_3F520();
  v3[98] = v5;
  v3[99] = *(void *)(v5 - 8);
  v3[100] = swift_task_alloc();
  sub_3F4D0();
  v3[101] = swift_task_alloc();
  uint64_t v6 = sub_3F120();
  v3[102] = v6;
  v3[103] = *(void *)(v6 - 8);
  v3[104] = swift_task_alloc();
  uint64_t v7 = sub_3F510();
  v3[105] = v7;
  v3[106] = *(void *)(v7 - 8);
  v3[107] = swift_task_alloc();
  uint64_t v8 = sub_3EF90();
  v3[108] = v8;
  v3[109] = *(void *)(v8 - 8);
  v3[110] = swift_task_alloc();
  uint64_t v9 = sub_3FAF0();
  v3[111] = v9;
  v3[112] = *(void *)(v9 - 8);
  v3[113] = swift_task_alloc();
  v3[114] = swift_task_alloc();
  v3[115] = swift_task_alloc();
  sub_5044(&qword_4D648);
  v3[116] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for IFFlowError();
  v3[117] = v10;
  v3[118] = *(void *)(v10 - 8);
  v3[119] = swift_task_alloc();
  v3[120] = swift_task_alloc();
  uint64_t v11 = sub_3F350();
  v3[121] = v11;
  v3[122] = *(void *)(v11 - 8);
  v3[123] = swift_task_alloc();
  uint64_t v12 = sub_40590();
  v3[124] = v12;
  v3[125] = *(void *)(v12 - 8);
  v3[126] = swift_task_alloc();
  v3[127] = swift_task_alloc();
  uint64_t v13 = sub_3FEC0();
  v3[128] = v13;
  v3[129] = *(void *)(v13 - 8);
  v3[130] = swift_task_alloc();
  v3[131] = swift_task_alloc();
  uint64_t v14 = sub_3FEE0();
  v3[132] = v14;
  v3[133] = *(void *)(v14 - 8);
  v3[134] = swift_task_alloc();
  uint64_t v15 = sub_40030();
  v3[135] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v3[136] = v16;
  v3[137] = *(void *)(v16 + 64);
  v3[138] = swift_task_alloc();
  uint64_t v17 = sub_3FAA0();
  v3[139] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v3[140] = v18;
  v3[141] = *(void *)(v18 + 64);
  v3[142] = swift_task_alloc();
  v3[143] = swift_task_alloc();
  v3[144] = swift_task_alloc();
  v3[145] = swift_task_alloc();
  v3[146] = swift_task_alloc();
  v3[147] = swift_task_alloc();
  v3[148] = *(void *)(v4 + 80);
  v3[149] = *(void *)(v4 + 88);
  uint64_t v19 = type metadata accessor for IFFlow.State();
  v3[150] = v19;
  v3[151] = *(void *)(v19 - 8);
  v3[152] = swift_task_alloc();
  uint64_t v20 = sub_3FCA0();
  v3[153] = v20;
  v3[154] = *(void *)(v20 - 8);
  v3[155] = swift_task_alloc();
  sub_5044(&qword_4D680);
  v3[156] = swift_task_alloc();
  v3[157] = swift_task_alloc();
  return _swift_task_switch(sub_28CD8, 0, 0);
}

uint64_t sub_28CD8()
{
  uint64_t v1 = v0[97];
  uint64_t v2 = sub_20F88();
  v0[158] = v2;
  uint64_t v3 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 224);
  v0[159] = v4;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[160] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_28DC0;
  uint64_t v6 = v0[157];
  uint64_t v7 = v0[96];
  return sub_375E0(v6, v7, v1 + 112, v2, v3, v4, v1 + 32);
}

uint64_t sub_28DC0()
{
  *(void *)(*(void *)v1 + 1288) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2CBE8;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_28EE8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_28EE8()
{
  v305 = v0;
  uint64_t v1 = v0;
  sub_20F88();
  uint64_t v2 = sub_40410();
  unint64_t v4 = v3;
  swift_release();
  if (v4)
  {
    uint64_t v5 = v1[155];
    uint64_t v6 = v1[154];
    uint64_t v7 = v1[153];
    sub_40010();
    sub_35114(v5, v2, v4);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_405B0();
    sub_4A6C(v8, (uint64_t)qword_4E370);
    uint64_t v9 = sub_405A0();
    os_log_type_t v10 = sub_407F0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_0, v9, v10, "Cannot attempt to apply redaction tag for empty rootRequestId", v11, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v12 = v1[156];
  sub_1375C(v1[157], v12, &qword_4D680);
  uint64_t v13 = type metadata accessor for FlowAction();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13) == 1)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_405B0();
    sub_4A6C(v14, (uint64_t)qword_4E370);
    uint64_t v15 = sub_405A0();
    os_log_type_t v16 = sub_407F0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      v304[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315138;
      v1[93] = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
      sub_40860();
      _os_log_impl(&dword_0, v15, v16, "In %s - next flow action is none", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v18 = v1[157];
    uint64_t v19 = v1[152];
    uint64_t v20 = v1[151];
    uint64_t v21 = v1[150];
    swift_storeEnumTagMultiPayload();
    sub_30578(v19);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_3F1F0();
LABEL_14:
    uint64_t v22 = v18;
LABEL_15:
    sub_ACEC(v22, &qword_4D680);
    goto LABEL_16;
  }
  uint64_t v25 = (uint64_t)(v1 + 12);
  uint64_t v273 = (uint64_t)(v1 + 17);
  v257 = (long long *)(v1 + 22);
  uint64_t v297 = (uint64_t)(v1 + 27);
  uint64_t v26 = (uint64_t)(v1 + 32);
  uint64_t v221 = (uint64_t)(v1 + 37);
  v230 = (long long *)(v1 + 42);
  uint64_t v264 = (uint64_t)(v1 + 47);
  v249 = (long long *)(v1 + 52);
  uint64_t v291 = (uint64_t)(v1 + 57);
  uint64_t v259 = (uint64_t)(v1 + 62);
  v246 = (long long *)(v1 + 67);
  uint64_t v287 = (uint64_t)(v1 + 72);
  v212 = v1 + 80;
  v216 = v1 + 77;
  uint64_t v27 = v1;
  uint64_t v28 = v1 + 85;
  v210 = v27 + 87;
  v225 = v27 + 89;
  v236 = v27 + 90;
  v242 = v27 + 88;
  uint64_t v29 = v27[156];
  v303 = v27;
  uint64_t v30 = v27 + 92;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v41 = v303[144];
      uint64_t v42 = v303[140];
      uint64_t v43 = v303[139];
      uint64_t v44 = sub_5044(&qword_4D6C8);
      uint64_t v45 = v29 + *(int *)(v44 + 48);
      char v46 = *(unsigned char *)(v29 + *(int *)(v44 + 64));
      sub_11380((long long *)v29, v291);
      v274 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32);
      v274(v41, v45, v43);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_405B0();
      sub_4A6C(v47, (uint64_t)qword_4E370);
      uint64_t v48 = sub_405A0();
      os_log_type_t v49 = sub_407F0();
      if (os_log_type_enabled(v48, v49))
      {
        char v50 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)char v50 = 136315138;
        *uint64_t v28 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v48, v49, "In %s - next flow action is promptForConfirmation", v50, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v1 = v303;
      uint64_t v260 = v303[157];
      uint64_t v211 = v303[152];
      uint64_t v217 = v303[150];
      uint64_t v226 = v303[151];
      uint64_t v231 = v303[146];
      uint64_t v285 = v303[144];
      uint64_t v247 = v303[141];
      uint64_t v288 = v303[140];
      uint64_t v213 = v303[139];
      uint64_t v237 = v303[138];
      uint64_t v51 = v303[136];
      uint64_t v281 = v303[135];
      uint64_t v298 = v303[97];
      uint64_t v52 = v303[96];
      long long v254 = *((_OWORD *)v303 + 74);
      sub_7B5C(v291, (uint64_t)v249);
      type metadata accessor for ExternalServiceConfirmationStrategy();
      uint64_t v53 = swift_allocObject();
      sub_11380(v249, v53 + 16);
      *(unsigned char *)(v53 + 56) = v46;
      sub_7B5C(v298 + 72, v264);
      sub_5044(&qword_4D6D0);
      swift_allocObject();
      sub_30AE4(&qword_4D6D8, (void (*)(uint64_t))type metadata accessor for ExternalServiceConfirmationStrategy);
      swift_retain();
      v303[84] = sub_3EE70();
      sub_307FC(&qword_4D6E0, &qword_4D6D0);
      sub_3EF30();
      swift_release();
      uint64_t v54 = v211 + *(int *)(sub_5044(qword_4D590) + 48);
      v265 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
      v265(v211, v52, v281);
      os_log_type_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v288 + 16);
      v55(v54, v285, v213);
      swift_storeEnumTagMultiPayload();
      sub_30578(v211);
      (*(void (**)(uint64_t, uint64_t))(v226 + 8))(v211, v217);
      v55(v231, v285, v213);
      v265(v237, v52, v281);
      unint64_t v56 = (*(unsigned __int8 *)(v288 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v288 + 80);
      unint64_t v57 = (v247 + *(unsigned __int8 *)(v51 + 80) + v56) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
      uint64_t v58 = swift_allocObject();
      *(_OWORD *)(v58 + 16) = v254;
      *(void *)(v58 + 32) = v298;
      v274(v58 + v56, v231, v213);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v51 + 32))(v58 + v57, v237, v281);
      swift_retain();
      sub_3F210();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v288 + 8))(v285, v213);
      sub_8CD8(v291);
      uint64_t v22 = v260;
      goto LABEL_15;
    case 2u:
      uint64_t v59 = v303[147];
      uint64_t v60 = v303[140];
      uint64_t v61 = v303[139];
      uint64_t v62 = v29 + *(int *)(sub_5044(&qword_4D6F8) + 48);
      sub_11380((long long *)v29, v297);
      v269 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32);
      v269(v59, v62, v61);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v63 = sub_405B0();
      sub_4A6C(v63, (uint64_t)qword_4E370);
      uint64_t v64 = sub_405A0();
      os_log_type_t v65 = sub_407F0();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v66 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v66 = 136315138;
        uint64_t *v30 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v64, v65, "In %s - next flow action is promptForValue", v66, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v266 = v303[157];
      uint64_t v67 = v303[152];
      uint64_t v227 = v303[150];
      uint64_t v232 = v303[151];
      uint64_t v289 = v303[147];
      uint64_t v238 = v303[146];
      uint64_t v250 = v303[141];
      uint64_t v282 = v303[140];
      uint64_t v243 = v303[138];
      uint64_t v68 = v303[136];
      uint64_t v218 = v303[135];
      uint64_t v222 = v303[139];
      uint64_t v292 = v303[97];
      uint64_t v69 = v303[96];
      long long v255 = *((_OWORD *)v303 + 74);
      sub_7B5C(v297, (uint64_t)v257);
      char v70 = *(unsigned char *)(v292 + 208);
      type metadata accessor for CriticalInfoPromptStrategy();
      uint64_t v71 = swift_allocObject();
      swift_getKeyPath();
      sub_5044(&qword_4D700);
      swift_allocObject();
      *(void *)(v71 + 64) = sub_3F8F0();
      sub_11380(v257, v71 + 16);
      *(unsigned char *)(v71 + 56) = v70;
      sub_7B5C(v292 + 72, v273);
      sub_5044(&qword_4D708);
      swift_allocObject();
      sub_30AE4(&qword_4D710, (void (*)(uint64_t))type metadata accessor for CriticalInfoPromptStrategy);
      swift_retain();
      v303[91] = sub_3EE20();
      sub_307FC(&qword_4D718, &qword_4D708);
      sub_3EF30();
      swift_release();
      uint64_t v72 = v67 + *(int *)(sub_5044(qword_4D590) + 48);
      v275 = *(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16);
      v275(v67, v69, v218);
      unint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v282 + 16);
      v73(v72, v289, v222);
      swift_storeEnumTagMultiPayload();
      sub_30578(v67);
      (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v67, v227);
      v73(v238, v289, v222);
      uint64_t v1 = v303;
      v275(v243, v69, v218);
      unint64_t v74 = (*(unsigned __int8 *)(v282 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v282 + 80);
      unint64_t v75 = (v250 + *(unsigned __int8 *)(v68 + 80) + v74) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
      uint64_t v76 = swift_allocObject();
      *(_OWORD *)(v76 + 16) = v255;
      *(void *)(v76 + 32) = v292;
      v269(v76 + v74, v238, v222);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v68 + 32))(v76 + v75, v243, v218);
      swift_retain();
      sub_3F210();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v282 + 8))(v289, v222);
      sub_8CD8(v297);
      uint64_t v22 = v266;
      goto LABEL_15;
    case 3u:
      uint64_t v77 = v303[143];
      uint64_t v78 = v303[140];
      uint64_t v79 = v303[139];
      uint64_t v80 = *(void *)(v29 + 40);
      uint64_t v81 = v29 + *(int *)(sub_5044(&qword_4D6A8) + 64);
      sub_11380((long long *)v29, v287);
      v270 = *(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 32);
      v270(v77, v81, v79);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v82 = sub_405B0();
      sub_4A6C(v82, (uint64_t)qword_4E370);
      uint64_t v83 = sub_405A0();
      os_log_type_t v84 = sub_407F0();
      if (os_log_type_enabled(v83, v84))
      {
        uint64_t v85 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v85 = 136315138;
        uint64_t *v212 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v83, v84, "In %s - next flow action is promptForDisambiguation", v85, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v267 = v303[157];
      uint64_t v86 = v303[152];
      uint64_t v223 = v303[151];
      uint64_t v87 = v303[150];
      uint64_t v233 = v303[146];
      uint64_t v286 = v303[143];
      uint64_t v251 = v303[141];
      uint64_t v278 = v303[140];
      uint64_t v239 = v303[138];
      uint64_t v88 = v303[136];
      uint64_t v219 = v303[139];
      uint64_t v89 = v303[135];
      uint64_t v299 = v303[97];
      uint64_t v90 = v303[96];
      long long v256 = *((_OWORD *)v303 + 74);
      sub_7B5C(v287, (uint64_t)v246);
      type metadata accessor for DisambiguationStrategy();
      uint64_t v91 = swift_allocObject();
      sub_11380(v246, v91 + 16);
      *(void *)(v91 + 56) = v80;
      sub_7B5C(v299 + 72, v259);
      sub_5044(&qword_4D6B0);
      swift_allocObject();
      sub_30AE4(&qword_4D6B8, (void (*)(uint64_t))type metadata accessor for DisambiguationStrategy);
      swift_retain();
      uint64_t v293 = sub_3EED0();
      uint64_t v92 = v86 + *(int *)(sub_5044(qword_4D590) + 48);
      v261 = *(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16);
      v261(v86, v90, v89);
      uint64_t v93 = *(void (**)(uint64_t, uint64_t, uint64_t))(v278 + 16);
      v93(v92, v286, v219);
      swift_storeEnumTagMultiPayload();
      sub_30578(v86);
      (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v86, v87);
      v303[79] = v293;
      v93(v233, v286, v219);
      uint64_t v1 = v303;
      v261(v239, v90, v89);
      unint64_t v94 = (*(unsigned __int8 *)(v278 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v278 + 80);
      unint64_t v95 = (v251 + *(unsigned __int8 *)(v88 + 80) + v94) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
      uint64_t v96 = swift_allocObject();
      *(_OWORD *)(v96 + 16) = v256;
      *(void *)(v96 + 32) = v299;
      v270(v96 + v94, v233, v219);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v88 + 32))(v96 + v95, v239, v89);
      sub_307FC(&qword_4D6C0, &qword_4D6B0);
      swift_retain();
      sub_3F200();
      swift_release();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v278 + 8))(v286, v219);
      sub_8CD8(v287);
      sub_ACEC(v267, &qword_4D680);
      swift_release();
      goto LABEL_16;
    case 4u:
      uint64_t v97 = v303[142];
      uint64_t v98 = v303[140];
      uint64_t v99 = v303[139];
      uint64_t v100 = v303[123];
      uint64_t v101 = v303[122];
      uint64_t v102 = v303[121];
      uint64_t v103 = v29 + *(int *)(sub_5044(&qword_4D698) + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v100, v29, v102);
      v283 = *(void (**)(uint64_t, uint64_t, uint64_t))(v98 + 32);
      v283(v97, v103, v99);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v104 = sub_405B0();
      sub_4A6C(v104, (uint64_t)qword_4E370);
      uint64_t v105 = sub_405A0();
      os_log_type_t v106 = sub_407F0();
      if (os_log_type_enabled(v105, v106))
      {
        uint64_t v107 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v107 = 136315138;
        uint64_t *v216 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v105, v106, "In %s - next flow action is promptForAuthentication", v107, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v279 = v303[157];
      uint64_t v108 = v303[152];
      uint64_t v240 = v303[150];
      uint64_t v244 = v303[151];
      uint64_t v248 = v303[146];
      uint64_t v294 = v303[142];
      uint64_t v258 = v303[141];
      uint64_t v109 = v303[140];
      uint64_t v110 = v303[139];
      uint64_t v252 = v303[138];
      uint64_t v111 = v303[136];
      uint64_t v112 = v303[135];
      uint64_t v214 = v112;
      uint64_t v262 = v303[123];
      uint64_t v271 = v303[122];
      uint64_t v276 = v303[121];
      uint64_t v228 = v303[97];
      uint64_t v113 = v303[96];
      sub_5044(&qword_4D6A0);
      sub_3EF10();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_411F0;
      long long v234 = *((_OWORD *)v303 + 74);
      sub_3EF00();
      uint64_t v300 = sub_3EDD0();
      swift_bridgeObjectRelease();
      uint64_t v114 = v108 + *(int *)(sub_5044(qword_4D590) + 48);
      uint64_t v115 = *(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16);
      v115(v108, v113, v112);
      uint64_t v116 = *(void (**)(uint64_t, uint64_t, uint64_t))(v109 + 16);
      v116(v114, v294, v110);
      swift_storeEnumTagMultiPayload();
      sub_30578(v108);
      (*(void (**)(uint64_t, uint64_t))(v244 + 8))(v108, v240);
      v303[78] = v300;
      v116(v248, v294, v110);
      v115(v252, v113, v214);
      uint64_t v1 = v303;
      unint64_t v117 = (*(unsigned __int8 *)(v109 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
      unint64_t v118 = (v258 + *(unsigned __int8 *)(v111 + 80) + v117) & ~(unint64_t)*(unsigned __int8 *)(v111 + 80);
      uint64_t v119 = swift_allocObject();
      *(_OWORD *)(v119 + 16) = v234;
      *(void *)(v119 + 32) = v228;
      v283(v119 + v117, v248, v110);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v111 + 32))(v119 + v118, v252, v214);
      sub_3EEE0();
      swift_retain();
      sub_3F200();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v294, v110);
      (*(void (**)(uint64_t, uint64_t))(v271 + 8))(v262, v276);
      uint64_t v120 = v279;
      goto LABEL_88;
    case 5u:
      uint64_t v122 = *(void *)v29;
      unint64_t v121 = *(void *)(v29 + 8);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v123 = sub_405B0();
      sub_4A6C(v123, (uint64_t)qword_4E370);
      uint64_t v124 = sub_405A0();
      os_log_type_t v125 = sub_407F0();
      if (os_log_type_enabled(v124, v125))
      {
        uint64_t v126 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v126 = 136315138;
        uint64_t *v225 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v124, v125, "In %s - next flow action is  redirectToEmergencyDomain", v126, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      swift_bridgeObjectRetain_n();
      uint64_t v127 = sub_405A0();
      os_log_type_t v128 = sub_407E0();
      if (os_log_type_enabled(v127, v128))
      {
        os_log_type_t v129 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)os_log_type_t v129 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t *v236 = sub_17898(v122, v121, v304);
        sub_40860();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v127, v128, "Redirecting to emergency domain with situation '%s'", v129, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      unint64_t v171 = v121;
      uint64_t v172 = v303[107];
      uint64_t v173 = v303[106];
      uint64_t v174 = v303[105];
      uint64_t v175 = v303[104];
      uint64_t v176 = v303[103];
      uint64_t v295 = v303[102];
      uint64_t v301 = v303[157];
      uint64_t v177 = v303[100];
      uint64_t v178 = v303[99];
      uint64_t v284 = v303[98];
      sub_5044(&qword_4D688);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_411F0;
      *(void *)(inited + 32) = 0xD000000000000012;
      *(void *)(inited + 40) = 0x8000000000043B80;
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 48) = v122;
      *(void *)(inited + 56) = v171;
      sub_20E50(inited);
      sub_3F4E0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v173 + 16))(v177, v172, v174);
      (*(void (**)(uint64_t, void, uint64_t))(v178 + 104))(v177, enum case for Parse.directInvocation(_:), v284);
      sub_3F4C0();
      sub_3F110();
      uint64_t v1 = v303;
      sub_3F230();
      (*(void (**)(uint64_t, uint64_t))(v176 + 8))(v175, v295);
      (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v172, v174);
      goto LABEL_76;
    case 6u:
      uint64_t v1 = v303;
      v303[164] = *(void *)v29;
      sub_1397C(v29 + 8, v26, &qword_4D690);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v130 = sub_405B0();
      v303[165] = sub_4A6C(v130, (uint64_t)qword_4E370);
      uint64_t v131 = sub_405A0();
      os_log_type_t v132 = sub_407F0();
      if (os_log_type_enabled(v131, v132))
      {
        uint64_t v133 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v133 = 136315138;
        v303[81] = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v131, v132, "In %s - next flow action is exit", v133, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      sub_1375C(v26, (uint64_t)v230, &qword_4D690);
      if (v303[45])
      {
        sub_11380(v230, v221);
        uint64_t v134 = sub_405A0();
        os_log_type_t v135 = sub_407F0();
        if (os_log_type_enabled(v134, v135))
        {
          uint64_t v136 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v136 = 0;
          _os_log_impl(&dword_0, v134, v135, "Session completed with Output", v136, 2u);
          swift_slowDealloc();
        }
        uint64_t v137 = (void *)v303[97];

        uint64_t v37 = v137[12];
        uint64_t v38 = v137[13];
        sub_DBEC(v137 + 9, v37);
        uint64_t v138 = (void *)swift_task_alloc();
        v303[166] = (uint64_t)v138;
        *uint64_t v138 = v303;
        v138[1] = sub_2C1A0;
        uint64_t v40 = v221;
LABEL_60:
        return dispatch thunk of OutputPublisherAsync.publish(output:)(v40, v37, v38);
      }
      sub_ACEC((uint64_t)v230, &qword_4D690);
      if (v303[164])
      {
        swift_errorRetain();
        uint64_t v180 = sub_405A0();
        os_log_type_t v181 = sub_407F0();
        if (os_log_type_enabled(v180, v181))
        {
          uint64_t v182 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v182 = 0;
          _os_log_impl(&dword_0, v180, v181, "Session completed with error", v182, 2u);
          swift_slowDealloc();
        }
        uint64_t v183 = v303[157];

        swift_willThrow();
        swift_errorRelease();
        sub_ACEC(v26, &qword_4D690);
        sub_ACEC(v183, &qword_4D680);
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v23 = (uint64_t (*)(void))v303[1];
        goto LABEL_17;
      }
      uint64_t v200 = v303[152];
      uint64_t v201 = v303[151];
      uint64_t v202 = v303[150];
      *(void *)uint64_t v200 = 0;
      *(unsigned char *)(v200 + 8) = 0;
      swift_storeEnumTagMultiPayload();
      sub_30578(v200);
      (*(void (**)(uint64_t, uint64_t))(v201 + 8))(v200, v202);
      v203 = sub_405A0();
      os_log_type_t v204 = sub_40800();
      if (os_log_type_enabled(v203, v204))
      {
        v205 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v205 = 0;
        _os_log_impl(&dword_0, v203, v204, "Session completed without error and output. Exiting flow.", v205, 2u);
        swift_slowDealloc();
      }
      uint64_t v18 = v303[157];

      sub_3F220();
      sub_ACEC(v26, &qword_4D690);
      goto LABEL_14;
    case 7u:
      uint64_t v139 = v303[145];
      uint64_t v140 = v303[140];
      uint64_t v141 = v303[139];
      uint64_t v142 = v303[134];
      uint64_t v143 = v303[133];
      uint64_t v144 = v303[132];
      uint64_t v145 = v29 + *(int *)(sub_5044(&qword_4D6E8) + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v143 + 32))(v142, v29, v144);
      uint64_t v146 = *(void (**)(uint64_t, uint64_t, uint64_t))(v140 + 32);
      v146(v139, v145, v141);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v147 = sub_405B0();
      sub_4A6C(v147, (uint64_t)qword_4E370);
      uint64_t v148 = sub_405A0();
      os_log_type_t v149 = sub_407F0();
      if (os_log_type_enabled(v148, v149))
      {
        uint64_t v150 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v150 = 136315138;
        uint64_t *v210 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v148, v149, "In %s - next flow action is runAjaxEnablement", v150, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v151 = v303[131];
      uint64_t v152 = v303[130];
      uint64_t v153 = v303[129];
      uint64_t v154 = v303[128];
      sub_3FED0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v153 + 16))(v152, v151, v154);
      int v155 = (*(uint64_t (**)(uint64_t, uint64_t))(v153 + 88))(v152, v154);
      v280 = (void (*)(unint64_t, uint64_t, uint64_t))v146;
      if (v155 == enum case for ActionConfirmation.SystemStyle.MontaraEnablement.Source.mediaQA(_:))
      {
        uint64_t v156 = v303[126];
        uint64_t v157 = v303[125];
        uint64_t v158 = v303[124];
        uint64_t v159 = (unsigned int *)&enum case for RequestType.mediaQA(_:);
LABEL_85:
        uint64_t v184 = *v159;
        v185 = *(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 104);
LABEL_86:
        v185(v156, v184, v158);
        goto LABEL_87;
      }
      if (v155 == enum case for ActionConfirmation.SystemStyle.MontaraEnablement.Source.knowledgeFallback(_:))
      {
        uint64_t v156 = v303[126];
        uint64_t v157 = v303[125];
        uint64_t v158 = v303[124];
        uint64_t v159 = (unsigned int *)&enum case for RequestType.knowledgeFallback(_:);
        goto LABEL_85;
      }
      if (v155 == enum case for ActionConfirmation.SystemStyle.MontaraEnablement.Source.composeViaSiri(_:))
      {
        uint64_t v156 = v303[126];
        uint64_t v157 = v303[125];
        uint64_t v158 = v303[124];
        uint64_t v159 = (unsigned int *)&enum case for RequestType.composeViaSiri(_:);
        goto LABEL_85;
      }
      v185 = *(void (**)(uint64_t, uint64_t, uint64_t))(v303[125] + 104);
      if (v155 == enum case for ActionConfirmation.SystemStyle.MontaraEnablement.Source.textAssistant(_:))
      {
        uint64_t v156 = v303[126];
        uint64_t v158 = v303[124];
        uint64_t v184 = enum case for RequestType.textAssistant(_:);
        goto LABEL_86;
      }
      uint64_t v206 = v303[130];
      uint64_t v207 = v303[129];
      uint64_t v208 = v303[128];
      v185(v303[126], enum case for RequestType.composeViaSiri(_:), v303[124]);
      (*(void (**)(uint64_t, uint64_t))(v207 + 8))(v206, v208);
LABEL_87:
      uint64_t v277 = v303[157];
      uint64_t v186 = v303[152];
      uint64_t v229 = v303[151];
      uint64_t v224 = v303[150];
      uint64_t v235 = v303[146];
      uint64_t v296 = v303[145];
      uint64_t v253 = v303[141];
      uint64_t v187 = v303[140];
      uint64_t v220 = v303[139];
      uint64_t v241 = v303[138];
      uint64_t v188 = v303[136];
      uint64_t v189 = v303[135];
      uint64_t v263 = v303[134];
      uint64_t v268 = v303[133];
      uint64_t v272 = v303[132];
      uint64_t v190 = v303[131];
      uint64_t v191 = v303[129];
      uint64_t v192 = v303[128];
      uint64_t v290 = v303[97];
      uint64_t v193 = v303[96];
      long long v245 = *((_OWORD *)v303 + 74);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v303[125] + 32))(v303[127], v303[126], v303[124]);
      (*(void (**)(uint64_t, uint64_t))(v191 + 8))(v190, v192);
      sub_3FEB0();
      sub_40620();
      swift_allocObject();
      uint64_t v302 = sub_40610();
      uint64_t v194 = v186 + *(int *)(sub_5044(qword_4D590) + 48);
      v209 = *(void (**)(uint64_t, uint64_t, uint64_t))(v188 + 16);
      v209(v186, v193, v189);
      uint64_t v195 = *(void (**)(uint64_t, uint64_t, uint64_t))(v187 + 16);
      v195(v194, v296, v220);
      swift_storeEnumTagMultiPayload();
      sub_30578(v186);
      uint64_t v196 = v186;
      uint64_t v1 = v303;
      (*(void (**)(uint64_t, uint64_t))(v229 + 8))(v196, v224);
      v303[86] = v302;
      v195(v235, v296, v220);
      v209(v241, v193, v189);
      uint64_t v215 = v187;
      unint64_t v197 = (*(unsigned __int8 *)(v187 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v187 + 80);
      unint64_t v198 = (v253 + *(unsigned __int8 *)(v188 + 80) + v197) & ~(unint64_t)*(unsigned __int8 *)(v188 + 80);
      uint64_t v199 = swift_allocObject();
      *(_OWORD *)(v199 + 16) = v245;
      *(void *)(v199 + 32) = v290;
      v280(v199 + v197, v235, v220);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v188 + 32))(v199 + v198, v241, v189);
      sub_30AE4(&qword_4D6F0, (void (*)(uint64_t))&type metadata accessor for GenerativeAssistantEnablementFlow);
      swift_retain();
      sub_3F200();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v215 + 8))(v296, v220);
      (*(void (**)(uint64_t, uint64_t))(v268 + 8))(v263, v272);
      uint64_t v120 = v277;
LABEL_88:
      sub_ACEC(v120, &qword_4D680);
      swift_release();
LABEL_16:
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
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v23 = (uint64_t (*)(void))v1[1];
LABEL_17:
      return v23();
    case 8u:
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v160 = sub_405B0();
      sub_4A6C(v160, (uint64_t)qword_4E370);
      v161 = sub_405A0();
      os_log_type_t v162 = sub_407F0();
      if (os_log_type_enabled(v161, v162))
      {
        uint64_t v163 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v163 = 136315138;
        uint64_t *v242 = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v161, v162, "In %s - next flow action is fallbackToSiriX", v163, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v301 = v303[157];
      uint64_t v164 = v303[152];
      uint64_t v165 = v303[151];
      uint64_t v166 = v303[150];
      uint64_t v167 = v303[110];
      uint64_t v168 = v303[109];
      uint64_t v169 = v303[108];
      sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      uint64_t v170 = swift_allocError();
      swift_storeEnumTagMultiPayload();
      *(void *)uint64_t v164 = v170;
      *(unsigned char *)(v164 + 8) = 1;
      swift_storeEnumTagMultiPayload();
      sub_30578(v164);
      (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v164, v166);
      (*(void (**)(uint64_t, void, uint64_t))(v168 + 104))(v167, enum case for FlowUnhandledReason.needsSiriXFallback(_:), v169);
      sub_3F240();
      (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v167, v169);
      uint64_t v1 = v303;
LABEL_76:
      uint64_t v22 = v301;
      goto LABEL_15;
    default:
      uint64_t v31 = v25;
      sub_11380((long long *)v29, v25);
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_405B0();
      sub_4A6C(v32, (uint64_t)qword_4E370);
      uint64_t v33 = sub_405A0();
      os_log_type_t v34 = sub_407F0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        v304[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136315138;
        v303[94] = sub_17898(0xD00000000000001BLL, 0x8000000000043B20, v304);
        sub_40860();
        _os_log_impl(&dword_0, v33, v34, "In %s - next flow action is publishOutput", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      int v36 = (void *)v303[97];
      uint64_t v37 = v36[12];
      uint64_t v38 = v36[13];
      sub_DBEC(v36 + 9, v37);
      uint64_t v39 = (void *)swift_task_alloc();
      v303[162] = (uint64_t)v39;
      *uint64_t v39 = v303;
      v39[1] = sub_2BE30;
      uint64_t v40 = v31;
      goto LABEL_60;
  }
}

uint64_t sub_2BE30()
{
  *(void *)(*(void *)v1 + 1304) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2CDF4;
  }
  else {
    uint64_t v2 = sub_2BF44;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2BF44()
{
  uint64_t v1 = v0[157];
  uint64_t v2 = v0[152];
  uint64_t v3 = v0[151];
  uint64_t v4 = v0[150];
  swift_storeEnumTagMultiPayload();
  sub_30578(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_3F1F0();
  sub_8CD8((uint64_t)(v0 + 12));
  sub_ACEC(v1, &qword_4D680);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2C1A0()
{
  *(void *)(*(void *)v1 + 1336) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2D008;
  }
  else {
    uint64_t v2 = sub_2C2B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2C2B4()
{
  uint64_t v51 = v0;
  uint64_t v1 = v0[164];
  if (v1)
  {
    uint64_t v2 = v0[118];
    uint64_t v3 = v0[117];
    uint64_t v4 = v0[116];
    v0[83] = v1;
    swift_errorRetain();
    sub_5044(&qword_4D658);
    int v5 = swift_dynamicCast();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, v5 ^ 1u, 1, v3);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v3) != 1)
    {
      uint64_t v6 = v0[120];
      uint64_t v7 = v0[119];
      sub_30514(v0[116], v6);
      sub_3158(v6, v7);
      if (swift_getEnumCaseMultiPayload() == 7)
      {
        uint64_t v8 = v0[115];
        uint64_t v9 = v0[114];
        uint64_t v10 = v0[112];
        uint64_t v11 = v0[111];
        (*(void (**)(uint64_t, void, uint64_t))(v10 + 32))(v8, v0[119], v11);
        uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
        v12(v9, v8, v11);
        uint64_t v13 = sub_405A0();
        os_log_type_t v14 = sub_407F0();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = v0[113];
          os_log_type_t v48 = v14;
          uint64_t v16 = v0[112];
          uint64_t v43 = v0[111];
          uint64_t v44 = v0[114];
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          uint64_t v50 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 136315138;
          v12(v15, v44, v43);
          uint64_t v18 = sub_406C0();
          v0[82] = sub_17898(v18, v19, &v50);
          sub_40860();
          swift_bridgeObjectRelease();
          uint64_t v20 = *(NSObject **)(v16 + 8);
          ((void (*)(uint64_t, uint64_t))v20)(v44, v43);
          _os_log_impl(&dword_0, v13, v48, "Session completed with actionError: %s", v17, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          uint64_t v20 = *(NSObject **)(v0[112] + 8);
          ((void (*)(void, void))v20)(v0[114], v0[111]);
        }

        os_log_t log = v20;
        uint64_t v49 = v0[157];
        uint64_t v36 = v0[152];
        uint64_t v37 = v0[151];
        uint64_t v38 = v0[150];
        uint64_t v39 = v0[120];
        uint64_t v45 = v0[111];
        uint64_t v46 = v0[115];
        sub_30AE4(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
        uint64_t v40 = swift_allocError();
        sub_3158(v39, v41);
        *(void *)uint64_t v36 = v40;
        *(unsigned char *)(v36 + 8) = 1;
        swift_storeEnumTagMultiPayload();
        sub_30578(v36);
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
        sub_3F220();
        swift_errorRelease();
        ((void (*)(uint64_t, uint64_t))log)(v46, v45);
        sub_31BC(v39);
        sub_8CD8((uint64_t)(v0 + 37));
        sub_ACEC((uint64_t)(v0 + 32), &qword_4D690);
        uint64_t v29 = v49;
LABEL_17:
        sub_ACEC(v29, &qword_4D680);
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v35 = (uint64_t (*)(void))v0[1];
        goto LABEL_18;
      }
      uint64_t v30 = v0[119];
      sub_31BC(v0[120]);
      sub_8CD8((uint64_t)(v0 + 37));
      sub_31BC(v30);
      goto LABEL_12;
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[118] + 56))(v0[116], 1, 1, v0[117]);
  }
  uint64_t v21 = v0[116];
  sub_8CD8((uint64_t)(v0 + 37));
  sub_ACEC(v21, &qword_4D648);
  if (!v0[164])
  {
    uint64_t v22 = v0[152];
    uint64_t v23 = v0[151];
    uint64_t v24 = v0[150];
    *(void *)uint64_t v22 = 0;
    *(unsigned char *)(v22 + 8) = 0;
    swift_storeEnumTagMultiPayload();
    sub_30578(v22);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    uint64_t v25 = sub_405A0();
    os_log_type_t v26 = sub_40800();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "Session completed without error and output. Exiting flow.", v27, 2u);
      swift_slowDealloc();
    }
    uint64_t v28 = v0[157];

    sub_3F220();
    sub_ACEC((uint64_t)(v0 + 32), &qword_4D690);
    uint64_t v29 = v28;
    goto LABEL_17;
  }
LABEL_12:
  swift_errorRetain();
  uint64_t v31 = sub_405A0();
  os_log_type_t v32 = sub_407F0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_0, v31, v32, "Session completed with error", v33, 2u);
    swift_slowDealloc();
  }
  uint64_t v34 = v0[157];

  swift_willThrow();
  swift_errorRelease();
  sub_ACEC((uint64_t)(v0 + 32), &qword_4D690);
  sub_ACEC(v34, &qword_4D680);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
LABEL_18:
  return v35();
}

uint64_t sub_2CBE8()
{
  swift_release();
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2CDF4()
{
  uint64_t v1 = *(void *)(v0 + 1256);
  sub_8CD8(v0 + 96);
  sub_ACEC(v1, &qword_4D680);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2D008()
{
  uint64_t v1 = *(void *)(v0 + 1256);
  swift_errorRelease();
  sub_8CD8(v0 + 296);
  sub_ACEC(v0 + 256, &qword_4D690);
  sub_ACEC(v1, &qword_4D680);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2D23C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for IFFlow.State();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v13 - v10;
  sub_31304(a1, a3, a4, *(unsigned __int8 *)(a2 + 208), (uint64_t *)((char *)&v13 - v10));
  sub_30578((uint64_t)v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_2D35C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_5044(&qword_4D720);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for IFFlow.State();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (uint64_t *)((char *)&v16 - v12);
  sub_3E840((uint64_t)v9);
  os_log_type_t v14 = (char *)sub_3F490();
  sub_18F9C(v9, a3, a4, v14, (uint64_t)&protocol witness table for SimpleConfirmationResponseProvider, v13);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_30578((uint64_t)v13);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_2D534(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for IFFlow.State();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (uint64_t *)((char *)&v13 - v9);
  uint64_t v11 = (char *)sub_3F490();
  sub_18F9C(a1, a3, a4, v11, (uint64_t)&protocol witness table for SimpleConfirmationResponseProvider, v10);
  sub_30578((uint64_t)v10);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2D664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for IFFlow.State();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - v9;
  sub_7BC0(a1, a3, a4, (uint64_t *)((char *)&v12 - v9));
  sub_30578((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2D780(char *a1, uint64_t a2, char *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for IFFlow.State();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - v9;
  sub_2D89C(*a1, a3, a4, (uint64_t)&v12 - v9);
  sub_30578((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_2D89C@<X0>(char a1@<W0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v64 = a3;
  uint64_t v71 = a2;
  uint64_t v77 = a4;
  LODWORD(v70) = a1 & 1;
  uint64_t v5 = *v4;
  unint64_t v75 = v4;
  uint64_t v76 = v5;
  uint64_t v56 = sub_3FDF0();
  uint64_t v55 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v54 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v7 - 8);
  unint64_t v74 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v9 - 8);
  uint64_t v69 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3FB70();
  uint64_t v65 = *(void *)(v11 - 8);
  uint64_t v66 = v11;
  __chkstk_darwin(v11);
  uint64_t v63 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_3FCA0();
  uint64_t v68 = *(void *)(v72 - 8);
  uint64_t v13 = __chkstk_darwin(v72);
  unint64_t v73 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v67 = (char *)&v54 - v15;
  uint64_t v16 = sub_5044(&qword_4D1D0);
  __chkstk_darwin(v16 - 8);
  uint64_t v62 = (uint64_t)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_3FAA0();
  uint64_t v59 = *(void *)(v18 - 8);
  uint64_t v60 = v18;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_40060();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_3EDB0();
  uint64_t v57 = v25;
  uint64_t v61 = *(void *)(v25 - 8);
  uint64_t v26 = v61;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v29 - 8);
  uint64_t v31 = (char *)&v54 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_40090();
  uint64_t v78 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)&v54 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  v58(v31, 1, 1, v25);
  sub_40000();
  sub_3EEF0();
  sub_40040();
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v24, enum case for SystemPromptResolution.UserAction.requirementAddressed(_:), v21);
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v20, v71, v60);
  uint64_t v35 = v77;
  uint64_t v36 = sub_40050();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v62, 1, 1, v36);
  sub_40070();
  uint64_t v62 = v35 + *(int *)(sub_5044(&qword_4D1E8) + 48);
  sub_40020();
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
  uint64_t v38 = v63;
  uint64_t v70 = v32;
  uint64_t v71 = v34;
  v37(v63, v34, v32);
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v38, enum case for MessagePayload.RequestContent.promptResolution(_:), v66);
  uint64_t v39 = sub_3FC40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v69, 1, 1, v39);
  uint64_t v40 = v57;
  v58(v31, 1, 1, v57);
  uint64_t v41 = v68;
  uint64_t v42 = sub_3FC50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v74, 1, 1, v42);
  uint64_t v43 = (uint64_t)v67;
  sub_3FC70();
  uint64_t v44 = v72;
  (*(void (**)(uint64_t, void, uint64_t))(v41 + 104))(v43, enum case for MessagePayload.request(_:), v72);
  sub_20CAC((uint64_t)v28, v43);
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v45(v43, v44);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v28, v40);
  uint64_t v46 = v73;
  sub_40010();
  if ((*(unsigned int (**)(char *, uint64_t))(v41 + 88))(v46, v44) == enum case for MessagePayload.systemResponse(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v46, v44);
    uint64_t v47 = v55;
    uint64_t v48 = (uint64_t)v54;
    uint64_t v49 = v56;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v54, v46, v56);
    uint64_t v50 = v62;
    sub_4140(v48, v62);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v48, v49);
    uint64_t v51 = sub_403E0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 0, 1, v51);
  }
  else
  {
    v45((uint64_t)v46, v44);
    uint64_t v52 = sub_403E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v62, 1, 1, v52);
  }
  (*(void (**)(char *, uint64_t))(v78 + 8))(v71, v70);
  type metadata accessor for IFFlow.State();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2E1FC()
{
  return sub_3EF40();
}

uint64_t sub_2E290(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_5044(&qword_4D4C0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3FFE0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v27 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v16, v2, a1);
  uint64_t v18 = 0x6C616974696E692ELL;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v20 = &v16[*(int *)(sub_5044(qword_4D590) + 48)];
      uint64_t v21 = sub_3FAA0();
      (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
      uint64_t v22 = sub_40030();
      (*(void (**)(char *, uint64_t))(*(void *)(v22 - 8) + 8))(v16, v22);
      uint64_t v18 = 0x6974706D6F72702ELL;
      break;
    case 2u:
      uint64_t v23 = *(void *)v16;
      uint64_t v29 = 0;
      unint64_t v30 = 0xE000000000000000;
      sub_408A0(21);
      v34._countAndFlagsBits = 0xD000000000000012;
      v34._object = (void *)0x8000000000043AE0;
      sub_40700(v34);
      uint64_t v27 = v23;
      sub_5044(&qword_4D658);
      sub_408E0();
      v35._countAndFlagsBits = 41;
      v35._object = (void *)0xE100000000000000;
      sub_40700(v35);
      swift_errorRelease();
      goto LABEL_6;
    case 3u:
      uint64_t v24 = *(void *)v16;
      char v25 = v16[8];
      uint64_t v29 = 0x74656C706D6F632ELL;
      unint64_t v30 = 0xEB00000000286465;
      uint64_t v27 = v24;
      char v28 = v25;
      sub_2F0CC(v24, v25);
      sub_5044(&qword_4D678);
      v36._countAndFlagsBits = sub_406C0();
      sub_40700(v36);
      swift_bridgeObjectRelease();
      v37._countAndFlagsBits = 41;
      v37._object = (void *)0xE100000000000000;
      sub_40700(v37);
      sub_2F2E8(v24, v25);
LABEL_6:
      uint64_t v18 = v29;
      break;
    case 4u:
      return v18;
    case 5u:
      uint64_t v18 = 0x6E6974696177612ELL;
      break;
    default:
      uint64_t v19 = (uint64_t)&v16[*(int *)(sub_5044(&qword_4D1E8) + 48)];
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v16, v7);
      sub_1397C(v19, (uint64_t)v6, &qword_4D4C0);
      uint64_t v29 = 0;
      unint64_t v30 = 0xE000000000000000;
      sub_408A0(28);
      v31._object = (void *)0x8000000000043B00;
      v31._countAndFlagsBits = 0xD000000000000011;
      sub_40700(v31);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v14, v7);
      v32._countAndFlagsBits = sub_406C0();
      sub_40700(v32);
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0x206D6F72662029;
      v33._object = (void *)0xE700000000000000;
      sub_40700(v33);
      sub_408E0();
      uint64_t v18 = v29;
      sub_ACEC((uint64_t)v6, &qword_4D4C0);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
      break;
  }
  return v18;
}

id *sub_2E7B0()
{
  uint64_t v1 = *v0;
  swift_release();
  sub_8CD8((uint64_t)(v0 + 4));
  sub_8CD8((uint64_t)(v0 + 9));
  sub_8CD8((uint64_t)(v0 + 14));

  swift_release();
  sub_8CD8((uint64_t)(v0 + 21));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, void))(*(void *)(v1[10] - 8) + 8))((char *)v0 + *((void *)*v0 + 23), v1[10]);
  uint64_t v2 = (char *)v0 + *((void *)*v0 + 24);
  swift_getAssociatedTypeWitness();
  uint64_t v3 = sub_40850();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  uint64_t v4 = (char *)v0 + *((void *)*v0 + 25);
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_40850();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)v0 + *((void *)*v0 + 26);
  uint64_t v7 = type metadata accessor for IFFlow.State();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  return v0;
}

uint64_t sub_2EA04()
{
  sub_2E7B0();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IFFlow()
{
  return sub_30BB0();
}

uint64_t type metadata accessor for IFFlow.State()
{
  return sub_30BB0();
}

unsigned char *initializeBufferWithCopyOfBuffer for ValueResolutionMode(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValueResolutionMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ValueResolutionMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2EBF4);
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

uint64_t sub_2EC1C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2EC24(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ValueResolutionMode()
{
  return &type metadata for ValueResolutionMode;
}

uint64_t sub_2EC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

void sub_2EC48()
{
  sub_3FFE0();
  if (v0 <= 0x3F)
  {
    sub_2FDC4();
    if (v1 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      unsigned int v6 = &v5;
      sub_40030();
      if (v2 <= 0x3F)
      {
        sub_3FAA0();
        if (v3 <= 0x3F)
        {
          swift_getTupleTypeLayout2();
          BOOL v7 = &v4;
          int v8 = "\t";
          uint64_t v9 = &unk_41528;
          swift_initEnumMetadataMultiPayload();
        }
      }
    }
  }
}

char *sub_2EDB0(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = sub_3FFE0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = *(int *)(sub_5044(&qword_4D1E8) + 48);
        uint64_t v9 = &a1[v8];
        uint64_t v10 = &a2[v8];
        uint64_t v11 = sub_403E0();
        uint64_t v12 = *(void *)(v11 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
        {
          uint64_t v13 = sub_5044(&qword_4D4C0);
          memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        uint64_t v16 = sub_40030();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        uint64_t v17 = *(int *)(sub_5044(qword_4D590) + 48);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        uint64_t v20 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v21 = *(void *)a2;
        swift_errorRetain();
        *(void *)a1 = v21;
        a1[8] = a2[8];
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v22 = *(void *)a2;
        char v23 = a2[8];
        sub_2F0CC(v22, v23);
        *(void *)a1 = v22;
        a1[8] = v23;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_2F0CC(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_2F0D8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_3FFE0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
      uint64_t v4 = a1 + *(int *)(sub_5044(&qword_4D1E8) + 48);
      uint64_t v5 = sub_403E0();
      uint64_t v14 = *(void *)(v5 - 8);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v4, 1, v5);
      if (!result)
      {
        uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
        uint64_t v11 = v4;
        uint64_t v10 = v5;
        goto LABEL_12;
      }
      break;
    case 1:
      uint64_t v6 = sub_40030();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
      uint64_t v7 = a1 + *(int *)(sub_5044(qword_4D590) + 48);
      uint64_t v8 = sub_3FAA0();
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      uint64_t v10 = v8;
      uint64_t v11 = v7;
LABEL_12:
      uint64_t result = v9(v11, v10);
      break;
    case 2:
      uint64_t result = swift_errorRelease();
      break;
    case 3:
      uint64_t v12 = *(void *)a1;
      char v13 = *(unsigned char *)(a1 + 8);
      uint64_t result = sub_2F2E8(v12, v13);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2F2E8(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

char *sub_2F2F4(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = sub_3FFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(sub_5044(&qword_4D1E8) + 48);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = sub_403E0();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_5044(&qword_4D4C0);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      goto LABEL_9;
    case 1u:
      uint64_t v13 = sub_40030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      uint64_t v14 = *(int *)(sub_5044(qword_4D590) + 48);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      uint64_t v17 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      goto LABEL_9;
    case 2u:
      uint64_t v18 = *(void *)a2;
      swift_errorRetain();
      *(void *)a1 = v18;
      a1[8] = a2[8];
      goto LABEL_9;
    case 3u:
      uint64_t v19 = *(void *)a2;
      char v20 = a2[8];
      sub_2F0CC(v19, v20);
      *(void *)a1 = v19;
      a1[8] = v20;
LABEL_9:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

char *sub_2F5C0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = sub_3FFE0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = *(int *)(sub_5044(&qword_4D1E8) + 48);
        uint64_t v8 = &a1[v7];
        uint64_t v9 = &a2[v7];
        uint64_t v10 = sub_403E0();
        uint64_t v11 = *(void *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
        {
          uint64_t v12 = sub_5044(&qword_4D4C0);
          memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
        }
        goto LABEL_10;
      case 1u:
        uint64_t v13 = sub_40030();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        uint64_t v14 = *(int *)(sub_5044(qword_4D590) + 48);
        uint64_t v15 = &a1[v14];
        uint64_t v16 = &a2[v14];
        uint64_t v17 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
        goto LABEL_10;
      case 2u:
        uint64_t v18 = *(void *)a2;
        swift_errorRetain();
        *(void *)a1 = v18;
        a1[8] = a2[8];
        goto LABEL_10;
      case 3u:
        uint64_t v19 = *(void *)a2;
        char v20 = a2[8];
        sub_2F0CC(v19, v20);
        *(void *)a1 = v19;
        a1[8] = v20;
LABEL_10:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v5 + 64));
        break;
    }
  }
  return a1;
}

char *sub_2F8E0(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v14 = sub_40030();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
    uint64_t v15 = *(int *)(sub_5044(qword_4D590) + 48);
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = sub_3FAA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_3FFE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = *(int *)(sub_5044(&qword_4D1E8) + 48);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_403E0();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_5044(&qword_4D4C0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *sub_2FB28(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, a3);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v14 = sub_40030();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
      uint64_t v15 = *(int *)(sub_5044(qword_4D590) + 48);
      uint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_3FFE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = *(int *)(sub_5044(&qword_4D1E8) + 48);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = sub_403E0();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = sub_5044(&qword_4D4C0);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(v5 + 64));
  }
  return a1;
}

void sub_2FDC4()
{
  if (!qword_4D618)
  {
    sub_403E0();
    unint64_t v0 = sub_40850();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_4D618);
    }
  }
}

unint64_t sub_2FE20()
{
  unint64_t result = qword_4D620[0];
  if (!qword_4D620[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_4D620);
  }
  return result;
}

uint64_t sub_2FE74()
{
  return sub_3F910();
}

uint64_t sub_2FE98()
{
  return sub_3F920();
}

void (*sub_2FEBC(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_3F900();
  return sub_2FF30;
}

void sub_2FF30(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_2FF78(uint64_t a1)
{
  return sub_22090(a1) & 1;
}

uint64_t sub_2FFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_30050;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_30050(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_3014C()
{
  return sub_2E1FC();
}

uint64_t sub_30170(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_7954;
  return sub_2432C(a1);
}

uint64_t sub_3020C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_210A0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

BOOL sub_30244(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_3025C()
{
  Swift::UInt v1 = *v0;
  sub_409D0();
  sub_409E0(v1);
  return sub_409F0();
}

void sub_302A4()
{
  sub_409E0(*v0);
}

Swift::Int sub_302D0()
{
  Swift::UInt v1 = *v0;
  sub_409D0();
  sub_409E0(v1);
  return sub_409F0();
}

uint64_t sub_30314()
{
  return swift_getWitnessTable();
}

uint64_t sub_30330()
{
  return swift_getWitnessTable();
}

uint64_t sub_3034C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3F8A0();
  *a1 = result;
  return result;
}

uint64_t sub_30378()
{
  return sub_3F8B0();
}

uint64_t sub_303A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20F88();
  *a1 = result;
  return result;
}

uint64_t sub_303D0(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_30408(uint64_t (*a1)(void))
{
  return a1();
}

void sub_30430(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_40860();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_304E8()
{
  return sub_40950();
}

uint64_t sub_30514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IFFlowError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_30578(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 208);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for IFFlow.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(v3, a1, v4);
  swift_endAccess();
  sub_21B44();
}

uint64_t sub_3064C(char *a1)
{
  uint64_t v3 = *(void *)(sub_3FAA0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_40030() - 8);
  uint64_t v7 = *(void *)(v1 + 32);
  uint64_t v8 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_2D780(a1, v7, (char *)(v1 + v4), v8);
}

uint64_t sub_30728(uint64_t a1)
{
  return sub_309B4(a1, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_2D664);
}

uint64_t sub_30744(uint64_t a1)
{
  return sub_309B4(a1, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_2D534);
}

uint64_t sub_30760(uint64_t a1)
{
  return sub_309B4(a1, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_2D35C);
}

uint64_t sub_30778@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3F8A0();
  *a1 = result;
  return result;
}

uint64_t sub_307A4()
{
  return sub_3F8B0();
}

uint64_t sub_307D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_404B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_307FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_8C90(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_30844()
{
  uint64_t v1 = sub_3FAA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_40030();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_3099C(uint64_t a1)
{
  return sub_309B4(a1, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t))sub_2D23C);
}

uint64_t sub_309B4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_3FAA0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(sub_40030() - 8);
  uint64_t v8 = *(void *)(v2 + 32);
  uint64_t v9 = v2 + ((v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a2(a1, v8, v2 + v5, v9);
}

uint64_t sub_30AA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20F88();
  *a1 = result;
  return result;
}

uint64_t sub_30ACC()
{
  return 16;
}

__n128 sub_30AD8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_30AE4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_30B2C()
{
  unint64_t result = qword_4D748;
  if (!qword_4D748)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4D748);
  }
  return result;
}

uint64_t sub_30B6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20FA4();
  *a1 = result;
  return result;
}

uint64_t sub_30B98()
{
  return 16;
}

__n128 sub_30BA4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_30BB0()
{
  return swift_getGenericMetadata();
}

uint64_t sub_30BE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_3FAC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_5044(&qword_4D758);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_40120();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_3FDE0();
  if (*(void *)(v13 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, v13 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_310A8((uint64_t)v8);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ActionFailure.Failure.actionCanceled(_:), v2);
    sub_3FAD0();
    uint64_t v14 = enum case for StatementOutcome.failure(_:);
    uint64_t v15 = sub_3FE50();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(a1, v14, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_40110();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_30ECC()
{
  uint64_t v0 = sub_5044(&qword_4D758);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3FDE0();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = sub_40120();
  uint64_t v6 = *(void *)(v5 - 8);
  if (v4)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v2, v3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v2, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v2, 1, 1, v5);
  }
  swift_bridgeObjectRelease();
  sub_40120();
  uint64_t v7 = v6;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v2, 1, v5) == 1)
  {
    sub_310A8((uint64_t)v2);
    return 0;
  }
  else
  {
    uint64_t v8 = sub_40100();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v5);
  }
  return v8;
}

uint64_t sub_310A8(uint64_t a1)
{
  uint64_t v2 = sub_5044(&qword_4D758);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_31108()
{
  uint64_t v0 = sub_5044(&qword_4D758);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_40120();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3FDE0();
  if (*(void *)(v7 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v2, v7 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_310A8((uint64_t)v2);
    return sub_3FA90();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    sub_400F0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_31304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  LODWORD(v124) = a4;
  uint64_t v134 = a3;
  uint64_t v120 = a2;
  uint64_t v139 = *v5;
  uint64_t v140 = a5;
  uint64_t v123 = sub_3FDF0();
  uint64_t v122 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  unint64_t v121 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3FCA0();
  uint64_t v131 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  os_log_type_t v132 = (char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v106 - v11;
  uint64_t v13 = sub_5044(&qword_4D1D0);
  __chkstk_darwin(v13 - 8);
  unint64_t v117 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_3FAA0();
  uint64_t v112 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  uint64_t v115 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_40060();
  uint64_t v110 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  uint64_t v114 = (char *)&v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_3EDB0();
  uint64_t v138 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v18 = (char *)&v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_40090();
  uint64_t v118 = *(void *)(v119 - 8);
  __chkstk_darwin(v119);
  uint64_t v116 = (char *)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_40660();
  uint64_t v20 = *(void *)(v125 - 8);
  __chkstk_darwin(v125);
  uint64_t v22 = (uint64_t *)((char *)&v106 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = sub_5044(&qword_4D0C0);
  __chkstk_darwin(v23 - 8);
  uint64_t v130 = (char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v25 - 8);
  uint64_t v133 = (char *)&v106 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_5044(&qword_4D0D0);
  __chkstk_darwin(v27 - 8);
  os_log_type_t v129 = (char *)&v106 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_3FB70();
  uint64_t v126 = *(void *)(v29 - 8);
  uint64_t v127 = v29;
  __chkstk_darwin(v29);
  os_log_type_t v128 = (char *)&v106 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_3FC80();
  uint64_t v136 = *(void *)(v31 - 8);
  uint64_t v137 = v31;
  __chkstk_darwin(v31);
  os_log_type_t v135 = (char *)&v106 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_5044(&qword_4D840);
  uint64_t v34 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  Swift::String v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v106 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void *, uint64_t, uint64_t))(v34 + 16))(v36, a1, v33);
  int v37 = (*(uint64_t (**)(void *, uint64_t))(v34 + 88))(v36, v33);
  if (v37 == enum case for PromptResult.answered<A>(_:))
  {
    (*(void (**)(void *, uint64_t))(v34 + 96))(v36, v33);
    uint64_t v39 = *v36;
    uint64_t v38 = v36[1];
    uint64_t v109 = v12;
    uint64_t v108 = v18;
    if (v124)
    {
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v124 = v8;
      uint64_t v55 = sub_405B0();
      sub_4A6C(v55, (uint64_t)qword_4E370);
      uint64_t v56 = sub_405A0();
      os_log_type_t v57 = sub_407F0();
      BOOL v58 = os_log_type_enabled(v56, v57);
      uint64_t v59 = v138;
      if (v58)
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v60 = 0;
        _os_log_impl(&dword_0, v56, v57, "IFFlow.valueResolutionMode == .stringValue; passing prompt response to IF as a resolved parameter value",
          v60,
          2u);
        swift_slowDealloc();
      }

      uint64_t v61 = sub_40650();
      uint64_t v62 = swift_allocBox();
      *uint64_t v63 = v39;
      v63[1] = v38;
      (*(void (**)(void *, void, uint64_t))(*(void *)(v61 - 8) + 104))(v63, enum case for TypedValue.PrimitiveValue.string(_:), v61);
      *uint64_t v22 = v62;
      uint64_t v64 = *(void (**)(uint64_t *, void, uint64_t))(v20 + 104);
      uint64_t v107 = v22;
      uint64_t v65 = v125;
      v64(v22, enum case for TypedValue.primitive(_:), v125);
      os_log_type_t v106 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56);
      v106(v133, 1, 1, v141);
      uint64_t v52 = (uint64_t)v108;
      sub_40000();
      uint64_t v66 = v114;
      (*(void (**)(char *, uint64_t *, uint64_t))(v20 + 16))(v114, v22, v65);
      (*(void (**)(char *, void, uint64_t))(v110 + 104))(v66, enum case for SystemPromptResolution.UserAction.parameterValueSelected(_:), v111);
      (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v115, v120, v113);
      uint64_t v67 = enum case for SystemPromptResolution.ResolutionInput.touch(_:);
      uint64_t v68 = sub_40050();
      uint64_t v69 = *(void *)(v68 - 8);
      uint64_t v70 = v117;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 104))(v117, v67, v68);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v69 + 56))(v70, 0, 1, v68);
      uint64_t v71 = v116;
      uint64_t v72 = v133;
      sub_40070();
      uint64_t v73 = v118;
      unint64_t v74 = v128;
      uint64_t v75 = v119;
      (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v128, v71, v119);
      (*(void (**)(char *, void, uint64_t))(v126 + 104))(v74, enum case for MessagePayload.RequestContent.promptResolution(_:), v127);
      uint64_t v76 = sub_3FC40();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v129, 1, 1, v76);
      v106(v72, 1, 1, v141);
      uint64_t v77 = sub_3FC50();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v130, 1, 1, v77);
      uint64_t v51 = v135;
      sub_3FC70();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v71, v75);
      (*(void (**)(uint64_t *, uint64_t))(v20 + 8))(v107, v125);
      uint64_t v50 = v140;
      uint64_t v8 = v124;
      uint64_t v40 = v132;
    }
    else
    {
      uint64_t v40 = v132;
      uint64_t v41 = v141;
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_405B0();
      sub_4A6C(v42, (uint64_t)qword_4E370);
      uint64_t v43 = sub_405A0();
      os_log_type_t v44 = sub_407F0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl(&dword_0, v43, v44, "IFFlow.valueResolutionMode == .passthrough; passing prompt response back to planner unresolved",
          v45,
          2u);
        swift_slowDealloc();
      }

      swift_bridgeObjectRetain();
      uint64_t v46 = v128;
      sub_3FB60();
      (*(void (**)(char *, void, uint64_t))(v126 + 104))(v46, enum case for MessagePayload.RequestContent.text(_:), v127);
      uint64_t v47 = sub_3FC40();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v129, 1, 1, v47);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 56))(v133, 1, 1, v41);
      uint64_t v48 = sub_3FC50();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v130, 1, 1, v48);
      uint64_t v49 = v135;
      sub_3FC70();
      swift_bridgeObjectRelease();
      uint64_t v50 = v140;
      uint64_t v51 = v49;
      uint64_t v52 = (uint64_t)v108;
    }
    uint64_t v140 = (uint64_t *)((char *)v50 + *(int *)(sub_5044(&qword_4D1E8) + 48));
    sub_40020();
    uint64_t v78 = (uint64_t)v109;
    (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v109, v51, v137);
    uint64_t v79 = v131;
    (*(void (**)(uint64_t, void, uint64_t))(v131 + 104))(v78, enum case for MessagePayload.request(_:), v8);
    sub_20CAC(v52, v78);
    uint64_t v80 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
    v80(v78, v8);
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v52, v141);
    sub_40010();
    if ((*(unsigned int (**)(char *, uint64_t))(v79 + 88))(v40, v8) == enum case for MessagePayload.systemResponse(_:))
    {
      (*(void (**)(char *, uint64_t))(v79 + 96))(v40, v8);
      uint64_t v81 = v122;
      uint64_t v82 = (uint64_t)v121;
      uint64_t v83 = v123;
      (*(void (**)(char *, char *, uint64_t))(v122 + 32))(v121, v40, v123);
      os_log_type_t v84 = v140;
      sub_4140(v82, (uint64_t)v140);
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v82, v83);
      uint64_t v85 = sub_403E0();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v85 - 8) + 56))(v84, 0, 1, v85);
    }
    else
    {
      v80((uint64_t)v40, v8);
      uint64_t v91 = sub_403E0();
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v140, 1, 1, v91);
    }
    (*(void (**)(char *, uint64_t))(v136 + 8))(v135, v137);
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  if (v37 == enum case for PromptResult.error<A>(_:))
  {
    (*(void (**)(void *, uint64_t))(v34 + 96))(v36, v33);
    char v53 = *((unsigned char *)v36 + 8);
    uint64_t v54 = v140;
    *uint64_t v140 = *v36;
    *((unsigned char *)v54 + 8) = (v53 & 1) == 0;
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  if (v37 == enum case for PromptResult.cancelled<A>(_:))
  {
    uint64_t v86 = v140;
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v87 = sub_405B0();
    sub_4A6C(v87, (uint64_t)qword_4E370);
    uint64_t v88 = sub_405A0();
    os_log_type_t v89 = sub_407F0();
    if (os_log_type_enabled(v88, v89))
    {
      uint64_t v90 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v90 = 0;
      _os_log_impl(&dword_0, v88, v89, "Exiting IFFlow, received userCancelled", v90, 2u);
      swift_slowDealloc();
    }

    uint64_t *v86 = 0;
    *((unsigned char *)v86 + 8) = 0;
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  if (v37 == enum case for PromptResult.unanswered<A>(_:))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_405B0();
    sub_4A6C(v92, (uint64_t)qword_4E370);
    uint64_t v93 = sub_405A0();
    os_log_type_t v94 = sub_407F0();
    BOOL v95 = os_log_type_enabled(v93, v94);
    uint64_t v96 = v140;
    if (v95)
    {
      uint64_t v97 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v97 = 0;
      _os_log_impl(&dword_0, v93, v94, "Exiting IFFlow, received .unaswered from PromptForValueFlow", v97, 2u);
      swift_slowDealloc();
    }

    type metadata accessor for IFFlowError();
    sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    uint64_t v98 = swift_allocError();
    *uint64_t v99 = 0;
    swift_storeEnumTagMultiPayload();
    *uint64_t v96 = v98;
    *((unsigned char *)v96 + 8) = 1;
    type metadata accessor for IFFlow.State();
    return swift_storeEnumTagMultiPayload();
  }
  type metadata accessor for IFFlowError();
  sub_6B64(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
  uint64_t v101 = swift_allocError();
  uint64_t v103 = v102;
  unint64_t v142 = 0;
  unint64_t v143 = 0xE000000000000000;
  sub_408A0(35);
  swift_bridgeObjectRelease();
  unint64_t v142 = 0xD000000000000021;
  unint64_t v143 = 0x80000000000433E0;
  sub_33830();
  v144._countAndFlagsBits = sub_40950();
  sub_40700(v144);
  swift_bridgeObjectRelease();
  unint64_t v104 = v143;
  *uint64_t v103 = v142;
  v103[1] = v104;
  swift_storeEnumTagMultiPayload();
  uint64_t v105 = v140;
  *uint64_t v140 = v101;
  *((unsigned char *)v105 + 8) = 1;
  type metadata accessor for IFFlow.State();
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(void *, uint64_t))(v34 + 8))(v36, v33);
}

uint64_t sub_32698()
{
  sub_5044(&qword_4D700);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_3F8E0();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_32734(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_3F4D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *(unsigned __int8 *)(v2 + 56);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if (v8 == 1)
  {
    char v9 = sub_141F8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v9) {
      return sub_3F1A0();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_32944();
  if (v11)
  {
    swift_bridgeObjectRelease();
    return sub_3F1B0();
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_405B0();
    sub_4A6C(v12, (uint64_t)qword_4E370);
    uint64_t v13 = sub_405A0();
    os_log_type_t v14 = sub_407F0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "IFFlow not accepting input. No supported utterance found.", v15, 2u);
      swift_slowDealloc();
    }

    return sub_3F1C0();
  }
}

uint64_t sub_32944()
{
  uint64_t v0 = sub_405B0();
  uint64_t v32 = *(void *)(v0 - 8);
  uint64_t v33 = v0;
  __chkstk_darwin(v0);
  uint64_t v35 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_3F160();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_3F190();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3F520();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3F4B0();
  if ((*(unsigned int (**)(char *, uint64_t))(v11 + 88))(v13, v10) == enum case for Parse.nlRouter(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    sub_3F180();
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v3 + 88))(v5, v2) == enum case for NLRouterParse.InputCandidate.text(_:))
    {
      (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
      uint64_t v14 = *v5;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v14 = 0;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    uint64_t v31 = v10;
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v15 = v33;
    uint64_t v16 = sub_4A6C(v33, (uint64_t)qword_4E370);
    uint64_t v17 = v32;
    uint64_t v18 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v35, v16, v15);
    uint64_t v19 = v34;
    swift_retain_n();
    uint64_t v20 = sub_405A0();
    os_log_type_t v21 = sub_40800();
    int v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      int v30 = v22;
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = v23;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v37 = v29;
      *(_DWORD *)uint64_t v23 = 136315138;
      sub_5044(&qword_4D700);
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v36 = v19;
      swift_retain();
      sub_3F8E0();
      swift_release();
      swift_release();
      swift_release();
      if (v39) {
        uint64_t v24 = v38;
      }
      else {
        uint64_t v24 = 7104878;
      }
      if (v39) {
        unint64_t v25 = v39;
      }
      else {
        unint64_t v25 = 0xE300000000000000;
      }
      uint64_t v26 = v28;
      uint64_t v38 = sub_17898(v24, v25, &v37);
      sub_40860();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v20, (os_log_type_t)v30, "IFFlow value prompt received direct SiriX input instead of NLRouterParse. Using observed utterance from environment (%s)", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v17 + 8))(v35, v15);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v18, v15);
    }
    sub_5044(&qword_4D700);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v37 = v19;
    swift_retain();
    sub_3F8E0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v14 = v38;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v31);
  }
  return v14;
}

uint64_t sub_32F48(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_3F4D0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return _swift_task_switch(sub_33008, 0, 0);
}

uint64_t sub_33008()
{
  os_log_type_t v21 = v0;
  uint64_t v1 = sub_32944();
  uint64_t v3 = v2;
  if (!v2)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v5 = v0[6];
    uint64_t v4 = v0[7];
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[3];
    uint64_t v8 = sub_405B0();
    sub_4A6C(v8, (uint64_t)qword_4E370);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
    char v9 = sub_405A0();
    os_log_type_t v10 = sub_40800();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v13 = v0[6];
    uint64_t v12 = v0[7];
    uint64_t v14 = v0[5];
    if (v11)
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      sub_6B64(&qword_4D0E8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v16 = sub_40950();
      v0[2] = sub_17898(v16, v17, &v20);
      sub_40860();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
      _os_log_impl(&dword_0, v9, v10, "Unexpectedly found nil criticalInfoValueResponse in %s (why didn't actionForInput ignore?)", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v13 + 8))(v0[7], v0[5]);
    }
  }
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v18(v1, v3);
}

uint64_t sub_332A4()
{
  sub_8CD8(v0 + 16);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CriticalInfoPromptStrategy()
{
  return self;
}

uint64_t sub_3330C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_333A4;
  return sub_32F48(a2);
}

uint64_t sub_333A4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (!v2)
  {
    uint64_t v8 = *(void **)(v6 + 16);
    *uint64_t v8 = a1;
    v8[1] = a2;
  }
  char v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_334C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_8D28;
  return PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse()(a1, v7, a3);
}

uint64_t sub_33598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_8D28;
  return PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence()(a1, v7, a3);
}

uint64_t sub_33670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_7954;
  return PromptForValueFlowStrategyAsync.makeFlowCancelledResponse()(a1, v7, a3);
}

uint64_t sub_33748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_8D28;
  return PromptForValueFlowStrategyAsync.makeErrorResponse(_:)(a1, a2, v9, a4);
}

unint64_t sub_33830()
{
  unint64_t result = qword_4D848;
  if (!qword_4D848)
  {
    sub_8C90(&qword_4D840);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_4D848);
  }
  return result;
}

double sub_3388C@<D0>(_OWORD *a1@<X8>)
{
  sub_5044(&qword_4D700);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_3F8E0();
  swift_release();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_3393C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || (v9 = v8, (uint64_t v13 = sub_404F0()) == 0))
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_405B0();
    sub_4A6C(v23, (uint64_t)qword_4E370);
    uint64_t v42 = sub_405A0();
    os_log_type_t v24 = sub_40800();
    if (os_log_type_enabled(v42, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)unint64_t v25 = 136315138;
      sub_17898(0xD00000000000004BLL, 0x8000000000043D80, &v43);
      sub_40860();
      _os_log_impl(&dword_0, v42, v24, "The plannerTraceId is nil or not a valid UUID, stopping %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    goto LABEL_39;
  }
  uint64_t v42 = v13;
  if (!a6)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_405B0();
    sub_4A6C(v26, (uint64_t)qword_4E370);
    uint64_t v15 = sub_405A0();
    os_log_type_t v27 = sub_40800();
    if (!os_log_type_enabled(v15, v27)) {
      goto LABEL_38;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315138;
    sub_17898(0xD00000000000004BLL, 0x8000000000043D80, &v43);
    sub_40860();
    uint64_t v29 = "Could not build wrapper for %s because rootRequest is nil";
    goto LABEL_26;
  }
  uint64_t v14 = sub_404E0();
  if (!v14)
  {
LABEL_22:
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_405B0();
    sub_4A6C(v30, (uint64_t)qword_4E370);
    uint64_t v15 = sub_405A0();
    os_log_type_t v27 = sub_40800();
    if (!os_log_type_enabled(v15, v27)) {
      goto LABEL_38;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315138;
    sub_17898(0xD00000000000004BLL, 0x8000000000043D80, &v43);
    sub_40860();
    uint64_t v29 = "Could not build wrapper or eventMetadata when logging %s";
LABEL_26:
    _os_log_impl(&dword_0, v15, v27, v29, v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return;
  }
  uint64_t v15 = v14;
  id v16 = [v14 eventMetadata];

  if (!v16)
  {

    goto LABEL_22;
  }
  if (!a4)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_405B0();
    sub_4A6C(v31, (uint64_t)qword_4E370);
    uint64_t v32 = sub_405A0();
    os_log_type_t v33 = sub_40800();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      sub_17898(0xD00000000000004BLL, 0x8000000000043D80, &v43);
      sub_40860();
      uint64_t v35 = "The requestId is nil, stopping %s";
LABEL_35:
      _os_log_impl(&dword_0, v32, v33, v35, v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_36:
      return;
    }
    goto LABEL_37;
  }
  uint64_t v17 = sub_404F0();
  if (!v17)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_405B0();
    sub_4A6C(v36, (uint64_t)qword_4E370);
    uint64_t v32 = sub_405A0();
    os_log_type_t v33 = sub_40800();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      sub_17898(0xD00000000000004BLL, 0x8000000000043D80, &v43);
      sub_40860();
      uint64_t v35 = "The requestId is not a valid UUID, stop %s";
      goto LABEL_35;
    }
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  uint64_t v18 = (void *)v17;
  id v19 = [objc_allocWithZone((Class)ORCHSchemaORCHIntelligenceFlowQuerySent) init];
  if (v19)
  {
    id v40 = v19;
    if (a8)
    {
      uint64_t v20 = sub_404F0();
      if (v20)
      {
        os_log_type_t v21 = (void *)v20;
        [v40 setTrpId:v20];
      }
    }
    objc_msgSend(v40, "setTraceId:", v42, v40);
    [v41 setSubRequestId:v18];
    [v15 setIntelligenceFlowQuerySent:v41];
    [*(id *)(v9 + 16) emitMessage:v15];

    uint64_t v22 = v41;
    goto LABEL_40;
  }
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_405B0();
  sub_4A6C(v37, (uint64_t)qword_4E370);
  uint64_t v32 = sub_405A0();
  os_log_type_t v38 = sub_40800();
  if (os_log_type_enabled(v32, v38))
  {
    unint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)unint64_t v39 = 136315138;
    sub_17898(0xD00000000000004BLL, 0x8000000000043D80, &v43);
    sub_40860();
    _os_log_impl(&dword_0, v32, v38, "Could not build schema event for %s", v39, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_36;
  }

LABEL_39:
  uint64_t v22 = v42;
LABEL_40:
}

void sub_34210(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!a4)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_405B0();
    sub_4A6C(v10, (uint64_t)qword_4E370);
    osos_log_t log = sub_405A0();
    os_log_type_t v11 = sub_40800();
    if (!os_log_type_enabled(oslog, v11)) {
      goto LABEL_14;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_17898(0xD000000000000031, 0x8000000000043D40, &v20);
    sub_40860();
    uint64_t v13 = "The plannerTraceId nil, stopping %s";
    goto LABEL_13;
  }
  if (!a2)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_405B0();
    sub_4A6C(v14, (uint64_t)qword_4E370);
    osos_log_t log = sub_405A0();
    os_log_type_t v11 = sub_40800();
    if (!os_log_type_enabled(oslog, v11)) {
      goto LABEL_14;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_17898(0xD000000000000031, 0x8000000000043D40, &v20);
    sub_40860();
    uint64_t v13 = "The requestId nil, stopping %s";
LABEL_13:
    _os_log_impl(&dword_0, oslog, v11, v13, v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_404D0();
  if (v9)
  {
    osos_log_t log = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    [*(id *)(v4 + 16) emitMessage:oslog];
LABEL_14:

    return;
  }
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_405B0();
  sub_4A6C(v15, (uint64_t)qword_4E370);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v16 = sub_405A0();
  os_log_type_t v17 = sub_40800();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain();
    sub_17898(a1, a2, &v20);
    sub_40860();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_17898(a3, a4, &v20);
    sub_40860();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v16, v17, "Unable to logSubRequestTraceLink for subRequestId=%s and plannerTraceId=%s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void sub_346F8(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_405B0();
    sub_4A6C(v10, (uint64_t)qword_4E370);
    uint64_t v22 = sub_405A0();
    os_log_type_t v11 = sub_40800();
    if (os_log_type_enabled(v22, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      sub_17898(0xD00000000000002ALL, 0x8000000000043D10, &v23);
      sub_40860();
      _os_log_impl(&dword_0, v22, v11, "Could not build wrapper for %s because rootRequest is nil", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    goto LABEL_17;
  }
  long long v3 = sub_404E0();
  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v22 = v3;
  uint64_t v4 = [v3 eventMetadata];
  if (!v4)
  {

LABEL_13:
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_405B0();
    sub_4A6C(v13, (uint64_t)qword_4E370);
    uint64_t v22 = sub_405A0();
    os_log_type_t v14 = sub_40800();
    if (os_log_type_enabled(v22, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v22, v14, "Could not build wrapper or eventMetadata when logging logIFRequestFailed", v15, 2u);
      swift_slowDealloc();
    }
    goto LABEL_17;
  }
  os_log_type_t v21 = v4;
  id v5 = [objc_allocWithZone((Class)ORCHSchemaORCHRequestFailed) init];
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 setErrorDomain:15];
    [v6 setOrchErrorCode:sub_2FB0()];
    uint64_t v7 = [objc_allocWithZone((Class)ORCHSchemaORCHRequestContext) init];
    uint64_t v8 = v7;
    uint64_t v20 = v7;
    if (v7)
    {
      [v7 setFailed:v6];
      uint64_t v8 = v20;
    }
    [v22 setRequestContext:v8];
    [*(id *)(v2 + 16) emitMessage:v22];

    uint64_t v9 = v20;
    goto LABEL_18;
  }
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_405B0();
  sub_4A6C(v16, (uint64_t)qword_4E370);
  os_log_type_t v17 = sub_405A0();
  os_log_type_t v18 = sub_40800();
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "Could not build schema event for logIFRequestFailed", v19, 2u);
    swift_slowDealloc();

    uint64_t v9 = v21;
    goto LABEL_18;
  }

LABEL_17:
  uint64_t v9 = v22;
LABEL_18:
}

void sub_34B28(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_5044(&qword_4D0C8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3EDB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3ED70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_35BC8((uint64_t)v10);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_405B0();
    sub_4A6C(v15, (uint64_t)qword_4E370);
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_405A0();
    os_log_type_t v17 = sub_40800();
    if (os_log_type_enabled(v16, v17))
    {
      os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_17898(a2, a3, aBlock);
      sub_40860();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v16, v17, "Unable to apply log redaction due to invalid requestId %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_405B0();
    sub_4A6C(v19, (uint64_t)qword_4E370);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_405A0();
    os_log_type_t v21 = sub_407F0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v33 = a2;
      uint64_t v23 = v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v34 = v24;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v36 = v4;
      aBlock[0] = v24;
      uint64_t v25 = sub_40820();
      uint64_t v38 = sub_17898(v25, v26, aBlock);
      unsigned int v35 = a1;
      sub_40860();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_17898(v33, a3, aBlock);
      a1 = v35;
      uint64_t v4 = v36;
      sub_40860();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v20, v21, "Apply redaction tag with sensitive state %s for requestId %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v27 = objc_allocWithZone((Class)SiriAnalyticsTag);
    Class isa = sub_3ED90().super.isa;
    id v29 = [v27 initWithConditionType:a1 requestId:isa joined:1];

    uint64_t v30 = *(void **)(v4 + 32);
    aBlock[4] = (uint64_t)nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_3509C;
    aBlock[3] = (uint64_t)&unk_4A480;
    uint64_t v31 = _Block_copy(aBlock);
    [v30 createTag:v29 completion:v31];
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

void sub_3509C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_35114(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v83 = a3;
  uint64_t v82 = a2;
  uint64_t v4 = sub_403E0();
  uint64_t v85 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v76 - v8;
  uint64_t v10 = sub_3FCA0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3FDF0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v79 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v78 = (char *)&v76 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v80 = (char *)&v76 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v76 - v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  if ((*(unsigned int (**)(char *, uint64_t))(v11 + 88))(v13, v10) != enum case for MessagePayload.systemResponse(_:)) {
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
  uint64_t v24 = v15;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v23, v13, v14);
  uint64_t v81 = v23;
  sub_4140((uint64_t)v23, (uint64_t)v9);
  uint64_t v25 = v85;
  (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v7, v9, v4);
  int v26 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v7, v4);
  id v27 = v9;
  unint64_t v28 = v14;
  if (v26 == enum case for RequestSummary.ExecutionSource.genAI(_:))
  {
    id v29 = *(void (**)(char *, uint64_t))(v25 + 96);
    uint64_t v78 = v7;
    uint64_t v79 = (char *)v4;
    v29(v7, v4);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_405B0();
    sub_4A6C(v30, (uint64_t)qword_4E370);
    uint64_t v31 = v24;
    uint64_t v33 = v80;
    uint64_t v32 = v81;
    (*(void (**)(char *, char *, unint64_t))(v24 + 16))(v80, v81, v28);
    uint64_t v34 = sub_405A0();
    os_log_type_t v35 = sub_407F0();
    unint64_t v36 = v28;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v77 = v27;
      uint64_t v38 = (uint8_t *)v37;
      uint64_t v76 = swift_slowAlloc();
      uint64_t v87 = v76;
      *(_DWORD *)uint64_t v38 = 136315138;
      unint64_t v39 = sub_30ECC();
      if (v40)
      {
        unint64_t v41 = v40;
      }
      else
      {
        unint64_t v39 = 0xD000000000000012;
        unint64_t v41 = 0x8000000000043410;
      }
      uint64_t v86 = sub_17898(v39, v41, &v87);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v42 = *(void (**)(char *, unint64_t))(v31 + 8);
      v42(v33, v36);
      _os_log_impl(&dword_0, v34, v35, "Attempting to apply redaction tag for inferred toolId = %s which is a Montara use-case", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v27 = v77;
      uint64_t v32 = v81;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v42 = *(void (**)(char *, unint64_t))(v31 + 8);
      v42(v33, v36);
    }

    sub_34B28(9, v82, v83);
    (*(void (**)(char *, char *))(v25 + 8))(v27, v79);
    v42(v32, v36);
    uint64_t v57 = sub_403F0();
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v57 - 8) + 8))(v78, v57);
  }
  else
  {
    uint64_t v77 = v9;
    if (v26 == enum case for RequestSummary.ExecutionSource.searchTool(_:))
    {
      os_log_type_t v44 = v81;
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_405B0();
      sub_4A6C(v45, (uint64_t)qword_4E370);
      uint64_t v46 = v24;
      uint64_t v47 = v78;
      (*(void (**)(char *, char *, unint64_t))(v24 + 16))(v78, v44, v28);
      uint64_t v48 = sub_405A0();
      os_log_type_t v49 = sub_407F0();
      if (os_log_type_enabled(v48, v49))
      {
        unint64_t v50 = v28;
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        uint64_t v79 = (char *)v4;
        uint64_t v87 = v52;
        *(_DWORD *)uint64_t v51 = 136315138;
        unint64_t v53 = sub_30ECC();
        if (v54)
        {
          unint64_t v55 = v54;
        }
        else
        {
          unint64_t v53 = 0xD000000000000012;
          unint64_t v55 = 0x8000000000043410;
        }
        uint64_t v86 = sub_17898(v53, v55, &v87);
        sub_40860();
        swift_bridgeObjectRelease();
        uint64_t v56 = *(void (**)(char *, unint64_t))(v46 + 8);
        v56(v47, v50);
        _os_log_impl(&dword_0, v48, v49, "Attempting to apply redaction tag for inferred toolId = %s which is a PQA use-case", v51, 0xCu);
        swift_arrayDestroy();
        uint64_t v4 = (uint64_t)v79;
        uint64_t v25 = v85;
        swift_slowDealloc();
        unint64_t v28 = v50;
        os_log_type_t v44 = v81;
        swift_slowDealloc();
      }
      else
      {
        uint64_t v56 = *(void (**)(char *, unint64_t))(v46 + 8);
        v56(v47, v28);
      }

      sub_34B28(10, v82, v83);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v77, v4);
      return ((uint64_t (*)(char *, unint64_t))v56)(v44, v28);
    }
    else
    {
      uint64_t v78 = v7;
      BOOL v58 = v81;
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v59 = sub_405B0();
      sub_4A6C(v59, (uint64_t)qword_4E370);
      uint64_t v60 = v24;
      uint64_t v61 = *(void (**)(char *, char *, unint64_t))(v24 + 16);
      uint64_t v62 = v79;
      v61(v79, v58, v28);
      uint64_t v63 = sub_405A0();
      os_log_type_t v64 = sub_407F0();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v65 = swift_slowAlloc();
        unint64_t v83 = v28;
        uint64_t v66 = (uint8_t *)v65;
        uint64_t v84 = swift_slowAlloc();
        uint64_t v87 = v84;
        *(_DWORD *)uint64_t v66 = 136315138;
        unint64_t v67 = sub_30ECC();
        if (v68)
        {
          unint64_t v69 = v68;
        }
        else
        {
          unint64_t v67 = 0xD000000000000012;
          unint64_t v69 = 0x8000000000043410;
        }
        uint64_t v70 = v62;
        uint64_t v86 = sub_17898(v67, v69, &v87);
        sub_40860();
        swift_bridgeObjectRelease();
        uint64_t v71 = *(void (**)(char *, unint64_t))(v60 + 8);
        unint64_t v72 = v83;
        v71(v70, v83);
        _os_log_impl(&dword_0, v63, v64, "Not attempting to apply redaction tag for inferred toolId = %s", v66, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v73 = *(void (**)(char *, uint64_t))(v25 + 8);
        v73(v77, v4);
        unint64_t v74 = v81;
        unint64_t v75 = v72;
      }
      else
      {

        uint64_t v71 = *(void (**)(char *, unint64_t))(v60 + 8);
        v71(v62, v28);
        uint64_t v73 = *(void (**)(char *, uint64_t))(v25 + 8);
        v73(v77, v4);
        unint64_t v74 = v58;
        unint64_t v75 = v28;
      }
      v71(v74, v75);
      return ((uint64_t (*)(char *, uint64_t))v73)(v78, v4);
    }
  }
}

uint64_t sub_35B5C()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IFFlowInstrumentationUtil()
{
  return self;
}

uint64_t sub_35BC8(uint64_t a1)
{
  uint64_t v2 = sub_5044(&qword_4D0C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_35C28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_35C38()
{
  return swift_release();
}

void *sub_35C40(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = v10;
  v10[27] = 0;
  v10[28] = 0;
  char v17 = a2 & 1;
  swift_getKeyPath();
  sub_5044(&qword_4D740);
  swift_allocObject();
  v10[29] = sub_3F8F0();
  swift_getKeyPath();
  sub_5044(&qword_4D750);
  swift_allocObject();
  v10[30] = sub_3F8F0();
  v10[32] = 0;
  uint64_t v18 = (char *)v11 + *(void *)(*v11 + 200);
  uint64_t v19 = sub_5044(&qword_4DA10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  sub_5044(&qword_4DA18);
  swift_storeEnumTagMultiPayload();
  v11[31] = a1;
  *((unsigned char *)v11 + 208) = v17;
  sub_7B5C(a3, (uint64_t)(v11 + 4));
  sub_7B5C(a4, (uint64_t)(v11 + 9));
  sub_7B5C(a5, (uint64_t)(v11 + 14));
  v11[19] = a7;
  v11[20] = a6;
  v11[2] = a8;
  v11[3] = a9;
  sub_7B5C(a10, (uint64_t)(v11 + 21));
  swift_allocObject();
  swift_weakInit();
  sub_40560();
  sub_3757C(&qword_4DA30, 255, (void (*)(uint64_t))&type metadata accessor for IFSessionServiceClient);
  swift_retain();
  swift_retain();
  id v20 = a7;
  swift_retain();
  swift_retain();
  sub_40540();
  swift_release();
  if (v24)
  {
    swift_release();

    swift_release();
    swift_release();
    sub_8CD8(a10);
    sub_8CD8(a5);
    sub_8CD8(a4);
    sub_8CD8(a3);
    swift_release();
  }
  else
  {

    swift_release();
    swift_release();
    sub_8CD8(a10);
    sub_8CD8(a5);
    sub_8CD8(a4);
    sub_8CD8(a3);
    swift_release();
    swift_release();
    v11[32] = v25;
  }
  swift_release();
  return v11;
}

uint64_t sub_35FA8(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  uint64_t v3 = sub_40030();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  return _swift_task_switch(sub_36068, 0, 0);
}

uint64_t sub_36068()
{
  uint64_t v38 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_405B0();
    sub_4A6C(v11, (uint64_t)qword_4E370);
    uint64_t v12 = sub_405A0();
    os_log_type_t v13 = sub_407F0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "IFFlow scope has ended, no IF server messages are passed thru", v14, 2u);
      swift_slowDealloc();
    }
    goto LABEL_22;
  }
  uint64_t v2 = Strong;
  sub_5044(&qword_4D740);
  uint64_t v3 = (void *)swift_task_alloc();
  uint64_t v4 = sub_40560();
  void *v3 = v4;
  uint64_t v5 = sub_3757C(&qword_4DA30, 255, (void (*)(uint64_t))&type metadata accessor for IFSessionServiceClient);
  v3[1] = v5;
  swift_getKeyPath();
  swift_task_dealloc();
  uint64_t v6 = (void *)swift_task_alloc();
  *uint64_t v6 = v4;
  v6[1] = v5;
  swift_getKeyPath();
  swift_task_dealloc();
  v0[6] = v2;
  swift_retain();
  sub_3F8E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = sub_40410();
  unint64_t v9 = v8;
  swift_release();
  if (v9)
  {
    if (sub_3FFF0() == v7 && v9 == v10)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v19 = 1;
      goto LABEL_24;
    }
    char v18 = sub_40970();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_15;
    }
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v21 = v0[12];
    uint64_t v20 = v0[13];
    uint64_t v22 = v0[11];
    uint64_t v23 = v0[9];
    uint64_t v24 = sub_405B0();
    sub_4A6C(v24, (uint64_t)qword_4E370);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v23, v22);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_405A0();
    os_log_type_t v26 = sub_407F0();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v29 = v0[12];
    uint64_t v28 = v0[13];
    if (!v27)
    {
      (*(void (**)(void, void))(v29 + 8))(v0[13], v0[11]);
      swift_bridgeObjectRelease_n();
      swift_release();

      goto LABEL_23;
    }
    uint64_t v35 = v0[11];
    os_log_type_t type = v26;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315394;
    uint64_t v31 = sub_3FFF0();
    v0[7] = sub_17898(v31, v32, &v37);
    sub_40860();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v35);
    *(_WORD *)(v30 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[8] = sub_17898(v7, v9, &v37);
    sub_40860();
    swift_bridgeObjectRelease_n();
    uint64_t v12 = v25;
    _os_log_impl(&dword_0, v25, type, "IFFlow received a message with foreign clientRequestId of %s. IntelligenceFlowTraceId: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_405B0();
    sub_4A6C(v15, (uint64_t)qword_4E370);
    uint64_t v12 = sub_405A0();
    os_log_type_t v16 = sub_407F0();
    if (!os_log_type_enabled(v12, v16)) {
      goto LABEL_21;
    }
    char v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v17 = 0;
    _os_log_impl(&dword_0, v12, v16, "IFFlow does not have intelligenceFlowTraceId, waiting for another message", v17, 2u);
  }
  swift_slowDealloc();
LABEL_21:
  swift_release();
LABEL_22:

LABEL_23:
  uint64_t v19 = 0;
LABEL_24:
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v19);
}

uint64_t sub_3660C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v70 = sub_3F510();
  uint64_t v68 = *(void *)(v70 - 8);
  uint64_t v3 = __chkstk_darwin(v70);
  uint64_t v63 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  os_log_type_t v64 = (char *)&v63 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v63 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v63 - v10;
  uint64_t v12 = sub_40150();
  unint64_t v67 = *(char **)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_3F190();
  uint64_t v66 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  char v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_3F520();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  int v22 = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v21, v18);
  if (v22 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
    uint64_t v23 = v68;
    uint64_t v24 = v70;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v11, v21, v70);
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
    v25(v9, v11, v24);
    if (sub_3F4F0() == 0xD00000000000001FLL && v26 == 0x80000000000438B0)
    {
      swift_bridgeObjectRelease();
      BOOL v27 = *(void (**)(char *, uint64_t))(v23 + 8);
      v27(v9, v70);
LABEL_8:
      v27(v11, v70);
      char v30 = 1;
      goto LABEL_9;
    }
    char v31 = sub_40970();
    swift_bridgeObjectRelease();
    uint64_t v33 = *(void (**)(char *, uint64_t))(v23 + 8);
    uint64_t v32 = v23 + 8;
    BOOL v27 = v33;
    v33(v9, v70);
    if (v31) {
      goto LABEL_8;
    }
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_405B0();
    sub_4A6C(v54, (uint64_t)qword_4E370);
    unint64_t v55 = v64;
    v25(v64, v11, v70);
    uint64_t v56 = sub_405A0();
    os_log_type_t v57 = sub_407F0();
    if (os_log_type_enabled(v56, v57))
    {
      BOOL v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      v76[0] = v66;
      unint64_t v67 = v11;
      *(_DWORD *)BOOL v58 = 136315138;
      uint64_t v65 = v58 + 4;
      uint64_t v68 = v32;
      uint64_t v59 = v70;
      v25(v63, v55, v70);
      uint64_t v60 = sub_406C0();
      v75[0] = sub_17898(v60, v61, v76);
      uint64_t v11 = v67;
      sub_40860();
      swift_bridgeObjectRelease();
      v27(v55, v59);
      _os_log_impl(&dword_0, v56, v57, "IFFlowPlugin does not support direct invocation %s. Returning .noFlow", v58, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v27(v55, v70);
    }

    sub_3EF70();
    return ((uint64_t (*)(char *, uint64_t))v27)(v11, v70);
  }
  else
  {
    if (v22 == enum case for Parse.nlRouter(_:))
    {
      (*(void (**)(char *, uint64_t))(v19 + 96))(v21, v18);
      uint64_t v28 = v66;
      (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v17, v21, v15);
      sub_3F170();
      uint64_t v29 = v67;
      char v30 = (*((unsigned int (**)(char *, uint64_t))v67 + 11))(v14, v12) == enum case for NLRoutingDecisionMessage.RoutingDecision.ajax(_:);
      (*((void (**)(char *, uint64_t))v29 + 1))(v14, v12);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v15);
LABEL_9:
      if (qword_4CF38 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_405B0();
      sub_4A6C(v34, (uint64_t)qword_4E370);
      uint64_t v35 = sub_405A0();
      os_log_type_t v36 = sub_407F0();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        v76[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315138;
        LOBYTE(v75[0]) = v30;
        uint64_t v38 = sub_406C0();
        v75[0] = sub_17898(v38, v39, v76);
        sub_40860();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v35, v36, "IFFlowPlugin building IFFlow with routing mode %s", v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      sub_40560();
      uint64_t v40 = sub_40550();
      unint64_t v41 = v65;
      sub_7B5C((uint64_t)(v65 + 56), (uint64_t)v76);
      sub_7B5C((uint64_t)(v41 + 16), (uint64_t)v75);
      type metadata accessor for IFFlowInstrumentationUtil();
      uint64_t v42 = (void *)swift_allocObject();
      uint64_t v43 = self;
      v42[2] = [v43 sharedStream];
      sub_40510();
      swift_allocObject();
      v42[3] = sub_40500();
      v42[4] = [v43 sharedAnalytics];
      uint64_t v44 = sub_3F2B0();
      swift_allocObject();
      uint64_t v45 = sub_3F2A0();
      v74[3] = v44;
      v74[4] = &protocol witness table for ResponseFactory;
      v74[0] = v45;
      id v46 = [(id)BiomeLibrary() Siri];
      swift_unknownObjectRelease();
      id v47 = [v46 Orchestration];
      swift_unknownObjectRelease();
      id v48 = [v47 RequestContext];
      swift_unknownObjectRelease();
      id v49 = [v48 source];

      unint64_t v72 = &type metadata for FeatureEnablementProvider;
      uint64_t v73 = &off_4A1F0;
      sub_5044(&qword_4DA00);
      swift_allocObject();
      v76[0] = (uint64_t)sub_35C40(v40, v30, (uint64_t)v76, (uint64_t)v75, (uint64_t)v74, (uint64_t)v42, v49, (uint64_t)sub_22078, 0, (uint64_t)v71);
      sub_373F0();
      sub_3EF20();
      sub_3EF80();
      swift_release();
      return swift_release();
    }
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_405B0();
    sub_4A6C(v50, (uint64_t)qword_4E370);
    uint64_t v51 = sub_405A0();
    os_log_type_t v52 = sub_407F0();
    if (os_log_type_enabled(v51, v52))
    {
      unint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v53 = 0;
      _os_log_impl(&dword_0, v51, v52, "IFFlowPlugin returning .noFlow", v53, 2u);
      swift_slowDealloc();
    }

    sub_3EF70();
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
}

uint64_t sub_372C4()
{
  sub_8CD8(v0 + 16);
  sub_8CD8(v0 + 56);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IFFlowPlugin()
{
  return self;
}

uint64_t sub_37328@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_3660C(a1, a2);
}

uint64_t sub_3734C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  sub_3F390();
  uint64_t result = sub_3F530();
  *a1 = v2;
  return result;
}

uint64_t sub_373A8(uint64_t a1, uint64_t a2)
{
  return sub_3757C(&qword_4D9F8, a2, (void (*)(uint64_t))type metadata accessor for IFFlowPlugin);
}

unint64_t sub_373F0()
{
  unint64_t result = qword_4DA08;
  if (!qword_4DA08)
  {
    sub_8C90(&qword_4DA00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4DA08);
  }
  return result;
}

uint64_t sub_37454@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3F8C0();
  *a1 = result;
  return result;
}

uint64_t sub_37480()
{
  return sub_3F8D0();
}

uint64_t sub_374AC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_374E4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_30050;
  return sub_35FA8(a1, v1);
}

uint64_t sub_3757C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_375C8()
{
  return 16;
}

__n128 sub_375D4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_375E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[16] = a6;
  v7[17] = a7;
  v7[14] = a4;
  v7[15] = a5;
  v7[12] = a2;
  v7[13] = a3;
  v7[11] = a1;
  sub_5044(&qword_4DA40);
  v7[18] = swift_task_alloc();
  uint64_t v8 = sub_40580();
  v7[19] = v8;
  v7[20] = *(void *)(v8 - 8);
  v7[21] = swift_task_alloc();
  v7[22] = swift_task_alloc();
  v7[23] = swift_task_alloc();
  sub_5044(&qword_4DA48);
  v7[24] = swift_task_alloc();
  uint64_t v9 = sub_3FB50();
  v7[25] = v9;
  v7[26] = *(void *)(v9 - 8);
  v7[27] = swift_task_alloc();
  uint64_t v10 = sub_3FC90();
  v7[28] = v10;
  v7[29] = *(void *)(v10 - 8);
  v7[30] = swift_task_alloc();
  v7[31] = swift_task_alloc();
  v7[32] = swift_task_alloc();
  uint64_t v11 = sub_3FDF0();
  v7[33] = v11;
  v7[34] = *(void *)(v11 - 8);
  v7[35] = swift_task_alloc();
  uint64_t v12 = sub_405B0();
  v7[36] = v12;
  v7[37] = *(void *)(v12 - 8);
  v7[38] = swift_task_alloc();
  uint64_t v13 = sub_40320();
  v7[39] = v13;
  v7[40] = *(void *)(v13 - 8);
  v7[41] = swift_task_alloc();
  sub_5044(&qword_4D650);
  v7[42] = swift_task_alloc();
  uint64_t v14 = sub_3EFC0();
  v7[43] = v14;
  v7[44] = *(void *)(v14 - 8);
  v7[45] = swift_task_alloc();
  v7[46] = swift_task_alloc();
  sub_5044(&qword_4D0C8);
  v7[47] = swift_task_alloc();
  uint64_t v15 = sub_3EDB0();
  v7[48] = v15;
  v7[49] = *(void *)(v15 - 8);
  v7[50] = swift_task_alloc();
  uint64_t v16 = sub_3FCA0();
  v7[51] = v16;
  v7[52] = *(void *)(v16 - 8);
  v7[53] = swift_task_alloc();
  v7[54] = swift_task_alloc();
  return _swift_task_switch(sub_37AA4, 0, 0);
}

uint64_t sub_37AA4()
{
  uint64_t v182 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[54];
  uint64_t v3 = v0[52];
  uint64_t v4 = v1[51];
  sub_40010();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v5 == enum case for MessagePayload.terminate(_:))
  {
    uint64_t v6 = v1[54];
    uint64_t v7 = v1[51];
    uint64_t v8 = v1[52];
    uint64_t v9 = v1[11];
    type metadata accessor for IFFlowError();
    sub_3CDEC(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    uint64_t v10 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    *(void *)uint64_t v9 = v10;
    uint64_t v11 = type metadata accessor for FlowAction();
    *(_OWORD *)(v9 + 8) = 0u;
    *(_OWORD *)(v9 + 24) = 0u;
    *(void *)(v9 + 40) = 0;
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
LABEL_34:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v89 = (uint64_t (*)(void))v1[1];
    return v89();
  }
  if (v5 == enum case for MessagePayload.endOfPlan(_:))
  {
    uint64_t v12 = v1[54];
    uint64_t v13 = v1[32];
    uint64_t v15 = v1[28];
    uint64_t v14 = v1[29];
    (*(void (**)(uint64_t, void))(v1[52] + 96))(v12, v1[51]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v13, v12, v15);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v17 = v1[31];
    uint64_t v16 = v1[32];
    uint64_t v19 = v1[28];
    uint64_t v18 = v1[29];
    sub_4A6C(v1[36], (uint64_t)qword_4E370);
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
    v20(v17, v16, v19);
    uint64_t v21 = sub_405A0();
    os_log_type_t v22 = sub_407F0();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v25 = v1[31];
    uint64_t v24 = v1[32];
    if (v23)
    {
      uint64_t v26 = v1[30];
      *(void *)os_log_type_t type = v1[29];
      uint64_t v27 = v1[28];
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v181 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      v20(v26, v25, v27);
      uint64_t v29 = sub_406C0();
      v1[8] = sub_17898(v29, v30, &v181);
      sub_40860();
      swift_bridgeObjectRelease();
      char v31 = *(void (**)(uint64_t, uint64_t))(*(void *)type + 8);
      v31(v25, v27);
      _os_log_impl(&dword_0, v21, v22, "IFFlow received endOfPlan message %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v31(v24, v27);
    }
    else
    {
      uint64_t v42 = v1[28];
      uint64_t v43 = v1[29];

      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v44(v25, v42);
      v44(v24, v42);
    }
    uint64_t v45 = v1[11];
    uint64_t v46 = type metadata accessor for FlowAction();
    *(_OWORD *)uint64_t v45 = 0u;
    *(_OWORD *)(v45 + 16) = 0u;
    *(_OWORD *)(v45 + 32) = 0u;
    goto LABEL_32;
  }
  if (v5 == enum case for MessagePayload.error(_:))
  {
    uint64_t v32 = v1[54];
    uint64_t v34 = v1[26];
    uint64_t v33 = v1[27];
    uint64_t v35 = v1[25];
    (*(void (**)(uint64_t, void))(v1[52] + 96))(v32, v1[51]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v33, v32, v35);
    uint64_t v36 = sub_3FB40();
    uint64_t v37 = *(void *)(v36 + 16);
    uint64_t v38 = v1[24];
    if (v37)
    {
      uint64_t v39 = v37 - 1;
      uint64_t v40 = sub_3FA80();
      uint64_t v41 = *(void *)(v40 - 8);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v41 + 16))(v38, v36+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(void *)(v41 + 72) * v39, v40);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
    }
    else
    {
      uint64_t v40 = sub_3FA80();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v38, 1, 1, v40);
    }
    uint64_t v72 = v1[24];
    swift_bridgeObjectRelease();
    sub_3FA80();
    uint64_t v73 = *(void *)(v40 - 8);
    int v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v72, 1, v40);
    uint64_t v75 = v1[24];
    if (v74 == 1)
    {
      uint64_t v76 = (uint64_t *)&unk_4DA48;
LABEL_30:
      sub_ACEC(v75, v76);
LABEL_31:
      uint64_t v82 = v1[26];
      uint64_t v81 = v1[27];
      uint64_t v83 = v1[25];
      uint64_t v45 = v1[11];
      type metadata accessor for IFFlowError();
      sub_3CDEC(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
      uint64_t v84 = swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16))(v85, v81, v83);
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v81, v83);
      *(void *)uint64_t v45 = v84;
      uint64_t v46 = type metadata accessor for FlowAction();
      *(_OWORD *)(v45 + 8) = 0u;
      *(_OWORD *)(v45 + 24) = 0u;
      *(void *)(v45 + 40) = 0;
LABEL_32:
      swift_storeEnumTagMultiPayload();
      uint64_t v86 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56);
      uint64_t v87 = (uint64_t *)v45;
      uint64_t v88 = v46;
LABEL_33:
      v86(v87, 0, 1, v88);
      goto LABEL_34;
    }
    uint64_t v77 = v1[19];
    uint64_t v78 = v1[20];
    uint64_t v79 = v1[18];
    uint64_t v80 = (void *)sub_3FA70();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v75, v40);
    sub_40570();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v79, 1, v77) == 1)
    {
      uint64_t v75 = v1[18];

      uint64_t v76 = (uint64_t *)&unk_4DA40;
      goto LABEL_30;
    }
    uint64_t v178 = *(void (**)(uint64_t, void, uint64_t))(v1[20] + 32);
    v178(v1[23], v1[18], v1[19]);
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v92 = v1[22];
    uint64_t v93 = v1[23];
    uint64_t v94 = v1[19];
    uint64_t v95 = v1[20];
    sub_4A6C(v1[36], (uint64_t)qword_4E370);
    uint64_t v96 = *(void (**)(uint64_t, uint64_t, uint64_t))(v95 + 16);
    v96(v92, v93, v94);
    uint64_t v97 = sub_405A0();
    os_log_type_t v98 = sub_407F0();
    BOOL v99 = os_log_type_enabled(v97, v98);
    uint64_t v100 = v1[22];
    uint64_t v102 = v1[19];
    uint64_t v101 = v1[20];
    if (v99)
    {
      uint64_t v103 = (uint8_t *)swift_slowAlloc();
      os_log_type_t typea = v98;
      unint64_t v104 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v103 = 138412290;
      buf = v103;
      sub_3CDEC(&qword_4DA50, (void (*)(uint64_t))&type metadata accessor for GATError);
      swift_allocError();
      v96(v105, v100, v102);
      uint64_t v106 = _swift_stdlib_bridgeErrorToNSError();
      v1[7] = v106;
      sub_40860();
      void *v104 = v106;
      uint64_t v107 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
      v107(v100, v102);
      _os_log_impl(&dword_0, v97, typea, "Received an error from GAT: %@", buf, 0xCu);
      sub_5044(&qword_4D358);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v107 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
      v107(v100, v102);
    }

    uint64_t v109 = v1[20];
    uint64_t v108 = v1[21];
    uint64_t v110 = v1[19];
    v178(v108, v1[23], v110);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v109 + 88))(v108, v110) != enum case for GATError.emergencyFallback(_:))
    {
      v107(v1[21], v1[19]);
      goto LABEL_31;
    }
    uint64_t v112 = v1[20];
    uint64_t v111 = (uint64_t *)v1[21];
    uint64_t v113 = v1[19];
    uint64_t v114 = (uint64_t *)v1[11];
    (*(void (**)(void, void))(v1[26] + 8))(v1[27], v1[25]);
    (*(void (**)(uint64_t *, uint64_t))(v112 + 96))(v111, v113);
    uint64_t v115 = v111[1];
    *uint64_t v114 = *v111;
    v114[1] = v115;
    uint64_t v116 = type metadata accessor for FlowAction();
    swift_storeEnumTagMultiPayload();
    uint64_t v86 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56);
    uint64_t v87 = v114;
LABEL_62:
    uint64_t v88 = v116;
    goto LABEL_33;
  }
  if (v5 != enum case for MessagePayload.systemResponse(_:))
  {
    uint64_t v63 = v1[54];
    uint64_t v65 = v1[51];
    uint64_t v64 = v1[52];
    if (v5 != enum case for MessagePayload.actionSummaryUpdate(_:)
      && v5 != enum case for MessagePayload.statusUpdate(_:))
    {
      uint64_t v90 = v1[11];
      uint64_t v91 = type metadata accessor for FlowAction();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v90, 1, 1, v91);
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
      goto LABEL_34;
    }
    uint64_t v177 = v1 + 9;
    unint64_t v67 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
    v67(v63, v65);
    sub_404A0();
    if (v68)
    {
      uint64_t v70 = v1[48];
      uint64_t v69 = v1[49];
      uint64_t v71 = v1[47];
      sub_3ED70();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v71, 1, v70) == 1)
      {
        sub_ACEC(v1[47], &qword_4D0C8);
      }
      else
      {
        uint64_t v117 = v1[53];
        uint64_t v168 = (char *)v1[50];
        *(void *)uint64_t v173 = v1[44];
        uint64_t v175 = v1[51];
        uint64_t v179 = v1[43];
        uint64_t typeb = v1[42];
        (*(void (**)(void))(v1[49] + 32))();
        sub_40010();
        uint64_t v118 = (char *)sub_40420();
        uint64_t v120 = v119;
        unint64_t v121 = (char *)sub_40410();
        uint64_t v122 = v1;
        uint64_t v124 = v123;
        uint64_t v125 = (char *)sub_40490();
        sub_1CA04(v117, v118, v120, v121, v124, v168, v125, v126, typeb);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v67(v117, v175);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)v173 + 48))(typeb, 1, v179) != 1)
        {
          uint64_t v180 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v122[44] + 32);
          v180((uint64_t *)v122[46], v122[42], v122[43]);
          uint64_t v1 = v122;
          if (qword_4CF38 != -1) {
            swift_once();
          }
          uint64_t v145 = v122[45];
          uint64_t v146 = v122[46];
          uint64_t v147 = v122[43];
          uint64_t v148 = v122[44];
          sub_4A6C(v122[36], (uint64_t)qword_4E370);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 16))(v145, v146, v147);
          os_log_type_t v149 = sub_405A0();
          os_log_type_t v150 = sub_407F0();
          BOOL v151 = os_log_type_enabled(v149, v150);
          uint64_t v152 = v122[44];
          uint64_t v153 = v122[45];
          if (v151)
          {
            uint64_t v176 = v149;
            os_log_type_t v174 = v150;
            uint64_t v155 = v122[40];
            uint64_t v154 = v122[41];
            uint64_t v166 = v122[39];
            *(void *)typec = v122[43];
            uint64_t v156 = (uint8_t *)swift_slowAlloc();
            uint64_t v165 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v156 = 138412290;
            sub_3EFA0();
            sub_DBEC(v122 + 2, v122[5]);
            sub_40330();
            uint64_t v157 = sub_40310();
            (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v154, v166);
            sub_8CD8((uint64_t)(v122 + 2));
            v122[10] = v157;
            sub_40860();
            void *v165 = v157;
            os_log_type_t v149 = v176;
            (*(void (**)(uint64_t, os_log_type_t *))(v152 + 8))(v153, *(os_log_type_t **)typec);
            _os_log_impl(&dword_0, v176, v174, "Publishing IntelligenceFlowStatusUpdateMessage Message: %@", v156, 0xCu);
            sub_5044(&qword_4D358);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            (*(void (**)(void, void))(v152 + 8))(v122[45], v122[43]);
          }

          uint64_t v159 = v122[49];
          uint64_t v158 = v122[50];
          uint64_t v160 = v122[48];
          uint64_t v161 = v122[46];
          uint64_t v162 = v122[43];
          uint64_t v163 = (uint64_t *)v122[11];
          v163[3] = v162;
          v163[4] = (uint64_t)&protocol witness table for FlowMessageTransportableOutput;
          uint64_t v164 = sub_1174C(v163);
          v180(v164, v161, v162);
          (*(void (**)(uint64_t, uint64_t))(v159 + 8))(v158, v160);
          uint64_t v116 = type metadata accessor for FlowAction();
          swift_storeEnumTagMultiPayload();
          uint64_t v86 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56);
          uint64_t v87 = v163;
          goto LABEL_62;
        }
        uint64_t v127 = v122[42];
        (*(void (**)(void, void))(v122[49] + 8))(v122[50], v122[48]);
        sub_ACEC(v127, &qword_4D650);
        uint64_t v1 = v122;
      }
    }
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v129 = v1[37];
    uint64_t v128 = v1[38];
    uint64_t v130 = v1[36];
    uint64_t v131 = sub_4A6C(v130, (uint64_t)qword_4E370);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 16))(v128, v131, v130);
    swift_retain_n();
    os_log_type_t v132 = sub_405A0();
    uint64_t v133 = v1;
    os_log_type_t v134 = sub_40800();
    BOOL v135 = os_log_type_enabled(v132, v134);
    uint64_t v137 = v133[37];
    uint64_t v136 = v133[38];
    uint64_t v138 = v133[36];
    if (v135)
    {
      uint64_t v139 = (uint8_t *)swift_slowAlloc();
      uint64_t v181 = swift_slowAlloc();
      *(_DWORD *)uint64_t v139 = 136315138;
      uint64_t v140 = sub_404A0();
      if (v141)
      {
        unint64_t v142 = v141;
      }
      else
      {
        uint64_t v140 = 1819047278;
        unint64_t v142 = 0xE400000000000000;
      }
      uint64_t *v177 = sub_17898(v140, v142, &v181);
      sub_40860();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_0, v132, v134, "Failed to compose IntelligenceFlowStatusUpdateMessage with sessionId - %s", v139, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v136, v138);
    }
    else
    {
      swift_release_n();

      (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v136, v138);
    }
    uint64_t v1 = v133;
    uint64_t v143 = v133[11];
    uint64_t v144 = type metadata accessor for FlowAction();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v144 - 8) + 56))(v143, 1, 1, v144);
    goto LABEL_34;
  }
  uint64_t v47 = v1[54];
  uint64_t v49 = v1[34];
  uint64_t v48 = v1[35];
  uint64_t v50 = v1[33];
  (*(void (**)(uint64_t, void))(v1[52] + 96))(v47, v1[51]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32))(v48, v47, v50);
  uint64_t v51 = sub_40420();
  uint64_t v53 = v52;
  v1[55] = v52;
  uint64_t v54 = (void *)swift_task_alloc();
  v1[56] = v54;
  *uint64_t v54 = v1;
  v54[1] = sub_38E7C;
  uint64_t v55 = v1[35];
  uint64_t v56 = v1[17];
  uint64_t v57 = v1[14];
  uint64_t v58 = v1[15];
  uint64_t v59 = v1[12];
  uint64_t v60 = v1[13];
  uint64_t v61 = v1[11];
  uint64_t v184 = v1[16];
  uint64_t v185 = v56;
  return sub_39154(v61, v59, v55, v60, v51, v53, v57, v58);
}

uint64_t sub_38E7C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_38F94, 0, 0);
}

uint64_t sub_38F94()
{
  uint64_t v1 = v0[11];
  (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[33]);
  uint64_t v2 = type metadata accessor for FlowAction();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_39154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[129] = v23;
  v8[128] = v22;
  v8[127] = a8;
  v8[126] = a7;
  v8[125] = a6;
  v8[124] = a5;
  v8[123] = a4;
  v8[122] = a3;
  v8[121] = a2;
  v8[120] = a1;
  uint64_t v9 = sub_3FDF0();
  v8[130] = v9;
  v8[131] = *(void *)(v9 - 8);
  v8[132] = swift_task_alloc();
  uint64_t v10 = sub_3FE60();
  v8[133] = v10;
  v8[134] = *(void *)(v10 - 8);
  v8[135] = swift_task_alloc();
  uint64_t v11 = sub_3FAC0();
  v8[136] = v11;
  v8[137] = *(void *)(v11 - 8);
  v8[138] = swift_task_alloc();
  v8[139] = swift_task_alloc();
  uint64_t v12 = sub_3FAF0();
  v8[140] = v12;
  v8[141] = *(void *)(v12 - 8);
  v8[142] = swift_task_alloc();
  v8[143] = swift_task_alloc();
  v8[144] = swift_task_alloc();
  uint64_t v13 = sub_3FF30();
  v8[145] = v13;
  v8[146] = *(void *)(v13 - 8);
  v8[147] = swift_task_alloc();
  v8[148] = swift_task_alloc();
  uint64_t v14 = sub_3FF50();
  v8[149] = v14;
  v8[150] = *(void *)(v14 - 8);
  v8[151] = swift_task_alloc();
  v8[152] = swift_task_alloc();
  uint64_t v15 = sub_400B0();
  v8[153] = v15;
  v8[154] = *(void *)(v15 - 8);
  v8[155] = swift_task_alloc();
  uint64_t v16 = sub_403E0();
  v8[156] = v16;
  v8[157] = *(void *)(v16 - 8);
  v8[158] = swift_task_alloc();
  v8[159] = swift_task_alloc();
  sub_5044(&qword_4DA60);
  v8[160] = swift_task_alloc();
  uint64_t v17 = sub_3FEE0();
  v8[161] = v17;
  v8[162] = *(void *)(v17 - 8);
  v8[163] = swift_task_alloc();
  uint64_t v18 = sub_3FF10();
  v8[164] = v18;
  v8[165] = *(void *)(v18 - 8);
  v8[166] = swift_task_alloc();
  uint64_t v19 = sub_3FE50();
  v8[167] = v19;
  v8[168] = *(void *)(v19 - 8);
  v8[169] = swift_task_alloc();
  v8[170] = swift_task_alloc();
  return _swift_task_switch(sub_39674, 0, 0);
}

uint64_t sub_39674()
{
  uint64_t v183 = v0;
  if (qword_4CF38 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_405B0();
  sub_4A6C(v1, (uint64_t)qword_4E370);
  uint64_t v2 = sub_405A0();
  os_log_type_t v3 = sub_407F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v182 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    *(void *)(v0 + 944) = sub_17898(0xD00000000000001DLL, 0x8000000000043E00, &v182);
    sub_40860();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 952) = sub_17898(0xD000000000000073, 0x8000000000043E20, &v182);
    sub_40860();
    _os_log_impl(&dword_0, v2, v3, "%s:%s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = *(void *)(v0 + 1360);
  uint64_t v6 = *(void *)(v0 + 1344);
  uint64_t v7 = *(void *)(v0 + 1336);
  sub_30BE4(v5);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v5, v7);
  if (v8 == enum case for StatementOutcome.success(_:))
  {
    uint64_t v9 = sub_405A0();
    os_log_type_t v10 = sub_407E0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_0, v9, v10, "IFFlow Publishing success output", v11, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = *(void *)(v0 + 1032);
    uint64_t v13 = *(void *)(v0 + 1008);
    uint64_t v14 = *(void *)(v0 + 984);
    uint64_t v15 = *(void **)(v0 + 960);

    *uint64_t v15 = 0;
    sub_7B5C(v14, v0 + 144);
    sub_7B5C(v12, v0 + 232);
    *(void *)(v0 + 208) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 216) = &off_4A1F0;
    *(void *)(v0 + 224) = v13;
    swift_retain();
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 1368) = v16;
    void *v16 = v0;
    v16[1] = sub_3ADDC;
    uint64_t v17 = *(void *)(v0 + 1024);
    uint64_t v18 = *(void *)(v0 + 1016);
    uint64_t v19 = *(void *)(v0 + 1000);
    uint64_t v20 = *(void *)(v0 + 992);
    uint64_t v21 = *(void *)(v0 + 976);
    uint64_t v22 = (uint64_t)(v15 + 1);
    goto LABEL_32;
  }
  if (v8 == enum case for StatementOutcome.actionConfirmation(_:))
  {
    uint64_t v23 = *(void *)(v0 + 1360);
    uint64_t v24 = *(void *)(v0 + 1328);
    uint64_t v25 = *(void *)(v0 + 1320);
    uint64_t v26 = *(void *)(v0 + 1312);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v23, *(void *)(v0 + 1336));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v24, v23, v26);
    uint64_t v27 = sub_405A0();
    os_log_type_t v28 = sub_407E0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_0, v27, v28, "IFFlow inferredOutcome action confirmation", v29, 2u);
      swift_slowDealloc();
    }
    uint64_t v30 = *(void *)(v0 + 1280);

    sub_3FF00();
    uint64_t v31 = sub_3FEF0();
    uint64_t v32 = *(void *)(v31 - 8);
    int v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31);
    uint64_t v34 = *(void *)(v0 + 1280);
    if (v33 == 1)
    {
      sub_ACEC(v34, &qword_4DA60);
LABEL_34:
      uint64_t v85 = *(void *)(v0 + 1272);
      uint64_t v86 = *(void *)(v0 + 1264);
      uint64_t v87 = *(void *)(v0 + 1256);
      uint64_t v88 = *(void *)(v0 + 1248);
      sub_4140(*(void *)(v0 + 976), v85);
      uint64_t v89 = enum case for RequestSummary.PrescribedGenAITool.generateRichContentFromMediaIntentTool(_:);
      uint64_t v90 = sub_403F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 104))(v86, v89, v90);
      (*(void (**)(uint64_t, void, uint64_t))(v87 + 104))(v86, enum case for RequestSummary.ExecutionSource.genAI(_:), v88);
      char v91 = sub_403D0();
      int v92 = v91 & 1;
      *(unsigned char *)(v0 + 1504) = v91 & 1;
      uint64_t v93 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
      v93(v86, v88);
      v93(v85, v88);
      uint64_t v94 = sub_405A0();
      os_log_type_t v95 = sub_407E0();
      if (os_log_type_enabled(v94, v95))
      {
        uint64_t v96 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v96 = 67109120;
        *(_DWORD *)(v0 + 1480) = v92;
        sub_40860();
        _os_log_impl(&dword_0, v94, v95, "IFFlow pushing confirmation flow, isGenAIMediaQnA: %{BOOL}d", v96, 8u);
        swift_slowDealloc();
      }
      uint64_t v97 = *(void *)(v0 + 1032);
      uint64_t v98 = *(void *)(v0 + 1008);
      uint64_t v99 = *(void *)(v0 + 984);

      uint64_t v100 = sub_5044(&qword_4D6C8);
      *(_DWORD *)(v0 + 1484) = *(_DWORD *)(v100 + 48);
      *(_DWORD *)(v0 + 1488) = *(_DWORD *)(v100 + 64);
      sub_7B5C(v99, v0 + 400);
      sub_7B5C(v97, v0 + 488);
      *(void *)(v0 + 464) = &type metadata for FeatureEnablementProvider;
      *(void *)(v0 + 472) = &off_4A1F0;
      *(void *)(v0 + 480) = v98;
      swift_retain();
      uint64_t v101 = (void *)swift_task_alloc();
      *(void *)(v0 + 1376) = v101;
      *uint64_t v101 = v0;
      v101[1] = sub_3B090;
      uint64_t v17 = *(void *)(v0 + 1024);
      uint64_t v18 = *(void *)(v0 + 1016);
      uint64_t v19 = *(void *)(v0 + 1000);
      uint64_t v20 = *(void *)(v0 + 992);
      uint64_t v21 = *(void *)(v0 + 976);
      uint64_t v22 = *(void *)(v0 + 960);
      char v78 = v92;
      goto LABEL_37;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v32 + 88))(v34, v31) != enum case for ActionConfirmation.SystemStyle.montaraEnablement(_:))
    {
      (*(void (**)(void, uint64_t))(v32 + 8))(*(void *)(v0 + 1280), v31);
      goto LABEL_34;
    }
    uint64_t v51 = *(void *)(v0 + 1304);
    uint64_t v52 = *(void *)(v0 + 1296);
    uint64_t v53 = *(void *)(v0 + 1288);
    uint64_t v54 = *(void *)(v0 + 1280);
    (*(void (**)(uint64_t, uint64_t))(v32 + 96))(v54, v31);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32))(v51, v54, v53);
    uint64_t v55 = sub_405A0();
    os_log_type_t v56 = sub_407E0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_0, v55, v56, "IFFlow pushing Ajax enablement flow", v57, 2u);
      swift_slowDealloc();
    }
    uint64_t v58 = *(void *)(v0 + 1328);
    uint64_t v59 = *(void *)(v0 + 1320);
    uint64_t v60 = *(void *)(v0 + 1312);
    uint64_t v61 = *(void *)(v0 + 1304);
    uint64_t v62 = *(void *)(v0 + 1296);
    uint64_t v63 = *(void *)(v0 + 1288);
    uint64_t v64 = *(void *)(v0 + 960);

    sub_5044(&qword_4D6E8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v64, v61, v63);
    sub_31108();
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
    type metadata accessor for FlowAction();
    goto LABEL_21;
  }
  if (v8 == enum case for StatementOutcome.parameterNeedsValue(_:))
  {
    uint64_t v35 = *(void *)(v0 + 1360);
    uint64_t v36 = *(void *)(v0 + 1184);
    uint64_t v37 = *(void *)(v0 + 1176);
    uint64_t v38 = *(void *)(v0 + 1168);
    uint64_t v39 = *(void *)(v0 + 1160);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v35, *(void *)(v0 + 1336));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v36, v35, v39);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v37, v36, v39);
    uint64_t v40 = sub_405A0();
    os_log_type_t v41 = sub_407E0();
    BOOL v42 = os_log_type_enabled(v40, v41);
    uint64_t v43 = *(void *)(v0 + 1176);
    uint64_t v44 = *(void *)(v0 + 1168);
    if (v42)
    {
      uint64_t v178 = *(void *)(v0 + 1160);
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v182 = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315138;
      uint64_t v46 = sub_3FF20();
      *(void *)(v0 + 920) = sub_17898(v46, v47, &v182);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v50 = *(void (**)(void, void))(v44 + 8);
      uint64_t v49 = v44 + 8;
      uint64_t v48 = v50;
      v50(v43, v178);
      _os_log_impl(&dword_0, v40, v41, "IFFlow pushing needsValue flow for %s", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v79 = *(void (**)(void, void))(v44 + 8);
      uint64_t v49 = v44 + 8;
      uint64_t v48 = v79;
      v79(*(void *)(v0 + 1176), *(void *)(v0 + 1160));
    }

    *(void *)(v0 + 1432) = v48;
    *(void *)(v0 + 1424) = v49;
    uint64_t v80 = *(void *)(v0 + 1032);
    uint64_t v81 = *(void *)(v0 + 1008);
    uint64_t v82 = *(void *)(v0 + 984);
    *(_DWORD *)(v0 + 1500) = *(_DWORD *)(sub_5044(&qword_4D6F8) + 48);
    sub_7B5C(v82, v0 + 528);
    sub_7B5C(v80, v0 + 616);
    *(void *)(v0 + 592) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 600) = &off_4A1F0;
    *(void *)(v0 + 608) = v81;
    swift_retain();
    uint64_t v83 = (void *)swift_task_alloc();
    *(void *)(v0 + 1440) = v83;
    void *v83 = v0;
    uint64_t v84 = sub_3B8F0;
LABEL_31:
    v83[1] = v84;
    uint64_t v17 = *(void *)(v0 + 1024);
    uint64_t v18 = *(void *)(v0 + 1016);
    uint64_t v19 = *(void *)(v0 + 1000);
    uint64_t v20 = *(void *)(v0 + 992);
    uint64_t v21 = *(void *)(v0 + 976);
    uint64_t v22 = *(void *)(v0 + 960);
LABEL_32:
    char v78 = 0;
LABEL_37:
    return sub_AF78(v22, v21, v20, v19, v18, v17, v78);
  }
  if (v8 == enum case for StatementOutcome.parameterDisambiguation(_:))
  {
    uint64_t v67 = *(void *)(v0 + 1360);
    uint64_t v68 = *(void *)(v0 + 1240);
    uint64_t v69 = *(void *)(v0 + 1232);
    uint64_t v70 = *(void *)(v0 + 1224);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v67, *(void *)(v0 + 1336));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v68, v67, v70);
    uint64_t v71 = sub_405A0();
    os_log_type_t v72 = sub_407E0();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v73 = 0;
      _os_log_impl(&dword_0, v71, v72, "IFFlow pushing disambiguation flow", v73, 2u);
      swift_slowDealloc();
    }
    uint64_t v74 = *(void *)(v0 + 1032);
    uint64_t v75 = *(void *)(v0 + 1008);
    uint64_t v76 = *(void *)(v0 + 984);

    *(void *)(v0 + 1384) = *(void *)(sub_400A0() + 16);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 1492) = *(_DWORD *)(sub_5044(&qword_4D6A8) + 64);
    sub_7B5C(v76, v0 + 656);
    sub_7B5C(v74, v0 + 744);
    *(void *)(v0 + 720) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 728) = &off_4A1F0;
    *(void *)(v0 + 736) = v75;
    swift_retain();
    uint64_t v77 = (void *)swift_task_alloc();
    *(void *)(v0 + 1392) = v77;
    *uint64_t v77 = v0;
    v77[1] = sub_3B360;
    uint64_t v17 = *(void *)(v0 + 1024);
    uint64_t v18 = *(void *)(v0 + 1016);
    uint64_t v19 = *(void *)(v0 + 1000);
    uint64_t v20 = *(void *)(v0 + 992);
    uint64_t v21 = *(void *)(v0 + 976);
    uint64_t v22 = *(void *)(v0 + 960);
    char v78 = 0;
    goto LABEL_37;
  }
  if (v8 == enum case for StatementOutcome.parameterNotAllowed(_:))
  {
    uint64_t v102 = *(void *)(v0 + 1360);
    uint64_t v103 = *(void *)(v0 + 1216);
    uint64_t v104 = *(void *)(v0 + 1208);
    uint64_t v105 = *(void *)(v0 + 1200);
    uint64_t v106 = *(void *)(v0 + 1192);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v102, *(void *)(v0 + 1336));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 32))(v103, v102, v106);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 16))(v104, v103, v106);
    uint64_t v107 = sub_405A0();
    os_log_type_t v108 = sub_407E0();
    BOOL v109 = os_log_type_enabled(v107, v108);
    uint64_t v110 = *(void *)(v0 + 1208);
    uint64_t v111 = *(void *)(v0 + 1200);
    if (v109)
    {
      uint64_t v179 = *(void *)(v0 + 1192);
      uint64_t v112 = (uint8_t *)swift_slowAlloc();
      uint64_t v182 = swift_slowAlloc();
      *(_DWORD *)uint64_t v112 = 136315138;
      uint64_t v113 = sub_3FF40();
      *(void *)(v0 + 912) = sub_17898(v113, v114, &v182);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v117 = *(void (**)(void, void))(v111 + 8);
      uint64_t v115 = v111 + 8;
      uint64_t v116 = v117;
      v117(v110, v179);
      _os_log_impl(&dword_0, v107, v108, "IFFlow received parameterNotAllowed pushing needsValue flow for %s", v112, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v125 = *(void (**)(void, void))(v111 + 8);
      uint64_t v115 = v111 + 8;
      uint64_t v116 = v125;
      v125(*(void *)(v0 + 1208), *(void *)(v0 + 1192));
    }

    *(void *)(v0 + 1408) = v116;
    *(void *)(v0 + 1400) = v115;
    uint64_t v126 = *(void *)(v0 + 1032);
    uint64_t v127 = *(void *)(v0 + 1008);
    uint64_t v128 = *(void *)(v0 + 984);
    *(_DWORD *)(v0 + 1496) = *(_DWORD *)(sub_5044(&qword_4D6F8) + 48);
    sub_7B5C(v128, v0 + 784);
    sub_7B5C(v126, v0 + 872);
    *(void *)(v0 + 848) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 856) = &off_4A1F0;
    *(void *)(v0 + 864) = v127;
    swift_retain();
    uint64_t v83 = (void *)swift_task_alloc();
    *(void *)(v0 + 1416) = v83;
    void *v83 = v0;
    uint64_t v84 = sub_3B62C;
    goto LABEL_31;
  }
  if (v8 == enum case for StatementOutcome.actionRequirement(_:))
  {
    uint64_t v118 = *(void *)(v0 + 1360);
    uint64_t v119 = *(void *)(v0 + 1080);
    uint64_t v120 = *(void *)(v0 + 1072);
    uint64_t v121 = *(void *)(v0 + 1064);
    uint64_t v122 = *(void *)(v0 + 976);
    uint64_t v123 = *(NSObject **)(v0 + 968);
    uint64_t v124 = *(_OWORD **)(v0 + 960);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v118, *(void *)(v0 + 1336));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v120 + 32))(v119, v118, v121);
    sub_3C114(v123, v122, v119, v124);
    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v119, v121);
    goto LABEL_22;
  }
  if (v8 != enum case for StatementOutcome.failure(_:))
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 1048) + 16))(*(void *)(v0 + 1056), *(void *)(v0 + 976), *(void *)(v0 + 1040));
    uint64_t v144 = sub_405A0();
    os_log_type_t v145 = sub_407F0();
    if (os_log_type_enabled(v144, v145))
    {
      uint64_t v146 = *(void *)(v0 + 1352);
      uint64_t v147 = *(void *)(v0 + 1056);
      uint64_t v148 = *(void *)(v0 + 1048);
      uint64_t v180 = *(void *)(v0 + 1040);
      os_log_type_t v149 = (uint8_t *)swift_slowAlloc();
      uint64_t v182 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v149 = 136315138;
      sub_30BE4(v146);
      uint64_t v150 = sub_406C0();
      *(void *)(v0 + 936) = sub_17898(v150, v151, &v182);
      sub_40860();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v147, v180);
      _os_log_impl(&dword_0, v144, v145, "IFFlow received unsupported outcomeType %s", v149, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 1048) + 8))(*(void *)(v0 + 1056), *(void *)(v0 + 1040));
    }

    uint64_t v165 = *(void *)(v0 + 1032);
    uint64_t v166 = *(void *)(v0 + 1008);
    sub_7B5C(*(void *)(v0 + 984), v0 + 16);
    sub_7B5C(v165, v0 + 104);
    *(void *)(v0 + 80) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 88) = &off_4A1F0;
    *(void *)(v0 + 96) = v166;
    swift_retain();
    uint64_t v83 = (void *)swift_task_alloc();
    *(void *)(v0 + 1472) = v83;
    void *v83 = v0;
    uint64_t v84 = sub_3BE60;
    goto LABEL_31;
  }
  uint64_t v129 = *(void *)(v0 + 1360);
  uint64_t v130 = *(void *)(v0 + 1152);
  uint64_t v131 = *(void *)(v0 + 1128);
  uint64_t v132 = *(void *)(v0 + 1120);
  uint64_t v133 = *(void *)(v0 + 1112);
  uint64_t v134 = *(void *)(v0 + 1104);
  uint64_t v135 = *(void *)(v0 + 1096);
  uint64_t v136 = *(void *)(v0 + 1088);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v129, *(void *)(v0 + 1336));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v131 + 32))(v130, v129, v132);
  sub_3FAE0();
  (*(void (**)(uint64_t, void, uint64_t))(v135 + 104))(v134, enum case for ActionFailure.Failure.noMatchingTool(_:), v136);
  LOBYTE(v129) = sub_3FAB0();
  uint64_t v137 = *(void (**)(uint64_t, uint64_t))(v135 + 8);
  v137(v134, v136);
  v137(v133, v136);
  if ((v129 & 1) == 0)
  {
    uint64_t v177 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 1128) + 16);
    v177(*(void *)(v0 + 1144), *(void *)(v0 + 1152), *(void *)(v0 + 1120));
    uint64_t v152 = sub_405A0();
    os_log_type_t v153 = sub_407E0();
    BOOL v154 = os_log_type_enabled(v152, v153);
    uint64_t v155 = *(void *)(v0 + 1144);
    if (v154)
    {
      uint64_t v156 = *(void *)(v0 + 1136);
      uint64_t v157 = *(void *)(v0 + 1128);
      uint64_t v158 = *(void *)(v0 + 1120);
      uint64_t v159 = (uint8_t *)swift_slowAlloc();
      uint64_t v182 = swift_slowAlloc();
      *(_DWORD *)uint64_t v159 = 136315138;
      v177(v156, v155, v158);
      uint64_t v160 = sub_406C0();
      *(void *)(v0 + 928) = sub_17898(v160, v161, &v182);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v164 = *(void (**)(void, void))(v157 + 8);
      uint64_t v163 = v157 + 8;
      uint64_t v162 = v164;
      v164(v155, v158);
      _os_log_impl(&dword_0, v152, v153, "IFFlow Publishing failure output for %s", v159, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v167 = *(void *)(v0 + 1128);
      uint64_t v168 = *(void (**)(void, void))(v167 + 8);
      uint64_t v163 = v167 + 8;
      uint64_t v162 = v168;
      v168(*(void *)(v0 + 1144), *(void *)(v0 + 1120));
    }

    *(void *)(v0 + 1456) = v162;
    *(void *)(v0 + 1448) = v163;
    uint64_t v169 = *(void *)(v0 + 1152);
    uint64_t v170 = *(void *)(v0 + 1120);
    uint64_t v181 = *(void *)(v0 + 1032);
    uint64_t v171 = *(void *)(v0 + 1008);
    uint64_t v172 = *(void *)(v0 + 984);
    uint64_t v173 = *(uint64_t **)(v0 + 960);
    type metadata accessor for IFFlowError();
    sub_3CDEC(&qword_4D0E0, (void (*)(uint64_t))type metadata accessor for IFFlowError);
    uint64_t v174 = swift_allocError();
    v177(v175, v169, v170);
    swift_storeEnumTagMultiPayload();
    *uint64_t v173 = v174;
    sub_7B5C(v172, v0 + 272);
    sub_7B5C(v181, v0 + 360);
    *(void *)(v0 + 336) = &type metadata for FeatureEnablementProvider;
    *(void *)(v0 + 344) = &off_4A1F0;
    *(void *)(v0 + 352) = v171;
    swift_retain();
    uint64_t v176 = (void *)swift_task_alloc();
    *(void *)(v0 + 1464) = v176;
    *uint64_t v176 = v0;
    v176[1] = sub_3BBB4;
    uint64_t v17 = *(void *)(v0 + 1024);
    uint64_t v18 = *(void *)(v0 + 1016);
    uint64_t v19 = *(void *)(v0 + 1000);
    uint64_t v20 = *(void *)(v0 + 992);
    uint64_t v21 = *(void *)(v0 + 976);
    uint64_t v22 = (uint64_t)(v173 + 1);
    char v78 = 0;
    goto LABEL_37;
  }
  uint64_t v138 = sub_405A0();
  os_log_type_t v139 = sub_40800();
  if (os_log_type_enabled(v138, v139))
  {
    uint64_t v140 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v140 = 0;
    _os_log_impl(&dword_0, v138, v139, "IntelligenceFlow couldn't find any matching tools, falling back to SiriX", v140, 2u);
    swift_slowDealloc();
  }
  uint64_t v141 = *(void *)(v0 + 1152);
  uint64_t v142 = *(void *)(v0 + 1128);
  uint64_t v143 = *(void *)(v0 + 1120);

  (*(void (**)(uint64_t, uint64_t))(v142 + 8))(v141, v143);
  type metadata accessor for FlowAction();
LABEL_21:
  swift_storeEnumTagMultiPayload();
LABEL_22:
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v65 = *(uint64_t (**)(void))(v0 + 8);
  return v65();
}

uint64_t sub_3ADDC()
{
  uint64_t v1 = *v0 + 144;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3AEE4, 0, 0);
}

uint64_t sub_3AEE4()
{
  uint64_t v1 = v0[170];
  uint64_t v2 = v0[168];
  uint64_t v3 = v0[167];
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3B090()
{
  uint64_t v1 = *v0 + 400;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3B198, 0, 0);
}

uint64_t sub_3B198()
{
  uint64_t v1 = *(int *)(v0 + 1488);
  char v2 = *(unsigned char *)(v0 + 1504);
  uint64_t v3 = *(void *)(v0 + 1328);
  uint64_t v4 = *(void *)(v0 + 1320);
  uint64_t v5 = *(void *)(v0 + 1312);
  uint64_t v6 = *(void *)(v0 + 960);
  sub_31108();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  *(unsigned char *)(v6 + v1) = v2;
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_3B360()
{
  uint64_t v1 = *v0 + 656;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3B468, 0, 0);
}

uint64_t sub_3B468()
{
  uint64_t v1 = v0[155];
  uint64_t v2 = v0[154];
  uint64_t v3 = v0[153];
  *(void *)(v0[120] + 40) = v0[173];
  sub_31108();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3B62C()
{
  uint64_t v1 = *v0 + 784;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3B734, 0, 0);
}

uint64_t sub_3B734()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[176];
  uint64_t v2 = v0[152];
  uint64_t v3 = v0[149];
  sub_31108();
  v1(v2, v3);
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3B8F0()
{
  uint64_t v1 = *v0 + 528;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3B9F8, 0, 0);
}

uint64_t sub_3B9F8()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[179];
  uint64_t v2 = v0[148];
  uint64_t v3 = v0[145];
  sub_31108();
  v1(v2, v3);
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3BBB4()
{
  uint64_t v1 = *v0 + 272;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3BCBC, 0, 0);
}

uint64_t sub_3BCBC()
{
  (*(void (**)(void, void))(v0 + 1456))(*(void *)(v0 + 1152), *(void *)(v0 + 1120));
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3BE60()
{
  uint64_t v1 = *v0 + 16;
  swift_task_dealloc();
  sub_3CE34(v1);
  return _swift_task_switch(sub_3BF68, 0, 0);
}

uint64_t sub_3BF68()
{
  uint64_t v1 = v0[170];
  uint64_t v2 = v0[168];
  uint64_t v3 = v0[167];
  type metadata accessor for FlowAction();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_3C114@<X0>(NSObject *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  os_log_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v34 = a4;
  uint64_t v5 = sub_3FEA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3FE60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v31 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v30 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v30 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v18((char *)v30 - v16, a3, v9);
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v17, v9) == enum case for ActionRequirement.systemRequirement(_:))
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v17, v9);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v17, v5);
    sub_3C550(v33, (uint64_t)v8, v34);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_405B0();
    sub_4A6C(v20, (uint64_t)qword_4E370);
    v18(v15, a3, v9);
    uint64_t v21 = sub_405A0();
    os_log_type_t v22 = sub_407F0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      os_log_t v32 = v21;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v36 = v33;
      *(_DWORD *)uint64_t v24 = 136315138;
      v30[1] = v24 + 4;
      v18(v31, (uint64_t)v15, v9);
      uint64_t v25 = sub_406C0();
      uint64_t v35 = sub_17898(v25, v26, &v36);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
      v27(v15, v9);
      os_log_t v28 = v32;
      _os_log_impl(&dword_0, v32, v22, "IFFlow received unsupported ActionRequirement %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
      v27(v15, v9);
    }
    uint64_t v29 = v34;
    type metadata accessor for FlowAction();
    _OWORD *v29 = 0u;
    v29[1] = 0u;
    uint64_t v29[2] = 0u;
    swift_storeEnumTagMultiPayload();
    return ((uint64_t (*)(char *, uint64_t))v27)(v17, v9);
  }
}

uint64_t sub_3C550@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v69 = a3;
  uint64_t v4 = sub_3FE70();
  uint64_t v63 = *(void *)(v4 - 8);
  uint64_t v64 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v58 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  int v8 = (char *)&v54 - v7;
  uint64_t v9 = sub_3F350();
  Class isa = v9[-1].isa;
  os_log_t v67 = v9;
  __chkstk_darwin(v9);
  uint64_t v65 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3FE90();
  uint64_t v61 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v59 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = sub_3FEA0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v60 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v62 = (char *)&v54 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v54 - v22;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v25 = a2;
  v24((char *)&v54 - v22, a2, v16);
  if ((*(unsigned int (**)(char *, uint64_t))(v17 + 88))(v23, v16) == enum case for SystemRequirement.userAuthenticationRequired(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v23, v16);
    uint64_t v26 = v61;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v15, v23, v11);
    sub_3FE80();
    uint64_t v28 = v63;
    uint64_t v27 = v64;
    int v29 = (*(uint64_t (**)(char *, uint64_t))(v63 + 88))(v8, v64);
    uint64_t v30 = v11;
    uint64_t v31 = v15;
    if (v29 == enum case for SystemRequirement.AuthenticationRequest.AuthenticationLevel.alternativeAuthenticationPermitted(_:))
    {
      os_log_t v32 = v65;
      sub_3F340();
    }
    else
    {
      os_log_t v32 = v65;
      if (v29 == enum case for SystemRequirement.AuthenticationRequest.AuthenticationLevel.originDeviceAuthenticationRequired(_:))
      {
        sub_3F330();
      }
      else
      {
        if (qword_4CF38 != -1) {
          swift_once();
        }
        uint64_t v43 = sub_405B0();
        sub_4A6C(v43, (uint64_t)qword_4E370);
        uint64_t v44 = v59;
        (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v59, v15, v30);
        uint64_t v45 = sub_405A0();
        os_log_type_t v46 = sub_40800();
        if (os_log_type_enabled(v45, v46))
        {
          os_log_t v57 = v45;
          uint64_t v47 = swift_slowAlloc();
          uint64_t v60 = v31;
          uint64_t v48 = (uint8_t *)v47;
          uint64_t v56 = swift_slowAlloc();
          uint64_t v71 = v56;
          uint64_t v62 = v8;
          *(_DWORD *)uint64_t v48 = 136315138;
          uint64_t v54 = v48 + 4;
          uint64_t v55 = v48;
          sub_3FE80();
          uint64_t v49 = sub_406C0();
          uint64_t v70 = sub_17898(v49, v50, &v71);
          int v8 = v62;
          sub_40860();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v26 + 8))(v44, v30);
          os_log_t v51 = v57;
          _os_log_impl(&dword_0, v57, v46, "IFFlow received unknown SystemRequirement.AuthenticationLevel %s. Defaulting to requiring full unlock.", v55, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v31 = v60;
          swift_slowDealloc();
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v26 + 8))(v44, v30);
        }
        sub_3F330();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v27);
      }
    }
    sub_5044(&qword_4D698);
    Class v53 = isa;
    os_log_t v52 = v67;
    (*((void (**)(_OWORD *, char *, os_log_t))isa + 2))(v69, v32, v67);
    sub_31108();
    (*((void (**)(char *, os_log_t))v53 + 1))(v32, v52);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v30);
    type metadata accessor for FlowAction();
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    if (qword_4CF38 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_405B0();
    sub_4A6C(v33, (uint64_t)qword_4E370);
    uint64_t v34 = v62;
    v24(v62, v25, v16);
    uint64_t v35 = sub_405A0();
    os_log_type_t v36 = sub_407F0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      uint64_t v71 = v68;
      os_log_t v67 = v35;
      *(_DWORD *)uint64_t v37 = 136315138;
      Class isa = (Class)(v37 + 4);
      v24(v60, (uint64_t)v34, v16);
      uint64_t v38 = sub_406C0();
      uint64_t v70 = sub_17898(v38, v39, &v71);
      sub_40860();
      swift_bridgeObjectRelease();
      uint64_t v40 = *(void (**)(char *, uint64_t))(v17 + 8);
      v40(v34, v16);
      uint64_t v35 = v67;
      _os_log_impl(&dword_0, v67, v36, "IFFlow received unsupported SystemRequirement %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v40 = *(void (**)(char *, uint64_t))(v17 + 8);
      v40(v34, v16);
    }

    type metadata accessor for FlowAction();
    os_log_type_t v41 = v69;
    *uint64_t v69 = 0u;
    v41[1] = 0u;
    v41[2] = 0u;
    swift_storeEnumTagMultiPayload();
    return ((uint64_t (*)(char *, uint64_t))v40)(v23, v16);
  }
}

uint64_t type metadata accessor for FlowAction()
{
  uint64_t result = qword_4DAD8;
  if (!qword_4DAD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3CDEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3CE34(uint64_t a1)
{
  return a1;
}

char *sub_3CE88(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        long long v7 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v7;
        (**(void (***)(void *, const void *))(v7 - 8))(a1, a2);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        long long v10 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v10;
        (**(void (***)(void *, const void *))(v10 - 8))(a1, a2);
        uint64_t v11 = sub_5044(&qword_4D6C8);
        uint64_t v12 = *(int *)(v11 + 48);
        uint64_t v13 = &a1[v12];
        uint64_t v14 = &a2[v12];
        uint64_t v15 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        a1[*(int *)(v11 + 64)] = a2[*(int *)(v11 + 64)];
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        long long v16 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v16;
        (**(void (***)(void *, const void *))(v16 - 8))(a1, a2);
        uint64_t v17 = *(int *)(sub_5044(&qword_4D6F8) + 48);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        uint64_t v20 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        long long v21 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v21;
        (**(void (***)(void *, const void *))(v21 - 8))(a1, a2);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        uint64_t v22 = *(int *)(sub_5044(&qword_4D6A8) + 64);
        uint64_t v23 = &a1[v22];
        uint64_t v24 = &a2[v22];
        uint64_t v25 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v26 = sub_3F350();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(a1, a2, v26);
        uint64_t v27 = *(int *)(sub_5044(&qword_4D698) + 48);
        uint64_t v28 = &a1[v27];
        int v29 = &a2[v27];
        uint64_t v30 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v31 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v31;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v32 = *(void *)a2;
        swift_errorRetain();
        *(void *)a1 = v32;
        uint64_t v33 = a1 + 8;
        uint64_t v34 = a2 + 8;
        uint64_t v35 = *((void *)a2 + 4);
        if (v35)
        {
          uint64_t v36 = *((void *)a2 + 5);
          *((void *)a1 + 4) = v35;
          *((void *)a1 + 5) = v36;
          (**(void (***)(_OWORD *, _OWORD *))(v35 - 8))(v33, v34);
        }
        else
        {
          long long v42 = *(_OWORD *)(a2 + 24);
          *uint64_t v33 = *v34;
          *(_OWORD *)(a1 + 24) = v42;
          *((void *)a1 + 5) = *((void *)a2 + 5);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        uint64_t v37 = sub_3FEE0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(a1, a2, v37);
        uint64_t v38 = *(int *)(sub_5044(&qword_4D6E8) + 48);
        unint64_t v39 = &a1[v38];
        uint64_t v40 = &a2[v38];
        uint64_t v41 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_3D3B4(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = a1;
      goto LABEL_12;
    case 1:
      sub_8CD8(a1);
      uint64_t v4 = &qword_4D6C8;
      goto LABEL_17;
    case 2:
      sub_8CD8(a1);
      uint64_t v4 = &qword_4D6F8;
      goto LABEL_17;
    case 3:
      sub_8CD8(a1);
      uint64_t v5 = *(int *)(sub_5044(&qword_4D6A8) + 64);
      goto LABEL_18;
    case 4:
      uint64_t v6 = sub_3F350();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
      uint64_t v4 = &qword_4D698;
      goto LABEL_17;
    case 5:
      return swift_bridgeObjectRelease();
    case 6:
      uint64_t result = swift_errorRelease();
      if (*(void *)(a1 + 32))
      {
        uint64_t v3 = a1 + 8;
LABEL_12:
        return sub_8CD8(v3);
      }
      return result;
    case 7:
      uint64_t v7 = sub_3FEE0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
      uint64_t v4 = &qword_4D6E8;
LABEL_17:
      uint64_t v5 = *(int *)(sub_5044(v4) + 48);
LABEL_18:
      uint64_t v8 = a1 + v5;
      uint64_t v9 = sub_3FAA0();
      long long v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
      uint64_t result = v10(v8, v9);
      break;
    default:
      return result;
  }
  return result;
}

char *sub_3D5A0(char *a1, char *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      long long v6 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v6;
      (**(void (***)(void *, const void *))(v6 - 8))(a1, a2);
      goto LABEL_13;
    case 1u:
      long long v7 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v7;
      (**(void (***)(void *, const void *))(v7 - 8))(a1, a2);
      uint64_t v8 = sub_5044(&qword_4D6C8);
      uint64_t v9 = *(int *)(v8 + 48);
      long long v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      a1[*(int *)(v8 + 64)] = a2[*(int *)(v8 + 64)];
      goto LABEL_13;
    case 2u:
      long long v13 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v13;
      (**(void (***)(void *, const void *))(v13 - 8))(a1, a2);
      uint64_t v14 = *(int *)(sub_5044(&qword_4D6F8) + 48);
      uint64_t v15 = &a1[v14];
      long long v16 = &a2[v14];
      uint64_t v17 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      goto LABEL_13;
    case 3u:
      long long v18 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 24) = v18;
      (**(void (***)(void *, const void *))(v18 - 8))(a1, a2);
      *((void *)a1 + 5) = *((void *)a2 + 5);
      uint64_t v19 = *(int *)(sub_5044(&qword_4D6A8) + 64);
      uint64_t v20 = &a1[v19];
      long long v21 = &a2[v19];
      uint64_t v22 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
      goto LABEL_13;
    case 4u:
      uint64_t v23 = sub_3F350();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(a1, a2, v23);
      uint64_t v24 = *(int *)(sub_5044(&qword_4D698) + 48);
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      uint64_t v27 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
      goto LABEL_13;
    case 5u:
      uint64_t v28 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v28;
      swift_bridgeObjectRetain();
      goto LABEL_13;
    case 6u:
      uint64_t v29 = *(void *)a2;
      swift_errorRetain();
      *(void *)a1 = v29;
      uint64_t v30 = a1 + 8;
      uint64_t v31 = a2 + 8;
      uint64_t v32 = *((void *)a2 + 4);
      if (v32)
      {
        uint64_t v33 = *((void *)a2 + 5);
        *((void *)a1 + 4) = v32;
        *((void *)a1 + 5) = v33;
        (**(void (***)(_OWORD *, _OWORD *))(v32 - 8))(v30, v31);
      }
      else
      {
        long long v39 = *(_OWORD *)(a2 + 24);
        _OWORD *v30 = *v31;
        *(_OWORD *)(a1 + 24) = v39;
        *((void *)a1 + 5) = *((void *)a2 + 5);
      }
      goto LABEL_13;
    case 7u:
      uint64_t v34 = sub_3FEE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(a1, a2, v34);
      uint64_t v35 = *(int *)(sub_5044(&qword_4D6E8) + 48);
      uint64_t v36 = &a1[v35];
      uint64_t v37 = &a2[v35];
      uint64_t v38 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_3DA6C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_3DF64((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v6 = a2[3];
        a1[3] = v6;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v6 - 8))(a1, a2);
        goto LABEL_14;
      case 1u:
        uint64_t v7 = a2[3];
        a1[3] = v7;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v7 - 8))(a1, a2);
        uint64_t v8 = sub_5044(&qword_4D6C8);
        uint64_t v9 = *(int *)(v8 + 48);
        long long v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        *((unsigned char *)a1 + *(int *)(v8 + 64)) = *((unsigned char *)a2 + *(int *)(v8 + 64));
        goto LABEL_14;
      case 2u:
        uint64_t v13 = a2[3];
        a1[3] = v13;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v13 - 8))(a1, a2);
        uint64_t v14 = *(int *)(sub_5044(&qword_4D6F8) + 48);
        uint64_t v15 = (char *)a1 + v14;
        long long v16 = (char *)a2 + v14;
        uint64_t v17 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
        goto LABEL_14;
      case 3u:
        uint64_t v18 = a2[3];
        a1[3] = v18;
        a1[4] = a2[4];
        (**(void (***)(void *, void *))(v18 - 8))(a1, a2);
        a1[5] = a2[5];
        uint64_t v19 = *(int *)(sub_5044(&qword_4D6A8) + 64);
        uint64_t v20 = (char *)a1 + v19;
        long long v21 = (char *)a2 + v19;
        uint64_t v22 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
        goto LABEL_14;
      case 4u:
        uint64_t v23 = sub_3F350();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v23 - 8) + 16))(a1, a2, v23);
        uint64_t v24 = *(int *)(sub_5044(&qword_4D698) + 48);
        uint64_t v25 = (char *)a1 + v24;
        uint64_t v26 = (char *)a2 + v24;
        uint64_t v27 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        goto LABEL_14;
      case 5u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_14;
      case 6u:
        uint64_t v28 = *a2;
        swift_errorRetain();
        *a1 = v28;
        uint64_t v29 = a1 + 1;
        uint64_t v30 = (long long *)(a2 + 1);
        uint64_t v31 = a2[4];
        if (v31)
        {
          a1[4] = v31;
          a1[5] = a2[5];
          (**(void (***)(_OWORD *, long long *))(v31 - 8))(v29, v30);
        }
        else
        {
          long long v37 = *v30;
          long long v38 = *(_OWORD *)(a2 + 3);
          a1[5] = a2[5];
          _OWORD *v29 = v37;
          *(_OWORD *)(a1 + 3) = v38;
        }
        goto LABEL_14;
      case 7u:
        uint64_t v32 = sub_3FEE0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(a1, a2, v32);
        uint64_t v33 = *(int *)(sub_5044(&qword_4D6E8) + 48);
        uint64_t v34 = (char *)a1 + v33;
        uint64_t v35 = (char *)a2 + v33;
        uint64_t v36 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
LABEL_14:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_3DF64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FlowAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_3DFC0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v7 = sub_5044(&qword_4D6C8);
      uint64_t v8 = *(int *)(v7 + 48);
      uint64_t v9 = (char *)a1 + v8;
      long long v10 = (char *)a2 + v8;
      uint64_t v11 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      *((unsigned char *)a1 + *(int *)(v7 + 64)) = *((unsigned char *)a2 + *(int *)(v7 + 64));
      goto LABEL_8;
    case 2u:
      long long v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      *((void *)a1 + 4) = *((void *)a2 + 4);
      uint64_t v13 = *(int *)(sub_5044(&qword_4D6F8) + 48);
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      goto LABEL_8;
    case 3u:
      long long v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      uint64_t v18 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v18;
      uint64_t v19 = *(int *)(sub_5044(&qword_4D6A8) + 64);
      uint64_t v20 = (char *)a1 + v19;
      long long v21 = (char *)a2 + v19;
      uint64_t v22 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
      goto LABEL_8;
    case 4u:
      uint64_t v23 = sub_3F350();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v23 - 8) + 32))(a1, a2, v23);
      uint64_t v24 = *(int *)(sub_5044(&qword_4D698) + 48);
      uint64_t v25 = (char *)a1 + v24;
      uint64_t v26 = (char *)a2 + v24;
      uint64_t v27 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      goto LABEL_8;
    case 7u:
      uint64_t v28 = sub_3FEE0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v28 - 8) + 32))(a1, a2, v28);
      uint64_t v29 = *(int *)(sub_5044(&qword_4D6E8) + 48);
      uint64_t v30 = (char *)a1 + v29;
      uint64_t v31 = (char *)a2 + v29;
      uint64_t v32 = sub_3FAA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *sub_3E320(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_3DF64((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        long long v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        *((void *)a1 + 4) = *((void *)a2 + 4);
        uint64_t v7 = sub_5044(&qword_4D6C8);
        uint64_t v8 = *(int *)(v7 + 48);
        uint64_t v9 = (char *)a1 + v8;
        long long v10 = (char *)a2 + v8;
        uint64_t v11 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
        *((unsigned char *)a1 + *(int *)(v7 + 64)) = *((unsigned char *)a2 + *(int *)(v7 + 64));
        goto LABEL_9;
      case 2u:
        long long v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        *((void *)a1 + 4) = *((void *)a2 + 4);
        uint64_t v13 = *(int *)(sub_5044(&qword_4D6F8) + 48);
        uint64_t v14 = (char *)a1 + v13;
        uint64_t v15 = (char *)a2 + v13;
        uint64_t v16 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
        goto LABEL_9;
      case 3u:
        long long v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        uint64_t v18 = *((void *)a2 + 5);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = v18;
        uint64_t v19 = *(int *)(sub_5044(&qword_4D6A8) + 64);
        uint64_t v20 = (char *)a1 + v19;
        long long v21 = (char *)a2 + v19;
        uint64_t v22 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
        goto LABEL_9;
      case 4u:
        uint64_t v23 = sub_3F350();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v23 - 8) + 32))(a1, a2, v23);
        uint64_t v24 = *(int *)(sub_5044(&qword_4D698) + 48);
        uint64_t v25 = (char *)a1 + v24;
        uint64_t v26 = (char *)a2 + v24;
        uint64_t v27 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
        goto LABEL_9;
      case 7u:
        uint64_t v28 = sub_3FEE0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v28 - 8) + 32))(a1, a2, v28);
        uint64_t v29 = *(int *)(sub_5044(&qword_4D6E8) + 48);
        uint64_t v30 = (char *)a1 + v29;
        uint64_t v31 = (char *)a2 + v29;
        uint64_t v32 = sub_3FAA0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_3E690()
{
  uint64_t v9 = "(";
  uint64_t result = sub_3FAA0();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    long long v10 = &v8;
    swift_getTupleTypeLayout2();
    uint64_t v11 = &v7;
    swift_getTupleTypeLayout3();
    long long v12 = &v6;
    uint64_t result = sub_3F350();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v13 = &v5;
      uint64_t v14 = &unk_41A88;
      uint64_t v15 = &unk_41AA0;
      uint64_t result = sub_3FEE0();
      if (v3 <= 0x3F)
      {
        swift_getTupleTypeLayout2();
        uint64_t v16 = &v4;
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_3E840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_5044(&qword_4D488);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  char v7 = &v34[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v34[-v8];
  uint64_t v10 = sub_5044((uint64_t *)&unk_4DB10);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = sub_3F490();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  long long v17 = &v34[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t))(v11 + 16))(v13, v2, v10);
  int v18 = (*(uint64_t (**)(unsigned __int8 *, uint64_t))(v11 + 88))(v13, v10);
  uint64_t v19 = enum case for PromptResult.answered<A>(_:);
  if (v18 == enum case for PromptResult.answered<A>(_:))
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 96))(v13, v10);
    int v20 = *v13;
    uint64_t v21 = sub_3F360();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = (unsigned int *)&enum case for ConfirmationResponse.confirmed(_:);
    if (!v20) {
      uint64_t v23 = (unsigned int *)&enum case for ConfirmationResponse.rejected(_:);
    }
    (*(void (**)(unsigned char *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v9, *v23, v21);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(v9, 0, 1, v21);
    goto LABEL_13;
  }
  if (v18 == enum case for PromptResult.error<A>(_:))
  {
    (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(v13, v10);
LABEL_12:
    uint64_t v25 = enum case for ConfirmationResponse.rejected(_:);
    uint64_t v26 = sub_3F360();
    uint64_t v27 = *(void *)(v26 - 8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v27 + 104))(v7, v25, v26);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v27 + 56))(v7, 0, 1, v26);
LABEL_13:
    sub_3F4A0();
    goto LABEL_14;
  }
  if (v18 == enum case for PromptResult.cancelled<A>(_:) || v18 == enum case for PromptResult.unanswered<A>(_:)) {
    goto LABEL_12;
  }
  unsigned int v35 = enum case for ConfirmationResponse.rejected(_:);
  uint64_t v30 = sub_3F360();
  uint64_t v36 = a1;
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)(v30 - 8);
  (*(void (**)(unsigned char *, void, uint64_t))(v32 + 104))(v7, v35, v30);
  uint64_t v33 = v31;
  a1 = v36;
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v32 + 56))(v7, 0, 1, v33);
  sub_3F4A0();
  (*(void (**)(unsigned __int8 *, uint64_t))(v11 + 8))(v13, v10);
LABEL_14:
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v15 + 32))(a1, v17, v14);
  uint64_t v28 = sub_5044(&qword_4D720);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(a1, v19, v28);
}

uint64_t sub_3ED10()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_3ED20()
{
  return JSONDecoder.init()();
}

uint64_t sub_3ED30()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_3ED40()
{
  return LocalizedStringResource.key.getter();
}

uint64_t sub_3ED50()
{
  return type metadata accessor for LocalizedStringResource();
}

NSData sub_3ED60()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_3ED70()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_3ED80()
{
  return UUID.uuidString.getter();
}

NSUUID sub_3ED90()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_3EDA0()
{
  return UUID.init()();
}

uint64_t sub_3EDB0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_3EDC0()
{
  return SnippetPluginModel.data.getter();
}

uint64_t sub_3EDD0()
{
  return static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
}

uint64_t sub_3EE20()
{
  return PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)();
}

uint64_t sub_3EE70()
{
  return PromptForConfirmationFlowAsync.init<A>(itemToConfirm:strategy:outputPublisher:)();
}

uint64_t sub_3EED0()
{
  return PromptForDisambiguationFlowAsync.init<A>(items:strategy:outputPublisher:)();
}

uint64_t sub_3EEE0()
{
  return type metadata accessor for GuardFlow();
}

uint64_t sub_3EEF0()
{
  return static GuardFlowResult.== infix(_:_:)();
}

uint64_t sub_3EF00()
{
  return static CommonFlowGuard.ensuringDeviceIsAuthenticated(using:)();
}

uint64_t sub_3EF10()
{
  return type metadata accessor for CommonFlowGuard();
}

uint64_t sub_3EF20()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_3EF30()
{
  return Flow.eraseToAnyValueFlow()();
}

uint64_t sub_3EF40()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_3EF50()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_3EF70()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_3EF80()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_3EF90()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_3EFA0()
{
  return FlowMessageTransportableOutput.message.getter();
}

uint64_t sub_3EFB0()
{
  return FlowMessageTransportableOutput.init(message:flowActivity:)();
}

uint64_t sub_3EFC0()
{
  return type metadata accessor for FlowMessageTransportableOutput();
}

uint64_t sub_3EFD0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3EFE0()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3EFF0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3F000(Swift::String refId)
{
}

void sub_3F010()
{
}

uint64_t sub_3F020()
{
  return static SiriKitDirectInvocationPayloads.keySelection.getter();
}

uint64_t sub_3F030()
{
  return static SiriKitDirectInvocationPayloads.selectIndexIdentifier.getter();
}

uint64_t sub_3F040()
{
  return static SiriKitDirectInvocationPayloads.cancel.getter();
}

uint64_t sub_3F050()
{
  return static SiriKitDirectInvocationPayloads.reject.getter();
}

uint64_t sub_3F060()
{
  return static SiriKitDirectInvocationPayloads.confirm.getter();
}

uint64_t sub_3F070()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t sub_3F080()
{
  return dispatch thunk of DeviceState.isCarPlay.getter();
}

uint64_t sub_3F090()
{
  return static DialogPhase.completion.getter();
}

uint64_t sub_3F0A0()
{
  return static DialogPhase.confirmation.getter();
}

uint64_t sub_3F0B0()
{
  return static DialogPhase.clarification.getter();
}

uint64_t sub_3F0C0()
{
  return static DialogPhase.error.getter();
}

uint64_t sub_3F0D0()
{
  return static DialogPhase.status.getter();
}

uint64_t sub_3F0E0()
{
  return type metadata accessor for DialogPhase();
}

uint64_t sub_3F0F0()
{
  return static EmptyOutput.instance.getter();
}

uint64_t sub_3F100()
{
  return type metadata accessor for EmptyOutput();
}

uint64_t sub_3F110()
{
  return PluginAction.init(flowHandlerId:input:)();
}

uint64_t sub_3F120()
{
  return type metadata accessor for PluginAction();
}

uint64_t sub_3F130()
{
  return type metadata accessor for PromptResult();
}

uint64_t sub_3F140()
{
  return type metadata accessor for ResponseType();
}

uint64_t sub_3F150()
{
  return NLRouterParse.usoParse.getter();
}

uint64_t sub_3F160()
{
  return type metadata accessor for NLRouterParse.InputCandidate();
}

uint64_t sub_3F170()
{
  return NLRouterParse.nlRoutingDecision.getter();
}

uint64_t sub_3F180()
{
  return NLRouterParse.input.getter();
}

uint64_t sub_3F190()
{
  return type metadata accessor for NLRouterParse();
}

uint64_t sub_3F1A0()
{
  return static ActionForInput.cancel()();
}

uint64_t sub_3F1B0()
{
  return static ActionForInput.handle()();
}

uint64_t sub_3F1C0()
{
  return static ActionForInput.ignore()();
}

uint64_t sub_3F1E0()
{
  return static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_3F1F0()
{
  return static ExecuteResponse.ongoing(requireInput:)();
}

uint64_t sub_3F200()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_3F210()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_3F220()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_3F230()
{
  return static ExecuteResponse.redirect(nextPluginAction:)();
}

uint64_t sub_3F240()
{
  return static ExecuteResponse.unhandled(reason:)();
}

uint64_t sub_3F250()
{
  return NLContextUpdate.rrEntities.setter();
}

uint64_t sub_3F260()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t sub_3F270()
{
  return NLContextUpdate.init()();
}

uint64_t sub_3F280()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_3F290()
{
  return static PaginationStyle.noPagination()();
}

uint64_t sub_3F2A0()
{
  return ResponseFactory.init()();
}

uint64_t sub_3F2B0()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t sub_3F2C0()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_3F2D0()
{
  return DismissalSettings.minimumAutoDismissalTimeInMs.setter();
}

uint64_t sub_3F2E0()
{
  return type metadata accessor for DismissalSettings();
}

uint64_t sub_3F2F0()
{
  return DismissalSettings.init(_:)();
}

uint64_t sub_3F300()
{
  return type metadata accessor for DialogEngineOutput();
}

uint64_t sub_3F330()
{
  return static UnlockDevicePolicy.requiringDeviceUnlock.getter();
}

uint64_t sub_3F340()
{
  return static UnlockDevicePolicy.default.getter();
}

uint64_t sub_3F350()
{
  return type metadata accessor for UnlockDevicePolicy();
}

uint64_t sub_3F360()
{
  return type metadata accessor for ConfirmationResponse();
}

uint64_t sub_3F370()
{
  return static DisambiguationResult.chosenItem(_:)();
}

uint64_t sub_3F390()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_3F3A0()
{
  return OutputGenerationManifest.init(dialogPhase:_:)();
}

uint64_t sub_3F3B0()
{
  return OutputGenerationManifest.feedbackForm.setter();
}

uint64_t sub_3F3C0()
{
  return OutputGenerationManifest.responseType.setter();
}

uint64_t sub_3F3D0()
{
  return OutputGenerationManifest.inAppResponse.setter();
}

uint64_t sub_3F3E0()
{
  return OutputGenerationManifest.responseViewId.setter();
}

uint64_t sub_3F3F0()
{
  return OutputGenerationManifest.executionSource.setter();
}

uint64_t sub_3F400()
{
  return OutputGenerationManifest.nlContextUpdate.setter();
}

uint64_t sub_3F410()
{
  return OutputGenerationManifest.dismissalSettings.setter();
}

uint64_t sub_3F420()
{
  return OutputGenerationManifest.additionalAceViews.setter();
}

uint64_t sub_3F430()
{
  return OutputGenerationManifest.additionalCommands.setter();
}

uint64_t sub_3F440()
{
  return OutputGenerationManifest.listenAfterSpeaking.setter();
}

uint64_t sub_3F450()
{
  return OutputGenerationManifest.printSupportingDialogInDisplayModes.setter();
}

uint64_t sub_3F460()
{
  return OutputGenerationManifest.useResultSnippetAsSmartDialogOverrideInSAE.setter();
}

uint64_t sub_3F470()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t sub_3F480()
{
  return dispatch thunk of ConfirmationResponseProviding.confirmationResponse.getter();
}

uint64_t sub_3F490()
{
  return type metadata accessor for SimpleConfirmationResponseProvider();
}

uint64_t sub_3F4A0()
{
  return SimpleConfirmationResponseProvider.init(_:)();
}

uint64_t sub_3F4B0()
{
  return Input.parse.getter();
}

uint64_t sub_3F4C0()
{
  return Input.init(parse:)();
}

uint64_t sub_3F4D0()
{
  return type metadata accessor for Input();
}

uint64_t sub_3F4E0()
{
  return Parse.DirectInvocation.init(identifier:userData:)();
}

uint64_t sub_3F4F0()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_3F500()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_3F510()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_3F520()
{
  return type metadata accessor for Parse();
}

uint64_t sub_3F530()
{
  return static Device.current.getter();
}

uint64_t sub_3F540()
{
  return USOParse.userParse.getter();
}

uint64_t sub_3F550()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_3F560()
{
  return AceOutput.nlContextUpdate.getter();
}

uint64_t sub_3F570()
{
  return AceOutput.init(commands:nlContextUpdate:dialogEngineOutput:)();
}

uint64_t sub_3F580()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_3F590()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_3F5A0()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t sub_3F5B0()
{
  return Siri_Nlu_External_UserParse.userDialogActs.getter();
}

uint64_t sub_3F5C0()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_3F5D0()
{
  return type metadata accessor for Siri_Nlu_External_UserRejected();
}

uint64_t sub_3F5E0()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t sub_3F5F0()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t sub_3F600()
{
  return Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter();
}

uint64_t sub_3F610()
{
  return Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
}

uint64_t sub_3F620()
{
  return Siri_Nlu_External_UserDialogAct.hasRejected.getter();
}

uint64_t sub_3F630()
{
  return Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
}

uint64_t sub_3F640()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
}

uint64_t sub_3F650()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.getter();
}

uint64_t sub_3F660()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
}

uint64_t sub_3F670()
{
  return Siri_Nlu_External_UserDialogAct.rejected.setter();
}

uint64_t sub_3F680()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t sub_3F690()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t sub_3F6A0()
{
  return Siri_Nlu_External_UserStatedTask.task.setter();
}

uint64_t sub_3F6B0()
{
  return Siri_Nlu_External_UserStatedTask.init()();
}

uint64_t sub_3F6C0()
{
  return type metadata accessor for Siri_Nlu_External_UserStatedTask();
}

uint64_t sub_3F6D0()
{
  return Siri_Nlu_External_SystemDialogAct.gaveOptions.setter();
}

uint64_t sub_3F6E0()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t sub_3F6F0()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t sub_3F700()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t sub_3F710()
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter();
}

uint64_t sub_3F720()
{
  return Siri_Nlu_External_SystemGaveOptions.init()();
}

uint64_t sub_3F730()
{
  return type metadata accessor for Siri_Nlu_External_SystemGaveOptions();
}

uint64_t sub_3F740()
{
  return type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
}

uint64_t sub_3F750()
{
  return static SiriNLUTypesPrintUtils.printableProtoObject(object:)();
}

uint64_t sub_3F760()
{
  return type metadata accessor for SiriNLUTypesPrintUtils();
}

uint64_t sub_3F770()
{
  return static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
}

uint64_t sub_3F780()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t sub_3F790()
{
  return dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter();
}

uint64_t sub_3F7A0()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t sub_3F7B0()
{
  return dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter();
}

uint64_t sub_3F7C0()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t sub_3F7D0()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t sub_3F7E0()
{
  return dispatch thunk of UsoEntityBuilder_common_App.setName(value:)();
}

uint64_t sub_3F7F0()
{
  return UsoEntityBuilder_common_App.init()();
}

uint64_t sub_3F800()
{
  return type metadata accessor for UsoEntityBuilder_common_App();
}

uint64_t sub_3F810()
{
  return type metadata accessor for UsoTask_noVerb_uso_NoEntity();
}

uint64_t sub_3F820()
{
  return dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter();
}

uint64_t sub_3F830()
{
  return type metadata accessor for UsoEntity_common_ListPosition.DefinedValues();
}

uint64_t sub_3F840()
{
  return UsoTaskBuilder_authorise_common_App.init()();
}

uint64_t sub_3F850()
{
  return type metadata accessor for UsoTaskBuilder_authorise_common_App();
}

uint64_t sub_3F860()
{
  return UsoTaskBuilder_noVerb_common_AppEntity.init()();
}

uint64_t sub_3F870()
{
  return type metadata accessor for UsoTaskBuilder_noVerb_common_AppEntity();
}

uint64_t sub_3F880()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceControl.setReference(value:)();
}

uint64_t sub_3F890()
{
  return type metadata accessor for UsoTask();
}

uint64_t sub_3F8A0()
{
  return SiriEnvironment.currentRequest.getter();
}

uint64_t sub_3F8B0()
{
  return SiriEnvironment.currentRequest.setter();
}

uint64_t sub_3F8C0()
{
  return SiriEnvironment.currentDevice.getter();
}

uint64_t sub_3F8D0()
{
  return SiriEnvironment.currentDevice.setter();
}

uint64_t sub_3F8E0()
{
  return static SiriEnvironmentValue.subscript.getter();
}

uint64_t sub_3F8F0()
{
  return SiriEnvironmentValue.init(_:)();
}

uint64_t sub_3F900()
{
  return SiriEnvironmentLocating<>.siriEnvironment.modify();
}

uint64_t sub_3F910()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_3F920()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

uint64_t sub_3F930()
{
  return BargeInMode.rawValue.getter();
}

uint64_t sub_3F940()
{
  return type metadata accessor for BargeInMode();
}

uint64_t sub_3F950()
{
  return type metadata accessor for DeviceIdiom();
}

uint64_t sub_3F960()
{
  return InputOrigin.aceInputOrigin.getter();
}

uint64_t sub_3F970()
{
  return type metadata accessor for InputOrigin();
}

uint64_t sub_3F980()
{
  return ResponseMode.description.getter();
}

uint64_t sub_3F990()
{
  return type metadata accessor for ResponseMode();
}

uint64_t sub_3F9A0()
{
  return Restrictions.deviceRestrictions.getter();
}

uint64_t sub_3F9B0()
{
  return type metadata accessor for Restrictions();
}

uint64_t sub_3F9C0()
{
  return dispatch thunk of CurrentDevice.deviceIdiom.getter();
}

uint64_t sub_3F9D0()
{
  return dispatch thunk of CurrentDevice.restrictedCommands.getter();
}

uint64_t sub_3F9E0()
{
  return dispatch thunk of CurrentDevice.isTextToSpeechEnabled.getter();
}

uint64_t sub_3F9F0()
{
  return dispatch thunk of CurrentDevice.isVoiceTriggerEnabled.getter();
}

uint64_t sub_3FA00()
{
  return BargeInContext.mode.getter();
}

uint64_t sub_3FA10()
{
  return type metadata accessor for BargeInContext();
}

uint64_t sub_3FA20()
{
  return type metadata accessor for InteractionType();
}

uint64_t sub_3FA30()
{
  return DeviceRestrictions.aceSet.getter();
}

uint64_t sub_3FA40()
{
  return type metadata accessor for DeviceRestrictions();
}

uint64_t sub_3FA50()
{
  return Builder.subscript.setter();
}

uint64_t sub_3FA60()
{
  return static Buildable.withBuilder(_:)();
}

uint64_t sub_3FA70()
{
  return IntelligenceFlowError.nsError.getter();
}

uint64_t sub_3FA80()
{
  return type metadata accessor for IntelligenceFlowError();
}

uint64_t sub_3FA90()
{
  return StatementID.init(index:name:)();
}

uint64_t sub_3FAA0()
{
  return type metadata accessor for StatementID();
}

uint64_t sub_3FAB0()
{
  return static ActionFailure.Failure.== infix(_:_:)();
}

uint64_t sub_3FAC0()
{
  return type metadata accessor for ActionFailure.Failure();
}

uint64_t sub_3FAD0()
{
  return ActionFailure.init(failure:)();
}

uint64_t sub_3FAE0()
{
  return ActionFailure.failure.getter();
}

uint64_t sub_3FAF0()
{
  return type metadata accessor for ActionFailure();
}

uint64_t sub_3FB00()
{
  return ActionSuccess.returnValue.getter();
}

uint64_t sub_3FB10()
{
  return type metadata accessor for ActionSuccess();
}

uint64_t sub_3FB20()
{
  return static RGPluginModel.bundleName.getter();
}

uint64_t sub_3FB30()
{
  return type metadata accessor for RGPluginModel();
}

uint64_t sub_3FB40()
{
  return MessagePayload.SessionError.hierarchy.getter();
}

uint64_t sub_3FB50()
{
  return type metadata accessor for MessagePayload.SessionError();
}

uint64_t sub_3FB60()
{
  return MessagePayload.RequestContent.TextContent.init(text:)();
}

uint64_t sub_3FB70()
{
  return type metadata accessor for MessagePayload.RequestContent();
}

uint64_t sub_3FB80()
{
  return type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary();
}

uint64_t sub_3FB90()
{
  return MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.summary.getter();
}

uint64_t sub_3FBA0()
{
  return type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder();
}

uint64_t sub_3FBB0()
{
  return MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.summary.getter();
}

uint64_t sub_3FBC0()
{
  return type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue();
}

uint64_t sub_3FBD0()
{
  return MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.summaries.getter();
}

uint64_t sub_3FBE0()
{
  return type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues();
}

uint64_t sub_3FBF0()
{
  return MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.formatString.getter();
}

uint64_t sub_3FC00()
{
  return MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.parameterSummaries.getter();
}

uint64_t sub_3FC10()
{
  return type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary();
}

uint64_t sub_3FC20()
{
  return MessagePayload.ActionSummaryUpdate.summary.getter();
}

uint64_t sub_3FC30()
{
  return type metadata accessor for MessagePayload.ActionSummaryUpdate();
}

uint64_t sub_3FC40()
{
  return type metadata accessor for MessagePayload.RequestPrescribedPlan();
}

uint64_t sub_3FC50()
{
  return type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata();
}

uint64_t sub_3FC60()
{
  return MessagePayload.Request.prescribedPlan.getter();
}

uint64_t sub_3FC70()
{
  return MessagePayload.Request.init(content:variables:safetyMode:prescribedPlan:rewriteMetadataEventID:rewriteMetadataInlined:)();
}

uint64_t sub_3FC80()
{
  return type metadata accessor for MessagePayload.Request();
}

uint64_t sub_3FC90()
{
  return type metadata accessor for MessagePayload.EndOfPlan();
}

uint64_t sub_3FCA0()
{
  return type metadata accessor for MessagePayload();
}

uint64_t sub_3FCB0()
{
  return ResponseOutput.spokenDialogOutput.getter();
}

uint64_t sub_3FCC0()
{
  return ResponseOutput.printedDialogOutput.getter();
}

uint64_t sub_3FCD0()
{
  return ResponseOutput.VisualOutput.PluginSnippetOutputPayload.pluginModelData.getter();
}

uint64_t sub_3FCE0()
{
  return ResponseOutput.VisualOutput.PluginSnippetOutputPayload.bundleId.getter();
}

uint64_t sub_3FCF0()
{
  return type metadata accessor for ResponseOutput.VisualOutput.PluginSnippetOutputPayload();
}

uint64_t sub_3FD00()
{
  return ResponseOutput.VisualOutput.SystemSnippetOutputPayload.pluginModel.getter();
}

uint64_t sub_3FD10()
{
  return type metadata accessor for ResponseOutput.VisualOutput.SystemSnippetOutputPayload();
}

uint64_t sub_3FD20()
{
  return ResponseOutput.VisualOutput.InAppResponseOutputPayload.bundleId.getter();
}

uint64_t sub_3FD30()
{
  return type metadata accessor for ResponseOutput.VisualOutput.InAppResponseOutputPayload();
}

uint64_t sub_3FD40()
{
  return type metadata accessor for ResponseOutput.VisualOutput();
}

uint64_t sub_3FD50()
{
  return ResponseOutput.VisualOutputOptions.canReplacePrintableText.getter();
}

uint64_t sub_3FD60()
{
  return type metadata accessor for ResponseOutput.VisualOutputOptions();
}

uint64_t sub_3FD70()
{
  return ResponseOutput.visualOutput.getter();
}

uint64_t sub_3FD80()
{
  return type metadata accessor for ResponseOutput.DialogType();
}

uint64_t sub_3FD90()
{
  return ResponseOutput.attribution.getter();
}

uint64_t sub_3FDA0()
{
  return ResponseOutput.dialogIdentifier.getter();
}

uint64_t sub_3FDB0()
{
  return ResponseOutput.options.getter();
}

uint64_t sub_3FDC0()
{
  return type metadata accessor for ResponseOutput();
}

uint64_t sub_3FDD0()
{
  return SystemResponse.responseOutput.getter();
}

uint64_t sub_3FDE0()
{
  return SystemResponse.interpretedStatementResults.getter();
}

uint64_t sub_3FDF0()
{
  return type metadata accessor for SystemResponse();
}

uint64_t sub_3FE00()
{
  return SiriSDSViewModel.sdsBundleId.getter();
}

uint64_t sub_3FE10()
{
  return SiriSDSViewModel.snippetData.getter();
}

uint64_t sub_3FE20()
{
  return SiriSDSViewModel.snippetBundleId.getter();
}

uint64_t sub_3FE30()
{
  return SiriSDSViewModel.sdsData.getter();
}

uint64_t sub_3FE40()
{
  return type metadata accessor for SiriSDSViewModel();
}

uint64_t sub_3FE50()
{
  return type metadata accessor for StatementOutcome();
}

uint64_t sub_3FE60()
{
  return type metadata accessor for ActionRequirement();
}

uint64_t sub_3FE70()
{
  return type metadata accessor for SystemRequirement.AuthenticationRequest.AuthenticationLevel();
}

uint64_t sub_3FE80()
{
  return SystemRequirement.AuthenticationRequest.authenticationLevel.getter();
}

uint64_t sub_3FE90()
{
  return type metadata accessor for SystemRequirement.AuthenticationRequest();
}

uint64_t sub_3FEA0()
{
  return type metadata accessor for SystemRequirement();
}

uint64_t sub_3FEB0()
{
  return ActionConfirmation.SystemStyle.MontaraEnablement.isExplicitRequest.getter();
}

uint64_t sub_3FEC0()
{
  return type metadata accessor for ActionConfirmation.SystemStyle.MontaraEnablement.Source();
}

uint64_t sub_3FED0()
{
  return ActionConfirmation.SystemStyle.MontaraEnablement.source.getter();
}

uint64_t sub_3FEE0()
{
  return type metadata accessor for ActionConfirmation.SystemStyle.MontaraEnablement();
}

uint64_t sub_3FEF0()
{
  return type metadata accessor for ActionConfirmation.SystemStyle();
}

uint64_t sub_3FF00()
{
  return ActionConfirmation.systemStyle.getter();
}

uint64_t sub_3FF10()
{
  return type metadata accessor for ActionConfirmation();
}

uint64_t sub_3FF20()
{
  return ParameterNeedsValue.parameterId.getter();
}

uint64_t sub_3FF30()
{
  return type metadata accessor for ParameterNeedsValue();
}

uint64_t sub_3FF40()
{
  return ParameterNotAllowed.parameterId.getter();
}

uint64_t sub_3FF50()
{
  return type metadata accessor for ParameterNotAllowed();
}

uint64_t sub_3FF60()
{
  return SessionStatusUpdate.ToolExecutionProgressUpdate.additionalProgressDescription.getter();
}

uint64_t sub_3FF70()
{
  return SessionStatusUpdate.ToolExecutionProgressUpdate.progressDescription.getter();
}

uint64_t sub_3FF80()
{
  return SessionStatusUpdate.ToolExecutionProgressUpdate.progress.getter();
}

uint64_t sub_3FF90()
{
  return type metadata accessor for SessionStatusUpdate.ToolExecutionProgressUpdate();
}

uint64_t sub_3FFA0()
{
  return type metadata accessor for SessionStatusUpdate.Payload();
}

uint64_t sub_3FFB0()
{
  return SessionStatusUpdate.payload.getter();
}

uint64_t sub_3FFC0()
{
  return type metadata accessor for SessionStatusUpdate();
}

uint64_t sub_3FFD0()
{
  return SessionClientMessage.init(sessionId:clientRequestId:payload:)();
}

uint64_t sub_3FFE0()
{
  return type metadata accessor for SessionClientMessage();
}

uint64_t sub_3FFF0()
{
  return SessionServerMessage.clientRequestId.getter();
}

uint64_t sub_40000()
{
  return SessionServerMessage.eventId.getter();
}

uint64_t sub_40010()
{
  return SessionServerMessage.payload.getter();
}

uint64_t sub_40020()
{
  return SessionServerMessage.sessionId.getter();
}

uint64_t sub_40030()
{
  return type metadata accessor for SessionServerMessage();
}

uint64_t sub_40040()
{
  return SystemPromptResolution.RequirementResolution.init(isRequirementSatisfied:)();
}

uint64_t sub_40050()
{
  return type metadata accessor for SystemPromptResolution.ResolutionInput();
}

uint64_t sub_40060()
{
  return type metadata accessor for SystemPromptResolution.UserAction();
}

uint64_t sub_40070()
{
  return SystemPromptResolution.init(actionEventId:systemResponseEventId:userAction:statementId:input:)();
}

uint64_t sub_40080()
{
  return SystemPromptResolution.ActionCancellation.init()();
}

uint64_t sub_40090()
{
  return type metadata accessor for SystemPromptResolution();
}

uint64_t sub_400A0()
{
  return ParameterDisambiguation.items.getter();
}

uint64_t sub_400B0()
{
  return type metadata accessor for ParameterDisambiguation();
}

uint64_t sub_400C0()
{
  return RGActionConfirmationModel.affirmative.getter();
}

uint64_t sub_400D0()
{
  return RGActionConfirmationModel.negative.getter();
}

uint64_t sub_400E0()
{
  return type metadata accessor for RGActionConfirmationModel();
}

uint64_t sub_400F0()
{
  return InterpretedStatementResult.originProgramStatementID.getter();
}

uint64_t sub_40100()
{
  return InterpretedStatementResult.toolId.getter();
}

uint64_t sub_40110()
{
  return InterpretedStatementResult.outcome.getter();
}

uint64_t sub_40120()
{
  return type metadata accessor for InterpretedStatementResult();
}

uint64_t sub_40130()
{
  return FlowOutputMessage.InAppResponse.bundleId.getter();
}

uint64_t sub_40140()
{
  return type metadata accessor for FlowOutputMessage.InAppResponse();
}

uint64_t sub_40150()
{
  return type metadata accessor for NLRoutingDecisionMessage.RoutingDecision();
}

uint64_t sub_40160()
{
  return IntelligenceFlowStatusUpdateMessage.ProgressUpdate.init(build:)();
}

uint64_t sub_40170()
{
  return IntelligenceFlowStatusUpdateMessage.ProgressUpdate.Builder.additionalProgressDescription.setter();
}

uint64_t sub_40180()
{
  return IntelligenceFlowStatusUpdateMessage.ProgressUpdate.Builder.progressDescription.setter();
}

uint64_t sub_40190()
{
  return IntelligenceFlowStatusUpdateMessage.ProgressUpdate.Builder.progress.setter();
}

uint64_t sub_401A0()
{
  return type metadata accessor for IntelligenceFlowStatusUpdateMessage.ProgressUpdate();
}

uint64_t sub_401B0()
{
  return type metadata accessor for IntelligenceFlowStatusUpdateMessage.StatusUpdate();
}

uint64_t sub_401C0()
{
  return type metadata accessor for IntelligenceFlowStatusUpdateMessage.ActionSummary.ParameterSummary();
}

uint64_t sub_401D0()
{
  return IntelligenceFlowStatusUpdateMessage.ActionSummary.init(build:)();
}

uint64_t sub_401E0()
{
  return IntelligenceFlowStatusUpdateMessage.ActionSummary.Builder.formatString.setter();
}

uint64_t sub_401F0()
{
  return IntelligenceFlowStatusUpdateMessage.ActionSummary.Builder.parameterSummaries.setter();
}

uint64_t sub_40200()
{
  return type metadata accessor for IntelligenceFlowStatusUpdateMessage.ActionSummary();
}

uint64_t sub_40210()
{
  return IntelligenceFlowStatusUpdateMessage.init(build:)();
}

uint64_t sub_40220()
{
  return IntelligenceFlowStatusUpdateMessage.Builder.statusUpdate.setter();
}

uint64_t sub_40230()
{
  return IntelligenceFlowStatusUpdateMessage.Builder.assistantId.setter();
}

uint64_t sub_40240()
{
  return IntelligenceFlowStatusUpdateMessage.Builder.rootRequestId.setter();
}

uint64_t sub_40250()
{
  return IntelligenceFlowStatusUpdateMessage.Builder.source.setter();
}

uint64_t sub_40260()
{
  return IntelligenceFlowStatusUpdateMessage.Builder.requestId.setter();
}

uint64_t sub_40270()
{
  return IntelligenceFlowStatusUpdateMessage.Builder.sessionId.setter();
}

uint64_t sub_40280()
{
  return type metadata accessor for IntelligenceFlowStatusUpdateMessage();
}

uint64_t sub_40290()
{
  return IntelligenceFlowTraceIdGeneratedMessage.init(build:)();
}

uint64_t sub_402A0()
{
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.traceId.setter();
}

uint64_t sub_402B0()
{
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.requestId.setter();
}

uint64_t sub_402C0()
{
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.sessionId.setter();
}

uint64_t sub_402D0()
{
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.assistantId.setter();
}

uint64_t sub_402E0()
{
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.executionSource.setter();
}

uint64_t sub_402F0()
{
  return IntelligenceFlowTraceIdGeneratedMessage.Builder.source.setter();
}

uint64_t sub_40300()
{
  return type metadata accessor for IntelligenceFlowTraceIdGeneratedMessage();
}

uint64_t sub_40310()
{
  return MessageXPCTransporter.toMessageBase()();
}

uint64_t sub_40320()
{
  return type metadata accessor for MessageXPCTransporter();
}

uint64_t sub_40330()
{
  return dispatch thunk of MessageXPCTransportable.toMessageXPCTransporter()();
}

uint64_t sub_40340()
{
  return type metadata accessor for MessageSource();
}

uint64_t sub_40350()
{
  return AjaxMetadata.prescribedAjaxTool.getter();
}

uint64_t sub_40360()
{
  return AjaxMetadata.AjaxQuery.ExplicitQuery.rewrittenUtterance.getter();
}

uint64_t sub_40370()
{
  return type metadata accessor for AjaxMetadata.AjaxQuery.ExplicitQuery();
}

uint64_t sub_40380()
{
  return AjaxMetadata.AjaxQuery.ImplicitQuery.rewrittenUtterance.getter();
}

uint64_t sub_40390()
{
  return type metadata accessor for AjaxMetadata.AjaxQuery.ImplicitQuery();
}

uint64_t sub_403A0()
{
  return type metadata accessor for AjaxMetadata.AjaxQuery();
}

uint64_t sub_403B0()
{
  return AjaxMetadata.query.getter();
}

uint64_t sub_403C0()
{
  return type metadata accessor for AjaxMetadata();
}

uint64_t sub_403D0()
{
  return static RequestSummary.ExecutionSource.== infix(_:_:)();
}

uint64_t sub_403E0()
{
  return type metadata accessor for RequestSummary.ExecutionSource();
}

uint64_t sub_403F0()
{
  return type metadata accessor for RequestSummary.PrescribedGenAITool();
}

uint64_t sub_40400()
{
  return type metadata accessor for PrescribedAjaxTool();
}

uint64_t sub_40410()
{
  return CurrentRequest.rootRequestId.getter();
}

uint64_t sub_40420()
{
  return CurrentRequest.executionRequestId.getter();
}

uint64_t sub_40430()
{
  return CurrentRequest.inputOrigin.getter();
}

uint64_t sub_40440()
{
  return CurrentRequest.responseMode.getter();
}

uint64_t sub_40450()
{
  return CurrentRequest.bargeInContext.getter();
}

uint64_t sub_40460()
{
  return CurrentRequest.interactionType.getter();
}

uint64_t sub_40470()
{
  return CurrentRequest.resultCandidateId.getter();
}

uint64_t sub_40480()
{
  return CurrentRequest.voiceTriggerEventInfo.getter();
}

uint64_t sub_40490()
{
  return CurrentRequest.currentDeviceAssistantId.getter();
}

uint64_t sub_404A0()
{
  return CurrentRequest.sessionId.getter();
}

uint64_t sub_404B0()
{
  return CurrentRequest.utterance.getter();
}

uint64_t sub_404C0()
{
  return static Message.with(_:)();
}

uint64_t sub_404D0()
{
  return dispatch thunk of InstrumentationUtil.buildRequestLinkEvent(sourceComponent:sourceUUID:targetComponent:targetUUID:)();
}

uint64_t sub_404E0()
{
  return dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:logResourceUtilization:)();
}

uint64_t sub_404F0()
{
  return dispatch thunk of InstrumentationUtil.convertUUIDStringToSISchemaUUID(uuidStr:)();
}

uint64_t sub_40500()
{
  return InstrumentationUtil.init()();
}

uint64_t sub_40510()
{
  return type metadata accessor for InstrumentationUtil();
}

uint64_t sub_40520()
{
  return dispatch thunk of IFSessionServiceClientProtocol.currentSessionIdentifier.getter();
}

uint64_t sub_40530()
{
  return dispatch thunk of IFSessionServiceClientProtocol.send(message:)();
}

uint64_t sub_40540()
{
  return dispatch thunk of IFSessionServiceClientProtocol.subscribe(filtering:)();
}

uint64_t sub_40550()
{
  return IFSessionServiceClient.__allocating_init()();
}

uint64_t sub_40560()
{
  return type metadata accessor for IFSessionServiceClient();
}

uint64_t sub_40570()
{
  return static GATError.fromNSError(_:)();
}

uint64_t sub_40580()
{
  return type metadata accessor for GATError();
}

uint64_t sub_40590()
{
  return type metadata accessor for RequestType();
}

uint64_t sub_405A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_405B0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_405C0()
{
  return Logger.init(_:)();
}

uint64_t sub_405D0()
{
  return GroupIdentifier.init(id:seq:)();
}

uint64_t sub_405E0()
{
  return type metadata accessor for GroupIdentifier();
}

uint64_t sub_405F0()
{
  return RREntity.init(id:appBundleId:typedValue:dataType:data:group:)();
}

uint64_t sub_40600()
{
  return type metadata accessor for RREntity();
}

uint64_t sub_40610()
{
  return GenerativeAssistantEnablementFlow.init(source:isExplicitRequest:)();
}

uint64_t sub_40620()
{
  return type metadata accessor for GenerativeAssistantEnablementFlow();
}

uint64_t sub_40630()
{
  return TypedValue.EntityValue.properties.getter();
}

uint64_t sub_40640()
{
  return type metadata accessor for TypedValue.EntityValue();
}

uint64_t sub_40650()
{
  return type metadata accessor for TypedValue.PrimitiveValue();
}

uint64_t sub_40660()
{
  return type metadata accessor for TypedValue();
}

uint64_t sub_40670()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t sub_40680()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_40690()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_406A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_406B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_406C0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_406D0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_406E0()
{
  return String.hash(into:)();
}

uint64_t sub_406F0()
{
  return String.count.getter();
}

void sub_40700(Swift::String a1)
{
}

Swift::Int sub_40710()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_40720()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_40730()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_40740()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_40750()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_40760()
{
  return Array.description.getter();
}

uint64_t sub_40770()
{
  return specialized Array._endMutation()();
}

uint64_t sub_40780()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_40790()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_407A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_407B0()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_407D0()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_407E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_407F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_40800()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_40810()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_40820()
{
  return SISchemaDeviceSensitivityState.description.getter();
}

NSNumber sub_40830(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_40840()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_40850()
{
  return type metadata accessor for Optional();
}

uint64_t sub_40860()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_40870()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_40880()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_40890()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

void sub_408A0(Swift::Int a1)
{
}

uint64_t sub_408B0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_408C0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_408D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_408E0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_408F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_40900()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_40910()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_40920()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_40930()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_40940(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_40950()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_40960()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_40970()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_40980()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_40990()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_409A0()
{
  return Error._code.getter();
}

uint64_t sub_409B0()
{
  return Error._domain.getter();
}

uint64_t sub_409C0()
{
  return Error._userInfo.getter();
}

uint64_t sub_409D0()
{
  return Hasher.init(_seed:)();
}

void sub_409E0(Swift::UInt a1)
{
}

Swift::Int sub_409F0()
{
  return Hasher._finalize()();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}